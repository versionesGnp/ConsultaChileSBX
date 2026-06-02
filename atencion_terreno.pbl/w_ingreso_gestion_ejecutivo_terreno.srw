forward
global type w_ingreso_gestion_ejecutivo_terreno from window
end type
type pb_buscar from picturebutton within w_ingreso_gestion_ejecutivo_terreno
end type
type em_buscar from editmask within w_ingreso_gestion_ejecutivo_terreno
end type
type st_1 from statictext within w_ingreso_gestion_ejecutivo_terreno
end type
type cb_limpiar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
end type
type cb_actualizar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
end type
type pb_filtrar from picturebutton within w_ingreso_gestion_ejecutivo_terreno
end type
type cb_grabar_formula from commandbutton within w_ingreso_gestion_ejecutivo_terreno
end type
type cb_geo from commandbutton within w_ingreso_gestion_ejecutivo_terreno
end type
type cb_aceptar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
end type
type cb_ordenar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
end type
type cb_filtrar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
end type
type cb_exportar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
end type
type cb_imprimir from commandbutton within w_ingreso_gestion_ejecutivo_terreno
end type
type cb_ctacte from commandbutton within w_ingreso_gestion_ejecutivo_terreno
end type
type cb_historico from commandbutton within w_ingreso_gestion_ejecutivo_terreno
end type
type tab_cobranza from uo_atencion_terreno within w_ingreso_gestion_ejecutivo_terreno
end type
type tab_cobranza from uo_atencion_terreno within w_ingreso_gestion_ejecutivo_terreno
end type
type st_titulo from statictext within w_ingreso_gestion_ejecutivo_terreno
end type
type cb_cerrar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
end type
type dw_lista from datawindow within w_ingreso_gestion_ejecutivo_terreno
end type
type gb_1 from groupbox within w_ingreso_gestion_ejecutivo_terreno
end type
type dw_filtro from datawindow within w_ingreso_gestion_ejecutivo_terreno
end type
type gb_2 from groupbox within w_ingreso_gestion_ejecutivo_terreno
end type
end forward

global type w_ingreso_gestion_ejecutivo_terreno from window
integer width = 3415
integer height = 2244
boolean titlebar = true
string title = "Cartera Asignada por Ejecutivo"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_buscar pb_buscar
em_buscar em_buscar
st_1 st_1
cb_limpiar cb_limpiar
cb_actualizar cb_actualizar
pb_filtrar pb_filtrar
cb_grabar_formula cb_grabar_formula
cb_geo cb_geo
cb_aceptar cb_aceptar
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_ctacte cb_ctacte
cb_historico cb_historico
tab_cobranza tab_cobranza
st_titulo st_titulo
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
dw_filtro dw_filtro
gb_2 gb_2
end type
global w_ingreso_gestion_ejecutivo_terreno w_ingreso_gestion_ejecutivo_terreno

type variables
Long		il_row
Double	id_factor_gc
String		is_estado,is_tipo_cob
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
Double	lld_tasa,lld_valor_cuota,lld_tasa_peso,lld_valor_cuota_peso,id_gc,id_im,lld_valor_cuota_m,&
			id_monto,ll_numero

ll_tot_reg		= tab_cobranza.tabpage_1.dw_contrato.retrieve(gi_rut)
for ll_indi=1 to ll_tot_reg
	ls_base				= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi,'cadena_codigo')
	ls_serie				= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi,'cadena_serie')
	ll_numero			= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_numero')
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
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
// 			Promesa Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
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
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
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
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 0
				ii_inc_gastos 		= 0
				FOR i = 1 TO ll_mora_mant 
					IF (ll_dias_mora_mant - (i - 1) * 365) > 1 THEN 
						ii_mora_cobro		= (ll_dias_mora_mant - (i - 1) * 365)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im 				= id_im + id_monto
						IF (ll_dias_mora_mant - (i - 1) * 365) > 30 THEN 
							 id_gc 			= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // CAMBIO DE 10 A 5%
							 ii_inc_gastos = 1
						END IF
					END IF
				NEXT
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
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
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
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 0
				ii_inc_gastos 		= 0
				FOR i = 1 TO ll_mora_mant 
					IF (ll_dias_mora_mant - (i - 1) * 365) > 1 THEN 
						ii_mora_cobro		= (ll_dias_mora_mant - (i - 1) * 365)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im 				= id_im + id_monto
						IF (ll_dias_mora_mant - (i - 1) * 365) > 30 THEN 
							 id_gc 			= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // CAMBIO DE 10 A 5%
							 ii_inc_gastos = 1
						END IF
					END IF
				NEXT
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
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
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
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
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
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
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
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
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
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
		 	USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
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
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
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

		CASE 'A'
			SELECT	"PAGO_AUMENTO"."TASA",  "PAGO_AUMENTO"."VALOR_CUOTA", "PAGO_AUMENTO"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"ANEXO_AUMENTO"."CTA_PAG_M",	"ANEXO_AUMENTO"."ESTADO_COMI",	"PAGO_AUMENTO"."NRO_CUOTAS"
			INTO 		:lld_tasa,   				:lld_valor_cuota,   				:ls_moneda  ,						:lld_tasa_peso,   		:lld_tasa ,					:ll_cta_pag_m,						:ls_estado_comi,						:ll_plazo
			FROM 		"ANEXO_AUMENTO",   "CADENA",   "PAGO_AUMENTO"  ,	"TASA"
			WHERE	 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
					 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
					 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
					 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
					 (("CADENA"."CODIGO" = 'A' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
		 	USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
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
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
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
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
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
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
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

on w_ingreso_gestion_ejecutivo_terreno.create
this.pb_buscar=create pb_buscar
this.em_buscar=create em_buscar
this.st_1=create st_1
this.cb_limpiar=create cb_limpiar
this.cb_actualizar=create cb_actualizar
this.pb_filtrar=create pb_filtrar
this.cb_grabar_formula=create cb_grabar_formula
this.cb_geo=create cb_geo
this.cb_aceptar=create cb_aceptar
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_ctacte=create cb_ctacte
this.cb_historico=create cb_historico
this.tab_cobranza=create tab_cobranza
this.st_titulo=create st_titulo
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.dw_filtro=create dw_filtro
this.gb_2=create gb_2
this.Control[]={this.pb_buscar,&
this.em_buscar,&
this.st_1,&
this.cb_limpiar,&
this.cb_actualizar,&
this.pb_filtrar,&
this.cb_grabar_formula,&
this.cb_geo,&
this.cb_aceptar,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_ctacte,&
this.cb_historico,&
this.tab_cobranza,&
this.st_titulo,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.dw_filtro,&
this.gb_2}
end on

on w_ingreso_gestion_ejecutivo_terreno.destroy
destroy(this.pb_buscar)
destroy(this.em_buscar)
destroy(this.st_1)
destroy(this.cb_limpiar)
destroy(this.cb_actualizar)
destroy(this.pb_filtrar)
destroy(this.cb_grabar_formula)
destroy(this.cb_geo)
destroy(this.cb_aceptar)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_ctacte)
destroy(this.cb_historico)
destroy(this.tab_cobranza)
destroy(this.st_titulo)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.dw_filtro)
destroy(this.gb_2)
end on

event open;String	ls_nom_user,ls_ciudad
Date		ld_fecha_hoy
Long		ll_fila
SetPointer(HourGlass!)
gf_centrar(w_ingreso_gestion_ejecutivo_terreno)

SELECT	"AT_USUARIO_MIXTO"."TIPO_GESTION"
INTO		:gs_tipo_cob  
FROM 	"AT_USUARIO_MIXTO"  
WHERE 	( "AT_USUARIO_MIXTO"."USUARIO" = :gs_user ) AND  
			( "AT_USUARIO_MIXTO"."TIPO_GESTION" = 'N' ) AND
			( "AT_USUARIO_MIXTO"."ESTADO" = 'V' )
USING	sqlca;
if isnull(gs_tipo_cob) then gs_tipo_cob=''
if gs_tipo_cob <> '' then
	is_tipo_cob = gs_tipo_cob
end if
ld_fecha_hoy									= date(gdt_fec_sistema)
ls_ciudad											= '130'
dw_filtro.SetTransObject(SQLCA)
dw_filtro.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
ll_fila												= dw_filtro.InsertRow(0)
dw_filtro.setitem(ll_fila,'ciudad',ls_ciudad)
idw_detalle.retrieve(ls_ciudad)
dw_lista.settransobject(sqlca)
id_factor_gc											= f_factor_gasto_cobranza()
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
tab_cobranza.tabpage_5.dw_cliente3.settransobject(sqlca)
tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.settransobject(sqlca)
tab_cobranza.tabpage_5.dw_ingreso_terreno.getchild('estado',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve(is_tipo_cob)=0 then
	idw_detalle2.insertrow(0)
end if
tab_cobranza.tabpage_5.dw_ingreso_terreno.insertrow(0)
tab_cobranza.visible				= false
if gs_depto='E' or gs_depto='I' then 
	tab_cobranza.tabpage_4.cb_grabar.enabled		= true
	tab_cobranza.tabpage_5.cb_grabar_at.enabled	= true
else
	tab_cobranza.tabpage_4.cb_grabar.enabled		= false
	tab_cobranza.tabpage_5.cb_grabar_at.enabled	= false
end if
if dw_lista.retrieve(gs_user,ld_fecha_hoy)=0 then
	messagebox("Advertencia","No Tiene cartera Asignada")
	close(w_ingreso_gestion_ejecutivo_terreno)
else
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nom_user  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		st_titulo.text		= 'Cartera de Atención en Terreno Ejecutivo '+ls_nom_user
	else
		st_titulo.text		= 'Cartera de Atención en Terreno Ejecutivo '+gs_user
	end if
	tab_cobranza.visible	= false
	dw_filtro.setfocus()
end if
SetPointer(Arrow!)
end event

type pb_buscar from picturebutton within w_ingreso_gestion_ejecutivo_terreno
integer x = 2862
integer y = 2024
integer width = 119
integer height = 104
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
alignment htextalign = left!
end type

event clicked;Double	ll_numero
Long		ll_tot_reg,ll_fila

ll_tot_reg		= dw_lista.rowcount() 
if ll_tot_reg > 0 then
	ll_numero	= double(em_buscar.text)
	if ll_numero > 0 then
		ll_fila		= dw_lista.Find("at_gestion_numero = "+string(ll_numero), 1, ll_tot_reg)
		if ll_fila > 0 then
			dw_lista.scrolltorow(ll_fila)
			dw_lista.SelectRow(ll_fila, true)
		end if
	end if

end if
end event

type em_buscar from editmask within w_ingreso_gestion_ejecutivo_terreno
integer x = 2377
integer y = 2032
integer width = 462
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###############"
end type

event modified;if double(this.text) > 0 then pb_buscar.triggerevent(clicked!)
end event

type st_1 from statictext within w_ingreso_gestion_ejecutivo_terreno
integer x = 2075
integer y = 2040
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Ctto"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_limpiar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
event ue_mousemove pbm_mousemove
integer x = 3072
integer y = 52
integer width = 242
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;String		ls_nulo

Setnull(ls_nulo)
dw_filtro.reset()

dw_lista.SETfilter(ls_nulo)
dw_lista.filter()
 w_ingreso_gestion_ejecutivo_terreno.triggerevent(Open!)
end event

type cb_actualizar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
boolean visible = false
integer x = 1687
integer y = 2300
integer width = 105
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Actualizar &Pagos"
end type

event clicked;SetPointer(HourGlass!)
DECLARE proc_cadena_mora PROCEDURE FOR SP_CADENA_MORA() ;
execute proc_cadena_mora;
DECLARE proc_cadena_mora_estado PROCEDURE FOR sp_cadena_mora_estado();
execute proc_cadena_mora_estado;
DECLARE proc_cadena_mora_lib PROCEDURE FOR sp_cadena_mora_lib();
execute proc_cadena_mora_lib;
DECLARE proc_cadena_mora_porc PROCEDURE FOR sp_cadena_mora_porc();
execute proc_cadena_mora_lib;
DECLARE proc_cadena_mora_pro PROCEDURE FOR sp_cadena_mora_pro();
execute proc_cadena_mora_lib;
SetPointer(Arrow!)
end event

type pb_filtrar from picturebutton within w_ingreso_gestion_ejecutivo_terreno
integer x = 1522
integer y = 52
integer width = 110
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
string disabledname = "LUPA_no.bmp"
alignment htextalign = left!
end type

event clicked;String	ls_ciudad,ls_comuna,ls_filtro

dw_filtro.accepttext()
ls_ciudad					= dw_filtro.getitemstring(1,'ciudad')
ls_comuna				= dw_filtro.getitemstring(1,'comuna')
gs_formula				= ''
if not isnull(ls_ciudad) and ls_ciudad<>'' and not isnull(ls_comuna) and ls_comuna<>'' then
	ls_filtro				= "cliente_ciudad='"+ls_ciudad+"' and cliente_comuna='"+ls_comuna+"'"
//	if gs_formula<>'' and not isnull(gs_formula) then
//		ls_filtro		= gs_formula+" and cliente_ciudad='"+ls_ciudad+"' and cliente_comuna='"+ls_comuna+"'"
//	else
//	end if
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
elseif not isnull(ls_ciudad) and ls_ciudad<>'' and ( isnull(ls_comuna) or ls_comuna='') then
	ls_filtro				= "cliente_ciudad='"+ls_ciudad+"'"
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
else
	if isnull(ls_ciudad) or ls_ciudad='' then
		messagebox("Advertencia","Debe Seleccionar Ciudad")
		dw_filtro.setfocus()
		dw_filtro.setcolumn('ciudad')
	elseif isnull(ls_comuna) or ls_comuna='' then
		messagebox("Advertencia","Debe Seleccionar Comuna")
		dw_filtro.setfocus()
		dw_filtro.setcolumn('comuna')
	end if
end if
tab_cobranza.visible	= false
end event

type cb_grabar_formula from commandbutton within w_ingreso_gestion_ejecutivo_terreno
event ue_mousemove pbm_mousemove
integer x = 1486
integer y = 2028
integer width = 562
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar/Gra&bar Formula"
end type

event clicked;if isvalid(w_formulas) then close(w_formulas)
open(w_formulas)
end event

type cb_geo from commandbutton within w_ingreso_gestion_ejecutivo_terreno
integer x = 1216
integer y = 2028
integer width = 270
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Geo-Ref."
end type

event clicked;long ret
Inet  iinet_base
if dw_lista.rowcount()>0 then
	gi_rut 		= dw_lista.GetItemNumber(il_row, "at_gestion_rut_cliente")
	gs_base		= dw_lista.getitemstring(il_row, "at_gestion_base")
	gs_serie		= dw_lista.getitemstring(il_row, "at_gestion_serie")
	gi_numero	= dw_lista.getitemnumber(il_row, "at_gestion_numero")
	is_estado	= dw_lista.getitemstring(il_row, 'at_gestion_estado_gestion')
	ret 			= GetContextService("Internet", iinet_base)
	if ret = -1 then
		messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
		return
	end if
	if gs_conexion	= "Parque El Prado" then
		ret = iinet_base.HyperlinkToURL("http://intra.elprado.cl/geomod/dbutil/pw1.php?barra="+gs_base+gs_serie+string(gi_numero))
	else
		ret = iinet_base.HyperlinkToURL("http://intra.elprado.cl/geoforesta/dbutil/pw1.php?barra="+gs_base+gs_serie+string(gi_numero))
	end if
	if ret = -1 then
		messagebox('No Existe','No existe el plano del sector buscado.',stopsign!)
		return
	end if
end if
end event

type cb_aceptar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
integer x = 498
integer y = 2028
integer width = 718
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar G.Mayor 12 Ctas.Pag."
end type

event clicked;long		ll_fila,ll_grupo,ll_tot_reg,ll_indi,ll_ctas_pag,ll_rut,ll_count_reg_g,ll_count_reg
String		ls_base,ls_serie
Date		ld_fecha_hoy
datetime	ldt_fec_prox_llam
Double	ll_numero

SetPointer(HourGlass!)
ld_fecha_hoy				= date(gdt_fec_sistema)
ll_tot_reg 					= dw_lista.RowCount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ll_ctas_pag			= dw_lista.getitemnumber(ll_indi,'cadena_mora_ctas_pag_s')
		ls_base				= dw_lista.getitemstring(ll_indi,'at_gestion_base')
		ls_serie				= dw_lista.getitemstring(ll_indi,'at_gestion_serie')
		ll_numero			= dw_lista.getitemnumber(ll_indi,'at_gestion_numero')
		ll_rut					= dw_lista.getitemnumber(ll_indi,'at_gestion_rut_cliente')
		ll_grupo				= dw_lista.getitemnumber(ll_indi,'at_gestion_codigo_grupo')
		ldt_fec_prox_llam	= dw_lista.getitemdatetime(ll_indi,'at_gestion_fecha_prox_llamada')
		if ll_ctas_pag >= 12 then
			UPDATE	"AT_GESTION"  
			SET 		"ESTADO_GESTION" = 'O'  
			WHERE	( "AT_GESTION"."BASE" = :ls_base ) AND  
						( "AT_GESTION"."SERIE" = :ls_serie ) AND  
					 	( "AT_GESTION"."NUMERO" = :ll_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				dw_lista.setitem(ll_indi,'at_gestion_estado_gestion','O')
				ldt_fec_prox_llam				= datetime(RelativeDate(date(gdt_fec_sistema), 1))
				UPDATE	"CLIENTE"  
				SET 		"FECHA_PROX_LLAMADO" = :ldt_fec_prox_llam
				WHERE 	"CLIENTE"."RUT" = :ll_rut   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit using sqlca;
				else
					rollback using sqlca;
				end if
				if ll_grupo > 0 then
					SELECT	COUNT("AT_GESTION"."CODIGO_GRUPO")  
					INTO 		:ll_count_reg_g  
					FROM 	"AT_GESTION"  
					WHERE 	( "AT_GESTION"."CODIGO_GRUPO" = :ll_grupo ) AND  
								( "AT_GESTION"."ESTADO_GESTION" = 'O' )   
					USING	sqlca;
		
					SELECT	COUNT("AT_GESTION"."CODIGO_GRUPO")  
					INTO 		:ll_count_reg
					FROM 	"AT_GESTION"  
					WHERE	( "AT_GESTION"."CODIGO_GRUPO" = :ll_grupo ) 
					USING	sqlca;
					if ll_count_reg_g = ll_count_reg then
						UPDATE	"AT_LISTA_GESTION"  
						SET 		"ESTADO_GESTION_LISTA" = 'G'  
						WHERE 	"AT_LISTA_GESTION"."CODIGO_GRUPO" = :ll_grupo   
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
				end if
			else
				rollback;
			end if
		else
			ldt_fec_prox_llam	= datetime(RelativeDate(date(gdt_fec_sistema), 370))
			UPDATE 	"CLIENTE"  
			SET 		"FECHA_PROX_LLAMADO" = :ldt_fec_prox_llam
			WHERE 	"CLIENTE"."RUT" = :ll_rut   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit using sqlca;
			else
				rollback using sqlca;
			end if
		end if
	next
else
	messagebox("Advertencia","No Existe Asignación Mayor a 12 Meses")
end if
SetPointer(Arrow!)
end event

type cb_ordenar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
event ue_mousemove pbm_dwnmousemove
integer x = 2391
integer y = 52
integer width = 238
integer height = 92
integer taborder = 40
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

type cb_filtrar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
event ue_mousemove pbm_mousemove
integer x = 2633
integer y = 52
integer width = 197
integer height = 92
integer taborder = 50
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

type cb_exportar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
event ue_mousemove pbm_mousemove
integer x = 2834
integer y = 52
integer width = 233
integer height = 92
integer taborder = 60
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

type cb_imprimir from commandbutton within w_ingreso_gestion_ejecutivo_terreno
event ue_mousemove pbm_mousemove
integer x = 2149
integer y = 52
integer width = 219
integer height = 92
integer taborder = 30
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
//	f_printdlg(dw_lista,gstr_print,parent)
end if
end event

type cb_ctacte from commandbutton within w_ingreso_gestion_ejecutivo_terreno
integer x = 32
integer y = 2028
integer width = 215
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&ta Cte"
end type

event clicked;string 	ls_base,ls_serie,param
long 	 	ll_rut
Double	ll_numero
if il_row > 0 and dw_lista.rowcount()>0 then
	gi_rut 		= dw_lista.GetItemNumber(il_row, "at_gestion_rut_cliente")
	gs_base		= dw_lista.getitemstring(il_row, "at_gestion_base")
	gs_serie		= dw_lista.getitemstring(il_row, "at_gestion_serie")
	gi_numero	= dw_lista.getitemnumber(il_row, "at_gestion_numero")
	is_estado	= dw_lista.getitemstring(il_row,'at_gestion_estado_gestion')
	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O","U","M" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
	END CHOOSE
	close(w_aviso_mensajes)
	
else
	messagebox('Seleción','Debe Seleccionar un contrato.',information!)
end if

end event

type cb_historico from commandbutton within w_ingreso_gestion_ejecutivo_terreno
event ue_mousemove pbm_dwnmousemove
integer x = 247
integer y = 2028
integer width = 251
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_lista.getrow()>0 then
	gi_rut 		= dw_lista.GetItemNumber(il_row, "at_gestion_rut_cliente")
	gs_base		= dw_lista.getitemstring(il_row, "at_gestion_base")
	gs_serie		= dw_lista.getitemstring(il_row, "at_gestion_serie")
	gi_numero	= dw_lista.getitemnumber(il_row, "at_gestion_numero")
	is_estado	= dw_lista.getitemstring(il_row,'at_gestion_estado_gestion')
	if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
	open(w_cobranza_historica)
end if
end event

type tab_cobranza from uo_atencion_terreno within w_ingreso_gestion_ejecutivo_terreno
boolean visible = false
integer x = 599
integer y = 304
integer taborder = 80
end type

event selectionchanged;call super::selectionchanged;CHOOSE CASE tab_cobranza.SelectedTab
	CASE 4
		tab_cobranza.tabpage_4.dw_ingreso.setfocus()
	CASE 5
		tab_cobranza.tabpage_5.dw_ingreso_terreno.setfocus()
END CHOOSE
end event

type st_titulo from statictext within w_ingreso_gestion_ejecutivo_terreno
integer x = 32
integer y = 192
integer width = 3314
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_ingreso_gestion_ejecutivo_terreno
integer x = 3099
integer y = 2028
integer width = 247
integer height = 92
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_gestion_ejecutivo_terreno)
end event

type dw_lista from datawindow within w_ingreso_gestion_ejecutivo_terreno
integer x = 32
integer y = 284
integer width = 3314
integer height = 1704
integer taborder = 70
string dataobject = "dw_gestion_individual_ejecutivo_terreno"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long		ll_folio,ll_status
String	ls_tipo_cob,ls_columna,ls_filtro,ls_estado_cadena
Double	ldb_lat_geo,ldb_lon_geo
ls_columna	= dwo.name
if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
	if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
	if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
	if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
	if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
	if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
	if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
	ldb_lat_geo				= double(dw_lista.GetItemNumber(il_row,"cliente_lat_geo"))
	ldb_lon_geo				= double(dw_lista.GetItemNumber(il_row,"cliente_lon_geo"))
	ll_status				= dw_lista.GetItemNumber(il_row, "cliente_status_geo")
	if ll_status>0 then
		cb_geo.enabled		= true
	else
		cb_geo.enabled		= false
	end if
	gi_rut 					= dw_lista.GetItemNumber(il_row, "at_gestion_rut_cliente")
	gs_base					= dw_lista.getitemstring(il_row, "at_gestion_base")
	gs_serie					= dw_lista.getitemstring(il_row, "at_gestion_serie")
	gi_numero				= dw_lista.getitemnumber(il_row, "at_gestion_numero")
	ls_estado_cadena		= dw_lista.getitemstring(il_row, 'cadena_estado')
	if ls_estado_cadena='V' or ls_estado_cadena='C' or ls_estado_cadena='T' then
		wf_cargar_dw_contrato()
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
		tab_cobranza.tabpage_4.rb_si.checked							= true
		tab_cobranza.tabpage_4.em_fecha_prox.text						= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		tab_cobranza.tabpage_4.em_fecha_prox_terre.text				= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		
		tab_cobranza.tabpage_5.dw_cliente3.retrieve(gi_rut)
		if tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.retrieve(gi_rut)=0 then
			tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.insertrow(0)
			tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.setitem(1,'glosa','NO REGISTRA COBRANZA TELEFONICA')
		end if
		tab_cobranza.tabpage_5.dw_ingreso_terreno.reset()
		tab_cobranza.tabpage_5.dw_ingreso_terreno.getchild('estado',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(is_tipo_cob)=0 then
			idw_detalle2.insertrow(0)
		end if
		tab_cobranza.tabpage_5.dw_ingreso_terreno.insertrow(0)
		tab_cobranza.tabpage_5.dw_ingreso_terreno.setitem(1,'usuario',gs_user)
		tab_cobranza.tabpage_5.dw_ingreso_terreno.setitem(1,'fecha',gdt_fec_sistema)
		tab_cobranza.tabpage_5.rb_si_terreno.checked					= true
		tab_cobranza.tabpage_5.em_fecha_prox_visita.text			= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		tab_cobranza.tabpage_5.em_fecha_prox_visita_terre.text	= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
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
	else
		messagebox("Advertencia","Recuerde Contrato de be estar V-Vigente / C-Cancelado o T-Protestado")
	end if
else
	if ls_columna='t_pendiente1' or ls_columna='t_pendiente2' then
		ls_filtro	= 'fecha_hoy < ante5_llamada and fecha_hoy < ante5_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_vencidos1' or ls_columna='t_vencidos2' then
		ls_filtro	= 'fecha_hoy >=  at_gestion_fecha_prox_llamada OR fecha_hoy >=  at_gestion_fecha_prox_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_falta1_1' or ls_columna='t_falta1_2' then
		ls_filtro	= 'fecha_hoy = ante1_llamada or  fecha_hoy = ante1_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_falta2_1' or ls_columna='t_falta2_2' then
		ls_filtro	= 'fecha_hoy = ante2_llamada or  fecha_hoy = ante2_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_falta3_1' or ls_columna='t_falta3_2' then
		ls_filtro	= 'fecha_hoy = ante3_llamada or  fecha_hoy = ante3_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_falta4_1' or ls_columna='t_falta4_2' then
		ls_filtro	= 'fecha_hoy = ante4_llamada or  fecha_hoy = ante4_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_falta5_1' or ls_columna='t_falta5_2' then
		ls_filtro	= 'fecha_hoy = ante5_llamada or  fecha_hoy = ante5_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_mostrar_todo' then
		ls_filtro	= ''
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_menor_12' or ls_columna='t_menor_12_2' then
		ls_filtro	= 'cadena_mora_ctas_pag_s <= 12'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_mora' then
		ls_filtro	= 'cadena_mora_ctas_pag_s <= 12 and cadena_mora_mora_cred > 0'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	end if
	if dw_lista.rowcount()>0 then 
		dw_lista.setSort("at_gestion_codigo_grupo A, at_gestion_fecha_prox_llamada A, at_gestion_fecha_prox_visita A, at_gestion_numero A");
		dw_lista.sort();
		dw_lista.scrolltorow(1)
	end if
end if
end event

event rowfocuschanged;Long		ll_folio,ll_status
String	ls_tipo_cob,ls_estado_cadena
Double	ldb_lat_geo,ldb_lon_geo

if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
	if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
	if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
	if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
	if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
	if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
	if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
	ldb_lat_geo				= double(dw_lista.GetItemNumber(il_row,"cliente_lat_geo"))
	ldb_lon_geo				= double(dw_lista.GetItemNumber(il_row,"cliente_lon_geo"))
	ll_status				= dw_lista.GetItemNumber(il_row, "cliente_status_geo")
	if ll_status>0 then
		cb_geo.enabled		= true
	else
		cb_geo.enabled		= false
	end if
	gi_rut 					= dw_lista.GetItemNumber(il_row, "at_gestion_rut_cliente")
	gs_base					= dw_lista.getitemstring(il_row, "at_gestion_base")
	gs_serie					= dw_lista.getitemstring(il_row, "at_gestion_serie")
	gi_numero				= dw_lista.getitemnumber(il_row, "at_gestion_numero")
	ls_estado_cadena		= dw_lista.getitemstring(il_row, 'cadena_estado')
	if ls_estado_cadena='V' or ls_estado_cadena='C' or ls_estado_cadena='T' then
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
		tab_cobranza.tabpage_4.rb_si.checked							= true
		tab_cobranza.tabpage_4.em_fecha_prox.text						= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		tab_cobranza.tabpage_4.em_fecha_prox_terre.text				= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		tab_cobranza.tabpage_5.dw_cliente3.retrieve(gi_rut)
		if tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.retrieve(gi_rut)=0 then
			tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.insertrow(0)
			tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.setitem(1,'glosa','NO REGISTRA COBRANZA TELEFONICA')
		end if
		tab_cobranza.tabpage_5.dw_ingreso_terreno.reset()
		tab_cobranza.tabpage_5.dw_ingreso_terreno.getchild('estado',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(is_tipo_cob)=0 then
			idw_detalle2.insertrow(0)
		end if
		tab_cobranza.tabpage_5.dw_ingreso_terreno.insertrow(0)
		tab_cobranza.tabpage_5.dw_ingreso_terreno.setitem(1,'usuario',gs_user)
		tab_cobranza.tabpage_5.dw_ingreso_terreno.setitem(1,'fecha',gdt_fec_sistema)
		tab_cobranza.tabpage_5.rb_si_terreno.checked					= true
		tab_cobranza.tabpage_5.em_fecha_prox_visita.text			= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		tab_cobranza.tabpage_5.em_fecha_prox_visita_terre.text	= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
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
	else
		messagebox("Advertencia","Recuerde Contrato de be estar V-Vigente / C-Cancelado o T-Protestado")
	end if
end if
end event

type gb_1 from groupbox within w_ingreso_gestion_ejecutivo_terreno
integer x = 2121
integer width = 1225
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_filtro from datawindow within w_ingreso_gestion_ejecutivo_terreno
integer x = 50
integer y = 44
integer width = 1454
integer height = 116
integer taborder = 10
string title = "none"
string dataobject = "dwe_filtrar_por_comuna"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_ciudad

this.accepttext()
ls_columna	= dw_filtro.GetColumnName ( )
if ls_columna='ciudad' then
	ls_ciudad	= dw_filtro.getitemstring(1,'ciudad')
	if not isnull(ls_ciudad) and ls_ciudad<>'' then
		idw_detalle.retrieve(ls_ciudad)
	end if
	if ls_ciudad='999' then
		dw_filtro.setitem(1,'comuna','999')
	end if
	if ls_ciudad='0' then
		dw_filtro.setitem(1,'comuna','0')
	end if
end if
pb_filtrar.triggerevent(Clicked!)

end event

event doubleclicked;String		ls_nulo

Setnull(ls_nulo)
dw_filtro.reset()

dw_lista.SETfilter(ls_nulo)
dw_lista.filter()
end event

type gb_2 from groupbox within w_ingreso_gestion_ejecutivo_terreno
integer x = 32
integer width = 1632
integer height = 168
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar"
end type

