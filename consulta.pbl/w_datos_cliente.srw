forward
global type w_datos_cliente from window
end type
type cb_2 from commandbutton within w_datos_cliente
end type
type cb_1 from commandbutton within w_datos_cliente
end type
type st_1 from statictext within w_datos_cliente
end type
type cb_cerrar from commandbutton within w_datos_cliente
end type
type dw_datos_cliente from datawindow within w_datos_cliente
end type
end forward

global type w_datos_cliente from window
integer x = 1637
integer y = 1084
integer width = 1664
integer height = 2076
boolean titlebar = true
string title = "Datos del Cliente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_2 cb_2
cb_1 cb_1
st_1 st_1
cb_cerrar cb_cerrar
dw_datos_cliente dw_datos_cliente
end type
global w_datos_cliente w_datos_cliente

on w_datos_cliente.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_datos_cliente=create dw_datos_cliente
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_1,&
this.cb_cerrar,&
this.dw_datos_cliente}
end on

on w_datos_cliente.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_datos_cliente)
end on

event open;string 	ls_titulo
long 		ll_rut

gf_centrar(w_datos_cliente)
dw_datos_cliente.dataobject 	='d_datos_cliente_contacto'
dw_datos_cliente.SetTransObject(SQLCA)
if dw_datos_cliente.Retrieve(gi_rut) > 0 then
	cb_1.enabled 	= true
	cb_2.enabled 	= true
	cb_1.visible 		= true
	cb_2.visible 		= true
else
	cb_1.enabled 	= false
	cb_2.enabled 	= false
	cb_1.visible 		= false
	cb_2.visible 		= false
end if
dw_datos_cliente.dataobject 	='d_datos_cliente'
dw_datos_cliente.SetTransObject(SQLCA)
//MESSAGEBOX("gi_rut",string(gi_rut))
dw_datos_cliente.Retrieve(gi_rut)
gs_ventana	= 'w_datos_cliente'
f_valida_objeto()

end event

event close;if isvalid(w_plano_sector_parque) then w_plano_sector_parque.dw_plano_sector_parque.enabled	= true
end event

type cb_2 from commandbutton within w_datos_cliente
integer x = 361
integer y = 1852
integer width = 320
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&ontacto"
end type

event clicked;dw_datos_cliente.dataobject ='d_datos_cliente_contacto'
dw_datos_cliente.SetTransObject(SQLCA)
dw_datos_cliente.Retrieve(string(gi_rut))
w_datos_cliente.title='Datos del Contacto'
st_1.text = 'Datos del Contacto'
end event

type cb_1 from commandbutton within w_datos_cliente
integer x = 37
integer y = 1852
integer width = 320
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&liente"
end type

event clicked;dw_datos_cliente.dataobject ='d_datos_cliente'
dw_datos_cliente.SetTransObject(SQLCA)
dw_datos_cliente.Retrieve(string(gi_rut))
dw_datos_cliente.title='Datos del Cliente'
st_1.text = 'Datos del Cliente'
end event

type st_1 from statictext within w_datos_cliente
integer x = 50
integer y = 32
integer width = 850
integer height = 100
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Datos del Cliente"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_datos_cliente
integer x = 1289
integer y = 1852
integer width = 320
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
close(w_datos_cliente)
end event

type dw_datos_cliente from datawindow within w_datos_cliente
integer x = 23
integer y = 136
integer width = 1600
integer height = 1692
integer taborder = 10
string dataobject = "d_datos_cliente"
boolean border = false
boolean livescroll = true
end type

