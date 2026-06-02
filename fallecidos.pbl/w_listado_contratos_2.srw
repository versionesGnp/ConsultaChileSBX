forward
global type w_listado_contratos_2 from window
end type
type cb_fallecidos from commandbutton within w_listado_contratos_2
end type
type cb_beneficiarios from commandbutton within w_listado_contratos_2
end type
type cb_datos_clientes from commandbutton within w_listado_contratos_2
end type
type cb_datos_contrato from commandbutton within w_listado_contratos_2
end type
type cb_cerrar from commandbutton within w_listado_contratos_2
end type
type cb_ver_cuenta_corriente from commandbutton within w_listado_contratos_2
end type
type dw_listado_2 from datawindow within w_listado_contratos_2
end type
end forward

global type w_listado_contratos_2 from window
integer x = 462
integer y = 412
integer width = 2953
integer height = 1192
boolean titlebar = true
string title = "Resultado Consulta"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
cb_fallecidos cb_fallecidos
cb_beneficiarios cb_beneficiarios
cb_datos_clientes cb_datos_clientes
cb_datos_contrato cb_datos_contrato
cb_cerrar cb_cerrar
cb_ver_cuenta_corriente cb_ver_cuenta_corriente
dw_listado_2 dw_listado_2
end type
global w_listado_contratos_2 w_listado_contratos_2

on w_listado_contratos_2.create
this.cb_fallecidos=create cb_fallecidos
this.cb_beneficiarios=create cb_beneficiarios
this.cb_datos_clientes=create cb_datos_clientes
this.cb_datos_contrato=create cb_datos_contrato
this.cb_cerrar=create cb_cerrar
this.cb_ver_cuenta_corriente=create cb_ver_cuenta_corriente
this.dw_listado_2=create dw_listado_2
this.Control[]={this.cb_fallecidos,&
this.cb_beneficiarios,&
this.cb_datos_clientes,&
this.cb_datos_contrato,&
this.cb_cerrar,&
this.cb_ver_cuenta_corriente,&
this.dw_listado_2}
end on

on w_listado_contratos_2.destroy
destroy(this.cb_fallecidos)
destroy(this.cb_beneficiarios)
destroy(this.cb_datos_clientes)
destroy(this.cb_datos_contrato)
destroy(this.cb_cerrar)
destroy(this.cb_ver_cuenta_corriente)
destroy(this.dw_listado_2)
end on

event open;long il_cant_datos
gf_centrar(w_listado_contratos_2)
CHOOSE CASE gi_tipo_busqueda
	CASE 1 //Por RUT
		dw_listado_2.DataObject = 'd_cont_resultado_busqueda_x_rut'
		dw_listado_2.SetTransObject(SQLCA)
		il_cant_datos = dw_listado_2.Retrieve(gi_rut)
END CHOOSE
IF il_cant_datos = 0 THEN
	MessageBox("Consulta", "No encontraron datos asociados a su consulta.")
	Close(w_listado_contratos_2)
END IF
end event

type cb_fallecidos from commandbutton within w_listado_contratos_2
integer x = 1632
integer y = 964
integer width = 393
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Fallecidos"
end type

event clicked;Open(w_listado_fallecidos)
end event

type cb_beneficiarios from commandbutton within w_listado_contratos_2
integer x = 1234
integer y = 964
integer width = 393
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Beneficiarios"
end type

event clicked;CHOOSE CASE gs_base
	CASE "O","U" // Oferta
		Open(w_listado_beneficiarios)
END CHOOSE

end event

type cb_datos_clientes from commandbutton within w_listado_contratos_2
integer x = 837
integer y = 964
integer width = 393
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "D&atos Cliente"
end type

event clicked;Open(w_datos_cliente)
end event

type cb_datos_contrato from commandbutton within w_listado_contratos_2
integer x = 439
integer y = 964
integer width = 393
integer height = 100
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

event clicked;CHOOSE CASE gs_base
	CASE "O","U" // Oferta
		Open(w_datos_contrato_oferta)
	CASE "L" // Anexo Liberador
		Open(w_datos_contrato_liberador)
END CHOOSE


end event

type cb_cerrar from commandbutton within w_listado_contratos_2
integer x = 2565
integer y = 964
integer width = 320
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_listado_contratos_2)
end event

type cb_ver_cuenta_corriente from commandbutton within w_listado_contratos_2
integer x = 41
integer y = 964
integer width = 393
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Cuenta Cte."
end type

event clicked;CHOOSE CASE gs_base
	CASE "O","U" // Oferta
		Open(w_cuenta_corriente_oferta)
	CASE "C" // Contrato ISA	
		Open(w_cuenta_corriente_contrato_isa)
END CHOOSE


end event

type dw_listado_2 from datawindow within w_listado_contratos_2
integer x = 41
integer y = 44
integer width = 2843
integer height = 892
integer taborder = 10
boolean titlebar = true
string title = "Listado de Contratos"
string dataobject = "d_cont_resultado_busqueda_x_rut"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base 									= This.GetItemString(row, "cadena_codigo")
	gs_serie 								= This.GetItemString(row, "cadena_serie")
	gi_numero 								= This.GetItemNumber(row, "cadena_numero")
	gi_rut 									= This.GetItemNumber(row, "cliente_rut")
	cb_beneficiarios.enabled 			= TRUE
	cb_datos_clientes.enabled 			= TRUE
	cb_datos_contrato.enabled 			= TRUE
	cb_ver_cuenta_corriente.enabled	= TRUE
	cb_fallecidos.enabled 				= f_fallecido(gs_serie, gi_numero, gs_base) = 1
END IF
end event

