forward
global type w_detalle_de_reprogramaciones_mantencion from window
end type
type cb_ctacte from commandbutton within w_detalle_de_reprogramaciones_mantencion
end type
type cb_filtrar from commandbutton within w_detalle_de_reprogramaciones_mantencion
end type
type cb_sort from commandbutton within w_detalle_de_reprogramaciones_mantencion
end type
type cb_exportar from commandbutton within w_detalle_de_reprogramaciones_mantencion
end type
type cb_imprimir from commandbutton within w_detalle_de_reprogramaciones_mantencion
end type
type cb_cerrar from commandbutton within w_detalle_de_reprogramaciones_mantencion
end type
type dw_lista from datawindow within w_detalle_de_reprogramaciones_mantencion
end type
end forward

global type w_detalle_de_reprogramaciones_mantencion from window
integer width = 2706
integer height = 1408
boolean titlebar = true
string title = "Detalle Reprogramaciones de Mantención Canceladas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_detalle_de_reprogramaciones_mantencion w_detalle_de_reprogramaciones_mantencion

type variables
String	is_base,is_serie
Double	il_numero
end variables

on w_detalle_de_reprogramaciones_mantencion.create
this.cb_ctacte=create cb_ctacte
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_ctacte,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_detalle_de_reprogramaciones_mantencion.destroy
destroy(this.cb_ctacte)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_detalle_de_reprogramaciones_mantencion)
dw_lista.settransobject(sqlca)
is_base		= substr(1,1,Message.StringParm)
is_serie		= substr(1,2,Message.StringParm)
il_numero	= Double(substr(1,3,Message.StringParm))
if dw_lista.retrieve(is_base,is_serie,il_numero)=0 then
	messagebox("Advertencia","No Registra Reprogramación Mantención Cancelada")
	cb_cerrar.triggerevent(clicked!)
end if
end event

type cb_ctacte from commandbutton within w_detalle_de_reprogramaciones_mantencion
integer x = 1435
integer y = 1164
integer width = 434
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;string param
if dw_lista.rowcount()>0 then
	gs_base		= dw_lista.getitemstring(dw_lista.getrow(),'base')
	gs_serie		= dw_lista.getitemstring(dw_lista.getrow(),'serie')
	gi_numero	= dw_lista.getitemnumber(dw_lista.getrow(),'numero')
	gi_rut		= dw_lista.getitemnumber(dw_lista.getrow(),'rut_cliente')
	param     	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
	END CHOOSE
end if
end event

type cb_filtrar from commandbutton within w_detalle_de_reprogramaciones_mantencion
integer x = 1015
integer y = 1164
integer width = 283
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

type cb_sort from commandbutton within w_detalle_de_reprogramaciones_mantencion
integer x = 727
integer y = 1164
integer width = 283
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

type cb_exportar from commandbutton within w_detalle_de_reprogramaciones_mantencion
integer x = 439
integer y = 1164
integer width = 283
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

type cb_imprimir from commandbutton within w_detalle_de_reprogramaciones_mantencion
integer x = 41
integer y = 1164
integer width = 283
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )

end event

type cb_cerrar from commandbutton within w_detalle_de_reprogramaciones_mantencion
integer x = 2290
integer y = 1164
integer width = 338
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_de_reprogramaciones_mantencion)
end event

type dw_lista from datawindow within w_detalle_de_reprogramaciones_mantencion
integer x = 41
integer y = 36
integer width = 2587
integer height = 1088
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_log_reprogramacion_canceladas"
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

event doubleclicked;if row>0 then cb_ctacte.triggerevent(clicked!)
end event

