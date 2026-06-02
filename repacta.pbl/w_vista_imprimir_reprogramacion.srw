forward
global type w_vista_imprimir_reprogramacion from window
end type
type pb_fin from picturebutton within w_vista_imprimir_reprogramacion
end type
type pb_sigue from picturebutton within w_vista_imprimir_reprogramacion
end type
type pb_antes from picturebutton within w_vista_imprimir_reprogramacion
end type
type pb_primero from picturebutton within w_vista_imprimir_reprogramacion
end type
type cb_imprimir from commandbutton within w_vista_imprimir_reprogramacion
end type
type cb_cancelar from commandbutton within w_vista_imprimir_reprogramacion
end type
type dw_print from datawindow within w_vista_imprimir_reprogramacion
end type
type gb_1 from groupbox within w_vista_imprimir_reprogramacion
end type
end forward

global type w_vista_imprimir_reprogramacion from window
integer width = 3959
integer height = 1872
boolean titlebar = true
string title = "Impresión Previa"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_fin pb_fin
pb_sigue pb_sigue
pb_antes pb_antes
pb_primero pb_primero
cb_imprimir cb_imprimir
cb_cancelar cb_cancelar
dw_print dw_print
gb_1 gb_1
end type
global w_vista_imprimir_reprogramacion w_vista_imprimir_reprogramacion

on w_vista_imprimir_reprogramacion.create
this.pb_fin=create pb_fin
this.pb_sigue=create pb_sigue
this.pb_antes=create pb_antes
this.pb_primero=create pb_primero
this.cb_imprimir=create cb_imprimir
this.cb_cancelar=create cb_cancelar
this.dw_print=create dw_print
this.gb_1=create gb_1
this.Control[]={this.pb_fin,&
this.pb_sigue,&
this.pb_antes,&
this.pb_primero,&
this.cb_imprimir,&
this.cb_cancelar,&
this.dw_print,&
this.gb_1}
end on

on w_vista_imprimir_reprogramacion.destroy
destroy(this.pb_fin)
destroy(this.pb_sigue)
destroy(this.pb_antes)
destroy(this.pb_primero)
destroy(this.cb_imprimir)
destroy(this.cb_cancelar)
destroy(this.dw_print)
destroy(this.gb_1)
end on

event open;Long		ll_new,ll_nulo
datetime	ldt_nulo

Setnull(ldt_nulo);Setnull(ll_nulo)
gf_centrar(w_vista_imprimir_reprogramacion)
dw_print.settransobject(sqlca)
dw_print.reset()
if isvalid(w_cuotas) then
	w_cuotas.dw_repacta.accepttext()
	ll_new								= dw_print.insertrow(0)
	//setea datos de la reprogramación
	if w_cuotas.rb_normal.checked=true then
		dw_print.object.t_73.text	= 'Reprogramación'
		dw_print.setitem(ll_new,'tipo_reprog','N')
	elseif w_cuotas.rb_anticipado.checked=true then
		dw_print.object.t_73.text	= 'Reprogramación por Uso Anticipado'
		dw_print.setitem(ll_new,'tipo_reprog','A')
	end if
	dw_print.setitem(ll_new,'base_rep',w_cuotas.dw_repacta.getitemstring(1,'base'))
	dw_print.setitem(ll_new,'serie_rep',w_cuotas.dw_repacta.getitemstring(1,'serie'))
	dw_print.setitem(ll_new,'numero_rep',w_cuotas.dw_repacta.getitemnumber(1,'numero'))
	dw_print.setitem(ll_new,'base',w_cuotas.dw_repacta.getitemstring(1,'base_original'))
	dw_print.setitem(ll_new,'serie',w_cuotas.dw_repacta.getitemstring(1,'serie_original'))
	dw_print.setitem(ll_new,'numero',w_cuotas.dw_repacta.getitemnumber(1,'numero_original'))
	dw_print.setitem(ll_new,'nombre_usuario',gs_nom_comp_usuario)
	dw_print.setitem(ll_new,'agente',w_cuotas.dw_repacta.getitemstring(1,'cod_age'))
	dw_print.setitem(ll_new,'supervisor',w_cuotas.dw_repacta.getitemstring(1,'cod_sup'))
	dw_print.setitem(ll_new,'jefe_venta',w_cuotas.dw_repacta.getitemstring(1,'cod_jefe'))
	dw_print.setitem(ll_new,'rut_cliente',w_cuotas.dw_repacta.getitemnumber(1,'rut_ctto_original'))
	dw_print.setitem(ll_new,'dv_cliente',w_cuotas.dw_repacta.getitemstring(1,'dv_ctto_original'))
	dw_print.setitem(ll_new,'nombre_cliente',w_cuotas.dw_repacta.getitemstring(1,'c_nom_comp_cliente'))
	dw_print.setitem(ll_new,'capital_pagado',w_cuotas.dw_repacta.getitemnumber(1,'capital_pagado'))
	dw_print.setitem(ll_new,'valor_presente_f',w_cuotas.dw_repacta.getitemnumber(1,'valor_presente'))
	dw_print.setitem(ll_new,'cuota_mora_g',w_cuotas.dw_repacta.getitemnumber(1,'valor_cuota_mora'))
	dw_print.setitem(ll_new,'interes_mora_h',w_cuotas.dw_repacta.getitemnumber(1,'valor_interes_mora_total'))
	dw_print.setitem(ll_new,'saldo_precio_e',w_cuotas.dw_repacta.getitemnumber(1,'saldo_precio'))
	dw_print.setitem(ll_new,'saldo_insoluto_b',w_cuotas.dw_repacta.getitemnumber(1,'saldo_insoluto'))
	dw_print.setitem(ll_new,'new_moneda',w_cuotas.dw_repacta.getitemstring(1,'moneda'))
	dw_print.setitem(ll_new,'new_plazo',w_cuotas.dw_repacta.getitemnumber(1,'nvo_plazo'))
	if isnull(w_cuotas.dw_repacta.getitemnumber(1,'nvo_pie')) then
		dw_print.setitem(ll_new,'new_pie',0)
	else
		dw_print.setitem(ll_new,'new_pie',double(w_cuotas.dw_repacta.getitemnumber(1,'nvo_pie')))
	end if
	if isnull(w_cuotas.dw_repacta.getitemnumber(1,'nvo_saldo')) then 
		dw_print.setitem(ll_new,'new_saldo',0)
	else
		dw_print.setitem(ll_new,'new_saldo',double(w_cuotas.dw_repacta.getitemnumber(1,'nvo_saldo')))
	end if
	dw_print.accepttext()
	dw_print.setitem(ll_new,'new_gasto_adm_7',w_cuotas.dw_repacta.getitemnumber(1,'nvo_gasto_adm'))
	dw_print.setitem(ll_new,'new_saldo_insoluto_8',w_cuotas.dw_repacta.getitemnumber(1,'nvo_saldo_insoluto'))
	dw_print.setitem(ll_new,'new_cuota_10',w_cuotas.dw_repacta.getitemnumber(1,'nvo_valor_cuota'))
	dw_print.setitem(ll_new,'interes_cuota',w_cuotas.dw_repacta.getitemnumber(1,'interes_cuota'))
	dw_print.setitem(ll_new,'factor_cuota',w_cuotas.dw_repacta.getitemnumber(1,'tasa_interes'))
	dw_print.setitem(ll_new,'valor_uf',gd_uf)
	//setea datos del contrato
	dw_print.setitem(ll_new,'parque',w_cuotas.dw_ctto.getitemnumber(1,'cadena_cod_parque'))
	dw_print.setitem(ll_new,'estado_cadena',w_cuotas.dw_ctto.getitemstring(1,'cadena_estado'))
	dw_print.setitem(ll_new,'moneda_ori',w_cuotas.dw_ctto.getitemstring(1,'pago_oferta_moneda'))
	dw_print.setitem(ll_new,'valor_cuota',w_cuotas.dw_ctto.getitemnumber(1,'pago_oferta_valor_cuota'))
	dw_print.setitem(ll_new,'ctas_mora',w_cuotas.dw_ctto.getitemnumber(1,'cadena_mora_mora_cred'))
	dw_print.setitem(ll_new,'dias_mora',w_cuotas.dw_ctto.getitemnumber(1,'cadena_mora_dias_mora_cred'))
	dw_print.setitem(ll_new,'plazo',w_cuotas.dw_ctto.getitemnumber(1,'pago_oferta_nro_cuotas'))
	dw_print.setitem(ll_new,'ctas_pag_s',w_cuotas.dw_ctto.getitemnumber(1,'oferta_v_cta_pag_s'))
	dw_print.setitem(ll_new,'tasa',w_cuotas.dw_ctto.getitemnumber(1,'c_tasa'))
	dw_print.setitem(ll_new,'pie',w_cuotas.dw_ctto.getitemnumber(1,'pago_oferta_pie'))
	dw_print.setitem(ll_new,'total_pagado',w_cuotas.dw_ctto.getitemnumber(1,'oferta_v_tot_pagado'))
	dw_print.setitem(ll_new,'fecha_prox_pago',w_cuotas.dw_ctto.getitemdatetime(1,'c_prox_pago'))
	dw_print.setitem(ll_new,'pie_pag',w_cuotas.dw_ctto.getitemnumber(1,'pago_oferta_pie_pagado'))
	dw_print.setitem(ll_new,'fecha_pie',w_cuotas.dw_ctto.getitemdatetime(1,'pago_oferta_fecha_pie'))
	dw_print.setitem(ll_new,'tasa_contrato',w_cuotas.dw_ctto.getitemnumber(1,'pago_oferta_tasa'))
	dw_print.setitem(ll_new,'precio',w_cuotas.dw_ctto.getitemnumber(1,'pago_oferta_precio'))
	dw_print.setitem(ll_new,'derecho_especial',w_cuotas.dw_ctto.getitemnumber(1,'pago_oferta_des_esp'))
	dw_print.setitem(ll_new,'suma_seg',w_cuotas.dw_repacta.getitemnumber(1,'c_seg_adi'))
	dw_print.object.t_34.text	= w_cuotas.dw_repacta.object.t_34.text
	dw_print.object.t_35.text	= w_cuotas.dw_repacta.object.t_35.text
	dw_print.accepttext()
elseif isvalid(w_cuotas_pagare) then
	w_cuotas_pagare.dw_repacta.accepttext()
	ll_new								= dw_print.insertrow(0)
	//setea datos de la reprogramación
	if w_cuotas_pagare.rb_normal.checked=true then
		dw_print.object.t_73.text	= 'Reprogramación'
		dw_print.setitem(ll_new,'tipo_reprog','N')
	end if
	dw_print.setitem(ll_new,'base_rep',w_cuotas_pagare.dw_repacta.getitemstring(1,'base'))
	dw_print.setitem(ll_new,'serie_rep',w_cuotas_pagare.dw_repacta.getitemstring(1,'serie'))
	dw_print.setitem(ll_new,'numero_rep',w_cuotas_pagare.dw_repacta.getitemnumber(1,'numero'))
	dw_print.setitem(ll_new,'base',w_cuotas_pagare.dw_repacta.getitemstring(1,'base_original'))
	dw_print.setitem(ll_new,'serie',w_cuotas_pagare.dw_repacta.getitemstring(1,'serie_original'))
	dw_print.setitem(ll_new,'numero',w_cuotas_pagare.dw_repacta.getitemnumber(1,'numero_original'))
	dw_print.setitem(ll_new,'nombre_usuario',gs_nom_comp_usuario)
	dw_print.setitem(ll_new,'agente',w_cuotas_pagare.dw_repacta.getitemstring(1,'cod_age'))
	dw_print.setitem(ll_new,'supervisor',w_cuotas_pagare.dw_repacta.getitemstring(1,'cod_sup'))
	dw_print.setitem(ll_new,'jefe_venta',w_cuotas_pagare.dw_repacta.getitemstring(1,'cod_jefe'))
	dw_print.setitem(ll_new,'rut_cliente',w_cuotas_pagare.dw_repacta.getitemnumber(1,'rut_ctto_original'))
	dw_print.setitem(ll_new,'dv_cliente',w_cuotas_pagare.dw_repacta.getitemstring(1,'dv_ctto_original'))
	dw_print.setitem(ll_new,'nombre_cliente',w_cuotas_pagare.dw_repacta.getitemstring(1,'c_nom_comp_cliente'))
	dw_print.setitem(ll_new,'capital_pagado',w_cuotas_pagare.dw_repacta.getitemnumber(1,'capital_pagado'))
	dw_print.setitem(ll_new,'valor_presente_f',w_cuotas_pagare.dw_repacta.getitemnumber(1,'valor_presente'))
	dw_print.setitem(ll_new,'cuota_mora_g',w_cuotas_pagare.dw_repacta.getitemnumber(1,'valor_cuota_mora'))
	dw_print.setitem(ll_new,'interes_mora_h',w_cuotas_pagare.dw_repacta.getitemnumber(1,'valor_interes_mora_total'))
	dw_print.setitem(ll_new,'saldo_precio_e',w_cuotas_pagare.dw_repacta.getitemnumber(1,'saldo_precio'))
	dw_print.setitem(ll_new,'saldo_insoluto_b',w_cuotas_pagare.dw_repacta.getitemnumber(1,'saldo_insoluto'))
	dw_print.setitem(ll_new,'new_moneda',w_cuotas_pagare.dw_repacta.getitemstring(1,'moneda'))
	dw_print.setitem(ll_new,'new_plazo',w_cuotas_pagare.dw_repacta.getitemnumber(1,'nvo_plazo'))
	dw_print.setitem(ll_new,'suma_seg',w_cuotas_pagare.dw_repacta.getitemnumber(1,'c_seg_adi'))
	if isnull(w_cuotas_pagare.dw_repacta.getitemnumber(1,'nvo_pie')) then
		dw_print.setitem(ll_new,'new_pie',0)
	else
		dw_print.setitem(ll_new,'new_pie',double(w_cuotas_pagare.dw_repacta.getitemnumber(1,'nvo_pie')))
	end if
	if isnull(w_cuotas_pagare.dw_repacta.getitemnumber(1,'nvo_saldo')) then 
		dw_print.setitem(ll_new,'new_saldo',0)
	else
		dw_print.setitem(ll_new,'new_saldo',double(w_cuotas_pagare.dw_repacta.getitemnumber(1,'nvo_saldo')))
	end if
	dw_print.accepttext()
	dw_print.setitem(ll_new,'new_gasto_adm_7',w_cuotas_pagare.dw_repacta.getitemnumber(1,'nvo_gasto_adm'))
	dw_print.setitem(ll_new,'new_saldo_insoluto_8',w_cuotas_pagare.dw_repacta.getitemnumber(1,'nvo_saldo_insoluto'))
	dw_print.setitem(ll_new,'new_cuota_10',w_cuotas_pagare.dw_repacta.getitemnumber(1,'nvo_valor_cuota'))
	dw_print.setitem(ll_new,'interes_cuota',w_cuotas_pagare.dw_repacta.getitemnumber(1,'interes_cuota'))
	dw_print.setitem(ll_new,'factor_cuota',w_cuotas_pagare.dw_repacta.getitemnumber(1,'tasa_interes'))
	dw_print.setitem(ll_new,'valor_uf',gd_uf)
	//setea datos del contrato
	dw_print.setitem(ll_new,'parque',w_cuotas_pagare.dw_ctto.getitemnumber(1,'cadena_cod_parque'))
	dw_print.setitem(ll_new,'estado_cadena',w_cuotas_pagare.dw_ctto.getitemstring(1,'cadena_estado'))
	dw_print.setitem(ll_new,'moneda_ori',w_cuotas_pagare.dw_ctto.getitemstring(1,'pagare_moneda'))
	dw_print.setitem(ll_new,'valor_cuota',w_cuotas_pagare.dw_ctto.getitemnumber(1,'pagare_valor_cuo'))
	dw_print.setitem(ll_new,'ctas_mora',w_cuotas_pagare.dw_ctto.getitemnumber(1,'cadena_mora_mora_cred'))
	dw_print.setitem(ll_new,'dias_mora',w_cuotas_pagare.dw_ctto.getitemnumber(1,'cadena_mora_dias_mora_cred'))
	dw_print.setitem(ll_new,'plazo',w_cuotas_pagare.dw_ctto.getitemnumber(1,'pagare_plazo'))
	dw_print.setitem(ll_new,'ctas_pag_s',w_cuotas_pagare.dw_ctto.getitemnumber(1,'c_cuotas_pagadas'))
	dw_print.setitem(ll_new,'tasa',w_cuotas_pagare.dw_ctto.getitemnumber(1,'c_tasa'))
	dw_print.setitem(ll_new,'pie',w_cuotas_pagare.dw_ctto.getitemnumber(1,'pagare_pie'))
	dw_print.setitem(ll_new,'total_pagado',w_cuotas_pagare.dw_ctto.getitemnumber(1,'pagare_tot_pagado'))
	dw_print.setitem(ll_new,'fecha_prox_pago',w_cuotas_pagare.dw_ctto.getitemdatetime(1,'c_prox_pago'))
	dw_print.setitem(ll_new,'pie_pag',w_cuotas_pagare.dw_ctto.getitemnumber(1,'pagare_pie_pagado'))
	dw_print.setitem(ll_new,'fecha_pie',ldt_nulo)
	dw_print.setitem(ll_new,'tasa_contrato',w_cuotas_pagare.dw_ctto.getitemnumber(1,'c_tasa_prepago'))
	dw_print.setitem(ll_new,'precio',w_cuotas_pagare.dw_ctto.getitemnumber(1,'pagare_kapital'))
	dw_print.setitem(ll_new,'derecho_especial',ll_nulo)
	dw_print.object.t_34.text	= w_cuotas_pagare.dw_repacta.object.t_34.text
	dw_print.object.t_35.text	= w_cuotas_pagare.dw_repacta.object.t_35.text
	dw_print.accepttext()
else
	Close(w_vista_imprimir_reprogramacion)
end if
end event

type pb_fin from picturebutton within w_vista_imprimir_reprogramacion
integer x = 402
integer y = 1636
integer width = 101
integer height = 84
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_print.ScrollToRow(dw_print.rowcount() ) 
end event

type pb_sigue from picturebutton within w_vista_imprimir_reprogramacion
integer x = 293
integer y = 1636
integer width = 101
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_print.ScrollNextPage( )
end event

type pb_antes from picturebutton within w_vista_imprimir_reprogramacion
integer x = 183
integer y = 1636
integer width = 101
integer height = 84
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_print.ScrollPriorPage( )
end event

type pb_primero from picturebutton within w_vista_imprimir_reprogramacion
integer x = 73
integer y = 1636
integer width = 101
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_print.ScrollToRow(1) 
end event

type cb_imprimir from commandbutton within w_vista_imprimir_reprogramacion
integer x = 3227
integer y = 1624
integer width = 334
integer height = 104
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;f_Print( dw_print )
Close(w_vista_imprimir_reprogramacion)
end event

type cb_cancelar from commandbutton within w_vista_imprimir_reprogramacion
integer x = 3566
integer y = 1624
integer width = 334
integer height = 104
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(w_vista_imprimir_reprogramacion)
end event

type dw_print from datawindow within w_vista_imprimir_reprogramacion
integer x = 46
integer y = 36
integer width = 3854
integer height = 1544
integer taborder = 10
string title = "none"
string dataobject = "dwe_print_reprogramacion_credito"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_vista_imprimir_reprogramacion
integer x = 50
integer y = 1584
integer width = 480
integer height = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

