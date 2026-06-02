forward
global type w_muestra_datos_agente from window
end type
type st_resumen from statictext within w_muestra_datos_agente
end type
type st_detalle from statictext within w_muestra_datos_agente
end type
type st_volver from statictext within w_muestra_datos_agente
end type
type cb_rescomi from commandbutton within w_muestra_datos_agente
end type
type cb_clasi from commandbutton within w_muestra_datos_agente
end type
type em_codigo from editmask within w_muestra_datos_agente
end type
type st_texto from statictext within w_muestra_datos_agente
end type
type pb_2 from picturebutton within w_muestra_datos_agente
end type
type dw_1 from datawindow within w_muestra_datos_agente
end type
type pb_1 from picturebutton within w_muestra_datos_agente
end type
type rb_3 from radiobutton within w_muestra_datos_agente
end type
type rb_2 from radiobutton within w_muestra_datos_agente
end type
type rb_1 from radiobutton within w_muestra_datos_agente
end type
type pb_ordenar from picturebutton within w_muestra_datos_agente
end type
type pb_imprimir from picturebutton within w_muestra_datos_agente
end type
type pb_exportar from picturebutton within w_muestra_datos_agente
end type
type pb_salir from picturebutton within w_muestra_datos_agente
end type
type dw_muestra from datawindow within w_muestra_datos_agente
end type
type gb_1 from groupbox within w_muestra_datos_agente
end type
end forward

global type w_muestra_datos_agente from window
integer x = 82
integer y = 84
integer width = 3035
integer height = 1876
boolean titlebar = true
string title = "Estructura de Venta por Agentes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_resumen st_resumen
st_detalle st_detalle
st_volver st_volver
cb_rescomi cb_rescomi
cb_clasi cb_clasi
em_codigo em_codigo
st_texto st_texto
pb_2 pb_2
dw_1 dw_1
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
end type
global w_muestra_datos_agente w_muestra_datos_agente

type variables
Datawindow dw_paso
String	is_codigo_sup, is_codigo, is_sw, ls_nombre, ls_a_pat, ls_a_mat, ls_estado
Long		il_row_age, ll_rut
date		ld_fecha_ini


end variables

on w_muestra_datos_agente.create
this.st_resumen=create st_resumen
this.st_detalle=create st_detalle
this.st_volver=create st_volver
this.cb_rescomi=create cb_rescomi
this.cb_clasi=create cb_clasi
this.em_codigo=create em_codigo
this.st_texto=create st_texto
this.pb_2=create pb_2
this.dw_1=create dw_1
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
this.Control[]={this.st_resumen,&
this.st_detalle,&
this.st_volver,&
this.cb_rescomi,&
this.cb_clasi,&
this.em_codigo,&
this.st_texto,&
this.pb_2,&
this.dw_1,&
this.pb_1,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.pb_ordenar,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_salir,&
this.dw_muestra,&
this.gb_1}
end on

on w_muestra_datos_agente.destroy
destroy(this.st_resumen)
destroy(this.st_detalle)
destroy(this.st_volver)
destroy(this.cb_rescomi)
destroy(this.cb_clasi)
destroy(this.em_codigo)
destroy(this.st_texto)
destroy(this.pb_2)
destroy(this.dw_1)
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
end on

event open;string	ls_cod_age,ls_filtro

gf_centrar(w_muestra_datos_agente)
st_volver.visible		= false
st_detalle.visible	= false
st_resumen.visible	= false
dw_1.settransobject(sqlca)
is_codigo_sup 	= trim(Message.StringParm)
is_sw				= mid(is_codigo_sup,1,3)
if is_sw = 'pas' then 
	is_codigo_sup	= mid(is_codigo_sup,4,(len(is_codigo_sup)-3))
	dw_muestra.dataobject 	= 'dw_lista_agentes_con_retrieve'
	dw_muestra.settransobject(sqlca)
	if dw_muestra.retrieve(is_codigo_sup)=0 then
		messagebox("Advertencia","No tiene Agente(s) a cargo")
		close(w_muestra_datos_agente)
	end if
else
	dw_muestra.dataobject 	= 'dw_lista_agentes'
	dw_muestra.settransobject(sqlca)
	if dw_muestra.retrieve()=0 then
		messagebox("Advertencia","No hay Agentes")
		close(w_muestra_datos_agente)
	end if
end if
if dw_muestra.rowcount() > 0 then 
	dw_muestra.SelectRow(1, TRUE)
	rb_1.triggerevent(clicked!)
	if isvalid(w_premio_sin_0) then
		ls_cod_age		= substr(1,1,Message.StringParm)
		if not isnull(ls_cod_age) and ls_cod_age<>'' then
			ls_filtro 								= "cod_age = '"+ls_cod_age+"'"
			dw_muestra.SetFilter(ls_filtro)
			dw_muestra.Filter( )
		end if
	end if
	gs_ventana	= 'w_muestra_datos_agente'
	f_valida_objeto_1()
end if
end event

type st_resumen from statictext within w_muestra_datos_agente
boolean visible = false
integer x = 750
integer y = 1404
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
string text = "Resumen"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if dw_muestra.dataobject <> 'dw_lista_res_comi_2' then
	dw_muestra.dataobject = 'dw_lista_res_comi_2'
	dw_muestra.settransobject(sqlca)
	if dw_muestra.retrieve(is_codigo)=0 then
		messagebox("Advertencia","No Registra datos")
		if is_sw = 'pas' then
			dw_muestra.dataobject 	= 'dw_lista_agentes_con_retrieve'
			dw_muestra.settransobject(sqlca)
			dw_muestra.retrieve(is_codigo_sup)
		else
			dw_muestra.dataobject 	= 'dw_lista_agentes'
			dw_muestra.settransobject(sqlca)
			dw_muestra.retrieve()
		end if
		if rb_1.checked = true then rb_1.triggerevent(clicked!)
		if rb_2.checked = true then rb_2.triggerevent(clicked!)
		if rb_3.checked = true then rb_3.triggerevent(clicked!)
		dw_muestra.SelectRow(0, FALSE)
		dw_muestra.SelectRow(1, TRUE)
	else
		st_volver.visible							= true
		pb_1.enabled								= false
		em_codigo.visible							= false
		st_texto.visible							= false
		rb_1.enabled								= false
		rb_2.enabled								= false
		rb_3.enabled								= false
		cb_rescomi.enabled						= false
		cb_clasi.enabled							= false
		dw_muestra.object.c_codigo.text		= is_codigo
		dw_muestra.object.c_estado.text		= ls_estado
		dw_muestra.object.c_rut.text			= string(ll_rut,"###,###,###,##0")
		dw_muestra.object.c_nombre.text		= ls_nombre+" "+ls_a_pat+" "+ls_a_mat
		dw_muestra.object.c_fecha_ini.text	= string(ld_fecha_ini)
	end if
end if
end event

type st_detalle from statictext within w_muestra_datos_agente
boolean visible = false
integer x = 224
integer y = 1404
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
string text = "Detalle"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if dw_muestra.dataobject <> 'dw_lista_res_comi' then
	dw_muestra.dataobject = 'dw_lista_res_comi'
	dw_muestra.settransobject(sqlca)
	if dw_muestra.retrieve(is_codigo)=0 then
		messagebox("Advertencia","No Registra datos")
		if is_sw = 'pas' then
			dw_muestra.dataobject 	= 'dw_lista_agentes_con_retrieve'
			dw_muestra.settransobject(sqlca)
			dw_muestra.retrieve(is_codigo_sup)
		else
			dw_muestra.dataobject 	= 'dw_lista_agentes'
			dw_muestra.settransobject(sqlca)
			dw_muestra.retrieve()
		end if
		if rb_1.checked = true then rb_1.triggerevent(clicked!)
		if rb_2.checked = true then rb_2.triggerevent(clicked!)
		if rb_3.checked = true then rb_3.triggerevent(clicked!)
		dw_muestra.SelectRow(0, FALSE)
		dw_muestra.SelectRow(1, TRUE)
	else
		st_volver.visible							= true
		pb_1.enabled								= false
		em_codigo.visible							= false
		st_texto.visible							= false
		rb_1.enabled								= false
		rb_2.enabled								= false
		rb_3.enabled								= false
		cb_rescomi.enabled						= false
		cb_clasi.enabled							= false
		dw_muestra.object.c_codigo.text		= is_codigo
		dw_muestra.object.c_estado.text		= ls_estado
		dw_muestra.object.c_rut.text			= string(ll_rut,"###,###,###,##0")
		dw_muestra.object.c_nombre.text		= ls_nombre+" "+ls_a_pat+" "+ls_a_mat
		dw_muestra.object.c_fecha_ini.text	= string(ld_fecha_ini)
	end if
end if
end event

type st_volver from statictext within w_muestra_datos_agente
boolean visible = false
integer x = 2469
integer y = 1404
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
st_detalle.visible		= false
st_resumen.visible		= false
pb_1.enabled				= true
rb_1.enabled				= true
rb_2.enabled				= true
rb_3.enabled				= true
cb_rescomi.enabled		= true
cb_clasi.enabled			= true
if is_sw = 'pas' then
	dw_muestra.dataobject 	= 'dw_lista_agentes_con_retrieve'
	dw_muestra.settransobject(sqlca)
	dw_muestra.retrieve(is_codigo_sup)
else
	dw_muestra.dataobject 	= 'dw_lista_agentes'
	dw_muestra.settransobject(sqlca)
	dw_muestra.retrieve()
end if
if dw_muestra.rowcount() > 0 then
	if rb_1.checked = true then rb_1.triggerevent(clicked!)
	if rb_2.checked = true then rb_2.triggerevent(clicked!)
	if rb_3.checked = true then rb_3.triggerevent(clicked!)
	dw_muestra.SelectRow(0, FALSE)
	dw_muestra.SelectRow(il_row_age, TRUE)
	dw_muestra.scrolltorow(il_row_age)
end if
end event

type cb_rescomi from commandbutton within w_muestra_datos_agente
integer x = 46
integer y = 1588
integer width = 320
integer height = 76
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Rescomi"
end type

event clicked;if dw_muestra.rowcount() > 0 then
	if dw_muestra.dataobject = 'dw_lista_agentes' or dw_muestra.dataobject = 'dw_lista_agentes_con_retrieve' then
		il_row_age	= dw_muestra.getrow()
		is_codigo	= dw_muestra.getitemstring(il_row_age,'cod_age')
		ll_rut		= dw_muestra.getitemnumber(il_row_age,'rut')
		ls_estado	= dw_muestra.getitemstring(il_row_age,'estado')
		if ls_estado = 'A' then ls_estado = 'Activo'
		if ls_estado = 'I' then ls_estado = 'Inactivo'
		ls_nombre	= dw_muestra.getitemstring(il_row_age,'nombre')
		ls_a_pat		= dw_muestra.getitemstring(il_row_age,'a_paterno')
		ls_a_mat		= dw_muestra.getitemstring(il_row_age,'a_materno')
		ld_fecha_ini= date(dw_muestra.getitemdatetime(il_row_age,'fecha_ini'))
		dw_muestra.dataobject = 'dw_lista_res_comi'
		dw_muestra.settransobject(sqlca)
		if dw_muestra.retrieve(is_codigo)=0 then
			messagebox("Advertencia","No Registra datos")
			if is_sw = 'pas' then
				dw_muestra.dataobject 	= 'dw_lista_agentes_con_retrieve'
				dw_muestra.settransobject(sqlca)
				dw_muestra.retrieve(is_codigo_sup)
			else
				dw_muestra.dataobject 	= 'dw_lista_agentes'
				dw_muestra.settransobject(sqlca)
				dw_muestra.retrieve()
			end if
			if rb_1.checked = true then rb_1.triggerevent(clicked!)
			if rb_2.checked = true then rb_2.triggerevent(clicked!)
			if rb_3.checked = true then rb_3.triggerevent(clicked!)
			dw_muestra.SelectRow(0, FALSE)
			dw_muestra.SelectRow(il_row_age, TRUE)
			dw_muestra.scrolltorow(il_row_age)
		else
			st_volver.visible							= true
			st_detalle.visible						= true
			st_resumen.visible						= true
			pb_1.enabled								= false
			em_codigo.visible							= false
			st_texto.visible							= false
			rb_1.enabled								= false
			rb_2.enabled								= false
			rb_3.enabled								= false
			cb_rescomi.enabled						= false
			cb_clasi.enabled							= false
			dw_muestra.object.c_codigo.text		= is_codigo
			dw_muestra.object.c_estado.text		= ls_estado
			dw_muestra.object.c_rut.text			= string(ll_rut,"###,###,###,##0")
			dw_muestra.object.c_nombre.text		= ls_nombre+" "+ls_a_pat+" "+ls_a_mat
			dw_muestra.object.c_fecha_ini.text	= string(ld_fecha_ini)
		end if
	end if
end if
end event

type cb_clasi from commandbutton within w_muestra_datos_agente
integer x = 46
integer y = 1664
integer width = 320
integer height = 76
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Clasificación"
end type

event clicked;if dw_muestra.rowcount() > 0 then
	if dw_muestra.dataobject = 'dw_lista_agentes' or dw_muestra.dataobject = 'dw_lista_agentes_con_retrieve' then
		is_codigo	= dw_muestra.getitemstring(dw_muestra.getrow(),'cod_age')
		ll_rut		= dw_muestra.getitemnumber(dw_muestra.getrow(),'rut')
		ls_estado	= dw_muestra.getitemstring(dw_muestra.getrow(),'estado')
		if ls_estado = 'A' then ls_estado = 'Activo'
		if ls_estado = 'I' then ls_estado = 'Inactivo'
		ls_nombre	= dw_muestra.getitemstring(dw_muestra.getrow(),'nombre')
		ls_a_pat		= dw_muestra.getitemstring(dw_muestra.getrow(),'a_paterno')
		ls_a_mat		= dw_muestra.getitemstring(dw_muestra.getrow(),'a_materno')
		ld_fecha_ini= date(dw_muestra.getitemdatetime(dw_muestra.getrow(),'fecha_ini'))
		dw_muestra.dataobject = 'dw_lista_clasif_hist'
		dw_muestra.settransobject(sqlca)
		if dw_muestra.retrieve(is_codigo)=0 then
			messagebox("Advertencia","No Registra datos")
			if is_sw = 'pas' then
				dw_muestra.dataobject 	= 'dw_lista_agentes_con_retrieve'
				dw_muestra.settransobject(sqlca)
				dw_muestra.retrieve(is_codigo_sup)
			else
				dw_muestra.dataobject 	= 'dw_lista_agentes'
				dw_muestra.settransobject(sqlca)
				dw_muestra.retrieve()
			end if
			if rb_1.checked = true then rb_1.triggerevent(clicked!)
			if rb_2.checked = true then rb_2.triggerevent(clicked!)
			if rb_3.checked = true then rb_3.triggerevent(clicked!)
			dw_muestra.SelectRow(0, FALSE)
			dw_muestra.SelectRow(il_row_age, TRUE)
			dw_muestra.scrolltorow(il_row_age)
		else
			st_volver.visible	= true
			pb_1.enabled		= false
			em_codigo.visible	= false
			st_texto.visible	= false
			rb_1.enabled		= false
			rb_2.enabled		= false
			rb_3.enabled		= false
			cb_rescomi.enabled= false
			cb_clasi.enabled	= false
			dw_muestra.object.c_codigo.text		= is_codigo
			dw_muestra.object.c_estado.text		= ls_estado
			dw_muestra.object.c_rut.text			= string(ll_rut,"###,###,###,##0")
			dw_muestra.object.c_nombre.text		= ls_nombre+" "+ls_a_pat+" "+ls_a_mat
			dw_muestra.object.c_fecha_ini.text	= string(ld_fecha_ini)
		end if
	end if
end if
end event

type em_codigo from editmask within w_muestra_datos_agente
boolean visible = false
integer x = 1271
integer y = 1644
integer width = 334
integer height = 88
integer taborder = 70
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

event modified;string ls_buscar
long	ll_row
if trim(this.text) <> '' then
	ls_buscar	= "cod_age='"+trim(this.text)+"'"
	ll_row = dw_muestra.Find(ls_buscar, 1, dw_muestra.RowCount() )
	IF ll_row > 0 THEN
		dw_muestra.ScrollToRow( ll_row )
	ELSE
		MessageBox("Advertencia", "Código Agente Inexistente")
	END IF
end if
end event

type st_texto from statictext within w_muestra_datos_agente
boolean visible = false
integer x = 1262
integer y = 1580
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

type pb_2 from picturebutton within w_muestra_datos_agente
integer x = 887
integer y = 1588
integer width = 169
integer height = 152
integer taborder = 60
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

type dw_1 from datawindow within w_muestra_datos_agente
boolean visible = false
integer x = 320
integer y = 200
integer width = 2322
integer height = 940
integer taborder = 70
boolean titlebar = true
string title = "Antecedentes"
string dataobject = "dw_encabezado_jefes"
end type

event clicked;this.visible = false
end event

type pb_1 from picturebutton within w_muestra_datos_agente
integer x = 1061
integer y = 1588
integer width = 169
integer height = 152
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Lupa.bmp"
string disabledname = "Lupa_no.bmp"
alignment htextalign = right!
end type

event clicked;st_texto.visible 	= true
em_codigo.visible	= true
em_codigo.text		= ''
em_codigo.setfocus()
end event

type rb_3 from radiobutton within w_muestra_datos_agente
integer x = 2432
integer y = 1624
integer width = 311
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
	dw_muestra.scrolltorow(1)
end if
end event

type rb_2 from radiobutton within w_muestra_datos_agente
integer x = 2053
integer y = 1624
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
	dw_muestra.scrolltorow(1)
end if
end event

type rb_1 from radiobutton within w_muestra_datos_agente
integer x = 1714
integer y = 1624
integer width = 306
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
	dw_muestra.scrolltorow(1)
end if
end event

type pb_ordenar from picturebutton within w_muestra_datos_agente
integer x = 713
integer y = 1588
integer width = 169
integer height = 152
integer taborder = 40
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

type pb_imprimir from picturebutton within w_muestra_datos_agente
integer x = 539
integer y = 1588
integer width = 169
integer height = 152
integer taborder = 30
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

type pb_exportar from picturebutton within w_muestra_datos_agente
integer x = 366
integer y = 1588
integer width = 169
integer height = 152
integer taborder = 20
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

type pb_salir from picturebutton within w_muestra_datos_agente
integer x = 2802
integer y = 1588
integer width = 169
integer height = 148
integer taborder = 60
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

type dw_muestra from datawindow within w_muestra_datos_agente
integer x = 50
integer y = 40
integer width = 2921
integer height = 1500
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_agentes"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;IF this.getrow() > 0 THEN
	this.SelectRow(0, FALSE)
	this.SelectRow(this.getrow(), TRUE)
END IF
end event

event clicked;IF row > 0 THEN
	il_row_age	= row
	this.SelectRow(0, FALSE)
	this.SelectRow(il_row_age, TRUE)
END IF
end event

event doubleclicked;string	ls_cod_age
if il_row_age > 0 and (this.dataobject = 'dw_lista_agentes' or this.dataobject = 'dw_lista_agentes_con_retrieve') then
	ls_cod_age		= dw_muestra.getitemstring(this.getrow(),'cod_age')
	dw_1.retrieve(ls_cod_age)
	dw_1.visible 	= true
	em_codigo.text	= ''
end if
end event

type gb_1 from groupbox within w_muestra_datos_agente
integer x = 1673
integer y = 1556
integer width = 1102
integer height = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

