forward
global type w_eliminar_comprobante from window
end type
type cb_eliminar from commandbutton within w_eliminar_comprobante
end type
type st_1 from statictext within w_eliminar_comprobante
end type
type ddlb_tipo_cob from dropdownlistbox within w_eliminar_comprobante
end type
type em_actual from editmask within w_eliminar_comprobante
end type
type pb_ok from picturebutton within w_eliminar_comprobante
end type
type cb_limpiar from commandbutton within w_eliminar_comprobante
end type
type dw_documento from datawindow within w_eliminar_comprobante
end type
type cb_cerrar from commandbutton within w_eliminar_comprobante
end type
type dw_ingreso from datawindow within w_eliminar_comprobante
end type
end forward

global type w_eliminar_comprobante from window
integer width = 3209
integer height = 1888
boolean titlebar = true
string title = "Eliminar Comprobante"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_eliminar cb_eliminar
st_1 st_1
ddlb_tipo_cob ddlb_tipo_cob
em_actual em_actual
pb_ok pb_ok
cb_limpiar cb_limpiar
dw_documento dw_documento
cb_cerrar cb_cerrar
dw_ingreso dw_ingreso
end type
global w_eliminar_comprobante w_eliminar_comprobante

on w_eliminar_comprobante.create
this.cb_eliminar=create cb_eliminar
this.st_1=create st_1
this.ddlb_tipo_cob=create ddlb_tipo_cob
this.em_actual=create em_actual
this.pb_ok=create pb_ok
this.cb_limpiar=create cb_limpiar
this.dw_documento=create dw_documento
this.cb_cerrar=create cb_cerrar
this.dw_ingreso=create dw_ingreso
this.Control[]={this.cb_eliminar,&
this.st_1,&
this.ddlb_tipo_cob,&
this.em_actual,&
this.pb_ok,&
this.cb_limpiar,&
this.dw_documento,&
this.cb_cerrar,&
this.dw_ingreso}
end on

on w_eliminar_comprobante.destroy
destroy(this.cb_eliminar)
destroy(this.st_1)
destroy(this.ddlb_tipo_cob)
destroy(this.em_actual)
destroy(this.pb_ok)
destroy(this.cb_limpiar)
destroy(this.dw_documento)
destroy(this.cb_cerrar)
destroy(this.dw_ingreso)
end on

event open;String	ls_tipo_cob
gf_centrar(w_eliminar_comprobante)
if gs_depto='I' or gs_depto='T' then
	dw_ingreso.settransobject(sqlca)
	dw_documento.settransobject(sqlca)
	DECLARE	x1 CURSOR FOR  
	SELECT 	"COD_PAGO"."TIPO_COB"  
	FROM 		"COD_PAGO"  
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			fetch x1 into :ls_tipo_cob;
			if not isnull(ls_tipo_cob) then
				ddlb_tipo_cob.additem(ls_tipo_cob)
			end if
			setnull(ls_tipo_cob)
		LOOP
	end if
	close x1;
else
	messagebox("Advertencia","Ud. No tiene Acceso a Eliminar Comprobante")
	close(w_eliminar_comprobante)
end if
end event

type cb_eliminar from commandbutton within w_eliminar_comprobante
integer x = 1422
integer y = 1652
integer width = 347
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;String	ls_tipo_cob,ls_tipo_mov,ls_rezago,ls_base,ls_serie,ls_pago_hist,&
			ls_usuario,ls_codigo_otro,ls_cod_caja,ls_asunto,ls_glosa,ls_string
Long		ll_folio,ll_resp,ll_monto,ll_suma_monto,ll_tot_reg,ll_indi,ll_contrato,&
			ll_cuotas_pag,ll_rut,ll_grabar_ingreso,ll_suma_pie,ll_total_pagado_credito,&
			ll_ctas_pagadas_credito,ult_folio,ll_ctas_pagadas_m,ll_ctas_pactadas_pie,&
			ll_ctas_pagadas_pie,ll_suma_ctas_pag_cred,ll_suma_ctas_pag_m,ll_pie_pagado,&
			ll_count
Datetime	ldt_fecha_pago,ldt_servipag
Double	ld_valor_uf

ls_tipo_cob					= trim(ddlb_tipo_cob.text)
ll_folio						= long(em_actual.text)
ll_grabar_ingreso			= 0
ll_suma_monto				= 0
ll_suma_pie					= 0
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 and &
	dw_ingreso.rowcount()>0 and dw_documento.rowcount()>0 then
	ll_resp					= messagebox("Eliminar","Está seguro de Eliminar Comprobante Nº "+ls_tipo_cob+'-'+string(ll_folio,"###,###,###,###,###"),Exclamation!,YesNo!,2)
	if ll_resp=1 then
		ll_tot_reg			= dw_ingreso.rowcount()
		for ll_indi=1 to ll_tot_reg
			ls_base			= dw_ingreso.getitemstring(ll_indi,'base')
			ls_serie			= dw_ingreso.getitemstring(ll_indi,'serie')
			ll_contrato		= dw_ingreso.getitemnumber(ll_indi,'contrato')
			ldt_fecha_pago	= dw_ingreso.getitemdatetime(ll_indi,'fecha_pago')
			ll_cuotas_pag	= dw_ingreso.getitemnumber(ll_indi,'cuotas_pag')
			ls_cod_caja		= dw_ingreso.getitemstring(ll_indi,'cod_caja')
			ll_rut			= dw_ingreso.getitemnumber(ll_indi,'rut')
			ld_valor_uf		= dw_ingreso.getitemnumber(ll_indi,'valor_uf')
			ls_pago_hist	= dw_ingreso.getitemstring(ll_indi,'pago_hist')
			ls_usuario		= dw_ingreso.getitemstring(ll_indi,'usuario')
			ldt_servipag	= dw_ingreso.getitemdatetime(ll_indi,'servipag')
			ls_codigo_otro	= dw_ingreso.getitemstring(ll_indi,'codigo_otro')
			ls_tipo_mov		= dw_ingreso.getitemstring(ll_indi,'tipo_mov')
			ll_monto			= dw_ingreso.getitemnumber(ll_indi,'monto')
			ls_rezago		= dw_ingreso.getitemstring(ll_indi,'rezago')
			if (ls_tipo_mov='A' or ls_tipo_mov='E' or ls_tipo_mov='I' or ls_tipo_mov='K' or &
				ls_tipo_mov='S' or ls_tipo_mov='Q' or ls_tipo_mov='U') and ls_rezago<>'S' and ll_contrato>0 then
				ll_suma_monto					= ll_suma_monto + ll_monto
				if ls_tipo_mov='A' then // pie
					ll_suma_pie					= ll_suma_pie + ll_monto
				end if
				if ls_tipo_mov='E' then //cuota
					ll_suma_ctas_pag_cred	= ll_suma_ctas_pag_cred + ll_cuotas_pag
				end if
			end if
			if ls_tipo_mov='F' then //mantencion
				ll_suma_ctas_pag_m			= ll_suma_ctas_pag_m + ll_cuotas_pag
			end if
			INSERT INTO "LOG_INGRESO"  
						( "FOLIO",		"TIPO_COB",		"FECHA_PAGO",		"TIPO_MOV",		"MONTO",		"CUOTAS_PAG",		"SERIE",		"CONTRATO",		"COD_CAJA",		"VALOR_UF",		"BASE",		"RUT",	"USUARIO",		"REZAGO",	"PAGO_HIST",	"FECHA_SERVIPAG",	"CODIGO_OTRO",		"USUARIO_ELIMINA" )  
			VALUES 	( :ll_folio,	:ls_tipo_cob,	:ldt_fecha_pago,	:ls_tipo_mov,	:ll_monto,	:ll_cuotas_pag,	:ls_serie,	:ll_contrato,	:ls_cod_caja,	:ld_valor_uf,	:ls_base,	:ll_rut,	:ls_usuario,	:ls_rezago,	:ls_pago_hist,	:ldt_servipag,		:ls_codigo_otro,	:gs_user )  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ll_grabar_ingreso ++
			end if
		next
		if ll_grabar_ingreso=ll_tot_reg then
			commit using sqlca;
			if ll_suma_monto>0 or ll_suma_pie>0 or ll_suma_ctas_pag_m>0 then
				if ls_base='O' then // Promesas
					SELECT	"OFERTA_V"."TOT_PAGADO",	"OFERTA_V"."CTA_PAG_S",		"OFERTA_V"."ULT_FOLIO",	"OFERTA_V"."CTA_PAG_M",	"PAGO_OFERTA"."CTAS_PACTADAS_PIE",	"PAGO_OFERTA"."CTAS_PAGADAS_PIE",	"PAGO_OFERTA"."PIE_PAGADO"
					INTO 		:ll_total_pagado_credito,	:ll_ctas_pagadas_credito,	:ult_folio,					:ll_ctas_pagadas_m,		:ll_ctas_pactadas_pie,					:ll_ctas_pagadas_pie,					:ll_pie_pagado
					FROM 		"CADENA",   
								"OFERTA_V",   
								"PAGO_OFERTA"  
					WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
							 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
							 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
							 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
							 (("CADENA"."CODIGO" = :ls_base ) AND  
							 ( "CADENA"."SERIE" = :ls_serie ) AND  
							 ( "CADENA"."NUMERO" = :ll_contrato ) )   
					USING		sqlca;
					if ll_suma_monto>0 then
						if ll_total_pagado_credito>=ll_suma_monto then
							ll_total_pagado_credito	= ll_total_pagado_credito - ll_suma_monto
							ll_ctas_pagadas_credito	= ll_ctas_pagadas_credito - ll_suma_ctas_pag_cred
							UPDATE	"OFERTA_V"  
							SET 		"TOT_PAGADO" = :ll_total_pagado_credito,   
										"CTA_PAG_S" = :ll_ctas_pagadas_credito  
							WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :ll_contrato ) AND  
									 ( "OFERTA_V"."ULT_FOLIO" = :ult_folio )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
					end if
					if ll_suma_pie>0 then
						if ll_pie_pagado>=ll_suma_pie then
							ll_pie_pagado				= ll_pie_pagado - ll_suma_pie
							if ll_ctas_pagadas_pie>0 then
								SELECT	COUNT("DETALLE_PAGO_PIE"."NUMERO")
								INTO 		:ll_count  
								FROM 		"DETALLE_PAGO_PIE"  
								WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :ls_base ) AND  
										 ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie ) AND  
										 ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_contrato ) AND  
										 ( "DETALLE_PAGO_PIE"."TIPO_COB" = :ls_tipo_cob ) AND  
										 ( "DETALLE_PAGO_PIE"."FOLIO" = :ll_folio )   
								USING		sqlca;
								if ll_count>0 then
									ll_ctas_pagadas_pie	= ll_ctas_pagadas_pie - ll_count
									UPDATE	"DETALLE_PAGO_PIE"  
									SET 		"ESTADO" = 'P',   
												"TIPO_COB" = null,   
												"FOLIO" = null,   
												"CAJA" = null,   
												"USUARIO" = null,   
												"FECHA_PAGO" = null,   
												"MONTO_PIE_PAGADO_PESO" = null,   
												"MONTO_PIE_PAGADO_UF" = null  
									WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :ls_base ) AND  
											 ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie ) AND  
											 ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_contrato ) AND  
											 ( "DETALLE_PAGO_PIE"."TIPO_COB" = :ls_tipo_cob ) AND  
											 ( "DETALLE_PAGO_PIE"."FOLIO" = :ll_folio )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
										messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
									end if
								else
									ll_ctas_pagadas_pie	= 0
								end if
							end if
							UPDATE	"PAGO_OFERTA"  
							SET 		"PIE_PAGADO" = :ll_pie_pagado,
										"CTAS_PAGADAS_PIE" = :ll_ctas_pagadas_pie
							WHERE  ( "PAGO_OFERTA"."SERIE" = :ls_serie ) AND  
									 ( "PAGO_OFERTA"."NRO_OFERTA" = :ll_contrato ) AND  
									 ( "PAGO_OFERTA"."FOLIO" = :ult_folio )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
					end if
					if ll_suma_ctas_pag_m>0 then
						if ll_ctas_pagadas_m>=ll_suma_ctas_pag_m then
							ll_ctas_pagadas_m	= ll_ctas_pagadas_m - ll_suma_ctas_pag_m
							UPDATE	"OFERTA_V"  
							SET 		"CTA_PAG_M" = :ll_ctas_pagadas_m  
							WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :ll_contrato ) AND  
									 ( "OFERTA_V"."ULT_FOLIO" = :ult_folio )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
					end if

				elseif ls_base='L' then // Anexo Liberador
					SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",	"ANEXO_LIBERADOR"."CTA_PAG_M",	"PAGO_LIBERADOR"."PIE_PAGADO",	"ANEXO_LIBERADOR"."ULT_FOLIO"
					INTO 		:ll_total_pagado_credito,			:ll_ctas_pagadas_credito,			:ll_pie_pagado,						:ult_folio
					FROM 		"ANEXO_LIBERADOR",   
								"CADENA",   
								"PAGO_LIBERADOR"  
					WHERE	 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
							 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
							 ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
							 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
							 (("CADENA"."CODIGO" = :ls_base ) AND  
							 ( "CADENA"."SERIE" = :ls_serie ) AND  
							 ( "CADENA"."NUMERO" = :ll_contrato ) )   
					USING		sqlca;
					if ll_suma_monto>0 then
						if ll_total_pagado_credito>=ll_suma_monto then
							ll_total_pagado_credito	= ll_total_pagado_credito - ll_suma_monto
							ll_ctas_pagadas_credito	= ll_ctas_pagadas_credito - ll_suma_ctas_pag_cred
							UPDATE	"ANEXO_LIBERADOR"  
							SET 		"TOT_PAGADO" = :ll_total_pagado_credito,   
										"CTA_PAG_M" = :ll_ctas_pagadas_credito  
							WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
									 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ll_contrato ) AND  
									 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = :ult_folio )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
					end if
					if ll_suma_pie>0 then
						if ll_pie_pagado>=ll_suma_pie then
							ll_pie_pagado				= ll_pie_pagado - ll_suma_pie
							UPDATE	"PAGO_LIBERADOR"  
							SET 		"PIE_PAGADO" = :ll_pie_pagado  
							WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
									 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :ll_contrato ) AND  
									 ( "PAGO_LIBERADOR"."FOLIO" = :ult_folio )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
					end if
					
				elseif ls_base='C' then // Contrato Isa
					if ll_suma_ctas_pag_m>0 then
						SELECT	"CONTRATO"."CTA_PAG_M"  
						INTO 		:ll_ctas_pagadas_m  
						FROM 		"CADENA",   
									"CONTRATO"  
						WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
								 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
								 (("CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :ls_serie ) AND  
								 ( "CADENA"."NUMERO" = :ll_contrato ) )   
						USING		sqlca;
						if ll_ctas_pagadas_m>=ll_suma_ctas_pag_m then
							ll_ctas_pagadas_m	= ll_ctas_pagadas_m - ll_suma_ctas_pag_m
							UPDATE	"CONTRATO"  
							SET 		"CTA_PAG_M" = :ll_ctas_pagadas_m
							WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
									 ( "CONTRATO"."NRO_CONTRATO" = :ll_contrato )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
					end if
					
				elseif ls_base='D' then // Derecho Especial
					SELECT	"DERECHO"."TOT_PAGADO",		"DERECHO"."CTA_PAG_LA",		"DERECHO"."PIE_PAGADO"  
					INTO 		:ll_total_pagado_credito,	:ll_ctas_pagadas_credito,	:ll_pie_pagado  
					FROM 		"CADENA",   
								"DERECHO"  
					WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
							 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
							 (("CADENA"."CODIGO" = :ls_base ) AND  
							 ( "CADENA"."SERIE" = :ls_serie ) AND  
							 ( "CADENA"."NUMERO" = :ll_contrato ) )   
					USING		sqlca;
					if ll_suma_monto>0 then
						if ll_total_pagado_credito>=ll_suma_monto then
							ll_total_pagado_credito	= ll_total_pagado_credito - ll_suma_monto
							ll_ctas_pagadas_credito	= ll_ctas_pagadas_credito - ll_suma_ctas_pag_cred
							UPDATE	"DERECHO"  
							SET 		"TOT_PAGADO" = :ll_total_pagado_credito,   
										"CTA_PAG_LA" = :ll_ctas_pagadas_credito  
							WHERE  ( "DERECHO"."SERIE_P" = :ls_serie ) AND  
									 ( "DERECHO"."NRO_PAGARE" = :ll_contrato )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
					end if
					if ll_suma_pie>0 then
						if ll_pie_pagado>=ll_suma_pie then
							ll_pie_pagado				= ll_pie_pagado - ll_suma_pie
							UPDATE	"DERECHO"  
							SET 		"PIE_PAGADO" = :ll_pie_pagado  
							WHERE  ( "DERECHO"."SERIE_P" = :ls_serie ) AND  
									 ( "DERECHO"."NRO_PAGARE" = :ll_contrato )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
					end if
					
				elseif ls_base='P' then //Pagare
					SELECT	"PAGARE"."TOT_PAGADO",		"PAGARE"."PIE_PAGADO",	"PAGARE"."CTA_PAG_LA"  
					INTO 		:ll_total_pagado_credito,	:ll_pie_pagado,			:ll_ctas_pagadas_credito  
					FROM 		"PAGARE",	"CADENA"  
					WHERE  ( "PAGARE"."SERIE_P" = "CADENA"."SERIE" ) and  
							 ( "PAGARE"."NRO_PAGARE" = "CADENA"."NUMERO" ) and  
							 (("CADENA"."CODIGO" = :ls_base ) AND  
							 ( "CADENA"."SERIE" = :ls_serie ) AND  
							 ( "CADENA"."NUMERO" = :ll_contrato ) )   
					USING		sqlca;
					if ll_suma_monto>0 then
						if ll_total_pagado_credito>=ll_suma_monto then
							ll_total_pagado_credito	= ll_total_pagado_credito - ll_suma_monto
							ll_ctas_pagadas_credito	= ll_ctas_pagadas_credito - ll_suma_ctas_pag_cred
							UPDATE	"PAGARE"  
							SET 		"TOT_PAGADO" = :ll_total_pagado_credito,   
										"CTA_PAG_LA" = :ll_ctas_pagadas_credito  
							WHERE  ( "PAGARE"."SERIE_P" = :ls_serie ) AND  
									 ( "PAGARE"."NRO_PAGARE" = :ll_contrato )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
					end if
					if ll_suma_pie>0 then
						if ll_pie_pagado>=ll_suma_pie then
							ll_pie_pagado				= ll_pie_pagado - ll_suma_pie
							UPDATE	"PAGARE"  
							SET 		"PIE_PAGADO" = :ll_pie_pagado  
							WHERE  ( "PAGARE"."SERIE_P" = :ls_serie ) AND  
									 ( "PAGARE"."NRO_PAGARE" = :ll_contrato )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
					end if
					
				elseif ls_base='A' then //Aumento Capacidad
					SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",	"ANEXO_AUMENTO"."CTA_PAG_M",	"ANEXO_AUMENTO"."ULT_FOLIO",	"PAGO_AUMENTO"."PIE_PAGADO"  
					INTO 		:ll_total_pagado_credito,		:ll_ctas_pagadas_credito,		:ult_folio,							:ll_pie_pagado  
					FROM 		"ANEXO_AUMENTO",	"CADENA",	"PAGO_AUMENTO"  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
							 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
							 ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
							 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
							 (("CADENA"."CODIGO" = :ls_base ) AND  
							 ( "CADENA"."SERIE" = :ls_serie ) AND  
							 ( "CADENA"."NUMERO" = :ll_contrato ) )   
					USING		sqlca;
					if ll_suma_monto>0 then
						if ll_total_pagado_credito>=ll_suma_monto then
							ll_total_pagado_credito	= ll_total_pagado_credito - ll_suma_monto
							ll_ctas_pagadas_credito	= ll_ctas_pagadas_credito - ll_suma_ctas_pag_cred
							UPDATE	"ANEXO_AUMENTO"  
							SET 		"TOT_PAGADO" = :ll_total_pagado_credito,   
										"CTA_PAG_M" = :ll_ctas_pagadas_credito  
							WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
									 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ll_contrato ) AND  
									 ( "ANEXO_AUMENTO"."ULT_FOLIO" = :ult_folio )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
					end if
					if ll_suma_pie>0 then
						if ll_pie_pagado>=ll_suma_pie then
							ll_pie_pagado				= ll_pie_pagado - ll_suma_pie
							UPDATE	"PAGO_AUMENTO"  
							SET 		"PIE_PAGADO" = :ll_pie_pagado  
							WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
									 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :ll_contrato ) AND  
									 ( "PAGO_AUMENTO"."FOLIO" = :ult_folio )    
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
					end if
				end if
			end if
			DELETE FROM "INGRESO"  
			WHERE	( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
					( "INGRESO"."FOLIO" = :ll_folio )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				ll_tot_reg			= dw_ingreso.rowcount()
				for ll_indi=1 to ll_tot_reg
					ls_base			= dw_ingreso.getitemstring(ll_indi,'base')
					ls_serie			= dw_ingreso.getitemstring(ll_indi,'serie')
					ll_contrato		= dw_ingreso.getitemnumber(ll_indi,'contrato')
					ldt_fecha_pago	= dw_ingreso.getitemdatetime(ll_indi,'fecha_pago')
					ll_cuotas_pag	= dw_ingreso.getitemnumber(ll_indi,'cuotas_pag')
					ls_cod_caja		= dw_ingreso.getitemstring(ll_indi,'cod_caja')
					ll_rut			= dw_ingreso.getitemnumber(ll_indi,'rut')
					ld_valor_uf		= dw_ingreso.getitemnumber(ll_indi,'valor_uf')
					ls_pago_hist	= dw_ingreso.getitemstring(ll_indi,'pago_hist')
					ls_usuario		= dw_ingreso.getitemstring(ll_indi,'usuario')
					ldt_servipag	= dw_ingreso.getitemdatetime(ll_indi,'servipag')
					ls_codigo_otro	= dw_ingreso.getitemstring(ll_indi,'codigo_otro')
					ls_tipo_mov		= dw_ingreso.getitemstring(ll_indi,'tipo_mov')
					ll_monto			= dw_ingreso.getitemnumber(ll_indi,'monto')
					ls_rezago		= dw_ingreso.getitemstring(ll_indi,'rezago')
					ll_folio			= dw_ingreso.getitemnumber(ll_indi,'folio')
					ls_tipo_cob		= dw_ingreso.getitemstring(ll_indi,'tipo_cob')
					if ls_tipo_mov='E' then
						UPDATE	"CUPONERAS_DETALLE"  
						SET 		"ESTADO_PAGO_CUPON" = 'V',   
									"TIPO_COB_PAGO" = null,   
									"FOLIO_PAGO" = null,   
									"FECHA_PAGO" = null,   
									"MONTO_CUOTA_PESO" = 0,
									"MONTO_INTERES_MORA" = 0,   
									"MONTO_GASTO_COBRANZA" = 0  
						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_contrato ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'C' ) AND
								 ( "CUPONERAS_DETALLE"."TIPO_COB_PAGO" = :ls_tipo_cob ) AND  
								 ( "CUPONERAS_DETALLE"."FOLIO_PAGO" = :ll_folio )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if

					elseif ls_tipo_mov='F' then
						UPDATE	"CUPONERAS_DETALLE"  
						SET 		"ESTADO_PAGO_CUPON" = 'V',   
									"TIPO_COB_PAGO" = null,   
									"FOLIO_PAGO" = null,   
									"FECHA_PAGO" = null,   
									"MONTO_CUOTA_PESO" = 0,
									"MONTO_INTERES_MORA" = 0,   
									"MONTO_GASTO_COBRANZA" = 0  
						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_contrato ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'C' ) AND
								 ( "CUPONERAS_DETALLE"."TIPO_COB_PAGO" = :ls_tipo_cob ) AND  
								 ( "CUPONERAS_DETALLE"."FOLIO_PAGO" = :ll_folio )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
				next
				DELETE FROM "INGRE"  
				WHERE	( "INGRE"."TIPO_COB" = :ls_tipo_cob ) AND  
						( "INGRE"."FOLIO" = :ll_folio )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					DELETE FROM "DOCUMENTOS"  
					WHERE	( "DOCUMENTOS"."TIPO_COB" = :ls_tipo_cob ) AND  
							( "DOCUMENTOS"."FOLIO" = :ll_folio )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						DELETE FROM "DOC_COB"  
						WHERE	( "DOC_COB"."TIPO_COB" = :ls_tipo_cob ) AND  
								( "DOC_COB"."FOLIO" = :ll_folio )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
							DELETE FROM "CLIENTE_REZAGO"  
							WHERE 	( "CLIENTE_REZAGO"."COD_PAGO" = :ls_tipo_cob ) AND  
										( "CLIENTE_REZAGO"."FOLIO" = :ll_folio )  AND	
										( "CLIENTE_REZAGO"."ESTADO" <> 'T' )
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
								DELETE FROM "DETALLE_PAGO_PIE_COMPROBANTE"  
								WHERE 	( "DETALLE_PAGO_PIE_COMPROBANTE"."TIPO_COB" = :ls_tipo_cob ) AND  
											( "DETALLE_PAGO_PIE_COMPROBANTE"."FOLIO" = :ll_folio )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							else
								rollback;
							end if
							DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base,:ls_serie,:ll_contrato,'M');
							EXECUTE sp_nuevo_cadena_mora;
							
							SELECT	sysdate  
							INTO 		:gdt_fec_sistema  
							FROM 		"TASA"  ;
							ls_asunto	= 'Envio Email Eliminación de Comprobante '+ls_tipo_cob+'-'+string(ll_folio,"###,###,###,###,###")
							ls_glosa		= 'Se Elimina Comprobante Nº '+ls_tipo_cob+'-'+string(ll_folio,"###,###,###,###,###")+', el día '+string(gdt_fec_sistema)+' por '+gs_nom_comp_usuario+',   OBSERVACION: '
							ls_string	= ls_asunto+'~t'+ls_glosa+'~t'+ls_tipo_cob+'~t'+string(ll_folio)
							openwithparm(w_enviar_email_documento_eliminado,ls_string)
							messagebox("Eliminar","Eliminación Exitosa")
							cb_limpiar.triggerevent(clicked!)
						else
							rollback;
							messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
						end if
					else
						rollback;
						messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
					end if
				else
					rollback;
					messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
				end if
			else
				rollback;
				messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
			end if
		else
			rollback using sqlca;
			messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type st_1 from statictext within w_eliminar_comprobante
integer x = 27
integer y = 68
integer width = 366
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comprobante"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_tipo_cob from dropdownlistbox within w_eliminar_comprobante
integer x = 411
integer y = 56
integer width = 293
integer height = 376
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String	ls_tipo_cob
Long		ll_folio
dw_ingreso.reset()
dw_documento.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then pb_ok.triggerevent(clicked!)

end event

type em_actual from editmask within w_eliminar_comprobante
integer x = 727
integer y = 56
integer width = 416
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
end type

event modified;String	ls_tipo_cob
Long		ll_folio
dw_ingreso.reset()
dw_documento.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then pb_ok.triggerevent(clicked!)

end event

type pb_ok from picturebutton within w_eliminar_comprobante
integer x = 1193
integer y = 28
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;String	ls_tipo_cob
Long		ll_folio
dw_ingreso.reset()
dw_documento.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	if dw_ingreso.retrieve(ls_tipo_cob,ll_folio)=0 then
		messagebox("Advertencia","No Registra dato")
	else
		dw_documento.retrieve(ls_tipo_cob,ll_folio)
	end if
end if
end event

type cb_limpiar from commandbutton within w_eliminar_comprobante
integer x = 37
integer y = 1652
integer width = 347
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;String	ls_tipo_cob
dw_ingreso.reset()
dw_documento.reset()
ddlb_tipo_cob.reset()
em_actual.text	= ''
DECLARE	x1 CURSOR FOR  
SELECT 	"COD_PAGO"."TIPO_COB"  
FROM 		"COD_PAGO"  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_tipo_cob;
		if not isnull(ls_tipo_cob) then
			ddlb_tipo_cob.additem(ls_tipo_cob)
		end if
		setnull(ls_tipo_cob)
	LOOP
end if
close x1;
ddlb_tipo_cob.setfocus()
end event

type dw_documento from datawindow within w_eliminar_comprobante
integer x = 37
integer y = 928
integer width = 3118
integer height = 684
integer taborder = 50
boolean titlebar = true
string title = "Lista Tabla DOCUMENTO"
string dataobject = "dw_lista_documentos_eliminar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

type cb_cerrar from commandbutton within w_eliminar_comprobante
integer x = 2807
integer y = 1652
integer width = 347
integer height = 100
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_eliminar_comprobante)
end event

type dw_ingreso from datawindow within w_eliminar_comprobante
integer x = 37
integer y = 204
integer width = 3118
integer height = 684
integer taborder = 40
boolean titlebar = true
string title = "Lista Tabla INGRESO"
string dataobject = "dw_lista_eliminar_tabla_ingreso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

