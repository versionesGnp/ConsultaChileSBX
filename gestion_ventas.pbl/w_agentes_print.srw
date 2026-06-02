forward
global type w_agentes_print from window
end type
type pb_sigue from picturebutton within w_agentes_print
end type
type pb_antes from picturebutton within w_agentes_print
end type
type cb_ctacte from commandbutton within w_agentes_print
end type
type st_registros from statictext within w_agentes_print
end type
type dw_1 from uo_datawindow within w_agentes_print
end type
type cb_2 from commandbutton within w_agentes_print
end type
type cb_1 from commandbutton within w_agentes_print
end type
end forward

global type w_agentes_print from window
integer x = 110
integer y = 84
integer width = 3433
integer height = 2180
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
pb_sigue pb_sigue
pb_antes pb_antes
cb_ctacte cb_ctacte
st_registros st_registros
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_agentes_print w_agentes_print

type variables
datawindow dw_paso
end variables

on w_agentes_print.create
this.pb_sigue=create pb_sigue
this.pb_antes=create pb_antes
this.cb_ctacte=create cb_ctacte
this.st_registros=create st_registros
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.pb_sigue,&
this.pb_antes,&
this.cb_ctacte,&
this.st_registros,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_agentes_print.destroy
destroy(this.pb_sigue)
destroy(this.pb_antes)
destroy(this.cb_ctacte)
destroy(this.st_registros)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string 	ls_cod,titulo
integer 	empresa
date 		fech,fecha
gf_centrar(w_agentes_print)
gs_ventana						= 'w_agentes_print'
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
if isvalid(w_premios_ofertas_historica) then 
	dw_1.DataObject 			= "dw_ofertas_periodo_33_hist_2"
	dw_1.settransobject(sqlca)
	titulo 						= 'Historicas'
end if
if dw_1.retrieve(fech,fecha,ls_cod,empresa) = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(this)
else
	dw_1.object.titulo.text = 'Unidades de Promesas por Agentes '+titulo+' ( '+gs_empresa+' )'
	st_registros.text			= ' '+DW_1.GetItemstring(1,'paginas')
end if
end event

type pb_sigue from picturebutton within w_agentes_print
integer x = 896
integer y = 1932
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

type pb_antes from picturebutton within w_agentes_print
integer x = 1006
integer y = 1932
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

type cb_ctacte from commandbutton within w_agentes_print
event clicked pbm_bnclicked
integer x = 1605
integer y = 1928
integer width = 526
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consulta C&ta.Cte."
end type

event clicked;string tipo
string esta
if dw_1.getrow() > 0 then
	gi_numero = dw_1.getitemnumber(dw_1.getrow(),'oferta_v_nro_oferta')
	gi_tipo_busqueda = 8
	Open(w_listado_contratos)
end if
end event

type st_registros from statictext within w_agentes_print
integer x = 87
integer y = 1932
integer width = 795
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

type dw_1 from uo_datawindow within w_agentes_print
integer x = 91
integer y = 76
integer width = 3241
integer height = 1792
integer taborder = 10
string dataobject = "dw_ofertas_periodo_33_2"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;call super::rowfocuschanged;if this.getrow() > 0 then
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(getrow(), TRUE)
	st_registros.text = ' '+dw_1.GetItemstring(dw_1.getrow(),'paginas')
end if
end event

event constructor;call super::constructor;MenuHabilitado = "1011001"
end event

event doubleclicked;call super::doubleclicked;if this.getrow() > 0 then cb_ctacte.triggerevent(clicked!)
end event

type cb_2 from commandbutton within w_agentes_print
integer x = 3008
integer y = 1928
integer width = 325
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_agentes_print)
end event

type cb_1 from commandbutton within w_agentes_print
integer x = 2679
integer y = 1928
integer width = 325
integer height = 96
integer taborder = 30
integer textsize = -9
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

