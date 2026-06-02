forward
global type w_buscar_cliente_facturas_exenta from window
end type
type cb_cerrar from commandbutton within w_buscar_cliente_facturas_exenta
end type
type cb_aceptar from commandbutton within w_buscar_cliente_facturas_exenta
end type
type dw_lista from datawindow within w_buscar_cliente_facturas_exenta
end type
end forward

global type w_buscar_cliente_facturas_exenta from window
integer width = 3835
integer height = 1568
boolean titlebar = true
string title = "Buscar Cliente Facturas Exentas"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_lista dw_lista
end type
global w_buscar_cliente_facturas_exenta w_buscar_cliente_facturas_exenta

on w_buscar_cliente_facturas_exenta.create
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.cb_aceptar,&
this.dw_lista}
end on

on w_buscar_cliente_facturas_exenta.destroy
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_buscar_cliente_facturas_exenta)
dw_lista.settransobject(sqlca)
if dw_lista.retrieve()=0 then
	messagebox("Advertencia","No registra Dato")
	close(w_buscar_cliente_facturas_exenta)
end if
end event

type cb_cerrar from commandbutton within w_buscar_cliente_facturas_exenta
integer x = 3406
integer y = 1312
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_buscar_cliente_facturas_exenta)
end event

type cb_aceptar from commandbutton within w_buscar_cliente_facturas_exenta
integer x = 46
integer y = 1312
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;Long		ll_fila,ll_rut
String		ls_ciudad,ls_ciudad_com

ll_fila																					= dw_lista.getrow()
ll_rut																					= dw_lista.getitemnumber(ll_fila,'rut')
if ll_rut > 0 then
	if isvalid(w_ingreso_cliente_facturas_exentas) then
		if w_ingreso_cliente_facturas_exentas.dw_lista.retrieve(ll_rut) > 0 then
			ls_ciudad																	= dw_lista.getitemstring(ll_fila,'ciudad')
			ls_ciudad_com															= dw_lista.getitemstring(ll_fila,'comuna_comercial')
			w_ingreso_cliente_facturas_exentas.dw_lista.getchild('comuna',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle.retrieve(ls_ciudad)=0 then
				idw_detalle.insertrow(0)
			end if
			w_ingreso_cliente_facturas_exentas.dw_lista.getchild('comuna_comercial',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			if idw_detalle2.retrieve(ls_ciudad_com)=0 then
				idw_detalle2.insertrow(0)
			end if
			w_ingreso_cliente_facturas_exentas.cb_grabar.enabled		= true
			w_ingreso_cliente_facturas_exentas.dw_lista.SetItem(1, "estado_rut",1)
			w_ingreso_cliente_facturas_exentas.dw_lista.accepttext()
			close(w_buscar_cliente_facturas_exenta)
		end if
	end if
end if
end event

type dw_lista from datawindow within w_buscar_cliente_facturas_exenta
integer x = 46
integer y = 44
integer width = 3703
integer height = 1232
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_buscar_clientes_facturas_exenta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

event doubleclicked;if row > 0 then
	cb_aceptar.triggerevent(clicked!)
end if
end event

