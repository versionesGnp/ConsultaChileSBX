forward
global type w_grafico_mora from window
end type
type dw_1 from datawindow within w_grafico_mora
end type
type cb_2 from commandbutton within w_grafico_mora
end type
type cb_1 from commandbutton within w_grafico_mora
end type
end forward

global type w_grafico_mora from window
integer x = 5
integer y = 4
integer width = 3657
integer height = 2432
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_grafico_mora w_grafico_mora

type variables
string param
end variables

on w_grafico_mora.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_grafico_mora.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string c_fecha,fecha1,fecha2

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
	if gi_parque_select = 1 then
		dw_1.Object.grafico_1.Title = 'Promesas en Mora año '+param+'~r~n~r~n~r~n'+'( El Prado )'
	elseif gi_parque_select = 102 then
		dw_1.Object.grafico_1.Title = 'Promesas en Mora año '+param+'~r~n~r~n~r~n'+'( El Manantial )'
	elseif gi_parque_select = 11 then
		dw_1.Object.grafico_1.Title = 'Promesas en Mora año '+param+'~r~n~r~n~r~n'+'( La Foresta )'
	elseif gi_parque_select = 801 then
		dw_1.Object.grafico_1.Title = 'Promesas en Mora año '+param+'~r~n~r~n~r~n'+'( Concepción )'
	end if

end if
end event

type dw_1 from datawindow within w_grafico_mora
integer x = 46
integer y = 40
integer width = 3557
integer height = 2120
string dataobject = "dw_mora_estadistica_grafico1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_grafico_mora
integer x = 46
integer y = 2200
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

type cb_1 from commandbutton within w_grafico_mora
integer x = 3296
integer y = 2200
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

event clicked;close(w_grafico_mora)
end event

