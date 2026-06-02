forward
global type w_muestra_datos_jefe from window
end type
type st_resumen from statictext within w_muestra_datos_jefe
end type
type st_detalle from statictext within w_muestra_datos_jefe
end type
type st_volver from statictext within w_muestra_datos_jefe
end type
type pb_2 from picturebutton within w_muestra_datos_jefe
end type
type st_texto from statictext within w_muestra_datos_jefe
end type
type em_codigo from editmask within w_muestra_datos_jefe
end type
type pb_1 from picturebutton within w_muestra_datos_jefe
end type
type rb_3 from radiobutton within w_muestra_datos_jefe
end type
type rb_2 from radiobutton within w_muestra_datos_jefe
end type
type rb_1 from radiobutton within w_muestra_datos_jefe
end type
type pb_ordenar from picturebutton within w_muestra_datos_jefe
end type
type pb_imprimir from picturebutton within w_muestra_datos_jefe
end type
type pb_exportar from picturebutton within w_muestra_datos_jefe
end type
type pb_salir from picturebutton within w_muestra_datos_jefe
end type
type dw_muestra from datawindow within w_muestra_datos_jefe
end type
type gb_1 from groupbox within w_muestra_datos_jefe
end type
type cb_rescomi from commandbutton within w_muestra_datos_jefe
end type
type cb_clasi from commandbutton within w_muestra_datos_jefe
end type
end forward

global type w_muestra_datos_jefe from window
integer x = 82
integer y = 84
integer width = 3401
integer height = 2256
boolean titlebar = true
string title = "Estructura de Venta por Jefe"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_resumen st_resumen
st_detalle st_detalle
st_volver st_volver
pb_2 pb_2
st_texto st_texto
em_codigo em_codigo
pb_1 pb_1
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
pb_ordenar pb_ordenar
pb_imprimir pb_imprimir
pb_exportar pb_exportar
pb_salir pb_salir
dw_muestra dw_muestra
gb_1 gb_1
cb_rescomi cb_rescomi
cb_clasi cb_clasi
end type
global w_muestra_datos_jefe w_muestra_datos_jefe

type variables
Datawindow dw_paso
string 	ls_codigo, ls_nombre, ls_a_pat, ls_a_mat, is_estado
long 		ll_rut, il_row_jefe
date		id_fecha_ing

end variables

on w_muestra_datos_jefe.create
this.st_resumen=create st_resumen
this.st_detalle=create st_detalle
this.st_volver=create st_volver
this.pb_2=create pb_2
this.st_texto=create st_texto
this.em_codigo=create em_codigo
this.pb_1=create pb_1
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_ordenar=create pb_ordenar
this.pb_imprimir=create pb_imprimir
this.pb_exportar=create pb_exportar
this.pb_salir=create pb_salir
this.dw_muestra=create dw_muestra
this.gb_1=create gb_1
this.cb_rescomi=create cb_rescomi
this.cb_clasi=create cb_clasi
this.Control[]={this.st_resumen,&
this.st_detalle,&
this.st_volver,&
this.pb_2,&
this.st_texto,&
this.em_codigo,&
this.pb_1,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.pb_ordenar,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_salir,&
this.dw_muestra,&
this.gb_1,&
this.cb_rescomi,&
this.cb_clasi}
end on

on w_muestra_datos_jefe.destroy
destroy(this.st_resumen)
destroy(this.st_detalle)
destroy(this.st_volver)
destroy(this.pb_2)
destroy(this.st_texto)
destroy(this.em_codigo)
destroy(this.pb_1)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_ordenar)
destroy(this.pb_imprimir)
destroy(this.pb_exportar)
destroy(this.pb_salir)
destroy(this.dw_muestra)
destroy(this.gb_1)
destroy(this.cb_rescomi)
destroy(this.cb_clasi)
end on

event open;gf_centrar(w_muestra_datos_jefe)
st_volver.visible			= false
st_detalle.visible		= false
st_resumen.visible		= false
pb_1.enabled				= true
dw_muestra.dataobject 	= 'dw_lista_jefes'
dw_muestra.settransobject(sqlca)
if dw_muestra.retrieve()=0 then
	messagebox("Advertencia","No registra datos")
	close(w_muestra_datos_jefe)
else
	if dw_muestra.rowcount() > 0 then 
		dw_muestra.SelectRow(1, TRUE)
		rb_1.triggerevent(clicked!)
	end if
	gs_ventana	= 'w_muestra_datos_jefe'
	f_valida_objeto_1()
end if


end event

type st_resumen from statictext within w_muestra_datos_jefe
boolean visible = false
integer x = 768
integer y = 1788
integer width = 402
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 16777215
string text = "Resumen"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if dw_muestra.dataobject <> 'dw_lista_res_comi_jefe_2' then
	dw_muestra.dataobject = 'dw_lista_res_comi_jefe_2'
	dw_muestra.settransobject(sqlca)
	if dw_muestra.retrieve(ls_codigo)=0 then
		messagebox("Adevertencia","No Registra datos")
		dw_muestra.dataobject 	= 'dw_lista_jefes'
		dw_muestra.settransobject(sqlca)
		dw_muestra.retrieve()
		if rb_1.checked = true then rb_1.triggerevent(clicked!)
		if rb_2.checked = true then rb_2.triggerevent(clicked!)
		if rb_3.checked = true then rb_3.triggerevent(clicked!)
		dw_muestra.SelectRow(0, FALSE)
		dw_muestra.SelectRow(1, TRUE)
		dw_muestra.Scrolltorow(1)
	else
		st_volver.visible	= true
		pb_1.enabled		= false
		em_codigo.visible	= false
		st_texto.visible	= false
		rb_1.enabled		= false
		rb_2.enabled		= false
		rb_3.enabled		= false
		dw_muestra.object.c_codigo.text		= ls_codigo
		dw_muestra.object.c_estado.text		= is_estado //"XXX"
		dw_muestra.object.c_rut.text			= string(ll_rut,"###,###,###,##0")
		dw_muestra.object.c_nombre.text		= ls_nombre+" "+ls_a_pat+" "+ls_a_mat
		dw_muestra.object.c_fecha_ini.text	= string(id_fecha_ing) //"XXX"
	end if
end if
end event

type st_detalle from statictext within w_muestra_datos_jefe
boolean visible = false
integer x = 229
integer y = 1788
integer width = 402
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 16777215
string text = "Detalle"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if dw_muestra.dataobject <> 'dw_lista_res_comi_jefe' then
	dw_muestra.dataobject = 'dw_lista_res_comi_jefe'
	dw_muestra.settransobject(sqlca)
	if dw_muestra.retrieve(ls_codigo)=0 then
		messagebox("Adevertencia","No Registra datos")
		dw_muestra.dataobject 	= 'dw_lista_jefes'
		dw_muestra.settransobject(sqlca)
		dw_muestra.retrieve()
		if rb_1.checked = true then rb_1.triggerevent(clicked!)
		if rb_2.checked = true then rb_2.triggerevent(clicked!)
		if rb_3.checked = true then rb_3.triggerevent(clicked!)
		dw_muestra.SelectRow(0, FALSE)
		dw_muestra.SelectRow(1, TRUE)
		dw_muestra.Scrolltorow(1)
	else
		st_volver.visible	= true
		pb_1.enabled		= false
		em_codigo.visible	= false
		st_texto.visible	= false
		rb_1.enabled		= false
		rb_2.enabled		= false
		rb_3.enabled		= false
		dw_muestra.object.c_codigo.text		= ls_codigo
		dw_muestra.object.c_estado.text		= is_estado //"XXX"
		dw_muestra.object.c_rut.text			= string(ll_rut,"###,###,###,##0")
		dw_muestra.object.c_nombre.text		= ls_nombre+" "+ls_a_pat+" "+ls_a_mat
		dw_muestra.object.c_fecha_ini.text	= string(id_fecha_ing) //"XXX"
	end if
end if
end event

type st_volver from statictext within w_muestra_datos_jefe
boolean visible = false
integer x = 2779
integer y = 1788
integer width = 343
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 16777215
string text = "Volver"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;st_volver.visible			= false
pb_1.enabled				= true
rb_1.enabled				= true
rb_2.enabled				= true
rb_3.enabled				= true
cb_rescomi.enabled	 	= true
st_detalle.visible		= false
st_resumen.visible		= false
dw_muestra.dataobject 	= 'dw_lista_jefes'
dw_muestra.settransobject(sqlca)
if dw_muestra.retrieve()=0 then
	messagebox("Advertencia","No registra datos")
	close(w_muestra_datos_jefe)
else
	if dw_muestra.rowcount() > 0 then 
		if rb_1.checked = true then rb_1.triggerevent(clicked!)
		if rb_2.checked = true then rb_2.triggerevent(clicked!)
		if rb_3.checked = true then rb_3.triggerevent(clicked!)
		dw_muestra.SelectRow(0, false)
		dw_muestra.SelectRow(il_row_jefe, TRUE)
		dw_muestra.scrolltorow(il_row_jefe)
	end if
end if

end event

type pb_2 from picturebutton within w_muestra_datos_jefe
integer x = 855
integer y = 1972
integer width = 169
integer height = 152
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
string picturename = "trash.bmp"
string disabledname = "trash_no.bmp"
alignment htextalign = left!
end type

event clicked;string nulo
setnull (nulo)
dw_muestra.SETfilter(NULO)
dw_muestra.filter()
end event

type st_texto from statictext within w_muestra_datos_jefe
boolean visible = false
integer x = 1234
integer y = 1964
integer width = 366
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Ingrese Código"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_codigo from editmask within w_muestra_datos_jefe
boolean visible = false
integer x = 1243
integer y = 2028
integer width = 334
integer height = 88
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

event modified;string 	ls_buscar
long		ll_row
if trim(this.text) <> '' then
	ls_buscar	= "jefe_ventas='"+trim(this.text)+"'"
	ll_row = dw_muestra.Find(ls_buscar, 1, dw_muestra.RowCount() )
	IF ll_row > 0 THEN
		dw_muestra.ScrollToRow( ll_row )
	ELSE
		MessageBox("Advertencia", "Código Jefe de Venta Inexistente")
	END IF
end if
end event

type pb_1 from picturebutton within w_muestra_datos_jefe
integer x = 1029
integer y = 1972
integer width = 169
integer height = 152
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Lupa.bmp"
string disabledname = "LUPA_no.bmp"
alignment htextalign = right!
end type

event clicked;st_texto.visible 	= true
em_codigo.visible	= true
em_codigo.text		= ''
em_codigo.setfocus()
end event

type rb_3 from radiobutton within w_muestra_datos_jefe
integer x = 2720
integer y = 2008
integer width = 347
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " Todos"
end type

event clicked;string DWfilter2

DWfilter2 = ""

dw_muestra.SetFilter(DWfilter2)

dw_muestra.Filter( )
if dw_muestra.rowcount() > 0 then 
	dw_muestra.SelectRow(0, FALSE)
	dw_muestra.SelectRow(1, TRUE)
end if
end event

type rb_2 from radiobutton within w_muestra_datos_jefe
integer x = 2263
integer y = 2008
integer width = 361
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " Inactivo"
end type

event clicked;string DWfilter2

DWfilter2 = "estado = 'I'"

dw_muestra.SetFilter(DWfilter2)

dw_muestra.Filter( )
if dw_muestra.rowcount() > 0 then 
	dw_muestra.SelectRow(0, FALSE)
	dw_muestra.SelectRow(1, TRUE)
end if
end event

type rb_1 from radiobutton within w_muestra_datos_jefe
integer x = 1861
integer y = 2008
integer width = 338
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " Activo"
boolean checked = true
end type

event clicked;string DWfilter2

DWfilter2 = "estado = 'A'"

dw_muestra.SetFilter(DWfilter2)

dw_muestra.Filter( )
if dw_muestra.rowcount() > 0 then 
	dw_muestra.SelectRow(0, FALSE)
	dw_muestra.SelectRow(1, TRUE)
end if

end event

type pb_ordenar from picturebutton within w_muestra_datos_jefe
integer x = 681
integer y = 1972
integer width = 169
integer height = 152
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event clicked;if dw_muestra.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_muestra.SETSORT(NULO)
	dw_muestra.SORT()
end if
end event

type pb_imprimir from picturebutton within w_muestra_datos_jefe
integer x = 507
integer y = 1972
integer width = 169
integer height = 152
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;if dw_muestra.rowcount() > 0 then 
	dw_muestra.object.datawindow.print.Preview = true
	f_Print( dw_muestra )
	dw_muestra.object.datawindow.print.Preview = false	
end if
end event

type pb_exportar from picturebutton within w_muestra_datos_jefe
integer x = 334
integer y = 1972
integer width = 169
integer height = 152
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event clicked;dw_paso	= dw_muestra
if dw_muestra.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_salir from picturebutton within w_muestra_datos_jefe
integer x = 3168
integer y = 1972
integer width = 169
integer height = 148
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type dw_muestra from datawindow within w_muestra_datos_jefe
integer x = 50
integer y = 36
integer width = 3287
integer height = 1884
integer taborder = 10
string dataobject = "dw_lista_jefes"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string	ls_codigo_jefe
if il_row_jefe > 0 and this.dataobject = 'dw_lista_jefes' then
	ls_codigo_jefe	= this.getitemstring(this.getrow(),'jefe_ventas')
	OpenWithParm(w_muestra_datos_supervisor, 'pas'+ls_codigo_jefe)
	em_codigo.text	= ''
end if
end event

event clicked;IF row > 0 THEN
	il_row_jefe	= row
	this.SelectRow(0, FALSE)
	this.SelectRow(il_row_jefe, TRUE)
END IF
end event

event rowfocuschanged;if this.getrow() > 9 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

type gb_1 from groupbox within w_muestra_datos_jefe
integer x = 1787
integer y = 1940
integer width = 1312
integer height = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

type cb_rescomi from commandbutton within w_muestra_datos_jefe
integer x = 50
integer y = 1972
integer width = 279
integer height = 152
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Rescomi"
end type

event clicked;if dw_muestra.rowcount() > 0 then
	if dw_muestra.dataobject <> 'dw_lista_res_comi_jefe' then
		st_detalle.visible	= true
		st_resumen.visible	= true
		cb_rescomi.enabled	= false
		il_row_jefe				= dw_muestra.getrow()
		ls_codigo	= dw_muestra.getitemstring(il_row_jefe,'jefe_ventas')
		ll_rut		= dw_muestra.getitemnumber(il_row_jefe,'rut')
		ls_nombre	= dw_muestra.getitemstring(il_row_jefe,'nombre')
		ls_a_pat		= dw_muestra.getitemstring(il_row_jefe,'a_paterno')
		ls_a_mat		= dw_muestra.getitemstring(il_row_jefe,'a_materno')
		id_fecha_ing= date(dw_muestra.getitemdatetime(il_row_jefe,'fecha_ing'))
		is_estado	= dw_muestra.getitemstring(il_row_jefe,'estado')
		if is_estado = 'A' then is_estado = 'Activo'
		if is_estado = 'I' then is_estado = 'Inactivo'
		dw_muestra.dataobject = 'dw_lista_res_comi_jefe'
		dw_muestra.settransobject(sqlca)
		if dw_muestra.retrieve(ls_codigo)=0 then
			messagebox("Adevertencia","No Registra datos")
			dw_muestra.dataobject 	= 'dw_lista_jefes'
			dw_muestra.settransobject(sqlca)
			dw_muestra.retrieve()
			if rb_1.checked = true then rb_1.triggerevent(clicked!)
			if rb_2.checked = true then rb_2.triggerevent(clicked!)
			if rb_3.checked = true then rb_3.triggerevent(clicked!)
			dw_muestra.SelectRow(0, FALSE)
			dw_muestra.SelectRow(1, TRUE)
			dw_muestra.Scrolltorow(1)
		else
			st_volver.visible	= true
			pb_1.enabled		= false
			em_codigo.visible	= false
			st_texto.visible	= false
			rb_1.enabled		= false
			rb_2.enabled		= false
			rb_3.enabled		= false
			dw_muestra.object.c_codigo.text		= ls_codigo
			dw_muestra.object.c_estado.text		= is_estado //"XXX"
			dw_muestra.object.c_rut.text			= string(ll_rut,"###,###,###,##0")
			dw_muestra.object.c_nombre.text		= ls_nombre+" "+ls_a_pat+" "+ls_a_mat
			dw_muestra.object.c_fecha_ini.text	= string(id_fecha_ing) //"XXX"
		end if
	end if
end if
end event

type cb_clasi from commandbutton within w_muestra_datos_jefe
boolean visible = false
integer x = 50
integer y = 2048
integer width = 357
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Clasificación"
end type

event clicked;//				if rb_supervisor.checked = true then	//supervisor
//					dw_informe.dataobject = 'dw_lista_clasif_hist_sup' //superv
//					dw_informe.settransobject(sqlca)
//					dw_informe.retrieve(is_codigo_sup)
//					dw_informe.object.c_codigo.text		= is_codigo_sup
//					dw_informe.object.c_estado.text		= is_estado_sup
//					dw_informe.object.c_rut.text			= string(il_rut_supervisor)
//					dw_informe.object.c_nombre.text		= is_nom_sup
//					dw_informe.object.c_fecha_ini.text	= string(id_fec_ini_sup)
//				end if
//				if rb_agente.checked = true then		//agente
//					dw_informe.dataobject = 'dw_lista_clasif_hist'  //agente
//					dw_informe.settransobject(sqlca)
//					dw_informe.retrieve(is_codigo_age)
//					dw_informe.object.c_codigo.text		= is_codigo_age
//					dw_informe.object.c_estado.text		= is_estado_age
//					dw_informe.object.c_rut.text			= string(il_rut_agente)
//					dw_informe.object.c_nombre.text		= is_nom_age
//					dw_informe.object.c_fecha_ini.text	= string(id_fec_ini_age)
//				end if
end event

