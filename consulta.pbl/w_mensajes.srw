forward
global type w_mensajes from window
end type
type dw_mensajes from datawindow within w_mensajes
end type
type cb_cerrar from commandbutton within w_mensajes
end type
end forward

global type w_mensajes from window
integer x = 347
integer y = 308
integer width = 2583
integer height = 848
boolean titlebar = true
string title = "Mensajes al Cliente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
dw_mensajes dw_mensajes
cb_cerrar cb_cerrar
end type
global w_mensajes w_mensajes

on w_mensajes.create
this.dw_mensajes=create dw_mensajes
this.cb_cerrar=create cb_cerrar
this.Control[]={this.dw_mensajes,&
this.cb_cerrar}
end on

on w_mensajes.destroy
destroy(this.dw_mensajes)
destroy(this.cb_cerrar)
end on

event open;gf_centrar (w_mensajes)
dw_mensajes.SetTransObject(SQLCA)
dw_mensajes.Retrieve(gi_rut)
end event

type dw_mensajes from datawindow within w_mensajes
integer x = 37
integer y = 40
integer width = 2487
integer height = 548
integer taborder = 10
string dataobject = "dw_mensajes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_mensajes
integer x = 2185
integer y = 628
integer width = 338
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
boolean default = true
end type

event clicked;
close(w_mensajes)
end event

