forward
global type w_validar_dv_del_rut from window
end type
type cb_3 from commandbutton within w_validar_dv_del_rut
end type
type cb_2 from commandbutton within w_validar_dv_del_rut
end type
type cb_1 from commandbutton within w_validar_dv_del_rut
end type
type dw_malos from datawindow within w_validar_dv_del_rut
end type
type dw_lista from datawindow within w_validar_dv_del_rut
end type
end forward

global type w_validar_dv_del_rut from window
integer width = 3104
integer height = 1312
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_malos dw_malos
dw_lista dw_lista
end type
global w_validar_dv_del_rut w_validar_dv_del_rut

event open;gf_centrar(w_validar_dv_del_rut)
dw_lista.settransobject(sqlca)
dw_malos.settransobject(sqlca)
if dw_malos.retrieve()=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_validar_dv_del_rut)
end if
end event

on w_validar_dv_del_rut.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_malos=create dw_malos
this.dw_lista=create dw_lista
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_malos,&
this.dw_lista}
end on

on w_validar_dv_del_rut.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_malos)
destroy(this.dw_lista)
end on

type cb_3 from commandbutton within w_validar_dv_del_rut
integer x = 1106
integer y = 1132
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_DWToExcel( dw_lista)
end if
end event

type cb_2 from commandbutton within w_validar_dv_del_rut
integer x = 2647
integer y = 1112
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_validar_dv_del_rut)
end event

type cb_1 from commandbutton within w_validar_dv_del_rut
integer x = 27
integer y = 1124
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Proceso"
end type

event clicked;Long		ll_rut,ll_tot_reg,ll_indi,ll_new
String	ls_dv,ls_dv_bueno

dw_lista.reset()
ll_tot_reg		= dw_malos.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_rut		= dw_malos.getitemnumber(ll_indi,'rut')
	ls_dv			= dw_malos.getitemstring(ll_indi,'dv')
	ls_dv_bueno	= dw_malos.getitemstring(ll_indi,'c_dv_real')
	ll_new		= dw_lista.insertrow(0)
	dw_lista.setitem(ll_new,'rut',ll_rut)
	dw_lista.setitem(ll_new,'dv_bd',ls_dv)
	dw_lista.setitem(ll_new,'dv_bueno',ls_dv_bueno)
next
end event

type dw_malos from datawindow within w_validar_dv_del_rut
integer x = 1573
integer y = 36
integer width = 1477
integer height = 1036
string title = "none"
string dataobject = "dw_validar_rut_dv"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_lista from datawindow within w_validar_dv_del_rut
integer x = 32
integer y = 36
integer width = 1477
integer height = 1036
string title = "none"
string dataobject = "dwe_lista_rut_cliente"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

