forward
global type w_porcentaje_comision_ctto from window
end type
type cb_cerrar from commandbutton within w_porcentaje_comision_ctto
end type
type dw_lista from datawindow within w_porcentaje_comision_ctto
end type
end forward

global type w_porcentaje_comision_ctto from window
integer width = 1445
integer height = 1492
boolean titlebar = true
string title = "Porcentaje Comisión"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_porcentaje_comision_ctto w_porcentaje_comision_ctto

on w_porcentaje_comision_ctto.create
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.dw_lista}
end on

on w_porcentaje_comision_ctto.destroy
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;String		ls_base,ls_serie
Double	ll_numero
gf_centrar(w_porcentaje_comision_ctto)
dw_lista.settransobject(sqlca)
ls_base		= substr(1,1,Message.StringParm)
ls_serie		= substr(1,2,Message.StringParm)
ll_numero 	= Double(substr(1,3,Message.StringParm))
if dw_lista.retrieve(ls_base,ls_serie,ll_numero)=0 then
	messagebox("Advertencia","No Registra Dato en Tabla PORCENTAJE_COMISION")
	close(w_porcentaje_comision_ctto)
end if
end event

type cb_cerrar from commandbutton within w_porcentaje_comision_ctto
integer x = 1088
integer y = 1268
integer width = 306
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_porcentaje_comision_ctto)
end event

type dw_lista from datawindow within w_porcentaje_comision_ctto
integer x = 27
integer y = 36
integer width = 1390
integer height = 1208
integer taborder = 10
string title = "none"
string dataobject = "dw_porcentaje_promesa_por_contrato"
boolean border = false
boolean livescroll = true
end type

