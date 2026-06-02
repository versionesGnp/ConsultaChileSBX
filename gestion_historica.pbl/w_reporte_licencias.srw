forward
global type w_reporte_licencias from window
end type
type pb_ordenar from picturebutton within w_reporte_licencias
end type
type pb_imprimir from picturebutton within w_reporte_licencias
end type
type pb_exportar from picturebutton within w_reporte_licencias
end type
type pb_cerrar from picturebutton within w_reporte_licencias
end type
type dw_lista from datawindow within w_reporte_licencias
end type
end forward

global type w_reporte_licencias from window
integer width = 2917
integer height = 2124
boolean titlebar = true
string title = "Informe Licencias Médicas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_ordenar pb_ordenar
pb_imprimir pb_imprimir
pb_exportar pb_exportar
pb_cerrar pb_cerrar
dw_lista dw_lista
end type
global w_reporte_licencias w_reporte_licencias

type variables
datawindow dw_paso
end variables

on w_reporte_licencias.create
this.pb_ordenar=create pb_ordenar
this.pb_imprimir=create pb_imprimir
this.pb_exportar=create pb_exportar
this.pb_cerrar=create pb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.pb_ordenar,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_cerrar,&
this.dw_lista}
end on

on w_reporte_licencias.destroy
destroy(this.pb_ordenar)
destroy(this.pb_imprimir)
destroy(this.pb_exportar)
destroy(this.pb_cerrar)
destroy(this.dw_lista)
end on

event open;string ll_codigo
gf_centrar(w_reporte_licencias)
dw_lista.settransobject(sqlca)
ll_codigo	= message.StringParm
gs_ventana	= 'w_reporte_licencias'
f_valida_objeto_1()
if dw_lista.retrieve(ll_codigo)=0 then
	messagebox("Advertencia","No tiene Licencias")
	close(w_reporte_licencias)
end if
end event

type pb_ordenar from picturebutton within w_reporte_licencias
integer x = 215
integer y = 1828
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type pb_imprimir from picturebutton within w_reporte_licencias
integer x = 393
integer y = 1828
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false	
end if
end event

type pb_exportar from picturebutton within w_reporte_licencias
integer x = 37
integer y = 1828
integer width = 169
integer height = 148
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event clicked;dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_cerrar from picturebutton within w_reporte_licencias
integer x = 2661
integer y = 1828
integer width = 169
integer height = 148
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_reporte_licencias)
end event

type dw_lista from datawindow within w_reporte_licencias
integer x = 37
integer y = 36
integer width = 2793
integer height = 1756
integer taborder = 10
string dataobject = "dw_lista_licencias"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

