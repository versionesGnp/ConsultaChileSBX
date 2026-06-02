forward
global type w_observacion_no_grabar_comprobante from window
end type
type dw_grabar_log_caja_detalle from datawindow within w_observacion_no_grabar_comprobante
end type
type dw_grabar_log_caja from datawindow within w_observacion_no_grabar_comprobante
end type
type cb_cerrar from commandbutton within w_observacion_no_grabar_comprobante
end type
type dw_observacion from datawindow within w_observacion_no_grabar_comprobante
end type
end forward

global type w_observacion_no_grabar_comprobante from window
integer width = 2615
integer height = 960
boolean titlebar = true
string title = "Observación por No Grabar Comprobante"
windowtype windowtype = response!
long backcolor = 67108864
dw_grabar_log_caja_detalle dw_grabar_log_caja_detalle
dw_grabar_log_caja dw_grabar_log_caja
cb_cerrar cb_cerrar
dw_observacion dw_observacion
end type
global w_observacion_no_grabar_comprobante w_observacion_no_grabar_comprobante

type variables
String	is_print
end variables

on w_observacion_no_grabar_comprobante.create
this.dw_grabar_log_caja_detalle=create dw_grabar_log_caja_detalle
this.dw_grabar_log_caja=create dw_grabar_log_caja
this.cb_cerrar=create cb_cerrar
this.dw_observacion=create dw_observacion
this.Control[]={this.dw_grabar_log_caja_detalle,&
this.dw_grabar_log_caja,&
this.cb_cerrar,&
this.dw_observacion}
end on

on w_observacion_no_grabar_comprobante.destroy
destroy(this.dw_grabar_log_caja_detalle)
destroy(this.dw_grabar_log_caja)
destroy(this.cb_cerrar)
destroy(this.dw_observacion)
end on

event open;Long	ll_new

is_print						= Message.StringParm
gs_tipo_cobro				= 'CU'
gf_centrar(w_observacion_no_grabar_comprobante)
dw_grabar_log_caja.settransobject(sqlca)
dw_grabar_log_caja_detalle.settransobject(sqlca)
dw_observacion.settransobject(sqlca)
dw_observacion.getchild('cod_observacion',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve()
ll_new						= dw_observacion.insertrow(0)
dw_observacion.scrolltorow(ll_new)
dw_observacion.setitem(ll_new,'rezago',gs_rezago)
dw_observacion.setitem(ll_new,'tipo_cob',gs_tipo_cobro)
dw_observacion.setitem(ll_new,'folio',gl_folio)
if gs_rezago='S' then
	dw_observacion.setitem(ll_new,'base','')
	dw_observacion.setitem(ll_new,'serie','')
	dw_observacion.setitem(ll_new,'numero',0)
else
	dw_observacion.setitem(ll_new,'base',gs_base)
	dw_observacion.setitem(ll_new,'serie',gs_serie)
	dw_observacion.setitem(ll_new,'numero',gi_numero)
end if
dw_observacion.accepttext()
end event

type dw_grabar_log_caja_detalle from datawindow within w_observacion_no_grabar_comprobante
boolean visible = false
integer x = 137
integer y = 1236
integer width = 2373
integer height = 400
integer taborder = 40
string title = "none"
string dataobject = "dw_grabar_log_caja_detalle"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_grabar_log_caja from datawindow within w_observacion_no_grabar_comprobante
boolean visible = false
integer x = 142
integer y = 856
integer width = 2373
integer height = 360
integer taborder = 30
string title = "none"
string dataobject = "dw_grabar_log_caja"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_observacion_no_grabar_comprobante
integer x = 50
integer y = 684
integer width = 2510
integer height = 148
integer taborder = 20
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long		ll_pasa,ll_tot_reg,ll_indi,ll_total_monto,ll_new,ll_corr,ll_cod_obs,ll_folio,ll_monto,ll_pasa1=0,ll_cantidad,ll_monto_total,ll_count_f,ll_fila_f,ll_cantidad_f,&
			ll_monto_f,ll_CTA_PAG_S,ll_count_mov,ll_fila_mov,ll_cantidad_mov
Datetime	ldt_fecha
Date		ld_fecha_hoy
String		ls_tipo_cob_otro,ls_tipo_cob,ls_cod_mov
Double	ll_total_pagado,ll_monto_mov

SetPointer(HourGlass!)
dw_observacion.accepttext()
ll_cod_obs						= dw_observacion.getitemnumber(1,'cod_observacion')
ll_pasa							= 0
if ll_cod_obs > 0 then
	SELECT	sysdate  
	INTO 		:ldt_fecha  
	FROM 	"TASA"  
	WHERE 	"TASA"."LOOK" = 1   ;
	ld_fecha_hoy				= date(ldt_fecha)
	SELECT	MAX("LOG_CAJA_RECHAZADOS"."CORRELATIVO")
	INTO 		:ll_corr  
	FROM 	"LOG_CAJA_RECHAZADOS"  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if isnull(ll_corr) or ll_corr=0 then
			ll_corr				= 1
		else
			ll_corr++
		end if
	else
		ll_corr					= 1
	end if
	CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
		CASE 1 //Cupón
			ll_tot_reg			= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.rowcount()
			if ll_tot_reg>0 then
				for ll_indi=1 to ll_tot_reg
					ll_folio		= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(ll_indi,'cuponeras_detalle_nro_cupon')
					ll_monto		= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(ll_indi,'c_total_pago_cuota')
					ll_new		= dw_grabar_log_caja.insertrow(0)
					dw_grabar_log_caja.scrolltorow(ll_new)
					dw_grabar_log_caja.setitem(ll_new,'correlativo',ll_corr)
					dw_grabar_log_caja.setitem(ll_new,'tipo_cob',gs_tipo_cobro)
					dw_grabar_log_caja.setitem(ll_new,'folio',ll_folio)
					dw_grabar_log_caja.setitem(ll_new,'fecha',ld_fecha_hoy)
					dw_grabar_log_caja.setitem(ll_new,'rezago',gs_rezago)
					dw_grabar_log_caja.setitem(ll_new,'usuario',gs_user)
					dw_grabar_log_caja.setitem(ll_new,'total_monto',ll_monto)
					dw_grabar_log_caja.setitem(ll_new,'rut_cliente',gi_rut)
					dw_grabar_log_caja.setitem(ll_new,'caja',gs_caja)
					dw_grabar_log_caja.setitem(ll_new,'cod_observacion',ll_cod_obs)
					dw_grabar_log_caja.setitem(ll_new,'imprimir',is_print)
					dw_grabar_log_caja.setitem(ll_new,'base',gs_base)
					dw_grabar_log_caja.setitem(ll_new,'serie',gs_serie)
					dw_grabar_log_caja.setitem(ll_new,'numero',gi_numero)
				next
				dw_grabar_log_caja.accepttext()
				if dw_grabar_log_caja.update()=1 then
					commit;
					ll_pasa	= 0
					ll_pasa1	= 0
				else
					rollback;
					messagebox("Error Grabar Cupón","Grabación Exitosa")
					ll_pasa++
				end if
			end if

		CASE 2 //CI
			ll_tot_reg		= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
			if ll_tot_reg>0 then
				ll_monto_total		= w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.getitemnumber(1,'c_total')
				ll_new				= dw_grabar_log_caja.insertrow(0)
				dw_grabar_log_caja.scrolltorow(ll_new)
				dw_grabar_log_caja.setitem(ll_new,'correlativo',ll_corr)
				dw_grabar_log_caja.setitem(ll_new,'tipo_cob',gs_tipo_cobro)
				dw_grabar_log_caja.setitem(ll_new,'folio',gl_folio)
				dw_grabar_log_caja.setitem(ll_new,'fecha',ld_fecha_hoy)
				dw_grabar_log_caja.setitem(ll_new,'rezago',gs_rezago)
				dw_grabar_log_caja.setitem(ll_new,'usuario',gs_user)
				dw_grabar_log_caja.setitem(ll_new,'total_monto',ll_monto_total)
				dw_grabar_log_caja.setitem(ll_new,'rut_cliente',gi_rut)
				dw_grabar_log_caja.setitem(ll_new,'caja',gs_caja)
				dw_grabar_log_caja.setitem(ll_new,'cod_observacion',ll_cod_obs)
				dw_grabar_log_caja.setitem(ll_new,'imprimir',is_print)
				dw_grabar_log_caja.setitem(ll_new,'base',gs_base)
				dw_grabar_log_caja.setitem(ll_new,'serie',gs_serie)
				dw_grabar_log_caja.setitem(ll_new,'numero',gi_numero)
				for ll_indi=1 to ll_tot_reg
					ls_tipo_cob_otro	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro')
					if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro='0'
					ls_tipo_cob			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemstring(ll_indi,'tipo_cob')
					ll_cantidad			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_indi,'cantidad')
					ll_monto				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_indi,'c_total_linea')
					ll_new				= dw_grabar_log_caja_detalle.insertrow(0)
					dw_grabar_log_caja_detalle.scrolltorow(ll_new)
					dw_grabar_log_caja_detalle.setitem(ll_new,'correlativo',ll_corr)
					dw_grabar_log_caja_detalle.setitem(ll_new,'tipo_mov',ls_tipo_cob)
					dw_grabar_log_caja_detalle.setitem(ll_new,'codigo_otro',ls_tipo_cob_otro)
					dw_grabar_log_caja_detalle.setitem(ll_new,'cantidad',ll_cantidad)
					dw_grabar_log_caja_detalle.setitem(ll_new,'monto',ll_monto)
				next
				dw_grabar_log_caja.accepttext()
				dw_grabar_log_caja_detalle.accepttext()
				if dw_grabar_log_caja.update()=1 then
					commit;
					DELETE FROM "DETALLE_CUPON_CI"  
					WHERE	(( "DETALLE_CUPON_CI"."TIPO_COB" = :gs_tipo_cobro ) or ( "DETALLE_CUPON_CI"."TIPO_COB" = 'CU' )) AND  
							( "DETALLE_CUPON_CI"."FOLIO" = :gl_folio ) AND  
							( "DETALLE_CUPON_CI"."FECHA" = :ld_fecha_hoy )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					ll_pasa	= 0
					if dw_grabar_log_caja_detalle.update()=1 then
						commit;
						ll_pasa1	= 0
					else
						messagebox("Error Grabar CI","Grabación Exitosa")
						ll_pasa1++
					end if
				else
					rollback;
					messagebox("Error Grabar CI","Grabación Exitosa")
					ll_pasa++
				end if
			end if

		CASE 3 //BL
			ll_tot_reg		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
			if ll_tot_reg>0 then
				ll_monto_total		= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber(1,'c_total')
				ll_new				= dw_grabar_log_caja.insertrow(0)
				dw_grabar_log_caja.scrolltorow(ll_new)
				dw_grabar_log_caja.setitem(ll_new,'correlativo',ll_corr)
				dw_grabar_log_caja.setitem(ll_new,'tipo_cob',gs_tipo_cobro)
				dw_grabar_log_caja.setitem(ll_new,'folio',gl_folio)
				dw_grabar_log_caja.setitem(ll_new,'fecha',ld_fecha_hoy)
				dw_grabar_log_caja.setitem(ll_new,'rezago',gs_rezago)
				dw_grabar_log_caja.setitem(ll_new,'usuario',gs_user)
				dw_grabar_log_caja.setitem(ll_new,'total_monto',ll_monto_total)
				dw_grabar_log_caja.setitem(ll_new,'rut_cliente',gi_rut)
				dw_grabar_log_caja.setitem(ll_new,'caja',gs_caja)
				dw_grabar_log_caja.setitem(ll_new,'cod_observacion',ll_cod_obs)
				dw_grabar_log_caja.setitem(ll_new,'imprimir',is_print)
				dw_grabar_log_caja.setitem(ll_new,'base',gs_base)
				dw_grabar_log_caja.setitem(ll_new,'serie',gs_serie)
				dw_grabar_log_caja.setitem(ll_new,'numero',gi_numero)
				for ll_indi=1 to ll_tot_reg
					ls_tipo_cob_otro	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_indi,'tipo_cob_otro')
					if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro='0'
					ls_tipo_cob			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_indi,'tipo_cob')
					ll_cantidad			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'cantidad')
					ll_monto				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_indi,'c_total_linea')
					ll_new				= dw_grabar_log_caja_detalle.insertrow(0)
					dw_grabar_log_caja_detalle.scrolltorow(ll_new)
					dw_grabar_log_caja_detalle.setitem(ll_new,'correlativo',ll_corr)
					dw_grabar_log_caja_detalle.setitem(ll_new,'tipo_mov',ls_tipo_cob)
					dw_grabar_log_caja_detalle.setitem(ll_new,'codigo_otro',ls_tipo_cob_otro)
					dw_grabar_log_caja_detalle.setitem(ll_new,'cantidad',ll_cantidad)
					dw_grabar_log_caja_detalle.setitem(ll_new,'monto',ll_monto)
				next
				dw_grabar_log_caja.accepttext()
				dw_grabar_log_caja_detalle.accepttext()
				if dw_grabar_log_caja.update()=1 then
					commit;
					ll_pasa	= 0
					if dw_grabar_log_caja_detalle.update()=1 then
						commit;
						ll_pasa1	= 0
					else
						messagebox("Error Grabar BL","Grabación Exitosa")
						ll_pasa1++
					end if
				else
					rollback;
					messagebox("Error Grabar BL","Grabación Exitosa")
					ll_pasa++
				end if
				DELETE FROM "INGRESO_NEWSING"  
				WHERE 	( "INGRESO_NEWSING"."FOLIO" = :gl_folio ) AND  
//							(( "INGRESO_NEWSING"."TIPO_COB" = :gs_tipo_cobro ) OR ( "INGRESO_NEWSING"."TIPO_COB" = 'CU' )) AND  
							( "INGRESO_NEWSING"."FECHA_PAGO" = :ld_fecha_hoy ) AND  
							( "INGRESO_NEWSING"."CONTRATO" = :gi_numero ) AND  
							( "INGRESO_NEWSING"."COD_CAJA" = :gs_caja ) AND  
							( "INGRESO_NEWSING"."RUT" = :gi_rut )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				DELETE FROM "INGRESO_NEWSING_CABECERA"  
				WHERE //	(( "INGRESO_NEWSING_CABECERA"."TIPO_COB" = :gs_tipo_cobro ) OR ( "INGRESO_NEWSING_CABECERA"."TIPO_COB" = 'CU' )) AND  
							( "INGRESO_NEWSING_CABECERA"."FOLIO" = :gl_folio ) AND  
							( "INGRESO_NEWSING_CABECERA"."FECHA_PAGO" = :ld_fecha_hoy ) AND  
							( "INGRESO_NEWSING_CABECERA"."COD_CAJA" = :gs_caja ) AND  
							( "INGRESO_NEWSING_CABECERA"."RUT_CLIENTE" = :gi_rut )   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if

				DELETE FROM "DOCUMENTOS_NEWSING"  
				WHERE 	( "DOCUMENTOS_NEWSING"."FOLIO" = :gl_folio ) AND  
//							(( "DOCUMENTOS_NEWSING"."TIPO_COB" = :gs_tipo_cobro ) OR ( "DOCUMENTOS_NEWSING"."TIPO_COB" = 'CU' )) AND  
							( "DOCUMENTOS_NEWSING"."FECHA_PAGO" = :ld_fecha_hoy ) AND  
							( "DOCUMENTOS_NEWSING"."COD_CAJA" = :gs_caja )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
				DELETE FROM "CLIENTE_REZAGO"  
				WHERE 		( "CLIENTE_REZAGO"."RUT" = :gi_rut ) AND  
								( "CLIENTE_REZAGO"."BASE" = :gs_base ) AND  
								( "CLIENTE_REZAGO"."SERIE" = :gs_serie ) AND  
								( "CLIENTE_REZAGO"."NUMERO" = :gi_numero ) AND  
//								(( "CLIENTE_REZAGO"."COD_PAGO" = :gs_tipo_cobro ) OR ( "CLIENTE_REZAGO"."COD_PAGO" = 'CU' )) AND  
								( "CLIENTE_REZAGO"."FOLIO" = :gl_folio ) AND  
								( "CLIENTE_REZAGO"."FECHA_PAGO" = :ld_fecha_hoy )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				DELETE FROM "INGRESO"  
				WHERE 	( "INGRESO"."FOLIO" = :gl_folio ) AND  
							(( "INGRESO"."TIPO_COB" = :gs_tipo_cobro ) OR ( "INGRESO"."TIPO_COB" = 'CU' )) AND  
							( "INGRESO"."FECHA_PAGO" = :ld_fecha_hoy ) AND  
							( "INGRESO"."CONTRATO" = :gi_numero ) AND  
							( "INGRESO"."COD_CAJA" = :gs_caja ) AND  
							( "INGRESO"."RUT" = :gi_rut )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				DELETE FROM "INGRE"  
				WHERE 	( "INGRE"."FOLIO" = :gl_folio ) AND  
							(( "INGRE"."TIPO_COB" = :gs_tipo_cobro ) OR ( "INGRE"."TIPO_COB" = 'CU' )) AND  
							( "INGRE"."FECHA_PAGO" = :ld_fecha_hoy ) AND  
							( "INGRE"."CONTRATO" = :gi_numero ) AND  
							( "INGRE"."COD_CAJA" = :gs_caja ) AND  
							( "INGRE"."RUT" = :gi_rut )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
				DELETE FROM "DOCUMENTOS"  
				WHERE 	( "DOCUMENTOS"."FOLIO" = :gl_folio ) AND  
							(( "DOCUMENTOS"."TIPO_COB" = :gs_tipo_cobro ) OR ( "DOCUMENTOS"."TIPO_COB" = 'CU' )) AND  
							( "DOCUMENTOS"."FECHA_PAGO" = :ld_fecha_hoy ) AND  
							( "DOCUMENTOS"."COD_CAJA" = :gs_caja )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				DELETE FROM "DOC_COB"  
				WHERE 	( "DOC_COB"."FOLIO" = :gl_folio ) AND  
							(( "DOC_COB"."TIPO_COB" = :gs_tipo_cobro ) OR ( "DOC_COB"."TIPO_COB" = 'CU' )) AND  
							( "DOC_COB"."FECHA_PAGO" = :ld_fecha_hoy ) AND  
							( "DOC_COB"."COD_CAJA" = :gs_caja )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
				DELETE FROM "CUPONERAS_DETALLE_WEB"  
				WHERE 	( "CUPONERAS_DETALLE_WEB"."RUT" = :gi_rut ) AND  
							( "CUPONERAS_DETALLE_WEB"."NRO_CUPON" = :gl_folio ) AND  
//							( "CUPONERAS_DETALLE_WEB"."FOLIO_PAGO" = :gl_folio ) AND  
							( "CUPONERAS_DETALLE_WEB"."FECHA_PAGO" = :ld_fecha_hoy ) AND  
							( "CUPONERAS_DETALLE_WEB"."COD_CAJA" = :gs_caja )   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if

				UPDATE 	"CUPONERAS_DETALLE"  
				SET 		"ESTADO_PAGO_CUPON" = 'V',   
							"TIPO_COB_PAGO" = null,   
							"FOLIO_PAGO" = null,   
							"FECHA_PAGO" = null  ,
							"MONTO_CUOTA_PESO" = null
				WHERE 	"CUPONERAS_DETALLE"."NRO_CUPON" = :gl_folio  AND
							"CUPONERAS_DETALLE"."BASE" = :gs_base  AND
							"CUPONERAS_DETALLE"."SERIE" = :gs_serie  AND
							"CUPONERAS_DETALLE"."NUMERO" = :gi_numero
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				ll_count_f				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
				if ll_count_f > 0 then
					ll_fila_f				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.find(" tipo_cob='F' ",1,ll_count_f)
					if ll_fila_f > 0 then
						ll_cantidad_f	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_f,'cantidad')
						ll_monto_f		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_f,'monto')
						
						if gs_base='O' then
							SELECT	"OFERTA_V"."TOT_PAGADO_M",   
										"OFERTA_V"."CTA_PAG_M"  
							INTO 		:ll_total_pagado,   
										:ll_CTA_PAG_S  
							FROM 		"OFERTA_V"  
							WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
							ll_CTA_PAG_S		= ll_CTA_PAG_S - ll_cantidad_f
							ll_total_pagado 	= ll_total_pagado - ll_monto_f
			
							UPDATE	"OFERTA_V"  
							SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
										"TOT_PAGADO_M" = :ll_total_pagado  
							WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero )
							USING		sqlca;
						elseif gs_base='C' then
							SELECT	"CONTRATO"."TOT_PAGADO",   
										"CONTRATO"."CTA_PAG_M"  
							INTO 		:ll_total_pagado,   
										:ll_CTA_PAG_S  
							FROM 		"CONTRATO"  
							WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
									 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );    
			
							ll_CTA_PAG_S		= ll_CTA_PAG_S - ll_cantidad_f
							ll_total_pagado 	= ll_total_pagado - ll_monto_f
			
							UPDATE	"CONTRATO"  
							SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
										"TOT_PAGADO" = :ll_total_pagado  
							WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
									 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero )
							USING		sqlca;
						end if
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
				end if
//				ll_count_mov				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
//				if ll_count_mov > 0 then
//					ll_fila_mov				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.find(" tipo_cob='E' or tipo_cob='U' or tipo_cob='A' or tipo_cob='Q' or tipo_cob='K' ",1,ll_count_mov)
//					if ll_fila_mov > 0 then
//						ll_cantidad_mov	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_mov,'cantidad')
//						ll_monto_mov		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemnumber(ll_fila_mov,'monto')
//						ls_cod_mov			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getitemstring(ll_fila_mov,'tipo_cob')
//						f_actualizar_desistir_credito(ls_cod_mov,ll_monto_mov,ll_cantidad_mov)
//					end if
//				end if
				
				DECLARE sp_cadena_mora_cta_cte PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
				EXECUTE sp_cadena_mora_cta_cte;
				else
			end if
//			
//		CASE 4 //Reprog.
//			ll_tot_reg		= w_ingreso2.tab_ingreso.tp_repacta_bl_mant.dw_detalle_bl_repacta.rowcount()
//			if ll_tot_reg>0 then
//				ll_monto_total		= w_ingreso2.tab_ingreso.tp_repacta_bl_mant.dw_gastos_bl_repacta.getitemnumber(1,'c_total')
//				ll_new				= dw_grabar_log_caja.insertrow(0)
//				dw_grabar_log_caja.scrolltorow(ll_new)
//				dw_grabar_log_caja.setitem(ll_new,'correlativo',ll_corr)
//				dw_grabar_log_caja.setitem(ll_new,'tipo_cob',gs_tipo_cobro)
//				dw_grabar_log_caja.setitem(ll_new,'folio',gl_folio)
//				dw_grabar_log_caja.setitem(ll_new,'fecha',ld_fecha_hoy)
//				dw_grabar_log_caja.setitem(ll_new,'rezago',gs_rezago)
//				dw_grabar_log_caja.setitem(ll_new,'usuario',gs_user)
//				dw_grabar_log_caja.setitem(ll_new,'total_monto',ll_monto_total)
//				dw_grabar_log_caja.setitem(ll_new,'rut_cliente',gi_rut)
//				dw_grabar_log_caja.setitem(ll_new,'caja',gs_caja)
//				dw_grabar_log_caja.setitem(ll_new,'cod_observacion',ll_cod_obs)
//				dw_grabar_log_caja.setitem(ll_new,'imprimir',is_print)
//				dw_grabar_log_caja.setitem(ll_new,'base',gs_base)
//				dw_grabar_log_caja.setitem(ll_new,'serie',gs_serie)
//				dw_grabar_log_caja.setitem(ll_new,'numero',gi_numero)
//				for ll_indi=1 to ll_tot_reg
//					ls_tipo_cob_otro	= w_ingreso2.tab_ingreso.tp_repacta_bl_mant.dw_detalle_bl_repacta.getitemstring(ll_indi,'tipo_cob_otro')
//					if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro='0'
//					ls_tipo_cob			= w_ingreso2.tab_ingreso.tp_repacta_bl_mant.dw_detalle_bl_repacta.getitemstring(ll_indi,'tipo_cob')
//					ll_cantidad			= w_ingreso2.tab_ingreso.tp_repacta_bl_mant.dw_detalle_bl_repacta.getitemnumber(ll_indi,'cantidad')
//					ll_monto				= w_ingreso2.tab_ingreso.tp_repacta_bl_mant.dw_detalle_bl_repacta.getitemnumber(ll_indi,'c_total_linea')
//					ll_new				= dw_grabar_log_caja_detalle.insertrow(0)
//					dw_grabar_log_caja_detalle.scrolltorow(ll_new)
//					dw_grabar_log_caja_detalle.setitem(ll_new,'correlativo',ll_corr)
//					dw_grabar_log_caja_detalle.setitem(ll_new,'tipo_mov',ls_tipo_cob)
//					dw_grabar_log_caja_detalle.setitem(ll_new,'codigo_otro',ls_tipo_cob_otro)
//					dw_grabar_log_caja_detalle.setitem(ll_new,'cantidad',ll_cantidad)
//					dw_grabar_log_caja_detalle.setitem(ll_new,'monto',ll_monto)
//				next
//				dw_grabar_log_caja.accepttext()
//				dw_grabar_log_caja_detalle.accepttext()
//				if dw_grabar_log_caja.update()=1 then
//					commit;
//					ll_pasa	= 0
//					if dw_grabar_log_caja_detalle.update()=1 then
//						commit;
//						ll_pasa1	= 0
//					else
//						messagebox("Error Grabar BL Reprog. Mant.","Grabación Exitosa")
//						ll_pasa1++
//					end if
//				else
//					rollback;
//					messagebox("Error Grabar BL Reprog. Mant.","Grabación Exitosa")
//					ll_pasa++
//				end if
//			end if
	END CHOOSE
	if ll_pasa=0 and ll_pasa1=0 then 
		messagebox("Grabar","Se Grabó el Motivo por No Aceptar este Pago")
		if isvalid(w_forma_pago2) then close(w_forma_pago2)
		CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
			CASE 1 //Cupón
				w_ingreso2.tab_ingreso.tp_cupon.cb_limpiar_cupon.triggerevent(clicked!)
			CASE 2
				w_ingreso2.tab_ingreso.tp_ci.cb_ci_borrar.triggerevent(clicked!)
			CASE 3
				w_ingreso2.tab_ingreso.tp_be.cb_be_borrar.triggerevent(clicked!)
			CASE 4
				w_ingreso2.tab_ingreso.tp_porfacturar.cb_limpiar_factura.triggerevent(clicked!)
		END CHOOSE
		close(w_observacion_no_grabar_comprobante)
	end if
else
	messagebox("Advertencia","Debe Ingresar Observación")
	dw_observacion.setfocus()
end if
SetPointer(Arrow!)
end event

type dw_observacion from datawindow within w_observacion_no_grabar_comprobante
integer x = 32
integer y = 32
integer width = 2569
integer height = 616
integer taborder = 10
string title = "none"
string dataobject = "dwe_ingreso_observacion_caja"
boolean border = false
boolean livescroll = true
end type

