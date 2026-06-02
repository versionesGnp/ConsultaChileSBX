forward
global type w_listado_clientes from window
end type
type cb_aceptar from commandbutton within w_listado_clientes
end type
type cb_ordenar from commandbutton within w_listado_clientes
end type
type cb_exportar from commandbutton within w_listado_clientes
end type
type cb_filtrar from commandbutton within w_listado_clientes
end type
type cb_imprimir from commandbutton within w_listado_clientes
end type
type dw_lista_cliente from datawindow within w_listado_clientes
end type
type cb_cerrar from commandbutton within w_listado_clientes
end type
end forward

global type w_listado_clientes from window
integer width = 3045
integer height = 1668
boolean titlebar = true
string title = "Listado Clientes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_aceptar cb_aceptar
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_imprimir cb_imprimir
dw_lista_cliente dw_lista_cliente
cb_cerrar cb_cerrar
end type
global w_listado_clientes w_listado_clientes

on w_listado_clientes.create
this.cb_aceptar=create cb_aceptar
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_imprimir=create cb_imprimir
this.dw_lista_cliente=create dw_lista_cliente
this.cb_cerrar=create cb_cerrar
this.Control[]={this.cb_aceptar,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_imprimir,&
this.dw_lista_cliente,&
this.cb_cerrar}
end on

on w_listado_clientes.destroy
destroy(this.cb_aceptar)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_imprimir)
destroy(this.dw_lista_cliente)
destroy(this.cb_cerrar)
end on

event open;gf_centrar(w_listado_clientes)

dw_lista_cliente.settransobject(sqlca)
dw_lista_cliente.retrieve()
end event

type cb_aceptar from commandbutton within w_listado_clientes
integer x = 37
integer y = 1440
integer width = 293
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

type cb_ordenar from commandbutton within w_listado_clientes
integer x = 914
integer y = 1440
integer width = 293
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista_cliente.SETSORT(NULO)
dw_lista_cliente.SORT()

end event

type cb_exportar from commandbutton within w_listado_clientes
boolean visible = false
integer x = 1509
integer y = 1440
integer width = 293
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista_cliente
if dw_lista_cliente.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_listado_clientes
integer x = 1211
integer y = 1440
integer width = 293
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista_cliente.SETfilter(NULO)
dw_lista_cliente.filter()

end event

type cb_imprimir from commandbutton within w_listado_clientes
boolean visible = false
integer x = 1806
integer y = 1440
integer width = 293
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista_cliente.rowcount() > 0 then
	f_Print( dw_lista_cliente )
//	f_printdlg(dw_lista_cliente,gstr_print,w_listado_clientes)
end if
end event

type dw_lista_cliente from datawindow within w_listado_clientes
integer x = 37
integer y = 32
integer width = 2926
integer height = 1376
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_clientes"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_listado_clientes
integer x = 2633
integer y = 1440
integer width = 329
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listado_clientes)
end event

