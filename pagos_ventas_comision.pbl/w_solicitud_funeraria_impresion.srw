forward
global type w_solicitud_funeraria_impresion from window
end type
type cb_cerrar from commandbutton within w_solicitud_funeraria_impresion
end type
type cb_imprimir from commandbutton within w_solicitud_funeraria_impresion
end type
type dw_solicitud from datawindow within w_solicitud_funeraria_impresion
end type
end forward

global type w_solicitud_funeraria_impresion from window
integer width = 4338
integer height = 1972
boolean titlebar = true
string title = "Vista Previa"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
dw_solicitud dw_solicitud
end type
global w_solicitud_funeraria_impresion w_solicitud_funeraria_impresion

on w_solicitud_funeraria_impresion.create
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.dw_solicitud=create dw_solicitud
this.Control[]={this.cb_cerrar,&
this.cb_imprimir,&
this.dw_solicitud}
end on

on w_solicitud_funeraria_impresion.destroy
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.dw_solicitud)
end on

event open;string	ls_base,ls_serie
long	ll_tot_reg,ll_parque
double	ldb_numero

gf_centrar(w_solicitud_funeraria_impresion)
dw_solicitud.dataobject							= 'dw_pago_comision_funeraria_impresion'
dw_solicitud.settransobject(sqlca)
ls_base												= substr(1,1,Message.StringParm)
ls_serie												= substr(1,2,Message.StringParm)
ldb_numero 										= double(substr(1,3,Message.StringParm))
dw_solicitud.settransobject(sqlca)
ll_tot_reg											= dw_solicitud.retrieve(ls_base,ls_serie,ldb_numero)
if gs_conexion	= "Parque El Prado" then
	dw_solicitud.object.empresa_t.text		= 'Inmobiliaria Parque La Florida SpA'
elseif gs_conexion	= "Parque La Foresta" then
	dw_solicitud.object.empresa_t.text		= 'Inmobiliaria Parque de La Serena SpA'
elseif gs_conexion	= "Parque Concepción" then
	dw_solicitud.object.empresa_t.text		= 'Parque de Concepción SpA'
end if
if ll_tot_reg = 0 then
	messagebox("Advertencia","No Registra datos en el Período")
	close(w_solicitud_funeraria_impresion)
end if
end event

type cb_cerrar from commandbutton within w_solicitud_funeraria_impresion
event ue_mousemove pbm_mousemove
integer x = 3927
integer y = 1684
integer width = 361
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_solicitud_funeraria_impresion)
end event

type cb_imprimir from commandbutton within w_solicitud_funeraria_impresion
event ue_mousemove pbm_mousemove
integer x = 23
integer y = 1684
integer width = 334
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_solicitud.rowcount()>0 then
	f_Print( dw_solicitud )
end if
end event

type dw_solicitud from datawindow within w_solicitud_funeraria_impresion
integer x = 23
integer y = 24
integer width = 4265
integer height = 1632
integer taborder = 10
string title = "none"
string dataobject = "dw_pago_comision_funeraria_impresion"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

