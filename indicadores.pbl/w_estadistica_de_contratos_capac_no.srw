forward
global type w_estadistica_de_contratos_capac_no from window
end type
type cb_3 from commandbutton within w_estadistica_de_contratos_capac_no
end type
type cb_2 from commandbutton within w_estadistica_de_contratos_capac_no
end type
type cb_1 from commandbutton within w_estadistica_de_contratos_capac_no
end type
type dw_1 from datawindow within w_estadistica_de_contratos_capac_no
end type
end forward

global type w_estadistica_de_contratos_capac_no from window
integer x = 553
integer y = 260
integer width = 2711
integer height = 1648
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
global w_estadistica_de_contratos_capac_no w_estadistica_de_contratos_capac_no

type variables
string c_fecha
end variables

on w_estadistica_de_contratos_capac_no.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_estadistica_de_contratos_capac_no.destroy
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
if dw_1.retrieve() = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(w_estadistica_de_contratos_capac_no)
end if
dw_1.object.titulo.text = ' ( '+gs_empresa+' )'
end event

type cb_3 from commandbutton within w_estadistica_de_contratos_capac_no
integer x = 1975
integer y = 1412
integer width = 334
integer height = 104
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

type cb_2 from commandbutton within w_estadistica_de_contratos_capac_no
integer x = 2318
integer y = 1412
integer width = 334
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_estadistica_de_contratos_capac_no)
end event

type cb_1 from commandbutton within w_estadistica_de_contratos_capac_no
boolean visible = false
integer x = 46
integer y = 1412
integer width = 334
integer height = 104
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

type dw_1 from datawindow within w_estadistica_de_contratos_capac_no
integer x = 46
integer y = 40
integer width = 2606
integer height = 1328
string dataobject = "dw_cap_fall_no_asignadas"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

