forward
global type w_detalle_postventa from window
end type
type pb_2 from picturebutton within w_detalle_postventa
end type
type pb_3 from picturebutton within w_detalle_postventa
end type
type pb_4 from picturebutton within w_detalle_postventa
end type
type pb_5 from picturebutton within w_detalle_postventa
end type
type cb_print from commandbutton within w_detalle_postventa
end type
type cb_cerrar from commandbutton within w_detalle_postventa
end type
type dw_lista from datawindow within w_detalle_postventa
end type
type gb_2 from groupbox within w_detalle_postventa
end type
end forward

global type w_detalle_postventa from window
integer width = 2715
integer height = 1364
boolean titlebar = true
string title = "Detalle Post-Venta"
boolean controlmenu = true
long backcolor = 67108864
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
pb_5 pb_5
cb_print cb_print
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_2 gb_2
end type
global w_detalle_postventa w_detalle_postventa

on w_detalle_postventa.create
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.pb_5=create pb_5
this.cb_print=create cb_print
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.Control[]={this.pb_2,&
this.pb_3,&
this.pb_4,&
this.pb_5,&
this.cb_print,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_2}
end on

on w_detalle_postventa.destroy
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.pb_5)
destroy(this.cb_print)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_2)
end on

event open;gf_centrar(w_detalle_postventa)
dw_lista.settransobject(sqlca)
if dw_lista.retrieve(gi_rut)=0 then
	messagebox("Advertencia","No registra Dato")
	close(w_detalle_postventa)
end if
end event

type pb_2 from picturebutton within w_detalle_postventa
event ue_mousemove pbm_mousemove
integer x = 1065
integer y = 1104
integer width = 123
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(1)

end event

type pb_3 from picturebutton within w_detalle_postventa
event ue_mousemove pbm_mousemove
integer x = 1193
integer y = 1104
integer width = 123
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_fila
ll_fila				= dw_lista.getrow() - 1
if ll_fila<1 then ll_fila=1
dw_lista.Scrolltorow(ll_fila)
end event

type pb_4 from picturebutton within w_detalle_postventa
event ue_mousemove pbm_mousemove
integer x = 1321
integer y = 1104
integer width = 123
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_fila,ll_tot_reg
ll_tot_reg			= dw_lista.rowcount()
ll_fila				= dw_lista.getrow() + 1
if ll_fila>ll_tot_reg then ll_fila=ll_tot_reg
dw_lista.Scrolltorow(ll_fila)
end event

type pb_5 from picturebutton within w_detalle_postventa
event ue_mousemove pbm_mousemove
integer x = 1449
integer y = 1104
integer width = 123
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(dw_lista.rowcount())
end event

type cb_print from commandbutton within w_detalle_postventa
integer x = 59
integer y = 1088
integer width = 334
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 and gi_rut > 0 then
	f_Print( dw_lista )
end if

end event

type cb_cerrar from commandbutton within w_detalle_postventa
integer x = 2299
integer y = 1088
integer width = 334
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_postventa)
end event

type dw_lista from datawindow within w_detalle_postventa
integer x = 55
integer y = 32
integer width = 2610
integer height = 1056
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_postventa"
boolean border = false
end type

type gb_2 from groupbox within w_detalle_postventa
event ue_mousemove pbm_mousemove
integer x = 1038
integer y = 1056
integer width = 562
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

