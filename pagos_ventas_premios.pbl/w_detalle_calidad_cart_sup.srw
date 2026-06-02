forward
global type w_detalle_calidad_cart_sup from window
end type
type cb_imprimir from commandbutton within w_detalle_calidad_cart_sup
end type
type cb_cerrar from commandbutton within w_detalle_calidad_cart_sup
end type
type dw_detalle from datawindow within w_detalle_calidad_cart_sup
end type
end forward

global type w_detalle_calidad_cart_sup from window
integer width = 3355
integer height = 1816
boolean titlebar = true
string title = "Detalle Calidad Cartera Supervisor"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_detalle dw_detalle
end type
global w_detalle_calidad_cart_sup w_detalle_calidad_cart_sup

on w_detalle_calidad_cart_sup.create
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_imprimir,&
this.cb_cerrar,&
this.dw_detalle}
end on

on w_detalle_calidad_cart_sup.destroy
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
end on

event open;string	ls_codido
datetime	ldt_fecha_ini,ldt_fecha_fin
date		ld_fecha_ini,ld_fecha_fin

gf_centrar(w_detalle_calidad_cart_sup)
ls_codido										= substr(1,1,Message.StringParm)
ld_fecha_ini									= date(substr(1,2,Message.StringParm))
ldt_fecha_ini									= datetime(ld_fecha_ini,time('00:00:00'))

ld_fecha_fin									= date(substr(1,3,Message.StringParm))
ldt_fecha_fin									= datetime(ld_fecha_fin,time('00:00:00'))

dw_detalle.dataobject						= 'dw_detalle_calidad_cart_sup'
dw_detalle.settransobject(sqlca)
dw_detalle.object.usuario.text			= gs_user

if dw_detalle.retrieve(ls_codido,ldt_fecha_ini,ldt_fecha_fin)=0 then
	messagebox("Advertencia","No registra Pagos")
end if
end event

type cb_imprimir from commandbutton within w_detalle_calidad_cart_sup
integer x = 32
integer y = 1568
integer width = 306
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then dw_detalle.print()
end event

type cb_cerrar from commandbutton within w_detalle_calidad_cart_sup
integer x = 2981
integer y = 1568
integer width = 325
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_calidad_cart_sup)
end event

type dw_detalle from datawindow within w_detalle_calidad_cart_sup
integer x = 32
integer y = 28
integer width = 3273
integer height = 1512
integer taborder = 10
string dataobject = "dw_detalle_calidad_cart_sup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

