forward
global type w_ugn_lista_grupos_detalle from window
end type
type cb_cerrar from commandbutton within w_ugn_lista_grupos_detalle
end type
type cb_filtrar from commandbutton within w_ugn_lista_grupos_detalle
end type
type cb_imprimir from commandbutton within w_ugn_lista_grupos_detalle
end type
type cb_exportar from commandbutton within w_ugn_lista_grupos_detalle
end type
type cb_ordenar from commandbutton within w_ugn_lista_grupos_detalle
end type
type dw_lista_detalle from datawindow within w_ugn_lista_grupos_detalle
end type
type gb_1 from groupbox within w_ugn_lista_grupos_detalle
end type
end forward

global type w_ugn_lista_grupos_detalle from window
integer width = 3566
integer height = 1976
boolean titlebar = true
string title = "Detalle de Grupo UGN"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_filtrar cb_filtrar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_ordenar cb_ordenar
dw_lista_detalle dw_lista_detalle
gb_1 gb_1
end type
global w_ugn_lista_grupos_detalle w_ugn_lista_grupos_detalle

type variables
long	il_row
end variables

on w_ugn_lista_grupos_detalle.create
this.cb_cerrar=create cb_cerrar
this.cb_filtrar=create cb_filtrar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.dw_lista_detalle=create dw_lista_detalle
this.gb_1=create gb_1
this.Control[]={this.cb_cerrar,&
this.cb_filtrar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_ordenar,&
this.dw_lista_detalle,&
this.gb_1}
end on

on w_ugn_lista_grupos_detalle.destroy
destroy(this.cb_cerrar)
destroy(this.cb_filtrar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.dw_lista_detalle)
destroy(this.gb_1)
end on

event open;Long		ll_grupo
String	ls_tipo

gf_centrar(w_ugn_lista_grupos_detalle)
ll_grupo = Long(substr(1,1,Message.StringParm))
ls_tipo 	= Trim(substr(1,2,Message.StringParm))
if ls_tipo='SUP' then
	dw_lista_detalle.dataobject	= 'dw_listado_grupo_detalle_venta'	//dw_listado_grupo_detalle_venta
elseif ls_tipo='UGN' then
	dw_lista_detalle.dataobject	= 'dw_listado_grupo_detalle_venta'		//dw_listado_grupo_detalle_ugn
end if
dw_lista_detalle.settransobject(sqlca)
if dw_lista_detalle.retrieve(ll_grupo)=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_ugn_lista_grupos_detalle)
else
	dw_lista_detalle.setfocus()
end if

end event

type cb_cerrar from commandbutton within w_ugn_lista_grupos_detalle
integer x = 3209
integer y = 1696
integer width = 311
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ugn_lista_grupos_detalle)
end event

type cb_filtrar from commandbutton within w_ugn_lista_grupos_detalle
event ue_mousemove pbm_mousemove
integer x = 306
integer y = 1704
integer width = 247
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_nulo

setnull(ls_nulo)
dw_lista_detalle.setfilter(ls_nulo)
dw_lista_detalle.filter()
end event

type cb_imprimir from commandbutton within w_ugn_lista_grupos_detalle
event ue_mousemove pbm_mousemove
integer x = 805
integer y = 1704
integer width = 256
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista_detalle.rowcount()>0 then
	dw_lista_detalle.object.datawindow.Print.Preview	= true
	dw_lista_detalle.object.datawindow.zoom				= 80
	f_Print( dw_lista_detalle )
	dw_lista_detalle.object.datawindow.Print.Preview	= true
	dw_lista_detalle.object.datawindow.zoom				= 100
end if
end event

type cb_exportar from commandbutton within w_ugn_lista_grupos_detalle
event ue_mousemove pbm_mousemove
integer x = 558
integer y = 1704
integer width = 247
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista_detalle
if dw_lista_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ordenar from commandbutton within w_ugn_lista_grupos_detalle
event ue_mousemove pbm_dwnmousemove
integer x = 55
integer y = 1704
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

event clicked;if dw_lista_detalle.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista_detalle.SETSORT(NULO)
	dw_lista_detalle.SORT()
end if
end event

type dw_lista_detalle from datawindow within w_ugn_lista_grupos_detalle
integer x = 32
integer y = 32
integer width = 3488
integer height = 1616
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_grupo_detalle_ugn"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event itemchanged;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_1 from groupbox within w_ugn_lista_grupos_detalle
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1656
integer width = 1056
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

