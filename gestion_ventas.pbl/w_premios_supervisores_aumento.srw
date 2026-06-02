forward
global type w_premios_supervisores_aumento from window
end type
type cb_ctacte from commandbutton within w_premios_supervisores_aumento
end type
type st_registros from statictext within w_premios_supervisores_aumento
end type
type pb_antes from picturebutton within w_premios_supervisores_aumento
end type
type pb_sigue from picturebutton within w_premios_supervisores_aumento
end type
type cb_2 from commandbutton within w_premios_supervisores_aumento
end type
type cb_1 from commandbutton within w_premios_supervisores_aumento
end type
type dw_1 from uo_datawindow within w_premios_supervisores_aumento
end type
end forward

global type w_premios_supervisores_aumento from window
integer x = 46
integer y = 288
integer width = 3611
integer height = 1980
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_ctacte cb_ctacte
st_registros st_registros
pb_antes pb_antes
pb_sigue pb_sigue
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_premios_supervisores_aumento w_premios_supervisores_aumento

type variables
datawindow dw_paso
end variables

on w_premios_supervisores_aumento.create
this.cb_ctacte=create cb_ctacte
this.st_registros=create st_registros
this.pb_antes=create pb_antes
this.pb_sigue=create pb_sigue
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_ctacte,&
this.st_registros,&
this.pb_antes,&
this.pb_sigue,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_premios_supervisores_aumento.destroy
destroy(this.cb_ctacte)
destroy(this.st_registros)
destroy(this.pb_antes)
destroy(this.pb_sigue)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;string	ls_cod,titulo
date 		ini,fin
Long		empresa

gf_centrar(w_premios_supervisores_aumento)
gs_ventana	= 'w_premios_supervisores_aumento'
f_valida_objeto2()
title					= gs_app_name+' (Aumento Capacidad)'
ls_cod 				= Message.StringParm
ini 					= date(gd_fecha_inicio)
fin 					= date(gd_fecha_fin)
dw_1.settransobject(sqlca)
if gs_conexion = "Parque El Prado" then
	empresa 			= 1
elseif gs_conexion = "Parque La Foresta" then
	empresa 			= 2
elseif gs_conexion = "Parque Concepción" then
	empresa 			= 3
end if
if isvalid(w_premios_aumento_capacidad_historica) then 
	dw_1.DataObject= "dw_periodo_33_aumento_hist_2"
	dw_1.settransobject(sqlca)
	titulo 			= 'Historicas'
end if
if dw_1.retrieve(ini,fin,trim(ls_cod),empresa) = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(this)
else	
	dw_1.object.titulo.text = 'Unidades de Aumento Capacidad por Supervisores '+titulo+' ( '+gs_empresa+' )'
	st_registros.text 		= ' '+dw_1.GetItemstring(1,'paginas')
end if	
end event

type cb_ctacte from commandbutton within w_premios_supervisores_aumento
event clicked pbm_bnclicked
integer x = 1678
integer y = 1732
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
	gi_numero = dw_1.getitemnumber(dw_1.getrow(),'anexo_aumento_nro_aumento')
	gi_tipo_busqueda = 8
	Open(w_listado_contratos)
end if
end event

type st_registros from statictext within w_premios_supervisores_aumento
integer x = 87
integer y = 1736
integer width = 814
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

type pb_antes from picturebutton within w_premios_supervisores_aumento
event clicked pbm_bnclicked
integer x = 1019
integer y = 1736
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
st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type pb_sigue from picturebutton within w_premios_supervisores_aumento
event clicked pbm_bnclicked
integer x = 914
integer y = 1736
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
st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type cb_2 from commandbutton within w_premios_supervisores_aumento
integer x = 3209
integer y = 1732
integer width = 306
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premios_supervisores_aumento)
end event

type cb_1 from commandbutton within w_premios_supervisores_aumento
integer x = 2894
integer y = 1732
integer width = 306
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
	f_Print( dw_1 )
end if	
end event

type dw_1 from uo_datawindow within w_premios_supervisores_aumento
integer x = 82
integer y = 60
integer width = 3433
integer height = 1624
integer taborder = 10
string dataobject = "dw_aumento_sup_periodo_33_2"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;call super::rowfocuschanged;if this.getrow() > 0 then
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(getrow(), TRUE)
	st_registros.text = ' '+dw_1.GetItemstring(this.getrow(),'paginas')
end if
end event

event constructor;call super::constructor;MenuHabilitado = "1011001"
end event

event clicked;call super::clicked;if row > 0 then
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(row, TRUE)
	st_registros.text = ' '+dw_1.GetItemstring(row,'paginas')
end if
end event

event doubleclicked;call super::doubleclicked;if row > 0 then cb_ctacte.triggerevent(clicked!)
end event

