forward
global type w_rescomi_premios from window
end type
type cb_2 from commandbutton within w_rescomi_premios
end type
type cb_1 from commandbutton within w_rescomi_premios
end type
type dw_rescomi from datawindow within w_rescomi_premios
end type
end forward

global type w_rescomi_premios from window
integer width = 2747
integer height = 1316
boolean titlebar = true
string title = "Res-Comi por Venta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_2 cb_2
cb_1 cb_1
dw_rescomi dw_rescomi
end type
global w_rescomi_premios w_rescomi_premios

on w_rescomi_premios.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_rescomi=create dw_rescomi
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_rescomi}
end on

on w_rescomi_premios.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_rescomi)
end on

event open;string	ls_base,ls_serie,ls_status_comision
long		ll_plazo
Double	ldb_numero,ldb_1,ldb_2,ldb_3,ldb_4,ldb_5,ldb_6,ldb_7,ldb_8,ldb_9,ldb_10,ldb_11,ldb_12

gf_centrar(w_rescomi_premios)
ls_base									= substr(1,1,Message.StringParm)
ls_serie									= substr(1,2,Message.StringParm)
ldb_numero								= double(substr(1,3,Message.StringParm))
dw_rescomi.dataobject				= 'dw_res_comi_premios'
dw_rescomi.settransobject(sqlca)

if dw_rescomi.retrieve(ls_base,ls_serie,ldb_numero)=0 then
	messagebox("Advertencia","No registra Pagos")
end if
end event

type cb_2 from commandbutton within w_rescomi_premios
integer x = 46
integer y = 1076
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

event clicked;if dw_rescomi.rowcount() > 0 then dw_rescomi.print()
end event

type cb_1 from commandbutton within w_rescomi_premios
integer x = 2359
integer y = 1076
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

event clicked;close(w_rescomi_premios)
end event

type dw_rescomi from datawindow within w_rescomi_premios
integer x = 46
integer y = 44
integer width = 2638
integer height = 1008
integer taborder = 10
string dataobject = "dw_res_comi_premios"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

