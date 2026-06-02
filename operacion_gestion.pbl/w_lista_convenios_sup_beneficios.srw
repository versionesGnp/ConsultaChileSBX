forward
global type w_lista_convenios_sup_beneficios from window
end type
type cb_salir from commandbutton within w_lista_convenios_sup_beneficios
end type
type dw_lista from datawindow within w_lista_convenios_sup_beneficios
end type
end forward

global type w_lista_convenios_sup_beneficios from window
integer width = 2994
integer height = 2060
boolean titlebar = true
string title = "Beneficios Convenio"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_salir cb_salir
dw_lista dw_lista
end type
global w_lista_convenios_sup_beneficios w_lista_convenios_sup_beneficios

type variables
datawindow dw_paso
long	il_row
end variables

on w_lista_convenios_sup_beneficios.create
this.cb_salir=create cb_salir
this.dw_lista=create dw_lista
this.Control[]={this.cb_salir,&
this.dw_lista}
end on

on w_lista_convenios_sup_beneficios.destroy
destroy(this.cb_salir)
destroy(this.dw_lista)
end on

event open;long ll_codigo_convenio

gf_centrar(w_lista_convenios_sup_beneficios)
dw_lista.settransobject(sqlca)
ll_codigo_convenio							= long(Message.StringParm)
if dw_lista.retrieve(ll_codigo_convenio) = 0 then
	messagebox('Aviso','Convenio sin Beneficios Ingresados')
	close(w_lista_convenios_sup_beneficios)
end if	
	
end event

type cb_salir from commandbutton within w_lista_convenios_sup_beneficios
integer x = 2565
integer y = 1820
integer width = 389
integer height = 96
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_convenios_sup_beneficios)
end event

type dw_lista from datawindow within w_lista_convenios_sup_beneficios
integer x = 37
integer y = 28
integer width = 2917
integer height = 1736
string title = "none"
string dataobject = "dw_imprimir_codigos_beneficios"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(Row, TRUE)
end if
end event

event rowfocuschanged;il_row	= this.getrow()
if il_row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

