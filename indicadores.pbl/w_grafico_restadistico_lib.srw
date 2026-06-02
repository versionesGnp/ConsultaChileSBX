forward
global type w_grafico_restadistico_lib from window
end type
type rb_5 from radiobutton within w_grafico_restadistico_lib
end type
type rb_4 from radiobutton within w_grafico_restadistico_lib
end type
type rb_3 from radiobutton within w_grafico_restadistico_lib
end type
type rb_1 from radiobutton within w_grafico_restadistico_lib
end type
type dw_1 from datawindow within w_grafico_restadistico_lib
end type
type cb_2 from commandbutton within w_grafico_restadistico_lib
end type
type cb_1 from commandbutton within w_grafico_restadistico_lib
end type
type gb_1 from groupbox within w_grafico_restadistico_lib
end type
end forward

global type w_grafico_restadistico_lib from window
integer x = 5
integer y = 4
integer width = 3657
integer height = 2436
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
rb_1 rb_1
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_grafico_restadistico_lib w_grafico_restadistico_lib

type variables
string param
end variables

on w_grafico_restadistico_lib.create
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_1=create rb_1
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.rb_5,&
this.rb_4,&
this.rb_3,&
this.rb_1,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_grafico_restadistico_lib.destroy
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_1)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;string c_fecha,fecha1,fecha2

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
fecha1 = '01/01/'+c_fecha
fecha2 = '31/12/'+c_fecha
if dw_1.retrieve(date(fecha1),date(fecha2),gi_parque_select) = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(w_grafico_restadistico_lib)
else
	if gi_parque_select = 1 then
		dw_1.object.titulo1.text = 'Resumen de Ventas Liberadores del año '+param
		dw_1.object.titulo.text = '( El Prado )'
		dw_1.Object.grafico_1.Title = 'Ventas Mensuales del año '+param+' Liberadores (El Prado)'
		dw_1.Object.grafico_2.Title = 'Liberadores Resciliados del año '+param+' (El Prado)'
		dw_1.Object.grafico_3.Title = 'Gráfico Comparativo del año '+param+' Liberadores (El Prado)'	
	elseif gi_parque_select = 102 then
		dw_1.object.titulo1.text = 'Resumen de Ventas Liberadores del año '+param
		dw_1.object.titulo.text = '( El Manatial )'
		dw_1.Object.grafico_1.Title = 'Ventas Mensuales del año '+param+' Liberadores (El Manatial)'
		dw_1.Object.grafico_2.Title = 'Liberadores Resciliados del año '+param+' (El Manatial)'
		dw_1.Object.grafico_3.Title = 'Gráfico Comparativo del año '+param+' Liberadores (El Manatial)'	
	elseif gi_parque_select = 11 then
		dw_1.object.titulo1.text = 'Resumen de Ventas Liberadores del año '+param
		dw_1.object.titulo.text = '( La Foresta )'
		dw_1.Object.grafico_1.Title = 'Ventas Mensuales del año '+param+' Liberadores (La Foresta)'
		dw_1.Object.grafico_2.Title = 'Liberadores Resciliados del año '+param+' (La Foresta)'
		dw_1.Object.grafico_3.Title = 'Gráfico Comparativo del año '+param+' Liberadores (La Foresta)'	
	elseif gi_parque_select = 801 then
		dw_1.object.titulo1.text = 'Resumen de Ventas Liberadores del año '+param
		dw_1.object.titulo.text = '( Concepción )'
		dw_1.Object.grafico_1.Title = 'Ventas Mensuales del año '+param+' Liberadores (Concepción)'
		dw_1.Object.grafico_2.Title = 'Liberadores Resciliados del año '+param+' (Concepción)'
		dw_1.Object.grafico_3.Title = 'Gráfico Comparativo del año '+param+' Liberadores (Concepción)'	
	end if
end if
fecha1  = ''
fecha2  = ''
c_fecha = ''
end event

type rb_5 from radiobutton within w_grafico_restadistico_lib
event clicked pbm_bnclicked
integer x = 1353
integer y = 2216
integer width = 466
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Comparativo"
end type

event clicked;if this.checked = true then
	dw_1.Object.grafico_1.SizeToDisplay = 0
	dw_1.Object.grafico_1.visible = 0
	dw_1.Object.grafico_2.SizeToDisplay = 0	
	dw_1.Object.grafico_2.visible = 0
	if gi_parque_select = 1 then
		dw_1.Object.grafico_1.Title =  'Gráfico Comparativo del año '+param+' Liberadores (El Prado)'
	elseif gi_parque_select = 102 then
		dw_1.Object.grafico_1.Title =  'Gráfico Comparativo del año '+param+' Liberadores (El Manatial)'
	elseif gi_parque_select = 11 then
		dw_1.Object.grafico_1.Title =  'Gráfico Comparativo del año '+param+' Liberadores (La Foresta)'
	elseif gi_parque_select = 801 then
		dw_1.Object.grafico_1.Title =  'Gráfico Comparativo del año '+param+' Liberadores (Concepción)'
	end if	
	dw_1.Object.grafico_3.SizeToDisplay = 1	
	dw_1.Object.grafico_3.visible = 1
end if
end event

type rb_4 from radiobutton within w_grafico_restadistico_lib
integer x = 1874
integer y = 2216
integer width = 293
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Todas"
end type

event clicked;if this.checked = true then
	dw_1.Object.grafico_1.SizeToDisplay = 0
	dw_1.Object.grafico_1.visible = 1
	dw_1.Object.grafico_2.SizeToDisplay = 0	
	dw_1.Object.grafico_2.visible = 1
	dw_1.Object.grafico_3.SizeToDisplay = 0	
	dw_1.Object.grafico_3.visible = 1
end if
end event

type rb_3 from radiobutton within w_grafico_restadistico_lib
integer x = 882
integer y = 2216
integer width = 443
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Resciliadas"
end type

event clicked;if this.checked = true then
	dw_1.Object.grafico_1.SizeToDisplay = 0
	dw_1.Object.grafico_1.visible = 0
	if gi_parque_select = 1 then
		dw_1.Object.grafico_1.Title = 'Liberadores Resciliados del año '+param+' (El Prado)'
	elseif gi_parque_select = 102 then
		dw_1.Object.grafico_1.Title = 'Liberadores Resciliados del año '+param+' (El Manatial)'
	elseif gi_parque_select = 11 then
		dw_1.Object.grafico_1.Title = 'Liberadores Resciliados del año '+param+' (La Foresta)'
	elseif gi_parque_select = 801 then
		dw_1.Object.grafico_1.Title = 'Liberadores Resciliados del año '+param+' (Concepción)'
	end if
	dw_1.Object.grafico_2.SizeToDisplay = 1	
	dw_1.Object.grafico_2.visible = 1
	dw_1.Object.grafico_3.SizeToDisplay = 0	
	dw_1.Object.grafico_3.visible = 0
end if
end event

type rb_1 from radiobutton within w_grafico_restadistico_lib
integer x = 535
integer y = 2216
integer width = 311
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Ventas"
end type

event clicked;if this.checked = true then
	if gi_parque_select = 1 then
		dw_1.Object.grafico_1.Title = 'Ventas Mensuales del año '+param+' Liberadores (El Prado)'
	elseif gi_parque_select = 102 then
		dw_1.Object.grafico_1.Title = 'Ventas Mensuales del año '+param+' Liberadores (El Manatial)'
	elseif gi_parque_select = 11 then
		dw_1.Object.grafico_1.Title = 'Ventas Mensuales del año '+param+' Liberadores (La Foresta)'
	elseif gi_parque_select = 801 then
		dw_1.Object.grafico_1.Title = 'Ventas Mensuales del año '+param+' Liberadores (Concepción)'
	end if
	dw_1.Object.grafico_1.SizeToDisplay = 1
	dw_1.Object.grafico_1.visible = 1
	dw_1.Object.grafico_2.SizeToDisplay = 0	
	dw_1.Object.grafico_2.visible = 0
	dw_1.Object.grafico_3.SizeToDisplay = 0	
	dw_1.Object.grafico_3.visible = 0
end if
end event

type dw_1 from datawindow within w_grafico_restadistico_lib
integer x = 46
integer y = 40
integer width = 3547
integer height = 2104
string dataobject = "dw_facturacion_anual_lib_grafico"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_grafico_restadistico_lib
integer x = 3287
integer y = 2196
integer width = 306
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_grafico_restadistico_lib)
end event

type cb_1 from commandbutton within w_grafico_restadistico_lib
integer x = 46
integer y = 2196
integer width = 306
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type gb_1 from groupbox within w_grafico_restadistico_lib
integer x = 494
integer y = 2156
integer width = 1705
integer height = 160
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

