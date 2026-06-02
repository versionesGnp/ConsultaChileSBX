forward
global type w_ingresar_gestion_telefonica from window
end type
type cb_cerrar from commandbutton within w_ingresar_gestion_telefonica
end type
type cb_ordenar from commandbutton within w_ingresar_gestion_telefonica
end type
type cb_filtrar from commandbutton within w_ingresar_gestion_telefonica
end type
type cb_exportar from commandbutton within w_ingresar_gestion_telefonica
end type
type cb_imprimir from commandbutton within w_ingresar_gestion_telefonica
end type
type cb_ctacte from commandbutton within w_ingresar_gestion_telefonica
end type
type dw_detalle from datawindow within w_ingresar_gestion_telefonica
end type
type gb_1 from groupbox within w_ingresar_gestion_telefonica
end type
end forward

global type w_ingresar_gestion_telefonica from window
integer width = 2825
integer height = 1376
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_ctacte cb_ctacte
dw_detalle dw_detalle
gb_1 gb_1
end type
global w_ingresar_gestion_telefonica w_ingresar_gestion_telefonica

type variables
long		il_rut_cliente,il_row
string		is_base,is_serie
end variables

on w_ingresar_gestion_telefonica.create
this.cb_cerrar=create cb_cerrar
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_ctacte=create cb_ctacte
this.dw_detalle=create dw_detalle
this.gb_1=create gb_1
this.Control[]={this.cb_cerrar,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_ctacte,&
this.dw_detalle,&
this.gb_1}
end on

on w_ingresar_gestion_telefonica.destroy
destroy(this.cb_cerrar)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_ctacte)
destroy(this.dw_detalle)
destroy(this.gb_1)
end on

event open;SetPointer(HourGlass!)
gf_centrar(w_ingresar_gestion_telefonica)
CHOOSE CASE gl_opcion_gestion
	CASE 1 //telefonica
		this.title						= 'Detalle Gestión Cobranza Telefónica'
		dw_detalle.dataobject		= 'dw_cobranza_telefonica'
		dw_detalle.settransobject(sqlca)
		dw_detalle.retrieve(gi_rut)
	CASE 2 //carta
		this.title						= 'Detalle Gestión Envio de Carta'
		dw_detalle.dataobject		= 'dw_cobranza_carta'
		dw_detalle.settransobject(sqlca)
		dw_detalle.retrieve(gi_rut)
	CASE 3 // publico
		this.title						= 'Detalle Gestión Atención Público'
		dw_detalle.dataobject		= 'dw_cobranza_atencion_pub'
		dw_detalle.settransobject(sqlca)
		dw_detalle.retrieve(gs_base,gs_serie,gi_numero)
END CHOOSE

if dw_detalle.rowcount() = 0 then
	dw_detalle.DataObject = "dw_no_hay_datos"
	dw_detalle.settransobject(sqlca)
end if
SetPointer(Arrow!)
end event

type cb_cerrar from commandbutton within w_ingresar_gestion_telefonica
integer x = 2482
integer y = 1140
integer width = 293
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingresar_gestion_telefonica)
end event

type cb_ordenar from commandbutton within w_ingresar_gestion_telefonica
event ue_mousemove pbm_dwnmousemove
integer x = 64
integer y = 1140
integer width = 247
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type cb_filtrar from commandbutton within w_ingresar_gestion_telefonica
event ue_mousemove pbm_mousemove
integer x = 315
integer y = 1140
integer width = 247
integer height = 92
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
dw_detalle.SETfilter(NULO)
dw_detalle.filter()

end event

type cb_exportar from commandbutton within w_ingresar_gestion_telefonica
event ue_mousemove pbm_mousemove
integer x = 567
integer y = 1140
integer width = 247
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_ingresar_gestion_telefonica
event ue_mousemove pbm_mousemove
integer x = 859
integer y = 1140
integer width = 247
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	f_Print( dw_detalle )
//	f_printdlg(dw_detalle,gstr_print,w_ingresar_gestion_telefonica)
end if
end event

type cb_ctacte from commandbutton within w_ingresar_gestion_telefonica
integer x = 1198
integer y = 1140
integer width = 407
integer height = 92
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
if il_row > 0 then
	gs_base		= dw_detalle.getitemstring(il_row,'base')
	gs_serie		= dw_detalle.getitemstring(il_row,'serie')
	gi_numero	= dw_detalle.getitemnumber(il_row,'numero')
	gi_rut		= dw_detalle.getitemnumber(il_row,'rut')
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
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if

end event

type dw_detalle from datawindow within w_ingresar_gestion_telefonica
event ue_mousemove pbm_dwnmousemove
integer x = 41
integer y = 36
integer width = 2734
integer height = 1052
integer taborder = 10
string dataobject = "dw_cobranza_atencion_pub"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row		= row
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
end if
end event

type gb_1 from groupbox within w_ingresar_gestion_telefonica
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1092
integer width = 1088
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

