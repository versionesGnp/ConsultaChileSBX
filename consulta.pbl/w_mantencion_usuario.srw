forward
global type w_mantencion_usuario from window
end type
type st_1 from statictext within w_mantencion_usuario
end type
type em_usuario from editmask within w_mantencion_usuario
end type
type cb_imprimir from commandbutton within w_mantencion_usuario
end type
type cb_exportar from commandbutton within w_mantencion_usuario
end type
type cb_filtrar from commandbutton within w_mantencion_usuario
end type
type cb_ordenar from commandbutton within w_mantencion_usuario
end type
type cb_eliminar from commandbutton within w_mantencion_usuario
end type
type cb_grabar from commandbutton within w_mantencion_usuario
end type
type cb_cerrar from commandbutton within w_mantencion_usuario
end type
type dw_lista from datawindow within w_mantencion_usuario
end type
type gb_1 from groupbox within w_mantencion_usuario
end type
end forward

global type w_mantencion_usuario from window
integer width = 3269
integer height = 2008
boolean titlebar = true
string title = "Mantención Tabla ENCARGADOS"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_1 st_1
em_usuario em_usuario
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_eliminar cb_eliminar
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_mantencion_usuario w_mantencion_usuario

type variables
String	is_usuario
end variables

on w_mantencion_usuario.create
this.st_1=create st_1
this.em_usuario=create em_usuario
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.em_usuario,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_eliminar,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_mantencion_usuario.destroy
destroy(this.st_1)
destroy(this.em_usuario)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_mantencion_usuario)
dw_lista.settransobject(sqlca)
if dw_lista.retrieve()=0 then
	messagebox("Advertencia","No Registra Datos")
	close(w_mantencion_usuario)
end if
	

end event

type st_1 from statictext within w_mantencion_usuario
integer x = 1861
integer y = 1780
integer width = 379
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Usuario:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_usuario from editmask within w_mantencion_usuario
integer x = 2254
integer y = 1764
integer width = 512
integer height = 92
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!"
end type

event modified;STRING	ls_string
long		ll_row
if trim(em_usuario.text)<>'' then
	is_usuario				= trim(em_usuario.text)
	ls_string				= "codigo_usuario='"+trim(em_usuario.text)+"'"
	ll_row 					= dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
	IF ll_row > 0 THEN
		dw_lista.ScrollToRow( ll_row )
		dw_lista.setfocus()
	ELSE
		MessageBox("Advertencia", "Usuario Inexistente")
		em_usuario.text	= ''
	END IF
end if
end event

type cb_imprimir from commandbutton within w_mantencion_usuario
integer x = 1559
integer y = 1764
integer width = 242
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
end if
end event

type cb_exportar from commandbutton within w_mantencion_usuario
integer x = 1248
integer y = 1764
integer width = 242
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_mantencion_usuario
integer x = 1001
integer y = 1764
integer width = 242
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_ordenar from commandbutton within w_mantencion_usuario
integer x = 754
integer y = 1764
integer width = 242
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_eliminar from commandbutton within w_mantencion_usuario
integer x = 366
integer y = 1756
integer width = 315
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_resp
String	ls_usuario,ls_estado
if dw_lista.getrow()>0 then
	ls_usuario	= dw_lista.getitemstring(dw_lista.getrow(),'codigo_usuario')
	ls_estado	= dw_lista.getitemstring(dw_lista.getrow(),'estado')
	if ls_estado='A' then
		ll_resp 	= MessageBox("Eliminar", "Está Seguro de Eliminar Usuario", Exclamation!, OKCancel!, 2)
		IF ll_resp = 1 THEN
			dw_lista.setitem(dw_lista.getrow(),'estado','I')
			dw_lista.accepttext()
			if dw_lista.update()=1 then
				commit;
			else
				rollback;
			end if
		END IF
	else
		messagebox("Advertencia","Usuario Inactivo")
	end if
end if
end event

type cb_grabar from commandbutton within w_mantencion_usuario
integer x = 46
integer y = 1756
integer width = 315
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;if dw_lista.update()=1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
	dw_lista.sort()
else
	rollback;
	messagebox("Error Grabar","Error al Grabar, SQL: "+sqlca.sqlerrtext)
end if
end event

type cb_cerrar from commandbutton within w_mantencion_usuario
integer x = 2862
integer y = 1756
integer width = 315
integer height = 104
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mantencion_usuario)
end event

type dw_lista from datawindow within w_mantencion_usuario
integer x = 46
integer y = 44
integer width = 3131
integer height = 1664
integer taborder = 10
string dataobject = "dw_mantencion_tabla_encargado"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type gb_1 from groupbox within w_mantencion_usuario
integer x = 727
integer y = 1712
integer width = 1102
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

