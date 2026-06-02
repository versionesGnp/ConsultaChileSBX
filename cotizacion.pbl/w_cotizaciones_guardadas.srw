forward
global type w_cotizaciones_guardadas from window
end type
type cb_1 from commandbutton within w_cotizaciones_guardadas
end type
type dw_cotiz_imprime from datawindow within w_cotizaciones_guardadas
end type
type cb_imprimir from commandbutton within w_cotizaciones_guardadas
end type
type cb_cerrar from commandbutton within w_cotizaciones_guardadas
end type
type dw_lista from datawindow within w_cotizaciones_guardadas
end type
end forward

global type w_cotizaciones_guardadas from window
integer width = 3465
integer height = 2064
boolean titlebar = true
string title = "Cotizaciones"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
cb_1 cb_1
dw_cotiz_imprime dw_cotiz_imprime
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_cotizaciones_guardadas w_cotizaciones_guardadas

type variables
long il_row
end variables

on w_cotizaciones_guardadas.create
this.cb_1=create cb_1
this.dw_cotiz_imprime=create dw_cotiz_imprime
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_1,&
this.dw_cotiz_imprime,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_cotizaciones_guardadas.destroy
destroy(this.cb_1)
destroy(this.dw_cotiz_imprime)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;long ll_rut
gf_centrar(w_cotizaciones_guardadas)
dw_lista.settransobject(sqlca)
dw_cotiz_imprime.settransobject(sqlca)
ll_rut = long(Message.StringParm)
if dw_lista.retrieve(ll_rut)=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_cotizaciones_guardadas)
end if

end event

type cb_1 from commandbutton within w_cotizaciones_guardadas
integer x = 571
integer y = 1812
integer width = 599
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Cotización"
end type

event clicked;f_Print( dw_cotiz_imprime )
//f_printdlg(dw_cotiz_imprime,gstr_print,parent)

end event

type dw_cotiz_imprime from datawindow within w_cotizaciones_guardadas
boolean visible = false
integer x = 654
integer y = 1944
integer width = 1742
integer height = 224
integer taborder = 40
string title = "none"
string dataobject = "dw_cotiz_imprime"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_cotizaciones_guardadas
integer x = 50
integer y = 1812
integer width = 517
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Listado"
end type

event clicked;f_Print( dw_lista )

end event

type cb_cerrar from commandbutton within w_cotizaciones_guardadas
integer x = 2962
integer y = 1812
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cotizaciones_guardadas)
end event

type dw_lista from datawindow within w_cotizaciones_guardadas
integer x = 50
integer y = 44
integer width = 3314
integer height = 1712
integer taborder = 10
string title = "none"
string dataobject = "dw_cotizaciones_guardadas"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string	ls_row
long	ll_corr

if isvalid(w_ingreso_individual_ugn) then
	ll_corr		= dw_lista.getitemnumber(il_row,'correlativo_interno')
	if isvalid(w_detalle_cotizacion_ugn) then close (w_detalle_cotizacion_ugn)
	openwithparm(w_detalle_cotizacion_ugn,string(ll_corr))
end if	
end event

event clicked;long	ll_correl,ll_tot_reg

if isvalid(w_ingreso_individual_ugn) then
	if row > 0 then
		il_row					= row
		This.SelectRow(0, FALSE)
		This.SelectRow(il_row, TRUE)
		dw_cotiz_imprime.accepttext()
		ll_correl				= dw_lista.getitemnumber(il_row,'correlativo_interno')
		ll_tot_reg			= dw_cotiz_imprime.retrieve(ll_correl)
		if ll_tot_reg>0 then
			dw_cotiz_imprime.object.usuario.text		= gs_user
		end if
	end if
end if	
end event

event rowfocuschanged;long	ll_correl,ll_tot_reg

if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	dw_cotiz_imprime.accepttext()
	ll_correl				= dw_lista.getitemnumber(il_row,'correlativo_interno')
	ll_tot_reg			= dw_cotiz_imprime.retrieve(ll_correl)
	if ll_tot_reg>0 then
		dw_cotiz_imprime.object.usuario.text		= gs_user
	end if
end if
end event

