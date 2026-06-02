forward
global type w_lista_ingreso_cob from window
end type
type dw_usuario_asignado from datawindow within w_lista_ingreso_cob
end type
type pb_ok from picturebutton within w_lista_ingreso_cob
end type
type cb_filtrar from commandbutton within w_lista_ingreso_cob
end type
type cb_ordenar from commandbutton within w_lista_ingreso_cob
end type
type cb_exportar from commandbutton within w_lista_ingreso_cob
end type
type cb_limpiar from commandbutton within w_lista_ingreso_cob
end type
type cb_imprimir from commandbutton within w_lista_ingreso_cob
end type
type cb_close from commandbutton within w_lista_ingreso_cob
end type
type st_1 from statictext within w_lista_ingreso_cob
end type
type em_desde from editmask within w_lista_ingreso_cob
end type
type p_1 from picture within w_lista_ingreso_cob
end type
type st_2 from statictext within w_lista_ingreso_cob
end type
type em_hasta from editmask within w_lista_ingreso_cob
end type
type p_2 from picture within w_lista_ingreso_cob
end type
type dw_lista from datawindow within w_lista_ingreso_cob
end type
end forward

global type w_lista_ingreso_cob from window
integer width = 3186
integer height = 1844
boolean titlebar = true
string title = "Lista de Pagos por Rango de Fecha"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_usuario_asignado dw_usuario_asignado
pb_ok pb_ok
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_close cb_close
st_1 st_1
em_desde em_desde
p_1 p_1
st_2 st_2
em_hasta em_hasta
p_2 p_2
dw_lista dw_lista
end type
global w_lista_ingreso_cob w_lista_ingreso_cob

on w_lista_ingreso_cob.create
this.dw_usuario_asignado=create dw_usuario_asignado
this.pb_ok=create pb_ok
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_close=create cb_close
this.st_1=create st_1
this.em_desde=create em_desde
this.p_1=create p_1
this.st_2=create st_2
this.em_hasta=create em_hasta
this.p_2=create p_2
this.dw_lista=create dw_lista
this.Control[]={this.dw_usuario_asignado,&
this.pb_ok,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_close,&
this.st_1,&
this.em_desde,&
this.p_1,&
this.st_2,&
this.em_hasta,&
this.p_2,&
this.dw_lista}
end on

on w_lista_ingreso_cob.destroy
destroy(this.dw_usuario_asignado)
destroy(this.pb_ok)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_close)
destroy(this.st_1)
destroy(this.em_desde)
destroy(this.p_1)
destroy(this.st_2)
destroy(this.em_hasta)
destroy(this.p_2)
destroy(this.dw_lista)
end on

event open;long	ll_mes
gf_centrar(w_lista_ingreso_cob)

dw_lista.settransobject(sqlca)
dw_usuario_asignado.settransobject(sqlca)
dw_usuario_asignado.insertrow(0)

ll_mes	= long(month(date(gdt_fec_sistema)))
em_desde.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
em_hasta.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
end event

type dw_usuario_asignado from datawindow within w_lista_ingreso_cob
integer x = 1266
integer y = 64
integer width = 914
integer height = 80
integer taborder = 30
string title = "none"
string dataobject = "dwe_usuario_asignado"
boolean border = false
boolean livescroll = true
end type

type pb_ok from picturebutton within w_lista_ingreso_cob
integer x = 2981
integer y = 28
integer width = 151
integer height = 132
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

event clicked;string ls_usu_asig
date	ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_desde.text)
ld_fec_fin	= date(em_hasta.text)

if trim(em_desde.text)='00/00/0000' or isnull(em_desde.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_desde.setfocus()
else
	if trim(em_hasta.text)='00/00/0000' or isnull(em_hasta.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_hasta.setfocus()
	else
		ls_usu_asig			= dw_usuario_asignado.getitemstring(1,"usuario_asigando")
		if not isnull(ls_usu_asig) or ls_usu_asig <> '' then
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_usu_asig)=0 then
				messagebox("Advertencia","No Registran Datos")
			else
				dw_lista.object.t_rango_fechas.text	= 'Rango fecha desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
				dw_lista.setfocus()
			end if
		else
			messagebox("Advertencia","Falta ingresar Usuario Asignado")
			dw_usuario_asignado.setfocus()
		end if	
	end if
end if

end event

type cb_filtrar from commandbutton within w_lista_ingreso_cob
integer x = 23
integer y = 1604
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string ls_nulo
setnull(ls_nulo)
dw_lista.setfilter(ls_nulo)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_lista_ingreso_cob
integer x = 288
integer y = 1604
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_exportar from commandbutton within w_lista_ingreso_cob
integer x = 549
integer y = 1604
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_limpiar from commandbutton within w_lista_ingreso_cob
integer x = 1449
integer y = 1604
integer width = 256
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_lista.reset()
dw_usuario_asignado.reset()
em_desde.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
em_hasta.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')

end event

type cb_imprimir from commandbutton within w_lista_ingreso_cob
integer x = 809
integer y = 1604
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_close from commandbutton within w_lista_ingreso_cob
integer x = 2789
integer y = 1604
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_lista_ingreso_cob)
end event

type st_1 from statictext within w_lista_ingreso_cob
integer x = 32
integer y = 76
integer width = 183
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde:"
boolean focusrectangle = false
end type

type em_desde from editmask within w_lista_ingreso_cob
integer x = 219
integer y = 60
integer width = 311
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;//dw_informe_mc.reset()
end event

type p_1 from picture within w_lista_ingreso_cob
integer x = 535
integer y = 60
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
dw_lista.reset()
em_desde.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_desde.text = Message.StringParm
end event

type st_2 from statictext within w_lista_ingreso_cob
integer x = 640
integer y = 76
integer width = 160
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta:"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_hasta from editmask within w_lista_ingreso_cob
integer x = 809
integer y = 60
integer width = 311
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;//dw_informe_mc.reset()
end event

type p_2 from picture within w_lista_ingreso_cob
integer x = 1129
integer y = 60
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_hasta.text)='00/00/0000' or trim(em_hasta.text)='' or &
	isnull(trim(em_hasta.text)) then	
	
	em_hasta.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_hasta.text)=-1 then 
	em_hasta.text=string(today(),gs_formato_fecha)
	em_hasta.setfocus()
	return
end if	
if trim(em_hasta.text)<>'00/00/0000' and not isnull(trim(em_hasta.text)) and &
	trim(em_hasta.text)<>'' then
	ls_fecha = em_hasta.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_hasta.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_hasta.text = Message.StringParm
end event

type dw_lista from datawindow within w_lista_ingreso_cob
integer x = 27
integer y = 184
integer width = 3104
integer height = 1384
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_ingreso_pago_cob"
boolean minbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

