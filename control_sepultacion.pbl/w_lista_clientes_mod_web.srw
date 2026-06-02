forward
global type w_lista_clientes_mod_web from window
end type
type cb_cerrar from commandbutton within w_lista_clientes_mod_web
end type
type dw_tercero from datawindow within w_lista_clientes_mod_web
end type
type st_2 from statictext within w_lista_clientes_mod_web
end type
type st_1 from statictext within w_lista_clientes_mod_web
end type
type dw_pagador from datawindow within w_lista_clientes_mod_web
end type
end forward

global type w_lista_clientes_mod_web from window
integer width = 3378
integer height = 1760
boolean titlebar = true
string title = "Listado Cliente - Modificación Antecedentes WEB"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cerrar cb_cerrar
dw_tercero dw_tercero
st_2 st_2
st_1 st_1
dw_pagador dw_pagador
end type
global w_lista_clientes_mod_web w_lista_clientes_mod_web

on w_lista_clientes_mod_web.create
this.cb_cerrar=create cb_cerrar
this.dw_tercero=create dw_tercero
this.st_2=create st_2
this.st_1=create st_1
this.dw_pagador=create dw_pagador
this.Control[]={this.cb_cerrar,&
this.dw_tercero,&
this.st_2,&
this.st_1,&
this.dw_pagador}
end on

on w_lista_clientes_mod_web.destroy
destroy(this.cb_cerrar)
destroy(this.dw_tercero)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_pagador)
end on

event open;Long		ll_row_pagador,ll_row_tercero

gf_centrar(w_lista_clientes_mod_web)
dw_pagador.settransobject(sqlca)
dw_tercero.settransobject(sqlca)
ll_row_pagador		= dw_pagador.retrieve(gs_base,gs_serie,gi_numero)
ll_row_tercero		= dw_tercero.retrieve(gs_base,gs_serie,gi_numero)
if ll_row_pagador=0 and ll_row_tercero=0 then
	messagebox("Advertencia","No Registra Modificación de Antecedentes WEB")
end if
end event

type cb_cerrar from commandbutton within w_lista_clientes_mod_web
integer x = 2962
integer y = 1508
integer width = 320
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_lista_clientes_mod_web)
end event

type dw_tercero from datawindow within w_lista_clientes_mod_web
integer x = 41
integer y = 848
integer width = 3241
integer height = 608
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_cliente_tercero_web"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

type st_2 from statictext within w_lista_clientes_mod_web
integer x = 55
integer y = 768
integer width = 576
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cliente Tercero"
boolean focusrectangle = false
end type

type st_1 from statictext within w_lista_clientes_mod_web
integer x = 55
integer y = 28
integer width = 576
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cliente Pagador"
boolean focusrectangle = false
end type

type dw_pagador from datawindow within w_lista_clientes_mod_web
integer x = 41
integer y = 108
integer width = 3241
integer height = 608
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_cliente_pagador"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

