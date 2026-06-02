forward
global type w_informe_estadistico_gestion_reclamo from window
end type
type pb_ok from picturebutton within w_informe_estadistico_gestion_reclamo
end type
type p_termino from picture within w_informe_estadistico_gestion_reclamo
end type
type st_desde from statictext within w_informe_estadistico_gestion_reclamo
end type
type em_termino from editmask within w_informe_estadistico_gestion_reclamo
end type
type em_inicio from editmask within w_informe_estadistico_gestion_reclamo
end type
type st_hasta from statictext within w_informe_estadistico_gestion_reclamo
end type
type p_inicio from picture within w_informe_estadistico_gestion_reclamo
end type
type cb_1 from commandbutton within w_informe_estadistico_gestion_reclamo
end type
type cb_cerrar from commandbutton within w_informe_estadistico_gestion_reclamo
end type
type dw_lista from datawindow within w_informe_estadistico_gestion_reclamo
end type
type gb_periodo from groupbox within w_informe_estadistico_gestion_reclamo
end type
end forward

global type w_informe_estadistico_gestion_reclamo from window
integer width = 3776
integer height = 1692
boolean titlebar = true
string title = "Informe Estadístico Gestión Requerimiento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
pb_ok pb_ok
p_termino p_termino
st_desde st_desde
em_termino em_termino
em_inicio em_inicio
st_hasta st_hasta
p_inicio p_inicio
cb_1 cb_1
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_periodo gb_periodo
end type
global w_informe_estadistico_gestion_reclamo w_informe_estadistico_gestion_reclamo

on w_informe_estadistico_gestion_reclamo.create
this.pb_ok=create pb_ok
this.p_termino=create p_termino
this.st_desde=create st_desde
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.st_hasta=create st_hasta
this.p_inicio=create p_inicio
this.cb_1=create cb_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_periodo=create gb_periodo
this.Control[]={this.pb_ok,&
this.p_termino,&
this.st_desde,&
this.em_termino,&
this.em_inicio,&
this.st_hasta,&
this.p_inicio,&
this.cb_1,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_periodo}
end on

on w_informe_estadistico_gestion_reclamo.destroy
destroy(this.pb_ok)
destroy(this.p_termino)
destroy(this.st_desde)
destroy(this.em_termino)
destroy(this.em_inicio)
destroy(this.st_hasta)
destroy(this.p_inicio)
destroy(this.cb_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_periodo)
end on

event open;Long		ll_mes,ll_ano

gf_centrar(w_informe_estadistico_gestion_reclamo)
dw_lista.settransobject(sqlca)
ll_mes						= month(date(gdt_fec_sistema))
ll_ano							= year(date(gdt_fec_sistema))
em_inicio.text				= string('01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))
em_termino.text			= string(gdt_fec_sistema,"dd/mm/yyyy")
end event

type pb_ok from picturebutton within w_informe_estadistico_gestion_reclamo
integer x = 1426
integer y = 24
integer width = 178
integer height = 156
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;Datetime		ldt_fec_ini,ldt_fec_fin
Long			ll_tot_reg

ldt_fec_ini			= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fec_fin			= datetime(date(em_termino.text),time('23:59:59'))
if ldt_fec_ini>ldt_fec_fin then
	messagebox("Advertencia","Fecha Inicio No Puede ser Mayor a Fecha Término")
else
	ll_tot_reg		= dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin)
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Dato")
	end if
end if
dw_lista.accepttext()
end event

type p_termino from picture within w_informe_estadistico_gestion_reclamo
integer x = 1230
integer y = 68
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha

dw_lista.reset()
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text					= string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if em_inicio.text<>'00/00/0000' then
	ls_fecha 							= em_inicio.text
else
	ls_fecha 							= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
if Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
end if
end event

type st_desde from statictext within w_informe_estadistico_gestion_reclamo
integer x = 59
integer y = 84
integer width = 169
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_termino from editmask within w_informe_estadistico_gestion_reclamo
integer x = 869
integer y = 72
integer width = 357
integer height = 80
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
string displaydata = ""
end type

event modified;dw_lista.reset()
end event

type em_inicio from editmask within w_informe_estadistico_gestion_reclamo
integer x = 251
integer y = 72
integer width = 343
integer height = 80
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
string displaydata = ""
end type

event modified;dw_lista.reset()
end event

type st_hasta from statictext within w_informe_estadistico_gestion_reclamo
integer x = 699
integer y = 80
integer width = 146
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_inicio from picture within w_informe_estadistico_gestion_reclamo
integer x = 599
integer y = 68
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha

dw_lista.reset()
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text					= string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if em_inicio.text<>'00/00/0000' then
	ls_fecha 							= em_inicio.text
else
	ls_fecha 							= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
if Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
end if

end event

type cb_1 from commandbutton within w_informe_estadistico_gestion_reclamo
integer x = 46
integer y = 1476
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

type cb_cerrar from commandbutton within w_informe_estadistico_gestion_reclamo
integer x = 3387
integer y = 1472
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_estadistico_gestion_reclamo)
end event

type dw_lista from datawindow within w_informe_estadistico_gestion_reclamo
integer x = 41
integer y = 212
integer width = 3675
integer height = 1208
integer taborder = 10
string title = "none"
string dataobject = "dw_informe_estadistico_gestion_reclamos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;String			ls_campo, ls_columna,ls_string
Datetime		ldt_fecha

ls_columna		= dwo.name

ls_campo		= mid(ls_columna,1,9)
if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
	ldt_fecha		= dw_lista.getitemdatetime(row,'fecha_ult_gestion')
	ls_string		= em_inicio.text+'~t'+em_termino.text+'~t'+string(ldt_fecha)+'~t'+'F'
	openwithparm(w_informe_detallado_gestion_reclamo,ls_string)
else
	if dw_lista.rowcount()>0 then 
		ls_string	= em_inicio.text+'~t'+em_termino.text+'~t'+em_termino.text+'~t'+'T'
		openwithparm(w_informe_detallado_gestion_reclamo,ls_string)
	end if
end if
end event

type gb_periodo from groupbox within w_informe_estadistico_gestion_reclamo
integer x = 41
integer y = 12
integer width = 1307
integer height = 168
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Ingrese Rango Fecha"
end type

