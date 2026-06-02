forward
global type w_lista_beneficios_asociados from window
end type
type cb_cerrar from commandbutton within w_lista_beneficios_asociados
end type
type dw_lista from datawindow within w_lista_beneficios_asociados
end type
end forward

global type w_lista_beneficios_asociados from window
integer width = 3333
integer height = 1836
boolean titlebar = true
string title = "Detalle Beneficios"
boolean controlmenu = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_lista_beneficios_asociados w_lista_beneficios_asociados

on w_lista_beneficios_asociados.create
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.dw_lista}
end on

on w_lista_beneficios_asociados.destroy
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;long 	ll_codigo

gf_centrar(w_lista_beneficios_asociados)

dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
ll_codigo		= long(Message.StringParm)
if not isnull(ll_codigo) then
	if dw_lista.retrieve(ll_codigo) = 0 then
		messagebox('Advertencia','No Registra Dato')
	end if	
end if	
end event

type cb_cerrar from commandbutton within w_lista_beneficios_asociados
integer x = 3003
integer y = 1624
integer width = 283
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_lista_beneficios_asociados)
end event

type dw_lista from datawindow within w_lista_beneficios_asociados
integer x = 32
integer y = 32
integer width = 3255
integer height = 1560
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_beneficios_asociados"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

