forward
global type w_ip_parque_glosa from window
end type
type dw_1 from datawindow within w_ip_parque_glosa
end type
end forward

global type w_ip_parque_glosa from window
integer width = 1554
integer height = 616
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
dw_1 dw_1
end type
global w_ip_parque_glosa w_ip_parque_glosa

on w_ip_parque_glosa.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_ip_parque_glosa.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_ip_parque_glosa
integer x = 229
integer y = 120
integer width = 1198
integer height = 120
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

