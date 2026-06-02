forward
global type w_detalle_convenio_pago_cheque_protesto from window
end type
type cb_ctacte from commandbutton within w_detalle_convenio_pago_cheque_protesto
end type
type cb_1 from commandbutton within w_detalle_convenio_pago_cheque_protesto
end type
type cb_2 from commandbutton within w_detalle_convenio_pago_cheque_protesto
end type
type cb_3 from commandbutton within w_detalle_convenio_pago_cheque_protesto
end type
type cb_imprimir from commandbutton within w_detalle_convenio_pago_cheque_protesto
end type
type cb_cerrar from commandbutton within w_detalle_convenio_pago_cheque_protesto
end type
type dw_lista from datawindow within w_detalle_convenio_pago_cheque_protesto
end type
type gb_1 from groupbox within w_detalle_convenio_pago_cheque_protesto
end type
end forward

global type w_detalle_convenio_pago_cheque_protesto from window
integer width = 2533
integer height = 1500
boolean titlebar = true
string title = "Detalle Pago Convenio de Pago Cheque Protestado"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_detalle_convenio_pago_cheque_protesto w_detalle_convenio_pago_cheque_protesto

type variables
Long		il_row
String		is_base,is_serie
Double	il_numero
end variables

on w_detalle_convenio_pago_cheque_protesto.create
this.cb_ctacte=create cb_ctacte
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_ctacte,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_detalle_convenio_pago_cheque_protesto.destroy
destroy(this.cb_ctacte)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_detalle_convenio_pago_cheque_protesto)
is_base 						= trim(substr(1,1,Message.StringParm))
is_serie						= trim(substr(1,2,Message.StringParm))
il_numero					= Double(trim(substr(1,3,Message.StringParm)))
if is_base='P' then
	dw_lista.dataobject	= 'dw_lista_detalle_convenio_pago_cheque_p'
else
	dw_lista.dataobject	= 'dw_lista_detalle_convenio_pago_cheque_o'
end if
dw_lista.settransobject(sqlca)
if dw_lista.retrieve(gs_base,gs_serie,gi_numero)=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_detalle_convenio_pago_cheque_protesto)
end if
end event

type cb_ctacte from commandbutton within w_detalle_convenio_pago_cheque_protesto
integer x = 1230
integer y = 1264
integer width = 416
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta C&orriente"
end type

event clicked;String		ls_base,ls_serie,param
Double	ll_numero
if is_base='P' then
	ls_base		= dw_lista.getitemstring(il_row,'base_original')
	ls_serie		= dw_lista.getitemstring(il_row,'serie_original')
	ll_numero	= dw_lista.getitemnumber(il_row,'numero_original')
else
	ls_base		= dw_lista.getitemstring(il_row,'base_pagare')
	ls_serie		= dw_lista.getitemstring(il_row,'serie_pagare')
	ll_numero	= dw_lista.getitemnumber(il_row,'numero_pagare')
end if
param     	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(gi_rut)
CHOOSE CASE ls_base
	CASE "O" // Oferta
		if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
		OpenWithParm(w_cuenta_corriente_oferta,param)
	CASE "L" // Anexo Liberador
		if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
		OpenWithParm(w_cuenta_corriente_liberador,param)		
	CASE "F" // Anexo funeraria
		if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
		OpenWithParm(w_cuenta_corriente_funeraria,param)
	CASE "P" // Pagaré
		if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
		OpenWithParm(w_cuenta_corriente_pagare,param)		
	CASE "C" // Contrato ISA	
		if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
		OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
	CASE "D" // Derecho Especial
		if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
		OpenWithParm(w_cuenta_corriente_derecho,param)		
	CASE "R" //Reprog. Mant
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
		OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
	CASE "A" // Aumento Capacidad
		if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
		OpenWithParm(w_cuenta_corriente_aumento_capacidad,param)
	CASE "F" // Anexo Funeraria
		if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
		OpenWithParm(w_cuenta_corriente_funeraria,param)		
END CHOOSE
end event

type cb_1 from commandbutton within w_detalle_convenio_pago_cheque_protesto
integer x = 55
integer y = 1264
integer width = 219
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_2 from commandbutton within w_detalle_convenio_pago_cheque_protesto
integer x = 503
integer y = 1264
integer width = 219
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_detalle_convenio_pago_cheque_protesto
integer x = 279
integer y = 1264
integer width = 219
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_imprimir from commandbutton within w_detalle_convenio_pago_cheque_protesto
integer x = 727
integer y = 1264
integer width = 219
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
//	f_printdlg(dw_lista,gstr_print,w_detalle_convenio_pago_cheque_protesto)
end if
end event

type cb_cerrar from commandbutton within w_detalle_convenio_pago_cheque_protesto
integer x = 2158
integer y = 1264
integer width = 315
integer height = 96
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_convenio_pago_cheque_protesto)
end event

type dw_lista from datawindow within w_detalle_convenio_pago_cheque_protesto
integer x = 32
integer y = 32
integer width = 2441
integer height = 1168
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_detalle_convenio_pago_cheque_p"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	dw_lista.SelectRow(0, FALSE)
	dw_lista.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	dw_lista.SelectRow(0, FALSE)
	dw_lista.SelectRow(il_row, TRUE)
end if
end event

type gb_1 from groupbox within w_detalle_convenio_pago_cheque_protesto
integer x = 32
integer y = 1212
integer width = 946
integer height = 176
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

