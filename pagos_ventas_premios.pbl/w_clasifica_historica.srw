forward
global type w_clasifica_historica from window
end type
type cb_imprimir from commandbutton within w_clasifica_historica
end type
type cb_cerrar from commandbutton within w_clasifica_historica
end type
type dw_clasifica from datawindow within w_clasifica_historica
end type
end forward

global type w_clasifica_historica from window
integer width = 3045
integer height = 1632
boolean titlebar = true
string title = "Clasificación Histórica Detalle"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_clasifica dw_clasifica
end type
global w_clasifica_historica w_clasifica_historica

on w_clasifica_historica.create
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_clasifica=create dw_clasifica
this.Control[]={this.cb_imprimir,&
this.cb_cerrar,&
this.dw_clasifica}
end on

on w_clasifica_historica.destroy
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_clasifica)
end on

event open;string	ls_codido
datetime	ldt_fecha
date		ld_fecha

gf_centrar(w_clasifica_historica)
ls_codido										= substr(1,1,Message.StringParm)
ld_fecha											= date(substr(1,2,Message.StringParm))
ldt_fecha										= datetime(ld_fecha,time('00:00:00'))

dw_clasifica.dataobject	= 'dw_clasifica_historica'
dw_clasifica.settransobject(sqlca)
dw_clasifica.object.usuario.text			= gs_user

if dw_clasifica.retrieve(ls_codido,ldt_fecha)=0 then
	messagebox("Advertencia","No registra Pagos")
end if
end event

type cb_imprimir from commandbutton within w_clasifica_historica
integer x = 46
integer y = 1396
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

event clicked;if dw_clasifica.rowcount() > 0 then dw_clasifica.print()
end event

type cb_cerrar from commandbutton within w_clasifica_historica
integer x = 2656
integer y = 1396
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

event clicked;close(w_clasifica_historica)
end event

type dw_clasifica from datawindow within w_clasifica_historica
integer x = 46
integer y = 44
integer width = 2935
integer height = 1328
integer taborder = 10
string dataobject = "dw_clasifica_historica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

