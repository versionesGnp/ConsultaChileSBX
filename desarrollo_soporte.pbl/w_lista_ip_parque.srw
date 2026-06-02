forward
global type w_lista_ip_parque from window
end type
type pb_1 from picturebutton within w_lista_ip_parque
end type
type em_ip from editmask within w_lista_ip_parque
end type
type st_2 from statictext within w_lista_ip_parque
end type
type cb_modificar from commandbutton within w_lista_ip_parque
end type
type cb_exportar from commandbutton within w_lista_ip_parque
end type
type cb_2 from commandbutton within w_lista_ip_parque
end type
type cb_3 from commandbutton within w_lista_ip_parque
end type
type cb_4 from commandbutton within w_lista_ip_parque
end type
type cb_eliminar from commandbutton within w_lista_ip_parque
end type
type cb_crear from commandbutton within w_lista_ip_parque
end type
type cb_cerrar from commandbutton within w_lista_ip_parque
end type
type dw_lista from datawindow within w_lista_ip_parque
end type
type gb_2 from groupbox within w_lista_ip_parque
end type
end forward

global type w_lista_ip_parque from window
integer width = 3959
integer height = 2004
boolean titlebar = true
string title = "Listado IP Parques"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_1 pb_1
em_ip em_ip
st_2 st_2
cb_modificar cb_modificar
cb_exportar cb_exportar
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_eliminar cb_eliminar
cb_crear cb_crear
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_2 gb_2
end type
global w_lista_ip_parque w_lista_ip_parque

type variables
long il_row
end variables

on w_lista_ip_parque.create
this.pb_1=create pb_1
this.em_ip=create em_ip
this.st_2=create st_2
this.cb_modificar=create cb_modificar
this.cb_exportar=create cb_exportar
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_eliminar=create cb_eliminar
this.cb_crear=create cb_crear
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.Control[]={this.pb_1,&
this.em_ip,&
this.st_2,&
this.cb_modificar,&
this.cb_exportar,&
this.cb_2,&
this.cb_3,&
this.cb_4,&
this.cb_eliminar,&
this.cb_crear,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_2}
end on

on w_lista_ip_parque.destroy
destroy(this.pb_1)
destroy(this.em_ip)
destroy(this.st_2)
destroy(this.cb_modificar)
destroy(this.cb_exportar)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_eliminar)
destroy(this.cb_crear)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_2)
end on

event open;gf_centrar(w_lista_ip_parque)
dw_lista.settransobject(sqlca)
dw_lista.retrieve()
end event

type pb_1 from picturebutton within w_lista_ip_parque
integer x = 2021
integer y = 1744
integer width = 123
integer height = 112
integer taborder = 60
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
		ls_string	= "tcp_ip='"+trim(em_ip.text)+"'"
	else
		ls_string	= ls_string+" and tcp_ip='"+trim(em_ip.text)+"'"
	end if
	ll_row = dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
	if ll_row > 0 then
		dw_lista.ScrollToRow( ll_row )
	else
		MessageBox("Advertencia", "Información Inexistente")
	end if
end if

//string	ls_nombre
//Long		ll_row,ll_largo
//ls_nombre		= trim(em_nombre.text)
//
//if not isnull(ls_nombre) and ls_nombre<>'' then
//	ll_largo		= len(ls_nombre)
//	ls_nombre	= "mid(nombre,1,"+string(ll_largo)+")="+"'"+ls_nombre+"'"
//	ll_row 		= dw_lista.Find(ls_nombre, 1, dw_lista.RowCount() )
//	IF ll_row > 0 THEN
//		dw_lista.ScrollToRow( ll_row )
//	ELSE
//		MessageBox("Advertencia", "Información Inexistente")
//	END IF
//end if



end event

type em_ip from editmask within w_lista_ip_parque
integer x = 1554
integer y = 1752
integer width = 453
integer height = 100
integer taborder = 50
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

type st_2 from statictext within w_lista_ip_parque
integer x = 1275
integer y = 1772
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

type cb_modificar from commandbutton within w_lista_ip_parque
integer x = 55
integer y = 1744
integer width = 325
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string ls_tcp_ip
long ll_cod_parque
 
if dw_lista.rowcount() > 0 then
	if il_row > 0 then
		ls_tcp_ip			= dw_lista.getitemstring(il_row,'tcp_ip')
		ll_cod_parque		= dw_lista.getitemnumber(il_row,'cod_parque')		
		if isvalid(w_mant_ip_parque) then close(w_mant_ip_parque)
		open(w_mant_ip_parque)
		if w_mant_ip_parque.dw_ip_parque.retrieve(ls_tcp_ip,ll_cod_parque)>0 then
			w_mant_ip_parque.dw_ip_parque.setfocus()
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Registro")
	end if
end if
end event

type cb_exportar from commandbutton within w_lista_ip_parque
integer x = 2345
integer y = 1760
integer width = 242
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_DWToExcel( dw_lista)
end if
end event

type cb_2 from commandbutton within w_lista_ip_parque
integer x = 2592
integer y = 1760
integer width = 242
integer height = 84
integer taborder = 80
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

type cb_3 from commandbutton within w_lista_ip_parque
integer x = 2839
integer y = 1760
integer width = 206
integer height = 84
integer taborder = 90
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

type cb_4 from commandbutton within w_lista_ip_parque
integer x = 3049
integer y = 1760
integer width = 229
integer height = 84
integer taborder = 100
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

type cb_eliminar from commandbutton within w_lista_ip_parque
integer x = 795
integer y = 1744
integer width = 325
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;long ll_res

ll_res    = MessageBox("Advertencia", 'Esta seguro de Eliminar Registro', Exclamation!, YesNo!, 2)
if ll_res = 1 then
	if il_row>0 then
		dw_lista.deleterow(il_row)
	  if dw_lista.update() = 1 then
		  commit;
		  messagebox("Grabar","Grabación Exitosa")
		  dw_lista.reset()
		  w_lista_ip_parque.triggerevent(open!)
	  else
			rollback;
	  end if  
	end if
end if	


end event

type cb_crear from commandbutton within w_lista_ip_parque
integer x = 425
integer y = 1744
integer width = 325
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;open(w_mant_ip_parque)
end event

type cb_cerrar from commandbutton within w_lista_ip_parque
integer x = 3456
integer y = 1744
integer width = 402
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_ip_parque)

end event

type dw_lista from datawindow within w_lista_ip_parque
integer x = 55
integer y = 56
integer width = 3803
integer height = 1620
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_ip_parque"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row > 0 then 
	il_row	= row
	cb_modificar.triggerevent(clicked!)
end if
end event

type gb_2 from groupbox within w_lista_ip_parque
integer x = 2318
integer y = 1708
integer width = 987
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

