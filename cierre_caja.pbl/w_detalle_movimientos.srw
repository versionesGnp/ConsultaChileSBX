forward
global type w_detalle_movimientos from window
end type
type cb_filtrar from commandbutton within w_detalle_movimientos
end type
type cb_ordenar from commandbutton within w_detalle_movimientos
end type
type cb_imprimir from commandbutton within w_detalle_movimientos
end type
type cb_ctacte from commandbutton within w_detalle_movimientos
end type
type cb_cerrar from commandbutton within w_detalle_movimientos
end type
type dw_lista from datawindow within w_detalle_movimientos
end type
end forward

global type w_detalle_movimientos from window
integer width = 3214
integer height = 1892
boolean titlebar = true
string title = "Detalle Movimientos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_imprimir cb_imprimir
cb_ctacte cb_ctacte
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_detalle_movimientos w_detalle_movimientos

on w_detalle_movimientos.create
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_imprimir=create cb_imprimir
this.cb_ctacte=create cb_ctacte
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_filtrar,&
this.cb_ordenar,&
this.cb_imprimir,&
this.cb_ctacte,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_detalle_movimientos.destroy
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_imprimir)
destroy(this.cb_ctacte)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;Long		ll_tot_reg,ll_fila,ll_indi,ll_new
String	ls_cuenta,ls_empresa,ls_string,ls_descrip
gf_centrar(w_detalle_movimientos)
dw_lista.settransobject(sqlca)
if isvalid(w_generar_archivo_contab) then
	if w_generar_archivo_contab.dw_lista_resumen.visible=true then
		ll_fila		= w_generar_archivo_contab.dw_lista_resumen.getrow()
		ls_cuenta	= w_generar_archivo_contab.dw_lista_resumen.getitemstring(ll_fila,'nro_cuenta_contab')
		ls_descrip	= w_generar_archivo_contab.dw_lista_resumen.getitemstring(ll_fila,'descrip_cuenta_contab')
		ls_empresa	= w_generar_archivo_contab.dw_lista_resumen.getitemstring(ll_fila,'tipo_empresa')
		if isnull(ls_cuenta)		then ls_cuenta		= ''
		if isnull(ls_descrip)	then ls_descrip	= ''
		if isnull(ls_empresa) 	then ls_empresa	= ''
		ls_string	= 'nro_cuenta_contab="'+ls_cuenta+'" and descrip_cuenta_contab="'+ls_descrip+'" and tipo_empresa="'+ls_empresa+'"'
		w_generar_archivo_contab.dw_lista.SETfilter(ls_string)
		w_generar_archivo_contab.dw_lista.filter()
		ll_tot_reg	= w_generar_archivo_contab.dw_lista.rowcount()
		for ll_indi=1 to ll_tot_reg
			ll_new	= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new)
			dw_lista.setitem(ll_new,'base',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'base'))
			dw_lista.setitem(ll_new,'serie',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'serie'))
			dw_lista.setitem(ll_new,'numero',w_generar_archivo_contab.dw_lista.getitemnumber(ll_indi,'numero'))
			dw_lista.setitem(ll_new,'tipo_cob',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'tipo_cob'))
			dw_lista.setitem(ll_new,'tipo_mov',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'tipo_mov'))
			dw_lista.setitem(ll_new,'nro_cuenta_contab',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'nro_cuenta_contab'))
			dw_lista.setitem(ll_new,'descrip_cuenta_contab',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'descrip_cuenta_contab'))
			dw_lista.setitem(ll_new,'centro_costo',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'centro_costo'))
			dw_lista.setitem(ll_new,'tipo_empresa',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'tipo_empresa'))
			dw_lista.setitem(ll_new,'monto',w_generar_archivo_contab.dw_lista.getitemnumber(ll_indi,'monto'))
			dw_lista.setitem(ll_new,'monto_debe',w_generar_archivo_contab.dw_lista.getitemnumber(ll_indi,'monto_debe'))
			dw_lista.setitem(ll_new,'codigo_otros',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'codigo_otros'))
			dw_lista.setitem(ll_new,'descrip_otros',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'descrip_otros'))
			dw_lista.setitem(ll_new,'rezago',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'rezago'))
			dw_lista.setitem(ll_new,'fecha_pago',date(w_generar_archivo_contab.dw_lista.getitemdatetime(ll_indi,'fecha_pago')))
			dw_lista.setitem(ll_new,'fecha_ini_consulta',date(w_generar_archivo_contab.dw_lista.getitemdatetime(ll_indi,'fecha_ini_consulta')))
			dw_lista.setitem(ll_new,'fecha_fin_consulta',date(w_generar_archivo_contab.dw_lista.getitemdatetime(ll_indi,'fecha_fin_consulta')))
			dw_lista.setitem(ll_new,'cod_caja',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'cod_caja'))
			dw_lista.setitem(ll_new,'folio',w_generar_archivo_contab.dw_lista.getitemnumber(ll_indi,'folio'))
			dw_lista.setitem(ll_new,'valor_uf',Double(w_generar_archivo_contab.dw_lista.getitemnumber(ll_indi,'valor_uf')))
			dw_lista.setitem(ll_new,'codigo_banco',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'codigo_banco'))
			dw_lista.setitem(ll_new,'codigo_financiero',w_generar_archivo_contab.dw_lista.getitemstring(ll_indi,'codigo_financiero'))
		next
		dw_lista.object.t_titulo.text				= 'Informe Recaudación Caja Nº '+ trim(w_generar_archivo_contab.ddlb_caja.text) +' del día '+string(w_generar_archivo_contab.em_de.text,"dd/mm/yyyy")
		ls_string	= ''
		if mid(w_generar_archivo_contab.ddlb_empresa.text,1,1)='A' then
			ls_string						= "tipo_empresa='A'"
		elseif mid(w_generar_archivo_contab.ddlb_empresa.text,1,1)='I' then
			ls_string						= "tipo_empresa='I'"
		elseif mid(w_generar_archivo_contab.ddlb_empresa.text,1,1)='T' then
			ls_string						= ""
		end if
		w_generar_archivo_contab.dw_lista.SETfilter(ls_string)
		w_generar_archivo_contab.dw_lista.filter()
	end if
end if
end event

type cb_filtrar from commandbutton within w_detalle_movimientos
integer x = 1138
integer y = 1668
integer width = 265
integer height = 96
integer taborder = 30
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

type cb_ordenar from commandbutton within w_detalle_movimientos
integer x = 1408
integer y = 1668
integer width = 265
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
if dw_lista.rowcount() > 0 then
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_imprimir from commandbutton within w_detalle_movimientos
integer x = 1678
integer y = 1668
integer width = 265
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	if dw_lista.visible=true then
		dw_lista.Object.DataWindow.Zoom = 60
		IF PrintSetup( ) <> -1 THEN dw_lista.Print()
		dw_lista.Object.DataWindow.Zoom = 100
	end if
END IF

end event

type cb_ctacte from commandbutton within w_detalle_movimientos
integer x = 37
integer y = 1668
integer width = 430
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.rowcount()>0 then
	gs_base		= dw_lista.getitemstring(dw_lista.getrow(),'base')
	gs_serie		= dw_lista.getitemstring(dw_lista.getrow(),'serie')
	gi_numero	= dw_lista.getitemnumber(dw_lista.getrow(),'numero')
	IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				Open(w_cuenta_corriente_liberador)
			CASE "P" // Pagaré
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho
				Open(w_cuenta_corriente_derecho)
			CASE "R" // Derecho
				Open(w_cuenta_corriente_repactar_cta_mant)
		END CHOOSE
	else
		messagebox("Advertencia","Debe Seleccionar Contrato")
	END IF
end if
end event

type cb_cerrar from commandbutton within w_detalle_movimientos
integer x = 2825
integer y = 1664
integer width = 320
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_movimientos)
end event

type dw_lista from datawindow within w_detalle_movimientos
integer x = 37
integer y = 32
integer width = 3109
integer height = 1600
integer taborder = 10
string title = "none"
string dataobject = "dwe_generar_archivo_contabilidad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base		= dw_lista.getitemstring(row,'base')
	gs_serie		= dw_lista.getitemstring(row,'serie')
	gi_numero	= dw_lista.getitemnumber(row,'numero')
	if dw_lista.rowcount()>0 and gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN cb_ctacte.triggerevent(clicked!)
end if
end event

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base		= dw_lista.getitemstring(row,'base')
	gs_serie		= dw_lista.getitemstring(row,'serie')
	gi_numero	= dw_lista.getitemnumber(row,'numero')
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	gs_base		= dw_lista.getitemstring(this.getrow(),'base')
	gs_serie		= dw_lista.getitemstring(this.getrow(),'serie')
	gi_numero	= dw_lista.getitemnumber(this.getrow(),'numero')
end if
end event

