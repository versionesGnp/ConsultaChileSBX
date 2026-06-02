forward
global type w_cd_consultar_informes from window
end type
type cb_informe from commandbutton within w_cd_consultar_informes
end type
type dw_lista from datawindow within w_cd_consultar_informes
end type
type cb_filtrar from commandbutton within w_cd_consultar_informes
end type
type cb_sort from commandbutton within w_cd_consultar_informes
end type
type cb_exportar from commandbutton within w_cd_consultar_informes
end type
type cb_imprimir from commandbutton within w_cd_consultar_informes
end type
type cb_limpiar from commandbutton within w_cd_consultar_informes
end type
type pb_aceptar from picturebutton within w_cd_consultar_informes
end type
type p_fin from picture within w_cd_consultar_informes
end type
type em_fec_fin from editmask within w_cd_consultar_informes
end type
type p_ini from picture within w_cd_consultar_informes
end type
type cb_cerrar from commandbutton within w_cd_consultar_informes
end type
type gb_3 from groupbox within w_cd_consultar_informes
end type
type em_fec_ini from editmask within w_cd_consultar_informes
end type
type st_11 from statictext within w_cd_consultar_informes
end type
type st_1 from statictext within w_cd_consultar_informes
end type
type st_21 from statictext within w_cd_consultar_informes
end type
type gb_1 from groupbox within w_cd_consultar_informes
end type
end forward

global type w_cd_consultar_informes from window
integer width = 3237
integer height = 1956
boolean titlebar = true
string title = "Informes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
event ue_mousemove ( )
cb_informe cb_informe
dw_lista dw_lista
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
pb_aceptar pb_aceptar
p_fin p_fin
em_fec_fin em_fec_fin
p_ini p_ini
cb_cerrar cb_cerrar
gb_3 gb_3
em_fec_ini em_fec_ini
st_11 st_11
st_1 st_1
st_21 st_21
gb_1 gb_1
end type
global w_cd_consultar_informes w_cd_consultar_informes

type variables
String	is_opcion,is_base,is_serie
Double	il_row_origen,il_numero
Long		il_aceptar=0

end variables

event open;Datetime		ld_fec_ini, ld_fec_fin
String		ls_hora
gf_centrar(w_cd_consultar_informes)
dw_lista.settransobject(sqlca)
is_opcion								= Message.StringParm
em_fec_ini.text						= string(today(),"dd/mm/yyyy")
em_fec_fin.text						= string(today(),"dd/mm/yyyy")
ld_fec_ini								= datetime(date(em_fec_ini.text))
ld_fec_fin								= datetime(date(em_fec_fin.text),time('23:59:59'))

CHOOSE CASE is_opcion
	CASE 'G' //Entrega Documentos AGENTE
		this.title						= 'Lista de Informes "Entrega Documento(s) Agente"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,2)
	CASE 'E' //Entrega Documentos Operaciones
		this.title						= 'Lista de Informes "Entrega Documento(s) a Departamento Operaciones"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,4)
	CASE 'S' //Entrega Documentos Supervisores
		this.title					= 'Lista de Informes "Entrega de Documento(s) a Supervisores"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,3)
	CASE 'D' //Devolución Documentos
		this.title					= 'Lista de Informes "Devolución de Documentos"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,12)
	CASE 'N' //Devolución Documentos
		this.title					= 'Lista de Informes "Devolución de Documentos Nulos a Depto. Operaciones"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,102)
	CASE 'C' //Devolución Documentos a Depto. Adm. Venta
		this.title					= 'Lista de Informes "Devolución Documentos a Depto. Adm. Venta"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,10)
	CASE 'A' //Devolución Documentos a Depto. At. Cliente
		this.title					= 'Lista de Informes "Devolución Documentos a Depto. At. Cliente"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,17)
	CASE 'T' //Devolución Documentos a Depto. At. terreno
		this.title					= 'Lista de Informes "Devolución Documentos a Depto. At. Terreno"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,27)
	CASE 'J'
		this.title					= 'Lista de Informes "Entrega Documentos a Ejecutivo At. Terreno"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,21)
	CASE 'P'
		this.title					= 'Lista de Informes "Entrega Documentos a Depto. Operaciones"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,23)
	CASE 'U'
		this.title					= 'Lista de Informes "Entrega Documentos NULOS a Depto. Operaciones"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,104)
	CASE 'I'
		this.title					= 'Lista de Informes "Recepción Documentos del Ejecutivo At. Terreno"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,22)
	CASE 'V'
		this.title					= 'Lista de Informes "Devolución Documentos al Ejecutivo At. Terreno"'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,28)
END CHOOSE
end event

on w_cd_consultar_informes.create
this.cb_informe=create cb_informe
this.dw_lista=create dw_lista
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.pb_aceptar=create pb_aceptar
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.p_ini=create p_ini
this.cb_cerrar=create cb_cerrar
this.gb_3=create gb_3
this.em_fec_ini=create em_fec_ini
this.st_11=create st_11
this.st_1=create st_1
this.st_21=create st_21
this.gb_1=create gb_1
this.Control[]={this.cb_informe,&
this.dw_lista,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_limpiar,&
this.pb_aceptar,&
this.p_fin,&
this.em_fec_fin,&
this.p_ini,&
this.cb_cerrar,&
this.gb_3,&
this.em_fec_ini,&
this.st_11,&
this.st_1,&
this.st_21,&
this.gb_1}
end on

on w_cd_consultar_informes.destroy
destroy(this.cb_informe)
destroy(this.dw_lista)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.pb_aceptar)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.p_ini)
destroy(this.cb_cerrar)
destroy(this.gb_3)
destroy(this.em_fec_ini)
destroy(this.st_11)
destroy(this.st_1)
destroy(this.st_21)
destroy(this.gb_1)
end on

type cb_informe from commandbutton within w_cd_consultar_informes
integer x = 37
integer y = 1732
integer width = 402
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Informe"
end type

event clicked;Long		ll_corr,ll_codigo
String	ls_string

il_row_origen	= dw_lista.getrow()
if il_row_origen>0 then
	ll_corr		= dw_lista.getitemnumber(il_row_origen,'correlativo')
	ll_codigo	= dw_lista.getitemnumber(il_row_origen,'codigo')
	ls_string	= string(ll_corr)+'~t'+string(ll_codigo)
	OpenWithParm(w_detalle_lista_informes, ls_string)
end if
end event

type dw_lista from datawindow within w_cd_consultar_informes
integer x = 37
integer y = 288
integer width = 3136
integer height = 1388
integer taborder = 40
string dragicon = "Form!"
string title = "none"
string dataobject = "dw_lista_consultar_informes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row_origen	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_origen, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row_origen	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_origen, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row_origen	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_origen, TRUE)
//	cd_informe.triggerevent(clicked!)
end if
end event

type cb_filtrar from commandbutton within w_cd_consultar_informes
event ue_mousemove pbm_mousemove
integer x = 1577
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 100
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

type cb_sort from commandbutton within w_cd_consultar_informes
event ue_mousemove pbm_mousemove
integer x = 1344
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 90
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

type cb_exportar from commandbutton within w_cd_consultar_informes
event ue_mousemove pbm_mousemove
integer x = 1111
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_cd_consultar_informes
event ue_mousemove pbm_mousemove
integer x = 489
integer y = 1732
integer width = 306
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )

end event

type cb_limpiar from commandbutton within w_cd_consultar_informes
event ue_mousemove pbm_mousemove
integer x = 850
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Datetime		ld_fec_ini, ld_fec_fin
String		ls_hora

em_fec_ini.text						= string(today(),"dd/mm/yyyy")
em_fec_fin.text						= string(today(),"dd/mm/yyyy")
ld_fec_ini								= datetime(date(em_fec_ini.text))
ld_fec_fin								= datetime(date(em_fec_fin.text),time('23:59:59'))
dw_lista.reset()
CHOOSE CASE is_opcion
	CASE 'E' //Entrega Documentos Operaciones
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,4)
	CASE 'S' //Entrega Documentos Supervisores
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,12)
	CASE 'D' //Devolución Documentos
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,5)
END CHOOSE
end event

type pb_aceptar from picturebutton within w_cd_consultar_informes
event ue_mousemove pbm_mousemove
integer x = 1582
integer y = 72
integer width = 183
integer height = 156
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
end type

event clicked;Datetime	ld_fec_fin,ld_fec_ini
SetPointer(HourGlass!)
dw_lista.reset()
il_aceptar ++
ld_fec_ini									= datetime(date(em_fec_ini.text))
ld_fec_fin									= datetime(date(em_fec_fin.text),time('23:59:59'))
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango Fecha Inválida")
			em_fec_fin.setfocus()
		else
			CHOOSE CASE is_opcion
				CASE 'G' //Entrega Documentos AGENTE
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,2)
				CASE 'E' //Entrega Documentos Operaciones
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,4)
				CASE 'S' //Entrega Documentos Supervisores
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,3)
				CASE 'D' //Devolución Documentos
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,12)
				CASE 'N' //Devolución Documentos
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,102)
				CASE 'C' //Devolución Documentos a Depto. Adm. Venta
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,10)
				CASE 'A' //Devolución Documentos a Depto. At. Cliente
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,17)
				CASE 'T' //Devolución Documentos a Depto. At. Terreno
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,27)
				CASE 'J' 
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,21)
				CASE 'P' 
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,23)
				CASE 'U' 
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,104)
				CASE 'I' 
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,22)
				CASE 'V' 
					dw_lista.retrieve(ld_fec_ini,ld_fec_fin,28)
			END CHOOSE
		end if
	end if
end if
SetPointer(arrow!)
end event

type p_fin from picture within w_cd_consultar_informes
integer x = 1413
integer y = 112
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech
Date		ld_fec_ini,ld_fec_fin
dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
		ld_fec_ini	= date(em_fec_ini.text)
		ld_fec_fin	= date(em_fec_fin.text)
		if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
			pb_aceptar.triggerevent(clicked!)
		end if
	end if	
END IF
end event

type em_fec_fin from editmask within w_cd_consultar_informes
integer x = 1061
integer y = 112
integer width = 347
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	pb_aceptar.triggerevent(clicked!)
end if
end event

type p_ini from picture within w_cd_consultar_informes
integer x = 805
integer y = 112
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech
Date		ld_fec_ini,ld_fec_fin
dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
		ld_fec_ini	= date(em_fec_ini.text)
		ld_fec_fin	= date(em_fec_fin.text)
		if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
			pb_aceptar.triggerevent(clicked!)
		end if
	end if	
END IF
end event

type cb_cerrar from commandbutton within w_cd_consultar_informes
event ue_mousemove pbm_mousemove
integer x = 2875
integer y = 1732
integer width = 297
integer height = 96
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cd_consultar_informes)
end event

type gb_3 from groupbox within w_cd_consultar_informes
event ue_mousemove pbm_mousemove
integer x = 818
integer y = 1688
integer width = 1024
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type em_fec_ini from editmask within w_cd_consultar_informes
integer x = 453
integer y = 112
integer width = 347
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	if il_aceptar>0 then pb_aceptar.triggerevent(clicked!)
end if
end event

type st_11 from statictext within w_cd_consultar_informes
integer x = 261
integer y = 124
integer width = 165
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_cd_consultar_informes
integer x = 73
integer y = 96
integer width = 165
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_21 from statictext within w_cd_consultar_informes
integer x = 891
integer y = 124
integer width = 169
integer height = 64
integer textsize = -8
integer weight = 400
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

type gb_1 from groupbox within w_cd_consultar_informes
boolean visible = false
integer x = 37
integer y = 16
integer width = 1509
integer height = 236
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Rango de Fecha"
end type

