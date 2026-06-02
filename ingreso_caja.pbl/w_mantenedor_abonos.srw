forward
global type w_mantenedor_abonos from window
end type
type cb_1 from commandbutton within w_mantenedor_abonos
end type
type cb_grabar from commandbutton within w_mantenedor_abonos
end type
type cb_eliminar from commandbutton within w_mantenedor_abonos
end type
type cb_nuevo from commandbutton within w_mantenedor_abonos
end type
type cb_ordenar from commandbutton within w_mantenedor_abonos
end type
type cb_filtrar from commandbutton within w_mantenedor_abonos
end type
type cb_exportar from commandbutton within w_mantenedor_abonos
end type
type cb_imprimir from commandbutton within w_mantenedor_abonos
end type
type cb_ver_cuenta from commandbutton within w_mantenedor_abonos
end type
type cb_cerrar from commandbutton within w_mantenedor_abonos
end type
type dw_lista from datawindow within w_mantenedor_abonos
end type
type gb_1 from groupbox within w_mantenedor_abonos
end type
end forward

global type w_mantenedor_abonos from window
integer width = 3785
integer height = 2028
boolean titlebar = true
string title = "Mantenedor de Ingreso - Abonos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
cb_grabar cb_grabar
cb_eliminar cb_eliminar
cb_nuevo cb_nuevo
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_ver_cuenta cb_ver_cuenta
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_mantenedor_abonos w_mantenedor_abonos

type variables
Long	il_row
end variables

on w_mantenedor_abonos.create
this.cb_1=create cb_1
this.cb_grabar=create cb_grabar
this.cb_eliminar=create cb_eliminar
this.cb_nuevo=create cb_nuevo
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_ver_cuenta=create cb_ver_cuenta
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.cb_grabar,&
this.cb_eliminar,&
this.cb_nuevo,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_ver_cuenta,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_mantenedor_abonos.destroy
destroy(this.cb_1)
destroy(this.cb_grabar)
destroy(this.cb_eliminar)
destroy(this.cb_nuevo)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_ver_cuenta)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long	ll_tot_reg,ll_indi
gf_centrar(w_mantenedor_abonos)
dw_lista.settransobject(sqlca)
ll_tot_reg	= dw_lista.retrieve(gs_base,gs_serie,gi_numero)
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_mantenedor_abonos)
else
	for ll_indi=1 to ll_tot_reg
		dw_lista.setitem(ll_indi,'c_estado_reg',1)
	next
	dw_lista.accepttext()
end if
end event

type cb_1 from commandbutton within w_mantenedor_abonos
integer x = 1559
integer y = 1752
integer width = 265
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

type cb_grabar from commandbutton within w_mantenedor_abonos
integer x = 576
integer y = 1752
integer width = 265
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_tot_reg, ll_indi,ll_rut,ll_monto,ll_folio,ll_folio_oc,ll_monto_oc
String	ls_base,ls_serie,ls_estado,ls_tipo_cob,ls_tipo_cob_oc,ls_pasa
datetime	ldt_fecha_crea,ldt_fecha_oc
Double	ll_numero

dw_lista.accepttext()
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg > 0 then
	ls_pasa				= 'S'
	for ll_indi=1 to ll_tot_reg
		ls_tipo_cob		= dw_lista.getitemstring(ll_indi,'abono_cta_cte_tipo_cob')
		ll_folio			= dw_lista.getitemnumber(ll_indi,'abono_cta_cte_folio')
		ll_monto			= dw_lista.getitemnumber(ll_indi,'abono_cta_cte_monto')		
		ll_rut			= dw_lista.getitemnumber(ll_indi,'abono_cta_cte_rut')
		ldt_fecha_crea	= dw_lista.getitemdatetime(ll_indi,'abono_cta_cte_fecha_crea')
		ls_estado		= dw_lista.getitemstring(ll_indi,'abono_cta_cte_estado_reg')		
		ls_tipo_cob_oc	= dw_lista.getitemstring(ll_indi,'tipo_cob_ocupa')
		ll_folio_oc		= dw_lista.getitemnumber(ll_indi,'folio_ocupa')
		ldt_fecha_oc	= dw_lista.getitemdatetime(ll_indi,'fecha_ocupa')
		ll_monto_oc		= dw_lista.getitemnumber(ll_indi,'monto_ocupa')
		ls_base			= dw_lista.getitemstring(ll_indi,'abono_cta_cte_base')
		ls_serie			= dw_lista.getitemstring(ll_indi,'abono_cta_cte_serie')
		ll_numero		= dw_lista.getitemnumber(ll_indi,'abono_cta_cte_numero')
		if isnull(ls_tipo_cob) or ls_tipo_cob='' then
			messagebox("Adveertencia","Debe Ingresar Tipo Cobro (INGRESO)")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_tipo_cob')
			ls_pasa		= 'N'
			exit
		elseif isnull(ll_folio) or ll_folio=0 then
			messagebox("Adveertencia","Debe Ingresar Folio (INGRESO)")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_folio')
			ls_pasa		= 'N'
			exit
		elseif isnull(ll_monto) or ll_monto=0 then
			messagebox("Adveertencia","Debe Ingresar Monto (INGRESO)")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_monto')
			ls_pasa		= 'N'
			exit
		elseif isnull(ll_rut) or ll_rut=0 then
			messagebox("Adveertencia","Debe Ingresar Rut Cliente (INGRESO)")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_rut')
			ls_pasa		= 'N'
			exit
		elseif isnull(ldt_fecha_crea) then
			messagebox("Adveertencia","Debe Ingresar Fecha Creación (INGRESO)")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_fecha_crea')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_estado) or ls_estado='' then
			messagebox("Adveertencia","Debe Ingresar Estado Abono")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_estado_reg')
			ls_pasa		= 'N'
			exit
		elseif (isnull(ls_tipo_cob_oc) or ls_tipo_cob_oc='') and ls_estado='O' then
			messagebox("Adveertencia","Debe Ingresar Tipo Cobro (PAGOS)")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('tipo_cob_ocupa')
			ls_pasa		= 'N'
			exit
		elseif (isnull(ll_folio_oc) or ll_folio_oc=0) and ls_estado='O' then
			messagebox("Adveertencia","Debe Ingresar Folio (PAGOS)")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('folio_ocupa')
			ls_pasa		= 'N'
			exit
		elseif isnull(ldt_fecha_oc) and ls_estado='O' then
			messagebox("Adveertencia","Debe Ingresar Fecha (PAGOS)")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('fecha_ocupa')
			ls_pasa		= 'N'
			exit
		elseif (isnull(ll_monto_oc) or ll_monto_oc=0) and ls_estado='O' then
			messagebox("Adveertencia","Debe Ingresar Monto (PAGOS)")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('monto_ocupa')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_base) or ls_base='' then
			messagebox("Adveertencia","Debe Ingresar Base Contrato")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_base')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_serie) or ls_serie='' then
			messagebox("Adveertencia","Debe Ingresar Serie Contrato")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_serie')
			ls_pasa		= 'N'
			exit
		elseif isnull(ll_numero) or ll_numero=0 then
			messagebox("Adveertencia","Debe Ingresar Número Contrato")
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_numero')
			ls_pasa		= 'N'
			exit
		end if
	next
	if ls_pasa='S' then
		if dw_lista.update() = 1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_eliminar from commandbutton within w_mantenedor_abonos
integer x = 1202
integer y = 1752
integer width = 265
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_res,ll_numero,ll_folio_ing
String	ls_base,ls_serie,ls_tipo_cob,ls_estado,ls_estado_desc

dw_lista.accepttext()
if il_row > 0 then
	ls_base				= dw_lista.getitemstring(il_row,'abono_cta_cte_base')
	ls_serie				= dw_lista.getitemstring(il_row,'abono_cta_cte_serie')
	ll_numero			= dw_lista.getitemnumber(il_row,'abono_cta_cte_numero')
	ls_tipo_cob			= dw_lista.getitemstring(il_row,'abono_cta_cte_tipo_cob')
	ll_folio_ing		= dw_lista.getitemnumber(il_row,'abono_cta_cte_folio')
	ls_estado			= dw_lista.getitemstring(il_row,'abono_cta_cte_estado_reg')
	if ls_estado='O' then
		ls_estado_desc	= 'Ocupado'
	elseif ls_estado='P' then
		ls_estado_desc	= 'Pendiente'
	end if
	ll_res				= messagebox("Eliminar","Está Seguro de Eliminar Fila Nº "+string(il_row,'###,###,###,###,###,##0')+" Comprobante Nº: "+ls_tipo_cob+'-'+string(ll_folio_ing,'##############0')+', se encuenta en Estado: '+ls_estado+'-'+ls_estado_desc+' del Contrato Nº: '+ls_base+'-'+ls_serie+'-'+string("###,###,###,###,##0"),Exclamation!,YesNo!,2)
	if ll_res=1 then
		dw_lista.deleterow(il_row)
		messagebox("Eliminación","Recuerde Grabar los Cambios antes de Salir")
	end if
end if
end event

type cb_nuevo from commandbutton within w_mantenedor_abonos
integer x = 933
integer y = 1752
integer width = 265
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;Long		ll_tot_reg, ll_indi,ll_rut,ll_monto,ll_folio,ll_folio_oc,ll_monto_oc,ll_new
String	ls_base,ls_serie,ls_estado,ls_tipo_cob,ls_tipo_cob_oc,ls_pasa
datetime	ldt_fecha_crea,ldt_fecha_oc
Double	ll_numero
dw_lista.accepttext()
select sysdate into :gdt_fec_sistema from "TASA" where "TASA"."LOOK" = 1;
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg > 0 then
	ls_pasa				= 'S'
	for ll_indi=1 to ll_tot_reg
		ls_tipo_cob		= dw_lista.getitemstring(ll_indi,'abono_cta_cte_tipo_cob')
		ll_folio			= dw_lista.getitemnumber(ll_indi,'abono_cta_cte_folio')
		ll_monto			= dw_lista.getitemnumber(ll_indi,'abono_cta_cte_monto')		
		ll_rut			= dw_lista.getitemnumber(ll_indi,'abono_cta_cte_rut')
		ldt_fecha_crea	= dw_lista.getitemdatetime(ll_indi,'abono_cta_cte_fecha_crea')
		ls_estado		= dw_lista.getitemstring(ll_indi,'abono_cta_cte_estado_reg')		
		ls_tipo_cob_oc	= dw_lista.getitemstring(ll_indi,'tipo_cob_ocupa')
		ll_folio_oc		= dw_lista.getitemnumber(ll_indi,'folio_ocupa')
		ldt_fecha_oc	= dw_lista.getitemdatetime(ll_indi,'fecha_ocupa')
		ll_monto_oc		= dw_lista.getitemnumber(ll_indi,'monto_ocupa')
		ls_base			= dw_lista.getitemstring(ll_indi,'abono_cta_cte_base')
		ls_serie			= dw_lista.getitemstring(ll_indi,'abono_cta_cte_serie')
		ll_numero		= dw_lista.getitemnumber(ll_indi,'abono_cta_cte_numero')
		if isnull(ls_tipo_cob) or ls_tipo_cob='' then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Tipo Cobro (INGRESO) en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_tipo_cob')
			ls_pasa		= 'N'
			exit
		elseif isnull(ll_folio) or ll_folio=0 then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Folio (INGRESO) en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_folio')
			ls_pasa		= 'N'
			exit
		elseif isnull(ll_monto) or ll_monto=0 then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Monto (INGRESO) en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_monto')
			ls_pasa		= 'N'
			exit
		elseif isnull(ll_rut) or ll_rut=0 then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Rut Cliente (INGRESO) en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_rut')
			ls_pasa		= 'N'
			exit
		elseif isnull(ldt_fecha_crea) then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Fecha Creación (INGRESO) en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_fecha_crea')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_estado) or ls_estado='' then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Estado Abono en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_estado_reg')
			ls_pasa		= 'N'
			exit
		elseif (isnull(ls_tipo_cob_oc) or ls_tipo_cob_oc='') and ls_estado='O' then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Tipo Cobro (PAGOS) en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('tipo_cob_ocupa')
			ls_pasa		= 'N'
			exit
		elseif (isnull(ll_folio_oc) or ll_folio_oc=0) and ls_estado='O' then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Folio (PAGOS) en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('folio_ocupa')
			ls_pasa		= 'N'
			exit
		elseif isnull(ldt_fecha_oc) and ls_estado='O' then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Fecha (PAGOS) en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('fecha_ocupa')
			ls_pasa		= 'N'
			exit
		elseif (isnull(ll_monto_oc) or ll_monto_oc=0) and ls_estado='O' then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Monto (PAGOS) en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('monto_ocupa')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_base) or ls_base='' then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Base Contrato en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_base')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_serie) or ls_serie='' then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Serie Contrato en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_serie')
			ls_pasa		= 'N'
			exit
		elseif isnull(ll_numero) or ll_numero=0 then
			messagebox("Adveertencia","No es posible Ingresar Nuevo Registro, debe Ingresar Número Contrato en Fila Nº "+string(ll_indi,'###,###,###,###,###'))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('abono_cta_cte_numero')
			ls_pasa		= 'N'
			exit
		end if
	next
	if ls_pasa='S' then
		ll_new	= dw_lista.insertrow(0)
		dw_lista.scrolltorow(ll_new)
		dw_lista.setitem(ll_new,'abono_cta_cte_base',gs_base)
		dw_lista.setitem(ll_new,'abono_cta_cte_serie',gs_serie)
		dw_lista.setitem(ll_new,'abono_cta_cte_numero',gi_numero)
		dw_lista.setitem(ll_new,'abono_cta_cte_fecha_crea',gdt_fec_sistema)
		dw_lista.setcolumn('abono_cta_cte_tipo_cob')
		dw_lista.setfocus()
	end if
end if
end event

type cb_ordenar from commandbutton within w_mantenedor_abonos
event ue_mousemove pbm_dwnmousemove
integer x = 2167
integer y = 1760
integer width = 247
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_filtrar from commandbutton within w_mantenedor_abonos
event ue_mousemove pbm_mousemove
integer x = 2418
integer y = 1760
integer width = 247
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_exportar from commandbutton within w_mantenedor_abonos
event ue_mousemove pbm_mousemove
integer x = 2670
integer y = 1760
integer width = 247
integer height = 92
integer taborder = 90
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

type cb_imprimir from commandbutton within w_mantenedor_abonos
event ue_mousemove pbm_mousemove
integer x = 2962
integer y = 1760
integer width = 247
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_ver_cuenta from commandbutton within w_mantenedor_abonos
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1752
integer width = 443
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.accepttext()
	gs_base		= dw_lista.getitemstring(il_row,'abono_cta_cte_base')
	gs_serie		= dw_lista.getitemstring(il_row,'abono_cta_cte_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'abono_cta_cte_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'abono_cta_cte_rut')
	IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" // Derecho
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	END IF
end if
end event

type cb_cerrar from commandbutton within w_mantenedor_abonos
integer x = 3419
integer y = 1752
integer width = 311
integer height = 104
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mantenedor_abonos)
end event

type dw_lista from datawindow within w_mantenedor_abonos
integer x = 32
integer y = 36
integer width = 3698
integer height = 1660
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_abonos_no_existentes_ingreso"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_string

ls_columna	= dwo.name
if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
else
	if ls_columna='t_todo' then
		ls_string	= ""
	elseif ls_columna='t_rojo' or ls_columna='t_rojo_txt' then
		ls_string	= "abono_cta_cte_estado_reg = 'O'"
	elseif ls_columna='t_blanco' or ls_columna='t_blanco_txt' then
		ls_string	= "abono_cta_cte_estado_reg = 'P'"
	end if
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type gb_1 from groupbox within w_mantenedor_abonos
event ue_mousemove pbm_mousemove
integer x = 2144
integer y = 1708
integer width = 1088
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

