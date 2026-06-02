forward
global type w_rango_fecha_aum from window
end type
type cb_cancelar from commandbutton within w_rango_fecha_aum
end type
type cb_aceptar from commandbutton within w_rango_fecha_aum
end type
type st_1 from statictext within w_rango_fecha_aum
end type
type p_2 from picture within w_rango_fecha_aum
end type
type em_2 from editmask within w_rango_fecha_aum
end type
type st_2 from statictext within w_rango_fecha_aum
end type
type p_1 from picture within w_rango_fecha_aum
end type
type em_1 from editmask within w_rango_fecha_aum
end type
type st_titulo from statictext within w_rango_fecha_aum
end type
end forward

global type w_rango_fecha_aum from window
integer width = 1810
integer height = 896
boolean titlebar = true
string title = "Rango Fecha Liberadores"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
st_1 st_1
p_2 p_2
em_2 em_2
st_2 st_2
p_1 p_1
em_1 em_1
st_titulo st_titulo
end type
global w_rango_fecha_aum w_rango_fecha_aum

on w_rango_fecha_aum.create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.st_1=create st_1
this.p_2=create p_2
this.em_2=create em_2
this.st_2=create st_2
this.p_1=create p_1
this.em_1=create em_1
this.st_titulo=create st_titulo
this.Control[]={this.cb_cancelar,&
this.cb_aceptar,&
this.st_1,&
this.p_2,&
this.em_2,&
this.st_2,&
this.p_1,&
this.em_1,&
this.st_titulo}
end on

on w_rango_fecha_aum.destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.st_1)
destroy(this.p_2)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.em_1)
destroy(this.st_titulo)
end on

event open;long	ll_anno_today
gf_centrar(w_rango_fecha_aum)
gs_ventana		= 'w_rango_fecha_aum'
f_valida_objeto_1()
ll_anno_today	= year(today())
em_1.text		= string(day(today()))+'/'+string(month(today()))+'/'+string(ll_anno_today - 1)
em_2.text		= string(today())
end event

type cb_cancelar from commandbutton within w_rango_fecha_aum
integer x = 1166
integer y = 580
integer width = 439
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(w_rango_fecha_aum)
end event

type cb_aceptar from commandbutton within w_rango_fecha_aum
integer x = 160
integer y = 580
integer width = 439
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string	ls_string
if isvalid(w_anticipo_comisiones_antigua_aum) then close(w_anticipo_comisiones_antigua_aum)
ls_string	= em_1.text+'~t'+em_2.text
openwithparm(w_anticipo_comisiones_antigua_aum,ls_string)
end event

type st_1 from statictext within w_rango_fecha_aum
integer x = 91
integer y = 368
integer width = 357
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Fecha inicio"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_2 from picture within w_rango_fecha_aum
integer x = 1563
integer y = 360
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
	IF DATE(Message.StringParm)<DATE(EM_1.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_2.setfocus()
		return
	else	
		em_2.text = Message.StringParm
	end if	
END IF
end event

type em_2 from editmask within w_rango_fecha_aum
integer x = 1211
integer y = 356
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type st_2 from statictext within w_rango_fecha_aum
integer x = 997
integer y = 368
integer width = 169
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_1 from picture within w_rango_fecha_aum
integer x = 837
integer y = 360
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
	IF DATE(Message.StringParm)>DATE(EM_2.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_1.setfocus()
		return
	else	
		em_1.text = Message.StringParm
	end if	
END IF
end event

type em_1 from editmask within w_rango_fecha_aum
integer x = 485
integer y = 356
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type st_titulo from statictext within w_rango_fecha_aum
integer x = 55
integer y = 104
integer width = 1655
integer height = 128
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Rango de Fecha a Consultar"
alignment alignment = center!
boolean focusrectangle = false
end type

