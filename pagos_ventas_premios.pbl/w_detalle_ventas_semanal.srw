forward
global type w_detalle_ventas_semanal from window
end type
type cb_cta_cte from commandbutton within w_detalle_ventas_semanal
end type
type cb_imprimir from commandbutton within w_detalle_ventas_semanal
end type
type cb_cerrar from commandbutton within w_detalle_ventas_semanal
end type
type dw_detalle from datawindow within w_detalle_ventas_semanal
end type
end forward

global type w_detalle_ventas_semanal from window
integer width = 3355
integer height = 1904
boolean titlebar = true
string title = "Detalle Producción por Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cta_cte cb_cta_cte
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_detalle dw_detalle
end type
global w_detalle_ventas_semanal w_detalle_ventas_semanal

type variables
long il_row
end variables

on w_detalle_ventas_semanal.create
this.cb_cta_cte=create cb_cta_cte
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_cta_cte,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_detalle}
end on

on w_detalle_ventas_semanal.destroy
destroy(this.cb_cta_cte)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
end on

event open;string	ls_codigo,ls_detalle,ls_clasif_hist
long		ll_tot_reg,ll_indi
datetime	ldt_fecha
double	ldb_valor_uf

gf_centrar(w_detalle_ventas_semanal)

ldt_fecha												= datetime((date(substr(1,1,Message.StringParm))),time('00:00:00'))
ls_codigo												= substr(1,2,Message.StringParm)
ls_detalle											= substr(1,3,Message.StringParm)

SELECT	"TAB_UF"."VALOR_UF"  
INTO		:ldb_valor_uf  
FROM		"TAB_UF"  
WHERE		"TAB_UF"."FECHA_UF" = :ldt_fecha
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_valor_uf) and ldb_valor_uf > 0 then
	end if
end if

if ls_detalle = 'H' then
	dw_detalle.dataobject = 'dw_detalle_gestion_semanal'
	dw_detalle.settransobject(sqlca)
	ll_tot_reg										= dw_detalle.retrieve(ldt_fecha,ls_codigo)
elseif ls_detalle = 'A' then
	dw_detalle.dataobject = 'dw_detalle_gestion_semanal_act'
	dw_detalle.settransobject(sqlca)
	ll_tot_reg										= dw_detalle.retrieve(ls_codigo)	
end if
ls_clasif_hist										= f_clasif_hist(ls_codigo,ldt_fecha)
dw_detalle.Object.t_clasif.text					= ls_clasif_hist
dw_detalle.Object.usuario.text 					= gs_user
for ll_indi=1 to ll_tot_reg
	dw_detalle.setitem(ll_indi,"c_valor_uf",ldb_valor_uf)
next
if ll_tot_reg=0 then
	messagebox("Advertencia","No registra dato")
	close(w_detalle_ventas_semanal)
end if
end event

type cb_cta_cte from commandbutton within w_detalle_ventas_semanal
integer x = 41
integer y = 1632
integer width = 425
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;string	ls_base,ls_serie
long		ll_cd_estado_promesa
double	ldb_numero
dw_detalle.accepttext()
if dw_detalle.dataobject='dw_detalle_gestion_semanal' and dw_detalle.rowcount() > 0 then
	ls_base				= dw_detalle.getitemstring(il_row,'cadena_codigo')
	ls_serie				= dw_detalle.getitemstring(il_row,'oferta_v_serie')
	ldb_numero			= dw_detalle.getitemnumber(il_row,'oferta_v_nro_oferta')
	gi_rut				= dw_detalle.getitemnumber(il_row,'cadena_rut')
	if il_row>0 then
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" //Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
		END CHOOSE
	END IF
end if
end event

type cb_imprimir from commandbutton within w_detalle_ventas_semanal
integer x = 2665
integer y = 1652
integer width = 315
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;long		ll_res

if dw_detalle.rowcount() > 0 then
	ll_res			= MessageBox("Imprimir", "Desea Imprimir el Informe", Exclamation!, YesNo!, 2)
	if ll_res=1 then
		f_Print( dw_detalle )
	else
		messagebox('Advertencia','Proceso Cancelado')
	end if
else
	messagebox('Advertencia','No Registra Datos para Imprimir')
end if
end event

type cb_cerrar from commandbutton within w_detalle_ventas_semanal
integer x = 2981
integer y = 1652
integer width = 315
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_ventas_semanal)
end event

type dw_detalle from datawindow within w_detalle_ventas_semanal
integer x = 37
integer y = 36
integer width = 3259
integer height = 1584
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_gestion_semanal"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

