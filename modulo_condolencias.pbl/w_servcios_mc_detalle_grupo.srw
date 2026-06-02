forward
global type w_servcios_mc_detalle_grupo from window
end type
type cb_cerrar from commandbutton within w_servcios_mc_detalle_grupo
end type
type dw_lista from datawindow within w_servcios_mc_detalle_grupo
end type
end forward

global type w_servcios_mc_detalle_grupo from window
integer width = 2523
integer height = 1444
boolean titlebar = true
string title = "Detalle Registros por Servicio"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_servcios_mc_detalle_grupo w_servcios_mc_detalle_grupo

on w_servcios_mc_detalle_grupo.create
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.dw_lista}
end on

on w_servcios_mc_detalle_grupo.destroy
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;long ll_grupo
gf_centrar(w_servcios_mc_detalle_grupo)

dw_lista.settransobject(sqlca)

ll_grupo				= LONG(substr(1,1,Message.StringParm))

dw_lista.retrieve(ll_grupo)
end event

type cb_cerrar from commandbutton within w_servcios_mc_detalle_grupo
integer x = 2098
integer y = 1184
integer width = 352
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_servcios_mc_detalle_grupo)
end event

type dw_lista from datawindow within w_servcios_mc_detalle_grupo
integer x = 32
integer y = 28
integer width = 2405
integer height = 1132
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_gestion_mc"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

