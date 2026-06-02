forward
global type w_lista_detalle_promocion from window
end type
type cb_cerrar from commandbutton within w_lista_detalle_promocion
end type
type dw_lista from datawindow within w_lista_detalle_promocion
end type
end forward

global type w_lista_detalle_promocion from window
integer width = 2738
integer height = 1920
boolean titlebar = true
string title = "Detalle Promoción"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_lista_detalle_promocion w_lista_detalle_promocion

on w_lista_detalle_promocion.create
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.dw_lista}
end on

on w_lista_detalle_promocion.destroy
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;Long	ll_codigo
gf_centrar(w_lista_detalle_promocion)
dw_lista.settransobject(sqlca)
ll_codigo = long(Message.StringParm)
if dw_lista.retrieve(ll_codigo)=0 then
	messagebox("Advertencia","No Registra Detalle Promoción")
	close(w_lista_detalle_promocion)
end if
end event

type cb_cerrar from commandbutton within w_lista_detalle_promocion
integer x = 2350
integer y = 1656
integer width = 334
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_detalle_promocion)
end event

type dw_lista from datawindow within w_lista_detalle_promocion
integer x = 41
integer y = 36
integer width = 2642
integer height = 1568
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_promocion"
boolean vscrollbar = true
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

