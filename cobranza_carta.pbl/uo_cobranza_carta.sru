forward
global type uo_cobranza_carta from tab
end type
type tabpage_1 from userobject within uo_cobranza_carta
end type
type dw_cliente from datawindow within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type dw_contrato from datawindow within tabpage_1
end type
type cb_cerrar_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within uo_cobranza_carta
dw_cliente dw_cliente
st_4 st_4
dw_contrato dw_contrato
cb_cerrar_1 cb_cerrar_1
end type
type tabpage_2 from userobject within uo_cobranza_carta
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
type tabpage_2 from userobject within uo_cobranza_carta
cb_cerrar_2 cb_cerrar_2
st_5 st_5
dw_publico dw_publico
st_2 st_2
dw_carta dw_carta
st_1 st_1
dw_cobranza dw_cobranza
end type
type tabpage_3 from userobject within uo_cobranza_carta
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
type tabpage_3 from userobject within uo_cobranza_carta
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
end forward

global type uo_cobranza_carta from tab
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
end type
global uo_cobranza_carta uo_cobranza_carta

type variables

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

on uo_cobranza_carta.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on uo_cobranza_carta.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within uo_cobranza_carta
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
string dataobject = "dw_encabezado_antecedentes_cliente_carta"
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
integer height = 608
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_contrato_por_rut_cliente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;String	ls_base,ls_serie,ls_tipo_cob
Long		ll_folio,ll_fila
Double	ll_numero

This.accepttext()
if this.getrow()>0 then
	ll_fila		= This.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_fila, TRUE)
	ls_base		= this.getitemstring(ll_fila,'cadena_codigo')
	ls_serie		= this.getitemstring(ll_fila,'cadena_serie')
	ll_numero	= this.getitemnumber(ll_fila,'cadena_numero')
	if tabpage_3.dw_detalle_total.retrieve(ls_serie,ll_numero,ls_base)>0 then
		ll_folio		= tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
		ls_tipo_cob	= tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
		tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
	else
		tabpage_3.dw_detalle_pagos.reset()
	end if
	tabpage_3.dw_detalle_cuotas.retrieve(ls_serie,ll_numero,ls_base)
	tabpage_3.dw_detalle_mantencion.retrieve(ls_serie,ll_numero,ls_base)
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

event clicked;String		ls_base,ls_serie,ls_tipo_cob
Long		ll_folio,ll_fila
Double	ll_numero
This.accepttext()
if row > 0 then
	ll_fila		= row
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_fila, TRUE)
	ls_base		= this.getitemstring(ll_fila,'cadena_codigo')
	ls_serie		= this.getitemstring(ll_fila,'cadena_serie')
	ll_numero	= this.getitemnumber(ll_fila,'cadena_numero')
	if tabpage_3.dw_detalle_total.retrieve(ls_serie,ll_numero,ls_base)>0 then
		ll_folio		= tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
		ls_tipo_cob	= tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
		tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
	else
		tabpage_3.dw_detalle_pagos.reset()
	end if
	tabpage_3.dw_detalle_cuotas.retrieve(ls_serie,ll_numero,ls_base)
	tabpage_3.dw_detalle_mantencion.retrieve(ls_serie,ll_numero,ls_base)
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
	w_asignar_envio_carta.cb_ctacte2.triggerevent(clicked!)
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

event clicked;if isvalid(w_asignar_envio_carta) then 
	w_asignar_envio_carta.tab_carta.visible	= false
	w_asignar_envio_carta.dw_lista.setfocus()
end if
end event

type tabpage_2 from userobject within uo_cobranza_carta
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

event clicked;if isvalid(w_asignar_envio_carta) then 
	w_asignar_envio_carta.tab_carta.visible	= false
	w_asignar_envio_carta.dw_lista.setfocus()
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
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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

type tabpage_3 from userobject within uo_cobranza_carta
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

event clicked;if isvalid(w_asignar_envio_carta) then 
	w_asignar_envio_carta.tab_carta.visible	= false
	w_asignar_envio_carta.dw_lista.setfocus()
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
integer height = 284
integer taborder = 60
string title = "none"
string dataobject = "dw_ingreso_mantencion_cuenta_corriente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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
integer height = 284
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_cuotas_cuenta_corriente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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
integer height = 288
integer taborder = 40
string title = "none"
string dataobject = "dw_ingreso_todo_cuenta_corriente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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

