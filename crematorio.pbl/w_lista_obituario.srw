forward
global type w_lista_obituario from window
end type
type cb_aceptar from commandbutton within w_lista_obituario
end type
type cb_imprimir from commandbutton within w_lista_obituario
end type
type cb_exportar from commandbutton within w_lista_obituario
end type
type cb_sort from commandbutton within w_lista_obituario
end type
type cb_filtrar from commandbutton within w_lista_obituario
end type
type cb_cerrar from commandbutton within w_lista_obituario
end type
type gb_1 from groupbox within w_lista_obituario
end type
type dw_lista from datawindow within w_lista_obituario
end type
end forward

global type w_lista_obituario from window
integer width = 2976
integer height = 1840
boolean titlebar = true
string title = "Lista Obituario"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_aceptar cb_aceptar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_sort cb_sort
cb_filtrar cb_filtrar
cb_cerrar cb_cerrar
gb_1 gb_1
dw_lista dw_lista
end type
global w_lista_obituario w_lista_obituario

on w_lista_obituario.create
this.cb_aceptar=create cb_aceptar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_sort=create cb_sort
this.cb_filtrar=create cb_filtrar
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.dw_lista=create dw_lista
this.Control[]={this.cb_aceptar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_sort,&
this.cb_filtrar,&
this.cb_cerrar,&
this.gb_1,&
this.dw_lista}
end on

on w_lista_obituario.destroy
destroy(this.cb_aceptar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_sort)
destroy(this.cb_filtrar)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.dw_lista)
end on

event open;String	ls_fecha
gf_centrar(w_lista_obituario)
dw_lista.settransobject(sqlca)
ls_fecha	= Message.StringParm
if dw_lista.retrieve(ls_fecha)=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_lista_obituario)
else
	gs_ventana	= 'w_lista_obituario'
	f_valida_objeto2()
end if
end event

type cb_aceptar from commandbutton within w_lista_obituario
integer x = 50
integer y = 1580
integer width = 366
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

type cb_imprimir from commandbutton within w_lista_obituario
integer x = 974
integer y = 1592
integer width = 219
integer height = 88
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
	f_Print( dw_lista )
end if

end event

type cb_exportar from commandbutton within w_lista_obituario
integer x = 1253
integer y = 1592
integer width = 224
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_sort from commandbutton within w_lista_obituario
integer x = 1481
integer y = 1592
integer width = 224
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_filtrar from commandbutton within w_lista_obituario
integer x = 1710
integer y = 1592
integer width = 224
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_cerrar from commandbutton within w_lista_obituario
integer x = 2542
integer y = 1580
integer width = 366
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_obituario)
end event

type gb_1 from groupbox within w_lista_obituario
integer x = 946
integer y = 1540
integer width = 1019
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_lista from datawindow within w_lista_obituario
integer x = 50
integer y = 40
integer width = 2857
integer height = 1492
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lista_obituario"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

