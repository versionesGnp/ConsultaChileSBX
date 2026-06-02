forward
global type w_acceso_asigna from window
end type
type cb_2 from commandbutton within w_acceso_asigna
end type
type cb_1 from commandbutton within w_acceso_asigna
end type
type sle_1 from singlelineedit within w_acceso_asigna
end type
type gb_1 from groupbox within w_acceso_asigna
end type
end forward

global type w_acceso_asigna from window
integer x = 1527
integer y = 1372
integer width = 1248
integer height = 712
boolean titlebar = true
string title = "w_eliminar"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cb_2 cb_2
cb_1 cb_1
sle_1 sle_1
gb_1 gb_1
end type
global w_acceso_asigna w_acceso_asigna

on w_acceso_asigna.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_1=create sle_1
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.sle_1,&
this.gb_1}
end on

on w_acceso_asigna.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.gb_1)
end on

event open;this.title = gs_app_name
gf_centrar (w_acceso_asigna)
end event

event close;w_plano_sector_parque.dw_plano_sector_parque.enabled = true
end event

type cb_2 from commandbutton within w_acceso_asigna
integer x = 837
integer y = 468
integer width = 343
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;//sle_1.text=''
CloseWithReturn(w_acceso_asigna, '')
end event

type cb_1 from commandbutton within w_acceso_asigna
integer x = 50
integer y = 468
integer width = 343
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
boolean default = true
end type

event clicked;CloseWithReturn(w_acceso_asigna, upper(sle_1.text))
//w_eliminar.VISIBLE=FALSE
end event

type sle_1 from singlelineedit within w_acceso_asigna
event key pbm_keyup
integer x = 393
integer y = 216
integer width = 425
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_acceso_asigna
integer x = 50
integer y = 60
integer width = 1129
integer height = 360
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
string text = "Ingrese Código de Acceso"
end type

