forward
global type w_detalle_ventas_mensual from window
end type
type cb_politica from commandbutton within w_detalle_ventas_mensual
end type
type cb_cta_cte from commandbutton within w_detalle_ventas_mensual
end type
type cb_imprimir from commandbutton within w_detalle_ventas_mensual
end type
type cb_cerrar from commandbutton within w_detalle_ventas_mensual
end type
type dw_detalle from datawindow within w_detalle_ventas_mensual
end type
end forward

global type w_detalle_ventas_mensual from window
integer width = 3355
integer height = 1904
boolean titlebar = true
string title = "Detalle Producción por Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_politica cb_politica
cb_cta_cte cb_cta_cte
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_detalle dw_detalle
end type
global w_detalle_ventas_mensual w_detalle_ventas_mensual

type variables
long il_row
end variables

on w_detalle_ventas_mensual.create
this.cb_politica=create cb_politica
this.cb_cta_cte=create cb_cta_cte
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_politica,&
this.cb_cta_cte,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_detalle}
end on

on w_detalle_ventas_mensual.destroy
destroy(this.cb_politica)
destroy(this.cb_cta_cte)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
end on

event open;string	ls_codigo,ls_cod_contab,ls_cargo,ls_decrip_premio,ls_clasif_hist
long		ll_tot_reg,ll_indi,ll_premio_a,ll_premio_b
datetime	ldt_fecha

gf_centrar(w_detalle_ventas_mensual)
dw_detalle.dataobject = 'dw_detalle_gestion_mensual'
dw_detalle.settransobject(sqlca)
ldt_fecha											= datetime(date(substr(1,1,Message.StringParm)),time('00:00:00'))
ls_codigo											= substr(1,2,Message.StringParm)
ls_cod_contab										= substr(1,3,Message.StringParm)
ls_cargo												= substr(1,4,Message.StringParm)
ll_tot_reg											= dw_detalle.retrieve(ldt_fecha,ls_codigo)
ls_clasif_hist										= f_clasif_hist(ls_codigo,ldt_fecha)
SELECT	"DESCRIPCION",			"PREMIO1",		"PREMIO2"
INTO		:ls_decrip_premio,	:ll_premio_a,	:ll_premio_b
FROM		"PREMIO_TIPO"  
WHERE 	( "PREMIO_TIPO"."COD_CONTAB" = :ls_cod_contab ) AND  
         ( "PREMIO_TIPO"."CARGO" = :ls_cargo )
USING		sqlca;			

if ll_tot_reg>0 then
	dw_detalle.Object.usuario.text 			= gs_user
	dw_detalle.object.titulo1.text			= ls_decrip_premio
	dw_detalle.Object.clasif.text 			= gs_user
	for ll_indi=1 to ll_tot_reg
		if ls_cod_contab='P08' then
			dw_detalle.setitem(ll_indi,"c_cod_contab",ls_cod_contab)
			dw_detalle.setitem(ll_indi,"c_premio",ll_premio_a)
			dw_detalle.setitem(ll_indi,"c_cargo",ls_cargo)
		end if
	next
else
	messagebox("Advertencia","No registra dato")
	close(w_detalle_ventas_mensual)
end if
end event

type cb_politica from commandbutton within w_detalle_ventas_mensual
integer x = 1394
integer y = 1660
integer width = 425
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Politica Premios"
end type

event clicked;string	ls_cod_contab,ls_cargo,ls_decrip_premio,ls_string
long		ll_tipo_prem,ll_premio_a,ll_premio_b,ll_cod_parque

dw_detalle.accepttext()
if dw_detalle.rowcount() > 0 then
	ls_cod_contab		= dw_detalle.getitemstring(il_row,'c_cod_contab')
	ls_cargo				= dw_detalle.getitemstring(il_row,'c_cargo')
	ll_cod_parque		= dw_detalle.getitemnumber(il_row,'agentes_cod_parque')
	
	SELECT	"COD_PREMIO",	"DESCRIPCION",			"PREMIO1",		"PREMIO2"
	INTO		:ll_tipo_prem,	:ls_decrip_premio,	:ll_premio_a,	:ll_premio_b
	FROM		"PREMIO_TIPO"  
	WHERE 	"PREMIO_TIPO"."COD_CONTAB" = :ls_cod_contab AND  
				"PREMIO_TIPO"."CARGO" = :ls_cargo AND
				"PREMIO_TIPO"."PARQUE" = :ll_cod_parque
	USING		sqlca;
	if not isnull(ll_tipo_prem) and ll_tipo_prem>0 then
		ls_string				= string(ll_tipo_prem)+'~t'+ls_cod_contab+'~t'+ls_cargo+'~t'+string(ll_cod_parque)
		if isvalid(w_politica_premios) then close(w_politica_premios)
			OpenWithParm (w_politica_premios,ls_string)
		end if
end if
end event

type cb_cta_cte from commandbutton within w_detalle_ventas_mensual
integer x = 41
integer y = 1660
integer width = 425
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa

dw_detalle.accepttext()
if dw_detalle.dataobject='dw_detalle_gestion_mensual' and dw_detalle.rowcount() > 0 then
	gs_base				= dw_detalle.getitemstring(il_row,'cadena_codigo')
	gs_serie				= dw_detalle.getitemstring(il_row,'oferta_v_serie')
	gi_numero			= dw_detalle.getitemnumber(il_row,'oferta_v_nro_oferta')
	gi_rut					= dw_detalle.getitemnumber(il_row,'cadena_rut')
	if il_row>0 then
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" //Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
		END CHOOSE
	end if
end if
end event

type cb_imprimir from commandbutton within w_detalle_ventas_mensual
integer x = 2665
integer y = 1660
integer width = 315
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;long		ll_res

if dw_detalle.rowcount() > 0 then
	f_Print( dw_detalle )
end if
end event

type cb_cerrar from commandbutton within w_detalle_ventas_mensual
integer x = 2981
integer y = 1660
integer width = 315
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_ventas_mensual)
end event

type dw_detalle from datawindow within w_detalle_ventas_mensual
integer x = 41
integer y = 36
integer width = 3255
integer height = 1596
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_gestion_mensual"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

