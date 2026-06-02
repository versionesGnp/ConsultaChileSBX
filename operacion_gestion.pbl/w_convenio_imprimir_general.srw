forward
global type w_convenio_imprimir_general from window
end type
type cb_filtrar from commandbutton within w_convenio_imprimir_general
end type
type cb_exportar from commandbutton within w_convenio_imprimir_general
end type
type cb_2 from commandbutton within w_convenio_imprimir_general
end type
type cb_imprimir from commandbutton within w_convenio_imprimir_general
end type
type cb_cerrar from commandbutton within w_convenio_imprimir_general
end type
type dw_imprimir from datawindow within w_convenio_imprimir_general
end type
type gb_1 from groupbox within w_convenio_imprimir_general
end type
end forward

global type w_convenio_imprimir_general from window
integer width = 3506
integer height = 1852
boolean titlebar = true
string title = "Imprimir Beneficios Convenios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_2 cb_2
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_imprimir dw_imprimir
gb_1 gb_1
end type
global w_convenio_imprimir_general w_convenio_imprimir_general

type variables
datawindow dw_paso
end variables

on w_convenio_imprimir_general.create
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_2=create cb_2
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_imprimir=create dw_imprimir
this.gb_1=create gb_1
this.Control[]={this.cb_filtrar,&
this.cb_exportar,&
this.cb_2,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_imprimir,&
this.gb_1}
end on

on w_convenio_imprimir_general.destroy
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_2)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_imprimir)
destroy(this.gb_1)
end on

event open;gf_centrar(w_convenio_imprimir_general)
dw_imprimir.settransobject(sqlca)
dw_imprimir.insertrow(0)
dw_imprimir.retrieve()
dw_imprimir.object.t_usuario.text	= gs_user
dw_imprimir.accepttext()
end event

type cb_filtrar from commandbutton within w_convenio_imprimir_general
integer x = 1253
integer y = 1636
integer width = 306
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
Setnull (nulo)
dw_imprimir.setfilter(nulo)
dw_imprimir.filter()
end event

type cb_exportar from commandbutton within w_convenio_imprimir_general
integer x = 1915
integer y = 1636
integer width = 306
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;dw_paso	= dw_imprimir
f_DWToExcel( dw_paso )
end event

type cb_2 from commandbutton within w_convenio_imprimir_general
integer x = 1559
integer y = 1636
integer width = 306
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
setnull (nulo)
dw_imprimir.SETSORT(NULO)
dw_imprimir.SORT()
end event

type cb_imprimir from commandbutton within w_convenio_imprimir_general
integer x = 27
integer y = 1636
integer width = 306
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_imprimir.rowcount()>0 then
	f_Print( dw_imprimir )
end if
end event

type cb_cerrar from commandbutton within w_convenio_imprimir_general
integer x = 3150
integer y = 1636
integer width = 306
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_convenio_imprimir_general)
end event

type dw_imprimir from datawindow within w_convenio_imprimir_general
integer x = 27
integer y = 32
integer width = 3429
integer height = 1568
integer taborder = 10
string title = "none"
string dataobject = "dw_imprimir_conv_benef_general"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_convenio_imprimir_general
integer x = 1239
integer y = 1592
integer width = 1006
integer height = 160
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

