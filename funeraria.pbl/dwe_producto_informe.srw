forward
global type dwe_producto_informe from window
end type
type dw_tipo from datawindow within dwe_producto_informe
end type
type dw_detalle from datawindow within dwe_producto_informe
end type
type dw_orden from datawindow within dwe_producto_informe
end type
type em_numero from editmask within dwe_producto_informe
end type
type cb_elimina from commandbutton within dwe_producto_informe
end type
type cb_exportar from commandbutton within dwe_producto_informe
end type
type cb_ordenar from commandbutton within dwe_producto_informe
end type
type cb_filtrar from commandbutton within dwe_producto_informe
end type
type cb_cerrar from commandbutton within dwe_producto_informe
end type
type pb_aceptar from picturebutton within dwe_producto_informe
end type
type st_hasta from statictext within dwe_producto_informe
end type
type em_inicio from editmask within dwe_producto_informe
end type
type em_termino from editmask within dwe_producto_informe
end type
type st_desde from statictext within dwe_producto_informe
end type
type p_inicio from picture within dwe_producto_informe
end type
type p_termino from picture within dwe_producto_informe
end type
type gb_periodo from groupbox within dwe_producto_informe
end type
type gb_1 from groupbox within dwe_producto_informe
end type
type dw_lista from datawindow within dwe_producto_informe
end type
end forward

global type dwe_producto_informe from window
integer width = 3090
integer height = 2072
boolean titlebar = true
string title = "Listado Registros Funeraria Por Rango de Fechas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_tipo dw_tipo
dw_detalle dw_detalle
dw_orden dw_orden
em_numero em_numero
cb_elimina cb_elimina
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_cerrar cb_cerrar
pb_aceptar pb_aceptar
st_hasta st_hasta
em_inicio em_inicio
em_termino em_termino
st_desde st_desde
p_inicio p_inicio
p_termino p_termino
gb_periodo gb_periodo
gb_1 gb_1
dw_lista dw_lista
end type
global dwe_producto_informe dwe_producto_informe

type variables
long il_row
end variables

on dwe_producto_informe.create
this.dw_tipo=create dw_tipo
this.dw_detalle=create dw_detalle
this.dw_orden=create dw_orden
this.em_numero=create em_numero
this.cb_elimina=create cb_elimina
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_cerrar=create cb_cerrar
this.pb_aceptar=create pb_aceptar
this.st_hasta=create st_hasta
this.em_inicio=create em_inicio
this.em_termino=create em_termino
this.st_desde=create st_desde
this.p_inicio=create p_inicio
this.p_termino=create p_termino
this.gb_periodo=create gb_periodo
this.gb_1=create gb_1
this.dw_lista=create dw_lista
this.Control[]={this.dw_tipo,&
this.dw_detalle,&
this.dw_orden,&
this.em_numero,&
this.cb_elimina,&
this.cb_exportar,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_cerrar,&
this.pb_aceptar,&
this.st_hasta,&
this.em_inicio,&
this.em_termino,&
this.st_desde,&
this.p_inicio,&
this.p_termino,&
this.gb_periodo,&
this.gb_1,&
this.dw_lista}
end on

on dwe_producto_informe.destroy
destroy(this.dw_tipo)
destroy(this.dw_detalle)
destroy(this.dw_orden)
destroy(this.em_numero)
destroy(this.cb_elimina)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_cerrar)
destroy(this.pb_aceptar)
destroy(this.st_hasta)
destroy(this.em_inicio)
destroy(this.em_termino)
destroy(this.st_desde)
destroy(this.p_inicio)
destroy(this.p_termino)
destroy(this.gb_periodo)
destroy(this.gb_1)
destroy(this.dw_lista)
end on

event open;date ldt_fec_fin,ldt_fec_ini

gf_centrar(w_lista_producto_por_fechas_2)

dw_lista.settransobject(sqlca)
dw_orden.settransobject(sqlca)
//dw_lista.insertrow(0)
em_termino.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
ldt_fec_fin						= date(em_termino.text)
em_inicio.text					= string('01/'+ string(month(date(gdt_fec_sistema)),'00')+ '/' +string(year(date(gdt_fec_sistema)),'0000'))
ldt_fec_ini						= date(em_inicio.text)
if gs_depto='I' or ( gs_depto = 'H' and gl_proceso > 0 ) then
	cb_elimina.visible			= true
end if
end event

type dw_tipo from datawindow within dwe_producto_informe
integer x = 1408
integer y = 24
integer width = 773
integer height = 172
integer taborder = 20
string title = "none"
string dataobject = "dwe_producto_informe"
boolean border = false
boolean livescroll = true
end type

type dw_detalle from datawindow within dwe_producto_informe
integer x = 41
integer y = 1300
integer width = 2985
integer height = 468
integer taborder = 30
string title = "none"
string dataobject = "dw_producto_informe_det"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_orden from datawindow within dwe_producto_informe
integer x = 1531
integer y = 2008
integer width = 686
integer height = 400
integer taborder = 60
string title = "none"
string dataobject = "dwe_imprimir_orden_venta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_numero from editmask within dwe_producto_informe
boolean visible = false
integer x = 2962
integer y = 1812
integer width = 370
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###0"
string displaydata = "~r"
end type

type cb_elimina from commandbutton within dwe_producto_informe
boolean visible = false
integer x = 2519
integer y = 1812
integer width = 434
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar Funeraria"
end type

event clicked;string		ls_base,ls_serie,ls_nulo
long		ll_res,ll_existe_cad,ll_elimina=0
double	ldb_numero

setnull(ls_nulo)

ls_base								= 'F'
ls_serie								= 'F'
ldb_numero							= double(em_numero.text)

if ldb_numero = 0 then
	ll_res								= MessageBox("Eliminar","¿Desea Eliminar Folio Funeraria?", Exclamation!, YesNo!, 2)
	if ll_res = 1 then
		em_numero.visible		= true
	end if
else
	SELECT	COUNT("CADENA"."CODIGO")
	INTO		:ll_existe_cad
	FROM		"CADENA"
	WHERE	"CADENA"."CODIGO" = :gs_base AND
				"CADENA"."SERIE" = :gs_serie AND
				"CADENA"."NUMERO" = :gi_numero
	USING	sqlca;
	if isnull(ll_existe_cad) then ll_existe_cad=0
	if ll_existe_cad>0 then
		messagebox("Advertencia",'Contrato Registrado Se Encuentra Estado Digitado "No Puede Ser Eliminado"' )	
	else
		ll_res							= MessageBox("Advertencia","¿Folio Funeraria se Encuentra Bien Digitado?", Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			ll_elimina				= f_eliminar_funeraria(ls_base,ls_serie,ldb_numero)
			if ll_elimina=6 then
				messagebox("Eliminar","Contrato Funerario Eliminado")
				em_numero.text	= ls_nulo
			end if
		end if
	end if	
end if
end event

type cb_exportar from commandbutton within dwe_producto_informe
integer x = 1088
integer y = 1816
integer width = 219
integer height = 84
integer taborder = 40
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

type cb_ordenar from commandbutton within dwe_producto_informe
integer x = 1522
integer y = 1816
integer width = 219
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_filtrar from commandbutton within dwe_producto_informe
integer x = 1303
integer y = 1816
integer width = 219
integer height = 84
integer taborder = 40
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

type cb_cerrar from commandbutton within dwe_producto_informe
integer x = 2711
integer y = 1792
integer width = 306
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_lista_producto_por_fechas_2)
end event

type pb_aceptar from picturebutton within dwe_producto_informe
integer x = 2203
integer y = 72
integer width = 142
integer height = 116
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "<"
string picturename = "ok.bmp"
end type

event clicked;long		ll_parque
datetime	ld_fec_ini, ld_fec_fin
string		ls_usuario,ls_jefe_v

ld_fec_ini	= datetime(date(em_inicio.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_termino.text),time('23:59:59'))

if trim(em_inicio.text)='00/00/0000' or isnull(em_inicio.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_inicio.setfocus()
else
	if trim(em_termino.text)='00/00/0000' or isnull(em_termino.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_termino.setfocus()
	else	
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then
			messagebox("Advertencia","No Registran Datos")
		else
			dw_lista.object.t_rango_fechas.text	= 'Listado Registros Funeraria desde: '+string(ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
			dw_lista.setfocus()
		end if
	end if
end if


end event

type st_hasta from statictext within dwe_producto_informe
integer x = 677
integer y = 92
integer width = 165
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type em_inicio from editmask within dwe_producto_informe
integer x = 238
integer y = 84
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type em_termino from editmask within dwe_producto_informe
integer x = 841
integer y = 84
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type st_desde from statictext within dwe_producto_informe
integer x = 50
integer y = 92
integer width = 187
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type p_inicio from picture within dwe_producto_informe
integer x = 585
integer y = 80
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

type p_termino from picture within dwe_producto_informe
integer x = 1193
integer y = 80
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

type gb_periodo from groupbox within dwe_producto_informe
integer x = 37
integer y = 16
integer width = 1266
integer height = 180
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Período"
end type

type gb_1 from groupbox within dwe_producto_informe
integer x = 809
integer y = 1768
integer width = 1573
integer height = 160
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

type dw_lista from datawindow within dwe_producto_informe
integer x = 41
integer y = 220
integer width = 2985
integer height = 1028
integer taborder = 20
string title = "none"
string dataobject = "dw_producto_informe"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_columna

ls_columna					= dwo.name
if getrow() > 0 then
	il_row					= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	if ls_columna='t_verde' or ls_columna='t_texto_verde' then
		gs_formula			= "sw_activa_servicio=0"
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()
	elseif ls_columna = 't_blanco' or ls_columna='t_texto_blanco' then	
		gs_formula			= "sw_activa_servicio=1"
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()
	elseif ls_columna = 't_amarillo' or ls_columna='t_texto_amarillo' then	
		gs_formula			= "sw_activa_servicio=2"
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()	
	elseif ls_columna = 't_todo' then
		gs_formula			= ''
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()
	end if	
end if	
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	il_row		= getrow()
end if
end event

