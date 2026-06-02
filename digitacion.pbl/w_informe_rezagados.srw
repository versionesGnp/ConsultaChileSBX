forward
global type w_informe_rezagados from window
end type
type cb_imprimir from commandbutton within w_informe_rezagados
end type
type cb_salir from commandbutton within w_informe_rezagados
end type
type st_1 from statictext within w_informe_rezagados
end type
type p_1 from picture within w_informe_rezagados
end type
type dw_listado_rezagados from datawindow within w_informe_rezagados
end type
type dw_impresion from datawindow within w_informe_rezagados
end type
end forward

global type w_informe_rezagados from window
integer x = 832
integer y = 360
integer width = 2697
integer height = 1388
boolean titlebar = true
string title = "Informe Rezagados No Traspazados"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cb_imprimir cb_imprimir
cb_salir cb_salir
st_1 st_1
p_1 p_1
dw_listado_rezagados dw_listado_rezagados
dw_impresion dw_impresion
end type
global w_informe_rezagados w_informe_rezagados

on w_informe_rezagados.create
this.cb_imprimir=create cb_imprimir
this.cb_salir=create cb_salir
this.st_1=create st_1
this.p_1=create p_1
this.dw_listado_rezagados=create dw_listado_rezagados
this.dw_impresion=create dw_impresion
this.Control[]={this.cb_imprimir,&
this.cb_salir,&
this.st_1,&
this.p_1,&
this.dw_listado_rezagados,&
this.dw_impresion}
end on

on w_informe_rezagados.destroy
destroy(this.cb_imprimir)
destroy(this.cb_salir)
destroy(this.st_1)
destroy(this.p_1)
destroy(this.dw_listado_rezagados)
destroy(this.dw_impresion)
end on

event open;
gf_centrar(w_informe_rezagados)
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
dw_listado_rezagados.SetTransObject(SQLCA)
dw_listado_rezagados.Retrieve()

dw_impresion.SetTransObject(SQLCA)
dw_impresion.Retrieve()
end event

type cb_imprimir from commandbutton within w_informe_rezagados
integer x = 1838
integer y = 1156
integer width = 389
integer height = 108
integer taborder = 22
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
boolean default = true
end type

event clicked;
dw_impresion.Print()

Close(w_informe_rezagados)
end event

type cb_salir from commandbutton within w_informe_rezagados
integer x = 2249
integer y = 1156
integer width = 389
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Salir"
boolean cancel = true
end type

event clicked;
Close(w_informe_rezagados)
end event

type st_1 from statictext within w_informe_rezagados
integer x = 338
integer y = 80
integer width = 1669
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Listado de Rezagados no traspasados"
boolean focusrectangle = false
end type

type p_1 from picture within w_informe_rezagados
integer x = 32
integer y = 32
integer width = 238
integer height = 228
string picturename = "logo_parque_conce.jpg"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_listado_rezagados from datawindow within w_informe_rezagados
integer x = 37
integer y = 288
integer width = 2619
integer height = 832
integer taborder = 20
string dataobject = "d_listado_rezagados"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_impresion from datawindow within w_informe_rezagados
boolean visible = false
integer x = 2075
integer y = 80
integer width = 494
integer height = 360
integer taborder = 10
string dataobject = "d_rep_rezagados"
boolean livescroll = true
end type

