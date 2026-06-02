forward
global type w_detalle_encuesta from window
end type
type cb_exportar from commandbutton within w_detalle_encuesta
end type
type cb_filtrar from commandbutton within w_detalle_encuesta
end type
type cb_imprimir from commandbutton within w_detalle_encuesta
end type
type cb_cerrar from commandbutton within w_detalle_encuesta
end type
type dw_lista from datawindow within w_detalle_encuesta
end type
type gb_1 from groupbox within w_detalle_encuesta
end type
end forward

global type w_detalle_encuesta from window
integer width = 2830
integer height = 1808
boolean titlebar = true
string title = "Detalle Encuesta por Grupo"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_detalle_encuesta w_detalle_encuesta

on w_detalle_encuesta.create
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_exportar,&
this.cb_filtrar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_detalle_encuesta.destroy
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;long ll_grupo
gf_centrar(w_detalle_encuesta)

dw_lista.settransobject(sqlca)
ll_grupo				= LONG(substr(1,1,Message.StringParm))
dw_lista.retrieve(ll_grupo)
end event

type cb_exportar from commandbutton within w_detalle_encuesta
integer x = 1147
integer y = 1588
integer width = 256
integer height = 92
integer taborder = 40
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

type cb_filtrar from commandbutton within w_detalle_encuesta
integer x = 1408
integer y = 1588
integer width = 256
integer height = 92
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
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_imprimir from commandbutton within w_detalle_encuesta
integer x = 37
integer y = 1588
integer width = 306
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	f_Print( dw_lista )
end if
end event

type cb_cerrar from commandbutton within w_detalle_encuesta
integer x = 2464
integer y = 1588
integer width = 306
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_detalle_encuesta)
end event

type dw_lista from datawindow within w_detalle_encuesta
integer x = 37
integer y = 32
integer width = 2734
integer height = 1492
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_encuesta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_detalle_encuesta
integer x = 1120
integer y = 1540
integer width = 571
integer height = 160
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

