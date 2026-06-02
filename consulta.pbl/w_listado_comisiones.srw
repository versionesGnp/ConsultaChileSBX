forward
global type w_listado_comisiones from window
end type
type cb_2 from commandbutton within w_listado_comisiones
end type
type cb_1 from commandbutton within w_listado_comisiones
end type
type dw_1 from datawindow within w_listado_comisiones
end type
end forward

global type w_listado_comisiones from window
integer x = 1490
integer y = 1012
integer width = 2185
integer height = 1400
boolean titlebar = true
string title = "Parametros de Comisiones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_listado_comisiones w_listado_comisiones

on w_listado_comisiones.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_listado_comisiones.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;gf_centrar (w_listado_comisiones)

dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

gs_ventana	= 'w_listado_comisiones'
f_valida_objeto()
end event

type cb_2 from commandbutton within w_listado_comisiones
event clicked pbm_bnclicked
integer x = 46
integer y = 1160
integer width = 306
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;
dw_1.print()
end event

type cb_1 from commandbutton within w_listado_comisiones
integer x = 1829
integer y = 1160
integer width = 297
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
close(w_listado_comisiones)
end event

type dw_1 from datawindow within w_listado_comisiones
integer x = 46
integer y = 40
integer width = 2080
integer height = 1080
integer taborder = 10
string dataobject = "d_listado_comisiones_inmobi"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

