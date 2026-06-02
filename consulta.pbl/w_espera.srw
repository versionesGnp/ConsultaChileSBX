forward
global type w_espera from window
end type
type st_i from statictext within w_espera
end type
type st_2 from statictext within w_espera
end type
type st_1 from statictext within w_espera
end type
type p_1 from picture within w_espera
end type
end forward

global type w_espera from window
integer x = 832
integer y = 360
integer width = 1591
integer height = 580
boolean titlebar = true
string title = "Inmobiliaria"
windowtype windowtype = popup!
long backcolor = 79741120
st_i st_i
st_2 st_2
st_1 st_1
p_1 p_1
end type
global w_espera w_espera

on w_espera.create
this.st_i=create st_i
this.st_2=create st_2
this.st_1=create st_1
this.p_1=create p_1
this.Control[]={this.st_i,&
this.st_2,&
this.st_1,&
this.p_1}
end on

on w_espera.destroy
destroy(this.st_i)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_1)
end on

event open;
gf_centrar(w_espera)
if gs_conexion = "Parque El Prado" then
	if gl_cod_parque=1 then
		p_1.picturename 	= 'logo_e.bmp'
	elseif gl_cod_parque=102 then
		p_1.picturename 	= 'logo_manantial.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 	= 'logo_parque_stgo.bmp'
	else
		p_1.picturename 	= 'logo_e.bmp'
	end if
elseif gs_conexion = "Parque La Foresta" then
	p_1.picturename 	= 'logo_e_s.bmp'
elseif gs_conexion = "Parque Santiago" then
	p_1.picturename 	= 'logo_parque_stgo.bmp'
elseif gs_conexion = "Parque Concepción" then
	p_1.picturename 	= 'logo_parque_conce.jpg'
end if
end event

type st_i from statictext within w_espera
integer x = 462
integer y = 192
integer width = 1074
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type st_2 from statictext within w_espera
integer x = 453
integer y = 260
integer width = 969
integer height = 164
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "El sistema está recuperando información existente."
boolean focusrectangle = false
end type

type st_1 from statictext within w_espera
integer x = 475
integer y = 92
integer width = 631
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Espere por favor..."
boolean focusrectangle = false
end type

type p_1 from picture within w_espera
integer x = 32
integer y = 24
integer width = 389
integer height = 416
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

