forward
global type w_cliser_ficha_encargado from window
end type
type st_1 from statictext within w_cliser_ficha_encargado
end type
type dw_rut from datawindow within w_cliser_ficha_encargado
end type
type cb_cerrar from commandbutton within w_cliser_ficha_encargado
end type
type dw_ficha from datawindow within w_cliser_ficha_encargado
end type
end forward

global type w_cliser_ficha_encargado from window
integer width = 2496
integer height = 1392
boolean titlebar = true
string title = "Antecedente Encargado"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_1 st_1
dw_rut dw_rut
cb_cerrar cb_cerrar
dw_ficha dw_ficha
end type
global w_cliser_ficha_encargado w_cliser_ficha_encargado

on w_cliser_ficha_encargado.create
this.st_1=create st_1
this.dw_rut=create dw_rut
this.cb_cerrar=create cb_cerrar
this.dw_ficha=create dw_ficha
this.Control[]={this.st_1,&
this.dw_rut,&
this.cb_cerrar,&
this.dw_ficha}
end on

on w_cliser_ficha_encargado.destroy
destroy(this.st_1)
destroy(this.dw_rut)
destroy(this.cb_cerrar)
destroy(this.dw_ficha)
end on

event open;Long	ll_new,ll_rut
gf_centrar(w_cliser_ficha_encargado)
ll_rut 			= long(substr(1,1,Message.StringParm))
connect using Trans_3;
dw_ficha.settransobject(Trans_3)
dw_rut.settransobject(Trans_3)
dw_rut.getchild('rut',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.retrieve()
end if
ll_new	= dw_rut.insertrow(0)
if gl_rut_encargado>0 then
	dw_rut.setitem(ll_new,'rut',ll_rut)
	dw_rut.accepttext()
	dw_rut.triggerevent(itemchanged!)
end if
dw_rut.setfocus()
end event

event close;Disconnect using Trans_3;
end event

type st_1 from statictext within w_cliser_ficha_encargado
integer x = 55
integer y = 28
integer width = 594
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Encargado"
boolean focusrectangle = false
end type

type dw_rut from datawindow within w_cliser_ficha_encargado
integer x = 41
integer y = 88
integer width = 2409
integer height = 124
integer taborder = 10
string title = "none"
string dataobject = "dwe_ficha_encargado_cliser"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna
Long		ll_rut

dw_rut.accepttext()
ll_rut	= dw_rut.getitemnumber(1,'rut')
if ll_rut>0 then dw_ficha.retrieve(ll_rut)
end event

type cb_cerrar from commandbutton within w_cliser_ficha_encargado
integer x = 2089
integer y = 1164
integer width = 347
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cliser_ficha_encargado)

end event

type dw_ficha from datawindow within w_cliser_ficha_encargado
integer x = 41
integer y = 256
integer width = 2432
integer height = 896
integer taborder = 20
string title = "none"
string dataobject = "dw_cliser_ficha_encargado"
boolean border = false
boolean livescroll = true
end type

