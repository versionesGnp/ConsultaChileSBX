forward
global type w_cuenta_corriente_facturas from window
end type
type cb_1 from commandbutton within w_cuenta_corriente_facturas
end type
type cb_2 from commandbutton within w_cuenta_corriente_facturas
end type
type cb_3 from commandbutton within w_cuenta_corriente_facturas
end type
type cb_print from commandbutton within w_cuenta_corriente_facturas
end type
type cb_cerrar from commandbutton within w_cuenta_corriente_facturas
end type
type dw_ctacte_facturas from datawindow within w_cuenta_corriente_facturas
end type
end forward

global type w_cuenta_corriente_facturas from window
integer width = 3776
integer height = 2356
boolean titlebar = true
string title = "Cuenta Corriente Cliente Interno"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_print cb_print
cb_cerrar cb_cerrar
dw_ctacte_facturas dw_ctacte_facturas
end type
global w_cuenta_corriente_facturas w_cuenta_corriente_facturas

on w_cuenta_corriente_facturas.create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_print=create cb_print
this.cb_cerrar=create cb_cerrar
this.dw_ctacte_facturas=create dw_ctacte_facturas
this.Control[]={this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_print,&
this.cb_cerrar,&
this.dw_ctacte_facturas}
end on

on w_cuenta_corriente_facturas.destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_print)
destroy(this.cb_cerrar)
destroy(this.dw_ctacte_facturas)
end on

event open;gf_centrar(w_cuenta_corriente_facturas)
dw_ctacte_facturas.settransobject(sqlca)
dw_ctacte_facturas.getchild('facturas_ingreso_tipo_mov_1',idw_detalle15)
idw_detalle15.settransobject(sqlca)
idw_detalle15.retrieve('FE')
if dw_ctacte_facturas.retrieve(gs_base,gs_serie,gi_numero) = 0 then
	messagebox("Advertencia","No Registra Pago Contrato "+gs_base+gs_serie+string(gi_numero))
	cb_cerrar.triggerevent(clicked!)
end if
end event

type cb_1 from commandbutton within w_cuenta_corriente_facturas
integer x = 503
integer y = 2108
integer width = 279
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_ctacte_facturas.rowcount()>0 then
	setnull (nulo)
	dw_ctacte_facturas.SETSORT(NULO)
	dw_ctacte_facturas.SORT()
end if
end event

type cb_2 from commandbutton within w_cuenta_corriente_facturas
boolean visible = false
integer x = 1070
integer y = 2108
integer width = 279
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_ctacte_facturas
if dw_ctacte_facturas.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_3 from commandbutton within w_cuenta_corriente_facturas
integer x = 786
integer y = 2108
integer width = 279
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtro"
end type

event clicked;string nulo
setnull (nulo)
dw_ctacte_facturas.SETfilter(NULO)
dw_ctacte_facturas.filter()
end event

type cb_print from commandbutton within w_cuenta_corriente_facturas
integer x = 69
integer y = 2108
integer width = 279
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_ctacte_facturas.rowcount() > 0 then
	if dw_ctacte_facturas.rowcount() > 0 then f_Print( dw_ctacte_facturas )		//f_printdlg(dw_ctacte_facturas,gstr_print,w_cuenta_corriente_facturas)
end if
end event

type cb_cerrar from commandbutton within w_cuenta_corriente_facturas
integer x = 3392
integer y = 2108
integer width = 311
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_cuenta_corriente_facturas)
end event

type dw_ctacte_facturas from datawindow within w_cuenta_corriente_facturas
integer x = 69
integer y = 72
integer width = 3671
integer height = 1996
integer taborder = 10
string title = "none"
string dataobject = "dw_cuenta_corriente_facturas_bb"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

