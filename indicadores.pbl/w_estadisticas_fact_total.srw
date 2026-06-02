forward
global type w_estadisticas_fact_total from window
end type
type cb_3 from commandbutton within w_estadisticas_fact_total
end type
type dw_1 from datawindow within w_estadisticas_fact_total
end type
type cb_2 from commandbutton within w_estadisticas_fact_total
end type
type cb_1 from commandbutton within w_estadisticas_fact_total
end type
end forward

global type w_estadisticas_fact_total from window
integer x = 1074
integer y = 464
integer width = 3493
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
global w_estadisticas_fact_total w_estadisticas_fact_total

type variables
string param
end variables

on w_estadisticas_fact_total.create
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_estadisticas_fact_total.destroy
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string c_fecha,fecha1,fecha2
setpointer (HourGlass!)
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name

c_fecha = Message.StringParm
param   = Message.StringParm
dw_1.settransobject(sqlca)
//  SELECT min("FACTURA_OFERTA"."FECHA_CIERRE" ),   
//         max("FACTURA_OFERTA"."FECHA_CIERRE" )  
//    INTO :fecha1,   
//         :fecha2  
//    FROM "FACTURA_OFERTA"  ;

//fecha1 = '01/01/'+c_fecha
//fecha2 = '31/12/'+c_fecha
if dw_1.retrieve(gi_parque_select) = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(w_estadisticas_fact)
end if

if gi_parque_select = 1 then
	dw_1.object.titulo.text = 'El Prado'
elseif gi_parque_select = 102 then
	dw_1.object.titulo.text = 'El Manatial'
elseif gi_parque_select = 11 then
	dw_1.object.titulo.text = 'La Foresta'
elseif gi_parque_select = 801 then
	dw_1.object.titulo.text = 'Concepción'
end if

end event

type cb_3 from commandbutton within w_estadisticas_fact_total
integer x = 41
integer y = 1992
integer width = 311
integer height = 100
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
OpenWithParm(w_grafico_restadistico_total,param)
end event

type dw_1 from datawindow within w_estadisticas_fact_total
integer x = 41
integer y = 36
integer width = 3392
integer height = 1896
string dataobject = "dw_facturacion_historica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_1.SelectRow(0, FALSE)
dw_1.SelectRow(getrow(), TRUE)
end event

event doubleclicked;if dw_1.rowcount() > 0 then OpenWithParm(w_estadisticas_fact,string(getitemnumber(getrow(),'año')))
end event

type cb_2 from commandbutton within w_estadisticas_fact_total
integer x = 2802
integer y = 1988
integer width = 311
integer height = 112
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

type cb_1 from commandbutton within w_estadisticas_fact_total
integer x = 3122
integer y = 1988
integer width = 311
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_estadisticas_fact_total)
end event

