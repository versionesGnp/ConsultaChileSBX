forward
global type w_significado_tipo_carta from window
end type
type cb_cerrar from commandbutton within w_significado_tipo_carta
end type
type dw_lista from datawindow within w_significado_tipo_carta
end type
end forward

global type w_significado_tipo_carta from window
integer width = 2437
integer height = 1008
boolean titlebar = true
string title = "Filtro Aplicado a Tipo de Carta"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_significado_tipo_carta w_significado_tipo_carta

on w_significado_tipo_carta.create
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.dw_lista}
end on

on w_significado_tipo_carta.destroy
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;String	ls_clasif
Long		ll_cod_parque
gf_centrar(w_significado_tipo_carta)
ll_cod_parque					= long(substr(1,1,Message.StringParm))
ls_clasif						= String(substr(1,2,Message.StringParm))
dw_lista.settransobject(sqlca)
if dw_lista.retrieve(ll_cod_parque,ls_clasif)=0 then
	messagebox("Advertencia","No Registra Descripción Clasificación "+ls_clasif)
	close(w_significado_tipo_carta)
end if
end event

type cb_cerrar from commandbutton within w_significado_tipo_carta
integer x = 2043
integer y = 780
integer width = 334
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_significado_tipo_carta)
end event

type dw_lista from datawindow within w_significado_tipo_carta
integer x = 37
integer y = 32
integer width = 2377
integer height = 728
integer taborder = 10
string dataobject = "dw_muestra_significado_por_tipo_carta"
boolean border = false
boolean livescroll = true
end type

