forward
global type w_resumen_canal from window
end type
type p_8 from picture within w_resumen_canal
end type
type p_7 from picture within w_resumen_canal
end type
type st_registros from statictext within w_resumen_canal
end type
type pb_antes from picturebutton within w_resumen_canal
end type
type p_3 from picture within w_resumen_canal
end type
type pb_sigue from picturebutton within w_resumen_canal
end type
type p_2 from picture within w_resumen_canal
end type
type cb_2 from commandbutton within w_resumen_canal
end type
type cb_1 from commandbutton within w_resumen_canal
end type
type dw_1 from uo_datawindow within w_resumen_canal
end type
end forward

global type w_resumen_canal from window
integer x = 832
integer y = 360
integer width = 3360
integer height = 1968
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
p_8 p_8
p_7 p_7
st_registros st_registros
pb_antes pb_antes
p_3 p_3
pb_sigue pb_sigue
p_2 p_2
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_resumen_canal w_resumen_canal

type variables
datawindow dw_paso
end variables

on w_resumen_canal.create
this.p_8=create p_8
this.p_7=create p_7
this.st_registros=create st_registros
this.pb_antes=create pb_antes
this.p_3=create p_3
this.pb_sigue=create pb_sigue
this.p_2=create p_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.p_8,&
this.p_7,&
this.st_registros,&
this.pb_antes,&
this.p_3,&
this.pb_sigue,&
this.p_2,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_resumen_canal.destroy
destroy(this.p_8)
destroy(this.p_7)
destroy(this.st_registros)
destroy(this.pb_antes)
destroy(this.p_3)
destroy(this.pb_sigue)
destroy(this.p_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;string ls_cod,titulo

gf_centrar(w_resumen_canal)
gs_ventana	= 'w_resumen_canal'
f_valida_objeto2()
title		= gs_app_name
ls_cod 	= Message.StringParm
dw_1.settransobject(sqlca)
if isvalid(w_premios_ofertas_historica) then 
	dw_1.Object.rpt_1.DataObject 	= "dw_ofertas_periodo_5_hist"
	titulo 								= 'Historicas'
end if
if dw_1.retrieve(date(gd_fecha_inicio),date(gd_fecha_fin),ls_cod) = 0 then
	messagebox(gs_app_name,'No existen datos',stopsign!)
	close(this)
else	
	dw_1.object.titulo.text 					= 'Resumen de Promesas por Supervisores '+titulo+' ( '+gs_empresa+' )'
	dw_1.object.datawindow.print.Preview 	= true
	st_registros.text 							= ' '+DW_1.GetItemstring(1,'paginas')
end if	
end event

type p_8 from picture within w_resumen_canal
event clicked pbm_bnclicked
integer x = 1166
integer y = 1752
integer width = 73
integer height = 60
string picturename = "sigue.bmp"
boolean focusrectangle = false
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type p_7 from picture within w_resumen_canal
event clicked pbm_bnclicked
integer x = 1061
integer y = 1752
integer width = 73
integer height = 60
string picturename = "antes.bmp"
boolean focusrectangle = false
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type st_registros from statictext within w_resumen_canal
integer x = 82
integer y = 1736
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

type pb_antes from picturebutton within w_resumen_canal
event clicked pbm_bnclicked
integer x = 1157
integer y = 1736
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

type p_3 from picture within w_resumen_canal
event clicked pbm_bnclicked
integer x = 1166
integer y = 1752
integer width = 73
integer height = 60
string picturename = "c:\desarrollo\comisiones\sigue.bmp"
boolean focusrectangle = false
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type pb_sigue from picturebutton within w_resumen_canal
event clicked pbm_bnclicked
integer x = 1056
integer y = 1736
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

type p_2 from picture within w_resumen_canal
event clicked pbm_bnclicked
integer x = 1065
integer y = 1752
integer width = 73
integer height = 60
string picturename = "c:\desarrollo\comisiones\antes.bmp"
boolean focusrectangle = false
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type cb_2 from commandbutton within w_resumen_canal
integer x = 2939
integer y = 1728
integer width = 306
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_resumen_canal)
end event

type cb_1 from commandbutton within w_resumen_canal
integer x = 2624
integer y = 1728
integer width = 306
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
	f_Print( dw_1 )
end if	
end event

type dw_1 from uo_datawindow within w_resumen_canal
integer x = 82
integer y = 60
integer width = 3159
integer height = 1624
integer taborder = 10
string dataobject = "dw_premios_supervisores_1"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;call super::rowfocuschanged;dw_1.SelectRow(0, FALSE)
dw_1.SelectRow(getrow(), TRUE)
end event

event constructor;call super::constructor;MenuHabilitado = "1111101"
end event

