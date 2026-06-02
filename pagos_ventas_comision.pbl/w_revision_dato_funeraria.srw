forward
global type w_revision_dato_funeraria from window
end type
type cb_cerrar from commandbutton within w_revision_dato_funeraria
end type
type dw_revision_datos from datawindow within w_revision_dato_funeraria
end type
end forward

global type w_revision_dato_funeraria from window
integer width = 3333
integer height = 1108
boolean titlebar = true
string title = "Revisión Datos del Mes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
dw_revision_datos dw_revision_datos
end type
global w_revision_dato_funeraria w_revision_dato_funeraria

event open;long	ll_cod_funeraria,ll_cod_parque,ll_mes,ll_ano,ll_tot_reg

gf_centrar(w_revision_dato_funeraria)
ll_cod_funeraria	= long(substr(1,1,Message.StringParm))
ll_cod_parque		= long(substr(1,2,Message.StringParm))
ll_mes				= long(substr(1,3,Message.StringParm))
ll_ano				= long(substr(1,4,Message.StringParm))
dw_revision_datos.settransobject(sqlca)
ll_tot_reg			= dw_revision_datos.retrieve(ll_cod_funeraria,ll_cod_parque,ll_mes,ll_ano)
if ll_tot_reg = 0 then
	messagebox("Advertencia","No Registra datos en el Período")
	close(w_revision_dato_funeraria)
end if
	
end event

on w_revision_dato_funeraria.create
this.cb_cerrar=create cb_cerrar
this.dw_revision_datos=create dw_revision_datos
this.Control[]={this.cb_cerrar,&
this.dw_revision_datos}
end on

on w_revision_dato_funeraria.destroy
destroy(this.cb_cerrar)
destroy(this.dw_revision_datos)
end on

type cb_cerrar from commandbutton within w_revision_dato_funeraria
integer x = 2949
integer y = 868
integer width = 315
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_revision_dato_funeraria)
end event

type dw_revision_datos from datawindow within w_revision_dato_funeraria
integer x = 37
integer y = 32
integer width = 3227
integer height = 820
integer taborder = 10
string title = "none"
string dataobject = "dw_pago_revision_funeraria"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

