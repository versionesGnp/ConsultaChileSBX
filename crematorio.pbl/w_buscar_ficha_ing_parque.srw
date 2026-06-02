forward
global type w_buscar_ficha_ing_parque from window
end type
type cb_cerrar from commandbutton within w_buscar_ficha_ing_parque
end type
type cb_aceptar from commandbutton within w_buscar_ficha_ing_parque
end type
type cb_1 from commandbutton within w_buscar_ficha_ing_parque
end type
type cb_2 from commandbutton within w_buscar_ficha_ing_parque
end type
type cb_3 from commandbutton within w_buscar_ficha_ing_parque
end type
type cb_imprimir from commandbutton within w_buscar_ficha_ing_parque
end type
type dw_lista from datawindow within w_buscar_ficha_ing_parque
end type
type dp_inicio from datepicker within w_buscar_ficha_ing_parque
end type
type dp_fin from datepicker within w_buscar_ficha_ing_parque
end type
type st_1 from statictext within w_buscar_ficha_ing_parque
end type
type st_2 from statictext within w_buscar_ficha_ing_parque
end type
type pb_ok from picturebutton within w_buscar_ficha_ing_parque
end type
type gb_2 from groupbox within w_buscar_ficha_ing_parque
end type
type gb_1 from groupbox within w_buscar_ficha_ing_parque
end type
end forward

global type w_buscar_ficha_ing_parque from window
integer width = 3378
integer height = 2024
boolean titlebar = true
string title = "Buscar Ficha Traslado Crematorio"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
dw_lista dw_lista
dp_inicio dp_inicio
dp_fin dp_fin
st_1 st_1
st_2 st_2
pb_ok pb_ok
gb_2 gb_2
gb_1 gb_1
end type
global w_buscar_ficha_ing_parque w_buscar_ficha_ing_parque

on w_buscar_ficha_ing_parque.create
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.dp_inicio=create dp_inicio
this.dp_fin=create dp_fin
this.st_1=create st_1
this.st_2=create st_2
this.pb_ok=create pb_ok
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_cerrar,&
this.cb_aceptar,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.dw_lista,&
this.dp_inicio,&
this.dp_fin,&
this.st_1,&
this.st_2,&
this.pb_ok,&
this.gb_2,&
this.gb_1}
end on

on w_buscar_ficha_ing_parque.destroy
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.dp_inicio)
destroy(this.dp_fin)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.pb_ok)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;gf_centrar(w_buscar_ficha_ing_parque)
dw_lista.settransobject(sqlca)
end event

type cb_cerrar from commandbutton within w_buscar_ficha_ing_parque
integer x = 2953
integer y = 1764
integer width = 343
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_buscar_ficha_ing_parque)
end event

type cb_aceptar from commandbutton within w_buscar_ficha_ing_parque
integer x = 18
integer y = 1764
integer width = 343
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;Long		ll_fila,ll_folio_fc
String		ls_tipo_origen

if isvalid(w_fc_ficha_traslado) and dw_lista.rowcount() > 0  then
	ll_fila															= dw_lista.getrow()
	ll_folio_fc													= dw_lista.getitemnumber(ll_fila,'folio_crematorio')
	if ll_folio_fc > 0 then
		w_fc_ficha_traslado.em_folio.text					= string(ll_folio_fc)
		w_fc_ficha_traslado.pb_aceptar.triggerevent(clicked!)
		w_fc_ficha_traslado.tab_1.SelectedTab			= 1
		w_fc_ficha_traslado.tab_1.tabpage_1.dw_ficha.setfocus()
		close(w_buscar_ficha_ing_parque)
	end if
else
	messagebox("Advertencia","No Hay Ficha a Seleccionar")
end if
end event

type cb_1 from commandbutton within w_buscar_ficha_ing_parque
integer x = 1317
integer y = 1764
integer width = 238
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_2 from commandbutton within w_buscar_ficha_ing_parque
integer x = 1783
integer y = 1764
integer width = 219
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then OpenWithParm(w_exportar, dw_paso)

end event

type cb_3 from commandbutton within w_buscar_ficha_ing_parque
integer x = 1559
integer y = 1764
integer width = 219
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_imprimir from commandbutton within w_buscar_ficha_ing_parque
integer x = 2190
integer y = 1764
integer width = 219
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom        	= 52
	f_printdlg(dw_lista,gstr_print,w_consultar_ficha)
	dw_lista.object.datawindow.Print.Preview  = False
	dw_lista.object.datawindow.zoom           = 100
end if
end event

type dw_lista from datawindow within w_buscar_ficha_ing_parque
integer x = 18
integer y = 220
integer width = 3282
integer height = 1484
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_ficha_traslado_cremacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(this.getrow(), true)
end if
end event

event doubleclicked;if row > 0 then
	cb_aceptar.triggerevent(clicked!)
end if
end event

type dp_inicio from datepicker within w_buscar_ficha_ing_parque
integer x = 425
integer y = 48
integer width = 448
integer height = 100
integer taborder = 20
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2022-01-12"), Time("13:17:49.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;dw_lista.reset()
end event

type dp_fin from datepicker within w_buscar_ficha_ing_parque
integer x = 1074
integer y = 48
integer width = 448
integer height = 100
integer taborder = 20
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2022-01-12"), Time("13:17:49.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;dw_lista.reset()
end event

type st_1 from statictext within w_buscar_ficha_ing_parque
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

type st_2 from statictext within w_buscar_ficha_ing_parque
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

type pb_ok from picturebutton within w_buscar_ficha_ing_parque
integer x = 3131
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

ldt_fec_ini		= datetime(date(dp_inicio.text),time('00:00:00'))
ldt_fec_fin		= datetime(date(dp_fin.text),time('23:59:59'))
if ldt_fec_ini > ldt_fec_fin then
	messagebox("Advertencia","Fecha Inicio NO debe ser Mayor a fecha Termino")
	dp_fin.setfocus()
elseif isnull(ldt_fec_ini) then
	messagebox("Advertencia","Debe Ingresar Fecha Inicio")
	dp_inicio.setfocus()
elseif isnull(ldt_fec_fin) then
	messagebox("Advertencia","Debe Ingresar Fecha Termino")
	dp_fin.setfocus()
else
	if dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin)=0 then
		messagebox("Advertencia","No Existe Ficha en Rango de Fecha Indicada")
	else
		dw_lista.setfocus()
	end if
end if
end event

type gb_2 from groupbox within w_buscar_ficha_ing_parque
integer x = 27
integer width = 3049
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

type gb_1 from groupbox within w_buscar_ficha_ing_parque
integer x = 1289
integer y = 1712
integer width = 1147
integer height = 172
integer taborder = 40
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

