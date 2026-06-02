forward
global type w_lista_cristian from window
end type
type cb_3 from commandbutton within w_lista_cristian
end type
type cb_2 from commandbutton within w_lista_cristian
end type
type cb_1 from commandbutton within w_lista_cristian
end type
type dw_lista from datawindow within w_lista_cristian
end type
end forward

global type w_lista_cristian from window
integer width = 3589
integer height = 1844
boolean titlebar = true
string title = "Listar"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_lista dw_lista
end type
global w_lista_cristian w_lista_cristian

on w_lista_cristian.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_lista=create dw_lista
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_lista}
end on

on w_lista_cristian.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_lista_cristian)
dw_lista.settransobject(sqlca)
end event

type cb_3 from commandbutton within w_lista_cristian
integer x = 3186
integer y = 1608
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_cristian)
end event

type cb_2 from commandbutton within w_lista_cristian
integer x = 640
integer y = 1608
integer width = 315
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_1 from commandbutton within w_lista_cristian
integer x = 50
integer y = 1608
integer width = 439
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Archivo"
end type

event clicked;String	ls_archivo

dw_lista.reset()
dw_lista.accepttext()
SetNull(ls_archivo)
dw_lista.ImportFile(ls_archivo)
dw_lista.accepttext()

end event

type dw_lista from datawindow within w_lista_cristian
integer x = 41
integer y = 40
integer width = 3488
integer height = 1528
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_cristian"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

