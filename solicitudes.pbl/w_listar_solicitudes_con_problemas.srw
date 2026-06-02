forward
global type w_listar_solicitudes_con_problemas from window
end type
type cb_imprimir from commandbutton within w_listar_solicitudes_con_problemas
end type
type cb_ctacte from commandbutton within w_listar_solicitudes_con_problemas
end type
type cb_filtrar from commandbutton within w_listar_solicitudes_con_problemas
end type
type cb_ordenar from commandbutton within w_listar_solicitudes_con_problemas
end type
type cb_exportar from commandbutton within w_listar_solicitudes_con_problemas
end type
type cb_eliminar from commandbutton within w_listar_solicitudes_con_problemas
end type
type cb_cerrar from commandbutton within w_listar_solicitudes_con_problemas
end type
type dw_lista from datawindow within w_listar_solicitudes_con_problemas
end type
end forward

global type w_listar_solicitudes_con_problemas from window
integer width = 3337
integer height = 1704
boolean titlebar = true
string title = "Lista Solicitudes de Resolución con Problemas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_ctacte cb_ctacte
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_eliminar cb_eliminar
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_listar_solicitudes_con_problemas w_listar_solicitudes_con_problemas

type variables
long	il_row
end variables

on w_listar_solicitudes_con_problemas.create
this.cb_imprimir=create cb_imprimir
this.cb_ctacte=create cb_ctacte
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_eliminar=create cb_eliminar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_imprimir,&
this.cb_ctacte,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_eliminar,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_listar_solicitudes_con_problemas.destroy
destroy(this.cb_imprimir)
destroy(this.cb_ctacte)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_eliminar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_listar_solicitudes_con_problemas)
dw_lista.settransobject(sqlca)
dw_lista.retrieve()
gs_ventana	= 'w_listar_solicitudes_con_problemas'
f_valida_objeto()
end event

type cb_imprimir from commandbutton within w_listar_solicitudes_con_problemas
integer x = 2002
integer y = 1456
integer width = 338
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
end if
end event

type cb_ctacte from commandbutton within w_listar_solicitudes_con_problemas
integer x = 27
integer y = 1456
integer width = 485
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if il_row>0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
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
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "F","G"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria)
	END CHOOSE
end if
end event

type cb_filtrar from commandbutton within w_listar_solicitudes_con_problemas
integer x = 1605
integer y = 1456
integer width = 338
integer height = 100
integer taborder = 50
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

type cb_ordenar from commandbutton within w_listar_solicitudes_con_problemas
integer x = 1262
integer y = 1456
integer width = 338
integer height = 100
integer taborder = 40
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

type cb_exportar from commandbutton within w_listar_solicitudes_con_problemas
integer x = 919
integer y = 1456
integer width = 338
integer height = 100
integer taborder = 30
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

type cb_eliminar from commandbutton within w_listar_solicitudes_con_problemas
integer x = 576
integer y = 1456
integer width = 338
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;String	ls_base,ls_serie
long		ll_resp
Double	ll_numero
if il_row>0 then
	ls_base		= dw_lista.getitemstring(il_row,'base')
	ls_serie		= dw_lista.getitemstring(il_row,'serie')
	ll_numero	= dw_lista.getitemNumber(il_row,'numero')
	ll_resp		= MessageBox("Advertencia", "Está seguro de Eliminar Solicitud del Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,##0"), Exclamation!, YesNo!, 2)
	IF ll_resp=1 THEN
		dw_lista.deleterow(il_row)
		if dw_lista.update()=1 then
			commit;
		else
			rollback;
		end if
	END IF
end if
end event

type cb_cerrar from commandbutton within w_listar_solicitudes_con_problemas
integer x = 2921
integer y = 1456
integer width = 338
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listar_solicitudes_con_problemas)
end event

type dw_lista from datawindow within w_listar_solicitudes_con_problemas
integer x = 27
integer y = 32
integer width = 3232
integer height = 1376
integer taborder = 10
string dataobject = "dw_lista_solicitudes_con_problemas"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	cb_ctacte.triggerevent(clicked!)
end if
end event

