forward
global type uo_atencion_terreno from tab
end type
type tabpage_1 from userobject within uo_atencion_terreno
end type
type dw_cliente from datawindow within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type dw_contrato from datawindow within tabpage_1
end type
type cb_cerrar_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within uo_atencion_terreno
dw_cliente dw_cliente
st_4 st_4
dw_contrato dw_contrato
cb_cerrar_1 cb_cerrar_1
end type
type tabpage_2 from userobject within uo_atencion_terreno
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
type tabpage_2 from userobject within uo_atencion_terreno
cb_cerrar_2 cb_cerrar_2
st_5 st_5
dw_publico dw_publico
st_2 st_2
dw_carta dw_carta
st_1 st_1
dw_cobranza dw_cobranza
end type
type tabpage_3 from userobject within uo_atencion_terreno
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
type tabpage_3 from userobject within uo_atencion_terreno
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
type tabpage_4 from userobject within uo_atencion_terreno
end type
type em_fecha_prox_terre from editmask within tabpage_4
end type
type rb_no from radiobutton within tabpage_4
end type
type rb_si from radiobutton within tabpage_4
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
type tabpage_4 from userobject within uo_atencion_terreno
em_fecha_prox_terre em_fecha_prox_terre
rb_no rb_no
rb_si rb_si
em_fecha_prox em_fecha_prox
st_9 st_9
dw_ingreso dw_ingreso
dw_cliente2 dw_cliente2
cb_grabar cb_grabar
dw_ultima_cobranza_telefonica dw_ultima_cobranza_telefonica
cb_cerrar_4 cb_cerrar_4
end type
type tabpage_5 from userobject within uo_atencion_terreno
end type
type em_fecha_prox_visita_terre from editmask within tabpage_5
end type
type rb_no_terreno from radiobutton within tabpage_5
end type
type rb_si_terreno from radiobutton within tabpage_5
end type
type em_fecha_prox_visita from editmask within tabpage_5
end type
type cb_cerrar_at from commandbutton within tabpage_5
end type
type cb_grabar_at from commandbutton within tabpage_5
end type
type st_10 from statictext within tabpage_5
end type
type dw_ultima_cobranza_visita from datawindow within tabpage_5
end type
type dw_cliente3 from datawindow within tabpage_5
end type
type dw_ingreso_terreno from datawindow within tabpage_5
end type
type tabpage_5 from userobject within uo_atencion_terreno
em_fecha_prox_visita_terre em_fecha_prox_visita_terre
rb_no_terreno rb_no_terreno
rb_si_terreno rb_si_terreno
em_fecha_prox_visita em_fecha_prox_visita
cb_cerrar_at cb_cerrar_at
cb_grabar_at cb_grabar_at
st_10 st_10
dw_ultima_cobranza_visita dw_ultima_cobranza_visita
dw_cliente3 dw_cliente3
dw_ingreso_terreno dw_ingreso_terreno
end type
end forward

global type uo_atencion_terreno from tab
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
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
global uo_atencion_terreno uo_atencion_terreno

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

on uo_atencion_terreno.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on uo_atencion_terreno.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

type tabpage_1 from userobject within uo_atencion_terreno
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
integer height = 620
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_contrato_por_rut_cliente"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;String		ls_base,ls_serie,ls_tipo_cob
Long		ll_folio
Double	ll_numero
if getrow()>0 then
	il_fila		= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_fila, TRUE)
	ls_base		= this.getitemstring(il_fila,'cadena_codigo')
	ls_serie		= this.getitemstring(il_fila,'cadena_serie')
	ll_numero	= this.getitemnumber(il_fila,'cadena_numero')
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
Long		ll_folio
Double	ll_numero
if row>0 then
	il_fila		= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_fila, TRUE)
	ls_base		= this.getitemstring(il_fila,'cadena_codigo')
	ls_serie		= this.getitemstring(il_fila,'cadena_serie')
	ll_numero	= this.getitemnumber(il_fila,'cadena_numero')
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

type cb_cerrar_1 from commandbutton within tabpage_1
integer x = 18
integer y = 1340
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

event clicked;if isvalid(w_generar_filtro_at_terreno) then
	w_generar_filtro_at_terreno.tab_cobranza.visible						= false
end if
if isvalid(w_generar_filtro_cartera_cobranza) then
	w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
end if
if isvalid(w_ingreso_gestion_ejecutivo_terreno) then
	w_ingreso_gestion_ejecutivo_terreno.tab_cobranza.visible			= false
end if
if isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
	w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
end if
end event

type tabpage_2 from userobject within uo_atencion_terreno
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
integer y = 1340
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

event clicked;if isvalid(w_generar_filtro_at_terreno) then
	w_generar_filtro_at_terreno.tab_cobranza.visible						= false
end if
if isvalid(w_generar_filtro_cartera_cobranza) then
	w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
end if
if isvalid(w_ingreso_gestion_ejecutivo_terreno) then
	w_ingreso_gestion_ejecutivo_terreno.tab_cobranza.visible			= false
end if
if isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
	w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
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
string dataobject = "dw_lista_mov_atencion_log_rut_terreno"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_string
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
else
	ls_columna	= dwo.name
	if ls_columna='t_filtrar' then
		if dw_publico.object.t_filtrar.text='Mostrar Gestion Personal' then
			ls_string	= "usuario = '"+gs_user+"'"
			dw_publico.object.t_filtrar.text='Mostrar Todo'
		elseif dw_publico.object.t_filtrar.text='Mostrar Todo' then
			ls_string	= ""
			dw_publico.object.t_filtrar.text='Mostrar Gestion Personal'
		end if
		dw_publico.SETfilter(ls_string)
		dw_publico.filter()
	end if
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
borderstyle borderstyle = stylelowered!
end type

event clicked;string 	ls_string,ls_base,ls_serie
double	ll_numero

if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if

//ls_base		= dw_carta.getitemstring(row,'cadena_codigo')
//ls_serie		= dw_carta.getitemstring(row,'cadena_serie')
//ll_numero	= dw_carta.getitemnumber(row,'cadena_numero')
//
//ls_string		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
//
if isvalid(w_actualizar_estado_envio_carta_terreno) then close(w_actualizar_estado_envio_carta_terreno)
open(w_actualizar_estado_envio_carta_terreno)
//openwithparm(w_actualizar_estado_envio_carta_terreno,ls_string)
//
end event

event rowfocuschanged;string 	ls_string,ls_base,ls_serie
long		ll_row
double	ll_numero

if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if

//if isvalid(w_actualizar_estado_envio_carta_terreno) then close(w_actualizar_estado_envio_carta_terreno)
//open(w_actualizar_estado_envio_carta_terreno)
//ll_row			= long(getrow())
//
//ls_base		= this.getitemstring(ll_row,'cadena_codigo')
//ls_serie		= this.getitemstring(ll_row,'cadena_serie')
//ll_numero	= this.getitemnumber(ll_row,'cadena_numero')
//
//ls_string		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
//
//if isvalid(w_actualizar_estado_envio_carta_terreno) then close(w_actualizar_estado_envio_carta_terreno)
//openwithparm(w_actualizar_estado_envio_carta_terreno,ls_string)
//
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
string dataobject = "dw_lista_mov_tele_log_por_rut_terreno"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_string
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
else
	ls_columna	= dwo.name
	if ls_columna='t_filtrar' then
		if dw_cobranza.object.t_filtrar.text='Mostrar Gestion Personal' then
			ls_string	= "usuario = '"+gs_user+"'"
			dw_cobranza.object.t_filtrar.text='Mostrar Todo'
		elseif dw_cobranza.object.t_filtrar.text='Mostrar Todo' then
			ls_string	= ""
			dw_cobranza.object.t_filtrar.text='Mostrar Gestion Personal'
		end if
		dw_cobranza.SETfilter(ls_string)
		dw_cobranza.filter()
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type tabpage_3 from userobject within uo_atencion_terreno
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

event clicked;if isvalid(w_generar_filtro_at_terreno) then
	w_generar_filtro_at_terreno.tab_cobranza.visible						= false
end if
if isvalid(w_generar_filtro_cartera_cobranza) then
	w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
end if
if isvalid(w_ingreso_gestion_ejecutivo_terreno) then
	w_ingreso_gestion_ejecutivo_terreno.tab_cobranza.visible			= false
end if
if isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
	w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
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

type tabpage_4 from userobject within uo_atencion_terreno
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
em_fecha_prox_terre em_fecha_prox_terre
rb_no rb_no
rb_si rb_si
em_fecha_prox em_fecha_prox
st_9 st_9
dw_ingreso dw_ingreso
dw_cliente2 dw_cliente2
cb_grabar cb_grabar
dw_ultima_cobranza_telefonica dw_ultima_cobranza_telefonica
cb_cerrar_4 cb_cerrar_4
end type

on tabpage_4.create
this.em_fecha_prox_terre=create em_fecha_prox_terre
this.rb_no=create rb_no
this.rb_si=create rb_si
this.em_fecha_prox=create em_fecha_prox
this.st_9=create st_9
this.dw_ingreso=create dw_ingreso
this.dw_cliente2=create dw_cliente2
this.cb_grabar=create cb_grabar
this.dw_ultima_cobranza_telefonica=create dw_ultima_cobranza_telefonica
this.cb_cerrar_4=create cb_cerrar_4
this.Control[]={this.em_fecha_prox_terre,&
this.rb_no,&
this.rb_si,&
this.em_fecha_prox,&
this.st_9,&
this.dw_ingreso,&
this.dw_cliente2,&
this.cb_grabar,&
this.dw_ultima_cobranza_telefonica,&
this.cb_cerrar_4}
end on

on tabpage_4.destroy
destroy(this.em_fecha_prox_terre)
destroy(this.rb_no)
destroy(this.rb_si)
destroy(this.em_fecha_prox)
destroy(this.st_9)
destroy(this.dw_ingreso)
destroy(this.dw_cliente2)
destroy(this.cb_grabar)
destroy(this.dw_ultima_cobranza_telefonica)
destroy(this.cb_cerrar_4)
end on

type em_fecha_prox_terre from editmask within tabpage_4
integer x = 658
integer y = 1204
integer width = 512
integer height = 92
integer taborder = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type rb_no from radiobutton within tabpage_4
integer x = 1655
integer y = 1204
integer width = 233
integer height = 88
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
string text = "No"
end type

event clicked;em_fecha_prox.text	= ''
end event

type rb_si from radiobutton within tabpage_4
integer x = 1330
integer y = 1204
integer width = 233
integer height = 88
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
string text = "Si"
boolean checked = true
end type

type em_fecha_prox from editmask within tabpage_4
integer x = 41
integer y = 1204
integer width = 503
integer height = 92
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;if string(trim(em_fecha_prox.text))='00/00/0000' or string(trim(em_fecha_prox.text))='' then
	rb_no.checked	= true
	rb_si.checked	= false
else
	rb_no.checked	= false
	rb_si.checked	= true
end if
end event

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
string text = "Ingresar Atención Telefónica"
boolean focusrectangle = false
end type

type dw_ingreso from datawindow within tabpage_4
integer x = 9
integer y = 692
integer width = 2478
integer height = 624
integer taborder = 30
string title = "none"
string dataobject = "dw_ingreso_cobranza_terreno"
boolean border = false
boolean livescroll = true
end type

event clicked;string	ls_fecha,ls_columna
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'p_1'
		if trim(em_fecha_prox.text)='00/00/0000' or trim(em_fecha_prox.text)='' or &
			isnull(trim(em_fecha_prox.text)) then	
			
			em_fecha_prox.text	= string(today(),"dd/mm/yyyy")
		end if
		
		if f_valida_fecha(em_fecha_prox.text)=-1 then 
			em_fecha_prox.text=string(today(),gs_formato_fecha)
			em_fecha_prox.setfocus()
			return
		end if	
		if trim(em_fecha_prox.text)<>'00/00/0000' and not isnull(trim(em_fecha_prox.text)) and &
			trim(em_fecha_prox.text)<>'' then
			
			ls_fecha = em_fecha_prox.text
		else
			ls_fecha = string(today(),gs_formato_fecha)
		end if	
		em_fecha_prox.text = ls_fecha
		OpenWithParm(w_calendar,ls_fecha)
		em_fecha_prox.text = Message.StringParm
		if string(trim(em_fecha_prox.text))='00/00/0000' or string(trim(em_fecha_prox.text))='' then
			rb_no.checked	= true
			rb_si.checked	= false
		else
			rb_no.checked	= false
			rb_si.checked	= true
		end if

	CASE 'p_2'
		if trim(em_fecha_prox_terre.text)='00/00/0000' or trim(em_fecha_prox_terre.text)='' or &
			isnull(trim(em_fecha_prox_terre.text)) then	
			
			em_fecha_prox_terre.text	= string(today(),"dd/mm/yyyy")
		end if
		
		if f_valida_fecha(em_fecha_prox_terre.text)=-1 then 
			em_fecha_prox_terre.text=string(today(),gs_formato_fecha)
			em_fecha_prox_terre.setfocus()
			return
		end if	
		if trim(em_fecha_prox_terre.text)<>'00/00/0000' and not isnull(trim(em_fecha_prox_terre.text)) and &
			trim(em_fecha_prox_terre.text)<>'' then
			
			ls_fecha = em_fecha_prox_terre.text
		else
			ls_fecha = string(today(),gs_formato_fecha)
		end if	
		em_fecha_prox_terre.text = ls_fecha
		OpenWithParm(w_calendar,ls_fecha)
		em_fecha_prox_terre.text = Message.StringParm
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
integer y = 1340
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

event clicked;String	ls_estado,ls_glosa,ls_estado_llamada,ls_pasa,ls_estado_visita,ls_estado_gest='P'
Datetime	ldt_fecha_prox,ldt_fecha_crea,ldt_fec_hoy_370,ldt_fecha_terre
Long		ll_ret,ll_tot_reg,ll_indi,ll_rut,ll_grupo,ll_tipo_gestion

dw_ingreso.accepttext()
ls_pasa								= 'N'
ls_estado							= trim(dw_ingreso.getitemstring(1,'estado'))
ls_glosa								= trim(dw_ingreso.getitemstring(1,'glosa'))
ldt_fecha_prox						= datetime(date(em_fecha_prox.text))
ldt_fecha_terre						= datetime(date(em_fecha_prox_terre.text))

if string(em_fecha_prox.text)='00/00/0000' or string(em_fecha_prox.text)='' then SetNull(ldt_fecha_prox)
if string(em_fecha_prox_terre.text)='00/00/0000' or string(em_fecha_prox_terre.text)='' then SetNull(ldt_fecha_terre)
if rb_si.checked=true then
	ls_estado_llamada				= 'S'
elseif rb_no.checked=true then
	ls_estado_llamada				= 'N'
	SetNull(ldt_fecha_prox)
end if
if gs_tipo_cob='N' then
	ll_tipo_gestion					= 1
else
	ll_tipo_gestion					= 4
end if
if not isnull(ls_estado) and not isnull(ls_glosa) then //and not isnull(ldt_fecha_prox)
	ll_ret 								= messagebox('Actulizar','Desea actualizar los datos',Question!,YesNo!,2)
	if ll_ret = 1 then
		if isnull(ldt_fecha_terre) then
			ls_estado_visita		= 'N'
		else
			ls_estado_visita		= 'S'
		end if
		
		if gs_tipo_cob = 'N' then
			ldt_fecha_prox			=  ldt_fecha_terre
		end if
		
		SELECT	sysdate
		INTO 		:gdt_fec_sistema
		FROM 	"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
		USING	sqlca;
		
		UPDATE	"AT_GESTION"  
		SET 		"FECHA_PROX_LLAMADA" = :ldt_fecha_prox,
					"FECHA_PROX_VISITA" = :ldt_fecha_prox,
					"ESTADO_GESTION" = :ls_estado_gest,
					"TIPO_GESTION" = :ll_tipo_gestion,
					"ESTADO_LLAMADA" = :ls_estado_llamada,
					"ESTADO_VISITA" = :ls_estado_visita,
					"FEC_COMPROMISO" = :ldt_fecha_prox
		WHERE	( "AT_GESTION"."BASE" = :gs_base ) AND  
					( "AT_GESTION"."SERIE" = :gs_serie ) AND  
					( "AT_GESTION"."NUMERO" = :gi_numero )  and
					( "AT_GESTION"."TIPO_COBRANZA" = :gs_tipo_cob )
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			commit;
			INSERT INTO "TELE_LOG"  
						( "RUT"  ,"ESTADO"  ,"FECHA"   			,"GLOSA"    ,"USUARIO"  ,"BASE"  ,"SERIE"  ,"NUMERO" )  
			VALUES	( :gi_rut,:ls_estado,:gdt_fec_sistema ,:ls_glosa,:gs_user	  ,:gs_base,:gs_serie,:gi_numero)  ;
			if sqlca.sqlcode = 0 then
				commit;
			else
				rollback;
				messagebox('Error2','Error al Grabar '+sqlca.SQLErrText,information!)
			end if
			tabpage_4.dw_ultima_cobranza_telefonica.retrieve (gi_rut)
			tabpage_2.dw_cobranza.retrieve (gi_rut)
			tabpage_1.dw_cliente.retrieve (gi_rut)
			if isvalid(w_generar_filtro_at_terreno) or isvalid(w_generar_filtro_cartera_cobranza) then
				if isvalid(w_generar_filtro_at_terreno) then
					ll_tot_reg	= w_generar_filtro_at_terreno.dw_lista.rowcount()
					if ll_tot_reg>0 then
						for ll_indi=1 to ll_tot_reg
							ll_rut	= w_generar_filtro_at_terreno.dw_lista.getitemnumber(ll_indi,'rut')
							if ll_rut = gi_rut then
								w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'at_gestion_estado_llamada',ls_estado_llamada)
								w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'at_gestion_fecha_prox_llamada',date(ldt_fecha_prox))
								w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'at_gestion_fecha_prox_visita',date(ldt_fecha_terre))
								w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'at_gestion_estado_visita',ls_estado_visita)
								w_generar_filtro_at_terreno.dw_lista.accepttext()
							end if
						next
					end if
					w_generar_filtro_at_terreno.tab_cobranza.visible	= false
				elseif isvalid(w_generar_filtro_cartera_cobranza) then
					ll_tot_reg	= w_generar_filtro_cartera_cobranza.dw_lista.rowcount()
					if ll_tot_reg>0 then
						for ll_indi=1 to ll_tot_reg
							ll_rut	= w_generar_filtro_cartera_cobranza.dw_lista.getitemnumber(ll_indi,'vista_at_terreno_cobranza_rut')
							if ll_rut = gi_rut then
								w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'estado_llamada',ls_estado_llamada)
								w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'fecha_prox_llamada',date(ldt_fecha_prox))
								w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'fecha_prox_visita',date(ldt_fecha_terre))
								w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'estado_visita',ls_estado_visita)
								w_generar_filtro_cartera_cobranza.dw_lista.accepttext()
							end if
						next
					end if
					w_generar_filtro_cartera_cobranza.tab_cobranza.visible	= false
				end if
			end if	
			if isvalid(w_ingreso_gestion_ejecutivo_terreno) or isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
				if isvalid(w_ingreso_gestion_ejecutivo_terreno) then
					ll_tot_reg	= w_ingreso_gestion_ejecutivo_terreno.dw_lista.rowcount()
					if ll_tot_reg>0 then
						for ll_indi=1 to ll_tot_reg
							ll_rut	= w_ingreso_gestion_ejecutivo_terreno.dw_lista.getitemnumber(ll_indi,'at_gestion_rut_cliente')
							if ll_rut = gi_rut then
								w_ingreso_gestion_ejecutivo_terreno.dw_lista.setitem(ll_indi,'at_gestion_fecha_prox_llamada',date(ldt_fecha_prox))
								w_ingreso_gestion_ejecutivo_terreno.dw_lista.setitem(ll_indi,'at_gestion_estado_gestion','G')
								w_ingreso_gestion_ejecutivo_terreno.dw_lista.setitem(ll_indi,'at_gestion_tipo_gestion',ll_tipo_gestion)
								w_ingreso_gestion_ejecutivo_terreno.dw_lista.setitem(ll_indi,'at_gestion_estado_llamada',ls_estado_llamada)
								w_ingreso_gestion_ejecutivo_terreno.dw_lista.setitem(ll_indi,'at_gestion_estado_visita',ls_estado_visita)
								w_ingreso_gestion_ejecutivo_terreno.dw_lista.setitem(ll_indi,'at_gestion_fecha_prox_visita',date(ldt_fecha_terre))
								w_ingreso_gestion_ejecutivo_terreno.dw_lista.accepttext()
							end if
						next
					end if
					w_ingreso_gestion_ejecutivo_terreno.tab_cobranza.visible	= false
				elseif isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
					ll_tot_reg	= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.rowcount()
					if ll_tot_reg>0 then
						for ll_indi=1 to ll_tot_reg
							ll_rut	= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'rut_cliente')
							if ll_rut = gi_rut then
								w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'fecha_prox_llamada',date(ldt_fecha_prox))
								w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'estado_gestion',ls_estado_gest)
								w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'tipo_gestion',ll_tipo_gestion)
								w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'estado_llamada',ls_estado_llamada)
								w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'estado_visita',ls_estado_visita)
								w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'fecha_prox_visita',date(ldt_fecha_terre))
								w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'fec_compromiso',date(ldt_fecha_prox))
								w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.accepttext()
							end if
						next
					end if
					w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
				end if
			end if	
			if isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
				ll_tot_reg	= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.rowcount()
				if ll_tot_reg>0 then
					for ll_indi=1 to ll_tot_reg
						ll_rut	= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'rut_cliente')
						if ll_rut = gi_rut then
							w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'fecha_prox_llamada',date(ldt_fecha_prox))
							w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'estado_gestion',ls_estado_gest)
							w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'tipo_gestion',ll_tipo_gestion)
							w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'estado_llamada',ls_estado_llamada)
							w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'estado_visita',ls_estado_visita)
							w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'fecha_prox_visita',date(ldt_fecha_terre))
							w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'fec_compromiso',date(ldt_fecha_prox))
							w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.accepttext()
						end if
					next
				end if
				w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
			end if	
		else
			messagebox('Error1','Error al Grabar '+sqlca.SQLErrText,information!)
			ROLLBACK;
		end if
	end if
else
	messagebox("Advertencia","Debe Ingresar Datos")
//	dw_ingreso.setfocus()
end if
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
integer x = 1248
integer y = 1340
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

event clicked;if isvalid(w_generar_filtro_at_terreno) then
	w_generar_filtro_at_terreno.tab_cobranza.visible						= false
end if
if isvalid(w_generar_filtro_cartera_cobranza) then
	w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
end if
if isvalid(w_ingreso_gestion_ejecutivo_terreno) then
	w_ingreso_gestion_ejecutivo_terreno.tab_cobranza.visible			= false
end if
if isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
	w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
end if
end event

type tabpage_5 from userobject within uo_atencion_terreno
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2491
integer height = 1460
long backcolor = 67108864
string text = "Gestión Terreno"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
em_fecha_prox_visita_terre em_fecha_prox_visita_terre
rb_no_terreno rb_no_terreno
rb_si_terreno rb_si_terreno
em_fecha_prox_visita em_fecha_prox_visita
cb_cerrar_at cb_cerrar_at
cb_grabar_at cb_grabar_at
st_10 st_10
dw_ultima_cobranza_visita dw_ultima_cobranza_visita
dw_cliente3 dw_cliente3
dw_ingreso_terreno dw_ingreso_terreno
end type

on tabpage_5.create
this.em_fecha_prox_visita_terre=create em_fecha_prox_visita_terre
this.rb_no_terreno=create rb_no_terreno
this.rb_si_terreno=create rb_si_terreno
this.em_fecha_prox_visita=create em_fecha_prox_visita
this.cb_cerrar_at=create cb_cerrar_at
this.cb_grabar_at=create cb_grabar_at
this.st_10=create st_10
this.dw_ultima_cobranza_visita=create dw_ultima_cobranza_visita
this.dw_cliente3=create dw_cliente3
this.dw_ingreso_terreno=create dw_ingreso_terreno
this.Control[]={this.em_fecha_prox_visita_terre,&
this.rb_no_terreno,&
this.rb_si_terreno,&
this.em_fecha_prox_visita,&
this.cb_cerrar_at,&
this.cb_grabar_at,&
this.st_10,&
this.dw_ultima_cobranza_visita,&
this.dw_cliente3,&
this.dw_ingreso_terreno}
end on

on tabpage_5.destroy
destroy(this.em_fecha_prox_visita_terre)
destroy(this.rb_no_terreno)
destroy(this.rb_si_terreno)
destroy(this.em_fecha_prox_visita)
destroy(this.cb_cerrar_at)
destroy(this.cb_grabar_at)
destroy(this.st_10)
destroy(this.dw_ultima_cobranza_visita)
destroy(this.dw_cliente3)
destroy(this.dw_ingreso_terreno)
end on

type em_fecha_prox_visita_terre from editmask within tabpage_5
integer x = 667
integer y = 1196
integer width = 503
integer height = 92
integer taborder = 70
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type rb_no_terreno from radiobutton within tabpage_5
integer x = 1655
integer y = 1204
integer width = 233
integer height = 88
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
string text = "No"
end type

event clicked;em_fecha_prox_visita.text	= ''
end event

type rb_si_terreno from radiobutton within tabpage_5
integer x = 1330
integer y = 1204
integer width = 233
integer height = 88
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
string text = "Si"
boolean checked = true
end type

type em_fecha_prox_visita from editmask within tabpage_5
integer x = 27
integer y = 1200
integer width = 512
integer height = 92
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;if string(trim(em_fecha_prox_visita.text))='00/00/0000' or string(trim(em_fecha_prox_visita.text))='' then
	rb_no_terreno.checked	= true
	rb_si_terreno.checked	= false
else
	rb_no_terreno.checked	= false
	rb_si_terreno.checked	= true
end if
end event

type cb_cerrar_at from commandbutton within tabpage_5
integer x = 1248
integer y = 1340
integer width = 1216
integer height = 104
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_generar_filtro_at_terreno) then
	w_generar_filtro_at_terreno.tab_cobranza.visible						= false
end if
if isvalid(w_generar_filtro_cartera_cobranza) then
	w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
end if
if isvalid(w_ingreso_gestion_ejecutivo_terreno) then
	w_ingreso_gestion_ejecutivo_terreno.tab_cobranza.visible			= false
end if
if isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
	w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
end if
end event

type cb_grabar_at from commandbutton within tabpage_5
integer x = 23
integer y = 1340
integer width = 1221
integer height = 104
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Grabar"
end type

event clicked;String		ls_estado,ls_glosa,ls_estado_llamada,ls_pasa,ls_estado_visita,ls_cod_aten,ls_estado_gest='P',ls_tipo
Datetime	ldt_fecha_prox,ldt_fecha_crea,ldt_fec_hoy_370,ldt_fecha_prox_terre
Long		ll_ret,ll_tot_reg,ll_indi,ll_rut,ll_grupo,ll_tipo_gestion

dw_ingreso_terreno.accepttext()
ls_estado				= trim(dw_ingreso_terreno.getitemstring(1,'estado'))
ls_glosa					= trim(dw_ingreso_terreno.getitemstring(1,'glosa'))
ldt_fecha_prox			= datetime(date(em_fecha_prox_visita.text))
ldt_fecha_prox_terre	= datetime(date(em_fecha_prox_visita.text)) // prueba
//ldt_fecha_prox_terre	= datetime(date(em_fecha_prox_visita_terre.text))
if string(em_fecha_prox_visita_terre.text)='00/00/0000' or string(em_fecha_prox_visita_terre.text)='' then 
	SetNull(ldt_fecha_prox_terre)
	ls_estado_visita	= 'N'
else
	ls_estado_visita	= 'S'
end if
ls_pasa					= 'N'
if rb_si_terreno.checked=true then
	ls_estado_llamada	= 'S'
elseif rb_no_terreno.checked=true then
	ls_estado_llamada	= 'N'
	setnull(ldt_fecha_prox)
end if
if gs_tipo_cob='N' then
	ll_tipo_gestion			= 1
	ls_tipo					= 'N'
else
	ll_tipo_gestion			= 4
	ls_tipo					= 'CM'			
end if	
	
DECLARE x1 CURSOR FOR
SELECT		"ESTADO_ATENCION"."ESTADO_STRING"
FROM			"ESTADO_ATENCION" 
WHERE		"ESTADO_ATENCION"."ESTADO_GESTION" ='G' AND
				"ESTADO_ATENCION"."TIPO_COBRANZA"=:ls_tipo
ORDER BY	"ESTADO_ATENCION"."COD_ESATDO"
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
	fetch x1 INTO	:ls_cod_aten;
		if not isnull(ls_cod_aten) then
			if ls_estado = ls_cod_aten  then
				ls_estado_gest						= 'G'
			end if
		end if
		setnull(ls_cod_aten)
	LOOP
end if
close x1;
if not isnull(ls_estado) and not isnull(ls_glosa) then //and not isnull(ldt_fecha_prox)
	ll_ret 		= messagebox('Actulizar','Desea actualizar los datos',Question!,YesNo!,2)
	if ll_ret = 1 then
		SELECT	sysdate
		INTO 		:gdt_fec_sistema
		FROM 	"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
		USING	sqlca;
		
		if gs_tipo_cob = 'N' then	
			UPDATE	"AT_GESTION"  
			SET 		"FECHA_PROX_VISITA" = :ldt_fecha_prox,   
						"ESTADO_GESTION" = :ls_estado_gest,
						"TIPO_GESTION" = :ll_tipo_gestion,
						"ESTADO_VISITA" = :ls_estado_llamada,  
						"FECHA_PROX_LLAMADA" = :ldt_fecha_prox_terre,
						"ESTADO_LLAMADA" = :ls_estado_visita,
						"FEC_COMPROMISO" = :ldt_fecha_prox_terre
			WHERE	"AT_GESTION"."BASE" = :gs_base AND  
						"AT_GESTION"."SERIE" = :gs_serie AND  
						"AT_GESTION"."NUMERO" = :gi_numero AND
						( "AT_GESTION"."TIPO_COBRANZA" = :gs_tipo_cob )
			USING	sqlca;
		elseif gs_tipo_cob = 'T' then
			UPDATE	"AT_GESTION"  
			SET 		"FECHA_PROX_VISITA" = :ldt_fecha_prox,   
						"ESTADO_GESTION" = :ls_estado_gest,
						"TIPO_GESTION" = :ll_tipo_gestion,
						"ESTADO_VISITA" = :ls_estado_llamada,  
	//					"FECHA_PROX_LLAMADA" = :ldt_fecha_prox_terre,
						"FECHA_PROX_LLAMADA" = :ldt_fecha_prox,
						"ESTADO_LLAMADA" = :ls_estado_visita,
						"FEC_COMPROMISO" = :ldt_fecha_prox_terre
					//	"FEC_COMPROMISO" = :ldt_fecha_prox 
			WHERE	"AT_GESTION"."BASE" = :gs_base AND  
						"AT_GESTION"."SERIE" = :gs_serie AND  
						"AT_GESTION"."NUMERO" = :gi_numero AND
						( "AT_GESTION"."TIPO_COBRANZA" = :gs_tipo_cob )
			USING	sqlca;
		end if	
		if sqlca.sqlcode = 0 then
			commit;
			INSERT INTO "ATENCION_LOG"  
						( "RUT",	"ESTADO",	"FECHA",				"GLOSA",		"USUARIO",	"BASE",		"SERIE",		"NUMERO" )  
			VALUES 	( :gi_rut,	:ls_estado,	:gdt_fec_sistema,	:ls_glosa,	:gs_user,	:gs_base,	:gs_serie,	:gi_numero )  
			USING		sqlca;
			if sqlca.sqlcode = 0 then
				commit;
				tabpage_4.dw_ultima_cobranza_telefonica.retrieve (gi_rut)
				tabpage_2.dw_cobranza.retrieve (gi_rut)
				tabpage_1.dw_cliente.retrieve (gi_rut)
				if isvalid(w_generar_filtro_at_terreno) or isvalid(w_generar_filtro_cartera_cobranza) then
					if isvalid(w_generar_filtro_at_terreno) then
						ll_tot_reg	= w_generar_filtro_at_terreno.dw_lista.rowcount()
						if ll_tot_reg>0 then
							for ll_indi=1 to ll_tot_reg
								ll_rut	= w_generar_filtro_at_terreno.dw_lista.getitemnumber(ll_indi,'rut')
								if ll_rut = gi_rut then
									w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'at_gestion_fecha_prox_visita',ldt_fecha_prox)
									w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'at_gestion_estado_visita',ls_estado_llamada)
									w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'at_gestion_fecha_prox_llamada',ldt_fecha_prox_terre)
									w_generar_filtro_at_terreno.dw_lista.setitem(ll_indi,'at_gestion_estado_llamada',ls_estado_visita)
									w_generar_filtro_at_terreno.dw_lista.accepttext()
								end if
							next
						end if
						w_generar_filtro_at_terreno.tab_cobranza.visible	= false
					elseif isvalid(w_generar_filtro_cartera_cobranza) then
						ll_tot_reg	= w_generar_filtro_cartera_cobranza.dw_lista.rowcount()
						if ll_tot_reg>0 then
							for ll_indi=1 to ll_tot_reg
								ll_rut	= w_generar_filtro_cartera_cobranza.dw_lista.getitemnumber(ll_indi,'vista_at_terreno_cobranza_rut')
								if ll_rut = gi_rut then
									w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'fecha_prox_visita',ldt_fecha_prox)
									w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'estado_visita',ls_estado_llamada)
									w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'fecha_prox_llamada',ldt_fecha_prox_terre)
									w_generar_filtro_cartera_cobranza.dw_lista.setitem(ll_indi,'estado_llamada',ls_estado_visita)
									w_generar_filtro_cartera_cobranza.dw_lista.accepttext()
								end if
							next
						end if
						w_generar_filtro_cartera_cobranza.tab_cobranza.visible	= false
					end if
				end if	
				if isvalid(w_ingreso_gestion_ejecutivo_terreno) or isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
					if isvalid(w_ingreso_gestion_ejecutivo_terreno) then
						ll_tot_reg	= w_ingreso_gestion_ejecutivo_terreno.dw_lista.rowcount()
						if ll_tot_reg>0 then
							for ll_indi=1 to ll_tot_reg
								ll_rut	= w_ingreso_gestion_ejecutivo_terreno.dw_lista.getitemnumber(ll_indi,'at_gestion_rut_cliente')
								if ll_rut = gi_rut then
									w_ingreso_gestion_ejecutivo_terreno.dw_lista.setitem(ll_indi,'at_gestion_fecha_prox_visita',ldt_fecha_prox)
									w_ingreso_gestion_ejecutivo_terreno.dw_lista.setitem(ll_indi,'at_gestion_estado_gestion','G')
									w_ingreso_gestion_ejecutivo_terreno.dw_lista.setitem(ll_indi,'at_gestion_tipo_gestion',ll_tipo_gestion)
									w_ingreso_gestion_ejecutivo_terreno.dw_lista.setitem(ll_indi,'at_gestion_estado_visita',ls_estado_llamada)  
									w_ingreso_gestion_ejecutivo_terreno.dw_lista.setitem(ll_indi,'at_gestion_fecha_prox_llamada',ldt_fecha_prox_terre)
									w_ingreso_gestion_ejecutivo_terreno.dw_lista.setitem(ll_indi,'at_gestion_estado_llamada',ls_estado_visita)
									w_ingreso_gestion_ejecutivo_terreno.dw_lista.accepttext()
								end if
							next
						end if
						w_ingreso_gestion_ejecutivo_terreno.tab_cobranza.visible	= false
					elseif isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
						ll_tot_reg	= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.rowcount()
						if ll_tot_reg>0 then
							for ll_indi=1 to ll_tot_reg
								ll_rut	= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'rut_cliente')
								if ll_rut = gi_rut then
									w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'fecha_prox_visita',ldt_fecha_prox)
									w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'estado_gestion',ls_estado_gest)
									w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'tipo_gestion',ll_tipo_gestion)
									w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'estado_visita',ls_estado_llamada)  
									w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'fecha_prox_llamada',ldt_fecha_prox_terre)
									w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.setitem(ll_indi,'estado_llamada',ls_estado_visita)
									w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.accepttext()
								end if
							next
						end if
						w_ingreso_gestion_ejecutivo_terreno_cob.tab_cobranza.visible	= false
					end if
				end if	
			else
				messagebox('Error2','Error al Grabar '+sqlca.SQLErrText,information!)
				ROLLBACK;
			end if
		else
			messagebox('Error1','Error al Grabar '+sqlca.SQLErrText,information!)
			ROLLBACK;
		end if
	end if
else
	messagebox("Advertencia","Debe Ingresar Datos")
//	dw_ingreso_terreno.setfocus()
end if
end event

type st_10 from statictext within tabpage_5
integer x = 59
integer y = 636
integer width = 763
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Atención Telefónica"
boolean focusrectangle = false
end type

type dw_ultima_cobranza_visita from datawindow within tabpage_5
integer x = 9
integer y = 380
integer width = 2469
integer height = 264
integer taborder = 30
string title = "none"
string dataobject = "dw_ultima_gestion_atencion_cliente"
boolean border = false
boolean livescroll = true
end type

type dw_cliente3 from datawindow within tabpage_5
integer x = 14
integer y = 8
integer width = 2469
integer height = 380
integer taborder = 20
string title = "none"
string dataobject = "dw_encabezado_antecedentes_cliente2"
boolean border = false
boolean livescroll = true
end type

type dw_ingreso_terreno from datawindow within tabpage_5
integer x = 9
integer y = 692
integer width = 2478
integer height = 624
integer taborder = 20
string title = "none"
string dataobject = "dw_gestionar_atencion_log_terreno"
boolean border = false
boolean livescroll = true
end type

event clicked;string	ls_fecha,ls_columna
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'p_1'
		if trim(em_fecha_prox_visita.text)='00/00/0000' or trim(em_fecha_prox_visita.text)='' or &
			isnull(trim(em_fecha_prox_visita.text)) then	
			
			em_fecha_prox_visita.text	= string(today(),"dd/mm/yyyy")
		end if
		
		if f_valida_fecha(em_fecha_prox_visita.text)=-1 then 
			em_fecha_prox_visita.text=string(today(),gs_formato_fecha)
			em_fecha_prox_visita.setfocus()
			return
		end if	
		if trim(em_fecha_prox_visita.text)<>'00/00/0000' and not isnull(trim(em_fecha_prox_visita.text)) and &
			trim(em_fecha_prox_visita.text)<>'' then
			
			ls_fecha = em_fecha_prox_visita.text
		else
			ls_fecha = string(today(),gs_formato_fecha)
		end if	
		em_fecha_prox_visita.text = ls_fecha
		OpenWithParm(w_calendar,ls_fecha)
		em_fecha_prox_visita.text = Message.StringParm
		if string(trim(em_fecha_prox_visita.text))='00/00/0000' or string(trim(em_fecha_prox_visita.text))='' then
			rb_no_terreno.checked	= true
			rb_si_terreno.checked	= false
		else
			rb_no_terreno.checked	= false
			rb_si_terreno.checked	= true
		end if
		
	CASE 'p_2'
		if trim(em_fecha_prox_visita_terre.text)='00/00/0000' or trim(em_fecha_prox_visita_terre.text)='' or &
			isnull(trim(em_fecha_prox_visita_terre.text)) then	
			
			em_fecha_prox_visita_terre.text	= string(today(),"dd/mm/yyyy")
		end if
		
		if f_valida_fecha(em_fecha_prox_visita_terre.text)=-1 then 
			em_fecha_prox_visita_terre.text=string(today(),gs_formato_fecha)
			em_fecha_prox_visita_terre.setfocus()
			return
		end if	
		if trim(em_fecha_prox_visita_terre.text)<>'00/00/0000' and not isnull(trim(em_fecha_prox_visita_terre.text)) and &
			trim(em_fecha_prox_visita_terre.text)<>'' then
			
			ls_fecha = em_fecha_prox_visita_terre.text
		else
			ls_fecha = string(today(),gs_formato_fecha)
		end if	
		em_fecha_prox_visita_terre.text = ls_fecha
		OpenWithParm(w_calendar,ls_fecha)
		em_fecha_prox_visita_terre.text = Message.StringParm
		
END CHOOSE
end event

