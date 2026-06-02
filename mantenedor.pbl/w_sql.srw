forward
global type w_sql from window
end type
type pb_buscar from picturebutton within w_sql
end type
type em_tabla from editmask within w_sql
end type
type st_3 from statictext within w_sql
end type
type pb_ok from picturebutton within w_sql
end type
type st_salir from statictext within w_sql
end type
type st_grabar from statictext within w_sql
end type
type st_eliminar from statictext within w_sql
end type
type st_limpiar from statictext within w_sql
end type
type st_insertar from statictext within w_sql
end type
type st_filtrar from statictext within w_sql
end type
type st_exportar from statictext within w_sql
end type
type st_ordenar from statictext within w_sql
end type
type st_2 from statictext within w_sql
end type
type pb_exportar from picturebutton within w_sql
end type
type pb_filtrar from picturebutton within w_sql
end type
type pb_ordenar from picturebutton within w_sql
end type
type pb_eliminar from picturebutton within w_sql
end type
type pb_insertar from picturebutton within w_sql
end type
type pb_limpiar from picturebutton within w_sql
end type
type pb_cerrar from picturebutton within w_sql
end type
type pb_grabar from picturebutton within w_sql
end type
type st_1 from statictext within w_sql
end type
type cb_1 from commandbutton within w_sql
end type
type rb_3 from radiobutton within w_sql
end type
type rb_2 from radiobutton within w_sql
end type
type rb_1 from radiobutton within w_sql
end type
type dw_3 from datawindow within w_sql
end type
type mle_1 from multilineedit within w_sql
end type
type dw_2 from datawindow within w_sql
end type
type dw_1 from datawindow within w_sql
end type
type gb_1 from groupbox within w_sql
end type
end forward

global type w_sql from window
integer width = 2907
integer height = 2252
boolean titlebar = true
string title = "Mantenedor de Tablas"
boolean controlmenu = true
long backcolor = 67108864
pb_buscar pb_buscar
em_tabla em_tabla
st_3 st_3
pb_ok pb_ok
st_salir st_salir
st_grabar st_grabar
st_eliminar st_eliminar
st_limpiar st_limpiar
st_insertar st_insertar
st_filtrar st_filtrar
st_exportar st_exportar
st_ordenar st_ordenar
st_2 st_2
pb_exportar pb_exportar
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_eliminar pb_eliminar
pb_insertar pb_insertar
pb_limpiar pb_limpiar
pb_cerrar pb_cerrar
pb_grabar pb_grabar
st_1 st_1
cb_1 cb_1
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
dw_3 dw_3
mle_1 mle_1
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
end type
global w_sql w_sql

type variables
string 	is_tabla
Long		il_row,il_fila,il_fila_eliminar
DragObject control_dw
end variables

on w_sql.create
this.pb_buscar=create pb_buscar
this.em_tabla=create em_tabla
this.st_3=create st_3
this.pb_ok=create pb_ok
this.st_salir=create st_salir
this.st_grabar=create st_grabar
this.st_eliminar=create st_eliminar
this.st_limpiar=create st_limpiar
this.st_insertar=create st_insertar
this.st_filtrar=create st_filtrar
this.st_exportar=create st_exportar
this.st_ordenar=create st_ordenar
this.st_2=create st_2
this.pb_exportar=create pb_exportar
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_eliminar=create pb_eliminar
this.pb_insertar=create pb_insertar
this.pb_limpiar=create pb_limpiar
this.pb_cerrar=create pb_cerrar
this.pb_grabar=create pb_grabar
this.st_1=create st_1
this.cb_1=create cb_1
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_3=create dw_3
this.mle_1=create mle_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_buscar,&
this.em_tabla,&
this.st_3,&
this.pb_ok,&
this.st_salir,&
this.st_grabar,&
this.st_eliminar,&
this.st_limpiar,&
this.st_insertar,&
this.st_filtrar,&
this.st_exportar,&
this.st_ordenar,&
this.st_2,&
this.pb_exportar,&
this.pb_filtrar,&
this.pb_ordenar,&
this.pb_eliminar,&
this.pb_insertar,&
this.pb_limpiar,&
this.pb_cerrar,&
this.pb_grabar,&
this.st_1,&
this.cb_1,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.dw_3,&
this.mle_1,&
this.dw_2,&
this.dw_1,&
this.gb_1}
end on

on w_sql.destroy
destroy(this.pb_buscar)
destroy(this.em_tabla)
destroy(this.st_3)
destroy(this.pb_ok)
destroy(this.st_salir)
destroy(this.st_grabar)
destroy(this.st_eliminar)
destroy(this.st_limpiar)
destroy(this.st_insertar)
destroy(this.st_filtrar)
destroy(this.st_exportar)
destroy(this.st_ordenar)
destroy(this.st_2)
destroy(this.pb_exportar)
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_eliminar)
destroy(this.pb_insertar)
destroy(this.pb_limpiar)
destroy(this.pb_cerrar)
destroy(this.pb_grabar)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_3)
destroy(this.mle_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
gf_centrar(w_sql)
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
if gs_empresa = 'El Prado' then
	dw_1.retrieve('PRADO')
elseif gs_empresa = 'La Foresta' then
	dw_1.retrieve('FORESTA')
elseif gs_empresa = 'Concepcion' then
	dw_1.retrieve('CONCEPCION')
end if
end event

event mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

type pb_buscar from picturebutton within w_sql
integer x = 1024
integer y = 32
integer width = 96
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Long		ll_largo,ll_row
String	ls_string, ls_texto,ls_tabla

ls_texto		= trim(em_tabla.text)
ll_largo		= len(ls_texto)
ls_string	= 'mid(table_name,1,'+string(ll_largo)+') = "'+ls_texto+'"'
if trim(ls_texto)<>'' and not isnull(ls_texto) then
	ll_row	= dw_1.Find(ls_string, 1, dw_1.RowCount() )
	IF ll_row > 0 THEN
		if il_fila=0 then
			dw_1.ScrollToRow( ll_row )
			il_fila	= ll_row
		else
			il_fila ++
			ls_tabla	= dw_1.getitemstring(il_fila,'table_name')
			if mid(ls_tabla,1,ll_largo) = ls_texto then
				dw_1.ScrollToRow( il_fila )
			end if
		end if
	ELSE
		MessageBox("Advertencia", "Información Inexistente")
	END IF
end if
end event

type em_tabla from editmask within w_sql
integer x = 261
integer y = 32
integer width = 754
integer height = 88
integer taborder = 10
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
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;String	ls_texto
il_fila		= 0
ls_texto		= trim(em_tabla.text)
if len(ls_texto)>0 then pb_buscar.triggerevent(clicked!)
end event

type st_3 from statictext within w_sql
integer x = 37
integer y = 16
integer width = 197
integer height = 116
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tabla a Buscar"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_sql
integer x = 2665
integer y = 192
integer width = 146
integer height = 124
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;cb_1.triggerevent(clicked!)
end event

type st_salir from statictext within w_sql
integer x = 2665
integer y = 824
integer width = 178
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Salir"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_grabar from statictext within w_sql
integer x = 2281
integer y = 824
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Grabar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_eliminar from statictext within w_sql
integer x = 2647
integer y = 668
integer width = 210
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Eliminar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_limpiar from statictext within w_sql
integer x = 2469
integer y = 668
integer width = 210
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Limpiar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_insertar from statictext within w_sql
integer x = 2281
integer y = 668
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Insertar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_filtrar from statictext within w_sql
integer x = 2665
integer y = 512
integer width = 178
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Filtrar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_exportar from statictext within w_sql
integer x = 2459
integer y = 512
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Exportar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_ordenar from statictext within w_sql
integer x = 2281
integer y = 512
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Ordenar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_2 from statictext within w_sql
integer x = 50
integer y = 1300
integer width = 480
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos Tabla"
boolean focusrectangle = false
end type

type pb_exportar from picturebutton within w_sql
event ue_mousemove pbm_mousemove
integer x = 2491
integer y = 376
integer width = 169
integer height = 132
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string picturename = "exportar.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= true
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

event clicked;datawindow dw_paso
dw_paso	= dw_3
if dw_3.rowcount() > 0 and dw_2.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_filtrar from picturebutton within w_sql
event ue_mousemove pbm_mousemove
integer x = 2670
integer y = 376
integer width = 169
integer height = 132
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string picturename = "filtrar.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= true
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

event clicked;string nulo
setnull (nulo)
if dw_2.rowcount() > 0 then
	dw_3.SETfilter(NULO)
	dw_3.filter()
end if
end event

type pb_ordenar from picturebutton within w_sql
event ue_mousemove pbm_mousemove
integer x = 2313
integer y = 376
integer width = 169
integer height = 132
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string picturename = "ordenar.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_ordenar.visible	= true
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

event clicked;if dw_3.rowcount() > 0 and dw_2.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_3.SETSORT(NULO)
	dw_3.SORT()
end if
end event

type pb_eliminar from picturebutton within w_sql
event ue_mousemove pbm_mousemove
integer x = 2670
integer y = 532
integer width = 169
integer height = 132
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "delete.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= true
st_grabar.visible		= false
st_salir.visible		= false
end event

event clicked;long	ll_resp
if dw_3.rowcount() > 0 and dw_2.rowcount() > 0 and il_fila_eliminar>0 then
	if il_fila_eliminar>0 then
		ll_resp		= messagebox("Eliminar","Está seguro de Eliminar Registro Nº "+string(il_fila_eliminar,"###,###,###,##0"),Exclamation!,YesNo!,2)
		if ll_resp=1 then
			dw_3.deleterow(il_fila_eliminar)
			dw_3.accepttext()
			messagebox("Advertencia","Eliminación Exitosa, recuerde Grabar los Cambios de la Tabla")
		end if
	end if
end if
end event

type pb_insertar from picturebutton within w_sql
event ue_mousemove pbm_mousemove
integer x = 2313
integer y = 532
integer width = 169
integer height = 132
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "Insertar_on.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= true
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

event clicked;long	ll_new
if dw_2.rowcount() > 0 then
	ll_new	= dw_3.insertrow(0)
	dw_3.setfocus()
	dw_3.scrolltorow(ll_new)
	dw_3.setcolumn(1)
end if
end event

type pb_limpiar from picturebutton within w_sql
event ue_mousemove pbm_mousemove
integer x = 2491
integer y = 532
integer width = 169
integer height = 132
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "trash.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= true
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

event clicked;dw_3.reset()
dw_2.reset()
st_1.text	= ''
mle_1.text	= ''
dw_1.setfocus()
end event

type pb_cerrar from picturebutton within w_sql
event ue_mousemove pbm_mousemove
integer x = 2670
integer y = 688
integer width = 169
integer height = 132
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= true
end event

event clicked;close(w_sql)
end event

type pb_grabar from picturebutton within w_sql
event ue_mousemove pbm_mousemove
integer x = 2313
integer y = 688
integer width = 169
integer height = 132
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= true
st_salir.visible		= false
end event

event clicked;Long	ll_resp
if dw_2.rowcount() > 0 then
	ll_resp		= messagebox("Grabar","Está seguro de Grabar Datos",Exclamation!,YesNo!,2)
	if ll_resp=1 then
		if dw_3.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			pb_limpiar.triggerevent(clicked!)
		else
			rollback;
			messagebox("Error al Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type st_1 from statictext within w_sql
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 2040
integer width = 2789
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

type cb_1 from commandbutton within w_sql
boolean visible = false
integer x = 2487
integer y = 720
integer width = 178
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;string 	ls_sql_syntax, ls_style, ls_dw_syntax, ls_dw_err
long 		i,ll_tot_reg

st_1.text		= ''
for i = 1 to dw_2.rowcount()
	ls_sql_syntax = ls_sql_syntax + dw_2.getitemstring(i,1)	
	if i < dw_2.rowcount() then
		ls_sql_syntax = ls_sql_syntax +','
	end if
next
ls_sql_syntax	= 'select ' + ls_sql_syntax + ' from '+is_tabla
mle_1.text 		= upper(ls_sql_syntax)
if mle_1.text = "" then
	MessageBox("Advertencia", "No existe Sintaxi. Entre un SQL valid o " &
	+ "DataWindow o Select de una Tabla y Columnas y de click para Crear")
	Return
end if
if rb_1.checked = true then
	ls_style		= "style(type=" + 'form' + ")"	
elseif rb_2.checked = true then
	ls_style		= "style(type=" + 'tabular' + ")"	
elseif rb_3.checked = true then
	ls_style		= "style(type=" + 'grid' + ")"	
end if
ls_sql_syntax = mle_1.text
ls_dw_err 		= ""
ls_dw_syntax	= SyntaxFromSQL(sqlca, ls_sql_syntax, ls_style, ls_dw_err)
If ls_dw_err <> "" Then
	MessageBox("Advertencia", ls_dw_err)
	Return
End If
dw_3.Create(ls_dw_syntax)
dw_3.SetTransObject(sqlca)
ll_tot_reg		= dw_3.Retrieve( )
if ll_tot_reg>0 then
	st_1.text 		= 'Tabla '+is_tabla+' Total Registro(s) : '+string (ll_tot_reg,'###,###,###,###,###,##0')
	dw_3.setfocus()
end if
end event

type rb_3 from radiobutton within w_sql
event ue_mousemove pbm_mousemove
integer x = 2341
integer y = 252
integer width = 425
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grid"
boolean checked = true
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

event clicked;if this.checked=true then cb_1.triggerevent(clicked!)
end event

type rb_2 from radiobutton within w_sql
event ue_mousemove pbm_mousemove
integer x = 2341
integer y = 168
integer width = 425
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "tabular"
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

event clicked;if this.checked=true then cb_1.triggerevent(clicked!)
end event

type rb_1 from radiobutton within w_sql
event ue_mousemove pbm_mousemove
integer x = 2341
integer y = 84
integer width = 425
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Free form"
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

event clicked;if this.checked=true then cb_1.triggerevent(clicked!)
	
end event

type dw_3 from datawindow within w_sql
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 1360
integer width = 2789
integer height = 652
integer taborder = 140
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

event itemchanged;string	ls_columna,ls_tipo,ls_campo,ls_string,ls_col_min,ls_contenido
Long		ll_fila,ll_row

dw_3.accepttext()
ll_row					= row
ls_columna				= upper(dwo.name)
ls_col_min				= dwo.name
ls_string				= "column_name='"+trim(ls_columna)+"'"
ll_fila 					= dw_2.Find(ls_string, 1, dw_2.RowCount())
if ll_fila>0 then
	ls_tipo				= dw_2.getitemstring(ll_fila,'data_type')
	if ls_tipo='VARCHAR2' or ls_tipo='CHAR' then
		ls_contenido	= dw_3.getitemstring(ll_row,ls_col_min)
		ls_campo			= upper(ls_contenido)
		dw_3.setitem(ll_row,ls_col_min,ls_campo)
	end if
end if
dw_3.accepttext()
end event

event clicked;if row>0 then il_fila_eliminar = row
end event

event rowfocuschanged;if getrow()>0 then il_fila_eliminar = getrow()
end event

type mle_1 from multilineedit within w_sql
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 872
integer width = 2789
integer height = 400
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

type dw_2 from datawindow within w_sql
event ue_mousemove pbm_mousemove
integer x = 1184
integer y = 48
integer width = 1070
integer height = 772
integer taborder = 30
string title = "none"
string dataobject = "dw_owner_campo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

event rowfocuschanged;if getrow()>0 then
	SelectRow(0, FALSE)
	SelectRow(getrow(), TRUE)
end if
end event

event doubleclicked;if row>0 then
	SelectRow(0, FALSE)
	SelectRow(row, TRUE)
end if
end event

event dragdrop;control_dw = DraggedObject()
if dw_1.getrow()>0 then
	dw_2.reset()
	dw_3.reset()
	mle_1.text	= ''
	is_tabla		= dw_1.getitemstring(il_row,1)
	dw_2.retrieve(is_tabla)
	cb_1.triggerevent(clicked!)
end if
end event

event clicked;if row>0 then
	SelectRow(0, FALSE)
	SelectRow(row, TRUE)
end if
end event

type dw_1 from datawindow within w_sql
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 156
integer width = 1070
integer height = 664
integer taborder = 20
string dragicon = "CreateLibrary5!"
string title = "none"
string dataobject = "dw_owner_tabla"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

event doubleclicked;if row>0 then
	dw_2.reset()
	dw_3.reset()
	mle_1.text	= ''
	il_row	= row
	is_tabla = this.getitemstring(il_row,1)
	dw_2.retrieve(is_tabla)
	cb_1.triggerevent(clicked!)
end if
end event

event rowfocuschanged;if getrow()>0 then
	dw_2.reset()
	dw_3.reset()
	mle_1.text	= ''
	il_row	= getrow()
	SelectRow(0, FALSE)
	SelectRow(il_row, TRUE)
end if
end event

event clicked;if row>0 then
	dw_2.reset()
	dw_3.reset()
	mle_1.text	= ''
	il_row		= row
	SelectRow(0, FALSE)
	SelectRow(il_row, TRUE)
	this.Drag(Begin!)
end if
end event

type gb_1 from groupbox within w_sql
event ue_mousemove pbm_mousemove
integer x = 2309
integer y = 24
integer width = 535
integer height = 320
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Datawindow"
end type

event ue_mousemove;st_ordenar.visible	= false
st_exportar.visible	= false
st_filtrar.visible	= false
st_insertar.visible	= false
st_limpiar.visible	= false
st_eliminar.visible	= false
st_grabar.visible		= false
st_salir.visible		= false
end event

