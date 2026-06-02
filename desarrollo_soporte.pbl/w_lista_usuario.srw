forward
global type w_lista_usuario from window
end type
type pb_1 from picturebutton within w_lista_usuario
end type
type em_nombre from editmask within w_lista_usuario
end type
type st_2 from statictext within w_lista_usuario
end type
type cb_4 from commandbutton within w_lista_usuario
end type
type cb_3 from commandbutton within w_lista_usuario
end type
type cb_2 from commandbutton within w_lista_usuario
end type
type cb_exportar from commandbutton within w_lista_usuario
end type
type cb_modificar from commandbutton within w_lista_usuario
end type
type cb_cerrar from commandbutton within w_lista_usuario
end type
type dw_lista from datawindow within w_lista_usuario
end type
type gb_2 from groupbox within w_lista_usuario
end type
end forward

global type w_lista_usuario from window
integer width = 3922
integer height = 1824
boolean titlebar = true
string title = "Lista Usuarios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_1 pb_1
em_nombre em_nombre
st_2 st_2
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_exportar cb_exportar
cb_modificar cb_modificar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_2 gb_2
end type
global w_lista_usuario w_lista_usuario

type variables
long il_row
end variables

on w_lista_usuario.create
this.pb_1=create pb_1
this.em_nombre=create em_nombre
this.st_2=create st_2
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_exportar=create cb_exportar
this.cb_modificar=create cb_modificar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.Control[]={this.pb_1,&
this.em_nombre,&
this.st_2,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_exportar,&
this.cb_modificar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_2}
end on

on w_lista_usuario.destroy
destroy(this.pb_1)
destroy(this.em_nombre)
destroy(this.st_2)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_exportar)
destroy(this.cb_modificar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_2)
end on

event open;gf_centrar(w_lista_usuario)
dw_lista.settransobject(sqlca)
dw_lista.retrieve()
end event

type pb_1 from picturebutton within w_lista_usuario
integer x = 1938
integer y = 1572
integer width = 123
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar3.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_nombre
Long		ll_row,ll_largo
ls_nombre		= trim(em_nombre.text)

if not isnull(ls_nombre) and ls_nombre<>'' then
	ll_largo		= len(ls_nombre)
	ls_nombre	= "mid(nombre,1,"+string(ll_largo)+")="+"'"+ls_nombre+"'"
	ll_row 		= dw_lista.Find(ls_nombre, 1, dw_lista.RowCount() )
	IF ll_row > 0 THEN
		dw_lista.ScrollToRow( ll_row )
	ELSE
		MessageBox("Advertencia", "Información Inexistente")
	END IF
end if


//long ll_row
//string ls_string
//
//if trim(em_nombre.text) <> '' then 
//	if ls_string='' or isnull(ls_string) then
//		ls_string	= "nombre='"+trim(em_nombre.text)+"'"
//	else
//		ls_string	= ls_string+" and nombre='"+trim(em_nombre.text)+"'"
//	end if
//	ll_row = dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
//	if ll_row > 0 then
//		dw_lista.ScrollToRow( ll_row )
//	else
//		MessageBox("Advertencia", "Información Inexistente")
//	end if
//end if
end event

type em_nombre from editmask within w_lista_usuario
integer x = 983
integer y = 1580
integer width = 951
integer height = 100
integer taborder = 30
integer textsize = -8
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

type st_2 from statictext within w_lista_usuario
integer x = 599
integer y = 1600
integer width = 361
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Nombre"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_lista_usuario
integer x = 2949
integer y = 1588
integer width = 229
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.object.datawindow.Print.Preview	= true
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview	= False
end if
end event

type cb_3 from commandbutton within w_lista_usuario
integer x = 2738
integer y = 1588
integer width = 206
integer height = 84
integer taborder = 70
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
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_2 from commandbutton within w_lista_usuario
integer x = 2491
integer y = 1588
integer width = 242
integer height = 84
integer taborder = 60
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
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type cb_exportar from commandbutton within w_lista_usuario
integer x = 2245
integer y = 1588
integer width = 242
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_DWToExcel(dw_lista)
end if
end event

type cb_modificar from commandbutton within w_lista_usuario
integer x = 59
integer y = 1576
integer width = 366
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string ls_usuario,ls_nombre
datetime ldt_fecha_hoy
date ld_fecha_hoy, ld_fecha_5
if dw_lista.rowcount() > 0 then
	if il_row > 0 then
		ls_usuario			= dw_lista.getitemstring(il_row,'codigo_usuario')
		if isvalid(w_modifica_usuario) then close(w_modifica_usuario)
		open(w_modifica_usuario)
		if w_modifica_usuario.dw_modificar.retrieve(ls_usuario)>0 then
			ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
			w_modifica_usuario.dw_modificar.setitem(1,'fecha_expiracion',ldt_fecha_hoy)
			ld_fecha_hoy	= date(w_modifica_usuario.dw_modificar.getitemdatetime(1,'fecha_expiracion'))
			ld_fecha_5		= relativedate(ld_fecha_hoy,5)
			w_modifica_usuario.dw_modificar.setitem(1,'fecha_expiracion',ld_fecha_5)
			w_modifica_usuario.dw_modificar.setfocus()
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Registro")
	end if
end if
end event

type cb_cerrar from commandbutton within w_lista_usuario
integer x = 3479
integer y = 1576
integer width = 352
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_usuario)
end event

type dw_lista from datawindow within w_lista_usuario
integer x = 59
integer y = 48
integer width = 3771
integer height = 1472
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_usuario"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

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

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type gb_2 from groupbox within w_lista_usuario
integer x = 2217
integer y = 1536
integer width = 992
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

