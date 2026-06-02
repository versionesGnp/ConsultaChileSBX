forward
global type w_estadistica_fallecidos_total from window
end type
type cb_3 from commandbutton within w_estadistica_fallecidos_total
end type
type cb_2 from commandbutton within w_estadistica_fallecidos_total
end type
type cb_1 from commandbutton within w_estadistica_fallecidos_total
end type
type dw_1 from datawindow within w_estadistica_fallecidos_total
end type
end forward

global type w_estadistica_fallecidos_total from window
integer x = 553
integer y = 260
integer width = 3269
integer height = 1900
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
global w_estadistica_fallecidos_total w_estadistica_fallecidos_total

type variables
string c_fecha
end variables

on w_estadistica_fallecidos_total.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_estadistica_fallecidos_total.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;setpointer (HourGlass!)
this.x 								= ( gl_width - this.width)/2
this.y 								= ( gl_height - this.height)/2
this.title 							= gs_app_name
dw_1.settransobject(sqlca)
if dw_1.retrieve(gi_parque_select) = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(w_estadistica_fallecidos_total)
else
	if gi_parque_select = 1 then
		dw_1.object.titulo.text	= 'Resumen Histórico de Fallecidos ( El Prado )'
	elseif gi_parque_select = 102 then
		dw_1.object.titulo.text = 'Resumen Histórico de Fallecidos ( El Manantial )'
	elseif gi_parque_select = 11 then
		dw_1.object.titulo.text = 'Resumen Histórico de Fallecidos ( La Foresta )'
	end if
end if
setpointer (Arrow!)
end event

type cb_3 from commandbutton within w_estadistica_fallecidos_total
integer x = 2528
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

type cb_2 from commandbutton within w_estadistica_fallecidos_total
integer x = 2871
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

event clicked;close(w_estadistica_fallecidos_total)
end event

type cb_1 from commandbutton within w_estadistica_fallecidos_total
integer x = 46
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

event clicked;open(w_estadistica_fallecidos_grafico_total)
end event

type dw_1 from datawindow within w_estadistica_fallecidos_total
integer x = 46
integer y = 44
integer width = 3159
integer height = 1584
string dataobject = "dw_estadistica_fallecidos_total"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

