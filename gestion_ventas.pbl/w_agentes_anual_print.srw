forward
global type w_agentes_anual_print from window
end type
type p_2 from picture within w_agentes_anual_print
end type
type pb_sigue from picturebutton within w_agentes_anual_print
end type
type p_3 from picture within w_agentes_anual_print
end type
type pb_antes from picturebutton within w_agentes_anual_print
end type
type st_registros from statictext within w_agentes_anual_print
end type
type p_7 from picture within w_agentes_anual_print
end type
type p_8 from picture within w_agentes_anual_print
end type
type dw_1 from uo_datawindow within w_agentes_anual_print
end type
type cb_2 from commandbutton within w_agentes_anual_print
end type
type cb_1 from commandbutton within w_agentes_anual_print
end type
end forward

global type w_agentes_anual_print from window
integer x = 832
integer y = 360
integer width = 3342
integer height = 2168
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
p_2 p_2
pb_sigue pb_sigue
p_3 p_3
pb_antes pb_antes
st_registros st_registros
p_7 p_7
p_8 p_8
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_agentes_anual_print w_agentes_anual_print

type variables
datawindow dw_paso
end variables

on w_agentes_anual_print.create
this.p_2=create p_2
this.pb_sigue=create pb_sigue
this.p_3=create p_3
this.pb_antes=create pb_antes
this.st_registros=create st_registros
this.p_7=create p_7
this.p_8=create p_8
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.p_2,&
this.pb_sigue,&
this.p_3,&
this.pb_antes,&
this.st_registros,&
this.p_7,&
this.p_8,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_agentes_anual_print.destroy
destroy(this.p_2)
destroy(this.pb_sigue)
destroy(this.p_3)
destroy(this.pb_antes)
destroy(this.st_registros)
destroy(this.p_7)
destroy(this.p_8)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string ls_cod
date fech,fecha
gf_centrar(w_agentes_anual_print)
title		= gs_app_name
ls_cod 	= Message.StringParm
dw_1.settransobject(sqlca)
fech 		= date(gd_fecha_inicio)
fecha 	= date(gd_fecha_fin)
if dw_1.retrieve(fech,fecha,ls_cod) = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(this)
end if	
dw_1.object.datawindow.print.Preview = true
st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
gs_ventana	= 'w_agentes_anual_print'
f_valida_objeto_1()
end event

type p_2 from picture within w_agentes_anual_print
event clicked pbm_bnclicked
integer x = 1083
integer y = 1952
integer width = 73
integer height = 60
string picturename = "c:antes.bmp"
boolean focusrectangle = false
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type pb_sigue from picturebutton within w_agentes_anual_print
event clicked pbm_bnclicked
integer x = 1074
integer y = 1936
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollPriorPage( )
st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type p_3 from picture within w_agentes_anual_print
event clicked pbm_bnclicked
integer x = 1184
integer y = 1952
integer width = 73
integer height = 60
string picturename = "c:sigue.bmp"
boolean focusrectangle = false
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type pb_antes from picturebutton within w_agentes_anual_print
event clicked pbm_bnclicked
integer x = 1175
integer y = 1936
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollNextPage( ) 
st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type st_registros from statictext within w_agentes_anual_print
integer x = 101
integer y = 1936
integer width = 955
integer height = 92
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type p_7 from picture within w_agentes_anual_print
event clicked pbm_bnclicked
integer x = 1079
integer y = 1940
integer width = 73
integer height = 60
string picturename = "c:\desarrollo\comisiones\antes.bmp"
boolean focusrectangle = false
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type p_8 from picture within w_agentes_anual_print
event clicked pbm_bnclicked
integer x = 1184
integer y = 1940
integer width = 73
integer height = 60
string picturename = "c:\desarrollo\comisiones\sigue.bmp"
boolean focusrectangle = false
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type dw_1 from uo_datawindow within w_agentes_anual_print
integer x = 101
integer y = 68
integer width = 3127
integer height = 1792
integer taborder = 10
string dataobject = "dw_premios_agentes_anual"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;call super::rowfocuschanged;dw_1.SelectRow(0, FALSE)
dw_1.SelectRow(getrow(), TRUE)
end event

event constructor;call super::constructor;MenuHabilitado = "1011001"
end event

type cb_2 from commandbutton within w_agentes_anual_print
integer x = 2839
integer y = 1928
integer width = 389
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_agentes_anual_print)
end event

type cb_1 from commandbutton within w_agentes_anual_print
integer x = 2441
integer y = 1928
integer width = 389
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount()>0 then
//	dw_1.object.datawindow.print.Preview = true
	f_Print( dw_1 )
//	dw_1.object.datawindow.print.Preview = false	
end if	
end event

