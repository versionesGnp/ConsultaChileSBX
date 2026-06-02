forward
global type w_lista_detalle_cupones_asignado_ci from window
end type
type cb_imprimir from commandbutton within w_lista_detalle_cupones_asignado_ci
end type
type cb_3 from commandbutton within w_lista_detalle_cupones_asignado_ci
end type
type cb_2 from commandbutton within w_lista_detalle_cupones_asignado_ci
end type
type cb_1 from commandbutton within w_lista_detalle_cupones_asignado_ci
end type
type cb_cerrar from commandbutton within w_lista_detalle_cupones_asignado_ci
end type
type dw_lista from datawindow within w_lista_detalle_cupones_asignado_ci
end type
type gb_1 from groupbox within w_lista_detalle_cupones_asignado_ci
end type
end forward

global type w_lista_detalle_cupones_asignado_ci from window
integer width = 2880
integer height = 1524
boolean titlebar = true
string title = "Detalle Cupones Reemplazados por CI"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_lista_detalle_cupones_asignado_ci w_lista_detalle_cupones_asignado_ci

on w_lista_detalle_cupones_asignado_ci.create
this.cb_imprimir=create cb_imprimir
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_imprimir,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_lista_detalle_cupones_asignado_ci.destroy
destroy(this.cb_imprimir)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;String	ls_tipo_cob
Long		ll_folio
gf_centrar(w_lista_detalle_cupones_asignado_ci)
ls_tipo_cob	= trim(substr(1,1,Message.StringParm))
ll_folio		= long(trim(substr(1,2,Message.StringParm)))
dw_lista.settransobject(sqlca)
if dw_lista.retrieve(ls_tipo_cob,ll_folio)=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_lista_detalle_cupones_asignado_ci)
end if
end event

type cb_imprimir from commandbutton within w_lista_detalle_cupones_asignado_ci
integer x = 727
integer y = 1264
integer width = 219
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
//	f_printdlg(dw_lista,gstr_print,w_lista_detalle_cupones_asignado_ci)
end if
end event

type cb_3 from commandbutton within w_lista_detalle_cupones_asignado_ci
integer x = 279
integer y = 1264
integer width = 219
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_2 from commandbutton within w_lista_detalle_cupones_asignado_ci
integer x = 503
integer y = 1264
integer width = 219
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_1 from commandbutton within w_lista_detalle_cupones_asignado_ci
integer x = 55
integer y = 1264
integer width = 219
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_cerrar from commandbutton within w_lista_detalle_cupones_asignado_ci
integer x = 2446
integer y = 1264
integer width = 352
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_detalle_cupones_asignado_ci)
end event

type dw_lista from datawindow within w_lista_detalle_cupones_asignado_ci
integer x = 32
integer y = 32
integer width = 2766
integer height = 1180
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_detalle_cupon_asignado_ci"
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

type gb_1 from groupbox within w_lista_detalle_cupones_asignado_ci
integer x = 32
integer y = 1212
integer width = 946
integer height = 176
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

