forward
global type w_libro_venta_liberador from window
end type
type cb_2 from commandbutton within w_libro_venta_liberador
end type
type dw_1 from uo_datawindow within w_libro_venta_liberador
end type
type cb_1 from commandbutton within w_libro_venta_liberador
end type
end forward

global type w_libro_venta_liberador from window
integer x = 206
integer y = 100
integer width = 3237
integer height = 2196
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
end type
global w_libro_venta_liberador w_libro_venta_liberador

on w_libro_venta_liberador.create
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.dw_1,&
this.cb_1}
end on

on w_libro_venta_liberador.destroy
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;date fecha

fecha = date(Message.StringParm)
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name+' ( Libro de Ventas para Liberadores. ).'
dw_1.settransobject(sqlca)
if dw_1.retrieve(fecha) = 0 then
	messagebox(gs_app_name,'No existen Información.',information!)
	close(w_libro_venta_oferta)
else
	if gs_empresa = 'El Prado' then
		dw_1.object.titulo4.text = 'Inmobiliaria Parque de La Florida SpA'
		dw_1.object.titulo1.text = 'Rut : 96.844.000 - 4'
		dw_1.object.titulo2.text = 'Libro de Ventas para Liberadores.'
		dw_1.object.titulo3.text = '( Fecha de Cierre : '+string( fecha,gs_formato_fecha )+' ).'
	else
		dw_1.object.titulo4.text = 'Inmobiliaria Parque de La Serena SpA'
		dw_1.object.titulo1.text = 'Rut : 96.835.870 - 3'
		dw_1.object.titulo2.text = 'Libro de Ventas para Liberadores.'
		dw_1.object.titulo3.text = '( Fecha de Cierre : '+string( fecha,gs_formato_fecha )+' ).'
	end if	
end if	
end event

type cb_2 from commandbutton within w_libro_venta_liberador
integer x = 2546
integer y = 1968
integer width = 311
integer height = 108
integer taborder = 2
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

type dw_1 from uo_datawindow within w_libro_venta_liberador
integer x = 41
integer y = 40
integer width = 3141
integer height = 1888
integer taborder = 10
string dataobject = "dw_libro_venta_liberador"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_libro_venta_liberador
integer x = 2871
integer y = 1968
integer width = 311
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_libro_venta_liberador)
end event

