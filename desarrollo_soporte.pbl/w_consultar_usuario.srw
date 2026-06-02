forward
global type w_consultar_usuario from window
end type
type sle_user from singlelineedit within w_consultar_usuario
end type
type st_user from statictext within w_consultar_usuario
end type
type st_8 from statictext within w_consultar_usuario
end type
type st_6 from statictext within w_consultar_usuario
end type
type st_nombre_usuario from statictext within w_consultar_usuario
end type
type sle_nombre_usuario from singlelineedit within w_consultar_usuario
end type
type cb_buscar from commandbutton within w_consultar_usuario
end type
type cb_cancelar from commandbutton within w_consultar_usuario
end type
type gb_2 from groupbox within w_consultar_usuario
end type
end forward

global type w_consultar_usuario from window
integer x = 718
integer y = 484
integer width = 1417
integer height = 872
boolean titlebar = true
string title = "Buscar Contrato"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
sle_user sle_user
st_user st_user
st_8 st_8
st_6 st_6
st_nombre_usuario st_nombre_usuario
sle_nombre_usuario sle_nombre_usuario
cb_buscar cb_buscar
cb_cancelar cb_cancelar
gb_2 gb_2
end type
global w_consultar_usuario w_consultar_usuario

on w_consultar_usuario.create
this.sle_user=create sle_user
this.st_user=create st_user
this.st_8=create st_8
this.st_6=create st_6
this.st_nombre_usuario=create st_nombre_usuario
this.sle_nombre_usuario=create sle_nombre_usuario
this.cb_buscar=create cb_buscar
this.cb_cancelar=create cb_cancelar
this.gb_2=create gb_2
this.Control[]={this.sle_user,&
this.st_user,&
this.st_8,&
this.st_6,&
this.st_nombre_usuario,&
this.sle_nombre_usuario,&
this.cb_buscar,&
this.cb_cancelar,&
this.gb_2}
end on

on w_consultar_usuario.destroy
destroy(this.sle_user)
destroy(this.st_user)
destroy(this.st_8)
destroy(this.st_6)
destroy(this.st_nombre_usuario)
destroy(this.sle_nombre_usuario)
destroy(this.cb_buscar)
destroy(this.cb_cancelar)
destroy(this.gb_2)
end on

type sle_user from singlelineedit within w_consultar_usuario
event key pbm_keydown
integer x = 640
integer y = 356
integer width = 608
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event key;if KeyDown(KeyEnter!) then
	cb_buscar.triggerevent (clicked!)
END IF
end event

event getfocus;cb_buscar.default = true

end event

type st_user from statictext within w_consultar_usuario
integer x = 110
integer y = 384
integer width = 517
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Usuario"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_consultar_usuario
integer x = 91
integer y = 56
integer width = 667
integer height = 92
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Buscar por"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_consultar_usuario
integer x = 283
integer y = 252
integer width = 165
integer height = 76
integer textsize = -11
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "+   %"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_nombre_usuario from statictext within w_consultar_usuario
integer x = 110
integer y = 192
integer width = 517
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Nombre Usuario"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_nombre_usuario from singlelineedit within w_consultar_usuario
event key pbm_keydown
integer x = 640
integer y = 184
integer width = 608
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event key;if KeyDown(KeyEnter!) then
	cb_buscar.triggerevent (clicked!)
END IF
end event

event getfocus;cb_buscar.default = true

end event

type cb_buscar from commandbutton within w_consultar_usuario
integer x = 55
integer y = 568
integer width = 498
integer height = 116
integer taborder = 30
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;string tipo
string esta
IF sle_nombre_usuario.text = "" THEN
	IF sle_user.text = "" THEN
		gs_user = sle_user.text
	END IF	
END IF
if isvalid(w_lista_usuario) then close(w_lista_usuario)
Open(w_lista_usuario)
end event

type cb_cancelar from commandbutton within w_consultar_usuario
integer x = 786
integer y = 572
integer width = 498
integer height = 116
integer taborder = 60
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(w_consultar_usuario)
end event

type gb_2 from groupbox within w_consultar_usuario
integer x = 55
integer y = 68
integer width = 1230
integer height = 460
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar"
end type

