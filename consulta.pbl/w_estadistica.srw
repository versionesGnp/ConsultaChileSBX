forward
global type w_estadistica from window
end type
type st_3 from statictext within w_estadistica
end type
type st_2 from statictext within w_estadistica
end type
type dw_cuenta_venta_i from datawindow within w_estadistica
end type
type cb_2 from commandbutton within w_estadistica
end type
type cb_1 from commandbutton within w_estadistica
end type
type st_1 from statictext within w_estadistica
end type
type dw_cuenta_venta from datawindow within w_estadistica
end type
end forward

global type w_estadistica from window
integer x = 1074
integer y = 484
integer width = 2345
integer height = 1504
boolean titlebar = true
string title = "Estadistica de Ofertas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
st_3 st_3
st_2 st_2
dw_cuenta_venta_i dw_cuenta_venta_i
cb_2 cb_2
cb_1 cb_1
st_1 st_1
dw_cuenta_venta dw_cuenta_venta
end type
global w_estadistica w_estadistica

on w_estadistica.create
this.st_3=create st_3
this.st_2=create st_2
this.dw_cuenta_venta_i=create dw_cuenta_venta_i
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.dw_cuenta_venta=create dw_cuenta_venta
this.Control[]={this.st_3,&
this.st_2,&
this.dw_cuenta_venta_i,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.dw_cuenta_venta}
end on

on w_estadistica.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_cuenta_venta_i)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.dw_cuenta_venta)
end on

type st_3 from statictext within w_estadistica
integer x = 1861
integer y = 660
integer width = 366
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Inmobiliaria"
boolean focusrectangle = false
end type

type st_2 from statictext within w_estadistica
integer x = 1883
integer y = 100
integer width = 357
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Monumento"
boolean focusrectangle = false
end type

type dw_cuenta_venta_i from datawindow within w_estadistica
integer x = 91
integer y = 764
integer width = 2144
integer height = 388
integer taborder = 20
string dataobject = "d_cuenta_venta_i"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_estadistica
integer x = 1614
integer y = 1220
integer width = 315
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ejecutar"
end type

event clicked;dw_cuenta_venta.SetTransObject(SQLCA)
dw_cuenta_venta.Retrieve()

dw_cuenta_venta_i.SetTransObject(SQLCA)
dw_cuenta_venta_i.Retrieve()

gs_ventana	= string(this)
f_valida_objeto()
end event

type cb_1 from commandbutton within w_estadistica
integer x = 1934
integer y = 1220
integer width = 306
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
close (w_estadistica)
end event

type st_1 from statictext within w_estadistica
integer x = 105
integer y = 36
integer width = 1403
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "ESTADISTICA DE OFERTAS"
boolean focusrectangle = false
end type

type dw_cuenta_venta from datawindow within w_estadistica
integer x = 105
integer y = 184
integer width = 2135
integer height = 396
integer taborder = 10
string dataobject = "d_cuenta_venta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

