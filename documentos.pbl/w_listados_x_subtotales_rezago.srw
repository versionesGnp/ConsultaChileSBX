forward
global type w_listados_x_subtotales_rezago from window
end type
type cb_5 from commandbutton within w_listados_x_subtotales_rezago
end type
type cb_4 from commandbutton within w_listados_x_subtotales_rezago
end type
type cb_3 from commandbutton within w_listados_x_subtotales_rezago
end type
type pb_2 from picturebutton within w_listados_x_subtotales_rezago
end type
type pb_rango from picturebutton within w_listados_x_subtotales_rezago
end type
type p_2 from picture within w_listados_x_subtotales_rezago
end type
type p_1 from picture within w_listados_x_subtotales_rezago
end type
type st_2 from statictext within w_listados_x_subtotales_rezago
end type
type st_1 from statictext within w_listados_x_subtotales_rezago
end type
type em_termino from editmask within w_listados_x_subtotales_rezago
end type
type em_inicio from editmask within w_listados_x_subtotales_rezago
end type
type dw_1 from datawindow within w_listados_x_subtotales_rezago
end type
type cb_2 from commandbutton within w_listados_x_subtotales_rezago
end type
type cb_1 from commandbutton within w_listados_x_subtotales_rezago
end type
type gb_2 from groupbox within w_listados_x_subtotales_rezago
end type
type pb_primer from picturebutton within w_listados_x_subtotales_rezago
end type
type pb_sigue from picturebutton within w_listados_x_subtotales_rezago
end type
type pb_antes from picturebutton within w_listados_x_subtotales_rezago
end type
type pb_fin from picturebutton within w_listados_x_subtotales_rezago
end type
type gb_1 from groupbox within w_listados_x_subtotales_rezago
end type
end forward

global type w_listados_x_subtotales_rezago from window
integer x = 1189
integer y = 556
integer width = 3616
integer height = 1712
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
pb_2 pb_2
pb_rango pb_rango
p_2 p_2
p_1 p_1
st_2 st_2
st_1 st_1
em_termino em_termino
em_inicio em_inicio
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
gb_2 gb_2
pb_primer pb_primer
pb_sigue pb_sigue
pb_antes pb_antes
pb_fin pb_fin
gb_1 gb_1
end type
global w_listados_x_subtotales_rezago w_listados_x_subtotales_rezago

type variables
datawindow dw_paso
string is_param
end variables

on w_listados_x_subtotales_rezago.create
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.pb_2=create pb_2
this.pb_rango=create pb_rango
this.p_2=create p_2
this.p_1=create p_1
this.st_2=create st_2
this.st_1=create st_1
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_2=create gb_2
this.pb_primer=create pb_primer
this.pb_sigue=create pb_sigue
this.pb_antes=create pb_antes
this.pb_fin=create pb_fin
this.gb_1=create gb_1
this.Control[]={this.cb_5,&
this.cb_4,&
this.cb_3,&
this.pb_2,&
this.pb_rango,&
this.p_2,&
this.p_1,&
this.st_2,&
this.st_1,&
this.em_termino,&
this.em_inicio,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.gb_2,&
this.pb_primer,&
this.pb_sigue,&
this.pb_antes,&
this.pb_fin,&
this.gb_1}
end on

on w_listados_x_subtotales_rezago.destroy
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.pb_2)
destroy(this.pb_rango)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_termino)
destroy(this.em_inicio)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_2)
destroy(this.pb_primer)
destroy(this.pb_sigue)
destroy(this.pb_antes)
destroy(this.pb_fin)
destroy(this.gb_1)
end on

event open;is_param 			= trim(Message.StringParm)
w_listados_x_subtotales_rezago.title	= gs_app_name+'  En Rezagos con Estado Cheque: "'+is_param+'"'
gf_centrar(w_listados_x_subtotales_rezago)
em_inicio.text 	= string(today(),'dd/mm/yyyy')
em_termino.text	= string(today(),'dd/mm/yyyy')
dw_1.dataobject	= 'dw_subtotales_rezago'
dw_1.settransobject (sqlca)
dw_1.retrieve(is_param)
//if is_param <> 'V' then
//	dw_1.SetFilter("estado_ch = '"+ is_param +" '")
//	dw_1.Filter( )
//else
//	dw_1.SetFilter("isnull(estado_ch)")
//	dw_1.Filter( )
//end if
if dw_1.rowcount() = 0 then
	messagebox('No hay Datos','No Existen registros en este estado',stopsign!)
	close(w_listados_x_subtotales_rezago)
end if
end event

type cb_5 from commandbutton within w_listados_x_subtotales_rezago
event clicked pbm_bnclicked
integer x = 818
integer y = 1472
integer width = 421
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;long numero
if dw_1.GetRow() > 0 then
	numero = dw_1.getitemnumber(dw_1.GetRow(),'ingreso_rut')
//	messagebox('',string(numero))
	openwithparm (w_seleccion_contratos_por_rut,string(numero))
end if
end event

type cb_4 from commandbutton within w_listados_x_subtotales_rezago
integer x = 526
integer y = 1484
integer width = 229
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;dw_paso = dw_1
f_DWToExcel( dw_paso )
//dw_paso = dw_1
//open(w_exportar)
end event

type cb_3 from commandbutton within w_listados_x_subtotales_rezago
integer x = 59
integer y = 1484
integer width = 229
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string ls_nulo
setnull(ls_nulo)
dw_1.setsort(ls_nulo)
dw_1.sort()
end event

type pb_2 from picturebutton within w_listados_x_subtotales_rezago
event clicked pbm_bnclicked
integer x = 2592
integer y = 1476
integer width = 133
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
end type

event clicked;if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if

end event

type pb_rango from picturebutton within w_listados_x_subtotales_rezago
event clicked pbm_bnclicked
integer x = 2441
integer y = 1476
integer width = 133
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "rango.bmp"
end type

event clicked;string sql
setpointer(HourGlass!)
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
dw_1.reset()
w_listados_x_subtotales_rezago.title	= gs_app_name+'  En Rezagos con estado Cheque: "'+is_param+'", rango de fecha : '+em_inicio.text+' al '+em_termino.text
dw_1.dataobject 								='dw_subtotales_fecha_rezago'
dw_1.SetTransObject(sqlca)
if dw_1.retrieve(date(em_inicio.text),date(em_termino.text),is_param)=0 then
	messagebox('No hay Información','No existe información para el rango de fechas. ',stopsign!)
end if
end event

type p_2 from picture within w_listados_x_subtotales_rezago
event clicked pbm_bnclicked
integer x = 2327
integer y = 1480
integer width = 82
integer height = 88
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
end event

type p_1 from picture within w_listados_x_subtotales_rezago
event clicked pbm_bnclicked
integer x = 1815
integer y = 1480
integer width = 82
integer height = 88
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
end event

type st_2 from statictext within w_listados_x_subtotales_rezago
integer x = 1915
integer y = 1488
integer width = 46
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "y"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_listados_x_subtotales_rezago
integer x = 1294
integer y = 1488
integer width = 160
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Entre"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_termino from editmask within w_listados_x_subtotales_rezago
integer x = 1975
integer y = 1476
integer width = 347
integer height = 92
integer taborder = 70
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
string mask = "[date]"
string displaydata = ""
end type

type em_inicio from editmask within w_listados_x_subtotales_rezago
integer x = 1463
integer y = 1476
integer width = 347
integer height = 92
integer taborder = 60
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
string mask = "[date]"
string displaydata = ""
end type

type dw_1 from datawindow within w_listados_x_subtotales_rezago
integer x = 41
integer y = 36
integer width = 3515
integer height = 1380
integer taborder = 10
string dataobject = "dw_subtotales_rezago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event doubleclicked;if row > 0 then
	st_param_dcto.rut        = this.getitemnumber(row,'ingreso_rut')
	st_param_dcto.folio      = this.getitemnumber(row,'documentos_folio')
	st_param_dcto.num_cheque = this.getitemnumber(row,'documentos_n_cheque')
	if this.getitemnumber(row,'ingreso_contrato') > 0 then
		st_param_dcto.datawindows = 'dw_documentos_x_fecha'
	else
		st_param_dcto.datawindows = 'dw_documentos_x_fecha_rezago'
	end if
	open(w_cambio_doc_est)
end if
end event

event clicked;long		numero
String	ls_columna
ls_columna	= dwo.name
if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
//	numero = this.getitemnumber(row,'ingreso_rut')
//	messagebox('',string(numero))
//	openwithparm (w_seleccion_contratos_por_rut,string(numero))
else
	if ls_columna='t_volver' then
		w_listados_x_subtotales_rezago.title	= gs_app_name+'  En Rezagos con estado Cheque: "'+is_param+'"'
		dw_1.dataobject	= 'dw_subtotales_rezago'
		dw_1.settransobject (sqlca)
		dw_1.retrieve(is_param)
	end if
end if
end event

type cb_2 from commandbutton within w_listados_x_subtotales_rezago
integer x = 3264
integer y = 1472
integer width = 293
integer height = 108
integer taborder = 140
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listados_x_subtotales_rezago)
end event

type cb_1 from commandbutton within w_listados_x_subtotales_rezago
integer x = 293
integer y = 1484
integer width = 229
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_nulo
setnull(ls_nulo)
dw_1.setfilter(ls_nulo)
dw_1.filter()
end event

type gb_2 from groupbox within w_listados_x_subtotales_rezago
integer x = 1285
integer y = 1420
integer width = 1472
integer height = 176
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

type pb_primer from picturebutton within w_listados_x_subtotales_rezago
event clicked pbm_bnclicked
integer x = 2798
integer y = 1488
integer width = 91
integer height = 80
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollToRow(1) 
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type pb_sigue from picturebutton within w_listados_x_subtotales_rezago
event clicked pbm_bnclicked
integer x = 2894
integer y = 1488
integer width = 91
integer height = 80
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollPriorPage( )
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type pb_antes from picturebutton within w_listados_x_subtotales_rezago
event clicked pbm_bnclicked
integer x = 2990
integer y = 1488
integer width = 91
integer height = 80
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollNextPage( ) 
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type pb_fin from picturebutton within w_listados_x_subtotales_rezago
event clicked pbm_bnclicked
integer x = 3086
integer y = 1488
integer width = 91
integer height = 80
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollToRow(dw_1.rowcount() ) 
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type gb_1 from groupbox within w_listados_x_subtotales_rezago
integer x = 37
integer y = 1436
integer width = 745
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

