forward
global type w_crear_contrato_de_servicio_basev_bkp from window
end type
type cb_print from commandbutton within w_crear_contrato_de_servicio_basev_bkp
end type
type dw_print from datawindow within w_crear_contrato_de_servicio_basev_bkp
end type
type cb_ctacte from commandbutton within w_crear_contrato_de_servicio_basev_bkp
end type
type tab_1 from tab within w_crear_contrato_de_servicio_basev_bkp
end type
type tabpage_1 from userobject within tab_1
end type
type dw_cttos_detalle from datawindow within tabpage_1
end type
type st_5 from statictext within tabpage_1
end type
type dw_cttos from datawindow within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_cttos_detalle dw_cttos_detalle
st_5 st_5
dw_cttos dw_cttos
st_4 st_4
end type
type tabpage_2 from userobject within tab_1
end type
type dw_lista from datawindow within tabpage_2
end type
type st_6 from statictext within tabpage_2
end type
type st_3 from statictext within tabpage_2
end type
type cb_crear_serv from commandbutton within tabpage_2
end type
type cb_3 from commandbutton within tabpage_2
end type
type dw_3 from datawindow within tabpage_2
end type
type st_2 from statictext within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_lista dw_lista
st_6 st_6
st_3 st_3
cb_crear_serv cb_crear_serv
cb_3 cb_3
dw_3 dw_3
st_2 st_2
end type
type tabpage_3 from userobject within tab_1
end type
type st_1 from statictext within tabpage_3
end type
type dw_cliente from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
st_1 st_1
dw_cliente dw_cliente
end type
type tab_1 from tab within w_crear_contrato_de_servicio_basev_bkp
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type cb_cerrar from commandbutton within w_crear_contrato_de_servicio_basev_bkp
end type
end forward

global type w_crear_contrato_de_servicio_basev_bkp from window
integer width = 3465
integer height = 1868
boolean titlebar = true
string title = "Generar Contrato de Servicio"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_print cb_print
dw_print dw_print
cb_ctacte cb_ctacte
tab_1 tab_1
cb_cerrar cb_cerrar
end type
global w_crear_contrato_de_servicio_basev_bkp w_crear_contrato_de_servicio_basev_bkp

type variables
Long		il_row,il_modif,il_parque
Double	il_rut,il_numero_v
String		is_dv,is_opcion_base, is_tipo_cob,is_tipo_cob_aux,is_base_v,is_serie_v
end variables

on w_crear_contrato_de_servicio_basev_bkp.create
this.cb_print=create cb_print
this.dw_print=create dw_print
this.cb_ctacte=create cb_ctacte
this.tab_1=create tab_1
this.cb_cerrar=create cb_cerrar
this.Control[]={this.cb_print,&
this.dw_print,&
this.cb_ctacte,&
this.tab_1,&
this.cb_cerrar}
end on

on w_crear_contrato_de_servicio_basev_bkp.destroy
destroy(this.cb_print)
destroy(this.dw_print)
destroy(this.cb_ctacte)
destroy(this.tab_1)
destroy(this.cb_cerrar)
end on

event open;Long		ll_indi, ll_tot_reg,ll_parque,ll_numero,ll_new
String		ls_area,ls_sector,ls_sepultura,ls_base,ls_serie

tab_1.tabpage_2.dw_lista.settransobject(sqlca)
tab_1.tabpage_1.dw_cttos.settransobject(sqlca)
tab_1.tabpage_1.dw_cttos_detalle.settransobject(sqlca)
tab_1.tabpage_3.dw_cliente.settransobject(sqlca)
tab_1.tabpage_3.dw_cliente.getchild('comuna',idw_detalle)
dw_print.settransobject(sqlca)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
gf_centrar(w_crear_contrato_de_servicio_basev)
gs_base 				= substr(1,1,Message.StringParm)
gs_serie				= substr(1,2,Message.StringParm)
gi_numero			= Double(substr(1,3,Message.StringParm))
il_rut	 				= Double(substr(1,4,Message.StringParm))
is_dv					= substr(1,5,Message.StringParm)
ll_parque				= Double(substr(1,6,Message.StringParm))
il_parque				= ll_parque
ls_area 				= substr(1,7,Message.StringParm)
ls_sector				= substr(1,8,Message.StringParm)
ls_sepultura			= substr(1,9,Message.StringParm)	

is_opcion_base		= substr(1,10,Message.StringParm)	
il_modif				= 0
ll_tot_reg			= tab_1.tabpage_2.dw_lista.retrieve(gd_uf_dia) 
if ll_tot_reg = 0 then 
	messagebox("Advertencia","No Registra Items de Pagos")
	close(w_crear_contrato_de_servicio_basev)
else
	for ll_indi=1 to ll_tot_reg
		tab_1.tabpage_2.dw_lista.setitem(ll_indi,'sw_opcion',1)
	next
	tab_1.tabpage_2.cb_crear_serv.enabled		= True
	if tab_1.tabpage_1.dw_cttos.retrieve(gs_base,gs_serie,gi_numero) > 0 then
		ls_base		= tab_1.tabpage_1.dw_cttos.getitemstring(1,'base')
		ls_serie		= tab_1.tabpage_1.dw_cttos.getitemstring(1,'serie')
		ll_numero	= tab_1.tabpage_1.dw_cttos.getitemnumber(1,'numero')
		tab_1.tabpage_1.dw_cttos_detalle.retrieve(ls_base,ls_serie,ll_numero)
		tab_1.tabpage_3.dw_cliente.retrieve(ls_base,ls_serie,ll_numero)
	end if
	if tab_1.tabpage_3.dw_cliente.rowcount() = 0 then
		ll_new		= tab_1.tabpage_3.dw_cliente.insertrow(0)
	end if
	tab_1.tabpage_2.dw_lista.accepttext()
end if

end event

type cb_print from commandbutton within w_crear_contrato_de_servicio_basev_bkp
integer x = 41
integer y = 1636
integer width = 695
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir Contrato Servicio"
end type

event clicked;Long		ll_fila

ll_fila						= tab_1.tabpage_1.dw_cttos.getrow()
if ll_fila > 0 then
	is_base_v			= tab_1.tabpage_1.dw_cttos.GetItemString(ll_fila, "base")
	is_serie_v 			= tab_1.tabpage_1.dw_cttos.GetItemString(ll_fila, "serie")
	il_numero_v 		= tab_1.tabpage_1.dw_cttos.GetItemNumber(ll_fila, "numero")
	if dw_print.retrieve(is_base_v,is_serie_v,il_numero_v) > 0 then
		dw_print.print()
	end if
end if
end event

type dw_print from datawindow within w_crear_contrato_de_servicio_basev_bkp
boolean visible = false
integer x = 1975
integer y = 1692
integer width = 686
integer height = 400
boolean enabled = false
string title = "none"
string dataobject = "dw_cs_impresion_detalle_pago"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_ctacte from commandbutton within w_crear_contrato_de_servicio_basev_bkp
boolean visible = false
integer x = 41
integer y = 1636
integer width = 512
integer height = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Cuenta Corriente"
end type

event clicked;if not isnull(gs_base) and gi_numero>0 then
	CHOOSE CASE gs_base
		CASE "O", "U"	// Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" 	// Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "P" 	// Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			Open(w_cuenta_corriente_pagare)
		CASE "C" 	// Contrato ISA
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" 	// Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" 	// Repactación Ctas.Mantencion
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
		CASE "A"
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "F","G","V"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			Open(w_cuenta_corriente_funeraria)
	END CHOOSE
end if
end event

type tab_1 from tab within w_crear_contrato_de_servicio_basev_bkp
event create ( )
event destroy ( )
integer x = 41
integer y = 36
integer width = 3365
integer height = 1564
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3328
integer height = 1436
long backcolor = 67108864
string text = "Contratos Servcios Existentes"
long tabtextcolor = 33554432
string picturename = "ArrangeTables1!"
long picturemaskcolor = 536870912
dw_cttos_detalle dw_cttos_detalle
st_5 st_5
dw_cttos dw_cttos
st_4 st_4
end type

on tabpage_1.create
this.dw_cttos_detalle=create dw_cttos_detalle
this.st_5=create st_5
this.dw_cttos=create dw_cttos
this.st_4=create st_4
this.Control[]={this.dw_cttos_detalle,&
this.st_5,&
this.dw_cttos,&
this.st_4}
end on

on tabpage_1.destroy
destroy(this.dw_cttos_detalle)
destroy(this.st_5)
destroy(this.dw_cttos)
destroy(this.st_4)
end on

type dw_cttos_detalle from datawindow within tabpage_1
integer x = 41
integer y = 648
integer width = 3259
integer height = 756
integer taborder = 20
string title = "none"
string dataobject = "dw_cs_lista_detalle_pagos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

type st_5 from statictext within tabpage_1
integer x = 46
integer y = 576
integer width = 2875
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Contratos de Servicios "
boolean focusrectangle = false
end type

type dw_cttos from datawindow within tabpage_1
integer x = 41
integer y = 108
integer width = 3259
integer height = 428
integer taborder = 10
string title = "none"
string dataobject = "dw_cs_lista_general_por_ctto_origen"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	is_base_v								= dw_cttos.GetItemString(row, "base")
	is_serie_v								= dw_cttos.GetItemString(row, "serie")
	il_numero_v								= dw_cttos.GetItemNumber(row, "numero")
	tab_1.tabpage_1.st_5.text			= 'Detalle Pagos Contrato de Servicio '+is_base_v+'-'+is_serie_v+'-'+string(il_numero_v,"###,###,###,###,##0")
	if dw_cttos_detalle.retrieve(is_base_v,is_serie_v,il_numero_v) = 0 then 
		messagebox("Advertencia","No registra Datos Contrato "+is_base_v+'-'+is_serie_v+'-'+string(il_numero_v,"###,###,###,###,##0"))
	else
		tab_1.tabpage_3.dw_cliente.retrieve(is_base_v,is_serie_v,il_numero_v)
	end if
end if
end event

event rowfocuschanged;IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	is_base_v								= dw_cttos.GetItemString(this.getrow(), "base")
	is_serie_v 								= dw_cttos.GetItemString(this.getrow(), "serie")
	il_numero_v 							= dw_cttos.GetItemNumber(this.getrow(), "numero")
	tab_1.tabpage_1.st_5.text			= 'Detalle Pagos Contrato de Servicio '+is_base_v+'-'+is_serie_v+'-'+string(il_numero_v,"###,###,###,###,##0")
	if dw_cttos_detalle.retrieve(is_base_v,is_serie_v,il_numero_v) > 0 then 
		tab_1.tabpage_3.dw_cliente.retrieve(is_base_v,is_serie_v,il_numero_v)
//		messagebox("Advertencia","No registra Datos Contrato "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0"))
	end if
end if
end event

type st_4 from statictext within tabpage_1
integer x = 46
integer y = 28
integer width = 1225
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Contratos de Servicios "
boolean focusrectangle = false
end type

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3328
integer height = 1436
long backcolor = 67108864
string text = "Crear Contrato"
long tabtextcolor = 33554432
string picturename = "Layer1!"
long picturemaskcolor = 536870912
dw_lista dw_lista
st_6 st_6
st_3 st_3
cb_crear_serv cb_crear_serv
cb_3 cb_3
dw_3 dw_3
st_2 st_2
end type

on tabpage_2.create
this.dw_lista=create dw_lista
this.st_6=create st_6
this.st_3=create st_3
this.cb_crear_serv=create cb_crear_serv
this.cb_3=create cb_3
this.dw_3=create dw_3
this.st_2=create st_2
this.Control[]={this.dw_lista,&
this.st_6,&
this.st_3,&
this.cb_crear_serv,&
this.cb_3,&
this.dw_3,&
this.st_2}
end on

on tabpage_2.destroy
destroy(this.dw_lista)
destroy(this.st_6)
destroy(this.st_3)
destroy(this.cb_crear_serv)
destroy(this.cb_3)
destroy(this.dw_3)
destroy(this.st_2)
end on

type dw_lista from datawindow within tabpage_2
integer x = 37
integer y = 108
integer width = 3250
integer height = 1096
integer taborder = 20
string title = "none"
string dataobject = "dw_crear_contrato_de_servicio_basev"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	il_row			= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;il_row			= this.getrow()
IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

event itemchanged;String		ls_columna,ls_tipo_cob,ls_tipo_cob_aux
Long		ll_sw

ls_columna		= dwo.name
if ls_columna='sw_opcion' then
	ll_sw			= long(data)
	if ll_sw=0 then
		if tab_1.tabpage_3.dw_cliente.getitemnumber(1,'rut') > 0 and il_modif = 0 then
			tab_1.tabpage_3.dw_cliente.insertrow(0)
			messagebox("Advertencia","Recuerde si Contrato de Servicio es Generado por Otro Cliente, debe Ingresar Cliente Tercero")
		end if
		il_modif ++
		ls_tipo_cob				= dw_lista.getitemstring(row,'cuenta_contable_otros_tipo_comprobante')
		ls_tipo_cob_aux		= dw_lista.getitemstring(row,'ficha_cuenta_contable_otros_tipo_cobro_aux')
		if il_modif = 1 then
			is_tipo_cob			= ls_tipo_cob
			is_tipo_cob_aux	= ls_tipo_cob_aux
		end if
		if ls_tipo_cob <> is_tipo_cob then
			messagebox("Advertencia","No es posible Ingresar Item de Pago, No Corresponde Tipo Documento")
			dw_lista.setitem(row,'sw_opcion',1)
			dw_lista.accepttext()
		end if
	end if
end if
end event

type st_6 from statictext within tabpage_2
integer x = 46
integer y = 28
integer width = 1225
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Item(s) de Pago(s)"
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_2
integer x = 261
integer y = 1436
integer width = 1047
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Item(s) de Pago(s)"
boolean focusrectangle = false
end type

type cb_crear_serv from commandbutton within tabpage_2
integer x = 37
integer y = 1248
integer width = 3250
integer height = 140
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
string text = "Crear Contrato Servicio"
end type

event clicked;Long		ll_indi, ll_tot_reg, ll_sw, ll_cont_reg,ll_codigo_servicio,ll_fila_sw,ll_tot_reg_ctto,ll_fila_ctto,ll_indi_val,ll_count_error,ll_res,ll_cod_servicio,&
			ll_count_cliente
String		ls_cod_otro,ls_base,ls_serie,ls_moneda,ls_tipo_cob,ls_tipo_cob_aux,ls_cod_otro_val,ls_dv,ls_nombre,ls_ap_paterno,ls_ap_materno,ls_ciudad,&
			ls_comuna,ls_celular,ls_pasa_val,ls_tipo_via,ls_direccion_part,ls_nro_part,ls_depto_part,ls_block_part,ls_telefono_fijo,ls_fono_trabajo,&
			ls_correo
Double	ll_numero,lld_valor,ll_valor_uf,ll_valor_peso,ldb_precio_item,ll_rut
datetime	ldt_fecha_hoy

dw_lista.accepttext()
ldt_fecha_hoy					= datetime(date(gdt_fec_sistema),time('00:00:00'))
ll_cont_reg						= 0
ll_count_error					= 0
ls_pasa_val						= 'S'
ll_tot_reg						= dw_lista.rowcount()
ll_fila_sw							= dw_lista.Find('sw_opcion=0', 1, ll_tot_reg)
if ll_fila_sw > 0 then
	for ll_indi_val=1 to ll_tot_reg
		ll_sw						= dw_lista.getitemnumber(ll_indi_val,'sw_opcion')
		if ll_sw=0 then
			ldb_precio_item	= dw_lista.getitemnumber(ll_indi_val,'cuenta_contable_otros_valor')
			ls_cod_otro_val		= dw_lista.getitemstring(ll_indi_val,'cuenta_contable_otros_codigo_otros')
			if isnull(ldb_precio_item) or ldb_precio_item=0 then
				ll_count_error ++
				messagebox("Advertencia","Debe Ingresar Monto en Fila "+string(ll_indi_val)+ " Codigo Item "+ls_cod_otro_val)
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi_val)
				dw_lista.setcolumn('cuenta_contable_otros_valor')
				exit
			end if
		end if
	next
	if ll_count_error = 0 then
		ll_res							= messagebox("Advertencia","Está Seguro crear Contrato de Servicio",Exclamation!,YesNo!,2)
		if ll_res=1 then
			ll_rut						= tab_1.tabpage_3.dw_cliente.getitemnumber(1,'rut')
			if ll_rut > 0 then
				ls_dv					= tab_1.tabpage_3.dw_cliente.getitemString(1,'dv')
				ls_nombre			= tab_1.tabpage_3.dw_cliente.getitemString(1,'nombre')
				ls_ap_paterno		= tab_1.tabpage_3.dw_cliente.getitemString(1,'ap_paterno')
				ls_ap_materno		= tab_1.tabpage_3.dw_cliente.getitemString(1,'ap_materno')
				ls_ciudad				= tab_1.tabpage_3.dw_cliente.getitemString(1,'ciudad')
				ls_comuna			= tab_1.tabpage_3.dw_cliente.getitemString(1,'comuna')
				ls_celular			= tab_1.tabpage_3.dw_cliente.getitemString(1,'celular')
				ls_tipo_via			= tab_1.tabpage_3.dw_cliente.getitemString(1,'tipo_via')
				ls_direccion_part	= tab_1.tabpage_3.dw_cliente.getitemString(1,'direccion_part')
				ls_nro_part			= tab_1.tabpage_3.dw_cliente.getitemString(1,'nro_part')
				ls_depto_part		= tab_1.tabpage_3.dw_cliente.getitemString(1,'depto_part')
				ls_block_part		= tab_1.tabpage_3.dw_cliente.getitemString(1,'block_part')
				ls_telefono_fijo		= tab_1.tabpage_3.dw_cliente.getitemString(1,'telefono_fijo')
				ls_fono_trabajo		= tab_1.tabpage_3.dw_cliente.getitemString(1,'telefono_trabajo')
				ls_correo				= tab_1.tabpage_3.dw_cliente.getitemString(1,'correo')
				if isnull(ls_depto_part) then 
					ls_depto_part	= '-'
					tab_1.tabpage_3.dw_cliente.setitem(1,'depto_part',ls_depto_part)
					tab_1.tabpage_3.dw_cliente.accepttext()
				end if
				if isnull(ls_block_part) then 
					ls_block_part	= '-'
					tab_1.tabpage_3.dw_cliente.setitem(1,'block_part',ls_depto_part)
					tab_1.tabpage_3.dw_cliente.accepttext()
				end if
				
				if isnull(ls_dv) and ls_dv<>'' then
					messagebox("Advertencia","Debe Ingresar Digito Verificador")
					tab_1.tabpage_3.dw_cliente.setfocus()
					tab_1.tabpage_3.dw_cliente.setcolumn('dv')
					ls_pasa_val	= 'N'
				elseif isnull(ls_nombre) and ls_nombre<>'' then
					messagebox("Advertencia","Debe Ingresar Nombre")
					tab_1.tabpage_3.dw_cliente.setfocus()
					tab_1.tabpage_3.dw_cliente.setcolumn('nombre')
					ls_pasa_val	= 'N'
				elseif isnull(ls_ap_paterno) and ls_ap_paterno<>'' then
					messagebox("Advertencia","Debe Ingresar Apellido Paterno")
					tab_1.tabpage_3.dw_cliente.setfocus()
					tab_1.tabpage_3.dw_cliente.setcolumn('ap_paterno')
					ls_pasa_val	= 'N'
				elseif isnull(ls_ap_materno) and ls_ap_materno<>'' then
					messagebox("Advertencia","Debe Ingresar Apellido Materno")
					tab_1.tabpage_3.dw_cliente.setfocus()
					tab_1.tabpage_3.dw_cliente.setcolumn('ap_materno')
					ls_pasa_val	= 'N'
					
				elseif isnull(ls_tipo_via) and ls_tipo_via<>'' then
					messagebox("Advertencia","Debe Ingresar Tipo Via")
					tab_1.tabpage_3.dw_cliente.setfocus()
					tab_1.tabpage_3.dw_cliente.setcolumn('tipo_via')
					ls_pasa_val	= 'N'
				elseif isnull(ls_direccion_part) and ls_direccion_part<>'' then
					messagebox("Advertencia","Debe Ingresar Dirección")
					tab_1.tabpage_3.dw_cliente.setfocus()
					tab_1.tabpage_3.dw_cliente.setcolumn('direccion_part')
					ls_pasa_val	= 'N'
				elseif isnull(ls_nro_part) and ls_nro_part<>'' then
					messagebox("Advertencia","Debe Ingresar Nro. Particular")
					tab_1.tabpage_3.dw_cliente.setfocus()
					tab_1.tabpage_3.dw_cliente.setcolumn('nro_part')
					ls_pasa_val	= 'N'
				elseif isnull(ls_depto_part) and ls_depto_part<>'' then
					messagebox("Advertencia","Debe Ingresar Depto.")
					tab_1.tabpage_3.dw_cliente.setfocus()
					tab_1.tabpage_3.dw_cliente.setcolumn('depto_part')
					ls_pasa_val	= 'N'
				elseif isnull(ls_block_part) and ls_block_part<>'' then
					messagebox("Advertencia","Debe Ingresar Block")
					tab_1.tabpage_3.dw_cliente.setfocus()
					tab_1.tabpage_3.dw_cliente.setcolumn('block_part')
					ls_pasa_val	= 'N'
					
				elseif isnull(ls_ciudad) and ls_ciudad<>'' then
					messagebox("Advertencia","Debe Ingresar Ciudad")
					tab_1.tabpage_3.dw_cliente.setfocus()
					tab_1.tabpage_3.dw_cliente.setcolumn('ciudad')
					ls_pasa_val	= 'N'
				elseif isnull(ls_comuna) and ls_comuna<>'' then
					messagebox("Advertencia","Debe Ingresar Comuna")
					tab_1.tabpage_3.dw_cliente.setfocus()
					tab_1.tabpage_3.dw_cliente.setcolumn('comuna')
					ls_pasa_val	= 'N'
				elseif isnull(ls_celular) and ls_celular<>'' then
					messagebox("Advertencia","Debe Ingresar Celular")
					tab_1.tabpage_3.dw_cliente.setfocus()
					tab_1.tabpage_3.dw_cliente.setcolumn('celular')
					ls_pasa_val	= 'N'
				else
					SELECT 	Count("CLIENTE"."NOMBRE" ) 
					INTO 		:ll_count_cliente  
					FROM 	"CLIENTE"  
					WHERE 	"CLIENTE"."RUT" = :ll_rut   ;
					if isnull(ll_count_cliente) then ll_count_cliente=0
					if ll_count_cliente = 0 then
						INSERT INTO "CLIENTE"  
									( "RUT", 		"TIPO",   	"NOMBRE",   	"A_PATERNO",   	"A_MATERNO",   	"DIRECCION_P",   		"POBLACION",   	"SECTOR",   	"COMUNA",   	"CIUDAD",   	"FONO_P",   		"FONO_C",   			"FECHA_INGR",   	"TOTAL_RENT",   	"GRUPO_F",   	"DV",   	"USUARIO",   	"ESTADO_TITULAR",   	"RUT_CONTACTO",   	"OTRAS_RENTAS",   	"AVALUO_AUTO",   	"AVALUO_CASA",   "NUMERO_PARTICULAR",   	"DEPTO_PARTICULAR",   	"BLOCK_PARTICULAR",   	"TIPO_VIA",   	"EMAIL",   	"CELULAR",   	"USO",   	"EMAIL_PAGADOR" )  	
						VALUES 	( :ll_rut,   	'V',   			:ls_nombre,   	:ls_ap_paterno,   	:ls_ap_materno,   	:ls_direccion_part,   	'-',   					'-',   				:ls_comuna,   	:ls_ciudad,	:ls_telefono_fijo,   :ls_fono_trabajo,   	:ldt_fecha_hoy,   	0,   					0,   				:ls_dv,   	:gs_user,   		'0',   							:ll_rut,   					0,   						0,   						0,   					:ls_nro_part,   					:ls_depto_part,   				:ls_block_part,   			:ls_tipo_via, 	:ls_correo,	:ls_celular,   	'NI',   		:ls_correo )  
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
							il_rut			= ll_rut
							is_dv			= is_dv
						else
							rollback;
							messagebox("Error Grabar","Error al Grabar Cliente Tercero INSERT Tabla CLIENTE, Error SQL "+sqlca.sqlerrtext)
						end if

					end if

				end if
			end if
			if ls_pasa_val = 'S' then
				//	Generar Correlativo V-V
				select 	id_contrato_servicio.nextval 
				into		:ll_numero
				from 		dual;
				ls_base					= 'V'
				if gs_conexion = "Parque El Prado" then
					ls_serie				= 'V'
				else
					ls_serie				= 'C'
				end if
				ls_tipo_cob_aux	= dw_lista.getitemstring(ll_fila_sw,'ficha_cuenta_contable_otros_tipo_cobro_aux')
				ll_codigo_servicio	= dw_lista.getitemnumber(ll_fila_sw,'producto_tipo_servicio_codigo_servicio')
				ls_tipo_cob			= dw_lista.getitemstring(ll_fila_sw,'cuenta_contable_otros_tipo_comprobante')
				ls_moneda			= '1'
				if il_parque = 1 then
					ll_cod_servicio 	= 337
					ls_cod_otro		= '420';
				elseif il_parque = 102 then
					ll_cod_servicio 	= 338
					ls_cod_otro 		= '421'
				elseif il_parque = 103 then
					ll_cod_servicio	= 340
					ls_cod_otro 		= '423'
				elseif il_parque = 101 then
					ll_cod_servicio	= 339
					ls_cod_otro 		= '422'
				elseif il_parque = 11 then
					ll_cod_servicio	= 341
					ls_cod_otro 		= '424'
				end if
				
				INSERT INTO "CS_DETALLE_PAGOS"  
								( "BASE",   	"SERIE",   	"NUMERO",   	"CODIGO_OTRO",   	"MONEDA",   	"MONTO",   		"MONTO_PESO",	"TIPO_COB",	"TIPO_COB_AUX",	"CODIGO_SERVICIO" )  
				VALUES 		( :ls_base,	:ls_serie,   	:ll_numero,   	:ls_cod_otro,   			:ls_moneda,   	1,   				1,						:ls_tipo_cob,	:ls_tipo_cob_aux,	:ll_codigo_servicio )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
					messagebox("Error Grabar","Error Grabar Detalle "+string(ll_indi)+' Codigo Pago '+ls_cod_otro+ ' Tabla: CS_DETALLE_PAGOS  Sql:'+sqlca.sqlerrtext)
				end if
				for ll_indi=1 to ll_tot_reg
					ll_sw					= dw_lista.getitemnumber(ll_indi,'sw_opcion')
					
					if ll_sw=0 then
						ls_cod_otro			= dw_lista.getitemstring(ll_indi,'cuenta_contable_otros_codigo_otros')
						lld_valor				= Double(dw_lista.getitemnumber(ll_indi,'cuenta_contable_otros_valor'))
						ls_tipo_cob			= dw_lista.getitemstring(ll_indi,'cuenta_contable_otros_tipo_comprobante')
						ls_tipo_cob_aux	= dw_lista.getitemstring(ll_indi,'ficha_cuenta_contable_otros_tipo_cobro_aux')
						ll_codigo_servicio	= dw_lista.getitemnumber(ll_indi,'producto_tipo_servicio_codigo_servicio')
						ll_cont_reg ++
						if lld_valor < 200 then
							ls_moneda		= '2'
							ll_valor_uf		= lld_valor
							ll_valor_peso	= round(lld_valor * gd_uf,0)
						else
							ls_moneda		= '1'
							ll_valor_uf		= lld_valor
							ll_valor_peso	= lld_valor
						end if
						ll_total_pago		= ll_total_pago + ll_valor_peso
						INSERT INTO "CS_DETALLE_PAGOS"  
										( "BASE",   	"SERIE",   	"NUMERO",   	"CODIGO_OTRO",   	"MONEDA",   	"MONTO",   		"MONTO_PESO",	"TIPO_COB",	"TIPO_COB_AUX",	"CODIGO_SERVICIO" )  
						VALUES 		( :ls_base,	:ls_serie,   	:ll_numero,   	:ls_cod_otro,   			:ls_moneda,   	:lld_valor,   		:ll_valor_peso,		:ls_tipo_cob,	:ls_tipo_cob_aux,	:ll_codigo_servicio )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
							messagebox("Error Grabar","Error Grabar Detalle "+string(ll_indi)+' Codigo Pago '+ls_cod_otro+ ' Tabla: CS_DETALLE_PAGOS  Sql:'+sqlca.sqlerrtext)
						end if
					end if
				next
				if ll_cont_reg > 0 then
					ll_total_pago			= dw_lista.getitemnumber(1,'c_total_a_pago')
					if il_parque = 1 then
						ll_cod_servicio 		= 337
					elseif il_parque = 102 then
						ll_cod_servicio 		= 338
					elseif il_parque = 103 then
						ll_cod_servicio		= 340
					elseif il_parque = 101 then
						ll_cod_servicio		= 339
					elseif il_parque = 11 then
						ll_cod_servicio		= 341
					end if
					INSERT INTO "CS_CABECERA"  
								( "BASE",   	"SERIE",   	"NUMERO",   	"ESTADO_CONTRATO",   	"BASE_ORIGINAL",   	"SERIE_ORIGINAL",   	"NUMERO_ORIGINAL",   	"RUT",   	"DV",   	"USUARIO",   	"TOTAL_PESOS",   	"FECHA_CREA",		"TIPO_COB",		"TIPO_COB_AUX",	"DEPTO_USUARIO",	"COD_PARQUE",	"CODIGO_SERVICIO",	"USO"	 )  
					VALUES 	( :ls_base,  	:ls_serie,  	:ll_numero,   	'V',   								:gs_base,   				:gs_serie,   				:gi_numero,   				:il_rut,	:is_dv,	:gs_user,   		:ll_total_pago,   		:gdt_fec_sistema,		:ls_tipo_cob,		:ls_tipo_cob_aux ,	:gs_depto,				:il_parque,			:ll_cod_servicio,		'NI')  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						if ll_rut > 0 then
							tab_1.tabpage_3.dw_cliente.setitem(1,'base',ls_base)
							tab_1.tabpage_3.dw_cliente.setitem(1,'serie',ls_serie)
							tab_1.tabpage_3.dw_cliente.setitem(1,'numero',ll_numero)
							tab_1.tabpage_3.dw_cliente.accepttext()
							if tab_1.tabpage_3.dw_cliente.update() = 1 then
								commit;
							else
								rollback;
							end if
						end if
						messagebox("Grabar","Grabación Exitosa, Se Genera Contrato de Servicio "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###,##0'))
						if tab_1.tabpage_1.dw_cttos.retrieve(gs_base,gs_serie,gi_numero) > 0 then
							ll_tot_reg_ctto			= tab_1.tabpage_1.dw_cttos.rowcount()
							ll_fila_ctto				= tab_1.tabpage_1.dw_cttos.Find("base='"+ls_base+"' and serie='"+ls_serie+"' and numero="+string(ll_numero), 1, ll_tot_reg_ctto)
							if ll_fila_ctto > 0 then
								tab_1.tabpage_1.dw_cttos.scrolltorow(ll_fila_ctto)
								tab_1.tabpage_1.dw_cttos_detalle.retrieve(ls_base,ls_serie,ll_numero)
							end if
						end if
						
					else
						rollback;
						messagebox("Error Grabar","Error Grabar Cabecera Tabla: CS_CABECERA  Sql: "+sqlca.sqlerrtext)
					end if
				end if
				cb_crear_serv.enabled			= false
				DECLARE SP_CS_CREAR_CONTRATO_SERVICIO PROCEDURE FOR SP_CS_CREAR_CONTRATO_SERVICIO( :ls_base, :ls_serie, :ll_numero);
				EXECUTE SP_CS_CREAR_CONTRATO_SERVICIO;
			end if
		end if
	end if
else
	messagebox("Advertencia","Es Necesario Seleccionar Item de Pago, para Generar CONTRATO DE SERVICIO")
end if
end event

type cb_3 from commandbutton within tabpage_2
integer x = 2729
integer y = 1524
integer width = 773
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar Contrato Servicio"
end type

event clicked;Double		idb_contrato_servicio

select 	id_contrato_servicio.nextval
into		:idb_contrato_servicio
from 		dual;
if isnull(idb_contrato_servicio) then idb_contrato_servicio=1

end event

type dw_3 from datawindow within tabpage_2
integer x = 256
integer y = 1524
integer width = 2395
integer height = 600
integer taborder = 20
string title = "none"
string dataobject = "dw_crear_contrato_de_servicio_basev"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	il_row			= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;il_row			= this.getrow()
IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

type st_2 from statictext within tabpage_2
integer x = 261
integer y = 1436
integer width = 1047
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Item(s) de Pago(s)"
boolean focusrectangle = false
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3328
integer height = 1436
long backcolor = 67108864
string text = "Cliente Tercero"
long tabtextcolor = 33554432
string picturename = "UserObject1!"
long picturemaskcolor = 536870912
st_1 st_1
dw_cliente dw_cliente
end type

on tabpage_3.create
this.st_1=create st_1
this.dw_cliente=create dw_cliente
this.Control[]={this.st_1,&
this.dw_cliente}
end on

on tabpage_3.destroy
destroy(this.st_1)
destroy(this.dw_cliente)
end on

type st_1 from statictext within tabpage_3
integer x = 46
integer y = 28
integer width = 1225
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cliente Tercero"
boolean focusrectangle = false
end type

type dw_cliente from datawindow within tabpage_3
integer x = 37
integer y = 108
integer width = 3250
integer height = 1168
integer taborder = 30
string title = "none"
string dataobject = "dw_cs_ingreso_cliente_tercero"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_ciudad, ls_null,ls_dv,ls_fono_p,ls_cel_p,ls_fono_c,ls_correo
Double	ll_rut
Long		ll_fono_p_largo,ll_largo_cel,ll_fono_c_largo

this.accepttext()
ll_rut		= dw_cliente.getitemnumber(1,'rut')
if ll_rut > 0 then
	SetNull(ls_null)
	ls_columna			= dwo.name
	CHOOSE CASE ls_columna
		CASE 'ciudad'
			ls_ciudad		= dw_cliente.getitemstring(1,'ciudad')
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle.retrieve(ls_ciudad)
			end if
			
		CASE 'dv','rut'
			ls_dv		= dw_cliente.getitemstring(1,'dv')
			ll_rut		= dw_cliente.getitemnumber(1,'rut')
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				messagebox('Error','El Rut no es Valido',stopsign!)
				dw_cliente.setitem(1,'dv',ls_null)
				dw_cliente.setfocus()
				dw_cliente.setcolumn('dv')
			else
				dw_cliente.setcolumn('nombre')
			end if
		CASE 'telefono_fijo'
			ls_fono_p					= dw_cliente.getitemstring(1,'telefono_fijo')
			if not isnull(ls_fono_p) and ls_fono_p<>'' and ls_fono_p<>'-' then
				ll_fono_p_largo			= len(ls_fono_p)
				if ll_fono_p_largo > 9 then
					messagebox('Advertencia','No puede Ingresar más de 9 Digitos')
					dw_cliente.setitem(1,'telefono_fijo',ls_null)
				elseif	ll_fono_p_largo < 9 then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos')
					dw_cliente.setitem(1,'telefono_fijo',ls_null)
				else
					if Match(ls_fono_p, "[A-Z]+") then
						messagebox('Advertencia','Solo debe Ingresar Números')
						dw_cliente.setitem(1,'telefono_fijo',ls_null)
					end if
				end if
			end if
		CASE 'celular'
			ls_cel_p			= dw_cliente.getitemstring(1,'celular')
			if not isnull(ls_cel_p) and ls_cel_p<>'' and ls_cel_p<>'-' then
				ll_largo_cel	= len(ls_cel_p)
				if ll_largo_cel >9  then
					messagebox('Advertencia','No puede Ingresar más de 9 Digitos')
					dw_cliente.setitem(1,'celular',ls_null)
				elseif	ll_largo_cel < 9 then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos')
					dw_cliente.setitem(1,'celular',ls_null)
				else
					if Match(ls_cel_p, "[A-Z]+") then
						messagebox('Advertencia','Solo debe Ingresar Números')
						dw_cliente.setitem(1,'celular',ls_null)
					end if
				end if
			end if
		CASE 'telefono_trabajo'
			ls_fono_c		= dw_cliente.getitemstring(1,'telefono_trabajo')
			if not isnull(ls_fono_c) and ls_fono_c<>'' and ls_fono_c<>'-' then
				ll_fono_c_largo	= len(ls_fono_c)
				if ll_fono_c_largo >9  then
					messagebox('Advertencia','No puede Ingresar más de 9 Digitos')
					dw_cliente.setitem(1,'telefono_trabajo',ls_null)
				elseif	ll_fono_c_largo < 9 then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos')
					dw_cliente.setitem(1,'telefono_trabajo',ls_null)
				else
					if Match(ls_fono_c, "[A-Z]+") then
						messagebox('Advertencia','Solo debe Ingresar Números')
						dw_cliente.setitem(1,'telefono_trabajo',ls_null)
					end if
				end if
			end if	
		CASE 'correo'
			ls_correo				= dw_cliente.getitemstring(1,'correo')
			if ls_correo <> '' and ls_correo <> '-' then
				if Match(ls_correo, "@") then
				else
					messagebox('Error','Correo Electrónico No es Válido',stopsign!)
					dw_cliente.setitem(1,'correo',ls_null)
					dw_cliente.accepttext()
					dw_cliente.setfocus()
					dw_cliente.setcolumn('correo')
				end if	
			end if	
	END CHOOSE
end if
end event

event itemfocuschanged;String		ls_columna,ls_ciudad, ls_null,ls_dv,ls_fono_p,ls_cel_p,ls_fono_c,ls_correo
Double	ll_rut
Long		ll_fono_p_largo,ll_largo_cel,ll_fono_c_largo

this.accepttext()
ll_rut		= dw_cliente.getitemnumber(1,'rut')
if ll_rut > 0 then
	SetNull(ls_null)
	ls_dv		= dw_cliente.getitemstring(1,'dv')
	ll_rut		= dw_cliente.getitemnumber(1,'rut')
	if ll_rut > 0 and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			dw_cliente.setitem(1,'dv',ls_null)
			dw_cliente.setfocus()
			dw_cliente.setcolumn('dv')
		end if
	end if
	ls_fono_p					= dw_cliente.getitemstring(1,'telefono_fijo')
	if not isnull(ls_fono_p) and ls_fono_p<>'' and ls_fono_p<>'-' then
		ll_fono_p_largo			= len(ls_fono_p)
		if ll_fono_p_largo > 9 then
			dw_cliente.setitem(1,'telefono_fijo',ls_null)
			dw_cliente.accepttext()
			dw_cliente.setcolumn('telefono_fijo')
		elseif	ll_fono_p_largo < 9 then
			dw_cliente.setitem(1,'telefono_fijo',ls_null)
			dw_cliente.accepttext()
			dw_cliente.setcolumn('telefono_fijo')
		else
			if Match(ls_fono_p, "[A-Z]+") then
				dw_cliente.setitem(1,'telefono_fijo',ls_null)
				dw_cliente.accepttext()
				dw_cliente.setcolumn('telefono_fijo')
			end if
		end if
	end if
	ls_cel_p			= dw_cliente.getitemstring(1,'celular')
	if not isnull(ls_cel_p) and ls_cel_p<>'' and ls_cel_p<>'-' then
		ll_largo_cel	= len(ls_cel_p)
		if ll_largo_cel >9  then
			dw_cliente.setitem(1,'celular',ls_null)
			dw_cliente.accepttext()
			dw_cliente.setcolumn('celular')
		elseif	ll_largo_cel < 9 then
			dw_cliente.setitem(1,'celular',ls_null)
			dw_cliente.accepttext()
			dw_cliente.setcolumn('celular')
		else
			if Match(ls_cel_p, "[A-Z]+") then
				dw_cliente.setitem(1,'celular',ls_null)
				dw_cliente.accepttext()
				dw_cliente.setcolumn('celular')
			end if
		end if
	end if

	ls_fono_c		= dw_cliente.getitemstring(1,'telefono_trabajo')
	if not isnull(ls_fono_c) and ls_fono_c<>'' and ls_fono_c<>'-' then
		ll_fono_c_largo	= len(ls_fono_c)
		if ll_fono_c_largo >9  then
//				messagebox('Advertencia','No puede Ingresar más de 9 Digitos')
			dw_cliente.setitem(1,'telefono_trabajo',ls_null)
			dw_cliente.accepttext()
			dw_cliente.setcolumn('telefono_trabajo')
		elseif	ll_fono_c_largo < 9 then
//				messagebox('Advertencia','No puede Ingresar menos de 9 Digitos')
			dw_cliente.setitem(1,'telefono_trabajo',ls_null)
			dw_cliente.accepttext()
			dw_cliente.setcolumn('telefono_trabajo')
		else
			if Match(ls_fono_c, "[A-Z]+") then
//					messagebox('Advertencia','Solo debe Ingresar Números')
				dw_cliente.setitem(1,'telefono_trabajo',ls_null)
				dw_cliente.accepttext()
				dw_cliente.setcolumn('telefono_trabajo')
			end if
		end if
	end if	

	ls_correo				= dw_cliente.getitemstring(1,'correo')
	if not isnull(ls_correo) and ls_correo <> '' and ls_correo <> '-' then
		if Match(ls_correo, "@") then
		else
//				messagebox('Error','Correo Electrónico No es Válido',stopsign!)
			dw_cliente.setitem(1,'correo',ls_null)
			dw_cliente.accepttext()
			dw_cliente.setfocus()
			dw_cliente.setcolumn('correo')
		end if	
	end if	

end if
end event

type cb_cerrar from commandbutton within w_crear_contrato_de_servicio_basev_bkp
integer x = 3090
integer y = 1636
integer width = 311
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_crear_contrato_de_servicio_basev)
end event

