forward
global type w_pago_repactacion from window
end type
type st_txt_real from statictext within w_pago_repactacion
end type
type st_cliente from statictext within w_pago_repactacion
end type
type st_numero from statictext within w_pago_repactacion
end type
type st_serie from statictext within w_pago_repactacion
end type
type st_base from statictext within w_pago_repactacion
end type
type st_2 from statictext within w_pago_repactacion
end type
type st_1 from statictext within w_pago_repactacion
end type
type em_deuda from statictext within w_pago_repactacion
end type
type em_cant_ctas from statictext within w_pago_repactacion
end type
type cb_cerrar from commandbutton within w_pago_repactacion
end type
type dw_pago from datawindow within w_pago_repactacion
end type
type cb_pago from commandbutton within w_pago_repactacion
end type
type cb_aceptar from commandbutton within w_pago_repactacion
end type
end forward

global type w_pago_repactacion from window
integer width = 2985
integer height = 1672
boolean titlebar = true
string title = "Pago Repactación ( Cuota Mantención )"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_txt_real st_txt_real
st_cliente st_cliente
st_numero st_numero
st_serie st_serie
st_base st_base
st_2 st_2
st_1 st_1
em_deuda em_deuda
em_cant_ctas em_cant_ctas
cb_cerrar cb_cerrar
dw_pago dw_pago
cb_pago cb_pago
cb_aceptar cb_aceptar
end type
global w_pago_repactacion w_pago_repactacion

type variables
String		is_base,is_serie,is_opcion, is_string
Long		il_nro_ctas,il_corr,il_monto,il_tot_reg, il_row,il_valor_cta,il_ctas_pag
Date		id_fecha_prox_pago
Double	il_numero
end variables

on w_pago_repactacion.create
this.st_txt_real=create st_txt_real
this.st_cliente=create st_cliente
this.st_numero=create st_numero
this.st_serie=create st_serie
this.st_base=create st_base
this.st_2=create st_2
this.st_1=create st_1
this.em_deuda=create em_deuda
this.em_cant_ctas=create em_cant_ctas
this.cb_cerrar=create cb_cerrar
this.dw_pago=create dw_pago
this.cb_pago=create cb_pago
this.cb_aceptar=create cb_aceptar
this.Control[]={this.st_txt_real,&
this.st_cliente,&
this.st_numero,&
this.st_serie,&
this.st_base,&
this.st_2,&
this.st_1,&
this.em_deuda,&
this.em_cant_ctas,&
this.cb_cerrar,&
this.dw_pago,&
this.cb_pago,&
this.cb_aceptar}
end on

on w_pago_repactacion.destroy
destroy(this.st_txt_real)
destroy(this.st_cliente)
destroy(this.st_numero)
destroy(this.st_serie)
destroy(this.st_base)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_deuda)
destroy(this.em_cant_ctas)
destroy(this.cb_cerrar)
destroy(this.dw_pago)
destroy(this.cb_pago)
destroy(this.cb_aceptar)
end on

event open;Long		i,ll_new,ll_monto_cuota,ll_dia
Long		ll_dia_aux,ll_mes,ll_anno
Date		ld_fecha,ld_fec_pago
String	ls_fecha
gf_centrar(w_pago_repactacion)
dw_pago.settransobject(sqlca)
is_string				= Message.StringParm
is_base 					= substr(1,1,Message.StringParm)
is_serie					= substr(1,2,Message.StringParm)
il_numero				= Double(substr(1,3,Message.StringParm))
il_monto					= Long(substr(1,4,Message.StringParm))
st_cliente.text		= trim(substr(1,5,Message.StringParm))
il_nro_ctas				= long(substr(1,6,Message.StringParm))
is_opcion				= substr(1,7,Message.StringParm)
il_valor_cta			= long(substr(1,8,Message.StringParm))
il_ctas_pag				= long(substr(1,9,Message.StringParm))
st_base.text			= is_base
st_serie.text			= is_serie
st_numero.text			= string(il_numero,"###,###,###,###,###,###")
em_deuda.text			= string(il_monto,"###,###,###,###,###,###")
em_cant_ctas.text		= string(il_nro_ctas,"###,###,###,###,###")
gs_ventana				= 'w_pago_repactacion'
f_valida_objeto()
if is_base<>'' and not isnull(is_base) and is_serie<>'' and not isnull(is_serie) and il_numero>0 then
	il_tot_reg	= dw_pago.retrieve('R',is_serie,il_numero)
	if is_opcion='C' then
		if il_tot_reg=0 then
			messagebox("Advertencia","No Registra Pago")
			close(w_pago_repactacion)
		end if
	end if
end if
end event

type st_txt_real from statictext within w_pago_repactacion
integer x = 1518
integer y = 280
integer width = 544
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cuotas en Mora"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_cliente from statictext within w_pago_repactacion
integer x = 78
integer y = 160
integer width = 2693
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
boolean focusrectangle = false
end type

type st_numero from statictext within w_pago_repactacion
integer x = 1042
integer y = 48
integer width = 448
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_serie from statictext within w_pago_repactacion
integer x = 873
integer y = 48
integer width = 165
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_base from statictext within w_pago_repactacion
integer x = 704
integer y = 48
integer width = 165
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_pago_repactacion
integer x = 59
integer y = 64
integer width = 613
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "CONTRATO ORIGINAL"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_pago_repactacion
integer x = 119
integer y = 280
integer width = 553
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Deuda Total Aprox."
alignment alignment = right!
boolean focusrectangle = false
end type

type em_deuda from statictext within w_pago_repactacion
integer x = 704
integer y = 264
integer width = 462
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_cant_ctas from statictext within w_pago_repactacion
integer x = 2094
integer y = 264
integer width = 288
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_pago_repactacion
integer x = 2615
integer y = 1416
integer width = 306
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_pago_repactacion)
end event

type dw_pago from datawindow within w_pago_repactacion
integer x = 46
integer y = 412
integer width = 2875
integer height = 972
integer taborder = 10
string dataobject = "dw_pago_detalle_repactacion"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	cb_aceptar.triggerevent(clicked!)
end if
end event

type cb_pago from commandbutton within w_pago_repactacion
integer x = 46
integer y = 1424
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo Pago"
end type

event clicked;long		ll_ctas_pactadas, ll_ctas_pagadas  
String	ls_string
SELECT 	"REPACTA_MANTENCION"."CUOTAS_PACTADAS",   
			"REPACTA_MANTENCION"."CTAS_PAGADAS"  
INTO 		:ll_ctas_pactadas,   
			:ll_ctas_pagadas  
FROM 		"REPACTA_MANTENCION"  
WHERE 	( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :is_base ) AND  
			( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :is_serie ) AND  
			( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :il_numero )   
Using		sqlca ;
if sqlca.sqlcode=0 then
	if ll_ctas_pactadas=ll_ctas_pagadas then
		messagebox("Advertencia","Repactación Cancelada")
	else
		if isvalid(w_grabar_pago_repactacion) then close(w_grabar_pago_repactacion)
		ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(il_monto) &
						  +'~t'+trim(st_cliente.text)+'~t'+string(il_nro_ctas)+'~t'+'P' &
						  +'~t'+string(il_valor_cta)+'~t'+string(il_ctas_pag)+'~t'+string(il_corr)
		openwithparm(w_grabar_pago_repactacion,ls_string)
	end if
end if
end event

type cb_aceptar from commandbutton within w_pago_repactacion
boolean visible = false
integer x = 46
integer y = 1424
integer width = 795
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;long		ll_corr
String	ls_string
if dw_pago.rowcount() > 0 then
	if il_row > 0 then
		if isvalid(w_grabar_pago_repactacion) then close(w_grabar_pago_repactacion)
		il_corr		= dw_pago.getitemnumber(il_row,'correlativo')
		ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(il_monto) &
						  +'~t'+trim(st_cliente.text)+'~t'+string(il_nro_ctas)+'~t'+'C' &
						  +'~t'+string(il_valor_cta)+'~t'+string(il_ctas_pag)+'~t'+string(il_corr)
		openwithparm(w_grabar_pago_repactacion,ls_string)
	else
		messagebox("Advertencia","Debe Seleccionar Cuota")
	end if
end if
end event

