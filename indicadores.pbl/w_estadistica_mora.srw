forward
global type w_estadistica_mora from window
end type
type cb_3 from commandbutton within w_estadistica_mora
end type
type dw_1 from datawindow within w_estadistica_mora
end type
type cb_2 from commandbutton within w_estadistica_mora
end type
type cb_1 from commandbutton within w_estadistica_mora
end type
end forward

global type w_estadistica_mora from window
integer x = 183
integer y = 376
integer width = 3264
integer height = 2076
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
global w_estadistica_mora w_estadistica_mora

type variables
string param
end variables

on w_estadistica_mora.create
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_estadistica_mora.destroy
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;long i,mora,numero
date fecha
string c_fecha,fecha1,fecha2
setpointer (HourGlass!)
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name

c_fecha = Message.StringParm
param   = Message.StringParm
dw_1.settransobject(sqlca)
fecha1 = '01/01/'+c_fecha
fecha2 = '31/12/'+c_fecha

if dw_1.retrieve(date(fecha1),date(fecha2),gi_parque_select) = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(w_estadistica_mora)
else
	
//	for i = 1 to dw_1.rowcount()
//		numero = dw_1.getitemnumber(i+1,'numero_por_mes')
//		numero = numero + i - 1
//		i = numero
//		fecha = date(dw_1.getitemdatetime(i,'fecha_cierre'))
//		SELECT count("FACTURA_OFERTA"."MORA")  
//		INTO :mora  
//		FROM "FACTURA_OFERTA"  
//		WHERE ( "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha ) AND  
//				( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
//				(("FACTURA_OFERTA"."ESTADO" = 'N') OR  
//				("FACTURA_OFERTA"."ESTADO" = 'S'))  and
//				("FACTURA_OFERTA"."MORA" = 0 );
//		dw_1.setitem(i,'p_cero',mora)
//	next

	if gi_parque_select = 1 then
		dw_1.object.titulo.text = '( El Prado )'
	elseif gi_parque_select = 102 then
		dw_1.object.titulo.text = '( El Manantial )'
	elseif gi_parque_select = 11 then
		dw_1.object.titulo.text = '( La Foresta )'
	elseif gi_parque_select = 801 then
		dw_1.object.titulo.text = '( Concepción )'
	end if
	dw_1.object.titulo1.text = 'Promesas en Mora año '+param
end if
end event

type cb_3 from commandbutton within w_estadistica_mora
integer x = 2546
integer y = 1844
integer width = 325
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type dw_1 from datawindow within w_estadistica_mora
integer x = 41
integer y = 40
integer width = 3163
integer height = 1768
string dataobject = "dw_mora_estadistica1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_estadistica_mora
integer x = 41
integer y = 1844
integer width = 325
integer height = 104
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Gráfico"
end type

event clicked;OpenWithParm(w_grafico_mora,param)	
end event

type cb_1 from commandbutton within w_estadistica_mora
integer x = 2880
integer y = 1844
integer width = 325
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_estadistica_mora)
end event

