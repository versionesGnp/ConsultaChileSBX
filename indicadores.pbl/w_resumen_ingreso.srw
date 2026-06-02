forward
global type w_resumen_ingreso from window
end type
type cb_2 from commandbutton within w_resumen_ingreso
end type
type cb_1 from commandbutton within w_resumen_ingreso
end type
type dw_1 from datawindow within w_resumen_ingreso
end type
end forward

global type w_resumen_ingreso from window
integer x = 1189
integer y = 556
integer width = 2597
integer height = 1692
boolean titlebar = true
string title = "Resumen Ingresos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_resumen_ingreso w_resumen_ingreso

on w_resumen_ingreso.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_resumen_ingreso.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;string fecha1,fecha2

this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
fecha1 = substr (1,1,Message.StringParm)
fecha2 = substr (1,2,Message.StringParm)
dw_1.settransobject (sqlca)
dw_1.retrieve(date(fecha1),date(fecha2))
end event

type cb_2 from commandbutton within w_resumen_ingreso
integer x = 59
integer y = 1452
integer width = 306
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type cb_1 from commandbutton within w_resumen_ingreso
integer x = 2217
integer y = 1452
integer width = 306
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_resumen_ingreso)
end event

type dw_1 from datawindow within w_resumen_ingreso
integer x = 59
integer y = 44
integer width = 2464
integer height = 1368
string dataobject = "dw_ingreso_item_11"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

