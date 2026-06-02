forward
global type w_detalle_cuentas_contables from window
end type
type cb_imprimir from commandbutton within w_detalle_cuentas_contables
end type
type cb_ordenar from commandbutton within w_detalle_cuentas_contables
end type
type cb_filtrar from commandbutton within w_detalle_cuentas_contables
end type
type cb_3 from commandbutton within w_detalle_cuentas_contables
end type
type dw_parque from datawindow within w_detalle_cuentas_contables
end type
type st_5 from statictext within w_detalle_cuentas_contables
end type
type cb_cerrar from commandbutton within w_detalle_cuentas_contables
end type
type dw_lista from datawindow within w_detalle_cuentas_contables
end type
end forward

global type w_detalle_cuentas_contables from window
integer width = 2528
integer height = 1520
boolean titlebar = true
string title = "Cuentas Contables"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_3 cb_3
dw_parque dw_parque
st_5 st_5
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_detalle_cuentas_contables w_detalle_cuentas_contables

on w_detalle_cuentas_contables.create
this.cb_imprimir=create cb_imprimir
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_3=create cb_3
this.dw_parque=create dw_parque
this.st_5=create st_5
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_imprimir,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_3,&
this.dw_parque,&
this.st_5,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_detalle_cuentas_contables.destroy
destroy(this.cb_imprimir)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_3)
destroy(this.dw_parque)
destroy(this.st_5)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;Long	ll_new
gf_centrar(w_detalle_cuentas_contables)
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
ll_new	= dw_parque.insertrow(0)
if gs_conexion="Parque El Prado" then
	dw_parque.setitem(ll_new,'cod_parque',1)
	dw_lista.retrieve(1)
elseif gs_conexion="Parque La Foresta" then
	dw_parque.setitem(ll_new,'cod_parque',11)
	dw_lista.retrieve(11)
end if
dw_parque.setfocus()
end event

type cb_imprimir from commandbutton within w_detalle_cuentas_contables
integer x = 581
integer y = 1304
integer width = 265
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.Object.DataWindow.Zoom = 120
	IF PrintSetup( ) <> -1 THEN dw_lista.Print()
	dw_lista.Object.DataWindow.Zoom = 100
end if
end event

type cb_ordenar from commandbutton within w_detalle_cuentas_contables
integer x = 311
integer y = 1304
integer width = 265
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()
end event

type cb_filtrar from commandbutton within w_detalle_cuentas_contables
integer x = 41
integer y = 1304
integer width = 265
integer height = 96
integer taborder = 30
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

type cb_3 from commandbutton within w_detalle_cuentas_contables
integer x = 850
integer y = 1304
integer width = 265
integer height = 96
integer taborder = 30
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

type dw_parque from datawindow within w_detalle_cuentas_contables
integer x = 256
integer y = 20
integer width = 613
integer height = 100
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long	ll_cod_parque
this.accepttext()
ll_cod_parque	= this.getitemnumber(1,'cod_parque')
if not isnull(ll_cod_parque) and ll_cod_parque>0 then
	dw_lista.retrieve(ll_cod_parque)
end if
end event

type st_5 from statictext within w_detalle_cuentas_contables
integer x = 50
integer y = 40
integer width = 192
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_detalle_cuentas_contables
integer x = 2181
integer y = 1304
integer width = 283
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_cuentas_contables)
end event

type dw_lista from datawindow within w_detalle_cuentas_contables
integer x = 37
integer y = 140
integer width = 2427
integer height = 1124
integer taborder = 20
string title = "none"
string dataobject = "dw_detalle_cuentas_contables"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

