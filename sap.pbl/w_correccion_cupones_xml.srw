forward
global type w_correccion_cupones_xml from window
end type
type dw_1 from datawindow within w_correccion_cupones_xml
end type
end forward

global type w_correccion_cupones_xml from window
integer width = 3803
integer height = 1584
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
global w_correccion_cupones_xml w_correccion_cupones_xml

on w_correccion_cupones_xml.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_correccion_cupones_xml.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_correccion_cupones_xml
integer x = 55
integer y = 72
integer width = 690
integer height = 1244
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

