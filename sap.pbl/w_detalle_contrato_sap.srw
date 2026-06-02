forward
global type w_detalle_contrato_sap from window
end type
type cb_cta_cte from commandbutton within w_detalle_contrato_sap
end type
type cb_imprimir from commandbutton within w_detalle_contrato_sap
end type
type cb_2 from commandbutton within w_detalle_contrato_sap
end type
type dw_lista from datawindow within w_detalle_contrato_sap
end type
end forward

global type w_detalle_contrato_sap from window
integer width = 3630
integer height = 1968
boolean titlebar = true
string title = "Detalle Ingreso Caja Supervisores"
boolean controlmenu = true
long backcolor = 67108864
cb_cta_cte cb_cta_cte
cb_imprimir cb_imprimir
cb_2 cb_2
dw_lista dw_lista
end type
global w_detalle_contrato_sap w_detalle_contrato_sap

type variables
long il_row
end variables

on w_detalle_contrato_sap.create
this.cb_cta_cte=create cb_cta_cte
this.cb_imprimir=create cb_imprimir
this.cb_2=create cb_2
this.dw_lista=create dw_lista
this.Control[]={this.cb_cta_cte,&
this.cb_imprimir,&
this.cb_2,&
this.dw_lista}
end on

on w_detalle_contrato_sap.destroy
destroy(this.cb_cta_cte)
destroy(this.cb_imprimir)
destroy(this.cb_2)
destroy(this.dw_lista)
end on

event open;string		ls_base,ls_serie,ls_tipo_deuda,ls_nro_cuota,ls_string
long		ll_tot_reg,ll_nro_cuota,ll_fila
double	ldb_numero

gf_centrar(w_detalle_contrato_sap)
dw_lista.settransobject(sqlca)

ls_base			= substr(1,1,Message.StringParm)
ls_serie			= substr(1,2,Message.StringParm)
ldb_numero		= double(substr(1,3,Message.StringParm))
ls_tipo_deuda	= substr(1,4,Message.StringParm)
ll_nro_cuota		= long(substr(1,5,Message.StringParm))

if not isnull(ls_base) and ls_base<>'' and  not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 and not isnull(ls_tipo_deuda) and ls_tipo_deuda<>'' then
	ll_tot_reg	= dw_lista.retrieve(ls_base,ls_serie,ldb_numero,ls_tipo_deuda)
	if ll_tot_reg>0 then
		dw_lista.Object.usuario.text = gs_user
		ls_nro_cuota		= string(ll_nro_cuota,'000')
		ls_string				= "nro_cuota = '"+ls_nro_cuota+"'"
		ll_fila 					= dw_lista.find(ls_string, 1, ll_tot_reg)
		if ll_fila>0 then
			dw_lista.scrolltorow(ll_fila)
			dw_lista.SelectRow(ll_fila, true)
		else
			messagebox("Advertencia","Nº Contrato No Existe en Lista")
			dw_lista.scrolltorow(1)
		end if
	else
		messagebox("Advertencia","No registra dato")
		close(w_detalle_contrato_sap)
	end if
end if
end event

type cb_cta_cte from commandbutton within w_detalle_contrato_sap
integer x = 37
integer y = 1712
integer width = 498
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;
if il_row > 0 then
	gs_base 									= dw_lista.GetItemString(il_row, "base")
	gs_serie 									= dw_lista.GetItemString(il_row, "serie")
	gi_numero 								= dw_lista.GetItemNumber(il_row, "numero")
	gi_rut 									= dw_lista.GetItemNumber(il_row,"sap_cadena_rut")
	SELECT	"CADENA"."ESTADO",		"CADENA"."COD_PARQUE", 		"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO", 	"CLIENTE"."DV"  
	INTO 		:gs_estado, 					:gl_cod_parque_cta,   			:gs_nombres,   			:gs_apellido_paterno,			:gs_apellido_materno,		:gs_dv
	FROM 	"CADENA",	"CLIENTE"  
	WHERE ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
			( ( "CADENA"."CODIGO" = :gs_base ) AND  
			( "CADENA"."SERIE" = :gs_serie ) AND  
			( "CADENA"."NUMERO" = :gi_numero ) )   
	USING	sqlca;
	if not isnull(gs_base) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O" 	// Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				Open(w_cuenta_corriente_funeraria)
		END CHOOSE
	end if
end if
end event

type cb_imprimir from commandbutton within w_detalle_contrato_sap
integer x = 1701
integer y = 1716
integer width = 288
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() >0 then 
	f_Print( dw_lista )
end if
end event

type cb_2 from commandbutton within w_detalle_contrato_sap
integer x = 3287
integer y = 1712
integer width = 288
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_contrato_sap)
end event

type dw_lista from datawindow within w_detalle_contrato_sap
integer x = 37
integer y = 36
integer width = 3538
integer height = 1648
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_contrato_sap"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

