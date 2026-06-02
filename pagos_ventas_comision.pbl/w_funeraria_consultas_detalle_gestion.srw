forward
global type w_funeraria_consultas_detalle_gestion from window
end type
type cb_filtrar from commandbutton within w_funeraria_consultas_detalle_gestion
end type
type cb_sort from commandbutton within w_funeraria_consultas_detalle_gestion
end type
type cb_exportar from commandbutton within w_funeraria_consultas_detalle_gestion
end type
type cb_imprimir from commandbutton within w_funeraria_consultas_detalle_gestion
end type
type dw_lista from datawindow within w_funeraria_consultas_detalle_gestion
end type
type cb_cerrar from commandbutton within w_funeraria_consultas_detalle_gestion
end type
type dw_detalle from datawindow within w_funeraria_consultas_detalle_gestion
end type
end forward

global type w_funeraria_consultas_detalle_gestion from window
integer width = 3589
integer height = 2244
boolean titlebar = true
string title = "Detalle Solicitud Pago Comisión"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
dw_lista dw_lista
cb_cerrar cb_cerrar
dw_detalle dw_detalle
end type
global w_funeraria_consultas_detalle_gestion w_funeraria_consultas_detalle_gestion

type variables
String	is_base,is_serie
Long		il_numero,il_row
end variables

on w_funeraria_consultas_detalle_gestion.create
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.dw_lista,&
this.cb_cerrar,&
this.dw_detalle}
end on

on w_funeraria_consultas_detalle_gestion.destroy
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
end on

event open;string		ls_base,ls_serie
long		ll_cod_estado,ll_tot_reg
datetime	ldt_fecha_crea,ldt_fecha_estado
double	ldb_numero

gf_centrar(w_funeraria_consultas_detalle_gestion)
ls_base		= substr(1,1,Message.StringParm)
ls_serie		= substr(1,2,Message.StringParm)
ldb_numero	= double(substr(1,3,Message.StringParm))
dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_detalle.insertrow(0)
if dw_lista.retrieve(ls_base,ls_serie,ldb_numero)>0 then
	dw_lista.accepttext()
	if il_row>0 then
		ls_base				= dw_lista.getitemstring(dw_lista.getrow(),'base')
		ls_serie				= dw_lista.getitemstring(dw_lista.getrow(),'serie')
		ldb_numero			= dw_lista.getitemnumber(dw_lista.getrow(),'numero')
		ll_cod_estado		= dw_lista.getitemnumber(dw_lista.getrow(),'estado')
		ldt_fecha_crea		= dw_lista.getitemdatetime(dw_lista.getrow(),'fecha_crea')
		ldt_fecha_estado	= dw_lista.getitemdatetime(dw_lista.getrow(),'fecha_estado')
		dw_detalle.dataobject	= 'dw_funeraria_detalle_x_promesa'
		dw_detalle.settransobject(sqlca)
		ll_tot_reg				= dw_detalle.retrieve(ls_base,ls_serie,ldb_numero,ll_cod_estado,ldt_fecha_crea,ldt_fecha_estado)
	end if
else
	messagebox("Advertencia","No Registra Solicitud Pago Comisión Funeraria Promesa Nº "+ls_base+'-'+ls_serie+'-'+string(ldb_numero,"###,###,###,###"))
	close(w_funeraria_consultas_detalle_gestion)
end if
end event

type cb_filtrar from commandbutton within w_funeraria_consultas_detalle_gestion
integer x = 3287
integer y = 1196
integer width = 233
integer height = 84
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

type cb_sort from commandbutton within w_funeraria_consultas_detalle_gestion
integer x = 3049
integer y = 1196
integer width = 233
integer height = 84
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

type cb_exportar from commandbutton within w_funeraria_consultas_detalle_gestion
integer x = 2811
integer y = 1196
integer width = 233
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_funeraria_consultas_detalle_gestion
integer x = 2528
integer y = 1196
integer width = 233
integer height = 84
integer taborder = 20
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
	dw_detalle.print()
end if

end event

type dw_lista from datawindow within w_funeraria_consultas_detalle_gestion
event ue_mousemove pbm_dwnmousemove
integer x = 50
integer y = 44
integer width = 3470
integer height = 1132
integer taborder = 10
string title = "none"
string dataobject = "dw_funeraria_detalle"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_base,ls_serie
Long		ll_cod_estado,ll_tot_reg
Datetime	ldt_fecha_estado,ldt_fecha_crea
double	ldb_numero

if row>0 then
	il_row				= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_base				= dw_lista.getitemstring(il_row,'base')
	ls_serie				= dw_lista.getitemstring(il_row,'serie')
	ldb_numero			= dw_lista.getitemnumber(il_row,'numero')
	ll_cod_estado		= dw_lista.getitemnumber(il_row,'estado')
	ldt_fecha_crea		= dw_lista.getitemdatetime(il_row,'fecha_crea')
	ldt_fecha_estado	= dw_lista.getitemdatetime(il_row,'fecha_estado')
	dw_detalle.dataobject	= 'dw_funeraria_detalle_x_promesa'
	dw_detalle.settransobject(sqlca)
	ll_tot_reg				= dw_detalle.retrieve(ls_base,ls_serie,ldb_numero,ll_cod_estado,ldt_fecha_crea,ldt_fecha_estado)
end if
end event

event rowfocuschanged;string	ls_base,ls_serie
Long		ll_cod_estado,ll_tot_reg
Datetime	ldt_fecha_estado,ldt_fecha_crea
double	ldb_numero

if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_base				= dw_lista.getitemstring(il_row,'base')
	ls_serie				= dw_lista.getitemstring(il_row,'serie')
	ldb_numero			= dw_lista.getitemnumber(il_row,'numero')
	ll_cod_estado		= dw_lista.getitemnumber(il_row,'estado')
	ldt_fecha_crea		= dw_lista.getitemdatetime(il_row,'fecha_crea')
	ldt_fecha_estado	= dw_lista.getitemdatetime(il_row,'fecha_estado')
	dw_detalle.dataobject	= 'dw_funeraria_detalle_x_promesa'
	dw_detalle.settransobject(sqlca)
	ll_tot_reg				= dw_detalle.retrieve(ls_base,ls_serie,ldb_numero,ll_cod_estado,ldt_fecha_crea,ldt_fecha_estado)
end if
end event

type cb_cerrar from commandbutton within w_funeraria_consultas_detalle_gestion
event ue_mousemove pbm_mousemove
integer x = 3209
integer y = 2032
integer width = 306
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_funeraria_consultas_detalle_gestion)
end event

type dw_detalle from datawindow within w_funeraria_consultas_detalle_gestion
event ue_mousemove pbm_dwnmousemove
integer x = 41
integer y = 1304
integer width = 3488
integer height = 712
integer taborder = 60
string dataobject = "dw_funeraria_detalle_x_promesa"
boolean border = false
boolean livescroll = true
end type

