forward
global type w_mora_mantencion_anual_grafico from window
end type
type dw_1 from datawindow within w_mora_mantencion_anual_grafico
end type
type cb_2 from commandbutton within w_mora_mantencion_anual_grafico
end type
type cb_1 from commandbutton within w_mora_mantencion_anual_grafico
end type
end forward

global type w_mora_mantencion_anual_grafico from window
integer x = 73
integer y = 260
integer width = 3520
integer height = 1892
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_mora_mantencion_anual_grafico w_mora_mantencion_anual_grafico

type variables
datawindow	dw_paso
end variables

forward prototypes
public function string wf_numero_mes (integer numero)
end prototypes

public function string wf_numero_mes (integer numero);CHOOSE CASE NUMERO
	CASE 1
		RETURN 'Enero'
	CASE 2
		RETURN 'Febrero'
	CASE 3
		RETURN 'Marzo'
	CASE 4
		RETURN 'Abril'
	CASE 5
		RETURN 'Mayo'
	CASE 6
		RETURN 'Junio'
	CASE 7
		RETURN 'Julio'
	CASE 8
		RETURN 'Agosto'
	CASE 9
		RETURN 'Septiembre'
	CASE 10
		RETURN 'Octubre'
	CASE 11
		RETURN 'Noviembre'
	CASE 12
		RETURN 'Diciembre'
END CHOOSE

end function

on w_mora_mantencion_anual_grafico.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_mora_mantencion_anual_grafico.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;long valor,i

this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2

if dw_paso.rowcount() > 0 then
	for i = 1 to dw_paso.rowcount()
		valor = 0
		valor = 	valor + dw_paso.getitemnumber(i,3)+ dw_paso.getitemnumber(i,4)+&
					dw_paso.getitemnumber(i,5)+ dw_paso.getitemnumber(i,6)+&
					dw_paso.getitemnumber(i,7)
		if valor <= 0	then exit		
		dw_1.insertrow(0)
		dw_1.setitem(dw_1.rowcount(),2,valor)
		dw_1.setitem(dw_1.rowcount(),1,i)
		dw_1.accepttext ()
	next
end if
if gstr_param.tipo = 'Promesa' then
	if gi_parque_select = 1 then
		dw_1.Object.grafico_1.Title = 'Mora Anual Mantención de Promesas ( Año '+gstr_param.fecha_1+' ). '+'El Prado'
	elseif gi_parque_select = 102 then 
		dw_1.Object.grafico_1.Title = 'Mora Anual Mantención de Promesas ( Año '+gstr_param.fecha_1+' ). '+'El Manantial'
	elseif gi_parque_select = 11 then
		dw_1.Object.grafico_1.Title = 'Mora Anual Mantención de Promesas ( Año '+gstr_param.fecha_1+' ). '+'La Foresta'
	elseif gi_parque_select = 801 then
		dw_1.Object.grafico_1.Title = 'Mora Anual Mantención de Promesas ( Año '+gstr_param.fecha_1+' ). '+'Concepción'
	end if
	this.title = 'Mora Anual Mantención de Promesas ( Año '+gstr_param.fecha_1+' ).'
else
	if gi_parque_select = 1 then
		dw_1.Object.grafico_1.Title = 'Mora Anual Mantención de Contratos ISA ( Año '+gstr_param.fecha_1+' ). '+'El Prado'
	elseif gi_parque_select = 102 then 
		dw_1.Object.grafico_1.Title = 'Mora Anual Mantención de Contratos ISA ( Año '+gstr_param.fecha_1+' ). '+'El Manantial'
	elseif gi_parque_select = 11 then
		dw_1.Object.grafico_1.Title = 'Mora Anual Mantención de Contratos ISA ( Año '+gstr_param.fecha_1+' ). '+'La Foresta'
	elseif gi_parque_select = 801 then
		dw_1.Object.grafico_1.Title = 'Mora Anual Mantención de Contratos ISA ( Año '+gstr_param.fecha_1+' ). '+'Concepción'
	end if
	this.title = 'Mora Anual Mantención de Contratos ISA ( Año '+gstr_param.fecha_1+' ).'
end if
end event

type dw_1 from datawindow within w_mora_mantencion_anual_grafico
integer x = 41
integer y = 40
integer width = 3419
integer height = 1556
string dataobject = "dw_mora_mant_anual_grafico"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_mora_mantencion_anual_grafico
integer x = 3159
integer y = 1648
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

event clicked;close(w_mora_mantencion_anual_grafico)
end event

type cb_1 from commandbutton within w_mora_mantencion_anual_grafico
integer x = 50
integer y = 1648
integer width = 306
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() >0 then 
	f_Print( dw_1 )
end if
//dw_1.print()
end event

