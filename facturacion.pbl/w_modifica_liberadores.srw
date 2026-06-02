forward
global type w_modifica_liberadores from window
end type
type st_3 from statictext within w_modifica_liberadores
end type
type st_2 from statictext within w_modifica_liberadores
end type
type st_1 from statictext within w_modifica_liberadores
end type
type dw_3 from datawindow within w_modifica_liberadores
end type
type dw_2 from datawindow within w_modifica_liberadores
end type
type dw_1 from datawindow within w_modifica_liberadores
end type
type cb_2 from commandbutton within w_modifica_liberadores
end type
type cb_1 from commandbutton within w_modifica_liberadores
end type
type gb_3 from groupbox within w_modifica_liberadores
end type
type gb_2 from groupbox within w_modifica_liberadores
end type
type gb_1 from groupbox within w_modifica_liberadores
end type
end forward

global type w_modifica_liberadores from window
integer x = 430
integer y = 312
integer width = 2798
integer height = 1952
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_3 st_3
st_2 st_2
st_1 st_1
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
end type
global w_modifica_liberadores w_modifica_liberadores

on w_modifica_liberadores.create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.st_3,&
this.st_2,&
this.st_1,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.gb_3,&
this.gb_2,&
this.gb_1}
end on

on w_modifica_liberadores.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name+' - Modificación.'
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_1.retrieve(gs_serie,gi_numero)
dw_2.retrieve(gs_serie,gi_numero)
dw_3.retrieve(gs_serie,gi_numero)
end event

type st_3 from statictext within w_modifica_liberadores
integer x = 110
integer y = 956
integer width = 494
integer height = 84
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Ingreso"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_modifica_liberadores
integer x = 110
integer y = 432
integer width = 494
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Pago_oferta"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_modifica_liberadores
integer x = 110
integer y = 36
integer width = 494
integer height = 84
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Ofertas _v"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_modifica_liberadores
integer x = 87
integer y = 1100
integer width = 2592
integer height = 536
integer taborder = 20
string dataobject = "dw_modifica_ingreso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type dw_2 from datawindow within w_modifica_liberadores
integer x = 128
integer y = 528
integer width = 2501
integer height = 376
integer taborder = 40
string dataobject = "dw_pago_oferta"
boolean border = false
boolean livescroll = true
end type

type dw_1 from datawindow within w_modifica_liberadores
integer x = 110
integer y = 160
integer width = 2542
integer height = 184
integer taborder = 50
string dataobject = "dw_oferta_v"
boolean border = false
boolean livescroll = true
end type

type cb_2 from commandbutton within w_modifica_liberadores
integer x = 2094
integer y = 1724
integer width = 302
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;dw_1.update()
commit;
dw_2.update()
commit;
dw_3.update()
commit;
end event

type cb_1 from commandbutton within w_modifica_liberadores
integer x = 2405
integer y = 1724
integer width = 302
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_modifica_oferta)
end event

type gb_3 from groupbox within w_modifica_liberadores
integer x = 59
integer y = 968
integer width = 2647
integer height = 724
integer taborder = 2
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

type gb_2 from groupbox within w_modifica_liberadores
integer x = 59
integer y = 432
integer width = 2647
integer height = 500
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

type gb_1 from groupbox within w_modifica_liberadores
integer x = 59
integer y = 36
integer width = 2647
integer height = 376
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

