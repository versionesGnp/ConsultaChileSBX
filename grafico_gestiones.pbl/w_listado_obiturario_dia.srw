forward
global type w_listado_obiturario_dia from window
end type
type cb_imprimir from commandbutton within w_listado_obiturario_dia
end type
type cb_1 from commandbutton within w_listado_obiturario_dia
end type
type pb_1 from picturebutton within w_listado_obiturario_dia
end type
type dw_parque from datawindow within w_listado_obiturario_dia
end type
type st_1 from statictext within w_listado_obiturario_dia
end type
type p_1 from picture within w_listado_obiturario_dia
end type
type em_desde from editmask within w_listado_obiturario_dia
end type
type gb_1 from groupbox within w_listado_obiturario_dia
end type
type dw_lista from datawindow within w_listado_obiturario_dia
end type
end forward

global type w_listado_obiturario_dia from window
integer width = 3141
integer height = 1852
boolean titlebar = true
string title = "Obituario del Día"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_imprimir cb_imprimir
cb_1 cb_1
pb_1 pb_1
dw_parque dw_parque
st_1 st_1
p_1 p_1
em_desde em_desde
gb_1 gb_1
dw_lista dw_lista
end type
global w_listado_obiturario_dia w_listado_obiturario_dia

on w_listado_obiturario_dia.create
this.cb_imprimir=create cb_imprimir
this.cb_1=create cb_1
this.pb_1=create pb_1
this.dw_parque=create dw_parque
this.st_1=create st_1
this.p_1=create p_1
this.em_desde=create em_desde
this.gb_1=create gb_1
this.dw_lista=create dw_lista
this.Control[]={this.cb_imprimir,&
this.cb_1,&
this.pb_1,&
this.dw_parque,&
this.st_1,&
this.p_1,&
this.em_desde,&
this.gb_1,&
this.dw_lista}
end on

on w_listado_obiturario_dia.destroy
destroy(this.cb_imprimir)
destroy(this.cb_1)
destroy(this.pb_1)
destroy(this.dw_parque)
destroy(this.st_1)
destroy(this.p_1)
destroy(this.em_desde)
destroy(this.gb_1)
destroy(this.dw_lista)
end on

event open;date ld_fecha

gf_centrar(w_listado_obiturario_dia)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
ld_fecha				= date(gdt_fec_sistema)
em_desde.text		= string(ld_fecha,"dd/mm/yyyy")


end event

type cb_imprimir from commandbutton within w_listado_obiturario_dia
integer x = 27
integer y = 1624
integer width = 265
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
//	dw_gestion_detalle.object.datawindow.Print.Preview	= true
//	dw_gestion_detalle.object.datawindow.zoom				= 75
	f_Print( dw_lista )
//	dw_gestion_detalle.object.datawindow.Print.Preview	= false
//	dw_gestion_detalle.object.datawindow.zoom				= 100
end if
end event

type cb_1 from commandbutton within w_listado_obiturario_dia
integer x = 2848
integer y = 1624
integer width = 251
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_listado_obiturario_dia)
end event

type pb_1 from picturebutton within w_listado_obiturario_dia
integer x = 1614
integer y = 40
integer width = 160
integer height = 136
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string ls_fecha,ls_mes,ls_fecha_palabra
long ll_parque,ll_mes,ll_anno,ll_dia

dw_lista.reset()
ll_parque			= dw_parque.getitemnumber(1,'parque')
ls_fecha 			= trim(em_desde.text)
if isnull(ll_parque) or ll_parque = 0 then
	messagebox("Advertencia","Debe Seleccionar Parque")
	dw_parque.setfocus()
else
	if ls_fecha = '00/00/0000' or isnull(ls_fecha) then
		messagebox('Aviso','Falta Ingresar Fecha')	
	else
		if ll_parque=1 then
			dw_lista.object.p_1.filename 	= 'logo_e.bmp'
		elseif ll_parque = 11 then
			dw_lista.object.p_1.filename  	= 'logo_e_s.bmp'	
		elseif ll_parque=102 then
			dw_lista.object.p_1.filename 	= 'logo_manantial.bmp'
		elseif ll_parque=103 then
			dw_lista.object.p_1.filename 	= 'logo_parque_stgo.bmp'
		elseif ll_parque=101 then
			dw_lista.object.p_1.filename 	= 'logo_canaan.jpg'
		else
			dw_lista.object.p_1.filename 	= 'logo_e.bmp'
		end if	
		ll_dia			=	day(date(ls_fecha))
		ll_mes		=	month(date(ls_fecha))
		ll_anno		=	year(date(ls_fecha))
		if ll_mes = 1 then ls_mes = 'ENERO'
		if ll_mes = 2 then ls_mes = 'FEBRERO'
		if ll_mes = 3 then ls_mes = 'MARZO'
		if ll_mes = 4 then ls_mes = 'ABRIL'
		if ll_mes = 5 then ls_mes = 'MAYO'
		if ll_mes = 6 then ls_mes = 'JUNIO'
		if ll_mes = 7 then ls_mes = 'JULIO'
		if ll_mes = 8 then ls_mes = 'AGOSTO'
		if ll_mes = 9 then ls_mes = 'SEPTIEMBRE'
		if ll_mes = 10 then ls_mes = 'OCTUBRE'
		if ll_mes = 11 then ls_mes = 'NOVIEMBRE'
		if ll_mes = 12 then ls_mes = 'DICIEMBRE'
		ls_fecha_palabra	= string(ll_dia)+' '+ls_mes+' '+string(ll_anno)
		dw_lista.retrieve(ll_parque,ls_fecha_palabra)
		dw_lista.object.t_titulo.text		= string(ll_dia,'00')+'/'+string(ll_mes,'00')+'/'+string(ll_anno)
	end if	
end if
end event

type dw_parque from datawindow within w_listado_obiturario_dia
integer x = 786
integer y = 68
integer width = 773
integer height = 92
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_parque_costos_ventas"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;dw_lista.reset()

//dw_lista.insertrow(0)

end event

type st_1 from statictext within w_listado_obiturario_dia
integer x = 46
integer y = 76
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within w_listado_obiturario_dia
integer x = 649
integer y = 64
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_desde.text)='00/00/0000' or trim(em_desde.text)='' or &
	isnull(trim(em_desde.text)) then	
	
	em_desde.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_desde.text)=-1 then 
	em_desde.text=string(today(),gs_formato_fecha)
	em_desde.setfocus()
	return
end if	
if trim(em_desde.text)<>'00/00/0000' and not isnull(trim(em_desde.text)) and &
	trim(em_desde.text)<>'' then
	
	ls_fecha = em_desde.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_desde.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_desde.text = Message.StringParm
end event

type em_desde from editmask within w_listado_obiturario_dia
integer x = 274
integer y = 68
integer width = 366
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type gb_1 from groupbox within w_listado_obiturario_dia
integer x = 32
integer y = 12
integer width = 1559
integer height = 164
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha"
end type

type dw_lista from datawindow within w_listado_obiturario_dia
integer x = 27
integer y = 192
integer width = 3067
integer height = 1412
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_obituario_servicios_dia"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

