forward
global type w_ejecutivo_detalle_ugn_bkp from window
end type
type cb_cerrar from commandbutton within w_ejecutivo_detalle_ugn_bkp
end type
type cb_grabar from commandbutton within w_ejecutivo_detalle_ugn_bkp
end type
type dw_lista_asig from datawindow within w_ejecutivo_detalle_ugn_bkp
end type
end forward

global type w_ejecutivo_detalle_ugn_bkp from window
integer width = 3058
integer height = 1992
boolean titlebar = true
string title = "Lista Asignacion Prospectos Ejecutivo"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_lista_asig dw_lista_asig
end type
global w_ejecutivo_detalle_ugn_bkp w_ejecutivo_detalle_ugn_bkp

on w_ejecutivo_detalle_ugn_bkp.create
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_lista_asig=create dw_lista_asig
this.Control[]={this.cb_cerrar,&
this.cb_grabar,&
this.dw_lista_asig}
end on

on w_ejecutivo_detalle_ugn_bkp.destroy
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_lista_asig)
end on

event open;string 	ls_usuario,ls_glosa_ges,ls_estado_ges,ls_est_gestion
long	 	ll_indi,ll_tot_reg,ll_grupo_cli,ll_corr_cli,ll_grupo,ll_new,ll_est_reg
datetime	ldt_fecha_gestion,ldt_prox_llamado

gf_centrar(w_ejecutivo_detalle_ugn)
dw_lista_asig.settransobject(sqlca)

ll_tot_reg		= w_ejecutivo_ugn.dw_lista_ejecutivo.rowcount()
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ll_est_reg		= w_ejecutivo_ugn.dw_lista_ejecutivo.getitemnumber(ll_indi,'est_reg')
		if ll_est_reg = 0 then
			ll_new			= dw_lista_asig.insertrow(0)
			dw_lista_asig.setitem(ll_new,'fecha_gestion', date(gdt_fec_sistema))
			dw_lista_asig.setitem(ll_new,'estado_gestion', '0')
			dw_lista_asig.setitem(ll_new,'glosa_gestion', 'SE ASIGNA CARTERA UGN EL '+string(gdt_fec_sistema,'dd/mm/yyyy')+', POR EL USUARIO '+gs_user)
			dw_lista_asig.setitem(ll_new,'correlativo_cliente', w_ejecutivo_ugn.dw_lista_ejecutivo.getitemnumber(ll_indi,'ugn_cliente_correlativo'))
			dw_lista_asig.setitem(ll_new,'grupo_cliente', w_ejecutivo_ugn.dw_lista_ejecutivo.getitemnumber(ll_indi,'ugn_cliente_grupo'))
			dw_lista_asig.setitem(ll_new,'fecha_prox_llamado', w_ejecutivo_ugn.dw_lista_ejecutivo.getitemdatetime(ll_indi,'ugn_cliente_prox_llamado_cob'))
		end if		
	next
end if
end event

type cb_cerrar from commandbutton within w_ejecutivo_detalle_ugn_bkp
integer x = 2665
integer y = 1708
integer width = 347
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ejecutivo_detalle_ugn)
end event

type cb_grabar from commandbutton within w_ejecutivo_detalle_ugn_bkp
integer x = 23
integer y = 1708
integer width = 283
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;dw_lista_asig.accepttext()
if dw_lista_asig.rowcount() > 0 then
	if isvalid(w_ejecutivo_cabecera_ugn) then close(w_ejecutivo_cabecera_ugn)
	open(w_ejecutivo_cabecera_ugn)
end if
end event

type dw_lista_asig from datawindow within w_ejecutivo_detalle_ugn_bkp
integer x = 32
integer y = 32
integer width = 2981
integer height = 1640
integer taborder = 10
string title = "none"
string dataobject = "dw_ejecutivo_detalle"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

