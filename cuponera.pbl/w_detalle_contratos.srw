forward
global type w_detalle_contratos from window
end type
type cb_ctacte from commandbutton within w_detalle_contratos
end type
type cb_4 from commandbutton within w_detalle_contratos
end type
type cb_3 from commandbutton within w_detalle_contratos
end type
type cb_2 from commandbutton within w_detalle_contratos
end type
type cb_exportar from commandbutton within w_detalle_contratos
end type
type cb_1 from commandbutton within w_detalle_contratos
end type
type dw_detalle from datawindow within w_detalle_contratos
end type
end forward

global type w_detalle_contratos from window
integer width = 2683
integer height = 1492
boolean titlebar = true
string title = "Detalle Contratos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_exportar cb_exportar
cb_1 cb_1
dw_detalle dw_detalle
end type
global w_detalle_contratos w_detalle_contratos

event open;string		ls_mensaje, ls_base3, ls_serie3
double	ll_numero3
gf_centrar(w_detalle_contratos)
gs_ventana		= 'w_detalle_contratos'
f_valida_objeto()
dw_detalle.settransobject(sqlca)
ls_mensaje	= Message.StringParm
ls_base3		= mid(ls_mensaje,1,1)
ls_serie3	= mid(ls_mensaje,2,1)
ll_numero3	= Double(mid(ls_mensaje,3))
if dw_detalle.retrieve(ls_base3,ls_serie3,ll_numero3)=0 then
	messagebox("Advertencia","No registra datos")
	close(this)
end if
end event

on w_detalle_contratos.create
this.cb_ctacte=create cb_ctacte
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_exportar=create cb_exportar
this.cb_1=create cb_1
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_ctacte,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_exportar,&
this.cb_1,&
this.dw_detalle}
end on

on w_detalle_contratos.destroy
destroy(this.cb_ctacte)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_exportar)
destroy(this.cb_1)
destroy(this.dw_detalle)
end on

type cb_ctacte from commandbutton within w_detalle_contratos
integer x = 1573
integer y = 1256
integer width = 462
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consulta Cta. Cte."
end type

event clicked;string tipo
string esta
gi_numero = dw_detalle.getitemnumber(dw_detalle.getrow(),'ingreso_contrato')
gi_tipo_busqueda = 8
Open(w_listado_contratos)
end event

type cb_4 from commandbutton within w_detalle_contratos
integer x = 1029
integer y = 1256
integer width = 320
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then 
	dw_detalle.object.datawindow.print.Preview = true
	f_Print( dw_detalle )
	dw_detalle.object.datawindow.print.Preview = false	
end if
end event

type cb_3 from commandbutton within w_detalle_contratos
integer x = 704
integer y = 1256
integer width = 320
integer height = 100
integer taborder = 40
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
dw_detalle.SETfilter(NULO)
dw_detalle.filter()

end event

type cb_2 from commandbutton within w_detalle_contratos
integer x = 379
integer y = 1256
integer width = 320
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_detalle.SETSORT(NULO)
dw_detalle.SORT()

end event

type cb_exportar from commandbutton within w_detalle_contratos
integer x = 55
integer y = 1256
integer width = 320
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	f_DWToExcel( dw_detalle)
end if
end event

type cb_1 from commandbutton within w_detalle_contratos
integer x = 2299
integer y = 1256
integer width = 320
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(parent)
end event

type dw_detalle from datawindow within w_detalle_contratos
integer x = 46
integer y = 40
integer width = 2574
integer height = 1156
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_contrato"
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

event doubleclicked;if dw_detalle.getrow() > 0 then cb_ctacte.triggerevent(clicked!)
end event

