forward
global type w_abono_cta_cte from window
end type
type cb_3 from commandbutton within w_abono_cta_cte
end type
type cb_ordenar from commandbutton within w_abono_cta_cte
end type
type cb_nuevo from commandbutton within w_abono_cta_cte
end type
type dw_cliente from datawindow within w_abono_cta_cte
end type
type dw_datos_ci from datawindow within w_abono_cta_cte
end type
type cb_cerrar from commandbutton within w_abono_cta_cte
end type
type cb_eliminar from commandbutton within w_abono_cta_cte
end type
type cb_grabar from commandbutton within w_abono_cta_cte
end type
type dw_lista from datawindow within w_abono_cta_cte
end type
end forward

global type w_abono_cta_cte from window
integer width = 3474
integer height = 2516
boolean titlebar = true
string title = "Ingreso Pago Abono Cuenta Corriente"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_3 cb_3
cb_ordenar cb_ordenar
cb_nuevo cb_nuevo
dw_cliente dw_cliente
dw_datos_ci dw_datos_ci
cb_cerrar cb_cerrar
cb_eliminar cb_eliminar
cb_grabar cb_grabar
dw_lista dw_lista
end type
global w_abono_cta_cte w_abono_cta_cte

type variables
Long		il_row,il_rut,il_folio
String		is_base,is_serie,is_tipo_cob
Double	il_numero
end variables

on w_abono_cta_cte.create
this.cb_3=create cb_3
this.cb_ordenar=create cb_ordenar
this.cb_nuevo=create cb_nuevo
this.dw_cliente=create dw_cliente
this.dw_datos_ci=create dw_datos_ci
this.cb_cerrar=create cb_cerrar
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.dw_lista=create dw_lista
this.Control[]={this.cb_3,&
this.cb_ordenar,&
this.cb_nuevo,&
this.dw_cliente,&
this.dw_datos_ci,&
this.cb_cerrar,&
this.cb_eliminar,&
this.cb_grabar,&
this.dw_lista}
end on

on w_abono_cta_cte.destroy
destroy(this.cb_3)
destroy(this.cb_ordenar)
destroy(this.cb_nuevo)
destroy(this.dw_cliente)
destroy(this.dw_datos_ci)
destroy(this.cb_cerrar)
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_abono_cta_cte)
is_base								= trim(substr(1,1,Message.StringParm))
is_serie								= trim(substr(1,2,Message.StringParm))
il_numero							= Double(trim(substr(1,3,Message.StringParm)))
il_rut									= long(trim(substr(1,4,Message.StringParm)))
is_tipo_cob							= trim(substr(1,5,Message.StringParm))
il_folio								= long(trim(substr(1,6,Message.StringParm)))

CHOOSE CASE gs_base
	CASE "O","U","M"
		dw_datos_ci.DataObject 	= 'd_datos_cuenta_ci_oferta'
	CASE "L"
		dw_datos_ci.DataObject 	= 'd_datos_cuenta_ci_liberador'
	CASE "P"
		dw_datos_ci.DataObject 	= 'd_datos_cuenta_ci_pagare'
	CASE "D"
		dw_datos_ci.DataObject 	= 'd_datos_cuenta_ci_derecho'
	CASE "C"
		dw_datos_ci.DataObject 	= 'd_datos_cuenta_bl_cto_isa'
	CASE "A"
		dw_datos_ci.DataObject 	= 'd_datos_cuenta_ci_aumento_capacidad'
	CASE "R"
		dw_datos_ci.DataObject 	= 'dw_repacta_mant_descripcion_traspaso'
END CHOOSE
dw_datos_ci.settransobject(sqlca)
dw_lista.settransobject(sqlca)
dw_cliente.settransobject(sqlca)
if dw_datos_ci.Retrieve(is_serie,il_numero)=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_abono_cta_cte)
else
	dw_lista.retrieve(is_base,is_serie,il_numero)
	dw_cliente.retrieve(gi_rut)
	dw_lista.setfocus()
end if
end event

type cb_3 from commandbutton within w_abono_cta_cte
integer x = 2231
integer y = 2236
integer width = 302
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
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

type cb_ordenar from commandbutton within w_abono_cta_cte
integer x = 1925
integer y = 2236
integer width = 302
integer height = 112
integer taborder = 20
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

type cb_nuevo from commandbutton within w_abono_cta_cte
integer x = 498
integer y = 2236
integer width = 613
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingresar &Nuevo Abono"
end type

event clicked;Long	ll_new,ll_fila,ll_tot_reg

SELECT "TASA"."LOOK" INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

ll_tot_reg	= dw_lista.rowcount()

ll_fila 		= dw_lista.Find("folio = "+string(il_folio)+ " and tipo_cob ='"+is_tipo_cob+"'", 1, ll_tot_reg)
if ll_fila > 0 then
	messagebox("Advertencia","No es Posible Ingresar Comprobante Nº "+is_tipo_cob+'-'+string(il_folio)+" Ya Existe")
else
	ll_new		= dw_lista.insertrow(0)
	dw_lista.scrolltorow(ll_new)
	dw_lista.setitem(ll_new,'base',is_base)
	dw_lista.setitem(ll_new,'serie',is_serie)
	dw_lista.setitem(ll_new,'numero',il_numero)
	dw_lista.setitem(ll_new,'rut',il_rut)
	dw_lista.setitem(ll_new,'tipo_cob',is_tipo_cob)
	dw_lista.setitem(ll_new,'folio',il_folio)
	dw_lista.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
	dw_lista.setitem(ll_new,'usuario_crea',gs_user)
	dw_lista.setitem(ll_new,'caja_crea',gs_caja)
	dw_lista.setitem(ll_new,'estado_reg','P')
	dw_lista.setitem(ll_new,'c_nuevo','S')
	dw_lista.accepttext()
	dw_lista.setfocus()
	dw_lista.setcolumn('monto')
end if
end event

type dw_cliente from datawindow within w_abono_cta_cte
integer x = 1234
integer y = 32
integer width = 2107
integer height = 1032
integer taborder = 10
string title = "none"
string dataobject = "dw_datos_cliente_abono"
boolean border = false
boolean livescroll = true
end type

type dw_datos_ci from datawindow within w_abono_cta_cte
integer x = 37
integer y = 32
integer width = 1129
integer height = 1032
string title = "none"
string dataobject = "d_datos_cuenta_ci_oferta"
boolean livescroll = true
end type

type cb_cerrar from commandbutton within w_abono_cta_cte
integer x = 3013
integer y = 2236
integer width = 288
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_abono_cta_cte)
end event

type cb_eliminar from commandbutton within w_abono_cta_cte
integer x = 1115
integer y = 2236
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar Abono"
end type

event clicked;Long	ll_res

if il_row > 0 then
	ll_res	= messagebox("Eliminar","Está Seguro Elimianr Fila Nº "+string(il_row),Exclamation!,YesNo!,2)
	if ll_res=1 then
		
		dw_lista.deleterow(il_row)
		if dw_lista.update() = 1 then
			commit;
			messagebox("Eliminar","Eliminación Exitosa")
		else
			rollback;
			messagebox("Error Eliminar","Error al Eliminar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_grabar from commandbutton within w_abono_cta_cte
integer x = 37
integer y = 2236
integer width = 302
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_tot_reg,ll_fila,ll_monto
String	ls_string

ll_tot_reg		= dw_lista.rowcount()
ll_fila 			= dw_lista.Find("monto = 0 ", 1, ll_tot_reg)
if ll_fila > 0 then
	messagebox("Advertencia","Debe Ingresar Monto")
	dw_lista.setfocus()
	dw_lista.scrolltorow(ll_fila)
	dw_lista.setcolumn('monto')
else
	ls_string	= "c_nuevo ='S'"
	ll_fila		= dw_lista.Find(ls_string, 1, ll_tot_reg)
	if ll_fila > 0 then
		ll_monto	= dw_lista.getitemnumber(ll_fila,'monto')
		if ll_monto > 0 then
			if dw_lista.update() = 1 then
				commit;
				if isvalid(w_ingreso2) then
					w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'monto',ll_monto)
					w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setitem(w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getrow(),'cantidad',1)
				end if
				messagebox("Grabar","Grabación Exitosa")
				w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.setfocus()
				close(w_abono_cta_cte)
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
end if
end event

type dw_lista from datawindow within w_abono_cta_cte
integer x = 37
integer y = 1092
integer width = 3264
integer height = 1096
integer taborder = 10
string dataobject = "dw_lista_abono_cta_cte"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_filtro

ls_columna	= dwo.name
if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
else
	if ls_columna='t_rojo_txt' or ls_columna='t_rojo' then
		ls_filtro	= "estado_reg='U'"
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	elseif ls_columna='t_blanco_txt' or ls_columna='t_blanco' then
		ls_filtro	= "estado_reg='P'"
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	elseif ls_columna='t_todo' then
		ls_filtro	= ""
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	end if
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

