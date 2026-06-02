forward
global type w_lista_de_servicios from window
end type
type cb_imprimir from commandbutton within w_lista_de_servicios
end type
type cb_cerrar from commandbutton within w_lista_de_servicios
end type
type dw_lista from datawindow within w_lista_de_servicios
end type
end forward

global type w_lista_de_servicios from window
integer width = 2199
integer height = 1536
boolean titlebar = true
string title = "Listado Otros Servicios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_lista_de_servicios w_lista_de_servicios

on w_lista_de_servicios.create
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_lista_de_servicios.destroy
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_lista_de_servicios)
dw_lista.settransobject(sqlca)
dw_lista.retrieve()
end event

type cb_imprimir from commandbutton within w_lista_de_servicios
integer x = 50
integer y = 1308
integer width = 293
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	IF PrintSetup( ) <> -1 THEN dw_lista.Print()
END IF

end event

type cb_cerrar from commandbutton within w_lista_de_servicios
integer x = 1806
integer y = 1308
integer width = 329
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_de_servicios)
end event

type dw_lista from datawindow within w_lista_de_servicios
integer x = 50
integer y = 44
integer width = 2085
integer height = 1216
integer taborder = 10
string dataobject = "dw_lista_servicios_otros"
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

