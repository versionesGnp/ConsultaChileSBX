forward
global type w_informes_ugn_general from window
end type
type cbx_todo from checkbox within w_informes_ugn_general
end type
type cb_limpiar from commandbutton within w_informes_ugn_general
end type
type dw_agente from datawindow within w_informes_ugn_general
end type
type dw_parque from datawindow within w_informes_ugn_general
end type
type pb_5 from picturebutton within w_informes_ugn_general
end type
type pb_4 from picturebutton within w_informes_ugn_general
end type
type pb_3 from picturebutton within w_informes_ugn_general
end type
type pb_2 from picturebutton within w_informes_ugn_general
end type
type cb_ordenar from commandbutton within w_informes_ugn_general
end type
type cb_filtrar from commandbutton within w_informes_ugn_general
end type
type cb_exportar from commandbutton within w_informes_ugn_general
end type
type cb_imprimir from commandbutton within w_informes_ugn_general
end type
type cb_cerrar from commandbutton within w_informes_ugn_general
end type
type st_1 from statictext within w_informes_ugn_general
end type
type st_2 from statictext within w_informes_ugn_general
end type
type em_final from editmask within w_informes_ugn_general
end type
type p_1 from picture within w_informes_ugn_general
end type
type p_2 from picture within w_informes_ugn_general
end type
type pb_procesar from picturebutton within w_informes_ugn_general
end type
type dw_lista from datawindow within w_informes_ugn_general
end type
type gb_1 from groupbox within w_informes_ugn_general
end type
type gb_2 from groupbox within w_informes_ugn_general
end type
type dw_lista_estado from datawindow within w_informes_ugn_general
end type
type em_desde from editmask within w_informes_ugn_general
end type
type st_help from statictext within w_informes_ugn_general
end type
type st_16 from statictext within w_informes_ugn_general
end type
end forward

global type w_informes_ugn_general from window
integer width = 3433
integer height = 2036
boolean titlebar = true
string title = "Informe Estadistico por Fecha y Estado Cobranza"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cbx_todo cbx_todo
cb_limpiar cb_limpiar
dw_agente dw_agente
dw_parque dw_parque
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
st_help st_help
st_16 st_16
end type
global w_informes_ugn_general w_informes_ugn_general

type variables
long		il_row,il_parque
string	is_opcion
end variables

on w_informes_ugn_general.create
this.cbx_todo=create cbx_todo
this.cb_limpiar=create cb_limpiar
this.dw_agente=create dw_agente
this.dw_parque=create dw_parque
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
this.st_help=create st_help
this.st_16=create st_16
this.Control[]={this.cbx_todo,&
this.cb_limpiar,&
this.dw_agente,&
this.dw_parque,&
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
this.em_desde,&
this.st_help,&
this.st_16}
end on

on w_informes_ugn_general.destroy
destroy(this.cbx_todo)
destroy(this.cb_limpiar)
destroy(this.dw_agente)
destroy(this.dw_parque)
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
destroy(this.st_help)
destroy(this.st_16)
end on

event open;SetPointer(HourGlass!)

is_opcion										= Message.StringParm
dw_parque.visible								= false
dw_agente.visible								= false
CHOOSE CASE is_opcion
	CASE 'PS' //Parque Supervisor
		if gs_depto='R' then
			dw_lista.dataobject					= 'dw_informe_estadistico_parque_sup'
			this.title								= 'Informe Gestión Venta'
			st_16.text								= 'Parque'
			dw_parque.settransobject(sqlca)
			dw_parque.insertrow(0)
			if gs_conexion	= "Parque El Prado" then
				il_parque							= 1
			elseif gs_conexion = "Parque La Foresta" then
				il_parque							= 11
			end if
			dw_parque.setitem(1,'cod_parque',il_parque)
			dw_parque.accepttext()
			dw_parque.visible						= true
			cbx_todo.visible						= False
		else
			dw_lista.dataobject					= 'dw_informe_estadistico_parque_venta'
			this.title								= 'Informe Gestión Venta'
			st_16.text								= 'Parque'
			dw_parque.settransobject(sqlca)
			dw_parque.insertrow(0)
			if gs_conexion	= "Parque El Prado" then
				il_parque							= 1
			elseif gs_conexion = "Parque La Foresta" then
				il_parque							= 11
			end if
			dw_parque.setitem(1,'cod_parque',il_parque)
			dw_parque.accepttext()
			dw_parque.visible						= true
		end if
	CASE 'AS' //Agente Supervisor
		dw_lista.dataobject					= 'dw_informe_estadistico_ejecutivo_venta'
		this.title									= 'Informe Gestión por Agente de Venta'
		st_16.text								= 'Agente'
		dw_agente.settransobject(sqlca)
		dw_agente.getchild('ejecutivo',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve('SUP',gs_user)=0 then
			idw_detalle.insertrow(0)
		end if
		//setear dataobject dwe
		
		dw_agente.insertrow(0)
		dw_agente.accepttext()
		dw_agente.visible						= true
		
	CASE 'PU' //Parque UGN
		if gs_depto='X' then
			dw_lista.dataobject				= 'dw_informe_estadistico_parque_ugn_ejec'
			this.title								= 'Informe Gestión UGN'
			st_16.text							= 'Parque'
			dw_parque.settransobject(sqlca)
			dw_parque.insertrow(0)
			if gs_conexion	= "Parque El Prado" then
				il_parque							= 1
			elseif gs_conexion = "Parque La Foresta" then
				il_parque							= 11
			end if
			dw_parque.setitem(1,'cod_parque',il_parque)
			dw_parque.accepttext()
			dw_parque.visible					= true
		else
			dw_lista.dataobject				= 'dw_informe_estadistico_parque_ugn'
			this.title								= 'Informe Gestión UGN'
			st_16.text							= 'Parque'
			dw_parque.settransobject(sqlca)
			dw_parque.insertrow(0)
			if gs_conexion	= "Parque El Prado" then
				il_parque							= 1
			elseif gs_conexion = "Parque La Foresta" then
				il_parque							= 11
			end if
			dw_parque.setitem(1,'cod_parque',il_parque)
			dw_parque.accepttext()
			dw_parque.visible					= true
		end if
	CASE 'AU' //Agente UGN
		if gs_depto = 'X' and gs_user <> 'JU2' then
			dw_lista.dataobject				= 'dw_informe_estadistico_ejecutivo_ugn'
			this.title								= 'Informe Gestión por Ejecutivo UGN'
			st_16.text							= 'Agente'
			dw_agente.insertrow(0)
			dw_agente.accepttext()
			dw_agente.visible					= false
			st_16.visible							= false
			cbx_todo.visible					= false
		else
			dw_lista.dataobject				= 'dw_informe_estadistico_ejecutivo_ugn'
			this.title								= 'Informe Gestión por Ejecutivo UGN'
			st_16.text							= 'Agente'
			dw_agente.settransobject(sqlca)
			dw_agente.getchild('ejecutivo',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle.retrieve('UGN',gs_user)=0 then
				idw_detalle.insertrow(0)
			end if
			//setear dataobject dwe
			dw_agente.insertrow(0)
			dw_agente.accepttext()
			dw_agente.visible					= true
		end if
END CHOOSE
w_informes_ugn_general.width			= 2564
gf_centrar(w_informes_ugn_general)
dw_lista.settransobject(sqlca)
dw_lista_estado.settransobject(sqlca)

dw_lista_estado.retrieve()
em_desde	.text								= string(today())
em_final.text									= string(today())
SetPointer(Arrow!)
end event

type cbx_todo from checkbox within w_informes_ugn_general
integer x = 1952
integer y = 60
integer width = 215
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todo"
boolean lefttext = true
end type

type cb_limpiar from commandbutton within w_informes_ugn_general
integer x = 997
integer y = 1772
integer width = 224
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_informes_ugn_general.width	= 2564
st_help.text						= 'Mostrar Estado'
cbx_todo.checked					= false
dw_lista.reset()
if is_opcion='PS' or is_opcion='PU' then
	dw_parque.reset()
	dw_parque.insertrow(0)
	if gs_conexion	= "Parque El Prado" then
		il_parque							= 1
	elseif gs_conexion = "Parque La Foresta" then
		il_parque							= 11
	end if
	dw_parque.setitem(1,'cod_parque',il_parque)
	dw_parque.accepttext()
	dw_parque.visible						= true
elseif is_opcion='AS' or is_opcion='AU' then
	dw_agente.reset()
	if is_opcion='AS' /*and gs_depto <> 'R'*/ then
		idw_detalle.retrieve('SUP')
	elseif is_opcion='AU' /* and gs_depto <> 'X' and gs_user <> 'JU2'*/ then
		idw_detalle.retrieve('UGN')
	end if
	if idw_detalle.rowcount()=0 /* and ((gs_depto <> 'X' and gs_user <> 'JU2') Or (gs_depto <> 'R') )*/ then
		idw_detalle.insertrow(0)
	end if
	dw_agente.insertrow(0)
end if
em_desde.setfocus()
end event

type dw_agente from datawindow within w_informes_ugn_general
integer x = 1353
integer y = 48
integer width = 594
integer height = 104
integer taborder = 30
string title = "none"
string dataobject = "dwe_lcodigo_ejecutivo_ugn"
boolean border = false
boolean livescroll = true
end type

type dw_parque from datawindow within w_informes_ugn_general
integer x = 1353
integer y = 48
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

type pb_5 from picturebutton within w_informes_ugn_general
event ue_mousemove pbm_mousemove
integer x = 2094
integer y = 1772
integer width = 101
integer height = 84
integer taborder = 150
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

type pb_4 from picturebutton within w_informes_ugn_general
event ue_mousemove pbm_mousemove
integer x = 1989
integer y = 1772
integer width = 101
integer height = 84
integer taborder = 140
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

type pb_3 from picturebutton within w_informes_ugn_general
event ue_mousemove pbm_mousemove
integer x = 1883
integer y = 1772
integer width = 101
integer height = 84
integer taborder = 130
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

type pb_2 from picturebutton within w_informes_ugn_general
event ue_mousemove pbm_mousemove
integer x = 1778
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
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(1)
end event

type cb_ordenar from commandbutton within w_informes_ugn_general
event ue_mousemove pbm_dwnmousemove
integer x = 55
integer y = 1776
integer width = 224
integer height = 92
integer taborder = 70
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

type cb_filtrar from commandbutton within w_informes_ugn_general
event ue_mousemove pbm_mousemove
integer x = 283
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
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_exportar from commandbutton within w_informes_ugn_general
event ue_mousemove pbm_mousemove
integer x = 512
integer y = 1772
integer width = 224
integer height = 92
integer taborder = 90
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

type cb_imprimir from commandbutton within w_informes_ugn_general
event ue_mousemove pbm_mousemove
integer x = 754
integer y = 1772
integer width = 224
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

type cb_cerrar from commandbutton within w_informes_ugn_general
integer x = 2245
integer y = 1780
integer width = 265
integer height = 92
integer taborder = 160
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informes_ugn_general)
end event

type st_1 from statictext within w_informes_ugn_general
integer x = 32
integer y = 64
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_informes_ugn_general
integer x = 608
integer y = 64
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

type em_final from editmask within w_informes_ugn_general
integer x = 763
integer y = 48
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

event modified;dw_lista.reset()
end event

type p_1 from picture within w_informes_ugn_general
integer x = 521
integer y = 48
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

type p_2 from picture within w_informes_ugn_general
integer x = 1083
integer y = 48
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

type pb_procesar from picturebutton within w_informes_ugn_general
integer x = 2199
integer y = 32
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Datetime	ld_fecha_ini,ld_fecha_fin
String	ls_ejec,ls_agente

ld_fecha_ini	= datetime(date(em_desde.text),time('00:00:00'))
ld_fecha_fin	= datetime(date(em_final.text),time('23:59:59'))
dw_parque.accepttext()
dw_agente.accepttext()
if is_opcion='PS' or is_opcion='PU' then
	il_parque	= dw_parque.getitemnumber(1,'cod_parque')	
elseif is_opcion='AS' or is_opcion='AU' then
	ls_ejec		= dw_agente.getitemstring(1,'ejecutivo')	
end if
if ld_fecha_ini > ld_fecha_fin then
	Messagebox("Advertencia","Rango de Fecha Inválida")
	em_desde.setfocus()
else
	if is_opcion='PS' or is_opcion='PU' then
		if gs_depto='R' or gs_depto='X' then
			if il_parque>0 then
				dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,il_parque,gs_user)
			else
				messagebox("Advertencia","Debe Seleccionar Parque")
			end if
		else
			if il_parque>0 then
				dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,il_parque)
			else
				messagebox("Advertencia","Debe Seleccionar Parque")
			end if
		end if
	elseif is_opcion='AS' or is_opcion='AU' then
		if gs_depto='R'  then
			ls_agente		= dw_agente.getitemstring(1,'ejecutivo')
			dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,gs_user,ls_agente)
		elseif gs_depto='X' then	
			dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,ls_ejec)
		else
			if cbx_todo.checked=true then ls_ejec=gs_user
			if not isnull(ls_ejec) then
				dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,ls_ejec)
			elseif isnull(ls_ejec) then
				messagebox("Advertencia","Debe Seleccionar Agente")
				dw_agente.setfocus()
			end if
		end if	
	end if
end if
end event

type dw_lista from datawindow within w_informes_ugn_general
integer x = 32
integer y = 192
integer width = 2482
integer height = 1528
integer taborder = 60
string title = "none"
string dataobject = "dw_informe_estadistico_ejecutivo_ugn"
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

event doubleclicked;String	ls_fecha,ls_string,ls_columna,ls_campo,ls_agente
Long		ll_cantidad

ls_columna			= dwo.name
dw_parque.accepttext()
if row>0 then 
	il_row			= row
	if is_opcion='PS' or is_opcion='PU' then
		ls_fecha		= string(date(dw_lista.getitemdatetime(il_row,'ult_fecha_gestion')))
		ll_cantidad	= dw_lista.getitemnumber(il_row,'grand_count_ult_estado_gestion')
		
	elseif is_opcion='AS' or is_opcion='AU' then
		ls_fecha		= string(date(dw_lista.getitemdatetime(il_row,'ugn_cliente_ult_fecha_gestion')))
		ll_cantidad	= dw_lista.getitemnumber(il_row,'comp1')
	end if
	ls_string		= ls_fecha+'~t'+ls_fecha+'~t'+is_opcion
	if ll_cantidad>0 then openwithparm(w_detalle_gestion_telefonica_ugn,ls_string)
end if
ls_campo				= mid(ls_columna,1,9)
if ls_campo='compute_1' or ls_campo='compute_2' or ls_campo='compute_3' then
	if dw_lista.rowcount()>0 then 
		ls_string	= em_desde.text+'~t'+em_final.text+'~t'+is_opcion
		openwithparm(w_detalle_gestion_telefonica_ugn,ls_string)
	end if
end if
end event

type gb_1 from groupbox within w_informes_ugn_general
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1724
integer width = 1211
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

type gb_2 from groupbox within w_informes_ugn_general
event ue_mousemove pbm_mousemove
integer x = 1755
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

type dw_lista_estado from datawindow within w_informes_ugn_general
integer x = 2565
integer y = 192
integer width = 805
integer height = 1684
string title = "none"
string dataobject = "dw_ayuda_lista_estado_ugn"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_string,ls_codigo,ls_columna
Long		ll_codigo

ls_columna	= dwo.name
if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_codigo	= long(dw_lista_estado.getitemstring(row,'cod_estado'))
	ls_string	= "ugn_cliente_ult_estado_gestion = "+ls_codigo
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	if dw_lista.rowcount() = 0 then messagebox("Advertencia","No Registra Dato Codigo Gestión "+ls_codigo)
else
	if ls_columna='t_todo' then
		ls_string	= ''
		dw_lista.SETfilter(ls_string)
		dw_lista.filter()
	end if
end if
end event

type em_desde from editmask within w_informes_ugn_general
integer x = 201
integer y = 48
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

event modified;dw_lista.reset()
end event

type st_help from statictext within w_informes_ugn_general
integer x = 1248
integer y = 1776
integer width = 498
integer height = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 80269524
string text = "Mostrar Estado"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if this.text='Mostrar Estado' then
	w_informes_ugn_general.width	= 3433
	this.text='No Mostrar Estado'
else
	w_informes_ugn_general.width	= 2564
	this.text='Mostrar Estado'
end if
st_help.x		= 1248
st_help.y		= 1776
st_help.width	= 503
st_help.height	= 116
gf_centrar(w_informes_ugn_general)

end event

type st_16 from statictext within w_informes_ugn_general
integer x = 1170
integer y = 64
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

