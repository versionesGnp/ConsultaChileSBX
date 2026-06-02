forward
global type w_buscar_cliente_factura_exenta from window
end type
type cb_filtrar from commandbutton within w_buscar_cliente_factura_exenta
end type
type cbx_rezago from checkbox within w_buscar_cliente_factura_exenta
end type
type cb_cancelar from commandbutton within w_buscar_cliente_factura_exenta
end type
type cb_seleccionar from commandbutton within w_buscar_cliente_factura_exenta
end type
type dw_listado from datawindow within w_buscar_cliente_factura_exenta
end type
end forward

global type w_buscar_cliente_factura_exenta from window
integer x = 832
integer y = 360
integer width = 2930
integer height = 1160
boolean titlebar = true
string title = "Resultado Busqueda de Clientes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cb_filtrar cb_filtrar
cbx_rezago cbx_rezago
cb_cancelar cb_cancelar
cb_seleccionar cb_seleccionar
dw_listado dw_listado
end type
global w_buscar_cliente_factura_exenta w_buscar_cliente_factura_exenta

on w_buscar_cliente_factura_exenta.create
this.cb_filtrar=create cb_filtrar
this.cbx_rezago=create cbx_rezago
this.cb_cancelar=create cb_cancelar
this.cb_seleccionar=create cb_seleccionar
this.dw_listado=create dw_listado
this.Control[]={this.cb_filtrar,&
this.cbx_rezago,&
this.cb_cancelar,&
this.cb_seleccionar,&
this.dw_listado}
end on

on w_buscar_cliente_factura_exenta.destroy
destroy(this.cb_filtrar)
destroy(this.cbx_rezago)
destroy(this.cb_cancelar)
destroy(this.cb_seleccionar)
destroy(this.dw_listado)
end on

event open;long il_cant_datos

gf_centrar(w_buscar_cliente_factura_exenta)

CHOOSE CASE gi_tipo_busqueda
	CASE 0 //Por número de contrato
		dw_listado.DataObject = 'd_cont_resultado_busqueda_x_num_ctto_be'
		dw_listado.SetTransObject(SQLCA)
		il_cant_datos = dw_listado.Retrieve(gi_numero)
	CASE 1 //Por RUT
		dw_listado.DataObject = 'd_cont_resultado_busqueda_x_rut_be'
		dw_listado.SetTransObject(SQLCA)
		il_cant_datos = dw_listado.Retrieve(gi_rut)
	CASE 2 //Por Apellido Paterno
		dw_listado.DataObject = 'd_cont_resultado_busqueda_x_apaterno_be'
		dw_listado.SetTransObject(SQLCA)
		il_cant_datos = dw_listado.Retrieve(gs_apellido_paterno)
END CHOOSE
IF il_cant_datos = 0 THEN
	//MessageBox("Consulta", "No encontraron datos asociados a su consulta.")
	Close(w_buscar_cliente_factura_exenta)
ELSE
	dw_listado.SetFilter(gs_filtro)
	dw_listado.Filter()
END IF
end event

type cb_filtrar from commandbutton within w_buscar_cliente_factura_exenta
integer x = 1467
integer y = 944
integer width = 256
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;string nulo
if dw_listado.rowcount() > 0 then
	setnull (nulo)
	dw_listado.SETSORT(NULO)
	dw_listado.sort()
end if
end event

type cbx_rezago from checkbox within w_buscar_cliente_factura_exenta
integer x = 46
integer y = 952
integer width = 1221
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Contrato cliente no figura en la lista"
end type

type cb_cancelar from commandbutton within w_buscar_cliente_factura_exenta
integer x = 2478
integer y = 936
integer width = 384
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;gs_base 		= ""
gs_serie 	= ""
gi_numero 	= 0
gi_rut 		= 0
Close(w_buscar_cliente_factura_exenta)
end event

type cb_seleccionar from commandbutton within w_buscar_cliente_factura_exenta
integer x = 2062
integer y = 936
integer width = 384
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Seleccionar"
end type

event clicked;String		ls_estado,ls_base,ls_serie,ls_dv
Long		ll_rut
Double	ll_numero

ls_estado		= dw_listado.getitemstring(dw_listado.getrow(),'facturas_cadena_estado')
ls_base			= dw_listado.getitemstring(dw_listado.getrow(),'facturas_cadena_codigo')
ls_serie			= dw_listado.getitemstring(dw_listado.getrow(),'facturas_cadena_serie')
ll_numero		= dw_listado.getitemnumber(dw_listado.getrow(),'facturas_cadena_numero')
gl_cod_parque	= dw_listado.getitemnumber(dw_listado.getrow(),'facturas_cadena_cod_parque')
if ls_estado='V' or ls_estado='C' or ls_estado='S' then
	if w_ingreso2.tab_ingreso.SelectedTab=1 and ll_numero>0 then
		w_ingreso2.tab_ingreso.tp_cupon.sle_n_contrato.text	= ls_base+ls_serie+string(ll_numero)
		w_ingreso2.tab_ingreso.tp_cupon.sle_n_contrato.setfocus()
		w_ingreso2.tab_ingreso.tp_cupon.sle_n_contrato.triggerevent(modified!)
	end if
	IF cbx_rezago.Checked=true THEN
		gs_base 		= ""
		gs_serie 		= ""
		gi_numero 	= 0
		gs_dv			= ""
		if isvalid(w_repacta) then
			w_repacta.dw_ci_buscar_cliente.SetItem(1,"rl_rut", String(gi_rut))
			w_repacta.dw_ci_buscar_cliente.AcceptText()
		end if
		if isvalid(w_ingreso2) then
			if w_ingreso2.tab_ingreso.SelectedTab=2 then
				ll_rut	= dw_listado.getitemnumber(dw_listado.getrow(),'facturas_cliente_exentas_rut')
				ls_dv	= dw_listado.getitemstring(dw_listado.getrow(),'facturas_cliente_exentas_dv')
				gi_rut	= ll_rut
				w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setitem(1,"rl_rut",string(ll_rut))
				w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setitem(1,"dv",ls_dv)
				w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.accepttext()
			elseif w_ingreso2.tab_ingreso.SelectedTab=3 then
				ll_rut	= dw_listado.getitemnumber(dw_listado.getrow(),'facturas_cliente_exentas_rut')
				ls_dv	= dw_listado.getitemstring(dw_listado.getrow(),'facturas_cliente_exentas_dv')
				w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.setitem(1,"rl_rut",string(ll_rut))
				w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.setitem(1,"dv",ls_dv)
				w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.accepttext()
			end if
		end if
		Close(w_buscar_cliente_factura_exenta)
	ELSE
		if isvalid(w_ingreso2) then
			if w_ingreso2.tab_ingreso.SelectedTab=2 then
				ll_rut	= dw_listado.getitemnumber(dw_listado.getrow(),'facturas_cliente_exentas_rut')
				ls_dv	= dw_listado.getitemstring(dw_listado.getrow(),'facturas_cliente_exentas_dv')
				gi_rut	= ll_rut
				w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setitem(1,"rl_rut",string(ll_rut))
				w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setitem(1,"dv",ls_dv)
				w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.accepttext()
				if ls_base = 'F' then
					w_ingreso2.tab_ingreso.tp_ci.rb_bol_afecta.checked			= true
					w_ingreso2.tab_ingreso.tp_ci.rb_bol_exenta.checked			= false
				else
					w_ingreso2.tab_ingreso.tp_ci.rb_bol_afecta.checked			= false
					w_ingreso2.tab_ingreso.tp_ci.rb_bol_exenta.checked			= true
				end if
				w_ingreso2.tab_ingreso.tp_ci.rb_bol_afecta.enabled				= false
				w_ingreso2.tab_ingreso.tp_ci.rb_bol_exenta.enabled				= false
				Close(w_buscar_cliente_factura_exenta)
			elseif w_ingreso2.tab_ingreso.SelectedTab=3 and (ls_base = 'F' or ls_base = 'B')  then
				ll_rut	= dw_listado.getitemnumber(dw_listado.getrow(),'facturas_cliente_exentas_rut')
				ls_dv	= dw_listado.getitemString(dw_listado.getrow(),'facturas_cliente_exentas_dv')
				w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.setitem(1,"rl_rut",string(ll_rut))
				w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.setitem(1,"dv",ls_dv)
				w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.accepttext()
				if ls_base = 'F' then
					w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.checked	= true
					w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.checked	= false
				elseif ls_base = 'B' then
					w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.checked	= false
					w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.checked	= true
				else
					w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.checked	= false
					w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.checked	= true
				end if
				w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.enabled		= false
				w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.enabled		= false
				Close(w_buscar_cliente_factura_exenta)
			elseif w_ingreso2.tab_ingreso.SelectedTab=3 and ls_base<>'F' and ls_base <> 'B' then
				ll_rut	= dw_listado.getitemnumber(dw_listado.getrow(),'facturas_cliente_exentas_rut')
				ls_dv	= dw_listado.getitemString(dw_listado.getrow(),'facturas_cliente_exentas_dv')
				w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.setitem(1,"rl_rut",string(ll_rut))
				w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.setitem(1,"dv",ls_dv)
				w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.accepttext()
				w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.enabled	= true
				w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.enabled	= false
				Close(w_buscar_cliente_factura_exenta)
//				messagebox("Advertencia","No es posible Generar Factura a "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###')+", recuerde solo Producto FUNERARIA")
			elseif w_ingreso2.tab_ingreso.SelectedTab=2 and ls_base='F' then
				messagebox("Advertencia","No es posible Generar Boleta a "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###')+", por ser Producto FUNERARIA")
			end if
		end if
	END IF
	Close(w_buscar_cliente_factura_exenta)
else
	if isvalid(w_ingreso2) then
		if w_ingreso2.tab_ingreso.SelectedTab=2 then
			ll_rut	= dw_listado.getitemnumber(dw_listado.getrow(),'facturas_cliente_exentas_rut')
			ls_dv	= dw_listado.getitemstring(dw_listado.getrow(),'facturas_cliente_exentas_dv')
			gi_rut	= ll_rut
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setitem(1,"rl_rut",string(ll_rut))
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setitem(1,"dv",ls_dv)
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.accepttext()
			if ls_base = 'F' then
				w_ingreso2.tab_ingreso.tp_ci.rb_bol_afecta.checked			= true
				w_ingreso2.tab_ingreso.tp_ci.rb_bol_exenta.checked			= false
			else
				w_ingreso2.tab_ingreso.tp_ci.rb_bol_afecta.checked			= false
				w_ingreso2.tab_ingreso.tp_ci.rb_bol_exenta.checked			= true
			end if
			w_ingreso2.tab_ingreso.tp_ci.rb_bol_afecta.enabled				= false
			w_ingreso2.tab_ingreso.tp_ci.rb_bol_exenta.enabled				= false
			Close(w_buscar_cliente_factura_exenta)
		elseif w_ingreso2.tab_ingreso.SelectedTab=3 then
			ll_rut	= dw_listado.getitemnumber(dw_listado.getrow(),'facturas_cliente_exentas_rut')
			ls_dv	= dw_listado.getitemString(dw_listado.getrow(),'facturas_cliente_exentas_dv')
			w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.setitem(1,"rl_rut",string(ll_rut))
			w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.setitem(1,"dv",ls_dv)
			w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.accepttext()
			if ls_base = 'F' then
				w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.checked	= true
				w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.checked	= false
			else
				w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.checked	= false
				w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.checked	= true
			end if
			w_ingreso2.tab_ingreso.tp_boletas.rb_fac_afecta.enabled		= false
			w_ingreso2.tab_ingreso.tp_boletas.rb_fac_exenta.enabled		= false
			Close(w_buscar_cliente_factura_exenta)
		end if
	end if
end if
end event

type dw_listado from datawindow within w_buscar_cliente_factura_exenta
integer x = 41
integer y = 36
integer width = 2821
integer height = 868
integer taborder = 10
string dataobject = "d_cont_resultado_busqueda_x_num_ctto_be"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base 						= This.GetItemString(row, "facturas_cadena_codigo")
	gs_serie 						= This.GetItemString(row, "facturas_cadena_serie")
	gi_numero 					= This.GetItemNumber(row, "facturas_cadena_numero")
	gi_rut 						= This.GetItemNumber(row, "facturas_cliente_exentas_rut")
	gs_dv							= This.GetItemString(row, "facturas_cliente_exentas_dv")
	gl_cod_parque				= This.getitemnumber(row,'facturas_cadena_cod_parque')
	cb_seleccionar.enabled 	= TRUE
END IF
end event

event doubleclicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base 						= This.GetItemString(row, "facturas_cadena_codigo")
	gs_serie 						= This.GetItemString(row, "facturas_cadena_serie")
	gi_numero 					= This.GetItemNumber(row, "facturas_cadena_numero")
	gi_rut 						= This.GetItemNumber(row, "facturas_cliente_exentas_rut")
	gs_dv							= This.GetItemString(row, "facturas_cliente_exentas_dv")
	gl_cod_parque				= This.getitemnumber(row,'facturas_cadena_cod_parque')
	cb_seleccionar.enabled 	= TRUE
	cb_seleccionar.TriggerEvent(Clicked!)
END IF
end event

