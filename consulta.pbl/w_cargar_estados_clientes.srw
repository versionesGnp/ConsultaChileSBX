forward
global type w_cargar_estados_clientes from window
end type
type dw_lista from datawindow within w_cargar_estados_clientes
end type
end forward

global type w_cargar_estados_clientes from window
integer width = 2578
integer height = 1584
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_lista dw_lista
end type
global w_cargar_estados_clientes w_cargar_estados_clientes

on w_cargar_estados_clientes.create
this.dw_lista=create dw_lista
this.Control[]={this.dw_lista}
end on

on w_cargar_estados_clientes.destroy
destroy(this.dw_lista)
end on

event open;gf_centrar(w_cargar_estados_clientes)
end event

type dw_lista from datawindow within w_cargar_estados_clientes
integer x = 32
integer y = 32
integer width = 2464
integer height = 1332
integer taborder = 10
string title = "none"
string dataobject = "dw_cargar_estados_clientes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

