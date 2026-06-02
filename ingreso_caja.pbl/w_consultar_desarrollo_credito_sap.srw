forward
global type w_consultar_desarrollo_credito_sap from window
end type
type cb_1 from commandbutton within w_consultar_desarrollo_credito_sap
end type
type cb_2 from commandbutton within w_consultar_desarrollo_credito_sap
end type
type cb_3 from commandbutton within w_consultar_desarrollo_credito_sap
end type
type st_2 from statictext within w_consultar_desarrollo_credito_sap
end type
type cb_cerrar from commandbutton within w_consultar_desarrollo_credito_sap
end type
type dw_detalle from datawindow within w_consultar_desarrollo_credito_sap
end type
type gb_1 from groupbox within w_consultar_desarrollo_credito_sap
end type
end forward

global type w_consultar_desarrollo_credito_sap from window
integer width = 4187
integer height = 1504
boolean titlebar = true
string title = "Desarrollo Cuota Crédito"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
st_2 st_2
cb_cerrar cb_cerrar
dw_detalle dw_detalle
gb_1 gb_1
end type
global w_consultar_desarrollo_credito_sap w_consultar_desarrollo_credito_sap

on w_consultar_desarrollo_credito_sap.create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.cb_2,&
this.cb_3,&
this.st_2,&
this.cb_cerrar,&
this.dw_detalle,&
this.gb_1}
end on

on w_consultar_desarrollo_credito_sap.destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
destroy(this.gb_1)
end on

event open;gf_centrar(w_consultar_desarrollo_credito_sap)
dw_detalle.settransobject(sqlca)
if dw_detalle.retrieve(gs_base,gs_serie,gi_numero) = 0 then
	messagebox("Advertencia","No registra Desarrollo Cuota Crédito")
	close(w_consultar_desarrollo_credito_sap)
end if
end event

type cb_1 from commandbutton within w_consultar_desarrollo_credito_sap
integer x = 87
integer y = 1260
integer width = 238
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_detalle.rowcount() > 0 then
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type cb_2 from commandbutton within w_consultar_desarrollo_credito_sap
integer x = 517
integer y = 1260
integer width = 219
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_consultar_desarrollo_credito_sap
integer x = 329
integer y = 1260
integer width = 183
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
setnull (nulo)
dw_detalle.SETfilter(NULO)
dw_detalle.filter()

end event

type st_2 from statictext within w_consultar_desarrollo_credito_sap
integer x = 55
integer y = 32
integer width = 704
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de Cuotas"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_consultar_desarrollo_credito_sap
integer x = 3808
integer y = 1260
integer width = 302
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_consultar_desarrollo_credito_sap)
end event

type dw_detalle from datawindow within w_consultar_desarrollo_credito_sap
integer x = 55
integer y = 120
integer width = 4055
integer height = 1084
integer taborder = 20
string title = "none"
string dataobject = "dw_desarrollo_cuota_capital_interes"
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

type gb_1 from groupbox within w_consultar_desarrollo_credito_sap
integer x = 64
integer y = 1208
integer width = 699
integer height = 172
integer taborder = 80
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

