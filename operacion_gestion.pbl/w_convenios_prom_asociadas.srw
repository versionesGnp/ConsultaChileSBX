forward
global type w_convenios_prom_asociadas from window
end type
type cb_cta_corr from commandbutton within w_convenios_prom_asociadas
end type
type cb_1 from commandbutton within w_convenios_prom_asociadas
end type
type dw_convenio from datawindow within w_convenios_prom_asociadas
end type
type cb_filtrar from commandbutton within w_convenios_prom_asociadas
end type
type cb_exportar from commandbutton within w_convenios_prom_asociadas
end type
type cb_imprimir from commandbutton within w_convenios_prom_asociadas
end type
type cb_cerrar from commandbutton within w_convenios_prom_asociadas
end type
type dw_lista from datawindow within w_convenios_prom_asociadas
end type
end forward

global type w_convenios_prom_asociadas from window
integer width = 3767
integer height = 1880
boolean titlebar = true
string title = "Promesas Asociadas a Convenios"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cta_corr cb_cta_corr
cb_1 cb_1
dw_convenio dw_convenio
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_convenios_prom_asociadas w_convenios_prom_asociadas

type variables
long il_row
end variables

on w_convenios_prom_asociadas.create
this.cb_cta_corr=create cb_cta_corr
this.cb_1=create cb_1
this.dw_convenio=create dw_convenio
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cta_corr,&
this.cb_1,&
this.dw_convenio,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_convenios_prom_asociadas.destroy
destroy(this.cb_cta_corr)
destroy(this.cb_1)
destroy(this.dw_convenio)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;string	ls_base
long	ll_convenio

gf_centrar(w_convenios_prom_asociadas)

dw_convenio.settransobject(sqlca)
dw_convenio.insertrow(0)
dw_lista.settransobject(sqlca)
dw_convenio.retrieve()
end event

type cb_cta_corr from commandbutton within w_convenios_prom_asociadas
integer x = 722
integer y = 1636
integer width = 347
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta. Corriente"
end type

event clicked;string ls_string
if il_row > 0 then
	gs_base			= dw_lista.getitemstring(il_row,'cadena_codigo')
	gs_serie			= dw_lista.getitemstring(il_row,'cadena_serie')
	gi_numero		= dw_lista.getitemnumber(il_row,'cadena_numero')
	gi_rut				= dw_lista.getitemnumber(il_row,'cliente_rut')
	ls_string     		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,ls_string)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,ls_string)		
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			OpenWithParm(w_cuenta_corriente_pagare,ls_string)		
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			OpenWithParm(w_cuenta_corriente_contrato_isa,ls_string)		
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			OpenWithParm(w_cuenta_corriente_derecho,ls_string)		
		CASE "R" //Reprog. Mant
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,ls_string)
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			OpenWithParm(w_cuenta_corriente_aumento_capacidad,ls_string)
		CASE "F"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			OpenWithParm(w_cuenta_corriente_funeraria,ls_string) 
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if
end event

type cb_1 from commandbutton within w_convenios_prom_asociadas
integer x = 1463
integer y = 24
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consutar"
end type

event clicked;string	ls_titulo
long ll_convenio

ll_convenio				= dw_convenio.getitemnumber(1,'cod_convenio')
if ll_convenio > 0 then
	dw_lista.retrieve(ll_convenio)
	ls_titulo		= 'Conenio N°'+ ' - '+string(ll_convenio)
	dw_lista.object.t_titulo.text	= ls_titulo
end if	

end event

type dw_convenio from datawindow within w_convenios_prom_asociadas
integer x = 46
integer y = 24
integer width = 1390
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "dwe_convenios_lista_act"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type cb_filtrar from commandbutton within w_convenios_prom_asociadas
integer x = 1879
integer y = 1636
integer width = 293
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_exportar from commandbutton within w_convenios_prom_asociadas
integer x = 1563
integer y = 1636
integer width = 293
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_convenios_prom_asociadas
integer x = 37
integer y = 1636
integer width = 288
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_cerrar from commandbutton within w_convenios_prom_asociadas
integer x = 3397
integer y = 1636
integer width = 293
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_convenios_prom_asociadas)
end event

type dw_lista from datawindow within w_convenios_prom_asociadas
integer x = 37
integer y = 144
integer width = 3653
integer height = 1464
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_promesas_convenio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row > 0 then
	il_row	= row
	this.scrolltorow(il_row)
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	cb_cta_corr.triggerevent(clicked!)
end if

end event

event clicked;if row > 0 then
	il_row	= row
	this.scrolltorow(il_row)
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if

end event

