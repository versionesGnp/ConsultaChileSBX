forward
global type u_prueba1 from olecustomcontrol
end type
end forward

global type u_prueba1 from olecustomcontrol
integer width = 878
integer height = 448
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "u_prueba1.udo"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
event ocx_step ( )
event readfinished ( )
event playfinished ( )
event click ( )
event keydown ( integer keycode,  integer shift )
event keyup ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event dblclick ( )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
end type
global u_prueba1 u_prueba1

on u_prueba1.create
end on

on u_prueba1.destroy
end on

