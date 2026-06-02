forward
global type w_cuenta_corriente_liberador_bkp from window
end type
type cb_convenio from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type cb_est_cheque from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type cb_6 from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type cb_detalle from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type cb_cupones from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type cb_rescomi_vta from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type cb_operaciones from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type cb_agente from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type cb_5 from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type dw_agente_super from datawindow within w_cuenta_corriente_liberador_bkp
end type
type cb_2 from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type cb_1 from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type cb_imprimir from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type dw_encabezado_cuenta_cte from datawindow within w_cuenta_corriente_liberador_bkp
end type
type cb_cerrar from commandbutton within w_cuenta_corriente_liberador_bkp
end type
type dw_estado_cta_cte from datawindow within w_cuenta_corriente_liberador_bkp
end type
type dw_listado_cuenta_cte from datawindow within w_cuenta_corriente_liberador_bkp
end type
type dw_listado_cuenta_cte_cta from datawindow within w_cuenta_corriente_liberador_bkp
end type
type dw_cons_docu_w from datawindow within w_cuenta_corriente_liberador_bkp
end type
end forward

global type w_cuenta_corriente_liberador_bkp from window
integer x = 229
integer y = 288
integer width = 3232
integer height = 1884
boolean titlebar = true
string title = "Cta.Cte. ANEXO LIBERADOR (base = L)"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_convenio cb_convenio
cb_est_cheque cb_est_cheque
cb_6 cb_6
cb_detalle cb_detalle
cb_cupones cb_cupones
cb_rescomi_vta cb_rescomi_vta
cb_operaciones cb_operaciones
cb_agente cb_agente
cb_5 cb_5
dw_agente_super dw_agente_super
cb_2 cb_2
cb_1 cb_1
cb_imprimir cb_imprimir
dw_encabezado_cuenta_cte dw_encabezado_cuenta_cte
cb_cerrar cb_cerrar
dw_estado_cta_cte dw_estado_cta_cte
dw_listado_cuenta_cte dw_listado_cuenta_cte
dw_listado_cuenta_cte_cta dw_listado_cuenta_cte_cta
dw_cons_docu_w dw_cons_docu_w
end type
global w_cuenta_corriente_liberador_bkp w_cuenta_corriente_liberador_bkp

type variables
Long		il_count_print=0

end variables

on w_cuenta_corriente_liberador_bkp.create
this.cb_convenio=create cb_convenio
this.cb_est_cheque=create cb_est_cheque
this.cb_6=create cb_6
this.cb_detalle=create cb_detalle
this.cb_cupones=create cb_cupones
this.cb_rescomi_vta=create cb_rescomi_vta
this.cb_operaciones=create cb_operaciones
this.cb_agente=create cb_agente
this.cb_5=create cb_5
this.dw_agente_super=create dw_agente_super
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_imprimir=create cb_imprimir
this.dw_encabezado_cuenta_cte=create dw_encabezado_cuenta_cte
this.cb_cerrar=create cb_cerrar
this.dw_estado_cta_cte=create dw_estado_cta_cte
this.dw_listado_cuenta_cte=create dw_listado_cuenta_cte
this.dw_listado_cuenta_cte_cta=create dw_listado_cuenta_cte_cta
this.dw_cons_docu_w=create dw_cons_docu_w
this.Control[]={this.cb_convenio,&
this.cb_est_cheque,&
this.cb_6,&
this.cb_detalle,&
this.cb_cupones,&
this.cb_rescomi_vta,&
this.cb_operaciones,&
this.cb_agente,&
this.cb_5,&
this.dw_agente_super,&
this.cb_2,&
this.cb_1,&
this.cb_imprimir,&
this.dw_encabezado_cuenta_cte,&
this.cb_cerrar,&
this.dw_estado_cta_cte,&
this.dw_listado_cuenta_cte,&
this.dw_listado_cuenta_cte_cta,&
this.dw_cons_docu_w}
end on

on w_cuenta_corriente_liberador_bkp.destroy
destroy(this.cb_convenio)
destroy(this.cb_est_cheque)
destroy(this.cb_6)
destroy(this.cb_detalle)
destroy(this.cb_cupones)
destroy(this.cb_rescomi_vta)
destroy(this.cb_operaciones)
destroy(this.cb_agente)
destroy(this.cb_5)
destroy(this.dw_agente_super)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_imprimir)
destroy(this.dw_encabezado_cuenta_cte)
destroy(this.cb_cerrar)
destroy(this.dw_estado_cta_cte)
destroy(this.dw_listado_cuenta_cte)
destroy(this.dw_listado_cuenta_cte_cta)
destroy(this.dw_cons_docu_w)
end on

event open;Long	ll_count,ll_count_reg
if gs_serie<>'' and gi_numero>0 and gs_base<>'' then
	gf_centrar (w_cuenta_corriente_liberador)
   dw_encabezado_cuenta_cte.SetTransObject(SQLCA)
   if dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)=0 then
		messagebox("Advertencia","No Registra Datos Anexo Liberador "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
		close(w_cuenta_corriente_liberador)
	else
		dw_estado_cta_cte.SetTransObject(SQLCA)
		dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
		dw_listado_cuenta_cte.SetTransObject(SQLCA)
		dw_listado_cuenta_cte.Retrieve(gs_serie, gi_numero,gs_base)
		gs_ventana	= 'w_cuenta_corriente_liberador'
		f_valida_objeto()
		if gs_depto = 'V' or gs_depto='G' or gs_depto='I' or gs_depto='O' or gs_depto='T' or gs_depto='D' then
			cb_agente.enabled			= true
			cb_rescomi_vta.enabled	= true
		else
			cb_agente.enabled			= false
			cb_rescomi_vta.enabled	= false
		end if
		SELECT	COUNT("DOCUMENTOS"."FOLIO")  
		INTO 		:ll_count  
		FROM 		"DOCUMENTOS",   
					"INGRESO"  
		WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
				 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
				 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
				 ( "INGRESO"."BASE" = :gs_base ) AND  
				 ( "INGRESO"."SERIE" = :gs_serie ) AND  
				 ( "INGRESO"."CONTRATO" = :gi_numero ) AND
				 ( "DOCUMENTOS"."ESTADO_CH" = 'P' OR "DOCUMENTOS"."ESTADO_CH" = 'T' ) AND
				 ( "DOCUMENTOS"."COD_PAGO" = 'CH');
		if ll_count>0 then
			cb_est_cheque.enabled	= true
		else
			cb_est_cheque.enabled	= false
		end if
		SELECT	COUNT("DETALLE_CONVENIO_PROTESTO"."BASE_ORIGINAL")  
		INTO 		:ll_count_reg  
		FROM 		"DETALLE_CONVENIO_PROTESTO"  
		WHERE  ( "DETALLE_CONVENIO_PROTESTO"."BASE_ORIGINAL" = :gs_base ) AND  
				 ( "DETALLE_CONVENIO_PROTESTO"."SERIE_ORIGINAL" = :gs_serie ) AND  
				 ( "DETALLE_CONVENIO_PROTESTO"."NUMERO_ORIGINAL" = :gi_numero )   
		USING		sqlca;
		if ll_count_reg>0 then
			cb_convenio.enabled		= true
		else
			cb_convenio.enabled		= false
		end if
	end if
else
	close(w_cuenta_corriente_liberador)
end if
end event

event close;if gs_serie<>'' and gi_numero>0 and gs_base<>'' and dw_encabezado_cuenta_cte.rowcount()>0 then
	gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
	gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
	gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
	gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
	gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
	gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
	gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
	gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
	gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
	gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
	INSERT INTO 	"LOG_CONSULTA"  
					( 	"BASE",   	"SERIE",   	"NUMERO",	"FECHA",   				"RUT_CLIENTE",	"USUARIO",	"NRO_PRINT" ,		"TCP_IP",		"USUARIO_WIN")  
	VALUES 		( 	:gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,		:gi_rut,   		:gs_user,	:il_count_print,	:gs_tcp_ip,		:gs_user_maq )  
	USING				sqlca;
	if sqlca.sqlcode=0 then
		commit;
	else
		rollback;
	end if
end if
end event

type cb_convenio from commandbutton within w_cuenta_corriente_liberador_bkp
integer x = 1742
integer y = 1572
integer width = 443
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Con&venio Pago CH"
end type

event clicked;String	ls_string
gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_detalle_convenio_pago_cheque_protesto) then close(w_detalle_convenio_pago_cheque_protesto)
ls_string				= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
openwithparm(w_detalle_convenio_pago_cheque_protesto,ls_string)
end event

type cb_est_cheque from commandbutton within w_cuenta_corriente_liberador_bkp
integer x = 1376
integer y = 1664
integer width = 361
integer height = 84
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Estado Cheque"
end type

event clicked;String	ls_string
gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if gi_rut>0 then
	ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	if isvalid(w_consultar_estado_de_cheques) then close(w_consultar_estado_de_cheques)
	openwithparm(w_consultar_estado_de_cheques,ls_string)
end if
end event

type cb_6 from commandbutton within w_cuenta_corriente_liberador_bkp
integer x = 46
integer y = 1664
integer width = 411
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuo&tas Crédito"
end type

event clicked;if dw_encabezado_cuenta_cte.rowcount()>0 then
	gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
	gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
	gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
	gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
	gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
	gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
	gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
	gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
	gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
	gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		if isvalid(w_repacta) then close(w_repacta)
		open(w_repacta)
	end if
end if
end event

type cb_detalle from commandbutton within w_cuenta_corriente_liberador_bkp
event ue_mousemove pbm_mousemove
integer x = 1376
integer y = 1572
integer width = 361
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Control &Dcto"
end type

event clicked;String	ls_string
gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
if not isnull(gs_base) and gi_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end event

type cb_cupones from commandbutton within w_cuenta_corriente_liberador_bkp
integer x = 1010
integer y = 1664
integer width = 361
integer height = 84
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cupo&nes"
end type

event clicked;gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_ver_cupones) then close(w_ver_cupones)
open(w_ver_cupones)
end event

type cb_rescomi_vta from commandbutton within w_cuenta_corriente_liberador_bkp
integer x = 1010
integer y = 1572
integer width = 361
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Pagos Venta"
end type

event clicked;gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_rescomi_por_vta) then close(w_rescomi_por_vta)
open(w_rescomi_por_vta)
end event

type cb_operaciones from commandbutton within w_cuenta_corriente_liberador_bkp
integer x = 695
integer y = 1664
integer width = 311
integer height = 84
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Operaciones"
end type

event clicked;String	ls_string, ls_nombre, ls_ap_pat,ls_ap_mat,ls_dv, ls_nom_comp, ls_rut_comp
Long		ll_rut
if isvalid(w_ingreso_solicitudes) then close(w_ingreso_solicitudes)
gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
ls_nombre	= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_nombre')
ls_ap_pat	= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_a_paterno')
ls_ap_mat	= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_a_materno')
ll_rut		= dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
ls_dv			= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_dv')
ls_nom_comp	= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
ls_rut_comp	= string(ll_rut,'###,###,###')+' - '+ls_dv
ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+ls_nom_comp+'~t'+ls_rut_comp
OpenWithParm(w_ingreso_solicitudes,ls_string)

end event

type cb_agente from commandbutton within w_cuenta_corriente_liberador_bkp
integer x = 695
integer y = 1572
integer width = 311
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&gente"
end type

event clicked;string ls_age, ls_sup, ls_string
gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
ls_string	= dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente')+'~t'+&
				  dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super')
if isvalid(w_agente_info) then close(w_agente_info)
openwithparm(w_agente_info,ls_string)


end event

type cb_5 from commandbutton within w_cuenta_corriente_liberador_bkp
event clicked pbm_bnclicked
integer x = 46
integer y = 1572
integer width = 411
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cobranza"
end type

event clicked;gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
open(w_cobranza_historica)
end event

type dw_agente_super from datawindow within w_cuenta_corriente_liberador_bkp
boolean visible = false
integer x = 503
integer y = 228
integer width = 2089
integer height = 1100
integer taborder = 20
boolean titlebar = true
string title = "Nombre Agente / Supervisor"
string dataobject = "d_agente_oferta2"
boolean controlmenu = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;this.visible = FALSE
end event

type cb_2 from commandbutton within w_cuenta_corriente_liberador_bkp
integer x = 462
integer y = 1664
integer width = 229
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uotas"
end type

event clicked;gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
dw_listado_cuenta_cte_cta.SetTransObject(SQLCA)
dw_listado_cuenta_cte_cta.Retrieve(gs_serie, gi_numero,gs_base)
dw_listado_cuenta_cte_cta.visible	= true
end event

type cb_1 from commandbutton within w_cuenta_corriente_liberador_bkp
integer x = 462
integer y = 1572
integer width = 229
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Total"
end type

event clicked;dw_listado_cuenta_cte.visible	= true

end event

type cb_imprimir from commandbutton within w_cuenta_corriente_liberador_bkp
integer x = 2400
integer y = 1572
integer width = 256
integer height = 84
integer taborder = 170
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;gs_datawindow_a_imprimir = 'd_rep_impresion_ctta_cte_liberador'
if isvalid(w_impresion_previa_de_ctta_ctes) then close(w_impresion_previa_de_ctta_ctes)
Open(w_impresion_previa_de_ctta_ctes)
il_count_print ++
end event

type dw_encabezado_cuenta_cte from datawindow within w_cuenta_corriente_liberador_bkp
integer x = 23
integer y = 24
integer width = 3168
integer height = 764
integer taborder = 10
string dataobject = "d_encabezado_cuenta_cte_liberador"
boolean border = false
boolean livescroll = true
end type

event doubleclicked;string agente, superv
agente 						= getitemstring(1,"anexo_liberador_cod_agente")
superv 						= getitemstring(1,"anexo_liberador_cod_super")
dw_agente_super.settransobject(sqlca)
dw_agente_super.retrieve(agente, superv)
dw_agente_super.visible	= true

end event

type cb_cerrar from commandbutton within w_cuenta_corriente_liberador_bkp
integer x = 2917
integer y = 1572
integer width = 261
integer height = 84
integer taborder = 180
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_cuenta_corriente_liberador)
end event

type dw_estado_cta_cte from datawindow within w_cuenta_corriente_liberador_bkp
integer x = 2400
integer y = 820
integer width = 782
integer height = 716
string dataobject = "d_estado_cta_cte_liberador"
boolean border = false
boolean livescroll = true
end type

type dw_listado_cuenta_cte from datawindow within w_cuenta_corriente_liberador_bkp
integer x = 37
integer y = 824
integer width = 2327
integer height = 704
integer taborder = 40
boolean titlebar = true
string title = "Detalle Cta Cte Total"
string dataobject = "d_listado_cuenta_cte"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long 		folio1
string 	tcom1
if getrow() > 0 then
	folio1	= getitemnumber(getrow(), "folio")
	tcom1 	= getitemstring(getrow(), "tipo_cob")
	dw_cons_docu_w.settransobject(sqlca)
	dw_cons_docu_w.retrieve(folio1, tcom1)
	dw_cons_docu_w.visible	= true
end if

end event

type dw_listado_cuenta_cte_cta from datawindow within w_cuenta_corriente_liberador_bkp
integer x = 37
integer y = 824
integer width = 2327
integer height = 704
integer taborder = 50
boolean titlebar = true
string title = "Detalle Cuotas Cta. Cte."
string dataobject = "d_listado_cuenta_cte_cta"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long 		folio1
string 	tcom1
if getrow()>0 then
	folio1 						= getitemnumber(getrow(), "folio")
	tcom1 						= getitemstring(getrow(), "tipo_cob")
	dw_cons_docu_w.settransobject(sqlca)
	dw_cons_docu_w.retrieve(folio1, tcom1)
	dw_cons_docu_w.visible	= true
end if
end event

type dw_cons_docu_w from datawindow within w_cuenta_corriente_liberador_bkp
boolean visible = false
integer x = 37
integer y = 824
integer width = 2341
integer height = 704
integer taborder = 30
boolean titlebar = true
string title = "Detalle de Pago"
string dataobject = "cons_docu_w"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;this.visible = FALSE
end event

