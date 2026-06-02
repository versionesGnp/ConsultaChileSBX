forward
global type w_lista_convenios from window
end type
type em_codigo from editmask within w_lista_convenios
end type
type em_glosa from editmask within w_lista_convenios
end type
type st_4 from statictext within w_lista_convenios
end type
type em_telefono from editmask within w_lista_convenios
end type
type st_3 from statictext within w_lista_convenios
end type
type cb_salir from commandbutton within w_lista_convenios
end type
type cb_filtrar from commandbutton within w_lista_convenios
end type
type cb_exportar from commandbutton within w_lista_convenios
end type
type cb_2 from commandbutton within w_lista_convenios
end type
type cb_aceptar from commandbutton within w_lista_convenios
end type
type cb_buscar from commandbutton within w_lista_convenios
end type
type em_rut_contacto from editmask within w_lista_convenios
end type
type st_2 from statictext within w_lista_convenios
end type
type cb_limpiar from commandbutton within w_lista_convenios
end type
type em_estado from editmask within w_lista_convenios
end type
type st_estado from statictext within w_lista_convenios
end type
type em_rut_emp from editmask within w_lista_convenios
end type
type st_rut from statictext within w_lista_convenios
end type
type st_1 from statictext within w_lista_convenios
end type
type em_codigo_2 from editmask within w_lista_convenios
end type
type dw_lista from datawindow within w_lista_convenios
end type
type gb_1 from groupbox within w_lista_convenios
end type
end forward

global type w_lista_convenios from window
integer width = 3392
integer height = 1896
boolean titlebar = true
string title = "Listado Convenios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
em_codigo em_codigo
em_glosa em_glosa
st_4 st_4
em_telefono em_telefono
st_3 st_3
cb_salir cb_salir
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_2 cb_2
cb_aceptar cb_aceptar
cb_buscar cb_buscar
em_rut_contacto em_rut_contacto
st_2 st_2
cb_limpiar cb_limpiar
em_estado em_estado
st_estado st_estado
em_rut_emp em_rut_emp
st_rut st_rut
st_1 st_1
em_codigo_2 em_codigo_2
dw_lista dw_lista
gb_1 gb_1
end type
global w_lista_convenios w_lista_convenios

type variables
datawindow dw_paso
long	il_row
end variables

on w_lista_convenios.create
this.em_codigo=create em_codigo
this.em_glosa=create em_glosa
this.st_4=create st_4
this.em_telefono=create em_telefono
this.st_3=create st_3
this.cb_salir=create cb_salir
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_2=create cb_2
this.cb_aceptar=create cb_aceptar
this.cb_buscar=create cb_buscar
this.em_rut_contacto=create em_rut_contacto
this.st_2=create st_2
this.cb_limpiar=create cb_limpiar
this.em_estado=create em_estado
this.st_estado=create st_estado
this.em_rut_emp=create em_rut_emp
this.st_rut=create st_rut
this.st_1=create st_1
this.em_codigo_2=create em_codigo_2
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.em_codigo,&
this.em_glosa,&
this.st_4,&
this.em_telefono,&
this.st_3,&
this.cb_salir,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_2,&
this.cb_aceptar,&
this.cb_buscar,&
this.em_rut_contacto,&
this.st_2,&
this.cb_limpiar,&
this.em_estado,&
this.st_estado,&
this.em_rut_emp,&
this.st_rut,&
this.st_1,&
this.em_codigo_2,&
this.dw_lista,&
this.gb_1}
end on

on w_lista_convenios.destroy
destroy(this.em_codigo)
destroy(this.em_glosa)
destroy(this.st_4)
destroy(this.em_telefono)
destroy(this.st_3)
destroy(this.cb_salir)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_2)
destroy(this.cb_aceptar)
destroy(this.cb_buscar)
destroy(this.em_rut_contacto)
destroy(this.st_2)
destroy(this.cb_limpiar)
destroy(this.em_estado)
destroy(this.st_estado)
destroy(this.em_rut_emp)
destroy(this.st_rut)
destroy(this.st_1)
destroy(this.em_codigo_2)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_lista_convenios)
dw_lista.settransobject(sqlca)
dw_lista.retrieve()
end event

type em_codigo from editmask within w_lista_convenios
integer x = 2926
integer y = 136
integer width = 375
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#######"
end type

event modified;cb_buscar.triggerevent(clicked!)
end event

type em_glosa from editmask within w_lista_convenios
integer x = 2615
integer y = 308
integer width = 690
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
string displaydata = "°üDecimalSeparator = ~'.~';Delimitidentifier = ~'Yes~';PBDBMS = 0"
end type

event modified;cb_buscar.triggerevent(clicked!)
end event

type st_4 from statictext within w_lista_convenios
integer x = 2619
integer y = 236
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Glosa"
boolean focusrectangle = false
end type

type em_telefono from editmask within w_lista_convenios
integer x = 2926
integer y = 492
integer width = 375
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!"
string displaydata = "°üDecimalSeparator = ~'.~';Delimitidentifier = ~'Yes~';PBDBMS = 0"
end type

event modified;cb_buscar.triggerevent(clicked!)
end event

type st_3 from statictext within w_lista_convenios
integer x = 2619
integer y = 500
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Telefono"
boolean focusrectangle = false
end type

type cb_salir from commandbutton within w_lista_convenios
integer x = 2578
integer y = 1656
integer width = 773
integer height = 96
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_convenios)
end event

type cb_filtrar from commandbutton within w_lista_convenios
integer x = 2578
integer y = 1556
integer width = 389
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type cb_exportar from commandbutton within w_lista_convenios
integer x = 2962
integer y = 1456
integer width = 389
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;dw_paso	= dw_lista
f_DWToExcel( dw_paso )
end event

type cb_2 from commandbutton within w_lista_convenios
integer x = 2962
integer y = 1556
integer width = 389
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()
end event

type cb_aceptar from commandbutton within w_lista_convenios
integer x = 2578
integer y = 1456
integer width = 389
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;long	ll_row,ll_codigo

if dw_lista.getrow() > 0 then
	ll_row							= dw_lista.getrow()
	ll_codigo						= dw_lista.getitemnumber(ll_row,'cod_convenio')
	if not isnull(ll_codigo) and ll_codigo>0 then
		w_convenio_mantenedor.dw_convenios.retrieve(ll_codigo)
		w_convenio_mantenedor.wf_itemchanged(ll_codigo,'cod_convenio')
	end if	
	close(w_lista_convenios)
end if	
end event

type cb_buscar from commandbutton within w_lista_convenios
integer x = 2574
integer y = 804
integer width = 389
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;string ls_string
long	ll_row

if trim(em_codigo.text) <> '' then
	ls_string	= " cod_convenio="+trim(em_codigo.text)+""
end if
if trim(em_glosa.text) <> '' then
	if ls_string='' or isnull(ls_string) then
		ls_string	= "glosa='"+trim(em_glosa.text)+"'"
	else
		ls_string	= ls_string+" and glosa='"+trim(em_glosa.text)+"'"
	end if
end if 
if trim(em_estado.text) <> '' then
	if ls_string='' or isnull(ls_string) then
		ls_string	= "estado='"+trim(em_estado.text)+"'"
	else
		ls_string	= ls_string+" and estado='"+trim(em_estado.text)+"'"
	end if
end if
if trim(em_telefono.text) <> '' then
	if ls_string='' or isnull(ls_string) then
		ls_string	= "fono='"+trim(em_telefono.text)+"'"
	else
		ls_string	= ls_string+" and fono='"+trim(em_telefono.text)+"'"
	end if
end if

ll_row = dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
IF ll_row > 0 THEN
	dw_lista.ScrollToRow( ll_row )
ELSE
	MessageBox("Advertencia", "Información Inexistente")
END IF
end event

type em_rut_contacto from editmask within w_lista_convenios
boolean visible = false
integer x = 3721
integer y = 428
integer width = 375
integer height = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "#########"
string displaydata = ""
end type

event modified;//cb_buscar.triggerevent(clicked!)
end event

type st_2 from statictext within w_lista_convenios
boolean visible = false
integer x = 3415
integer y = 436
integer width = 306
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Rut Contacto"
boolean focusrectangle = false
end type

type cb_limpiar from commandbutton within w_lista_convenios
integer x = 2962
integer y = 804
integer width = 389
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;em_codigo.text				= ''
em_estado.text				= ''
em_rut_emp.text			= ''
em_rut_contacto.text		= ''
em_telefono.text			= ''
em_glosa.text				= ''
em_codigo.setfocus()
end event

type em_estado from editmask within w_lista_convenios
integer x = 2926
integer y = 400
integer width = 375
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
string displaydata = "°üDecimalSeparator = ~'.~';Delimitidentifier = ~'Yes~';PBDBMS = 0"
end type

event modified;cb_buscar.triggerevent(clicked!)
end event

type st_estado from statictext within w_lista_convenios
integer x = 2619
integer y = 408
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Estado"
boolean focusrectangle = false
end type

type em_rut_emp from editmask within w_lista_convenios
boolean visible = false
integer x = 3721
integer y = 232
integer width = 375
integer height = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "#########"
string displaydata = ""
end type

event modified;//cb_buscar.triggerevent(clicked!)
end event

type st_rut from statictext within w_lista_convenios
boolean visible = false
integer x = 3415
integer y = 240
integer width = 288
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Rut Empresa"
boolean focusrectangle = false
end type

type st_1 from statictext within w_lista_convenios
integer x = 2619
integer y = 144
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Código"
boolean focusrectangle = false
end type

type em_codigo_2 from editmask within w_lista_convenios
boolean visible = false
integer x = 3726
integer y = 644
integer width = 375
integer height = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "#########"
string displaydata = "~r"
end type

event modified;cb_buscar.triggerevent(clicked!)
end event

type dw_lista from datawindow within w_lista_convenios
integer x = 37
integer y = 28
integer width = 2523
integer height = 1732
string title = "none"
string dataobject = "dw_lista_convenios"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(Row, TRUE)
end if
end event

event rowfocuschanged;il_row	= this.getrow()
if il_row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row > 0 then
	il_row	= row
	cb_aceptar.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_lista_convenios
integer x = 2578
integer y = 12
integer width = 768
integer height = 780
integer taborder = 10
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Opciones de Busqueda"
end type

