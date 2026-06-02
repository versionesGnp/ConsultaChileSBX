forward
global type w_tipo_servicio_detalle from window
end type
type dw_beneficiarios from datawindow within w_tipo_servicio_detalle
end type
type cb_1 from commandbutton within w_tipo_servicio_detalle
end type
type dw_venta from datawindow within w_tipo_servicio_detalle
end type
type dw_detalle from datawindow within w_tipo_servicio_detalle
end type
type cb_ingreso from commandbutton within w_tipo_servicio_detalle
end type
type cb_detalle from commandbutton within w_tipo_servicio_detalle
end type
type dw_tipo_servicio from datawindow within w_tipo_servicio_detalle
end type
type cb_grabar from commandbutton within w_tipo_servicio_detalle
end type
type cb_cerrar from commandbutton within w_tipo_servicio_detalle
end type
type gb_1 from groupbox within w_tipo_servicio_detalle
end type
type dw_lista from datawindow within w_tipo_servicio_detalle
end type
end forward

global type w_tipo_servicio_detalle from window
integer x = 832
integer y = 360
integer width = 2757
integer height = 1716
boolean titlebar = true
string title = "Tipo Servicio Detalle"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
event ue_calcular ( )
dw_beneficiarios dw_beneficiarios
cb_1 cb_1
dw_venta dw_venta
dw_detalle dw_detalle
cb_ingreso cb_ingreso
cb_detalle cb_detalle
dw_tipo_servicio dw_tipo_servicio
cb_grabar cb_grabar
cb_cerrar cb_cerrar
gb_1 gb_1
dw_lista dw_lista
end type
global w_tipo_servicio_detalle w_tipo_servicio_detalle

type variables
string		is_base,is_serie,is_uso,is_est_valida,is_tipo_infor,is_moneda
long 		il_row, il_row_selec,il_row_vta,il_cod_parque,il_cod_serv,il_tipo_benef,il_cant_benef
Double	il_numero
end variables

forward prototypes
public subroutine wf_porc (long al_cod_det, long al_cta, string as_tipo_dw)
public subroutine wf_actua_porce ()
public subroutine wf_cargar_datos (string as_tipo_carga)
public subroutine wf_grabar (string as_moneda, long al_cod_serv, double adb_precio, long al_capac, long al_tipo_benef)
public subroutine wf_registro (long al_cod_ser, long al_cod_det, string as_glosa, double adb_precio, string as_estado)
end prototypes

event ue_calcular();string		ls_estado,ls_base,ls_serie,ls_glosa_servicio,ls_glosa_detalle,ls_estado_vta,ls_uso
long		ll_tot_vta,ll_tot_lista,ll_cod_ser,ll_res,ll_indi,ll_cta,ll_cod_serv_tab,ll_cant_benef,ll_tipo_benef,ll_cod_servicio,ll_cod_detalle,ll_capacidad,ll_tipo_beneficiario,&
			ll_nulo
Double	ll_numero,ll_valor_producto
Datetime	ldt_fecha_crea, ldt_fecha_vig

Setnull(ll_nulo)
if not isnull(il_tipo_benef) and not isnull(il_cant_benef) and not isnull(il_cod_serv) and il_cod_serv>0 and not isnull(il_cod_parque) and il_cod_parque>0 then
	
	dw_lista.dataobject = 'dw_servicio_detalle'
	dw_lista.settransobject(sqlca)
	dw_detalle.visible															= false
	w_tipo_servicio_detalle.width											= 2770
	w_tipo_servicio_detalle.height											= 1700
	gf_centrar(w_tipo_servicio_detalle)
	
	
	dw_tipo_servicio.getchild('cod_servicio',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(il_cod_parque,is_uso,is_serie,is_moneda)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_tipo_servicio.insertrow(0)
	dw_tipo_servicio.setitem(1,'cod_servicio',il_cod_serv)
	dw_tipo_servicio.accepttext()
	
	dw_beneficiarios.insertrow(0)
	dw_beneficiarios.setitem(1,'tipo_benef',il_tipo_benef)
	dw_beneficiarios.setitem(1,'cant_benef',il_cant_benef)
	dw_beneficiarios.accepttext()
	
	ll_tot_vta																		= dw_venta.retrieve(is_base,is_serie,il_numero,is_est_valida)
	if ll_tot_vta > 0 then
		if ll_tot_vta > 0 then
			ll_cod_ser															= dw_venta.getitemnumber(1,'cod_servicio')
			ll_tipo_benef														= dw_venta.getitemnumber(1,'tipo_beneficiario')
			ll_cant_benef														= dw_venta.getitemnumber(1,'capacidad')
			ls_estado															= dw_venta.getitemstring(1,'estado')
		end if
		if ll_cod_ser=il_cod_serv and ll_cant_benef=il_cant_benef and ll_tipo_benef=il_tipo_benef then
//			cb_grabar.enabled													= false
//			cb_ingreso.enabled												= false
			wf_cargar_datos('A') 												// Import datos venta asociada
			dw_tipo_servicio.object.cod_servicio.protect				= 1
		else
			messagebox("Advertencia","Tipo Servicio No Coincide con Registro Guardado, Se Eliminara para Actualizar con Producto Seleccionado")
			DECLARE x1 CURSOR FOR  
			SELECT 	"PRODUCTO_VENTA_ASOCIADA"."BASE", 	"PRODUCTO_VENTA_ASOCIADA"."SERIE",   	"PRODUCTO_VENTA_ASOCIADA"."NUMERO",   	"PRODUCTO_VENTA_ASOCIADA"."COD_SERVICIO",   	"PRODUCTO_VENTA_ASOCIADA"."GLOSA_SERVICIO",   	"PRODUCTO_VENTA_ASOCIADA"."COD_DETALLE",   	"PRODUCTO_VENTA_ASOCIADA"."GLOSA_DETALLE",   	"PRODUCTO_VENTA_ASOCIADA"."FECHA_CREA",   	"PRODUCTO_VENTA_ASOCIADA"."VALOR_PRODUCTO",   	"PRODUCTO_VENTA_ASOCIADA"."ESTADO",   	"PRODUCTO_VENTA_ASOCIADA"."FECHA_VIGENCIA",   	"PRODUCTO_VENTA_ASOCIADA"."USO",   	"PRODUCTO_VENTA_ASOCIADA"."CAPACIDAD",   	"PRODUCTO_VENTA_ASOCIADA"."TIPO_BENEFICIARIO"  
			FROM 	"PRODUCTO_VENTA_ASOCIADA"  
			WHERE 	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :is_base ) AND  
						( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :is_serie ) AND  
						( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :il_numero )   
			USING	sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				do while sqlca.sqlcode=0
					fetch x1 into :ls_base, :ls_serie, :ll_numero, :ll_cod_servicio, :ls_glosa_servicio, :ll_cod_detalle, :ls_glosa_detalle, :ldt_fecha_crea, :ll_valor_producto, :ls_estado_vta, :ldt_fecha_vig, :ls_uso, :ll_capacidad, :ll_tipo_beneficiario	;
					if not isnull(ls_base) and ls_base<>'' then
						INSERT INTO "LOG_PRODUCTO_VENTA_ASOCIADA"  
									( "BASE",  	"SERIE",   	"NUMERO",   	"COD_SERVICIO",   	"GLOSA_SERVICIO",   	"COD_DETALLE",   	"GLOSA_DETALLE",   	"COD_DETALLE_FINAL",   	"GLOSA_DETALLE_FINAL",   	"FECHA_CREA",   	"VALOR_PRODUCTO",   	"PORCE_PAGO",   	"ESTADO",   	"FECHA_VIGENCIA",   	"FECHA_ELIMINA",   	"USUARIO_ELIMINA",   	"USO",   	"CAPACIDAD",   	"TIPO_BENEFICIARIO" )  
						VALUES 	( :ls_base,	:ls_serie,   	:ll_numero,   	:ll_cod_servicio,   		:ls_glosa_servicio,   		:ll_cod_detalle,   		:ls_glosa_detalle,   	null,   							null,   								:ldt_fecha_crea,   	:ll_valor_producto,   		null,   				:ls_estado_vta,	:ldt_fecha_vig,   			sysdate,   				:gs_user,   					:ls_uso,	:ll_capacidad,   	:ll_tipo_beneficiario )  
						USING	Trans_1;
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
						else
							rollback using Trans_1;
						end if
					end if
					Setnull(ls_base)
				loop

			end if
			close x1;
			
			dw_tipo_servicio.object.cod_servicio.protect			= 1
			ll_tot_lista														= dw_lista.retrieve(il_tipo_benef,il_cant_benef,il_cod_serv,is_uso, is_moneda)
			if ll_tot_lista>0 then
				for ll_indi=1 to ll_tot_lista
					dw_lista.setitem(ll_indi,'marca',1)
				next
				dw_lista.object.marca.protect							= 1
				SELECT	count("PRODUCTO_ANEXO"."BASE")
				INTO		:ll_cta	
				FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
				WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
							"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
							"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
							"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
							"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
							"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
							"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
				USING	sqlca;
				if isnull(ll_cta) then ll_cta=0
				if ll_cta>0 then
					SELECT	"PRODUCTO_PAGO"."CODIGO_SERVICIO"  
					INTO		:ll_cod_serv_tab	
					FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
					WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
								"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
								"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
								"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
								"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
								"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
								"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
					USING	sqlca;
//					if il_cod_serv<> ll_cod_serv_tab then
//						cb_grabar.enabled									= true
//						cb_ingreso.enabled								= true
//					else
//						cb_grabar.enabled									= false
//						cb_ingreso.enabled								= false
//					end if
				else
//					cb_grabar.enabled										= true
//					cb_ingreso.enabled									= true
				end if
			end if
			wf_cargar_datos('L')
			
//			ll_res																	= MessageBox("Advertencia",'Desea Mostar Registro Guardado',Exclamation!, YesNo!,2)
//			if ll_res=1 then
//				il_cod_serv														= dw_venta.getitemnumber(1,'cod_servicio')
//				il_tipo_benef													= dw_venta.getitemnumber(1,'tipo_beneficiario')
//				il_cant_benef													= dw_venta.getitemnumber(1,'capacidad')
//				ls_estado														= dw_venta.getitemstring(1,'estado')
//				dw_tipo_servicio.setitem(1,'cod_servicio',il_cod_serv)
//				dw_beneficiarios.setitem(1,'tipo_benef',il_tipo_benef)
//				dw_beneficiarios.setitem(1,'cant_benef',il_cant_benef)
//				dw_tipo_servicio.accepttext()
//				dw_beneficiarios.accepttext()
//				wf_cargar_datos('A') 											// Import datos venta asociada
//				cb_grabar.enabled												= false
//				dw_tipo_servicio.object.cod_servicio.protect			= 1
//				if ls_estado = 'R' then 
//					cb_ingreso.enabled										= true
//				else
//					cb_ingreso.enabled										= false
//				end if
//			else
//				ll_res																= MessageBox("Advertencia",'Desea Genera Nueva Compra',Exclamation!, YesNo!,2)
//				if ll_res=1 then
//					dw_tipo_servicio.object.cod_servicio.protect		= 1
//					ll_tot_lista													= dw_lista.retrieve(il_tipo_benef,il_cant_benef,il_cod_serv,is_uso,is_moneda)
//					if ll_tot_lista>0 then
//						for ll_indi=1 to ll_tot_lista
//							dw_lista.setitem(ll_indi,'marca',1)
//						next
//						dw_lista.object.marca.protect						= 1
//						SELECT	count("PRODUCTO_ANEXO"."BASE")
//						INTO		:ll_cta	
//						FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
//						WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
//									"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
//									"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
//									"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
//									"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
//									"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
//									"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
//						USING	sqlca;
//						if isnull(ll_cta) then ll_cta=0
//						if ll_cta>0 then
//							SELECT	"PRODUCTO_PAGO"."CODIGO_SERVICIO"  
//							INTO		:ll_cod_serv_tab	
//							FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
//							WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
//										"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
//										"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
//										"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
//										"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
//										"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
//										"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
//							USING	sqlca;
//							if il_cod_serv<> ll_cod_serv_tab then
//								cb_grabar.enabled							= true
//								cb_ingreso.enabled						= true
//							else
//								cb_grabar.enabled							= false
//								cb_ingreso.enabled						= false
//							end if
//						else
//							cb_grabar.enabled								= true
//							cb_ingreso.enabled							= true
//						end if
//					end if
//					wf_cargar_datos('L')
//				end if
//			end if
		end if
	else
		ll_res																	= MessageBox("Advertencia",'Desea Genera Nueva Compra',Exclamation!, YesNo!,2)
		if ll_res=1 then
			dw_tipo_servicio.object.cod_servicio.protect			= 1
			ll_tot_lista														= dw_lista.retrieve(il_tipo_benef,il_cant_benef,il_cod_serv,is_uso,is_moneda)
			if ll_tot_lista>0 then
				for ll_indi=1 to ll_tot_lista
					dw_lista.setitem(ll_indi,'marca',1)
				next
				dw_lista.object.marca.protect							= 1
				SELECT	count("PRODUCTO_ANEXO"."BASE")
				INTO		:ll_cta	
				FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
				WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
							"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
							"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
							"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
							"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
							"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
							"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
				USING	sqlca;
				if isnull(ll_cta) then ll_cta=0
				if ll_cta>0 then
					SELECT	"PRODUCTO_PAGO"."CODIGO_SERVICIO"  
					INTO		:ll_cod_serv_tab	
					FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
					WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
								"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
								"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
								"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
								"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
								"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
								"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
					USING	sqlca;
//					if il_cod_serv<> ll_cod_serv_tab then
//						cb_grabar.enabled									= true
//						cb_ingreso.enabled								= true
//					else
//						cb_grabar.enabled									= false
//						cb_ingreso.enabled								= false
//					end if
				else
//					cb_grabar.enabled										= true
//					cb_ingreso.enabled									= true
				end if
				wf_cargar_datos('L')
			else
				messagebox("Advertencia","No Registra Detalle para este Servicio")
				w_validar_promesa_operaciones.cb_limpiar_producto.triggerevent(clicked!)
				close(w_tipo_servicio_detalle)
			end if
			
		end if
	end if
end if
end event

public subroutine wf_porc (long al_cod_det, long al_cta, string as_tipo_dw);long		ll_indi,ll_marca,ll_tot_reg
double	ldb_porce,ldb_sum_porc,ldb_dif_porc

//wf_porc(al_cod_det,al_cta,as_tipo_dw)
dw_lista.accepttext()
if al_cod_det=1 then
	ldb_porce								= dw_detalle.getitemnumber(il_row_selec,'porce_valor')
	dw_lista.setitem(il_row,'porce_descuento',ldb_porce)
else
	ldb_porce								= round((0.4 / al_cta),4)
	ll_tot_reg								= dw_lista.rowcount()
	for ll_indi=2 to ll_tot_reg
		ll_marca								= dw_lista.getitemnumber(ll_indi,'marca')
		if ll_marca=1 then
			ldb_sum_porc					= ldb_sum_porc + ldb_porce
			dw_lista.setitem(ll_indi,'porce_descuento',ldb_porce)
		else
			dw_lista.setitem(ll_indi,'porce_descuento',0)
		end if
	next
	ldb_dif_porc								= round((0.4 - ldb_sum_porc),4)
	if ldb_dif_porc<>0 then
		if ldb_dif_porc>0 then
			ldb_porce						= ldb_porce + ldb_dif_porc
			dw_lista.setitem(2,'porce_descuento',ldb_porce)
		elseif ldb_dif_porc<0 then
			ldb_porce						= ldb_porce + ldb_dif_porc
			if as_tipo_dw='D' then
				dw_lista.setitem((al_cta+1),'porce_descuento',ldb_porce)
			elseif as_tipo_dw='L' then
				dw_lista.setitem((al_cta),'porce_descuento',ldb_porce)
			end if
		end if
	end if
end if
dw_lista.accepttext()
end subroutine

public subroutine wf_actua_porce ();//long		ll_tot_reg,ll_indi,ll_cod_serv,ll_cod_det,ll_tot_reg2,ll_indi2,ll_cod_serv2,ll_cod_det2
//double	ldb_porce
//
//dw_lista.accepttext()
//dw_venta.accepttext()
//ll_tot_reg							= dw_lista.rowcount()
//for ll_indi=1 to ll_tot_reg
//	ll_cod_serv						= dw_lista.getitemnumber(ll_indi,'codigo_servicio')
//	ll_cod_det						= dw_lista.getitemnumber(ll_indi,'codigo_detalle')
//	//ldb_porce						= dw_lista.getitemnumber(ll_indi,'porce_descuento')
//	ll_tot_reg2						= dw_venta.rowcount()
//	for ll_indi2=1 to ll_tot_reg2
//		ll_cod_serv2					= dw_venta.getitemnumber(ll_indi2,'cod_servicio')
//		ll_cod_det2					= dw_venta.getitemnumber(ll_indi2,'cod_detalle')
//		if ll_cod_serv=ll_cod_serv2 and ll_cod_det=ll_cod_det2 then
//			//dw_venta.setitem(ll_indi2,'porce_pago',ldb_porce)
//			dw_venta.accepttext()
//		end if
//	next
//next
end subroutine

public subroutine wf_cargar_datos (string as_tipo_carga);string		ls_desc_serv,ls_moneda,ls_glosa_ser,ls_estado,ls_glosa_det,ls_uso
long		ll_indi,ll_cod_serv,ll_cod_det,ll_tot_reg,ll_new,ll_tot_reg2,ll_indi2,ll_cod_serv2,ll_cod_det2
double	ldb_valor
datetime	ldt_fec_crea

SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM 	"TASA"  ;
if as_tipo_carga='L' then
	dw_venta.reset()
	dw_lista.accepttext()
	ll_tot_reg												= dw_lista.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ll_cod_serv										= dw_lista.getitemnumber(ll_indi,'codigo_servicio')
			ls_desc_serv									= dw_lista.getitemstring(ll_indi,'descripcion')
			ll_cod_det										= dw_lista.getitemnumber(ll_indi,'codigo_detalle')
			ldb_valor											= dw_lista.getitemnumber(ll_indi,'valor')
			ls_moneda										= dw_lista.getitemstring(ll_indi,'producto_lista_precio_moneda')
			ls_estado										= dw_lista.getitemstring(ll_indi,'producto_tipo_servicio_deta_estado_registro')
			ls_uso											= dw_lista.getitemstring(ll_indi,'producto_lista_precio_uso')
			SELECT DISTINCT "DESCRIPCION"  
			INTO		:ls_glosa_ser  
			FROM		"PRODUCTO_TIPO_SERVICIO"  
			WHERE	( "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" = :ll_cod_serv ) AND  
						( "PRODUCTO_TIPO_SERVICIO"."ESTADO_REGISTRO" = :ls_estado ) AND  
						( "PRODUCTO_TIPO_SERVICIO"."CANTIDAD_FC" = :il_cant_benef ) AND  
						( "PRODUCTO_TIPO_SERVICIO"."FECHA_VIGENCIA" <= :gdt_fec_sistema ) AND  
						( "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" = :il_cod_parque ) 
			USING	sqlca;
			SELECT DISTINCT	"PRODUCTO_TIPO_SERVICIO_DETA"."DESCRIPCION"  
			INTO		:ls_glosa_det  
			FROM		"PRODUCTO_TIPO_SERVICIO_DETA"  
			WHERE	( "PRODUCTO_TIPO_SERVICIO_DETA"."CODIGO_SERVICIO" = :ll_cod_serv ) AND  
						( "PRODUCTO_TIPO_SERVICIO_DETA"."CODIGO_DETALLE" = :ll_cod_det ) AND  
						( "PRODUCTO_TIPO_SERVICIO_DETA"."FECHA_VIGENCIA" <= :gdt_fec_sistema ) AND  
						( "PRODUCTO_TIPO_SERVICIO_DETA"."ESTADO_REGISTRO" = :ls_estado )
			USING	sqlca;
			ll_new											= dw_venta.insertrow(0)
			dw_venta.scrolltorow(ll_new)
			dw_venta.setitem(ll_indi,'base',is_base)
			dw_venta.setitem(ll_indi,'serie',is_serie)
			dw_venta.setitem(ll_indi,'numero',il_numero)
			dw_venta.setitem(ll_indi,'cod_servicio',ll_cod_serv)
			dw_venta.setitem(ll_indi,'glosa_servicio',ls_glosa_ser)
			dw_venta.setitem(ll_indi,'cod_detalle',ll_cod_det)
			dw_venta.setitem(ll_indi,'glosa_detalle',ls_glosa_det)
			dw_venta.setitem(ll_indi,'fecha_crea',gdt_fec_sistema)
			dw_venta.setitem(ll_indi,'valor_producto',ldb_valor)
			dw_venta.setitem(ll_indi,'estado',is_est_valida)
			dw_venta.setitem(ll_indi,'uso',is_uso)
			dw_venta.setitem(ll_indi,'capacidad',il_cant_benef)
			dw_venta.setitem(ll_indi,'tipo_beneficiario',il_tipo_benef)
			dw_venta.accepttext()
		next
	
	end if
elseif as_tipo_carga='A' then
	dw_venta.accepttext()
	ll_tot_reg																= dw_lista.retrieve(il_tipo_benef,il_cant_benef,il_cod_serv,is_uso,is_moneda)
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ll_cod_serv														= dw_lista.getitemnumber(ll_indi,'codigo_servicio')
			ll_cod_det														= dw_lista.getitemnumber(ll_indi,'codigo_detalle')
			
			ll_tot_reg2														= dw_venta.rowcount()
			if ll_tot_reg2>0 then
				for ll_indi2=1 to ll_tot_reg2
					ll_cod_serv2												= dw_venta.getitemnumber(ll_indi2,'cod_servicio')
					ll_cod_det2												= dw_venta.getitemnumber(ll_indi2,'cod_detalle')
					ldb_valor													= dw_venta.getitemnumber(ll_indi2,'valor_producto')
					ls_uso													= dw_venta.getitemstring(ll_indi2,'uso')
					dw_venta.setitem(ll_indi2,'fecha_crea',gdt_fec_sistema)
					
					if ll_cod_serv=ll_cod_serv2 and ll_cod_det=ll_cod_det2 then
						dw_tipo_servicio.setitem(1,'cod_servicio',ll_cod_serv2)
						dw_tipo_servicio.accepttext()
						dw_lista.setitem(ll_indi,'marca',1)
						dw_lista.setitem(ll_indi,'valor',ldb_valor)
						dw_lista.setitem(ll_indi,'producto_lista_precio_uso',ls_uso)
						dw_lista.object.valor.protect					= 1
						dw_lista.accepttext()
					end if
				next
			end if
		next
	end if
end if
end subroutine

public subroutine wf_grabar (string as_moneda, long al_cod_serv, double adb_precio, long al_capac, long al_tipo_benef);string		ls_mon_orig,ls_forma_pag,ls_estado_vta
long		ll_nro_cta,ll_gto_peso,ll_tot_reg,ll_indi,ll_cant_benef
double	ldb_pie,ldb_valor_uf,ldb_gtos_adm,ldb_int_uf,ldb_int_peso,ldb_gto_uf,ldb_interes,ldb_nulo,ldb_valor_cta,ldb_precio,ldb_valor_cta_mor,ll_precio_ctto_nf,&
			ldb_valor_cta_mor_peso,ldb_val_mort

//wf_grabar(as_moneda,al_cod_serv,adb_precio)
setnull(ldb_nulo)
ll_tot_reg									= dw_venta.rowcount()
if isvalid(w_ingresar_funeraria) or isvalid(w_cuenta_corriente_funeraria) then
	ls_estado_vta							= 'D' // DIGITACION
elseif isvalid(w_validar_promesa_operaciones) then
	ls_estado_vta							= 'R' //REVISION
end if
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		dw_venta.setitem(ll_indi,'estado',ls_estado_vta)
		dw_venta.accepttext()
	next
end if
if dw_venta.update() = 1 then
	commit using sqlca;
	if isvalid(w_ingresar_funeraria) then
		ls_mon_orig							= w_ingresar_funeraria.dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
		ldb_pie								= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie'))
		ldb_valor_uf							= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_uf_dia'))
		ll_nro_cta							= long(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo'))
		ldb_gtos_adm						= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_gasto_adm'))
		ls_forma_pag						= w_ingresar_funeraria.dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')
		ldb_valor_cta						= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota'))
		ldb_precio							= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio'))
		SELECT	"INTERES_UF",	"INTERES_PESOS"  
		INTO 		:ldb_int_uf,		:ldb_int_peso  
		FROM 	"INTERES_CUOTAS"  
		WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_nro_cta   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ldb_int_uf) then ldb_int_uf=0
			if isnull(ldb_int_peso) then ldb_int_peso=0
		end if
		if ll_nro_cta=1 then ldb_int_uf=0
		if ll_nro_cta=1 then ldb_int_peso=0
		SELECT	"TASA_UF",	"TASA_PESO"  
		INTO 		:ldb_gto_uf,	:ll_gto_peso  
		FROM 	"TASA_GASTOS_ADM"  
		WHERE 	"TASA_GASTOS_ADM"."CODIGO" = 1   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ldb_gto_uf) then ldb_gto_uf=0
			if isnull(ll_gto_peso) then ll_gto_peso=0
		end if
		if ll_nro_cta=1 then ldb_gto_uf=0
		if ll_nro_cta=1 then ll_gto_peso=0
		
		if as_moneda='1' then
			ldb_interes						= ldb_int_peso
			ldb_gtos_adm					= ll_nro_cta * ll_gto_peso
		elseif as_moneda='2' then
			ldb_interes						= ldb_int_uf
			ldb_gtos_adm					= ll_nro_cta * ldb_gto_uf
		end if
		
		if ls_mon_orig='1' then
			ldb_pie							= ldb_pie / ldb_valor_uf
			ldb_valor_cta					= ldb_valor_cta / ldb_valor_uf
		elseif ls_mon_orig='2' then
			ldb_pie							= ldb_pie
			ldb_valor_cta					= ldb_valor_cta
		end if
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_codigo_servicio',al_cod_serv)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_moneda',as_moneda)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_pie',ldb_pie)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_precio',adb_precio)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_interes)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_gasto_adm',ldb_gtos_adm)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_capacidad',al_capac)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_beneficiarios',al_tipo_benef)
		
		if round(adb_precio,2) <> round(ldb_precio,2) then
			ldb_valor_cta					= 0
		end if
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',ldb_valor_cta)
		w_ingresar_funeraria.dw_anexo_funeraria.accepttext()
	elseif isvalid(w_validar_promesa_operaciones) then
		ls_mon_orig							= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'moneda')
		ldb_pie								= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'pie'))
		ldb_valor_uf							= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'uf_fecha_ctto'))
		ll_nro_cta							= long(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'plazo'))
		ldb_gtos_adm						= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'gasto_adm'))
		ls_forma_pag						= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'forma_pago')
		ldb_valor_cta						= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'c_suma_val_cuota'))
		ldb_precio							= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'precio_contrato'))
		SELECT	"INTERES_UF",	"INTERES_PESOS"  
		INTO 		:ldb_int_uf,		:ldb_int_peso  
		FROM 	"INTERES_CUOTAS"  
		WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_nro_cta   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ldb_int_uf) then ldb_int_uf=0
			if isnull(ldb_int_peso) then ldb_int_peso=0
		end if
		if ll_nro_cta=1 then ldb_int_uf=0
		if ll_nro_cta=1 then ldb_int_peso=0
		SELECT	"TASA_UF",	"TASA_PESO"  
		INTO 		:ldb_gto_uf,	:ll_gto_peso  
		FROM 	"TASA_GASTOS_ADM"  
		WHERE 	"TASA_GASTOS_ADM"."CODIGO" = 1   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ldb_gto_uf) then ldb_gto_uf=0
			if isnull(ll_gto_peso) then ll_gto_peso=0
		end if
		if ll_nro_cta=1 then ldb_gto_uf=0
		if ll_nro_cta=1 then ll_gto_peso=0
		
		if as_moneda='1' then
			ldb_interes						= ldb_int_peso
			ldb_gtos_adm					= ll_nro_cta * ll_gto_peso
		elseif as_moneda='2' then
			ldb_interes						= ldb_int_uf
			ldb_gtos_adm					= ll_nro_cta * ldb_gto_uf
		end if
		if isnull(ls_mon_orig) then ls_mon_orig='2'
		if ls_mon_orig='1' then
			if ldb_pie > 1000 then
				ldb_pie						= ldb_pie
				ldb_valor_cta				= ldb_valor_cta
			else
				ldb_pie						= round(ldb_pie / ldb_valor_uf,2)
				ldb_valor_cta				= round(ldb_valor_cta / ldb_valor_uf,2)
			end if
		elseif ls_mon_orig='2' then
			if ldb_pie > 1000 then
				ldb_pie						= round(ldb_pie / ldb_valor_uf,2)
				ldb_valor_cta				= round(ldb_valor_cta / ldb_valor_uf,2)
			else
				ldb_pie						= ldb_pie
				ldb_valor_cta				= ldb_valor_cta
			end if
		end if
		w_validar_promesa_operaciones.dw_revision.setitem(1,'codigo_servicio',al_cod_serv)
		w_validar_promesa_operaciones.dw_revision.setitem(1,'moneda',as_moneda)
		w_validar_promesa_operaciones.dw_revision.setitem(1,'pie',ldb_pie)
		w_validar_promesa_operaciones.dw_revision.setitem(1,'precio',adb_precio)
		if al_cod_serv= 670 or al_cod_serv= 671 or al_cod_serv= 672 or al_cod_serv= 673 or al_cod_serv= 674 then
			SELECT DISTINCT 	"PRODUCTO_TIPO_SERVICIO"."CANTIDAD_FC",   	"PRODUCTO_TIPO_SERVICIO"."VALOR_CTA_MORTUORIA",	   	"PRODUCTO_TIPO_SERVICIO"."VALOR_CTA_MORTUORIA_PESO"  
			INTO 						:ll_cant_benef,   											:ldb_valor_cta_mor ,														:ldb_valor_cta_mor_peso
			FROM 		"PRODUCTO_TIPO_SERVICIO"  
			WHERE 		"PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" = :al_cod_serv  AND
							"PRODUCTO_TIPO_SERVICIO"."ESTADO_REGISTRO" = 'V' AND
							"PRODUCTO_TIPO_SERVICIO"."CANTIDAD_FC" = :al_capac;
			if as_moneda='1' then
				ldb_val_mort							= ldb_valor_cta_mor_peso
			elseif as_moneda='2' then
				ldb_val_mort							= ldb_valor_cta_mor
			end if
			if ll_cant_benef > 0 then
				ll_precio_ctto_nf						= adb_precio - (round(ll_cant_benef * ldb_val_mort,2))
			else
				ll_precio_ctto_nf						= adb_precio
			end if
		else
			ll_precio_ctto_nf							= adb_precio
		end if
		w_validar_promesa_operaciones.dw_revision.setitem(1,'precio_contrato',ll_precio_ctto_nf)
		//w_validar_promesa_operaciones.dw_revision.setitem(1,'producto_pago_tasa_base',ldb_interes)
		w_validar_promesa_operaciones.dw_revision.setitem(1,'gasto_adm',ldb_gtos_adm)
		w_validar_promesa_operaciones.dw_revision.setitem(1,'capacidad',al_capac)
		w_validar_promesa_operaciones.dw_revision.setitem(1,'tipo_beneficiarios',al_tipo_benef)
		if round(adb_precio,2) <> round(ldb_precio,2) then
			ldb_valor_cta					= 0
		end if
		if isnull(ldb_precio) then
			if gs_base='F' and ll_precio_ctto_nf > 0 and (al_cod_serv= 670 or al_cod_serv= 671 or al_cod_serv= 672 or al_cod_serv= 673 or al_cod_serv= 674) then
				ldb_valor_cta				= ll_precio_ctto_nf
			else
				ldb_valor_cta				= adb_precio
			end if
		else
			if adb_precio=1 and ls_mon_orig='1' then ldb_valor_cta = adb_precio
		end if
		w_validar_promesa_operaciones.dw_revision.setitem(1,'valor_cuota',ldb_valor_cta)
		w_validar_promesa_operaciones.dw_revision.accepttext()
	end if
	if al_cod_serv= 670 or al_cod_serv= 671 or al_cod_serv= 672 or al_cod_serv= 673 or al_cod_serv= 674 then
//		messagebox("Grabar","Grabación Exitosa, No Olvide Grabar Ingreso Revisión de Contrato")
	else
		messagebox("Grabar","Grabación Exitosa, No Olvide Grabar Ingreso Revisión de Contrato")
	end if
//	messagebox("Advertencia","No Olvide Grabar Modificaciones Al Registro Servicio Funerario")
	dw_venta.reset()
else
	rollback using sqlca;
	messagebox("Error Grabar","Error Grabar Detalle Servicio: "+sqlca.sqlerrtext)
end if
end subroutine

public subroutine wf_registro (long al_cod_ser, long al_cod_det, string as_glosa, double adb_precio, string as_estado);long	ll_new_vta,ll_new_lista

//wf_registro(al_cod_ser,al_cod_det,as_glosa,adb_precio,as_estado)

if as_estado = 'N' then
	ll_new_lista						= dw_lista.insertrow(0)
	dw_lista.scrolltorow(ll_new_lista)
	dw_lista.setitem(ll_new_lista,'codigo_servicio',al_cod_ser)
	dw_lista.setitem(ll_new_lista,'codigo_detalle',al_cod_det)
	dw_lista.setitem(ll_new_lista,'descripcion',as_glosa)
	dw_lista.setitem(ll_new_lista,'producto_lista_precio_moneda','1')
	dw_lista.setitem(ll_new_lista,'valor',adb_precio)
	dw_lista.setitem(ll_new_lista,'producto_lista_precio_uso','NI')
	dw_lista.setitem(ll_new_lista,'marca',1)
	dw_lista.accepttext()
	
	ll_new_vta						= dw_venta.insertrow(0)
	dw_venta.scrolltorow(ll_new_vta)
	dw_venta.setitem(ll_new_vta,'base',is_base)
	dw_venta.setitem(ll_new_vta,'serie',is_serie)
	dw_venta.setitem(ll_new_vta,'numero',il_numero)
	dw_venta.setitem(ll_new_vta,'cod_servicio',al_cod_ser)
	dw_venta.setitem(ll_new_vta,'cod_detalle',al_cod_det)
	dw_venta.setitem(ll_new_vta,'glosa_detalle',as_glosa)
	dw_venta.setitem(ll_new_vta,'fecha_crea',gdt_fec_sistema)
	dw_venta.setitem(ll_new_vta,'valor_producto',adb_precio)
	dw_venta.setitem(ll_new_vta,'estado',as_estado)
	dw_venta.accepttext()

elseif as_estado = 'D' then
	ll_new_lista						= dw_lista.insertrow(0)
	dw_lista.scrolltorow(ll_new_lista)
	dw_lista.setitem(ll_new_lista,'codigo_servicio',al_cod_ser)
	dw_lista.setitem(ll_new_lista,'codigo_detalle',al_cod_det)
	dw_lista.setitem(ll_new_lista,'descripcion',as_glosa)
	dw_lista.setitem(ll_new_lista,'producto_lista_precio_moneda','1')
	dw_lista.setitem(ll_new_lista,'valor',adb_precio)
	dw_lista.setitem(ll_new_lista,'producto_lista_precio_uso','NI')
	dw_lista.setitem(ll_new_lista,'marca',1)
	dw_lista.accepttext()
end if

end subroutine

on w_tipo_servicio_detalle.create
this.dw_beneficiarios=create dw_beneficiarios
this.cb_1=create cb_1
this.dw_venta=create dw_venta
this.dw_detalle=create dw_detalle
this.cb_ingreso=create cb_ingreso
this.cb_detalle=create cb_detalle
this.dw_tipo_servicio=create dw_tipo_servicio
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.dw_lista=create dw_lista
this.Control[]={this.dw_beneficiarios,&
this.cb_1,&
this.dw_venta,&
this.dw_detalle,&
this.cb_ingreso,&
this.cb_detalle,&
this.dw_tipo_servicio,&
this.cb_grabar,&
this.cb_cerrar,&
this.gb_1,&
this.dw_lista}
end on

on w_tipo_servicio_detalle.destroy
destroy(this.dw_beneficiarios)
destroy(this.cb_1)
destroy(this.dw_venta)
destroy(this.dw_detalle)
destroy(this.cb_ingreso)
destroy(this.cb_detalle)
destroy(this.dw_tipo_servicio)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.dw_lista)
end on

event open;connect using Trans_1;
connect using Trans_2;

il_tipo_benef		= long(substr(1,1,message.stringparm))
il_cant_benef		= long(substr(1,2,message.stringparm))
il_cod_serv			= long(substr(1,3,message.stringparm))
il_cod_parque		= long(substr(1,4,message.stringparm))
is_base				= substr(1,5,message.stringparm)
is_serie				= substr(1,6,message.stringparm)
il_numero			= Double(substr(1,7,message.stringparm))
is_uso				= substr(1,8,message.stringparm)
is_est_valida		= substr(1,9,message.stringparm)
is_tipo_infor			= substr(1,10,message.stringparm)
is_moneda			= substr(1,11,message.stringparm)
dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_venta.settransobject(sqlca)
dw_beneficiarios.settransobject(sqlca)
if is_base='F' or is_base='G' or is_base='V' then cb_ingreso.enabled	= false
if il_cod_serv=670 or il_cod_serv=671 or il_cod_serv=672 or il_cod_serv=673 or il_cod_serv=674 then
	string		ls_estado,ls_base,ls_serie,ls_glosa_servicio,ls_glosa_detalle,ls_estado_vta,ls_uso
	long		ll_tot_vta,ll_tot_lista,ll_cod_ser,ll_res,ll_indi,ll_cta,ll_cod_serv_tab,ll_cant_benef,ll_tipo_benef,ll_cod_servicio,ll_cod_detalle,ll_capacidad,ll_tipo_beneficiario
	Double	ll_numero,ll_valor_producto
	Datetime	ldt_fecha_crea, ldt_fecha_vig
	
	if not isnull(il_tipo_benef) and not isnull(il_cant_benef) and not isnull(il_cod_serv) and il_cod_serv>0 and not isnull(il_cod_parque) and il_cod_parque>0 then
		dw_lista.dataobject = 'dw_servicio_detalle'
		dw_lista.settransobject(sqlca)
		dw_detalle.visible															= false
		w_tipo_servicio_detalle.width											= 2770
		w_tipo_servicio_detalle.height											= 1700
		gf_centrar(w_tipo_servicio_detalle)
		
		dw_tipo_servicio.getchild('cod_servicio',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(il_cod_parque,is_uso,is_serie,is_moneda)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_tipo_servicio.insertrow(0)
		dw_tipo_servicio.setitem(1,'cod_servicio',il_cod_serv)
		dw_tipo_servicio.accepttext()
		
		dw_beneficiarios.insertrow(0)
		dw_beneficiarios.setitem(1,'tipo_benef',il_tipo_benef)
		dw_beneficiarios.setitem(1,'cant_benef',il_cant_benef)
		dw_beneficiarios.accepttext()
		
		ll_tot_vta																		= dw_venta.retrieve(is_base,is_serie,il_numero,is_est_valida)
		if ll_tot_vta>=0 then
			if ll_tot_vta > 0 then
				ll_cod_ser																= dw_venta.getitemnumber(1,'cod_servicio')
				ll_tipo_benef															= dw_venta.getitemnumber(1,'tipo_beneficiario')
				ll_cant_benef															= dw_venta.getitemnumber(1,'capacidad')
				ls_estado																= dw_venta.getitemstring(1,'estado')
			end if
			if ll_cod_ser=il_cod_serv and ll_cant_benef=il_cant_benef and ll_tipo_benef=il_tipo_benef then
	//			cb_grabar.enabled													= false
	//			cb_ingreso.enabled												= false
				wf_cargar_datos('A') 												// Import datos venta asociada
				dw_tipo_servicio.object.cod_servicio.protect				= 1
			else
//				messagebox("Advertencia","Tipo Servicio No Coincide con Registro Guardado, Se Eliminara para Actualizar con Producto Seleccionado")
				DECLARE x1 CURSOR FOR  
				SELECT 	"PRODUCTO_VENTA_ASOCIADA"."BASE", 	"PRODUCTO_VENTA_ASOCIADA"."SERIE",   	"PRODUCTO_VENTA_ASOCIADA"."NUMERO",   	"PRODUCTO_VENTA_ASOCIADA"."COD_SERVICIO",   	"PRODUCTO_VENTA_ASOCIADA"."GLOSA_SERVICIO",   	"PRODUCTO_VENTA_ASOCIADA"."COD_DETALLE",   	"PRODUCTO_VENTA_ASOCIADA"."GLOSA_DETALLE",   	"PRODUCTO_VENTA_ASOCIADA"."FECHA_CREA",   	"PRODUCTO_VENTA_ASOCIADA"."VALOR_PRODUCTO",   	"PRODUCTO_VENTA_ASOCIADA"."ESTADO",   	"PRODUCTO_VENTA_ASOCIADA"."FECHA_VIGENCIA",   	"PRODUCTO_VENTA_ASOCIADA"."USO",   	"PRODUCTO_VENTA_ASOCIADA"."CAPACIDAD",   	"PRODUCTO_VENTA_ASOCIADA"."TIPO_BENEFICIARIO"  
				FROM 	"PRODUCTO_VENTA_ASOCIADA"  
				WHERE 	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :is_base ) AND  
							( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :is_serie ) AND  
							( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :il_numero )   
				USING	sqlca;
				open x1;
				if sqlca.sqlcode=0 then
					do while sqlca.sqlcode=0
						fetch x1 into :ls_base, :ls_serie, :ll_numero, :ll_cod_servicio, :ls_glosa_servicio, :ll_cod_detalle, :ls_glosa_detalle, :ldt_fecha_crea, :ll_valor_producto, :ls_estado_vta, :ldt_fecha_vig, :ls_uso, :ll_capacidad, :ll_tipo_beneficiario	;
						if not isnull(ls_base) and ls_base<>'' then
							INSERT INTO "LOG_PRODUCTO_VENTA_ASOCIADA"  
										( "BASE",  	"SERIE",   	"NUMERO",   	"COD_SERVICIO",   	"GLOSA_SERVICIO",   	"COD_DETALLE",   	"GLOSA_DETALLE",   	"COD_DETALLE_FINAL",   	"GLOSA_DETALLE_FINAL",   	"FECHA_CREA",   	"VALOR_PRODUCTO",   	"PORCE_PAGO",   	"ESTADO",   	"FECHA_VIGENCIA",   	"FECHA_ELIMINA",   	"USUARIO_ELIMINA",   	"USO",   	"CAPACIDAD",   	"TIPO_BENEFICIARIO" )  
							VALUES 	( :ls_base,	:ls_serie,   	:ll_numero,   	:ll_cod_servicio,   		:ls_glosa_servicio,   		:ll_cod_detalle,   		:ls_glosa_detalle,   	null,   							null,   								:ldt_fecha_crea,   	:ll_valor_producto,   		null,   				:ls_estado_vta,	:ldt_fecha_vig,   			sysdate,   				:gs_user,   					:ls_uso,	:ll_capacidad,   	:ll_tipo_beneficiario )  
							USING	Trans_1;
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
							else
								rollback using Trans_1;
							end if
						end if
						Setnull(ls_base)
					loop
	
				end if
				close x1;
				
				dw_tipo_servicio.object.cod_servicio.protect			= 1
				ll_tot_lista														= dw_lista.retrieve(il_tipo_benef,il_cant_benef,il_cod_serv,is_uso,is_moneda)
				if ll_tot_lista>0 then
					for ll_indi=1 to ll_tot_lista
						dw_lista.setitem(ll_indi,'marca',1)
					next
					dw_lista.object.marca.protect							= 1
					SELECT	count("PRODUCTO_ANEXO"."BASE")
					INTO		:ll_cta	
					FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
					WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
								"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
								"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
								"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
								"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
								"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
								"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
					USING	sqlca;
					if isnull(ll_cta) then ll_cta=0
					if ll_cta>0 then
						SELECT	"PRODUCTO_PAGO"."CODIGO_SERVICIO"  
						INTO		:ll_cod_serv_tab	
						FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
						WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
									"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
									"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
									"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
									"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
									"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
									"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
						USING	sqlca;
	//					if il_cod_serv<> ll_cod_serv_tab then
	//						cb_grabar.enabled									= true
	//						cb_ingreso.enabled								= true
	//					else
	//						cb_grabar.enabled									= false
	//						cb_ingreso.enabled								= false
	//					end if
					else
	//					cb_grabar.enabled										= true
	//					cb_ingreso.enabled									= true
					end if
				end if
				wf_cargar_datos('L')
				
	//			ll_res																	= MessageBox("Advertencia",'Desea Mostar Registro Guardado',Exclamation!, YesNo!,2)
	//			if ll_res=1 then
	//				il_cod_serv														= dw_venta.getitemnumber(1,'cod_servicio')
	//				il_tipo_benef													= dw_venta.getitemnumber(1,'tipo_beneficiario')
	//				il_cant_benef													= dw_venta.getitemnumber(1,'capacidad')
	//				ls_estado														= dw_venta.getitemstring(1,'estado')
	//				dw_tipo_servicio.setitem(1,'cod_servicio',il_cod_serv)
	//				dw_beneficiarios.setitem(1,'tipo_benef',il_tipo_benef)
	//				dw_beneficiarios.setitem(1,'cant_benef',il_cant_benef)
	//				dw_tipo_servicio.accepttext()
	//				dw_beneficiarios.accepttext()
	//				wf_cargar_datos('A') 											// Import datos venta asociada
	//				cb_grabar.enabled												= false
	//				dw_tipo_servicio.object.cod_servicio.protect			= 1
	//				if ls_estado = 'R' then 
	//					cb_ingreso.enabled										= true
	//				else
	//					cb_ingreso.enabled										= false
	//				end if
	//			else
	//				ll_res																= MessageBox("Advertencia",'Desea Genera Nueva Compra',Exclamation!, YesNo!,2)
	//				if ll_res=1 then
	//					dw_tipo_servicio.object.cod_servicio.protect		= 1
	//					ll_tot_lista													= dw_lista.retrieve(il_tipo_benef,il_cant_benef,il_cod_serv,is_uso,is_moneda)
	//					if ll_tot_lista>0 then
	//						for ll_indi=1 to ll_tot_lista
	//							dw_lista.setitem(ll_indi,'marca',1)
	//						next
	//						dw_lista.object.marca.protect						= 1
	//						SELECT	count("PRODUCTO_ANEXO"."BASE")
	//						INTO		:ll_cta	
	//						FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
	//						WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
	//									"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
	//									"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
	//									"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
	//									"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
	//									"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
	//									"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
	//						USING	sqlca;
	//						if isnull(ll_cta) then ll_cta=0
	//						if ll_cta>0 then
	//							SELECT	"PRODUCTO_PAGO"."CODIGO_SERVICIO"  
	//							INTO		:ll_cod_serv_tab	
	//							FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
	//							WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
	//										"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
	//										"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
	//										"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
	//										"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
	//										"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
	//										"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
	//							USING	sqlca;
	//							if il_cod_serv<> ll_cod_serv_tab then
	//								cb_grabar.enabled							= true
	//								cb_ingreso.enabled						= true
	//							else
	//								cb_grabar.enabled							= false
	//								cb_ingreso.enabled						= false
	//							end if
	//						else
	//							cb_grabar.enabled								= true
	//							cb_ingreso.enabled							= true
	//						end if
	//					end if
	//					wf_cargar_datos('L')
	//				end if
	//			end if
			end if
		else
			ll_res																	= 1	//MessageBox("Advertencia",'Desea Genera Nueva Compra',Exclamation!, YesNo!,2)
			if ll_res=1 then
				dw_tipo_servicio.object.cod_servicio.protect			= 1
				ll_tot_lista														= dw_lista.retrieve(il_tipo_benef,il_cant_benef,il_cod_serv,is_uso,is_moneda)
				if ll_tot_lista>0 then
					for ll_indi=1 to ll_tot_lista
						dw_lista.setitem(ll_indi,'marca',1)
					next
					dw_lista.object.marca.protect							= 1
					SELECT	count("PRODUCTO_ANEXO"."BASE")
					INTO		:ll_cta	
					FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
					WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
								"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
								"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
								"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
								"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
								"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
								"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
					USING	sqlca;
					if isnull(ll_cta) then ll_cta=0
					if ll_cta>0 then
						SELECT	"PRODUCTO_PAGO"."CODIGO_SERVICIO"  
						INTO		:ll_cod_serv_tab	
						FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
						WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
									"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
									"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
									"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
									"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
									"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
									"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
						USING	sqlca;
	//					if il_cod_serv<> ll_cod_serv_tab then
	//						cb_grabar.enabled									= true
	//						cb_ingreso.enabled								= true
	//					else
	//						cb_grabar.enabled									= false
	//						cb_ingreso.enabled								= false
	//					end if
					else
	//					cb_grabar.enabled										= true
	//					cb_ingreso.enabled									= true
					end if
				end if
				wf_cargar_datos('L')
			end if
		end if
	end if
	cb_grabar.triggerevent(clicked!)
	
else
	PostEvent('ue_calcular')	
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type dw_beneficiarios from datawindow within w_tipo_servicio_detalle
integer x = 1106
integer y = 64
integer width = 1573
integer height = 88
integer taborder = 20
string title = "none"
string dataobject = "dwe_beneficiario"
boolean border = false
boolean livescroll = true
end type

type cb_1 from commandbutton within w_tipo_servicio_detalle
integer x = 2007
integer y = 1468
integer width = 247
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Imprimir"
end type

event clicked;if dw_venta.rowcount() >0 then 
	f_Print( dw_venta )
end if
end event

type dw_venta from datawindow within w_tipo_servicio_detalle
integer x = 41
integer y = 1708
integer width = 3899
integer height = 792
string title = "none"
string dataobject = "dw_venta_asociada"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_detalle from datawindow within w_tipo_servicio_detalle
integer x = 2761
integer y = 176
integer width = 1906
integer height = 1260
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_producto_final"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string	ls_columna,ls_glosa_det,ls_pasa,ls_glosa_ser
long ll_cod_ser_det,ll_cod_det_det,ll_marca,ll_tot_vta,ll_indi,ll_cod_ser_vta,ll_cod_det_vta,ll_tot_lista,ll_indi2,ll_cod_ser,ll_cod_det,ll_new_vta,ll_new_lista
double	ldb_precio

if row>0 then
	il_row_selec												= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_selec, TRUE)
	
	dw_tipo_servicio.accepttext()
	dw_lista.accepttext()
	dw_detalle.accepttext()
	ls_columna												= dwo.name
	
	if ls_columna='marca' then
		ll_cod_ser_det										= dw_tipo_servicio.getitemnumber(1,'cod_servicio')
		ll_cod_det_det										= dw_detalle.getitemnumber(il_row_selec,'codigo_servicio')
		ldb_precio											= dw_detalle.getitemnumber(il_row_selec,'valor')
		ll_marca												= dw_detalle.getitemnumber(il_row_selec,'marca')
		ls_glosa_det											= dw_detalle.getitemstring(il_row_selec,'descripcion')
		
		if ll_marca = 0 then
			
			ll_tot_vta											= dw_venta.rowcount()
			for ll_indi=1 to ll_tot_vta
				ll_cod_ser_vta								= dw_venta.getitemnumber(ll_indi,'cod_servicio')
				ll_cod_det_vta								= dw_venta.getitemnumber(ll_indi,'cod_detalle')
				if ll_cod_ser_det=ll_cod_ser_vta and ll_cod_det_det=ll_cod_det_vta then
					//elimina
					dw_venta.deleterow(ll_indi)
					dw_venta.accepttext()
					ll_tot_vta									= dw_venta.rowcount()
					ll_indi										= ll_indi - 1
				end if
			next
			
			ll_tot_lista										= dw_lista.rowcount()
			for ll_indi2=1 to ll_tot_lista
				ll_cod_ser									= dw_lista.getitemnumber(ll_indi2,'codigo_servicio')
				ll_cod_det									= dw_lista.getitemnumber(ll_indi2,'codigo_detalle')
				if ll_cod_ser_det=ll_cod_ser and ll_cod_det_det=ll_cod_det then
					//elimina
					dw_lista.deleterow(ll_indi2)
					dw_lista.accepttext()
					ll_tot_lista								= dw_lista.rowcount()
					ll_indi2									= ll_indi2 - 1
				end if
			next
			
		elseif ll_marca = 1 then
			
			ll_tot_vta											= dw_venta.rowcount()
			for ll_indi=1 to ll_tot_vta
				ll_cod_ser_vta								= dw_venta.getitemnumber(ll_indi,'cod_servicio')
				ll_cod_det_vta								= dw_venta.getitemnumber(ll_indi,'cod_detalle')
				if ll_cod_ser_det=ll_cod_ser_vta and ll_cod_det_det=ll_cod_det_vta then
					ls_pasa									='N'
				else
					ls_pasa									='S'
				end if
			next	
			if ls_pasa='S' then
				SELECT DISTINCT	"DESCRIPCION"  
				INTO		:ls_glosa_ser  
				FROM		"PRODUCTO_TIPO_SERVICIO"  
				WHERE	( "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" = :ll_cod_ser_det ) AND  
							( "PRODUCTO_TIPO_SERVICIO"."ESTADO_REGISTRO" = 'V' ) AND  
							( "PRODUCTO_TIPO_SERVICIO"."FECHA_VIGENCIA" <= :gdt_fec_sistema ) AND  
							( "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" = :il_cod_parque )
				USING	sqlca;
				
				ll_new_vta									= dw_venta.insertrow(0)
				dw_venta.scrolltorow(ll_new_vta)
				dw_venta.setitem(ll_new_vta,'base',is_base)
				dw_venta.setitem(ll_new_vta,'serie',is_serie)
				dw_venta.setitem(ll_new_vta,'numero',il_numero)
				dw_venta.setitem(ll_new_vta,'cod_servicio',ll_cod_ser_det)
				dw_venta.setitem(ll_new_vta,'glosa_servicio',ls_glosa_ser)
				dw_venta.setitem(ll_new_vta,'cod_detalle',ll_cod_det_det)
				dw_venta.setitem(ll_new_vta,'glosa_detalle',ls_glosa_det)
				dw_venta.setitem(ll_new_vta,'fecha_crea',gdt_fec_sistema)
				dw_venta.setitem(ll_new_vta,'valor_producto',ldb_precio)
				
				dw_venta.setitem(ll_new_vta,'estado',is_est_valida)
				dw_venta.setitem(ll_new_vta,'uso',is_uso)
				dw_venta.setitem(ll_new_vta,'capacidad',il_cant_benef)
				dw_venta.setitem(ll_new_vta,'tipo_beneficiario',il_tipo_benef)
				if ll_new_vta>0 then
					dw_venta.scrolltorow(ll_new_vta)
					dw_venta.setfocus()
				end if
				dw_venta.accepttext()
			end if
			
			
			ll_tot_lista										= dw_lista.rowcount()
			for ll_indi2=1 to ll_tot_lista
				ll_cod_ser									= dw_lista.getitemnumber(ll_indi2,'codigo_servicio')
				ll_cod_det									= dw_lista.getitemnumber(ll_indi2,'codigo_detalle')
				if ll_cod_ser_det=ll_cod_ser and ll_cod_det_det=ll_cod_det then
					ls_pasa									= 'N'
				else
					ls_pasa									= 'S'
				end if
			next
			if ls_pasa= 'S' then
				ll_new_lista									= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'codigo_servicio',ll_cod_ser_det)
				dw_lista.setitem(ll_new_lista,'codigo_detalle',ll_cod_det_det)
				dw_lista.setitem(ll_new_lista,'descripcion',ls_glosa_det)
				dw_lista.setitem(ll_new_lista,'producto_lista_precio_moneda','1')
				dw_lista.setitem(ll_new_lista,'valor',ldb_precio)
				dw_lista.setitem(ll_new_lista,'producto_lista_precio_uso','NI')
				dw_lista.setitem(ll_new_lista,'marca',1)
				if ll_cod_det_det=101 or ll_cod_det_det=102 then
					dw_lista.object.valor.protect		= 0
				else	
					dw_lista.object.valor.protect		= 1
				end if
				if ll_new_lista>0 then
					dw_lista.scrolltorow(ll_new_lista)
					dw_lista.setfocus()
					dw_lista.SelectRow(ll_new_lista, TRUE)
				end if
				dw_lista.accepttext()
			end if
		end if
	end if
end if
end event

event clicked;string		ls_columna,ls_glosa_det,ls_pasa,ls_glosa_ser,ls_moneda_lista,ls_uso_lista
long 		ll_cod_ser_det,ll_cod_det_det,ll_marca,ll_tot_vta,ll_indi,ll_cod_ser_vta,ll_cod_det_vta,ll_tot_lista,ll_indi2,ll_cod_ser,ll_cod_det,ll_new_vta,ll_new_lista
double	ldb_precio,ldb_valor_producto

if row>0 then
	il_row_selec												= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_selec, TRUE)
	
	dw_tipo_servicio.accepttext()
	dw_lista.accepttext()
	dw_detalle.accepttext()
	ls_columna												= dwo.name
	
	if ls_columna='marca' then
		ls_moneda_lista									= dw_lista.getitemstring(1,'producto_lista_precio_moneda')
		ls_uso_lista											= dw_lista.getitemstring(1,'producto_lista_precio_uso')
		
		ll_cod_ser_det										= dw_tipo_servicio.getitemnumber(1,'cod_servicio')
		ll_cod_det_det										= dw_detalle.getitemnumber(il_row_selec,'codigo_servicio')
		ldb_precio											= dw_detalle.getitemnumber(il_row_selec,'valor')
		ll_marca												= dw_detalle.getitemnumber(il_row_selec,'marca')
		ls_glosa_det											= dw_detalle.getitemstring(il_row_selec,'descripcion')
		
		if ll_marca = 0 then
			ll_tot_vta											= dw_venta.rowcount()
			for ll_indi=1 to ll_tot_vta
				ll_cod_ser_vta								= dw_venta.getitemnumber(ll_indi,'cod_servicio')
				ll_cod_det_vta								= dw_venta.getitemnumber(ll_indi,'cod_detalle')
				if ll_cod_ser_det=ll_cod_ser_vta and ll_cod_det_det=ll_cod_det_vta then
					//elimina
					dw_venta.deleterow(ll_indi)
					dw_venta.accepttext()
					ll_tot_vta									= dw_venta.rowcount()
					ll_indi										= ll_indi - 1
				end if
			next
			
			ll_tot_lista										= dw_lista.rowcount()
			for ll_indi2=1 to ll_tot_lista
				ll_cod_ser									= dw_lista.getitemnumber(ll_indi2,'codigo_servicio')
				ll_cod_det									= dw_lista.getitemnumber(ll_indi2,'codigo_detalle')
				if ll_cod_ser_det=ll_cod_ser and ll_cod_det_det=ll_cod_det then
					//elimina
					dw_lista.deleterow(ll_indi2)
					dw_lista.accepttext()
					ll_tot_lista								= dw_lista.rowcount()
					ll_indi2									= ll_indi2 - 1
				end if
			next
			
		elseif ll_marca = 1 then
			ll_tot_vta											= dw_venta.rowcount()
			for ll_indi=1 to ll_tot_vta
				ll_cod_ser_vta								= dw_venta.getitemnumber(ll_indi,'cod_servicio')
				ll_cod_det_vta								= dw_venta.getitemnumber(ll_indi,'cod_detalle')
				if ll_cod_ser_det=ll_cod_ser_vta and ll_cod_det_det=ll_cod_det_vta then
					ls_pasa									= 'N'
				else
					ls_pasa									= 'S'
				end if
			next
			if ls_pasa='S' then
				SELECT DISTINCT	"DESCRIPCION"  
				INTO		:ls_glosa_ser  
				FROM		"PRODUCTO_TIPO_SERVICIO"  
				WHERE	( "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" = :ll_cod_ser_det ) AND  
							( "PRODUCTO_TIPO_SERVICIO"."ESTADO_REGISTRO" = 'V' ) AND  
							( "PRODUCTO_TIPO_SERVICIO"."FECHA_VIGENCIA" <= :gdt_fec_sistema ) AND  
							( "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" = :il_cod_parque )
				USING	sqlca;
				
				
				ll_new_vta									= dw_venta.insertrow(0)
				dw_venta.scrolltorow(ll_new_vta)
				dw_venta.setitem(ll_new_vta,'base',is_base)
				dw_venta.setitem(ll_new_vta,'serie',is_serie)
				dw_venta.setitem(ll_new_vta,'numero',il_numero)
				dw_venta.setitem(ll_new_vta,'cod_servicio',ll_cod_ser_det)
				dw_venta.setitem(ll_new_vta,'glosa_servicio',ls_glosa_ser)
				dw_venta.setitem(ll_new_vta,'cod_detalle',ll_cod_det_det)
				dw_venta.setitem(ll_new_vta,'glosa_detalle',ls_glosa_det)
				dw_venta.setitem(ll_new_vta,'fecha_crea',gdt_fec_sistema)
				if ls_moneda_lista = '1' then
					if ldb_precio >= 1000 then
						ldb_valor_producto				= ldb_precio
					else
						ldb_valor_producto				= round(ldb_precio * gd_uf_dia,0)
					end if
				elseif ls_moneda_lista='2' then
					if ldb_precio >= 1000 then
						ldb_valor_producto				= round(ldb_precio / gd_uf_dia,2)
					else
						ldb_valor_producto				= ldb_precio
					end if
				end if				
				dw_venta.setitem(ll_new_vta,'valor_producto',ldb_valor_producto)	//ldb_precio)
				
				dw_venta.setitem(ll_new_vta,'estado',is_est_valida)
				dw_venta.setitem(ll_new_vta,'uso',ls_uso_lista)
				dw_venta.setitem(ll_new_vta,'capacidad',il_cant_benef)
				dw_venta.setitem(ll_new_vta,'tipo_beneficiario',il_tipo_benef)
				if ll_new_vta>0 then
					dw_venta.scrolltorow(ll_new_vta)
					dw_venta.setfocus()
				end if
				dw_venta.accepttext()
			end if
				
			
			ll_tot_lista										= dw_lista.rowcount()
			for ll_indi2=1 to ll_tot_lista
				ll_cod_ser									= dw_lista.getitemnumber(ll_indi2,'codigo_servicio')
				ll_cod_det									= dw_lista.getitemnumber(ll_indi2,'codigo_detalle')
				if ll_cod_ser_det=ll_cod_ser and ll_cod_det_det=ll_cod_det then
					ls_pasa									= 'N'
				else
					ls_pasa									= 'S'
				end if
			next
			if ls_pasa='S' then
				ll_new_lista									= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'codigo_servicio',ll_cod_ser_det)
				dw_lista.setitem(ll_new_lista,'codigo_detalle',ll_cod_det_det)
				dw_lista.setitem(ll_new_lista,'descripcion',ls_glosa_det)
				dw_lista.setitem(ll_new_lista,'producto_lista_precio_moneda',ls_moneda_lista)
				if ls_moneda_lista = '1' then
					if ldb_precio >= 1000 then
						ldb_valor_producto				= ldb_precio
					else
						ldb_valor_producto				= round(ldb_precio * gd_uf_dia,0)
					end if
				elseif ls_moneda_lista='2' then
					if ldb_precio >= 1000 then
						ldb_valor_producto				= round(ldb_precio / gd_uf_dia,2)
					else
						ldb_valor_producto				= ldb_precio
					end if
				end if
				dw_lista.setitem(ll_new_lista,'valor',ldb_valor_producto)
				dw_lista.setitem(ll_new_lista,'producto_lista_precio_uso',ls_uso_lista)
				dw_lista.setitem(ll_new_lista,'marca',1)
				if ll_cod_det_det=101 or ll_cod_det_det=102 then
					dw_lista.object.valor.protect		= 0
				else	
					dw_lista.object.valor.protect		= 1
				end if
				if ll_new_lista>0 then
					dw_lista.scrolltorow(ll_new_lista)
					dw_lista.setfocus()
					dw_lista.SelectRow(ll_new_lista, TRUE)
				end if
				dw_lista.accepttext()
			end if
		end if
	end if
else
	ls_columna												= dwo.name
	if ls_columna='t_cerrar' then
		w_tipo_servicio_detalle.width					= 2770
		gf_centrar(w_tipo_servicio_detalle)
	end if
end if
end event

type cb_ingreso from commandbutton within w_tipo_servicio_detalle
integer x = 1111
integer y = 1460
integer width = 466
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Ingresar Detalle"
end type

event clicked;long 		ll_tot_det,ll_tot_vta,ll_indi,ll_indi2,ll_tipo_benef,ll_cant_benef,ll_cod_ser,ll_cod_det_vta,ll_cod_det
string 	ls_glosa
double	ldb_precio

dw_detalle.visible									= true

w_tipo_servicio_detalle.height					= 1700
w_tipo_servicio_detalle.width					= 4780

ll_tot_det												= dw_detalle.retrieve(il_cod_parque)
if ll_tot_det>0 then
	for ll_indi=1 to ll_tot_det
		dw_detalle.setitem(ll_indi,'marca',1)
	next
	
	ll_tot_vta											= dw_venta.rowcount()
	if ll_tot_vta>0 then
		for ll_indi2=1 to ll_tot_vta
			ll_tipo_benef							= dw_venta.getitemnumber(ll_indi2,'tipo_beneficiario')
			ll_cant_benef							= dw_venta.getitemnumber(ll_indi2,'capacidad')
			ll_cod_ser								= dw_venta.getitemnumber(ll_indi2,'cod_servicio')
			ll_cod_det_vta							= dw_venta.getitemnumber(ll_indi2,'cod_detalle')
			ls_glosa									= dw_venta.getitemstring(ll_indi2,'glosa_detalle')
			ldb_precio								= dw_venta.getitemnumber(ll_indi2,'valor_producto')
			for ll_indi=1 to ll_tot_det
				ll_cod_det							= dw_detalle.getitemnumber(ll_indi,'codigo_servicio')
				if ll_cod_det_vta=ll_cod_det then
					dw_detalle.setitem(ll_indi,'marca',1)
					dw_detalle.accepttext()
				end if
			next
		next		
	end if
end if	
gf_centrar(w_tipo_servicio_detalle)
end event

type cb_detalle from commandbutton within w_tipo_servicio_detalle
boolean visible = false
integer x = 1765
integer y = 1468
integer width = 247
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&Detalle"
end type

event clicked;//long	ll_cod_servicio,ll_cod_detalle
//
//dw_lista.accepttext()
//ll_cod_servicio				= dw_lista.getitemnumber(il_row,'codigo_servicio')
//ll_cod_detalle				= dw_lista.getitemnumber(il_row,'codigo_detalle')
//if ll_cod_servicio<>6 then
//else
//end if
//
end event

type dw_tipo_servicio from datawindow within w_tipo_servicio_detalle
integer x = 46
integer y = 60
integer width = 1051
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_tipo_servicio"
boolean border = false
boolean livescroll = true
end type

type cb_grabar from commandbutton within w_tipo_servicio_detalle
integer x = 37
integer y = 1464
integer width = 297
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Grabar"
end type

event clicked;string		ls_gls_ser,ls_gls_det,ls_estado_c,ls_uso_c,ls_moneda_lista
long		ll_cod_ser,ll_cant_ben,ll_tipo_ben,ll_tot_lista,ll_tot_vta,ll_tot_reg,ll_cta,ll_res,ll_cod_ser_c,ll_cod_det_c,ll_capc_c,ll_tipo_benef_c,ll_graba,ll_cod_ser_vta,ll_cant_ben_vta,ll_tipo_ben_vta
double	ldb_sum_lista,ldb_sum_vta,ldb_valor_c,ldb_precio
datetime	ldt_fec_crea,ldt_fec_vig

SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM 	"TASA";

dw_lista.accepttext()
dw_venta.accepttext()

ll_cod_ser										= dw_tipo_servicio.getitemnumber(1,'cod_servicio')
ll_cant_ben										= dw_beneficiarios.getitemnumber(1,'cant_benef')
ll_tipo_ben										= dw_beneficiarios.getitemnumber(1,'tipo_benef')
if not isnull(ll_cod_ser) and ll_cod_ser<>0 and not isnull(ll_cant_ben) and ll_cant_ben<>0 and not isnull(ll_tipo_ben) and ll_tipo_ben<>0 then
	ll_tot_lista									=  dw_lista.rowcount()
	if ll_tot_lista>=0 then
		ldb_sum_lista							= dw_lista.getitemnumber(1,'c_sum_serv')
		ls_moneda_lista						= dw_lista.getitemstring(1,'producto_lista_precio_moneda')
	end if
	
	ll_tot_vta										=  dw_venta.rowcount()
	if ll_tot_vta > 0 then
		ldb_sum_vta							= dw_venta.getitemnumber(1,'c_sum_valor')
		ll_cod_ser_vta							= dw_venta.getitemnumber(1,'cod_servicio')
		ll_cant_ben_vta							= dw_venta.getitemnumber(1,'capacidad')
		ll_tipo_ben_vta							= dw_venta.getitemnumber(1,'tipo_beneficiario')
	end if 
	ll_tot_reg									= ll_tot_lista + ll_tot_vta
	if ll_tot_reg>0 then
		if ldb_sum_lista=ldb_sum_vta then
			SELECT	count("BASE"),  sum("VALOR_PRODUCTO")
			INTO 		:ll_cta ,			:ldb_precio 
			FROM 	"PRODUCTO_VENTA_ASOCIADA"  
			WHERE	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :is_base ) AND  
						( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :is_serie ) AND  
						( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :il_numero ) AND  
						( "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'R' OR "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'D' )
			USING	sqlca;
			if isnull(ll_cta) then ll_cta=0
			if isnull(ldb_precio) then ldb_precio=0
			if ll_cta>0 then
				if il_cod_serv=670 or il_cod_serv=671 or il_cod_serv=672 or il_cod_serv=673 or il_cod_serv=674 then
					ll_res								= 1
				else
					messagebox("Advertencia","Existe Un Producto Asociado al Contrato en Revisión o Digitado: "+is_base+'-'+is_serie+'-'+string(il_numero))
				end if			
				if isvalid(w_cuenta_corriente_funeraria) then
					//solo mostrar
					cb_grabar.enabled				= false
					dw_lista.enabled				= false
					cb_ingreso.enabled			= false
				else
					ll_res								= MessageBox("Grabar", 'Desea Grabar Modificaciones Servicio Funerario', Exclamation!, YesNo!, 2)
					if ll_res=1 then
						DECLARE x1 CURSOR FOR
						SELECT	"COD_SERVICIO",	"GLOSA_SERVICIO",	"COD_DETALLE",	"GLOSA_DETALLE",	"FECHA_CREA",	"VALOR_PRODUCTO",		"PORCE_PAGO",	"ESTADO",		"FECHA_VIGENCIA",	"USO",	"CAPACIDAD",	"TIPO_BENEFICIARIO"
						FROM		"PRODUCTO_VENTA_ASOCIADA"  
							WHERE	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :is_base ) AND  
										( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :is_serie ) AND  
										( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :il_numero )
						USING	sqlca;
						open x1;
						if sqlca.sqlcode=0 then
							DO WHILE sqlca.sqlcode=0
							fetch x1 INTO	:ll_cod_ser_c,:ls_gls_ser,:ll_cod_det_c,:ls_gls_det,:ldt_fec_crea,:ldb_valor_c,:ls_estado_c,:ldt_fec_vig,:ls_uso_c,:ll_capc_c,:ll_tipo_benef_c;
								if not isnull(ll_cod_ser_c) and ll_cod_ser_c>0 and not isnull(ll_cod_det_c) and ll_cod_det_c>0 then
									INSERT INTO "LOG_PRODUCTO_VENTA_ASOCIADA"  
												( "BASE",		"SERIE",	"NUMERO",	"COD_SERVICIO",	"GLOSA_SERVICIO",	"COD_DETALLE",	"GLOSA_DETALLE",	"COD_DETALLE_FINAL",	"GLOSA_DETALLE_FINAL",	"FECHA_CREA",	"VALOR_PRODUCTO",	"PORCE_PAGO",	"ESTADO",		"FECHA_VIGENCIA",	"FECHA_ELIMINA",	"USUARIO_ELIMINA",	"USO",		"CAPACIDAD",	"TIPO_BENEFICIARIO" )  
									VALUES	( :is_base,	:is_serie,	:il_numero,	:ll_cod_ser_c,		:ls_gls_ser,				:ll_cod_det_c,		:ls_gls_det,				0,								'-',									:ldt_fec_crea,		:ldb_valor_c,			null,					:ls_estado_c,	:ldt_fec_vig,				:gdt_fec_sistema,	:gs_user,				:ls_uso_c,	:ll_capc_c,		:ll_tipo_benef_c )
									USING	Trans_1;
									if Trans_1.sqlcode=0 then
										commit using Trans_1;
										ll_graba++
									else
										rollback using Trans_1;
										messagebox("Error Grabar","Error Grabar Funeraria Detalle SQL: "+Trans_1.sqlerrtext)
									end if
								end if
								setnull(ll_cod_ser_c);setnull(ls_gls_ser);setnull(ll_cod_det_c);setnull(ls_gls_det);
								setnull(ldb_valor_c);setnull(ls_estado_c);setnull(ldt_fec_vig)
							LOOP
						end if
						close x1;
						if ll_graba=ll_cta then
							wf_grabar(ls_moneda_lista,ll_cod_ser_vta,ldb_sum_lista,ll_cant_ben_vta,ll_tipo_ben_vta)
							DELETE FROM "PRODUCTO_VENTA_ASOCIADA"  
							WHERE	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :is_base ) AND  
										( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :is_serie ) AND  
										( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :il_numero ) AND
										( "PRODUCTO_VENTA_ASOCIADA"."FECHA_CREA" = :ldt_fec_crea)
							USING	Trans_2;
							if Trans_2.sqlcode=0 then
								commit using Trans_2;
							else
								rollback using Trans_2;
							end if
							close(w_tipo_servicio_detalle)
						end if
					end if
				end if
			else
				if il_cod_serv=670 or il_cod_serv=671 or il_cod_serv=672 or il_cod_serv=673 or il_cod_serv=674 then
					ll_res									= 1
				else
					ll_res									= MessageBox("Grabar",'Desea Grabar Opciones Servicio', Exclamation!, YesNo!, 2)
				end if
				
				if ll_res=1 then
					wf_grabar(ls_moneda_lista,ll_cod_ser_vta,ldb_sum_lista,ll_cant_ben_vta,ll_tipo_ben_vta)
					close(w_tipo_servicio_detalle)
				end if
			end if
		else
			if il_cod_serv=670 or il_cod_serv=671 or il_cod_serv=672 or il_cod_serv=673 or il_cod_serv=674 then
				ll_res									= 1
			else
				ll_res									= MessageBox("Grabar",'Desea Grabar Opciones Servicio', Exclamation!, YesNo!, 2)
			end if
			if ll_res=1 then
				wf_grabar(ls_moneda_lista,ll_cod_ser_vta,ldb_sum_lista,ll_cant_ben_vta,ll_tipo_ben_vta)
				close(w_tipo_servicio_detalle)
			end if
		end if
	else
		messagebox("Advertencia","No Registra Datos en Detalle de Servicio para Grabar")
			
	end if
end if
end event

type cb_cerrar from commandbutton within w_tipo_servicio_detalle
integer x = 2400
integer y = 1460
integer width = 297
integer height = 104
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Cerrar"
end type

event clicked;long		ll_cod_serv,ll_tot_reg,ll_cod_serv_dig,ll_res,ll_cod_servicio,ll_nulo
double	ldb_precio,ldb_precio_dig

if is_tipo_infor='O' then
	close(w_tipo_servicio_detalle)
else
	setnull(ll_nulo)
	dw_lista.accepttext()
	gl_cod_servicio						= ll_nulo								
	ll_tot_reg							= dw_lista.rowcount()
	if ll_tot_reg>0 then
		ll_cod_serv						= dw_lista.getitemnumber(1,'codigo_servicio')
		ldb_precio						= dw_lista.getitemnumber(1,'c_sum_serv')
		if isvalid(w_ingresar_funeraria) then
			ll_cod_serv_dig				= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_codigo_servicio'))
			ldb_precio_dig				= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio'))
		elseif isvalid(w_validar_promesa_operaciones) then
			ll_cod_serv_dig				= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'codigo_servicio'))
			ldb_precio_dig				= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'precio_contrato'))
		end if
		if ll_cod_serv=ll_cod_serv_dig and ldb_precio=ldb_precio_dig then
			close(w_tipo_servicio_detalle)
		else
			ll_res							= MessageBox("Adventecia", 'Diferencia En Codigo de Servicio y Precio~r~n'+ 'Desea Grabar Modificaciones Servicio', Exclamation!, YesNo!, 2)
			if ll_res=1 then
				cb_grabar.triggerevent(clicked!)
				close(w_tipo_servicio_detalle)
			else
				if isvalid(w_ingresar_funeraria) then
					w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_codigo_servicio',gl_cod_servicio)
				elseif isvalid(w_validar_promesa_operaciones) then
					w_validar_promesa_operaciones.dw_revision.setitem(1,'codigo_servicio',gl_cod_servicio)
				end if
				close(w_tipo_servicio_detalle)
			end if
		end if
	end if
end if
end event

type gb_1 from groupbox within w_tipo_servicio_detalle
integer x = 37
integer y = 12
integer width = 2665
integer height = 156
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Beneficiarios"
end type

type dw_lista from datawindow within w_tipo_servicio_detalle
integer x = 37
integer y = 176
integer width = 2661
integer height = 1268
integer taborder = 30
string title = "none"
string dataobject = "dw_servicio_detalle"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//string	ls_carga,ls_estado
//long	ll_cod_ser,ll_cod_det,ll_tot_vta,ll_indi,ll_cod_ser_vta,ll_cod_det_vta,ll_tot_det,ll_indi2,ll_cod_ser_det,ll_cod_det_det,ll_marca
//
//this.accepttext()
//dw_tipo_servicio.accepttext()
//il_row																		= row
//This.SelectRow(0, FALSE)
//This.SelectRow(il_row, TRUE)
//if row>0 then
//	ll_cod_ser															= dw_lista.getitemnumber(il_row,'codigo_servicio')
//	ll_cod_det															= dw_lista.getitemnumber(il_row,'codigo_detalle')
//	
//	if ll_cod_det < 100 then
//		messagebox("Advertencia","Detalle No Puede Ser Eliminado Del Tipo Servicio")
//		dw_lista.setitem(il_row,'marca',1)
//		dw_lista.object.marca.protect								= 1
//		dw_lista.accepttext()
//	else
//		ll_tot_vta															= dw_venta.rowcount()
//		if ll_tot_vta>0 then
//			ls_estado													= dw_venta.getitemstring(1,'estado')
//			if ls_estado='D' then
//				messagebox("Advertencia","Contrato Digitado")
//			else
//				ll_marca													= dw_lista.getitemnumber(il_row,'marca')
//				if ll_marca=1 then
//					for ll_indi=1 to ll_tot_vta
//						ll_cod_ser_vta									= dw_venta.getitemnumber(ll_indi,'cod_servicio')
//						ll_cod_det_vta									= dw_venta.getitemnumber(ll_indi,'cod_detalle')
//						if ll_cod_ser=ll_cod_ser_vta and ll_cod_det=ll_cod_det_vta then
//							dw_venta.deleterow(ll_indi)
//							dw_venta.accepttext()
//							ll_tot_vta										= dw_venta.rowcount()
//							ll_indi											= ll_indi - 1
//						end if
//					next
//					
//					ll_tot_det												= dw_detalle.rowcount()
//					for ll_indi2=1 to ll_tot_det
//						ll_cod_det_det									= dw_detalle.getitemnumber(ll_indi2,'codigo_servicio')
//						if ll_cod_det=ll_cod_det_det then
//							dw_detalle.setitem(ll_indi2,'marca',0)
//							dw_detalle.accepttext()
//						end if
//					next
//				end if
//			end if
//		end if
//	end if
//end if
end event

event itemchanged;string	ls_columna
long	ll_cod_ser,ll_cod_det,ll_tot_vta,ll_valor,ll_indi,ll_cod_ser_vta,ll_cod_det_vta

this.accepttext()
dw_tipo_servicio.accepttext()
ls_columna													= dwo.name
if row>0 then
	il_row														= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	
	if ls_columna='valor' then
		ll_cod_ser											= dw_lista.getitemnumber(il_row,'codigo_servicio')
		ll_cod_det											= dw_lista.getitemnumber(il_row,'codigo_detalle')
		ll_valor												= dw_lista.getitemnumber(il_row,'valor')
		if ll_cod_det=101 or ll_cod_det=102 then
			ll_tot_vta											= dw_venta.rowcount()
			for ll_indi=1 to ll_tot_vta
				ll_cod_ser_vta								= dw_venta.getitemnumber(ll_indi,'cod_servicio')
				ll_cod_det_vta								= dw_venta.getitemnumber(ll_indi,'cod_detalle')
				if ll_cod_ser=ll_cod_ser_vta and ll_cod_det=ll_cod_det_vta then
					dw_venta.setitem(ll_indi,'valor_producto',ll_valor)
					dw_venta.accepttext()
				end if
			next
		end if
	end if
end if
end event

