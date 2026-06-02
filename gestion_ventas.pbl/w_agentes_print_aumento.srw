forward
global type w_agentes_print_aumento from window
end type
type cb_ctacte from commandbutton within w_agentes_print_aumento
end type
type pb_sigue from picturebutton within w_agentes_print_aumento
end type
type pb_antes from picturebutton within w_agentes_print_aumento
end type
type st_registros from statictext within w_agentes_print_aumento
end type
type p_7 from picture within w_agentes_print_aumento
end type
type p_8 from picture within w_agentes_print_aumento
end type
type dw_1 from uo_datawindow within w_agentes_print_aumento
end type
type cb_2 from commandbutton within w_agentes_print_aumento
end type
type cb_1 from commandbutton within w_agentes_print_aumento
end type
end forward

global type w_agentes_print_aumento from window
integer x = 110
integer y = 84
integer width = 3410
integer height = 2188
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_ctacte cb_ctacte
pb_sigue pb_sigue
pb_antes pb_antes
st_registros st_registros
p_7 p_7
p_8 p_8
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_agentes_print_aumento w_agentes_print_aumento

type variables
datawindow dw_paso
end variables

on w_agentes_print_aumento.create
this.cb_ctacte=create cb_ctacte
this.pb_sigue=create pb_sigue
this.pb_antes=create pb_antes
this.st_registros=create st_registros
this.p_7=create p_7
this.p_8=create p_8
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_ctacte,&
this.pb_sigue,&
this.pb_antes,&
this.st_registros,&
this.p_7,&
this.p_8,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_agentes_print_aumento.destroy
destroy(this.cb_ctacte)
destroy(this.pb_sigue)
destroy(this.pb_antes)
destroy(this.st_registros)
destroy(this.p_7)
destroy(this.p_8)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string 	ls_cod,titulo
integer 	empresa
date 		fech,fecha
gf_centrar(w_agentes_print_aumento)
gs_ventana						= 'w_agentes_print_aumento'
f_valida_objeto_1()
title								= gs_app_name
ls_cod 							= Message.StringParm
dw_1.settransobject(sqlca)
fech 								= date(gd_fecha_inicio)
fecha 							= date(gd_fecha_fin)
if gs_conexion = "Parque El Prado" then
	empresa 		= 1
elseif gs_conexion = "Parque La Foresta" then
	empresa 		= 2
elseif gs_conexion = "Parque Concepción" then
	empresa 		= 3
end if
if isvalid(w_premios_aumento_capacidad_historica) then //w_premios_capacidad_historica
	dw_1.DataObject 			= "dw_ofertas_periodo_33_aumento_hist_2"
	dw_1.settransobject(sqlca)
	titulo 						= 'Historicas'
end if
if dw_1.retrieve(fech,fecha,trim(ls_cod),empresa) = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(this)
else
	dw_1.object.titulo.text	= 'Unidades de Aumento Capacidad por Agentes '+titulo+' ( '+gs_empresa+' )'
	st_registros.text 		= ' '+dw_1.GetItemstring(1,'paginas')
end if
end event

type cb_ctacte from commandbutton within w_agentes_print_aumento
event clicked pbm_bnclicked
integer x = 1605
integer y = 1928
integer width = 526
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consulta C&ta.Cte."
end type

event clicked;string tipo
string esta
if dw_1.getrow() > 0 then
	gi_numero = dw_1.getitemnumber(dw_1.getrow(),'anexo_aumento_nro_aumento')
	gi_tipo_busqueda = 8
	Open(w_listado_contratos)
end if
end event

type pb_sigue from picturebutton within w_agentes_print_aumento
event clicked pbm_bnclicked
integer x = 965
integer y = 1936
integer width = 110
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollPriorPage( )
st_registros.text = ' '+dw_1.GetItemstring(dw_1.getrow(),'paginas')
end event

type pb_antes from picturebutton within w_agentes_print_aumento
event clicked pbm_bnclicked
integer x = 1074
integer y = 1936
integer width = 110
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollNextPage( ) 
st_registros.text = ' '+dw_1.GetItemstring(dw_1.getrow(),'paginas')
end event

type st_registros from statictext within w_agentes_print_aumento
integer x = 87
integer y = 1936
integer width = 859
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

type p_7 from picture within w_agentes_print_aumento
event clicked pbm_bnclicked
integer x = 965
integer y = 1940
integer width = 73
integer height = 60
string picturename = "c:\desarrollo\comisiones\antes.bmp"
boolean focusrectangle = false
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type p_8 from picture within w_agentes_print_aumento
event clicked pbm_bnclicked
integer x = 1070
integer y = 1940
integer width = 73
integer height = 60
string picturename = "c:\desarrollo\comisiones\sigue.bmp"
boolean focusrectangle = false
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type dw_1 from uo_datawindow within w_agentes_print_aumento
integer x = 87
integer y = 72
integer width = 3241
integer height = 1792
integer taborder = 10
string dataobject = "dw_aumento_periodo_33_sup_2"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;call super::rowfocuschanged;if this.getrow() > 0 then
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(this.getrow(), TRUE)
	st_registros.text = ' '+dw_1.GetItemstring(dw_1.getrow(),'paginas')
end if
end event

event constructor;call super::constructor;MenuHabilitado = "1011001"
end event

event doubleclicked;call super::doubleclicked;if this.getrow() > 0 then cb_ctacte.triggerevent(clicked!)
end event

event clicked;call super::clicked;if row > 0 then
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(row, TRUE)
	st_registros.text = ' '+dw_1.GetItemstring(row,'paginas')
end if
end event

type cb_2 from commandbutton within w_agentes_print_aumento
integer x = 2939
integer y = 1928
integer width = 389
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_agentes_print_aumento)
end event

type cb_1 from commandbutton within w_agentes_print_aumento
integer x = 2542
integer y = 1928
integer width = 389
integer height = 96
integer taborder = 30
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

