forward
global type w_libro_de_venta from window
end type
type dw_1 from datawindow within w_libro_de_venta
end type
end forward

global type w_libro_de_venta from window
integer width = 3378
integer height = 1408
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
end type
global w_libro_de_venta w_libro_de_venta

on w_libro_de_venta.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_libro_de_venta.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_libro_de_venta
integer x = 46
integer y = 168
integer width = 3223
integer height = 1012
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

