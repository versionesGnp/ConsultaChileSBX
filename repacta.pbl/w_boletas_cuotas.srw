forward
global type w_boletas_cuotas from window
end type
type st_help_abono from statictext within w_boletas_cuotas
end type
type dw_dias_mora from datawindow within w_boletas_cuotas
end type
type cb_imprimir_detalle from commandbutton within w_boletas_cuotas
end type
type cb_repactar from commandbutton within w_boletas_cuotas
end type
type cb_cerrar from commandbutton within w_boletas_cuotas
end type
type cb_ver_cuenta from commandbutton within w_boletas_cuotas
end type
type dw_detalle_bl from datawindow within w_boletas_cuotas
end type
type dw_datos_bl from datawindow within w_boletas_cuotas
end type
type cb_bl_insertar from commandbutton within w_boletas_cuotas
end type
type cb_bl_borrar_item from commandbutton within w_boletas_cuotas
end type
type cb_bl_borrar from commandbutton within w_boletas_cuotas
end type
type st_n_caja from statictext within w_boletas_cuotas
end type
type st_5 from statictext within w_boletas_cuotas
end type
type st_uf from statictext within w_boletas_cuotas
end type
type st_4 from statictext within w_boletas_cuotas
end type
type st_fecha from statictext within w_boletas_cuotas
end type
type st_3 from statictext within w_boletas_cuotas
end type
type dw_encabezado_ingreso_cupon from datawindow within w_boletas_cuotas
end type
type dw_gastos_bl from datawindow within w_boletas_cuotas
end type
type dw_abono from datawindow within w_boletas_cuotas
end type
type dw_bl_buscar_cliente from datawindow within w_boletas_cuotas
end type
end forward

global type w_boletas_cuotas from window
integer x = 5
integer y = 4
integer width = 2834
integer height = 1840
boolean titlebar = true
string title = "Calculo Mantenciones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
st_help_abono st_help_abono
dw_dias_mora dw_dias_mora
cb_imprimir_detalle cb_imprimir_detalle
cb_repactar cb_repactar
cb_cerrar cb_cerrar
cb_ver_cuenta cb_ver_cuenta
dw_detalle_bl dw_detalle_bl
dw_datos_bl dw_datos_bl
cb_bl_insertar cb_bl_insertar
cb_bl_borrar_item cb_bl_borrar_item
cb_bl_borrar cb_bl_borrar
st_n_caja st_n_caja
st_5 st_5
st_uf st_uf
st_4 st_4
st_fecha st_fecha
st_3 st_3
dw_encabezado_ingreso_cupon dw_encabezado_ingreso_cupon
dw_gastos_bl dw_gastos_bl
dw_abono dw_abono
dw_bl_buscar_cliente dw_bl_buscar_cliente
end type
global w_boletas_cuotas w_boletas_cuotas

type variables
//long		il_cta_mora,ii_dmora,ii_mora_cobro,ii_inc_gastos,ii_cantidad
//Double	id_valor_cuota,id_gc,id_im,id_interes_gc

Double	id_factor_gc,id_interes_gc,id_tasa_mant,idb_iva
Long		il_cantidad_malo,il_fila_uf,il_abono
Date		idt_fecha_hoy
string		is_pasa_descto
end variables

forward prototypes
public subroutine wf_borrar_fila (long al_fila)
public subroutine wf_validar_descuento ()
public subroutine wf_crear_cupones_mantencion (long al_cantidad)
end prototypes

public subroutine wf_borrar_fila (long al_fila);Long	fila
dw_detalle_bl.deleterow(al_fila)
dw_detalle_bl.accepttext()
fila 					= dw_detalle_bl.InsertRow(0)
dw_detalle_bl.scrolltorow(fila)
dw_detalle_bl.setitem(fila,'monto',0)
dw_detalle_bl.setitem(fila,'monto_uf',0)
dw_detalle_bl.setitem(fila,'cantidad',0)
dw_detalle_bl.SetItem(fila, "moneda",'P')
dw_detalle_bl.setfocus()
dw_detalle_bl.setcolumn('tipo_cob')
end subroutine

public subroutine wf_validar_descuento ();long	ll_tot_reg,ll_fila_reg,ll_count_e,ll_indi,ll_fila_cob
double ll_monto,ll_monto_desc,ll_monto_uf,lbd_uf
string	ls_cod_descto,ls_glosa_otro,ls_tipo_comp_otro,ls_tipo_cob_ref

is_pasa_descto		= f_validar_descuentos()

//ls_cod_descto			= gs_codigo_otro
//ll_tot_reg				= w_boletas_cuotas.dw_detalle_bl.rowcount()
////for ll_indi = 1 to ll_tot_reg
//	ll_fila_reg 				= w_boletas_cuotas.dw_detalle_bl.Find("tipo_cob ='S'",ll_tot_reg, ll_tot_reg)
//	if ll_fila_reg>0 then
//		ll_monto_desc			= w_boletas_cuotas.dw_detalle_bl.getitemnumber(ll_fila_reg,'monto')
//		SELECT	"TIPO_COB_OTRO_VALIDA"."GLOSA_OTRO", 
//					"TIPO_COB_OTRO_VALIDA"."TIPO_COMPROBANTE",   
//					"TIPO_COB_OTRO_VALIDA"."TIPO_COB_REFERENCIA"  
//		INTO  	:ls_glosa_otro, :ls_tipo_comp_otro, :ls_tipo_cob_ref  
//		FROM 	"TIPO_COB_OTRO_VALIDA"  
//		WHERE 	"TIPO_COB_OTRO_VALIDA"."CODIGO_OTRO" = :ls_cod_descto and
//					"TIPO_COB_OTRO_VALIDA"."TIPO_COMPROBANTE" = 'BE';
//		
//		ll_fila_cob 				= w_boletas_cuotas.dw_detalle_bl.Find("tipo_cob ='"+ls_tipo_cob_ref+"'",1, ll_tot_reg)
//		if ls_cod_descto = '102' then
//			ll_monto				= w_boletas_cuotas.dw_detalle_bl.getitemnumber(1,'mora_cred')
//		elseif	ls_cod_descto = '118' then
//			ll_monto					= w_boletas_cuotas.dw_detalle_bl.getitemnumber(1,'gasto_cred')
//		elseif	ls_cod_descto = '130' then
//			ll_monto					= w_boletas_cuotas.dw_detalle_bl.getitemnumber(1,'mora_mant')
//		elseif	ls_cod_descto = '133' then
//			ll_monto					=w_boletas_cuotas.dw_detalle_bl.getitemnumber(1,'gasto_mant')
//		else
//			ll_monto					= w_boletas_cuotas.dw_detalle_bl.getitemnumber(ll_fila_cob,'monto')
//			if ll_monto = 0 then
//				ll_monto_uf					= w_repacta.dw_detalle_ci.getitemnumber(ll_fila_cob,'monto_uf')
//				if ll_monto_uf > 0 then
//					SELECT "TAB_UF"."VALOR_UF"  
//					INTO 		:lbd_uf  
//					FROM 	"TAB_UF"  
//					WHERE 	"TAB_UF"."FECHA_UF" = :idt_fecha_hoy
//					USING	sqlca;
//					ll_monto					= ll_monto_uf *lbd_uf
//				end if	
//			end if	
//		end if	
//		if ll_monto_desc >ll_monto then
//			messagebox('Advertencia','Monto Descuento '+ls_glosa_otro+' es Mayor al Monto a Descontar')
//			w_boletas_cuotas.dw_detalle_bl.setitem(ll_fila_reg,'monto',0)
//		end if
//	end if
////next
end subroutine

public subroutine wf_crear_cupones_mantencion (long al_cantidad);Long		ll_count,ll_mora_mant,ll_estado_mora_mant,ll_ctas_pag_m,ll_cod_parque,ll_plazo,ll_cantidad,ll_res,ll_indi,ll_cant_meses,ll_nro_cuota,ll_cuponera,ll_ctas_pag_s,&
			ll_contar_cup_vig,ll_res2,ll_max_cuota
Double	ll_rut,ldb_valor_cuota_m,ll_cupon,ldb_valor_cuota_c
String		ls_estado_cuponera,ls_estado_ctto,ls_dv,ls_moneda,ls_paso='N'
date		ldt_fecha_venc_mant,ldt_fecha_prox,ldt_fecha_vencimiento,ldt_max_venc,ldt_fecha_prim,ldt_fecha_m

if gs_base='O' or gs_base='C' then
	ll_cantidad		= al_cantidad
	if ll_cantidad > 0 then
		SELECT 	"CUPONERAS"."ESTADO_CUPONERA" ,	"CUPONERAS"."NRO_CUPONERA"
		INTO 		:ls_estado_cuponera  ,						:ll_cuponera
		FROM 	"CUPONERAS"  
		WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
					( "CUPONERAS"."SERIE" = :gs_serie ) AND  
					( "CUPONERAS"."NUMERO" = :gi_numero ) AND
					( "CUPONERAS"."NRO_CUPONERA" =  (	SELECT 	MAX("CUPONERAS"."NRO_CUPONERA")
																		FROM 	"CUPONERAS"  
																		WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
																					( "CUPONERAS"."SERIE" = :gs_serie ) AND  
																					( "CUPONERAS"."NUMERO" = :gi_numero ) ) )
		USING	sqlca;
					
		SELECT 	count("CUPONERAS"."BASE")
		INTO 		:ll_count
		FROM 	"CUPONERAS"  
		WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
					( "CUPONERAS"."SERIE" = :gs_serie ) AND  
					( "CUPONERAS"."NUMERO" = :gi_numero )
		USING	sqlca;
		if isnull(ls_estado_cuponera) or ls_estado_cuponera='' then ll_count=0
		SELECT 	   "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES",		"PAGO_OFERTA"."NRO_CUOTAS",	"PAGO_OFERTA"."MONEDA",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",  	"CADENA"."RUT",   	"CLIENTE"."DV",   	"OFERTA_V"."VALOR_CUOTA_M",   	"CADENA_MORA"."MORA_MANT",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"CADENA"."ESTADO_MORA_MANTENCION",   	"OFERTA_V"."CTA_PAG_M",   	"OFERTA_V"."CTA_PAG_S",		"PAGO_OFERTA"."VALOR_CUOTA" ,	"PAGO_OFERTA"."FECHA_PRIM",	"OFERTA_V"."FECHA_M"
		INTO 		  :ll_cant_meses,														:ll_plazo,									:ls_moneda,							:ll_cod_parque,					:ls_estado_ctto,   			:ll_rut,   					:ls_dv,   				:ldb_valor_cuota_m,   					:ll_mora_mant,   							:ldt_fecha_venc_mant,   							:ll_estado_mora_mant,   							:ll_ctas_pag_m  ,					:ll_ctas_pag_s,						:ldb_valor_cuota_c,						:ldt_fecha_prim,						:ldt_fecha_m
		FROM 	  "CADENA",   "OFERTA_V",   "PAGO_OFERTA",   "CLIENTE",   "CADENA_MORA" ,	"ESTADO_MORA_MANTENCION" 
		WHERE 	( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
					( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) AND
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero ) 
		UNION   
		SELECT 	  "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES",		"CONTRATO"."PLAZO",	"CONTRATO"."MONEDA","CADENA"."COD_PARQUE",	"CADENA"."ESTADO",   	"CADENA"."RUT",   	"CLIENTE"."DV",   	"CONTRATO"."VALOR_CUOTA_M",   	"CADENA_MORA"."MORA_MANT",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"CADENA"."ESTADO_MORA_MANTENCION",   	"CONTRATO"."CTA_PAG_M"  ,	0, 0, null, null
		FROM 	  "CADENA",   "CADENA_MORA",   "CLIENTE",   "CONTRATO",	"ESTADO_MORA_MANTENCION"
		WHERE 	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) AND
					( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
					( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero )    ;
		if ls_estado_ctto='V' or ls_estado_ctto='C' then
			if ll_count >= 0 then
				ll_res 		= 1
//				if ll_cantidad > ( ll_mora_mant + 8 ) then
//					ll_res	= messagebox("Advertencia","Está Seguro de Crear "+string(ll_cantidad) +" Cupones de Mantención",Exclamation!,YesNo!,2)
//				else
//					ll_res	= messagebox("Advertencia","Está Seguro de Crear Cupones de Mantención",Exclamation!,YesNo!,2)
//				end if
			end if
			if ll_res = 1 then
				SELECT 	MAX("CUPONERAS_DETALLE"."NRO_CUPON")  
				INTO 		:ll_cupon  
				FROM 	"CUPONERAS_DETALLE"  ;
				ll_cupon ++
				if ll_count = 0 then
					ll_cuponera	= ll_count + 1
					INSERT INTO "CUPONERAS"  
									( "BASE",   	"SERIE",  	"NUMERO",   	"NRO_CUPONERA",   	"FECHA_CREA",   	"USUARIO_CREADOR",   	"CUPON_INICIAL",   	"CUPON_FINAL",   	"ESTADO_CUPONERA",   	"COD_PARQUE",   	"MONEDA_CTTO",   	"PLAZO",   	"CANT_PRINT",   	"ULT_FECHA_VENC_CRED_PRINT" )  
					VALUES 		( :gs_base,	:gs_serie,   :gi_numero,   	:ll_cuponera,   			:gdt_fec_sistema,	:gs_user,   					1,   						2,   					'V',   								:ll_cod_parque,   	:ls_moneda,   			:ll_plazo,   	0,   					null )  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ls_paso		= 'S'
					else
						rollback;
					end if
					
				elseif ll_count = 1 then
					if gs_base='O' and ll_ctas_pag_s < ll_plazo then
						SELECT 	Count("CUPONERAS_DETALLE"."BASE" ) 
						INTO 		:ll_contar_cup_vig  
						FROM 	"CUPONERAS_DETALLE"  
						WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
								  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
								  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
								  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
								  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   ;
						if ll_contar_cup_vig = 0 then
//							messagebox("Advertencia","Contrato Tiene Saldo Cuota Crédito, debe tener Cuponera Vigente antes de Crear Cupones de Mantención")
							
							DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota_c, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fecha_m, :ls_moneda);
							EXECUTE sp_proc_genera_cuponera;
							if ls_estado_cuponera = 'A' then
								UPDATE	"CUPONERAS"  
								SET 		"ESTADO_CUPONERA" = 'R'  
								WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
										 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										 ( "CUPONERAS"."ESTADO_CUPONERA" = :ls_estado_cuponera ) AND  
										 ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								SELECT 	"CUPONERAS"."ESTADO_CUPONERA" ,	"CUPONERAS"."NRO_CUPONERA"
								INTO 		:ls_estado_cuponera  ,						:ll_cuponera
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero ) AND
											( "CUPONERAS"."NRO_CUPONERA" =  (	SELECT 	MAX("CUPONERAS"."NRO_CUPONERA")
																								FROM 	"CUPONERAS"  
																								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
																											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
																											( "CUPONERAS"."NUMERO" = :gi_numero ) ) )
								USING	sqlca;
											
								SELECT 	count("CUPONERAS"."BASE")
								INTO 		:ll_count
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero )
								USING	sqlca;
							end if
							ll_res2 = 1
						else
							ll_res2 = 1
						end if
					else
						ll_res2 	= 1
					end if
					
					if ll_res2 = 1 then
						if ls_estado_cuponera <> 'V' and ls_estado_cuponera <> 'C' then
							UPDATE 	"CUPONERAS"  
							SET 		"ESTADO_CUPONERA" = 'V'  
							WHERE ( "CUPONERAS"."BASE" = :gs_base ) AND  
									  ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
									  ( "CUPONERAS"."NUMERO" = :gi_numero )  AND
									  ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
						
						ls_paso	= 'S'
					else
						ls_paso	= 'N'
					end if
				elseif ll_count > 1 then
					if gs_base='O' and ll_ctas_pag_s < ll_plazo then
						SELECT 	Count("CUPONERAS_DETALLE"."BASE" ) 
						INTO 		:ll_contar_cup_vig  
						FROM 	"CUPONERAS_DETALLE"  
						WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
								  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
								  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
								  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
								  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   ;
						if ll_contar_cup_vig = 0 then
//							messagebox("Advertencia","Contrato Tiene Saldo Cuota Crédito, debe tener Cuponera Vigente antes de Crear Cupones de Mantención")
							
							DECLARE sp_proc_genera_cup2 PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota_c, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fecha_m, :ls_moneda);
							EXECUTE sp_proc_genera_cup2;
							if ls_estado_cuponera = 'A' then
								UPDATE	"CUPONERAS"  
								SET 		"ESTADO_CUPONERA" = 'R'  
								WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
										 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										 ( "CUPONERAS"."ESTADO_CUPONERA" = :ls_estado_cuponera ) AND  
										 ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								SELECT 	"CUPONERAS"."ESTADO_CUPONERA" ,	"CUPONERAS"."NRO_CUPONERA"
								INTO 		:ls_estado_cuponera  ,						:ll_cuponera
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero ) AND
											( "CUPONERAS"."NRO_CUPONERA" =  (	SELECT 	MAX("CUPONERAS"."NRO_CUPONERA")
																								FROM 	"CUPONERAS"  
																								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
																											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
																											( "CUPONERAS"."NUMERO" = :gi_numero ) ) )
								USING	sqlca;
											
								SELECT 	count("CUPONERAS"."BASE")
								INTO 		:ll_count
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero )
								USING	sqlca;
							end if
							ll_res2 = 1
						else
							ll_res2 = 1
						end if
					else
						ll_res2 	= 1
					end if
					if ll_res2 = 1 then
						UPDATE 	"CUPONERAS"  
						SET 		"ESTADO_CUPONERA" = 'V'  
						WHERE ( "CUPONERAS"."BASE" = :gs_base ) AND  
								  ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
								  ( "CUPONERAS"."NUMERO" = :gi_numero )  AND
								  ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
							UPDATE 	"CUPONERAS"  
							SET 		"ESTADO_CUPONERA" = 'A'  
							WHERE ( "CUPONERAS"."BASE" = :gs_base ) AND  
									  ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
									  ( "CUPONERAS"."NUMERO" = :gi_numero )  AND
									  ( "CUPONERAS"."NRO_CUPONERA" < :ll_cuponera )
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
								ls_paso	= 'S'
							else
								rollback;
							end if
						else
							rollback;
						end if
						
					end if
				end if
				if ls_paso = 'S' then
					SELECT 	MAX("CUPONERAS_DETALLE"."FECHA_VENC" ) 
					INTO 		:ldt_max_venc  
					FROM 	"CUPONERAS_DETALLE"  
					WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
							  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
							  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
							  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
							  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
							  ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   ;
					if not isnull(ldt_max_venc) then
						ldt_fecha_venc_mant	= ldt_max_venc
						SELECT 	add_months( :ldt_fecha_venc_mant, :ll_cant_meses) 
						INTO		:ldt_fecha_prox
						FROM		dual;
						ldt_fecha_venc_mant	= ldt_fecha_prox
					end if
					
					SELECT 	count("CUPONERAS_DETALLE"."NRO_CUOTA" ) 
					INTO 		:ll_max_cuota  
					FROM 	"CUPONERAS_DETALLE"  
					WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
							  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
							  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
							  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
							  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
							  ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   ;
					if isnull(ll_max_cuota) or ll_max_cuota=0 then
						ll_max_cuota	= 0
					end if
					ldt_fecha_prox		= ldt_fecha_venc_mant
					for ll_indi = 1 to ll_cantidad
						ll_nro_cuota = ll_max_cuota + ll_ctas_pag_m + ll_indi
						if not isnull(ldt_fecha_prox) then
							INSERT INTO "CUPONERAS_DETALLE"  
										( "BASE",  	"SERIE",  	"NUMERO",	"NRO_CUPON",  	"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"IP_PRINT",   	"USUARIO_PRINT",   	"NUMERO_GRUPO_AVISO",   	"BASE_ASOC",   	"SERIE_ASOC",   	"NUMERO_ASOC",   	"MONTO_OTROS_COBROS",   	"USUARIO_ACTUALIZA_REG",   	"FECHA_ACTUALIZA_REG",   	"CUPON_WEB",   	"SW_GRAN_CUPON" )  
							VALUES 	( :gs_base,	:gs_serie,   :gi_numero,	:ll_cupon,   			:ll_rut,   :ll_nro_cuota,   		:ldt_fecha_prox,   	'V',   								'F',   				null,   					null,   				null,   				:ldb_valor_cuota_m,   				0,   								0,   									0,											:ll_count,   				:ls_dv,   	null,   			null,   					null,   								null,   				null,   				null,   					null,   								:gs_user,   								:gdt_fec_sistema,   				0,   					1 )  
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
								ldt_fecha_venc_mant = ldt_fecha_prox;
								ll_cupon ++
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar Cupon SQL: "+sqlca.sqlerrtext)
							end if
		
						end if
						SELECT 	add_months( :ldt_fecha_venc_mant, :ll_cant_meses) 
						INTO		:ldt_fecha_prox
						FROM		dual;
					next
//					w_ver_cupones.triggerevent(open!)
				end if
			end if
		else
//			messagebox("Advertencia","Recuerde solo puede crear Cupones a Contratos en Estado VIGENTE o PAGADO")
		end if

	end if
else
//	messagebox("Advertencia","Solo se puede Crear Cupones de Mantención a O-PROMESAS y C-CONTRATOS ISA")
end if
end subroutine

on w_boletas_cuotas.create
this.st_help_abono=create st_help_abono
this.dw_dias_mora=create dw_dias_mora
this.cb_imprimir_detalle=create cb_imprimir_detalle
this.cb_repactar=create cb_repactar
this.cb_cerrar=create cb_cerrar
this.cb_ver_cuenta=create cb_ver_cuenta
this.dw_detalle_bl=create dw_detalle_bl
this.dw_datos_bl=create dw_datos_bl
this.cb_bl_insertar=create cb_bl_insertar
this.cb_bl_borrar_item=create cb_bl_borrar_item
this.cb_bl_borrar=create cb_bl_borrar
this.st_n_caja=create st_n_caja
this.st_5=create st_5
this.st_uf=create st_uf
this.st_4=create st_4
this.st_fecha=create st_fecha
this.st_3=create st_3
this.dw_encabezado_ingreso_cupon=create dw_encabezado_ingreso_cupon
this.dw_gastos_bl=create dw_gastos_bl
this.dw_abono=create dw_abono
this.dw_bl_buscar_cliente=create dw_bl_buscar_cliente
this.Control[]={this.st_help_abono,&
this.dw_dias_mora,&
this.cb_imprimir_detalle,&
this.cb_repactar,&
this.cb_cerrar,&
this.cb_ver_cuenta,&
this.dw_detalle_bl,&
this.dw_datos_bl,&
this.cb_bl_insertar,&
this.cb_bl_borrar_item,&
this.cb_bl_borrar,&
this.st_n_caja,&
this.st_5,&
this.st_uf,&
this.st_4,&
this.st_fecha,&
this.st_3,&
this.dw_encabezado_ingreso_cupon,&
this.dw_gastos_bl,&
this.dw_abono,&
this.dw_bl_buscar_cliente}
end on

on w_boletas_cuotas.destroy
destroy(this.st_help_abono)
destroy(this.dw_dias_mora)
destroy(this.cb_imprimir_detalle)
destroy(this.cb_repactar)
destroy(this.cb_cerrar)
destroy(this.cb_ver_cuenta)
destroy(this.dw_detalle_bl)
destroy(this.dw_datos_bl)
destroy(this.cb_bl_insertar)
destroy(this.cb_bl_borrar_item)
destroy(this.cb_bl_borrar)
destroy(this.st_n_caja)
destroy(this.st_5)
destroy(this.st_uf)
destroy(this.st_4)
destroy(this.st_fecha)
destroy(this.st_3)
destroy(this.dw_encabezado_ingreso_cupon)
destroy(this.dw_gastos_bl)
destroy(this.dw_abono)
destroy(this.dw_bl_buscar_cliente)
end on

event open;double 	id_uf
date 		id_fecha
Long		ll_estado,ii_cantidad
String	ls_opera

dw_abono.settransobject(sqlca)
dw_dias_mora.settransobject(sqlca)
idt_fecha_hoy		= date(gdt_fec_sistema)
gf_centrar(w_boletas_cuotas)
gs_rezago			= 'N'
//id_tasa_mant
SELECT 	"TASA"."TASA_INT_UF",	"TASA"."IVA",	"TASA"."GASTO_COB_MORA"
INTO 		:id_tasa_mant,				 :idb_iva,			:id_interes_gc
FROM 	"TASA" WHERE "TASA"."LOOK" = 1 ;

//id_interes_uf	= f_factor_gasto_cobranza()
if gs_base = 'O' or gs_base = 'C' then 
else
	messagebox('No hay Información','Seleccione un Contrato o Promesa.',information!)
	close(w_boletas_cuotas)
	return
end if
gf_centrar(w_boletas_cuotas)
il_abono								= dw_abono.retrieve(gs_base,gs_serie,gi_numero)
if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
dw_encabezado_ingreso_cupon.SetTransObject(SQLCA)
dw_encabezado_ingreso_cupon.Retrieve(" ", " ", 0)
st_fecha.text	= String(gd_tiempo_serv, "dd/mm/yyyy")
st_n_caja.text = profilestring("INMOB.INI", "Ubicación", "Caja","99")
dw_bl_buscar_cliente.SetTransObject(SQLCA)
dw_bl_buscar_cliente.Retrieve()
dw_bl_buscar_cliente.InsertRow(0)
dw_bl_buscar_cliente.SetItem(1,"rs_a_paterno", "")
dw_bl_buscar_cliente.SetItem(1,"rs_a_materno", "")
dw_bl_buscar_cliente.SetItem(1,"rs_nombre", "")
dw_bl_buscar_cliente.SetItem(1,"rn_contrato","") 
dw_bl_buscar_cliente.SetItem(1,"rl_rut","")
dw_gastos_bl.InsertRow(0)
dw_bl_buscar_cliente.SetTransObject(SQLCA)
dw_bl_buscar_cliente.Retrieve()
dw_bl_buscar_cliente.InsertRow(0)
dw_bl_buscar_cliente.SetItem(1,"rs_a_paterno", "")
dw_bl_buscar_cliente.SetItem(1,"rs_a_materno", "")
dw_bl_buscar_cliente.SetItem(1,"rs_nombre", "")
dw_bl_buscar_cliente.SetItem(1,"rn_contrato","") 
dw_bl_buscar_cliente.SetItem(1,"rl_rut","")
dw_bl_buscar_cliente.AcceptText()
dw_gastos_bl.SetTransObject(SQLCA)
dw_gastos_bl.Retrieve()
dw_gastos_bl.setitem(1,'incluir_gastos',1)
dw_gastos_bl.accepttext()
dw_datos_bl.SetTransObject(SQLCA)

dw_detalle_bl.getchild('tipo_cob',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve('BL')

dw_detalle_bl.getchild('tipo_cob_otro',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.retrieve()

id_fecha 		= idt_fecha_hoy
st_fecha.text 	= string(id_fecha,'dd/mm/yyyy')
id_uf 			= 0
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:id_uf  
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha;
IF id_uf > 0  THEN 
	gd_uf 		= id_uf	
	st_uf.text 	= String(id_uf, "###,###,###.0000")
ELSE
//	Open(w_mantenedor_uf)
	id_fecha		= Date(st_fecha.text)
	id_uf 		= 0
	SELECT	"TAB_UF"."VALOR_UF"  
   INTO 		:id_uf  
   FROM 		"TAB_UF"  
   WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha;
END IF
dw_bl_buscar_cliente.setitem(1,'rn_contrato',gi_numero)
dw_bl_buscar_cliente.setitem(1,'rs_bs',gs_base+gs_serie)
dw_bl_buscar_cliente.triggerevent (itemchanged!)
if dw_datos_bl.dataobject='d_datos_cuenta_bl_cto_isa' then
	ii_cantidad	= dw_datos_bl.GetItemNumber(1, "c_cuotas_en_mora")
elseif dw_datos_bl.dataobject='d_datos_cuenta_bl_oferta' then
	ii_cantidad = dw_datos_bl.GetItemNumber(1, "c_cuotas_mora_m")
end if
SELECT	count("REPACTA_MANTENCION"."ESTADO_PAGO")
INTO 		:ll_estado  
FROM 		"REPACTA_MANTENCION"  
WHERE  ( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :gs_base ) AND  
		 ( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :gs_serie ) AND  
		 ( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :gi_numero )   
Using	sqlca ;
if sqlca.sqlcode = 0 then
	if ll_estado > 0 then
		cb_repactar.enabled		= true
//	else
//		if ii_cantidad >= 1 then
//			cb_repactar.enabled	= true
//		else
//			cb_repactar.enabled	= false
//		end if
	end if
else
	if ii_cantidad >= 1 then
		cb_repactar.enabled		= true
	else
		cb_repactar.enabled		= false
	end if
end if
if today() <> date(gdt_fec_sistema) then
	messagebox("Advertencia","Debe Revisar Fecha del Computador NO Corresponde al día de Hoy "+string(gdt_fec_sistema,'dd/mm/yyyy'))
end if
gs_ventana							= 'w_boletas_cuotas'
f_valida_objeto()
SELECT	"ENCARGADOS"."OPERA"  
INTO 		:ls_opera  
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
USING		sqlca;
if sqlca.sqlcode=0 then
	if ls_opera='1' or gs_depto='I' then
		cb_repactar.enabled		= true
	else
		cb_repactar.enabled		= false
	end if
end if
end event

event mousemove;if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

type st_help_abono from statictext within w_boletas_cuotas
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2080
integer y = 392
integer width = 549
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 28573695
string text = "Cliente Posee ABONO"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type dw_dias_mora from datawindow within w_boletas_cuotas
boolean visible = false
integer x = 759
integer y = 1776
integer width = 1563
integer height = 224
string title = "none"
string dataobject = "dwe_lista_calculo_dias_mora_credito"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
end type

event doubleclicked;dw_dias_mora.print()
end event

type cb_imprimir_detalle from commandbutton within w_boletas_cuotas
event ue_mousemove pbm_mousemove
integer x = 1710
integer y = 1604
integer width = 498
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Detalle Pago"
end type

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

event clicked;long	ll_indi,ll_tot_reg
string ls_tipo_cob,ls_tipo_cob_otro

if dw_gastos_bl.rowcount() > 0 then
	ll_tot_reg					= dw_detalle_bl.rowcount()
	for ll_indi= 1 to ll_tot_reg 
		ls_tipo_cob			= dw_detalle_bl.getitemstring(ll_indi,'tipo_cob')
//		ls_tipo_cob_otro	= gs_codigo_otro
		
		ls_tipo_cob_otro	= dw_detalle_bl.getitemstring(ll_indi,'tipo_cob_otro')
		gs_codigo_otro		= ls_tipo_cob_otro
		if ls_tipo_cob_otro = "" then ls_tipo_cob_otro = '0'
		if ls_tipo_cob = 'S' and ls_tipo_cob_otro <> '0' then
			wf_validar_descuento()
		end if	
	next
	if dw_gastos_bl.getitemnumber(1,'subtotal') > 0 and dw_gastos_bl.getitemnumber(1,'c_total') > 0 then
		if isvalid(w_imprimir_detalle_pago) then close(w_imprimir_detalle_pago)
		open(w_imprimir_detalle_pago)
	end if
end if
end event

type cb_repactar from commandbutton within w_boletas_cuotas
event ue_mousemove pbm_mousemove
integer x = 1061
integer y = 1604
integer width = 439
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Reprogramación"
end type

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

event clicked;String		ls_string, ls_fecha, ls_estado
long 		i, ll_dia,ll_mes,ll_anno,ll_count_reg,ii_dmora,ii_mora_cobro,ii_inc_gastos,ii_cantidad,ll_cant_mant,ll_cant_cred
double	ld_total,ll_total,ld_resul,id_valor_cuota,id_im,id_gc,ldb_valor_cuota_mant
Date		ld_fec_prox_pago

ii_dmora=0;ii_mora_cobro=0;ii_inc_gastos=0;ii_cantidad=0;ld_total=0;ll_total=0
ld_resul=0;id_valor_cuota=0;id_im=0;id_gc=0
Setnull(gd_val_deuda);setnull(gd_val_interes)
if gs_base='O' or gs_base='C' then
	gl_n_cuotas_pag 		= 0 
	ls_estado				= trim(dw_encabezado_ingreso_cupon.getitemstring(1,'cadena_estado'))
	SELECT	COUNT("SOL_REACTIVA"."RUT_TITULAR")  
	INTO 		:ll_count_reg  
	FROM 		"SOL_ESTATUS",   
				"SOL_REACTIVA"  
	WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_REACTIVA"."BASE" ) and  
			 ( "SOL_ESTATUS"."SERIE" = "SOL_REACTIVA"."SERIE" ) and  
			 ( "SOL_ESTATUS"."NUMERO" = "SOL_REACTIVA"."NUMERO" ) and  
			 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_REACTIVA"."CORRELATIVO" ) and  
			 (("SOL_ESTATUS"."BASE" = :gs_base ) AND  
			 ( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
			 ( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
			 ( "SOL_REACTIVA"."ESTATUS_OPERACION" = 0 ) AND
			 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '3' ) AND  
			 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
	USING		sqlca ;
	if ls_estado='V' or ls_estado='C' or ls_estado='R' or (ls_estado='N' and ll_count_reg>0) then
		dw_detalle_bl.SetItem(1,"cuota_mantencion", dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"))
		IF gs_rezago <> "S" THEN	 
			id_valor_cuota 			= Round(dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
			ii_dmora 				= dw_datos_bl.GetItemNumber(1,"c_dias_mora_mant")
//			id_interes_gc			= double(dw_datos_bl.GetItemNumber(1,"tasa_gasto_cob_mora"))
			IF ii_dmora > 5 THEN 
				ii_mora_cobro 		= ii_dmora 
				id_im 					= gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota)
				IF ii_dmora > 30 THEN 
					id_gc 				= Round(id_valor_cuota * id_interes_gc, 0) //005// PASA DE .1 A .05 10/1/2000
					ii_inc_gastos	= 1
				END IF
			ELSE
				id_gc 					= 0
				id_im 					= 0
				ii_mora_cobro 		= 0
				ii_inc_gastos 		= 0
			END IF
		ELSE
			id_valor_cuota			= 0
			ii_dmora 				= 0
			id_gc 						= 0
			id_im 						= 0
			ii_mora_cobro 			= 0
			ii_inc_gastos 			= 0
		END IF
		if dw_datos_bl.dataobject='d_datos_cuenta_bl_cto_isa' then
			ii_cantidad 				= dw_datos_bl.GetItemNumber(1, "c_cuotas_en_mora")
			ll_dia						= dw_datos_bl.GetItemNumber(1,'c_prox_pago_dia')
			ll_mes					= dw_datos_bl.GetItemNumber(1,'c_prox_pago_mes')
			ll_anno					= dw_datos_bl.GetItemNumber(1,'c_prox_pago_anno')
			gs_moneda				= '2' //dw_datos_bl.GetItemstring(1,'contrato_moneda')
			gl_ctas_pag_m			= dw_datos_bl.GetItemnumber(1,'contrato_cta_pag_m')
		elseif dw_datos_bl.dataobject='d_datos_cuenta_bl_oferta' then
			ii_cantidad 				= dw_datos_bl.GetItemNumber(1, "c_cuotas_mora_m")
			ll_dia						= dw_datos_bl.GetItemNumber(1,'f_prox_pago_dia')
			ll_mes					= dw_datos_bl.GetItemNumber(1,'c_prox_pago_mes')
			ll_anno					= dw_datos_bl.GetItemNumber(1,'c_prox_pago_anno')
			gs_moneda				= '2' //dw_datos_bl.GetItemstring(1,'pago_oferta_moneda')
			gl_ctas_pag_m			= dw_datos_bl.GetItemnumber(1,'oferta_v_cta_pag_m')
		end if
		if ii_cantidad>=0 then
			gl_cta_mora_original	= ii_cantidad
			ls_fecha					= string(ll_dia,"00")+'/'+string(ll_mes,"00")+'/'+string(ll_anno)
			ld_fec_prox_pago		= date(ls_fecha)
			gl_n_cuotas_pag 		= ii_cantidad 
			id_valor_cuota 			= Round(dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
			ii_dmora 				= dw_datos_bl.GetItemNumber(1,"c_dias_mora_mant")
//			id_interes_gc			= double(dw_datos_bl.GetItemNumber(1,"tasa_gasto_cob_mora"))
			ll_total					= ii_cantidad * dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos")
			id_gc 						= 0
			id_im 						= 0
			ii_mora_cobro 			= 0
			ii_inc_gastos 			= 0
			SELECT 	"ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", 	"ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
			INTO   	:ll_cant_mant,														:ll_cant_cred
			FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
			WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
					( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
					(("CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero ) )   ;
					 
			FOR i = 1 TO ii_cantidad 
				IF ((ii_dmora - (i - 1) * (ll_cant_mant * 30))) > 5  THEN 
					ii_mora_cobro		= ((ii_dmora - (i - 1) * (ll_cant_mant * 30)))
					id_im 					= id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota)		//id_tasa_mant
					IF ((ii_dmora - (i - 1) * (ll_cant_mant * 30))) > 30 THEN 
						 id_gc 			= id_gc + Round(id_valor_cuota * id_interes_gc, 0)		// id_factor_gc
						 ii_inc_gastos 	= 1
					END IF
				ELSE
		//			id_gc 					= 0
		//			id_im 					= 0
		//			ii_mora_cobro		= 0
				END IF
			NEXT
			ld_resul					= ( id_gc + id_im )* ii_inc_gastos 
			ld_total					=  round(((ld_resul * ii_inc_gastos) + ll_total),0)
			gd_val_interes			= ld_resul
			gd_val_deuda			= ll_total
			gi_rut						= long(dw_bl_buscar_cliente.getitemstring(1,'rl_rut'))
			gs_dv						= dw_bl_buscar_cliente.getitemstring(1,'cf_obtener_dv')
			ls_string					= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ld_total)+'~t'+trim(dw_encabezado_ingreso_cupon.getitemstring(1,'f_nombre')+'~t'+string(ld_fec_prox_pago)+'~t'+string(ii_cantidad))
			if isvalid(w_detalle_repactacion_por_contrato) then close(w_detalle_repactacion_por_contrato)
			OpenWithParm(w_detalle_repactacion_por_contrato,ls_string)
		else
			messagebox("Advertencia","No tiene Cuotas en Mora para Reprogramar")
		end if
	else
		if ls_estado='N' then
			messagebox("Advertencia","Recuerde para Reprogramar, Contrato Nulo debe existir Solicitud de Reactivación Aceptada")
		else
			messagebox("Advertencia","Recuerde para Reprogramar, El Contrato debe estar Vigente, Cancelado, Nulo o Resuelto")
		end if
	end if
else
	messagebox("Advertencia","Solo se Reprograma Cuota Mantención de Promesa y Contrato Isacruz")
end if
end event

type cb_cerrar from commandbutton within w_boletas_cuotas
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 2432
integer y = 1604
integer width = 329
integer height = 100
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
Close(w_boletas_cuotas)
end event

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

type cb_ver_cuenta from commandbutton within w_boletas_cuotas
event clicked pbm_bnclicked
boolean visible = false
integer x = 14
integer y = 1852
integer width = 576
integer height = 108
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Cuenta corriente"
end type

event clicked;
IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho
			Open(w_cuenta_corriente_derecho)
	END CHOOSE
END IF
end event

type dw_detalle_bl from datawindow within w_boletas_cuotas
event itemchanged pbm_dwnitemchange
event ue_mousemove pbm_mousemove
integer x = 1056
integer y = 784
integer width = 1710
integer height = 488
integer taborder = 70
string dataobject = "dw_detalle_bl_ctas_mant"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string		is_columna,ls_tipo_cob,ls_moneda,ls_tipo_cob_aux,ls_estado_cadena,ls_descrip_estado,ls_moneda_insert,&
			ls_tipo_comp='BE',ls_texto,ls_pasa='S',ls_fecha,ls_otro_dscto,ls_tipo_cob_dscto
long 		il_monto,fila,ii_dmora, ii_mora_cobro,ii_inc_gastos, ii_cantidad, i,ll_fila_m,ll_fila_d,ll_new_m,ll_monto_cuota_reg,ll_ctas_pag_m,ll_count_f,ll_crear,&
			ll_ctas=0,ll_count_reg,ll_folio,ll_ctas_pagadas_1=0,ll_ctas_pagadas_2=0,ll_ctas_pagadas=0,ll_cuota_ini,ll_cuota_fin,ll_new_iva,&
			ll_cantidad,ll_plazo,ll_ctas_pactadas_pie,ll_suma,ll_tot_reg,ll_indi,ll_count_tipo=0,ll_mora_mant,ll_iva_p,ll_gasto_mant,&
			ll_resta,ll_cuota,ll_dia_prox_pago,ll_day,ll_month,ll_year,ll_max,ll_new,ll_dias_dif,ll_suma_dias,&
			ll_tot_fila,ll_reg,ll_dias_mora,ll_valor_int,ll_suma_acum_gc,ll_mora,ll_gasto_cob,ll_fila,ll_cant_mant,ll_cant_cred
double 	id_im, id_gc, id_valor_cuota,ld_monto,ll_iva_recalc,ldb_iva,ll_iva_f,ll_iva_r,ll_monto_cta,ll_monto_final
Datetime	ldt_fecha_hoy
date		ld_fecha_hoy,ld_fecha_prox_pago,ld_fecha_inicial,ld_fecha_prox_venc
long 		ll_found,ll_fila_dscto

SELECT 	"ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", 	"ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
INTO   	:ll_cant_mant,														:ll_cant_cred
FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
		( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
		(("CADENA"."CODIGO" = :gs_base ) AND  
		( "CADENA"."SERIE" = :gs_serie ) AND  
		( "CADENA"."NUMERO" = :gi_numero ) )   ;
this.SetItem(row, "uf", gd_uf)
this.accepttext()
if dw_datos_bl.dataobject='d_datos_cuenta_bl_cto_isa' then
	ii_cantidad	= dw_datos_bl.GetItemNumber(1, "c_cuotas_en_mora")
elseif dw_datos_bl.dataobject='d_datos_cuenta_bl_oferta' then
	ii_cantidad = dw_datos_bl.GetItemNumber(1, "c_cuotas_mora_m")
end if
is_columna		= this.GetColumnName()
ls_tipo_cob		= this.GetItemString(row, "tipo_cob")
ld_fecha_hoy	= date(gdt_fec_sistema)
//if gs_codigo_otro = "" then gs_codigo_otro = '0'
//if ls_tipo_cob = 'S' and gs_codigo_otro <> '0' then
//	wf_validar_descuento()
//end if
IF ls_tipo_cob <> 'L' and ls_tipo_cob<>'S' THEN
	ll_tot_reg						= dw_detalle_bl.rowcount()
	if ll_tot_reg>1 then
		for ll_indi = 1 to ll_tot_reg
			ls_tipo_cob_aux		= dw_detalle_bl.getitemstring(ll_indi,'tipo_cob')
			if ls_tipo_cob = ls_tipo_cob_aux then 
				ll_count_tipo ++
				if ll_count_tipo = 2 then
					messagebox("Advertencia","No puede Ingresar Tipo Cobro "+ls_tipo_cob+" Duplicado")
					wf_borrar_fila(ll_indi)
					ls_pasa	= 'N'
					exit
				end if
			end if
		next
		dw_detalle_bl.accepttext()
	end if
end if
if ls_pasa='S' then
	ii_inc_gastos 						= 1
	IF is_columna = "tipo_cob"  THEN
		IF ls_tipo_cob = "E" THEN
			this.SetItem(row, "cantidad", 1)
			IF gs_rezago <> "S" THEN
				if gs_base='C' then  //gs_conexion = "Parque Santiago" and 
					messagebox("Advertencia","No es Posible Ingresar Pago Cuota a Contrato")
					this.SetItem(row, "monto", 0)
					this.SetItem(row, "cantidad", 0)
				else
					this.SetItem(row, "monto", dw_datos_bl.GetItemNumber(1,"c_valor_cuota_pesos"))
				end if
			ELSE 
				this.SetItem(row, "monto", 0)
			END IF
		elseif ls_tipo_cob = "M" THEN
			this.SetItem(row, "moneda",'U')
			this.SetItem(row, "monto", 0)
			this.SetItem(row, "cantidad", 1)
			this.accepttext()
		ELSEIF ls_tipo_cob = "L" or ls_tipo_cob = "S" THEN
			this.SetItem(row, "monto", 0)
			this.SetItem(row, "cantidad", 1)
			ls_texto		= ls_tipo_cob+'~t'+'BE'
			openwithparm(w_apertura_tipo_cobro_otros,ls_texto)
		ELSEIF ls_tipo_cob = "A" THEN
			this.SetItem(row, "cantidad", 1)
			IF gs_rezago <> "S" THEN
				if gs_base='O' then
					if dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') > 0 and dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pagadas_pie') < dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie')then
						ls_texto			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+'BE'+'~t'+'0'
						openwithparm(w_ingreso_pago_pie_pactado,ls_texto)
						if Message.StringParm = 'N' then
							this.SetItem(row, "cantidad", 1)
//								this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
							this.accepttext()
						else
//								w_ingreso.tab_ingreso.tp_ci.dw_detalle_ci.accepttext()
//								w_ingreso.tab_ingreso.tp_ci.dw_detalle_ci.setfocus()
//								w_ingreso.tab_ingreso.tp_ci.dw_detalle_ci.triggerevent(itemchanged!)
						end if		
						
						
//								if long(data) > ( dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') - dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') )  then
//									this.SetItem(row, "cantidad", ( dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') - dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') ))
//								end if
					end if
					this.SetItem(row, "monto", dw_datos_bl.GetItemNumber(1,"c_valor_pie_pesos"))
				end if
			ELSE
				this.SetItem(row, "monto", 0)
			END IF
		ELSEIF ls_tipo_cob = "F" THEN
			SELECT 	Count("CUPONERAS_DETALLE"."TIPO_MOV"  )
			INTO 		:ll_count_f 
			FROM 	"CUPONERAS",   "CUPONERAS_DETALLE"
			WHERE 	( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
						( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
						( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
						( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
						( ( "CUPONERAS"."BASE" = :gs_base ) AND  
						( "CUPONERAS"."SERIE" = :gs_serie ) AND  
						( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
						( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
						( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND
						("CUPONERAS"."ESTADO_CUPONERA" = 'V' OR  "CUPONERAS"."ESTADO_CUPONERA" = 'C') )	   ;
			if isnull(ll_count_f) then ll_count_f=0
			
			SELECT 	"CADENA_MORA"."MORA_MANT"  
			INTO 		:ll_mora_mant  
			FROM 	"CADENA_MORA"  
			WHERE 	( "CADENA_MORA"."BASE" = :gs_base ) AND  
						( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
						( "CADENA_MORA"."NUMERO" = :gi_numero )   ;
			if isnull(ll_mora_mant) then ll_mora_mant=0	
			
			if ll_count_f <= (ll_mora_mant + 1) then
				ll_crear		= (ll_mora_mant + 1) - ll_count_f
				wf_crear_cupones_mantencion(ll_crear)
			end if
			
			this.SetItem(row, "cantidad", 1)
			IF gs_rezago <> "S" THEN
				this.SetItem(row, "monto", dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"))
			ELSE 
				this.SetItem(row, "monto", 0)
			END IF
			ii_cantidad 		= GetItemNumber(row, "cantidad")
			gl_n_cuotas_pag 	= ii_cantidad 
			id_valor_cuota 	= Round(dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
			ii_dmora 			= dw_datos_bl.GetItemNumber(1,"c_dias_mora_mant")
		//	id_interes_gc		= double(dw_datos_bl.GetItemNumber(1, "tasa_gasto_cob_mora"))
			id_gc 				= 0
			id_im 				= 0
			ii_mora_cobro 		= 0
			ii_inc_gastos 		= 0
			FOR i = 1 TO ii_cantidad 
				IF ((ii_dmora - (i - 1) * (ll_cant_mant * 30))) > 5 THEN 
					ii_mora_cobro		= round((ii_dmora - (i - 1) * (ll_cant_mant * 30)),0)
					id_im 				= round((id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota)),0)
					IF (ii_dmora - (i - 1) * (ll_cant_mant * 30)) > 30 THEN 
						 id_gc 			= round((id_gc + Round(id_valor_cuota * id_interes_gc, 0)),0) //005// CAMBIO DE 10 A 5%
						 ii_inc_gastos	= 1
					END IF
				END IF
			NEXT
			if isnull(id_gc) then id_gc=0
			if isnull(id_im) then id_im=0
			dw_gastos_bl.SetItem(1,"gastos_cob", id_gc)
			dw_gastos_bl.SetItem(1,"mora", id_im)
			dw_gastos_bl.accepttext()
//			if isnull(dw_gastos_bl.getitemnumber(1,"gastos_cob")) then		dw_gastos_bl.SetItem(1,"gastos_cob", 0)
//			if isnull(dw_gastos_bl.getitemnumber(1,"mora")) then 				dw_gastos_bl.SetItem(1,"mora", 0)
//			if isnull(dw_gastos_bl.getitemnumber(1,"incluir_gastos")) then dw_gastos_bl.SetItem(1,"incluir_gastos", 0)
			dw_gastos_bl.SetItem(1, "Subtotal",this.GetItemNumber(1,"c_subtotal"))
			dw_gastos_bl.accepttext()
			
			if gs_base='O' or gs_base='C' then
				ll_monto_cuota_reg		= dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos")	//dw_detalle_ci.getitemnumber(getrow(),'c_total_linea')
				this.SetItem(row, "monto", dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"))
				if gs_base='O' then
					ll_ctas_pag_m			= dw_datos_bl.getitemnumber(1,'oferta_v_cta_pag_m')
				elseif gs_base='C' then
					ll_ctas_pag_m			= dw_datos_bl.getitemnumber(1,'contrato_cta_pag_m')
				end if
				ll_cuota_ini					= ll_ctas_pag_m + 1
				ll_cuota_fin					= (ll_cuota_ini + ii_cantidad) - 1
				SELECT SUM( "VISTA_MANTEN_IVA"."IVA"  )
				INTO    :ldb_iva
				FROM    "VISTA_MANTEN_IVA"  
				WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
						  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
						  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
						  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'F' ) AND
						  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
						  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin ) ;
				if ldb_iva > 0 and ll_monto_cuota_reg > 0 then
						ll_iva_f 				= ldb_iva		//round(ll_monto_cuota_reg * (idb_iva - 1),0)
						ll_new_iva			= dw_detalle_bl.Find("tipo_cob = 'D'", 1, dw_detalle_bl.rowcount())
						if ll_new_iva > 0 then
							if ldb_iva > 0 then
								dw_detalle_bl.scrolltorow(ll_new_iva)
							else
								dw_detalle_bl.deleterow(ll_new_iva)
							end if
						else
							ll_new_iva		= dw_detalle_bl.insertrow(0)
						end if
						dw_detalle_bl.setitem(ll_new_iva,'tipo_cob', 'D')
						dw_detalle_bl.SetItem(ll_new_iva, "iva", idb_iva)
						dw_detalle_bl.setitem(ll_new_iva,'cantidad', 1)
						dw_detalle_bl.setitem(ll_new_iva,'monto_uf', round( ll_iva_f / gd_uf,4))
						dw_detalle_bl.setitem(ll_new_iva,'monto', ll_iva_f)
						dw_detalle_bl.setitem(ll_new_iva,'uf',gd_uf)
						dw_detalle_bl.setitem(ll_new_iva,'estado','S')
						dw_detalle_bl.SetItem(ll_new_iva, "moneda",'P')
				else
						ll_iva_f 				= 0
						ll_new_iva			= dw_detalle_bl.Find("tipo_cob = 'D'", 1, dw_detalle_bl.rowcount())
						if ll_new_iva > 0 then
							dw_detalle_bl.deleterow(ll_new_iva)
						end if
				end if
//				wf_calcular_interes(ls_tipo_cob)
				ll_mora_mant			= dw_gastos_bl.getitemnumber(1,'mora')
				if ll_mora_mant > 0 then
					  SELECT  SUM("VISTA_MANTEN_IVA"."IVA")  
					  INTO    	:ldb_iva
					  FROM    "VISTA_MANTEN_IVA"  
					  WHERE   ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
								  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
								  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
								  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'P' ) AND
								  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
								  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
					  if ldb_iva > 0 and ll_mora_mant > 0 then
							ll_iva_p 			= round(ll_mora_mant * (idb_iva - 1),0)		//round(ldb_iva,0)
							ll_new_iva		= dw_detalle_bl.Find("tipo_cob = 'V'", 1, dw_detalle_bl.rowcount())
							if ll_new_iva > 0 then
								dw_detalle_bl.scrolltorow(ll_new_iva)
							else
								ll_new_iva		= dw_detalle_bl.insertrow(0)
							end if
							dw_detalle_bl.setitem(ll_new_iva,'tipo_cob', 'V')
//								if rb_be_afecta.checked=true then
							dw_detalle_bl.SetItem(ll_new_iva, "iva", idb_iva)
//								end if
							dw_detalle_bl.setitem(ll_new_iva,'cantidad', 1)
							ls_moneda_insert	= '1'
							if ls_moneda_insert = '1' then
								dw_detalle_bl.setitem(ll_new_iva,'monto_uf', round( ll_iva_p / gd_uf,4))
								dw_detalle_bl.setitem(ll_new_iva,'monto', ll_iva_p)
							end if
							dw_detalle_bl.setitem(ll_new_iva,'uf',gd_uf)
							dw_detalle_bl.setitem(ll_new_iva,'estado','S')
							dw_detalle_bl.SetItem(ll_new_iva, "moneda",'P')
					  else
							ll_iva_p 			= 0
					  end if
				end if
				ll_gasto_mant				= dw_gastos_bl.getitemnumber(1,'gastos_cob')
				if ll_gasto_mant > 0 then
					  SELECT  SUM("VISTA_MANTEN_IVA"."IVA" ) 
					  INTO    	:ldb_iva
					  FROM    "VISTA_MANTEN_IVA"  
					  WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
							  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
							  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
							  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'R' ) AND
							  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
							  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
					  if ldb_iva > 0 and ll_gasto_mant > 0 then
							ll_iva_r 			= round(ll_gasto_mant * (idb_iva - 1),0)			//round(ldb_iva,0)
							ll_new_iva		= dw_detalle_bl.Find("tipo_cob = 'X'", 1, dw_detalle_bl.rowcount())
							if ll_new_iva > 0 then
								dw_detalle_bl.scrolltorow(ll_new_iva)
							else
								ll_new_iva		= dw_detalle_bl.insertrow(0)
							end if
							dw_detalle_bl.setitem(ll_new_iva,'tipo_cob', 'X')
//								if rb_be_afecta.checked=true then
								dw_detalle_bl.SetItem(ll_new_iva, "iva", idb_iva)
//								end if
							dw_detalle_bl.setitem(ll_new_iva,'cantidad', 1)
							ls_moneda_insert	= '1'
							if ls_moneda_insert = '1' then
								dw_detalle_bl.setitem(ll_new_iva,'monto_uf', round( ll_iva_r / gd_uf,4))
								dw_detalle_bl.setitem(ll_new_iva,'monto', ll_iva_r)
							end if
							dw_detalle_bl.setitem(ll_new_iva,'uf',gd_uf)
							dw_detalle_bl.setitem(ll_new_iva,'estado','S')
							dw_detalle_bl.SetItem(ll_new_iva, "moneda",'P')
					  else
							ll_iva_r 			= 0
					  end if
				end if
			end if
		ELSE
			this.SetItem(row, "monto", 0)
			this.SetItem(row, "cantidad", 1)
		END IF
	END IF
	this.accepttext()
	dw_gastos_bl.SetItem(1, "Subtotal",this.GetItemNumber(1,"c_subtotal"))
	fila						= row
	if is_columna='cantidad' and ls_tipo_cob = "E" then
		ll_cantidad			= this.GetItemNumber(row, "cantidad")
		if gs_base='O' then
			ll_plazo			= dw_datos_bl.getitemnumber(1,'pago_oferta_nro_cuotas')
		elseif gs_base='C' then
			ll_plazo			= dw_datos_bl.getitemnumber(1,'contrato_plazo')
		end if
		if ll_cantidad > ll_plazo then
			messagebox("Advertencia","Nº Cuotas es Superior al Plazo")
			wf_borrar_fila(row)
//			this.SetItem(row, "cantidad", 0)
//			this.SetItem(row, "monto", 0)
		else
			if gs_base='O' then
				ll_ctas_pactadas_pie	= dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie')
			elseif gs_base='C' then
				ll_ctas_pactadas_pie	= dw_datos_bl.getitemnumber(1,'contrato_pie')
			end if
			if isnull(ll_ctas_pactadas_pie) then ll_ctas_pactadas_pie=0
			ls_tipo_cob				= this.GetItemString(row, "tipo_cob")
			ll_plazo					= dw_datos_bl.getitemnumber(1,'pago_oferta_nro_cuotas')
			ll_ctas_pagadas		= dw_datos_bl.getitemnumber(1,'oferta_v_cta_pag_s')
			ll_resta					= ll_plazo - ll_ctas_pagadas
			if isnull(ll_ctas_pactadas_pie) then ll_ctas_pactadas_pie = 0
			if isnull(ll_ctas_pagadas) then ll_ctas_pagadas=0
			if ls_tipo_cob = "E" then
				IF ll_cantidad > 0 and ll_cantidad <= ll_resta AND gs_base='O' THEN //gs_rezago <> "S" and ll_ctas_pactadas_pie = 0 AND 
					this.SetItem(row, "monto", dw_datos_bl.GetItemNumber(1,"c_valor_cuota_pesos"))
				else
					messagebox("Advertencia","Cantidad de Cuotas es Superior a Cuotas Pendientes")
					wf_borrar_fila(row)
//					this.SetItem(row, "cantidad", 0)
//					this.SetItem(row, "monto", 0)
				end if
			end if
		end if
	end if
	IF ls_tipo_cob = "E" AND this.GetItemNumber(row, "cantidad") > 0 AND gs_rezago <> "S" and gs_conexion <> "Parque Santiago" and gs_base<>'C' THEN //is_columna = "cantidad" AND 
		gl_n_cuotas_pag 		= ii_cantidad 
		id_valor_cuota 		= Round(dw_datos_bl.GetItemNumber(1,"c_valor_cuota_pesos"), 0)
		ii_dmora 				= dw_datos_bl.GetItemNumber(1,"c_dias_mora")

		dw_dias_mora.reset()
		ii_cantidad				= GetItemNumber(row, "cantidad")
		ll_cuota					= dw_datos_bl.GetItemNumber(1,'c_cuotas_mora')
		ld_fecha_prox_pago	= date(dw_datos_bl.getitemdatetime(1,'c_prox_pago_cred'))
		ll_dia_prox_pago		= day(ld_fecha_prox_pago)
		ld_fecha_inicial			= ld_fecha_prox_pago
		ll_day						= day(ld_fecha_inicial)
		ll_month					= month(ld_fecha_inicial)
		ll_year					= year(ld_fecha_inicial)
		if (ll_month=1 and ll_day>=31) or (ll_month=2 and ll_day>=28) or (ll_month=3 and ll_day>=31) or &
			(ll_month=4 and ll_day>=30) or (ll_month=5 and ll_day>=31) or (ll_month=6 and ll_day>=30) or &
			(ll_month=7 and ll_day>=31) or (ll_month=8 and ll_day>=31) or (ll_month=9 and ll_day>=30) or &
			(ll_month=10 and ll_day>=31) or (ll_month=11 and ll_day>=30) or (ll_month=12 and ll_day>=31) then
			ls_pasa				= 'S'
		else
			ls_pasa				= 'N'
		end if
		ll_max					= 1000
		FOR i = 1 TO ll_max
			ll_new				= dw_dias_mora.insertrow(0)
			dw_dias_mora.scrolltorow(ll_new)
			ll_day					= day(ld_fecha_inicial)
			ll_month				= month(ld_fecha_inicial)
			ll_year				= year(ld_fecha_inicial)
			ll_month	++
			if (ll_month=1 and ll_dia_prox_pago>31) then
				ls_pasa			= 'S'
				ll_day				= 31
			elseif (ll_month=2 and ll_dia_prox_pago>28) then
				ls_pasa			= 'S'
				ll_day				= 28
			elseif (ll_month=3 and ll_dia_prox_pago>31) then
				ls_pasa			= 'S'
				ll_day				= 31
			elseif (ll_month=4 and ll_dia_prox_pago>30) then
				ls_pasa			= 'S'
				ll_day				= 30
			elseif (ll_month=5 and ll_dia_prox_pago>31) then
				ls_pasa			= 'S'
				ll_day				= 31
			elseif (ll_month=6 and ll_dia_prox_pago>30) then
				ls_pasa			= 'S'
				ll_day				= 30
			elseif (ll_month=7 and ll_dia_prox_pago>31) then
				ls_pasa			= 'S'
				ll_day				= 31
			elseif (ll_month=8 and ll_dia_prox_pago>31) then
				ls_pasa			= 'S'
				ll_day				= 31
			elseif (ll_month=9 and ll_dia_prox_pago>30) then
				ls_pasa			= 'S'
				ll_day				= 30
			elseif (ll_month=10 and ll_dia_prox_pago>31) then
				ls_pasa			= 'S'
				ll_day				= 31
			elseif (ll_month=11 and ll_dia_prox_pago>30) then
				ls_pasa			= 'S'
				ll_day				= 30
			elseif (ll_month=12 and ll_dia_prox_pago>31) then
				ls_pasa			= 'S'
				ll_day				= 31
			end if
			if ll_month>12 then
				ll_year ++
				ll_month			= 1
				if (ll_month=1 and ls_pasa='S') then
					ls_pasa		= 'S'
					ll_day			= 31
				end if
			end if
			ls_fecha						= string(ll_day,'00')+'/'+string(ll_month,'00')+'/'+string(ll_year,'0000')
			ld_fecha_prox_venc		= date(ls_fecha)
			dw_dias_mora.setitem(ll_new,'fecha_inicial',ld_fecha_inicial)
			if ld_fecha_prox_venc > ld_fecha_hoy then 
				ld_fecha_prox_venc	= ld_fecha_hoy
			end if
			dw_dias_mora.setitem(ll_new,'fecha_venc',ld_fecha_prox_venc)
			if ld_fecha_prox_venc < ld_fecha_hoy then
				ll_dias_dif				= 0
				ll_dias_dif				= DaysAfter(ld_fecha_inicial, ld_fecha_prox_venc)
				if ll_dias_dif<=0 then ll_dias_dif=0
				dw_dias_mora.setitem(ll_new,'dias_mora',ll_dias_dif)
				ld_fecha_inicial			= ld_fecha_prox_venc
			else
				ll_dias_dif				= 0
				ll_dias_dif				= DaysAfter(ld_fecha_inicial, ld_fecha_hoy) //ld_fecha_prox_venc)
				if ll_dias_dif<=0 then ll_dias_dif=0
				dw_dias_mora.setitem(ll_new,'dias_mora',ll_dias_dif)
				ld_fecha_inicial			= ld_fecha_prox_venc
				ll_suma_dias			= ll_suma_dias + ll_dias_dif
				exit
			end if
			ll_suma_dias				= ll_suma_dias + ll_dias_dif
		NEXT
		ll_tot_fila							= dw_dias_mora.rowcount()
		for ll_reg=1 to ll_tot_fila
			ll_suma_dias				= ll_suma_dias - ll_dias_mora
			dw_dias_mora.setitem(ll_reg,'suma_dias',ll_suma_dias)
			ll_dias_mora				= dw_dias_mora.getitemnumber(ll_reg,'dias_mora')
		next
		dw_dias_mora.accepttext()
		ii_dmora							= 0
		ii_mora_cobro					= 0
		id_im								= 0
		id_gc								= 0
		FOR i = 1 TO ll_tot_fila //ii_cantidad 
			if ll_tot_fila > 0 and i <= ll_cuota then //ll_ctas_mora
				ii_dmora					= dw_dias_mora.GetItemNumber(i, "suma_dias")
				ll_dias_mora			= dw_dias_mora.GetItemNumber(i, "dias_mora")
				IF (ii_dmora > 5 AND dw_gastos_bl.getitemnumber(1,'incluir_gastos')=0) THEN
					ii_mora_cobro   	= ii_dmora
					ll_valor_int			= round(gf_int_mora(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1,"c_tasa"), ii_mora_cobro, id_valor_cuota),0)
					id_im 					= round((id_im + ll_valor_int),0)
					IF (ii_dmora > ll_dias_mora AND dw_gastos_bl.getitemnumber(1,'incluir_gastos')=0 ) THEN    
						id_gc     			= Round(id_valor_cuota * id_factor_gc, 0)
						ll_suma_acum_gc	= round((ll_suma_acum_gc + id_gc),0)
					END IF
				END IF  
			end if
		NEXT
		if isnull(ll_mora) then ll_mora=0
		if isnull(id_im) then id_im=0
		if isnull(ll_gasto_cob) then ll_gasto_cob=0
		if isnull(id_gc) then id_gc=0
		ll_mora					= ll_mora + id_im
		ll_gasto_cob				= ll_gasto_cob + id_gc
		dw_gastos_bl.SetItem(1,"gastos_cob", ll_suma_acum_gc)
		dw_gastos_bl.SetItem(1,"mora", id_im)
		dw_gastos_bl.SetItem(1,"incluir_gastos", ii_inc_gastos)
	END IF
	IF is_columna = "cantidad" AND ls_tipo_cob = "F" AND GetItemNumber(row, "cantidad") > 0 AND gs_rezago <> "S" THEN
		ii_cantidad 			= GetItemNumber(row, "cantidad")
		gl_n_cuotas_pag 	= ii_cantidad 
		id_valor_cuota 		= Round(dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
		ii_dmora 			= dw_datos_bl.GetItemNumber(1,"c_dias_mora_mant")
	//	id_interes_gc		= double(dw_datos_bl.GetItemNumber(1, "tasa_gasto_cob_mora"))
		id_gc 					= 0
		id_im 					= 0
		ii_mora_cobro 		= 0
		ii_inc_gastos 		= 0
		FOR i = 1 TO ii_cantidad 
			IF ((ii_dmora - (i - 1) * (ll_cant_mant * 30))) > 5 THEN 
				ii_mora_cobro		= round((ii_dmora - (i - 1) * (ll_cant_mant * 30)),0)
				id_im 					= round((id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota)),0)
				IF (ii_dmora - (i - 1) * (ll_cant_mant * 30)) > 30 THEN 
					 id_gc 			= round((id_gc + Round(id_valor_cuota * id_interes_gc, 0)),0) //005// CAMBIO DE 10 A 5%
					 ii_inc_gastos	= 1
				END IF
			END IF
		NEXT
		if isnull(id_gc) then id_gc=0
		if isnull(id_im) then id_im=0
		dw_gastos_bl.SetItem(1,"gastos_cob", id_gc)
		dw_gastos_bl.SetItem(1,"mora", id_im)
		dw_gastos_bl.accepttext()
//		if isnull(dw_gastos_bl.getitemnumber(1,"gastos_cob")) then		dw_gastos_bl.SetItem(1,"gastos_cob", 0)
//		if isnull(dw_gastos_bl.getitemnumber(1,"mora")) then 				dw_gastos_bl.SetItem(1,"mora", 0)
//		if isnull(dw_gastos_bl.getitemnumber(1,"incluir_gastos")) then dw_gastos_bl.SetItem(1,"incluir_gastos", 0)
		dw_gastos_bl.SetItem(1, "Subtotal",dw_detalle_bl.GetItemNumber(1,"c_subtotal"))
		dw_gastos_bl.accepttext()
		
		ii_cantidad 					= GetItemNumber(row, "cantidad")
		if gs_base='O' then
			ll_ctas_pag_m			= dw_datos_bl.getitemnumber(1,'oferta_v_cta_pag_m')
		elseif gs_base='C' then
			ll_ctas_pag_m			= dw_datos_bl.getitemnumber(1,'contrato_cta_pag_m')
		end if
		ll_cuota_ini					= ll_ctas_pag_m + 1
		ll_cuota_fin					= (ll_cuota_ini + ii_cantidad) - 1
		SELECT SUM( "VISTA_MANTEN_IVA"."IVA"  )
		INTO    :ldb_iva
		FROM    "VISTA_MANTEN_IVA"  
		WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
				  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
				  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
				  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'F' ) AND
				  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
				  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin ) ;
		if ldb_iva > 0 and ll_monto_cuota_reg >= 0 then
				ll_iva_f 				= ldb_iva		//round(ll_monto_cuota_reg * (idb_iva - 1),0)
				ll_new_iva			= dw_detalle_bl.Find("tipo_cob = 'D'", 1, dw_detalle_bl.rowcount())
				if ll_new_iva > 0 then
					if ldb_iva > 0 then
						dw_detalle_bl.scrolltorow(ll_new_iva)
					else
						dw_detalle_bl.deleterow(ll_new_iva)
					end if
				else
					ll_new_iva		= dw_detalle_bl.insertrow(0)
				end if
				dw_detalle_bl.setitem(ll_new_iva,'tipo_cob', 'D')
				dw_detalle_bl.SetItem(ll_new_iva, "iva", idb_iva)
				dw_detalle_bl.setitem(ll_new_iva,'cantidad', 1)
				dw_detalle_bl.setitem(ll_new_iva,'monto_uf', round( ll_iva_f / gd_uf,4))
				dw_detalle_bl.setitem(ll_new_iva,'monto', ll_iva_f)
				dw_detalle_bl.setitem(ll_new_iva,'uf',gd_uf)
				dw_detalle_bl.setitem(ll_new_iva,'estado','S')
				dw_detalle_bl.SetItem(ll_new_iva, "moneda",'P')
		else
				ll_iva_f 				= 0
				ll_new_iva			= dw_detalle_bl.Find("tipo_cob = 'D'", 1, dw_detalle_bl.rowcount())
				if ll_new_iva > 0 then
					dw_detalle_bl.deleterow(ll_new_iva)
				end if
		end if
//				wf_calcular_interes(ls_tipo_cob)
		ll_mora_mant			= dw_gastos_bl.getitemnumber(1,'mora')
		if ll_mora_mant > 0 then
			  SELECT  SUM("VISTA_MANTEN_IVA"."IVA")  
			  INTO    	:ldb_iva
			  FROM    "VISTA_MANTEN_IVA"  
			  WHERE   ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
						  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
						  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
						  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'P' ) AND
						  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
						  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
			  if ldb_iva > 0 and ll_mora_mant > 0 then
					ll_iva_p 			= round(ll_mora_mant * (idb_iva - 1),0)		//round(ldb_iva,0)
					ll_new_iva		= dw_detalle_bl.Find("tipo_cob = 'V'", 1, dw_detalle_bl.rowcount())
					if ll_new_iva > 0 then
						dw_detalle_bl.scrolltorow(ll_new_iva)
					else
						ll_new_iva		= dw_detalle_bl.insertrow(0)
					end if
					dw_detalle_bl.setitem(ll_new_iva,'tipo_cob', 'V')
//								if rb_be_afecta.checked=true then
					dw_detalle_bl.SetItem(ll_new_iva, "iva", idb_iva)
//								end if
					dw_detalle_bl.setitem(ll_new_iva,'cantidad', 1)
					ls_moneda_insert	= '1'
					if ls_moneda_insert = '1' then
						dw_detalle_bl.setitem(ll_new_iva,'monto_uf', round( ll_iva_p / gd_uf,4))
						dw_detalle_bl.setitem(ll_new_iva,'monto', ll_iva_p)
					end if
					dw_detalle_bl.setitem(ll_new_iva,'uf',gd_uf)
					dw_detalle_bl.setitem(ll_new_iva,'estado','S')
					dw_detalle_bl.SetItem(ll_new_iva, "moneda",'P')
			  else
					ll_iva_p 			= 0
			  end if
		end if
		ll_gasto_mant				= dw_gastos_bl.getitemnumber(1,'gastos_cob')
		if ll_gasto_mant > 0 then
			  SELECT  SUM("VISTA_MANTEN_IVA"."IVA" ) 
			  INTO    	:ldb_iva
			  FROM    "VISTA_MANTEN_IVA"  
			  WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
					  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
					  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
					  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'R' ) AND
					  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
					  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
			  if ldb_iva > 0 and ll_gasto_mant > 0 then
					ll_iva_r 			= round(ll_gasto_mant * (idb_iva - 1),0)			//round(ldb_iva,0)
					ll_new_iva		= dw_detalle_bl.Find("tipo_cob = 'X'", 1, dw_detalle_bl.rowcount())
					if ll_new_iva > 0 then
						dw_detalle_bl.scrolltorow(ll_new_iva)
					else
						ll_new_iva		= dw_detalle_bl.insertrow(0)
					end if
					dw_detalle_bl.setitem(ll_new_iva,'tipo_cob', 'X')
//								if rb_be_afecta.checked=true then
						dw_detalle_bl.SetItem(ll_new_iva, "iva", idb_iva)
//								end if
					dw_detalle_bl.setitem(ll_new_iva,'cantidad', 1)
					ls_moneda_insert	= '1'
					if ls_moneda_insert = '1' then
						dw_detalle_bl.setitem(ll_new_iva,'monto_uf', round( ll_iva_r / gd_uf,4))
						dw_detalle_bl.setitem(ll_new_iva,'monto', ll_iva_r)
					end if
					dw_detalle_bl.setitem(ll_new_iva,'uf',gd_uf)
					dw_detalle_bl.setitem(ll_new_iva,'estado','S')
					dw_detalle_bl.SetItem(ll_new_iva, "moneda",'P')
			  else
					ll_iva_r 			= 0
			  end if
		end if
		dw_detalle_bl.accepttext()
		dw_gastos_bl.SetItem(1, "Subtotal",dw_detalle_bl.GetItemNumber(1,"c_subtotal"))
		dw_gastos_bl.accepttext()
		
	END IF
	ls_otro_dscto				= dw_detalle_bl.getitemstring(row,'tipo_cob_otro')
	ls_tipo_cob_dscto			= dw_detalle_bl.getitemstring(row,'tipo_cob')
	IF is_columna = "monto_uf" and dw_detalle_bl.getitemstring(row,'moneda')='U' THEN
		il_fila_uf	= row
		ld_monto		= dw_detalle_bl.getitemnumber(row,'monto_uf')
		if ld_monto > 800 then
			dw_detalle_bl.SetItem(row, "monto", 0)
			dw_detalle_bl.SetItem(row, "monto_uf", 0)
			dw_gastos_bl.SetItem(1, "Subtotal",dw_detalle_bl.GetItemNumber(1,"c_subtotal"))
			dw_detalle_bl.accepttext()
			dw_detalle_bl.setfocus()
			dw_detalle_bl.setcolumn('monto_uf')
			messagebox("Advertencia","Revisar Monto Ingresado, recuerde tiene Seleccionado Opción Ingreso MONTO en U.F.")
		else
//			if ls_tipo_cob_dscto='S' and (ls_otro_dscto='103' or ls_otro_dscto='107' or ls_otro_dscto='109' or ls_otro_dscto='113' or ls_otro_dscto='151') and ld_monto > 0 then	//Descuento Derecho Sepultacion
			ll_fila_m				= dw_detalle_bl.Find("tipo_cob='M'", 1, dw_detalle_bl.rowcount())
			if ll_fila_m > 0 then
				ll_fila_d			= dw_detalle_bl.Find("tipo_cob='D'", 1, dw_detalle_bl.rowcount())
				if ll_fila_d > 0 then
					ll_iva_recalc		= round(ld_monto * (idb_iva - 1),2)
					dw_detalle_bl.setitem(ll_fila_d,'monto_uf',ll_iva_recalc)
					dw_detalle_bl.setitem(ll_fila_d,'monto', round( ll_iva_recalc * gd_uf,4))
				else
					ll_new_m		= dw_detalle_bl.insertrow(0)
					ll_iva_recalc		= round(ld_monto * (idb_iva - 1),2)
					dw_detalle_bl.setitem(ll_new_m,'tipo_cob', 'D')
					dw_detalle_bl.SetItem(ll_new_m, "iva", idb_iva)
					dw_detalle_bl.setitem(ll_new_m,'cantidad', 1)
					ls_moneda_insert	= '2'
					if ls_moneda_insert = '2' then
						dw_detalle_bl.setitem(ll_new_m,'monto', round( ll_iva_recalc * gd_uf,4))
						dw_detalle_bl.setitem(ll_new_m,'monto_uf', ll_iva_recalc)
					end if
					dw_detalle_bl.setitem(ll_new_m,'uf',gd_uf)
					dw_detalle_bl.setitem(ll_new_m,'estado','S')
					dw_detalle_bl.SetItem(ll_new_m, "moneda",'U')
				end if
				dw_gastos_bl.SetItem(1, "Subtotal",this.GetItemNumber(1,"c_subtotal"))
				dw_gastos_bl.accepttext()
//				end if
			end if
		end if
	end if
	IF is_columna = "monto" THEN
		il_fila_uf		= row
		ld_monto		= dw_detalle_bl.getitemnumber(row,'monto')
		if ld_monto < 0 then
			dw_detalle_bl.SetItem(row, "cantidad", 0)
			dw_detalle_bl.SetItem(row, "monto", 0)
			dw_detalle_bl.SetItem(row, "monto_uf", 0)
			dw_detalle_bl.accepttext()
			dw_gastos_bl.SetItem(1, "Subtotal",dw_detalle_bl.GetItemNumber(1,"c_subtotal"))
			dw_detalle_bl.setfocus()
			dw_detalle_bl.setcolumn('monto')
			messagebox("Advertencia","Revisar Monto Ingresado, recuerde MONTO debe ser Mayor a CERO")
		end if
		// Recalcular IVA
		
		ls_otro_dscto				= dw_detalle_bl.getitemstring(row,'tipo_cob_otro')
		ls_tipo_cob_dscto			= dw_detalle_bl.getitemstring(row,'tipo_cob')
		
		if ls_tipo_cob_dscto='S' and ls_otro_dscto='132' and ld_monto > 0 then	//Descuento Mantencion
			ll_fila_dscto				= dw_detalle_bl.Find("tipo_cob='F'", 1, this.rowcount())
			if ll_fila_dscto > 0 then
				ll_monto_cta		= dw_detalle_bl.getitemnumber(ll_fila_dscto,'c_total_linea')
				ll_fila_dscto			= dw_detalle_bl.Find("tipo_cob='D'", 1, this.rowcount())
				if ll_fila_dscto > 0 then
					ll_monto_final	= ll_monto_cta - ld_monto
					ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
					dw_detalle_bl.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
					dw_detalle_bl.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
				end if
				dw_gastos_bl.SetItem(1, "Subtotal",this.GetItemNumber(1,"c_subtotal"))
				dw_gastos_bl.accepttext()
			end if
		elseif ls_tipo_cob_dscto='S' and (ls_otro_dscto='103' or ls_otro_dscto='107' or ls_otro_dscto='122' or ls_otro_dscto='113' or ls_otro_dscto='151') and ld_monto > 0 then	//Descuento Derecho Sepultacion
			ll_fila_dscto				= dw_detalle_bl.Find("tipo_cob='M'", 1, dw_detalle_bl.rowcount())
			if ll_fila_dscto > 0 then
				ll_monto_cta		= dw_detalle_bl.getitemnumber(ll_fila_dscto,'c_total_linea')
				ll_fila_dscto			= dw_detalle_bl.Find("tipo_cob='D'", 1, dw_detalle_bl.rowcount())
				if ll_fila_dscto > 0 then
					ll_monto_final	= ll_monto_cta - ld_monto
					ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
					dw_detalle_bl.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
					dw_detalle_bl.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
				end if
				dw_gastos_bl.SetItem(1, "Subtotal",this.GetItemNumber(1,"c_subtotal"))
				dw_gastos_bl.accepttext()
			end if
		elseif ls_tipo_cob_dscto='S' and ls_otro_dscto='130' and ld_monto > 0 then	//Descuento Interes Mantencion
//			ll_mora_mant			= dw_detalle_bl.getitemnumber(1,'mora')
			ll_mora_mant			= dw_gastos_bl.getitemnumber(1,'mora')	
			if ll_mora_mant > 0 then
				ll_fila_dscto			= dw_detalle_bl.Find("tipo_cob='V'", 1, this.rowcount())
				if ll_fila_dscto > 0 then
					ll_monto_final	= ll_mora_mant - ld_monto
					ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
					dw_detalle_bl.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
					dw_detalle_bl.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
				end if
				dw_gastos_bl.SetItem(1, "Subtotal",this.GetItemNumber(1,"c_subtotal"))
				dw_gastos_bl.accepttext()
			end if
		elseif ls_tipo_cob_dscto='S' and ls_otro_dscto='133' and ld_monto > 0 then	//Descuento gasto Cobranza Mantencion
			//ll_gasto_mant			= dw_detalle_bl.getitemnumber(1,'gasto_cob')
			ll_gasto_mant			= dw_gastos_bl.getitemnumber(1,'gastos_cob')
			if ll_gasto_mant > 0 then
				ll_fila_dscto			= dw_detalle_bl.Find("tipo_cob='X'", 1, this.rowcount())
				if ll_fila_dscto > 0 then
					ll_monto_final	= ll_gasto_mant - ld_monto
					ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
					dw_detalle_bl.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
					dw_detalle_bl.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
				end if
				dw_gastos_bl.SetItem(1, "Subtotal",this.GetItemNumber(1,"c_subtotal"))
				dw_gastos_bl.accepttext()
			end if
		end if
	end if
	
	ll_fila 			= dw_detalle_bl.Find("tipo_cob = 'E' or tipo_cob = 'F'", 1, dw_detalle_bl.RowCount())
	if ll_fila = 0 and dw_gastos_bl.rowcount() > 0 and dw_gastos_bl.getitemnumber(1,'mora') > 0 then
		dw_gastos_bl.setitem(1,'mora',0)
	end if
	if ll_fila = 0 and dw_gastos_bl.rowcount() > 0 and dw_gastos_bl.getitemnumber(1,'gastos_cob') > 0 then
		dw_gastos_bl.setitem(1,'gastos_cob',0)
	end if
	dw_gastos_bl.accepttext()
end if
end event

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

event itemfocuschanged;string	ls_tipo_cob
Double	ld_monto

ls_tipo_cob					= this.getitemstring(row,'tipo_cob')
//if gs_codigo_otro = "" then gs_codigo_otro = '0'
//if ls_tipo_cob = 'S' and gs_codigo_otro <> '0' then
//	wf_validar_descuento()
//end if
if il_fila_uf > 0 then
	if dw_detalle_bl.getitemstring(il_fila_uf,'moneda')='U' THEN
		ld_monto		= dw_detalle_bl.getitemnumber(il_fila_uf,'monto_uf')
		if ld_monto > 800 then
			dw_detalle_bl.SetItem(il_fila_uf, "monto", 0)
			dw_detalle_bl.SetItem(il_fila_uf, "monto_uf", 0)
			dw_detalle_bl.accepttext()
		end if
	end if
end if
end event

event losefocus;string	ls_tipo_cob
Double	ld_monto

ls_tipo_cob				= this.getitemstring(this.getrow(),'tipo_cob')
if gs_codigo_otro="" then gs_codigo_otro = '0'
if ls_tipo_cob = 'S' and gs_codigo_otro <> '0' then
	wf_validar_descuento()
end if

if il_fila_uf > 0 then
	if dw_detalle_bl.getitemstring(il_fila_uf,'moneda')='U' THEN
		ld_monto		= dw_detalle_bl.getitemnumber(il_fila_uf,'monto_uf')
		if ld_monto > 800 then
			dw_detalle_bl.SetItem(il_fila_uf, "monto", 0)
			dw_detalle_bl.SetItem(il_fila_uf, "monto_uf", 0)
			dw_detalle_bl.accepttext()
		end if
	end if
end if
//cb_repactar.setfocus()
end event

type dw_datos_bl from datawindow within w_boletas_cuotas
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 708
integer width = 1001
integer height = 996
integer taborder = 20
string dataobject = "d_datos_cuenta_bl_cto_isa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

type cb_bl_insertar from commandbutton within w_boletas_cuotas
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 1061
integer y = 684
integer width = 329
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Insertar"
end type

event clicked;long		fila,ll_indi,ll_tot_reg,ll_cantidad,ll_sw_pasa=0,ii_dmora,ii_mora_cobro,&
			ii_inc_gastos
String	ls_tipo_cob,ls_moneda
Double	id_valor_cuota,id_im,id_gc,ll_monto

ll_tot_reg		= dw_detalle_bl.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_tipo_cob	= dw_detalle_bl.getitemstring(ll_indi,'tipo_cob')
	ll_cantidad	= dw_detalle_bl.getitemnumber(ll_indi,'cantidad')
	ls_moneda	= dw_detalle_bl.getitemstring(ll_indi,'moneda')
	if ls_moneda='P' then
		ll_monto	= dw_detalle_bl.getitemnumber(ll_indi,'monto')
	else
		ll_monto	= dw_detalle_bl.getitemnumber(ll_indi,'monto_uf')
	end if
	if ls_tipo_cob='' or isnull(ls_tipo_cob) then
		messagebox("Advertencia","No es posible Insertar nuevo Item, en Fila Nº  "+string(ll_indi)+"  Tipo Cobro Inválido")
		dw_detalle_bl.setfocus()
		dw_detalle_bl.scrolltorow(ll_indi)
		dw_detalle_bl.setcolumn('tipo_cob')
		ll_indi		= ll_tot_reg
		ll_sw_pasa	= 1
	elseif ll_cantidad<=0 or isnull(ll_cantidad) then
		messagebox("Advertencia","No es posible Insertar nuevo Item, en Fila Nº  "+string(ll_indi)+"  Cantidad Inválido")
		dw_detalle_bl.setfocus()
		dw_detalle_bl.scrolltorow(ll_indi)
		dw_detalle_bl.setcolumn('cantidad')
		ll_indi		= ll_tot_reg
		ll_sw_pasa	= 1
	elseif (ll_monto<=0 or isnull(ll_monto)) then
		messagebox("Advertencia","No es posible Insertar nuevo Item, en Fila Nº  "+string(ll_indi)+"  Monto Inválido")
		dw_detalle_bl.setfocus()
		dw_detalle_bl.scrolltorow(ll_indi)
		dw_detalle_bl.setcolumn('monto')
		ll_indi		= ll_tot_reg
		ll_sw_pasa	= 1
	end if
next
IF ll_sw_pasa=0 THEN
	gl_n_cuotas_pag			= 0 
	fila							= dw_detalle_bl.InsertRow(0)
	dw_detalle_bl.scrolltorow(fila)
	dw_detalle_bl.SetItem(fila, "folio", 0)
	dw_detalle_bl.SetItem(1,"cuota_mantencion", dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"))
	dw_detalle_bl.SetItem(fila, "moneda",'P')
	IF fila = 1 THEN
	  IF gs_rezago <> "S" THEN	 
		id_valor_cuota			= Round(dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
		ii_dmora 				= dw_datos_bl.GetItemNumber(1,"c_dias_mora_mant")
	//	id_interes_gc			= double(dw_datos_bl.GetItemNumber(1,"tasa_gasto_cob_mora"))
		IF ii_dmora > 5 THEN 
			ii_mora_cobro		= ii_dmora 
			id_im 				= gf_int_mora(dw_datos_bl.GetItemNumber(1,"c_tasa"), ii_mora_cobro, id_valor_cuota)
			IF ii_dmora > 30 THEN 
				id_gc 			= Round(id_valor_cuota * id_interes_gc, 0) //005// PASA DE .1 A .05 10/1/2000
				ii_inc_gastos	= 1
			END IF
			
		ELSE
			id_gc 				= 0
			id_im 				= 0
			ii_mora_cobro 		= 0
			ii_inc_gastos 		= 0
		END IF
		dw_gastos_bl.InsertRow(0)
		dw_gastos_bl.SetItem(1,"gastos_cob", 0)//id_gc) // J 10%
		dw_gastos_bl.SetItem(1,"mora", 0)//id_im)
		dw_gastos_bl.SetItem(1,"incluir_gastos", ii_inc_gastos)
		dw_gastos_bl.SetItem(1,'incluir_gastos',1)
		dw_gastos_bl.accepttext()
		cb_bl_borrar_item.Enabled	= true
	  ELSE
		id_valor_cuota 		= 0
		ii_dmora 				= 0
		id_gc 					= 0
		id_im 					= 0
		ii_mora_cobro 			= 0
		ii_inc_gastos 			= 0
		dw_gastos_bl.InsertRow(0)
		dw_gastos_bl.SetItem(1,"gastos_cob", id_gc) // J 10%
		dw_gastos_bl.SetItem(1,"mora", id_im)
		dw_gastos_bl.SetItem(1,"incluir_gastos", ii_inc_gastos)
		dw_gastos_bl.SetItem(1,'incluir_gastos',1)
		dw_gastos_bl.accepttext()
		cb_bl_borrar_item.Enabled	= true
	  END IF
	END IF
end if
end event

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

type cb_bl_borrar_item from commandbutton within w_boletas_cuotas
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 1394
integer y = 684
integer width = 329
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "B&orrar Item"
end type

event clicked;String		ls_cob
Long		ll_tot_reg_dw,ll_fila

IF dw_detalle_bl.RowCount() > 0 Then
	ls_cob 							= dw_detalle_bl.getitemstring(dw_detalle_bl.getrow(),'tipo_cob')
	if (gs_base='O' and (ls_cob = 'D' or ls_cob = 'V' or ls_cob = 'X')) or (gs_base='C' and (ls_cob = 'D' or ls_cob = 'V' or ls_cob = 'X')) then
		messagebox("Advertencia","No es Posible Eliminar Item, recuerde debe Eliminar F-Cuota Mantención")
		dw_detalle_bl.setfocus()
	elseif ls_cob='F' then
		ll_tot_reg_dw			= dw_detalle_bl.rowcount()
		ll_fila						= dw_detalle_bl.Find("tipo_cob = 'D'",1, ll_tot_reg_dw)
		if ll_fila > 0 then
			dw_detalle_bl.DeleteRow(ll_fila)
		end if
		ll_tot_reg_dw			= dw_detalle_bl.rowcount()
		ll_fila						= dw_detalle_bl.Find("tipo_cob = 'V'",1, ll_tot_reg_dw)
		if ll_fila > 0 then
			dw_detalle_bl.DeleteRow(ll_fila)
		end if
		ll_tot_reg_dw			= dw_detalle_bl.rowcount()
		ll_fila						= dw_detalle_bl.Find("tipo_cob = 'X'",1, ll_tot_reg_dw)
		if ll_fila > 0 then
			dw_detalle_bl.DeleteRow(ll_fila)
		end if
		dw_detalle_bl.accepttext()
		if dw_detalle_bl.rowcount()=0 then
			cb_bl_borrar_item.Enabled= FALSE
			dw_gastos_bl.SetItem(1,"gastos_cob", 0)
			dw_gastos_bl.SetItem(1,"mora", 0)
			dw_gastos_bl.SetItem(1,"subtotal", 0)
			dw_gastos_bl.SetItem(1,'incluir_gastos',1)
			dw_gastos_bl.accepttext()
		end if
	elseif ls_cob='S' then
		ll_tot_reg_dw			= dw_detalle_bl.rowcount()
		ll_fila						= dw_detalle_bl.Find("tipo_cob = 'D'",1, ll_tot_reg_dw)
		if ll_fila > 0 then
			messagebox("Advertencia","Recuerde se Eliminarán Todos Los Items de Pagos")
			dw_detalle_bl.reset()	//DeleteRow(ll_fila)
		end if
		ll_tot_reg_dw			= dw_detalle_bl.rowcount()
		ll_fila						= dw_detalle_bl.Find("tipo_cob = 'V'",1, ll_tot_reg_dw)
		if ll_fila > 0 then
			messagebox("Advertencia","Recuerde se Eliminarán Todos Los Items de Pagos")
			dw_detalle_bl.reset()
		end if
		ll_tot_reg_dw			= dw_detalle_bl.rowcount()
		ll_fila						= dw_detalle_bl.Find("tipo_cob = 'X'",1, ll_tot_reg_dw)
		if ll_fila > 0 then
			messagebox("Advertencia","Recuerde se Eliminarán Todos Los Items de Pagos")
			dw_detalle_bl.reset()
		end if
		dw_detalle_bl.accepttext()
		if dw_detalle_bl.rowcount()=0 then
			cb_bl_borrar_item.Enabled= FALSE
			dw_gastos_bl.SetItem(1,"gastos_cob", 0)
			dw_gastos_bl.SetItem(1,"mora", 0)
			dw_gastos_bl.SetItem(1,"subtotal", 0)
			dw_gastos_bl.SetItem(1,'incluir_gastos',1)
			dw_gastos_bl.accepttext()
		end if
	else
		dw_detalle_bl.DeleteRow(dw_detalle_bl.GetRow())
		if dw_detalle_bl.rowcount()=0 then
			cb_bl_borrar_item.Enabled= FALSE
			dw_gastos_bl.SetItem(1,"gastos_cob", 0)
			dw_gastos_bl.SetItem(1,"mora", 0)
			dw_gastos_bl.SetItem(1,"subtotal", 0)
			dw_gastos_bl.SetItem(1,'incluir_gastos',1)
			dw_gastos_bl.accepttext()
		end if
	end if
else
	cb_bl_borrar_item.Enabled	= FALSE
	il_fila_uf							= 0
END IF
end event

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

type cb_bl_borrar from commandbutton within w_boletas_cuotas
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 2437
integer y = 684
integer width = 329
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Borrar"
end type

event clicked;//dw_bl_buscar_cliente.SetItem(1,"rs_a_paterno", "")
//dw_bl_buscar_cliente.SetItem(1,"rs_a_materno", "")
//dw_bl_buscar_cliente.SetItem(1,"rs_nombre", "")
//dw_bl_buscar_cliente.SetItem(1,"rn_contrato","") 
//dw_bl_buscar_cliente.SetItem(1,"rl_rut","")
//dw_bl_buscar_cliente.SetItem(1,"rs_bs","")
//cb_bl_insertar.Enabled 			= FALSE
//cb_bl_borrar_item.Enabled 		= FALSE
dw_detalle_bl.Reset()
dw_gastos_bl.Reset()
il_fila_uf		= 0
//dw_datos_bl.Reset()
//dw_bl_buscar_cliente.AcceptText()
//dw_encabezado_ingreso_cupon.Reset()
end event

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

type st_n_caja from statictext within w_boletas_cuotas
integer x = 3488
integer y = 300
integer width = 402
integer height = 84
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 16711680
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_boletas_cuotas
integer x = 3223
integer y = 300
integer width = 247
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Caja:"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_uf from statictext within w_boletas_cuotas
integer x = 2158
integer y = 40
integer width = 434
integer height = 84
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_boletas_cuotas
integer x = 1897
integer y = 36
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "U.F.:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_fecha from statictext within w_boletas_cuotas
integer x = 1120
integer y = 40
integer width = 430
integer height = 84
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_boletas_cuotas
integer x = 841
integer y = 36
integer width = 261
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_encabezado_ingreso_cupon from datawindow within w_boletas_cuotas
event ue_musemove pbm_mousemove
integer x = 155
integer y = 132
integer width = 2528
integer height = 300
integer taborder = 10
string dataobject = "d_encabezado_ingreso_cupon"
boolean border = false
boolean livescroll = true
end type

event ue_musemove;if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

type dw_gastos_bl from datawindow within w_boletas_cuotas
event ue_mousemove pbm_mousemove
integer x = 1111
integer y = 1280
integer width = 1687
integer height = 296
integer taborder = 110
string dataobject = "de_gastos_bl"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

type dw_abono from datawindow within w_boletas_cuotas
event ue_mousemove pbm_mousemove
integer x = 2085
integer y = 456
integer width = 544
integer height = 76
integer taborder = 50
string title = "none"
string dataobject = "dw_suma_monto_abono_por_ctto_ctacte"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_help_abono.visible	= false
end event

type dw_bl_buscar_cliente from datawindow within w_boletas_cuotas
event itemchanged pbm_dwnitemchange
event ue_mousemove pbm_mousemove
integer x = 128
integer y = 448
integer width = 2505
integer height = 196
string dataobject = "de_buscar_cliente"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	is_base, is_serie
long 		il_nenc, il_ndat, il_rut
integer	li_opcion
Double	il_numero
gs_tipo_cobro					= "BL"
gs_filtro 						= "cadena_codigo = 'O' OR cadena_codigo = 'C'"
dw_bl_buscar_cliente.AcceptText()
il_rut 							= long(dw_bl_buscar_cliente.GetItemString(1,"rl_rut"))
IF il_rut = 0 THEN
	IF dw_bl_buscar_cliente.GetItemString(1,"rn_contrato") = "" THEN
		gi_tipo_busqueda 		= 2
		gs_apellido_paterno	= dw_bl_buscar_cliente.GetItemString(1,"rs_a_paterno")
	ELSE 
		gi_numero 				= Double(dw_bl_buscar_cliente.GetItemString(1,"rn_contrato"))
		gi_tipo_busqueda		= 0
	END IF	
ELSE 
	gi_rut 						= long(dw_bl_buscar_cliente.GetItemString(1,"rl_rut"))
	gi_tipo_busqueda			= 1
END IF
Open(w_buscar_cliente)
IF gf_permitir_ingreso(gs_base, gs_serie, gi_numero) THEN
	gs_rezago 					= " "
	dw_bl_buscar_cliente.AcceptText()
END IF
IF gs_base <> ""	AND gs_serie <> "" AND gi_numero > 0 THEN
	il_nenc 						= dw_encabezado_ingreso_cupon.Retrieve(gs_base, gs_serie, gi_numero)
	IF il_nenc > 0 THEN 
		gi_rut 					= dw_encabezado_ingreso_cupon.GetItemNumber(1, "cliente_rut")
	ELSE
		gi_rut 					= 0
	END IF
	If gi_rut = 0 THEN
		gs_rezago 				= " "
		cb_bl_borrar.TriggerEvent(Clicked!)
		dw_bl_buscar_cliente.AcceptText()
		RETURN 0
	END IF
	CHOOSE CASE gs_base
		CASE "O"
			dw_datos_bl.DataObject	= 'd_datos_cuenta_bl_oferta'
		CASE "C"
			dw_datos_bl.DataObject	= 'd_datos_cuenta_bl_cto_isa'
	END CHOOSE
	dw_datos_bl.SetTransObject(SQLCA)
	il_ndat 								= dw_datos_bl.Retrieve(gs_serie,gi_numero,gs_base)
	IF  il_nenc > 0 THEN
		dw_bl_buscar_cliente.SetItem(1,"rs_a_paterno", dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_paterno"))
		dw_bl_buscar_cliente.SetItem(1,"rs_a_materno", dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_materno"))
		dw_bl_buscar_cliente.SetItem(1,"rs_nombre", dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_nombre"))
		dw_bl_buscar_cliente.SetItem(1,"rn_contrato",String(gi_numero)) 
		dw_bl_buscar_cliente.SetItem(1,"rl_rut",String(dw_encabezado_ingreso_cupon.GetItemNumber(1, "cliente_rut")))
		dw_bl_buscar_cliente.SetItem(1,"rs_bs",(gs_base+gs_serie))
		gs_nombre_completo 			= dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_nombre") + " "+ dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_paterno") + " " + dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_materno") 
		gs_rezago 						= " "
	ELSE
		MessageBox("Ingreso de Boletas", "No se encontró información asociada a ese número de documento.")
		cb_bl_borrar.TriggerEvent(Clicked!)
	END IF	
ELSE
	IF Long(dw_bl_buscar_cliente.GetItemString(1,"rl_rut")) > 0 THEN 
		//No se encuentra el cliente, preguntar si desea ingresar rezago
		li_opcion						= MessageBox("Ingreso de Boletas", "No se encontró el Cliente o el contrato no ha sido ingresado, desea ingresar Boleta en rezago ?", Exclamation!, YesNo!, 2)
		IF li_opcion = 1 THEN
			gs_rezago 					= "S"
			gs_base 						= "O"
			gs_serie 					= "I"
			gi_numero 					= 0
			gi_rut 						= long(dw_bl_buscar_cliente.GetItemString(1,"rl_rut"))
		ELSE
			gs_rezago 					= " "
			cb_bl_borrar.TriggerEvent(Clicked!)
			dw_bl_buscar_cliente.AcceptText()
		END IF
	ELSE
		cb_bl_borrar.TriggerEvent(Clicked!)
	END IF
END IF
end event

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

