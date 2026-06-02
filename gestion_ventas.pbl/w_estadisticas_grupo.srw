forward
global type w_estadisticas_grupo from window
end type
type dw_parque from datawindow within w_estadisticas_grupo
end type
type st_1 from statictext within w_estadisticas_grupo
end type
type cb_1 from commandbutton within w_estadisticas_grupo
end type
type dw_1 from datawindow within w_estadisticas_grupo
end type
type cb_2 from commandbutton within w_estadisticas_grupo
end type
end forward

global type w_estadisticas_grupo from window
integer x = 5
integer y = 4
integer width = 3653
integer height = 2400
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
dw_parque dw_parque
st_1 st_1
cb_1 cb_1
dw_1 dw_1
cb_2 cb_2
end type
global w_estadisticas_grupo w_estadisticas_grupo

type variables
long pro,pro_ni,pro_nf,cons,tie
string titulo

end variables

on w_estadisticas_grupo.create
this.dw_parque=create dw_parque
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.cb_2=create cb_2
this.Control[]={this.dw_parque,&
this.st_1,&
this.cb_1,&
this.dw_1,&
this.cb_2}
end on

on w_estadisticas_grupo.destroy
destroy(this.dw_parque)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.cb_2)
end on

event open;this.title				= gs_app_name
gf_centrar(w_estadisticas_grupo)
gs_ventana				= 'w_estadisticas_grupo'
f_valida_objeto_1()
if isvalid(w_premios_ofertas_historica) then 
	dw_1.DataObject 	= "dw_estadisticas_gr_hist"
	titulo 				= 'Historicas'
end if
dw_1.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dw_parque.setfocus()
//pro    = dw_1.getitemnumber(1,'pro')
//pro_ni = dw_1.getitemnumber(1,'pro_ni')
//pro_nf = dw_1.getitemnumber(1,'pro_nf')
//cons   = dw_1.getitemnumber(1,'cons')
//tie    = dw_1.getitemnumber(1,'tie')
end event

type dw_parque from datawindow within w_estadisticas_grupo
integer x = 645
integer y = 2160
integer width = 727
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long	ll_cod_parque
dw_parque.accepttext()
ll_cod_parque	= dw_parque.getitemnumber(1,'parque')
if not isnull(ll_cod_parque) then
	if dw_1.retrieve(date(gd_fecha_inicio),date(gd_fecha_fin),ll_cod_parque) = 0 then
		messagebox(gs_app_name,'No existen datos.',stopsign!)
	else
		dw_1.object.datawindow.print.Preview = true
		dw_1.object.titulo.text = 'Estadisticas de Promesas por Grupo '+titulo+' ( '+gs_empresa+' )'
	end if	
end if
end event

type st_1 from statictext within w_estadisticas_grupo
integer x = 64
integer y = 2176
integer width = 571
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Parque"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_estadisticas_grupo
event clicked pbm_bnclicked
integer x = 2830
integer y = 2156
integer width = 357
integer height = 108
integer taborder = 30
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

type dw_1 from datawindow within w_estadisticas_grupo
integer x = 73
integer y = 64
integer width = 3483
integer height = 2048
integer taborder = 20
string dataobject = "dw_estadisticas_gr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_estadisticas_grupo
integer x = 3195
integer y = 2156
integer width = 357
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_estadisticas_grupo)
end event

