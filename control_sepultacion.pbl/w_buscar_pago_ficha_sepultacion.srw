forward
global type w_buscar_pago_ficha_sepultacion from window
end type
type cb_sort from commandbutton within w_buscar_pago_ficha_sepultacion
end type
type cb_filtrar from commandbutton within w_buscar_pago_ficha_sepultacion
end type
type pb_ok from picturebutton within w_buscar_pago_ficha_sepultacion
end type
type em_ctto from editmask within w_buscar_pago_ficha_sepultacion
end type
type p_1 from picture within w_buscar_pago_ficha_sepultacion
end type
type em_fec_ini from editmask within w_buscar_pago_ficha_sepultacion
end type
type rb_ctto from radiobutton within w_buscar_pago_ficha_sepultacion
end type
type rb_fecha from radiobutton within w_buscar_pago_ficha_sepultacion
end type
type cb_cerrar from commandbutton within w_buscar_pago_ficha_sepultacion
end type
type cb_aceptar from commandbutton within w_buscar_pago_ficha_sepultacion
end type
type dw_lista from datawindow within w_buscar_pago_ficha_sepultacion
end type
type gb_1 from groupbox within w_buscar_pago_ficha_sepultacion
end type
type gb_2 from groupbox within w_buscar_pago_ficha_sepultacion
end type
end forward

global type w_buscar_pago_ficha_sepultacion from window
integer width = 5783
integer height = 2176
boolean titlebar = true
string title = "Listado Ficha Sepultación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_sort cb_sort
cb_filtrar cb_filtrar
pb_ok pb_ok
em_ctto em_ctto
p_1 p_1
em_fec_ini em_fec_ini
rb_ctto rb_ctto
rb_fecha rb_fecha
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
end type
global w_buscar_pago_ficha_sepultacion w_buscar_pago_ficha_sepultacion

type variables
Long	il_row,il_cod_parque
end variables

on w_buscar_pago_ficha_sepultacion.create
this.cb_sort=create cb_sort
this.cb_filtrar=create cb_filtrar
this.pb_ok=create pb_ok
this.em_ctto=create em_ctto
this.p_1=create p_1
this.em_fec_ini=create em_fec_ini
this.rb_ctto=create rb_ctto
this.rb_fecha=create rb_fecha
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_sort,&
this.cb_filtrar,&
this.pb_ok,&
this.em_ctto,&
this.p_1,&
this.em_fec_ini,&
this.rb_ctto,&
this.rb_fecha,&
this.cb_cerrar,&
this.cb_aceptar,&
this.dw_lista,&
this.gb_1,&
this.gb_2}
end on

on w_buscar_pago_ficha_sepultacion.destroy
destroy(this.cb_sort)
destroy(this.cb_filtrar)
destroy(this.pb_ok)
destroy(this.em_ctto)
destroy(this.p_1)
destroy(this.em_fec_ini)
destroy(this.rb_ctto)
destroy(this.rb_fecha)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;Datetime	ldt_fec_ini,ldt_fec_fin
Date		ld_fec_hoy
Long		ll_dias_rango,ll_dias_rango_neg

gf_centrar(w_buscar_pago_ficha_sepultacion)
//if isvalid(w_ingreso2) then
	SELECT	"TCP_IP_PARQUE"."COD_PARQUE"  
	INTO 		:il_cod_parque
	FROM 		"TCP_IP_PARQUE"
	WHERE 	"TCP_IP_PARQUE"."TCP_IP" = :gs_tcp_ip and
				"TCP_IP_PARQUE"."CONEXION" = :gs_conexion
	USING		sqlca;
	if gs_rezago<>"S" and gi_numero>0 then
		dw_lista.dataobject	= 'dw_lista_ficha_sepultacion_a_pagar_ctto'
	else
		dw_lista.dataobject	= 'dw_lista_ficha_sepultacion_a_pagar'
	end if
//else
//	SELECT	"TCP_IP_PARQUE"."COD_PARQUE"  
//	INTO 		:il_cod_parque
//	FROM 		"TCP_IP_PARQUE"
//	WHERE 	"TCP_IP_PARQUE"."TCP_IP" = :gs_tcp_ip and
//				"TCP_IP_PARQUE"."CONEXION" = :gs_conexion
//	USING		sqlca;
//	if gs_rezago<>"S" and gi_numero>0 then
//		dw_lista.dataobject	= 'dw_lista_ficha_sepultacion_a_pagar_ctto'
//	else
//		dw_lista.dataobject	= 'dw_lista_ficha_sepultacion_a_pagar'
//	end if
//end if
dw_lista.settransobject(sqlca)
ld_fec_hoy					= date(gdt_fec_sistema)
em_fec_ini.text				= string(ld_fec_hoy,'dd/mm/yyyy')
SELECT	"FICHA_RANGO_DIAS_CAJA"."DIAS_RANGO"  
INTO 		:ll_dias_rango  
FROM 	"FICHA_RANGO_DIAS_CAJA"  
WHERE 	"FICHA_RANGO_DIAS_CAJA"."ESTADO" = 'A'   ;

ll_dias_rango_neg			= ll_dias_rango * -1
ldt_fec_ini					= datetime(relativedate(ld_fec_hoy, ll_dias_rango_neg),time('00:00:00'))
ldt_fec_fin					= datetime(relativedate(ld_fec_hoy, ll_dias_rango),time('23:59:59'))
if gs_rezago<>"S" and gi_numero>0 then
	if dw_lista.retrieve(gs_base,gs_serie,gi_numero,ld_fec_hoy)=0 then
//		dw_lista.dataobject	= 'dw_lista_ficha_sepultacion_a_pagar'
//		dw_lista.settransobject(sqlca)
//		if dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin,il_cod_parque,ld_fec_hoy)=0 then
			messagebox("Advertencia","No Registra Ficha a Cancelar")
			close(w_buscar_pago_ficha_sepultacion)
//		end if
	end if
else		
	if dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin,il_cod_parque,ld_fec_hoy,gi_rut)=0 then
		messagebox("Advertencia","No Registra Ficha a Cancelar")
		close(w_buscar_pago_ficha_sepultacion)
	end if
end if
end event

type cb_sort from commandbutton within w_buscar_pago_ficha_sepultacion
integer x = 2839
integer y = 1936
integer width = 238
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_filtrar from commandbutton within w_buscar_pago_ficha_sepultacion
integer x = 3081
integer y = 1936
integer width = 238
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type pb_ok from picturebutton within w_buscar_pago_ficha_sepultacion
integer x = 2555
integer y = 1928
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;String		ls_string
Datetime	ldt_fecha
Long		ll_fila,ll_tot_reg
Double	ll_numero

if dw_lista.rowcount() > 0 then
	dw_lista.scrolltorow(1)
	if rb_fecha.checked= true then
		ldt_fecha		= datetime(date(em_fec_ini.text),time('00:00:00'))
		if not isnull(ldt_fecha) then
//			dw_lista.SetRedraw(false)
			dw_lista.SetSort("fecha_sepultacion A")
			dw_lista.Sort()
//			dw_lista.SetRedraw(true)
			dw_lista.accepttext()
			ls_string	= "fecha_sepultacion = date('"+string(em_fec_ini.text,'dd/mm/yyyy')+"')"
			ll_fila		= dw_lista.Find(ls_string, 1, dw_lista.RowCount())
			if ll_fila > 0 then
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_fila)
			else
				messagebox("Advertencia","Fecha No Existe en Lista")
			end if
		else
			messagebox("Advertencia","Fecha de Busqueda Inválida")
			em_fec_ini.setfocus()
		end if
	elseif rb_ctto.checked=true then
		ll_numero		= Double(em_ctto.text)
		if not isnull(ll_numero) and ll_numero>0 then
//			dw_lista.SetRedraw(false)
			dw_lista.SetSort("numero A")
			dw_lista.Sort()
//			dw_lista.SetRedraw(true)
			dw_lista.accepttext()
			ls_string	= "numero = "+string(ll_numero,'################')
			ll_fila		= dw_lista.Find(ls_string, 1, dw_lista.RowCount())
			if ll_fila > 0 then
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_fila)
			else
				messagebox("Advertencia","Nº Contrato No Existe en Lista")
			end if
		else
			messagebox("Advertencia","Debe Ingresar Nº Contrato a Busqueda")
			em_ctto.setfocus()
		end if
	end if
end if
end event

type em_ctto from editmask within w_buscar_pago_ficha_sepultacion
integer x = 1998
integer y = 1944
integer width = 498
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

type p_1 from picture within w_buscar_pago_ficha_sepultacion
integer x = 1339
integer y = 1944
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string 	ls_fecha,fech
datetime	ldt_fecha
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text	= string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha 			= em_fec_ini.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_fec_ini.text = Message.StringParm
END IF
ldt_fecha	= datetime(date(em_fec_ini.text),time('00:00:00'))
if not isnull(ldt_fecha) then pb_ok.triggerevent(clicked!)
end event

type em_fec_ini from editmask within w_buscar_pago_ficha_sepultacion
integer x = 955
integer y = 1944
integer width = 375
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type rb_ctto from radiobutton within w_buscar_pago_ficha_sepultacion
integer x = 1550
integer y = 1952
integer width = 443
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Nº Contrato"
end type

event clicked;if rb_ctto.checked=true then
	em_ctto.text			= ''
	em_ctto.enabled		= true
	em_fec_ini.enabled	= false
	em_fec_ini.text		= string(gdt_fec_sistema,'dd/mm/yyyy')
	em_ctto.setfocus()
end if
end event

type rb_fecha from radiobutton within w_buscar_pago_ficha_sepultacion
integer x = 562
integer y = 1952
integer width = 389
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Por Fecha"
boolean checked = true
end type

event clicked;if rb_fecha.checked=true then
	em_ctto.text			= ''
	em_ctto.enabled		= false
	em_fec_ini.enabled	= true
	em_fec_ini.text		= string(gdt_fec_sistema,'dd/mm/yyyy')
	em_fec_ini.setfocus()
end if
end event

type cb_cerrar from commandbutton within w_buscar_pago_ficha_sepultacion
integer x = 5376
integer y = 1920
integer width = 343
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_buscar_pago_ficha_sepultacion)
end event

type cb_aceptar from commandbutton within w_buscar_pago_ficha_sepultacion
integer x = 27
integer y = 1920
integer width = 343
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;String		ls_tipo_ficha,ls_base,ls_serie,ls_sector,ls_sepultura,ls_cod_parent,ls_pasa,ls_base_caja,ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,ls_pago_5,ls_pago_6,&
			ls_serie_caja,ls_tipo_traslado,ls_dscto_1,ls_dscto_2,ls_dscto_3,ls_dscto_4,ls_dscto_5,ls_dscto_6,ls_tipo_cob,ls_adicional_1,ls_adicional_2,ls_adicional_3,&
			ls_adicional_4,ls_moneda_insert
Long		ll_val_der,ll_mov_sar,ll_cam_ubi,ll_val_red,ll_cer_def,ll_hora,ll_minuto,ll_count_reg,ll_new,ll_tot_reg,ll_fila,ll_sw_lib,ll_exhumacion,ll_sw_pago_lib,ll_res=1,&
			ll_pago_1,ll_pago_2,ll_pago_3,ll_pago_4,ll_pago_5,ll_pago_6,ll_dscto_1,ll_dscto_2,ll_dscto_3,ll_dscto_4,ll_dscto_5,ll_dscto_6,ll_tot_pago,ll_count,ll_pasa_dscto,&
			ll_total_pago_det,ll_monto_adic_1,ll_monto_adic_2,ll_monto_adic_3,ll_monto_adic_4,ll_fila_m,ll_fila_d,ll_new_m
datetime	ldt_fec_sepult
Double	ldb_val_der,ldb_der_sep,ldb_mov_sar,ldb_cambio_ubi,ldb_reducc,ldb_cert_def,ldb_exhuma,ldb_otros,ll_numero,ldb_pago_1,ldb_pago_2,ldb_pago_3,ldb_pago_4,&
			ldb_pago_5,ldb_pago_6,ll_numero_caja,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,ldb_dscto_6,ldb_total_dscto,ldb_total_pago,ldb_valor,&
			ldb_suma_pagos,ll_iva_recalc,idb_iva

dw_lista.accepttext()
SELECT	"TASA"."IVA"  INTO :idb_iva  FROM 	"TASA"  WHERE "TASA"."LOOK" = 1   ;
if dw_lista.rowcount()>0 then
	ll_pasa_dscto						= 0
	ldb_suma_pagos					= 0
	il_row									= dw_lista.getrow()
	if il_row>0 then
		gs_tipo_cobro_aux				= dw_lista.getitemstring(il_row,'vista_fs_pagos_tipocob_tipo_cobro_aux')
		gs_tipo_cobro_aux2			= gs_tipo_cobro_aux
		ls_tipo_cob						= dw_lista.getitemstring(il_row,'vista_fs_pagos_tipocob_tipo_cob')
		ldb_valor							= dw_lista.getitemnumber(il_row,'vista_fs_pagos_tipocob_monto')
		ls_tipo_ficha						= dw_lista.getitemstring(il_row,'c_tipo_ficha')
		ls_base							= dw_lista.getitemstring(il_row,'base')
		ls_serie							= dw_lista.getitemstring(il_row,'serie')
		ll_numero						= dw_lista.getitemnumber(il_row,'numero')
		ll_sw_pago_lib					= dw_lista.getitemnumber(il_row,'sw_pago_liberado')
		ll_tot_pago						= dw_lista.getitemnumber(il_row,'c_total_pago')
//		ll_tot_pago						= dw_lista.getitemnumber(il_row,'c_monto_canc')
		ls_base_caja					= mid(w_ingreso2.tab_ingreso.tp_be.dw_be_buscar_cliente.getitemstring(1,'rs_bs'),1,1)
		ls_serie_caja					= mid(w_ingreso2.tab_ingreso.tp_be.dw_be_buscar_cliente.getitemstring(1,'rs_bs'),2,1)
		ll_numero_caja					= Double(w_ingreso2.tab_ingreso.tp_be.dw_be_buscar_cliente.getitemString(1,'rn_contrato'))
		if ls_tipo_cob = 'BE' then	//ls_tipo_cob = 'BE' then
			w_ingreso2.tab_ingreso.tp_be.rb_be_exenta.checked		= true
			w_ingreso2.tab_ingreso.tp_be.rb_be_afecta.checked		= false
			w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getchild('tipo_cob',idw_detalle4)
			idw_detalle4.settransobject(sqlca)
			w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getchild('tipo_cob_otro',idw_detalle12)
			idw_detalle12.settransobject(sqlca)
			idw_detalle12.retrieve(ls_tipo_cob)
			idw_detalle4.retrieve(ls_tipo_cob)
			w_ingreso2.tab_ingreso.tp_be.rb_be_exenta.triggerevent(clicked!)
		elseif ls_tipo_cob = 'BA' then 	//ls_tipo_cob = 'BA' then
			w_ingreso2.tab_ingreso.tp_be.rb_be_exenta.checked		= false
			w_ingreso2.tab_ingreso.tp_be.rb_be_afecta.checked		= true
			w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getchild('tipo_cob',idw_detalle4)
			idw_detalle4.settransobject(sqlca)
			w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.getchild('tipo_cob_otro',idw_detalle12)
			idw_detalle12.settransobject(sqlca)
			idw_detalle12.retrieve(ls_tipo_cob)
			idw_detalle4.retrieve(ls_tipo_cob)
			w_ingreso2.tab_ingreso.tp_be.rb_be_afecta.triggerevent(clicked!)
		end if
		gs_tipo_cobro_aux				= dw_lista.getitemstring(il_row,'vista_fs_pagos_tipocob_tipo_cobro_aux')
		if ls_base <> ls_base_caja or ls_serie<>ls_serie_caja or ll_numero_caja<>ll_numero then
			SELECT	Count("FICHA_TRASLADO"."BASE_DESTINO")
			INTO 		:ll_count_reg
			FROM 	"FICHA_TRASLADO"
			WHERE 	 ( "FICHA_TRASLADO"."BASE_DESTINO" = :ls_base_caja ) AND
						 ( "FICHA_TRASLADO"."SERIE_DESTINO" = :ls_serie_caja ) AND
						 ( "FICHA_TRASLADO"."NUMERO_DESTINO" = :ll_numero_caja )
			USING		sqlca ;
			if ll_count_reg=0 then
				ll_res						= messagebox("Advertencia","Ficha Sepultación NO corresponde al Contrato Indicado en CAJA, desea Asignar Valores",Exclamation!,YesNo!,2)
			end if
		end if
		if ll_res=1 then
			ls_sector						= dw_lista.getitemstring(il_row,'sector')
			ls_sepultura					= dw_lista.getitemstring(il_row,'sepultura')
			ldt_fec_sepult				= dw_lista.getitemdatetime(il_row,'fecha_sepultacion')
			ll_hora						= dw_lista.getitemnumber(il_row,'hora')
			ll_minuto						= dw_lista.getitemnumber(il_row,'minutos')
			ls_cod_parent				= dw_lista.getitemstring(il_row,'codigo_parentesco')
			ll_val_der					= dw_lista.getitemnumber(il_row,'c_der_sepult')
			ldb_val_der					= dw_lista.getitemnumber(il_row,'valor_derecho_sepultacion_uf')
			ll_pago_1					= dw_lista.getitemnumber(il_row,'c_monto_pago1')
			ll_pago_2					= dw_lista.getitemnumber(il_row,'c_monto_pago2')
			ll_pago_3					= dw_lista.getitemnumber(il_row,'c_monto_pago3')
			ll_pago_4					= dw_lista.getitemnumber(il_row,'c_monto_pago4')
			ll_pago_5					= dw_lista.getitemnumber(il_row,'c_monto_pago5')
			ll_pago_6					= dw_lista.getitemnumber(il_row,'c_monto_pago6')
			
			ls_pago_1					= dw_lista.getitemstring(il_row,'ficha_sepultacion_pago_otro_1')
			ls_pago_2					= dw_lista.getitemstring(il_row,'ficha_sepultacion_pago_otro_2')
			ls_pago_3					= dw_lista.getitemstring(il_row,'ficha_sepultacion_pago_otro_3')
			ls_pago_4					= dw_lista.getitemstring(il_row,'ficha_sepultacion_pago_otro_4')
			ls_pago_5					= dw_lista.getitemstring(il_row,'ficha_sepultacion_pago_otro_5')
			ls_pago_6					= dw_lista.getitemstring(il_row,'ficha_sepultacion_pago_otro_6')
			
			ll_dscto_1					= dw_lista.getitemnumber(il_row,'c_monto_dscto1')
			ll_dscto_2					= dw_lista.getitemnumber(il_row,'c_monto_dscto2')
			ll_dscto_3					= dw_lista.getitemnumber(il_row,'c_monto_dscto3')
			ll_dscto_4					= dw_lista.getitemnumber(il_row,'c_monto_dscto4')
			ll_dscto_5					= dw_lista.getitemnumber(il_row,'c_monto_dscto5')
			ll_dscto_6					= dw_lista.getitemnumber(il_row,'c_monto_dscto6')
//			ll_total_pago_det			= ll_val_der + ll_pago_1 + ll_pago_2 + ll_pago_3 + ll_pago_4 + ll_pago_5 + ll_pago_6
			if gs_tipo_cobro_aux='BE' then
				ll_total_pago_det		= ll_val_der
				if ls_pago_1='21' then
					ll_total_pago_det	= ll_total_pago_det + ll_pago_1
				elseif ls_pago_2='21' then
					ll_total_pago_det	= ll_total_pago_det + ll_pago_2
				elseif ls_pago_3='21' then
					ll_total_pago_det	= ll_total_pago_det + ll_pago_3
				elseif ls_pago_4='21' then
					ll_total_pago_det	= ll_total_pago_det + ll_pago_4
				elseif ls_pago_5='21' then
					ll_total_pago_det	= ll_total_pago_det + ll_pago_5
				elseif ls_pago_6='21' then
					ll_total_pago_det	= ll_total_pago_det + ll_pago_6
				end if
			else
				ll_total_pago_det		= 0
				if ls_pago_1<>'21' then
					ll_total_pago_det	= ll_total_pago_det + ll_pago_1
				elseif ls_pago_2<>'21' then
					ll_total_pago_det	= ll_total_pago_det + ll_pago_2
				elseif ls_pago_3<>'21' then
					ll_total_pago_det	= ll_total_pago_det + ll_pago_3
				elseif ls_pago_4<>'21' then
					ll_total_pago_det	= ll_total_pago_det + ll_pago_4
				elseif ls_pago_5<>'21' then
					ll_total_pago_det	= ll_total_pago_det + ll_pago_5
				elseif ls_pago_6<>'21' then
					ll_total_pago_det	= ll_total_pago_det + ll_pago_6
				end if
			end if
			if ll_dscto_1 > 0 and ll_dscto_2=0 and ll_dscto_3=0 and ll_dscto_4=0 and ll_dscto_5=0 and ll_dscto_6=0 and ll_tot_pago=0 then
				ll_dscto_1				= ll_total_pago_det
			end if
			ls_dscto_1					= dw_lista.getitemstring(il_row,'ficha_sepultacion_dscto_otro_1')
			ls_dscto_2					= dw_lista.getitemstring(il_row,'ficha_sepultacion_dscto_otro_2')
			ls_dscto_3					= dw_lista.getitemstring(il_row,'ficha_sepultacion_dscto_otro_3')
			ls_dscto_4					= dw_lista.getitemstring(il_row,'ficha_sepultacion_dscto_otro_4')
			ls_dscto_5					= dw_lista.getitemstring(il_row,'ficha_sepultacion_dscto_otro_5')
			ls_dscto_6					= dw_lista.getitemstring(il_row,'ficha_sepultacion_dscto_otro_6')
			
			//////////////////////////////////////// ADICIONALES FRANCK //////////////////////////////////////
			ls_adicional_1					= dw_lista.getitemstring(il_row,'ficha_sepultacion_adicional_1')
			ls_adicional_2					= dw_lista.getitemstring(il_row,'ficha_sepultacion_adicional_2')
			ls_adicional_3					= dw_lista.getitemstring(il_row,'ficha_sepultacion_adicional_3')
			ls_adicional_4					= dw_lista.getitemstring(il_row,'ficha_sepultacion_adicional_4')
			
			ll_monto_adic_1					= dw_lista.getitemnumber(il_row,'ficha_sepultacion_monto_adicional_1')
			ll_monto_adic_2					= dw_lista.getitemnumber(il_row,'ficha_sepultacion_monto_adicional_2')
			ll_monto_adic_3					= dw_lista.getitemnumber(il_row,'ficha_sepultacion_monto_adicional_3')
			ll_monto_adic_4					= dw_lista.getitemnumber(il_row,'ficha_sepultacion_monto_adicional_4')
			/////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			ll_sw_lib						= dw_lista.getitemnumber(il_row,'sw_pago_liberado')
			ls_tipo_traslado			= dw_lista.getitemstring(il_row,'c_tipo_traslado')
			if isvalid(w_ingreso2) then
				if ls_tipo_ficha='FT' then
					SELECT 	"FICHA_TRASLADO"."DERECHO_SEPULTACION_ORIGEN",	"FICHA_TRASLADO"."PAGO_OTRO_1",	"FICHA_TRASLADO"."PAGO_OTRO_2", 	"FICHA_TRASLADO"."PAGO_OTRO_3",	"FICHA_TRASLADO"."PAGO_OTRO_4",	"FICHA_TRASLADO"."PAGO_OTRO_5",	"FICHA_TRASLADO"."PAGO_OTRO_6",	"FICHA_TRASLADO"."MONTO_OTRO_1",		"FICHA_TRASLADO"."MONTO_OTRO_2", 	"FICHA_TRASLADO"."MONTO_OTRO_3",		"FICHA_TRASLADO"."MONTO_OTRO_4",		"FICHA_TRASLADO"."MONTO_OTRO_5",		"FICHA_TRASLADO"."MONTO_OTRO_6",		"FICHA_TRASLADO"."DSCTO_OTRO_1",		"FICHA_TRASLADO"."DSCTO_OTRO_2",		"FICHA_TRASLADO"."DSCTO_OTRO_3",	"FICHA_TRASLADO"."DSCTO_OTRO_4",	"FICHA_TRASLADO"."DSCTO_OTRO_5",	"FICHA_TRASLADO"."DSCTO_OTRO_6",	"FICHA_TRASLADO"."MONTO_DSCTO_1",	"FICHA_TRASLADO"."MONTO_DSCTO_2",	"FICHA_TRASLADO"."MONTO_DSCTO_3",	"FICHA_TRASLADO"."MONTO_DSCTO_4",	"FICHA_TRASLADO"."MONTO_DSCTO_5", 	"FICHA_TRASLADO"."MONTO_DSCTO_6",	"FICHA_TRASLADO"."MONTO_TOTAL_DSCTO", 	"FICHA_TRASLADO"."MONTO_CANCELAR_ORIGEN"
					INTO 		:ldb_der_sep, 															:ls_pago_1, 										:ls_pago_2, 										:ls_pago_3,   									:ls_pago_4,   									:ls_pago_5,   									:ls_pago_6,   									:ldb_pago_1,   										:ldb_pago_2,   										:ldb_pago_3,   										:ldb_pago_4,   										:ldb_pago_5,   										:ldb_pago_6,   										:ls_dscto_1,   										:ls_dscto_2,   										:ls_dscto_3,   									:ls_dscto_4,   									:ls_dscto_5,   									:ls_dscto_6,   									:ldb_dscto_1,   										:ldb_dscto_2,   										:ldb_dscto_3,   										:ldb_dscto_4,   										:ldb_dscto_5,   										:ldb_dscto_6,   										:ldb_total_dscto,   											:ldb_total_pago  
					FROM 	"FICHA_TRASLADO" 
					WHERE  ( "FICHA_TRASLADO"."BASE_ORIGEN" = :ls_base_caja ) AND  
							 ( "FICHA_TRASLADO"."SERIE_ORIGEN" = :ls_serie_caja ) AND  
							 ( "FICHA_TRASLADO"."NUMERO_ORIGEN" = :ll_numero_caja )
					USING		sqlca ;
					if sqlca.sqlcode=0 then
						if isnull(ldb_der_sep) then ldb_der_sep=0
						if isnull(ldb_pago_1) then ldb_pago_1=0
						if isnull(ldb_pago_2) then ldb_pago_2=0
						if isnull(ldb_pago_3) then ldb_pago_3=0
						if isnull(ldb_pago_4) then ldb_pago_4=0
						if isnull(ldb_pago_5) then ldb_pago_5=0
						if isnull(ldb_pago_6) then ldb_pago_6=0
						ll_val_der			= round(ldb_der_sep * gd_uf_dia,0)
						ll_pago_1			= round(ldb_pago_1 * gd_uf_dia,0)
						ll_pago_2			= round(ldb_pago_2 * gd_uf_dia,0)
						ll_pago_3			= round(ldb_pago_3 * gd_uf_dia,0)
						ll_pago_4			= round(ldb_pago_4 * gd_uf_dia,0)
						ll_pago_5			= round(ldb_pago_5 * gd_uf_dia,0)
					else	
						SELECT 	"FICHA_TRASLADO"."DERECHO_SEPULTACION_DESTINO",	"FICHA_TRASLADO"."PAGO_OTRO_D1",	"FICHA_TRASLADO"."PAGO_OTRO_D2", 	"FICHA_TRASLADO"."PAGO_OTRO_D3",	"FICHA_TRASLADO"."PAGO_OTRO_D4",	"FICHA_TRASLADO"."PAGO_OTRO_D5",	"FICHA_TRASLADO"."PAGO_OTRO_D6",	"FICHA_TRASLADO"."MONTO_OTRO_D1",		"FICHA_TRASLADO"."MONTO_OTRO_D2", 	"FICHA_TRASLADO"."MONTO_OTRO_D3",		"FICHA_TRASLADO"."MONTO_OTRO_D4",		"FICHA_TRASLADO"."MONTO_OTRO_D5",		"FICHA_TRASLADO"."MONTO_OTRO_D6",	"FICHA_TRASLADO"."DSCTO_OTRO_D1",	"FICHA_TRASLADO"."DSCTO_OTRO_D2",	"FICHA_TRASLADO"."DSCTO_OTRO_D3",	"FICHA_TRASLADO"."DSCTO_OTRO_D4",	"FICHA_TRASLADO"."DSCTO_OTRO_D5",	"FICHA_TRASLADO"."DSCTO_OTRO_D6",	"FICHA_TRASLADO"."MONTO_DSCTO_D1",	"FICHA_TRASLADO"."MONTO_DSCTO_D2",	"FICHA_TRASLADO"."MONTO_DSCTO_D3",	"FICHA_TRASLADO"."MONTO_DSCTO_D4",	"FICHA_TRASLADO"."MONTO_DSCTO_D5", 	"FICHA_TRASLADO"."MONTO_DSCTO_D6",	"FICHA_TRASLADO"."MONTO_TOTAL_DSCTO_D", 	"FICHA_TRASLADO"."MONTO_CANCELAR_DESTINO"
						INTO 		:ldb_der_sep, 															:ls_pago_1, 										:ls_pago_2, 										:ls_pago_3,   									:ls_pago_4,   									:ls_pago_5,   									:ls_pago_6,   									:ldb_pago_1,   											:ldb_pago_2,   										:ldb_pago_3,   											:ldb_pago_4,   											:ldb_pago_5,   											:ldb_pago_6,   										:ls_dscto_1,   										:ls_dscto_2,   										:ls_dscto_3,   										:ls_dscto_4,   										:ls_dscto_5,   										:ls_dscto_6,   										:ldb_dscto_1,   										:ldb_dscto_2,   										:ldb_dscto_3,   										:ldb_dscto_4,   										:ldb_dscto_5,   										:ldb_dscto_6,   										:ldb_total_dscto,   												:ldb_total_pago  
						FROM 	"FICHA_TRASLADO" 
						WHERE  ( "FICHA_TRASLADO"."BASE_ORIGEN" = :ls_base_caja ) AND  
								 ( "FICHA_TRASLADO"."SERIE_ORIGEN" = :ls_serie_caja ) AND  
								 ( "FICHA_TRASLADO"."NUMERO_ORIGEN" = :ll_numero_caja )
						USING		sqlca ;
//						SELECT	"FICHA_TRASLADO"."DERECHO_SEPULTACION_DESTINO",	"FICHA_TRASLADO"."MOV_DE_SARCOFAGO_DESTINO",	"FICHA_TRASLADO"."CAMBIO_UBICACION_DESTINO",	"FICHA_TRASLADO"."REDUCCION_DESTINO",	"FICHA_TRASLADO"."CERTIFICADO_DEFUNCION_DESTINO",	"FICHA_TRASLADO"."VALOR_EXHUMACION_DESTINO",	"FICHA_TRASLADO"."OTROS_PAGOS_DESTINO"  
//						INTO 		:ldb_der_sep,															:ldb_mov_sar,											:ldb_cambio_ubi,										:ldb_reducc,									:ldb_cert_def,													:ldb_exhuma,											:ldb_otros  
//						FROM 		"FICHA_TRASLADO"  
//						WHERE  ( "FICHA_TRASLADO"."BASE_DESTINO" = :ls_base_caja ) AND  
//								 ( "FICHA_TRASLADO"."SERIE_DESTINO" = :ls_serie_caja ) AND  
//								 ( "FICHA_TRASLADO"."NUMERO_DESTINO" = :ll_numero_caja )
						if sqlca.sqlcode=0 then
							ll_val_der			= round(ldb_der_sep * gd_uf_dia,0)
							ll_pago_1			= round(ldb_pago_1 * gd_uf_dia,0)
							ll_pago_2			= round(ldb_pago_2 * gd_uf_dia,0)
							ll_pago_3			= round(ldb_pago_3 * gd_uf_dia,0)
							ll_pago_4			= round(ldb_pago_4 * gd_uf_dia,0)
							ll_pago_5			= round(ldb_pago_5 * gd_uf_dia,0)
							ll_pago_6			= round(ldb_pago_6 * gd_uf_dia,0)
						end if						
					end if
				end if
				if ll_val_der>0 then
					ll_tot_reg				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
					ls_pasa					= 'S'
					if ll_tot_reg>0 then
						ll_fila					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob = 'M'", 1, ll_tot_reg)
						if ll_fila>0 then
							messagebox("Advertencia","Tipo Cobro Derecho Sepultación, ya Existe en detalle de Pago")
							ls_pasa			= 'N'
						end if
					end if
					if ls_pasa='S' then
						SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
						INTO 		:ll_count  
						FROM 	"FICHA_CUENTA_CONTABLE_OTROS" ,  	"FICHA_SEPULTACION_PAGO" 
						WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
								  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
								  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
								  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
								  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
								  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
								  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND
								  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'M' ) AND  
								  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '0' ) AND  
								  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
								  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
								  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
								  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  ;
						if ll_count > 0 then
							ll_new				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','M')
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto_uf',ldb_val_der)
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_val_der)
							ldb_suma_pagos		= ldb_suma_pagos + ll_val_der
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
							
							ll_fila_m				= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob='M'", 1, w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
							if ll_fila_m > 0 and ls_tipo_cob = 'BA' then	//gs_tipo_cobro_aux = 'BA' then
								ll_fila_d			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob='D'", 1, w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount())
								if ll_fila_d > 0 then
									ll_iva_recalc		= round(ldb_val_der * (idb_iva - 1),2)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_fila_d,'monto_uf',ll_iva_recalc)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_fila_d,'monto', round( ll_iva_recalc * gd_uf,4))
								else
									ll_new_m		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
									ll_iva_recalc		= round(ldb_val_der * (idb_iva - 1),2)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new_m,'tipo_cob', 'D')
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(ll_new_m, "iva", idb_iva)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new_m,'cantidad', 1)
									ls_moneda_insert	= '2'
									if ls_moneda_insert = '2' then
										w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new_m,'monto', round( ll_iva_recalc * gd_uf,4))
										w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new_m,'monto_uf', ll_iva_recalc)
									end if
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new_m,'uf',gd_uf)
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new_m,'estado','S')
									w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.SetItem(ll_new_m, "moneda",'P')
								end if
							end if
							
							
						end if
					end if
				end if
				if ll_pago_1 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_1 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','L')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_pago_1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_pago_1)
						ldb_suma_pagos		= ldb_suma_pagos + ll_pago_1
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_pago_2 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_2 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','L')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_pago_2)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_pago_2)
						ldb_suma_pagos		= ldb_suma_pagos + ll_pago_2
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_pago_3 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_3 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','L')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_pago_3)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_pago_3)
						ldb_suma_pagos		= ldb_suma_pagos + ll_pago_3
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_pago_4 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_4 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','L')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_pago_4)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_pago_4)
						ldb_suma_pagos		= ldb_suma_pagos + ll_pago_4
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_pago_5 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_5 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','L')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_pago_5)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_pago_5)
						ldb_suma_pagos		= ldb_suma_pagos + ll_pago_5
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_pago_6 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_6 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','L')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_pago_6)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_pago_6)
						ldb_suma_pagos		= ldb_suma_pagos + ll_pago_6
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				
				if ll_dscto_1 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_1 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','S')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_dscto_1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						
						if ll_sw_lib = 0 and ll_dscto_1 > 0 then
							if ldb_suma_pagos = ll_dscto_1 and ll_tot_pago = 0 then 
								ll_dscto_1 			= ldb_suma_pagos - 1
								w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_dscto_1 )
								ll_pasa_dscto ++
							else
								ll_dscto_1 			= ll_dscto_1 - 1
								//w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',(ll_dscto_1 * -1))
								w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_dscto_1 )
								ll_pasa_dscto ++
							end if
						else
							if ldb_suma_pagos = ll_dscto_1 and ll_tot_pago = 0 then 
								ll_dscto_1 			= ldb_suma_pagos - 1
								w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_dscto_1 )
								ll_pasa_dscto ++
							end if
							
//							if ll_tot_pago = ll_dscto_1 or ll_tot_pago = 0 then 
//								ll_dscto_1 = ll_dscto_1 - 1
//								ll_pasa_dscto ++
//							end if
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_dscto_1)
						end if
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_dscto_2 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_2 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','S')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_dscto_2)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						if ll_sw_lib = 0 and ll_dscto_2 > 0 then
							ll_dscto_2 			= ll_dscto_2 - 1
							//w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',(ll_dscto_2 * -1))
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto', ll_dscto_2 )
							ll_pasa_dscto ++
						else
							if ll_tot_pago = ll_dscto_2 or ll_tot_pago = 0 then 
								ll_dscto_2 = ll_dscto_2 - 1
								ll_pasa_dscto ++
							end if
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto', ll_dscto_2 )
						end if
//						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',(ll_dscto_2 * -1))
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_dscto_3 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_3 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','S')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_dscto_3)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						if ll_sw_lib = 0 and ll_dscto_3 > 0 then
							ll_dscto_3 			= ll_dscto_3 - 1
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto', ll_dscto_3 )
							ll_pasa_dscto ++
						else
							if ll_tot_pago = ll_dscto_3 or ll_tot_pago = 0 then 
								ll_dscto_3 = ll_dscto_3 - 1
								ll_pasa_dscto ++
							end if
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto', ll_dscto_3 )
						end if
//						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',(ll_dscto_3 * -1))
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_dscto_4 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							   ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_4 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							   ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','S')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_dscto_4)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						if ll_sw_lib = 0 and ll_dscto_4 > 0 then
							ll_dscto_4 			= ll_dscto_4 - 1
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto', ll_dscto_4 )
							ll_pasa_dscto ++
						else
							if ll_tot_pago = ll_dscto_4 or ll_tot_pago = 0 then 
								ll_dscto_4	= ll_dscto_4 - 1
								ll_pasa_dscto ++
							end if
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto', ll_dscto_4 )
						end if
//						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',(ll_dscto_4 * -1))
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_dscto_5 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_5 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','S')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_dscto_5)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						if ll_sw_lib = 0 and ll_dscto_5 > 0 then
							ll_dscto_5 			= ll_dscto_5 - 1
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto', ll_dscto_5 )
							ll_pasa_dscto ++
						else
							if ll_tot_pago = ll_dscto_5 or ll_tot_pago = 0 then 
								ll_dscto_5 = ll_dscto_5 - 1
								ll_pasa_dscto ++
							end if
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto', ll_dscto_5 )
						end if
//						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',(ll_dscto_5 * -1))
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_dscto_6 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_6 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','S')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_dscto_6)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						if ll_sw_lib = 0 and ll_dscto_6 > 0 then
							ll_dscto_6 			= ll_dscto_6 - 1
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto', ll_dscto_6 )
							ll_pasa_dscto ++
						else
							if ll_tot_pago = ll_dscto_6 or ll_tot_pago = 0 then 
								ll_dscto_6 = ll_dscto_6 - 1
								ll_pasa_dscto ++
							end if
							w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto', ll_dscto_6 )
						end if
//						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',(ll_dscto_6 * -1))
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				////////////// ADICIONAL FRANCK //////////////
				if ll_monto_adic_1 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_adicional_1 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','L')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_adicional_1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_monto_adic_1)
						ldb_suma_pagos		= ldb_suma_pagos + ll_monto_adic_1
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_monto_adic_2 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							   ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_adicional_2 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							   ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','L')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_adicional_2)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_monto_adic_2)
						ldb_suma_pagos		= ldb_suma_pagos + ll_monto_adic_2
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_monto_adic_3 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_adicional_3 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','L')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_adicional_3)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_monto_adic_3)
						ldb_suma_pagos		= ldb_suma_pagos + ll_monto_adic_3
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				if ll_monto_adic_4 > 0 then
					SELECT 	count("FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) 
					INTO 		:ll_count  
					FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"FICHA_SEPULTACION_PAGO"  
					WHERE ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "FICHA_SEPULTACION_PAGO"."CODIGO_OTRO" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "FICHA_SEPULTACION_PAGO"."TIPO_MOV" ) and  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "FICHA_SEPULTACION_PAGO"."TIPO_COB" ) and  
							  ( "FICHA_SEPULTACION_PAGO"."BASE" = :ls_base ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."SERIE" = :ls_serie ) AND  
							  ( "FICHA_SEPULTACION_PAGO"."NUMERO" = :ll_numero ) AND
							  ( "FICHA_SEPULTACION_PAGO"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_adicional_4 ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" = :gs_tipo_cobro_aux ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = :ls_tipo_ficha ) AND  
							  ( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   ;  
					if ll_count > 0 then
						ll_new					= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.insertrow(0)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'cantidad',1)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob','L')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'tipo_cob_otro',ls_adicional_4)
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'moneda','P')
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_new,'monto',ll_monto_adic_4)
						ldb_suma_pagos		= ldb_suma_pagos + ll_monto_adic_4
						w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
					end if
				end if
				////////////////////////////////////////////////////
				if w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.rowcount()=0 then
					ll_fila						= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.insertrow(0)
					w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.setitem(ll_fila,'mora',0)
					w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.setitem(ll_fila,'gastos_cob',0)
					w_ingreso2.tab_ingreso.tp_be.cb_ingresar_pago_be.enabled	= true
					w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.accepttext()
				end if

				if w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount() > 0 then
					w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.SetItem(1, "Subtotal",w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.GetItemNumber(1,"c_subtotal"))
				end if
				w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.accepttext()
				if ls_tipo_ficha='FS' then
					UPDATE	"FICHA_SEPULTACION"  
					SET 		"IP" = :gs_tcp_ip  
					WHERE  ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fec_sepult ) AND  
							 ( "FICHA_SEPULTACION"."HORA" = :ll_hora ) AND  
							 ( "FICHA_SEPULTACION"."MINUTOS" = :ll_minuto ) AND  
							 ( "FICHA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
							 ( "FICHA_SEPULTACION"."SEPULTURA" = :ls_sepultura )   AND
							 ( "FICHA_SEPULTACION"."CODIGO_PARENTESCO" = :ls_cod_parent )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				elseif ls_tipo_ficha='FT' then
					UPDATE	"FICHA_TRASLADO"  
					SET 		"IP" = :gs_tcp_ip  
					WHERE  ( "FICHA_TRASLADO"."COD_PARQUE" = :il_cod_parque ) AND  
							 ( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fec_sepult ) AND  
							 ( "FICHA_TRASLADO"."HORA_FIJADA" = :ll_hora ) AND  
							 ( "FICHA_TRASLADO"."MINUTO_FIJADA" = :ll_minuto ) AND  
							 ( "FICHA_TRASLADO"."SECTOR_ORIGEN" = :ls_sector ) AND  
							 ( "FICHA_TRASLADO"."SEPULTURA_ORIGEN" = :ls_sepultura ) AND  
							 ( "FICHA_TRASLADO"."CODIGO_PARENTESCO" = :ls_cod_parent ) AND 
							 ( "FICHA_TRASLADO"."BASE_ORIGEN" = :ls_base_caja ) AND 
							 ( "FICHA_TRASLADO"."SERIE_ORIGEN" = :ls_serie_caja ) AND 
							 ( "FICHA_TRASLADO"."NUMERO_ORIGEN" = :ll_numero_caja ) 
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						UPDATE	"FICHA_TRASLADO"  
						SET 		"IP" = :gs_tcp_ip  
						WHERE  ( "FICHA_TRASLADO"."COD_PARQUE" = :il_cod_parque ) AND  
								 ( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fec_sepult ) AND  
								 ( "FICHA_TRASLADO"."HORA_FIJADA" = :ll_hora ) AND  
								 ( "FICHA_TRASLADO"."MINUTO_FIJADA" = :ll_minuto ) AND  
								 ( "FICHA_TRASLADO"."SECTOR_ORIGEN" = :ls_sector ) AND  
								 ( "FICHA_TRASLADO"."SEPULTURA_ORIGEN" = :ls_sepultura ) AND  
								 ( "FICHA_TRASLADO"."CODIGO_PARENTESCO" = :ls_cod_parent ) AND 
								 ( "FICHA_TRASLADO"."BASE_DESTINO" = :ls_base_caja ) AND 
								 ( "FICHA_TRASLADO"."SERIE_DESTINO" = :ls_serie_caja ) AND 
								 ( "FICHA_TRASLADO"."NUMERO_DESTINO" = :ll_numero_caja ) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
				end if
			end if
		end if
		gs_tipo_cobro_aux				= dw_lista.getitemstring(il_row,'vista_fs_pagos_tipocob_tipo_cobro_aux')
	end if
end if

close(w_buscar_pago_ficha_sepultacion)
w_ingreso2.setfocus()

end event

type dw_lista from datawindow within w_buscar_pago_ficha_sepultacion
integer x = 27
integer y = 32
integer width = 5696
integer height = 1828
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_ficha_sepultacion_a_pagar_ctto"
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna

ls_columna	= dwo.name
if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
else
	if ls_columna='t_blanco' or ls_columna='t_blanco_t' then
		dw_lista.SETfilter('c_tipo_ficha = "FS"')
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra Ficha de Sepultación en Rango de Fecha")
		end if
	elseif ls_columna='t_amarillo' or ls_columna='t_amarillo_t' then
		dw_lista.SETfilter('c_tipo_ficha = "FT"')
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra Ficha de Traslado en Rango de Fecha")
		end if
	elseif ls_columna='t_mostrar_todo' then
		dw_lista.SETfilter('')
		dw_lista.filter()
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	cb_aceptar.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_buscar_pago_ficha_sepultacion
integer x = 512
integer y = 1876
integer width = 2231
integer height = 204
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo de Busqueda"
end type

type gb_2 from groupbox within w_buscar_pago_ficha_sepultacion
integer x = 2793
integer y = 1876
integer width = 571
integer height = 204
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

