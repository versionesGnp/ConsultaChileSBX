forward
global type w_informe_agrupar_por_estado_fecha from window
end type
type dw_parque from datawindow within w_informe_agrupar_por_estado_fecha
end type
type st_16 from statictext within w_informe_agrupar_por_estado_fecha
end type
type dw_print from datawindow within w_informe_agrupar_por_estado_fecha
end type
type st_help from statictext within w_informe_agrupar_por_estado_fecha
end type
type pb_5 from picturebutton within w_informe_agrupar_por_estado_fecha
end type
type pb_4 from picturebutton within w_informe_agrupar_por_estado_fecha
end type
type pb_3 from picturebutton within w_informe_agrupar_por_estado_fecha
end type
type pb_2 from picturebutton within w_informe_agrupar_por_estado_fecha
end type
type cb_ordenar from commandbutton within w_informe_agrupar_por_estado_fecha
end type
type cb_filtrar from commandbutton within w_informe_agrupar_por_estado_fecha
end type
type cb_exportar from commandbutton within w_informe_agrupar_por_estado_fecha
end type
type cb_imprimir from commandbutton within w_informe_agrupar_por_estado_fecha
end type
type cb_cerrar from commandbutton within w_informe_agrupar_por_estado_fecha
end type
type st_1 from statictext within w_informe_agrupar_por_estado_fecha
end type
type st_2 from statictext within w_informe_agrupar_por_estado_fecha
end type
type em_final from editmask within w_informe_agrupar_por_estado_fecha
end type
type p_1 from picture within w_informe_agrupar_por_estado_fecha
end type
type p_2 from picture within w_informe_agrupar_por_estado_fecha
end type
type pb_procesar from picturebutton within w_informe_agrupar_por_estado_fecha
end type
type dw_lista from datawindow within w_informe_agrupar_por_estado_fecha
end type
type gb_1 from groupbox within w_informe_agrupar_por_estado_fecha
end type
type gb_2 from groupbox within w_informe_agrupar_por_estado_fecha
end type
type dw_lista_estado from datawindow within w_informe_agrupar_por_estado_fecha
end type
type em_desde from editmask within w_informe_agrupar_por_estado_fecha
end type
end forward

global type w_informe_agrupar_por_estado_fecha from window
integer width = 3241
integer height = 2000
boolean titlebar = true
string title = "Informe Estadistico por Fecha y Estado Cobranza"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_parque dw_parque
st_16 st_16
dw_print dw_print
st_help st_help
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
st_1 st_1
st_2 st_2
em_final em_final
p_1 p_1
p_2 p_2
pb_procesar pb_procesar
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
dw_lista_estado dw_lista_estado
em_desde em_desde
end type
global w_informe_agrupar_por_estado_fecha w_informe_agrupar_por_estado_fecha

type variables
long		il_row,il_parque
string	is_opcion
end variables

on w_informe_agrupar_por_estado_fecha.create
this.dw_parque=create dw_parque
this.st_16=create st_16
this.dw_print=create dw_print
this.st_help=create st_help
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.st_1=create st_1
this.st_2=create st_2
this.em_final=create em_final
this.p_1=create p_1
this.p_2=create p_2
this.pb_procesar=create pb_procesar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_lista_estado=create dw_lista_estado
this.em_desde=create em_desde
this.Control[]={this.dw_parque,&
this.st_16,&
this.dw_print,&
this.st_help,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.st_1,&
this.st_2,&
this.em_final,&
this.p_1,&
this.p_2,&
this.pb_procesar,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.dw_lista_estado,&
this.em_desde}
end on

on w_informe_agrupar_por_estado_fecha.destroy
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.dw_print)
destroy(this.st_help)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_final)
destroy(this.p_1)
destroy(this.p_2)
destroy(this.pb_procesar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_lista_estado)
destroy(this.em_desde)
end on

event open;SetPointer(HourGlass!)
is_opcion	= Message.StringParm
CHOOSE CASE is_opcion
	CASE 'T'
		dw_lista.dataobject					= 'dw_agrupar_cobranza_fecha_estado'
		dw_lista_estado.dataobject			= 'dw_ayuda_lista_estado_cobranza'
		this.title								= 'Informe Estadístico por Fecha y Estado Cobranza Telefónico'
	CASE 'C'
		dw_lista.dataobject					= 'dw_agrupar_por_fecha_carta'
		dw_lista_estado.dataobject			= 'dw_ayuda_lista_estado_envio_carta'
		this.title								= 'Informe Estadístico por Fecha y Estado Envio Carta'
	CASE 'P'
		dw_lista.dataobject					= 'dw_agrupar_post_venta_fecha_estado'
		dw_lista_estado.dataobject			= 'dw_ayuda_estado_cobranza_postventa'
		this.title								= 'Informe Estadístico por Fecha y Estado Post-Venta'
END CHOOSE
w_informe_agrupar_por_estado_fecha.width	= 2391
gf_centrar(w_informe_agrupar_por_estado_fecha)
dw_lista.settransobject(sqlca)
dw_print.settransobject(sqlca)
dw_lista_estado.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	il_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	il_parque	= 11
elseif gs_conexion = "Parque Concepción" then
	il_parque	= 801
end if
dw_parque.setitem(1,'cod_parque',il_parque)
dw_parque.accepttext()
dw_lista_estado.retrieve()
em_desde	.text	= string(today())
em_final.text	= string(today())
SetPointer(Arrow!)
end event

type dw_parque from datawindow within w_informe_agrupar_por_estado_fecha
integer x = 1591
integer y = 36
integer width = 594
integer height = 104
integer taborder = 40
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
dw_parque.accepttext()
il_parque	= dw_parque.getitemnumber(1,'cod_parque')
end event

type st_16 from statictext within w_informe_agrupar_por_estado_fecha
integer x = 1408
integer y = 60
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_print from datawindow within w_informe_agrupar_por_estado_fecha
boolean visible = false
integer x = 667
integer y = 1908
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_agrupar_cobranza_fecha_envio_carta_pr"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_help from statictext within w_informe_agrupar_por_estado_fecha
integer x = 1061
integer y = 1760
integer width = 448
integer height = 116
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 80269524
string text = "Mostrar Codigo Estado"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if this.text='Mostrar Codigo Estado' then
	w_informe_agrupar_por_estado_fecha.width	= 3232
	this.text='No Mostrar Codigo Estado'
else
	w_informe_agrupar_por_estado_fecha.width	= 2391
	this.text='Mostrar Codigo Estado'
end if
st_help.x		= 1033
st_help.y		= 1764
st_help.width	= 503
st_help.height	= 116
gf_centrar(w_informe_agrupar_por_estado_fecha)

end event

type pb_5 from picturebutton within w_informe_agrupar_por_estado_fecha
event ue_mousemove pbm_mousemove
integer x = 1897
integer y = 1772
integer width = 101
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(dw_lista.rowcount() )
end event

type pb_4 from picturebutton within w_informe_agrupar_por_estado_fecha
event ue_mousemove pbm_mousemove
integer x = 1792
integer y = 1772
integer width = 101
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollNextPage( )
end event

type pb_3 from picturebutton within w_informe_agrupar_por_estado_fecha
event ue_mousemove pbm_mousemove
integer x = 1687
integer y = 1772
integer width = 101
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollPriorPage( )
end event

type pb_2 from picturebutton within w_informe_agrupar_por_estado_fecha
event ue_mousemove pbm_mousemove
integer x = 1582
integer y = 1772
integer width = 101
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(1)
end event

type cb_ordenar from commandbutton within w_informe_agrupar_por_estado_fecha
event ue_mousemove pbm_dwnmousemove
integer x = 55
integer y = 1776
integer width = 224
integer height = 92
integer taborder = 50
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

type cb_filtrar from commandbutton within w_informe_agrupar_por_estado_fecha
event ue_mousemove pbm_mousemove
integer x = 283
integer y = 1772
integer width = 224
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_exportar from commandbutton within w_informe_agrupar_por_estado_fecha
event ue_mousemove pbm_mousemove
integer x = 512
integer y = 1772
integer width = 224
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_informe_agrupar_por_estado_fecha
event ue_mousemove pbm_mousemove
integer x = 754
integer y = 1772
integer width = 224
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;Date	ld_fecha_ini,ld_fecha_fin
if dw_lista.rowcount()>0 then
	il_parque		= dw_parque.getitemnumber(1,'cod_parque')
	if dw_lista.dataobject='dw_agrupar_cobranza_fecha_estado' then
		dw_print.dataobject	= 'dw_agrupar_cobranza_fecha_estado_print'
	elseif dw_lista.dataobject='dw_agrupar_cobranza_fecha_envio_carta' then
		dw_print.dataobject	= 'dw_agrupar_cobranza_fecha_envio_carta_pr'
	elseif dw_lista.dataobject='dw_agrupar_post_venta_fecha_estado' then
		dw_print.dataobject	= 'dw_agrupar_post_venta_fecha_estado_print'
	end if
	dw_print.settransobject(sqlca)
	ld_fecha_ini	= date(em_desde.text)
	ld_fecha_fin	= date(em_final.text)
	dw_print.retrieve(ld_fecha_ini,ld_fecha_fin,il_parque)
	f_Print( dw_print )
//	f_printdlg(dw_print,gstr_print,w_informe_agrupar_por_estado_fecha)
end if
end event

type cb_cerrar from commandbutton within w_informe_agrupar_por_estado_fecha
integer x = 2075
integer y = 1780
integer width = 265
integer height = 92
integer taborder = 130
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_agrupar_por_estado_fecha)
end event

type st_1 from statictext within w_informe_agrupar_por_estado_fecha
integer x = 41
integer y = 56
integer width = 320
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Inicial:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_informe_agrupar_por_estado_fecha
integer x = 795
integer y = 56
integer width = 155
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_final from editmask within w_informe_agrupar_por_estado_fecha
integer x = 951
integer y = 40
integer width = 338
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 700
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

event modified;dw_lista.reset()
end event

type p_1 from picture within w_informe_agrupar_por_estado_fecha
integer x = 704
integer y = 40
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

type p_2 from picture within w_informe_agrupar_por_estado_fecha
integer x = 1294
integer y = 40
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_final.text)='00/00/0000' or trim(em_final.text)='' or &
	isnull(trim(em_final.text)) then	
	
	em_final.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_final.text)=-1 then 
	em_final.text=string(today(),gs_formato_fecha)
	em_final.setfocus()
	return
end if	
if trim(em_final.text)<>'00/00/0000' and not isnull(trim(em_final.text)) and &
	trim(em_final.text)<>'' then
	ls_fecha = em_final.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_final.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_final.text = Message.StringParm
end event

type pb_procesar from picturebutton within w_informe_agrupar_por_estado_fecha
integer x = 2199
integer y = 24
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Date	ld_fecha_ini,ld_fecha_fin

ld_fecha_ini	= date(em_desde.text)
ld_fecha_fin	= date(em_final.text)
dw_parque.accepttext()
il_parque		= dw_parque.getitemnumber(1,'cod_parque')
if ld_fecha_ini > ld_fecha_fin then
	Messagebox("Advertencia","Rango de Fecha Inválida")
	em_desde.setfocus()
else
	if il_parque>0 then
		dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,il_parque)
	else
		messagebox("Advertencia","Debe Seleccionar Parque")
	end if
end if
end event

type dw_lista from datawindow within w_informe_agrupar_por_estado_fecha
integer x = 32
integer y = 168
integer width = 2309
integer height = 1552
integer taborder = 40
string title = "none"
string dataobject = "dw_agrupar_por_fecha_carta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;//if this.getrow()>0 then
//	il_row	= this.getrow()
//	This.SelectRow(0, FALSE)
//	This.SelectRow(il_row, TRUE)
//end if
end event

event doubleclicked;String	ls_fecha,ls_string,ls_columna,ls_campo
Long		ll_cantidad

ls_columna	= dwo.name
dw_parque.accepttext()
if row>0 then 
	il_row		= row
	ls_fecha		= string(date(dw_lista.getitemdatetime(il_row,'compute_fecha')))
	ll_cantidad	= dw_lista.getitemnumber(il_row,'grand_count_compute_0004')
	ls_string	= ls_fecha+'~t'+is_opcion+'~t'+string(il_parque)
	if ll_cantidad>0 then openwithparm(w_detalle_agrupacion_por_fecha_cobranza,ls_string)
end if
ls_campo	= mid(ls_columna,1,9)
if ls_campo='compute_1' or ls_campo='compute_2' or ls_campo='compute_3' then
	if dw_lista.rowcount()>0 then 
		ls_string	= em_desde.text+'~t'+em_final.text+'~t'+is_opcion+'~t'+string(il_parque)
		openwithparm(w_detalle_agrupacion_rango_fecha_cob,ls_string)
	end if
end if
end event

type gb_1 from groupbox within w_informe_agrupar_por_estado_fecha
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1724
integer width = 969
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_informe_agrupar_por_estado_fecha
event ue_mousemove pbm_mousemove
integer x = 1559
integer y = 1724
integer width = 462
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

type dw_lista_estado from datawindow within w_informe_agrupar_por_estado_fecha
integer x = 2382
integer y = 168
integer width = 805
integer height = 1704
string title = "none"
string dataobject = "dw_ayuda_lista_estado_envio_carta"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type em_desde from editmask within w_informe_agrupar_por_estado_fecha
integer x = 361
integer y = 40
integer width = 338
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 700
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

event modified;dw_lista.reset()
end event

