forward
global type w_informe_fosa_comun from window
end type
type cb_ordenar from commandbutton within w_informe_fosa_comun
end type
type cb_exportar from commandbutton within w_informe_fosa_comun
end type
type cb_filtrar from commandbutton within w_informe_fosa_comun
end type
type cb_imprimir from commandbutton within w_informe_fosa_comun
end type
type cb_cerrar from commandbutton within w_informe_fosa_comun
end type
type rb_todas from radiobutton within w_informe_fosa_comun
end type
type rb_por_sepult from radiobutton within w_informe_fosa_comun
end type
type dw_print from datawindow within w_informe_fosa_comun
end type
type dw_detalle from datawindow within w_informe_fosa_comun
end type
type dw_lista from datawindow within w_informe_fosa_comun
end type
type pb_ok from picturebutton within w_informe_fosa_comun
end type
type dw_parque from datawindow within w_informe_fosa_comun
end type
type st_16 from statictext within w_informe_fosa_comun
end type
type gb_1 from groupbox within w_informe_fosa_comun
end type
type gb_2 from groupbox within w_informe_fosa_comun
end type
end forward

global type w_informe_fosa_comun from window
integer width = 3945
integer height = 1864
boolean titlebar = true
string title = "Informe FOSA COMUN"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
rb_todas rb_todas
rb_por_sepult rb_por_sepult
dw_print dw_print
dw_detalle dw_detalle
dw_lista dw_lista
pb_ok pb_ok
dw_parque dw_parque
st_16 st_16
gb_1 gb_1
gb_2 gb_2
end type
global w_informe_fosa_comun w_informe_fosa_comun

type variables
Date	idt_fecha_hoy
end variables

on w_informe_fosa_comun.create
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.rb_todas=create rb_todas
this.rb_por_sepult=create rb_por_sepult
this.dw_print=create dw_print
this.dw_detalle=create dw_detalle
this.dw_lista=create dw_lista
this.pb_ok=create pb_ok
this.dw_parque=create dw_parque
this.st_16=create st_16
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_ordenar,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.rb_todas,&
this.rb_por_sepult,&
this.dw_print,&
this.dw_detalle,&
this.dw_lista,&
this.pb_ok,&
this.dw_parque,&
this.st_16,&
this.gb_1,&
this.gb_2}
end on

on w_informe_fosa_comun.destroy
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.rb_todas)
destroy(this.rb_por_sepult)
destroy(this.dw_print)
destroy(this.dw_detalle)
destroy(this.dw_lista)
destroy(this.pb_ok)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;Long	ll_new
gf_centrar(w_informe_fosa_comun)
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_print.settransobject(sqlca)
idt_fecha_hoy				= date(gdt_fec_sistema)
dw_detalle.dataobject	= 'dw_informe_fosa_comun'
dw_detalle.settransobject(sqlca)
ll_new						= dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	dw_parque.setitem(ll_new,'cod_parque',1)
elseif gs_conexion	= "Parque La Foresta" then
	dw_parque.setitem(ll_new,'cod_parque',11)
elseif gs_conexion	= "Parque Santiago" then
	dw_parque.setitem(ll_new,'cod_parque',103)
elseif gs_conexion	= "Parque Concepción" then
	dw_parque.setitem(ll_new,'cod_parque',801)
end if
dw_lista.reset()

end event

type cb_ordenar from commandbutton within w_informe_fosa_comun
integer x = 41
integer y = 1628
integer width = 306
integer height = 108
integer taborder = 50
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

type cb_exportar from commandbutton within w_informe_fosa_comun
integer x = 2578
integer y = 1644
integer width = 242
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_informe_fosa_comun
integer x = 2295
integer y = 1644
integer width = 242
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

event clicked;string nulo
setnull (nulo)
dw_detalle.SETfilter(NULO)
dw_detalle.filter()
end event

type cb_imprimir from commandbutton within w_informe_fosa_comun
integer x = 1138
integer y = 1628
integer width = 402
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Detalle"
end type

event clicked;Long		ll_new,ll_cod_parque,ll_fila
String	ls_area,ls_sector,ls_sepultura

dw_print.reset()
ll_fila				= dw_lista.getrow()
if dw_detalle.rowcount() > 0 and ll_fila > 0 then
	ll_cod_parque	= dw_lista.getitemnumber(ll_fila,'cod_parque')
	ls_area			= dw_lista.getitemstring(ll_fila,'area')
	ls_sector		= dw_lista.getitemstring(ll_fila,'sector')
	ls_sepultura	= dw_lista.getitemstring(ll_fila,'sepultura')
	if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) and &
		dw_detalle.rowcount() > 0 then
		f_Print( dw_detalle )
		if dw_detalle.dataobject='dw_informe_fosa_comun' then
			if dw_print.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura)>0 then
				dw_print.object.t_titulo.text		= 'AREA:  '+ls_area+'  -  SECTOR:  '+ls_sector+'  -  SEPULTURA:  '+ls_sepultura
				dw_print.object.t_fecha.text		= 'DISPONIBILIDAD EN FOSA COMUN AL '+string(gdt_fec_sistema,'dd/mm/yyyy')
				dw_print.object.t_usuario.text	= gs_user
				dw_print.accepttext()
				dw_print.print()
			end if
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_informe_fosa_comun
integer x = 3566
integer y = 1628
integer width = 306
integer height = 108
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_fosa_comun)
end event

type rb_todas from radiobutton within w_informe_fosa_comun
integer x = 3397
integer y = 84
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todas"
end type

event clicked;dw_detalle.dataobject	= 'dw_informe_fosa_comun_todos'
dw_detalle.settransobject(sqlca)
pb_ok.triggerevent(clicked!)
end event

type rb_por_sepult from radiobutton within w_informe_fosa_comun
integer x = 2734
integer y = 84
integer width = 494
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Sepultura"
boolean checked = true
end type

event clicked;dw_detalle.dataobject	= 'dw_informe_fosa_comun'
dw_detalle.settransobject(sqlca)
end event

type dw_print from datawindow within w_informe_fosa_comun
boolean visible = false
integer x = 2002
integer y = 1768
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_lista_sepulturas_fosa_comun_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_detalle from datawindow within w_informe_fosa_comun
integer x = 1138
integer y = 212
integer width = 2734
integer height = 1376
integer taborder = 40
string title = "none"
string dataobject = "dw_informe_fosa_comun_todos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_lista from datawindow within w_informe_fosa_comun
integer x = 41
integer y = 212
integer width = 1051
integer height = 1376
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_sepulturas_fosa_comun"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long		ll_cod_parque
String	ls_area,ls_sector,ls_sepultura
if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_cod_parque	= dw_lista.getitemnumber(row,'cod_parque')
	ls_area			= dw_lista.getitemstring(row,'area')
	ls_sector		= dw_lista.getitemstring(row,'sector')
	ls_sepultura	= dw_lista.getitemstring(row,'sepultura')
	if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) then
		if rb_por_sepult.checked=true then
			dw_detalle.dataobject	= 'dw_informe_fosa_comun'
			dw_detalle.settransobject(sqlca)
			dw_detalle.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura,idt_fecha_hoy)
		elseif rb_todas.checked=true then
			dw_detalle.dataobject	= 'dw_informe_fosa_comun_todos'
			dw_detalle.settransobject(sqlca)
			dw_detalle.retrieve(ll_cod_parque,idt_fecha_hoy)
		end if
	end if
end if
end event

event rowfocuschanged;Long		ll_fila,ll_cod_parque
String	ls_area,ls_sector,ls_sepultura

ll_fila	= this.getrow()
if ll_fila>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_fila, TRUE)
	ll_cod_parque	= dw_lista.getitemnumber(ll_fila,'cod_parque')
	ls_area			= dw_lista.getitemstring(ll_fila,'area')
	ls_sector		= dw_lista.getitemstring(ll_fila,'sector')
	ls_sepultura	= dw_lista.getitemstring(ll_fila,'sepultura')
	if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) then
		if rb_por_sepult.checked=true then
			dw_detalle.dataobject	= 'dw_informe_fosa_comun'
			dw_detalle.settransobject(sqlca)
			dw_detalle.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura,idt_fecha_hoy)
		elseif rb_todas.checked=true then
			dw_detalle.dataobject	= 'dw_informe_fosa_comun_todos'
			dw_detalle.settransobject(sqlca)
			dw_detalle.retrieve(ll_cod_parque,idt_fecha_hoy)
		end if
	end if
end if
end event

type pb_ok from picturebutton within w_informe_fosa_comun
integer x = 923
integer y = 28
integer width = 169
integer height = 148
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Long		ll_cod_parque
String	ls_area,ls_sector,ls_sepultura

ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
if ll_cod_parque>0 then
	if dw_lista.retrieve(ll_cod_parque)>0 then
		dw_lista.setfocus()
		dw_lista.scrolltorow(1)
		dw_lista.SelectRow(0, FALSE)
		dw_lista.SelectRow(1, TRUE)
		ls_area			= dw_lista.getitemstring(1,'area')
		ls_sector		= dw_lista.getitemstring(1,'sector')
		ls_sepultura	= dw_lista.getitemstring(1,'sepultura')
		if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) then
			if rb_por_sepult.checked=true then
				dw_detalle.dataobject	= 'dw_informe_fosa_comun'
				dw_detalle.settransobject(sqlca)
				dw_detalle.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura,idt_fecha_hoy)
			elseif rb_todas.checked=true then
				dw_detalle.dataobject	= 'dw_informe_fosa_comun_todos'
				dw_detalle.settransobject(sqlca)
				dw_detalle.retrieve(ll_cod_parque,idt_fecha_hoy)
			end if
		end if
	end if
end if
end event

type dw_parque from datawindow within w_informe_fosa_comun
integer x = 265
integer y = 56
integer width = 594
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long	ll_cod_parque

dw_parque.accepttext()
ll_cod_parque	= this.getitemnumber(1,'cod_parque')
if ll_cod_parque>0 then
	dw_lista.reset()
	dw_detalle.reset()
	pb_ok.triggerevent(clicked!)
end if
end event

type st_16 from statictext within w_informe_fosa_comun
integer x = 23
integer y = 64
integer width = 210
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_informe_fosa_comun
integer x = 2633
integer y = 12
integer width = 1243
integer height = 176
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción"
boolean righttoleft = true
end type

type gb_2 from groupbox within w_informe_fosa_comun
integer x = 2267
integer y = 1592
integer width = 581
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

