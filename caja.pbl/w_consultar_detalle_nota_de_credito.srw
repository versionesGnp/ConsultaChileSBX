forward
global type w_consultar_detalle_nota_de_credito from window
end type
type cb_ctacte from commandbutton within w_consultar_detalle_nota_de_credito
end type
type cb_imprimir from commandbutton within w_consultar_detalle_nota_de_credito
end type
type cb_ordenar from commandbutton within w_consultar_detalle_nota_de_credito
end type
type cb_filtrar from commandbutton within w_consultar_detalle_nota_de_credito
end type
type cb_cerrar from commandbutton within w_consultar_detalle_nota_de_credito
end type
type dw_lista from datawindow within w_consultar_detalle_nota_de_credito
end type
end forward

global type w_consultar_detalle_nota_de_credito from window
integer width = 2661
integer height = 1444
boolean titlebar = true
string title = "Detalle Nota de Crédito"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_imprimir cb_imprimir
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_consultar_detalle_nota_de_credito w_consultar_detalle_nota_de_credito

on w_consultar_detalle_nota_de_credito.create
this.cb_ctacte=create cb_ctacte
this.cb_imprimir=create cb_imprimir
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_ctacte,&
this.cb_imprimir,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_consultar_detalle_nota_de_credito.destroy
destroy(this.cb_ctacte)
destroy(this.cb_imprimir)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;String	ls_tipo_cob
Long		ll_folio
gf_centrar(w_consultar_detalle_nota_de_credito)
dw_lista.settransobject(sqlca)
ls_tipo_cob 	= trim(substr(1,1,Message.StringParm))
ll_folio		 	= long(substr(1,2,Message.StringParm))
if dw_lista.retrieve(ls_tipo_cob,ll_folio) = 0 then
	messagebox("Advertencia","No Registra dato")
	close(w_consultar_detalle_nota_de_credito)
else
	dw_lista.setfocus()
end if
end event

type cb_ctacte from commandbutton within w_consultar_detalle_nota_de_credito
integer x = 1330
integer y = 1188
integer width = 430
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.visible=true then
	if dw_lista.rowcount()>0 then
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
else
	messagebox("Adveretencia","Debe Seleccionar Contrato en Lista de Detalle")
end if
end event

type cb_imprimir from commandbutton within w_consultar_detalle_nota_de_credito
integer x = 585
integer y = 1188
integer width = 265
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )		//f_printdlg(dw_lista,gstr_print,w_consultar_detalle_nota_de_credito)
end event

type cb_ordenar from commandbutton within w_consultar_detalle_nota_de_credito
integer x = 315
integer y = 1188
integer width = 265
integer height = 96
integer taborder = 30
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
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type cb_filtrar from commandbutton within w_consultar_detalle_nota_de_credito
integer x = 46
integer y = 1188
integer width = 265
integer height = 96
integer taborder = 20
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

type cb_cerrar from commandbutton within w_consultar_detalle_nota_de_credito
integer x = 2272
integer y = 1184
integer width = 338
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_consultar_detalle_nota_de_credito)
end event

type dw_lista from datawindow within w_consultar_detalle_nota_de_credito
integer x = 41
integer y = 36
integer width = 2569
integer height = 1116
integer taborder = 10
string title = "none"
string dataobject = "dw_consultar_detalle_nota_de_credito"
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

