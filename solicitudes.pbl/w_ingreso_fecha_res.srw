forward
global type w_ingreso_fecha_res from window
end type
type p_fecha from picture within w_ingreso_fecha_res
end type
type em_fecha from editmask within w_ingreso_fecha_res
end type
type st_1 from statictext within w_ingreso_fecha_res
end type
type cb_grabar from commandbutton within w_ingreso_fecha_res
end type
type gb_1 from groupbox within w_ingreso_fecha_res
end type
end forward

global type w_ingreso_fecha_res from window
integer width = 1038
integer height = 676
boolean titlebar = true
string title = "Fecha Resciliación"
windowtype windowtype = response!
long backcolor = 67108864
p_fecha p_fecha
em_fecha em_fecha
st_1 st_1
cb_grabar cb_grabar
gb_1 gb_1
end type
global w_ingreso_fecha_res w_ingreso_fecha_res

type variables
string	is_tipo_sol

end variables

on w_ingreso_fecha_res.create
this.p_fecha=create p_fecha
this.em_fecha=create em_fecha
this.st_1=create st_1
this.cb_grabar=create cb_grabar
this.gb_1=create gb_1
this.Control[]={this.p_fecha,&
this.em_fecha,&
this.st_1,&
this.cb_grabar,&
this.gb_1}
end on

on w_ingreso_fecha_res.destroy
destroy(this.p_fecha)
destroy(this.em_fecha)
destroy(this.st_1)
destroy(this.cb_grabar)
destroy(this.gb_1)
end on

event open;gf_centrar(w_ingreso_fecha_res)
is_tipo_sol		= Message.StringParm
em_fecha.text	= string(date(gdt_fec_sistema),"dd/mm/yyyy")
end event

type p_fecha from picture within w_ingreso_fecha_res
integer x = 754
integer y = 168
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;//em_fecha_ini.text	= string(idt_fecha_hoy)
if f_valida_fecha(em_fecha.text)=-1 then 
	em_fecha.text = string(date(gdt_fec_sistema),'dd/mm/yyyy') //gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,em_fecha.text)
IF not isnull(Message.StringParm) THEN
	em_fecha.text	= trim(Message.StringParm)
	em_fecha.triggerevent(modified!)
END IF
end event

type em_fecha from editmask within w_ingreso_fecha_res
integer x = 366
integer y = 168
integer width = 379
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_1 from statictext within w_ingreso_fecha_res
integer x = 123
integer y = 184
integer width = 210
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_ingreso_fecha_res
integer x = 55
integer y = 424
integer width = 517
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar Fecha Res."
end type

event clicked;datetime	ldt_fecha,ldt_fecha_hoy,ldt_fecha_com,ldt_fecha_promesa
long		ll_resp,ll_corr,ll_monto,ll_tot_pagado,ll_ctas_pag_pie,ll_suma_tot_pagado,ll_pie_pagado_cs,ll_suma_pie_pagado,ll_ctas_pac_pie,ll_cod_parque,ll_hora,ll_min
String	ls_estado,ls_base_new,ls_serie_new,ls_estado_comi,ls_estado_comi_sup,ls_cod_age,ls_cod_sup,&
			ls_cod_jef,ls_estado_age,ls_estado_sup,ls_estado_jef,ls_base_cs,ls_serie_cs,ls_moneda_reprog,&
			ls_serie_c
time		lt_hora
Double	ldb_precio,ldb_porce_venta,ldb_porce_sup,ldb_porce_jefe,ldb_sum_porce,ldb_saldo_porce,&
			ldb_nvo_saldo,ldb_nvo_saldo_age,ldb_nvo_saldo_sup,ldb_nvo_saldo_jef,ldb_capital_pagado,&
			ldb_uf_reprog,ll_numero_new,ll_ult_folio,ll_folio,ll_numero_cs,ll_numero_c,ll_ult_folio_cs

//ll_resp = MessageBox("Advertencia", "Desea Grabar Fecha Resciliación", Exclamation!, YesNo!, 2)
//IF ll_resp = 1 THEN
	SELECT sysdate 	INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
	ll_hora			= long(string(gdt_fec_sistema,'hh'))
	ll_min				= long(string(gdt_fec_sistema,'mm'))
	lt_hora			= time("00:00:00")
	ldt_fecha			= datetime(date(em_fecha.text),lt_hora)
	ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),lt_hora)
	SELECT	"TAB_UF"."VALOR_UF" INTO :gd_uf_dia FROM "TAB_UF" WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   ;
	if is_tipo_sol = "1" then
		ls_estado	=	"N"
	elseif is_tipo_sol = "2" then
		ls_estado	=	"P"
	end if
	UPDATE	"CADENA"  
	SET 		"ESTADO" = :ls_estado,
				"FECHA_RES" = :ldt_fecha
	WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
				( "CADENA"."SERIE" = :gs_serie ) AND  
				( "CADENA"."NUMERO" = :gi_numero )   
	Using		sqlca ;
	if sqlca.sqlcode=0 then
		commit;
		if is_tipo_sol = "2" then
			if isvalid(w_detalle_solicitudes) then
				ll_corr	= w_detalle_solicitudes.dw_reporte.getitemnumber(w_detalle_solicitudes.dw_reporte.getrow(),'sol_estatus_correlativo')
			end if
			if isvalid(w_estado_informes) then
				ll_corr	= w_estado_informes.dw_lista.getitemnumber(w_estado_informes.dw_lista.getrow(),'correlativo')
			end if
			if gs_base='P' and is_tipo_sol = "2" then
				SELECT	"PAGARE"."SERIE",   
							"PAGARE"."NRO_OFERTA"  
				INTO 		:ls_serie_c,   
							:ll_numero_c  
				FROM 	"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						   ( "PAGARE"."NRO_PAGARE" = :gi_numero )   
				USING	sqlca;
				if sqlca.sqlcode=0 and ll_numero_c > 0 then
					UPDATE	"CADENA"  
					SET 		"ESTADO" = :ls_estado,
								"FECHA_RES" = :ldt_fecha
					WHERE  ( "CADENA"."CODIGO" = 'C' ) AND  
							   ( "CADENA"."SERIE" = :ls_serie_c ) AND  
							   ( "CADENA"."NUMERO" = :ll_numero_c )   
					Using		sqlca ;
					if sqlca.sqlcode=0 then
						commit;
						UPDATE	"SOL_RESCILIA_REPROG"  
						SET		"ESTATUS_OPERACION" = 0,   
									"ESTATUS_INFORMATICA" = 0,   
									"USUARIO_OPERA" = :gs_user,   
									"FECHA_OPERA" = :ldt_fecha_hoy,   
									"USUARIO_INFOR" = :gs_user,   
									"FECHA_INFOR" = :ldt_fecha_hoy  
						WHERE  ( "SOL_RESCILIA_REPROG"."BASE" = 'C' ) AND  
								   ( "SOL_RESCILIA_REPROG"."SERIE" = :ls_serie_c ) AND  
								   ( "SOL_RESCILIA_REPROG"."NUMERO" = :ll_numero_c ) AND  
								   ( "SOL_RESCILIA_REPROG"."CORRELATIVO" = :ll_corr )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					else
						rollback;
					end if
				end if
			end if

			SELECT	"SOL_RESCILIA_REPROG"."BASE_NUEVO",	
						"SOL_RESCILIA_REPROG"."SERIE_NUEVO",   
						"SOL_RESCILIA_REPROG"."NUMERO_NUEVO"  
			INTO 		:ls_base_new,   
						:ls_serie_new,   
						:ll_numero_new  
			FROM 	"SOL_ESTATUS",   
						"SOL_RESCILIA_REPROG"  
			WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_RESCILIA_REPROG"."BASE" ) and  
					 ( "SOL_ESTATUS"."SERIE" = "SOL_RESCILIA_REPROG"."SERIE" ) and  
					 ( "SOL_ESTATUS"."NUMERO" = "SOL_RESCILIA_REPROG"."NUMERO" ) and  
					 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESCILIA_REPROG"."CORRELATIVO" ) and  
					 (("SOL_ESTATUS"."CODIGO_SOLICITUD" = '2' ) AND  
					 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
					 ( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
					 ( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
					 ( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
					 ( "SOL_RESCILIA_REPROG"."CORRELATIVO" = :ll_corr )    )  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_base_new='O' then
					SELECT	"OFERTA_V"."ESTADO_COMI",	"OFERTA_V"."ESTADO_COMI_SUP",	"OFERTA_V"."ULT_FOLIO",	"PAGO_OFERTA"."PRECIO",	"OFERTA_V"."PORCE_VENTA",	"SUPERVISOR"."PORC_SUPERVISOR",	"JEFE_VENTAS"."PORC_JEFE_VTA",	"OFERTA_V"."COD_AGE",	"OFERTA_V"."COD_SUP",	"OFERTA_V"."COD_JEF",	"AGENTES"."ESTADO",	"JEFE_VENTAS"."ESTADO",	"SUPERVISOR"."ESTADO",	"OFERTA_V"."FECHA_COM",	"CADENA"."COD_PARQUE"
					INTO 		:ls_estado_comi,				:ls_estado_comi_sup,				:ll_ult_folio,				:ldb_precio,				:ldb_porce_venta,				:ldb_porce_sup,						:ldb_porce_jefe,						:ls_cod_age,				:ls_cod_sup,				:ls_cod_jef,				:ls_estado_age,		:ls_estado_jef,			:ls_estado_sup,			:ldt_fecha_com,			:ll_cod_parque
					FROM 	"CADENA","OFERTA_V","PAGO_OFERTA","AGENTES","JEFE_VENTAS","SUPERVISOR"   
					WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
							 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
							 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
							 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
							 ( "OFERTA_V"."COD_AGE" = "AGENTES"."COD_AGE" ) and  
				          	 ( "OFERTA_V"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
         				 	 ( "OFERTA_V"."COD_JEF" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
							 (("CADENA"."CODIGO" = :ls_base_new ) AND  
							 ( "CADENA"."SERIE" = :ls_serie_new ) AND  
							 ( "CADENA"."NUMERO" = :ll_numero_new ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if ls_estado_comi='N' or ls_estado_comi='S' or ls_estado_comi='C' then
							if ls_estado_age='A' then
								SELECT	SUM("RES_COMI"."PORC_VENTA")  
								INTO 		:ldb_sum_porce  
								FROM 	"RES_COMI"  
								WHERE  ( "RES_COMI"."COD_AGE_SUP" = :ls_cod_age ) AND  
										 ( "RES_COMI"."COD_CONTABLE" = '023' OR  
											"RES_COMI"."COD_CONTABLE" = '037') AND  
										 ( "RES_COMI"."SERIE" = :gs_serie ) AND  
										 ( "RES_COMI"."CONTRATO" = :gi_numero )  
								USING		sqlca;
								if isnull(ldb_sum_porce) or ldb_sum_porce=0 then ldb_sum_porce=0
								ldb_saldo_porce		= (ldb_porce_venta - ldb_sum_porce)
								ldb_nvo_saldo_age	= (ldb_precio * ldb_saldo_porce) / 100
							end if
						end if
						if ls_estado_comi_sup='N' or ls_estado_comi_sup='S' then
							if ls_estado_sup='A' then
								SELECT	SUM("RES_COMI"."PORC_VENTA")  
								INTO 		:ldb_sum_porce  
								FROM 	"RES_COMI"  
								WHERE  ( "RES_COMI"."COD_AGE_SUP" = :ls_cod_sup ) AND  
										   ( "RES_COMI"."COD_CONTABLE" = '023' OR  
											 "RES_COMI"."COD_CONTABLE" = '037') AND  
										   ( "RES_COMI"."SERIE" = :gs_serie ) AND  
										   ( "RES_COMI"."CONTRATO" = :gi_numero )  
								USING		sqlca;
								if isnull(ldb_sum_porce) or ldb_sum_porce=0 then ldb_sum_porce=0
								ldb_saldo_porce		= (ldb_porce_sup - ldb_sum_porce)
								ldb_nvo_saldo_sup	= (ldb_precio * ldb_saldo_porce) / 100
							end if
							if ls_estado_jef='A' then
								SELECT	SUM("RES_COMI"."PORC_VENTA")  
								INTO 		:ldb_sum_porce  
								FROM 	"RES_COMI"  
								WHERE  ( "RES_COMI"."COD_AGE_SUP" = :ls_cod_jef ) AND  
										   ( "RES_COMI"."COD_CONTABLE" = '023' OR  
											  "RES_COMI"."COD_CONTABLE" = '037') AND  
										   ( "RES_COMI"."SERIE" = :gs_serie ) AND  
										   ( "RES_COMI"."CONTRATO" = :gi_numero )  
								USING		sqlca;
								if isnull(ldb_sum_porce) or ldb_sum_porce=0 then ldb_sum_porce=0
								ldb_saldo_porce	= (ldb_porce_jefe - ldb_sum_porce)
								ldb_nvo_saldo_jef	= (ldb_precio * ldb_saldo_porce) / 100
							end if
						end if
						UPDATE	"OFERTA_V"  
						SET 		"ESTADO_COMI" = :ls_estado_comi,   
									"ESTADO_COMI_SUP" = :ls_estado_comi_sup,
									"FECHA_COM" = :ldt_fecha_com
						WHERE  ( "OFERTA_V"."SERIE" = :ls_serie_new ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_new ) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
						if ls_estado_comi_sup='N' or ls_estado_comi_sup='S' or ls_estado_comi='N' or ls_estado_comi='S' or ls_estado_comi='C' or ll_cod_parque = 103 then
							INSERT INTO   "REPROG_SALDO_COMISION"  
											( "BASE",	"SERIE",			"NUMERO",	"ESTADO_COMI",		"FECHA_PAGO",	"SALDO_MONTO_UF_AGE",	"SALDO_MONTO_UF_SUP",	"SALDO_MONTO_UF_JEFE" )  
							VALUES 		( :gs_base,	:gs_serie,	:gi_numero,	:ls_estado_comi,		null,					:ldb_nvo_saldo_age,			:ldb_nvo_saldo_sup,			:ldb_nvo_saldo_jef )  
							USING			sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
							SELECT	MAX("INGRESO"."FOLIO")  
							INTO 		:ll_folio  
							FROM 	"INGRESO"  
							WHERE 	"INGRESO"."TIPO_COB" = 'CS'   
							USING	sqlca;
							if sqlca.sqlcode=0 then
								if ll_folio>0 then
									ll_folio ++
								else
									ll_folio	= 1
								end if
							else
								ll_folio		= 1
							end if
							SELECT	"REPACTA_CREDITO"."CAPITAL_PAGADO",
										"REPACTA_CREDITO"."BASE",
										"REPACTA_CREDITO"."SERIE",
										"REPACTA_CREDITO"."NUMERO",
										"REPACTA_CREDITO"."UF_DIA",
										"REPACTA_CREDITO"."MONEDA_ORIGINAL"
							INTO 		:ldb_capital_pagado,
										:ls_base_cs,
										:ls_serie_cs,
										:ll_numero_cs,
										:ldb_uf_reprog,
										:ls_moneda_reprog
							FROM 	"REPACTA_CREDITO"  
							WHERE  ( "REPACTA_CREDITO"."BASE_ORIGINAL" = :gs_base ) AND  
									 ( "REPACTA_CREDITO"."SERIE_ORIGINAL" = :gs_serie ) AND  
									 ( "REPACTA_CREDITO"."NUMERO_ORIGINAL" = :gi_numero ) AND
									 ( "REPACTA_CREDITO"."ESTADO" = 'V' ) AND 
									 ( "REPACTA_CREDITO"."FECHA_CREA" = ( 	SELECT	max("REPACTA_CREDITO"."FECHA_CREA")
																								FROM 	"REPACTA_CREDITO"  
																								WHERE  ( "REPACTA_CREDITO"."BASE_ORIGINAL" = :gs_base ) AND  
																										   ( "REPACTA_CREDITO"."SERIE_ORIGINAL" = :gs_serie ) AND  
																								 		   ( "REPACTA_CREDITO"."NUMERO_ORIGINAL" = :gi_numero ) ) )
							USING		sqlca;
							if sqlca.sqlcode=0 then
								ldb_uf_reprog					= gd_uf_dia
								if ls_base_cs='O' then
									SELECT	"OFERTA_V"."FECHA"  
									INTO 		:ldt_fecha_promesa  
									FROM 	"CADENA",	"OFERTA_V",	"PAGO_OFERTA"  
									WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
											 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
											 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
											 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
											 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
											 ( ( "CADENA"."CODIGO" = :ls_base_cs ) AND  
											 ( "CADENA"."SERIE" = :ls_serie_cs ) AND  
											 ( "CADENA"."NUMERO" = :ll_numero_cs )  )  
									USING		sqlca;
									if sqlca.sqlcode<>0 then
										ldt_fecha_promesa	= 	ldt_fecha_hoy
									end if
								else
									ldt_fecha_promesa		= 	ldt_fecha_hoy
								end if
								if ls_moneda_reprog='1' then //Peso
									ll_monto		= ldb_capital_pagado
								else
									ll_monto		= round(ldb_capital_pagado * ldb_uf_reprog,0)
								end if
								INSERT INTO "INGRESO"  
											( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",		"TIPO_MOV",	"MONTO",		"CUOTAS_PAG",	"SERIE",			"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",			"PAGO_HIST",	"BASE",			"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",		"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",			"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"FECHA_SISTEMA",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",			"MONEDA_SAP" )  
								VALUES 	( :ll_folio,	'CS',				:ldt_fecha_hoy,			'Q',				:ll_monto,		0,						:ls_serie_cs,	:ll_numero_cs,		'AI',				' ',				:ldb_uf_reprog,			'A',				:ls_base_cs,		:gi_rut,	:gs_user,	null,			:ldt_fecha_hoy,			null,						null,						null,			null,				null,				:ldt_fecha_hoy,			'0',						null,					null,									:gdt_fec_sistema,		:ldt_fecha_hoy,			'S',					 1,							:ldb_capital_pagado,	:ls_moneda_reprog )  
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									INSERT INTO "INGRESO"  
												( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",		"TIPO_MOV",	"MONTO",			"CUOTAS_PAG",	"SERIE",			"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",			"PAGO_HIST",	"BASE",			"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",		"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",			"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"FECHA_SISTEMA",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )  
									VALUES 	( :ll_folio,	'CS',				:ldt_fecha_hoy,			'S',				:ll_monto * -1,		0,						:ls_serie_cs,	:ll_numero_cs,		'AI',				' ',				:ldb_uf_reprog,			'A',				:ls_base_cs,		:gi_rut,	:gs_user,	null,			:ldt_fecha_hoy,			null,						null,						null,			null,				null,				:ldt_fecha_hoy,			'135',						null,					null,									:gdt_fec_sistema,	:ldt_fecha_hoy,			'S',					0,							:ll_monto * -1,		'1' )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									UPDATE	"DETALLE_PAGO_PIE"  
									SET 		"TIPO_COB" = 'CS',   
												"FOLIO" = :ll_folio,   
												"CAJA" = 'AI',   
												"ESTADO" = 'C',   
												"USUARIO" = :gs_user,   
												"FECHA_PAGO" = :ldt_fecha_hoy,   
												"MONTO_PIE_PAGADO_PESO" = :ll_monto,   
												"MONTO_PIE_PAGADO_UF" = :ldb_capital_pagado  
									WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :ls_base_cs ) AND  
											 ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie_cs ) AND  
											 ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero_cs ) AND  
											 ( "DETALLE_PAGO_PIE"."ESTADO" = 'P' ) AND  
											 ( "DETALLE_PAGO_PIE"."NUMERO_CUOTA" = (SELECT MIN("DETALLE_PAGO_PIE"."NUMERO_CUOTA") FROM "DETALLE_PAGO_PIE" WHERE ( "DETALLE_PAGO_PIE"."BASE" = :ls_base_cs ) AND ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie_cs ) AND ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero_cs ) AND ( "DETALLE_PAGO_PIE"."ESTADO" = 'P' ) ) )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									INSERT INTO "DOCUMENTOS"  
												( "FOLIO",	"TIPO_COB",	"N_CHEQUE",	"COD_BANCO",		"MONTO",	"FECHA_VENC",	"COD_PAGO",	"NUM_CHEQUES",		"REZAGO",	"FECHA_PAGO",	"COD_CAJA",	"ESTADO_CH",		"GLOSA_CH",	"FECHA_ESTADO_CH",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",		"COD_AUTORIZACION_CREDITO",		"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO",	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",		"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_PAGO_SAP",	"MONTO_UF",	"FECHA_DEPOSITO" ) 
									VALUES 	( :ll_folio,	'CS',				999,   			999,   				0,   			:ldt_fecha_hoy,   	'EF',   			999,   					' ',				:ldt_fecha_hoy,		'AI',   				'C',					null,   			null,   						0,   									0,   									'0',   											0,   									0,   								'0',   										0,   							'NN',   					0,   											:ll_hora,   			:ll_min,   				null,   						'CS',   					99,   							0,					:ldt_fecha_hoy ) 
									USING	sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									INSERT INTO "DETALLE_PAGO_PIE_COMPROBANTE"  
												( "TIPO_COB",	"FOLIO",		"RUT",	"FECHA_PAGO",		"BASE",			"SERIE",			"NUMERO",		"CAJA",	"USUARIO",	"MONTO_CANCELADO",	"REZAGO",	"MONTO_CANCELADO_UF",	"BASE_ORIGINAL",	"SERIE_ORIGINAL",	"NUMERO_ORIGINAL" )
									VALUES	( 'CS',			:ll_folio,	:gi_rut,	:ldt_fecha_hoy,	:ls_base_cs,	:ls_serie_cs,	:ll_numero_cs,	'AI',		:gs_user,	:ll_monto,				'N',			:ldb_capital_pagado,		:gs_base,			:gs_serie,			:gi_numero )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
										SELECT	"OFERTA_V"."TOT_PAGADO",   
													"PAGO_OFERTA"."CTAS_PAGADAS_PIE",   
													"OFERTA_V"."ULT_FOLIO",
													"PAGO_OFERTA"."PIE_PAGADO",
													"PAGO_OFERTA"."CTAS_PACTADAS_PIE"
										INTO 		:ll_tot_pagado,   
													:ll_ctas_pag_pie,   
													:ll_ult_folio_cs,
													:ll_pie_pagado_cs,
													:ll_ctas_pac_pie
										FROM 	"CADENA",   
													"OFERTA_V",   
													"PAGO_OFERTA"  
										WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
												 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
												 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
												 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
												 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
												 (("CADENA"."CODIGO" = :ls_base_cs ) AND  
												 ( "CADENA"."SERIE" = :ls_serie_cs ) AND  
												 ( "CADENA"."NUMERO" = :ll_numero_cs ) )   
										USING		sqlca;
										if isnull(ll_tot_pagado) then ll_tot_pagado=0
										if isnull(ll_pie_pagado_cs) then ll_pie_pagado_cs=0
										ll_suma_tot_pagado	= ll_monto + ll_tot_pagado
										ll_suma_pie_pagado	= ll_monto + ll_pie_pagado_cs
										UPDATE	"OFERTA_V"  
										SET 		"TOT_PAGADO" = :ll_suma_tot_pagado  
										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie_cs ) AND  
												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_cs )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
											if ll_ctas_pac_pie>0 then
												if isnull(ll_ctas_pag_pie) then ll_ctas_pag_pie=0
												ll_ctas_pag_pie ++
												UPDATE	"PAGO_OFERTA"  
												SET 		"CTAS_PAGADAS_PIE" = :ll_ctas_pag_pie,
															"PIE_PAGADO" = :ll_suma_pie_pagado
												WHERE  ( "PAGO_OFERTA"."SERIE" = :ls_serie_cs ) AND  
														 ( "PAGO_OFERTA"."NRO_OFERTA" = :ll_numero_cs ) AND  
														 ( "PAGO_OFERTA"."FOLIO" = :ll_ult_folio_cs )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											end if
										else
											rollback;
										end if
									else
										rollback;
									end if
								else
									rollback;
								end if
							end if
						else
							SELECT	MAX("INGRESO"."FOLIO")  
							INTO 		:ll_folio  
							FROM 	"INGRESO"  
							WHERE 	"INGRESO"."TIPO_COB" = 'CS'   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								if ll_folio>0 then
									ll_folio ++
								else
									ll_folio	= 1
								end if
							else
								ll_folio		= 1
							end if
							SELECT	"REPACTA_CREDITO"."CAPITAL_PAGADO",
										"REPACTA_CREDITO"."BASE",
										"REPACTA_CREDITO"."SERIE",
										"REPACTA_CREDITO"."NUMERO",
										"REPACTA_CREDITO"."UF_DIA",
										"REPACTA_CREDITO"."MONEDA_ORIGINAL"
							INTO 		:ldb_capital_pagado,
										:ls_base_cs,
										:ls_serie_cs,
										:ll_numero_cs,
										:ldb_uf_reprog,
										:ls_moneda_reprog
							FROM 		"REPACTA_CREDITO"  
							WHERE  ( "REPACTA_CREDITO"."BASE_ORIGINAL" = :gs_base ) AND  
									 ( "REPACTA_CREDITO"."SERIE_ORIGINAL" = :gs_serie ) AND  
									 ( "REPACTA_CREDITO"."NUMERO_ORIGINAL" = :gi_numero ) AND
									 ( "REPACTA_CREDITO"."ESTADO" = 'V' ) AND 
									 ( "REPACTA_CREDITO"."FECHA_CREA" = ( 	SELECT	max("REPACTA_CREDITO"."FECHA_CREA")
																								FROM 		"REPACTA_CREDITO"  
																								WHERE  ( "REPACTA_CREDITO"."BASE_ORIGINAL" = :gs_base ) AND  
																								 		   ( "REPACTA_CREDITO"."SERIE_ORIGINAL" = :gs_serie ) AND  
																										   ( "REPACTA_CREDITO"."NUMERO_ORIGINAL" = :gi_numero ) ) )
							USING		sqlca;
							if sqlca.sqlcode=0 then
								ldb_uf_reprog	= gd_uf_dia
								if ls_moneda_reprog='1' then //Peso
									ll_monto		= ldb_capital_pagado
								else
									ll_monto		= round(ldb_capital_pagado * ldb_uf_reprog,0)
								end if
								INSERT INTO "INGRESO"  
											( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",		"CUOTAS_PAG",	"SERIE",			"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",			"PAGO_HIST",	"BASE",			"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"FECHA_SISTEMA",	"FECHA_DEPOSITO" ,	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",			"MONEDA_SAP")  
								VALUES 	( :ll_folio,	'CS',			:ldt_fecha_hoy,			'Q',				:ll_monto,		0,						:ls_serie_cs,	:ll_numero_cs,		'AI',				' ',				:ldb_uf_reprog,			'A',				:ls_base_cs,		:gi_rut,	:gs_user,	null,			:ldt_fecha_hoy,		null,						null,						null,			null,				null,				:ldt_fecha_hoy,		'0',						null,					null,									:gdt_fec_sistema,		:ldt_fecha_hoy,			'S',					 1,							:ldb_capital_pagado,	:ls_moneda_reprog )  
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									INSERT INTO "INGRESO"  
												( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",		"CUOTAS_PAG",	"SERIE",			"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",			"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"FECHA_SISTEMA",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )  
									VALUES 	( :ll_folio,	'CS',				:ldt_fecha_hoy,		'S',				:ll_monto * -1,	0,						:ls_serie_cs,	:ll_numero_cs,		'AI',				' ',				:ldb_uf_reprog,		'A',				:ls_base_cs,		:gi_rut,	:gs_user,	null,			:ldt_fecha_hoy,		null,						null,						null,			null,				null,				:ldt_fecha_hoy,		'135',					null,					null,									:gdt_fec_sistema,		:ldt_fecha_hoy,			'S',					0,							:ll_monto * -1,		'1' )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									INSERT INTO "DOCUMENTOS"  
												( "FOLIO",	"TIPO_COB",	"N_CHEQUE",	"COD_BANCO",		"MONTO",	"FECHA_VENC",	"COD_PAGO",	"NUM_CHEQUES",		"REZAGO",	"FECHA_PAGO",	"COD_CAJA",	"ESTADO_CH",		"GLOSA_CH",	"FECHA_ESTADO_CH",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",		"COD_AUTORIZACION_CREDITO",		"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO",	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",		"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_PAGO_SAP",	"MONTO_UF",	"FECHA_DEPOSITO" ) 
									VALUES 	( :ll_folio,	'CS',				999,   			999,   				0,   			:ldt_fecha_hoy,   	'EF',   			999,   					' ',				:ldt_fecha_hoy,		'AI',   				'C',					null,   			null,   						0,   									0,   									'0',   											0,   									0,   								'0',   										0,   							'NN',   					0,   											:ll_hora,   			:ll_min,   				null,   						'CS',   					99,   							0,					:ldt_fecha_hoy ) 
									USING	sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									UPDATE	"DETALLE_PAGO_PIE"  
									SET 		"TIPO_COB" = 'CS',   
												"FOLIO" = :ll_folio,   
												"CAJA" = 'AI',   
												"ESTADO" = 'C',   
												"USUARIO" = :gs_user,   
												"FECHA_PAGO" = :ldt_fecha_hoy,   
												"MONTO_PIE_PAGADO_PESO" = :ll_monto,   
												"MONTO_PIE_PAGADO_UF" = :ldb_capital_pagado  
									WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :ls_base_cs ) AND  
											 ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie_cs ) AND  
											 ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero_cs ) AND  
											 ( "DETALLE_PAGO_PIE"."ESTADO" = 'P' ) AND  
											 ( "DETALLE_PAGO_PIE"."NUMERO_CUOTA" = (SELECT MIN("DETALLE_PAGO_PIE"."NUMERO_CUOTA") FROM "DETALLE_PAGO_PIE" WHERE ( "DETALLE_PAGO_PIE"."BASE" = :ls_base_cs ) AND ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie_cs ) AND ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero_cs ) AND ( "DETALLE_PAGO_PIE"."ESTADO" = 'P' ) ) )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
										INSERT INTO "DETALLE_PAGO_PIE_COMPROBANTE"  
													( "TIPO_COB",	"FOLIO",		"RUT",	"FECHA_PAGO",	"BASE",			"SERIE",			"NUMERO",		"CAJA",	"USUARIO",	"MONTO_CANCELADO",	"REZAGO",	"MONTO_CANCELADO_UF",	"BASE_ORIGINAL",	"SERIE_ORIGINAL",	"NUMERO_ORIGINAL" )
										VALUES	( 'CS',				:ll_folio,		:gi_rut,	:ldt_fecha_hoy,		:ls_base_cs,		:ls_serie_cs,	:ll_numero_cs,	'AI',		:gs_user,	:ll_monto,				'N',			:ldb_capital_pagado,		:gs_base,			:gs_serie,			:gi_numero )  
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
											SELECT	"OFERTA_V"."TOT_PAGADO",   
														"PAGO_OFERTA"."CTAS_PAGADAS_PIE",   
														"OFERTA_V"."ULT_FOLIO",
														"PAGO_OFERTA"."PIE_PAGADO",
														"PAGO_OFERTA"."CTAS_PACTADAS_PIE"
											INTO 		:ll_tot_pagado,   
														:ll_ctas_pag_pie,   
														:ll_ult_folio_cs,
														:ll_pie_pagado_cs,
														:ll_ctas_pac_pie
											FROM 		"CADENA",   
														"OFERTA_V",   
														"PAGO_OFERTA"  
											WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
													 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
													 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
													 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
													 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
													 (("CADENA"."CODIGO" = :ls_base_cs ) AND  
													 ( "CADENA"."SERIE" = :ls_serie_cs ) AND  
													 ( "CADENA"."NUMERO" = :ll_numero_cs ) )   
											USING		sqlca;
											if isnull(ll_tot_pagado) then ll_tot_pagado=0
											if isnull(ll_pie_pagado_cs) then ll_pie_pagado_cs=0
											ll_suma_tot_pagado	= ll_monto + ll_tot_pagado
											ll_suma_pie_pagado	= ll_monto + ll_pie_pagado_cs
											UPDATE	"OFERTA_V"  
											SET 		"TOT_PAGADO" = :ll_suma_tot_pagado  
											WHERE  ( "OFERTA_V"."SERIE" = :ls_serie_cs ) AND  
													 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_cs )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
												if ll_ctas_pac_pie>0 then
													if isnull(ll_ctas_pag_pie) then ll_ctas_pag_pie=0
													ll_ctas_pag_pie ++
													UPDATE	"PAGO_OFERTA"  
													SET 		"CTAS_PAGADAS_PIE" = :ll_ctas_pag_pie,
																"PIE_PAGADO" = :ll_suma_pie_pagado
													WHERE  ( "PAGO_OFERTA"."SERIE" = :ls_serie_cs ) AND  
															 ( "PAGO_OFERTA"."NRO_OFERTA" = :ll_numero_cs ) AND  
															 ( "PAGO_OFERTA"."FOLIO" = :ll_ult_folio_cs )   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
												end if
											else
												rollback;
											end if
										else
											rollback;
										end if
									else
										rollback;
									end if
								else
									rollback;
								end if
							end if
						end if
					end if
				end if
			end if
		end if
		if isvalid(w_listado_contratos) then
			w_listado_contratos.dw_listado.setitem(w_listado_contratos.dw_listado.getrow(),'cadena_estado',ls_estado)
		end if
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then
					w_cuenta_corriente_oferta.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
					w_cuenta_corriente_oferta.dw_estado_cta_cte.setitem(1,'cadena_fecha_res',ldt_fecha)
				end if
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then
					w_cuenta_corriente_liberador.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
					w_cuenta_corriente_liberador.dw_estado_cta_cte.setitem(1,'cadena_fecha_res',ldt_fecha)
				end if
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then
					w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
					w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.setitem(1,'cadena_fecha_res',ldt_fecha)
				end if
			CASE "F","G" //Funeraria
				if isvalid(w_cuenta_corriente_funeraria) then
					w_cuenta_corriente_funeraria.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
					w_cuenta_corriente_funeraria.dw_estado_cta_cte.setitem(1,'cadena_fecha_res',ldt_fecha)
				end if
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then
					w_cuenta_corriente_pagare.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
					w_cuenta_corriente_pagare.dw_estado_cta_cte.setitem(1,'cadena_fecha_res',ldt_fecha)
				end if
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then
					w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
					w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.setitem(1,'cadena_fecha_res',ldt_fecha)
				end if
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then
					w_cuenta_corriente_derecho.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
					w_cuenta_corriente_derecho.dw_estado_cta_cte.setitem(1,'cadena_fecha_res',ldt_fecha)
				end if
			CASE "R" //Repactación Ctas.Mantencion
				UPDATE	"REPACTA_MANTENCION"  
				SET 		"ESTADO_PAGO" = :ls_estado 
				WHERE  ( "REPACTA_MANTENCION"."BASE" = :gs_base ) AND  
						 ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
						 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then
					w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
					w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.setitem(1,'cadena_fecha_res',ldt_fecha)
				end if
			
		END CHOOSE
		messagebox("Actualizar","Actualización Exitosa")
	else
		rollback;
		messagebox("Error SQL","Error: "+sqlca.sqlerrtext)
	end if
//END IF
close(w_ingreso_fecha_res)
end event

type gb_1 from groupbox within w_ingreso_fecha_res
integer x = 55
integer y = 40
integer width = 914
integer height = 336
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Fecha de Resciliación"
end type

