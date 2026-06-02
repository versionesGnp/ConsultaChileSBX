forward
global type w_filtrar_cobranza from window
end type
type dw_parque from datawindow within w_filtrar_cobranza
end type
type st_16 from statictext within w_filtrar_cobranza
end type
type cb_filtrar from commandbutton within w_filtrar_cobranza
end type
type cb_ctacte from commandbutton within w_filtrar_cobranza
end type
type cb_grabar_formula from commandbutton within w_filtrar_cobranza
end type
type tab_cobranza from uo_cobranza within w_filtrar_cobranza
end type
type tab_cobranza from uo_cobranza within w_filtrar_cobranza
end type
type cb_historico from commandbutton within w_filtrar_cobranza
end type
type cb_imprimir from commandbutton within w_filtrar_cobranza
end type
type cb_ordenar from commandbutton within w_filtrar_cobranza
end type
type pb_5 from picturebutton within w_filtrar_cobranza
end type
type pb_4 from picturebutton within w_filtrar_cobranza
end type
type pb_3 from picturebutton within w_filtrar_cobranza
end type
type pb_2 from picturebutton within w_filtrar_cobranza
end type
type st_2 from statictext within w_filtrar_cobranza
end type
type sle_1 from singlelineedit within w_filtrar_cobranza
end type
type pb_1 from picturebutton within w_filtrar_cobranza
end type
type cb_cerrar from commandbutton within w_filtrar_cobranza
end type
type dw_lista from datawindow within w_filtrar_cobranza
end type
type gb_2 from groupbox within w_filtrar_cobranza
end type
type cb_exportar from commandbutton within w_filtrar_cobranza
end type
type gb_1 from groupbox within w_filtrar_cobranza
end type
end forward

global type w_filtrar_cobranza from window
integer width = 3383
integer height = 2160
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_parque dw_parque
st_16 st_16
cb_filtrar cb_filtrar
cb_ctacte cb_ctacte
cb_grabar_formula cb_grabar_formula
tab_cobranza tab_cobranza
cb_historico cb_historico
cb_imprimir cb_imprimir
cb_ordenar cb_ordenar
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
st_2 st_2
sle_1 sle_1
pb_1 pb_1
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_2 gb_2
cb_exportar cb_exportar
gb_1 gb_1
end type
global w_filtrar_cobranza w_filtrar_cobranza

type variables
Long		il_row
Double	id_factor_fc,id_tasa_mant
end variables

forward prototypes
public subroutine wf_pos_contrato_isa ()
public subroutine wf_pos_otros_cttos ()
public subroutine wf_pos_promesa ()
public subroutine wf_cargar_dw_contrato ()
end prototypes

public subroutine wf_pos_contrato_isa ();tab_cobranza.tabpage_3.st_6.x									= 27
tab_cobranza.tabpage_3.st_6.y									= 4
tab_cobranza.tabpage_3.st_6.width							= 850
tab_cobranza.tabpage_3.st_6.height							= 56
tab_cobranza.tabpage_3.dw_detalle_total.x					= 18
tab_cobranza.tabpage_3.dw_detalle_total.y					= 60
tab_cobranza.tabpage_3.dw_detalle_total.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_total.height			= 412

tab_cobranza.tabpage_3.st_8.x									= 27
tab_cobranza.tabpage_3.st_8.y									= 480
tab_cobranza.tabpage_3.st_8.width							= 850
tab_cobranza.tabpage_3.st_8.height							= 56
tab_cobranza.tabpage_3.dw_detalle_mantencion.x			= 18
tab_cobranza.tabpage_3.dw_detalle_mantencion.y			= 536
tab_cobranza.tabpage_3.dw_detalle_mantencion.width		= 2277
tab_cobranza.tabpage_3.dw_detalle_mantencion.height	= 412

tab_cobranza.tabpage_3.st_3.x									= 27
tab_cobranza.tabpage_3.st_3.y									= 956
tab_cobranza.tabpage_3.st_3.width							= 1001
tab_cobranza.tabpage_3.st_3.height							= 56
tab_cobranza.tabpage_3.dw_detalle_pagos.x					= 18
tab_cobranza.tabpage_3.dw_detalle_pagos.y					= 1012
tab_cobranza.tabpage_3.dw_detalle_pagos.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_pagos.height			= 412
end subroutine

public subroutine wf_pos_otros_cttos ();tab_cobranza.tabpage_3.st_6.x									= 27
tab_cobranza.tabpage_3.st_6.y									= 4
tab_cobranza.tabpage_3.st_6.width							= 850
tab_cobranza.tabpage_3.st_6.height							= 56
tab_cobranza.tabpage_3.dw_detalle_total.x					= 18
tab_cobranza.tabpage_3.dw_detalle_total.y					= 60
tab_cobranza.tabpage_3.dw_detalle_total.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_total.height			= 412

tab_cobranza.tabpage_3.st_7.x									= 27
tab_cobranza.tabpage_3.st_7.y									= 480
tab_cobranza.tabpage_3.st_7.width							= 850
tab_cobranza.tabpage_3.st_7.height							= 56
tab_cobranza.tabpage_3.dw_detalle_cuotas.x				= 18
tab_cobranza.tabpage_3.dw_detalle_cuotas.y				= 536
tab_cobranza.tabpage_3.dw_detalle_cuotas.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_cuotas.height			= 412

tab_cobranza.tabpage_3.st_3.x									= 27
tab_cobranza.tabpage_3.st_3.y									= 956
tab_cobranza.tabpage_3.st_3.width							= 1001
tab_cobranza.tabpage_3.st_3.height							= 56
tab_cobranza.tabpage_3.dw_detalle_pagos.x					= 18
tab_cobranza.tabpage_3.dw_detalle_pagos.y					= 1012
tab_cobranza.tabpage_3.dw_detalle_pagos.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_pagos.height			= 412
end subroutine

public subroutine wf_pos_promesa ();tab_cobranza.tabpage_3.st_6.x									= 27
tab_cobranza.tabpage_3.st_6.y									= 4
tab_cobranza.tabpage_3.st_6.width							= 850
tab_cobranza.tabpage_3.st_6.height							= 56
tab_cobranza.tabpage_3.dw_detalle_total.x					= 18
tab_cobranza.tabpage_3.dw_detalle_total.y					= 60
tab_cobranza.tabpage_3.dw_detalle_total.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_total.height			= 292

tab_cobranza.tabpage_3.st_7.x									= 27
tab_cobranza.tabpage_3.st_7.y									= 364
tab_cobranza.tabpage_3.st_7.width							= 850
tab_cobranza.tabpage_3.st_7.height							= 56
tab_cobranza.tabpage_3.dw_detalle_cuotas.x				= 18
tab_cobranza.tabpage_3.dw_detalle_cuotas.y				= 420
tab_cobranza.tabpage_3.dw_detalle_cuotas.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_cuotas.height			= 292

tab_cobranza.tabpage_3.st_8.x									= 27
tab_cobranza.tabpage_3.st_8.y									= 724
tab_cobranza.tabpage_3.st_8.width							= 850
tab_cobranza.tabpage_3.st_8.height							= 56
tab_cobranza.tabpage_3.dw_detalle_mantencion.x			= 18
tab_cobranza.tabpage_3.dw_detalle_mantencion.y			= 780
tab_cobranza.tabpage_3.dw_detalle_mantencion.width		= 2277
tab_cobranza.tabpage_3.dw_detalle_mantencion.height	= 292

tab_cobranza.tabpage_3.st_3.x									= 27
tab_cobranza.tabpage_3.st_3.y									= 1084
tab_cobranza.tabpage_3.st_3.width							= 1001
tab_cobranza.tabpage_3.st_3.height							= 56
tab_cobranza.tabpage_3.dw_detalle_pagos.x					= 18
tab_cobranza.tabpage_3.dw_detalle_pagos.y					= 1140
tab_cobranza.tabpage_3.dw_detalle_pagos.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_pagos.height			= 292
end subroutine

public subroutine wf_cargar_dw_contrato ();Long		ll_tot_reg,ll_indi,ll_mora_cred,ll_mora_mant,ll_dias_mora_cred,ll_dias_mora_mant,&
			ii_mora_cobro,ii_inc_gastos,i,ll_valor_total,ll_cta_pag_s,ll_cta_pag_m,ll_plazo,ll_cta_pag_la,&
			ll_cta_pag_isa
String	ls_base,ls_serie,ls_moneda,ls_estado_comi
Double	ldb_numero,lld_tasa,lld_valor_cuota,lld_tasa_peso,lld_valor_cuota_peso,id_gc,id_im,lld_valor_cuota_m,&
			id_monto

ll_tot_reg		= tab_cobranza.tabpage_1.dw_contrato.retrieve(gi_rut)
for ll_indi=1 to ll_tot_reg
	ls_base				= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi,'cadena_codigo')
	ls_serie				= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi,'cadena_serie')
	ldb_numero			= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_numero')
	ll_mora_cred		= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_mora_cred')
	ll_mora_mant		= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_mora_mant')
	ll_dias_mora_cred	= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_dias_mora_cred')
	ll_dias_mora_mant	= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_dias_mora_mant')
	CHOOSE CASE ls_base
		CASE 'O'
			SELECT 	"PAGO_OFERTA"."TASA",   "PAGO_OFERTA"."MONEDA",   	"PAGO_OFERTA"."VALOR_CUOTA" ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"OFERTA_V"."VALOR_CUOTA_M",	"OFERTA_V"."CTA_PAG_S",	"OFERTA_V"."CTA_PAG_M",	"OFERTA_V"."ESTADO_COMI",	"PAGO_OFERTA"."NRO_CUOTAS"
			INTO 		:lld_tasa,   				:ls_moneda,   					:lld_valor_cuota  ,   				:lld_tasa_peso,   		:lld_tasa  ,				:lld_valor_cuota_m,				:ll_cta_pag_s,				:ll_cta_pag_m,				:ls_estado_comi,				:ll_plazo
			FROM 		"CADENA",   "OFERTA_V",   "PAGO_OFERTA"  ,	"TASA"
			WHERE	 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = 'O' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ldb_numero ) )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
// 			Promesa Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_valor_cuota_peso	= lld_valor_cuota
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 1
				ii_inc_gastos 		= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im = id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_fc, 0) // PASA .1 A .05
							ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
// 			Promesa Calculo Mantencion				
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso		= Round(lld_valor_cuota_peso,0)
				id_gc 						= 0
				id_im 						= 0
				ii_mora_cobro 				= 0
				ii_inc_gastos 				= 0
				FOR i = 1 TO ll_mora_mant 
					IF (ll_dias_mora_mant - (i - 1) * 365) > 5 THEN 
						ii_mora_cobro		= (ll_dias_mora_mant - (i - 1) * 365)
						id_im 				= id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, lld_valor_cuota_peso)
						IF (ll_dias_mora_mant - (i - 1) * 365) > 30 THEN 
							 id_gc 			= id_gc + Round(lld_valor_cuota_peso * id_factor_fc, 0)
							 ii_inc_gastos = 1
						END IF
					END IF
				NEXT
//				id_gc 				= 0
//				id_im 				= 0
//				ii_mora_cobro 		= 0
//				ii_inc_gastos 		= 0
//				FOR i = 1 TO ll_mora_mant 
//					IF (ll_dias_mora_mant - (i - 1) * 365) > 1 THEN 
//						ii_mora_cobro		= (ll_dias_mora_mant - (i - 1) * 365)
//						//	Funcion gf_int_mora
//						setnull(id_monto)
//						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
//						id_monto = (id_monto)
//						id_monto = round((id_monto * ii_mora_cobro),0)
//						//	Fin Funcion
//						id_im 				= id_im + id_monto
//						IF (ll_dias_mora_mant - (i - 1) * 365) > 30 THEN 
//							 id_gc 			= id_gc + Round(lld_valor_cuota_peso * id_factor_fc, 0) // CAMBIO DE 10 A 5%
//							 ii_inc_gastos = 1
//						END IF
//					END IF
//				NEXT
				ll_valor_total	= ll_mora_mant * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',(id_gc + id_im + ll_valor_total))

				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',ll_cta_pag_s)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',ll_cta_pag_m)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi',ls_estado_comi)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
			end if

		CASE 'C'
			SELECT	"CONTRATO"."TASA",   "CONTRATO"."VALOR_CUO",   	"CONTRATO"."MONEDA"  ,	"CONTRATO"."VALOR_CUOTA_M",	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF",	"CONTRATO"."PLAZO",	"CONTRATO"."CTA_PAG_LA",	"CONTRATO"."CTA_PAG_ISA",	"CONTRATO"."CTA_PAG_M"
			INTO 		:lld_tasa,   			:lld_valor_cuota,   			:ls_moneda  ,			 	:lld_valor_cuota_m,				:lld_tasa_peso,   		:lld_tasa  ,				:ll_plazo,				:ll_cta_pag_la,				:ll_cta_pag_isa,				:ll_cta_pag_m
			FROM 		"CADENA",   "CONTRATO"  , "TASA"
			WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					 (("CADENA"."CODIGO" = 'C' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ldb_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',(ll_cta_pag_la + ll_cta_pag_isa))
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',ll_cta_pag_m)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi','')
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
				
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',0)
				// Calculo Mantencion
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso		= Round(lld_valor_cuota_peso,0)
				id_gc 						= 0
				id_im 						= 0
				ii_mora_cobro 				= 0
				ii_inc_gastos 				= 0
				FOR i = 1 TO ll_mora_mant 
					IF (ll_dias_mora_mant - (i - 1) * 365) > 5 THEN 
						ii_mora_cobro		= (ll_dias_mora_mant - (i - 1) * 365)
						id_im 				= id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, lld_valor_cuota_peso)
						IF (ll_dias_mora_mant - (i - 1) * 365) > 30 THEN 
							 id_gc 			= id_gc + Round(lld_valor_cuota_peso * id_factor_fc, 0)
							 ii_inc_gastos = 1
						END IF
					END IF
				NEXT
//				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
//				id_gc 				= 0
//				id_im 				= 0
//				ii_mora_cobro 		= 0
//				ii_inc_gastos 		= 0
//				FOR i = 1 TO ll_mora_mant 
//					IF (ll_dias_mora_mant - (i - 1) * 365) > 1 THEN 
//						ii_mora_cobro		= (ll_dias_mora_mant - (i - 1) * 365)
//						//	Funcion gf_int_mora
//						setnull(id_monto)
//						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
//						id_monto = (id_monto)
//						id_monto = round((id_monto * ii_mora_cobro),0)
//						//	Fin Funcion
//						id_im 				= id_im + id_monto
//						IF (ll_dias_mora_mant - (i - 1) * 365) > 30 THEN 
//							 id_gc 			= id_gc + Round(lld_valor_cuota_peso * id_factor_fc, 0) // CAMBIO DE 10 A 5%
//							 ii_inc_gastos = 1
//						END IF
//					END IF
//				NEXT
				ll_valor_total	= ll_mora_mant * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',(id_gc + id_im + ll_valor_total))
			end if

		CASE 'D'
			SELECT	"DERECHO"."TASA",   	"DERECHO"."VALOR_CUO",  "DERECHO"."MONEDA"  ,	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF",	"DERECHO"."PLAZO",	"DERECHO"."CTA_PAG_LA",	"DERECHO"."CTA_PAG_ISA" 
			INTO 		:lld_tasa,   			:lld_valor_cuota,   		:ls_moneda ,				:lld_tasa_peso,   		:lld_tasa ,					:ll_plazo,				:ll_cta_pag_la,			:ll_cta_pag_isa
			FROM 		"CADENA",   "DERECHO"  ,	"TASA"
			WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
					 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
					 (("CADENA"."CODIGO" = 'D' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ldb_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_valor_cuota_peso	= lld_valor_cuota
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 1
				ii_inc_gastos 		= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im = id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_fc, 0) // PASA .1 A .05
							ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
				// Calculo Mantencion
				setnull(ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
				
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',(ll_cta_pag_la + ll_cta_pag_isa))
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi','')
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
			end if

		CASE 'P'
			SELECT	"PAGARE"."TASA",  "PAGARE"."VALOR_CUO",   "PAGARE"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"PAGARE"."PLAZO",	"PAGARE"."CTA_PAG_LA",	"PAGARE"."CTA_PAG_ISA"
			INTO 		:lld_tasa,   		:lld_valor_cuota,   		:ls_moneda  ,				:lld_tasa_peso,   		:lld_tasa ,					:ll_plazo			:ll_cta_pag_la,			:ll_cta_pag_isa
			FROM 		"CADENA",   "PAGARE"  ,	"TASA"
			WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
					 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
					 (("CADENA"."CODIGO" = 'P' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ldb_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_valor_cuota_peso	= lld_valor_cuota
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 1
				ii_inc_gastos 		= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im = id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_fc, 0) // PASA .1 A .05
							ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
				// Calculo Mantencion
				setnull(ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
				
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',(ll_cta_pag_la + ll_cta_pag_isa))
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi','')
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
			end if

		CASE 'L'
			SELECT	"PAGO_LIBERADOR"."TASA",   "PAGO_LIBERADOR"."VALOR_CUOTA",  "PAGO_LIBERADOR"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"ANEXO_LIBERADOR"."CTA_PAG_M",	"ANEXO_LIBERADOR"."ESTADO_COMI",	"PAGO_LIBERADOR"."NRO_CUOTAS"
			INTO 		:lld_tasa,   					:lld_valor_cuota,   					:ls_moneda  ,							:lld_tasa_peso,   		:lld_tasa ,					:ll_cta_pag_m,							:ls_estado_comi,						:ll_plazo
			FROM 		"ANEXO_LIBERADOR",   "CADENA",   "PAGO_LIBERADOR"  ,	"TASA"
			WHERE	 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
					 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
					 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
					 (("CADENA"."CODIGO" = 'L' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ldb_numero ) )   
		 	USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_valor_cuota_peso	= lld_valor_cuota
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 1
				ii_inc_gastos 		= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im = id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_fc, 0) // PASA .1 A .05
							ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
				// Calculo Mantencion
				setnull(ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
				
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',ll_cta_pag_m)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi',ls_estado_comi)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
			end if

		CASE 'R'
			SELECT	"REPACTA_MANTENCION"."VALOR_CUOTA_UF", "REPACTA_MANTENCION"."TIPO_MONEDA",   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF"  ,	"REPACTA_MANTENCION"."CUOTAS_PACTADAS",	"REPACTA_MANTENCION"."CTAS_PAGADAS"
			INTO 		:lld_valor_cuota,   							:ls_moneda,   								  	:lld_tasa_peso,   		:lld_tasa  ,				:ll_plazo,											:ll_cta_pag_s
			FROM 		"CADENA",   "REPACTA_MANTENCION",   "TASA"  
			WHERE  ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
					 (("CADENA"."CODIGO" = 'R' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ldb_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_valor_cuota_peso	= lld_valor_cuota
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 1
				ii_inc_gastos 		= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im = id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_fc, 0) // PASA .1 A .05
							ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
				// Calculo Mantencion
				setnull(ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
				
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',ll_cta_pag_s)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi','')
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
			end if
	END CHOOSE
next
end subroutine

on w_filtrar_cobranza.create
this.dw_parque=create dw_parque
this.st_16=create st_16
this.cb_filtrar=create cb_filtrar
this.cb_ctacte=create cb_ctacte
this.cb_grabar_formula=create cb_grabar_formula
this.tab_cobranza=create tab_cobranza
this.cb_historico=create cb_historico
this.cb_imprimir=create cb_imprimir
this.cb_ordenar=create cb_ordenar
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.st_2=create st_2
this.sle_1=create sle_1
this.pb_1=create pb_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.cb_exportar=create cb_exportar
this.gb_1=create gb_1
this.Control[]={this.dw_parque,&
this.st_16,&
this.cb_filtrar,&
this.cb_ctacte,&
this.cb_grabar_formula,&
this.tab_cobranza,&
this.cb_historico,&
this.cb_imprimir,&
this.cb_ordenar,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.st_2,&
this.sle_1,&
this.pb_1,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_2,&
this.cb_exportar,&
this.gb_1}
end on

on w_filtrar_cobranza.destroy
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.cb_filtrar)
destroy(this.cb_ctacte)
destroy(this.cb_grabar_formula)
destroy(this.tab_cobranza)
destroy(this.cb_historico)
destroy(this.cb_imprimir)
destroy(this.cb_ordenar)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.pb_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_2)
destroy(this.cb_exportar)
destroy(this.gb_1)
end on

event open;String	ls_titulo,ls_opcion,ls_filtro
Long		ll_columna,ll_cod_parque

SetPointer(HourGlass!)
gf_centrar(w_filtrar_cobranza)
SELECT "TASA"."GASTO_COB_MORA","TASA"."TASA_INT_UF" INTO :id_factor_fc,:id_tasa_mant FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
//id_factor_fc					= f_factor_gasto_cobranza()
ls_titulo  							= substr(1,1,Message.StringParm)
ls_opcion  						= substr(1,2,Message.StringParm)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion = "Parque El Prado" then
	ll_cod_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_cod_parque	= 11
elseif gs_conexion = "Parque Concepción" then
	ll_cod_parque	= 801
end if
dw_parque.setitem(1,'cod_parque',ll_cod_parque)
dw_parque.accepttext()
w_filtrar_cobranza.title	= ls_titulo
CHOOSE CASE ls_opcion
	CASE '1'
		dw_lista.dataobject	= 'dwv_list_mora_c_m_comi_pagadas'
	CASE '2'
		dw_lista.dataobject	= 'dwv_list_mora_c_m_reprog_mant'
	CASE '3'
		dw_lista.dataobject	= 'dwv_list_mora_c_m_comi_no_pagadas_vgtes'
	CASE '4'
		dw_lista.dataobject	= 'dwv_list_mora_c_m_derecho_con_mora'
	CASE '5'
		dw_lista.dataobject	= 'dwv_list_mora_c_m_cobranza_externa'
	CASE '6'
		dw_lista.dataobject	= 'dwv_list_mora_c_m_pagare_con_mora'
	CASE '7'
		dw_lista.dataobject	= 'dwv_list_mora_c_m_contratos_ni'
	CASE '8'
		dw_lista.dataobject	= 'dwv_list_mora_c_m_cobranza_8'
END CHOOSE
dw_lista.settransobject(sqlca)
tab_cobranza.tabpage_1.dw_contrato.settransobject(sqlca)
tab_cobranza.tabpage_1.dw_cliente.settransobject(sqlca)
tab_cobranza.tabpage_2.dw_cobranza.settransobject(sqlca)
tab_cobranza.tabpage_2.dw_carta.settransobject(sqlca)
tab_cobranza.tabpage_2.dw_publico.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_detalle_pagos.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_detalle_total.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_detalle_cuotas.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_detalle_mantencion.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_boton_cerrar.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_boton_cerrar.insertrow(0)
tab_cobranza.tabpage_4.dw_cliente2.settransobject(sqlca)
tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.settransobject(sqlca)
tab_cobranza.tabpage_4.dw_ingreso.settransobject(sqlca)
ls_filtro				= ''
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
if dw_lista.dataobject	= 'dwv_list_mora_c_m_cobranza_8' then
	if dw_lista.retrieve(date(gdt_fec_sistema),ll_cod_parque,gd_uf_dia)>0 then
		ls_filtro		= 'c_facturado <= 8 and c_suma_porce >= 7'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	end if
else
	dw_lista.retrieve(date(gdt_fec_sistema),ll_cod_parque)
end if
tab_cobranza.visible	= false
SetPointer(Arrow!)
dw_lista.setfocus()
end event

type dw_parque from datawindow within w_filtrar_cobranza
integer x = 649
integer y = 48
integer width = 594
integer height = 104
integer taborder = 20
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long		ll_cod_parque
string 	ls_filtro
dw_parque.accepttext()
dw_lista.reset()
ls_filtro		= ''
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
if dw_lista.dataobject	= 'dwv_list_mora_c_m_cobranza_8' then
	if dw_lista.retrieve(date(gdt_fec_sistema),ll_cod_parque,gd_uf_dia)>0 then
		ls_filtro		= 'c_facturado <= 8 and c_suma_porce >= 7'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	end if
else
	dw_lista.retrieve(date(gdt_fec_sistema),ll_cod_parque)
end if
end event

type st_16 from statictext within w_filtrar_cobranza
integer x = 462
integer y = 64
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_filtrar from commandbutton within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 2496
integer y = 48
integer width = 247
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string ls_texto
setnull (gs_formula)
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
ll_filas		= dw_lista.rowcount()
gs_formula 	= dw_lista.describe("datawindow.syntax")
ll_largototal	= len(gs_formula)
ll_posini	= Pos(gs_formula, "filter") + 8
ll_posfin	= len("~nfilter~n")
ls_texto		= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto		= ll_posfin - ll_posini
gs_formula	= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' then
	gs_formula	= ''
end if

end event

type cb_ctacte from commandbutton within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1912
integer width = 448
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.rowcount()>0 then
	if dw_lista.dataobject='dwv_list_mora_c_m_contratos_ni' then
		gs_base 						= dw_lista.GetItemString(il_row, "vista_listado_contratos_ni_codigo")
		gs_serie 					= dw_lista.GetItemString(il_row, "vista_listado_contratos_ni_serie")
		gi_numero 					= dw_lista.GetItemNumber(il_row, "vista_listado_contratos_ni_numero")
		gi_rut 						= dw_lista.GetItemNumber(il_row, "vista_listado_contratos_ni_rut")
		gs_apellido_paterno		= dw_lista.GetItemString(il_row, "vista_listado_contratos_ni_a_paterno")
		gs_apellido_materno		= dw_lista.GetItemString(il_row, "vista_listado_contratos_ni_a_materno")
		gs_nombres					= dw_lista.GetItemString(il_row, "vista_listado_contratos_ni_nombre")
		gs_dv							= dw_lista.GetItemString(il_row, "vista_listado_contratos_ni_dv")
		gs_estado					= dw_lista.GetItemString(il_row, "vista_listado_contratos_ni_estado")
	elseif dw_lista.dataobject='dwv_list_mora_c_m_cobranza_8' then
		gi_rut 						= dw_lista.GetItemNumber(il_row, "vista_listado_cobranza_8_porce_rut")
		gs_base						= dw_lista.getitemstring(il_row, "vista_listado_cobranza_8_porce_codigo")
		gs_serie						= dw_lista.getitemstring(il_row, "vista_listado_cobranza_8_porce_serie")
		gi_numero					= dw_lista.getitemnumber(il_row, "vista_listado_cobranza_8_porce_numero")
		gs_apellido_paterno		= dw_lista.GetItemString(il_row, "vista_listado_cobranza_8_porce_a_paterno")
		gs_apellido_materno		= dw_lista.GetItemString(il_row, "vista_listado_cobranza_8_porce_a_materno")
		gs_nombres					= dw_lista.GetItemString(il_row, "vista_listado_cobranza_8_porce_nombre")
		gs_dv							= dw_lista.GetItemString(il_row, "vista_listado_cobranza_8_porce_dv")
		gs_estado					= dw_lista.GetItemString(il_row, "vista_listado_cobranza_8_porce_estado")
	else
		gs_base 						= dw_lista.GetItemString(il_row, "codigo")
		gs_serie 					= dw_lista.GetItemString(il_row, "serie")
		gi_numero 					= dw_lista.GetItemNumber(il_row, "numero")
		gi_rut 						= dw_lista.GetItemNumber(il_row, "rut")
		gs_apellido_paterno		= dw_lista.GetItemString(il_row, "a_paterno")
		gs_apellido_materno		= dw_lista.GetItemString(il_row, "a_materno")
		gs_nombres					= dw_lista.GetItemString(il_row, "nombre")
		gs_dv							= dw_lista.GetItemString(il_row, "dv")
		gs_estado					= dw_lista.GetItemString(il_row, "estado")
	end if
	if not isnull(gs_base) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O" 	// Oferta
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				Open(w_cuenta_corriente_repactar_cta_mant)
		END CHOOSE
	end if
end if
end event

type cb_grabar_formula from commandbutton within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 544
integer y = 1912
integer width = 654
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar / Gra&bar Formula"
end type

event clicked;open(w_formulas)
end event

type tab_cobranza from uo_cobranza within w_filtrar_cobranza
integer x = 421
integer y = 200
integer taborder = 120
end type

type cb_historico from commandbutton within w_filtrar_cobranza
event ue_mousemove pbm_dwnmousemove
integer x = 32
integer y = 48
integer width = 283
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_lista.getrow()>0 then
	gs_base			= dw_lista.getitemstring(il_row,'codigo')
	gs_serie			= dw_lista.getitemstring(il_row,'serie')
	gi_numero		= dw_lista.getitemnumber(il_row,'numero')
	gi_rut			= dw_lista.getitemnumber(il_row,'rut')
	open(w_cobranza_historica)
end if
end event

type cb_imprimir from commandbutton within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 3040
integer y = 48
integer width = 247
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_ordenar from commandbutton within w_filtrar_cobranza
event ue_mousemove pbm_dwnmousemove
integer x = 2245
integer y = 48
integer width = 247
integer height = 92
integer taborder = 50
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

type pb_5 from picturebutton within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 2885
integer y = 1920
integer width = 101
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(dw_lista.rowcount() )
end event

type pb_4 from picturebutton within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 2779
integer y = 1920
integer width = 101
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollNextPage( )
end event

type pb_3 from picturebutton within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 2674
integer y = 1920
integer width = 101
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollPriorPage( )
end event

type pb_2 from picturebutton within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 2569
integer y = 1920
integer width = 101
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(1)
end event

type st_2 from statictext within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 1719
integer y = 1932
integer width = 293
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Buscar Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 2025
integer y = 1916
integer width = 375
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;pb_1.triggerevent (clicked!)
end event

type pb_1 from picturebutton within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 2409
integer y = 1916
integer width = 105
integer height = 92
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Lupa.bmp"
string disabledname = "Lupa.bmp"
alignment htextalign = left!
end type

event clicked;STRING	ls_string,ls_rut
long		ll_row
if trim(sle_1.text)<>'' then
	dw_lista.scrolltorow(1)
	ls_rut		= trim(sle_1.text)
	if dw_lista.dataobject='dwv_list_mora_c_m_contratos_ni' then
		ls_string	= "vista_listado_contratos_ni_rut="+trim(ls_rut)
	else
		ls_string	= "rut="+trim(ls_rut)
	end if
	ll_row 		= dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
	IF ll_row > 0 THEN
		dw_lista.ScrollToRow( ll_row )
		dw_lista.setfocus()
	ELSE
		MessageBox("Advertencia", "Rut Inexistente")
	END IF
end if
end event

type cb_cerrar from commandbutton within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 3040
integer y = 1912
integer width = 270
integer height = 100
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_filtrar_cobranza)
end event

type dw_lista from datawindow within w_filtrar_cobranza
integer x = 37
integer y = 184
integer width = 3273
integer height = 1688
integer taborder = 10
string title = "none"
string dataobject = "dwv_list_mora_c_m_comi_no_pagadas_vgtes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_tipo_cob
Long		ll_folio,ll_estado_reg,ll_ini,ll_fin,ll_indi
Date		ld_fecha_prox_llamado
ls_columna	= dwo.name

if ls_columna='t_cobranza' or ls_columna='t_rojo' or ls_columna='t_texto_rojo' then
	if dw_lista.object.t_cobranza.text='Mostrar Solo Cobranza' then
		if dw_lista.dataobject='dwv_list_mora_c_m_contratos_ni' then
			gs_formula	= "fecha > vista_listado_contratos_ni_fecha_prox_ll and cliente_asignado_cobranza <> '"+"S"+"'"
		elseif dw_lista.dataobject='dwv_list_mora_c_m_cobranza_8' then
			gs_formula	= "c_facturado <= 8 and c_suma_porce >= 7 and fecha > vista_listado_cobranza_8_porce_fecha_pro and cliente_asignado_cobranza <> '"+"S"+"'"
		else
			gs_formula	= "fecha > fecha_prox_llamado and cliente_asignado_cobranza <> '"+"S"+"'"
		end if
		dw_lista.object.t_cobranza.text='Mostrar Todo Cobranza'
	else
		if dw_lista.dataobject='dwv_list_mora_c_m_cobranza_8' then
			gs_formula	= 'c_facturado <= 8 and c_suma_porce >= 7'
			dw_lista.object.t_cobranza.text='Mostrar Solo Cobranza'
		else
			gs_formula	= ''
			dw_lista.object.t_cobranza.text='Mostrar Solo Cobranza'
		end if
	end if
	dw_lista.SETfilter(gs_formula)
	dw_lista.filter()
	dw_lista.sort()
	
elseif ls_columna='t_asignados' or ls_columna='t_text_asignados' then
	if dw_lista.object.t_text_asignados.text='Con Asignación' then
		gs_formula	= "cliente_asignado_cobranza = '"+"S"+"'"
		dw_lista.object.t_text_asignados.text='Con y Sin Asignación'
	else
		gs_formula	= ''
		dw_lista.object.t_text_asignados.text='Con Asignación'
	end if
	dw_lista.SETfilter(gs_formula)
	dw_lista.filter()
	dw_lista.sort()
	
elseif ls_columna='t_8' or ls_columna='t_9' then //amarillo fec prox pago vencidos
	if gs_formula = 'est_fec_pago =1 and  est_activo =0' then
		gs_formula	= ''
	else
		gs_formula	= 'est_fec_pago =1 and  est_activo =0'
	end if
	dw_lista.SETfilter(gs_formula)
	dw_lista.filter()
	dw_lista.sort()

elseif ls_columna='t_10' or ls_columna='t_11' then // rojo ctos ya asignados
	if gs_formula = 'est_activo = 1' then
		gs_formula	= ''
	else
		gs_formula	= 'est_activo = 1'
	end if
	dw_lista.SETfilter(gs_formula)
	dw_lista.filter()
	dw_lista.sort()
end if
if row>0 then
	il_row					= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	
	if dw_lista.dataobject='dwv_list_mora_c_m_contratos_ni' then
		gi_rut 					= dw_lista.GetItemNumber(il_row, "vista_listado_contratos_ni_rut")
		gs_base					= dw_lista.getitemstring(il_row, "vista_listado_contratos_ni_codigo")
		gs_serie					= dw_lista.getitemstring(il_row, "vista_listado_contratos_ni_serie")
		gi_numero				= dw_lista.getitemnumber(il_row, "vista_listado_contratos_ni_numero")
		ld_fecha_prox_llamado= date(dw_lista.getitemdatetime(il_row, "vista_listado_contratos_ni_fecha_prox_ll"))
	elseif dw_lista.dataobject='dwv_list_mora_c_m_cobranza_8' then
		gi_rut 					= dw_lista.GetItemNumber(il_row, "vista_listado_cobranza_8_porce_rut")
		gs_base					= dw_lista.getitemstring(il_row, "vista_listado_cobranza_8_porce_codigo")
		gs_serie					= dw_lista.getitemstring(il_row, "vista_listado_cobranza_8_porce_serie")
		gi_numero				= dw_lista.getitemnumber(il_row, "vista_listado_cobranza_8_porce_numero")
		ld_fecha_prox_llamado= date(dw_lista.getitemdatetime(il_row, "vista_listado_cobranza_8_porce_fecha_pro"))
	else
		gi_rut 					= dw_lista.GetItemNumber(il_row, "rut")
		gs_base					= dw_lista.getitemstring(il_row, "codigo")
		gs_serie					= dw_lista.getitemstring(il_row, "serie")
		gi_numero				= dw_lista.getitemnumber(il_row, "numero")
		ld_fecha_prox_llamado= date(dw_lista.getitemdatetime(il_row, "fecha_prox_llamado"))
	end if
	if ld_fecha_prox_llamado < date(gdt_fec_sistema) then 
		if gs_depto<>'G' then 
			tab_cobranza.tabpage_4.cb_grabar.enabled	= true
		else
			tab_cobranza.tabpage_4.cb_grabar.enabled	= false
		end if
	else
		tab_cobranza.tabpage_4.cb_grabar.enabled		= false
	end if
	wf_cargar_dw_contrato()//tab_cobranza.tabpage_1.dw_contrato.retrieve(gi_rut)
	tab_cobranza.tabpage_1.dw_cliente.retrieve(gi_rut)
	tab_cobranza.tabpage_2.dw_cobranza.retrieve(gi_rut)
	tab_cobranza.tabpage_2.dw_carta.retrieve(gi_rut)
	tab_cobranza.tabpage_2.dw_publico.retrieve(gi_rut)
	tab_cobranza.tabpage_3.dw_detalle_cuotas.retrieve(gs_serie,gi_numero,gs_base)
	tab_cobranza.tabpage_3.dw_detalle_mantencion.retrieve(gs_serie,gi_numero,gs_base)
	if tab_cobranza.tabpage_3.dw_detalle_total.retrieve(gs_serie,gi_numero,gs_base)>0 then
		ll_folio		= tab_cobranza.tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
		ls_tipo_cob	= tab_cobranza.tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
		tab_cobranza.tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
	else
		tab_cobranza.tabpage_3.dw_detalle_pagos.reset()
	end if
	tab_cobranza.tabpage_4.dw_cliente2.retrieve(gi_rut)
	if tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.retrieve(gi_rut)=0 then
		tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.insertrow(0)
		tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.setitem(1,'glosa','NO REGISTRA COBRANZA TELEFONICA')
	end if
	tab_cobranza.tabpage_4.dw_ingreso.reset()
	tab_cobranza.tabpage_4.dw_ingreso.insertrow(0)
	tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'usuario',gs_user)
	tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'fecha',gdt_fec_sistema)
	tab_cobranza.tabpage_4.em_fecha_prox.text		= string(RelativeDate(date(gdt_fec_sistema), 10),"dd/mm/yyyy")
	if gs_base='C' then
		tab_cobranza.tabpage_3.st_6.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_total.visible			= true
		tab_cobranza.tabpage_3.st_7.visible							= false
		tab_cobranza.tabpage_3.dw_detalle_cuotas.visible		= false
		tab_cobranza.tabpage_3.st_8.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_mantencion.visible	= true
		tab_cobranza.tabpage_3.st_3.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_contrato_isa()
	elseif gs_base='D' or gs_base='P' or gs_base='L' or gs_base='R' then
		tab_cobranza.tabpage_3.st_6.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_total.visible			= true
		tab_cobranza.tabpage_3.st_7.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_cuotas.visible		= true
		tab_cobranza.tabpage_3.st_8.visible							= false
		tab_cobranza.tabpage_3.dw_detalle_mantencion.visible	= false
		tab_cobranza.tabpage_3.st_3.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_otros_cttos()
	elseif gs_base='O' then
		tab_cobranza.tabpage_3.st_6.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_total.visible			= true
		tab_cobranza.tabpage_3.st_7.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_cuotas.visible		= true
		tab_cobranza.tabpage_3.st_8.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_mantencion.visible	= true
		tab_cobranza.tabpage_3.st_3.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_promesa()
	end if	
	tab_cobranza.visible	= true
end if
end event

event rowfocuschanged;String	ls_tipo_cob,ls_asignado
Long		ll_folio,ll_estado_reg,ll_ini,ll_fin,ll_indi
Date		ld_fecha_prox_llamado

if this.getrow()>0 then 
	this.accepttext()	
	il_row					= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	if dw_lista.dataobject='dwv_list_mora_c_m_contratos_ni' then
		gi_rut 					= dw_lista.GetItemNumber(il_row, "vista_listado_contratos_ni_rut")
		gs_base					= dw_lista.getitemstring(il_row, "vista_listado_contratos_ni_codigo")
		gs_serie					= dw_lista.getitemstring(il_row, "vista_listado_contratos_ni_serie")
		gi_numero				= dw_lista.getitemnumber(il_row, "vista_listado_contratos_ni_numero")
		ld_fecha_prox_llamado= date(dw_lista.getitemdatetime(il_row, "vista_listado_contratos_ni_fecha_prox_ll"))
	elseif dw_lista.dataobject='dwv_list_mora_c_m_cobranza_8' then
		gi_rut 					= dw_lista.GetItemNumber(il_row, "vista_listado_cobranza_8_porce_rut")
		gs_base					= dw_lista.getitemstring(il_row, "vista_listado_cobranza_8_porce_codigo")
		gs_serie					= dw_lista.getitemstring(il_row, "vista_listado_cobranza_8_porce_serie")
		gi_numero				= dw_lista.getitemnumber(il_row, "vista_listado_cobranza_8_porce_numero")
		ld_fecha_prox_llamado= date(dw_lista.getitemdatetime(il_row, "vista_listado_cobranza_8_porce_fecha_pro"))
	else
		gi_rut 					= dw_lista.GetItemNumber(il_row, "rut")
		gs_base					= dw_lista.getitemstring(il_row, "codigo")
		gs_serie					= dw_lista.getitemstring(il_row, "serie")
		gi_numero				= dw_lista.getitemnumber(il_row, "numero")
		ld_fecha_prox_llamado= date(dw_lista.getitemdatetime(il_row, "fecha_prox_llamado"))
	end if
	if ld_fecha_prox_llamado < date(gdt_fec_sistema) then 
		if gs_depto<>'G' then 
			tab_cobranza.tabpage_4.cb_grabar.enabled	= true
		else
			tab_cobranza.tabpage_4.cb_grabar.enabled	= false
		end if
	else
		tab_cobranza.tabpage_4.cb_grabar.enabled		= false
	end if
	wf_cargar_dw_contrato()//tab_cobranza.tabpage_1.dw_contrato.retrieve(gi_rut)
	tab_cobranza.tabpage_1.dw_cliente.retrieve(gi_rut)
	tab_cobranza.tabpage_2.dw_cobranza.retrieve(gi_rut)
	tab_cobranza.tabpage_2.dw_carta.retrieve(gi_rut)
	tab_cobranza.tabpage_2.dw_publico.retrieve(gi_rut)
	tab_cobranza.tabpage_3.dw_detalle_cuotas.retrieve(gs_serie,gi_numero,gs_base)
	tab_cobranza.tabpage_3.dw_detalle_mantencion.retrieve(gs_serie,gi_numero,gs_base)
	if tab_cobranza.tabpage_3.dw_detalle_total.retrieve(gs_serie,gi_numero,gs_base)>0 then
		ll_folio		= tab_cobranza.tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
		ls_tipo_cob	= tab_cobranza.tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
		tab_cobranza.tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
	else
		tab_cobranza.tabpage_3.dw_detalle_pagos.reset()
	end if
	tab_cobranza.tabpage_4.dw_cliente2.retrieve(gi_rut)
	if tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.retrieve(gi_rut)=0 then
		tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.insertrow(0)
		tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.setitem(1,'glosa','NO REGISTRA COBRANZA TELEFONICA')
	end if
	tab_cobranza.tabpage_4.dw_ingreso.reset()
	tab_cobranza.tabpage_4.dw_ingreso.insertrow(0)
	tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'usuario',gs_user)
	tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'fecha',gdt_fec_sistema)
	tab_cobranza.tabpage_4.em_fecha_prox.text		= string(RelativeDate(date(gdt_fec_sistema), 10),"dd/mm/yyyy")
	if gs_base='C' then
		tab_cobranza.tabpage_3.st_6.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_total.visible			= true
		tab_cobranza.tabpage_3.st_7.visible							= false
		tab_cobranza.tabpage_3.dw_detalle_cuotas.visible		= false
		tab_cobranza.tabpage_3.st_8.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_mantencion.visible	= true
		tab_cobranza.tabpage_3.st_3.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_contrato_isa()
	elseif gs_base='D' or gs_base='P' or gs_base='L' or gs_base='R' then
		tab_cobranza.tabpage_3.st_6.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_total.visible			= true
		tab_cobranza.tabpage_3.st_7.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_cuotas.visible		= true
		tab_cobranza.tabpage_3.st_8.visible							= false
		tab_cobranza.tabpage_3.dw_detalle_mantencion.visible	= false
		tab_cobranza.tabpage_3.st_3.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_otros_cttos()
	elseif gs_base='O' then
		tab_cobranza.tabpage_3.st_6.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_total.visible			= true
		tab_cobranza.tabpage_3.st_7.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_cuotas.visible		= true
		tab_cobranza.tabpage_3.st_8.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_mantencion.visible	= true
		tab_cobranza.tabpage_3.st_3.visible							= true
		tab_cobranza.tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_promesa()
	end if	
	tab_cobranza.visible	= true
end if
end event

type gb_2 from groupbox within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 2546
integer y = 1872
integer width = 462
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

type cb_exportar from commandbutton within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 2747
integer y = 48
integer width = 247
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type gb_1 from groupbox within w_filtrar_cobranza
event ue_mousemove pbm_mousemove
integer x = 2222
integer width = 1088
integer height = 160
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

