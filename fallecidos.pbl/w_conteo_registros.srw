forward
global type w_conteo_registros from window
end type
type cb_1 from commandbutton within w_conteo_registros
end type
type st_fin from statictext within w_conteo_registros
end type
type st_ini from statictext within w_conteo_registros
end type
type st_5 from statictext within w_conteo_registros
end type
type st_3 from statictext within w_conteo_registros
end type
type st_4 from statictext within w_conteo_registros
end type
type st_2 from statictext within w_conteo_registros
end type
type st_1 from statictext within w_conteo_registros
end type
end forward

global type w_conteo_registros from window
integer x = 1038
integer y = 452
integer width = 1600
integer height = 744
boolean titlebar = true
string title = "Procesando Registros"
boolean resizable = true
long backcolor = 80269524
cb_1 cb_1
st_fin st_fin
st_ini st_ini
st_5 st_5
st_3 st_3
st_4 st_4
st_2 st_2
st_1 st_1
end type
global w_conteo_registros w_conteo_registros

on w_conteo_registros.create
this.cb_1=create cb_1
this.st_fin=create st_fin
this.st_ini=create st_ini
this.st_5=create st_5
this.st_3=create st_3
this.st_4=create st_4
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.cb_1,&
this.st_fin,&
this.st_ini,&
this.st_5,&
this.st_3,&
this.st_4,&
this.st_2,&
this.st_1}
end on

on w_conteo_registros.destroy
destroy(this.cb_1)
destroy(this.st_fin)
destroy(this.st_ini)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;//this.x = ( gl_width - this.width)/2
//this.y = ( gl_height - this.height)/2

end event

type cb_1 from commandbutton within w_conteo_registros
integer x = 1225
integer y = 60
integer width = 283
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_conteo_registros)
end event

type st_fin from statictext within w_conteo_registros
integer x = 462
integer y = 448
integer width = 997
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
boolean focusrectangle = false
end type

type st_ini from statictext within w_conteo_registros
integer x = 462
integer y = 340
integer width = 997
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
boolean focusrectangle = false
end type

type st_5 from statictext within w_conteo_registros
integer x = 59
integer y = 456
integer width = 283
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "TERMINO"
boolean focusrectangle = false
end type

type st_3 from statictext within w_conteo_registros
integer x = 59
integer y = 340
integer width = 283
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "INICIO"
boolean focusrectangle = false
end type

type st_4 from statictext within w_conteo_registros
integer x = 18
integer y = 216
integer width = 1102
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 80269524
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_conteo_registros
integer x = 69
integer y = 48
integer width = 1051
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Este proceso puede tardar algunos minutos"
boolean focusrectangle = false
end type

type st_1 from statictext within w_conteo_registros
boolean visible = false
integer x = 155
integer y = 108
integer width = 805
integer height = 88
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 80269524
boolean enabled = false
string text = "Procesando Registros."
boolean focusrectangle = false
end type

