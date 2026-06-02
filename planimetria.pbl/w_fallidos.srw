forward
global type w_fallidos from window
end type
type cb_2 from commandbutton within w_fallidos
end type
type cb_1 from commandbutton within w_fallidos
end type
type dw_1 from datawindow within w_fallidos
end type
end forward

global type w_fallidos from window
integer x = 169
integer y = 124
integer width = 3282
integer height = 2172
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_fallidos w_fallidos

on w_fallidos.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_fallidos.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;gf_centrar(w_fallidos)
dw_1.settransobject(sqlca)
if dw_1.retrieve() >0 then
	dw_1.object.titulo.text = gs_empresa
else
	messagebox('No hay Datos','NO Existen Registros')
	close(w_fallidos)
end if
end event

type cb_2 from commandbutton within w_fallidos
integer x = 50
integer y = 1920
integer width = 306
integer height = 108
integer taborder = 3
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	dw_1.print()
end if	
end event

type cb_1 from commandbutton within w_fallidos
integer x = 2871
integer y = 1920
integer width = 334
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_fallidos)
end event

type dw_1 from datawindow within w_fallidos
integer x = 50
integer y = 48
integer width = 3154
integer height = 1816
integer taborder = 10
string dataobject = "dw_ofertas_sin_sector"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

