forward
global type w_plano from window
end type
type cb_2 from commandbutton within w_plano
end type
type st_1 from statictext within w_plano
end type
type ddlb_1 from dropdownlistbox within w_plano
end type
type cb_1 from commandbutton within w_plano
end type
type dw_1 from datawindow within w_plano
end type
end forward

global type w_plano from window
integer x = 1335
integer y = 684
integer width = 4192
integer height = 2560
boolean titlebar = true
string title = "PLANO GENERAL PARQUE"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_2 cb_2
st_1 st_1
ddlb_1 ddlb_1
cb_1 cb_1
dw_1 dw_1
end type
global w_plano w_plano

on w_plano.create
this.cb_2=create cb_2
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.st_1,&
this.ddlb_1,&
this.cb_1,&
this.dw_1}
end on

on w_plano.destroy
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.insertrow(0)
dw_1.Object.DataWindow.Zoom = 200
gf_centrar(w_plano)
end event

type cb_2 from commandbutton within w_plano
integer x = 64
integer y = 2272
integer width = 288
integer height = 108
integer taborder = 21
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprime"
end type

event clicked;
dw_1.print()
end event

type st_1 from statictext within w_plano
integer x = 1001
integer y = 2280
integer width = 274
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Zoom"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_plano
integer x = 1317
integer y = 2272
integer width = 658
integer height = 396
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"50","75","100","110","120","150","170","200","300"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_1.Object.DataWindow.Zoom = this.text
end event

type cb_1 from commandbutton within w_plano
integer x = 3785
integer y = 2272
integer width = 288
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_plano)
end event

type dw_1 from datawindow within w_plano
integer x = 64
integer y = 60
integer width = 4009
integer height = 2144
integer taborder = 20
string dataobject = "dw_prueba_dibujo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

