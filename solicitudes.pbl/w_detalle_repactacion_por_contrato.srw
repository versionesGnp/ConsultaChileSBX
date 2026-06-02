forward
global type w_detalle_repactacion_por_contrato from window
end type
type cbx_reprog_historica from checkbox within w_detalle_repactacion_por_contrato
end type
type cb_ctacte from commandbutton within w_detalle_repactacion_por_contrato
end type
type cb_reprog from commandbutton within w_detalle_repactacion_por_contrato
end type
type cb_eliminar from commandbutton within w_detalle_repactacion_por_contrato
end type
type em_val_total from statictext within w_detalle_repactacion_por_contrato
end type
type st_txt_total from statictext within w_detalle_repactacion_por_contrato
end type
type em_val_interes from statictext within w_detalle_repactacion_por_contrato
end type
type st_txt_interes from statictext within w_detalle_repactacion_por_contrato
end type
type st_monto_en_uf from statictext within w_detalle_repactacion_por_contrato
end type
type st_deuda_uf from statictext within w_detalle_repactacion_por_contrato
end type
type st_monto_uf from statictext within w_detalle_repactacion_por_contrato
end type
type st_5 from statictext within w_detalle_repactacion_por_contrato
end type
type em_moneda from statictext within w_detalle_repactacion_por_contrato
end type
type st_3 from statictext within w_detalle_repactacion_por_contrato
end type
type cb_pago from commandbutton within w_detalle_repactacion_por_contrato
end type
type em_cant_ctas from statictext within w_detalle_repactacion_por_contrato
end type
type em_deuda from statictext within w_detalle_repactacion_por_contrato
end type
type st_1 from statictext within w_detalle_repactacion_por_contrato
end type
type st_2 from statictext within w_detalle_repactacion_por_contrato
end type
type st_base from statictext within w_detalle_repactacion_por_contrato
end type
type st_serie from statictext within w_detalle_repactacion_por_contrato
end type
type st_numero from statictext within w_detalle_repactacion_por_contrato
end type
type st_cliente from statictext within w_detalle_repactacion_por_contrato
end type
type st_txt_real from statictext within w_detalle_repactacion_por_contrato
end type
type st_4 from statictext within w_detalle_repactacion_por_contrato
end type
type st_fecha_prox_pago from statictext within w_detalle_repactacion_por_contrato
end type
type cb_cerrar from commandbutton within w_detalle_repactacion_por_contrato
end type
type dw_lista from datawindow within w_detalle_repactacion_por_contrato
end type
type cb_aceptar from commandbutton within w_detalle_repactacion_por_contrato
end type
type cb_nuevo from commandbutton within w_detalle_repactacion_por_contrato
end type
end forward

global type w_detalle_repactacion_por_contrato from window
integer width = 3278
integer height = 1800
boolean titlebar = true
string title = "Reprogramar Cuotas de Mantención"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cbx_reprog_historica cbx_reprog_historica
cb_ctacte cb_ctacte
cb_reprog cb_reprog
cb_eliminar cb_eliminar
em_val_total em_val_total
st_txt_total st_txt_total
em_val_interes em_val_interes
st_txt_interes st_txt_interes
st_monto_en_uf st_monto_en_uf
st_deuda_uf st_deuda_uf
st_monto_uf st_monto_uf
st_5 st_5
em_moneda em_moneda
st_3 st_3
cb_pago cb_pago
em_cant_ctas em_cant_ctas
em_deuda em_deuda
st_1 st_1
st_2 st_2
st_base st_base
st_serie st_serie
st_numero st_numero
st_cliente st_cliente
st_txt_real st_txt_real
st_4 st_4
st_fecha_prox_pago st_fecha_prox_pago
cb_cerrar cb_cerrar
dw_lista dw_lista
cb_aceptar cb_aceptar
cb_nuevo cb_nuevo
end type
global w_detalle_repactacion_por_contrato w_detalle_repactacion_por_contrato

type variables
String		is_base,is_serie,is_string,is_filtro
Long		il_monto, il_cant_cta,ii_cantidad,ii_dmora,ii_mora_cobro,ii_inc_gastos,&
			il_row,il_tot_reg
Date		id_fecha_prox_pago,idt_fecha_hoy
Double	id_monto_uf,id_valor_cuota,id_gc,id_im,id_factor_005,il_numero
		
end variables

on w_detalle_repactacion_por_contrato.create
this.cbx_reprog_historica=create cbx_reprog_historica
this.cb_ctacte=create cb_ctacte
this.cb_reprog=create cb_reprog
this.cb_eliminar=create cb_eliminar
this.em_val_total=create em_val_total
this.st_txt_total=create st_txt_total
this.em_val_interes=create em_val_interes
this.st_txt_interes=create st_txt_interes
this.st_monto_en_uf=create st_monto_en_uf
this.st_deuda_uf=create st_deuda_uf
this.st_monto_uf=create st_monto_uf
this.st_5=create st_5
this.em_moneda=create em_moneda
this.st_3=create st_3
this.cb_pago=create cb_pago
this.em_cant_ctas=create em_cant_ctas
this.em_deuda=create em_deuda
this.st_1=create st_1
this.st_2=create st_2
this.st_base=create st_base
this.st_serie=create st_serie
this.st_numero=create st_numero
this.st_cliente=create st_cliente
this.st_txt_real=create st_txt_real
this.st_4=create st_4
this.st_fecha_prox_pago=create st_fecha_prox_pago
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.cb_aceptar=create cb_aceptar
this.cb_nuevo=create cb_nuevo
this.Control[]={this.cbx_reprog_historica,&
this.cb_ctacte,&
this.cb_reprog,&
this.cb_eliminar,&
this.em_val_total,&
this.st_txt_total,&
this.em_val_interes,&
this.st_txt_interes,&
this.st_monto_en_uf,&
this.st_deuda_uf,&
this.st_monto_uf,&
this.st_5,&
this.em_moneda,&
this.st_3,&
this.cb_pago,&
this.em_cant_ctas,&
this.em_deuda,&
this.st_1,&
this.st_2,&
this.st_base,&
this.st_serie,&
this.st_numero,&
this.st_cliente,&
this.st_txt_real,&
this.st_4,&
this.st_fecha_prox_pago,&
this.cb_cerrar,&
this.dw_lista,&
this.cb_aceptar,&
this.cb_nuevo}
end on

on w_detalle_repactacion_por_contrato.destroy
destroy(this.cbx_reprog_historica)
destroy(this.cb_ctacte)
destroy(this.cb_reprog)
destroy(this.cb_eliminar)
destroy(this.em_val_total)
destroy(this.st_txt_total)
destroy(this.em_val_interes)
destroy(this.st_txt_interes)
destroy(this.st_monto_en_uf)
destroy(this.st_deuda_uf)
destroy(this.st_monto_uf)
destroy(this.st_5)
destroy(this.em_moneda)
destroy(this.st_3)
destroy(this.cb_pago)
destroy(this.em_cant_ctas)
destroy(this.em_deuda)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_base)
destroy(this.st_serie)
destroy(this.st_numero)
destroy(this.st_cliente)
destroy(this.st_txt_real)
destroy(this.st_4)
destroy(this.st_fecha_prox_pago)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.cb_aceptar)
destroy(this.cb_nuevo)
end on

event open;Date		ld_fecha
datetime	ldt_fecha
Time		lt_hora
Double	ldb_calc_monto
Long		ll_recal_interes

//id_factor_005  			= f_factor_gasto_cobranza()
idt_fecha_hoy				= date(gdt_fec_sistema)
SELECT	"TASA"."GASTO_COB_MORA" INTO :id_factor_005 FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
gs_moneda					= '2'
lt_hora						= time("00:00:00")
ld_fecha						= idt_fecha_hoy
ldt_fecha						= datetime(ld_fecha,lt_hora)
gf_centrar(w_detalle_repactacion_por_contrato)
dw_lista.dataobject		= 'dw_detalle_repactacion_por_ctto_l'
dw_lista.settransobject(sqlca)
if trim(gs_opera)='1' then
	cb_eliminar.enabled	= true
else
	cb_eliminar.enabled	= false
end if
cb_pago.enabled			= false
is_string						= Message.StringParm
is_base 						= substr(1,1,Message.StringParm)
is_serie						= substr(1,2,Message.StringParm)
il_numero					= Double(substr(1,3,Message.StringParm))
il_monto						= Long(substr(1,4,Message.StringParm))
st_base.text					= is_base
st_serie.text					= is_serie
st_numero.text				= string(il_numero,"###,###,###,###,###,##0")
st_cliente.text				= trim(substr(1,5,Message.StringParm))
id_fecha_prox_pago		= date(substr(1,6,Message.StringParm))
st_fecha_prox_pago.text	= substr(1,6,Message.StringParm)
il_cant_cta					= long(substr(1,7,Message.StringParm))
em_cant_ctas.text			= string(il_cant_cta,"###,###,###,##0")
em_val_interes.text		= string(gd_val_interes,"###,###,###,###,###,##0")
em_deuda.text				= string(gd_val_deuda,"###,###,###,###,###,##0")
il_monto						= gd_val_deuda + gd_val_interes
ldb_calc_monto				= round(il_monto / gd_uf_dia,4)
il_monto						= round(ldb_calc_monto * gd_uf_dia,0)
ll_recal_interes				= il_monto - (gd_val_deuda + gd_val_interes)
if ll_recal_interes > 0 then
	gd_val_interes			= gd_val_interes + ll_recal_interes
	em_val_interes.text	= string(gd_val_interes,"###,###,###,###,###,##0")
end if
em_val_total.text			= string(il_monto,"###,###,###,###,###,##0")
if gs_moneda='1' then
	em_moneda.text		= 'Peso'
elseif gs_moneda='2' then
	em_moneda.text		= 'U.F.'
end if
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:gd_uf_dia  
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha   
Using		sqlca ;
if sqlca.sqlcode=0 then
	st_monto_uf.text		= string(gd_uf_dia,'###,###,###,##0.00')
	id_monto_uf				= il_monto / gd_uf_dia
	st_deuda_uf.text		= string(id_monto_uf,"###,###,###,###,##0.00")
end if
if is_base<>'' and not isnull(is_base) and is_serie<>'' and not isnull(is_serie) and il_numero>0 then
	il_tot_reg				= dw_lista.retrieve(is_base,is_serie,il_numero)
	if il_tot_reg > 0 then 
		cb_pago.enabled	= true
		dw_lista.scrolltorow(il_tot_reg)
	else
		cb_pago.enabled	= false
	end if
else
	messagebox("Advertencia","Contrato Invalido")
	close(w_detalle_repactacion_por_contrato)
end if
gs_ventana					= 'w_detalle_repactacion_por_contrato'
f_valida_objeto()
end event

type cbx_reprog_historica from checkbox within w_detalle_repactacion_por_contrato
integer x = 1691
integer y = 1576
integer width = 530
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reprog. Históricas"
end type

event clicked;if cbx_reprog_historica.checked=true then
	dw_lista.dataobject	= 'dw_detalle_repactacion_por_ctto'
else
	dw_lista.dataobject	= 'dw_detalle_repactacion_por_ctto_l'
end if
dw_lista.settransobject(sqlca)
il_tot_reg				= dw_lista.retrieve(is_base,is_serie,il_numero)
if il_tot_reg > 0 then 
	cb_pago.enabled	= true
	dw_lista.scrolltorow(il_tot_reg)
else
	cb_pago.enabled	= false
end if
end event

type cb_ctacte from commandbutton within w_detalle_repactacion_por_contrato
integer x = 2267
integer y = 1568
integer width = 453
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;gi_tipo_busqueda 	= 1
gs_base_aux			= gs_base
gs_serie_aux		= gs_serie
gl_numero_aux		= gi_numero
if isvalid(w_listado_contratos_rut) then close(w_listado_contratos_rut)
open(w_listado_contratos_rut)
end event

type cb_reprog from commandbutton within w_detalle_repactacion_por_contrato
boolean visible = false
integer x = 1147
integer y = 1568
integer width = 489
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "&Reprogramar"
end type

event clicked;long		ll_tot_reg,ll_row,ll_ctas_pagadas,ll_ctas_pactadas,ll_corr,ll_ctas_mora,ll_dias_mora,ll_dif_ctas, &
			ll_int_cta_pesos,ll_int_adm_pesos,ll_int_deuda_pesos,ll_ctas_mora_ori,periodo,ll_val_presente,&
			ll_val_gtos_adm,ll_val_mora_cta,ll_val_saldo_insoluto,i,ll_cta_original,ll_tot_real_cta,&
			ll_cta_mora_mant_cadena,ll_monto_mora_mant,ll_val_real_mora_mant,ll_val_interes_rep,ll_cta_mora_ori
String	ls_estado,ls_filter,ls_string
datetime	ldt_fec_prim_cta,ldt_fec_ult_pago
Double	ld_uf_dia,ld_tot_deuda_uf,ld_valor_cta_uf,ld_factor,ld_valor_presente,ld_gasto_adm,ld_valor_insoluto,&
			ld_saldo_insoluto,ld_mora_cuota,ld_tasa_int_uf,ldb_valor_cuota_mant
		
if isvalid(w_repacta_mora_mantencion_reprog) then close(w_repacta_mora_mantencion_reprog)
ll_tot_reg										= dw_lista.rowcount()
if ll_tot_reg>0 then
	if il_row>0 then
		ls_estado								= dw_lista.getitemstring(il_row,'estado_pago')
		if ls_estado='V' or ls_estado='R' then
			ls_filter								= "estado_pago='V' or estado_pago='R'"
			ll_row 								= dw_lista.Find(ls_filter, 1, ll_tot_reg )
			IF ll_row > 0 THEN
				ldt_fec_prim_cta				= dw_lista.getitemdatetime(il_row,'fecha_primera_cta')
				ll_ctas_pagadas				= dw_lista.getitemnumber(il_row,'ctas_pagadas')
				ll_ctas_pactadas				= dw_lista.getitemnumber(il_row,'cuotas_pactadas')
				gl_ctas_pag_m					= dw_lista.GetItemnumber(1,'cuotas_en_mora')

				SELECT	"CADENA_MORA"."MORA_MANT",
							"CADENA_MORA"."VALOR_CUOTA_MANT"
				INTO 		:ll_cta_mora_mant_cadena,
							:ldb_valor_cuota_mant
				FROM 		"CADENA_MORA"  
				WHERE  ( "CADENA_MORA"."BASE" = :is_base ) AND  
						 ( "CADENA_MORA"."SERIE" = :is_serie ) AND  
						 ( "CADENA_MORA"."NUMERO" = :il_numero )   
				Using		sqlca;
				if isnull(ll_cta_mora_mant_cadena) then ll_cta_mora_mant_cadena=0
				if ll_cta_mora_mant_cadena>0 then
					ll_monto_mora_mant	= round(((ll_cta_mora_mant_cadena * ldb_valor_cuota_mant) * gd_uf_dia),0)
				end if
				ll_ctas_mora_ori	= ll_cta_mora_mant_cadena
				if ll_ctas_pagadas < ll_ctas_pactadas and ll_ctas_pagadas > 0 then
					SELECT 	MAX("REPACTA_MANTENCION_L"."CORRELATIVO")
					INTO 		:ll_corr
					FROM 		"REPACTA_MANTENCION_L"  
					WHERE  ( "REPACTA_MANTENCION_L"."BASE_ORIGINAL" = :is_base ) AND
							 ( "REPACTA_MANTENCION_L"."SERIE_ORIGINAL" = :is_serie ) AND
							 ( "REPACTA_MANTENCION_L"."NUMERO_ORIGINAL" = :il_numero )
					Using	sqlca ;
					if sqlca.sqlcode=0 then
						if ll_corr > 0 then
							ll_corr++
						else
							ll_corr				= 1
						end if
					else
						ll_corr					= 1
					end if
					ll_ctas_mora				= funcion_mora( ldt_fec_prim_cta , ll_ctas_pagadas , ll_ctas_pactadas, ls_estado )
					ll_dias_mora				= -daysafter(idt_fecha_hoy,funcion_venc( ldt_fec_prim_cta , ll_ctas_pagadas ))
					if ll_ctas_mora <= 0 then
						ll_ctas_mora			= 0
					else
						if ll_dias_mora <= 5 then
							ll_ctas_mora		= 0
						end if
					end if
					ll_dif_ctas					= ll_ctas_pactadas - ll_ctas_pagadas
					ll_int_cta_pesos			= dw_lista.getitemnumber(il_row,'interes_cuota_pesos')
					ll_int_adm_pesos			= dw_lista.getitemnumber(il_row,'interes_adm_pesos')
					ll_int_deuda_pesos		= dw_lista.getitemnumber(il_row,'interes_deuda_pesos')
					ld_uf_dia						= double(dw_lista.getitemnumber(il_row,'uf_dia'))
					ld_tot_deuda_uf			= double(dw_lista.getitemnumber(il_row,'total_deuda_uf'))
					ld_valor_cta_uf				= double(dw_lista.getitemnumber(il_row,'valor_cuota_uf'))
//					ll_ctas_mora_ori			= dw_lista.getitemnumber(il_row,'ctas_pag_m_original')
					
//					SELECT	"CADENA_MORA"."MORA_MANT"  
//					INTO 		:ll_ctas_mora_ori  
//					FROM 		"CADENA_MORA"  
//					WHERE  ( "CADENA_MORA"."BASE" = :is_base ) AND  
//							 ( "CADENA_MORA"."SERIE" = :is_serie ) AND  
//							 ( "CADENA_MORA"."NUMERO" = :il_numero )   
//					USING		sqlca;
					if isnull(ll_ctas_mora_ori) then ll_ctas_mora_ori=0

					
					ll_cta_original				= dw_lista.getitemnumber(il_row,'cuotas_en_mora') //cta_mora_original
					ll_cta_original				= ll_cta_original + ll_cta_mora_ori
//					ll_tot_real_cta				= gl_ctas_pag_m - ll_cta_original
					
//					if isnull(ll_ctas_mora_ori) then ll_ctas_mora_ori=gl_ctas_pag_m
					ld_factor						= double(dw_lista.getitemnumber(il_row,'factor_aplicado'))
	//				calculo valor presente
					if ll_ctas_mora >  ll_dif_ctas then 
						ld_valor_presente		= 0
					else
						if ll_ctas_pagadas > 0 then
							periodo				=  ll_ctas_pactadas - ll_ctas_mora - ll_ctas_pagadas 
							ld_valor_presente	= f_vp( periodo , id_factor_005 , ld_valor_cta_uf ) 
						else
							ld_valor_presente	= (ld_tot_deuda_uf - (ll_ctas_pagadas * ld_valor_cta_uf)) + (ll_ctas_pactadas * 0.1 )
						end if
					end if
	// 			calculo periodo
					if ll_ctas_mora < ll_ctas_pactadas then 
						ld_gasto_adm			= periodo * id_factor_005 
					else
						ld_gasto_adm			= 0
					end if
	// 			calculo mora cuota
					SELECT	"TASA"."TASA_INT_UF"  
					INTO 		:ld_tasa_int_uf  
					FROM 		"TASA"  
					USING		SQLCA;
					ii_cantidad 					= ll_ctas_mora //ll_dif_ctas
					gl_n_cuotas_pag 			= ii_cantidad 
					id_valor_cuota 				= Round(ld_valor_cta_uf * gd_uf_dia, 0)
					ii_dmora 					= ll_dias_mora
					id_gc 							= 0
					id_im 							= 0
					ii_mora_cobro 				= 0
					ii_inc_gastos 				= 0
					FOR i = 1 TO ii_cantidad 
						IF (ii_dmora - (i - 1) * 30) > 5 THEN 
							ii_mora_cobro 		= (ii_dmora - (i - 1) * 30)
							id_im 					= id_im + gf_int_mora(ld_tasa_int_uf, ii_mora_cobro, id_valor_cuota)
							IF (ii_dmora - (i - 1) * 30) > 30 THEN 
								id_gc 				= id_gc + Round(id_valor_cuota * id_factor_005, 0) //005// PASA .1 A .05
								ii_inc_gastos 	= 1
							END IF
						ELSE
							// id_gc = 0
							// id_im = 0
							// ii_mora_cobro 	= 0
						END IF
					NEXT
					ll_val_interes_rep			= id_gc + id_im
					id_gc							= id_gc / gd_uf_dia
					id_im							= id_im / gd_uf_dia
					ld_mora_cuota				= ( ll_ctas_mora * ld_valor_cta_uf ) + id_gc + id_im
	// 			calculo valor insoluto
					if ll_ctas_mora <= ll_ctas_pactadas then 
						if ld_gasto_adm > 0 then
							ld_valor_insoluto	= ((ld_valor_presente - ld_gasto_adm) + ld_mora_cuota)
						else
							ld_valor_insoluto	= ld_mora_cuota
						end if
					else
						ld_valor_insoluto		= ((ld_valor_presente - ld_gasto_adm) + ld_mora_cuota)
					end if
					if ll_ctas_mora <= ll_ctas_pactadas then
						if ld_gasto_adm > 0 then
							ld_saldo_insoluto	= ((ld_valor_presente - ld_gasto_adm) + ld_mora_cuota )
						else
							ld_saldo_insoluto	= ld_mora_cuota
						end if
					else
						ld_saldo_insoluto		= ((ld_valor_presente - ld_gasto_adm) + ld_mora_cuota)
					end if
					ll_val_presente				= round(ld_valor_presente * gd_uf_dia,0)
					ll_val_gtos_adm			= round(ld_gasto_adm * gd_uf_dia,0)
					ll_val_mora_cta			= round(ld_mora_cuota * gd_uf_dia,0)
					ll_val_saldo_insoluto		= round(ld_saldo_insoluto * gd_uf_dia,0)
					gd_val_interes				= gd_val_interes + ll_val_gtos_adm + ll_val_interes_rep //ld_resul
					gd_val_deuda				= gd_val_deuda + ll_val_saldo_insoluto  //ld_total
					ll_val_real_mora_mant	= ll_val_mora_cta + il_monto //+ ll_monto_mora_mant
//					messagebox("B + S + Nº + gd_val_deuda + st_cliente + st_fecha_prox_pago + ll_cta_original + ll_corr + N + ll_ctas_mora_ori + ll_val_presente + ll_val_gtos_adm + gd_val_interes + ll_val_real_mora_mant + gl_ctas_pag_m",is_base+'+'+is_serie+'+'+string(il_numero)+'+'+string(gd_val_deuda)+'+'+st_cliente.text+'+'+st_fecha_prox_pago.text+'+'+string(ll_cta_original)+'+'+string(ll_corr)+'+'+'N'+'+'+string(ll_ctas_mora_ori)+'+'+string(ll_val_presente)+'+'+string(ll_val_gtos_adm)+'+'+string(gd_val_interes)+'+'+string(ll_val_real_mora_mant)+'+'+string(gl_ctas_pag_m))
														  
					ls_string						= 	  is_base+'~t'+is_serie+'~t'+string(il_numero) &
														  +'~t'+string(gd_val_deuda)+'~t'+st_cliente.text &
														  +'~t'+st_fecha_prox_pago.text+'~t'+string(ll_cta_original) &
														  +'~t'+string(ll_corr)+'~t'+'N'+'~t'+string(ll_ctas_mora_ori) &
														  +'~t'+string(ll_val_presente)+'~t'+string(ll_val_gtos_adm) &
														  +'~t'+string(gd_val_interes)+'~t'+string(ll_val_real_mora_mant) &
														  +'~t'+string(gl_ctas_pag_m)
					openwithparm(w_repacta_mora_mantencion_reprog,ls_string)
				else
					messagebox("Advertencia","No es Necesario Reprogramar Nuevamente, sólo Anular Reprogramación no existe(n) pago(s)")
				end if
			else
				MessageBox("Advertencia", "No puede Reprogramar, debe existir Reprogramación Vigente")
			END IF
		else
			messagebox("Advertencia","Debe seleccionar Reprogramación Mantención Vigente")
		end if
	else
		messagebox("Advertencia","Debe seleccionar Reprogramación Mantención")
	end if
else
	messagebox("Advertencia","No Registra Reprogramación Cuotas de Mantención")
end if
end event

type cb_eliminar from commandbutton within w_detalle_repactacion_por_contrato
integer x = 800
integer y = 1568
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Anular"
end type

event clicked;string		ls_base_aux, ls_estado='S'
integer	ll_resp
Long		ll_count_reg, ll_cuotas_pag,ll_correlativo, ll_cta_mora_ori,ll_cta_pag_ctto, ll_tot_reg,ll_cta_pag_m,ll_count_anular
Date		ld_fecha
Double	ll_numero,ll_num_ori

ll_tot_reg					= dw_lista.rowcount()
if ll_tot_reg>0 and il_row>0 then
//	if dw_lista.dataobject	= 'dw_detalle_repactacion_por_ctto_l' then
//		messagebox("Advertencia","No se puede Anular Reprogramación Nº:  "+'R - '+is_serie+' - '+string(il_numero,"###,###,###,###,##0")+' Anexo Liberador Asociado')
//	else
		ld_fecha				= idt_fecha_hoy
		ll_cuotas_pag		= dw_lista.getitemnumber(il_row,'ctas_pagadas')
		ll_correlativo		= dw_lista.getitemnumber(il_row,'correlativo')
		ll_cta_mora_ori		= dw_lista.getitemnumber(il_row,'cuotas_en_mora')
		ll_num_ori			= dw_lista.getitemnumber(il_row,'numero_original')
		ll_numero			= dw_lista.getitemnumber(il_row,'numero')
		ls_estado			= dw_lista.getitemString(il_row,'estado_pago')
		ll_cta_pag_m		= dw_lista.getitemnumber(il_row,'ctas_pag_m_original')
	//	ll_cta_pag_m		= dw_lista.getitemnumber(il_row,'cta_mora_original')
//		if isnull(ll_cta_pag_m) then 
//			CHOOSE CASE is_base
//				CASE 'C'
//					SELECT	"CONTRATO"."CTA_PAG_M"  
//					INTO 		:ll_cta_pag_ctto  
//					FROM 		"CONTRATO"  
//					WHERE  ( "CONTRATO"."SERIE_C" = :is_serie ) AND  
//							 ( "CONTRATO"."NRO_CONTRATO" = :il_numero ) 
//					Using		sqlca ;
//					if sqlca.sqlcode=0 then
//						ll_cta_pag_m		= ll_cta_pag_ctto - ll_cta_mora_ori
//					end if
//	
//				CASE 'O'
//					SELECT	"OFERTA_V"."CTA_PAG_M"  
//					INTO 		:ll_cta_pag_ctto    
//					FROM 		"CADENA",   
//								"OFERTA_V",   
//								"PAGO_OFERTA"  
//					WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
//							 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
//							 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
//							 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
//							 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
//							 (("CADENA"."CODIGO" = 'O' ) AND  
//							 ( "CADENA"."SERIE" = :is_serie ) AND  
//							 ( "CADENA"."NUMERO" = :il_numero ) )    
//					Using	sqlca ;
//					if sqlca.sqlcode=0 then
//						ll_cta_pag_m		= ll_cta_pag_ctto - ll_cta_mora_ori
//					end if
//	
//			END CHOOSE
//		end if
		if ls_estado='N' then
			messagebox("Advertencia","Reprogramación Nº "+'R - '+is_serie+' - '+string(il_numero,"###,###,###,##0")+' - '+string(ll_correlativo,"###,###,###,##0")+' está anulada')
		else
			if (gs_user<>gs_usuario_1 and gs_user<>gs_usuario_2 and gs_user<>gs_usuario_3 and &
				gs_user<>gs_usuario_4 and gs_user<>gs_usuario_5 and ll_tot_reg=1) or (gs_user=gs_usuario_1 or &
				gs_user=gs_usuario_2 or gs_user=gs_usuario_3 or gs_user=gs_usuario_4 or gs_user=gs_usuario_5) then
				if ll_cuotas_pag=0 then
					ll_resp = MessageBox("Eliminar", "Está Seguro Anular Reprogramación Nº "+'R - '+is_serie+' - '+string(il_numero,"###,###,###,##0")+' - '+string(ll_correlativo,"###,###,###,##0"), &
							Exclamation!, YesNo!, 2)
					IF ll_resp = 1 THEN
						dw_lista.setitem(il_row,'estado_pago','N')
						if dw_lista.update()=1 then
							commit;
//							SELECT	COUNT("CUPONERAS"."BASE")  
//							INTO 		:ll_count_anular  
//							FROM 	"CUPONERAS",   
//										"CUPONERAS_DETALLE"  
//							WHERE  ( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
//									 ( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
//									 ( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
//									 ( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
//									 (("CUPONERAS"."BASE" = :is_base ) AND  
//									 ( "CUPONERAS"."SERIE" = :is_serie ) AND  
//									 ( "CUPONERAS"."NUMERO" = :il_numero ) AND  
//									 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND  
//									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
//									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'A' ) )   ;
//							if ll_count_anular > 0 then
//								UPDATE	"CUPONERAS_DETALLE"  
//								SET 		"ESTADO_PAGO_CUPON" = 'V'  
//								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :is_base ) AND  
//										 ( "CUPONERAS_DETALLE"."SERIE" = :is_serie ) AND  
//										 ( "CUPONERAS_DETALLE"."NUMERO" = :il_numero ) AND  
//										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'A' ) AND  
//										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   
//								USING		sqlca;
//								if sqlca.sqlcode=0 then
//									commit;
//								else
//									rollback;
//								end if
//							end if
//	
//							UPDATE "CADENA"
//							SET    "ESTADO" = 'N',
//									 "FECHA_RES" = :ld_fecha
//							WHERE ( "CADENA"."CODIGO" = 'R' ) AND  
//									( "CADENA"."SERIE" = :is_serie ) AND  
//									( "CADENA"."NUMERO" = :ll_numero )   
//							Using	sqlca ;
//							if sqlca.sqlcode=0 then
//								commit;
//								// busco cta pagadas
//								if is_base='C' then // CTTO ISA
//									// reversa reprog
//									UPDATE "CONTRATO"  
//									SET 	"ANEXO_REPACTA" = null,   
//											"CTA_REPACTA" = 0,  
//											"CTA_PAG_M" = :ll_cta_pag_m
//									WHERE ( "CONTRATO"."SERIE_C" = :is_serie ) AND  
//											( "CONTRATO"."NRO_CONTRATO" = :ll_num_ori )   
//									Using	sqlca ;
//									if sqlca.sqlcode=0 then
//										commit;
//									else
//										rollback;
//									end if
//								elseif is_base='O' then // PROMESAS
//									// reversa reprog
//									UPDATE "OFERTA_V"  
//									SET 	"ANEXO_REPACTA" = null,   
//											"CTA_REPACTA" = 0,  
//											"CTA_PAG_M" = :ll_cta_pag_m
//									WHERE ( "OFERTA_V"."SERIE" = :is_serie ) AND  
//											( "OFERTA_V"."NRO_OFERTA" = :ll_num_ori )   
//									Using	sqlca ;
//									if sqlca.sqlcode=0 then
//										commit;
//									else
//										rollback;
//									end if
//								end if
//								// actualiza cuotas mora mante
//								if isvalid(w_boletas_cuotas) then w_boletas_cuotas.dw_datos_bl.retrieve(is_serie,long(st_numero.text))
//								dw_lista.retrieve(is_base,is_serie,long(st_numero.text))
//							else
//								rollback;
//							end if
//							DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:is_base,:is_serie,:ll_num_ori,'M');
//							EXECUTE sp_nuevo_cadena_mora;
							close(w_detalle_repactacion_por_contrato)
						else
							rollback;
						end if
					END IF
				else
					messagebox("Advertencia","No se puede Anular Reprogramación Nº:  "+'R - '+is_serie+' - '+string(il_numero,"###,###,###,###,##0")+' tiene Pagos')
				end if
			else
				messagebox("Advertencia","Ud. NO está autorizado(a) para Anular más de 1 Reprogramación")
			end if			
		end if
//	end if
end if
end event

type em_val_total from statictext within w_detalle_repactacion_por_contrato
integer x = 2779
integer y = 256
integer width = 434
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

type st_txt_total from statictext within w_detalle_repactacion_por_contrato
integer x = 2441
integer y = 272
integer width = 315
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total Deuda $"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_val_interes from statictext within w_detalle_repactacion_por_contrato
integer x = 1783
integer y = 256
integer width = 434
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

type st_txt_interes from statictext within w_detalle_repactacion_por_contrato
integer x = 1435
integer y = 272
integer width = 329
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total Cobros $"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_monto_en_uf from statictext within w_detalle_repactacion_por_contrato
integer x = 2464
integer y = 376
integer width = 293
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Deuda en UF"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_deuda_uf from statictext within w_detalle_repactacion_por_contrato
integer x = 2779
integer y = 364
integer width = 434
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_monto_uf from statictext within w_detalle_repactacion_por_contrato
integer x = 1783
integer y = 364
integer width = 434
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_detalle_repactacion_por_contrato
integer x = 1495
integer y = 376
integer width = 270
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Valor UF día"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_moneda from statictext within w_detalle_repactacion_por_contrato
integer x = 457
integer y = 364
integer width = 937
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

type st_3 from statictext within w_detalle_repactacion_por_contrato
integer x = 14
integer y = 380
integer width = 425
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Moneda"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_pago from commandbutton within w_detalle_repactacion_por_contrato
boolean visible = false
integer x = 663
integer y = 1568
integer width = 233
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Pago Cuota"
end type

event clicked;long		ll_corr, ll_valor_cta, ll_nro_cta_nva
String	ls_string
if dw_lista.rowcount() > 0 then
	if isvalid(w_pago_repactacion) then close(w_pago_repactacion)
	ll_valor_cta	= dw_lista.getitemnumber(dw_lista.getrow(),'valor_cuota')
	ll_nro_cta_nva	= dw_lista.getitemnumber(dw_lista.getrow(),'ctas_pagadas')
	il_monto			= dw_lista.getitemnumber(dw_lista.getrow(),'total_deuda')
	il_cant_cta		= dw_lista.getitemnumber(dw_lista.getrow(),'cuotas_en_mora')
	ll_valor_cta	= dw_lista.getitemnumber(dw_lista.getrow(),'valor_cuota')
	
	if ll_nro_cta_nva>0 then 
		ll_nro_cta_nva++
	elseif ll_nro_cta_nva=0 or isnull(ll_nro_cta_nva) then
		ll_nro_cta_nva	= 1
	end if
	ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(il_monto) &
					  +'~t'+trim(st_cliente.text)+'~t'+string(il_cant_cta)+'~t'+'P' &
					  +'~t'+string(ll_valor_cta)+'~t'+string(ll_nro_cta_nva)
	openwithparm(w_pago_repactacion,ls_string)
end if
end event

type em_cant_ctas from statictext within w_detalle_repactacion_por_contrato
integer x = 1783
integer y = 148
integer width = 434
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

type em_deuda from statictext within w_detalle_repactacion_por_contrato
integer x = 457
integer y = 256
integer width = 937
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

type st_1 from statictext within w_detalle_repactacion_por_contrato
integer x = 14
integer y = 272
integer width = 425
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sub Total $"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_detalle_repactacion_por_contrato
integer x = 14
integer y = 160
integer width = 425
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "CTTO. ORIGINAL"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_base from statictext within w_detalle_repactacion_por_contrato
integer x = 457
integer y = 148
integer width = 101
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

type st_serie from statictext within w_detalle_repactacion_por_contrato
integer x = 562
integer y = 148
integer width = 101
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

type st_numero from statictext within w_detalle_repactacion_por_contrato
integer x = 667
integer y = 148
integer width = 727
integer height = 88
integer textsize = -9
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

type st_cliente from statictext within w_detalle_repactacion_por_contrato
integer x = 69
integer y = 36
integer width = 3150
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

type st_txt_real from statictext within w_detalle_repactacion_por_contrato
integer x = 1518
integer y = 164
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ctas.Mora"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_detalle_repactacion_por_contrato
integer x = 2304
integer y = 160
integer width = 453
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Fecha Prox. Cuota"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_fecha_prox_pago from statictext within w_detalle_repactacion_por_contrato
integer x = 2779
integer y = 148
integer width = 434
integer height = 88
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_detalle_repactacion_por_contrato
integer x = 2871
integer y = 1568
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_repactacion_por_contrato)
end event

type dw_lista from datawindow within w_detalle_repactacion_por_contrato
integer x = 32
integer y = 480
integer width = 3182
integer height = 1044
integer taborder = 10
string dataobject = "dw_detalle_repactacion_por_ctto_l"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna
ls_columna	= dwo.name
if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
CHOOSE CASE ls_columna
	CASE 't_10','t_11' //Filtrar estado Nula
		if is_filtro='' or isnull(is_filtro) then
			is_filtro	= 'estado_pago="N"'
		elseif is_filtro<>'estado_pago="N"' then
			is_filtro	= 'estado_pago="N"'
		else
			is_filtro	= ''
		end if
	CASE 't_12','t_13' //Filtrar estado Resuelto
		if is_filtro='' or isnull(is_filtro) then
			is_filtro	= 'estado_pago="R"'
		elseif is_filtro<>'estado_pago="R"' then
			is_filtro	= 'estado_pago="R"'
		else
			is_filtro	= ''
		end if
	CASE 't_16','t_17' //Filtrar estado Nula por Reprog.
		if is_filtro='' or isnull(is_filtro) then
			is_filtro	= 'estado_pago="P"'
		elseif is_filtro<>'estado_pago="P"' then
			is_filtro	= 'estado_pago="P"'
		else
			is_filtro	= ''
		end if
	CASE 't_14','t_15' //Filtrar estado Vigentes
		if is_filtro='' or isnull(is_filtro) then
			is_filtro	= 'estado_pago="V"'
		elseif is_filtro<>'estado_pago="V"' then
			is_filtro	= 'estado_pago="V"'
		else
			is_filtro	= ''
		end if		
END CHOOSE
dw_lista.SETfilter(is_filtro)
dw_lista.filter()
if dw_lista.rowcount() = 0 then messagebox("Advertencia","No Registra dato")
end event

event rowfocuschanged;if this.getrow() > 0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;long		ll_corr,ll_row,ll_tot_reg, ll_sw=0,ll_ctas_pag_m,ll_val_presente,ll_val_gtos_adm,&
			ll_val_mora_cta,ll_val_saldo_insoluto
String	ls_string,ls_filter,ls_tipo_reprog
Datetime	ld_fecha_prim_cta
if row > 0 then
	il_row	= row
//	cb_aceptar.triggerevent(clicked!)

	if isvalid(w_repacta_mora_mantencion) then close(w_repacta_mora_mantencion)
	if isvalid(w_repacta_mora_mantencion_reprog) then close(w_repacta_mora_mantencion_reprog)
	ll_tot_reg	= dw_lista.rowcount()
	if ll_sw=0 or ll_tot_reg=0 then
		ll_corr						= dw_lista.getitemnumber(il_row,'correlativo')
		ls_tipo_reprog				= dw_lista.getitemstring(il_row,'tipo_reprog')
		ll_ctas_pag_m				= dw_lista.getitemnumber(il_row,'ctas_pag_m_original')
		ll_val_presente				= dw_lista.getitemnumber(il_row,'valor_presente_pesos')
		ll_val_gtos_adm			= dw_lista.getitemnumber(il_row,'valor_gtos_adm_pesos')
		ll_val_mora_cta			= dw_lista.getitemnumber(il_row,'valor_mora_cta_pesos')
		ll_val_saldo_insoluto		= dw_lista.getitemnumber(il_row,'valor_saldo_insoluto')
		ld_fecha_prim_cta			= dw_lista.getitemdatetime(il_row,'fecha_primera_cta')
		if isnull(ll_val_presente) then ll_val_presente=0
		if isnull(ll_val_gtos_adm) then ll_val_gtos_adm=0
		if isnull(ll_val_mora_cta) then ll_val_mora_cta=0
		if isnull(ll_val_saldo_insoluto) then ll_val_saldo_insoluto=0
		ls_string						= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(il_monto)+'~t'+st_cliente.text+'~t'+string(ld_fecha_prim_cta)+'~t'+string(il_cant_cta)
		ls_string						= is_string+'~t'+string(ll_corr)+'~t'+'C'+'~t'+string(gl_ctas_pag_m)+'~t'+string(ll_val_presente)+'~t'+string(ll_val_gtos_adm)+'~t'+string(ll_val_mora_cta)+'~t'+string(ll_val_saldo_insoluto)
		if ls_tipo_reprog='RR' then
			gd_val_interes			= ll_val_gtos_adm
			gd_val_deuda			= ll_val_saldo_insoluto
			openwithparm(w_repacta_mora_mantencion_reprog,ls_string)
		else
			gd_val_interes			= dw_lista.getitemnumber(il_row,'interes_adm_pesos')
			gd_val_deuda			= dw_lista.getitemnumber(il_row,'interes_deuda_pesos')
//			gd_val_deuda			= gd_val_deuda	- gd_val_interes
			openwithparm(w_repacta_mora_mantencion,ls_string)
		end if
	end if
end if
end event

type cb_aceptar from commandbutton within w_detalle_repactacion_por_contrato
boolean visible = false
integer x = 32
integer y = 1568
integer width = 343
integer height = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;long		ll_corr, ll_valor_cta, ll_nro_cta_nva
String	ls_string
if isvalid(w_pago_repactacion) then close(w_pago_repactacion)
if il_row>0 then
	ll_valor_cta	= dw_lista.getitemnumber(dw_lista.getrow(),'valor_cuota')
	ll_nro_cta_nva	= dw_lista.getitemnumber(dw_lista.getrow(),'ctas_pagadas')
	
	ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(il_monto) &
					  +'~t'+trim(st_cliente.text)+'~t'+string(il_cant_cta)+'~t'+'C' &
					  +'~t'+string(ll_valor_cta)+'~t'+string(ll_nro_cta_nva)
	openwithparm(w_pago_repactacion,ls_string)
else
	messagebox("Advertencia","Debe seleccionar Reprogramación Mantención")
end if
end event

type cb_nuevo from commandbutton within w_detalle_repactacion_por_contrato
integer x = 32
integer y = 1568
integer width = 590
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nueva Reprogramación"
end type

event clicked;long		ll_corr,ll_row,ll_tot_reg, ll_count,ll_indi,ll_plazo,ll_ctas_pag,ll_resto,ll_cantidad,ll_correlativo,ll_sw=0,ll_folio,ll_ctas_pactadas_original,ll_rut_cliente,ll_cuotas_en_mora,&
			ll_grabar=0
String	ls_string,ls_filter,ls_base,ls_serie,ls_base_original,ls_serie_original
Date		ld_fecha
datetime	ldt_fecha
Double	ll_numero_original,ll_numero

if isvalid(w_repacta_mora_mantencion) then close(w_repacta_mora_mantencion)
ll_tot_reg								= dw_lista.rowcount()
if ll_tot_reg>0 then
	ls_filter								= "estado_pago = 'V'" // and saldo_cuotas > 0
	ll_row 								= dw_lista.Find(ls_filter, 1, ll_tot_reg )
	IF ll_row > 0 THEN
		ldt_fecha							= datetime(date(gdt_fec_sistema),time('00:00:00'))
		ld_fecha							= date(gdt_fec_sistema)
		ls_base							= dw_lista.getitemstring(ll_row,'base')
		ls_serie							= dw_lista.getitemstring(ll_row,'serie')
		ll_numero						= dw_lista.getitemnumber(ll_row,'numero')
		ll_plazo							= dw_lista.getitemnumber(ll_row,'cuotas_pactadas')
		ll_ctas_pag						= dw_lista.getitemnumber(ll_row,'ctas_pagadas')
		ls_base_original				= dw_lista.getitemstring(ll_row,"base_original")
		ls_serie_original				= dw_lista.getitemstring(ll_row,"serie_original")
		ll_numero_original				= dw_lista.getitemnumber(ll_row,"numero_original")
		ll_ctas_pactadas_original		= dw_lista.getitemnumber(ll_row,"cta_mora_original")
		ll_rut_cliente					= dw_lista.getitemnumber(ll_row,"rut_cliente")
		ll_cuotas_en_mora			= dw_lista.getitemnumber(ll_row,'cuotas_en_mora')
		if ll_plazo = ll_ctas_pag then
			SELECT	COUNT("INGRESO"."FOLIO")  
			INTO 		:ll_count  
			FROM 		"DOCUMENTOS",   
						"INGRESO"  
			WHERE  (("DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
					 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
					 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
					 (	"DOCUMENTOS"."COD_PAGO" = 'CH' AND  
						"DOCUMENTOS"."FECHA_VENC" > :ld_fecha AND  
						"INGRESO"."BASE" = :ls_base AND  
						"INGRESO"."SERIE" = :ls_serie AND  
						"INGRESO"."CONTRATO" = :ll_numero)   OR
					 ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
					 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
					 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
					 (	"DOCUMENTOS"."COD_PAGO" = 'CH' AND  
					 (	"DOCUMENTOS"."ESTADO_CH" = 'P' OR "DOCUMENTOS"."ESTADO_CH" = 'T' ) AND  
						"INGRESO"."BASE" = :ls_base AND  
						"INGRESO"."SERIE" = :ls_serie AND  
						"INGRESO"."CONTRATO" = :ll_numero) )
			USING		sqlca;
			if ll_count>0 then
				messagebox("Advertencia","Tiene Cheques Pendientes, Protestado o Castigado")
				ll_sw		= 1
			end if
		else
			ll_resto						= ll_plazo - ll_ctas_pag
			if ll_resto=1 then
				messagebox("Advertencia","Queda Una Cuota Pendiente de Pago")
				ll_sw						= 1
			elseif ll_resto>1 then
				messagebox("Advertencia","Quedan "+string(ll_resto)+" Cuotas Pendientes de Pago")
				ll_sw						= 1
			elseif ll_resto<0 then
				messagebox("Advertencia","Existe un Error en Pago de Cuotas Pagadas")
				ll_sw						= 1
			elseif ll_resto=0 then
//				UPDATE	"CADENA"  
//				SET 		"ESTADO" = 'C'  
//				WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
//						 ( "CADENA"."SERIE" = :ls_serie ) AND  
//						 ( "CADENA"."NUMERO" = :ll_numero )   
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					if ls_base_original='C' then
//						ll_cantidad				= 0
//						SELECT	"CONTRATO"."NRO_REPROG_MANT"
//						INTO 		:ll_cantidad
//						FROM 	"CONTRATO",   
//									"CADENA"  
//						WHERE  ( "CONTRATO"."SERIE_C" = "CADENA"."SERIE" ) and  
//								 ( "CONTRATO"."NRO_CONTRATO" = "CADENA"."NUMERO" ) and  
//								 (("CONTRATO"."SERIE_C" = :ls_serie_original ) AND  
//								 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero_original ) AND  
//								 ( "CADENA"."CODIGO" = :ls_base_original ) )   
//						USING	sqlca;
//						if sqlca.sqlcode=0 then
//							if isnull(ll_cantidad) then ll_cantidad=0
//							ll_cantidad ++
//						end if
//						UPDATE	"CONTRATO"  
//						SET 		"NRO_REPROG_MANT" = :ll_cantidad,
//									"ANEXO_REPACTA" = null,   
//									"CTA_REPACTA" = null,
//									"FECHA_REPROG_MANT" = :ldt_fecha
//						WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie_original ) AND  
//								 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero_original )   
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							commit;
//						else
//							ll_grabar	= 1
//							rollback;
//							messagebox("error","Error al Grabar CONTRATO "+sqlca.sqlerrtext)
//						end if
//		
//					elseif ls_base_original='O' then
//						ll_cantidad				= 0
//						SELECT	"OFERTA_V"."NRO_REPROG_MANT"
//						INTO 		:ll_cantidad
//						FROM 		"CADENA",   
//									"OFERTA_V",   
//									"PAGO_OFERTA"  
//						WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
//								 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
//								 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
//								 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
//								 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
//								 (("CADENA"."CODIGO" = :ls_base_original ) AND  
//								 ( "CADENA"."SERIE" = :ls_serie_original ) AND  
//								 ( "CADENA"."NUMERO" = :ll_numero_original ) )   
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							if isnull(ll_cantidad) then ll_cantidad=0
//							ll_cantidad ++
//						end if
//						UPDATE	"OFERTA_V"  
//						SET 		"NRO_REPROG_MANT" = :ll_cantidad,
//									"ANEXO_REPACTA" = null,   
//									"CTA_REPACTA" = null,
//									"FECHA_REPROG_MANT" = :ldt_fecha
//						WHERE  ( "OFERTA_V"."SERIE" = :ls_serie_original ) AND  
//								 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_original )   
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							commit;
//						else
//							rollback;
//							ll_grabar	= 1
//							messagebox("error","Error al Grabar OFERTA_V "+sqlca.sqlerrtext)
//						end if
//					end if
//					if ll_grabar=0 then
//						SELECT	MAX("LOG_REPACTA_CANCELADAS"."CORRELATIVO")  
//						INTO 		:ll_correlativo  
//						FROM 		"LOG_REPACTA_CANCELADAS"  
//						WHERE  ( "LOG_REPACTA_CANCELADAS"."BASE" = :ls_base ) AND  
//								 ( "LOG_REPACTA_CANCELADAS"."SERIE" = :ls_serie ) AND  
//								 ( "LOG_REPACTA_CANCELADAS"."NUMERO" = :ll_numero )   
//						USING		sqlca;
//						if ll_correlativo>0 then
//							ll_correlativo ++
//						else
//							ll_correlativo			= 1
//						end if
//						SELECT	COUNT("LOG_REPACTA_CANCELADAS"."CORRELATIVO")  
//						INTO 		:ll_folio
//						FROM 		"LOG_REPACTA_CANCELADAS"  
//						USING		sqlca;
//						if ll_folio>0 then	
//							ll_folio ++							
//						else
//							ll_folio		= 1
//						end if
//						INSERT INTO	"LOG_REPACTA_CANCELADAS"
//									(	"CORRELATIVO",		"BASE",		"SERIE",		"NUMERO",	"CUOTAS_PACTADAS_ORIGINAL",	"CUOTAS_PACTADAS",	"FECHA",		"TIPO_CLIENTE",	"BASE_CTTO_ORIGINAL",	"SERIE_CTTO_ORIGINAL",	"NUMERO_CTTO_ORIGINAL",	"RUT_CLIENTE",		"COD_PAGO_RECONOCIMIENTO",	"FOLIO_RECONOCIMIENTO" )  
//						VALUES	( :ll_correlativo,	:ls_base,	:ls_serie,	:ll_numero,	:ll_ctas_pactadas_original,	:ll_plazo,				:ldt_fecha,	:ll_rut_cliente,	:ls_base_original,		:ls_serie_original,		:ll_numero_original,		:ll_rut_cliente,	'BR',								:ll_folio )  
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							commit;
//							INSERT INTO	"INGRESO"  
//										( "FOLIO",		"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",	"CUOTAS_PAG",			"SERIE",					"CONTRATO",				"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST",	"BASE",					"RUT",				"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",	"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" )
//							VALUES 	( :ll_folio,	'BR',			:ldt_fecha,		'F',			0,			:ll_cuotas_en_mora,	:ls_serie_original,	:ll_numero_original,	'CR',			null,			0,				'A',				:ls_base_original,	:ll_rut_cliente,	:gs_user,	null,			null,				null,					null,					null,			null,				null,			:ldt_fecha,	'0',				null,				null )  
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//								dw_lista.setitem(ll_row,'estado_pago','C')
//								dw_lista.accepttext()
//								if dw_lista.update()=1 then
//									commit;
//								else
//									rollback;
//									messagebox("error","Error al Grabar REPACTA_MANTENCION, cambio estado Cancelado "+sqlca.sqlerrtext)
//								end if
//							else
//								rollback;
//								messagebox("error","Error al Grabar INGRESO "+sqlca.sqlerrtext)
//							end if
//						else
//							rollback;
//							messagebox("error","Error al Grabar LOG_REPACTA_CANCELADAS "+sqlca.sqlerrtext)
//						end if
//						
//					end if
//				else
//					messagebox("Error Grabar","Error Grabar CADENA SQL: "+sqlca.sqlerrtext)
//				end if
			end if
		end if
	END IF
end if
if ll_sw=0 or ll_tot_reg=0 then
	SELECT		MAX("REPACTA_MANTENCION_L"."CORRELATIVO")
	INTO 			:ll_corr
	FROM 		"REPACTA_MANTENCION_L"  
	WHERE  	  ( "REPACTA_MANTENCION_L"."BASE_ORIGINAL" = :is_base ) AND
				  ( "REPACTA_MANTENCION_L"."SERIE_ORIGINAL" = :is_serie ) AND
			 	  ( "REPACTA_MANTENCION_L"."NUMERO_ORIGINAL" = :il_numero )
	Using		sqlca ;
	if sqlca.sqlcode=0 then
		if ll_corr > 0 then
			ll_corr++
		else
			ll_corr	= 1
		end if
	else
		ll_corr		= 1
	end if
	ls_string			= is_string+'~t'+string(ll_corr)+'~t'+'N'
	openwithparm(w_repacta_mora_mantencion,ls_string)
end if
end event

