forward
global type w_premios_sup_uno_x_cien_detalle from window
end type
type cb_cta_cte from commandbutton within w_premios_sup_uno_x_cien_detalle
end type
type cb_imprimir from commandbutton within w_premios_sup_uno_x_cien_detalle
end type
type cb_2 from commandbutton within w_premios_sup_uno_x_cien_detalle
end type
type cb_exportar from commandbutton within w_premios_sup_uno_x_cien_detalle
end type
type dw_detalle from datawindow within w_premios_sup_uno_x_cien_detalle
end type
end forward

global type w_premios_sup_uno_x_cien_detalle from window
integer width = 3456
integer height = 1880
boolean titlebar = true
string title = "Detalle Ingreso Caja Supervisores"
boolean controlmenu = true
long backcolor = 67108864
cb_cta_cte cb_cta_cte
cb_imprimir cb_imprimir
cb_2 cb_2
cb_exportar cb_exportar
dw_detalle dw_detalle
end type
global w_premios_sup_uno_x_cien_detalle w_premios_sup_uno_x_cien_detalle

type variables
long il_row
end variables

on w_premios_sup_uno_x_cien_detalle.create
this.cb_cta_cte=create cb_cta_cte
this.cb_imprimir=create cb_imprimir
this.cb_2=create cb_2
this.cb_exportar=create cb_exportar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_cta_cte,&
this.cb_imprimir,&
this.cb_2,&
this.cb_exportar,&
this.dw_detalle}
end on

on w_premios_sup_uno_x_cien_detalle.destroy
destroy(this.cb_cta_cte)
destroy(this.cb_imprimir)
destroy(this.cb_2)
destroy(this.cb_exportar)
destroy(this.dw_detalle)
end on

event open;string	ls_codigo,ls_clasif_hist
long		ll_tot_reg,ll_indi
date		ld_fecha_ini,ld_fecha_fin
datetime	ldt_fecha_ini,ldt_fecha_fin

gf_centrar(w_premios_sup_uno_x_cien_detalle)

ls_codigo		= substr(1,1,Message.StringParm)
ld_fecha_fin	= date(substr(1,2,Message.StringParm))
ldt_fecha_fin	= datetime(ld_fecha_fin,time('00:00:00'))

if not isnull(ldt_fecha_fin) and not isnull(ls_codigo) and ls_codigo<>'' then
	dw_detalle.dataobject	= 'dw_premios_sup_uno_x_cien_detalle'
	dw_detalle.settransobject(sqlca)
	ll_tot_reg	= dw_detalle.retrieve(ldt_fecha_fin,ls_codigo)
	for ll_indi = 1 to ll_tot_reg
		ls_codigo											= dw_detalle.getitemstring(ll_indi,'cod_age_sup')
		ls_clasif_hist										= f_clasif_hist(ls_codigo,ldt_fecha_fin)
		dw_detalle.setitem(ll_indi,"c_clasif",ls_clasif_hist)
	next
	
	dw_detalle.Object.usuario.text = gs_user
end if

ll_tot_reg				= dw_detalle.RowCount()
if ll_tot_reg = 0 then
	messagebox("Advertencia","No registra dato")
	close(w_premios_sup_uno_x_cien_detalle)
end if
end event

type cb_cta_cte from commandbutton within w_premios_sup_uno_x_cien_detalle
integer x = 1189
integer y = 1648
integer width = 425
integer height = 88
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
	if il_row>0 then
		gs_base						= dw_detalle.getitemstring(il_row,'cadena_codigo')
		gs_serie						= dw_detalle.getitemstring(il_row,'serie')
		gi_numero 					= dw_detalle.getitemnumber(il_row,'contrato')
		gi_rut						= dw_detalle.getitemnumber(il_row,'cadena_rut')
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

type cb_imprimir from commandbutton within w_premios_sup_uno_x_cien_detalle
integer x = 1618
integer y = 1648
integer width = 288
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

event clicked;if dw_detalle.rowcount() >0 then 
	f_Print( dw_detalle )
end if
end event

type cb_2 from commandbutton within w_premios_sup_uno_x_cien_detalle
integer x = 3099
integer y = 1648
integer width = 288
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premios_sup_uno_x_cien_detalle)
end event

type cb_exportar from commandbutton within w_premios_sup_uno_x_cien_detalle
boolean visible = false
integer x = 1906
integer y = 1648
integer width = 288
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;Datawindow	dw_paso
if dw_detalle.rowcount()>0 then
	dw_detalle.accepttext()
	dw_paso				= dw_detalle
	f_DWToExcel( dw_paso )
end if
end event

type dw_detalle from datawindow within w_premios_sup_uno_x_cien_detalle
integer x = 37
integer y = 36
integer width = 3351
integer height = 1576
integer taborder = 10
string title = "none"
string dataobject = "dw_premios_sup_uno_x_cien_detalle"
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

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;cb_cta_cte.triggerevent(clicked!)
end event

