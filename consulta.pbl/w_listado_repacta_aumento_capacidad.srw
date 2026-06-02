forward
global type w_listado_repacta_aumento_capacidad from window
end type
type cb_cerrar from commandbutton within w_listado_repacta_aumento_capacidad
end type
type dw_listado_repacta from datawindow within w_listado_repacta_aumento_capacidad
end type
end forward

global type w_listado_repacta_aumento_capacidad from window
integer x = 133
integer y = 364
integer width = 3191
integer height = 852
boolean titlebar = true
string title = "Listado de Repactaciones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_cerrar cb_cerrar
dw_listado_repacta dw_listado_repacta
end type
global w_listado_repacta_aumento_capacidad w_listado_repacta_aumento_capacidad

on w_listado_repacta_aumento_capacidad.create
this.cb_cerrar=create cb_cerrar
this.dw_listado_repacta=create dw_listado_repacta
this.Control[]={this.cb_cerrar,&
this.dw_listado_repacta}
end on

on w_listado_repacta_aumento_capacidad.destroy
destroy(this.cb_cerrar)
destroy(this.dw_listado_repacta)
end on

event open;gf_centrar (w_listado_repacta_aumento_capacidad)
dw_listado_repacta.SetTransObject(SQLCA)
dw_listado_repacta.Retrieve(gs_serie,gi_numero)
end event

type cb_cerrar from commandbutton within w_listado_repacta_aumento_capacidad
integer x = 2825
integer y = 632
integer width = 306
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_listado_repacta_aumento_capacidad)
end event

type dw_listado_repacta from datawindow within w_listado_repacta_aumento_capacidad
integer x = 37
integer y = 40
integer width = 3095
integer height = 548
integer taborder = 10
string dataobject = "d_listado_repacta_aumento_capacitacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then 
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then 
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

