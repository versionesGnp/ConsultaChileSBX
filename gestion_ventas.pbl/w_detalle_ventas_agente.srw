forward
global type w_detalle_ventas_agente from window
end type
type pb_filtrar from picturebutton within w_detalle_ventas_agente
end type
type pb_ordenar from picturebutton within w_detalle_ventas_agente
end type
type pb_imprimir from picturebutton within w_detalle_ventas_agente
end type
type pb_exportar from picturebutton within w_detalle_ventas_agente
end type
type pb_salir from picturebutton within w_detalle_ventas_agente
end type
type dw_detalle from datawindow within w_detalle_ventas_agente
end type
end forward

global type w_detalle_ventas_agente from window
integer width = 3246
integer height = 1860
boolean titlebar = true
string title = "Detalle Promesas por Agente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_imprimir pb_imprimir
pb_exportar pb_exportar
pb_salir pb_salir
dw_detalle dw_detalle
end type
global w_detalle_ventas_agente w_detalle_ventas_agente

type variables
string	is_cod_age, is_opcion,is_opcion_fecha
datetime	id_fec_ini, id_fec_fin
long		il_empresa
end variables

on w_detalle_ventas_agente.create
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_imprimir=create pb_imprimir
this.pb_exportar=create pb_exportar
this.pb_salir=create pb_salir
this.dw_detalle=create dw_detalle
this.Control[]={this.pb_filtrar,&
this.pb_ordenar,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_salir,&
this.dw_detalle}
end on

on w_detalle_ventas_agente.destroy
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_imprimir)
destroy(this.pb_exportar)
destroy(this.pb_salir)
destroy(this.dw_detalle)
end on

event open;gf_centrar(w_detalle_ventas_agente)
gs_ventana	= 'w_detalle_ventas_agente'
f_valida_objeto_1()
is_cod_age	= substr(1,1,Message.StringParm)
id_fec_ini	= datetime(date(substr(1,2,Message.StringParm)),time('00:00:00'))
id_fec_fin	= datetime(date(substr(1,3,Message.StringParm)),time('00:00:00'))
is_opcion	= substr(1,4,Message.StringParm)
is_opcion_fecha	= substr(1,5,Message.StringParm)
if gs_conexion = "Parque El Prado" then
	il_empresa 		= 1
elseif gs_conexion = "Parque La Foresta" then
	il_empresa 		= 2
elseif gs_conexion = "Parque Concepción" then
	il_empresa 		= 3
end if
CHOOSE CASE is_opcion
	CASE '1','3' //activo
		if is_opcion_fecha='U' then
			dw_detalle.dataobject	= 'dw_detalle_general_por_agente_activo'
		elseif is_opcion_fecha='C' then
			dw_detalle.dataobject	= 'dw_detalle_general_por_age_activo_cierre'
		end if
		dw_detalle.settransobject(sqlca)
		if dw_detalle.retrieve(id_fec_ini,id_fec_fin,il_empresa,is_cod_age)=0 then
			messagebox("Advertencia","No registra dato")
			close(w_detalle_ventas_agente)
		end if
	CASE '2' //inactivo
		if is_opcion_fecha='U' then
			dw_detalle.dataobject	= 'dw_detalle_general_por_agente_inactivo'
		elseif is_opcion_fecha='C' then
			dw_detalle.dataobject	= 'dw_detalle_gral_por_age_inactivo_cierre'
		end if
		dw_detalle.settransobject(sqlca)
		if dw_detalle.retrieve(id_fec_ini,id_fec_fin,il_empresa,is_cod_age)=0 then
			messagebox("Advertencia","No registra dato")
			close(w_detalle_ventas_agente)
		end if
	CASE '4' //todo
		if is_opcion_fecha='U' then
			dw_detalle.dataobject	= 'dw_detalle_general_por_agente'
		elseif is_opcion_fecha='C' then
			dw_detalle.dataobject	= 'dw_detalle_general_por_agente_cierre'
		end if
		dw_detalle.settransobject(sqlca)
		if dw_detalle.retrieve(id_fec_ini,id_fec_fin,il_empresa,is_cod_age)=0 then
			messagebox("Advertencia","No registra dato")
			close(w_detalle_ventas_agente)
		end if
END CHOOSE
end event

type pb_filtrar from picturebutton within w_detalle_ventas_agente
event ue_mousemove pbm_mousemove
integer x = 439
integer y = 1576
integer width = 183
integer height = 152
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Desembosos (o).BMP"
string disabledname = "Desembosos (o)_no.BMP"
alignment htextalign = right!
end type

event clicked;string nulo
setnull (nulo)
dw_detalle.SETfilter(NULO)
dw_detalle.filter()

end event

type pb_ordenar from picturebutton within w_detalle_ventas_agente
event ue_mousemove pbm_mousemove
integer x = 247
integer y = 1576
integer width = 183
integer height = 152
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

type pb_imprimir from picturebutton within w_detalle_ventas_agente
event ue_mousemove pbm_mousemove
integer x = 631
integer y = 1576
integer width = 183
integer height = 152
integer taborder = 30
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

type pb_exportar from picturebutton within w_detalle_ventas_agente
event ue_mousemove pbm_mousemove
integer x = 55
integer y = 1576
integer width = 183
integer height = 152
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_salir from picturebutton within w_detalle_ventas_agente
integer x = 3003
integer y = 1576
integer width = 183
integer height = 152
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_detalle_ventas_agente)
end event

type dw_detalle from datawindow within w_detalle_ventas_agente
integer x = 41
integer y = 40
integer width = 3150
integer height = 1496
integer taborder = 10
string dataobject = "dw_detalle_general_por_agente_cierre"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if

end event

event doubleclicked;gi_numero = dw_detalle.getitemnumber(dw_detalle.getrow(),'oferta_v_nro_oferta')
gi_tipo_busqueda = 8
Open(w_listado_contratos)
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if

end event

