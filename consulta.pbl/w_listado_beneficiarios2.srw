forward
global type w_listado_beneficiarios2 from window
end type
type cb_modif from commandbutton within w_listado_beneficiarios2
end type
type cb_cerrar from commandbutton within w_listado_beneficiarios2
end type
type dw_listado_beneficiarios2 from datawindow within w_listado_beneficiarios2
end type
end forward

global type w_listado_beneficiarios2 from window
integer x = 133
integer y = 364
integer width = 2638
integer height = 1184
boolean titlebar = true
string title = "Listado de Beneficiarios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_modif cb_modif
cb_cerrar cb_cerrar
dw_listado_beneficiarios2 dw_listado_beneficiarios2
end type
global w_listado_beneficiarios2 w_listado_beneficiarios2

on w_listado_beneficiarios2.create
this.cb_modif=create cb_modif
this.cb_cerrar=create cb_cerrar
this.dw_listado_beneficiarios2=create dw_listado_beneficiarios2
this.Control[]={this.cb_modif,&
this.cb_cerrar,&
this.dw_listado_beneficiarios2}
end on

on w_listado_beneficiarios2.destroy
destroy(this.cb_modif)
destroy(this.cb_cerrar)
destroy(this.dw_listado_beneficiarios2)
end on

event open;gf_centrar(w_listado_beneficiarios2)
gs_ventana	= 'w_listado_beneficiarios2'
f_valida_objeto()
dw_listado_beneficiarios2.SetTransObject(SQLCA)
if gs_solicitudes='1' or gs_solicitudes='2' or gs_solicitudes='3' then	//operaciones 1/2/3
	cb_modif.enabled	= true
else
	cb_modif.enabled	= false
end if
if dw_listado_beneficiarios2.Retrieve(gs_serie,gi_numero)=0 then
	messagebox("Advertencia","No registra Beneficiarios")
end if
end event

type cb_modif from commandbutton within w_listado_beneficiarios2
integer x = 46
integer y = 936
integer width = 558
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Modifica Beneficiario"
end type

event clicked;if isvalid(w_modificar_beneficiarios)=true then close(w_modificar_beneficiarios)
open(w_modificar_beneficiarios)
end event

type cb_cerrar from commandbutton within w_listado_beneficiarios2
integer x = 2254
integer y = 936
integer width = 320
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_listado_beneficiarios2)
end event

type dw_listado_beneficiarios2 from datawindow within w_listado_beneficiarios2
integer x = 46
integer y = 40
integer width = 2528
integer height = 860
integer taborder = 10
string dataobject = "d_listado_beneficiarios2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

