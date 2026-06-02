forward
global type w_mostrar_detalle_gestion_ugn from window
end type
type cb_cerrar from commandbutton within w_mostrar_detalle_gestion_ugn
end type
type dw_detalle from datawindow within w_mostrar_detalle_gestion_ugn
end type
type dw_lista from datawindow within w_mostrar_detalle_gestion_ugn
end type
end forward

global type w_mostrar_detalle_gestion_ugn from window
integer width = 3026
integer height = 2440
boolean titlebar = true
string title = "Detalle Gestión Telefónica UGN"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_cerrar cb_cerrar
dw_detalle dw_detalle
dw_lista dw_lista
end type
global w_mostrar_detalle_gestion_ugn w_mostrar_detalle_gestion_ugn

type variables
Long	il_grupo,il_correlativo, il_row
end variables

on w_mostrar_detalle_gestion_ugn.create
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.dw_detalle,&
this.dw_lista}
end on

on w_mostrar_detalle_gestion_ugn.destroy
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_mostrar_detalle_gestion_ugn)
il_grupo			= long(trim(substr(1,1,Message.StringParm)))
il_correlativo	= long(trim(substr(1,2,Message.StringParm)))
dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_lista.retrieve(il_grupo,il_correlativo)


end event

type cb_cerrar from commandbutton within w_mostrar_detalle_gestion_ugn
integer x = 2601
integer y = 2140
integer width = 352
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mostrar_detalle_gestion_ugn)
end event

type dw_detalle from datawindow within w_mostrar_detalle_gestion_ugn
integer x = 9
integer y = 872
integer width = 2958
integer height = 1260
integer taborder = 20
string title = "none"
string dataobject = "dw_muestra_detalle_historico_gestion_det"
boolean border = false
boolean livescroll = true
end type

type dw_lista from datawindow within w_mostrar_detalle_gestion_ugn
integer x = 32
integer y = 40
integer width = 2921
integer height = 800
integer taborder = 10
string title = "none"
string dataobject = "dw_muestra_detalle_historico_gestion_ugn"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long		ll_grupo, ll_corre
String	ls_ult_est, ls_ult_glosa
Datetime	ldt_fecha_ult

if row > 0 then
	il_row			= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ll_grupo			= dw_lista.getitemnumber(il_row,'ugn_cliente_grupo')
	ll_corre			= dw_lista.getitemnumber(il_row,'ugn_cliente_correlativo')
	ls_ult_est		= dw_lista.getitemstring(il_row,'ugn_gestion_sup_estado_gestion')
	ldt_fecha_ult	= dw_lista.getitemdatetime(il_row,'ugn_gestion_sup_fecha_gestion')
	ls_ult_glosa	= trim(dw_lista.getitemstring(il_row,'ugn_gestion_sup_glosa_gestion'))
	dw_detalle.retrieve(ll_grupo,ll_corre,ls_ult_est,ldt_fecha_ult,ls_ult_glosa)
end if
end event

event rowfocuschanged;Long		ll_grupo, ll_corre
String	ls_ult_est, ls_ult_glosa
Datetime	ldt_fecha_ult

if getrow() > 0 then
	il_row			= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ll_grupo			= dw_lista.getitemnumber(il_row,'ugn_cliente_grupo')
	ll_corre			= dw_lista.getitemnumber(il_row,'ugn_cliente_correlativo')
	ls_ult_est		= dw_lista.getitemstring(il_row,'ugn_gestion_sup_estado_gestion')
	ldt_fecha_ult	= dw_lista.getitemdatetime(il_row,'ugn_gestion_sup_fecha_gestion')
	ls_ult_glosa	= trim(dw_lista.getitemstring(il_row,'ugn_gestion_sup_glosa_gestion'))
	dw_detalle.retrieve(ll_grupo,ll_corre,ls_ult_est,ldt_fecha_ult,ls_ult_glosa)
end if

end event

