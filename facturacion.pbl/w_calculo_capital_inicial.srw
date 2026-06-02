forward
global type w_calculo_capital_inicial from window
end type
type cb_3 from commandbutton within w_calculo_capital_inicial
end type
type p_1 from picture within w_calculo_capital_inicial
end type
type em_fecha_cierre from editmask within w_calculo_capital_inicial
end type
type dw_2 from datawindow within w_calculo_capital_inicial
end type
type cb_2 from commandbutton within w_calculo_capital_inicial
end type
type cb_1 from commandbutton within w_calculo_capital_inicial
end type
type dw_1 from datawindow within w_calculo_capital_inicial
end type
end forward

global type w_calculo_capital_inicial from window
integer width = 2203
integer height = 1776
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_3 cb_3
p_1 p_1
em_fecha_cierre em_fecha_cierre
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_calculo_capital_inicial w_calculo_capital_inicial

type variables
datawindow dw_paso
end variables

event open;this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
select distinct sysdate into :gdt_tiempo_servidor from agentes;
em_fecha_cierre.text = string(date(gdt_tiempo_servidor),gs_formato_fecha)
this.title = 'Calculo de Interes, Capital y Gasto de Cobranza iniciales'

end event

on w_calculo_capital_inicial.create
this.cb_3=create cb_3
this.p_1=create p_1
this.em_fecha_cierre=create em_fecha_cierre
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.p_1,&
this.em_fecha_cierre,&
this.dw_2,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_calculo_capital_inicial.destroy
destroy(this.cb_3)
destroy(this.p_1)
destroy(this.em_fecha_cierre)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_3 from commandbutton within w_calculo_capital_inicial
integer x = 983
integer y = 1448
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;dw_paso = dw_2
if dw_1.rowcount() > 0 then
	f_DWToExcel( dw_paso )
//	dw_1.SaveAs("gr_computers", "C:/factura.xls",Excel!, TRUE)
end if

end event

type p_1 from picture within w_calculo_capital_inicial
integer x = 855
integer y = 1456
integer width = 82
integer height = 88
string picturename = "c:boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fecha_cierre.text)=-1 then 
	em_fecha_cierre.text=string(today(),gs_formato_fecha)
	em_fecha_cierre.setfocus()
	return
end if	
if em_fecha_cierre.text<>'00/00/0000' then
	ls_fecha = em_fecha_cierre.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_fecha_cierre.text = Message.StringParm
end if	
end event

type em_fecha_cierre from editmask within w_calculo_capital_inicial
integer x = 485
integer y = 1452
integer width = 361
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

event modified;//string fech
//long uf
//datetime fecha
//
//fech = em_fecha_cierre.text
//fecha = datetime(date(fech),time('23:59:59'))
//select valor_uf into :uf from tab_uf where fecha_uf=:fecha;
//CHOOSE CASE sqlca.sqlcode
//	case -1
//		messagebox(gs_app_name,sqlca.SQLErrText,information!)
//		RETURN
//	case 100	
//		messagebox(gs_app_name,'No existe valor de U.F. al dia '+em_fecha_cierre.text+'.~n~rFavor de avisar al administrador del sistemas',stopsign!)
//		RETURN
//END CHOOSE
end event

type dw_2 from datawindow within w_calculo_capital_inicial
integer x = 50
integer y = 64
integer width = 2034
integer height = 1352
integer taborder = 20
string title = "none"
string dataobject = "dw_exporta_capital_inicial"
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_calculo_capital_inicial
integer x = 1682
integer y = 1444
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_calculo_capital_inicial)
end event

type cb_1 from commandbutton within w_calculo_capital_inicial
integer x = 50
integer y = 1444
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Calcular"
end type

event clicked;integer i,nro_cuotas
double tasa,valor_cuota,uf_cierre,gc_inicial,capital_inicial,interes_inicial,GASTOS_ADM,pie_pag,facturado,precio,&
		 factor_gc,g_cobranza,periodo, gc_prueba
string moneda,base,serie
long numero
dw_1.settransobject(sqlca)
dw_2.reset()
if dw_1.retrieve(date(em_fecha_cierre.text)) > 0 then
	for i = 1 to dw_1.rowcount() 
		base		   = dw_1.getitemstring(i,'base')
		serie  		= dw_1.getitemstring(i,'serie')
		numero		= dw_1.getitemnumber(i,'numero')
		moneda		= dw_1.getitemstring(i,'pago_oferta_moneda')
		tasa			= dw_1.getitemnumber(i,'pago_oferta_tasa')
		valor_cuota	= dw_1.getitemnumber(i,'valor_cta')
		uf_cierre   = dw_1.getitemnumber(i,'factura_oferta_valor_uf')
		facturado   = dw_1.getitemnumber(i,'factura_oferta_facturado')
		gastos_adm  = dw_1.getitemnumber(i,'pago_oferta_gastos_adm')
		precio      = dw_1.getitemnumber(i,'pago_oferta_precio')
		pie_pag     = dw_1.getitemnumber(i,'factura_oferta_pie_pagado')
		nro_cuotas  = dw_1.getitemnumber(i,'plazo')
		periodo     = nro_cuotas
		factor_gc      = gastos_adm / nro_cuotas
		if gastos_adm  = 0 then  factor_gc  = 0
		g_cobranza     = nro_cuotas * factor_gc	
		if  tasa = 0 then
				gc_inicial         = 0
				interes_inicial    = 0
				if moneda = '2' then
					capital_inicial = precio * uf_cierre
				else
					capital_inicial = precio
				end if
			else
				if moneda = '2' then		
					gc_inicial      = g_cobranza * uf_cierre
					capital_inicial = f_vp( nro_cuotas, tasa, valor_cuota )
					capital_inicial = capital_inicial - gc_inicial 
					capital_inicial = capital_inicial + pie_pag
					interes_inicial = facturado - ( capital_inicial + gc_inicial )
				else
					gc_inicial      = g_cobranza
					capital_inicial = f_vp( nro_cuotas, tasa, valor_cuota)
					capital_inicial = capital_inicial - gc_inicial
					capital_inicial = capital_inicial + pie_pag 
					interes_inicial = facturado - ( capital_inicial + gc_inicial )
				end if
		end if
		dw_2.insertrow(0)
		dw_2.setitem(dw_2.rowcount(),'base',base)
		dw_2.setitem(dw_2.rowcount(),'serie',serie)
		dw_2.setitem(dw_2.rowcount(),'numero',numero)
		dw_2.setitem(dw_2.rowcount(),'capital_inicial',long(capital_inicial))
		dw_2.setitem(dw_2.rowcount(),'interes_inicial',long(interes_inicial))
		dw_2.setitem(dw_2.rowcount(),'gc_inicial',long(gc_inicial))
	next
end if
end event

type dw_1 from datawindow within w_calculo_capital_inicial
integer x = 2254
integer y = 336
integer width = 969
integer height = 692
integer taborder = 10
boolean titlebar = true
string title = "none"
string dataobject = "dw_calculo_inicial"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

