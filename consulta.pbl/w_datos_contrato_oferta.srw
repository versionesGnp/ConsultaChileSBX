forward
global type w_datos_contrato_oferta from window
end type
type cb_desarrollo from commandbutton within w_datos_contrato_oferta
end type
type dw_seguro from datawindow within w_datos_contrato_oferta
end type
type st_1 from statictext within w_datos_contrato_oferta
end type
type cb_cerrar from commandbutton within w_datos_contrato_oferta
end type
type dw_datos_contrato_oferta from datawindow within w_datos_contrato_oferta
end type
type ln_1 from line within w_datos_contrato_oferta
end type
type ln_2 from line within w_datos_contrato_oferta
end type
end forward

global type w_datos_contrato_oferta from window
integer x = 1298
integer y = 1136
integer width = 3415
integer height = 2164
boolean titlebar = true
string title = "Listado de Promesa"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_desarrollo cb_desarrollo
dw_seguro dw_seguro
st_1 st_1
cb_cerrar cb_cerrar
dw_datos_contrato_oferta dw_datos_contrato_oferta
ln_1 ln_1
ln_2 ln_2
end type
global w_datos_contrato_oferta w_datos_contrato_oferta

on w_datos_contrato_oferta.create
this.cb_desarrollo=create cb_desarrollo
this.dw_seguro=create dw_seguro
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_datos_contrato_oferta=create dw_datos_contrato_oferta
this.ln_1=create ln_1
this.ln_2=create ln_2
this.Control[]={this.cb_desarrollo,&
this.dw_seguro,&
this.st_1,&
this.cb_cerrar,&
this.dw_datos_contrato_oferta,&
this.ln_1,&
this.ln_2}
end on

on w_datos_contrato_oferta.destroy
destroy(this.cb_desarrollo)
destroy(this.dw_seguro)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_datos_contrato_oferta)
destroy(this.ln_1)
destroy(this.ln_2)
end on

event open;Long		ll_cod_parque

gf_centrar(w_datos_contrato_oferta)
if gs_base='O' then
	st_1.text				= 'Datos de Promesa'
elseif gs_base='U' then
	st_1.text				= 'Datos de Columbario'
end if
dw_datos_contrato_oferta.SetTransObject(SQLCA)

dw_datos_contrato_oferta.getchild('pago_oferta_codigo_tipo_seguro',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.retrieve(1,gs_base)
if idw_detalle2.rowcount()=0 then
	idw_detalle2.insertrow(0)
end if
dw_datos_contrato_oferta.Retrieve(gs_serie,gi_numero)
ll_cod_parque		= dw_datos_contrato_oferta.getitemnumber(1,'cadena_cod_parque')
idw_detalle2.retrieve(ll_cod_parque,gs_base)
dw_seguro.SetTransObject(SQLCA)
dw_seguro.retrieve(gs_base,gs_serie, gi_numero)
end event

event close;if isvalid(w_plano_sector_parque) then w_plano_sector_parque.dw_plano_sector_parque.enabled	= true
end event

type cb_desarrollo from commandbutton within w_datos_contrato_oferta
integer x = 50
integer y = 1940
integer width = 544
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ver Desarrollo Cuota"
end type

event clicked;if isvalid(w_consultar_desarrollo_credito_sap) then close(w_consultar_desarrollo_credito_sap)
open(w_consultar_desarrollo_credito_sap)
end event

type dw_seguro from datawindow within w_datos_contrato_oferta
integer x = 2341
integer y = 140
integer width = 1019
integer height = 1756
integer taborder = 20
string title = "none"
string dataobject = "dw_listado_seguros_asoc_retrieve"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_datos_contrato_oferta
integer x = 46
integer y = 20
integer width = 1312
integer height = 80
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos de Promesa"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_datos_contrato_oferta
integer x = 3031
integer y = 1940
integer width = 334
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_datos_contrato_oferta)
end event

type dw_datos_contrato_oferta from datawindow within w_datos_contrato_oferta
integer x = 27
integer y = 124
integer width = 2231
integer height = 1824
integer taborder = 10
string dataobject = "d_datos_contrato_oferta"
boolean border = false
boolean livescroll = true
end type

type ln_1 from line within w_datos_contrato_oferta
long linecolor = 8421504
integer linethickness = 4
integer beginx = 2286
integer beginy = 116
integer endx = 2286
integer endy = 1944
end type

type ln_2 from line within w_datos_contrato_oferta
long linecolor = 16777215
integer linethickness = 4
integer beginx = 2290
integer beginy = 116
integer endx = 2290
integer endy = 1944
end type

