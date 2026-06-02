forward
global type w_lista_licencias from window
end type
type pb_exportar from picturebutton within w_lista_licencias
end type
type pb_ordenar from picturebutton within w_lista_licencias
end type
type pb_filtrar from picturebutton within w_lista_licencias
end type
type pb_aceptar from picturebutton within w_lista_licencias
end type
type pb_cerrar from picturebutton within w_lista_licencias
end type
type dw_lista from datawindow within w_lista_licencias
end type
end forward

global type w_lista_licencias from window
integer width = 2871
integer height = 2040
boolean titlebar = true
string title = "Lista Licencias Médicas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_exportar pb_exportar
pb_ordenar pb_ordenar
pb_filtrar pb_filtrar
pb_aceptar pb_aceptar
pb_cerrar pb_cerrar
dw_lista dw_lista
end type
global w_lista_licencias w_lista_licencias

type variables
Datawindow	dw_paso
end variables

on w_lista_licencias.create
this.pb_exportar=create pb_exportar
this.pb_ordenar=create pb_ordenar
this.pb_filtrar=create pb_filtrar
this.pb_aceptar=create pb_aceptar
this.pb_cerrar=create pb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.pb_exportar,&
this.pb_ordenar,&
this.pb_filtrar,&
this.pb_aceptar,&
this.pb_cerrar,&
this.dw_lista}
end on

on w_lista_licencias.destroy
destroy(this.pb_exportar)
destroy(this.pb_ordenar)
destroy(this.pb_filtrar)
destroy(this.pb_aceptar)
destroy(this.pb_cerrar)
destroy(this.dw_lista)
end on

event open;String	ls_codigo

gf_centrar(w_lista_licencias)
dw_lista.settransobject(sqlca)
ls_codigo	= trim(Message.StringParm)
if dw_lista.retrieve(ls_codigo)=0 then
	messagebox("Advertencia","No registra dato")
	close(w_lista_licencias)
end if
end event

type pb_exportar from picturebutton within w_lista_licencias
integer x = 562
integer y = 1712
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
alignment htextalign = left!
end type

event clicked;dw_paso	= dw_lista
OpenWithParm(w_exportar, dw_paso)
end event

type pb_ordenar from picturebutton within w_lista_licencias
integer x = 389
integer y = 1712
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
alignment htextalign = left!
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()
end event

type pb_filtrar from picturebutton within w_lista_licencias
integer x = 215
integer y = 1712
integer width = 169
integer height = 148
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "exportar.bmp"
alignment htextalign = left!
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type pb_aceptar from picturebutton within w_lista_licencias
integer x = 41
integer y = 1712
integer width = 169
integer height = 148
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long		ll_rut, ll_fila
String	ls_licencia
ll_fila	= dw_lista.getrow()
if ll_fila>0 then
	ll_rut		= dw_lista.getitemnumber(ll_fila,'rut_empleado')
	ls_licencia	= dw_lista.getitemstring(ll_fila,'nro_licencia')
	w_mantencion.dw_datos.retrieve(ls_licencia,ll_rut)
	w_mantencion.dw_datos.setitem(1,'estado_licencia',1)
	w_mantencion.dw_datos.setitem(1,'estado_rut',1)
	w_mantencion.dw_datos.setitem(1,'estado_rut_medico',1)
	w_mantencion.dw_datos.accepttext()
	w_mantencion.dw_datos.setfocus()
	w_mantencion.dw_datos.setcolumn('nro_licencia')
	pb_cerrar.triggerevent(clicked!)
else
	messagebox("Advertencia","Debe seleccionar Licencia")
end if
end event

type pb_cerrar from picturebutton within w_lista_licencias
integer x = 2651
integer y = 1712
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

event clicked;close(w_lista_licencias)
end event

type dw_lista from datawindow within w_lista_licencias
integer x = 41
integer y = 40
integer width = 2779
integer height = 1612
string title = "none"
string dataobject = "dw_lista_licencias"
boolean hscrollbar = true
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

event doubleclicked;pb_aceptar.triggerevent(clicked!)
end event

