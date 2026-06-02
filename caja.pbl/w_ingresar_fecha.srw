forward
global type w_ingresar_fecha from window
end type
type st_1 from statictext within w_ingresar_fecha
end type
type p_1 from picture within w_ingresar_fecha
end type
type em_fecha from editmask within w_ingresar_fecha
end type
type cb_cancelar from commandbutton within w_ingresar_fecha
end type
type cb_aceptar from commandbutton within w_ingresar_fecha
end type
end forward

global type w_ingresar_fecha from window
integer x = 1074
integer y = 484
integer width = 1426
integer height = 596
boolean titlebar = true
string title = "Consultar Fecha"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
st_1 st_1
p_1 p_1
em_fecha em_fecha
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
end type
global w_ingresar_fecha w_ingresar_fecha

on w_ingresar_fecha.create
this.st_1=create st_1
this.p_1=create p_1
this.em_fecha=create em_fecha
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.Control[]={this.st_1,&
this.p_1,&
this.em_fecha,&
this.cb_cancelar,&
this.cb_aceptar}
end on

on w_ingresar_fecha.destroy
destroy(this.st_1)
destroy(this.p_1)
destroy(this.em_fecha)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
end on

event open;gf_centrar(w_ingresar_fecha)
end event

type st_1 from statictext within w_ingresar_fecha
integer x = 475
integer y = 64
integer width = 695
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Ingrese Fecha"
boolean focusrectangle = false
end type

type p_1 from picture within w_ingresar_fecha
integer x = 41
integer y = 28
integer width = 416
integer height = 440
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_fecha from editmask within w_ingresar_fecha
integer x = 512
integer y = 188
integer width = 443
integer height = 96
integer taborder = 2
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
string displaydata = ""
end type

type cb_cancelar from commandbutton within w_ingresar_fecha
integer x = 1001
integer y = 328
integer width = 347
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

type cb_aceptar from commandbutton within w_ingresar_fecha
integer x = 1001
integer y = 188
integer width = 347
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

