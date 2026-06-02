forward
global type w_lista_convenios_sup from window
end type
type rb_todos from radiobutton within w_lista_convenios_sup
end type
type rb_inactivos from radiobutton within w_lista_convenios_sup
end type
type rb_activos from radiobutton within w_lista_convenios_sup
end type
type cb_salir from commandbutton within w_lista_convenios_sup
end type
type cb_filtrar from commandbutton within w_lista_convenios_sup
end type
type cb_2 from commandbutton within w_lista_convenios_sup
end type
type dw_lista from datawindow within w_lista_convenios_sup
end type
type gb_1 from groupbox within w_lista_convenios_sup
end type
type gb_2 from groupbox within w_lista_convenios_sup
end type
end forward

global type w_lista_convenios_sup from window
integer width = 2994
integer height = 2060
boolean titlebar = true
string title = "Listado Convenios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
rb_todos rb_todos
rb_inactivos rb_inactivos
rb_activos rb_activos
cb_salir cb_salir
cb_filtrar cb_filtrar
cb_2 cb_2
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
end type
global w_lista_convenios_sup w_lista_convenios_sup

type variables
datawindow dw_paso
long	il_row
end variables

on w_lista_convenios_sup.create
this.rb_todos=create rb_todos
this.rb_inactivos=create rb_inactivos
this.rb_activos=create rb_activos
this.cb_salir=create cb_salir
this.cb_filtrar=create cb_filtrar
this.cb_2=create cb_2
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.rb_todos,&
this.rb_inactivos,&
this.rb_activos,&
this.cb_salir,&
this.cb_filtrar,&
this.cb_2,&
this.dw_lista,&
this.gb_1,&
this.gb_2}
end on

on w_lista_convenios_sup.destroy
destroy(this.rb_todos)
destroy(this.rb_inactivos)
destroy(this.rb_activos)
destroy(this.cb_salir)
destroy(this.cb_filtrar)
destroy(this.cb_2)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;gf_centrar(w_lista_convenios_sup)
dw_lista.settransobject(sqlca)
dw_lista.retrieve()
end event

type rb_todos from radiobutton within w_lista_convenios_sup
integer x = 69
integer y = 1840
integer width = 270
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;dw_lista.setfilter('estado = "A" or estado = "I" ')
dw_lista.filter()
end event

type rb_inactivos from radiobutton within w_lista_convenios_sup
integer x = 663
integer y = 1840
integer width = 293
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inactivos"
end type

event clicked;dw_lista.setfilter('estado = "I"')
dw_lista.filter()
end event

type rb_activos from radiobutton within w_lista_convenios_sup
integer x = 347
integer y = 1840
integer width = 288
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activos"
end type

event clicked;dw_lista.setfilter('estado = "A"')
dw_lista.filter()

end event

type cb_salir from commandbutton within w_lista_convenios_sup
integer x = 2565
integer y = 1836
integer width = 389
integer height = 96
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_convenios_sup)
end event

type cb_filtrar from commandbutton within w_lista_convenios_sup
boolean visible = false
integer x = 1454
integer y = 1836
integer width = 320
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Filtrar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type cb_2 from commandbutton within w_lista_convenios_sup
boolean visible = false
integer x = 1769
integer y = 1836
integer width = 320
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Sort"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()
end event

type dw_lista from datawindow within w_lista_convenios_sup
integer x = 37
integer y = 28
integer width = 2917
integer height = 1736
string title = "none"
string dataobject = "dw_lista_convenios_sup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(Row, TRUE)
end if
end event

event rowfocuschanged;il_row	= this.getrow()
if il_row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;string	ls_string
long ll_codigo
if row > 0 then
	il_row	= row
	ll_codigo						= dw_lista.getitemnumber(il_row,'cod_convenio')
	if ll_codigo > 0 then
		ls_string		= string(ll_codigo)
		if isvalid(w_lista_convenios_sup_beneficios) then close(w_lista_convenios_sup_beneficios)
		openwithparm(w_lista_convenios_sup_beneficios,ls_string)
	end if	
end if
end event

type gb_1 from groupbox within w_lista_convenios_sup
boolean visible = false
integer x = 1435
integer y = 1792
integer width = 672
integer height = 156
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
end type

type gb_2 from groupbox within w_lista_convenios_sup
integer x = 37
integer y = 1784
integer width = 955
integer height = 156
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar"
end type

