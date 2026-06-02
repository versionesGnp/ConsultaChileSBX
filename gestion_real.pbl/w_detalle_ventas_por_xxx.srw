forward
global type w_detalle_ventas_por_xxx from window
end type
type pb_filtrar from picturebutton within w_detalle_ventas_por_xxx
end type
type pb_ordenar from picturebutton within w_detalle_ventas_por_xxx
end type
type pb_imprimir from picturebutton within w_detalle_ventas_por_xxx
end type
type pb_exportar from picturebutton within w_detalle_ventas_por_xxx
end type
type pb_cerrar from picturebutton within w_detalle_ventas_por_xxx
end type
type dw_detalle from datawindow within w_detalle_ventas_por_xxx
end type
end forward

global type w_detalle_ventas_por_xxx from window
integer width = 3639
integer height = 2108
boolean titlebar = true
string title = "Detalle de Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_imprimir pb_imprimir
pb_exportar pb_exportar
pb_cerrar pb_cerrar
dw_detalle dw_detalle
end type
global w_detalle_ventas_por_xxx w_detalle_ventas_por_xxx

on w_detalle_ventas_por_xxx.create
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_imprimir=create pb_imprimir
this.pb_exportar=create pb_exportar
this.pb_cerrar=create pb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.pb_filtrar,&
this.pb_ordenar,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_cerrar,&
this.dw_detalle}
end on

on w_detalle_ventas_por_xxx.destroy
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_imprimir)
destroy(this.pb_exportar)
destroy(this.pb_cerrar)
destroy(this.dw_detalle)
end on

event open;string	ls_opcion, ls_codigo
Long		ll_mes, ll_year, ll_mes_fin, ll_year_fin
dateTime	ld_fec_ini, ld_fec_fin, ldt_fec_cierre

ls_opcion	= substr(1,1,Message.StringParm)
ls_codigo	= substr(1,2,Message.StringParm)
ld_fec_ini	= datetime(date(substr(1,3,Message.StringParm)),time('00:00:00'))
ld_fec_fin	= datetime(date(substr(1,4,Message.StringParm)),time('00:00:00'))
ll_mes		= long(substr(1,5,Message.StringParm))
ll_year		= long(substr(1,6,Message.StringParm))
ll_mes_fin	= long(substr(1,7,Message.StringParm))
ll_year_fin	= long(substr(1,8,Message.StringParm))
gf_centrar(w_detalle_ventas_por_xxx)
gs_ventana	= 'w_detalle_ventas_por_xxx'
f_valida_objeto_1()
CHOOSE CASE ls_opcion
	CASE "1"
		dw_detalle.dataobject	= 'dw_informe_detalle_ventas_por_jefe'
	CASE "2"
		dw_detalle.dataobject	= 'dw_informe_detalle_ventas_por_supervisor'
	CASE "3"
		dw_detalle.dataobject	= 'dw_informe_detalle_ventas_por_agente'
	CASE "4"
		dw_detalle.dataobject	= 'dw_informe_detalle_ventas_por_agente'
END CHOOSE
dw_detalle.settransobject(sqlca)

if dw_detalle.retrieve(ld_fec_ini,ld_fec_fin,ls_codigo)=0 then
	messagebox("Adevertencia","No registra dato")
	close(w_detalle_ventas_por_xxx)
else
	if gs_conexion = "Parque El Prado" then
		dw_detalle.object.t_titulo.text		= 'Parque EL PRADO'
	elseif gs_conexion = "Parque La Foresta" then
		dw_detalle.object.t_titulo.text		= 'Parque LA FORESTA'
	elseif gs_conexion = "Parque Concepción" then
		dw_detalle.object.t_titulo.text		= 'Parque CONCEPCION'
	end if
	if ll_mes = ll_mes_fin and ll_year = ll_year_fin then
		dw_detalle.object.t_cabecera.text	= 'Informe de Producción~rCierre de Venta: desde '+string(ld_fec_ini,'dd/mm/yyyy')+ ' al '+string(ld_fec_fin,'dd/mm/yyyy')
	else
		dw_detalle.object.t_cabecera.text	= 'Informe de Producción~rCierre de Venta: desde '+string(ld_fec_ini,'dd/mm/yyyy')+' al '+string(ld_fec_fin,'dd/mm/yyyy')
	end if
end if
end event

type pb_filtrar from picturebutton within w_detalle_ventas_por_xxx
event ue_mousemove pbm_mousemove
integer x = 389
integer y = 1812
integer width = 165
integer height = 148
integer taborder = 50
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
dw_detalle.SETfilter(NULO)
dw_detalle.filter()

end event

type pb_ordenar from picturebutton within w_detalle_ventas_por_xxx
event ue_mousemove pbm_mousemove
integer x = 215
integer y = 1812
integer width = 165
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event clicked;if dw_detalle.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type pb_imprimir from picturebutton within w_detalle_ventas_por_xxx
event ue_mousemove pbm_mousemove
integer x = 562
integer y = 1812
integer width = 165
integer height = 148
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;if dw_detalle.rowcount() > 0 then 
	dw_detalle.object.datawindow.print.Preview = true
	f_Print( dw_detalle )
	dw_detalle.object.datawindow.print.Preview = false	
end if
end event

type pb_exportar from picturebutton within w_detalle_ventas_por_xxx
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1812
integer width = 165
integer height = 148
integer taborder = 30
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
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_cerrar from picturebutton within w_detalle_ventas_por_xxx
integer x = 3392
integer y = 1808
integer width = 165
integer height = 148
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
string disabledname = "salir_off.bmp"
alignment htextalign = left!
end type

event clicked;close(w_detalle_ventas_por_xxx)
end event

type dw_detalle from datawindow within w_detalle_ventas_por_xxx
integer x = 32
integer y = 28
integer width = 3525
integer height = 1728
integer taborder = 10
string dataobject = "dw_informe_detalle_ventas_por_jefe"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

event doubleclicked;gi_numero 			= dw_detalle.getitemnumber(dw_detalle.getrow(),'cadena_numero')
gi_tipo_busqueda 	= 8
Open(w_listado_contratos)
end event

