forward
global type w_ayuda_revision_contratos from window
end type
type cb_print from commandbutton within w_ayuda_revision_contratos
end type
type cb_cerrar from commandbutton within w_ayuda_revision_contratos
end type
type dw_help from datawindow within w_ayuda_revision_contratos
end type
end forward

global type w_ayuda_revision_contratos from window
integer width = 3026
integer height = 1628
boolean titlebar = true
string title = "Ayuda Revisión Contrato"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_print cb_print
cb_cerrar cb_cerrar
dw_help dw_help
end type
global w_ayuda_revision_contratos w_ayuda_revision_contratos

on w_ayuda_revision_contratos.create
this.cb_print=create cb_print
this.cb_cerrar=create cb_cerrar
this.dw_help=create dw_help
this.Control[]={this.cb_print,&
this.cb_cerrar,&
this.dw_help}
end on

on w_ayuda_revision_contratos.destroy
destroy(this.cb_print)
destroy(this.cb_cerrar)
destroy(this.dw_help)
end on

event open;Long	ll_new
gf_centrar(w_ayuda_revision_contratos)
dw_help.settransobject(sqlca)
ll_new	= dw_help.insertrow(0)
dw_help.setitem(ll_new,'usuario',gs_nom_comp_usuario)
dw_help.accepttext()
end event

type cb_print from commandbutton within w_ayuda_revision_contratos
integer x = 32
integer y = 1392
integer width = 338
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;f_Print( dw_help )
cb_cerrar.triggerevent(clicked!)
end event

type cb_cerrar from commandbutton within w_ayuda_revision_contratos
integer x = 2624
integer y = 1404
integer width = 338
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

event clicked;close(w_ayuda_revision_contratos)
end event

type dw_help from datawindow within w_ayuda_revision_contratos
integer x = 32
integer y = 52
integer width = 2930
integer height = 1304
integer taborder = 10
string dataobject = "dw_help_revision_contrato"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna
ls_columna	= dwo.name
if ls_columna='b_print' then
	f_Print( dw_help )
	cb_cerrar.triggerevent(clicked!)
end if
end event

