forward
global type w_buscar_lista_tasas from window
end type
type cb_1 from commandbutton within w_buscar_lista_tasas
end type
type cb_2 from commandbutton within w_buscar_lista_tasas
end type
type cb_3 from commandbutton within w_buscar_lista_tasas
end type
type cb_imprimir from commandbutton within w_buscar_lista_tasas
end type
type cb_cerrar from commandbutton within w_buscar_lista_tasas
end type
type cb_aceptar from commandbutton within w_buscar_lista_tasas
end type
type st_1 from statictext within w_buscar_lista_tasas
end type
type dw_lista from datawindow within w_buscar_lista_tasas
end type
type gb_1 from groupbox within w_buscar_lista_tasas
end type
end forward

global type w_buscar_lista_tasas from window
integer width = 3314
integer height = 1428
boolean titlebar = true
string title = "Lista Tasas"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
st_1 st_1
dw_lista dw_lista
gb_1 gb_1
end type
global w_buscar_lista_tasas w_buscar_lista_tasas

on w_buscar_lista_tasas.create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.st_1=create st_1
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.cb_cerrar,&
this.cb_aceptar,&
this.st_1,&
this.dw_lista,&
this.gb_1}
end on

on w_buscar_lista_tasas.destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.st_1)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_buscar_lista_tasas)
dw_lista.settransobject(sqlca)
if dw_lista.retrieve() = 0 then
	messagebox("Advertencia","No Registra Dato")
	cb_cerrar.triggerevent(clicked!)
end if
end event

type cb_1 from commandbutton within w_buscar_lista_tasas
integer x = 1243
integer y = 1148
integer width = 146
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_2 from commandbutton within w_buscar_lista_tasas
integer x = 1568
integer y = 1148
integer width = 219
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso

dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_buscar_lista_tasas
integer x = 1390
integer y = 1148
integer width = 178
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo

setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_imprimir from commandbutton within w_buscar_lista_tasas
integer x = 1787
integer y = 1148
integer width = 219
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.print()
end if
end event

type cb_cerrar from commandbutton within w_buscar_lista_tasas
integer x = 2898
integer y = 1140
integer width = 325
integer height = 112
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_buscar_lista_tasas)
end event

type cb_aceptar from commandbutton within w_buscar_lista_tasas
integer x = 50
integer y = 1140
integer width = 325
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;Long		ll_fila
Date		ldt_fecha

if isvalid(w_mantenedor_tasa) then 
	ll_fila					= dw_lista.getrow()
	if ll_fila > 0 then
		ldt_fecha			= date(dw_lista.getitemdatetime(ll_fila,'fecha'))
		w_mantenedor_tasa.dw_lista.retrieve(ldt_fecha)
		w_mantenedor_tasa.dw_lista.setfocus()
		cb_cerrar.triggerevent(clicked!)
	end if
end if
end event

type st_1 from statictext within w_buscar_lista_tasas
integer x = 59
integer y = 32
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Tasas"
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_buscar_lista_tasas
integer x = 55
integer y = 132
integer width = 3168
integer height = 964
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_buscar_log_tasa"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row > 0 then
	cb_aceptar.triggerevent(clicked!)
end if
end event

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

type gb_1 from groupbox within w_buscar_lista_tasas
integer x = 1216
integer y = 1092
integer width = 818
integer height = 184
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

