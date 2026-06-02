forward
global type w_herederos_promesas from window
end type
type cb_cerrar from commandbutton within w_herederos_promesas
end type
type dw_lista from datawindow within w_herederos_promesas
end type
end forward

global type w_herederos_promesas from window
integer width = 2834
integer height = 1412
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_herederos_promesas w_herederos_promesas

on w_herederos_promesas.create
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.dw_lista}
end on

on w_herederos_promesas.destroy
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_herederos_promesas)
dw_lista.settransobject(sqlca)
if dw_lista.retrieve(gs_base,gs_serie,gi_numero)=0 then
	messagebox("Advertencia","No Registra Dato")
else
	w_herederos_promesas.title		= 'Detalle de Herederos Promesas '+gs_base+'-'+gs_serie+'-'+string(gi_numero,'###,###,###,###,###')
end if
end event

type cb_cerrar from commandbutton within w_herederos_promesas
integer x = 2464
integer y = 1136
integer width = 320
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_herederos_promesas)
end event

type dw_lista from datawindow within w_herederos_promesas
integer x = 37
integer y = 40
integer width = 2747
integer height = 1052
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_herederos_promesas"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

