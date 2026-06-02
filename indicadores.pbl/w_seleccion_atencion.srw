forward
global type w_seleccion_atencion from window
end type
type st_3 from statictext within w_seleccion_atencion
end type
type st_1 from statictext within w_seleccion_atencion
end type
type cb_2 from commandbutton within w_seleccion_atencion
end type
type cb_1 from commandbutton within w_seleccion_atencion
end type
type p_1 from picture within w_seleccion_atencion
end type
type em_1 from editmask within w_seleccion_atencion
end type
type p_2 from picture within w_seleccion_atencion
end type
type em_2 from editmask within w_seleccion_atencion
end type
type gb_1 from groupbox within w_seleccion_atencion
end type
end forward

global type w_seleccion_atencion from window
integer x = 1189
integer y = 556
integer width = 1289
integer height = 720
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_3 st_3
st_1 st_1
cb_2 cb_2
cb_1 cb_1
p_1 p_1
em_1 em_1
p_2 p_2
em_2 em_2
gb_1 gb_1
end type
global w_seleccion_atencion w_seleccion_atencion

type variables
string menu
end variables

event open;this.x 		= ( gl_width - this.width)/2
this.y 		= ( gl_height - this.height)/2
this.title 	= gs_app_name
menu 			= substr (1,1,Message.StringParm)
this.title 	= upper(mid(menu,4))
em_1.text 	= string(today (),'dd/mm/yyyy')
em_2.text 	= string(today (),'dd/mm/yyyy')
end event

on w_seleccion_atencion.create
this.st_3=create st_3
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.p_1=create p_1
this.em_1=create em_1
this.p_2=create p_2
this.em_2=create em_2
this.gb_1=create gb_1
this.Control[]={this.st_3,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.p_1,&
this.em_1,&
this.p_2,&
this.em_2,&
this.gb_1}
end on

on w_seleccion_atencion.destroy
destroy(this.st_3)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.p_1)
destroy(this.em_1)
destroy(this.p_2)
destroy(this.em_2)
destroy(this.gb_1)
end on

type st_3 from statictext within w_seleccion_atencion
integer x = 197
integer y = 336
integer width = 443
integer height = 80
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
boolean enabled = false
string text = "Fecha Term."
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_seleccion_atencion
integer x = 197
integer y = 140
integer width = 443
integer height = 80
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
boolean enabled = false
string text = "Fecha Inicio"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_seleccion_atencion
integer x = 859
integer y = 360
integer width = 334
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_seleccion_atencion)
end event

type cb_1 from commandbutton within w_seleccion_atencion
integer x = 859
integer y = 148
integer width = 334
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;if trim(em_1.text) <> '' and trim(em_2.text) <> '' then
	OpenWithParm(w_atencion_publico, em_1.text+'~t'+em_2.text+'~t'+menu)
else
	messagebox("Advertencia","Falta ingresar dato")
end if
end event

type p_1 from picture within w_seleccion_atencion
event clicked pbm_bnclicked
integer x = 558
integer y = 220
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_1.text)=-1 then 
	em_1.text=string(today(),gs_formato_fecha)
	em_1.setfocus()
	return
end if	
if em_1.text<>'00/00/0000' then
	ls_fecha = em_1.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_1.text = Message.StringParm
end if	
end event

type em_1 from editmask within w_seleccion_atencion
integer x = 197
integer y = 224
integer width = 357
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = "D"
end type

type p_2 from picture within w_seleccion_atencion
event clicked pbm_bnclicked
integer x = 558
integer y = 416
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_2.text)=-1 then 
	em_2.text=string(today(),gs_formato_fecha)
	em_2.setfocus()
	return
end if	
if em_2.text<>'00/00/0000' then
	ls_fecha = em_2.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_2.text = Message.StringParm
end if	
end event

type em_2 from editmask within w_seleccion_atencion
integer x = 197
integer y = 420
integer width = 357
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = "D"
end type

type gb_1 from groupbox within w_seleccion_atencion
integer x = 64
integer y = 48
integer width = 695
integer height = 516
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Selección de Fechas"
borderstyle borderstyle = stylelowered!
end type

