forward
global type w_lista_equipos from window
end type
type cb_modificar from commandbutton within w_lista_equipos
end type
type st_2 from statictext within w_lista_equipos
end type
type em_ip from editmask within w_lista_equipos
end type
type pb_1 from picturebutton within w_lista_equipos
end type
type cb_4 from commandbutton within w_lista_equipos
end type
type cb_3 from commandbutton within w_lista_equipos
end type
type cb_2 from commandbutton within w_lista_equipos
end type
type cb_exportar from commandbutton within w_lista_equipos
end type
type cb_cerrar from commandbutton within w_lista_equipos
end type
type dw_lista_equipos from datawindow within w_lista_equipos
end type
type gb_2 from groupbox within w_lista_equipos
end type
end forward

global type w_lista_equipos from window
integer width = 3602
integer height = 1864
boolean titlebar = true
string title = "Listado De Equipos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_modificar cb_modificar
st_2 st_2
em_ip em_ip
pb_1 pb_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_exportar cb_exportar
cb_cerrar cb_cerrar
dw_lista_equipos dw_lista_equipos
gb_2 gb_2
end type
global w_lista_equipos w_lista_equipos

type variables
long il_row
end variables

on w_lista_equipos.create
this.cb_modificar=create cb_modificar
this.st_2=create st_2
this.em_ip=create em_ip
this.pb_1=create pb_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_exportar=create cb_exportar
this.cb_cerrar=create cb_cerrar
this.dw_lista_equipos=create dw_lista_equipos
this.gb_2=create gb_2
this.Control[]={this.cb_modificar,&
this.st_2,&
this.em_ip,&
this.pb_1,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_exportar,&
this.cb_cerrar,&
this.dw_lista_equipos,&
this.gb_2}
end on

on w_lista_equipos.destroy
destroy(this.cb_modificar)
destroy(this.st_2)
destroy(this.em_ip)
destroy(this.pb_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_exportar)
destroy(this.cb_cerrar)
destroy(this.dw_lista_equipos)
destroy(this.gb_2)
end on

event open;long		ll_new

gf_centrar(w_lista_equipos)
dw_lista_equipos.settransobject(sqlca)
ll_new					= dw_lista_equipos.insertrow(0)
dw_lista_equipos.retrieve()

end event

type cb_modificar from commandbutton within w_lista_equipos
integer x = 123
integer y = 1592
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string ls_ip
 
if dw_lista_equipos.rowcount() > 0 then
	if il_row > 0 then
		ls_ip			= dw_lista_equipos.getitemstring(il_row,'ip')
		if isvalid(w_ingreso_equipo) then close(w_ingreso_equipo)
		open(w_ingreso_equipo)
		if w_ingreso_equipo.dw_ingreso_equipo.retrieve(ls_ip)>0 then
			w_ingreso_equipo.dw_ingreso_equipo.setfocus()
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Registro")
	end if
end if
end event

type st_2 from statictext within w_lista_equipos
integer x = 809
integer y = 1620
integer width = 242
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar IP"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_ip from editmask within w_lista_equipos
integer x = 1088
integer y = 1600
integer width = 453
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type pb_1 from picturebutton within w_lista_equipos
integer x = 1554
integer y = 1592
integer width = 123
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar3.bmp"
alignment htextalign = left!
end type

event clicked;long ll_row
string ls_string

if trim(em_ip.text) <> '' then 
	if ls_string='' or isnull(ls_string) then
		ls_string	= "ip='"+trim(em_ip.text)+"'"
	else
		ls_string	= ls_string+" and ip='"+trim(em_ip.text)+"'"
	end if
	ll_row = dw_lista_equipos.Find(ls_string, 1, dw_lista_equipos.RowCount() )
	if ll_row > 0 then
		dw_lista_equipos.ScrollToRow( ll_row )
	else
		MessageBox("Advertencia", "Información Inexistente")
	end if
end if

end event

type cb_4 from commandbutton within w_lista_equipos
integer x = 2661
integer y = 1604
integer width = 229
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista_equipos.rowcount() > 0 then 
	dw_lista_equipos.object.datawindow.Print.Preview	= true
	f_Print( dw_lista_equipos )
	dw_lista_equipos.object.datawindow.Print.Preview	= False
end if
end event

type cb_3 from commandbutton within w_lista_equipos
integer x = 2450
integer y = 1604
integer width = 206
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_lista_equipos.SETfilter(ls_texto)
dw_lista_equipos.filter()
end event

type cb_2 from commandbutton within w_lista_equipos
integer x = 2203
integer y = 1604
integer width = 242
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista_equipos.SETSORT(NULO)
dw_lista_equipos.SORT()

end event

type cb_exportar from commandbutton within w_lista_equipos
integer x = 1957
integer y = 1604
integer width = 242
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_lista_equipos.rowcount() > 0 then
	f_DWToExcel(dw_lista_equipos)
end if
end event

type cb_cerrar from commandbutton within w_lista_equipos
integer x = 3095
integer y = 1580
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_equipos)
end event

type dw_lista_equipos from datawindow within w_lista_equipos
integer x = 78
integer y = 48
integer width = 3419
integer height = 1484
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_equipos"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row > 0 then 
	il_row	= row
	cb_modificar.triggerevent(clicked!)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type gb_2 from groupbox within w_lista_equipos
integer x = 1929
integer y = 1552
integer width = 987
integer height = 164
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

