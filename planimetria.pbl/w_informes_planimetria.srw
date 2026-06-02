forward
global type w_informes_planimetria from window
end type
type rb_1 from radiobutton within w_informes_planimetria
end type
type st_1 from statictext within w_informes_planimetria
end type
end forward

global type w_informes_planimetria from window
integer width = 2784
integer height = 1408
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
rb_1 rb_1
st_1 st_1
end type
global w_informes_planimetria w_informes_planimetria

on w_informes_planimetria.create
this.rb_1=create rb_1
this.st_1=create st_1
this.Control[]={this.rb_1,&
this.st_1}
end on

on w_informes_planimetria.destroy
destroy(this.rb_1)
destroy(this.st_1)
end on

type rb_1 from radiobutton within w_informes_planimetria
integer x = 105
integer y = 252
integer width = 1029
integer height = 96
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Disponibilidad para la Venta"
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_informes_planimetria
integer x = 69
integer y = 64
integer width = 814
integer height = 92
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Informes Planimetria"
boolean focusrectangle = false
end type

