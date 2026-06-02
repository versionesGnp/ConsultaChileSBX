forward
global type w_premios_mejores_detalle from window
end type
type cb_imprimir from commandbutton within w_premios_mejores_detalle
end type
type cb_asocia_contrato from commandbutton within w_premios_mejores_detalle
end type
type cb_exportar from commandbutton within w_premios_mejores_detalle
end type
type cb_filtrar from commandbutton within w_premios_mejores_detalle
end type
type cb_ordenar from commandbutton within w_premios_mejores_detalle
end type
type cb_cta_cte from commandbutton within w_premios_mejores_detalle
end type
type cb_2 from commandbutton within w_premios_mejores_detalle
end type
type dw_lista from datawindow within w_premios_mejores_detalle
end type
type gb_1 from groupbox within w_premios_mejores_detalle
end type
end forward

global type w_premios_mejores_detalle from window
integer width = 3415
integer height = 1844
boolean titlebar = true
string title = "Detalle Ventas"
boolean controlmenu = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_asocia_contrato cb_asocia_contrato
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_cta_cte cb_cta_cte
cb_2 cb_2
dw_lista dw_lista
gb_1 gb_1
end type
global w_premios_mejores_detalle w_premios_mejores_detalle

type variables
long il_row
end variables

on w_premios_mejores_detalle.create
this.cb_imprimir=create cb_imprimir
this.cb_asocia_contrato=create cb_asocia_contrato
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_cta_cte=create cb_cta_cte
this.cb_2=create cb_2
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_imprimir,&
this.cb_asocia_contrato,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_cta_cte,&
this.cb_2,&
this.dw_lista,&
this.gb_1}
end on

on w_premios_mejores_detalle.destroy
destroy(this.cb_imprimir)
destroy(this.cb_asocia_contrato)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_cta_cte)
destroy(this.cb_2)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;string	ls_codigo,ls_cargo,ls_clasif_hist
long		ll_cod_parque,ll_tot_reg,ll_tipo_premio,ll_indi
datetime	ldt_fecha_ini,ldt_fecha_fin

gf_centrar(w_premios_mejores_detalle)
if gl_proceso>=4 then
	dw_lista.settransobject(sqlca)
	dw_lista.insertrow(0)
	ldt_fecha_fin							= datetime(date(substr(1,1,Message.StringParm)),time('00:00:00'))
	ll_cod_parque							= long(substr(1,2,Message.StringParm))
	ll_tipo_premio							= long(substr(1,3,Message.StringParm))
	ls_codigo								= substr(1,4,Message.StringParm)
	ls_cargo									= substr(1,5,Message.StringParm)
	if ls_cargo = 'SNF' then
		dw_lista.dataobject				= 'dw_mejores_supervisor'
		dw_lista.settransobject(sqlca)
	else
		dw_lista.dataobject				= 'dw_mejores_agentes'
		dw_lista.settransobject(sqlca)
	end if
	ll_tot_reg								= dw_lista.retrieve(ldt_fecha_fin,ll_cod_parque,ll_tipo_premio,ls_codigo)
	if ll_tot_reg>0 then
		dw_lista.Object.usuario.text	= gs_user
		ls_clasif_hist						= f_clasif_hist(ls_codigo,ldt_fecha_fin)
		dw_lista.Object.clasif.text	= ls_clasif_hist
	else
		messagebox("Advertencia","No Registra Datos")
	end if
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_premios_mejores_detalle)
end if

end event

type cb_imprimir from commandbutton within w_premios_mejores_detalle
integer x = 2258
integer y = 1592
integer width = 238
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() >0 then 
	f_Print( dw_lista )
end if
end event

type cb_asocia_contrato from commandbutton within w_premios_mejores_detalle
integer x = 475
integer y = 1592
integer width = 389
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Asociar &x Rut"
end type

type cb_exportar from commandbutton within w_premios_mejores_detalle
integer x = 1435
integer y = 1592
integer width = 238
integer height = 92
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_premios_mejores_detalle
integer x = 1678
integer y = 1592
integer width = 238
integer height = 92
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_premios_mejores_detalle
integer x = 1920
integer y = 1592
integer width = 238
integer height = 92
integer taborder = 150
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

type cb_cta_cte from commandbutton within w_premios_mejores_detalle
integer x = 27
integer y = 1592
integer width = 448
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa
if dw_lista.rowcount() > 0 then
	gs_base						= dw_lista.getitemstring(il_row,'base')
	gs_serie						= dw_lista.getitemstring(il_row,'serie')
	gi_numero					= dw_lista.getitemnumber(il_row,'numero')
	gi_rut						= dw_lista.getitemnumber(il_row,'cadena_rut')
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

type cb_2 from commandbutton within w_premios_mejores_detalle
integer x = 3063
integer y = 1596
integer width = 293
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premios_mejores_detalle)
end event

type dw_lista from datawindow within w_premios_mejores_detalle
integer x = 32
integer y = 36
integer width = 3323
integer height = 1524
integer taborder = 40
string title = "none"
string dataobject = "dw_mejores_agentes"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

this.accepttext()
end event

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;//string	ls_superv,ls_string
//datetime	ldt_fecha_ini,ldt_fecha_fin
//
//ldt_fecha_ini							= datetime(date(em_inicio.text),time('00:00:00'))
//ldt_fecha_fin							= datetime(date(em_termino.text),time('00:00:00'))
//
//if dw_lista.dataobject				='dw_premios_sup_uno_x_cien_group_res' and dw_lista.rowcount() > 0 then
//	ls_superv							= this.getitemstring(row,'cod_sup')
//	ls_string							= ls_superv+'~t'+string(ldt_fecha_fin,'dd/mm/yyyy')
//	OpenWithParm(w_premios_sup_uno_x_cien_detalle, ls_string)
//elseif dw_lista.dataobject			='dw_premios_sup_uno_x_cien_detalle' and dw_lista.rowcount() > 0 then
//	cb_cta_cte.triggerevent(clicked!)
//else
//	messagebox("Advertencia","El Proceso Premio Ingreso Caja Supervisores Debe Ser Grabado")
//end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_1 from groupbox within w_premios_mejores_detalle
integer x = 1417
integer y = 1544
integer width = 1115
integer height = 164
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

