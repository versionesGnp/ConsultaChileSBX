forward
global type w_ingreso_fallecimiento from window
end type
type cb_eliminar from commandbutton within w_ingreso_fallecimiento
end type
type cb_limpiar from commandbutton within w_ingreso_fallecimiento
end type
type cb_nuevo from commandbutton within w_ingreso_fallecimiento
end type
type cb_print from commandbutton within w_ingreso_fallecimiento
end type
type cb_ver_cuenta from commandbutton within w_ingreso_fallecimiento
end type
type dw_fallecido from datawindow within w_ingreso_fallecimiento
end type
type cb_aceptar from commandbutton within w_ingreso_fallecimiento
end type
type cb_cancelar from commandbutton within w_ingreso_fallecimiento
end type
end forward

global type w_ingreso_fallecimiento from window
integer x = 1088
integer y = 608
integer width = 2574
integer height = 2220
boolean titlebar = true
string title = "Fallecimiento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_eliminar cb_eliminar
cb_limpiar cb_limpiar
cb_nuevo cb_nuevo
cb_print cb_print
cb_ver_cuenta cb_ver_cuenta
dw_fallecido dw_fallecido
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
end type
global w_ingreso_fallecimiento w_ingreso_fallecimiento

type variables
datawindowchild state_child
String	is_nuevo,is_mod_sepult,is_usuario_esta
Long	il_modif
end variables

on w_ingreso_fallecimiento.create
this.cb_eliminar=create cb_eliminar
this.cb_limpiar=create cb_limpiar
this.cb_nuevo=create cb_nuevo
this.cb_print=create cb_print
this.cb_ver_cuenta=create cb_ver_cuenta
this.dw_fallecido=create dw_fallecido
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.Control[]={this.cb_eliminar,&
this.cb_limpiar,&
this.cb_nuevo,&
this.cb_print,&
this.cb_ver_cuenta,&
this.dw_fallecido,&
this.cb_aceptar,&
this.cb_cancelar}
end on

on w_ingreso_fallecimiento.destroy
destroy(this.cb_eliminar)
destroy(this.cb_limpiar)
destroy(this.cb_nuevo)
destroy(this.cb_print)
destroy(this.cb_ver_cuenta)
destroy(this.dw_fallecido)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
end on

event open;long		fila,ll_count_usuario
Double	ll_numero,ll_nro_aux
String		ls_base,ls_serie

Connect Using	Trans_1;
SELECT	COUNT("FICHA_USUARIO_ESTADISTICO"."USUARIO")  
INTO 		:ll_count_usuario  
FROM 		"FICHA_USUARIO_ESTADISTICO"  
WHERE  ( "FICHA_USUARIO_ESTADISTICO"."ESTADO" = 'A' ) AND  
		 ( "FICHA_USUARIO_ESTADISTICO"."USUARIO" = :gs_user )   
USING		sqlca;
if ll_count_usuario=1 then
	is_usuario_esta	= 'S'
else
	is_usuario_esta	= 'N'
end if
il_modif						= 0
is_mod_sepult				= 'N'
gf_centrar(w_ingreso_fallecimiento)
dw_fallecido.SetTransObject(SQLCA)
dw_fallecido.getchild('ss',idw_detalle)
idw_detalle.settransobject(sqlca)
gs_ventana					= 'w_ingreso_fallecimiento'
f_valida_objeto()	
if isvalid(w_mantenedor_fosa_comun) then
	cb_nuevo.enabled		= false
	cb_eliminar.visible		= true
else
	if gs_acceso ="3" then
		cb_eliminar.visible	= true
	else
		cb_eliminar.visible	= false
	end if
end if
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
If gi_llave > 0 THEN
	if dw_fallecido.Retrieve(gi_llave)>0 then
		ls_base				= dw_fallecido.getitemstring(1,'base')
		ls_serie				= dw_fallecido.getitemstring(1,'ss')
		ll_numero			= dw_fallecido.getitemnumber(1,'contrato')
		dw_fallecido.setitem(1,'estado','S')
		SELECT	cadena.numero
		INTO 		:ll_nro_aux
		FROM 	cadena
		WHERE  ( cadena.codigo = :ls_base) and 
				 ( cadena.serie = :ls_serie) and
				 ( cadena.numero = :ll_numero)
		USING	sqlca;
		if sqlca.sqlcode<>0 then
			dw_fallecido.object.t_9.text	= 'Contrato No Existe'
		else
			dw_fallecido.object.t_9.text	= 'Contrato Existe'
		end if
		if not isnull(ls_base) and ls_base<>'' then
			dw_fallecido.getchild('ss',idw_detalle)
			idw_detalle.settransobject(sqlca)
			idw_detalle.retrieve(ls_base)
		end if
		if gs_depto='I' then
			dw_fallecido.Object.cod_parque.Protect	= 0
		else
			dw_fallecido.Object.cod_parque.Protect	= 1
		end if
		dw_fallecido.accepttext()
	else
		messagebox("Advertencia","LLave Nº "+string(gi_llave,'###,###,###,###,###')+" No Registra Fallecido")
		close(w_ingreso_fallecimiento)
	end if
ELSE
//	gi_llave = gf_llave_fallecidos()
	fila 		= dw_fallecido.InsertRow(0)
//	dw_fallecido.SetItem(fila, "llave", gi_llave)
	dw_fallecido.SetItem(fila, 'fec_sep', DateTime(today()))
	dw_fallecido.SetItem(fila, 'cod_parque',gl_cod_parque)
	dw_fallecido.setitem(fila, 'estado','N')
	if gs_depto='I' then
		dw_fallecido.Object.cod_parque.Protect	= 0
	else
		dw_fallecido.Object.cod_parque.Protect	= 1
	end if
	dw_fallecido.accepttext()
END IF

end event

event close;DisConnect Using	Trans_1;
end event

type cb_eliminar from commandbutton within w_ingreso_fallecimiento
integer x = 1673
integer y = 1960
integer width = 238
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_res,ll_llave,ll_folio,ll_edad,ll_cod_parque,ll_n_l,ll_n_m,ll_rut,ll_llave_anterior_s,ll_folio_encuesta_s,ll_covid_s,ll_ubicacion_cuerpo_s
datetime	ldt_fec_sep,ldt_fec_nac,ldt_fec_fall,ldt_fecha_ult_mod_s,ldt_fecha_exhum_s,ldt_fecha_inhuma_s,ldt_fecha_ti_s,ldt_fecha_te_s,ldt_fecha_re_s,ldt_fecha_tr_s,&
			ldt_fecha_crem_s,ldt_fecha_crea_s
String		ls_nombre,ls_ap_pat,ls_ap_mat,ls_base,ls_serie,ls_sector,ls_n_sep,ls_est,ls_op,ls_dv,ls_sexo,ls_periodo,ls_pase,ls_reg_civil,ls_causa_fall,ls_enf_obl,ls_funeraria,ls_boleta,ls_carta_aut,&
			ls_rg_est,ls_n_tec,ls_nivel,ls_vta,ls_obs,ls_est_ctto,ls_resol_tras,ls_otorgado,ls_cementerio_ori,ls_estado_ctto,ls_nro_sarcofago_s,ls_cod_usuario_s,ls_usuario_ult_mod,&
			ls_estado_exhum_s,ls_estado_inhuma_s,ls_estado_ti_s,ls_estado_te_s,ls_estado_re_s,ls_estado_tr_s,ls_estado_crem_s,ls_estado_reg_s,ls_estado_fall_s,ls_base_dest_s,ls_serie_dest_s,&
			ls_usuario_crea_s,ls_tipo_ficha_s
Double	ll_numero,ll_numero_dest_s

ls_nombre		= dw_fallecido.getitemstring(1,'nombres')
ls_ap_pat		= dw_fallecido.getitemstring(1,'ap_paterno')
ls_ap_mat		= dw_fallecido.getitemstring(1,'ap_materno')
ll_llave			= dw_fallecido.getitemnumber(1,'llave')
ls_estado_ctto	= dw_fallecido.getitemstring(1,'estado')
if ls_estado_ctto='F' then
	messagebox("Advertencia","No Es Posible Eliminar Fallecido de FOSA COMUN")
else
	ll_res		= messagebox("Eliminar","Está Seguro de Eliminar Fallecido Llave Nº "+string(ll_llave,'###,###,###,###,###')+" Nombre: "+ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat,Exclamation!,YesNo!,2)
	if ll_res=1 then
		SELECT DISTINCT	"FALLECIDOS"."FOLIO",	"FALLECIDOS"."N_L",	"FALLECIDOS"."N_M",	"FALLECIDOS"."BASE",	"FALLECIDOS"."SS",	"FALLECIDOS"."CONTRATO",	"FALLECIDOS"."SECTOR",	"FALLECIDOS"."N_SEP",	"FALLECIDOS"."NOMBRES",	"FALLECIDOS"."AP_PATERNO",	"FALLECIDOS"."AP_MATERNO",	"FALLECIDOS"."FEC_SEP",	"FALLECIDOS"."EST",	"FALLECIDOS"."OP",	"FALLECIDOS"."RUT",	"FALLECIDOS"."DV",	"FALLECIDOS"."SEXO",	"FALLECIDOS"."EDAD",	"FALLECIDOS"."PERIODO",	"FALLECIDOS"."FEC_NAC",	"FALLECIDOS"."FEC_FALL",	"FALLECIDOS"."PASE",	"FALLECIDOS"."REG_CIVIL",	"FALLECIDOS"."CAUSA_FALL",	"FALLECIDOS"."ENF_OBL",	"FALLECIDOS"."FUNERARIA",	"FALLECIDOS"."BOLETA",	"FALLECIDOS"."CARTA_AUT",	"FALLECIDOS"."RG_EST",	"FALLECIDOS"."N_TEC",	"FALLECIDOS"."NIVEL",	"FALLECIDOS"."VTA",	"FALLECIDOS"."OBSERVACIONES",	"FALLECIDOS"."ESTADO_CONTRATO",	"FALLECIDOS"."RESOLUCION_TRASLADO_NRO",	"FALLECIDOS"."OTORGADO_POR",	"FALLECIDOS"."CEMENTERIO_ORIGEN",	"FALLECIDOS"."COD_PARQUE",		"FALLECIDOS"."LLAVE_ANTERIOR",	"FALLECIDOS"."NRO_SARCOFAGO",	"FALLECIDOS"."COD_USUARIO",	"FALLECIDOS"."USUARIO_ULT_MOD",		"FALLECIDOS"."FECHA_ULT_MOD",		"FALLECIDOS"."FOLIO_ENCUESTA",	"FALLECIDOS"."COVID",		"FALLECIDOS"."UBICACION_CUERPO",	"FALLECIDOS"."ESTADO_EXHUMACION",		"FALLECIDOS"."FECHA_EXHUMACION",		"FALLECIDOS"."ESTADO_INHUMACION",		"FALLECIDOS"."FECHA_INHUMACION",	"FALLECIDOS"."ESTADO_TRASLADO_INTERNO",	"FALLECIDOS"."FECHA_TRASLADO_INTERNO",		"FALLECIDOS"."ESTADO_TRASLADO_EXTERNO",	"FALLECIDOS"."FECHA_TRASLADO_EXTERNO",		"FALLECIDOS"."ESTADO_REDUCCION",	"FALLECIDOS"."FECHA_REDUCCION",	"FALLECIDOS"."ESTADO_EN_TRANSITO",	"FALLECIDOS"."FECHA_EN_TRANSITO",		"FALLECIDOS"."ESTADO_CREMATORIO",		"FALLECIDOS"."FECHA_CREMATORIO",	"FALLECIDOS"."ESTADO_REG",		"FALLECIDOS"."ESTADO_FALLECIDO",	"FALLECIDOS"."BASE_DESTINO",	"FALLECIDOS"."SERIE_DESTINO",		"FALLECIDOS"."NUMERO_DESTINO",		"FALLECIDOS"."USUARIO_CREA",		"FALLECIDOS"."FECHA_CREA",		"FALLECIDOS"."TIPO_FICHA"
		INTO					:ll_folio,						:ll_n_l,					:ll_n_m,					:ls_base,						:ls_serie,					:ll_numero,							:ls_sector,						:ls_n_sep,					:ls_nombre,						:ls_ap_pat,							:ls_ap_mat,							:ldt_fec_sep,					:ls_est, 					:ls_op,					:ll_rut,					:ls_dv,					:ls_sexo,						:ll_edad,						:ls_periodo,						:ldt_fec_nac,					:ldt_fec_fall,   					:ls_pase,						:ls_reg_civil,					:ls_causa_fall,						:ls_enf_obl,						:ls_funeraria,						:ls_boleta,						:ls_carta_aut,						:ls_rg_est,						:ls_n_tec,					:ls_nivel,						:ls_vta,					:ls_obs, 										:ls_est_ctto,										:ls_resol_tras,												:ls_otorgado,							:ls_cementerio_ori,							:ll_cod_parque,							:ll_llave_anterior_s,						:ls_nro_sarcofago_s,						:ls_cod_usuario_s,						:ls_usuario_ult_mod,							:ldt_fecha_ult_mod_s,						:ll_folio_encuesta_s,						:ll_covid_s,						:ll_ubicacion_cuerpo_s,						:ls_estado_exhum_s,								:ldt_fecha_exhum_s,								:ls_estado_inhuma_s,								:ldt_fecha_inhuma_s,							:ls_estado_ti_s,											:ldt_fecha_ti_s,												:ls_estado_te_s,											:ldt_fecha_te_s,											:ls_estado_re_s,								:ldt_fecha_re_s,							:ls_estado_tr_s,									:ldt_fecha_tr_s,									:ls_estado_crem_s,								:ldt_fecha_crem_s,							:ls_estado_reg_s,						:ls_estado_fall_s,								:ls_base_dest_s,						:ls_serie_dest_s,							:ll_numero_dest_s,							:ls_usuario_crea_s,						:ldt_fecha_crea_s,						:ls_tipo_ficha_s
		FROM 	"FALLECIDOS"  
		WHERE 	"FALLECIDOS"."LLAVE" = :ll_llave   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			INSERT INTO "LOG_FALLECIDOS"  
						 ( "LLAVE",	"FOLIO",	"N_L",		"N_M",	"BASE",	"SS",		"CONTRATO",	"SECTOR",	"N_SEP",		"NOMBRES",	"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",		"EST",	"OP",		"RUT",	"DV",		"SEXO",		"EDAD",		"PERIODO",		"FEC_NAC",		"FEC_FALL",		"PASE",		"REG_CIVIL",	"CAUSA_FALL",		"ENF_OBL",		"FUNERARIA",	"BOLETA",	"CARTA_AUT",	"RG_EST",	"N_TEC",		"NIVEL",		"VTA",	"OBSERVACIONES",	"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",	"COD_PARQUE",	"USUARIO_CREA",		"MOTIVO_CREA",	"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",		"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",		"FECHA_EXHUMACION",		"ESTADO_INHUMACION",		"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",		"FECHA_CREMATORIO",	"ESTADO_REG",		"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"FECHA_CREA",		"TIPO_FICHA" )  
			VALUES 	 ( :ll_llave,	:ll_folio,	:ll_n_l,	:ll_n_m,	:ls_base,	:ls_serie,	:ll_numero,		:ls_sector,	:ls_n_sep,	:ls_nombre,	:ls_ap_pat,			:ls_ap_mat,			:ldt_fec_sep,	:ls_est, 	:ls_op,	:ll_rut,	:ls_dv,	:ls_sexo,		:ll_edad,		:ls_periodo,		:ldt_fec_nac,	:ldt_fec_fall, 	:ls_pase,		:ls_reg_civil,	:ls_causa_fall,		:ls_enf_obl,		:ls_funeraria,	:ls_boleta,	:ls_carta_aut,	:ls_rg_est,	:ls_n_tec,	:ls_nivel,		:ls_vta,	:ls_obs, 					:ls_est_ctto,					:ls_resol_tras,							:ls_otorgado,			:ls_cementerio_ori,		:ll_cod_parque,		:gs_user,				'I',						:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,		:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,				:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,				:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,				:ldt_fecha_crem_s,		:ls_estado_reg_s,		:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:ldt_fecha_crea_s,		'M' )  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Log_Fallecido SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","No Existe Fallecido LLave Nº "+string(ll_llave,'###,###,###,###,###'))
		end if
//		dw_fallecido.deleterow(1)
		dw_fallecido.setitem(1,'estado_reg','I')
		dw_fallecido.accepttext()
		if isvalid(w_lista_fallecidos) then
			w_lista_fallecidos.dw_listado_fallecidos.setitem(w_lista_fallecidos.dw_listado_fallecidos.getrow(),'estado_reg','I')
			w_lista_fallecidos.dw_listado_fallecidos.accepttext()
		end if
		if dw_fallecido.update()=1 then
			commit;
			dw_fallecido.insertrow(0)
			close(w_ingreso_fallecimiento)
		else
			rollback;
			messagebox("Error Eliminar","Error al Eliminar Fallecido SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_limpiar from commandbutton within w_ingreso_fallecimiento
integer x = 1385
integer y = 1960
integer width = 238
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long	fila

il_modif	= 0
dw_fallecido.reset()
fila 		= dw_fallecido.InsertRow(0)
dw_fallecido.Modify("llave.Protect=0")
dw_fallecido.SetItem(fila, "fec_sep", DateTime(today()))
dw_fallecido.SetItem(fila, 'cod_parque',gl_cod_parque)
dw_fallecido.setfocus()
dw_fallecido.setcolumn('llave')
end event

type cb_nuevo from commandbutton within w_ingreso_fallecimiento
integer x = 55
integer y = 1960
integer width = 251
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;Long	fila

il_modif	= 0
dw_fallecido.reset()
fila 		= dw_fallecido.InsertRow(0)
dw_fallecido.SetItem(fila, "fec_sep", DateTime(today()))
dw_fallecido.SetItem(fila, 'cod_parque',gl_cod_parque)
dw_fallecido.Modify("llave.Protect=1")
dw_fallecido.setitem(1,'estado','S')
dw_fallecido.setitem(1,'estado_reg','A')
dw_fallecido.setfocus()
dw_fallecido.setcolumn('base')
is_nuevo	= 'S'
dw_fallecido.accepttext()
end event

type cb_print from commandbutton within w_ingreso_fallecimiento
integer x = 1106
integer y = 1960
integer width = 274
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;String	ls_serie,ls_base
Double		ll_numero

ls_base		= dw_fallecido.getitemstring(1,'base')
ls_serie		= dw_fallecido.getitemstring(1,'ss')
ll_numero	= dw_fallecido.getitemnumber(1,'contrato')
if not isnull(ls_base) and not isnull(ls_serie) and ll_numero>0 then 
	dw_fallecido.object.datawindow.zoom = 140
	f_Print( dw_fallecido )
	dw_fallecido.object.datawindow.zoom = 100
end if
end event

type cb_ver_cuenta from commandbutton within w_ingreso_fallecimiento
event ue_mousemove pbm_mousemove
integer x = 635
integer y = 1960
integer width = 421
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta corriente"
end type

event clicked;gs_base		= dw_fallecido.getitemstring(1,'base')
gs_serie		= dw_fallecido.getitemstring(1,'ss')
gi_numero	= dw_fallecido.getitemnumber(1,'contrato')
IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
	CHOOSE CASE gs_base
		CASE "O","U" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" // Derecho
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
		CASE "A"
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "F","G"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
	END CHOOSE
END IF
end event

type dw_fallecido from datawindow within w_ingreso_fallecimiento
integer x = 37
integer y = 16
integer width = 2505
integer height = 1916
integer taborder = 10
string dataobject = "d_ingreso_fallecido"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string		ls_columna, ls_base_contrato, ls_serie_contrato, ls_estado,estado,ls_sector,ls_sepult,ls_nro_tec
long 		i,cod_parque,fila,ll_ult_estado,ll_cod_parque_aux,&
			ll_cod_parque,ll_nro_tec,ll_llave,ll_resp,ll_ano_ctto,ll_mes_ctto,ll_dia_ctto,&
			ll_ano_nac,ll_mes_nac,ll_dia_nac,ll_edad
Date		ld_fecha_nac,ld_fecha_ctto
Double	ll_nro_contrato,ll_nro

AcceptText()
ls_columna = dwo.Name
il_modif ++
if ls_columna='llave' then
	ll_llave				= GetItemNumber(1,"llave")
	if ll_llave>0 then 
		if dw_fallecido.retrieve(ll_llave)=0 then
			fila 			= dw_fallecido.InsertRow(0)
			messagebox("Advertencia","No Existe Fallecido")
			is_nuevo		= 'N'
			dw_fallecido.setitem(1,'estado','N')
			dw_fallecido.Modify("llave.Protect=0")
		else
			is_nuevo		= 'N'
			dw_fallecido.setitem(1,'estado','S')
			dw_fallecido.Modify("llave.Protect=0")
			ls_base_contrato  	= GetItemString(1,"base")
			idw_detalle.retrieve(ls_base_contrato)
			dw_fallecido.accepttext()
		end if
	end if		
ElseIf ls_columna = "contrato" or ls_columna='ss' or ls_columna='base' THEN
	ls_base_contrato  	= GetItemString(1,"base")
	ls_serie_contrato 	= GetItemString(1,"ss")
	ll_nro            		= GetItemNumber(1,"contrato")
	cod_parque			= getitemNumber(1,'cod_parque')
	if ls_columna='base' then
		if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
			dw_fallecido.getchild('ss',idw_detalle)
			idw_detalle.settransobject(sqlca)
			idw_detalle.retrieve(ls_base_contrato)
		end if
	end if
	if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and ll_nro>0 then
		SELECT	cadena.numero, 	cadena.estado, 	cadena.cod_parque
		INTO 		:ll_nro_contrato, 	:ls_estado,			:cod_parque
		FROM 		cadena
		WHERE  ( cadena.codigo = :ls_base_contrato) and 
				 ( cadena.serie = :ls_serie_contrato) and
				 ( cadena.numero = :ll_nro);
		IF ll_nro <> ll_nro_contrato THEN
			SELECT	"CD_FOLIO"."ULT_ESTADO",   
						"CD_FOLIO"."COD_PARQUE"  
			INTO 		:ll_ult_estado,   
						:ll_cod_parque_aux  
			FROM 		"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :ls_base_contrato ) AND  
					 ( "CD_FOLIO"."SERIE" = :ls_serie_contrato ) AND  
					 ( "CD_FOLIO"."NUMERO" = :ll_nro )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ll_cod_parque_aux=cod_parque then
					if ll_ult_estado<2 or ll_ult_estado=19 then
						messagebox("Advertencia","Contrato por lo menos debe estar Asignado al Agente")
						dw_fallecido.setitem(1,'estado_contrato','E')
						dw_fallecido.setitem(1,'estado','S')
						gs_estado							= "E"
						dw_fallecido.object.t_9.text	= 'Contrato No Existe'
					else
						Beep(1)
						MessageBox("Fallecimiento" , "No existe el contrato asociado")
						dw_fallecido.setitem(1,'estado_contrato','E')
						dw_fallecido.setitem(1,'estado','S')
						gs_estado							= "E"
						dw_fallecido.object.t_9.text	= 'Contrato No Existe'
					end if
				else
					messagebox("Advertencia","Contrato No Corresponde al Parque Indicado")
					dw_fallecido.setitem(1,'estado_contrato','E')
					dw_fallecido.setitem(1,'estado','S')
					gs_estado							= "E"
					dw_fallecido.object.t_9.text	= 'Contrato No Existe'
				end if
			else
				messagebox("Advertencia","No es posible Ingresar Fallecido No se Registra Contrato "+ls_base_contrato+'-'+ls_serie_contrato+'-'+string(ll_nro,"###,###,###,###,###"))
				dw_fallecido.setitem(1,'estado_contrato','E')
				dw_fallecido.setitem(1,'estado','S')
				gs_estado							= "E"
				dw_fallecido.object.t_9.text	= 'Contrato No Existe'
			end if
		ELSE
			dw_fallecido.object.t_9.text	= 'Contrato Existe'
			gs_estado	= ls_estado
			dw_fallecido.setitem(1,'estado_contrato',ls_estado)
			dw_fallecido.setitem(1,'cod_parque',cod_parque)
			if ls_base_contrato='O' or ls_base_contrato='U' then
				SELECT	"PAGO_OFERTA"."SECTOR",   
							"PAGO_OFERTA"."SEPULTURA",   
							"PAGO_OFERTA"."NRO_TECNICO"   
				INTO 		:ls_sector,   
							:ls_sepult,   
							:ls_nro_tec   
				FROM 		"OFERTA_V",   
							"PAGO_OFERTA",   
							"CADENA"  
				WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
						 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
						 (("CADENA"."CODIGO" = :ls_base_contrato ) AND  
						 ( "OFERTA_V"."SERIE" = :ls_serie_contrato ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :ll_nro ) )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_fallecido.setitem(1,'sector',ls_sector)
					dw_fallecido.setitem(1,'n_sep',ls_sepult)
					dw_fallecido.setitem(1,'n_tec',ls_nro_tec)
					dw_fallecido.setitem(1,'estado','S')
				end if
			elseif ls_base_contrato='C' then
				SELECT	"CONTRATO"."SECTOR",   
							"CONTRATO"."SEPULTURA",   
							"CONTRATO"."NRO_TEC"  
				INTO 		:ls_sector,   
							:ls_sepult,   
							:ll_nro_tec  
				FROM 		"CADENA",   
							"CONTRATO"  
				WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
						 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
						 (("CADENA"."CODIGO" = :ls_base_contrato ) AND  
						 ( "CADENA"."SERIE" = :ls_serie_contrato ) AND  
						 ( "CADENA"."NUMERO" = :ll_nro ) )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_fallecido.setitem(1,'sector',ls_sector)
					dw_fallecido.setitem(1,'n_sep',ls_sepult)
					dw_fallecido.setitem(1,'n_tec',ll_nro_tec)
					dw_fallecido.setitem(1,'estado','S')
				end if
			elseif ls_base_contrato='G' then
				dw_fallecido.setitem(1,'sector','')
				dw_fallecido.setitem(1,'n_sep','')
				dw_fallecido.setitem(1,'n_tec','')
				dw_fallecido.setitem(1,'estado','S')
			end if
		END IF
		dw_fallecido.accepttext()
	end if
elseif ls_columna = "cod_parque" then
	ll_cod_parque	= dw_fallecido.getitemnumber(1, 'cod_parque')
//	dw_fallecido.reset()
//	fila 				= dw_fallecido.InsertRow(0)
//	dw_fallecido.SetItem(fila, "fec_sep", DateTime(today()))
//	dw_fallecido.SetItem(fila, 'cod_parque',ll_cod_parque)
	dw_fallecido.scrolltorow(1)
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('base')
elseif ls_columna='fec_nac' then
	ld_fecha_nac			= date(dw_fallecido.getitemdatetime(1,'fec_nac'))
	ld_fecha_ctto			= date(gdt_fec_sistema)
	if not isnull(ld_fecha_ctto) and not isnull(ld_fecha_nac) then
		if ld_fecha_ctto > ld_fecha_nac and not isnull(ld_fecha_ctto) and not isnull(ld_fecha_nac) then
			ll_ano_ctto		= year(ld_fecha_ctto)
			ll_mes_ctto		= month(ld_fecha_ctto)
			ll_dia_ctto		= day(ld_fecha_ctto)
			ll_ano_nac		= year(ld_fecha_nac)
			ll_mes_nac		= month(ld_fecha_nac)
			ll_dia_nac		= day(ld_fecha_nac)
			ll_edad			= ll_ano_ctto - ll_ano_nac
			if ll_mes_nac > ll_mes_ctto and ll_ano_ctto = (ll_ano_nac + ll_edad) then
				ll_edad 		= ll_edad - 1
			elseif ll_mes_nac = ll_mes_ctto and ll_ano_ctto = (ll_ano_nac + ll_edad) then
				if ll_dia_nac > ll_dia_ctto then
					ll_edad		= ll_edad - 1
				end if
			end if
			dw_fallecido.setitem(1,'edad',ll_edad)
			if ll_edad>0 then dw_fallecido.setitem(1,'periodo','A')
		end if
	end if
elseif ls_columna='n_sep' or ls_columna='sector' then
	ls_sepult		= this.getitemstring(1,'n_sep')
	ls_sector		= this.getitemstring(1,'sector')
	if not isnull(ls_sepult) and not isnull(ls_sector) then
		is_mod_sepult	= 'S'
	end if
END IF
dw_fallecido.accepttext()
end event

event clicked;String		ls_columna,ls_fecha,ls_base,ls_serie,ls_estado_ctto,ls_op,ls_estado_reg
Double	ll_numero
Long		ll_llave
datetime	ldt_fec_sep

dw_fallecido.accepttext()
ls_base						= dw_fallecido.getitemstring(1,'base')
ls_serie						= dw_fallecido.getitemstring(1,'ss')
ll_numero					= dw_fallecido.getitemnumber(1,'contrato')
ls_estado_ctto				= dw_fallecido.getitemstring(1,'estado_contrato')
ll_llave						= dw_fallecido.getitemnumber(1,'llave')
ls_estado_reg				= dw_fallecido.getitemstring(1,'estado_reg')
if ls_estado_reg='I' then
	//messagebox("Advertencia","Registro Fallecido INACTIVO")
else
	if not isnull(ls_base) and not isnull(ls_serie) and not isnull(ll_numero) and &
		ll_numero>0 and ls_base<>'' and ls_serie<>'' and not isnull(ls_estado_ctto) and &
		ls_estado_ctto <> 'F' then
	
		ls_columna	= dwo.name
		if ls_columna='p_1' then
			ls_fecha					= string(date(dw_fallecido.getitemdatetime(1,'fec_nac')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_fallecido.setitem(1,'fec_nac',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_fallecido.setitem(1,'fec_nac',date(ls_fecha))
			END IF
			dw_fallecido.setcolumn('fec_nac')
		elseif ls_columna='p_2' then
			ls_fecha					= string(date(dw_fallecido.getitemdatetime(1,'fec_fall')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_fallecido.setitem(1,'fec_fall',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_fallecido.setitem(1,'fec_fall',date(ls_fecha))
			END IF
			dw_fallecido.setcolumn('fec_fall')
		elseif ls_columna='p_3' then
			ls_op						= dw_fallecido.getitemstring(1,'op')
	//		SELECT 	"FALLECIDOS"."FEC_SEP"  
	//		INTO 		:ldt_fec_sep  
	//		FROM 	"FALLECIDOS"  
	//		WHERE 	"FALLECIDOS"."LLAVE" = :ll_llave   ;
			ls_fecha					= string(date(dw_fallecido.getitemdatetime(1,'fec_sep')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if ls_op <> 'TI' then
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_fallecido.setitem(1,'fec_sep',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_fallecido.setitem(1,'fec_sep',date(ls_fecha))
				END IF
				dw_fallecido.setcolumn('fec_sep')
			end if
		end if
	end if
end if
end event

type cb_aceptar from commandbutton within w_ingreso_fallecimiento
integer x = 311
integer y = 1960
integer width = 274
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string 	base,serie,ls_nom,ls_ap_pat,ls_ap_mat,ls_sector,ls_nro_sep,ls_nro_tec,ls_nivel,ls_estado,ls_carta_a,ls_funeraria,ls_causa_fall,ls_pase,ls_reg_civil,ls_tipo_vta,ls_estado_tit,ls_sw,&
			ls_cod_usuario,ls_mod_usuario,ls_estado_ctto,ls_observaciones,ls_resol_traslado_nro,ls_otorgado_por,ls_cementerio_origen,ls_est,ls_op,ls_dv,ls_sexo,ls_periodo,ls_enf_obl,&
			ls_boleta,ls_carta_aut,ls_rg_est,ls_n_tec,ls_vta,base_s,serie_s,ls_sector_s,ls_nro_sep_s,ls_nom_s,ls_ap_pat_s,ls_ap_mat_s,ls_est_s,ls_op_s,ls_dv_s,ls_sexo_s,ls_periodo_s,&
			ls_pase_s,ls_reg_civil_s,ls_causa_fall_s,ls_enf_obl_s,ls_funeraria_s,ls_boleta_s,ls_carta_aut_s,ls_rg_est_s,ls_n_tec_s,ls_nivel_s,ls_vta_s,ls_observaciones_s,ls_estado_ctto_s,&
			ls_resol_traslado_nro_s,ls_otorgado_por_s,ls_cementerio_origen_s,ls_comparar='N'
long 		cod_parque,ll_rut,ll_nl,ll_nm,ll_edad,ret,ll_folio,ll_cod_parque,ll_llave_s,ll_folio_s,ll_nl_s,ll_nm_s, numero_s,ll_rut_s,ll_edad_s,ll_cod_parque_s,ll_res
Datetime	ldt_fec_nac,ldt_fec_fall,ldt_fec_sep,ldt_fec_sep_s,ldt_fec_nac_s,ldt_fec_fall_s
Double	numero,ll_nro_contrato

ls_sw						= 'S'
dw_fallecido.SetItem(dw_fallecido.GetRow(), "dv", dw_fallecido.GetItemString(dw_fallecido.GetRow(),"c_dv"))
if is_nuevo='S' then
	gi_llave 				= gf_llave_fallecidos()
else
	gi_llave 				= dw_fallecido.GetItemNumber(1,"llave")
end if
dw_fallecido.SetItem(1, "llave", gi_llave)
dw_fallecido.AcceptText()

SELECT  "LLAVE",  	"FOLIO",   	"N_L",   	"N_M",   		"BASE",   	"SS",   	"CONTRATO",   	"SECTOR",   	"N_SEP",   		"NOMBRES",   	"AP_PATERNO",   	"AP_MATERNO",   	"FEC_SEP",   		"EST",   		"OP",   		"RUT",   		"DV",   		"SEXO",   		"EDAD",   		"PERIODO",   		"FEC_NAC",   		"FEC_FALL",   		"PASE",   		"REG_CIVIL",   		"CAUSA_FALL",   	"ENF_OBL",   		"FUNERARIA",   	"BOLETA",   		"CARTA_AUT",   	"RG_EST",   	"N_TEC",   		"NIVEL",   		"VTA",   		"OBSERVACIONES",   		"ESTADO_CONTRATO",   	"RESOLUCION_TRASLADO_NRO",   	"OTORGADO_POR",   	"CEMENTERIO_ORIGEN",   	"COD_PARQUE"
INTO		:ll_llave_s,  	:ll_folio_s,   	:ll_nl_s,  	:ll_nm_s,   	:base_s,   	:serie_s,	:numero_s,  	 	:ls_sector_s,   	:ls_nro_sep_s, 	:ls_nom_s,   	:ls_ap_pat_s,   		:ls_ap_mat_s,   	:ldt_fec_sep_s,   	:ls_est_s,  	:ls_op_s,   	:ll_rut_s,   	:ls_dv_s,   	:ls_sexo_s,   	:ll_edad_s,   	:ls_periodo_s,   	:ldt_fec_nac_s,   	:ldt_fec_fall_s,   	:ls_pase_s,   	:ls_reg_civil_s,   	:ls_causa_fall_s,   	:ls_enf_obl_s,   	:ls_funeraria_s,   	:ls_boleta_s, 	:ls_carta_aut_s,   	:ls_rg_est_s,   	:ls_n_tec_s,   	:ls_nivel_s,   	:ls_vta_s, 	:ls_observaciones_s,  	:ls_estado_ctto_s,   			:ls_resol_traslado_nro_s,   				:ls_otorgado_por_s,   :ls_cementerio_origen_s,   	:ll_cod_parque_s 
FROM		"FALLECIDOS"
WHERE	"LLAVE" = :gi_llave
USING	Trans_1;
if Trans_1.sqlcode=0 then
	ls_comparar			= 'S'
end if

base						= dw_fallecido.GetItemString(1,"base")
serie						= dw_fallecido.GetItemString(1,"ss")
numero					= dw_fallecido.GetItemNumber(1,"contrato")
ll_rut						= dw_fallecido.GetItemNumber(1,'rut')
ls_sector					= dw_fallecido.GetItemString(1,'sector')
ls_nro_sep				= dw_fallecido.GetItemString(1,'n_sep')
ls_nro_tec				= dw_fallecido.GetItemString(1,'n_tec')
ls_nivel					= dw_fallecido.GetItemString(1,'nivel')
ls_nom					= dw_fallecido.GetItemString(1,'nombres')
ls_ap_pat				= dw_fallecido.GetItemString(1,'ap_paterno')
ls_ap_mat				= dw_fallecido.GetItemString(1,'ap_materno')
ll_nl						= dw_fallecido.GetItemNumber(1,'n_l')
ll_nm						= dw_fallecido.GetItemNumber(1,'n_m')
ldt_fec_nac				= dw_fallecido.GetItemdatetime(1,'fec_nac')
ls_carta_a				= dw_fallecido.GetItemString(1,'carta_aut')
ll_edad					= dw_fallecido.GetItemNumber(1,'edad')
ldt_fec_fall				= dw_fallecido.GetItemdatetime(1,'fec_fall')
ldt_fec_sep				= dw_fallecido.GetItemdatetime(1,'fec_sep')
ls_funeraria				= dw_fallecido.GetItemString(1,'funeraria')
ls_causa_fall			= dw_fallecido.GetItemString(1,'causa_fall')
ls_pase					= dw_fallecido.GetItemString(1,'pase')
ls_reg_civil				= dw_fallecido.GetItemString(1,'reg_civil')
ls_tipo_vta				= dw_fallecido.GetItemString(1,'vta')
ls_cod_usuario			= dw_fallecido.GetItemString(1,'cod_usuario')

ls_estado_ctto			= dw_fallecido.GetItemString(1,'estado_contrato')
ls_observaciones		= dw_fallecido.GetItemString(1,'observaciones')
ls_resol_traslado_nro	= dw_fallecido.GetItemString(1,'resolucion_traslado_nro')
ls_otorgado_por		= dw_fallecido.GetItemString(1,'otorgado_por')
ls_cementerio_origen	= dw_fallecido.GetItemString(1,'cementerio_origen')
ll_folio					= dw_fallecido.GetItemNumber(1,'folio')
ls_est						= dw_fallecido.GetItemString(1,'est')
ls_op						= dw_fallecido.GetItemString(1,'op')
ls_dv						= dw_fallecido.GetItemString(1,'dv')
ls_sexo					= dw_fallecido.GetItemString(1,'sexo')
ls_periodo				= dw_fallecido.GetItemString(1,'periodo')
ls_enf_obl				= dw_fallecido.GetItemString(1,'enf_obl')
ls_boleta					= dw_fallecido.GetItemString(1,'boleta')
ls_carta_aut				= dw_fallecido.GetItemString(1,'carta_aut')
ls_rg_est					= dw_fallecido.GetItemString(1,'rg_est')
ls_n_tec					= dw_fallecido.GetItemString(1,'n_tec')
ls_vta						= dw_fallecido.GetItemString(1,'vta')
ll_cod_parque			= dw_fallecido.GetItemNumber(1,'cod_parque')

if isnull(base) or base='' then
	messagebox("Advertencia","Debe Ingresar Base")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('base')
	ls_sw		= 'N'
elseif isnull(serie) or serie='' then
	messagebox("Advertencia","Debe Ingresar Serie")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('ss')
	ls_sw		= 'N'
elseif isnull(numero) or numero=0 then
	messagebox("Advertencia","Debe Ingresar Numero")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('contrato')
	ls_sw		= 'N'
elseif isnull(ll_rut) or ll_rut=0 then
	messagebox("Advertencia","Debe Ingresar Rut")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('rut')
	ls_sw		= 'N'
elseif isnull(ls_nom) or ls_nom='' then
	messagebox("Advertencia","Debe Ingresar Nombres")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('nombres')
	ls_sw		= 'N'
elseif isnull(ls_ap_pat) or ls_ap_pat='' then
	messagebox("Advertencia","Debe Ingresar Apellido Paterno")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('ap_paterno')
	ls_sw		= 'N'
elseif isnull(ls_ap_mat) or ls_ap_mat='' then
	messagebox("Advertencia","Debe Ingresar Apellido Materno")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('ap_materno')
	ls_sw		= 'N'
elseif isnull(ll_nl) or ll_nl=0 then
	if is_usuario_esta	= 'S' then
		ll_res	= messagebox("Advertencia","Recuerde de Ingresar Nº Libro Maestro de Sepultura (Anual), desea Continuar",Exclamation!,YesNo!,2)
		if ll_res=1 then
			ls_sw		= 'S'
		else
			ls_sw		= 'N'
			dw_fallecido.setfocus()
			dw_fallecido.setcolumn('n_l')
		end if
	else
		messagebox("Advertencia","Debe Ingresar Nº Libro Maestro de Sepultura (Anual)")
		dw_fallecido.setfocus()
		dw_fallecido.setcolumn('n_l')
		ls_sw		= 'N'
	end if
	
elseif isnull(ll_nm) or ll_nm=0 then
	if is_usuario_esta	= 'S' then
		ll_res	= messagebox("Advertencia","Recuerde de Ingresar Nº Correlativo Sepultura (Mensual), desea Continuar",Exclamation!,YesNo!,2)
		if ll_res=1 then
			ls_sw		= 'S'
		else
			ls_sw		= 'N'
			dw_fallecido.setfocus()
			dw_fallecido.setcolumn('n_m')
		end if
	else
		messagebox("Advertencia","Debe Ingresar Nº Correlativo Sepultura (Mensual)")
		dw_fallecido.setfocus()
		dw_fallecido.setcolumn('n_m')
		ls_sw		= 'N'
	end if
elseif isnull(ls_sector) or ls_sector='' then
	messagebox("Advertencia","Debe Ingresar Sector")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('sector')
	ls_sw		= 'N'
elseif isnull(ls_nro_sep) or ls_nro_sep='' then
	messagebox("Advertencia","Debe Ingresar Número Sepultura")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('n_sep')
	ls_sw		= 'N'
elseif isnull(ls_nro_tec) or ls_nro_tec='' then
	messagebox("Advertencia","Debe Ingresar Número Técnico")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('n_tec')
	ls_sw		= 'N'
elseif isnull(ls_nivel) or ls_nivel='' then
	messagebox("Advertencia","Debe Ingresar Nivel")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('nivel')
	ls_sw		= 'N'
elseif isnull(ldt_fec_nac) then
	messagebox("Advertencia","Debe Ingresar Fecha Nacimiento")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('fec_nac')
	ls_sw		= 'N'
elseif isnull(ls_carta_a) or ls_carta_a='' then
	messagebox("Advertencia","Debe Ingresar Nº Carta que autoriza para abrir Sepultura")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('carta_aut')
	ls_sw		= 'N'
elseif isnull(ll_edad) then
	messagebox("Advertencia","Debe Ingresar Edad")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('edad')
	ls_sw		= 'N'
elseif isnull(ldt_fec_fall) then
	messagebox("Advertencia","Debe Ingresar Fecha de Fallecimiento")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('fec_fall')
	ls_sw		= 'N'
elseif isnull(ldt_fec_sep) then
	messagebox("Advertencia","Debe Ingresar Fecha de Sepultación")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('fec_sep')
	ls_sw		= 'N'
elseif isnull(ls_funeraria) or ls_funeraria='' then
	messagebox("Advertencia","Debe Ingresar Funeraria")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('funeraria')
	ls_sw		= 'N'
elseif isnull(ls_causa_fall) or ls_causa_fall='' then
	messagebox("Advertencia","Debe Ingresar Causa de Fallecimiento")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('causa_fall')
	ls_sw		= 'N'
elseif isnull(ls_pase) or ls_pase='' then
	messagebox("Advertencia","Debe Ingresar Permiso Registro Civil")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('pase')
	ls_sw		= 'N'
elseif isnull(ls_reg_civil) or ls_reg_civil='' then
	messagebox("Advertencia","Debe Ingresar Registro Civil")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('reg_civil')
	ls_sw		= 'N'
elseif isnull(ls_tipo_vta) or ls_tipo_vta='' then
	messagebox("Advertencia","Debe Ingresar Tipo Venta")
	dw_fallecido.setfocus()
	dw_fallecido.setcolumn('vta')
	ls_sw		= 'N'
elseif isnull(ls_cod_usuario) or ls_cod_usuario='' then
	ls_cod_usuario	= gs_user
	dw_fallecido.SetItem(1,'cod_usuario',ls_cod_usuario)
	dw_fallecido.AcceptText()
end if
if ls_sw='S' then
	ret 		= MessageBox("Actualizar", "Desea Grabar Fallecido", Question!, YesNo!, 1)
	IF ret = 1 THEN
		dw_fallecido.SetItem(1,'usuario_ult_mod',gs_user)
		dw_fallecido.SetItem(1,'fecha_ult_mod',gdt_fec_sistema)
		dw_fallecido.AcceptText()
		ret 	= dw_fallecido.Update()
		IF ret <> -1 THEN 
			Commit Using SQLCA;
			SELECT	"CLIENTE"."ESTADO_TITULAR"  
			INTO 		:ls_estado_tit  
			FROM 		"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				UPDATE	"CLIENTE"  
				SET 		"ESTADO_TITULAR" = '1'  
				WHERE 	"CLIENTE"."RUT" = :ll_rut   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			end if
			if il_modif > 0 then
				if ll_llave_s<>gi_llave or ll_folio_s<>ll_folio or ll_nl_s<>ll_nl or ll_nm_s<>ll_nm or base_s<>base or serie_s<>serie or numero_s<>numero or ls_sector_s<>ls_sector or &
					ls_nro_sep_s<>ls_nro_sep or ls_nom_s<>ls_nom or ls_ap_pat_s<>ls_ap_pat or ls_ap_mat_s<>ls_ap_mat or ldt_fec_sep_s<>ldt_fec_sep or ls_est_s<>ls_est or &
					ls_op_s<>ls_op or ll_rut_s<>ll_rut or ls_dv_s<>ls_dv or ls_sexo_s<>ls_sexo or ll_edad_s<>ll_edad or ls_periodo_s<>ls_periodo or ldt_fec_nac_s<>ldt_fec_nac or &
					ldt_fec_fall_s<>ldt_fec_fall or ls_pase_s<>ls_pase or ls_reg_civil_s<>ls_reg_civil or ls_causa_fall_s<>ls_causa_fall or ls_enf_obl_s<>ls_enf_obl or ls_funeraria_s<>ls_funeraria or &
					ls_boleta_s<>ls_boleta or ls_carta_aut_s<>ls_carta_aut or ls_rg_est_s<>ls_rg_est or ls_n_tec_s<>ls_n_tec or ls_nivel_s<>ls_nivel or ls_vta_s<>ls_vta or &
					ls_observaciones_s<>ls_observaciones or ls_estado_ctto_s<>ls_estado_ctto or ls_resol_traslado_nro_s<>ls_resol_traslado_nro or ls_otorgado_por_s<>ls_otorgado_por or &
					ls_cementerio_origen_s<>ls_cementerio_origen or ll_cod_parque_s<>ll_cod_parque or ls_comparar='S' then
				
						INSERT INTO "LOG_FALLECIDOS"  
									( "LLAVE",  		"FOLIO",   	"N_L",   		"N_M",   		"BASE",   		"SS",   		"CONTRATO",   		"SECTOR",   	"N_SEP",   			"NOMBRES",   		"AP_PATERNO",   	"AP_MATERNO",   		"FEC_SEP",   		"EST",   		"OP",   		"RUT",   		"DV",   		"SEXO",   		"EDAD",   		"PERIODO",   		"FEC_NAC",   		"FEC_FALL",   		"PASE",   		"REG_CIVIL",   		"CAUSA_FALL",   	"ENF_OBL",   		"FUNERARIA",   		"BOLETA",   		"CARTA_AUT",   	"RG_EST",   	"N_TEC",   		"NIVEL",   		"VTA",   		"OBSERVACIONES",   		"ESTADO_CONTRATO",   		"RESOLUCION_TRASLADO_NRO",   	"OTORGADO_POR",   		"CEMENTERIO_ORIGEN",   	"COD_PARQUE",   		"USUARIO_CREA",   	"MOTIVO_CREA" )  
						VALUES 	( :ll_llave_s,  	:ll_folio_s,   	:ll_nl_s,   	:ll_nm_s,   	:base_s,   		:serie_s,   	:numero_s,  	 		:ls_sector_s,   	:ls_nro_sep_s,   	:ls_nom_s,   		:ls_ap_pat_s,   		:ls_ap_mat_s,   		:ldt_fec_sep_s,   	:ls_est_s,  	:ls_op_s,   	:ll_rut_s,   	:ls_dv_s,   	:ls_sexo_s,   	:ll_edad_s,   	:ls_periodo_s,   	:ldt_fec_nac_s,   	:ldt_fec_fall_s,   	:ls_pase_s,   	:ls_reg_civil_s,   	:ls_causa_fall_s,   	:ls_enf_obl_s,   	:ls_funeraria_s,   		:ls_boleta_s, 	:ls_carta_aut_s,   	:ls_rg_est_s,   	:ls_n_tec_s,   	:ls_nivel_s,   	:ls_vta_s, 	:ls_observaciones_s,  	:ls_estado_ctto_s,   				:ls_resol_traslado_nro_s,   				:ls_otorgado_por_s,   	:ls_cementerio_origen_s,   	:ll_cod_parque_s,   	:gs_user,   				'M' ) 
						USING	Trans_1;
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
						else
							rollback using Trans_1;
						end if
				end if
			end if
			messagebox("grabar Fallecido","Grabación Exitosa")
			il_modif		= 0
			if isvalid(w_mantenedor_fosa_comun) then
				ls_estado	= dw_fallecido.getitemstring(1,'estado')
				if ls_estado='S' and is_mod_sepult = 'N' and is_nuevo <> 'S' then
					messagebox("Advertencia","Debe Ingresar Sepultura Destino")
					dw_fallecido.setfocus()
					dw_fallecido.setcolumn('n_sep')
				else
					close(w_ingreso_fallecimiento)
				end if
			else
				cb_limpiar.triggerevent(clicked!)
			end if
			
		ELSE
			RollBack Using SQLCA;
		END IF
	END IF
//	close(w_ingreso_fallecimiento)
end if
end event

type cb_cancelar from commandbutton within w_ingreso_fallecimiento
integer x = 2226
integer y = 1960
integer width = 288
integer height = 104
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
boolean cancel = true
end type

event clicked;//Rollback Using SQLCA;
String	ls_estado

if isvalid(w_mantenedor_fosa_comun) then
	ls_estado	= dw_fallecido.getitemstring(1,'estado')
	if ls_estado='S' and is_mod_sepult = 'N' and is_nuevo <> 'S' then
		messagebox("Advertencia","Debe Ingresar Sepultura Destino")
		dw_fallecido.setfocus()
		dw_fallecido.setcolumn('n_sep')
	else
		close(w_ingreso_fallecimiento)
	end if
else
	close(w_ingreso_fallecimiento)
end if
end event

