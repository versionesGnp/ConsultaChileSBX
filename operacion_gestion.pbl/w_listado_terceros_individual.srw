forward
global type w_listado_terceros_individual from window
end type
type cb_cerrar from commandbutton within w_listado_terceros_individual
end type
type dw_lista from datawindow within w_listado_terceros_individual
end type
end forward

global type w_listado_terceros_individual from window
integer width = 3991
integer height = 1204
boolean titlebar = true
string title = "Clientes Terceros Registrados"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_listado_terceros_individual w_listado_terceros_individual

on w_listado_terceros_individual.create
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.dw_lista}
end on

on w_listado_terceros_individual.destroy
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;string		ls_base,ls_serie
double	ll_numero

gf_centrar(w_listado_terceros_individual)

ls_base 			= substr(1,1,Message.StringParm)
ls_serie			= substr(1,2,Message.StringParm)
ll_numero		= Double(substr(1,3,Message.StringParm))

dw_lista.settransobject(sqlca)
dw_lista.retrieve(ls_base,ls_serie,ll_numero)
end event

type cb_cerrar from commandbutton within w_listado_terceros_individual
integer x = 3552
integer y = 972
integer width = 389
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_listado_terceros_individual)
end event

type dw_lista from datawindow within w_listado_terceros_individual
integer x = 27
integer y = 32
integer width = 3913
integer height = 908
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_terceros_individual"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

