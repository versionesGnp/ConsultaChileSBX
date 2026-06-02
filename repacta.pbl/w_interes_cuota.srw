forward
global type w_interes_cuota from window
end type
type dw_1 from datawindow within w_interes_cuota
end type
type cb_cerrar from commandbutton within w_interes_cuota
end type
end forward

global type w_interes_cuota from window
integer x = 832
integer y = 360
integer width = 2414
integer height = 1156
boolean titlebar = true
string title = "Interes Cuota"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_1 dw_1
cb_cerrar cb_cerrar
end type
global w_interes_cuota w_interes_cuota

on w_interes_cuota.create
this.dw_1=create dw_1
this.cb_cerrar=create cb_cerrar
this.Control[]={this.dw_1,&
this.cb_cerrar}
end on

on w_interes_cuota.destroy
destroy(this.dw_1)
destroy(this.cb_cerrar)
end on

event open;gf_centrar(w_interes_cuota)
dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

type dw_1 from datawindow within w_interes_cuota
integer x = 27
integer y = 36
integer width = 2322
integer height = 864
integer taborder = 10
string dataobject = "dw_interes_cuotas"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;SelectRow(0, FALSE)
SelectRow(getrow(), TRUE)
end event

type cb_cerrar from commandbutton within w_interes_cuota
integer x = 2057
integer y = 924
integer width = 293
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_interes_cuota)
end event

