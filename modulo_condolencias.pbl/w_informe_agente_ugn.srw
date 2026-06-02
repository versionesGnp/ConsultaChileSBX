forward
global type w_informe_agente_ugn from window
end type
type cb_cerrar from commandbutton within w_informe_agente_ugn
end type
type cb_filtrar from commandbutton within w_informe_agente_ugn
end type
type cb_ordenar from commandbutton within w_informe_agente_ugn
end type
type cb_exportar from commandbutton within w_informe_agente_ugn
end type
type cb_limpiar from commandbutton within w_informe_agente_ugn
end type
type cb_imprimir from commandbutton within w_informe_agente_ugn
end type
type pb_aceptar from picturebutton within w_informe_agente_ugn
end type
type st_3 from statictext within w_informe_agente_ugn
end type
type em_desde from editmask within w_informe_agente_ugn
end type
type p_1 from picture within w_informe_agente_ugn
end type
type st_2 from statictext within w_informe_agente_ugn
end type
type em_hasta from editmask within w_informe_agente_ugn
end type
type p_2 from picture within w_informe_agente_ugn
end type
type st_1 from statictext within w_informe_agente_ugn
end type
type dw_agente from datawindow within w_informe_agente_ugn
end type
type dw_informe_ugn from datawindow within w_informe_agente_ugn
end type
end forward

global type w_informe_agente_ugn from window
integer width = 3712
integer height = 2608
boolean titlebar = true
string title = "Informe gestiones agentes UGN"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cerrar cb_cerrar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
pb_aceptar pb_aceptar
st_3 st_3
em_desde em_desde
p_1 p_1
st_2 st_2
em_hasta em_hasta
p_2 p_2
st_1 st_1
dw_agente dw_agente
dw_informe_ugn dw_informe_ugn
end type
global w_informe_agente_ugn w_informe_agente_ugn

on w_informe_agente_ugn.create
this.cb_cerrar=create cb_cerrar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.pb_aceptar=create pb_aceptar
this.st_3=create st_3
this.em_desde=create em_desde
this.p_1=create p_1
this.st_2=create st_2
this.em_hasta=create em_hasta
this.p_2=create p_2
this.st_1=create st_1
this.dw_agente=create dw_agente
this.dw_informe_ugn=create dw_informe_ugn
this.Control[]={this.cb_cerrar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_limpiar,&
this.cb_imprimir,&
this.pb_aceptar,&
this.st_3,&
this.em_desde,&
this.p_1,&
this.st_2,&
this.em_hasta,&
this.p_2,&
this.st_1,&
this.dw_agente,&
this.dw_informe_ugn}
end on

on w_informe_agente_ugn.destroy
destroy(this.cb_cerrar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.pb_aceptar)
destroy(this.st_3)
destroy(this.em_desde)
destroy(this.p_1)
destroy(this.st_2)
destroy(this.em_hasta)
destroy(this.p_2)
destroy(this.st_1)
destroy(this.dw_agente)
destroy(this.dw_informe_ugn)
end on

event open;gf_centrar(w_informe_agente_ugn)

dw_informe_ugn.settransobject(sqlca)
dw_agente.settransobject(sqlca)
dw_agente.insertrow(0)

em_desde.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
em_hasta.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
end event

type cb_cerrar from commandbutton within w_informe_agente_ugn
integer x = 3314
integer y = 2384
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_informe_agente_ugn)
end event

type cb_filtrar from commandbutton within w_informe_agente_ugn
integer x = 23
integer y = 2384
integer width = 256
integer height = 100
integer taborder = 20
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
dw_informe_ugn.setfilter(ls_nulo)
dw_informe_ugn.filter()
end event

type cb_ordenar from commandbutton within w_informe_agente_ugn
integer x = 288
integer y = 2384
integer width = 256
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;if dw_informe_ugn.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_informe_ugn.SETSORT(NULO)
	dw_informe_ugn.SORT()
end if
end event

type cb_exportar from commandbutton within w_informe_agente_ugn
integer x = 549
integer y = 2384
integer width = 256
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_informe_ugn
if dw_informe_ugn.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_limpiar from commandbutton within w_informe_agente_ugn
integer x = 1147
integer y = 2384
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_informe_ugn.reset()
dw_agente.reset()
dw_agente.insertrow(0)
em_desde.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
em_hasta.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')

end event

type cb_imprimir from commandbutton within w_informe_agente_ugn
integer x = 809
integer y = 2384
integer width = 256
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_informe_ugn.rowcount()>0 then
	dw_informe_ugn.object.datawindow.Print.Preview		= true
	dw_informe_ugn.object.datawindow.zoom				= 80
	f_Print( dw_informe_ugn )
	dw_informe_ugn.object.datawindow.Print.Preview		= false
	dw_informe_ugn.object.datawindow.zoom				= 100
end if
end event

type pb_aceptar from picturebutton within w_informe_agente_ugn
integer x = 2309
integer y = 36
integer width = 146
integer height = 132
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;date		ld_fec_ini, ld_fec_fin
string		ls_agente

ld_fec_ini	= date(em_desde.text)
ld_fec_fin	= date(em_hasta.text)
ls_agente	= dw_agente.getitemstring(1,'agente')

if trim(em_desde.text)='00/00/0000' or isnull(em_desde.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_desde.setfocus()
else
	if trim(em_hasta.text)='00/00/0000' or isnull(em_hasta.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_hasta.setfocus()
	else
		if not isnull(ls_agente) or ls_agente <> '' then
			if dw_informe_ugn.retrieve(ls_agente,ld_fec_ini,ld_fec_fin)=0 then
				messagebox("Advertencia","No Registran Datos")
			else
				dw_informe_ugn.object.t_rango_fechas.text	= 'Rango fecha desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
				dw_informe_ugn.setfocus()
			end if
		else
			messagebox("Advertencia","Falta ingresar Agente")
			dw_agente.setfocus()
		end if	
	end if
end if
end event

type st_3 from statictext within w_informe_agente_ugn
integer x = 1070
integer y = 72
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

type em_desde from editmask within w_informe_agente_ugn
integer x = 1253
integer y = 56
integer width = 311
integer height = 88
integer taborder = 10
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

event modified;//dw_informe_ugn.reset()
end event

type p_1 from picture within w_informe_agente_ugn
integer x = 1573
integer y = 56
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
dw_informe_ugn.reset()
em_desde.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_desde.text = Message.StringParm
end event

type st_2 from statictext within w_informe_agente_ugn
integer x = 1673
integer y = 72
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

type em_hasta from editmask within w_informe_agente_ugn
integer x = 1847
integer y = 56
integer width = 311
integer height = 88
integer taborder = 10
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

event modified;//dw_informe_ugn.reset()
end event

type p_2 from picture within w_informe_agente_ugn
integer x = 2167
integer y = 56
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
dw_informe_ugn.reset()
em_hasta.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_hasta.text = Message.StringParm
end event

type st_1 from statictext within w_informe_agente_ugn
integer x = 23
integer y = 68
integer width = 201
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agente"
boolean focusrectangle = false
end type

type dw_agente from datawindow within w_informe_agente_ugn
integer x = 242
integer y = 56
integer width = 722
integer height = 88
integer taborder = 10
string title = "none"
string dataobject = "dwe_agentes_ugn"
boolean border = false
boolean livescroll = true
end type

type dw_informe_ugn from datawindow within w_informe_agente_ugn
integer x = 23
integer y = 212
integer width = 3634
integer height = 2100
integer taborder = 10
string title = "none"
string dataobject = "dw_gestion_ejecutivos_ugn"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

