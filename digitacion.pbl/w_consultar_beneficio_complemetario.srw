forward
global type w_consultar_beneficio_complemetario from window
end type
type cb_exportar from commandbutton within w_consultar_beneficio_complemetario
end type
type cb_ordenar from commandbutton within w_consultar_beneficio_complemetario
end type
type cb_imprimir from commandbutton within w_consultar_beneficio_complemetario
end type
type cb_filtrar from commandbutton within w_consultar_beneficio_complemetario
end type
type cb_cerrar from commandbutton within w_consultar_beneficio_complemetario
end type
type st_1 from statictext within w_consultar_beneficio_complemetario
end type
type dw_lista from datawindow within w_consultar_beneficio_complemetario
end type
type gb_1 from groupbox within w_consultar_beneficio_complemetario
end type
end forward

global type w_consultar_beneficio_complemetario from window
integer width = 3333
integer height = 1972
boolean titlebar = true
string title = "Beneficio Complementario"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_imprimir cb_imprimir
cb_filtrar cb_filtrar
cb_cerrar cb_cerrar
st_1 st_1
dw_lista dw_lista
gb_1 gb_1
end type
global w_consultar_beneficio_complemetario w_consultar_beneficio_complemetario

on w_consultar_beneficio_complemetario.create
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_imprimir=create cb_imprimir
this.cb_filtrar=create cb_filtrar
this.cb_cerrar=create cb_cerrar
this.st_1=create st_1
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_exportar,&
this.cb_ordenar,&
this.cb_imprimir,&
this.cb_filtrar,&
this.cb_cerrar,&
this.st_1,&
this.dw_lista,&
this.gb_1}
end on

on w_consultar_beneficio_complemetario.destroy
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_imprimir)
destroy(this.cb_filtrar)
destroy(this.cb_cerrar)
destroy(this.st_1)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long	ll_cod_benef,ll_cod_parque
gf_centrar(w_consultar_beneficio_complemetario)
dw_lista.settransobject(sqlca)
ll_cod_benef	= long(substr(1,1,Message.StringParm))
ll_cod_parque	= long(substr(1,2,Message.StringParm))
if dw_lista.retrieve(ll_cod_benef,ll_cod_parque)=0 then
	messagebox("Advertencia","No registra Dato")
	cb_cerrar.triggerevent(clicked!)
end if
end event

type cb_exportar from commandbutton within w_consultar_beneficio_complemetario
event ue_mousemove pbm_mousemove
integer x = 562
integer y = 1716
integer width = 247
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel(dw_paso)
end event

type cb_ordenar from commandbutton within w_consultar_beneficio_complemetario
event ue_mousemove pbm_dwnmousemove
integer x = 59
integer y = 1716
integer width = 247
integer height = 92
integer taborder = 20
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

type cb_imprimir from commandbutton within w_consultar_beneficio_complemetario
event ue_mousemove pbm_mousemove
integer x = 855
integer y = 1716
integer width = 247
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_filtrar from commandbutton within w_consultar_beneficio_complemetario
event ue_mousemove pbm_mousemove
integer x = 311
integer y = 1716
integer width = 247
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_filtro
setnull (ls_filtro)
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
end event

type cb_cerrar from commandbutton within w_consultar_beneficio_complemetario
integer x = 2912
integer y = 1712
integer width = 334
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_consultar_beneficio_complemetario)
end event

type st_1 from statictext within w_consultar_beneficio_complemetario
integer x = 50
integer y = 20
integer width = 1271
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Beneficio Complementario"
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_consultar_beneficio_complemetario
integer x = 37
integer y = 104
integer width = 3209
integer height = 1556
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_beneficio_complementario"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type gb_1 from groupbox within w_consultar_beneficio_complemetario
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1668
integer width = 1088
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

