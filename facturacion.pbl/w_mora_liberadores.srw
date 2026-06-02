forward
global type w_mora_liberadores from window
end type
type dw_1 from datawindow within w_mora_liberadores
end type
type cb_2 from commandbutton within w_mora_liberadores
end type
type cb_1 from commandbutton within w_mora_liberadores
end type
end forward

global type w_mora_liberadores from window
integer x = 23
integer y = 452
integer width = 3616
integer height = 1492
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_mora_liberadores w_mora_liberadores

event open;date fecha
this.title = gs_app_name
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
fecha = date(Message.StringParm)
dw_1.settransobject(sqlca)
dw_1.retrieve(fecha)
dw_1.object.titulo.text = "Liberadores en Mora ( Fecha cierre : "+ Message.StringParm+' )'
dw_1.object.titulo1.text = "Facturación "+gs_empresa

end event

on w_mora_liberadores.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_mora_liberadores.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type dw_1 from datawindow within w_mora_liberadores
integer x = 41
integer y = 28
integer width = 3511
integer height = 1200
integer taborder = 1
string dataobject = "dw_mora_liberadores_fac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_mora_liberadores
integer x = 2793
integer y = 1260
integer width = 375
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type cb_1 from commandbutton within w_mora_liberadores
integer x = 3177
integer y = 1260
integer width = 375
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mora_liberadores)
end event

