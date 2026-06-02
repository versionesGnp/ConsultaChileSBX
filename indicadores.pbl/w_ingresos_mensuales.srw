forward
global type w_ingresos_mensuales from window
end type
type st_2 from statictext within w_ingresos_mensuales
end type
type st_1 from statictext within w_ingresos_mensuales
end type
type cb_3 from commandbutton within w_ingresos_mensuales
end type
type pb_1 from picturebutton within w_ingresos_mensuales
end type
type p_2 from picture within w_ingresos_mensuales
end type
type p_1 from picture within w_ingresos_mensuales
end type
type em_2 from editmask within w_ingresos_mensuales
end type
type em_1 from editmask within w_ingresos_mensuales
end type
type dw_1 from datawindow within w_ingresos_mensuales
end type
type cb_2 from commandbutton within w_ingresos_mensuales
end type
type cb_1 from commandbutton within w_ingresos_mensuales
end type
type gb_1 from groupbox within w_ingresos_mensuales
end type
end forward

global type w_ingresos_mensuales from window
integer x = 5
integer y = 4
integer width = 3653
integer height = 2400
boolean titlebar = true
string title = "Ingresos Mensuales"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_2 st_2
st_1 st_1
cb_3 cb_3
pb_1 pb_1
p_2 p_2
p_1 p_1
em_2 em_2
em_1 em_1
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_ingresos_mensuales w_ingresos_mensuales

type variables
Date	idt_fecha_hoy
end variables

on w_ingresos_mensuales.create
this.st_2=create st_2
this.st_1=create st_1
this.cb_3=create cb_3
this.pb_1=create pb_1
this.p_2=create p_2
this.p_1=create p_1
this.em_2=create em_2
this.em_1=create em_1
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.st_1,&
this.cb_3,&
this.pb_1,&
this.p_2,&
this.p_1,&
this.em_2,&
this.em_1,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_ingresos_mensuales.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.pb_1)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;string	mes,año,dia
date 		fecha1,fecha2

idt_fecha_hoy	= date(gdt_fec_sistema)
gf_centrar(w_ingresos_mensuales)
dia 			= string(day(idt_fecha_hoy))
mes 			= string(month(idt_fecha_hoy))
año 			= string(year(idt_fecha_hoy))
dw_1.settransobject (sqlca)
if integer(mes) < 12 then
	fecha1 	= date('01/'+string(mes)+'/'+año)
	fecha2 	= date('01/'+string(integer(mes) +1)+'/'+año)
else
	fecha1 	= date('01/'+string(mes)+'/'+año)
	fecha2 	= date('01/'+string(1)+'/'+string(integer(año)+1))
end if
fecha2 		= RelativeDate(fecha2, -1)
em_1.text 	= string(fecha1)
em_2.text 	= string(fecha2)
dw_1.retrieve(fecha1,fecha2)
dw_1.object.titulo.text 	= gs_empresa
dw_1.object.titulo1.text 	= '( Ingresos entre las fechas '+string(fecha1,'dd/mm/yyyy')+' y '+string(fecha2,'dd/mm/yyyy')+' )'
end event

type st_2 from statictext within w_ingresos_mensuales
integer x = 1504
integer y = 2168
integer width = 78
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "al"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ingresos_mensuales
integer x = 809
integer y = 2168
integer width = 187
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_ingresos_mensuales
integer x = 375
integer y = 2148
integer width = 347
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Resumen"
end type

event clicked;OpenWithParm(w_resumen_ingreso, em_1.text+'~t'+em_2.text)
end event

type pb_1 from picturebutton within w_ingresos_mensuales
integer x = 2089
integer y = 2152
integer width = 123
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa.bmp"
end type

event clicked;if date(em_1.text) > date(em_2.text) then
	messagebox('Error','La fecha inicial debe ser menor a la final',stopsign!)
	em_1.text = string(today())
	em_2.text = string(today())
else
	dw_1.reset()
	dw_1.retrieve(date(em_1.text),date(em_2.text))
	dw_1.object.titulo.text = gs_empresa
	dw_1.object.titulo1.text = '( Ingresos entre las fechas '+em_1.text+' y '+em_2.text+' )'
end if
end event

type p_2 from picture within w_ingresos_mensuales
integer x = 1966
integer y = 2156
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
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

type p_1 from picture within w_ingresos_mensuales
integer x = 1403
integer y = 2156
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
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

type em_2 from editmask within w_ingresos_mensuales
integer x = 1591
integer y = 2156
integer width = 370
integer height = 88
integer taborder = 40
integer textsize = -10
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

type em_1 from editmask within w_ingresos_mensuales
integer x = 1029
integer y = 2156
integer width = 370
integer height = 88
integer taborder = 30
integer textsize = -10
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

type dw_1 from datawindow within w_ingresos_mensuales
integer x = 41
integer y = 40
integer width = 3552
integer height = 2052
string dataobject = "dw_composit_ingreso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_ingresos_mensuales
integer x = 3264
integer y = 2148
integer width = 329
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingresos_mensuales)
end event

type cb_1 from commandbutton within w_ingresos_mensuales
integer x = 41
integer y = 2148
integer width = 329
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type gb_1 from groupbox within w_ingresos_mensuales
integer x = 795
integer y = 2096
integer width = 1454
integer height = 180
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

