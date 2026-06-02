forward
global type w_datos_contrato_funeraria from window
end type
type cb_orden from commandbutton within w_datos_contrato_funeraria
end type
type dw_orden from datawindow within w_datos_contrato_funeraria
end type
type dw_detalle_servicio from datawindow within w_datos_contrato_funeraria
end type
type dw_seguro from datawindow within w_datos_contrato_funeraria
end type
type st_1 from statictext within w_datos_contrato_funeraria
end type
type dw_datos_contrato from datawindow within w_datos_contrato_funeraria
end type
type cb_cerrar from commandbutton within w_datos_contrato_funeraria
end type
type ln_1 from line within w_datos_contrato_funeraria
end type
type ln_2 from line within w_datos_contrato_funeraria
end type
end forward

global type w_datos_contrato_funeraria from window
integer x = 1637
integer y = 1048
integer width = 3351
integer height = 1724
boolean titlebar = true
string title = "Datos Contrato"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_orden cb_orden
dw_orden dw_orden
dw_detalle_servicio dw_detalle_servicio
dw_seguro dw_seguro
st_1 st_1
dw_datos_contrato dw_datos_contrato
cb_cerrar cb_cerrar
ln_1 ln_1
ln_2 ln_2
end type
global w_datos_contrato_funeraria w_datos_contrato_funeraria

on w_datos_contrato_funeraria.create
this.cb_orden=create cb_orden
this.dw_orden=create dw_orden
this.dw_detalle_servicio=create dw_detalle_servicio
this.dw_seguro=create dw_seguro
this.st_1=create st_1
this.dw_datos_contrato=create dw_datos_contrato
this.cb_cerrar=create cb_cerrar
this.ln_1=create ln_1
this.ln_2=create ln_2
this.Control[]={this.cb_orden,&
this.dw_orden,&
this.dw_detalle_servicio,&
this.dw_seguro,&
this.st_1,&
this.dw_datos_contrato,&
this.cb_cerrar,&
this.ln_1,&
this.ln_2}
end on

on w_datos_contrato_funeraria.destroy
destroy(this.cb_orden)
destroy(this.dw_orden)
destroy(this.dw_detalle_servicio)
destroy(this.dw_seguro)
destroy(this.st_1)
destroy(this.dw_datos_contrato)
destroy(this.cb_cerrar)
destroy(this.ln_1)
destroy(this.ln_2)
end on

event open;gf_centrar(w_datos_contrato_funeraria)
dw_datos_contrato.SetTransObject(SQLCA)
dw_datos_contrato.Retrieve(gs_serie, gi_numero,gs_base)
dw_seguro.SetTransObject(SQLCA)
dw_seguro.retrieve(gs_base,gs_serie, gi_numero)
if gs_base='V' then
	dw_detalle_servicio.dataobject		= 'dw_detalle_ctto_servico_vs_ctto_origen'
else
	dw_detalle_servicio.dataobject		= 'dw_detalle_ctto_origen_vs_ctto_servico'
end if
dw_detalle_servicio.settransobject(sqlca)
dw_detalle_servicio.retrieve(gs_base,gs_serie,gi_numero)

end event

type cb_orden from commandbutton within w_datos_contrato_funeraria
integer x = 1399
integer y = 1496
integer width = 443
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir Orden"
end type

event clicked;string		ls_base,ls_serie
long		ll_row,ll_rut,ll_tot_reg
double 	ldb_numero

if dw_datos_contrato.rowcount()>0 then
	ls_base			= gs_base
	ls_serie			= gs_serie
	ldb_numero		= gi_numero
//	if gs_base='F' or gs_base='G' or gs_base='V' then
		dw_orden.dataobject		= 'dwe_imprimir_orden_venta_funeraria'
		dw_orden.settransobject(sqlca)
//	else
//		dw_orden.dataobject		= 'dwe_imprimir_orden_venta'
//	end if
	ll_rut				= dw_datos_contrato.getitemnumber(1,'producto_anexo_rut')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
		ll_tot_reg		= dw_orden.retrieve(ll_rut,ls_base,ls_serie,ldb_numero)
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registar Datos para Imprimir")
		else
			dw_orden.object.usuario.text							= gs_user
			f_Print( dw_orden )
		end if
	end if
end if
end event

type dw_orden from datawindow within w_datos_contrato_funeraria
boolean visible = false
integer x = 731
integer y = 1640
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dwe_imprimir_orden_venta_funeraria"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_detalle_servicio from datawindow within w_datos_contrato_funeraria
integer x = 1646
integer y = 616
integer width = 1646
integer height = 840
integer taborder = 30
string title = "none"
string dataobject = "dw_detalle_ctto_origen_vs_ctto_servico"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type dw_seguro from datawindow within w_datos_contrato_funeraria
integer x = 1646
integer y = 44
integer width = 1019
integer height = 540
integer taborder = 20
string title = "none"
string dataobject = "dw_listado_seguros_asoc_retrieve"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_datos_contrato_funeraria
integer x = 41
integer y = 28
integer width = 1111
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Datos del Contrato Funeraria"
boolean focusrectangle = false
end type

type dw_datos_contrato from datawindow within w_datos_contrato_funeraria
integer x = 23
integer y = 144
integer width = 1550
integer height = 1324
integer taborder = 10
string dataobject = "d_datos_contrato_funeraria"
boolean border = false
boolean livescroll = true
end type

type cb_cerrar from commandbutton within w_datos_contrato_funeraria
integer x = 2971
integer y = 1496
integer width = 315
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_datos_contrato_funeraria)
end event

type ln_1 from line within w_datos_contrato_funeraria
long linecolor = 8421504
integer linethickness = 4
integer beginx = 1591
integer beginy = 36
integer endx = 1591
integer endy = 1484
end type

type ln_2 from line within w_datos_contrato_funeraria
long linecolor = 16777215
integer linethickness = 4
integer beginx = 1595
integer beginy = 36
integer endx = 1595
integer endy = 1484
end type

