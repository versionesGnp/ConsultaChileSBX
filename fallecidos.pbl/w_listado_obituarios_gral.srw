forward
global type w_listado_obituarios_gral from window
end type
type cb_limpiar from commandbutton within w_listado_obituarios_gral
end type
type st_3 from statictext within w_listado_obituarios_gral
end type
type dw_parque from datawindow within w_listado_obituarios_gral
end type
type cb_cerrar from commandbutton within w_listado_obituarios_gral
end type
type cbx_todos_parques from checkbox within w_listado_obituarios_gral
end type
type dp_inicio from datepicker within w_listado_obituarios_gral
end type
type dp_fin from datepicker within w_listado_obituarios_gral
end type
type st_1 from statictext within w_listado_obituarios_gral
end type
type st_2 from statictext within w_listado_obituarios_gral
end type
type pb_ok from picturebutton within w_listado_obituarios_gral
end type
type cb_ordenar from commandbutton within w_listado_obituarios_gral
end type
type cb_2 from commandbutton within w_listado_obituarios_gral
end type
type cb_3 from commandbutton within w_listado_obituarios_gral
end type
type cb_imprimir from commandbutton within w_listado_obituarios_gral
end type
type dw_listado from datawindow within w_listado_obituarios_gral
end type
type gb_1 from groupbox within w_listado_obituarios_gral
end type
type gb_2 from groupbox within w_listado_obituarios_gral
end type
end forward

global type w_listado_obituarios_gral from window
integer width = 4777
integer height = 1980
boolean titlebar = true
string title = "Listado Obituario"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_limpiar cb_limpiar
st_3 st_3
dw_parque dw_parque
cb_cerrar cb_cerrar
cbx_todos_parques cbx_todos_parques
dp_inicio dp_inicio
dp_fin dp_fin
st_1 st_1
st_2 st_2
pb_ok pb_ok
cb_ordenar cb_ordenar
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
dw_listado dw_listado
gb_1 gb_1
gb_2 gb_2
end type
global w_listado_obituarios_gral w_listado_obituarios_gral

event open;Long		ll_parque

gf_centrar(w_listado_obituarios_gral)
dw_listado.settransobject(sqlca)
cbx_todos_parques.triggerevent(clicked!)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_parque				= 1
elseif gs_conexion	= "Parque La Foresta" then
	ll_parque				= 11
end if
//dw_parque.setitem(1,'cod_parque',ll_parque)
//dw_parque.accepttext()
cbx_todos_parques.checked	= false
cbx_todos_parques.triggerevent(clicked!)
end event

on w_listado_obituarios_gral.create
this.cb_limpiar=create cb_limpiar
this.st_3=create st_3
this.dw_parque=create dw_parque
this.cb_cerrar=create cb_cerrar
this.cbx_todos_parques=create cbx_todos_parques
this.dp_inicio=create dp_inicio
this.dp_fin=create dp_fin
this.st_1=create st_1
this.st_2=create st_2
this.pb_ok=create pb_ok
this.cb_ordenar=create cb_ordenar
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.dw_listado=create dw_listado
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_limpiar,&
this.st_3,&
this.dw_parque,&
this.cb_cerrar,&
this.cbx_todos_parques,&
this.dp_inicio,&
this.dp_fin,&
this.st_1,&
this.st_2,&
this.pb_ok,&
this.cb_ordenar,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.dw_listado,&
this.gb_1,&
this.gb_2}
end on

on w_listado_obituarios_gral.destroy
destroy(this.cb_limpiar)
destroy(this.st_3)
destroy(this.dw_parque)
destroy(this.cb_cerrar)
destroy(this.cbx_todos_parques)
destroy(this.dp_inicio)
destroy(this.dp_fin)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.pb_ok)
destroy(this.cb_ordenar)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.dw_listado)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cb_limpiar from commandbutton within w_listado_obituarios_gral
integer x = 2194
integer y = 1708
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;w_listado_obituarios_gral.triggerevent(open!)
end event

type st_3 from statictext within w_listado_obituarios_gral
integer x = 2606
integer y = 64
integer width = 343
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_listado_obituarios_gral
integer x = 2962
integer y = 48
integer width = 640
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long		ll_cod_parque
dw_parque.accepttext()
dw_listado.reset()
ll_cod_parque		= dw_parque.getitemnumber(1,'cod_parque')
if ll_cod_parque > 0 then
	messagebox("Advertencia","Recuerde al seleccionar Parque, este informe incluirá Fichas de Cremación")
end if
end event

type cb_cerrar from commandbutton within w_listado_obituarios_gral
integer x = 4361
integer y = 1708
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_listado_obituarios_gral)
end event

type cbx_todos_parques from checkbox within w_listado_obituarios_gral
integer x = 1797
integer y = 60
integer width = 681
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Todos los Parques"
end type

event clicked;Long		ll_parque
if cbx_todos_parques.checked=true then
	dw_listado.dataobject			= 'dw_listado_obituario_gral_sin_parque'
elseif cbx_todos_parques.checked=false then
	dw_listado.dataobject			= 'dw_listado_obituario_gral_con_parque'
	dw_parque.reset()
	dw_parque.insertrow(0)
	if gs_conexion	= "Parque El Prado" then
		ll_parque				= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque				= 11
	end if
end if
dw_listado.settransobject(sqlca)
end event

type dp_inicio from datepicker within w_listado_obituarios_gral
integer x = 425
integer y = 48
integer width = 448
integer height = 100
integer taborder = 20
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-03-03"), Time("16:14:01.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type dp_fin from datepicker within w_listado_obituarios_gral
integer x = 1074
integer y = 48
integer width = 448
integer height = 100
integer taborder = 20
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-03-03"), Time("16:14:01.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type st_1 from statictext within w_listado_obituarios_gral
integer x = 55
integer y = 68
integer width = 325
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_listado_obituarios_gral
integer x = 891
integer y = 64
integer width = 155
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_listado_obituarios_gral
integer x = 4498
integer y = 36
integer width = 155
integer height = 128
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;datetime		ldt_fec_ini,ldt_fec_fin
Double		ll_rut
String			ls_nombre,ls_ap_pat
Long			ll_reg,ll_cod_parque

if cbx_todos_parques.checked=true then
	dw_listado.dataobject			= 'dw_listado_obituario_gral_sin_parque'
elseif cbx_todos_parques.checked=false then
	dw_listado.dataobject			= 'dw_listado_obituario_gral_con_parque'
end if
dw_listado.settransobject(sqlca)
ldt_fec_ini		= datetime(date(dp_inicio.text),time('00:00:00'))
ldt_fec_fin		= datetime(date(dp_fin.text),time('23:59:59'))
ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
if trim(dp_inicio.text)='00/00/0000' or isnull(dp_inicio.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	dp_inicio.setfocus()
elseif trim(dp_fin.text)='00/00/0000' or isnull(dp_fin.text) then
	messagebox("Advertencia","Fecha Termino Inválida")
	dp_fin.setfocus()
elseif ldt_fec_ini > ldt_fec_fin then
	messagebox("Advertencia","Fecha Termino Inválida, No puede ser Menor a Fecha Inicial ")
	dp_fin.setfocus()
elseif (isnull(ll_cod_parque) or ll_cod_parque=0) and cbx_todos_parques.checked=false then
	messagebox("Advertencia","Debe Ingresar Parque")
	dw_parque.setfocus()
else
	if cbx_todos_parques.checked = false then
		if ll_cod_parque>0 then
			if dw_listado.retrieve(ldt_fec_ini,ldt_fec_fin,ll_cod_parque)=0 then
				messagebox("Advertencia","No Registra Dato")
			end if
		else
			messagebox("Advertencia","Debe Seleccionar Parque")
			dw_parque.setfocus()
		end if
		
	elseif cbx_todos_parques.checked = true then
		if dw_listado.retrieve(ldt_fec_ini,ldt_fec_fin)=0 then
			messagebox("Advertencia","No Registra Dato")
		end if
	end if
	dw_listado.sort()
end if


end event

type cb_ordenar from commandbutton within w_listado_obituarios_gral
integer x = 50
integer y = 1688
integer width = 238
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_listado.rowcount() > 0 then
	setnull (nulo)
	dw_listado.SETSORT(NULO)
	dw_listado.SORT()
end if
end event

type cb_2 from commandbutton within w_listado_obituarios_gral
integer x = 544
integer y = 1688
integer width = 238
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_listado
if dw_listado.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_listado_obituarios_gral
integer x = 297
integer y = 1688
integer width = 238
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_listado.SETfilter(NULO)
dw_listado.filter()

end event

type cb_imprimir from commandbutton within w_listado_obituarios_gral
integer x = 791
integer y = 1688
integer width = 238
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_listado.rowcount() > 0 then
	dw_listado.print()
end if
end event

type dw_listado from datawindow within w_listado_obituarios_gral
integer x = 27
integer y = 200
integer width = 4677
integer height = 1456
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_obituario_gral_con_parque"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(Row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getRow(), TRUE)
end if
end event

type gb_1 from groupbox within w_listado_obituarios_gral
integer x = 23
integer y = 1624
integer width = 1029
integer height = 188
integer taborder = 20
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Utilitarios"
end type

type gb_2 from groupbox within w_listado_obituarios_gral
integer x = 27
integer width = 4421
integer height = 168
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

