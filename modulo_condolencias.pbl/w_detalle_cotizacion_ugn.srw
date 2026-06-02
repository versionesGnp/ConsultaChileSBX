forward
global type w_detalle_cotizacion_ugn from window
end type
type cb_imprimir from commandbutton within w_detalle_cotizacion_ugn
end type
type dw_cotiz_imprime from datawindow within w_detalle_cotizacion_ugn
end type
type cb_1 from commandbutton within w_detalle_cotizacion_ugn
end type
type dw_lista from datawindow within w_detalle_cotizacion_ugn
end type
end forward

global type w_detalle_cotizacion_ugn from window
integer width = 2560
integer height = 1036
boolean titlebar = true
string title = "Detalle Cotizacion UGN"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_imprimir cb_imprimir
dw_cotiz_imprime dw_cotiz_imprime
cb_1 cb_1
dw_lista dw_lista
end type
global w_detalle_cotizacion_ugn w_detalle_cotizacion_ugn

on w_detalle_cotizacion_ugn.create
this.cb_imprimir=create cb_imprimir
this.dw_cotiz_imprime=create dw_cotiz_imprime
this.cb_1=create cb_1
this.dw_lista=create dw_lista
this.Control[]={this.cb_imprimir,&
this.dw_cotiz_imprime,&
this.cb_1,&
this.dw_lista}
end on

on w_detalle_cotizacion_ugn.destroy
destroy(this.cb_imprimir)
destroy(this.dw_cotiz_imprime)
destroy(this.cb_1)
destroy(this.dw_lista)
end on

event open;long	ll_corr

gf_centrar(w_detalle_cotizacion_ugn)
dw_lista.settransobject(sqlca)
dw_cotiz_imprime.settransobject(sqlca)
ll_corr								= long(Message.StringParm)

if not isnull(ll_corr) and ll_corr > 0 then
	dw_lista.retrieve(ll_corr)
	dw_cotiz_imprime.retrieve(ll_corr)
end if
end event

type cb_imprimir from commandbutton within w_detalle_cotizacion_ugn
integer x = 41
integer y = 780
integer width = 293
integer height = 104
integer taborder = 21
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_cotiz_imprime.rowcount() >0 then 
	f_Print( dw_cotiz_imprime )
end if
end event

type dw_cotiz_imprime from datawindow within w_detalle_cotizacion_ugn
integer x = 631
integer y = 1032
integer width = 686
integer height = 400
integer taborder = 11
string title = "none"
string dataobject = "dw_cotiz_imprime"
boolean border = false
boolean livescroll = true
end type

type cb_1 from commandbutton within w_detalle_cotizacion_ugn
integer x = 2194
integer y = 780
integer width = 293
integer height = 104
integer taborder = 1
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_detalle_cotizacion_ugn)
end event

type dw_lista from datawindow within w_detalle_cotizacion_ugn
integer x = 32
integer y = 32
integer width = 2478
integer height = 712
string title = "none"
string dataobject = "dw_detalle_cotizacion_ugn"
boolean border = false
boolean livescroll = true
end type

