forward
global type w_listado_reprogramacion_credito from window
end type
type cb_cerrar from commandbutton within w_listado_reprogramacion_credito
end type
type dw_lista from datawindow within w_listado_reprogramacion_credito
end type
end forward

global type w_listado_reprogramacion_credito from window
integer width = 3273
integer height = 1160
boolean titlebar = true
string title = "Lista de Reprogramaciones de Credito"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_listado_reprogramacion_credito w_listado_reprogramacion_credito

on w_listado_reprogramacion_credito.create
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.dw_lista}
end on

on w_listado_reprogramacion_credito.destroy
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;dw_lista.settransobject(sqlca)
gf_centrar(w_listado_reprogramacion_credito)
end event

type cb_cerrar from commandbutton within w_listado_reprogramacion_credito
integer x = 2834
integer y = 860
integer width = 357
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listado_reprogramacion_credito)
end event

type dw_lista from datawindow within w_listado_reprogramacion_credito
integer x = 32
integer y = 32
integer width = 3163
integer height = 788
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_detalle_repacata_credito"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

