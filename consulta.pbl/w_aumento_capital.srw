forward
global type w_aumento_capital from window
end type
type dw_1 from datawindow within w_aumento_capital
end type
type cb_2 from commandbutton within w_aumento_capital
end type
type cb_1 from commandbutton within w_aumento_capital
end type
end forward

global type w_aumento_capital from window
integer x = 1074
integer y = 484
integer width = 2629
integer height = 1692
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_aumento_capital w_aumento_capital

on w_aumento_capital.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_aumento_capital.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type dw_1 from datawindow within w_aumento_capital
integer x = 46
integer y = 40
integer width = 2519
integer height = 1380
integer taborder = 10
string dataobject = "dw_aumento_capital"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_aumento_capital
integer x = 2231
integer y = 1460
integer width = 334
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

type cb_1 from commandbutton within w_aumento_capital
integer x = 46
integer y = 1460
integer width = 334
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

