forward
global type uo_cobranza_postventa from tab
end type
type tabpage_1 from userobject within uo_cobranza_postventa
end type
type dw_cliente from datawindow within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type dw_contrato from datawindow within tabpage_1
end type
type cb_cerrar_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within uo_cobranza_postventa
dw_cliente dw_cliente
st_4 st_4
dw_contrato dw_contrato
cb_cerrar_1 cb_cerrar_1
end type
type tabpage_2 from userobject within uo_cobranza_postventa
end type
type cb_cerrar_2 from commandbutton within tabpage_2
end type
type st_5 from statictext within tabpage_2
end type
type dw_publico from datawindow within tabpage_2
end type
type st_2 from statictext within tabpage_2
end type
type dw_carta from datawindow within tabpage_2
end type
type st_1 from statictext within tabpage_2
end type
type dw_cobranza from datawindow within tabpage_2
end type
type tabpage_2 from userobject within uo_cobranza_postventa
cb_cerrar_2 cb_cerrar_2
st_5 st_5
dw_publico dw_publico
st_2 st_2
dw_carta dw_carta
st_1 st_1
dw_cobranza dw_cobranza
end type
type tabpage_3 from userobject within uo_cobranza_postventa
end type
type dw_boton_cerrar from datawindow within tabpage_3
end type
type st_8 from statictext within tabpage_3
end type
type dw_detalle_mantencion from datawindow within tabpage_3
end type
type st_7 from statictext within tabpage_3
end type
type dw_detalle_cuotas from datawindow within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type dw_detalle_pagos from datawindow within tabpage_3
end type
type st_6 from statictext within tabpage_3
end type
type dw_detalle_total from datawindow within tabpage_3
end type
type tabpage_3 from userobject within uo_cobranza_postventa
dw_boton_cerrar dw_boton_cerrar
st_8 st_8
dw_detalle_mantencion dw_detalle_mantencion
st_7 st_7
dw_detalle_cuotas dw_detalle_cuotas
st_3 st_3
dw_detalle_pagos dw_detalle_pagos
st_6 st_6
dw_detalle_total dw_detalle_total
end type
type tabpage_4 from userobject within uo_cobranza_postventa
end type
type st_9 from statictext within tabpage_4
end type
type dw_ingreso from datawindow within tabpage_4
end type
type dw_cliente2 from datawindow within tabpage_4
end type
type cb_grabar from commandbutton within tabpage_4
end type
type dw_ultima_cobranza_telefonica from datawindow within tabpage_4
end type
type cb_cerrar_4 from commandbutton within tabpage_4
end type
type tabpage_4 from userobject within uo_cobranza_postventa
st_9 st_9
dw_ingreso dw_ingreso
dw_cliente2 dw_cliente2
cb_grabar cb_grabar
dw_ultima_cobranza_telefonica dw_ultima_cobranza_telefonica
cb_cerrar_4 cb_cerrar_4
end type
end forward

global type uo_cobranza_postventa from tab
integer width = 2528
integer height = 1588
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean showpicture = false
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
global uo_cobranza_postventa uo_cobranza_postventa

type variables
long	il_fila
end variables

forward prototypes
public subroutine wf_pos_promesa ()
public subroutine wf_pos_otros_cttos ()
public subroutine wf_pos_contrato_isa ()
end prototypes

public subroutine wf_pos_promesa ();tabpage_3.st_6.x									= 27
tabpage_3.st_6.y									= 4
tabpage_3.st_6.width								= 850
tabpage_3.st_6.height							= 56
tabpage_3.dw_detalle_total.x					= 18
tabpage_3.dw_detalle_total.y					= 60
tabpage_3.dw_detalle_total.width				= 2144
tabpage_3.dw_detalle_total.height			= 292

tabpage_3.st_7.x									= 27
tabpage_3.st_7.y									= 364
tabpage_3.st_7.width								= 850
tabpage_3.st_7.height							= 56
tabpage_3.dw_detalle_cuotas.x					= 18
tabpage_3.dw_detalle_cuotas.y					= 420
tabpage_3.dw_detalle_cuotas.width			= 2144
tabpage_3.dw_detalle_cuotas.height			= 292

tabpage_3.st_8.x									= 27
tabpage_3.st_8.y									= 724
tabpage_3.st_8.width								= 850
tabpage_3.st_8.height							= 56
tabpage_3.dw_detalle_mantencion.x			= 18
tabpage_3.dw_detalle_mantencion.y			= 780
tabpage_3.dw_detalle_mantencion.width		= 2144
tabpage_3.dw_detalle_mantencion.height		= 292

tabpage_3.st_3.x									= 27
tabpage_3.st_3.y									= 1084
tabpage_3.st_3.width								= 1001
tabpage_3.st_3.height							= 56
tabpage_3.dw_detalle_pagos.x					= 18
tabpage_3.dw_detalle_pagos.y					= 1140
tabpage_3.dw_detalle_pagos.width				= 2144
tabpage_3.dw_detalle_pagos.height			= 292
end subroutine

public subroutine wf_pos_otros_cttos ();tabpage_3.st_6.x									= 27
tabpage_3.st_6.y									= 4
tabpage_3.st_6.width								= 850
tabpage_3.st_6.height							= 56
tabpage_3.dw_detalle_total.x					= 18
tabpage_3.dw_detalle_total.y					= 60
tabpage_3.dw_detalle_total.width				= 2144
tabpage_3.dw_detalle_total.height			= 412

tabpage_3.st_8.x									= 27
tabpage_3.st_8.y									= 480
tabpage_3.st_8.width								= 850
tabpage_3.st_8.height							= 56
tabpage_3.dw_detalle_mantencion.x			= 18
tabpage_3.dw_detalle_mantencion.y			= 536
tabpage_3.dw_detalle_mantencion.width		= 2144
tabpage_3.dw_detalle_mantencion.height		= 412

tabpage_3.st_3.x									= 27
tabpage_3.st_3.y									= 956
tabpage_3.st_3.width								= 1001
tabpage_3.st_3.height							= 56
tabpage_3.dw_detalle_pagos.x					= 18
tabpage_3.dw_detalle_pagos.y					= 1012
tabpage_3.dw_detalle_pagos.width				= 2144
tabpage_3.dw_detalle_pagos.height			= 412
end subroutine

public subroutine wf_pos_contrato_isa ();tabpage_3.st_6.x									= 27
tabpage_3.st_6.y									= 4
tabpage_3.st_6.width								= 850
tabpage_3.st_6.height							= 56
tabpage_3.dw_detalle_total.x					= 18
tabpage_3.dw_detalle_total.y					= 60
tabpage_3.dw_detalle_total.width				= 2144
tabpage_3.dw_detalle_total.height			= 412

tabpage_3.st_8.x									= 27
tabpage_3.st_8.y									= 480
tabpage_3.st_8.width								= 850
tabpage_3.st_8.height							= 56
tabpage_3.dw_detalle_mantencion.x			= 18
tabpage_3.dw_detalle_mantencion.y			= 536
tabpage_3.dw_detalle_mantencion.width		= 2144
tabpage_3.dw_detalle_mantencion.height		= 412

tabpage_3.st_3.x									= 27
tabpage_3.st_3.y									= 956
tabpage_3.st_3.width								= 1001
tabpage_3.st_3.height							= 56
tabpage_3.dw_detalle_pagos.x					= 18
tabpage_3.dw_detalle_pagos.y					= 1012
tabpage_3.dw_detalle_pagos.width				= 2144
tabpage_3.dw_detalle_pagos.height			= 412
end subroutine

on uo_cobranza_postventa.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4}
end on

on uo_cobranza_postventa.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

type tabpage_1 from userobject within uo_cobranza_postventa
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2491
integer height = 1460
long backcolor = 67108864
string text = "Antecedentes"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_cliente dw_cliente
st_4 st_4
dw_contrato dw_contrato
cb_cerrar_1 cb_cerrar_1
end type

on tabpage_1.create
this.dw_cliente=create dw_cliente
this.st_4=create st_4
this.dw_contrato=create dw_contrato
this.cb_cerrar_1=create cb_cerrar_1
this.Control[]={this.dw_cliente,&
this.st_4,&
this.dw_contrato,&
this.cb_cerrar_1}
end on

on tabpage_1.destroy
destroy(this.dw_cliente)
destroy(this.st_4)
destroy(this.dw_contrato)
destroy(this.cb_cerrar_1)
end on

type dw_cliente from datawindow within tabpage_1
integer x = 14
integer y = 8
integer width = 2469
integer height = 628
integer taborder = 10
string title = "none"
string dataobject = "dw_encabezado_antecedentes_cliente"
boolean border = false
boolean livescroll = true
end type

type st_4 from statictext within tabpage_1
integer x = 37
integer y = 628
integer width = 567
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contratos Asociados"
boolean focusrectangle = false
end type

event clicked;w_general_cobranza_telefonica.tab_cobranza.visible	= false
end event

type dw_contrato from datawindow within tabpage_1
integer x = 18
integer y = 700
integer width = 2441
integer height = 604
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_contrato_por_rut_cliente"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;String	ls_base,ls_serie,ls_tipo_cob
Long		ll_folio
double	ldb_numero

if getrow()>0 then
	il_fila		= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_fila, TRUE)
	ls_base		= this.getitemstring(il_fila,'cadena_codigo')
	ls_serie		= this.getitemstring(il_fila,'cadena_serie')
	ldb_numero	= this.getitemnumber(il_fila,'cadena_numero')
	if tabpage_3.dw_detalle_total.retrieve(ls_serie,ldb_numero,ls_base)>0 then
		ll_folio		= tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
		ls_tipo_cob	= tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
		tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
	else
		tabpage_3.dw_detalle_pagos.reset()
	end if
	tabpage_3.dw_detalle_cuotas.retrieve(ls_serie,ldb_numero,ls_base)
	tabpage_3.dw_detalle_mantencion.retrieve(ls_serie,ldb_numero,ls_base)
	if ls_base='C' then
		tabpage_3.st_6.visible							= true
		tabpage_3.dw_detalle_total.visible			= true
		tabpage_3.st_7.visible							= false
		tabpage_3.dw_detalle_cuotas.visible			= false
		tabpage_3.st_8.visible							= true
		tabpage_3.dw_detalle_mantencion.visible	= true
		tabpage_3.st_3.visible							= true
		tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_contrato_isa()
	elseif ls_base='D' or ls_base='P' or ls_base='L' or ls_base='R' then
		tabpage_3.st_6.visible							= true
		tabpage_3.dw_detalle_total.visible			= true
		tabpage_3.st_7.visible							= true
		tabpage_3.dw_detalle_cuotas.visible			= true
		tabpage_3.st_8.visible							= false
		tabpage_3.dw_detalle_mantencion.visible	= false
		tabpage_3.st_3.visible							= true
		tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_otros_cttos()
	elseif ls_base='O' then
		tabpage_3.st_6.visible							= true
		tabpage_3.dw_detalle_total.visible			= true
		tabpage_3.st_7.visible							= true
		tabpage_3.dw_detalle_cuotas.visible			= true
		tabpage_3.st_8.visible							= true
		tabpage_3.dw_detalle_mantencion.visible	= true
		tabpage_3.st_3.visible							= true
		tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_promesa()
	end if
end if
end event

event clicked;String	ls_base,ls_serie,ls_tipo_cob
Long		ll_folio
double	ldb_numero

if row>0 then
	il_fila		= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_fila, TRUE)
	ls_base		= this.getitemstring(il_fila,'cadena_codigo')
	ls_serie		= this.getitemstring(il_fila,'cadena_serie')
	ldb_numero	= this.getitemnumber(il_fila,'cadena_numero')
	if tabpage_3.dw_detalle_total.retrieve(ls_serie,ldb_numero,ls_base)>0 then
		ll_folio		= tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
		ls_tipo_cob	= tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
		tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
	else
		tabpage_3.dw_detalle_pagos.reset()
	end if
	tabpage_3.dw_detalle_cuotas.retrieve(ls_serie,ldb_numero,ls_base)
	tabpage_3.dw_detalle_mantencion.retrieve(ls_serie,ldb_numero,ls_base)
	if ls_base='C' then
		tabpage_3.st_6.visible							= true
		tabpage_3.dw_detalle_total.visible			= true
		tabpage_3.st_7.visible							= false
		tabpage_3.dw_detalle_cuotas.visible			= false
		tabpage_3.st_8.visible							= true
		tabpage_3.dw_detalle_mantencion.visible	= true
		tabpage_3.st_3.visible							= true
		tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_contrato_isa()
	elseif ls_base='D' or ls_base='P' or ls_base='L' or ls_base='R' then
		tabpage_3.st_6.visible							= true
		tabpage_3.dw_detalle_total.visible			= true
		tabpage_3.st_7.visible							= true
		tabpage_3.dw_detalle_cuotas.visible			= true
		tabpage_3.st_8.visible							= false
		tabpage_3.dw_detalle_mantencion.visible	= false
		tabpage_3.st_3.visible							= true
		tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_otros_cttos()
	elseif ls_base='O' then
		tabpage_3.st_6.visible							= true
		tabpage_3.dw_detalle_total.visible			= true
		tabpage_3.st_7.visible							= true
		tabpage_3.dw_detalle_cuotas.visible			= true
		tabpage_3.st_8.visible							= true
		tabpage_3.dw_detalle_mantencion.visible	= true
		tabpage_3.st_3.visible							= true
		tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_promesa()
	end if
end if
end event

type cb_cerrar_1 from commandbutton within tabpage_1
integer x = 18
integer y = 1332
integer width = 2441
integer height = 104
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_llamados_postventa) then
	w_llamados_postventa.tab_cobranza_postventa.visible						= false
end if
if isvalid(w_llamados_postventa_fecha_digitacion) then
	w_llamados_postventa_fecha_digitacion.tab_cobranza_postventa.visible	= false
end if
end event

type tabpage_2 from userobject within uo_cobranza_postventa
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2491
integer height = 1460
long backcolor = 67108864
string text = "Cobranza Histórica"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_cerrar_2 cb_cerrar_2
st_5 st_5
dw_publico dw_publico
st_2 st_2
dw_carta dw_carta
st_1 st_1
dw_cobranza dw_cobranza
end type

on tabpage_2.create
this.cb_cerrar_2=create cb_cerrar_2
this.st_5=create st_5
this.dw_publico=create dw_publico
this.st_2=create st_2
this.dw_carta=create dw_carta
this.st_1=create st_1
this.dw_cobranza=create dw_cobranza
this.Control[]={this.cb_cerrar_2,&
this.st_5,&
this.dw_publico,&
this.st_2,&
this.dw_carta,&
this.st_1,&
this.dw_cobranza}
end on

on tabpage_2.destroy
destroy(this.cb_cerrar_2)
destroy(this.st_5)
destroy(this.dw_publico)
destroy(this.st_2)
destroy(this.dw_carta)
destroy(this.st_1)
destroy(this.dw_cobranza)
end on

type cb_cerrar_2 from commandbutton within tabpage_2
integer x = 23
integer y = 1332
integer width = 2437
integer height = 104
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_llamados_postventa) then 
	w_llamados_postventa.tab_cobranza_postventa.visible						= false
end if
if isvalid(w_llamados_postventa_fecha_digitacion) then 
	w_llamados_postventa_fecha_digitacion.tab_cobranza_postventa.visible	= false
end if

end event

type st_5 from statictext within tabpage_2
integer x = 37
integer y = 880
integer width = 430
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Atención Público"
boolean focusrectangle = false
end type

type dw_publico from datawindow within tabpage_2
integer x = 23
integer y = 940
integer width = 2437
integer height = 360
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_mov_atencion_log_por_rut"
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

type st_2 from statictext within tabpage_2
integer x = 37
integer y = 448
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Envio Carta"
boolean focusrectangle = false
end type

type dw_carta from datawindow within tabpage_2
integer x = 23
integer y = 508
integer width = 2437
integer height = 360
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_mov_carta_log_por_rut"
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

type st_1 from statictext within tabpage_2
integer x = 27
integer y = 16
integer width = 521
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cobranza Telefónica"
boolean focusrectangle = false
end type

type dw_cobranza from datawindow within tabpage_2
integer x = 23
integer y = 76
integer width = 2437
integer height = 360
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_mov_tele_log_por_rut"
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

type tabpage_3 from userobject within uo_cobranza_postventa
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2491
integer height = 1460
long backcolor = 67108864
string text = "Pagos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_boton_cerrar dw_boton_cerrar
st_8 st_8
dw_detalle_mantencion dw_detalle_mantencion
st_7 st_7
dw_detalle_cuotas dw_detalle_cuotas
st_3 st_3
dw_detalle_pagos dw_detalle_pagos
st_6 st_6
dw_detalle_total dw_detalle_total
end type

on tabpage_3.create
this.dw_boton_cerrar=create dw_boton_cerrar
this.st_8=create st_8
this.dw_detalle_mantencion=create dw_detalle_mantencion
this.st_7=create st_7
this.dw_detalle_cuotas=create dw_detalle_cuotas
this.st_3=create st_3
this.dw_detalle_pagos=create dw_detalle_pagos
this.st_6=create st_6
this.dw_detalle_total=create dw_detalle_total
this.Control[]={this.dw_boton_cerrar,&
this.st_8,&
this.dw_detalle_mantencion,&
this.st_7,&
this.dw_detalle_cuotas,&
this.st_3,&
this.dw_detalle_pagos,&
this.st_6,&
this.dw_detalle_total}
end on

on tabpage_3.destroy
destroy(this.dw_boton_cerrar)
destroy(this.st_8)
destroy(this.dw_detalle_mantencion)
destroy(this.st_7)
destroy(this.dw_detalle_cuotas)
destroy(this.st_3)
destroy(this.dw_detalle_pagos)
destroy(this.st_6)
destroy(this.dw_detalle_total)
end on

type dw_boton_cerrar from datawindow within tabpage_3
integer x = 2313
integer y = 56
integer width = 169
integer height = 1396
integer taborder = 50
string title = "none"
string dataobject = "dwe_boton_cerrar"
boolean border = false
boolean livescroll = true
end type

event clicked;if isvalid(w_llamados_postventa) then 
	w_llamados_postventa.tab_cobranza_postventa.visible						= false
end if
if isvalid(w_llamados_postventa_fecha_digitacion) then 
	w_llamados_postventa_fecha_digitacion.tab_cobranza_postventa.visible	= false
end if

end event

type st_8 from statictext within tabpage_3
integer x = 27
integer y = 724
integer width = 850
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de Mantención"
boolean focusrectangle = false
end type

type dw_detalle_mantencion from datawindow within tabpage_3
integer x = 18
integer y = 780
integer width = 2277
integer height = 280
integer taborder = 60
string title = "none"
string dataobject = "dw_ingreso_mantencion_cuenta_corriente"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_tipo_cob
Long		ll_folio,ll_row
if row>0 then
	ll_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row, TRUE)
	ll_folio		= this.getitemnumber(ll_row,'folio')
	ls_tipo_cob	= this.getitemstring(ll_row,'tipo_cob')
	tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
end if
end event

event rowfocuschanged;String	ls_tipo_cob
Long		ll_folio,ll_row
if getrow()>0 then
	ll_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row, TRUE)
	ll_folio		= this.getitemnumber(ll_row,'folio')
	ls_tipo_cob	= this.getitemstring(ll_row,'tipo_cob')
	tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
end if
end event

type st_7 from statictext within tabpage_3
integer x = 27
integer y = 364
integer width = 850
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle Cuotas Sepultura"
boolean focusrectangle = false
end type

type dw_detalle_cuotas from datawindow within tabpage_3
integer x = 18
integer y = 420
integer width = 2277
integer height = 280
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_cuotas_cuenta_corriente"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_tipo_cob
Long		ll_folio,ll_row
if row>0 then
	ll_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row, TRUE)
	ll_folio		= this.getitemnumber(ll_row,'folio')
	ls_tipo_cob	= this.getitemstring(ll_row,'tipo_cob')
	tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
end if
end event

event rowfocuschanged;String	ls_tipo_cob
Long		ll_folio,ll_row
if getrow()>0 then
	ll_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row, TRUE)
	ll_folio		= this.getitemnumber(ll_row,'folio')
	ls_tipo_cob	= this.getitemstring(ll_row,'tipo_cob')
	tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
end if
end event

type st_3 from statictext within tabpage_3
integer x = 27
integer y = 1084
integer width = 1001
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle Pagos (Documento / Efectivo)"
boolean focusrectangle = false
end type

type dw_detalle_pagos from datawindow within tabpage_3
integer x = 18
integer y = 1140
integer width = 2277
integer height = 292
integer taborder = 30
string title = "none"
string dataobject = "dw_ingresos_documentos_por_ctto"
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

type st_6 from statictext within tabpage_3
integer x = 27
integer y = 4
integer width = 850
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle Cuenta Corriente Total"
boolean focusrectangle = false
end type

type dw_detalle_total from datawindow within tabpage_3
integer x = 18
integer y = 60
integer width = 2277
integer height = 280
integer taborder = 40
string title = "none"
string dataobject = "dw_ingreso_todo_cuenta_corriente"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_tipo_cob
Long		ll_folio,ll_row
if row>0 then
	ll_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row, TRUE)
	ll_folio		= this.getitemnumber(ll_row,'folio')
	ls_tipo_cob	= this.getitemstring(ll_row,'tipo_cob')
	tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
end if
end event

event rowfocuschanged;String	ls_tipo_cob
Long		ll_folio,ll_row
if getrow()>0 then
	ll_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row, TRUE)
	ll_folio		= this.getitemnumber(ll_row,'folio')
	ls_tipo_cob	= this.getitemstring(ll_row,'tipo_cob')
	tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
end if
end event

type tabpage_4 from userobject within uo_cobranza_postventa
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2491
integer height = 1460
long backcolor = 67108864
string text = "Gestión Telefónica"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_9 st_9
dw_ingreso dw_ingreso
dw_cliente2 dw_cliente2
cb_grabar cb_grabar
dw_ultima_cobranza_telefonica dw_ultima_cobranza_telefonica
cb_cerrar_4 cb_cerrar_4
end type

on tabpage_4.create
this.st_9=create st_9
this.dw_ingreso=create dw_ingreso
this.dw_cliente2=create dw_cliente2
this.cb_grabar=create cb_grabar
this.dw_ultima_cobranza_telefonica=create dw_ultima_cobranza_telefonica
this.cb_cerrar_4=create cb_cerrar_4
this.Control[]={this.st_9,&
this.dw_ingreso,&
this.dw_cliente2,&
this.cb_grabar,&
this.dw_ultima_cobranza_telefonica,&
this.cb_cerrar_4}
end on

on tabpage_4.destroy
destroy(this.st_9)
destroy(this.dw_ingreso)
destroy(this.dw_cliente2)
destroy(this.cb_grabar)
destroy(this.dw_ultima_cobranza_telefonica)
destroy(this.cb_cerrar_4)
end on

type st_9 from statictext within tabpage_4
integer x = 59
integer y = 636
integer width = 777
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Cobranza Telefónica"
boolean focusrectangle = false
end type

type dw_ingreso from datawindow within tabpage_4
integer x = 9
integer y = 692
integer width = 2478
integer height = 624
integer taborder = 30
string title = "none"
string dataobject = "dw_ingreso_cobranza_postventa"
boolean border = false
boolean livescroll = true
end type

type dw_cliente2 from datawindow within tabpage_4
integer x = 14
integer y = 8
integer width = 2473
integer height = 380
integer taborder = 20
string title = "none"
string dataobject = "dw_encabezado_antecedentes_cliente2"
boolean border = false
boolean livescroll = true
end type

type cb_grabar from commandbutton within tabpage_4
integer x = 23
integer y = 1328
integer width = 1221
integer height = 104
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Grabar"
end type

event clicked;long		ll_ret,ll_tot_reg,ll_indi,ll_rut,ll_nro_grupo,ll_sum_reg,ll_count_reg,ll_row
String	ls_glosa,ls_estado,ls_estado_tele='19',ls_glosa_tele,ls_string
Datetime	ldt_fecha

dw_ingreso.accepttext()
ls_glosa_tele	= 'Llamado Post-Venta realizado el '+string(gdt_fec_sistema,"dd/mm/yyyy")+' por el Usuario '+gs_user
ls_estado		= trim(dw_ingreso.getitemstring(1,'estado'))
ls_glosa			= trim(dw_ingreso.getitemstring(1,'glosa'))
//ldt_fecha_prox	= datetime(date(em_fecha_prox.text))
if not isnull(ls_estado) and not isnull(ls_glosa) then//and not isnull(ldt_fecha_prox) then
	ll_ret 		= messagebox('Actulizar','Desea actualizar los datos',Question!,YesNo!,2)
	if ll_ret = 1 then
		SELECT	sysdate
		INTO 		:gdt_fec_sistema
		FROM 		"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
		USING		sqlca;
		
		UPDATE	"CLIENTE"  
		SET 		"ESTADO_COBRANZA" = :ls_estado_tele,   
					"FECHA_COBRANZA"  = :gdt_fec_sistema,   
					"GLOSA_COBRANZA"  = :ls_glosa_tele,  
					"USUARIO_POST_VENTA" = :gs_user, 
					"ESTADO_POSTVENTA" = 'S',
					"ESTADO_COB_PROSTVENTA" = :ls_estado,
					"FECHA_COB_POSTVENTA" = :gdt_fec_sistema,
					"GLOSA_COB_POSTVENTA" = :ls_glosa
		WHERE 	"CLIENTE"."RUT" = :gi_rut   
		USING		sqlca;
		if sqlca.sqlcode = 0 then
			commit;
			if isvalid(w_llamados_postventa) then
				ll_tot_reg	= w_llamados_postventa.dw_lista.rowcount()
				ls_string	= "rut="+string(gi_rut)
				ll_row 		= w_llamados_postventa.dw_lista.Find(ls_string, 1, ll_tot_reg)
				IF ll_row > 0 THEN
					w_llamados_postventa.dw_lista.ScrollToRow( ll_row )
					for ll_indi=ll_row to ll_tot_reg
						ll_rut	= w_llamados_postventa.dw_lista.getitemnumber(ll_indi,'rut')
						if ll_rut = gi_rut then
							w_llamados_postventa.dw_lista.setitem(ll_indi,'estado_postventa','S')
							w_llamados_postventa.dw_lista.setitem(ll_indi,'estado_cob_postventa',ls_estado)
							w_llamados_postventa.dw_lista.setitem(ll_indi,'fecha_cob_postventa',date(gdt_fec_sistema))
							w_llamados_postventa.dw_lista.setitem(ll_indi,'glosa_cob_postventa',ls_glosa)
						end if
					next
				END IF
			end if
			if isvalid(w_llamados_postventa_fecha_digitacion) then
				ll_tot_reg	= w_llamados_postventa_fecha_digitacion.dw_lista.rowcount()
				ls_string	= "rut="+string(gi_rut)
				ll_row 		= w_llamados_postventa_fecha_digitacion.dw_lista.Find(ls_string, 1, ll_tot_reg)
				IF ll_row > 0 THEN
					w_llamados_postventa_fecha_digitacion.dw_lista.ScrollToRow( ll_row )
					for ll_indi=ll_row to ll_tot_reg
						ll_rut	= w_llamados_postventa_fecha_digitacion.dw_lista.getitemnumber(ll_indi,'rut')
						if ll_rut = gi_rut then
							w_llamados_postventa_fecha_digitacion.dw_lista.setitem(ll_indi,'estado_postventa','S')
							w_llamados_postventa_fecha_digitacion.dw_lista.setitem(ll_indi,'estado_cob_postventa',ls_estado)
							w_llamados_postventa_fecha_digitacion.dw_lista.setitem(ll_indi,'fecha_cob_postventa',date(gdt_fec_sistema))
							w_llamados_postventa_fecha_digitacion.dw_lista.setitem(ll_indi,'glosa_cob_postventa',ls_glosa)
						end if
					next
				END IF
			end if
			INSERT INTO "TELE_LOG_POST_VENTA"  
					 ( "RUT"  ,"ESTADO"  	,	"FECHA"   			,"GLOSA"    ,"USUARIO"  ,"BASE"  ,"SERIE"  ,"NUMERO" )  
			VALUES ( :gi_rut,:ls_estado,		:gdt_fec_sistema ,:ls_glosa,:gs_user	  ,:gs_base,:gs_serie,:gi_numero)  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			INSERT INTO "TELE_LOG"  
					 ( "RUT"  ,"ESTADO"  ,		"FECHA"   			,"GLOSA"    ,	"USUARIO"  ,"BASE"  ,"SERIE"  ,"NUMERO" )  
			VALUES ( :gi_rut,:ls_estado_tele,:gdt_fec_sistema ,:ls_glosa_tele,:gs_user	  ,:gs_base,:gs_serie,:gi_numero)  ;
			if sqlca.sqlcode = 0 then
				commit;
//				tabpage_4.dw_ultima_cobranza_telefonica.retrieve (gi_rut)
//				tabpage_2.dw_cobranza.retrieve (gi_rut)
//				tabpage_1.dw_cliente.retrieve (gi_rut)
				if isvalid(w_llamados_postventa) then
					w_llamados_postventa.tab_cobranza_postventa.visible						= false
				end if
				if isvalid(w_llamados_postventa_fecha_digitacion) then
					w_llamados_postventa_fecha_digitacion.tab_cobranza_postventa.visible	= false
				end if
			else
				messagebox('Error Grabar','Error al Insertar TELE_LOG SQL: '+sqlca.SQLErrText,information!)
				ROLLBACK;
			end if
		else
			messagebox('Error Grabar','Error al Actualizar CLIENTE SQL: '+sqlca.SQLErrText,information!)
			ROLLBACK;
		end if
	end if
else
	messagebox("Advertencia","Debe Ingresar Datos")
	dw_ingreso.setfocus()
end if
end event

type dw_ultima_cobranza_telefonica from datawindow within tabpage_4
integer x = 9
integer y = 380
integer width = 2469
integer height = 260
integer taborder = 40
string title = "none"
string dataobject = "dw_ultima_cobranza_postventa_por_rut"
boolean border = false
boolean livescroll = true
end type

type cb_cerrar_4 from commandbutton within tabpage_4
integer x = 1248
integer y = 1328
integer width = 1216
integer height = 104
integer taborder = 70
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_llamados_postventa) then 
	w_llamados_postventa.tab_cobranza_postventa.visible						= false
end if
if isvalid(w_llamados_postventa_fecha_digitacion) then 
	w_llamados_postventa_fecha_digitacion.tab_cobranza_postventa.visible	= false
end if

end event

