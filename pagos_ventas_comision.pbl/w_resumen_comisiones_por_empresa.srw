forward
global type w_resumen_comisiones_por_empresa from window
end type
type cb_print from commandbutton within w_resumen_comisiones_por_empresa
end type
type cb_aceptar from commandbutton within w_resumen_comisiones_por_empresa
end type
type st_1 from statictext within w_resumen_comisiones_por_empresa
end type
type p_1 from picture within w_resumen_comisiones_por_empresa
end type
type em_fecha from editmask within w_resumen_comisiones_por_empresa
end type
type cb_cerrar from commandbutton within w_resumen_comisiones_por_empresa
end type
type dw_lista from datawindow within w_resumen_comisiones_por_empresa
end type
end forward

global type w_resumen_comisiones_por_empresa from window
integer width = 3415
integer height = 2140
boolean titlebar = true
string title = "Resumen de Comisiones por Empresa"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_print cb_print
cb_aceptar cb_aceptar
st_1 st_1
p_1 p_1
em_fecha em_fecha
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_resumen_comisiones_por_empresa w_resumen_comisiones_por_empresa

type variables
date	gd_fecha_proceso
end variables

on w_resumen_comisiones_por_empresa.create
this.cb_print=create cb_print
this.cb_aceptar=create cb_aceptar
this.st_1=create st_1
this.p_1=create p_1
this.em_fecha=create em_fecha
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_print,&
this.cb_aceptar,&
this.st_1,&
this.p_1,&
this.em_fecha,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_resumen_comisiones_por_empresa.destroy
destroy(this.cb_print)
destroy(this.cb_aceptar)
destroy(this.st_1)
destroy(this.p_1)
destroy(this.em_fecha)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;Long		ll_new,ll_mes,ll_year

gf_centrar(w_resumen_comisiones_por_empresa)
dw_lista.settransobject(sqlca)
ll_mes			= month(today())
ll_year			= year(today())
em_fecha.text	= '15/'+string(ll_mes,'00')+'/'+string(ll_year,'0000')
end event

type cb_print from commandbutton within w_resumen_comisiones_por_empresa
integer x = 41
integer y = 1896
integer width = 315
integer height = 104
integer taborder = 40
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

type cb_aceptar from commandbutton within w_resumen_comisiones_por_empresa
integer x = 896
integer y = 40
integer width = 288
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Date	ld_fecha_cierre
Long	ll_cod_parque

if gs_empresa = 'El Prado' then
	ll_cod_parque	= 1
elseif gs_empresa = 'La Foresta' then
	ll_cod_parque	= 11
elseif gs_empresa = 'Concepcion' then
	ll_cod_parque	= 801
end if
ld_fecha_cierre	= date(em_fecha.text)
if not isnull(ld_fecha_cierre) then
	if ll_cod_parque>0 then
		if dw_lista.retrieve(ld_fecha_cierre)=0 then
			messagebox("Advertencia","No Registra Dato")
		else
			dw_lista.object.usuario.text			= gs_user
		end if
	end if
else
	messagebox("Advertencia","Fecha Inválida")
	em_fecha.setfocus()
end if
end event

type st_1 from statictext within w_resumen_comisiones_por_empresa
integer x = 32
integer y = 56
integer width = 357
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Cierre"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_1 from picture within w_resumen_comisiones_por_empresa
integer x = 782
integer y = 48
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fecha.text)=-1 then 
	em_fecha.text=string(today(),gs_formato_fecha)
	em_fecha.setfocus()
	return
end if	
if em_fecha.text<>'00/00/0000' then
	ls_fecha = em_fecha.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_fecha.text = Message.StringParm
end if
gd_fecha_proceso = date(em_fecha.text)
dw_lista.reset()
end event

type em_fecha from editmask within w_resumen_comisiones_por_empresa
integer x = 416
integer y = 48
integer width = 361
integer height = 92
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
string mask = "dd/mm/yyyy"
string displaydata = "À"
end type

event modified;dw_lista.reset()
end event

type cb_cerrar from commandbutton within w_resumen_comisiones_por_empresa
integer x = 3045
integer y = 1896
integer width = 315
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_resumen_comisiones_por_empresa)
end event

type dw_lista from datawindow within w_resumen_comisiones_por_empresa
integer x = 41
integer y = 188
integer width = 3319
integer height = 1680
integer taborder = 30
string title = "none"
string dataobject = "dw_resumen_de_comisiones_por_empresa"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

