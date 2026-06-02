forward
global type w_mantenedor_codigo_reaclamos from window
end type
type pb_ok from picturebutton within w_mantenedor_codigo_reaclamos
end type
type dw_select_depto from datawindow within w_mantenedor_codigo_reaclamos
end type
type cb_cerrar from commandbutton within w_mantenedor_codigo_reaclamos
end type
type dw_ingreso from datawindow within w_mantenedor_codigo_reaclamos
end type
end forward

global type w_mantenedor_codigo_reaclamos from window
integer width = 3319
integer height = 1780
boolean titlebar = true
string title = "Mantenedor"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_ok pb_ok
dw_select_depto dw_select_depto
cb_cerrar cb_cerrar
dw_ingreso dw_ingreso
end type
global w_mantenedor_codigo_reaclamos w_mantenedor_codigo_reaclamos

on w_mantenedor_codigo_reaclamos.create
this.pb_ok=create pb_ok
this.dw_select_depto=create dw_select_depto
this.cb_cerrar=create cb_cerrar
this.dw_ingreso=create dw_ingreso
this.Control[]={this.pb_ok,&
this.dw_select_depto,&
this.cb_cerrar,&
this.dw_ingreso}
end on

on w_mantenedor_codigo_reaclamos.destroy
destroy(this.pb_ok)
destroy(this.dw_select_depto)
destroy(this.cb_cerrar)
destroy(this.dw_ingreso)
end on

event open;gf_centrar(w_mantenedor_codigo_reaclamos)
end event

type pb_ok from picturebutton within w_mantenedor_codigo_reaclamos
integer x = 1609
integer y = 36
integer width = 178
integer height = 156
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = left!
end type

type dw_select_depto from datawindow within w_mantenedor_codigo_reaclamos
integer x = 55
integer y = 68
integer width = 1509
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "dwe_select_depto_empresa"
boolean border = false
boolean livescroll = true
end type

type cb_cerrar from commandbutton within w_mantenedor_codigo_reaclamos
integer x = 2885
integer y = 1524
integer width = 343
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_mantenedor_codigo_reaclamos)
end event

type dw_ingreso from datawindow within w_mantenedor_codigo_reaclamos
integer x = 37
integer y = 228
integer width = 3191
integer height = 1252
integer taborder = 10
string title = "none"
string dataobject = "dw_mantenedor_tipo_requerimiento"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

