forward
global type w_estadistica_fallecidos_grafico_total from window
end type
type rb_3 from radiobutton within w_estadistica_fallecidos_grafico_total
end type
type rb_2 from radiobutton within w_estadistica_fallecidos_grafico_total
end type
type rb_1 from radiobutton within w_estadistica_fallecidos_grafico_total
end type
type cb_1 from commandbutton within w_estadistica_fallecidos_grafico_total
end type
type cb_2 from commandbutton within w_estadistica_fallecidos_grafico_total
end type
type dw_1 from datawindow within w_estadistica_fallecidos_grafico_total
end type
type gb_1 from groupbox within w_estadistica_fallecidos_grafico_total
end type
end forward

global type w_estadistica_fallecidos_grafico_total from window
integer x = 5
integer y = 4
integer width = 3616
integer height = 2416
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cb_1 cb_1
cb_2 cb_2
dw_1 dw_1
gb_1 gb_1
end type
global w_estadistica_fallecidos_grafico_total w_estadistica_fallecidos_grafico_total

type variables
string c_fecha
end variables

on w_estadistica_fallecidos_grafico_total.create
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.rb_3,&
this.rb_2,&
this.rb_1,&
this.cb_1,&
this.cb_2,&
this.dw_1,&
this.gb_1}
end on

on w_estadistica_fallecidos_grafico_total.destroy
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;string fecha1,fecha2

this.x 		= ( gl_width - this.width)/2
this.y 		= ( gl_height - this.height)/2
this.title 	= gs_app_name
dw_1.settransobject(sqlca)

c_fecha		= Message.StringParm
fecha1 		= '01/01/'+c_fecha
fecha2 		= '31/12/'+c_fecha
if dw_1.retrieve(gi_parque_select ) = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(w_estadistica_fallecidos_grafico_total)
else
	if gi_parque_select = 1 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( El Prado )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( El Prado )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	elseif gi_parque_select = 102 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( El Manantial )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( El Manantial )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	elseif gi_parque_select = 11 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( La Foresta )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( La Foresta )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	elseif gi_parque_select = 801 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( Concepción )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( Concepción )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	end if
end if
end event

type rb_3 from radiobutton within w_estadistica_fallecidos_grafico_total
event clicked pbm_bnclicked
integer x = 1600
integer y = 2184
integer width = 279
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Todos"
boolean checked = true
end type

event clicked;if this.checked = true then
	dw_1.Object.grafico1.SizeToDisplay	= 0
	dw_1.Object.grafico1.visible 			= 1
	dw_1.Object.grafico2.SizeToDisplay 	= 0
	dw_1.Object.grafico2.visible 			= 1
	
	if gi_parque_select = 1 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( El Prado )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( El Prado )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	elseif gi_parque_select = 102 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( El Manantial )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( El Manantial )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	elseif gi_parque_select = 11 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( La Foresta )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( La Foresta )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	elseif gi_parque_select = 801 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( Concepción )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( Concepción )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	end if
end if
end event

type rb_2 from radiobutton within w_estadistica_fallecidos_grafico_total
integer x = 1088
integer y = 2184
integer width = 462
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Fallecidos"
end type

event clicked;if this.checked = true then
	dw_1.Object.grafico1.SizeToDisplay	= 0
	dw_1.Object.grafico1.visible 			= 0
	dw_1.Object.grafico2.SizeToDisplay 	= 1
	dw_1.Object.grafico2.visible 			= 1
	if gi_parque_select = 1 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( El Prado )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( El Prado )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	elseif gi_parque_select = 102 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( El Manantial )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( El Manantial )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	elseif gi_parque_select = 11 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( La Foresta )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( La Foresta )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	elseif gi_parque_select = 801 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( Concepción )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( Concepción )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	end if
end if
end event

type rb_1 from radiobutton within w_estadistica_fallecidos_grafico_total
integer x = 526
integer y = 2184
integer width = 489
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
	dw_1.Object.grafico1.SizeToDisplay 	= 1
	dw_1.Object.grafico1.visible 			= 1
	dw_1.Object.grafico2.SizeToDisplay 	= 0
	dw_1.Object.grafico2.visible 			= 0
	if gi_parque_select = 1 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( El Prado )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( El Prado )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	elseif gi_parque_select = 102 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( El Manantial )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( El Manantial )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	elseif gi_parque_select = 11 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( La Foresta )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( La Foresta )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	elseif gi_parque_select = 801 then
		dw_1.Object.grafico2.Title = 'Gráfico Comparativo Historico~r~n~r~n'+'( Concepción )'	
		dw_1.Object.grafico1.Title = 'Gráfico Historico de Fallecidos (Tierra/Const.) '+'~r~n~r~n'+'( Concepción )'
		dw_1.Object.titulo.text 	= 'Gráficos Historico de Fallecidos'
	end if
	
end if
end event

type cb_1 from commandbutton within w_estadistica_fallecidos_grafico_total
integer x = 55
integer y = 2164
integer width = 334
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

event clicked;//if dw_1.rowcount() > 0 then
//	f_printdlg(dw_1,gstr_print,parent)
//end if

if dw_1.rowcount() > 0 then
	IF PrintSetup( ) <> -1 THEN
		dw_1.object.datawindow.print.Preview = true
		dw_1.Print()
		dw_1.object.datawindow.print.Preview = false
	END IF
end if
end event

type cb_2 from commandbutton within w_estadistica_fallecidos_grafico_total
integer x = 3209
integer y = 2164
integer width = 334
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

event clicked;close(w_estadistica_fallecidos_grafico_total)
end event

type dw_1 from datawindow within w_estadistica_fallecidos_grafico_total
integer x = 41
integer y = 44
integer width = 3506
integer height = 2072
string dataobject = "dw_estadistica_fallecidos_grafico_total"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_estadistica_fallecidos_grafico_total
integer x = 485
integer y = 2120
integer width = 1495
integer height = 172
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

