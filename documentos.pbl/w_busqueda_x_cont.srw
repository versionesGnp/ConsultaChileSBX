forward
global type w_busqueda_x_cont from window
end type
type st_1 from statictext within w_busqueda_x_cont
end type
type sle_3 from singlelineedit within w_busqueda_x_cont
end type
type cb_2 from commandbutton within w_busqueda_x_cont
end type
type cb_1 from commandbutton within w_busqueda_x_cont
end type
type gb_1 from groupbox within w_busqueda_x_cont
end type
end forward

global type w_busqueda_x_cont from window
integer x = 1189
integer y = 556
integer width = 1179
integer height = 568
boolean titlebar = true
string title = "Buscar por Contrato"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_1 st_1
sle_3 sle_3
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_busqueda_x_cont w_busqueda_x_cont

event open;this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
end event

on w_busqueda_x_cont.create
this.st_1=create st_1
this.sle_3=create sle_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.sle_3,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_busqueda_x_cont.destroy
destroy(this.st_1)
destroy(this.sle_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

type st_1 from statictext within w_busqueda_x_cont
integer x = 96
integer y = 68
integer width = 325
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
boolean enabled = false
string text = " Numero :"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_3 from singlelineedit within w_busqueda_x_cont
integer x = 480
integer y = 160
integer width = 448
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_busqueda_x_cont
integer x = 800
integer y = 340
integer width = 302
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_busqueda_x_cont)
end event

type cb_1 from commandbutton within w_busqueda_x_cont
integer x = 59
integer y = 340
integer width = 302
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;gi_tipo_busqueda	= 8
gi_numero 			= Double(sle_3.text)
sle_3.text 			= ''
sle_3.setfocus()
open(w_listado_contratos)

end event

type gb_1 from groupbox within w_busqueda_x_cont
integer x = 59
integer y = 76
integer width = 1047
integer height = 236
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "none"
end type

