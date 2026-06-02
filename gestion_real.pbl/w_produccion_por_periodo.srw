forward
global type w_produccion_por_periodo from window
end type
type st_resumen from statictext within w_produccion_por_periodo
end type
type st_limpiar from statictext within w_produccion_por_periodo
end type
type st_activar from statictext within w_produccion_por_periodo
end type
type st_desactivar from statictext within w_produccion_por_periodo
end type
type pb_proceso from picturebutton within w_produccion_por_periodo
end type
type pb_eliminar from picturebutton within w_produccion_por_periodo
end type
type pb_agregar from picturebutton within w_produccion_por_periodo
end type
type dw_destino from datawindow within w_produccion_por_periodo
end type
type st_mostrar_todo from statictext within w_produccion_por_periodo
end type
type pb_filtrar from picturebutton within w_produccion_por_periodo
end type
type pb_ordenar from picturebutton within w_produccion_por_periodo
end type
type pb_imprimir from picturebutton within w_produccion_por_periodo
end type
type pb_exportar from picturebutton within w_produccion_por_periodo
end type
type pb_aceptar from picturebutton within w_produccion_por_periodo
end type
type st_2 from statictext within w_produccion_por_periodo
end type
type em_fec_fin from editmask within w_produccion_por_periodo
end type
type p_fec_fin from picture within w_produccion_por_periodo
end type
type p_fec_ini from picture within w_produccion_por_periodo
end type
type em_fec_ini from editmask within w_produccion_por_periodo
end type
type st_1 from statictext within w_produccion_por_periodo
end type
type pb_salir from picturebutton within w_produccion_por_periodo
end type
type dw_lista from datawindow within w_produccion_por_periodo
end type
end forward

global type w_produccion_por_periodo from window
integer width = 3470
integer height = 2064
boolean titlebar = true
string title = "Producción de Ventas por Periodo Cierre Venta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_resumen st_resumen
st_limpiar st_limpiar
st_activar st_activar
st_desactivar st_desactivar
pb_proceso pb_proceso
pb_eliminar pb_eliminar
pb_agregar pb_agregar
dw_destino dw_destino
st_mostrar_todo st_mostrar_todo
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_imprimir pb_imprimir
pb_exportar pb_exportar
pb_aceptar pb_aceptar
st_2 st_2
em_fec_fin em_fec_fin
p_fec_fin p_fec_fin
p_fec_ini p_fec_ini
em_fec_ini em_fec_ini
st_1 st_1
pb_salir pb_salir
dw_lista dw_lista
end type
global w_produccion_por_periodo w_produccion_por_periodo

type variables
long	il_row, il_row_origen, il_row_destino, il_tot_filas
DragObject control_dw, control_dw2
end variables

on w_produccion_por_periodo.create
this.st_resumen=create st_resumen
this.st_limpiar=create st_limpiar
this.st_activar=create st_activar
this.st_desactivar=create st_desactivar
this.pb_proceso=create pb_proceso
this.pb_eliminar=create pb_eliminar
this.pb_agregar=create pb_agregar
this.dw_destino=create dw_destino
this.st_mostrar_todo=create st_mostrar_todo
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_imprimir=create pb_imprimir
this.pb_exportar=create pb_exportar
this.pb_aceptar=create pb_aceptar
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.p_fec_fin=create p_fec_fin
this.p_fec_ini=create p_fec_ini
this.em_fec_ini=create em_fec_ini
this.st_1=create st_1
this.pb_salir=create pb_salir
this.dw_lista=create dw_lista
this.Control[]={this.st_resumen,&
this.st_limpiar,&
this.st_activar,&
this.st_desactivar,&
this.pb_proceso,&
this.pb_eliminar,&
this.pb_agregar,&
this.dw_destino,&
this.st_mostrar_todo,&
this.pb_filtrar,&
this.pb_ordenar,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_aceptar,&
this.st_2,&
this.em_fec_fin,&
this.p_fec_fin,&
this.p_fec_ini,&
this.em_fec_ini,&
this.st_1,&
this.pb_salir,&
this.dw_lista}
end on

on w_produccion_por_periodo.destroy
destroy(this.st_resumen)
destroy(this.st_limpiar)
destroy(this.st_activar)
destroy(this.st_desactivar)
destroy(this.pb_proceso)
destroy(this.pb_eliminar)
destroy(this.pb_agregar)
destroy(this.dw_destino)
destroy(this.st_mostrar_todo)
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_imprimir)
destroy(this.pb_exportar)
destroy(this.pb_aceptar)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.p_fec_fin)
destroy(this.p_fec_ini)
destroy(this.em_fec_ini)
destroy(this.st_1)
destroy(this.pb_salir)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_produccion_por_periodo)
pb_proceso.enabled	= false
em_fec_ini.text		= string(today())
em_fec_fin.text		= string(today())
dw_lista.dataobject	= 'dw_lista_periodos_cierre_venta'
dw_lista.settransobject(sqlca)
dw_destino.settransobject(sqlca)
il_tot_filas	= dw_lista.retrieve()
if il_tot_filas=0 then
	messagebox("Advertencia","No registra datos")
end if
gs_ventana	= 'w_produccion_por_periodo'
f_valida_objeto_1()
end event

type st_resumen from statictext within w_produccion_por_periodo
integer x = 841
integer y = 1796
integer width = 517
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "&Resumen Agente"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;string   ls_string
datetime	ldt_fecha

dw_lista.accepttext()
if il_row_origen > 0 then
	if dw_lista.dataobject='dw_lista_periodos_cierre_venta' and dw_lista.rowcount() > 0 then
		ldt_fecha                                  = dw_lista.getitemdatetime(il_row_origen,'cierre_venta')
	end if
	if not isnull(ldt_fecha) then
		ls_string                       = string(ldt_fecha,'dd/mm/yyyy')
		if isvalid(w_comision_producc_agente) then close(w_comision_producc_agente)
			OpenWithParm (w_comision_producc_agente,ls_string)
	end if
else
	messagebox('Advertencia','Debe Seleccionar Cierre de Ventas')
end if



end event

type st_limpiar from statictext within w_produccion_por_periodo
integer x = 2551
integer y = 1796
integer width = 357
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Limpiar"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;dw_destino.reset()
end event

type st_activar from statictext within w_produccion_por_periodo
integer x = 1490
integer y = 1796
integer width = 517
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Activar Todo"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;long	ll_indi
il_tot_filas	= dw_lista.rowcount()
if il_tot_filas>0 then
	for ll_indi = 1 to il_tot_filas
		dw_lista.setitem(ll_indi,'estado',1)
		dw_lista.SelectRow(ll_indi, true)
	next
	dw_lista.accepttext()
end if
end event

type st_desactivar from statictext within w_produccion_por_periodo
integer x = 2034
integer y = 1796
integer width = 507
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Desactivar Todo"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;long	ll_indi
il_tot_filas	= dw_lista.rowcount()
if il_tot_filas>0 then
	for ll_indi = 1 to il_tot_filas
		dw_lista.setitem(ll_indi,'estado',0)
		dw_lista.SelectRow(ll_indi, FALSE)
	next
	dw_lista.accepttext()
end if
end event

type pb_proceso from picturebutton within w_produccion_por_periodo
integer x = 2935
integer y = 1772
integer width = 169
integer height = 148
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
alignment htextalign = left!
end type

event clicked;String	ls_string
Long		ll_mes_ini, ll_year_ini, ll_mes_buscar_ini, ll_year_buscar_ini
Date		ld_fec_cierre_ini, ld_fec_cierre_fin ,ld_fecha_aux
Long		ll_mes_fin, ll_year_fin, ll_mes_buscar_fin, ll_year_buscar_fin
 
Datetime	ldt_fecpaso, ldt_fecpaso2
il_row	= dw_destino.getrow()
if il_row > 0 then
	ll_mes_ini				= dw_destino.getitemnumber(il_row,'mes')
	ll_year_ini				= dw_destino.getitemnumber(il_row,'anno')
	ld_fec_cierre_fin		= date(dw_destino.getitemdatetime(il_row,'fecha_cierre'))
	ll_mes_buscar_ini		= ll_mes_ini
	ll_year_buscar_ini	= ll_year_ini
	
	ll_mes_fin				= dw_destino.getitemnumber(1,'mes')
	ll_year_fin				= dw_destino.getitemnumber(1,'anno')
	ld_fec_cierre_fin		= date(dw_destino.getitemdatetime(1,'fecha_cierre'))
	ll_mes_buscar_fin		= ll_mes_fin
	ll_year_buscar_fin	= ll_year_fin
	//Rango Inicial
//	if ll_mes_buscar_ini = 1 then
//		ll_mes_buscar_ini	= 12
//		ll_year_buscar_ini	= ll_year_buscar_ini - 1
//	else
//		ll_mes_buscar_ini	= ll_mes_buscar_ini - 1
//	end if 
	ld_fecha_aux = date('01/'+string(ll_mes_ini,'00')+'/'+string(ll_year_ini,'0000'))
//	if ll_mes_buscar_ini > 0 and ll_year_buscar_ini > 0 and ll_mes_buscar_fin > 0 and ll_year_buscar_fin > 0 then
////		ld_fecha_aux = date('01'+mid(string(RelativeDate(ld_fec_cierre_ini, - 30),'dd/mm/yyyy'),3))
//		SELECT 	"CIERRE_VENTA"."CIERRE_VENTA" 
//		INTO 		:ldt_fecpaso
//		FROM 		"CIERRE_VENTA"  
//		WHERE  ( "CIERRE_VENTA"."CIERRE_VENTA" >= :ld_fecha_aux and 
//					"CIERRE_VENTA"."CIERRE_VENTA" <= :ld_fec_cierre_fin ) 
//		USING		sqlca ;
//		if sqlca.sqlcode = 0 then
	ld_fec_cierre_ini	= ld_fecha_aux //relativedate(date(ld_fecha_aux),1)
	ls_string			= string(ld_fec_cierre_ini,'dd/mm/yyyy')+'~t'+string(ld_fec_cierre_fin,'dd/mm/yyyy')+'~t'+string(ll_mes_ini)+'~t'+string(ll_year_ini)+'~t'+string(ll_mes_fin)+'~t'+string(ll_year_fin)
//		end if
//	end if
	OpenWithParm(w_detalle_periodo_cierre_de_venta, ls_string)
end if
end event

type pb_eliminar from picturebutton within w_produccion_por_periodo
integer x = 2322
integer y = 964
integer width = 197
integer height = 176
integer taborder = 60
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar"
string picturename = "Inicio.jpg"
alignment htextalign = left!
end type

event clicked;Long	ll_res, ll_fila, ll_periodo, ll_anno
ll_fila	= dw_destino.getrow()
if ll_fila > 0 then
	ll_periodo	= dw_destino.getitemnumber(ll_fila,'mes')
	ll_anno		= dw_destino.getitemnumber(ll_fila,'anno')
	ll_res	= MessageBox("Eliminar", "Está seguro de Eliminar, periodo "+string(ll_periodo)+' año '+string(ll_anno), Exclamation!, YesNo!, 2)
	IF ll_res = 1 THEN
		dw_destino.deleterow(ll_fila)
		dw_destino.scrolltorow(1)
	END IF
	if dw_destino.rowcount() = 0 then 
		pb_proceso.enabled	= false
	else
		pb_proceso.enabled	= True
	end if
end if
end event

type pb_agregar from picturebutton within w_produccion_por_periodo
integer x = 2322
integer y = 628
integer width = 197
integer height = 176
integer taborder = 50
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Agregar"
string picturename = "Final.jpg"
alignment htextalign = left!
end type

event clicked;long	ll_filas, ll_indi, ll_estado,ll_year, ll_periodo, ll_new
Date	ld_fecha_cierre

ll_filas						= dw_lista.rowcount()
dw_destino.reset()
for ll_indi = 1 to ll_filas
	ll_estado				= dw_lista.getitemnumber(ll_indi,'estado')
	if ll_estado=1 then
		ll_periodo			= dw_lista.getitemnumber(ll_indi,'periodo')
		ll_year				= dw_lista.getitemnumber(ll_indi,'anno')
		ld_fecha_cierre	= date(dw_lista.getitemdatetime(ll_indi,'cierre_venta'))
		ll_new				= dw_destino.insertrow(0)
		dw_destino.scrolltorow(ll_new)
		dw_destino.setitem(ll_new,'mes',ll_periodo)
		dw_destino.setitem(ll_new,'anno',ll_year)
		dw_destino.setitem(ll_new,'fecha_cierre',ld_fecha_cierre)
	end if
next
if dw_destino.rowcount() > 0 then 
	pb_proceso.enabled	= true
else
	pb_proceso.enabled	= False
	messagebox("Advertencia","Debe seleccionar a lo menos un periodo")
end if
end event

type dw_destino from datawindow within w_produccion_por_periodo
integer x = 2551
integer y = 212
integer width = 823
integer height = 1524
integer taborder = 70
string dragicon = "Hand!"
string dataobject = "dwe_destino_periodo_cierre"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;il_row_destino	= row
if il_row_destino > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_destino, TRUE)
	this.Drag(Begin!)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

event dragdrop;control_dw2 = DraggedObject()
if control_dw2 = dw_lista then
	pb_agregar.triggerevent(clicked!)
end if

end event

event doubleclicked;if dw_destino.getrow() > 0 then pb_proceso.triggerevent(clicked!)
	
end event

type st_mostrar_todo from statictext within w_produccion_por_periodo
integer x = 27
integer y = 60
integer width = 823
integer height = 108
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 79741120
string text = "Mostrar Todos los Periodos"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;dw_lista.dataobject	= 'dw_lista_periodos_cierre_venta'
dw_lista.settransobject(sqlca)
if dw_lista.retrieve()=0 then
	messagebox("Advertencia","No registra datos")
end if
end event

type pb_filtrar from picturebutton within w_produccion_por_periodo
event ue_mousemove pbm_mousemove
integer x = 384
integer y = 1772
integer width = 165
integer height = 148
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar_no.bmp"
alignment htextalign = right!
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type pb_ordenar from picturebutton within w_produccion_por_periodo
event ue_mousemove pbm_mousemove
integer x = 210
integer y = 1772
integer width = 165
integer height = 148
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type pb_imprimir from picturebutton within w_produccion_por_periodo
event ue_mousemove pbm_mousemove
integer x = 558
integer y = 1772
integer width = 165
integer height = 148
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false	
end if
end event

type pb_exportar from picturebutton within w_produccion_por_periodo
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1772
integer width = 165
integer height = 148
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_aceptar from picturebutton within w_produccion_por_periodo
integer x = 3209
integer y = 32
integer width = 165
integer height = 148
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Buscar.BMP"
string disabledname = "Buscar_no.BMP"
end type

event clicked;dw_lista.dataobject	= 'dw_lista_periodos_cierre_venta_con_rango'
dw_lista.settransobject(sqlca)
gd_fecha_inicio = datetime(date(em_fec_ini.text),time('00:00:00'))
gd_fecha_fin	 = datetime(date(em_fec_fin.text),time('23:59:59'))

if gd_fecha_inicio <= gd_fecha_fin then
	if dw_lista.retrieve(gd_fecha_inicio,gd_fecha_fin)=0 then
		messagebox("Advertencia","No registra dato")
	end if
else
	messagebox("Advertencia","Rango fecha Incorrecta")
end if
end event

type st_2 from statictext within w_produccion_por_periodo
integer x = 2523
integer y = 72
integer width = 155
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fec_fin from editmask within w_produccion_por_periodo
integer x = 2697
integer y = 60
integer width = 352
integer height = 88
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
end type

type p_fec_fin from picture within w_produccion_por_periodo
integer x = 3063
integer y = 64
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text=string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha = em_fec_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type p_fec_ini from picture within w_produccion_por_periodo
integer x = 2418
integer y = 64
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

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
	IF DATE(Message.StringParm)>DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_ini from editmask within w_produccion_por_periodo
integer x = 2053
integer y = 60
integer width = 352
integer height = 88
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
end type

type st_1 from statictext within w_produccion_por_periodo
integer x = 1582
integer y = 72
integer width = 448
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Ingrese Periodo"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_salir from picturebutton within w_produccion_por_periodo
integer x = 3209
integer y = 1772
integer width = 165
integer height = 148
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_produccion_por_periodo)
end event

type dw_lista from datawindow within w_produccion_por_periodo
event ue_keypress ( )
integer x = 37
integer y = 212
integer width = 2254
integer height = 1524
integer taborder = 40
string dragicon = "Exclamation!"
boolean bringtotop = true
string dataobject = "dw_lista_periodos_cierre_venta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;long	ll_estado
il_row_origen	= row
dw_destino.reset()
if il_row_origen>0 then
	ll_estado	= this.getitemnumber(il_row_origen,'estado')
	this.accepttext()
	if ll_estado = 0 or isnull(ll_estado) then
		this.setitem(il_row_origen,'estado',1)
		This.SelectRow(il_row_origen, TRUE)
	else
		this.setitem(il_row_origen,'estado',0)
		This.SelectRow(il_row_origen, FALSE)
	end if
	this.Drag(Begin!)
end if
end event

event rowfocuschanged;//if this.getrow()>0 then
//	This.SelectRow(0, FALSE)
//	This.SelectRow(this.getrow(), TRUE)
//end if
end event

event dragdrop;String	ls_codigo
control_dw = DraggedObject()
if control_dw = dw_destino and il_row_destino > 0 then
	dw_destino.deleterow(il_row_destino)
	if dw_destino.rowcount() = 0 then 
		pb_proceso.enabled	= false
	else
		pb_proceso.enabled	= True
	end if
end if
end event

