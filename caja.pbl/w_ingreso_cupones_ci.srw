forward
global type w_ingreso_cupones_ci from window
end type
type dw_dias_mora from datawindow within w_ingreso_cupones_ci
end type
type dw_detalle from datawindow within w_ingreso_cupones_ci
end type
type dw_datos_credito_oferta from datawindow within w_ingreso_cupones_ci
end type
type st_uf from statictext within w_ingreso_cupones_ci
end type
type st_fecha from statictext within w_ingreso_cupones_ci
end type
type st_5 from statictext within w_ingreso_cupones_ci
end type
type st_4 from statictext within w_ingreso_cupones_ci
end type
type st_3 from statictext within w_ingreso_cupones_ci
end type
type st_n_caja from statictext within w_ingreso_cupones_ci
end type
type dw_encabezado_ingreso_cupon from datawindow within w_ingreso_cupones_ci
end type
type p_1 from picture within w_ingreso_cupones_ci
end type
type tab_ingreso from tab within w_ingreso_cupones_ci
end type
type tp_cupon from userobject within tab_ingreso
end type
type cb_cerrar from commandbutton within tp_cupon
end type
type st_nro_ctto from statictext within tp_cupon
end type
type cbx_sin_gastos from checkbox within tp_cupon
end type
type cb_forma_pago from commandbutton within tp_cupon
end type
type cb_borrar_cupon from commandbutton within tp_cupon
end type
type cb_insertar_cupon from commandbutton within tp_cupon
end type
type dw_detalle_pago_cupon from datawindow within tp_cupon
end type
type tp_cupon from userobject within tab_ingreso
cb_cerrar cb_cerrar
st_nro_ctto st_nro_ctto
cbx_sin_gastos cbx_sin_gastos
cb_forma_pago cb_forma_pago
cb_borrar_cupon cb_borrar_cupon
cb_insertar_cupon cb_insertar_cupon
dw_detalle_pago_cupon dw_detalle_pago_cupon
end type
type tab_ingreso from tab within w_ingreso_cupones_ci
tp_cupon tp_cupon
end type
end forward

global type w_ingreso_cupones_ci from window
integer x = 41
integer y = 124
integer width = 2999
integer height = 1512
boolean titlebar = true
string title = "Ingreso de Cupones"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
dw_dias_mora dw_dias_mora
dw_detalle dw_detalle
dw_datos_credito_oferta dw_datos_credito_oferta
st_uf st_uf
st_fecha st_fecha
st_5 st_5
st_4 st_4
st_3 st_3
st_n_caja st_n_caja
dw_encabezado_ingreso_cupon dw_encabezado_ingreso_cupon
p_1 p_1
tab_ingreso tab_ingreso
end type
global w_ingreso_cupones_ci w_ingreso_cupones_ci

type variables
Double	id_factor_gc,id_tasa_mant
Long		il_cantidad_malo,il_folio,il_cant_cta_e,il_cant_cta_f,il_suma_dia
String		is_base,is_serie,is_tipo_cob
Double	il_numero
end variables

on w_ingreso_cupones_ci.create
this.dw_dias_mora=create dw_dias_mora
this.dw_detalle=create dw_detalle
this.dw_datos_credito_oferta=create dw_datos_credito_oferta
this.st_uf=create st_uf
this.st_fecha=create st_fecha
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_n_caja=create st_n_caja
this.dw_encabezado_ingreso_cupon=create dw_encabezado_ingreso_cupon
this.p_1=create p_1
this.tab_ingreso=create tab_ingreso
this.Control[]={this.dw_dias_mora,&
this.dw_detalle,&
this.dw_datos_credito_oferta,&
this.st_uf,&
this.st_fecha,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_n_caja,&
this.dw_encabezado_ingreso_cupon,&
this.p_1,&
this.tab_ingreso}
end on

on w_ingreso_cupones_ci.destroy
destroy(this.dw_dias_mora)
destroy(this.dw_detalle)
destroy(this.dw_datos_credito_oferta)
destroy(this.st_uf)
destroy(this.st_fecha)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_n_caja)
destroy(this.dw_encabezado_ingreso_cupon)
destroy(this.p_1)
destroy(this.tab_ingreso)
end on

event open;double	id_uf
date 		id_fecha
Long		il_ncred,ll_ctas,ll_ctas_pagadas,il_nenc,ll_ctas_pagada_1,&
			ll_ctas_pagada_2,ll_fila,ll_tot_reg

gf_centrar(w_ingreso_cupones_ci)
setnull(gs_tipo_cobro)
dw_dias_mora.settransobject(sqlca)
is_base 							= trim(substr(1,1,Message.StringParm))
is_serie 							= trim(substr(1,2,Message.StringParm))
il_numero 						= Double(trim(substr(1,3,Message.StringParm)))
is_tipo_cob						= trim(substr(1,4,Message.StringParm))
il_folio							= long(trim(substr(1,5,Message.StringParm)))
dw_detalle.settransobject(sqlca)
dw_encabezado_ingreso_cupon.settransobject(sqlca)
il_suma_dia						= 0
gs_grabar_pie					= 'N'
if gs_conexion = "Parque El Prado" then
	if gl_cod_parque=1 then
		p_1.picturename 		= 'logo_e.bmp'
	elseif gl_cod_parque=102 then
		p_1.picturename 		= 'logo_manantial.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 		= 'logo_parque_stgo.bmp'
	elseif gl_cod_parque=801 then
		p_1.picturename 		= 'logo_parque_conce.bmp'
	else
		p_1.picturename 		= 'logo_e.bmp'
	end if
else
	p_1.picturename 			= 'logo_e_s.bmp'
end if
this.title						= 'Ingreso de Cupones'
st_n_caja.text 				= gs_caja
CHOOSE CASE is_base
	CASE 'O'
		il_nenc 					= dw_encabezado_ingreso_cupon.Retrieve(is_base, is_serie, il_numero)
		dw_datos_credito_oferta.DataObject = 'd_datos_credito_oferta'
		dw_datos_credito_oferta.SetTransObject(SQLCA)
		il_ncred 				= dw_datos_credito_oferta.Retrieve(is_serie, il_numero)
		if il_ncred>0 then
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'pago_oferta_nro_cuotas')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'oferta_v_cta_pag_s')
		end if
		tab_ingreso.tp_cupon.st_nro_ctto.text	= 'Promesa Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")
	CASE 'L'
		il_nenc 					= dw_encabezado_ingreso_cupon.Retrieve(is_base, is_serie, il_numero)
		dw_datos_credito_oferta.DataObject = 'd_datos_credito_liberador'
		dw_datos_credito_oferta.SetTransObject(SQLCA)
		il_ncred 				= dw_datos_credito_oferta.Retrieve(is_serie, il_numero)
		if il_ncred>0 then
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'pago_liberador_nro_cuotas')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'anexo_liberador_cta_pag_m')
		end if
		tab_ingreso.tp_cupon.st_nro_ctto.text	= 'Anexo Liberador Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")
	CASE 'P'
		il_nenc 					= dw_encabezado_ingreso_cupon.Retrieve(is_base, is_serie, il_numero)
		dw_datos_credito_oferta.DataObject = 'd_datos_credito_pagare'
		dw_datos_credito_oferta.SetTransObject(SQLCA)
		il_ncred 				= dw_datos_credito_oferta.Retrieve(is_serie, il_numero)
		if il_ncred>0 then
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'plazo')
			ll_ctas_pagada_1	= dw_datos_credito_oferta.getitemnumber(1,'cta_pag_la')
			ll_ctas_pagada_2	= dw_datos_credito_oferta.getitemnumber(1,'cta_pag_isa')
			ll_ctas_pagadas	= ll_ctas_pagada_1 + ll_ctas_pagada_2
		end if
		tab_ingreso.tp_cupon.st_nro_ctto.text	= 'Pagaré Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")
	CASE 'D'
		il_nenc 					= dw_encabezado_ingreso_cupon.Retrieve(is_base, is_serie, il_numero)
		dw_datos_credito_oferta.DataObject	= 'd_datos_credito_derecho'
		dw_datos_credito_oferta.SetTransObject(SQLCA)
		il_ncred 				= dw_datos_credito_oferta.Retrieve(is_serie, il_numero)
		if il_ncred>0 then
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'derecho_plazo')
			ll_ctas_pagada_1	= dw_datos_credito_oferta.getitemnumber(1,'derecho_cta_pag_la')
			ll_ctas_pagada_2	= dw_datos_credito_oferta.getitemnumber(1,'derecho_cta_pag_isa')
			ll_ctas_pagadas	= ll_ctas_pagada_1 + ll_ctas_pagada_2
		end if
		tab_ingreso.tp_cupon.st_nro_ctto.text	= 'Derecho Especial Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")
	CASE 'A'
		il_nenc 					= dw_encabezado_ingreso_cupon.Retrieve(is_base, is_serie, il_numero)
		dw_datos_credito_oferta.DataObject = 'd_datos_credito_aumento_capacidad'
		dw_datos_credito_oferta.SetTransObject(SQLCA)
		il_ncred 				= dw_datos_credito_oferta.Retrieve(is_serie, il_numero)
		if il_ncred>0 then
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'pago_aumento_nro_cuotas')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'anexo_aumento_cta_pag_m')
		end if
		tab_ingreso.tp_cupon.st_nro_ctto.text	= 'Aumento Capacidad Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")
	CASE 'C'
		il_nenc 					= dw_encabezado_ingreso_cupon.Retrieve(is_base, is_serie, il_numero)
		dw_datos_credito_oferta.DataObject = 'd_datos_credito_isa'
		dw_datos_credito_oferta.SetTransObject(SQLCA)
		il_ncred 				= dw_datos_credito_oferta.Retrieve(is_serie, il_numero)
		if il_ncred>0 then
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'contrato_plazo')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'contrato_cta_pag_m')
		end if
		tab_ingreso.tp_cupon.st_nro_ctto.text	= 'Contrato IsaCruz Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")
	CASE 'R'
		il_nenc 					= dw_encabezado_ingreso_cupon.Retrieve(is_base, is_serie, il_numero)
		dw_datos_credito_oferta.DataObject = 'd_datos_credito_reprog'
		dw_datos_credito_oferta.SetTransObject(SQLCA)
		il_ncred 				= dw_datos_credito_oferta.Retrieve(is_serie, il_numero)
		if il_ncred>0 then
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
		end if
		tab_ingreso.tp_cupon.st_nro_ctto.text	= 'Reprogramación de Mantención Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")
END CHOOSE
SELECT	"TASA"."TASA_INT_UF"  
INTO 		:id_tasa_mant  
FROM 		"TASA"  
WHERE 	"TASA"."LOOK" = 1   ;

SELECT	"TASA"."GASTO_COB_MORA" 
INTO 		:id_factor_gc 
FROM 		"TASA" 
WHERE 	"TASA"."LOOK" = 1 ;
dw_encabezado_ingreso_cupon.SetTransObject(SQLCA)
tab_ingreso.tp_cupon.dw_detalle_pago_cupon.SetTransObject(SQLCA)
st_fecha.text 			= String(gdt_fec_sistema, "dd/mm/yyyy")
id_fecha 				= Date(st_fecha.text)
id_uf 					= 0
SELECT 	"TAB_UF"."VALOR_UF"  
INTO 		:id_uf  
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha;
IF id_uf > 0  THEN 
	gd_uf 				= id_uf	
	st_uf.text 			= String(id_uf, "###,###,###.0000")
ELSE
	Open(w_mantenedor_uf)
	id_fecha 			= Date(st_fecha.text)
	id_uf 				= 0
	SELECT 	"TAB_UF"."VALOR_UF"  
	INTO 		:id_uf  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha
	using		sqlca;
	if sqlca.sqlcode<>0 then
//		messagebox("Advertencia","Debe Ingresar U.F. del día")
		close(w_ingreso_cupones_ci)
	else
		gd_uf 			= id_uf	
	end if
END IF
SELECT 	"TAB_UF"."VALOR_UF"  
INTO 		:id_uf  
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha
using		sqlca;
if id_uf>0 then
	gd_uf 				= id_uf	
else
	close(w_ingreso_cupones_ci)
end if
if isvalid(w_ingreso2) then
	ll_tot_reg			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
	ll_fila 				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob = 'E'", 1, ll_tot_reg)
	if ll_fila>0 then
		il_cant_cta_e	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_fila,'cantidad')
	else
		il_cant_cta_e	= 0
	end if
	ll_fila 				= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob = 'F'", 1, ll_tot_reg)
	if ll_fila>0 then
		il_cant_cta_f	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getitemnumber(ll_fila,'cantidad')
	else
		il_cant_cta_f	= 0
	end if
	if il_cant_cta_e=0 and il_cant_cta_f=0 then
		messagebox("Advertencia","No Realiza Pagos de Cuota Crédito o Cuota Mantención")
		close(w_ingreso_cupones_ci)
	end if
	tab_ingreso.tp_cupon.cb_insertar_cupon.setfocus()
end if
end event

type dw_dias_mora from datawindow within w_ingreso_cupones_ci
boolean visible = false
integer x = 1230
integer y = 1412
integer width = 1696
integer height = 464
integer taborder = 52
string title = "none"
string dataobject = "dwe_lista_calculo_dias_mora_credito"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
end type

event doubleclicked;dw_dias_mora.print()
end event

type dw_detalle from datawindow within w_ingreso_cupones_ci
boolean visible = false
integer x = 73
integer y = 1416
integer width = 347
integer height = 204
string title = "none"
string dataobject = "dw_lista_ingreso_detalle_cupon_ci"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_datos_credito_oferta from datawindow within w_ingreso_cupones_ci
boolean visible = false
integer x = 215
integer y = 1408
integer width = 955
integer height = 484
string title = "none"
string dataobject = "d_datos_credito_aumento_capacidad"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_uf from statictext within w_ingreso_cupones_ci
integer x = 1527
integer y = 24
integer width = 626
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_fecha from statictext within w_ingreso_cupones_ci
integer x = 745
integer y = 24
integer width = 475
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_ingreso_cupones_ci
integer x = 2267
integer y = 32
integer width = 206
integer height = 84
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Caja:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_ingreso_cupones_ci
integer x = 1312
integer y = 32
integer width = 206
integer height = 84
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "U.F.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ingreso_cupones_ci
integer x = 512
integer y = 32
integer width = 219
integer height = 84
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_n_caja from statictext within w_ingreso_cupones_ci
integer x = 2487
integer y = 24
integer width = 407
integer height = 88
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_encabezado_ingreso_cupon from datawindow within w_ingreso_cupones_ci
event ue_mousemove pbm_mousemove
integer x = 453
integer y = 128
integer width = 2473
integer height = 280
string dataobject = "d_encabezado_ingreso_cupon"
boolean border = false
boolean livescroll = true
end type

type p_1 from picture within w_ingreso_cupones_ci
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 32
integer width = 389
integer height = 384
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type tab_ingreso from tab within w_ingreso_cupones_ci
event ue_mousemove pbm_mousemove
integer x = 55
integer y = 440
integer width = 2875
integer height = 932
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 77571519
boolean raggedright = true
integer selectedtab = 1
tp_cupon tp_cupon
end type

on tab_ingreso.create
this.tp_cupon=create tp_cupon
this.Control[]={this.tp_cupon}
end on

on tab_ingreso.destroy
destroy(this.tp_cupon)
end on

event selectionchanged;//long	ll_resp
//
//CHOOSE CASE tab_ingreso.SelectedTab
//	CASE 1 //Cupón
//		if tab_ingreso.tp_ci.dw_detalle_ci.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_ci.dw_ci_buscar_cliente.getitemstring(1,'rn_contrato')))>0 or &
//			tab_ingreso.tp_traspaso.dw_detalle_ci_2.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_traspaso.dw_ci_buscar_cliente2.getitemstring(1,'rn_contrato')))>0 or &
//			tab_ingreso.tp_boletas.dw_detalle_bl.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_boletas.dw_bl_buscar_cliente.getitemstring(1,'rn_contrato')))>0 or &
//			tab_ingreso.tp_repacta_bl_mant.dw_detalle_bl_repacta.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_repacta_bl_mant.dw_busca_cliente_repac_mant.getitemstring(1,'rn_contrato')))>0 then
//			
//			ll_resp	= MessageBox("Advertencia", "Desea Limpiar Comprobante Anterior", &
//			Exclamation!, YesNo!, 2)
//			IF ll_resp = 1 THEN
//				wf_limpiar_opciones() //tab_ingreso.tp_cupon.cb_1.triggerevent(clicked!)
//			END IF
//		end if
//		tab_ingreso.tp_cupon.sle_n_contrato.setfocus()
//
//	CASE 2 //Comprobante Ingreso
//		if tab_ingreso.tp_cupon.dw_detalle_pago_cupon.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_cupon.sle_n_contrato.text))>0 or &
//			tab_ingreso.tp_traspaso.dw_detalle_ci_2.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_traspaso.dw_ci_buscar_cliente2.getitemstring(1,'rn_contrato')))>0 or &
//			tab_ingreso.tp_boletas.dw_detalle_bl.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_boletas.dw_bl_buscar_cliente.getitemstring(1,'rn_contrato')))>0 or &
//			tab_ingreso.tp_repacta_bl_mant.dw_detalle_bl_repacta.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_repacta_bl_mant.dw_busca_cliente_repac_mant.getitemstring(1,'rn_contrato')))>0 then
//
//			ll_resp	= MessageBox("Advertencia", "Desea Limpiar Comprobante Anterior", &
//			Exclamation!, YesNo!, 2)
//			IF ll_resp = 1 THEN
//				wf_limpiar_opciones()
//			END IF
//		end if
////		tab_ingreso.tp_ci.dw_detalle_ci.getchild('tipo_cob',idw_detalle)
////		idw_detalle.settransobject(sqlca)
////		idw_detalle.retrieve('CI')
//		tab_ingreso.tp_ci.dw_ci_buscar_cliente.setfocus()
//		tab_ingreso.tp_ci.dw_ci_buscar_cliente.setcolumn('rl_rut')
//		
//	CASE 3 //Boletas
//		if tab_ingreso.tp_cupon.dw_detalle_pago_cupon.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_cupon.sle_n_contrato.text))>0 or &
//			tab_ingreso.tp_traspaso.dw_detalle_ci_2.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_traspaso.dw_ci_buscar_cliente2.getitemstring(1,'rn_contrato')))>0 or &
//			tab_ingreso.tp_ci.dw_detalle_ci.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_ci.dw_ci_buscar_cliente.getitemstring(1,'rn_contrato')))>0 or &
//			tab_ingreso.tp_repacta_bl_mant.dw_detalle_bl_repacta.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_repacta_bl_mant.dw_busca_cliente_repac_mant.getitemstring(1,'rn_contrato')))>0 then
//
//			ll_resp	= MessageBox("Advertencia", "Desea Limpiar Comprobante Anterior", &
//			Exclamation!, YesNo!, 2)
//			IF ll_resp = 1 THEN
//				wf_limpiar_opciones()
//			END IF
//		end if
////		tab_ingreso.tp_boletas.dw_detalle_bl.getchild('tipo_cob',idw_detalle)
////		idw_detalle.settransobject(sqlca)
////		idw_detalle.retrieve('BL')
//		tab_ingreso.tp_boletas.dw_bl_buscar_cliente.setfocus()
//		tab_ingreso.tp_boletas.dw_bl_buscar_cliente.setcolumn('rl_rut')
//
//	CASE 4 //Boleta Reprog.Cta.Mant.
//		if tab_ingreso.tp_cupon.dw_detalle_pago_cupon.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_cupon.sle_n_contrato.text))>0 or &
//			tab_ingreso.tp_ci.dw_detalle_ci.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_ci.dw_ci_buscar_cliente.getitemstring(1,'rn_contrato')))>0 or &
//			tab_ingreso.tp_traspaso.dw_detalle_ci_2.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_traspaso.dw_ci_buscar_cliente2.getitemstring(1,'rn_contrato')))>0 or &
//			tab_ingreso.tp_boletas.dw_detalle_bl.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_boletas.dw_bl_buscar_cliente.getitemstring(1,'rn_contrato')))>0 then
//			
//			ll_resp	= MessageBox("Advertencia", "Desea Limpiar Comprobante Anterior", &
//			Exclamation!, YesNo!, 2)
//			IF ll_resp = 1 THEN
//				wf_limpiar_opciones()
//			END IF
//		end if
////		tab_ingreso.tp_repacta_bl_mant.dw_detalle_bl_repacta.getchild('tipo_cob',idw_detalle)
////		idw_detalle.settransobject(sqlca)
////		idw_detalle.retrieve('BM')
//		tab_ingreso.tp_repacta_bl_mant.dw_busca_cliente_repac_mant.setfocus()
//		tab_ingreso.tp_repacta_bl_mant.dw_busca_cliente_repac_mant.setcolumn('rl_rut')
//
//	CASE 5 //Pago Traspaso a Empresa
//		if tab_ingreso.tp_cupon.dw_detalle_pago_cupon.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_cupon.sle_n_contrato.text))>0 or &
//			tab_ingreso.tp_ci.dw_detalle_ci.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_ci.dw_ci_buscar_cliente.getitemstring(1,'rn_contrato')))>0 or &
//			tab_ingreso.tp_boletas.dw_detalle_bl.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_boletas.dw_bl_buscar_cliente.getitemstring(1,'rn_contrato')))>0 or &
//			tab_ingreso.tp_repacta_bl_mant.dw_detalle_bl_repacta.rowcount() > 0 or &
//			len(trim(tab_ingreso.tp_repacta_bl_mant.dw_busca_cliente_repac_mant.getitemstring(1,'rn_contrato')))>0 then
//
//			ll_resp	= MessageBox("Advertencia", "Desea Limpiar Comprobante Anterior", &
//			Exclamation!, YesNo!, 2)
//			IF ll_resp = 1 THEN
//				wf_limpiar_opciones()
//			END IF
//		end if
////		tab_ingreso.tp_traspaso.dw_detalle_ci_2.getchild('tipo_cob',idw_detalle)
////		idw_detalle.settransobject(sqlca)
////		idw_detalle.retrieve('MP')
//		tab_ingreso.tp_traspaso.dw_ci_buscar_cliente2.setfocus()
//		tab_ingreso.tp_traspaso.dw_ci_buscar_cliente2.setcolumn('rl_rut')
//
//END CHOOSE
end event

type tp_cupon from userobject within tab_ingreso
integer x = 18
integer y = 124
integer width = 2839
integer height = 792
long backcolor = 79741120
string text = "Detalle de Cupones"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Sort!"
long picturemaskcolor = 553648127
cb_cerrar cb_cerrar
st_nro_ctto st_nro_ctto
cbx_sin_gastos cbx_sin_gastos
cb_forma_pago cb_forma_pago
cb_borrar_cupon cb_borrar_cupon
cb_insertar_cupon cb_insertar_cupon
dw_detalle_pago_cupon dw_detalle_pago_cupon
end type

on tp_cupon.create
this.cb_cerrar=create cb_cerrar
this.st_nro_ctto=create st_nro_ctto
this.cbx_sin_gastos=create cbx_sin_gastos
this.cb_forma_pago=create cb_forma_pago
this.cb_borrar_cupon=create cb_borrar_cupon
this.cb_insertar_cupon=create cb_insertar_cupon
this.dw_detalle_pago_cupon=create dw_detalle_pago_cupon
this.Control[]={this.cb_cerrar,&
this.st_nro_ctto,&
this.cbx_sin_gastos,&
this.cb_forma_pago,&
this.cb_borrar_cupon,&
this.cb_insertar_cupon,&
this.dw_detalle_pago_cupon}
end on

on tp_cupon.destroy
destroy(this.cb_cerrar)
destroy(this.st_nro_ctto)
destroy(this.cbx_sin_gastos)
destroy(this.cb_forma_pago)
destroy(this.cb_borrar_cupon)
destroy(this.cb_insertar_cupon)
destroy(this.dw_detalle_pago_cupon)
end on

type cb_cerrar from commandbutton within tp_cupon
integer x = 2418
integer y = 676
integer width = 398
integer height = 96
integer taborder = 42
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;Datetime	ldt_fecha

ldt_fecha	= datetime(date(gdt_fec_sistema),time('00:00:00'))
DELETE FROM "DETALLE_CUPON_CI"  
WHERE 	( "DETALLE_CUPON_CI"."TIPO_COB" = :is_tipo_cob ) AND  
			( "DETALLE_CUPON_CI"."FOLIO" = :il_folio ) AND  
			( "DETALLE_CUPON_CI"."FECHA" = :ldt_fecha )   
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if
close(w_ingreso_cupones_ci)
end event

type st_nro_ctto from statictext within tp_cupon
integer x = 471
integer y = 672
integer width = 1883
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 255
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_sin_gastos from checkbox within tp_cupon
integer x = 594
integer y = 48
integer width = 960
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Sin Gastos de Cobranza ni Mora."
end type

event clicked;if dw_detalle_pago_cupon.rowcount()>0 then dw_detalle_pago_cupon.TriggerEvent(ItemChanged!)
end event

type cb_forma_pago from commandbutton within tp_cupon
integer x = 14
integer y = 676
integer width = 398
integer height = 96
integer taborder = 32
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Grabar"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_num_cupon,ll_monto_cuota,ll_sw_pasa,ll_interes_cuota,&
			ll_gasto_cob,ll_monto_total,ll_new,ll_suma_e,ll_suma_f
String	ls_tipo_mov,ls_tipo_mov_reg
datetime	ldt_fecha

SELECT sysdate  INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;

ldt_fecha	= datetime(date(gdt_fec_sistema),time('00:00:00'))
ll_suma_e	= 0
ll_suma_f	= 0
ll_tot_reg	= dw_detalle_pago_cupon.rowcount()
if dw_detalle_pago_cupon.rowcount()>0 then
	for ll_indi=1 to ll_tot_reg
		ll_num_cupon			= dw_detalle_pago_cupon.getitemnumber(ll_indi,'num_cupon')
		ll_monto_cuota			= dw_detalle_pago_cupon.getitemnumber(ll_indi,'monto_cuota')
		ls_tipo_mov				= dw_detalle_pago_cupon.getitemstring(ll_indi,'tipo_mov')
		if ls_tipo_mov='E' then
			ll_suma_e ++
		elseif ls_tipo_mov='F' then
			ll_suma_f ++
		end if
		if isnull(ll_num_cupon) or ll_num_cupon=0 then
			messagebox("Advertencia","Error debe ingresar Nº Cupón en Fila Nº: "+string(ll_indi))
			dw_detalle_pago_cupon.setfocus()
			dw_detalle_pago_cupon.scrolltorow(ll_indi)
			dw_detalle_pago_cupon.setcolumn('num_cupon')
			ll_sw_pasa ++
			exit
		elseif isnull(ll_monto_cuota) or ll_monto_cuota=0 then
			messagebox("Advertencia","Error debe ingresar Monto en Fila Nº: "+string(ll_indi))
			dw_detalle_pago_cupon.setfocus()
			dw_detalle_pago_cupon.scrolltorow(ll_indi)
			dw_detalle_pago_cupon.setcolumn('monto_cuota')
			ll_sw_pasa ++
			exit
		elseif isnull(ls_tipo_mov) or ls_tipo_mov='' then
			messagebox("Advertencia","Error No está Definido que Tipo Movimiento es el Cupón a Pagar en Fila Nº: "+string(ll_indi))
			dw_detalle_pago_cupon.setfocus()
			dw_detalle_pago_cupon.scrolltorow(ll_indi)
			ll_sw_pasa ++
			exit
		end if
	next
	if ll_suma_e > il_cant_cta_e then
		ll_sw_pasa ++
		if il_cant_cta_e=0 then
			messagebox("Advertencia","Recuerde Ingresó Cupón de Cuota CREDITO No estando Registrado en detalle de Pago")
		else
			messagebox("Advertencia","Existe Diferencia con Detalle de Pago Cuota Crédito")
		end if
	elseif ll_suma_f > il_cant_cta_f then
		ll_sw_pasa ++
		if il_cant_cta_f=0 then
			messagebox("Advertencia","Recuerde Ingresó Cupón de Cuota MANTENCION No estando Registrado en detalle de Pago")
		else
			messagebox("Advertencia","Existe Diferencia con Detalle de Pago Cuota Mantención")
		end if
	end if
	if ll_sw_pasa=0 then

		dw_detalle.reset()
		DELETE FROM "DETALLE_CUPON_CI"  
		WHERE	( "DETALLE_CUPON_CI"."TIPO_COB" = :is_tipo_cob ) AND  
				( "DETALLE_CUPON_CI"."FOLIO" = :il_folio )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
		for ll_indi=1 to ll_tot_reg
			ll_num_cupon			= dw_detalle_pago_cupon.getitemnumber(ll_indi,'num_cupon')
			ll_monto_cuota			= dw_detalle_pago_cupon.getitemnumber(ll_indi,'monto_cuota')
			ls_tipo_mov				= dw_detalle_pago_cupon.getitemstring(ll_indi,'tipo_mov')
			ll_interes_cuota		= dw_detalle_pago_cupon.getitemnumber(ll_indi,'int_mora')
			ll_gasto_cob			= dw_detalle_pago_cupon.getitemnumber(ll_indi,'g_cobranza')
			ll_monto_total			= dw_detalle_pago_cupon.getitemnumber(ll_indi,'c_subtotal')
			ll_new					= dw_detalle.insertrow(0)
			dw_detalle.setitem(ll_new,'tipo_cob',is_tipo_cob)
			dw_detalle.setitem(ll_new,'folio',il_folio)
			dw_detalle.setitem(ll_new,'fecha',ldt_fecha)
			dw_detalle.setitem(ll_new,'tipo_mov',ls_tipo_mov)
			dw_detalle.setitem(ll_new,'num_cupon',ll_num_cupon)
			dw_detalle.setitem(ll_new,'monto',ll_monto_cuota)
			dw_detalle.setitem(ll_new,'monto_mora',ll_interes_cuota)
			dw_detalle.setitem(ll_new,'monto_gasto_cob',ll_gasto_cob)
			dw_detalle.setitem(ll_new,'monto_total',ll_monto_total)
			UPDATE	"CUPONERAS_DETALLE"  
			SET 		"TIPO_COB_PAGO" = :is_tipo_cob,   
						"FOLIO_PAGO" = :il_folio,   
						"FECHA_PAGO" = :gdt_fec_sistema,
						"ESTADO_PAGO_CUPON" = 'C'
			WHERE 	"CUPONERAS_DETALLE"."NRO_CUPON" = :ll_num_cupon   
			USING		sqlca ;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		next
		dw_detalle.accepttext()
		if dw_detalle.update()=1 then
			commit;
			messagebox("Grabar","Grabarción Exitosa")
			close(w_ingreso_cupones_ci)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Detalle Cupones SQL: "+sqlca.sqlerrtext)
		end if
	end if
else
	messagebox("Advertencia","Debe Ingresar Detalle de Pago")
	cb_insertar_cupon.setfocus()
end if
end event

type cb_borrar_cupon from commandbutton within tp_cupon
integer x = 2418
integer y = 36
integer width = 398
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Borrar Item"
end type

event clicked;IF dw_detalle_pago_cupon.RowCount() > 0 THEN
	dw_detalle_pago_cupon.scrolltorow(dw_detalle_pago_cupon.RowCount())
	IF dw_detalle_pago_cupon.RowCount() > 1 THEN 
		messagebox("Advertencia","Se Eliminará el Ultimo Item Ingresado")
		il_suma_dia				= il_suma_dia - 1
	end if
	dw_detalle_pago_cupon.DeleteRow(dw_detalle_pago_cupon.Rowcount())
END IF
IF dw_detalle_pago_cupon.RowCount() = 0 THEN
	cb_forma_pago.Enabled 	= False
END IF
end event

type cb_insertar_cupon from commandbutton within tp_cupon
integer x = 14
integer y = 36
integer width = 398
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Insertar Item"
end type

event clicked;long 		il_n_cupon,ll_tot_reg,ll_indi,ll_num_cupon,ll_monto_cuota,ll_sw_pasa=0,ll_new,&
			ii_dmora, ii_mora_cobro,ll_ctas,ll_ctas_pagadas,ll_ctas_pagada_1,ll_ctas_pagada_2,&
			ll_suma_e,ll_suma_f,ll_num_cupon_corr,ll_resp,ll_nvo_reg,ll_plazo,ll_ctas_pag,ll_sum_pag,&
			ll_ctas_pag_m,ll_ano,ll_sum_pag_m,ll_year,ll_ctas_mora,ll_day,ll_month,i,ll_dias_dif,ll_suma_dias,&
			ll_tot_fila,ll_reg,ll_dias_mora,ll_calc_dias,ld_dias_sum_mora,ll_dia_prox_pago,ll_max
double	id_valor_cuota, id_gc, id_im,id_interes_gc
String	ls_tipo_mov,ls_pasa,ls_moneda,ls_pasa_e,ls_pasa_f,ls_tipo_mov_reg,ls_pasa_c,ls_fecha
Date		ldt_fecha_prox_pago_e,ldt_fecha_prox_pago_f,ld_fecha_m,ld_fecha_prox_pago,ld_fecha_inicial,&
			ld_fecha_prox_venc,ld_fecha_hoy
Datetime	ldt_fecha_ult,ldt_fecha_prim,ldt_venc_cred_min,ldt_venc_mant_min

if dw_datos_credito_oferta.rowcount()>0 then
	ld_fecha_hoy				= date(gdt_fec_sistema)
	CHOOSE CASE dw_datos_credito_oferta.dataobject
		CASE 'd_datos_credito_oferta'
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'pago_oferta_nro_cuotas')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'oferta_v_cta_pag_s')
		CASE 'd_datos_credito_liberador'
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'pago_liberador_nro_cuotas')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'anexo_liberador_cta_pag_m')
		CASE 'd_datos_credito_pagare'
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'plazo')
			ll_ctas_pagada_1	= dw_datos_credito_oferta.getitemnumber(1,'cta_pag_la')
			ll_ctas_pagada_2	= dw_datos_credito_oferta.getitemnumber(1,'cta_pag_isa')
			ll_ctas_pagadas	= ll_ctas_pagada_1 + ll_ctas_pagada_2
		CASE 'd_datos_credito_derecho'
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'derecho_plazo')
			ll_ctas_pagada_1	= dw_datos_credito_oferta.getitemnumber(1,'derecho_cta_pag_la')
			ll_ctas_pagada_2	= dw_datos_credito_oferta.getitemnumber(1,'derecho_cta_pag_isa')
			ll_ctas_pagadas	= ll_ctas_pagada_1 + ll_ctas_pagada_2
		CASE 'd_datos_credito_aumento_capacidad'
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'pago_aumento_nro_cuotas')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'anexo_aumento_cta_pag_m')
	END CHOOSE
end if 
ll_tot_reg				= dw_detalle_pago_cupon.RowCount()
ll_suma_e				= 0
ll_suma_f				= 0
for ll_indi=1 to ll_tot_reg
	ll_num_cupon		= dw_detalle_pago_cupon.getitemnumber(ll_indi,'num_cupon')
	ll_monto_cuota		= dw_detalle_pago_cupon.getitemnumber(ll_indi,'monto_cuota')
	ls_tipo_mov_reg	= dw_detalle_pago_cupon.getitemstring(ll_indi,'tipo_mov')
	if ls_tipo_mov_reg='E' then
		ll_suma_e ++
	elseif ls_tipo_mov_reg='F' then
		ll_suma_f ++
	end if
	if ll_num_cupon<=0 or isnull(ll_num_cupon) then
		messagebox("Advertencia","No es posible Insertar nuevo Item, en Fila Nº  "+string(ll_indi)+"  Cupón Inválido")
		dw_detalle_pago_cupon.setfocus()
		dw_detalle_pago_cupon.scrolltorow(ll_indi)
		dw_detalle_pago_cupon.setcolumn('num_cupon')
		ll_indi			= ll_tot_reg
		ll_sw_pasa		= 1
	elseif ll_monto_cuota<=0 or isnull(ll_monto_cuota) then
		messagebox("Advertencia","No es posible Insertar nuevo Item, en Fila Nº  "+string(ll_indi)+"  Monto Cuota Inválido")
		dw_detalle_pago_cupon.setfocus()
		dw_detalle_pago_cupon.scrolltorow(ll_indi)
		dw_detalle_pago_cupon.setcolumn('monto_cuota')
		ll_indi			= ll_tot_reg
		ll_sw_pasa		= 1
	end if
next
if ll_sw_pasa=0 then
	if ll_suma_e < il_cant_cta_e or il_cant_cta_e=0 then
		ls_pasa_e		= 'S'
	else
		ls_pasa_e		= 'N'
		if il_cant_cta_e=1 then
			messagebox("Advertencia","Recuerde solo Ingresó "+string(il_cant_cta_e)+" Cuota Crédito")
		else
			messagebox("Advertencia","Recuerde solo Ingresó "+string(il_cant_cta_e)+" Pagos de Cuota Crédito")
		end if
		if il_cant_cta_f>0 then
			ll_new			= dw_detalle_pago_cupon.InsertRow(0)
			dw_detalle_pago_cupon.scrolltorow(ll_new)
		end if
	end if
	if ll_suma_f < il_cant_cta_f or il_cant_cta_f=0 then 
		ls_pasa_f		= 'S'
	else
		ls_pasa_f		= 'N'
		if il_cant_cta_f=1 then
			messagebox("Advertencia","Recuerde solo Ingresó "+string(il_cant_cta_f)+" Cuota Mantención")
		else
			messagebox("Advertencia","Recuerde solo Ingresó "+string(il_cant_cta_f)+" Pagos de Cuota Mantención")
		end if
		if il_cant_cta_e>0 then
			ll_new			= dw_detalle_pago_cupon.InsertRow(0)
			dw_detalle_pago_cupon.scrolltorow(ll_new)
		end if
	end if
	if ls_pasa_e='S' and ls_pasa_f='S' then
		IF ll_tot_reg > 0 THEN
			il_n_cupon 				= dw_detalle_pago_cupon.GetItemNumber(dw_detalle_pago_cupon.rowcount(), "num_cupon")
			il_n_cupon ++
		ELSE
			il_n_cupon 				= 0
		END IF
		SELECT	"CUPONERAS_DETALLE"."TIPO_MOV"  
		INTO 		:ls_tipo_mov  
		FROM 		"CUPONERAS_DETALLE"  
		WHERE  ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
				 ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
				 ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
				 ( "CUPONERAS_DETALLE"."NRO_CUPON" = :il_n_cupon )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if dw_detalle_pago_cupon.rowcount()=1 then
				ls_pasa_c		= 'S'
			elseif dw_detalle_pago_cupon.rowcount()>1 then
				if ls_tipo_mov = dw_detalle_pago_cupon.Getitemstring((dw_detalle_pago_cupon.rowcount() - 1),"tipo_mov") then
					ls_pasa_c	= 'S'
				else
					ls_pasa_c	= 'N'
				end if
			end if
			if ls_pasa_c='S' then
				ll_new			= dw_detalle_pago_cupon.InsertRow(0)
				dw_detalle_pago_cupon.scrolltorow(ll_new)
				IF il_n_cupon <> 0 THEN 
					dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.GetRow(), "tipo_mov", ls_tipo_mov)
					dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.GetRow(), "num_cupon", il_n_cupon)
					IF cbx_sin_gastos.Checked THEN
						IF NOT Match(string(dw_detalle_pago_cupon.getitemnumber(ll_new, "monto_cuota")), "[^0-9]") THEN
							dw_detalle_pago_cupon.SetItem(ll_new, "monto_cuota", Double(dw_detalle_pago_cupon.getitemnumber(ll_new, "monto_cuota")))
						END IF
					END IF
					dw_detalle_pago_cupon.AcceptText()
					IF gf_existe_cupon(dw_detalle_pago_cupon.GetItemNumber(ll_new, "num_cupon")) THEN
						MessageBox("Ingreso Cupón", "El Número de cupón ya existe !")
						dw_detalle_pago_cupon.SetItem(ll_new, "num_cupon", 0)
						dw_detalle_pago_cupon.AcceptText()
					ELSE
						if ls_tipo_mov='E' then
							if dw_datos_credito_oferta.dataobject='d_datos_credito_oferta' then
								id_valor_cuota 		= dw_datos_credito_oferta.GetItemNumber(1, "valor_cuota_credito")
								ls_moneda		 		= dw_datos_credito_oferta.GetItemString(1, "moneda")
								ii_dmora 				= dw_datos_credito_oferta.GetItemNumber(1,"c_dias_mora")
								ldt_fecha_prim			= dw_datos_credito_oferta.GetItemdatetime(1,'pago_oferta_fecha_prim')
								ll_ctas_pag				= dw_datos_credito_oferta.GetItemnumber(1,'oferta_v_cta_pag_s')
								ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag ))) //-1
								ll_ctas_mora			= dw_datos_credito_oferta.GetItemNumber(1,'c_cuotas_mora')

							elseif dw_datos_credito_oferta.dataobject='d_datos_credito_liberador' then
								id_valor_cuota 		= dw_datos_credito_oferta.GetItemNumber(1, "pago_liberador_valor_cuota")
								ls_moneda		 		= dw_datos_credito_oferta.GetItemString(1, "pago_liberador_moneda")
								ldt_fecha_prim			= dw_datos_credito_oferta.GetItemdatetime(1,'pago_liberador_fecha_prim')
								ll_ctas_pag				= dw_datos_credito_oferta.GetItemnumber(1,'anexo_liberador_cta_pag_m')
								ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag )))
								ll_ctas_mora			= dw_datos_credito_oferta.GetItemNumber(1,'c_cuotas_mora')
								
							elseif dw_datos_credito_oferta.dataobject='d_datos_credito_pagare' then
								id_valor_cuota 		= dw_datos_credito_oferta.GetItemNumber(1, "valor_cuo")
								ls_moneda		 		= dw_datos_credito_oferta.GetItemString(1, "moneda")
								ldt_fecha_prim			= dw_datos_credito_oferta.GetItemdatetime(1,'fecha_prim')
								ll_ctas_pag				= dw_datos_credito_oferta.GetItemnumber(1,'c_ctas_pag')
								ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag )))
								ll_ctas_mora			= dw_datos_credito_oferta.GetItemNumber(1,'c_cuotas_mora')
								
							elseif dw_datos_credito_oferta.dataobject='d_datos_credito_derecho' then
								id_valor_cuota 		= dw_datos_credito_oferta.GetItemNumber(1, "derecho_valor_cuo")
								ls_moneda		 		= dw_datos_credito_oferta.GetItemString(1, "derecho_moneda")
								ldt_fecha_prim			= dw_datos_credito_oferta.GetItemdatetime(1,'derecho_fecha_prim')
								ll_ctas_pag				= dw_datos_credito_oferta.GetItemnumber(1,'c_ctas_pag')
								ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag )))
								ll_ctas_mora			= dw_datos_credito_oferta.GetItemNumber(1,'c_cuotas_mora')
								
							elseif dw_datos_credito_oferta.dataobject='d_datos_credito_aumento_capacidad' then
								id_valor_cuota 		= dw_datos_credito_oferta.GetItemNumber(1, "pago_aumento_valor_cuota")
								ls_moneda		 		= dw_datos_credito_oferta.GetItemString(1, "pago_aumento_moneda")
								ldt_fecha_prim			= dw_datos_credito_oferta.GetItemdatetime(1,'pago_aumento_fecha_prim')
								ll_ctas_pag				= dw_datos_credito_oferta.GetItemnumber(1,'anexo_aumento_cta_pag_m')
								ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag )))
								ll_ctas_mora			= dw_datos_credito_oferta.GetItemNumber(1,'c_cuotas_mora')
								
							elseif dw_datos_credito_oferta.dataobject='d_datos_credito_reprog' then
								id_valor_cuota 		= dw_datos_credito_oferta.GetItemNumber(1, "repacta_mantencion_valor_cuota_uf")
								ls_moneda		 		= dw_datos_credito_oferta.GetItemString(1, "repacta_mantencion_tipo_moneda")
								ldt_fecha_prim			= dw_datos_credito_oferta.GetItemdatetime(1,'repacta_mantencion_fecha_primera_cta')
								ll_ctas_pag				= dw_datos_credito_oferta.GetItemnumber(1,'repacta_mantencion_ctas_pagadas')
								ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag )))
								ll_ctas_mora			= dw_datos_credito_oferta.GetItemNumber(1,'c_cuotas_mora')
								
							elseif dw_datos_credito_oferta.dataobject='d_datos_credito_isa' then
								id_valor_cuota 	= dw_datos_credito_oferta.GetItemNumber(1, "contrato_valor_cuo")
								ls_moneda		 	= dw_datos_credito_oferta.GetItemString(1, "contrato_moneda")
							end if				

							if ls_moneda='2' then
								id_valor_cuota	= round((id_valor_cuota * gd_uf), 0 )
							end if
							if ll_ctas_pagadas>ll_ctas then
								messagebox("Advertencia","No es Posible Ingresar Cupón, Crédito CANCELADO")
								dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.GetRow(), "num_cupon", 0)
								dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.GetRow(), "c_mora", 0)
								dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.GetRow(), 'monto_cuota', 0)
								dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.GetRow(), 'int_mora', 0)
								dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.GetRow(), 'g_cobranza', 0)
								ls_pasa			= 'N'
							else
								ls_pasa			= 'S'
							end if
						elseif ls_tipo_mov='F' then
							id_valor_cuota 	= Round((dw_datos_credito_oferta.GetItemNumber(1, "valor_cuota_mantencion") * gd_uf), 0)
							ls_pasa				= 'S'
						end if
						if ls_pasa='S' then
							if ls_tipo_mov='E' then 
								if dw_datos_credito_oferta.dataobject='d_datos_credito_oferta' then
									ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'pago_oferta_nro_cuotas')
									ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'oferta_v_cta_pag_s')
									ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'pago_oferta_fecha_ult')
									ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'pago_oferta_fecha_prim')
								elseif dw_datos_credito_oferta.dataobject='d_datos_credito_liberador' then
									ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'pago_liberador_nro_cuotas')
									ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'anexo_liberador_cta_pag_m')
									ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'pago_liberador_fecha_ult')
									ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'pago_liberador_fecha_prim')
								elseif dw_datos_credito_oferta.dataobject='d_datos_credito_pagare' then
									ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'plazo')
									ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'c_ctas_pag')
									ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'fecha_ult')
									ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'fecha_prim')
								elseif dw_datos_credito_oferta.dataobject='d_datos_credito_derecho' then
									ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'derecho_plazo')
									ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'c_ctas_pag')
									ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'derecho_fecha_ult')
									ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'derecho_fecha_prim')
								elseif dw_datos_credito_oferta.dataobject='d_datos_credito_aumento_capacidad' then
									ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'pago_aumento_nro_cuotas')
									ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'anexo_aumento_cta_pag_m')
									ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'pago_aumento_fecha_ult')
									ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'pago_aumento_fecha_prim')
								elseif dw_datos_credito_oferta.dataobject='d_datos_credito_reprog' then
									ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
									ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
									ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'repacta_mantencion_fecha_ult')
									ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
								elseif dw_datos_credito_oferta.dataobject='d_datos_credito_isa' then
									ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'contrato_plazo')
									ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'ctas_pagadas')
									ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'contrato_fecha_ult')
									ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'contrato_fecha_prim')
								end if
								if ll_plazo <= ll_ctas_pag then
									ldt_fecha_prox_pago_e	= date(ldt_fecha_ult)
								else
									ll_sum_pag					= ll_suma_e
									ldt_fecha_prox_pago_e	= funcion_venc( ldt_fecha_prim , ( ll_ctas_pag + ll_sum_pag))
								end if
								SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
								INTO 		:ldt_venc_cred_min  
								FROM 		"CUPONERAS_DETALLE",   
											"CUPONERAS"  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = "CUPONERAS"."BASE" ) and  
										 ( "CUPONERAS_DETALLE"."SERIE" = "CUPONERAS"."SERIE" ) and  
										 ( "CUPONERAS_DETALLE"."NUMERO" = "CUPONERAS"."NUMERO" ) and  
										 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = "CUPONERAS"."NRO_CUPONERA" ) and  
										 (("CUPONERAS"."BASE" = :gs_base ) AND  
										 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) )   
								USING		sqlca;
								if not isnull(ldt_venc_cred_min) then
									SELECT	"CUPONERAS_DETALLE"."NRO_CUPON" 
									INTO 		:ll_num_cupon_corr  
									FROM 		"CUPONERAS_DETALLE",   
												"CUPONERAS"  
									WHERE  ( "CUPONERAS_DETALLE"."BASE" = "CUPONERAS"."BASE" ) and  
											 ( "CUPONERAS_DETALLE"."SERIE" = "CUPONERAS"."SERIE" ) and  
											 ( "CUPONERAS_DETALLE"."NUMERO" = "CUPONERAS"."NUMERO" ) and  
											 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = "CUPONERAS"."NRO_CUPONERA" ) and  
											 (("CUPONERAS"."BASE" = :gs_base ) AND  
											 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
											 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_venc_cred_min ) AND  
											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
											 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND
											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) )   
									USING		sqlca;
									if ll_num_cupon_corr <> il_n_cupon and ll_num_cupon_corr>0 then
										ll_resp	= messagebox("Advertencia","Recuerde Nº Cupón de CREDITO que Corresponde es:  "+string(ll_num_cupon_corr)+"  desea Reemplazarlo",Exclamation!,YesNo!,2)
										if ll_resp=1 then
											il_n_cupon		= ll_num_cupon_corr
											dw_detalle_pago_cupon.deleterow(dw_detalle_pago_cupon.rowcount())
											ll_nvo_reg		= dw_detalle_pago_cupon.insertrow(0)
											dw_detalle_pago_cupon.scrolltorow(ll_nvo_reg)
											dw_detalle_pago_cupon.SetItem(ll_nvo_reg, "tipo_mov", ls_tipo_mov)
											dw_detalle_pago_cupon.SetItem(ll_nvo_reg, "num_cupon", il_n_cupon)
											dw_detalle_pago_cupon.accepttext()
										end if
									end if
								end if
								if ll_num_cupon_corr>0 or il_n_cupon>0 then
									dw_dias_mora.reset()
									ld_fecha_inicial		= ld_fecha_prox_pago
									ll_dia_prox_pago		= day(ld_fecha_prox_pago)
									ll_day					= day(ld_fecha_inicial)
									ll_month					= month(ld_fecha_inicial)
									ll_year					= year(ld_fecha_inicial)
									if (ll_month=1 and ll_day>=31) or (ll_month=2 and ll_day>=28) or (ll_month=3 and ll_day>=31) or &
										(ll_month=4 and ll_day>=30) or (ll_month=5 and ll_day>=31) or (ll_month=6 and ll_day>=30) or &
										(ll_month=7 and ll_day>=31) or (ll_month=8 and ll_day>=31) or (ll_month=9 and ll_day>=30) or &
										(ll_month=10 and ll_day>=31) or (ll_month=11 and ll_day>=30) or (ll_month=12 and ll_day>=31) then
										ls_pasa				= 'S'
									else
										ls_pasa				= 'N'
									end if
									ll_max					= 1000
									FOR i = 1 TO ll_max //ll_ctas_mora
										ll_new				= dw_dias_mora.insertrow(0)
										dw_dias_mora.scrolltorow(ll_new)
										ll_day				= day(ld_fecha_inicial)
										ll_month				= month(ld_fecha_inicial)
										ll_year				= year(ld_fecha_inicial)
										ll_month	++
										if (ll_month=1 and ll_dia_prox_pago>31) then
											ls_pasa			= 'S'
											ll_day			= 31
										elseif (ll_month=2 and ll_dia_prox_pago>28) or (ll_month=2 and ll_day>28) then
											ls_pasa			= 'S'
											ll_day			= 28
										elseif (ll_month=3 and ll_dia_prox_pago>31) then
											ls_pasa			= 'S'
											ll_day			= 31
										elseif (ll_month=4 and ll_dia_prox_pago>30) then
											ls_pasa			= 'S'
											ll_day			= 30
										elseif (ll_month=5 and ll_dia_prox_pago>31) then
											ls_pasa			= 'S'
											ll_day			= 31
										elseif (ll_month=6 and ll_dia_prox_pago>30) then
											ls_pasa			= 'S'
											ll_day			= 30
										elseif (ll_month=7 and ll_dia_prox_pago>31) then
											ls_pasa			= 'S'
											ll_day			= 31
										elseif (ll_month=8 and ll_dia_prox_pago>31) then
											ls_pasa			= 'S'
											ll_day			= 31
										elseif (ll_month=9 and ll_dia_prox_pago>30) then
											ls_pasa			= 'S'
											ll_day			= 30
										elseif (ll_month=10 and ll_dia_prox_pago>31) then
											ls_pasa			= 'S'
											ll_day			= 31
										elseif (ll_month=11 and ll_dia_prox_pago>30) then
											ls_pasa			= 'S'
											ll_day			= 30
										elseif (ll_month=12 and ll_dia_prox_pago>31) then
											ls_pasa			= 'S'
											ll_day			= 31
										end if
										if ll_month>12 then
											ll_year ++
											ll_month			= 1
											if (ll_month=1 and ls_pasa='S') then
												ls_pasa		= 'S'
												ll_day		= 31
											end if
										end if
//										if ll_month = 2 and ll_day > 28 then ll_day = 28
										ls_fecha						= string(ll_day,'00')+'/'+string(ll_month,'00')+'/'+string(ll_year,'0000')
										ld_fecha_prox_venc		= date(ls_fecha)
										dw_dias_mora.setitem(ll_new,'fecha_inicial',ld_fecha_inicial)
										if ld_fecha_prox_venc > ld_fecha_hoy then 
											ld_fecha_prox_venc	= ld_fecha_hoy
										end if
										dw_dias_mora.setitem(ll_new,'fecha_venc',ld_fecha_prox_venc)
										if ld_fecha_prox_venc < ld_fecha_hoy then
											ll_dias_dif				= 0
											ll_dias_dif				= DaysAfter(ld_fecha_inicial, ld_fecha_prox_venc)
											if ll_dias_dif<=0 then ll_dias_dif=0
											dw_dias_mora.setitem(ll_new,'dias_mora',ll_dias_dif)
											ld_fecha_inicial		= ld_fecha_prox_venc
										else
											ll_dias_dif				= 0
											ll_dias_dif				= DaysAfter(ld_fecha_inicial, ld_fecha_hoy) //ld_fecha_prox_venc)
											if ll_dias_dif<=0 then ll_dias_dif=0
											dw_dias_mora.setitem(ll_new,'dias_mora',ll_dias_dif)
											ld_fecha_inicial		= ld_fecha_prox_venc
											ll_suma_dias			= ll_suma_dias + ll_dias_dif
											exit
										end if
										ll_suma_dias				= ll_suma_dias + ll_dias_dif
									NEXT
									ll_tot_fila						= dw_dias_mora.rowcount()
									for ll_reg=1 to ll_tot_fila
										ll_suma_dias				= ll_suma_dias - ll_dias_mora
										dw_dias_mora.setitem(ll_reg,'suma_dias',ll_suma_dias)
										ll_dias_mora				= dw_dias_mora.getitemnumber(ll_reg,'dias_mora')
									next
									dw_dias_mora.accepttext()		
									ii_dmora				= 0
									ii_mora_cobro		= 0
									id_im					= 0
									id_gc					= 0
									dw_detalle_pago_cupon.accepttext()
									dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.rowcount(), "monto_cuota", id_valor_cuota)
									if dw_detalle_pago_cupon.rowcount() <= ll_ctas_mora then
										ll_calc_dias			= dw_dias_mora.getitemnumber(dw_detalle_pago_cupon.rowcount(),'dias_mora')
										ii_dmora					= dw_dias_mora.getitemnumber(dw_detalle_pago_cupon.rowcount(),'suma_dias_acum')
										ld_dias_sum_mora		= dw_dias_mora.getitemnumber(dw_detalle_pago_cupon.rowcount(),'suma_dias')
									else
										ll_calc_dias			= 0
										ii_dmora					= 0
										ld_dias_sum_mora		= 0
									end if
									IF ld_dias_sum_mora > 5 AND NOT(cbx_sin_gastos.Checked) THEN
										ii_mora_cobro 			= ld_dias_sum_mora	//(ii_dmora - (i - 1) * ll_calc_dias)
										id_im 					= id_im + gf_int_mora(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1,"c_tasa"), ii_mora_cobro, id_valor_cuota)
										IF ld_dias_sum_mora > ll_calc_dias  THEN		//(ii_dmora - (i - 1) * ll_calc_dias)
											id_gc 				= id_gc + Round(id_valor_cuota * id_factor_gc, 0)
										END IF
									ELSE
			//								ii_mora_cobro 	= 0
			//								id_im 			= 0
			//								id_gc 			= 0
									END IF

									dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.rowcount(), "g_cobranza", id_gc) // J 10% SE CAMBIA A 5% DESDE 10/01/2000
									dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.rowcount(), "int_mora", id_im)
									dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.rowcount(), "c_mora", ii_mora_cobro) 
//									IF (ii_dmora - (dw_detalle_pago_cupon.rowcount() - 1) * 30) > 5 AND NOT(cbx_sin_gastos.Checked) THEN
//										ii_mora_cobro 	= (ii_dmora - (dw_detalle_pago_cupon.rowcount() - 1) * 30)
//										id_im 			= round(gf_int_mora(dw_datos_credito_oferta.GetItemNumber(1, "f_tasa"), ii_mora_cobro, id_valor_cuota),0)
//										IF (ii_dmora - (dw_detalle_pago_cupon.rowcount() - 1) * 30) > 30 AND NOT(cbx_sin_gastos.Checked) THEN		
//											id_gc 		= Round(id_valor_cuota * id_factor_gc, 0)
//										END IF
//									ELSE
//										ii_mora_cobro 	= 0
//										id_im 			= 0
//										id_gc 			= 0
//									END IF	
								end if
							elseif ls_tipo_mov='F' then
								if gs_base='O' or gs_base='C' then
									if dw_datos_credito_oferta.dataobject='d_datos_credito_oferta' then
										ld_fecha_m			= date(dw_datos_credito_oferta.getitemdatetime(1,'oferta_v_fecha_m'))
										ll_ctas_pag_m		= dw_datos_credito_oferta.getitemnumber(1,'oferta_v_cta_pag_m')
									elseif dw_datos_credito_oferta.dataobject='d_datos_credito_isa' then
										ld_fecha_m			= date(dw_datos_credito_oferta.getitemdatetime(1,'contrato_fecha_m'))
										ll_ctas_pag_m		= dw_datos_credito_oferta.getitemnumber(1,'contrato_cta_pag_m')
									end if
									if isnull(ll_ctas_pag_m) then ll_ctas_pag_m=0
									ll_sum_pag_m				= ll_suma_f
									ll_year						= year(ld_fecha_m) - 1
									ll_ano						= ll_year +  ll_ctas_pag_m + ll_sum_pag_m
									ldt_fecha_prox_pago_f	= date(string(day(ld_fecha_m),"00")+'/'+string(month(ld_fecha_m),"00")+'/'+ string(ll_ano,"0000"))
	//								ldt_fecha_prox_pago_f	= date(dw_datos_credito_oferta.getitemdatetime(1,'c_prox_pago_anno'))
									SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
									INTO 		:ldt_venc_mant_min  
									FROM 		"CUPONERAS_DETALLE",   
												"CUPONERAS"  
									WHERE  ( "CUPONERAS_DETALLE"."BASE" = "CUPONERAS"."BASE" ) and  
											 ( "CUPONERAS_DETALLE"."SERIE" = "CUPONERAS"."SERIE" ) and  
											 ( "CUPONERAS_DETALLE"."NUMERO" = "CUPONERAS"."NUMERO" ) and  
											 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = "CUPONERAS"."NRO_CUPONERA" ) and  
											 (("CUPONERAS"."BASE" = :gs_base ) AND  
											 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
											 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND
											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) )   
									USING		sqlca;
									if not isnull(ldt_venc_mant_min) then
										SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
										INTO 		:ll_num_cupon_corr  
										FROM 		"CUPONERAS_DETALLE",   
													"CUPONERAS"  
										WHERE  ( "CUPONERAS_DETALLE"."BASE" = "CUPONERAS"."BASE" ) and  
												 ( "CUPONERAS_DETALLE"."SERIE" = "CUPONERAS"."SERIE" ) and  
												 ( "CUPONERAS_DETALLE"."NUMERO" = "CUPONERAS"."NUMERO" ) and  
												 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = "CUPONERAS"."NRO_CUPONERA" ) and  
												 (("CUPONERAS"."BASE" = :gs_base ) AND  
												 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
												 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
												 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_venc_mant_min ) AND  
												 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
												 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND
												 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) )   
										USING		sqlca;
										if ll_num_cupon_corr <> il_n_cupon and ll_num_cupon_corr>0 then
											ll_resp	= messagebox("Advertencia","Recuerde Nº Cupón de MANTENCION que Corresponde es:  "+string(ll_num_cupon_corr)+"  desea Reemplazarlo",Exclamation!,YesNo!,2)
											if ll_resp=1 then
												il_n_cupon	= ll_num_cupon_corr
												dw_detalle_pago_cupon.reset()
												ll_nvo_reg		= dw_detalle_pago_cupon.insertrow(0)
												dw_detalle_pago_cupon.SetItem(ll_nvo_reg, "tipo_mov", ls_tipo_mov)
												dw_detalle_pago_cupon.SetItem(ll_nvo_reg, "num_cupon", il_n_cupon)
												dw_detalle_pago_cupon.accepttext()
											end if
										end if
									end if
									dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.getrow(), "monto_cuota", id_valor_cuota)
									SELECT "TASA"."GASTO_COB_MORA" INTO :id_interes_gc FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
									if gs_base='O' then
										id_valor_cuota	= round((dw_datos_credito_oferta.GetItemNumber(1,"oferta_v_valor_cuota_m") * gd_uf), 0)
									elseif gs_base='C' then
										id_valor_cuota	= round((dw_datos_credito_oferta.GetItemNumber(1,"contrato_valor_cuota_m") * gd_uf), 0)
									end if
			//						id_valor_cuota 	= Round(dw_datos_credito_oferta.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
									ii_dmora 			= dw_datos_credito_oferta.GetItemNumber(1,"c_dias_mora_mant")
									IF (ii_dmora - (dw_detalle_pago_cupon.getrow() - 1) * 365) > 5 THEN 
										ii_mora_cobro		= (ii_dmora - (dw_detalle_pago_cupon.getrow() - 1) * 365)
										id_im 				= id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota)
										IF (ii_dmora - (dw_detalle_pago_cupon.getrow() - 1) * 365) > 30 THEN 
											 id_gc 			= id_gc + Round(id_valor_cuota * id_interes_gc, 0) //005// CAMBIO DE 10 A 5%
										END IF
									else
										ii_mora_cobro 	= 0
										id_im 			= 0
										id_gc 			= 0
									END IF
									dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.getrow(), "g_cobranza", id_gc) // J 10% SE CAMBIA A 5% DESDE 10/01/2000
									dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.getrow(), "int_mora", id_im)
									dw_detalle_pago_cupon.SetItem(dw_detalle_pago_cupon.getrow(), "c_mora", ii_mora_cobro) 
								end if
							end if
						end if
					END IF
				end if
			else
				ll_new			= dw_detalle_pago_cupon.InsertRow(0)
				dw_detalle_pago_cupon.scrolltorow(ll_new)
			end if
		else
			ll_new				= dw_detalle_pago_cupon.InsertRow(0)
			dw_detalle_pago_cupon.scrolltorow(ll_new)
		end if
	end if
	cb_forma_pago.Enabled	= True
end if
tab_ingreso.tp_cupon.dw_detalle_pago_cupon.accepttext()
tab_ingreso.tp_cupon.dw_detalle_pago_cupon.scrolltorow(ll_new)
tab_ingreso.tp_cupon.dw_detalle_pago_cupon.setfocus()
tab_ingreso.tp_cupon.dw_detalle_pago_cupon.setcolumn('num_cupon')
end event

type dw_detalle_pago_cupon from datawindow within tp_cupon
integer x = 14
integer y = 156
integer width = 2802
integer height = 488
integer taborder = 30
string dataobject = "d_detalle_pago_cupon_ci"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;double	id_valor_cuota, id_gc, id_im,id_interes_gc
Long	 	ii_dmora, ii_mora_cobro,ll_ctas,ll_ctas_pagadas,ll_ctas_pagada_1,ll_ctas_pagada_2,&
			ll_num_cupon,ll_new,ll_indi,ll_tot_reg,ll_sum_e,ll_num_cupon_corr,ll_resp,ll_nvo_reg,&
			ll_plazo,ll_ctas_pag,ll_sum_pag,ll_sum_f,ll_ctas_pag_m,ll_sum_pag_m,ll_ano,ll_year,ll_ctas_mora,&
			ll_day,ll_month,i,ll_dias_dif,ll_suma_dias,ll_tot_fila,ll_reg,ll_dias_mora,ll_calc_dias,&
			ld_dias_sum_mora,ll_dia_prox_pago,ll_max
string 	is_columna,ls_tipo_mov,ls_pasa,ls_moneda,ls_tipo_mov_fila,ls_fecha,ls_estado_pago
Date		ldt_fecha_prox_pago_e,ldt_fecha_prox_pago_f,ld_fecha_m,ld_fecha_prox_pago,ld_fecha_inicial,&
			ld_fecha_prox_venc,ld_fecha_hoy
Datetime	ldt_fecha_ult,ldt_fecha_prim,ldt_venc_cred_min,ldt_venc_mant_min

this.accepttext()
if dw_datos_credito_oferta.rowcount()>0 then
	ld_fecha_hoy				= date(gdt_fec_sistema)
	CHOOSE CASE dw_datos_credito_oferta.dataobject
		CASE 'd_datos_credito_oferta'
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'pago_oferta_nro_cuotas')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'oferta_v_cta_pag_s')
		CASE 'd_datos_credito_liberador'
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'pago_liberador_nro_cuotas')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'anexo_liberador_cta_pag_m')
		CASE 'd_datos_credito_pagare'
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'plazo')
			ll_ctas_pagada_1	= dw_datos_credito_oferta.getitemnumber(1,'cta_pag_la')
			ll_ctas_pagada_2	= dw_datos_credito_oferta.getitemnumber(1,'cta_pag_isa')
			ll_ctas_pagadas	= ll_ctas_pagada_1 + ll_ctas_pagada_2
		CASE 'd_datos_credito_derecho'
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'derecho_plazo')
			ll_ctas_pagada_1	= dw_datos_credito_oferta.getitemnumber(1,'derecho_cta_pag_la')
			ll_ctas_pagada_2	= dw_datos_credito_oferta.getitemnumber(1,'derecho_cta_pag_isa')
			ll_ctas_pagadas	= ll_ctas_pagada_1 + ll_ctas_pagada_2
		CASE 'd_datos_credito_aumento_capacidad'
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'pago_aumento_nro_cuotas')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'anexo_aumento_cta_pag_m')
		CASE 'd_datos_credito_reprog'
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
		CASE 'd_datos_credito_isa'
			ll_ctas				= dw_datos_credito_oferta.getitemnumber(1,'contrato_plazo')
			ll_ctas_pagadas	= dw_datos_credito_oferta.getitemnumber(1,'ctas_pagadas')
	END CHOOSE
end if
is_columna 			= dwo.name //GetColumnName()
IF is_columna = "monto_cuota" AND cbx_sin_gastos.Checked=true THEN
	IF NOT Match(data, "[^0-9]") THEN
		SetItem(row, "monto_cuota", Double(data))
		RETURN 2
	END IF
ELSE
	IF is_columna = "monto_cuota" THEN RETURN 2
END IF
this.AcceptText()
IF gf_existe_cupon(GetItemNumber(row, "num_cupon")) THEN
	MessageBox("Ingreso Cupón", "El Número de Cupón ya Existe")
	this.SetItem(row, "num_cupon", 0)
	this.AcceptText()
ELSE
	ll_num_cupon				= this.GetItemNumber(row, "num_cupon")
	if ll_num_cupon > 0 then
		SELECT	"CUPONERAS_DETALLE"."TIPO_MOV",   
         		"CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON"  
    	INTO 		:ls_tipo_mov,   
         		:ls_estado_pago
    	FROM 		"CUPONERAS_DETALLE"  
   	WHERE  ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
				 ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
				 ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
				 ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_num_cupon )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			SetItem(row, "tipo_mov", ls_tipo_mov)
			ll_sum_e				= 0
			ll_sum_f				= 0
			ll_tot_reg			= dw_detalle_pago_cupon.rowcount()
			if ll_tot_reg>0 then
				for ll_indi=1 to ll_tot_reg
					ls_tipo_mov_fila	= dw_detalle_pago_cupon.getitemstring(ll_indi,'tipo_mov')
					if ls_tipo_mov_fila='E' and ll_num_cupon>0 then
						ll_sum_e	++
					elseif ls_tipo_mov_fila='F' and ll_num_cupon>0 then
						ll_sum_f	++
					end if
				next
				if isnull(ll_sum_e) then ll_sum_e=0
				if isnull(ll_sum_f) then ll_sum_f=0
			end if
			if ls_tipo_mov='E' then
				if dw_datos_credito_oferta.dataobject='d_datos_credito_oferta' then
					id_valor_cuota 		= dw_datos_credito_oferta.GetItemNumber(1, "valor_cuota_credito")
					ls_moneda		 		= dw_datos_credito_oferta.GetItemString(1, "moneda")
					ii_dmora 				= dw_datos_credito_oferta.GetItemNumber(1,"c_dias_mora")
					ldt_fecha_prim			= dw_datos_credito_oferta.GetItemdatetime(1,'pago_oferta_fecha_prim')
					ll_ctas_pag				= dw_datos_credito_oferta.GetItemnumber(1,'oferta_v_cta_pag_s')
					ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag ))) //-1
					ll_ctas_mora			= dw_datos_credito_oferta.GetItemNumber(1,'c_cuotas_mora')
					
				elseif dw_datos_credito_oferta.dataobject='d_datos_credito_liberador' then
					id_valor_cuota 		= dw_datos_credito_oferta.GetItemNumber(1, "pago_liberador_valor_cuota")
					ls_moneda		 		= dw_datos_credito_oferta.GetItemString(1, "pago_liberador_moneda")
					ldt_fecha_prim			= dw_datos_credito_oferta.GetItemdatetime(1,'pago_liberador_fecha_prim')
					ll_ctas_pag				= dw_datos_credito_oferta.GetItemnumber(1,'anexo_liberador_cta_pag_m')
					ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag )))
					ll_ctas_mora			= dw_datos_credito_oferta.GetItemNumber(1,'c_cuotas_mora')
					
				elseif dw_datos_credito_oferta.dataobject='d_datos_credito_pagare' then
					id_valor_cuota 		= dw_datos_credito_oferta.GetItemNumber(1, "valor_cuo")
					ls_moneda		 		= dw_datos_credito_oferta.GetItemString(1, "moneda")
					ldt_fecha_prim			= dw_datos_credito_oferta.GetItemdatetime(1,'fecha_prim')
					ll_ctas_pag				= dw_datos_credito_oferta.GetItemnumber(1,'c_ctas_pag')
					ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag )))
					ll_ctas_mora			= dw_datos_credito_oferta.GetItemNumber(1,'c_cuotas_mora')
					
				elseif dw_datos_credito_oferta.dataobject='d_datos_credito_derecho' then
					id_valor_cuota 		= dw_datos_credito_oferta.GetItemNumber(1, "derecho_valor_cuo")
					ls_moneda		 		= dw_datos_credito_oferta.GetItemString(1, "derecho_moneda")
					ldt_fecha_prim			= dw_datos_credito_oferta.GetItemdatetime(1,'derecho_fecha_prim')
					ll_ctas_pag				= dw_datos_credito_oferta.GetItemnumber(1,'c_ctas_pag')
					ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag )))
					ll_ctas_mora			= dw_datos_credito_oferta.GetItemNumber(1,'c_cuotas_mora')
					
				elseif dw_datos_credito_oferta.dataobject='d_datos_credito_aumento_capacidad' then
					id_valor_cuota 		= dw_datos_credito_oferta.GetItemNumber(1, "pago_aumento_valor_cuota")
					ls_moneda		 		= dw_datos_credito_oferta.GetItemString(1, "pago_aumento_moneda")
					ldt_fecha_prim			= dw_datos_credito_oferta.GetItemdatetime(1,'pago_aumento_fecha_prim')
					ll_ctas_pag				= dw_datos_credito_oferta.GetItemnumber(1,'anexo_aumento_cta_pag_m')
					ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag )))
					ll_ctas_mora			= dw_datos_credito_oferta.GetItemNumber(1,'c_cuotas_mora')
					
				elseif dw_datos_credito_oferta.dataobject='d_datos_credito_reprog' then
					id_valor_cuota 		= dw_datos_credito_oferta.GetItemNumber(1, "repacta_mantencion_valor_cuota_uf")
					ls_moneda		 		= dw_datos_credito_oferta.GetItemString(1, "repacta_mantencion_tipo_moneda")
					ldt_fecha_prim			= dw_datos_credito_oferta.GetItemdatetime(1,'repacta_mantencion_fecha_primera_cta')
					ll_ctas_pag				= dw_datos_credito_oferta.GetItemnumber(1,'repacta_mantencion_ctas_pagadas')
					ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag )))
					ll_ctas_mora			= dw_datos_credito_oferta.GetItemNumber(1,'c_cuotas_mora')
					
				elseif dw_datos_credito_oferta.dataobject='d_datos_credito_isa' then
					id_valor_cuota 	= dw_datos_credito_oferta.GetItemNumber(1, "contrato_valor_cuo")
					ls_moneda		 	= dw_datos_credito_oferta.GetItemString(1, "contrato_moneda")
				end if				
				if ls_moneda='2' then
					id_valor_cuota	= round((id_valor_cuota * gd_uf), 0 )
				end if
				if (ll_ctas_pagadas + ll_sum_e)>ll_ctas then
					messagebox("Advertencia","No es Posible Ingresar Cupón, Crédito CANCELADO")
					dw_detalle_pago_cupon.deleterow(row)
					ll_new	= dw_detalle_pago_cupon.insertrow(0)
					dw_detalle_pago_cupon.scrolltorow(ll_new)
					ls_pasa			= 'N'
				else
					ls_pasa			= 'S'
				end if
			elseif ls_tipo_mov='F' then
				if gs_base='O' then
					id_valor_cuota	= round((dw_datos_credito_oferta.GetItemNumber(1,"oferta_v_valor_cuota_m") * gd_uf), 0)
				elseif gs_base='C' then
					id_valor_cuota	= round((dw_datos_credito_oferta.GetItemNumber(1,"contrato_valor_cuota_m") * gd_uf), 0)
				end if
				ls_pasa				= 'S'
			end if
			if ls_pasa='S' then
				if ls_tipo_mov='E' then 
					if dw_datos_credito_oferta.dataobject='d_datos_credito_oferta' then
						ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'pago_oferta_nro_cuotas')
						ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'oferta_v_cta_pag_s')
						ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'pago_oferta_fecha_ult')
						ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'pago_oferta_fecha_prim')
					elseif dw_datos_credito_oferta.dataobject='d_datos_credito_liberador' then
						ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'pago_liberador_nro_cuotas')
						ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'anexo_liberador_cta_pag_m')
						ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'pago_liberador_fecha_ult')
						ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'pago_liberador_fecha_prim')
					elseif dw_datos_credito_oferta.dataobject='d_datos_credito_pagare' then
						ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'plazo')
						ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'c_ctas_pag')
						ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'fecha_ult')
						ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'fecha_prim')
					elseif dw_datos_credito_oferta.dataobject='d_datos_credito_derecho' then
						ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'derecho_plazo')
						ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'c_ctas_pag')
						ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'derecho_fecha_ult')
						ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'derecho_fecha_prim')
					elseif dw_datos_credito_oferta.dataobject='d_datos_credito_aumento_capacidad' then
						ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'pago_aumento_nro_cuotas')
						ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'anexo_aumento_cta_pag_m')
						ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'pago_aumento_fecha_ult')
						ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'pago_aumento_fecha_prim')
					elseif dw_datos_credito_oferta.dataobject='d_datos_credito_reprog' then
						ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
						ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
						ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'repacta_mantencion_fecha_ult')
						ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
					elseif dw_datos_credito_oferta.dataobject='d_datos_credito_isa' then
						ll_plazo			= dw_datos_credito_oferta.getitemnumber(1,'contrato_plazo')
						ll_ctas_pag		= dw_datos_credito_oferta.getitemnumber(1,'ctas_pagadas')
						ldt_fecha_ult	= dw_datos_credito_oferta.getitemdatetime(1,'contrato_fecha_ult')
						ldt_fecha_prim	= dw_datos_credito_oferta.getitemdatetime(1,'contrato_fecha_prim')
					end if
						
					if ll_plazo <= ll_ctas_pag then
						ldt_fecha_prox_pago_e	= date(ldt_fecha_ult)
					else
						ll_sum_pag					= ll_sum_e - 1
						ldt_fecha_prox_pago_e	= funcion_venc( ldt_fecha_prim , ( ll_ctas_pag + ll_sum_pag))
					end if
//					ldt_fecha_prox_pago_e	= date(dw_datos_credito_oferta.getitemdatetime(1,'c_prox_pago'))
					SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
					INTO 		:ldt_venc_cred_min  
					FROM 		"CUPONERAS_DETALLE",   
								"CUPONERAS"  
					WHERE  ( "CUPONERAS_DETALLE"."BASE" = "CUPONERAS"."BASE" ) and  
							 ( "CUPONERAS_DETALLE"."SERIE" = "CUPONERAS"."SERIE" ) and  
							 ( "CUPONERAS_DETALLE"."NUMERO" = "CUPONERAS"."NUMERO" ) and  
							 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = "CUPONERAS"."NRO_CUPONERA" ) and  
							 (("CUPONERAS"."BASE" = :gs_base ) AND  
							 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
							 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
							 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
							 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND
							 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) )   
					USING		sqlca;
					if not isnull(ldt_venc_cred_min) then
						SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
						INTO 		:ll_num_cupon_corr  
						FROM 		"CUPONERAS_DETALLE",   
									"CUPONERAS"  
						WHERE  ( "CUPONERAS_DETALLE"."BASE" = "CUPONERAS"."BASE" ) and  
								 ( "CUPONERAS_DETALLE"."SERIE" = "CUPONERAS"."SERIE" ) and  
								 ( "CUPONERAS_DETALLE"."NUMERO" = "CUPONERAS"."NUMERO" ) and  
								 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = "CUPONERAS"."NRO_CUPONERA" ) and  
								 (("CUPONERAS"."BASE" = :gs_base ) AND  
								 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
								 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
								 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_venc_cred_min ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
								 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) )   
						USING		sqlca;
						if ll_num_cupon_corr <> ll_num_cupon and ll_num_cupon_corr>0 then
							ll_resp	= messagebox("Advertencia","Recuerde Nº Cupón de CREDITO que Corresponde es:  "+string(ll_num_cupon_corr)+"  desea Reemplazarlo",Exclamation!,YesNo!,2)
							if ll_resp=1 then
								ll_num_cupon	= ll_num_cupon_corr
	//							dw_detalle_pago_cupon.reset()
								dw_detalle_pago_cupon.deleterow(dw_detalle_pago_cupon.rowcount())
								ll_nvo_reg		= dw_detalle_pago_cupon.insertrow(0)
								dw_detalle_pago_cupon.scrolltorow(ll_nvo_reg)
								dw_detalle_pago_cupon.SetItem(ll_nvo_reg, "tipo_mov", ls_tipo_mov)
								dw_detalle_pago_cupon.SetItem(ll_nvo_reg, "num_cupon", ll_num_cupon)
								dw_detalle_pago_cupon.accepttext()
							end if
						end if
					end if
					if ll_num_cupon_corr=0 or isnull(ll_num_cupon_corr) then
						messagebox("Advertencia","No Existe Cupón para esta Cuota Crédito")
					else
						dw_dias_mora.reset()
						ld_fecha_inicial		= ld_fecha_prox_pago
						ll_dia_prox_pago		= day(ld_fecha_prox_pago)
						ll_day					= day(ld_fecha_inicial)
						ll_month					= month(ld_fecha_inicial)
						ll_year					= year(ld_fecha_inicial)
						if (ll_month=1 and ll_day>=31) or (ll_month=2 and ll_day>=28) or (ll_month=3 and ll_day>=31) or &
							(ll_month=4 and ll_day>=30) or (ll_month=5 and ll_day>=31) or (ll_month=6 and ll_day>=30) or &
							(ll_month=7 and ll_day>=31) or (ll_month=8 and ll_day>=31) or (ll_month=9 and ll_day>=30) or &
							(ll_month=10 and ll_day>=31) or (ll_month=11 and ll_day>=30) or (ll_month=12 and ll_day>=31) then
							ls_pasa				= 'S'
						else
							ls_pasa				= 'N'
						end if
						ll_max					= 1000
						FOR i = 1 TO ll_max //ll_ctas_mora
							ll_new				= dw_dias_mora.insertrow(0)
							dw_dias_mora.scrolltorow(ll_new)
							ll_day				= day(ld_fecha_inicial)
							ll_month				= month(ld_fecha_inicial)
							ll_year				= year(ld_fecha_inicial)
							ll_month	++
							if (ll_month=1 and ll_dia_prox_pago>31) then
								ls_pasa			= 'S'
								ll_day			= 31
							elseif (ll_month=2 and ll_dia_prox_pago>28) or (ll_month=2 and ll_day>28) then
								ls_pasa			= 'S'
								ll_day			= 28
							elseif (ll_month=3 and ll_dia_prox_pago>31) then
								ls_pasa			= 'S'
								ll_day			= 31
							elseif (ll_month=4 and ll_dia_prox_pago>30) then
								ls_pasa			= 'S'
								ll_day			= 30
							elseif (ll_month=5 and ll_dia_prox_pago>31) then
								ls_pasa			= 'S'
								ll_day			= 31
							elseif (ll_month=6 and ll_dia_prox_pago>30) then
								ls_pasa			= 'S'
								ll_day			= 30
							elseif (ll_month=7 and ll_dia_prox_pago>31) then
								ls_pasa			= 'S'
								ll_day			= 31
							elseif (ll_month=8 and ll_dia_prox_pago>31) then
								ls_pasa			= 'S'
								ll_day			= 31
							elseif (ll_month=9 and ll_dia_prox_pago>30) then
								ls_pasa			= 'S'
								ll_day			= 30
							elseif (ll_month=10 and ll_dia_prox_pago>31) then
								ls_pasa			= 'S'
								ll_day			= 31
							elseif (ll_month=11 and ll_dia_prox_pago>30) then
								ls_pasa			= 'S'
								ll_day			= 30
							elseif (ll_month=12 and ll_dia_prox_pago>31) then
								ls_pasa			= 'S'
								ll_day			= 31
							end if
							if ll_month>12 then
								ll_year ++
								ll_month			= 1
								if (ll_month=1 and ls_pasa='S') then
									ls_pasa		= 'S'
									ll_day		= 31
								end if
							end if
//							if ll_month = 2 and ll_day > 28 then ll_day = 28
							ls_fecha						= string(ll_day,'00')+'/'+string(ll_month,'00')+'/'+string(ll_year,'0000')
							ld_fecha_prox_venc		= date(ls_fecha)
							dw_dias_mora.setitem(ll_new,'fecha_inicial',ld_fecha_inicial)
							if ld_fecha_prox_venc > ld_fecha_hoy then 
								ld_fecha_prox_venc	= ld_fecha_hoy
							end if
							dw_dias_mora.setitem(ll_new,'fecha_venc',ld_fecha_prox_venc)
							if ld_fecha_prox_venc < ld_fecha_hoy then
								ll_dias_dif				= 0
								ll_dias_dif				= DaysAfter(ld_fecha_inicial, ld_fecha_prox_venc)
								if ll_dias_dif<=0 then ll_dias_dif=0
								dw_dias_mora.setitem(ll_new,'dias_mora',ll_dias_dif)
								ld_fecha_inicial		= ld_fecha_prox_venc
							else
								ll_dias_dif				= 0
								ll_dias_dif				= DaysAfter(ld_fecha_inicial, ld_fecha_hoy) //ld_fecha_prox_venc)
								if ll_dias_dif<=0 then ll_dias_dif=0
								dw_dias_mora.setitem(ll_new,'dias_mora',ll_dias_dif)
								ld_fecha_inicial		= ld_fecha_prox_venc
								ll_suma_dias			= ll_suma_dias + ll_dias_dif
								exit
							end if
							ll_suma_dias				= ll_suma_dias + ll_dias_dif
						NEXT
						ll_tot_fila						= dw_dias_mora.rowcount()
						for ll_reg=1 to ll_tot_fila
							ll_suma_dias				= ll_suma_dias - ll_dias_mora
							dw_dias_mora.setitem(ll_reg,'suma_dias',ll_suma_dias)
							ll_dias_mora				= dw_dias_mora.getitemnumber(ll_reg,'dias_mora')
						next
						dw_dias_mora.accepttext()		
//						ii_dmora					= 0
//						ii_mora_cobro			= 0
//						id_im						= 0
//						id_gc						= 0
						dw_detalle_pago_cupon.SetItem(row, "monto_cuota", id_valor_cuota)
						if dw_dias_mora.rowcount()>0 then
							if dw_detalle_pago_cupon.rowcount() <= ll_ctas_mora then
								ll_calc_dias			= dw_dias_mora.getitemnumber(dw_detalle_pago_cupon.rowcount(),'dias_mora')
								ii_dmora					= dw_dias_mora.getitemnumber(dw_detalle_pago_cupon.rowcount(),'suma_dias_acum')
								ld_dias_sum_mora		= dw_dias_mora.getitemnumber(dw_detalle_pago_cupon.rowcount(),'suma_dias')
							else
								ll_calc_dias			= 0
								ii_dmora					= 0
								ld_dias_sum_mora		= 0
							end if
							IF ld_dias_sum_mora > 5 AND cbx_sin_gastos.Checked=false THEN
								ii_mora_cobro 			= ld_dias_sum_mora	//(ii_dmora - (i - 1) * ll_calc_dias)
								id_im 					= id_im + gf_int_mora(w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1,"c_tasa"), ii_mora_cobro, id_valor_cuota)
								IF ld_dias_sum_mora > ll_calc_dias  THEN		//(ii_dmora - (i - 1) * ll_calc_dias)
									id_gc 				= id_gc + Round(id_valor_cuota * id_factor_gc, 0)
								END IF
							ELSE
	//							ii_mora_cobro 	= 0
	//							id_im 			= 0
	//							id_gc 			= 0
							END IF
						end if
						this.SetItem(row, "g_cobranza", id_gc)
						this.SetItem(row, "int_mora", id_im)
						this.SetItem(row, "c_mora", ii_mora_cobro) 
					end if
				elseif ls_tipo_mov='F' then
					if gs_base='O' or gs_base='C' then
						if dw_datos_credito_oferta.dataobject='d_datos_credito_oferta' then
							ld_fecha_m			= date(dw_datos_credito_oferta.getitemdatetime(1,'oferta_v_fecha_m'))
							ll_ctas_pag_m		= dw_datos_credito_oferta.getitemnumber(1,'oferta_v_cta_pag_m')
						elseif dw_datos_credito_oferta.dataobject='d_datos_credito_isa' then
							ld_fecha_m			= date(dw_datos_credito_oferta.getitemdatetime(1,'contrato_fecha_m'))
							ll_ctas_pag_m		= dw_datos_credito_oferta.getitemnumber(1,'contrato_cta_pag_m')
						end if
						if isnull(ll_ctas_pag_m) then ll_ctas_pag_m=0
						ll_sum_pag_m				= ll_sum_f
						ll_year						= year(ld_fecha_m) - 1
						ll_ano						= ll_year +  ll_ctas_pag_m + ll_sum_pag_m
						ldt_fecha_prox_pago_f	= date(string(day(ld_fecha_m),"00")+'/'+string(month(ld_fecha_m),"00")+'/'+ string(ll_ano,"0000"))
//						ldt_fecha_prox_pago_f	= date(dw_datos_credito_oferta.getitemdatetime(1,'c_prox_pago_anno'))
						SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
						INTO 		:ldt_venc_mant_min  
						FROM 		"CUPONERAS_DETALLE",   
									"CUPONERAS"  
						WHERE  ( "CUPONERAS_DETALLE"."BASE" = "CUPONERAS"."BASE" ) and  
								 ( "CUPONERAS_DETALLE"."SERIE" = "CUPONERAS"."SERIE" ) and  
								 ( "CUPONERAS_DETALLE"."NUMERO" = "CUPONERAS"."NUMERO" ) and  
								 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = "CUPONERAS"."NRO_CUPONERA" ) and  
								 (("CUPONERAS"."BASE" = :gs_base ) AND  
								 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
								 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
								 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) )   
						USING		sqlca;
						if not isnull(ldt_venc_mant_min) then
							SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
							INTO 		:ll_num_cupon_corr  
							FROM 		"CUPONERAS_DETALLE",   
										"CUPONERAS"  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = "CUPONERAS"."BASE" ) and  
									 ( "CUPONERAS_DETALLE"."SERIE" = "CUPONERAS"."SERIE" ) and  
									 ( "CUPONERAS_DETALLE"."NUMERO" = "CUPONERAS"."NUMERO" ) and  
									 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = "CUPONERAS"."NRO_CUPONERA" ) and  
									 (("CUPONERAS"."BASE" = :gs_base ) AND  
									 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
									 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
									 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_venc_mant_min ) AND  
									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
									 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND
									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) )   
							USING		sqlca;
							if ll_num_cupon_corr <> ll_num_cupon and ll_num_cupon_corr>0 then
								ll_resp	= messagebox("Advertencia","Recuerde Nº Cupón de MANTENCION que Corresponde es:  "+string(ll_num_cupon_corr)+"  desea Reemplazarlo",Exclamation!,YesNo!,2)
								if ll_resp=1 then
									ll_num_cupon	= ll_num_cupon_corr
									dw_detalle_pago_cupon.deleterow(dw_detalle_pago_cupon.rowcount())
									ll_nvo_reg		= dw_detalle_pago_cupon.insertrow(0)
									dw_detalle_pago_cupon.scrolltorow(ll_nvo_reg)
									dw_detalle_pago_cupon.SetItem(ll_nvo_reg, "tipo_mov", ls_tipo_mov)
									dw_detalle_pago_cupon.SetItem(ll_nvo_reg, "num_cupon", ll_num_cupon)
									dw_detalle_pago_cupon.accepttext()
								end if
							end if
						end if
						if ll_num_cupon_corr=0 or isnull(ll_num_cupon_corr) then
							messagebox("Advertencia","No Existe Cupón para esta Cuota Mantención")
						else
							SetItem(row, "monto_cuota", id_valor_cuota)
							SELECT "TASA"."GASTO_COB_MORA" INTO :id_interes_gc FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
							if gs_base='O' then
								id_valor_cuota	= round((dw_datos_credito_oferta.GetItemNumber(1,"oferta_v_valor_cuota_m") * gd_uf), 0)
							elseif gs_base='C' then
								id_valor_cuota	= round((dw_datos_credito_oferta.GetItemNumber(1,"contrato_valor_cuota_m") * gd_uf), 0)
							end if
	//						id_valor_cuota 	= Round(dw_datos_credito_oferta.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
							ii_dmora 			= dw_datos_credito_oferta.GetItemNumber(1,"c_dias_mora_mant")
							IF (ii_dmora - (row - 1) * 365) > 5 THEN 
								ii_mora_cobro		= (ii_dmora - (row - 1) * 365)
								id_im 				= id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota)
								IF (ii_dmora - (row - 1) * 365) > 30 THEN 
									 id_gc 			= id_gc + Round(id_valor_cuota * id_interes_gc, 0) //005// CAMBIO DE 10 A 5%
								END IF
							else
								ii_mora_cobro 	= 0
								id_im 			= 0
								id_gc 			= 0
							END IF
							SetItem(row, "g_cobranza", id_gc) // J 10% SE CAMBIA A 5% DESDE 10/01/2000
							SetItem(row, "int_mora", id_im)
							SetItem(row, "c_mora", ii_mora_cobro) 
						end if
					end if
				end if
			end if
		else
			messagebox("Advertencia","Cupón Nº "+string(ll_num_cupon)+" NO Existe o NO está Asociado a este Contrato")
			dw_detalle_pago_cupon.deleterow(row)
			ll_new	= dw_detalle_pago_cupon.insertrow(0)
			dw_detalle_pago_cupon.scrolltorow(ll_new)
			dw_detalle_pago_cupon.setfocus()
		end if
	end if
	dw_detalle_pago_cupon.accepttext()
END IF
end event

event itemfocuschanged;string	ls_columna
ls_columna	= dwo.name

CHOOSE CASE ls_columna
	CASE 'monto_cuota'
		IF gf_existe_cupon(GetItemNumber(row, "num_cupon")) THEN
			this.SetItem(row, "num_cupon", 0)
			this.AcceptText()
			this.setfocus()
			this.setcolumn('num_cupon')
		end if
END CHOOSE


end event

