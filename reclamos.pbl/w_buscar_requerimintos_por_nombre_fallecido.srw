forward
global type w_buscar_requerimintos_por_nombre_fallecido from window
end type
type cb_cerrar from commandbutton within w_buscar_requerimintos_por_nombre_fallecido
end type
type dw_lista from datawindow within w_buscar_requerimintos_por_nombre_fallecido
end type
end forward

global type w_buscar_requerimintos_por_nombre_fallecido from window
integer width = 3378
integer height = 1704
boolean titlebar = true
string title = "Untitled"
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
global w_buscar_requerimintos_por_nombre_fallecido w_buscar_requerimintos_por_nombre_fallecido

on w_buscar_requerimintos_por_nombre_fallecido.create
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.dw_lista}
end on

on w_buscar_requerimintos_por_nombre_fallecido.destroy
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_buscar_requerimintos_por_nombre_fallecido)
end event

type cb_cerrar from commandbutton within w_buscar_requerimintos_por_nombre_fallecido
integer x = 2871
integer y = 1464
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_buscar_requerimintos_por_nombre_fallecido)
end event

type dw_lista from datawindow within w_buscar_requerimintos_por_nombre_fallecido
integer x = 64
integer y = 228
integer width = 3177
integer height = 1180
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

