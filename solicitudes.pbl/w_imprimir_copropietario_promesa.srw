forward
global type w_imprimir_copropietario_promesa from window
end type
type cb_cerrar from commandbutton within w_imprimir_copropietario_promesa
end type
type cb_print from commandbutton within w_imprimir_copropietario_promesa
end type
type dw_lista from datawindow within w_imprimir_copropietario_promesa
end type
end forward

global type w_imprimir_copropietario_promesa from window
integer width = 3776
integer height = 2824
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_print cb_print
dw_lista dw_lista
end type
global w_imprimir_copropietario_promesa w_imprimir_copropietario_promesa

on w_imprimir_copropietario_promesa.create
this.cb_cerrar=create cb_cerrar
this.cb_print=create cb_print
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.cb_print,&
this.dw_lista}
end on

on w_imprimir_copropietario_promesa.destroy
destroy(this.cb_cerrar)
destroy(this.cb_print)
destroy(this.dw_lista)
end on

event open;String		ls_base,ls_serie,ls_tipo_sol
Long		ll_correlativo
Double	ll_numero
gf_centrar(w_imprimir_copropietario_promesa)
ls_base 																			= substr(1,1,Message.StringParm)
ls_serie																			= substr(1,2,Message.StringParm)
ll_numero																		= Double(substr(1,3,Message.StringParm))
ll_correlativo																	= Long(substr(1,4,Message.StringParm))
ls_tipo_sol																		= substr(1,5,Message.StringParm)
dw_lista.settransobject(sqlca)
if dw_lista.retrieve(ls_base,ls_serie,ll_numero,ll_correlativo,ls_tipo_sol)=0 then
	messagebox("Advertencia","No Registra Solicitud")
	close(w_imprimir_copropietario_promesa)
else
	dw_lista.object.t_61.visible											= false
	dw_lista.object.sol_coprop_promesa_mod_ant_cliente.visible	= false
end if
end event

type cb_cerrar from commandbutton within w_imprimir_copropietario_promesa
integer x = 3296
integer y = 2528
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_imprimir_copropietario_promesa)
end event

type cb_print from commandbutton within w_imprimir_copropietario_promesa
integer x = 32
integer y = 2528
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )
end event

type dw_lista from datawindow within w_imprimir_copropietario_promesa
integer x = 32
integer y = 84
integer width = 3666
integer height = 2412
integer taborder = 10
string title = "none"
string dataobject = "dw_form_copropietario_promesa_print"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

