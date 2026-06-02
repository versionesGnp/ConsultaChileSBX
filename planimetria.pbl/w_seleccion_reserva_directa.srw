forward
global type w_seleccion_reserva_directa from window
end type
type cb_1 from commandbutton within w_seleccion_reserva_directa
end type
type dw_1 from datawindow within w_seleccion_reserva_directa
end type
end forward

global type w_seleccion_reserva_directa from window
integer width = 2011
integer height = 928
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_1 cb_1
dw_1 dw_1
end type
global w_seleccion_reserva_directa w_seleccion_reserva_directa

on w_seleccion_reserva_directa.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_1}
end on

on w_seleccion_reserva_directa.destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;Double  numero

gf_centrar(w_seleccion_reserva_directa)
numero 		= Double(Message.StringParm)
dw_1.settransobject(sqlca)
if dw_1.retrieve(numero) = 0 then
	messagebox('No existe','No existen registros', information!)
	CloseWithReturn(w_seleccion_reserva_directa, "no")
//	close(w_seleccion_reserva_directa)
end if
end event

type cb_1 from commandbutton within w_seleccion_reserva_directa
integer x = 1531
integer y = 672
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;CloseWithReturn(w_seleccion_reserva_directa, "no")
end event

type dw_1 from datawindow within w_seleccion_reserva_directa
integer x = 50
integer y = 32
integer width = 1883
integer height = 608
integer taborder = 10
string title = "none"
string dataobject = "dw_seleccion_reserva_directa"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

gs_base   	= getitemstring(row,'cadena_codigo')
gs_serie  	= getitemstring(row,'cadena_serie')
gi_numero 	= getitemnumber(row,'cadena_numero')
end event

event doubleclicked;CloseWithReturn(w_seleccion_reserva_directa, "si")
end event

