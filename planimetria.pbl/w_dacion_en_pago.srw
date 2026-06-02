forward
global type w_dacion_en_pago from window
end type
type cb_2 from commandbutton within w_dacion_en_pago
end type
type cb_1 from commandbutton within w_dacion_en_pago
end type
type dw_1 from datawindow within w_dacion_en_pago
end type
end forward

global type w_dacion_en_pago from window
integer width = 2199
integer height = 2000
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_dacion_en_pago w_dacion_en_pago

on w_dacion_en_pago.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_dacion_en_pago.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_2 from commandbutton within w_dacion_en_pago
integer x = 1705
integer y = 1692
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

type cb_1 from commandbutton within w_dacion_en_pago
integer x = 69
integer y = 1688
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

type dw_1 from datawindow within w_dacion_en_pago
integer x = 59
integer y = 56
integer width = 2053
integer height = 1588
integer taborder = 10
string title = "none"
string dataobject = "dw_dacion_en_pago"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

