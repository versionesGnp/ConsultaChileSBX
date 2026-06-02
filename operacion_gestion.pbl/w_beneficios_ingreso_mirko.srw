forward
global type w_beneficios_ingreso_mirko from window
end type
type cb_2 from commandbutton within w_beneficios_ingreso_mirko
end type
type cb_1 from commandbutton within w_beneficios_ingreso_mirko
end type
type st_monto_pagado from statictext within w_beneficios_ingreso_mirko
end type
type sle_pie from statictext within w_beneficios_ingreso_mirko
end type
type sle_moneda from statictext within w_beneficios_ingreso_mirko
end type
type sle_numero from statictext within w_beneficios_ingreso_mirko
end type
type sle_serie from statictext within w_beneficios_ingreso_mirko
end type
type sle_base from statictext within w_beneficios_ingreso_mirko
end type
type st_3 from statictext within w_beneficios_ingreso_mirko
end type
type dw_ingreso from datawindow within w_beneficios_ingreso_mirko
end type
type dw_beneficios_seleccionados from datawindow within w_beneficios_ingreso_mirko
end type
type st_pie from statictext within w_beneficios_ingreso_mirko
end type
type st_1 from statictext within w_beneficios_ingreso_mirko
end type
type cb_grabar from commandbutton within w_beneficios_ingreso_mirko
end type
type cb_cerrar from commandbutton within w_beneficios_ingreso_mirko
end type
type dw_lista_beneficios from datawindow within w_beneficios_ingreso_mirko
end type
type gb_1 from groupbox within w_beneficios_ingreso_mirko
end type
end forward

global type w_beneficios_ingreso_mirko from window
integer width = 2839
integer height = 2384
boolean titlebar = true
string title = "Ingreso Beneficios"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
st_monto_pagado st_monto_pagado
sle_pie sle_pie
sle_moneda sle_moneda
sle_numero sle_numero
sle_serie sle_serie
sle_base sle_base
st_3 st_3
dw_ingreso dw_ingreso
dw_beneficios_seleccionados dw_beneficios_seleccionados
st_pie st_pie
st_1 st_1
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_lista_beneficios dw_lista_beneficios
gb_1 gb_1
end type
global w_beneficios_ingreso_mirko w_beneficios_ingreso_mirko

type variables
string		is_base,is_serie,is_modif
long		il_corr,il_cod_convenio
Real		il_pie
Double	il_numero
end variables

forward prototypes
public subroutine wf_cargar_lista (integer al_cod_benef, integer al_cod_benef_det, integer al_est_reg)
end prototypes

public subroutine wf_cargar_lista (integer al_cod_benef, integer al_cod_benef_det, integer al_est_reg);string	ls_columna,ls_descrip
long	ll_tot_reg,ll_indi,ll_new

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA"   WHERE "TASA"."LOOK" = 1   ;
il_corr							= il_corr + 1
ll_new							= dw_ingreso.insertrow(0)
dw_ingreso.setitem(ll_new,'correlativo',il_corr)
dw_ingreso.setitem(ll_new,'cod_beneficio',al_cod_benef)
dw_ingreso.setitem(ll_new,'cod_benef_detalle',al_cod_benef_det)
SELECT		"BENEFICIOS_COMPLEMENTARIO_DET"."DESCRIPCION"  
INTO 			:ls_descrip  
FROM 		"BENEFICIOS_COMPLEMENTARIO_DET"  
WHERE 	  ( "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" = :al_cod_benef ) AND  
			  ( "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" = :al_cod_benef_det )
USING		sqlca;
if sqlca.sqlcode=0 then
	dw_ingreso.setitem(ll_new,'beneficios_complementario_det_descripcion',ls_descrip)
end if
dw_ingreso.setitem(ll_new,'estado','P')
dw_ingreso.setitem(ll_new,'fecha_creacion',gdt_fec_sistema)
dw_ingreso.setitem(ll_new,'base',is_base)
dw_ingreso.setitem(ll_new,'serie',is_serie)
dw_ingreso.setitem(ll_new,'numero',il_numero)
dw_ingreso.setitem(ll_new,'usuario',gs_user)
dw_ingreso.setitem(ll_new,'tipo_promocion_asociados_pie_pactado',il_pie)
if il_cod_convenio > 0 then
	dw_ingreso.setitem(ll_new,'tipo_promocion_asociados_cod_convenio',il_cod_convenio)
end if	
dw_ingreso.accepttext()

end subroutine

on w_beneficios_ingreso_mirko.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_monto_pagado=create st_monto_pagado
this.sle_pie=create sle_pie
this.sle_moneda=create sle_moneda
this.sle_numero=create sle_numero
this.sle_serie=create sle_serie
this.sle_base=create sle_base
this.st_3=create st_3
this.dw_ingreso=create dw_ingreso
this.dw_beneficios_seleccionados=create dw_beneficios_seleccionados
this.st_pie=create st_pie
this.st_1=create st_1
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_lista_beneficios=create dw_lista_beneficios
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_monto_pagado,&
this.sle_pie,&
this.sle_moneda,&
this.sle_numero,&
this.sle_serie,&
this.sle_base,&
this.st_3,&
this.dw_ingreso,&
this.dw_beneficios_seleccionados,&
this.st_pie,&
this.st_1,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_lista_beneficios,&
this.gb_1}
end on

on w_beneficios_ingreso_mirko.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_monto_pagado)
destroy(this.sle_pie)
destroy(this.sle_moneda)
destroy(this.sle_numero)
destroy(this.sle_serie)
destroy(this.sle_base)
destroy(this.st_3)
destroy(this.dw_ingreso)
destroy(this.dw_beneficios_seleccionados)
destroy(this.st_pie)
destroy(this.st_1)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_lista_beneficios)
destroy(this.gb_1)
end on

event open;string		ls_estado,ls_moneda,ls_texto,ls_caja,ls_base,ls_serie,ls_user,ls_tipo_cob,ls_user_mod,ls_convenio,ls_descrip,ls_moneda_pie_pac,ls_seg_mant='N',&
			ls_descrip_benef
long		ll_rut,ll_indi,ll_tot_reg,ll_cod,ll_cod_det,ll_fila,ll_codigo,ll_folio,ll_corr,ll_new,ll_cod_benef,ll_cod_benef_d,ll_parque,ll_regis,ll_sum_monto,&
			ll_tot_reg_ben,ll_corre,ll_cod_ben,ll_cod_ben_det,ll_numero,ll_count_filas,ll_fila_activo,ll_cod_benef_ofv,ll_ret,ll_ret2,ll_pie_pac,&
			ll_max,ll_cod_benef_det,ll_est_reg,ll_cod_ori
Double	ll_uf_dia,ll_porce,ll_precio,ll_cuota,ll_precio_aux,ll_pie_aux,ll_pie_guard,ll_pie_pactado,ll_sum_rezg,ll_sum_ingre,ll_monto_pie_pac
datetime	ldt_fecha_crea,ldt_fec_uso,ldt_fec_mod

gf_centrar(w_beneficios_ingreso)
dw_lista_beneficios.settransobject(sqlca)
dw_ingreso.settransobject(sqlca)
dw_ingreso.getchild('cod_beneficio',idw_detalle)	
idw_detalle.settransobject(sqlca)
is_base					= trim(substr(1,1,Message.StringParm))
is_serie					= trim(substr(1,2,Message.StringParm))
il_numero				= Double(substr(1,3,Message.StringParm))
il_pie						= Double(substr(1,4,Message.StringParm))
ll_codigo					= long(substr(1,5,Message.StringParm))
ls_moneda				= trim(substr(1,6,Message.StringParm))
ls_convenio				= trim(substr(1,7,Message.StringParm))
il_cod_convenio		= long(substr(1,8,Message.StringParm))

ll_cod_benef_ofv		= w_ingresar_oferta.dw_oferta_v.getitemnumber(1,'oferta_v_beneficio_complementario')
if idw_detalle.retrieve(ll_cod_benef_ofv,gl_cod_parque)=0 then			
	idw_detalle.insertrow(0)
end if
dw_ingreso.getchild('cod_benef_detalle',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve(ll_codigo)=0 then //4
	idw_detalle2.insertrow(0)
end if		
if ls_moneda='1' then
	sle_moneda.text	= '$'
	sle_pie.text			= string(il_pie,'###,###,###,##0')
elseif ls_moneda='2' then
	sle_moneda.text	= 'UF'
	sle_pie.text			= string(il_pie,'###,###,###,##0.0###')
end if	
sle_base.text			= is_base
sle_serie.text			= is_serie
sle_numero.text		= string(il_numero,'###,###,###,##0')
ll_precio					= w_ingresar_oferta.dw_oferta_v.getitemnumber(1,'pago_oferta_precio')
ll_cuota					= w_ingresar_oferta.dw_oferta_v.getitemnumber(1,'pago_oferta_valor_cuota')
ll_uf_dia					= ROUND(w_ingresar_oferta.dw_oferta_v.getitemnumber(1,'pago_oferta_uf_dia'),4)
ll_parque					= w_ingresar_oferta.dw_oferta_v.getitemnumber(1,'cadena_cod_parque')
ll_tot_reg_ben			= dw_lista_beneficios.retrieve(ll_codigo,ll_parque)
ll_tot_reg				= dw_ingreso.retrieve(is_base,is_serie,il_numero)
if ll_tot_reg > 0 then
	ll_cod_ori			= dw_ingreso.getitemnumber(1,'cod_beneficio')
	SELECT DISTINCT "BENEFICIOS_COMPLEMENTARIO"."DESCRIPCION"  
	INTO 		:ls_descrip_benef  
	FROM 	"BENEFICIOS_COMPLEMENTARIO"  
	WHERE 	"BENEFICIOS_COMPLEMENTARIO"."CODIGO" = :ll_cod_ori   ;
	if il_cod_convenio <> ll_cod_ori then
		messagebox("Advertencia","Recuerde Se Eliminaran los Beneficios Anteriores "+String(ll_cod_ori)+'-'+ls_descrip_benef +", que se encuentren en Estado P-PENDIENTE")
		for ll_indi = ll_tot_reg to 1 step -1
			ls_estado	= dw_ingreso.getitemstring(ll_indi,'estado')
			if ls_estado = 'P' then
				dw_ingreso.deleterow(ll_indi)
			end if
		next
		dw_ingreso.accepttext()
		//ll_tot_reg		= 0
	end if 
end if
if ls_convenio = '13'  or ls_convenio = '15' then 
	ls_seg_mant = 'S'
end if	
if ll_tot_reg = 0 then
	if ll_codigo = 4 then
	//	SELECT 	"PAGO_OFERTA"."CTAS_PACTADAS_PIE"  
	//	INTO 		:ll_pie_pac  
	//	FROM 	"OFERTA_V","PAGO_OFERTA"  
	//	WHERE 	"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
	//				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
	//				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
	//				"OFERTA_V"."SERIE" = :is_serie AND  
	//				"OFERTA_V"."NRO_OFERTA" = :il_numero   AND
	//				"OFERTA_V"."BASE" = 'O'
	//	USING	sqlca;
	//	if ll_pie_pac	> 0 then
	//		SELECT 	sum("DETALLE_PAGO_PIE"."MONTO_CUOTA")
	//		INTO 		:ll_monto_pie_pac 
	//		FROM 	"DETALLE_PAGO_PIE"  
	//		WHERE 	"DETALLE_PAGO_PIE"."BASE" = :is_base AND  
	//					"DETALLE_PAGO_PIE"."SERIE" = :is_serie AND  
	//					"DETALLE_PAGO_PIE"."NUMERO" = :il_numero
	//		USING	sqlca;
	//		
	//		SELECT DISTINCT	"DETALLE_PAGO_PIE"."MONEDA"  
	//		INTO 		:ls_moneda_pie_pac  
	//		FROM 	"DETALLE_PAGO_PIE"  
	//		WHERE 	"DETALLE_PAGO_PIE"."BASE" = :is_base AND  
	//					"DETALLE_PAGO_PIE"."SERIE" = :is_serie AND  
	//					"DETALLE_PAGO_PIE"."NUMERO" = :il_numero
	//		USING	sqlca;
	//		if ls_moneda_pie_pac = '2' then
	//			ll_monto_pie_pac		=	round(ll_monto_pie_pac * ll_uf_dia,0)
	//		end if
	//	else
	//		ll_monto_pie_pac	= 0
	//	end if	
	//
		SELECT	SUM("INGRESO"."MONTO")
		INTO 		:ll_sum_rezg  
		FROM 	"CLIENTE_REZAGO",   
					"INGRESO"  
		WHERE 	( "CLIENTE_REZAGO"."FOLIO" = "INGRESO"."FOLIO" ) and  
					( "CLIENTE_REZAGO"."COD_PAGO" = "INGRESO"."TIPO_COB" ) and  
					( "CLIENTE_REZAGO"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
					( ( "CLIENTE_REZAGO"."BASE" = :is_base ) AND  
					( "CLIENTE_REZAGO"."SERIE" = :is_serie ) AND  
					( "CLIENTE_REZAGO"."NUMERO" = :il_numero ) AND  
					( "INGRESO"."REZAGO" = 'S' ) AND  
					("INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'Q' OR "INGRESO"."TIPO_MOV" = 'U') )   
		USING	sqlca;
	
		SELECT 	SUM("INGRESO"."MONTO")  
		INTO 		:ll_sum_ingre  
		FROM 	"INGRESO"  
		WHERE 	(( "INGRESO"."SERIE" = :is_serie ) AND  
					( "INGRESO"."CONTRATO" = :il_numero ) AND  
					( "INGRESO"."REZAGO" = ' ' ) AND  
					( "INGRESO"."BASE" = :is_base ) AND
					("INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'Q' OR "INGRESO"."TIPO_MOV" = 'U') ) 
		USING	sqlca;
	
		if isnull(ll_sum_ingre) then ll_sum_ingre = 0
		if isnull(ll_sum_rezg) then ll_sum_rezg = 0
		ll_sum_monto					= ll_sum_rezg + ll_sum_ingre //+ ll_monto_pie_pac
		
		if ll_sum_monto > 0 then
			st_monto_pagado.text	= string(ll_sum_monto,'###,###,###,###,##0')
			if ll_precio 					= ll_cuota then
				ll_porce 					= 100
				il_pie						= ll_precio
			else	
				if ls_moneda='1' then
					ll_porce				= round((ll_sum_monto * 100) / ll_precio,2)
				elseif ls_moneda='2' then
					ll_precio_aux		= ll_precio
					ll_pie_aux			= round(ll_sum_monto / ll_uf_dia,2)
					ll_porce				= round((ll_pie_aux * 100) / ll_precio_aux,2)
				end if
			end if
			DECLARE		x1 CURSOR FOR  
			SELECT 		"TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO",   
							"TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE"  
			FROM 		"TIPO_PROMOCION_ASOCIADOS"  
			WHERE 	  ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
						  ( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
						  ( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero )   AND 
						  (( "TIPO_PROMOCION_ASOCIADOS"."ESTADO" = 'P' ) OR
						  ( "TIPO_PROMOCION_ASOCIADOS"."ESTADO" = 'G' ))
			USING		sqlca;
			if sqlca.sqlcode=0 then
				open x1;
				do while sqlca.sqlcode=0
					fetch x1 into :ll_cod, :ll_cod_det;
					if not isnull(ll_cod) then
						ls_texto			= "beneficios_complementario_codigo = "+string(ll_cod) +" and beneficios_complementario_det_codigo_beneficio = "+string(ll_cod_det)
						if ll_porce < 3 then
							for ll_fila = 2 to ll_tot_reg_ben
								if ll_fila > 0 then
									dw_lista_beneficios.setitem(ll_fila,'estado_reg',1)
								end if
								if ll_fila = 5 or ll_fila = 7 then
									if ls_seg_mant = 'S' then dw_lista_beneficios.setitem(ll_fila,'estado_reg',0)
								end if	
							next
						elseif ll_porce >= 3 and ll_porce < 5 then
							for ll_fila = 4 to ll_tot_reg_ben
								if ll_fila > 0 then
									dw_lista_beneficios.setitem(ll_fila,'estado_reg',1)
								end if
								if ll_fila = 5 or ll_fila = 7 then
									if ls_seg_mant = 'S' then dw_lista_beneficios.setitem(ll_fila,'estado_reg',0)
								end if	
							next	
						elseif ll_porce >= 5 and ll_porce < 10 then
							if ll_parque <> 102 then
								for ll_fila = 4 to ll_tot_reg_ben
									if ll_fila > 0 then
										dw_lista_beneficios.setitem(ll_fila,'estado_reg',1)
									end if
									if ll_fila = 5 or ll_fila = 7 then
										if ls_seg_mant = 'S' then dw_lista_beneficios.setitem(ll_fila,'estado_reg',0)
									end if	
								next
							else
								for ll_fila = 5 to ll_tot_reg_ben
									if ll_fila > 0 then
										dw_lista_beneficios.setitem(ll_fila,'estado_reg',1)
									end if
									if ll_fila = 5 or ll_fila = 7 then
										if ls_seg_mant = 'S' then dw_lista_beneficios.setitem(ll_fila,'estado_reg',0)
									end if	
								next		
							end if	
						elseif ll_porce >= 10 then
							if ll_parque <> 102 then
								for ll_fila = 4 to ll_tot_reg_ben
									if ll_fila > 0 then
										dw_lista_beneficios.setitem(ll_fila,'estado_reg',0)
									end if
									if ll_fila = 4 then dw_lista_beneficios.setitem(ll_fila,'estado_reg',1)
									if ll_fila = 7 then 
										dw_lista_beneficios.setitem(ll_fila,'estado_reg',1)
										if ls_seg_mant = 'S' then dw_lista_beneficios.setitem(ll_fila,'estado_reg',0)
									end if	
								next
							else
								for ll_fila = 6 to ll_tot_reg_ben
									if ll_fila > 0 then
										dw_lista_beneficios.setitem(ll_fila,'estado_reg',0)
									end if
									if ll_fila = 7 then dw_lista_beneficios.setitem(ll_fila,'estado_reg',1)
									if ls_seg_mant = 'S' then dw_lista_beneficios.setitem(ll_fila,'estado_reg',0)
								next
							end if					
						end if	
					end if
					Setnull(ll_cod)
				loop
				close x1;
			end if
			dw_lista_beneficios.accepttext()
	
			SELECT 	MAX("TIPO_PROMOCION_ASOCIADOS"."CORRELATIVO" )
			INTO 		:ll_corr  
			FROM 	"TIPO_PROMOCION_ASOCIADOS"
			WHERE	( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
						( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
						( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero )
			USING 	sqlca;
			if isnull(ll_corr) or ll_corr=0 then
				ll_corr						= 0
			end if
			ll_tot_reg						= dw_lista_beneficios.rowcount()
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					ll_regis					= dw_lista_beneficios.getitemnumber(ll_indi,"estado_reg")
					if ll_regis	= 0 then
						ll_cod_benef		= dw_lista_beneficios.getitemnumber(ll_indi,'beneficios_complementario_codigo')
						ll_cod_benef_d		= dw_lista_beneficios.getitemnumber(ll_indi,'beneficios_complementario_det_codigo_beneficio')
						ll_fila					= dw_ingreso.Find("cod_beneficio = "+string(ll_cod_benef) +" and cod_benef_detalle = "+string(ll_cod_benef_d),1,ll_tot_reg)
						if ll_fila > 0 then
							dw_ingreso.setitem(ll_fila,'estado','P')
						else
							ll_corr			= ll_corr + 1
							ll_new			= dw_ingreso.insertrow(0)
							dw_ingreso.setitem(ll_new,'correlativo',ll_corr)
							dw_ingreso.setitem(ll_new,'cod_beneficio',ll_cod_benef)
							dw_ingreso.setitem(ll_new,'cod_benef_detalle',ll_cod_benef_d)
							dw_ingreso.setitem(ll_new,'estado','P')
							dw_ingreso.setitem(ll_new,'fecha_creacion',gdt_fec_sistema)
							dw_ingreso.setitem(ll_new,'base',is_base)
							dw_ingreso.setitem(ll_new,'serie',is_serie)
							dw_ingreso.setitem(ll_new,'numero',il_numero)
							dw_ingreso.setitem(ll_new,'usuario',gs_user)
							dw_ingreso.setitem(ll_new,'tipo_promocion_asociados_pie_pactado',il_pie)
							SELECT		"BENEFICIOS_COMPLEMENTARIO_DET"."DESCRIPCION"  
							INTO 			:ls_descrip  
							FROM 		"BENEFICIOS_COMPLEMENTARIO_DET"  
							WHERE 	  ( "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" = :ll_cod_benef ) AND  
										  ( "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" = :ll_cod_benef_d )
							USING		sqlca;
							if sqlca.sqlcode=0 then
								dw_ingreso.setitem(ll_new,'beneficios_complementario_det_descripcion',ls_descrip)
							end if
							dw_ingreso.accepttext()
						end if
					end if
				next
				dw_ingreso.accepttext()
			else
				messagebox('Advertencia','Debe Agregar Beneficio')
			end if
			ll_count_filas				= dw_lista_beneficios.rowcount()
	//		for ll_indi=1 to ll_count_filas
	//			dw_lista_beneficios.setitem(ll_indi,'sw_convenio',ls_convenio)
	//		next
			ll_fila_activo					= dw_lista_beneficios.Find("estado_reg = 0",1,ll_tot_reg)
			if ll_fila_activo > 0 then
				cb_grabar.enabled		= true
				is_modif		= 'S'
			else
				cb_grabar.enabled		= false
			end if
			dw_lista_beneficios.accepttext()
		else
			messagebox('Advertencia','Sin Ingreso a Caja')
			close(w_beneficios_ingreso)
		end if
	elseif ll_codigo = 6 then
		ll_tot_reg				= dw_lista_beneficios.rowcount()
		for ll_indi=1 to ll_tot_reg
			dw_lista_beneficios.setitem(ll_indi,'estado_reg',1)
		next
		SELECT MAX("CONVENIO_RETIRO_DET"."COD_BENEFICIO_DET")
		INTO	:ll_max  
		FROM 	"CONVENIO_RETIRO_DET"  
		WHERE ( "CONVENIO_RETIRO_DET"."COD_CONVENIO" = :il_cod_convenio ) AND  
				  ( "CONVENIO_RETIRO_DET"."COD_BENEFICIO" = :ll_codigo )   
		USING sqlca;
		for ll_indi= 1 to ll_max
			SELECT 	count("CONVENIO_RETIRO_DET"."COD_BENEFICIO_DET")
			INTO 		:ll_cod_benef_det  
			FROM 	"CONVENIO_RETIRO_DET"  
			WHERE 	"CONVENIO_RETIRO_DET"."COD_CONVENIO" = :il_cod_convenio AND  
						"CONVENIO_RETIRO_DET"."COD_BENEFICIO" = :ll_codigo AND
						"CONVENIO_RETIRO_DET"."COD_BENEFICIO_DET"  = :ll_indi
			USING	sqlca;
			if ll_cod_benef_det <> 0 then
				dw_lista_beneficios.setitem(ll_indi,'estado_reg',0)
			end if
		next	
		for	ll_indi=1 to ll_tot_reg
			ll_cod_benef					= dw_lista_beneficios.getitemnumber(ll_indi,'beneficios_complementario_codigo')
			ll_cod_benef_det				= dw_lista_beneficios.getitemnumber(ll_indi,'beneficios_complementario_det_codigo_beneficio')
			ll_est_reg						= dw_lista_beneficios.getitemnumber(ll_indi,'estado_reg')
			if ll_est_reg=0 then
				wf_cargar_lista(ll_cod_benef,ll_cod_benef_det,ll_est_reg)
			end if
			setnull(ll_est_reg);
		next
		ll_fila_activo					= dw_lista_beneficios.Find("estado_reg = 0",1,ll_tot_reg)
		if ll_fila_activo > 0 then
			cb_grabar.enabled		= true
			is_modif		= 'S'
		else
			cb_grabar.enabled		= false
		end if
		dw_lista_beneficios.accepttext()
	else
		ll_tot_reg				= dw_lista_beneficios.rowcount()
//		for ll_indi=1 to ll_tot_reg
//			dw_lista_beneficios.setitem(ll_indi,'estado_reg',1)
//		next
		for ll_indi= 1 to ll_tot_reg
			ll_cod_benef					= dw_lista_beneficios.getitemnumber(ll_indi,'beneficios_complementario_codigo')
			ll_cod_benef_det				= dw_lista_beneficios.getitemnumber(ll_indi,'beneficios_complementario_det_codigo_beneficio')
			ll_est_reg						= dw_lista_beneficios.getitemnumber(ll_indi,'estado_reg')
			if ll_est_reg=0 then
				wf_cargar_lista(ll_cod_benef,ll_cod_benef_det,ll_est_reg)
			end if
			setnull(ll_est_reg);
		next
		ll_fila_activo					= dw_lista_beneficios.Find("estado_reg = 0",1,ll_tot_reg)
		if ll_fila_activo > 0 then
			cb_grabar.enabled		= true
			is_modif		= 'S'
		else
			cb_grabar.enabled		= false
		end if
		dw_lista_beneficios.accepttext()
	end if	
else
	ll_tot_reg				= dw_ingreso.retrieve(is_base,is_serie,il_numero)
	for ll_indi=1 to ll_tot_reg_ben
		dw_lista_beneficios.setitem(ll_indi,'estado_reg',1)
	next
	dw_lista_beneficios.accepttext()
	SELECT		SUM("INGRESO"."MONTO")
	INTO 			:ll_sum_rezg  
	FROM 		"CLIENTE_REZAGO",   
					"INGRESO"  
	WHERE 	  ( "CLIENTE_REZAGO"."FOLIO" = "INGRESO"."FOLIO" ) and  
				  ( "CLIENTE_REZAGO"."COD_PAGO" = "INGRESO"."TIPO_COB" ) and  
				  ( "CLIENTE_REZAGO"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
				  ( ( "CLIENTE_REZAGO"."BASE" = :is_base ) AND  
				  ( "CLIENTE_REZAGO"."SERIE" = :is_serie ) AND  
				  ( "CLIENTE_REZAGO"."NUMERO" = :il_numero ) AND  
				  ( "INGRESO"."REZAGO" = 'S' ) AND  
				  ("INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'Q' OR "INGRESO"."TIPO_MOV" = 'U') )   
	USING		sqlca;
	SELECT 	SUM("INGRESO"."MONTO")  
	INTO 		:ll_sum_ingre  
	FROM 	"INGRESO"  
	WHERE 	(( "INGRESO"."SERIE" = :is_serie ) AND  
				( "INGRESO"."CONTRATO" = :il_numero ) AND  
				( "INGRESO"."REZAGO" = ' ' ) AND  
				( "INGRESO"."BASE" = :is_base ) AND
				("INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'Q' OR "INGRESO"."TIPO_MOV" = 'U') ) 
	USING	sqlca;
	if isnull(ll_sum_ingre) then ll_sum_ingre = 0
	if isnull(ll_sum_rezg) then ll_sum_rezg = 0
	ll_sum_monto			= ll_sum_rezg + ll_sum_ingre
	if ll_sum_monto > 0 then
		st_monto_pagado.text	= string(ll_sum_monto,'###,###,###,###,##0')
	else
		st_monto_pagado.text	= '0'
	end if
	for ll_indi=1 to ll_tot_reg
		ll_cod_benef					= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
		ll_cod_benef_d					= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
		if ll_cod_benef > 0 and ll_cod_benef_d > 0 then
			ll_fila							= dw_lista_beneficios.Find("beneficios_complementario_codigo = "+string(ll_cod_benef) +" and beneficios_complementario_det_codigo_beneficio = "+string(ll_cod_benef_d),1,ll_tot_reg_ben)
			if ll_fila > 0 then
				dw_lista_beneficios.setitem(ll_fila,'estado_reg',0)
			end if
		end if
	next
	messagebox('Advertencia','Contrato Ya Tiene Beneficios')
	dw_lista_beneficios.accepttext()	
end if
end event

type cb_2 from commandbutton within w_beneficios_ingreso_mirko
integer x = 773
integer y = 2160
integer width = 288
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar"
end type

event clicked;long 		ll_tot_reg,ll_fila,ll_indi,ll_corr,ll_cod_beneficio,ll_cod_det
Double	ll_numero
String		ls_pasa='S',ls_descrip,ls_base,ls_serie,ls_estado,ls_user_modif,ls_user_crea
datetime	ldt_fec_modif,ldt_fec_sistema

setnull(ll_fila)
ll_tot_reg		= dw_ingreso.rowcount()
if ll_tot_reg > 0 then
	ll_fila			=dw_ingreso.getrow()
	if ll_fila > 0 then
//		il_count 						= il_count -1
		dw_ingreso.deleterow(ll_fila)
		ll_tot_reg					= dw_ingreso.rowcount()
	//	il_count++			
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				ll_corr				= dw_ingreso.getitemnumber(ll_indi,'correlativo')
				ll_cod_beneficio	= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
				ll_cod_det			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
				ls_descrip			= dw_ingreso.getitemstring(ll_indi,'beneficios_complementario_det_descripcion')
				ls_base				= dw_ingreso.getitemstring(ll_indi,'base')
				ls_serie				= dw_ingreso.getitemstring(ll_indi,'serie')
				ll_numero			= dw_ingreso.getitemnumber(ll_indi,'numero')
				ls_estado			= dw_ingreso.getitemstring(ll_indi,'estado')
				ls_user_crea		= dw_ingreso.getitemstring(ll_indi,'usuario')
				ldt_fec_sistema		= dw_ingreso.getitemdatetime(ll_indi,'fecha_creacion')
				if isnull(ll_corr) then
					messagebox("Advertencia","Debe Ingresar Correlativo en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ll_cod_beneficio) then
					messagebox("Advertencia","Debe Ingresar Codigo Beneficio en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ll_cod_det) then
					messagebox("Advertencia","Debe Ingresar Codigo Beneficio Detalle en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ls_descrip) then
					messagebox("Advertencia","Debe Ingresar Descripción Beneficio en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ls_base) then
					messagebox("Advertencia","Debe Ingresar Base en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ls_serie) then
					messagebox("Advertencia","Debe Ingresar Serie en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ll_numero) then
					messagebox("Advertencia","Debe Ingresar Número en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ls_estado) then
					messagebox("Advertencia","Debe Ingresar Estado en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ls_user_crea) then
					messagebox("Advertencia","Debe Ingresar Usuario Crea en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ldt_fec_sistema) then
					messagebox("Advertencia","Debe Ingresar Fecha Crea en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				end if
			next
			if ls_pasa='S' then	
				cb_grabar.enabled		= true
			end if
		end if
	else
		messagebox('Advertencia','No ha Seleccionado Fila')
	end if	
else
	cb_grabar.enabled		= false
end if
end event

type cb_1 from commandbutton within w_beneficios_ingreso_mirko
integer x = 439
integer y = 2160
integer width = 288
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Agregar"
end type

event clicked;string 	ls_estado,ls_base,ls_serie,ls_user_modif,ls_user_crea,ls_pasa,ls_descrip
long		ll_cod_beneficio,ll_cod_beneficio_d,ll_tot_reg,ll_row,ll_corr,ll_indi,ll_cod_det
Double	ll_numero
datetime	ldt_fec_modif,ldt_fec_sistema

ll_tot_reg		= dw_ingreso.rowcount()
ls_pasa='S'
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ll_corr				= dw_ingreso.getitemnumber(ll_indi,'correlativo')
		ll_cod_beneficio	= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
		ll_cod_det			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
		ls_descrip			= dw_ingreso.getitemstring(ll_indi,'beneficios_complementario_det_descripcion')
		ls_base				= dw_ingreso.getitemstring(ll_indi,'base')
		ls_serie				= dw_ingreso.getitemstring(ll_indi,'serie')
		ll_numero			= dw_ingreso.getitemnumber(ll_indi,'numero')
		ls_estado			= dw_ingreso.getitemstring(ll_indi,'estado')
		ls_user_crea		= dw_ingreso.getitemstring(ll_indi,'usuario')
		ldt_fec_sistema		= dw_ingreso.getitemdatetime(ll_indi,'fecha_creacion')
		if isnull(ll_corr) then
			messagebox("Advertencia","Debe Ingresar Correlativo en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ll_cod_beneficio) then
			messagebox("Advertencia","Debe Ingresar Codigo Beneficio en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ll_cod_det) then
			messagebox("Advertencia","Debe Ingresar Codigo Beneficio Detalle en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ls_descrip) then
			messagebox("Advertencia","Debe Ingresar Descripción Beneficio en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ls_base) then
			messagebox("Advertencia","Debe Ingresar Base en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ls_serie) then
			messagebox("Advertencia","Debe Ingresar Serie en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ll_numero) then
			messagebox("Advertencia","Debe Ingresar Número en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ls_estado) then
			messagebox("Advertencia","Debe Ingresar Estado en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ls_user_crea) then
			messagebox("Advertencia","Debe Ingresar Usuario Crea en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ldt_fec_sistema) then
			messagebox("Advertencia","Debe Ingresar Fecha Crea en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		end if
	next
	if ls_pasa='S' then	
		SELECT 	"OFERTA_V"."BENEFICIO_COMPLEMENTARIO"  
		INTO 		:ll_cod_beneficio
		FROM 	"OFERTA_V"
		WHERE 	( "OFERTA_V"."SERIE" = :is_serie ) AND  
					( "OFERTA_V"."NRO_OFERTA" = :il_numero ) 
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			dw_ingreso.insertrow(0)
			if ll_cod_beneficio > 0 then
				ll_row					= ll_tot_reg +1
	//			ll_corr				= il_corr_ini + il_count
				dw_ingreso.setitem(ll_row,'correlativo',ll_row)
				dw_ingreso.setitem(ll_row,'cod_beneficio',ll_cod_beneficio)
				dw_ingreso.setitem(ll_row,'base',ls_base)
				dw_ingreso.setitem(ll_row,'serie',is_serie)
				dw_ingreso.setitem(ll_row,'numero',il_numero)
				dw_ingreso.setitem(ll_row,'estado','P')
				dw_ingreso.setitem(ll_row,'usuario',gs_user)
				dw_ingreso.setitem(ll_row,'fecha_creacion',gdt_fec_sistema)
				dw_ingreso.setitem(ll_row,'tipo_promocion_asociados_pie_pactado',il_pie)
				dw_ingreso.accepttext()
			else
				messagebox('Advertencia','No Hay Beneficio Asignado')
			end if	
		end if	
	end if
end if
end event

type st_monto_pagado from statictext within w_beneficios_ingreso_mirko
integer x = 2359
integer y = 56
integer width = 430
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_pie from statictext within w_beneficios_ingreso_mirko
integer x = 1518
integer y = 56
integer width = 430
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_moneda from statictext within w_beneficios_ingreso_mirko
integer x = 1394
integer y = 56
integer width = 105
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_numero from statictext within w_beneficios_ingreso_mirko
integer x = 626
integer y = 56
integer width = 430
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_serie from statictext within w_beneficios_ingreso_mirko
integer x = 507
integer y = 56
integer width = 105
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_base from statictext within w_beneficios_ingreso_mirko
integer x = 389
integer y = 56
integer width = 105
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_beneficios_ingreso_mirko
integer x = 1975
integer y = 68
integer width = 370
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Monto Pagado"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_ingreso from datawindow within w_beneficios_ingreso_mirko
integer x = 46
integer y = 1340
integer width = 2738
integer height = 780
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_beneficios_asociados"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string	ls_columna,ls_nulo,ls_descrip,ls_pasa
long	ll_cod,ll_cod_det,ll_cod_benef,ll_cod_benef_d,ll_indi,ll_tot_reg,ll_count=0,ll_fila=0,ll_cant=0,ll_parque
 
if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	Setnull(ls_nulo)
	ls_columna			= dwo.name
	CHOOSE CASE ls_columna
		CASE 'cod_beneficio'
			dw_ingreso.accepttext()
			ll_cod			= dw_ingreso.getitemnumber(1,'cod_beneficio')
			dw_ingreso.getchild('cod_benef_detalle',idw_detalle)
			idw_detalle.settransobject(sqlca)
			idw_detalle.reset()
			dw_ingreso.setitem(getrow(),'cod_benef_detalle',ls_nulo)
			idw_detalle.settransobject(sqlca)
			if idw_detalle.retrieve(ll_cod)=0 then
				idw_detalle.insertrow(0)
			end if
			dw_ingreso.accepttext()
		CASE 'cod_benef_detalle'
			dw_ingreso.accepttext()
	END CHOOSE
	ll_cod						= dw_ingreso.getitemnumber(getrow(),'cod_beneficio')
	ll_cod_det				= dw_ingreso.getitemnumber(getrow(),'cod_benef_detalle')
	ll_tot_reg				= dw_ingreso.rowcount()
	ll_parque					= w_ingresar_oferta.dw_oferta_v.getitemnumber(1,'cadena_cod_parque')
	if ll_cod = 4 and ll_cod_det = 1 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=1 then
				ll_cant++
			end if	
		next
		if ll_cant >= 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ll_cod = 4 and ll_cod_det = 2 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=2 then
				ll_cant++
			end if	
		next
		if ll_cant >= 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ll_cod = 4 and ll_cod_det = 3 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=3 then
				ll_cant++
			end if	
		next
		if ll_cant >= 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ll_cod = 4 and ll_cod_det = 4 then
		if ll_parque = 102 then
			for ll_indi = 1 to ll_tot_reg
				ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
				ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
				if ll_cod_benef = 4 and ll_cod_benef_d=4 then
					ll_cant++
				end if	
			next
			if ll_cant >= 2 then 
				messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
				ls_pasa = 'N'
			else
				ls_pasa = 'S'
			end if
		else
			messagebox('Advertencia','Este Beneficio Solo Corresponde a Parque Cementerio el Manantial')
			ls_pasa = 'N'
		end if	
	end if
	if ll_cod = 4 and ll_cod_det = 5 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=4 then
				ll_cant++
			end if	
		next
		if ll_cant >= 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ll_cod = 4 and ll_cod_det = 6 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=5 then
				ll_cant++
			end if	
		next
		if ll_cant >= 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ll_cod = 4 and ll_cod_det = 7 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=6 then
				ll_cant++
			end if	
		next
		if ll_cant > 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ll_cod=4 and ll_cod_det=8 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=7 then
				ll_cant++
			end if	
		next
		if ll_cant > 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ls_pasa = 'S' then
		SELECT	"BENEFICIOS_COMPLEMENTARIO_DET"."DESCRIPCION"  
		INTO		:ls_descrip  
		FROM		"BENEFICIOS_COMPLEMENTARIO_DET"  
		WHERE 	"BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" = :ll_cod AND  
					"BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" = :ll_cod_det
		USING	sqlca;
		dw_ingreso.setitem(getrow(),'beneficios_complementario_det_descripcion',ls_descrip)
		cb_grabar.enabled		= true
	elseif ls_pasa = 'N' then
		cb_grabar.enabled		= false
	end if
end if
end event

type dw_beneficios_seleccionados from datawindow within w_beneficios_ingreso_mirko
integer x = 3159
integer y = 272
integer width = 686
integer height = 776
string title = "none"
string dataobject = "dwe_paso_beneficios"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_pie from statictext within w_beneficios_ingreso_mirko
integer x = 1083
integer y = 68
integer width = 297
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pie Pactado"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_beneficios_ingreso_mirko
integer x = 46
integer y = 68
integer width = 320
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "N° Promesa"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_beneficios_ingreso_mirko
integer x = 41
integer y = 2160
integer width = 288
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string ls_estado,ls_estado_reg
long	ll_cod_benef,ll_cod_benef_d,ll_tot_reg,ll_indi,ll_corr,ll_regis,ll_new,ll_res,ll_fila,ll_parque
date	ld_fecha
 
SELECT sysdate    INTO :gdt_fec_sistema   FROM "TASA"   WHERE "TASA"."LOOK" = 1   ;
ll_res					= messagebox("Grabar","Está seguro Grabar Beneficios",Exclamation!,YesNo!,2)
if ll_res=1 then
	if dw_ingreso.update() = 1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
		is_modif		= 'N'
		close(w_beneficios_ingreso)
	else
		rollback;
		messagebox("Error Grabar","Error Grabar Promociones SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_cerrar from commandbutton within w_beneficios_ingreso_mirko
integer x = 2450
integer y = 2160
integer width = 338
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;long	ll_res	

if is_modif = 'S' then
	ll_res 	= messagebox('Aviso','No a Guardado Beneficios ¿Esta Seguro de Salir?',Question!,YesNo!,2)
	if ll_res = 1 then
		close(w_beneficios_ingreso)
	end if	
else
	close(w_beneficios_ingreso)
end if
end event

type dw_lista_beneficios from datawindow within w_beneficios_ingreso_mirko
integer x = 46
integer y = 284
integer width = 2725
integer height = 1000
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_detalle_promocion_seleccionar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;if row > 0 then
	if getrow() > 0 then
		This.SelectRow(0, FALSE)
		This.SelectRow(getrow(), TRUE)
	end if
end if	
end event

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if

end event

event itemchanged;string	ls_descrip,ls_columna,ls_estado_gestion
long	ll_cod_benef,ll_cod_benef_det,ll_tot_reg,ll_indi,ll_est_reg,ll_estado

dw_lista_beneficios.accepttext()
dw_ingreso.reset()
ls_columna 										= dwo.name
SELECT 	MAX("CORRELATIVO" )
INTO 		:il_corr  
FROM 	"TIPO_PROMOCION_ASOCIADOS"
WHERE	"TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base AND  
			"TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie AND  
			"TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero
USING 	sqlca;
if isnull(il_corr) or il_corr=0 then
	il_corr						= 0
end if
if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	if ls_columna = 'estado_reg' then
		ll_tot_reg				= dw_lista_beneficios.rowcount()			
		ll_cod_benef			= dw_lista_beneficios.getitemnumber(row,'beneficios_complementario_codigo')
		ll_cod_benef_det		= dw_lista_beneficios.getitemnumber(row,'beneficios_complementario_det_codigo_beneficio')
		ll_estado					= long(data)
		dw_lista_beneficios.accepttext()
		ll_tot_reg								= dw_lista_beneficios.rowcount()
		if ll_tot_reg>0 then
			for	ll_indi=1 to ll_tot_reg
				ll_cod_benef					= dw_lista_beneficios.getitemnumber(ll_indi,'beneficios_complementario_codigo')
				ll_cod_benef_det				= dw_lista_beneficios.getitemnumber(ll_indi,'beneficios_complementario_det_codigo_beneficio')
				ll_est_reg						= dw_lista_beneficios.getitemnumber(ll_indi,'estado_reg')
				if row=ll_indi then
					if ll_est_reg=0 then
						ll_est_reg				= 1
					else
						ll_est_reg				= 0
					end if
				end if
				if ll_est_reg=0 then
					wf_cargar_lista(ll_cod_benef,ll_cod_benef_det,ll_est_reg)
				end if
				setnull(ll_est_reg);
			next
		end if
	end if
end if
end event

type gb_1 from groupbox within w_beneficios_ingreso_mirko
integer x = 32
integer y = 208
integer width = 2770
integer height = 1100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Lista de Beneficios a Agregar"
end type

