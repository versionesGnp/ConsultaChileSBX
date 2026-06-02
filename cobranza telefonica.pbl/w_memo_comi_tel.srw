forward
global type w_memo_comi_tel from window
end type
type cb_imprimir from commandbutton within w_memo_comi_tel
end type
type cb_cerrar from commandbutton within w_memo_comi_tel
end type
type dw_memorandum_comi_tele from datawindow within w_memo_comi_tel
end type
end forward

global type w_memo_comi_tel from window
integer width = 3355
integer height = 2980
boolean titlebar = true
string title = "Memorandum comisiones telefonicas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_memorandum_comi_tele dw_memorandum_comi_tele
end type
global w_memo_comi_tel w_memo_comi_tel

on w_memo_comi_tel.create
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_memorandum_comi_tele=create dw_memorandum_comi_tele
this.Control[]={this.cb_imprimir,&
this.cb_cerrar,&
this.dw_memorandum_comi_tele}
end on

on w_memo_comi_tel.destroy
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_memorandum_comi_tele)
end on

event open;Long		ll_grupo
gf_centrar(w_memo_comi_tel)
dw_memorandum_comi_tele.settransobject(sqlca)
ll_grupo					= Long(Message.StringParm)
if dw_memorandum_comi_tele.retrieve(ll_grupo)=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_memo_comi_tel)
end if
end event

type cb_imprimir from commandbutton within w_memo_comi_tel
integer x = 37
integer y = 2732
integer width = 329
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_memorandum_comi_tele.rowcount() > 0 then 
	dw_memorandum_comi_tele.object.datawindow.Print.Preview	= true
	dw_memorandum_comi_tele.object.datawindow.zoom				= 100
	f_Print( dw_memorandum_comi_tele )
//	f_printdlg(dw_memorandum_comi_tele,gstr_print,parent)
	dw_memorandum_comi_tele.object.datawindow.zoom				= 100
	dw_memorandum_comi_tele.object.datawindow.Print.Preview	= False
end if
end event

type cb_cerrar from commandbutton within w_memo_comi_tel
integer x = 2962
integer y = 2732
integer width = 329
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_memo_comi_tel)
end event

type dw_memorandum_comi_tele from datawindow within w_memo_comi_tel
integer x = 37
integer y = 32
integer width = 3255
integer height = 2656
integer taborder = 10
string title = "none"
string dataobject = "dw_memorandum_comi_tele"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string	ls_columna

ls_columna	= dwo.name
if ls_columna = 'c_memo' then
	dw_memorandum_comi_tele.setitem(1,'c_memo','')
	dw_memorandum_comi_tele.accepttext()
end if
end event

