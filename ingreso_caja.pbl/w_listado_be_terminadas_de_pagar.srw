forward
global type w_listado_be_terminadas_de_pagar from window
end type
type cb_ctacte from commandbutton within w_listado_be_terminadas_de_pagar
end type
type cb_limpiar from commandbutton within w_listado_be_terminadas_de_pagar
end type
type cb_1 from commandbutton within w_listado_be_terminadas_de_pagar
end type
type cb_2 from commandbutton within w_listado_be_terminadas_de_pagar
end type
type cb_3 from commandbutton within w_listado_be_terminadas_de_pagar
end type
type cb_imprimir from commandbutton within w_listado_be_terminadas_de_pagar
end type
type pb_ok from picturebutton within w_listado_be_terminadas_de_pagar
end type
type dw_fecha from datawindow within w_listado_be_terminadas_de_pagar
end type
type cb_cerrar from commandbutton within w_listado_be_terminadas_de_pagar
end type
type dw_lista from datawindow within w_listado_be_terminadas_de_pagar
end type
type gb_1 from groupbox within w_listado_be_terminadas_de_pagar
end type
end forward

global type w_listado_be_terminadas_de_pagar from window
integer width = 4544
integer height = 1840
boolean titlebar = true
string title = "Listado BE Terminadas de Pagar"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_ctacte cb_ctacte
cb_limpiar cb_limpiar
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
pb_ok pb_ok
dw_fecha dw_fecha
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_listado_be_terminadas_de_pagar w_listado_be_terminadas_de_pagar

type variables
String		is_rut_empresa, is_opcion
end variables

on w_listado_be_terminadas_de_pagar.create
this.cb_ctacte=create cb_ctacte
this.cb_limpiar=create cb_limpiar
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.pb_ok=create pb_ok
this.dw_fecha=create dw_fecha
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_ctacte,&
this.cb_limpiar,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.pb_ok,&
this.dw_fecha,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_listado_be_terminadas_de_pagar.destroy
destroy(this.cb_ctacte)
destroy(this.cb_limpiar)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.pb_ok)
destroy(this.dw_fecha)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long		ll_new

gf_centrar(w_listado_be_terminadas_de_pagar)
is_opcion													= Message.StringParm
if is_opcion='G' then
	cb_ctacte.visible									= true
	dw_fecha.dataobject								= 'dwe_fecha_cierre_be_terminadas_pagar'
	dw_fecha.settransobject(sqlca)
	w_listado_be_terminadas_de_pagar.title		= 'Listado BE Terminadas de Pagar'
	if gs_conexion = "Parque El Prado" then
		SELECT 	"MEMBRETE_EMPRESA"."STRING_RUT"  
		INTO 		:is_rut_empresa  
		FROM 	"MEMBRETE_EMPRESA"  
		WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = 1   ;
	else
		SELECT 	"MEMBRETE_EMPRESA"."STRING_RUT"  
		INTO 		:is_rut_empresa  
		FROM 	"MEMBRETE_EMPRESA"  
		WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = 11   ;
	end if
	dw_lista.dataobject								= 'dw_listado_terminadas_de_pagar_be'
	dw_lista.settransobject(sqlca)
	dw_fecha.settransobject(sqlca)
	dw_fecha.getchild('fecha_cierre',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.retrieve(is_rut_empresa)
	if idw_detalle.rowcount()=0 then
		idw_detalle.insertrow(0)
	end if
	dw_fecha.insertrow(0)
else
	cb_ctacte.visible									= false
	dw_fecha.dataobject								= 'dwe_contrato_be_terminadas_pagar'
	dw_fecha.settransobject(sqlca)
	ll_new												= dw_fecha.insertrow(0)
	w_listado_be_terminadas_de_pagar.title		= 'BE Emitida por Termino de Crédito'
	dw_fecha.setitem(ll_new,'base',gs_base)
	dw_fecha.setitem(ll_new,'serie',gs_serie)
	dw_fecha.setitem(ll_new,'numero',gi_numero)
	dw_lista.dataobject								= 'dw_terminadas_de_pagar_be_por_ctto'
	dw_lista.settransobject(sqlca)
	if dw_lista.retrieve(gs_base,gs_serie,gi_numero) = 0 then
		messagebox("Advertencia","No Registra Dato")
		close(w_listado_be_terminadas_de_pagar)
	end if
end if
end event

type cb_ctacte from commandbutton within w_listado_be_terminadas_de_pagar
integer x = 1646
integer y = 1588
integer width = 416
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;Long		ll_fila

ll_fila				= dw_lista.getrow()
if ll_fila > 0 then
	gs_base		= dw_lista.getitemstring(ll_fila,'base')
	gs_serie		= dw_lista.getitemstring(ll_fila,'serie')
	gi_numero	= dw_lista.getitemnumber(ll_fila,'numero')
	IF not isnull(gs_base) and not isnull(gs_serie) and gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
				w_cuenta_corriente_oferta.setfocus()
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
				w_cuenta_corriente_liberador.setfocus()
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
				w_cuenta_corriente_pagare.setfocus()
			CASE "C" // Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
				w_cuenta_corriente_contrato_isa.setfocus()
			CASE "D" // Derecho
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
				w_cuenta_corriente_derecho.setfocus()
			CASE "R" // Derecho
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
				w_cuenta_corriente_repactar_cta_mant.setfocus()
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
				w_cuenta_corriente_aumento_capacidad.setfocus()
			CASE "F","G" // Funeraria
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				Open(w_cuenta_corriente_funeraria)
				w_cuenta_corriente_funeraria.setfocus()
		END CHOOSE
	END IF
end if
end event

type cb_limpiar from commandbutton within w_listado_be_terminadas_de_pagar
integer x = 1097
integer y = 1580
integer width = 233
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;if gs_conexion = "Parque El Prado" then
	SELECT 	"MEMBRETE_EMPRESA"."STRING_RUT"  
	INTO 		:is_rut_empresa  
	FROM 	"MEMBRETE_EMPRESA"  
	WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = 1   ;
else
	SELECT 	"MEMBRETE_EMPRESA"."STRING_RUT"  
	INTO 		:is_rut_empresa  
	FROM 	"MEMBRETE_EMPRESA"  
	WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = 11   ;
end if
dw_lista.reset()
dw_fecha.reset()
dw_fecha.settransobject(sqlca)
dw_fecha.getchild('fecha_cierre',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve(is_rut_empresa)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_fecha.insertrow(0)

end event

type cb_1 from commandbutton within w_listado_be_terminadas_de_pagar
integer x = 64
integer y = 1580
integer width = 233
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_lista.rowcount()>0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_2 from commandbutton within w_listado_be_terminadas_de_pagar
integer x = 526
integer y = 1580
integer width = 233
integer height = 100
integer taborder = 60
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

type cb_3 from commandbutton within w_listado_be_terminadas_de_pagar
integer x = 297
integer y = 1580
integer width = 233
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtro"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_imprimir from commandbutton within w_listado_be_terminadas_de_pagar
integer x = 759
integer y = 1580
integer width = 233
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.print()
end if
end event

type pb_ok from picturebutton within w_listado_be_terminadas_de_pagar
integer x = 983
integer y = 12
integer width = 178
integer height = 156
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
string disabledname = "ok.bmp"
alignment htextalign = left!
end type

event clicked;datetime		ldt_fecha

dw_lista.reset()
if is_opcion='G' then
	if not isnull(ldt_fecha) then
		ldt_fecha			= dw_fecha.getitemdatetime(1,'fecha_cierre')
		if dw_lista.retrieve(ldt_fecha,is_rut_empresa) = 0 then
			messagebox("Advertencia","Fecha Cierre "+string(ldt_fecha,'dd/mm/yyyy')+ " No Registra Dato")
		end if
	end if
elseif is_opcion='I' then
	if dw_lista.retrieve(gs_base,gs_serie, gi_numero) = 0 then
		messagebox("Advertencia","Contrato "+gs_base+gs_serie+string(gi_numero)+ " No Registra Dato")
	end if
end if
end event

type dw_fecha from datawindow within w_listado_be_terminadas_de_pagar
integer x = 50
integer y = 44
integer width = 901
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "dwe_contrato_be_terminadas_pagar"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Datetime		ldt_fecha

dw_lista.reset()
dw_fecha.accepttext()
if dw_fecha.dataobject = 'dwe_fecha_cierre_be_terminadas_pagar' then
	ldt_fecha			= dw_fecha.getitemdatetime(1,'fecha_cierre')
	if not isnull(ldt_fecha) then pb_ok.triggerevent(clicked!)
elseif dw_fecha.dataobject = 'dwe_contrato_be_terminadas_pagar' then
	if not isnull(gs_base) and not isnull(gs_serie) and gi_numero > 0 then pb_ok.triggerevent(clicked!)
end if
end event

type cb_cerrar from commandbutton within w_listado_be_terminadas_de_pagar
integer x = 4123
integer y = 1576
integer width = 325
integer height = 108
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_listado_be_terminadas_de_pagar)
end event

type dw_lista from datawindow within w_listado_be_terminadas_de_pagar
integer x = 41
integer y = 208
integer width = 4407
integer height = 1324
integer taborder = 30
string title = "none"
string dataobject = "dw_listado_terminadas_de_pagar_be"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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

type gb_1 from groupbox within w_listado_be_terminadas_de_pagar
integer x = 41
integer y = 1528
integer width = 974
integer height = 176
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

