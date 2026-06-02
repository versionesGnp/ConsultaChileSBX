forward
global type w_factores from window
end type
type cb_imprimir from commandbutton within w_factores
end type
type cb_cerrar from commandbutton within w_factores
end type
type dw_lista from datawindow within w_factores
end type
end forward

global type w_factores from window
integer width = 2089
integer height = 1696
boolean titlebar = true
string title = "Lista de Factores"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_factores w_factores

on w_factores.create
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_factores.destroy
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_factores)
dw_lista.settransobject(sqlca)
this.title	= 'Lista Factores de '+gs_conexion
if dw_lista.retrieve()>0 then
	dw_lista.object.t_titulo.text	= gs_conexion
else
	messagebox("Advertencia","No Registra Datos Tabla interes_cuota")
	close(w_factores)
end if
end event

type cb_imprimir from commandbutton within w_factores
integer x = 37
integer y = 1464
integer width = 270
integer height = 92
integer taborder = 20
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

type cb_cerrar from commandbutton within w_factores
integer x = 1737
integer y = 1464
integer width = 274
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_factores)
end event

type dw_lista from datawindow within w_factores
integer x = 32
integer y = 32
integer width = 1979
integer height = 1392
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_factores"
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

