forward
global type w_lista_beneficios from window
end type
type cb_imprimir from commandbutton within w_lista_beneficios
end type
type cb_exportar from commandbutton within w_lista_beneficios
end type
type cb_salir from commandbutton within w_lista_beneficios
end type
type dw_lista from datawindow within w_lista_beneficios
end type
end forward

global type w_lista_beneficios from window
integer width = 3662
integer height = 2016
boolean titlebar = true
string title = "Listado Beneficios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_salir cb_salir
dw_lista dw_lista
end type
global w_lista_beneficios w_lista_beneficios

type variables
datawindow dw_paso
long	il_row
end variables

on w_lista_beneficios.create
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_salir=create cb_salir
this.dw_lista=create dw_lista
this.Control[]={this.cb_imprimir,&
this.cb_exportar,&
this.cb_salir,&
this.dw_lista}
end on

on w_lista_beneficios.destroy
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_salir)
destroy(this.dw_lista)
end on

event open;Long		ll_cod_promo

gf_centrar(w_lista_beneficios)
dw_lista.settransobject(sqlca)
ll_cod_promo	=Long(Message.StringParm)
if dw_lista.retrieve(ll_cod_promo)=0 then
	messagebox("Advertencia","No registra Dato")
	close(w_lista_beneficios)
else
	dw_lista.ExpandLevel(1)
end if
end event

type cb_imprimir from commandbutton within w_lista_beneficios
integer x = 37
integer y = 1776
integer width = 288
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom				= 85
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview	= false
	dw_lista.object.datawindow.zoom				= 100
end if
end event

type cb_exportar from commandbutton within w_lista_beneficios
integer x = 402
integer y = 1776
integer width = 288
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;//datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_salir from commandbutton within w_lista_beneficios
integer x = 3310
integer y = 1776
integer width = 288
integer height = 100
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_beneficios)
end event

type dw_lista from datawindow within w_lista_beneficios
integer x = 37
integer y = 28
integer width = 3561
integer height = 1692
string title = "none"
string dataobject = "dw_lista_beneficios"
boolean hscrollbar = true
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

event doubleclicked;//string	ls_string
//long ll_codigo
//if row > 0 then
//	il_row	= row
//	ll_codigo						= dw_lista.getitemnumber(il_row,'codigo')
//	if ll_codigo > 0 then
//		ls_string		= string(ll_codigo)
//		if isvalid(w_lista_beneficios_detalle) then close(w_lista_beneficios_detalle)
//		openwithparm(w_lista_beneficios_detalle,ls_string)
//	end if	
//end if
end event

