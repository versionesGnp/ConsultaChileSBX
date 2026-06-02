forward
global type w_contar_registros from window
end type
type st_titulo2 from statictext within w_contar_registros
end type
type st_procesando from statictext within w_contar_registros
end type
type st_total from statictext within w_contar_registros
end type
type st_3 from statictext within w_contar_registros
end type
type st_2 from statictext within w_contar_registros
end type
type st_titulo from statictext within w_contar_registros
end type
type gb_1 from groupbox within w_contar_registros
end type
end forward

global type w_contar_registros from window
integer width = 1600
integer height = 924
boolean titlebar = true
string title = "Procesando"
long backcolor = 67108864
st_titulo2 st_titulo2
st_procesando st_procesando
st_total st_total
st_3 st_3
st_2 st_2
st_titulo st_titulo
gb_1 gb_1
end type
global w_contar_registros w_contar_registros

on w_contar_registros.create
this.st_titulo2=create st_titulo2
this.st_procesando=create st_procesando
this.st_total=create st_total
this.st_3=create st_3
this.st_2=create st_2
this.st_titulo=create st_titulo
this.gb_1=create gb_1
this.Control[]={this.st_titulo2,&
this.st_procesando,&
this.st_total,&
this.st_3,&
this.st_2,&
this.st_titulo,&
this.gb_1}
end on

on w_contar_registros.destroy
destroy(this.st_titulo2)
destroy(this.st_procesando)
destroy(this.st_total)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_titulo)
destroy(this.gb_1)
end on

event open;gf_centrar(w_contar_registros)
end event

type st_titulo2 from statictext within w_contar_registros
integer x = 32
integer y = 200
integer width = 1490
integer height = 108
integer textsize = -13
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type st_procesando from statictext within w_contar_registros
integer x = 1061
integer y = 584
integer width = 389
integer height = 104
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 8388608
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type st_total from statictext within w_contar_registros
integer x = 1061
integer y = 464
integer width = 389
integer height = 104
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 255
long backcolor = 79741120
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_contar_registros
integer x = 96
integer y = 584
integer width = 937
integer height = 104
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 255
long backcolor = 67108864
string text = "Registros en Proceso: "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_contar_registros
integer x = 229
integer y = 464
integer width = 805
integer height = 104
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 8388608
long backcolor = 79741120
string text = "Total Registros: "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_titulo from statictext within w_contar_registros
integer x = 46
integer y = 52
integer width = 1472
integer height = 120
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comisiones Promesas"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_contar_registros
integer x = 46
integer y = 336
integer width = 1472
integer height = 428
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 8388608
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

