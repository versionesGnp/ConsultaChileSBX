forward
global type w_estadistica_fallecidos from window
end type
type cb_3 from commandbutton within w_estadistica_fallecidos
end type
type cb_2 from commandbutton within w_estadistica_fallecidos
end type
type cb_1 from commandbutton within w_estadistica_fallecidos
end type
type dw_1 from datawindow within w_estadistica_fallecidos
end type
end forward

global type w_estadistica_fallecidos from window
integer x = 553
integer y = 260
integer width = 3250
integer height = 1908
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_estadistica_fallecidos w_estadistica_fallecidos

type variables
string c_fecha
end variables

on w_estadistica_fallecidos.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_estadistica_fallecidos.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;string fecha1,fecha2
setpointer (HourGlass!)
this.x 		= ( gl_width - this.width)/2
this.y 		= ( gl_height - this.height)/2
this.title 	= gs_app_name
dw_1.settransobject(sqlca)

c_fecha 		= Message.StringParm
fecha1 		= '01/01/'+c_fecha
fecha2 		= '31/12/'+c_fecha
if dw_1.retrieve(date(fecha1),date(fecha2),gi_parque_select) = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(w_estadistica_fallecidos)
else
	if gi_parque_select = 1 then
		dw_1.object.titulo.text = 'Fallecidos del periodo '+c_fecha+' ( El Prado )'
	elseif gi_parque_select = 102 then
		dw_1.object.titulo.text = 'Fallecidos del periodo '+c_fecha+' ( El Manantial )'
	elseif gi_parque_select = 11 then
		dw_1.object.titulo.text = 'Fallecidos del periodo '+c_fecha+' ( La Foresta )'
	elseif gi_parque_select = 801 then
		dw_1.object.titulo.text = 'Fallecidos del periodo '+c_fecha+' ( Concepción )'
	end if
end if


end event

type cb_3 from commandbutton within w_estadistica_fallecidos
integer x = 2510
integer y = 1668
integer width = 334
integer height = 108
integer taborder = 20
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

type cb_2 from commandbutton within w_estadistica_fallecidos
integer x = 2853
integer y = 1668
integer width = 334
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

event clicked;close(w_estadistica_fallecidos)
end event

type cb_1 from commandbutton within w_estadistica_fallecidos
integer x = 50
integer y = 1668
integer width = 334
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Gráfico"
end type

event clicked;OpenWithParm(w_estadistica_fallecidos_grafico,c_fecha)
end event

type dw_1 from datawindow within w_estadistica_fallecidos
integer x = 50
integer y = 44
integer width = 3136
integer height = 1580
string dataobject = "dw_estadistica_fallecidos"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

