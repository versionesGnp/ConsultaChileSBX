forward
global type w_listado_pagare_v from window
end type
type cb_exportar from commandbutton within w_listado_pagare_v
end type
type cb_5 from commandbutton within w_listado_pagare_v
end type
type cb_fallecidos from commandbutton within w_listado_pagare_v
end type
type cb_datos_cliente from commandbutton within w_listado_pagare_v
end type
type cb_beneficiarios_pagare_v from commandbutton within w_listado_pagare_v
end type
type cb_contrato_pagare_v from commandbutton within w_listado_pagare_v
end type
type cb_4 from commandbutton within w_listado_pagare_v
end type
type cb_3 from commandbutton within w_listado_pagare_v
end type
type cb_2 from commandbutton within w_listado_pagare_v
end type
type cb_1 from commandbutton within w_listado_pagare_v
end type
type dw_listado_pagare_v from datawindow within w_listado_pagare_v
end type
type gb_1 from groupbox within w_listado_pagare_v
end type
end forward

global type w_listado_pagare_v from window
integer x = 818
integer y = 756
integer width = 3625
integer height = 1732
boolean titlebar = true
string title = "Listado General de Pagares por Promesas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_exportar cb_exportar
cb_5 cb_5
cb_fallecidos cb_fallecidos
cb_datos_cliente cb_datos_cliente
cb_beneficiarios_pagare_v cb_beneficiarios_pagare_v
cb_contrato_pagare_v cb_contrato_pagare_v
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_listado_pagare_v dw_listado_pagare_v
gb_1 gb_1
end type
global w_listado_pagare_v w_listado_pagare_v

type variables
Long	il_row
end variables

on w_listado_pagare_v.create
this.cb_exportar=create cb_exportar
this.cb_5=create cb_5
this.cb_fallecidos=create cb_fallecidos
this.cb_datos_cliente=create cb_datos_cliente
this.cb_beneficiarios_pagare_v=create cb_beneficiarios_pagare_v
this.cb_contrato_pagare_v=create cb_contrato_pagare_v
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_listado_pagare_v=create dw_listado_pagare_v
this.gb_1=create gb_1
this.Control[]={this.cb_exportar,&
this.cb_5,&
this.cb_fallecidos,&
this.cb_datos_cliente,&
this.cb_beneficiarios_pagare_v,&
this.cb_contrato_pagare_v,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_listado_pagare_v,&
this.gb_1}
end on

on w_listado_pagare_v.destroy
destroy(this.cb_exportar)
destroy(this.cb_5)
destroy(this.cb_fallecidos)
destroy(this.cb_datos_cliente)
destroy(this.cb_beneficiarios_pagare_v)
destroy(this.cb_contrato_pagare_v)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_listado_pagare_v)
destroy(this.gb_1)
end on

event open;gf_centrar(w_listado_pagare_v)
gs_ventana	= 'w_listado_pagare_v'
f_valida_objeto()
Open(w_espera)
dw_listado_pagare_v.SetTransObject(SQLCA)
dw_listado_pagare_v.Retrieve()
close(w_espera)
end event

type cb_exportar from commandbutton within w_listado_pagare_v
boolean visible = false
integer x = 2757
integer y = 1512
integer width = 233
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_listado_pagare_v
if dw_listado_pagare_v.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_5 from commandbutton within w_listado_pagare_v
integer x = 1819
integer y = 1512
integer width = 251
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Por &Rut"
end type

event clicked;IF il_row > 0 THEN
	gs_base 		= dw_listado_pagare_v.GetItemString(dw_listado_pagare_v.getrow(), "cadena_codigo")
	gs_serie 		= dw_listado_pagare_v.GetItemString(dw_listado_pagare_v.getrow(), "pagare_v_serie")
	gi_numero 	= dw_listado_pagare_v.GetItemNumber(dw_listado_pagare_v.getrow(), "pagare_v_numero")
	gi_rut    		= dw_listado_pagare_v.GetItemNumber(dw_listado_pagare_v.getrow(), "cliente_rut")
	if not isnull(gs_serie) and gi_numero>0 and gi_rut>0 then
		gi_tipo_busqueda = 1
		if isvalid(w_listado_contratos) then close(w_listado_contratos)
		open(w_listado_contratos)
	end if
end if
end event

type cb_fallecidos from commandbutton within w_listado_pagare_v
integer x = 1481
integer y = 1512
integer width = 274
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "F&allecidos"
end type

event clicked;IF il_row > 0 THEN
	gs_base 		= dw_listado_pagare_v.GetItemString(dw_listado_pagare_v.getrow(), "cadena_codigo")
	gs_serie 		= dw_listado_pagare_v.GetItemString(dw_listado_pagare_v.getrow(), "pagare_v_serie")
	gi_numero 	= dw_listado_pagare_v.GetItemNumber(dw_listado_pagare_v.getrow(), "pagare_v_numero")
	gi_rut    		= dw_listado_pagare_v.GetItemNumber(dw_listado_pagare_v.getrow(), "cliente_rut")
	if not isnull(gs_serie) and gi_numero>0 then
		if isvalid(w_listado_fallecidos) then close(w_listado_fallecidos)
		Open(w_listado_fallecidos)
	end if
end if
end event

type cb_datos_cliente from commandbutton within w_listado_pagare_v
integer x = 1157
integer y = 1512
integer width = 320
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Datos Cliente"
end type

event clicked;IF il_row > 0 THEN
	gs_base 		= dw_listado_pagare_v.GetItemString(dw_listado_pagare_v.getrow(), "cadena_codigo")
	gs_serie 		= dw_listado_pagare_v.GetItemString(dw_listado_pagare_v.getrow(), "pagare_v_serie")
	gi_numero 	= dw_listado_pagare_v.GetItemNumber(dw_listado_pagare_v.getrow(), "pagare_v_numero")
	gi_rut    		= dw_listado_pagare_v.GetItemNumber(dw_listado_pagare_v.getrow(), "cliente_rut")
	if not isnull(gs_serie) and gi_numero>0 then
		if isvalid(w_datos_cliente) then close(w_datos_cliente)
		Open(w_datos_cliente)
	end if
end if
end event

type cb_beneficiarios_pagare_v from commandbutton within w_listado_pagare_v
integer x = 827
integer y = 1512
integer width = 325
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Beneficiarios"
end type

event clicked;IF il_row > 0 THEN
	gs_base 		= dw_listado_pagare_v.GetItemString(dw_listado_pagare_v.getrow(), "cadena_codigo")
	gs_serie 		= dw_listado_pagare_v.GetItemString(dw_listado_pagare_v.getrow(), "pagare_v_serie")
	gi_numero 	= dw_listado_pagare_v.GetItemNumber(dw_listado_pagare_v.getrow(), "pagare_v_numero")
	gi_rut    		= dw_listado_pagare_v.GetItemNumber(dw_listado_pagare_v.getrow(), "cliente_rut")
	if not isnull(gs_serie) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_listado_beneficiarios) then close(w_listado_beneficiarios)
				Open(w_listado_beneficiarios)
			CASE "C" // ISACRUZ
				if isvalid(w_listado_beneficiarios2) then close(w_listado_beneficiarios2)
				Open(w_listado_beneficiarios2)
		END CHOOSE
	end if
end if
end event

type cb_contrato_pagare_v from commandbutton within w_listado_pagare_v
integer x = 457
integer y = 1512
integer width = 366
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Datos Contrato"
end type

event clicked;IF il_row > 0 THEN
	gs_base 		= dw_listado_pagare_v.GetItemString(dw_listado_pagare_v.getrow(), "cadena_codigo")
	gs_serie 		= dw_listado_pagare_v.GetItemString(dw_listado_pagare_v.getrow(), "pagare_v_serie")
	gi_numero 	= dw_listado_pagare_v.GetItemNumber(dw_listado_pagare_v.getrow(), "pagare_v_numero")
	gi_rut    		= dw_listado_pagare_v.GetItemNumber(dw_listado_pagare_v.getrow(), "cliente_rut")
	if not isnull(gs_serie) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_datos_contrato_oferta) then close(w_datos_contrato_oferta)
				Open(w_datos_contrato_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_datos_contrato_liberador) then close(w_datos_contrato_liberador)
				Open(w_datos_contrato_liberador)
			CASE "R"
				if isvalid(w_datos_contrato_reprogramacion_cta_mant) then close(w_datos_contrato_reprogramacion_cta_mant)
				open(w_datos_contrato_reprogramacion_cta_mant)
		END CHOOSE
	end if
end if

end event

type cb_4 from commandbutton within w_listado_pagare_v
integer x = 37
integer y = 1512
integer width = 416
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;IF il_row > 0 THEN
	gs_base 		= "O"
	gs_serie 	= dw_listado_pagare_v.GetItemString(dw_listado_pagare_v.getrow(), "pagare_v_serie")
	gi_numero 	= dw_listado_pagare_v.GetItemNumber(dw_listado_pagare_v.getrow(), "pagare_v_numero")
	gi_rut    	= dw_listado_pagare_v.GetItemNumber(dw_listado_pagare_v.getrow(), "cliente_rut")
	if not isnull(gs_serie) and gi_numero>0 then
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
			CASE "R"
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	end if
end if

end event

type cb_3 from commandbutton within w_listado_pagare_v
integer x = 2313
integer y = 1512
integer width = 201
integer height = 92
integer taborder = 80
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
dw_listado_pagare_v.SETfilter(NULO)
dw_listado_pagare_v.filter()
end event

type cb_2 from commandbutton within w_listado_pagare_v
integer x = 2519
integer y = 1512
integer width = 233
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_listado_pagare_v.rowcount()>0 then
	string nulo
	setnull (nulo)
	dw_listado_pagare_v.SETSORT(NULO)
	dw_listado_pagare_v.SORT()
end if
end event

type cb_1 from commandbutton within w_listado_pagare_v
integer x = 3296
integer y = 1512
integer width = 270
integer height = 92
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_listado_pagare_v)
end event

type dw_listado_pagare_v from datawindow within w_listado_pagare_v
integer x = 32
integer y = 32
integer width = 3534
integer height = 1432
integer taborder = 10
boolean titlebar = true
string title = "Listado Pagaré"
string dataobject = "dw_listado_pagare_v"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	il_row									= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base 									= "O"
	gs_serie 								= GetItemString(row, "pagare_v_serie")
	gi_numero 								= GetItemNumber(row, "pagare_v_numero")
	gi_rut    								= GetItemNumber(row, "cliente_rut")
	cb_contrato_pagare_v.enabled 		= TRUE
	cb_beneficiarios_pagare_v.enabled= TRUE
	cb_datos_cliente.enabled 			= TRUE
	cb_fallecidos.enabled 				= f_fallecido(gs_serie, gi_numero, gs_base) = 1
	gs_ventana								= 'w_listado_pagare_v'
	f_valida_objeto()
END IF





end event

event doubleclicked;//CHOOSE CASE gs_base
//	CASE "O" // Oferta
//		Open(w_cuenta_corriente_oferta)
//	CASE "L" // Anexo Liberador
//		Open(w_cuenta_corriente_liberador)
//	CASE "P" // Pagaré
//		Open(w_cuenta_corriente_pagare)
//	CASE "C" // Contrato ISA	
//		Open(w_cuenta_corriente_contrato_isa)
//	CASE "D" // Derecho Especial
//		Open(w_cuenta_corriente_derecho)
//END CHOOSE


end event

event rowfocuschanged;IF This.getrow() > 0 THEN
	il_row									= This.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base 									= "O"
	gs_serie 								= GetItemString(This.getrow(), "pagare_v_serie")
	gi_numero 								= GetItemNumber(This.getrow(), "pagare_v_numero")
	gi_rut    								= GetItemNumber(This.getrow(), "cliente_rut")
	cb_contrato_pagare_v.enabled 		= TRUE
	cb_beneficiarios_pagare_v.enabled= TRUE
	cb_datos_cliente.enabled 			= TRUE
	cb_fallecidos.enabled 				= f_fallecido(gs_serie, gi_numero, gs_base) = 1
	gs_ventana								= 'w_listado_pagare_v'
	f_valida_objeto()
END IF

end event

type gb_1 from groupbox within w_listado_pagare_v
integer x = 2286
integer y = 1456
integer width = 498
integer height = 172
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

