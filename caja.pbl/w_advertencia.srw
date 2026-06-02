forward
global type w_advertencia from window
end type
type cb_cerrar from commandbutton within w_advertencia
end type
type st_2 from statictext within w_advertencia
end type
type p_1 from picture within w_advertencia
end type
type st_1 from statictext within w_advertencia
end type
end forward

global type w_advertencia from window
integer x = 832
integer y = 360
integer width = 1897
integer height = 852
boolean titlebar = true
string title = "Advertencia"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cb_cerrar cb_cerrar
st_2 st_2
p_1 p_1
st_1 st_1
end type
global w_advertencia w_advertencia

on w_advertencia.create
this.cb_cerrar=create cb_cerrar
this.st_2=create st_2
this.p_1=create p_1
this.st_1=create st_1
this.Control[]={this.cb_cerrar,&
this.st_2,&
this.p_1,&
this.st_1}
end on

on w_advertencia.destroy
destroy(this.cb_cerrar)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.st_1)
end on

event open;
gf_centrar(w_advertencia)



end event

type cb_cerrar from commandbutton within w_advertencia
integer x = 1472
integer y = 624
integer width = 343
integer height = 108
integer taborder = 1
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
boolean cancel = true
boolean default = true
end type

event clicked;
gs_base =""
gs_serie=""
gi_numero=0

Close(w_advertencia)
end event

type st_2 from statictext within w_advertencia
integer x = 471
integer y = 56
integer width = 1298
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "No se puede realizar un ingreso desde Caja"
boolean focusrectangle = false
end type

type p_1 from picture within w_advertencia
integer x = 37
integer y = 32
integer width = 302
integer height = 332
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_advertencia
integer x = 462
integer y = 156
integer width = 1335
integer height = 404
integer textsize = -16
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 79741120
boolean enabled = false
string text = "Este contrato se encuentra NULO, RESUELTO o REPROGRAMADO, favor dirigirse a Atención Cliente."
boolean focusrectangle = false
end type

