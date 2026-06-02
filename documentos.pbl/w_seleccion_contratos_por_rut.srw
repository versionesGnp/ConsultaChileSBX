forward
global type w_seleccion_contratos_por_rut from window
end type
type dw_1 from datawindow within w_seleccion_contratos_por_rut
end type
type cb_2 from commandbutton within w_seleccion_contratos_por_rut
end type
type cb_1 from commandbutton within w_seleccion_contratos_por_rut
end type
end forward

global type w_seleccion_contratos_por_rut from window
integer x = 1189
integer y = 556
integer width = 1198
integer height = 960
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_seleccion_contratos_por_rut w_seleccion_contratos_por_rut

type variables
integer li_filas
end variables

event open;Double numero
this.title = gs_app_name
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
dw_1.SetTransObject(sqlca)
numero = Double(Message.StringParm)
if dw_1.Retrieve(numero) = 0 then
	messagebox ('No Existe Cliente','No existe el rut del cliente.',stopsign!)
	close(w_seleccion_contratos_por_rut)
end if
end event

on w_seleccion_contratos_por_rut.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_seleccion_contratos_por_rut.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type dw_1 from datawindow within w_seleccion_contratos_por_rut
integer x = 69
integer y = 44
integer width = 1042
integer height = 640
integer taborder = 1
string dataobject = "dw_resultado_busqueda_x_rut"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;This.SelectRow(0, FALSE)
This.SelectRow(getrow(), TRUE)
end event

event clicked;if row > 0 then
	li_filas = row
	gs_base = getitemstring(row,'cadena_codigo')
	gs_serie = getitemstring(row,'cadena_serie')
	gi_numero = getitemnumber(row,'cadena_numero')
end if
end event

type cb_2 from commandbutton within w_seleccion_contratos_por_rut
integer x = 809
integer y = 720
integer width = 302
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_seleccion_contratos_por_rut)
end event

type cb_1 from commandbutton within w_seleccion_contratos_por_rut
integer x = 69
integer y = 720
integer width = 302
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;if li_filas > 0 then
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho Especial
			Open(w_cuenta_corriente_derecho)
	END CHOOSE
else
	messagebox('Selección', 'Debe seleccionar un contrato',information!)
end if
end event

