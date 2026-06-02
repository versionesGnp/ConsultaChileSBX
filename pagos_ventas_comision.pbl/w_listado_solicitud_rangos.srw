forward
global type w_listado_solicitud_rangos from window
end type
type cb_ordenar from commandbutton within w_listado_solicitud_rangos
end type
type cb_imprimir from commandbutton within w_listado_solicitud_rangos
end type
type pb_aceptar from picturebutton within w_listado_solicitud_rangos
end type
type p_termino from picture within w_listado_solicitud_rangos
end type
type p_inicio from picture within w_listado_solicitud_rangos
end type
type st_desde from statictext within w_listado_solicitud_rangos
end type
type em_termino from editmask within w_listado_solicitud_rangos
end type
type em_inicio from editmask within w_listado_solicitud_rangos
end type
type st_hasta from statictext within w_listado_solicitud_rangos
end type
type dw_lista from datawindow within w_listado_solicitud_rangos
end type
type cb_cerrar from commandbutton within w_listado_solicitud_rangos
end type
type gb_periodo from groupbox within w_listado_solicitud_rangos
end type
end forward

global type w_listado_solicitud_rangos from window
integer width = 3570
integer height = 2152
boolean titlebar = true
string title = "Listado Solicitud Gestionadas "
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ordenar cb_ordenar
cb_imprimir cb_imprimir
pb_aceptar pb_aceptar
p_termino p_termino
p_inicio p_inicio
st_desde st_desde
em_termino em_termino
em_inicio em_inicio
st_hasta st_hasta
dw_lista dw_lista
cb_cerrar cb_cerrar
gb_periodo gb_periodo
end type
global w_listado_solicitud_rangos w_listado_solicitud_rangos

type variables
Long	il_mes,il_ano,il_row
end variables

on w_listado_solicitud_rangos.create
this.cb_ordenar=create cb_ordenar
this.cb_imprimir=create cb_imprimir
this.pb_aceptar=create pb_aceptar
this.p_termino=create p_termino
this.p_inicio=create p_inicio
this.st_desde=create st_desde
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.st_hasta=create st_hasta
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.gb_periodo=create gb_periodo
this.Control[]={this.cb_ordenar,&
this.cb_imprimir,&
this.pb_aceptar,&
this.p_termino,&
this.p_inicio,&
this.st_desde,&
this.em_termino,&
this.em_inicio,&
this.st_hasta,&
this.dw_lista,&
this.cb_cerrar,&
this.gb_periodo}
end on

on w_listado_solicitud_rangos.destroy
destroy(this.cb_ordenar)
destroy(this.cb_imprimir)
destroy(this.pb_aceptar)
destroy(this.p_termino)
destroy(this.p_inicio)
destroy(this.st_desde)
destroy(this.em_termino)
destroy(this.em_inicio)
destroy(this.st_hasta)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.gb_periodo)
end on

event open;string	ls_fecha_ini
long 		ll_mes_ini,ll_ano_ini
datetime	ldt_fecha_inicio,ldt_fecha_termino

gf_centrar(w_listado_solicitud_rangos)
em_termino.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
ldt_fecha_termino	= datetime(date(em_termino.text),time('00:00:00'))


ll_mes_ini			= month(date(gdt_fec_sistema))
ll_ano_ini			= year(date(gdt_fec_sistema))
ls_fecha_ini		= '01/'+ string(ll_mes_ini,'00')+ '/' +string(ll_ano_ini,'0000')
em_inicio.text		= string(ls_fecha_ini)
ldt_fecha_inicio	= datetime(date(em_inicio.text),time('00:00:00'))




end event

type cb_ordenar from commandbutton within w_listado_solicitud_rangos
integer x = 1623
integer y = 1920
integer width = 297
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_imprimir from commandbutton within w_listado_solicitud_rangos
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1920
integer width = 297
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type pb_aceptar from picturebutton within w_listado_solicitud_rangos
integer x = 1362
integer y = 56
integer width = 142
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long		ll_tot_reg
datetime	ldt_fecha_inicio,ldt_fecha_termino

ldt_fecha_inicio					= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_termino					= datetime(date(em_termino.text),time('00:00:00'))
dw_lista.dataobject	= 'dw_lista_solicitud_rangos'
dw_lista.settransobject(sqlca)
ll_tot_reg							= dw_lista.retrieve(ldt_fecha_inicio,ldt_fecha_termino)
dw_lista.object.usuario.text	= gs_user
if ll_tot_reg = 0 then
	messagebox('Advertencia','No Registra Solicitudes Con Fecha: '+string(ldt_fecha_inicio,'dd/mm/yyyy')+',  al '+string(ldt_fecha_termino,'dd/mm/yyyy'))
end if
end event

type p_termino from picture within w_listado_solicitud_rangos
integer x = 1211
integer y = 68
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha

if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha = em_termino.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
IF Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
END IF
dw_lista.reset()
end event

type p_inicio from picture within w_listado_solicitud_rangos
integer x = 608
integer y = 68
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	

if em_inicio.text<>'00/00/0000' then
	ls_fecha = em_inicio.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
END IF
dw_lista.reset()
end event

type st_desde from statictext within w_listado_solicitud_rangos
integer x = 82
integer y = 80
integer width = 174
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type em_termino from editmask within w_listado_solicitud_rangos
integer x = 859
integer y = 72
integer width = 347
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type em_inicio from editmask within w_listado_solicitud_rangos
integer x = 256
integer y = 72
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type st_hasta from statictext within w_listado_solicitud_rangos
integer x = 709
integer y = 80
integer width = 155
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_listado_solicitud_rangos
integer x = 37
integer y = 200
integer width = 3479
integer height = 1688
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_solicitud_rangos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_listado_solicitud_rangos
integer x = 3218
integer y = 1920
integer width = 297
integer height = 92
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listado_solicitud_rangos)
end event

type gb_periodo from groupbox within w_listado_solicitud_rangos
integer x = 37
integer y = 8
integer width = 1294
integer height = 172
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Período"
end type

