forward
global type w_premio_incremento_comi_detalle from window
end type
type cb_cta_cte from commandbutton within w_premio_incremento_comi_detalle
end type
type cb_imprimir from commandbutton within w_premio_incremento_comi_detalle
end type
type cb_cerrar from commandbutton within w_premio_incremento_comi_detalle
end type
type dw_detalle from datawindow within w_premio_incremento_comi_detalle
end type
end forward

global type w_premio_incremento_comi_detalle from window
integer width = 3355
integer height = 1904
boolean titlebar = true
string title = "Detalle Premio"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_cta_cte cb_cta_cte
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_detalle dw_detalle
end type
global w_premio_incremento_comi_detalle w_premio_incremento_comi_detalle

type variables
long il_row
end variables

on w_premio_incremento_comi_detalle.create
this.cb_cta_cte=create cb_cta_cte
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_cta_cte,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_detalle}
end on

on w_premio_incremento_comi_detalle.destroy
destroy(this.cb_cta_cte)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
end on

event open;string	ls_cod_jef,ls_canal
long		ll_cod_parque,ll_tot_reg,ll_mes,ll_ano
datetime	ldt_fecha_cierre,ldt_fec_comi
gf_centrar(w_premio_incremento_comi_detalle)

ldt_fecha_cierre								= datetime(date(substr(1,1,Message.StringParm)))
ls_cod_jef										= substr(1,2,Message.StringParm)
ll_cod_parque									= long(substr(1,3,Message.StringParm))
ls_canal											= substr(1,4,Message.StringParm)
ll_mes											= month(date(ldt_fecha_cierre))
ll_ano												= year(date(ldt_fecha_cierre))
if not isnull(ldt_fecha_cierre) then
	if ll_mes = 12 then
		ll_mes 										= ll_mes - 11
		ll_ano 										= ll_ano + 1
	else
		ll_mes						 				= ll_mes + 1
		ll_ano 										= ll_ano
	end if
	ldt_fec_comi									= datetime(date(string('15/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))),time('00:00:00'))
	if ls_canal='NI' or ls_canal='NF' or ls_canal='UG' or ls_canal='T'  then 
		dw_detalle.dataobject					= 'dw_bono_jefe_presupuesto_detalle'
		dw_detalle.settransobject(sqlca)
		ll_tot_reg										= dw_detalle.retrieve(ldt_fecha_cierre,ls_cod_jef,ldt_fec_comi)
		
	//elseif ls_canal='UG' or ls_canal='T' then
		//dw_detalle.dataobject					= 'dw_bono_jefe_presupuesto_detalle_ug'
		dw_detalle.settransobject(sqlca)
		//ll_tot_reg									= dw_detalle.retrieve(ldt_fecha_cierre,ls_cod_jef,ll_cod_parque)
	end if
	if ll_tot_reg>0 then
		dw_detalle.object.usuario.text			= gs_user
	else
		messagebox("Advertencia","No Registra Dato")
		close(w_premio_incremento_comi_detalle)
	end if
end if
end event

type cb_cta_cte from commandbutton within w_premio_incremento_comi_detalle
integer x = 27
integer y = 1640
integer width = 448
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa

if dw_detalle.rowcount() > 0 then
	gs_base						= dw_detalle.getitemstring(il_row,'res_comi_base')
	gs_serie						= dw_detalle.getitemstring(il_row,'res_comi_serie')
	gi_numero					= dw_detalle.getitemnumber(il_row,'res_comi_contrato')
	gi_rut							= dw_detalle.getitemnumber(il_row,'vista_producc_mensual_rut')
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
end event

type cb_imprimir from commandbutton within w_premio_incremento_comi_detalle
integer x = 1550
integer y = 1640
integer width = 274
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() >0 then 
	f_Print( dw_detalle )
end if
end event

type cb_cerrar from commandbutton within w_premio_incremento_comi_detalle
integer x = 2994
integer y = 1640
integer width = 274
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premio_incremento_comi_detalle)
end event

type dw_detalle from datawindow within w_premio_incremento_comi_detalle
integer x = 41
integer y = 32
integer width = 3227
integer height = 1584
integer taborder = 10
string title = "none"
string dataobject = "dw_bono_jefe_presupuesto_detalle"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event itemchanged;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

