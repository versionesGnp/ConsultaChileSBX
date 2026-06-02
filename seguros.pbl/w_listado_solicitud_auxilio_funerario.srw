forward
global type w_listado_solicitud_auxilio_funerario from window
end type
type cb_1 from commandbutton within w_listado_solicitud_auxilio_funerario
end type
type cb_2 from commandbutton within w_listado_solicitud_auxilio_funerario
end type
type cb_3 from commandbutton within w_listado_solicitud_auxilio_funerario
end type
type cb_imprimir from commandbutton within w_listado_solicitud_auxilio_funerario
end type
type st_1 from statictext within w_listado_solicitud_auxilio_funerario
end type
type dw_lista from datawindow within w_listado_solicitud_auxilio_funerario
end type
type gb_1 from groupbox within w_listado_solicitud_auxilio_funerario
end type
end forward

global type w_listado_solicitud_auxilio_funerario from window
integer width = 3849
integer height = 2332
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
st_1 st_1
dw_lista dw_lista
gb_1 gb_1
end type
global w_listado_solicitud_auxilio_funerario w_listado_solicitud_auxilio_funerario

on w_listado_solicitud_auxilio_funerario.create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.st_1=create st_1
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.st_1,&
this.dw_lista,&
this.gb_1}
end on

on w_listado_solicitud_auxilio_funerario.destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.st_1)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

type cb_1 from commandbutton within w_listado_solicitud_auxilio_funerario
integer x = 1211
integer y = 1504
integer width = 219
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;String		ls_nulo
Setnull(ls_nulo)
dw_lista.SETSORT(ls_nulo)
dw_lista.SORT()

end event

type cb_2 from commandbutton within w_listado_solicitud_auxilio_funerario
boolean visible = false
integer x = 1659
integer y = 1504
integer width = 219
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_listado_solicitud_auxilio_funerario
integer x = 1435
integer y = 1504
integer width = 219
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_imprimir from commandbutton within w_listado_solicitud_auxilio_funerario
boolean visible = false
integer x = 1883
integer y = 1504
integer width = 219
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.print()
end if
end event

type st_1 from statictext within w_listado_solicitud_auxilio_funerario
integer x = 64
integer y = 28
integer width = 1125
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Contratos Solicitud Auxilio Funerario"
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_listado_solicitud_auxilio_funerario
integer x = 32
integer y = 124
integer width = 3355
integer height = 1276
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_solicitud_auxilio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	
end if
end event

type gb_1 from groupbox within w_listado_solicitud_auxilio_funerario
integer x = 1170
integer y = 1440
integer width = 965
integer height = 188
integer taborder = 20
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Utilitarios"
end type

