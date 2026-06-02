forward
global type w_estadisticas_fact_total_trimestral from window
end type
type cb_3 from commandbutton within w_estadisticas_fact_total_trimestral
end type
type dw_1 from datawindow within w_estadisticas_fact_total_trimestral
end type
type cb_2 from commandbutton within w_estadisticas_fact_total_trimestral
end type
type cb_1 from commandbutton within w_estadisticas_fact_total_trimestral
end type
end forward

global type w_estadisticas_fact_total_trimestral from window
integer x = 1074
integer y = 464
integer width = 3506
integer height = 2232
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_3 cb_3
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_estadisticas_fact_total_trimestral w_estadisticas_fact_total_trimestral

type variables
string param
end variables

on w_estadisticas_fact_total_trimestral.create
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_estadisticas_fact_total_trimestral.destroy
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string c_fecha,trimestre,sql

setpointer (HourGlass!)
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name

c_fecha = Message.StringParm
param   = Message.StringParm
dw_1.settransobject(sqlca)
if gi_trimestre = 1 then
		trimestre = 'Primer'
elseif gi_trimestre = 2 then
		trimestre = 'Segundo'
elseif gi_trimestre = 3 then
		trimestre = 'Tercer'
elseif gi_trimestre = 4 then
		trimestre = 'Cuarto'
end if

dw_1.SetSQLSelect(gs_sql)
	
if dw_1.retrieve() = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(w_estadisticas_fact_total_trimestral)
else
	dw_1.object.titulo1.text = 'Resumen Historico del '+trimestre+' Trimestre'
	dw_1.object.titulo.text = '( '+gs_empresa+' )'
end if
end event

type cb_3 from commandbutton within w_estadisticas_fact_total_trimestral
integer x = 46
integer y = 1992
integer width = 315
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Gráficos"
end type

event clicked;setpointer(HourGlass!)
OpenWithParm(w_grafico_restadistico_total_trimestral,param)
end event

type dw_1 from datawindow within w_estadisticas_fact_total_trimestral
integer x = 46
integer y = 40
integer width = 3397
integer height = 1908
string dataobject = "dw_facturacion_anual_trimestral"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_1.SelectRow(0, FALSE)
dw_1.SelectRow(getrow(), TRUE)
end event

event doubleclicked;//if dw_1.rowcount() > 0 then OpenWithParm(w_estadisticas_fact,string(getitemnumber(getrow(),'año')))
end event

type cb_2 from commandbutton within w_estadisticas_fact_total_trimestral
integer x = 2802
integer y = 1992
integer width = 315
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprime"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type cb_1 from commandbutton within w_estadisticas_fact_total_trimestral
integer x = 3127
integer y = 1992
integer width = 315
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;gs_sql = ''
close(w_estadisticas_fact_total_trimestral)
end event

