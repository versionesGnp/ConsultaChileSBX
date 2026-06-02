forward
global type uo_cobranza from tab
end type
type tabpage_1 from userobject within uo_cobranza
end type
type dw_cliente from datawindow within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type dw_contrato from datawindow within tabpage_1
end type
type cb_cerrar_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within uo_cobranza
dw_cliente dw_cliente
st_4 st_4
dw_contrato dw_contrato
cb_cerrar_1 cb_cerrar_1
end type
type tabpage_2 from userobject within uo_cobranza
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
type tabpage_2 from userobject within uo_cobranza
cb_cerrar_2 cb_cerrar_2
st_5 st_5
dw_publico dw_publico
st_2 st_2
dw_carta dw_carta
st_1 st_1
dw_cobranza dw_cobranza
end type
type tabpage_3 from userobject within uo_cobranza
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
type tabpage_3 from userobject within uo_cobranza
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
type tabpage_4 from userobject within uo_cobranza
end type
type em_prox_llamado from editmask within tabpage_4
end type
type em_fecha_prox from editmask within tabpage_4
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
type tabpage_4 from userobject within uo_cobranza
em_prox_llamado em_prox_llamado
em_fecha_prox em_fecha_prox
st_9 st_9
dw_ingreso dw_ingreso
dw_cliente2 dw_cliente2
cb_grabar cb_grabar
dw_ultima_cobranza_telefonica dw_ultima_cobranza_telefonica
cb_cerrar_4 cb_cerrar_4
end type
end forward

global type uo_cobranza from tab
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
global uo_cobranza uo_cobranza

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

on uo_cobranza.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4}
end on

on uo_cobranza.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

type tabpage_1 from userobject within uo_cobranza
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
integer y = 688
integer width = 2441
integer height = 620
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_contrato_por_rut_cliente"
boolean hscrollbar = true
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

event doubleclicked;Long	ll_fila

This.accepttext()
if row>0 then
	ll_fila		= row
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_fila, TRUE)
	if isvalid(w_general_cobranza_telefonica) then
		w_general_cobranza_telefonica.cb_ctacte2.triggerevent(clicked!)
	elseif isvalid(w_ingreso_individual_cobranza) then
		w_ingreso_individual_cobranza.cb_ctacte2.triggerevent(clicked!)
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

event clicked;if isvalid(w_general_cobranza_telefonica) then w_general_cobranza_telefonica.tab_cobranza.visible	= false
if isvalid(w_ingreso_individual_cobranza) then w_ingreso_individual_cobranza.tab_cobranza.visible	= false
if isvalid(w_filtrar_cobranza) then w_filtrar_cobranza.tab_cobranza.visible	= false
if isvalid(w_total_ctto_asignados) then w_total_ctto_asignados.tab_cobranza.visible	= false
end event

type tabpage_2 from userobject within uo_cobranza
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

event clicked;if isvalid(w_general_cobranza_telefonica) then w_general_cobranza_telefonica.tab_cobranza.visible	= false
if isvalid(w_ingreso_individual_cobranza) then w_ingreso_individual_cobranza.tab_cobranza.visible	= false
if isvalid(w_filtrar_cobranza) then w_filtrar_cobranza.tab_cobranza.visible	= false
if isvalid(w_total_ctto_asignados) then w_total_ctto_asignados.tab_cobranza.visible	= false
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

event doubleclicked;String	ls_string,ls_base,ls_serie,ls_estado
Long		ll_rut
Datetime	ldt_fecha
double	ldb_numero

if row > 0 then
	ls_base		= dw_publico.getitemstring(row,'base')
	ls_serie		= dw_publico.getitemstring(row,'serie')
	ldb_numero	= dw_publico.getitemnumber(row,'numero')
	ls_estado	= dw_publico.getitemstring(row,'estado')
	ldt_fecha	= dw_publico.getitemdatetime(row,'fecha')
	ll_rut		= dw_publico.getitemnumber(row,'rut')
	ls_string	= 'AP'+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+ls_estado+'~t'+string(ldt_fecha)+'~t'+string(ll_rut)
	if isvalid(w_detalle_cobranza_historica) then close(w_detalle_cobranza_historica)
	openwithparm(w_detalle_cobranza_historica,ls_string)
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

event doubleclicked;datetime fecha
String	ls_clasi,ls_string 
if row > 0 then
	fecha 		= datetime(date(this.getitemdatetime(row,'fecha_carta')),time('00:00:00'))
	ls_clasi		= this.getitemstring(row,'clasificacion')
	ls_string	= string(fecha,'dd/mm/yyyy')+'~t'+ls_clasi
	OpenWithParm(w_ultimos_procesos_cartas, ls_string )
else
	
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

event doubleclicked;String	ls_string,ls_base,ls_serie,ls_estado
Long		ll_rut
Datetime	ldt_fecha
double	ldb_numero

if row > 0 then
	ls_base		= dw_cobranza.getitemstring(row,'base')
	ls_serie		= dw_cobranza.getitemstring(row,'serie')
	ldb_numero	= dw_cobranza.getitemnumber(row,'numero')
	ls_estado	= dw_cobranza.getitemstring(row,'estado')
	ldt_fecha	= dw_cobranza.getitemdatetime(row,'fecha')
	ll_rut		= dw_cobranza.getitemnumber(row,'rut')
	ls_string	= 'AT'+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+ls_estado+'~t'+string(ldt_fecha)+'~t'+string(ll_rut)
	if isvalid(w_detalle_cobranza_historica) then close(w_detalle_cobranza_historica)
	openwithparm(w_detalle_cobranza_historica,ls_string)
end if
end event

type tabpage_3 from userobject within uo_cobranza
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

event clicked;if isvalid(w_general_cobranza_telefonica) then w_general_cobranza_telefonica.tab_cobranza.visible	= false
if isvalid(w_ingreso_individual_cobranza) then w_ingreso_individual_cobranza.tab_cobranza.visible	= false
if isvalid(w_filtrar_cobranza) then w_filtrar_cobranza.tab_cobranza.visible	= false
if isvalid(w_total_ctto_asignados) then w_total_ctto_asignados.tab_cobranza.visible	= false
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

type tabpage_4 from userobject within uo_cobranza
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
em_prox_llamado em_prox_llamado
em_fecha_prox em_fecha_prox
st_9 st_9
dw_ingreso dw_ingreso
dw_cliente2 dw_cliente2
cb_grabar cb_grabar
dw_ultima_cobranza_telefonica dw_ultima_cobranza_telefonica
cb_cerrar_4 cb_cerrar_4
end type

on tabpage_4.create
this.em_prox_llamado=create em_prox_llamado
this.em_fecha_prox=create em_fecha_prox
this.st_9=create st_9
this.dw_ingreso=create dw_ingreso
this.dw_cliente2=create dw_cliente2
this.cb_grabar=create cb_grabar
this.dw_ultima_cobranza_telefonica=create dw_ultima_cobranza_telefonica
this.cb_cerrar_4=create cb_cerrar_4
this.Control[]={this.em_prox_llamado,&
this.em_fecha_prox,&
this.st_9,&
this.dw_ingreso,&
this.dw_cliente2,&
this.cb_grabar,&
this.dw_ultima_cobranza_telefonica,&
this.cb_cerrar_4}
end on

on tabpage_4.destroy
destroy(this.em_prox_llamado)
destroy(this.em_fecha_prox)
destroy(this.st_9)
destroy(this.dw_ingreso)
destroy(this.dw_cliente2)
destroy(this.cb_grabar)
destroy(this.dw_ultima_cobranza_telefonica)
destroy(this.cb_cerrar_4)
end on

type em_prox_llamado from editmask within tabpage_4
integer x = 896
integer y = 1204
integer width = 640
integer height = 92
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 255
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_fecha_prox from editmask within tabpage_4
integer x = 55
integer y = 1204
integer width = 640
integer height = 92
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

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
string dataobject = "dw_ingreso_cobranza"
boolean border = false
boolean livescroll = true
end type

event clicked;string	ls_fecha,ls_columna
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'p_2'
//		if trim(em_fecha_prox.text)='00/00/0000' or trim(em_fecha_prox.text)='' or &
//			isnull(trim(em_fecha_prox.text)) then	
//			
//			em_fecha_prox.text	= string(today(),"dd/mm/yyyy")
//		end if
//		
//		if f_valida_fecha(em_fecha_prox.text)=-1 then 
//			em_fecha_prox.text=string(today(),gs_formato_fecha)
//			em_fecha_prox.setfocus()
//			return
//		end if	
//		if trim(em_fecha_prox.text)<>'00/00/0000' and not isnull(trim(em_fecha_prox.text)) and &
//			trim(em_fecha_prox.text)<>'' then
//			
//			ls_fecha = em_fecha_prox.text
//		else
//			ls_fecha = string(today(),gs_formato_fecha)
//		end if	
//		em_fecha_prox.text = ls_fecha
//		OpenWithParm(w_calendar,ls_fecha)
//		em_fecha_prox.text = Message.StringParm
		
	CASE 'p_1'
		if trim(em_prox_llamado.text)='00/00/0000' or trim(em_prox_llamado.text)='' or &
			isnull(trim(em_prox_llamado.text)) then	
			
			em_prox_llamado.text	= string(today(),"dd/mm/yyyy")
		end if
		
		if f_valida_fecha(em_prox_llamado.text)=-1 then 
			em_prox_llamado.text=string(today(),gs_formato_fecha)
			em_prox_llamado.setfocus()
			return
		end if	
		if trim(em_prox_llamado.text)<>'00/00/0000' and not isnull(trim(em_prox_llamado.text)) and &
			trim(em_prox_llamado.text)<>'' then
			
			ls_fecha = em_prox_llamado.text
		else
			ls_fecha = string(today(),gs_formato_fecha)
		end if	
		em_prox_llamado.text = ls_fecha
		OpenWithParm(w_calendar,ls_fecha)
		em_prox_llamado.text = Message.StringParm
		
END CHOOSE
end event

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
integer width = 1211
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

event clicked;Datetime	ldt_fecha_prox,ldt_fecha,ld_fecha_prox_llamado,ld_fecha_cob,ld_fecha_venc_cred,ld_fecha_venc_mant,&
			ld_fecha_hoy,ldt_fec_prox,ldt_fecha_gestion
String	ls_base,ls_serie,ls_estado,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_direc_p,ls_cod_ciudad,&
			ls_desc_ciudad,ls_cod_comuna,ls_desc_comuna,ls_fono_p,ls_fono_c,ls_estado_cob,ls_glosa_cob,&
			ls_estado_titular,ls_glosa,ls_base_adi,ls_serie_adi,ls_glosa_adi
Long		ll_mora_cred,ll_dias_mora_cred,ll_mora_mant,ll_dias_mora_mant,ll_facecidos,&
			ll_ret,ll_tot_reg,ll_indi,ll_rut,ll_nro_grupo,ll_sum_reg,ll_count_reg,ll_fila_pos,ll_numero_adi
Double	ldb_numero,ldb_porce_facturado,ldb_porce_mora_cred,ldb_porce_suma
Time		ld_hora

Connect Using Trans_1;
dw_ingreso.accepttext()
ls_estado		= trim(dw_ingreso.getitemstring(1,'estado'))
ls_glosa			= trim(dw_ingreso.getitemstring(1,'glosa'))
ldt_fecha_prox	= datetime(date(em_fecha_prox.text))
ldt_fec_prox	= datetime(date(em_prox_llamado.text))
if not isnull(ls_estado) and not isnull(ls_glosa) and not isnull(ldt_fecha_prox) then
	ll_ret 		= messagebox('Actulizar','Desea actualizar los datos',Question!,YesNo!,2)
	if ll_ret = 1 then
		SELECT	sysdate
		INTO 		:gdt_fec_sistema
		FROM 	"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
		USING		sqlca;
		ld_hora					= now()
		ldt_fecha_gestion		= datetime(date(gdt_fec_sistema),time(ld_hora))
		UPDATE	"CLIENTE"  
		SET 		"ESTADO_COBRANZA" = :ls_estado,   
					"FECHA_COBRANZA"  = :ldt_fecha_gestion,   
					"GLOSA_COBRANZA"  = :ls_glosa,  
					"USUARIO_COB_TELE" = :gs_user, 
					"PROX_LLAMADO_COB" = :ldt_fecha_gestion,
					"FECHA_PROX_LLAMADO" = :ldt_fecha_prox,
					"ASIGNADO_COBRANZA" = 'N',
					"FECHA_COMPROMISO" = :ldt_fec_prox
		WHERE 	"CLIENTE"."RUT" = :gi_rut   
		USING		sqlca;
		if sqlca.sqlcode = 0 then
			commit;
			INSERT INTO "TELE_LOG"  
					 	( "RUT"  ,"ESTADO"  ,"FECHA"  ,			"GLOSA"    ,"USUARIO"  ,"BASE"  ,"SERIE"  ,"NUMERO" )  
			VALUES 	( :gi_rut,:ls_estado,:ldt_fecha_gestion ,	:ls_glosa,	:gs_user	  ,	:gs_base,:gs_serie,:gi_numero)  ;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				tabpage_4.dw_ultima_cobranza_telefonica.retrieve (gi_rut)
				tabpage_2.dw_cobranza.retrieve (gi_rut)
				tabpage_1.dw_cliente.retrieve (gi_rut)
				if isvalid(w_general_cobranza_telefonica) then
					ll_tot_reg	= w_general_cobranza_telefonica.dw_lista.rowcount()
					if ll_tot_reg>0 then
						for ll_indi=1 to ll_tot_reg
							ll_rut	= w_general_cobranza_telefonica.dw_lista.getitemnumber(ll_indi,'rut')
							if ll_rut = gi_rut then
								w_general_cobranza_telefonica.dw_lista.setitem(ll_indi,'fecha_prox_llamado',date(em_fecha_prox.text))
							end if
							w_general_cobranza_telefonica.dw_lista.setitem(ll_indi,'est_reg',1)
						next
					end if
					w_general_cobranza_telefonica.tab_cobranza.visible	= false
				elseif isvalid(w_filtrar_cobranza) then
					ll_tot_reg	= w_filtrar_cobranza.dw_lista.rowcount()
					if ll_tot_reg>0 then
						for ll_indi=1 to ll_tot_reg
							if w_filtrar_cobranza.dw_lista.dataobject='dwv_list_mora_c_m_contratos_ni' then
								ll_rut 	= w_filtrar_cobranza.dw_lista.GetItemNumber(ll_indi, "vista_listado_contratos_ni_rut")
							elseif w_filtrar_cobranza.dw_lista.dataobject='dwv_list_mora_c_m_cobranza_8' then
								ll_rut 	= w_filtrar_cobranza.dw_lista.GetItemNumber(ll_indi, "vista_listado_cobranza_8_porce_rut")
							else
								ll_rut	= w_filtrar_cobranza.dw_lista.getitemnumber(ll_indi,'rut')
							end if
							if ll_rut = gi_rut then
								if w_filtrar_cobranza.dw_lista.dataobject='dwv_list_mora_c_m_contratos_ni' then
									w_filtrar_cobranza.dw_lista.setitem(ll_indi,'vista_listado_contratos_ni_fecha_prox_ll',date(em_fecha_prox.text))
								elseif w_filtrar_cobranza.dw_lista.dataobject='dwv_list_mora_c_m_cobranza_8' then
									w_filtrar_cobranza.dw_lista.setitem(ll_indi,'vista_listado_cobranza_8_porce_fecha_pro',date(em_fecha_prox.text))
									ls_base						= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_codigo')
									ls_serie						= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_serie')
									ldb_numero					= w_filtrar_cobranza.dw_lista.getitemnumber(ll_indi,'vista_listado_cobranza_8_porce_numero')
									ll_rut							= w_filtrar_cobranza.dw_lista.getitemnumber(ll_indi,'vista_listado_cobranza_8_porce_rut')
									ll_mora_cred				= w_filtrar_cobranza.dw_lista.getitemnumber(ll_indi,'vista_listado_cobranza_8_porce_mora_cred')
									ll_dias_mora_cred			= w_filtrar_cobranza.dw_lista.getitemnumber(ll_indi,'vista_listado_cobranza_8_porce_dias_mora')
									ld_fecha_venc_cred		= w_filtrar_cobranza.dw_lista.getitemdatetime(ll_indi,'vista_listado_cobranza_8_porce_fecha_ven')
									ll_mora_mant				= w_filtrar_cobranza.dw_lista.getitemnumber(ll_indi,'vista_listado_cobranza_8_porce_mora_mant')
									ll_dias_mora_mant		= w_filtrar_cobranza.dw_lista.getitemnumber(ll_indi,'vista_listado_cobranza_8_porce_dias_mo_1')
									ld_fecha_venc_mant		= w_filtrar_cobranza.dw_lista.getitemdatetime(ll_indi,'vista_listado_cobranza_8_porce_fecha_v_1')
									ll_facecidos					= w_filtrar_cobranza.dw_lista.getitemnumber(ll_indi,'vista_listado_cobranza_8_porce_fallecido')
									ls_dv							= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_dv')
									ls_nombre					= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_nombre')
									ls_ap_pat					= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_a_paterno')
									ls_ap_mat					= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_a_materno')
									ls_direc_p					= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_direccion')
									ls_cod_ciudad				= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_codigo_ci')
									ls_desc_ciudad				= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_ciudad')
									ls_cod_comuna				= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_codigo_co')
									ls_desc_comuna			= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_comuna')
									ls_fono_p					= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_fono_p')
									ls_fono_c					= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_fono_c')
									ls_estado_cob				= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_estado_co')
									ld_fecha_cob				= w_filtrar_cobranza.dw_lista.getitemdatetime(ll_indi,'vista_listado_cobranza_8_porce_fecha_cob')
									ls_glosa_cob				= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_glosa_cob')
									ls_estado_titular			= w_filtrar_cobranza.dw_lista.getitemstring(ll_indi,'vista_listado_cobranza_8_porce_estado_ti')
									ld_fecha_prox_llamado	= w_filtrar_cobranza.dw_lista.getitemdatetime(ll_indi,'vista_listado_cobranza_8_porce_fecha_pro')
									ldb_porce_facturado		= Double(w_filtrar_cobranza.dw_lista.getitemnumber(ll_indi,'c_facturado'))
									ldb_porce_mora_cred		= Double(w_filtrar_cobranza.dw_lista.getitemnumber(ll_indi,'c_porce_mora_cred'))
									ldb_porce_suma				= Double(w_filtrar_cobranza.dw_lista.getitemnumber(ll_indi,'c_suma_porce'))
									ld_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
									INSERT INTO "GESTION_COBRANZA"  
												( "BASE",		"SERIE",		"NUMERO",	"FECHA_ASIGNACION",	"RUT",	"ESTADO",	"MORA_CRED",	"DIAS_MORA_CRED",		"FECHA_VENC_CRED",	"MONTO_MORA_CRED",	"GASTOS_ADM_MORA_CRED",	"INTERES_MORA_CRED",	"TOTAL_MORA_CRED",	"MORA_MANT",	"DIAS_MORA_MANT",		"FECHA_VENC_MANT",	"MONTO_MORA_MANT",	"GASTOS_ADM_MORA_MANT",	"INTERES_MORA_MANT",	"TOTAL_MORA_MANT",	"FALLECIDOS",	"DV",		"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"DIRECCION_P",	"CODIGO_CIUDAD",	"CIUDAD",			"CODIGO_COMUNA",	"COMUNA",			"FONO_P",	"FONO_C",	"ESTADO_COBRANZA",	"FECHA_COBRANZA",	"GLOSA_COBRANZA",	"ESTADO_TITULAR",		"FECHA_PROX_LLAMADO",	"ESTATUS_TELEFONICO",	"ESTATUS_CARTA",	"ESTATUS_PUBLICO",	"USUARIO_ASIGNADO",	"USUARIO_ASIGNADOR",	"CODIGO_GRUPO",	"ESTADO_LLAMADA",	"PORCE_FACTURADO",		"PORCE_MORA_CRED",		"PORCE_SUMA" )  
									VALUES 	( :ls_base,	:ls_serie,		:ldb_numero,	:ld_fecha_hoy,				:ll_rut,	:ls_estado,	:ll_mora_cred,	:ll_dias_mora_cred,		:ld_fecha_venc_cred,		null,							null,									null,								null,							:ll_mora_mant,		:ll_dias_mora_mant,		:ld_fecha_venc_mant,	null,							null,									null,								null,							:ll_facecidos,	:ls_dv,	:ls_nombre,	:ls_ap_pat,		:ls_ap_mat,		:ls_direc_p,			:ls_cod_ciudad,			:ls_desc_ciudad,	:ls_cod_comuna,		:ls_desc_comuna,	:ls_fono_p,	:ls_fono_c,	:ls_estado_cob,			:ld_fecha_cob,			:ls_glosa_cob,			:ls_estado_titular,			:ld_fecha_prox_llamado,		null,								null,						null,						:gs_user,					:gs_user,					null,					'G',						:ldb_porce_facturado,		:ldb_porce_mora_cred,		:ldb_porce_suma )  
									USING		SQLCA;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								else
									w_filtrar_cobranza.dw_lista.setitem(ll_indi,'fecha_prox_llamado',date(em_fecha_prox.text))
									w_filtrar_cobranza.dw_lista.setitem(ll_indi,'gestion_cobranza_fecha_llamado',date(em_prox_llamado.text))
								end if								
							end if
						next
					end if
					w_filtrar_cobranza.tab_cobranza.visible			= false
					
				elseif isvalid(w_ingreso_individual_cobranza) then
					ll_tot_reg	= w_ingreso_individual_cobranza.dw_lista.rowcount()
					if ll_tot_reg>0 then
						ll_fila_pos = w_ingreso_individual_cobranza.dw_lista.Find("gestion_cobranza_rut = "+string(gi_rut), 1, ll_tot_reg)
						if ll_fila_pos > 0 then
							for ll_indi=ll_fila_pos to ll_tot_reg
								ll_rut	= w_ingreso_individual_cobranza.dw_lista.getitemnumber(ll_indi,'gestion_cobranza_rut')
								if ll_rut = gi_rut then
									w_ingreso_individual_cobranza.dw_lista.setitem(ll_indi,'gestion_cobranza_fecha_prox_llamado',date(em_fecha_prox.text))
									w_ingreso_individual_cobranza.dw_lista.setitem(ll_indi,'gestion_cobranza_fecha_llamado',date(em_prox_llamado.text))
									w_ingreso_individual_cobranza.dw_lista.setitem(ll_indi,'gestion_cobranza_estado_llamada','G')
									w_ingreso_individual_cobranza.dw_lista.setitem(ll_indi,'gestion_cobranza_glosa_cobranza',ls_glosa)
									w_ingreso_individual_cobranza.dw_lista.setitem(ll_indi,'gestion_cobranza_fecha_cobranza',ldt_fecha_gestion)
									w_ingreso_individual_cobranza.dw_lista.setitem(ll_indi,'gestion_cobranza_estado_cobranza',ls_estado)
									w_ingreso_individual_cobranza.dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_telefonico',0)
									w_ingreso_individual_cobranza.dw_lista.setitem(ll_indi,'cliente_prox_llamado_cob',date(gdt_fec_sistema))
								end if
							next
							w_ingreso_individual_cobranza.dw_lista.accepttext()
							if w_ingreso_individual_cobranza.dw_lista.update()=1 then
								commit;
								DECLARE x2 CURSOR FOR  
								SELECT	"CADENA"."CODIGO",   
											"CADENA"."SERIE",   
											"CADENA"."NUMERO"  
								FROM 		"CADENA"  
								WHERE  ( "CADENA"."RUT" = :gi_rut ) AND  
										 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C' ) AND  
										 ( "CADENA"."CODIGO" <> :gs_base ) AND  
										 ( "CADENA"."SERIE" <> :gs_serie ) AND  
										 ( "CADENA"."NUMERO" <> :gi_numero )   
								USING		Trans_2;
								open x2;
								DO WHILE Trans_2.sqlcode=0
									fetch x2 into :ls_base_adi, :ls_serie_adi, :ll_numero_adi;
									if ll_numero_adi > 0 and not isnull(ll_numero_adi) then
										ld_hora					= RelativeTime(ld_hora, 10)
										ldt_fecha_gestion		= datetime(date(gdt_fec_sistema),time(ld_hora))
										ls_glosa_adi	= ls_glosa+' (CTTO. ORIGINAL '+gs_base+gs_serie+string(gi_numero,'###,###,###,###,###')+')'
										INSERT INTO "TELE_LOG"  
												 ( "RUT"  ,	"ESTADO"  ,	"FECHA"   		,	"GLOSA",			"USUARIO",	"BASE"  ,			"SERIE"  ,		"NUMERO" )  
										VALUES ( :gi_rut,	:ls_estado,	:ldt_fecha_gestion ,:ls_glosa_adi,	:gs_user,	:ls_base_adi,	:ls_serie_adi,	:ll_numero_adi)  
										USING		Trans_1;
										if Trans_1.sqlcode=0 then
											commit using Trans_1;
										else
											rollback using Trans_1;
										end if
									end if
									Setnull(ll_numero_adi)
								LOOP
								close x2;
							else
								rollback;
							end if
						end if
					end if

//					ll_nro_grupo	= w_ingreso_individual_cobranza.dw_lista.getitemnumber(w_ingreso_individual_cobranza.dw_lista.getrow(),'gestion_cobranza_codigo_grupo')
//					SELECT	count("GESTION_COBRANZA"."RUT")  
//					INTO 		:ll_sum_reg  
//					FROM 		"GESTION_COBRANZA"  
//					WHERE  ( "GESTION_COBRANZA"."CODIGO_GRUPO" = :ll_nro_grupo ) AND  
//							 ( "GESTION_COBRANZA"."ESTADO_LLAMADA" = 'P' )   
//					USING		sqlca;
//					if sqlca.sqlcode=0 then
//						if ll_sum_reg=0 then
//							UPDATE	"GESTION_LISTA"  
//							SET 		"ESTADO" = 'G'  
//							WHERE 	"GESTION_LISTA"."CODIGO" = :ll_nro_grupo   
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//							else
//								rollback;
//							end if
//						end if
//					end if
					w_ingreso_individual_cobranza.tab_cobranza.visible	= false
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
Disconnect Using Trans_1;
end event

type dw_ultima_cobranza_telefonica from datawindow within tabpage_4
integer x = 9
integer y = 380
integer width = 2469
integer height = 260
integer taborder = 40
string title = "none"
string dataobject = "dw_ultima_cobranza_telefonica_por_rut"
boolean border = false
boolean livescroll = true
end type

type cb_cerrar_4 from commandbutton within tabpage_4
integer x = 1243
integer y = 1328
integer width = 1221
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

event clicked;if isvalid(w_general_cobranza_telefonica) then 
	w_general_cobranza_telefonica.tab_cobranza.visible		= false
	w_general_cobranza_telefonica.dw_lista.setfocus()
end if
if isvalid(w_ingreso_individual_cobranza) then 
	w_ingreso_individual_cobranza.tab_cobranza.visible		= false
	w_ingreso_individual_cobranza.dw_lista.setfocus()
end if
if isvalid(w_filtrar_cobranza) then 
	w_filtrar_cobranza.tab_cobranza.visible						= false
	w_filtrar_cobranza.dw_lista.setfocus()
end if
if isvalid(w_total_ctto_asignados) then
	w_total_ctto_asignados.tab_cobranza.visible				= false
	w_total_ctto_asignados.dw_lista.setfocus()
end if
end event

