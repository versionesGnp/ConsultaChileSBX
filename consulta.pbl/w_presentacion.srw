forward
global type w_presentacion from window
end type
type st_1 from statictext within w_presentacion
end type
type p_1 from picture within w_presentacion
end type
end forward

global type w_presentacion from window
integer x = 1038
integer y = 452
integer width = 1454
integer height = 1308
boolean titlebar = true
windowtype windowtype = popup!
long backcolor = 79741120
st_1 st_1
p_1 p_1
end type
global w_presentacion w_presentacion

on w_presentacion.create
this.st_1=create st_1
this.p_1=create p_1
this.Control[]={this.st_1,&
this.p_1}
end on

on w_presentacion.destroy
destroy(this.st_1)
destroy(this.p_1)
end on

event timer;


gb_presentacion=FALSE
end event

event open;gf_centrar(w_presentacion)
this.title				= gs_app_name
st_1.text 				= gs_app_name
p_1.picturename 	= 'NUESTROS-PARQUES2.png'
//if gs_conexion = "Parque El Prado" then
//	if gl_cod_parque=1 then
//		p_1.picturename 	= 'logo_e.bmp'
//	elseif gl_cod_parque=102 then
//		p_1.picturename 	= 'logo_manantial.bmp'
//	elseif gl_cod_parque=103 then
//		p_1.picturename 	= 'logo_parque_stgo.bmp'
//	else
//		p_1.picturename 	= 'logo_e.bmp'
//	end if
//elseif gs_conexion = "Parque La Foresta" then
//	p_1.picturename 	= 'logo_e_s.bmp'
//elseif gs_conexion = "Parque Santiago" then
//	p_1.picturename 	= 'logo_parque_stgo.bmp'
//end if

end event

type st_1 from statictext within w_presentacion
integer x = 32
integer y = 1132
integer width = 1371
integer height = 52
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
boolean enabled = false
string text = "Sistema de Consulta 2.05"
alignment alignment = center!
long bordercolor = 16711680
boolean focusrectangle = false
end type

type p_1 from picture within w_presentacion
integer x = 23
integer y = 24
integer width = 1390
integer height = 1168
string picturename = "NUESTROS-PARQUES2.png"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

