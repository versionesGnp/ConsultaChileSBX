forward
global type w_ver_beneficiario_con_ctto_asoc from window
end type
type cb_ctacte from commandbutton within w_ver_beneficiario_con_ctto_asoc
end type
type cb_cerrar from commandbutton within w_ver_beneficiario_con_ctto_asoc
end type
type dw_lista from datawindow within w_ver_beneficiario_con_ctto_asoc
end type
end forward

global type w_ver_beneficiario_con_ctto_asoc from window
integer width = 1614
integer height = 1500
boolean titlebar = true
string title = "Lista de Contratos "
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_ver_beneficiario_con_ctto_asoc w_ver_beneficiario_con_ctto_asoc

type variables
Long	il_row
end variables

on w_ver_beneficiario_con_ctto_asoc.create
this.cb_ctacte=create cb_ctacte
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_ctacte,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_ver_beneficiario_con_ctto_asoc.destroy
destroy(this.cb_ctacte)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;Long		ll_rut,ll_new
Double	ll_numero
String		ls_serie,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_base

gf_centrar(w_ver_beneficiario_con_ctto_asoc)
dw_lista.settransobject(sqlca)
dw_lista.reset()
ll_rut		= Long(substr(1,1,Message.StringParm))
ls_dv		= trim(substr(1,2,Message.StringParm))
if ll_rut>0 then
	DECLARE x1 CURSOR FOR  
	SELECT	"CO_PROP"."SERIE",   
				"CO_PROP"."NRO_OFERTA",   
				"CO_PROP"."NOMBRE",   
				"CO_PROP"."A_PATERNO",   
				"CO_PROP"."A_MATERNO"  
	FROM 		"CO_PROP"  
	WHERE 	"CO_PROP"."RUT" = :ll_rut   
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		ls_base			= 'O'
		DO WHILE sqlca.sqlcode=0
			fetch x1 into :ls_serie,:ll_numero,:ls_nom,:ls_ap_pat,:ls_ap_mat;
			if not isnull(ls_nom) and ls_nom<>'' then
				ll_new	= dw_lista.insertrow(0)
				dw_lista.ScrollToRow(ll_new)
				dw_lista.setitem(ll_new,'rut',ll_rut)
				dw_lista.setitem(ll_new,'dv',ls_dv)
				dw_lista.setitem(ll_new,'nombre',ls_nom)
				dw_lista.setitem(ll_new,'ap_paterno',ls_ap_pat)
				dw_lista.setitem(ll_new,'ap_materno',ls_ap_mat)
				dw_lista.setitem(ll_new,'base',ls_base)
				dw_lista.setitem(ll_new,'serie',ls_serie)
				dw_lista.setitem(ll_new,'numero',ll_numero)
			end if
			setnull(ls_nom)
		LOOP
		dw_lista.accepttext()
	end if
	close x1;
	DECLARE x2 CURSOR FOR  
	SELECT	"COPROP_ISACRUZ"."SERIE",   
				"COPROP_ISACRUZ"."NUMERO",   
				"COPROP_ISACRUZ"."NOMBRES",   
				"COPROP_ISACRUZ"."APATERNO",   
				"COPROP_ISACRUZ"."AMATERNO"  
	FROM 		"COPROP_ISACRUZ"  
	WHERE 	"COPROP_ISACRUZ"."RUT" = :ll_rut   
	USING		sqlca;
	open x2;
	if sqlca.sqlcode=0 then
		ls_base			= 'C'
		DO WHILE sqlca.sqlcode=0
			fetch x2 into :ls_serie,:ll_numero,:ls_nom,:ls_ap_pat,:ls_ap_mat;
			if not isnull(ls_nom) and ls_nom<>'' then
				ll_new	= dw_lista.insertrow(0)
				dw_lista.ScrollToRow(ll_new)
				dw_lista.setitem(ll_new,'rut',ll_rut)
				dw_lista.setitem(ll_new,'dv',ls_dv)
				dw_lista.setitem(ll_new,'nombre',ls_nom)
				dw_lista.setitem(ll_new,'ap_paterno',ls_ap_pat)
				dw_lista.setitem(ll_new,'ap_materno',ls_ap_mat)
				dw_lista.setitem(ll_new,'base',ls_base)
				dw_lista.setitem(ll_new,'serie',ls_serie)
				dw_lista.setitem(ll_new,'numero',ll_numero)
			end if
			setnull(ls_nom)
		LOOP
		dw_lista.accepttext()
	end if
	close x2;
end if
if dw_lista.rowcount()=0 then
	messagebox("Advertencia","No se Registra como Beneficiario")
	cb_cerrar.triggerevent(clicked!)
end if
end event

type cb_ctacte from commandbutton within w_ver_beneficiario_con_ctto_asoc
integer x = 41
integer y = 1240
integer width = 434
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;String	param
if dw_lista.rowcount()>0 then
	gs_base 									= dw_lista.GetItemString(il_row, "base")
	gs_serie 									= dw_lista.GetItemString(il_row, "serie")
	gi_numero 								= dw_lista.GetItemNumber(il_row, "numero")
	gi_rut 									= dw_lista.GetItemNumber(il_row, "rut")
	gs_apellido_paterno					= dw_lista.GetItemString(il_row, "ap_paterno")
	gs_apellido_materno					= dw_lista.GetItemString(il_row, "ap_materno")
	gs_nombres								= dw_lista.GetItemString(il_row, "nombre")
	gs_dv										= dw_lista.GetItemString(il_row, "dv")
	if not isnull(gs_base) and gs_base<>'' then
		param     		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				OpenWithParm(w_cuenta_corriente_oferta,param)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				OpenWithParm(w_cuenta_corriente_liberador,param)		
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				OpenWithParm(w_cuenta_corriente_pagare,param)		
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				OpenWithParm(w_cuenta_corriente_derecho,param)		
			CASE "R" //Reprog. Mant
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				OpenWithParm(w_cuenta_corriente_aumento_capacidad,param)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				openwithparm(w_cuenta_corriente_funeraria,param) 
		END CHOOSE
	end if
end if
end event

type cb_cerrar from commandbutton within w_ver_beneficiario_con_ctto_asoc
integer x = 1184
integer y = 1240
integer width = 347
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ver_beneficiario_con_ctto_asoc)
end event

type dw_lista from datawindow within w_ver_beneficiario_con_ctto_asoc
integer x = 37
integer y = 36
integer width = 1490
integer height = 1172
integer taborder = 10
boolean titlebar = true
string title = "Listado de Contratos donde Cliente es Copropietario"
string dataobject = "dwe_lista_beneficiario_contratos"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then cb_ctacte.triggerevent(clicked!)
	
end event

