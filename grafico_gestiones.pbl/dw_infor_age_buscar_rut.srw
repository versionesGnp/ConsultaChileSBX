forward
global type dw_infor_age_buscar_rut from window
end type
type cb_limpiar from commandbutton within dw_infor_age_buscar_rut
end type
type em_rut from editmask within dw_infor_age_buscar_rut
end type
type cb_imprimir from commandbutton within dw_infor_age_buscar_rut
end type
type pb_1 from picturebutton within dw_infor_age_buscar_rut
end type
type st_1 from statictext within dw_infor_age_buscar_rut
end type
type cb_cerrar from commandbutton within dw_infor_age_buscar_rut
end type
type dw_lista from datawindow within dw_infor_age_buscar_rut
end type
end forward

global type dw_infor_age_buscar_rut from window
integer width = 3479
integer height = 1844
boolean titlebar = true
string title = "Buscar Cliente - Topon Venta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_limpiar cb_limpiar
em_rut em_rut
cb_imprimir cb_imprimir
pb_1 pb_1
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global dw_infor_age_buscar_rut dw_infor_age_buscar_rut

type variables
long il_row
end variables

on dw_infor_age_buscar_rut.create
this.cb_limpiar=create cb_limpiar
this.em_rut=create em_rut
this.cb_imprimir=create cb_imprimir
this.pb_1=create pb_1
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_limpiar,&
this.em_rut,&
this.cb_imprimir,&
this.pb_1,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista}
end on

on dw_infor_age_buscar_rut.destroy
destroy(this.cb_limpiar)
destroy(this.em_rut)
destroy(this.cb_imprimir)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;gf_centrar(dw_infor_age_buscar_rut)
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
end event

type cb_limpiar from commandbutton within dw_infor_age_buscar_rut
integer x = 1550
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
string text = "Limpiar"
end type

event clicked;dw_lista.reset()
em_rut.text 				= '' 


end event

type em_rut from editmask within dw_infor_age_buscar_rut
integer x = 357
integer y = 44
integer width = 352
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

type cb_imprimir from commandbutton within dw_infor_age_buscar_rut
integer x = 32
integer y = 1608
integer width = 343
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

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
end if
end event

type pb_1 from picturebutton within dw_infor_age_buscar_rut
integer x = 791
integer y = 24
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long	ll_rut

dw_lista.reset()
if trim(em_rut.text)<>'' and not isnull(em_rut.text) then
	ll_rut		= long(trim(em_rut.text))
	dw_lista.retrieve(ll_rut)
	if dw_lista.rowcount()= 0 then
		messagebox("Advertencia","No se Encuentra Rut")
		em_rut.setfocus()
	end if	
end if	
end event

type st_1 from statictext within dw_infor_age_buscar_rut
integer x = 32
integer y = 60
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Rut:"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within dw_infor_age_buscar_rut
integer x = 3090
integer y = 1608
integer width = 320
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(dw_infor_age_buscar_rut)
end event

type dw_lista from datawindow within dw_infor_age_buscar_rut
integer x = 32
integer y = 180
integer width = 3378
integer height = 1392
integer taborder = 10
string title = "none"
string dataobject = "dw_infor_age_buscar_rut"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

