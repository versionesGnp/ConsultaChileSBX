forward
global type w_general_cobranza_telefonica_bkp from window
end type
type dw_dias_mora from datawindow within w_general_cobranza_telefonica_bkp
end type
type cb_pie_parcelado from commandbutton within w_general_cobranza_telefonica_bkp
end type
type dw_parque from datawindow within w_general_cobranza_telefonica_bkp
end type
type st_16 from statictext within w_general_cobranza_telefonica_bkp
end type
type cb_historico from commandbutton within w_general_cobranza_telefonica_bkp
end type
type cb_imprimir from commandbutton within w_general_cobranza_telefonica_bkp
end type
type cb_exportar from commandbutton within w_general_cobranza_telefonica_bkp
end type
type cb_filtrar from commandbutton within w_general_cobranza_telefonica_bkp
end type
type cb_ordenar from commandbutton within w_general_cobranza_telefonica_bkp
end type
type cb_genera_lista from commandbutton within w_general_cobranza_telefonica_bkp
end type
type cb_grabar_formula from commandbutton within w_general_cobranza_telefonica_bkp
end type
type pb_1 from picturebutton within w_general_cobranza_telefonica_bkp
end type
type sle_1 from singlelineedit within w_general_cobranza_telefonica_bkp
end type
type st_2 from statictext within w_general_cobranza_telefonica_bkp
end type
type pb_2 from picturebutton within w_general_cobranza_telefonica_bkp
end type
type pb_3 from picturebutton within w_general_cobranza_telefonica_bkp
end type
type pb_4 from picturebutton within w_general_cobranza_telefonica_bkp
end type
type pb_5 from picturebutton within w_general_cobranza_telefonica_bkp
end type
type cb_ctacte from commandbutton within w_general_cobranza_telefonica_bkp
end type
type cb_cerrar from commandbutton within w_general_cobranza_telefonica_bkp
end type
type gb_2 from groupbox within w_general_cobranza_telefonica_bkp
end type
type gb_1 from groupbox within w_general_cobranza_telefonica_bkp
end type
type tab_cobranza from uo_cobranza within w_general_cobranza_telefonica_bkp
end type
type tab_cobranza from uo_cobranza within w_general_cobranza_telefonica_bkp
end type
type dw_lista from datawindow within w_general_cobranza_telefonica_bkp
end type
type st_shift from statictext within w_general_cobranza_telefonica_bkp
end type
type cb_eliminar_mov from commandbutton within w_general_cobranza_telefonica_bkp
end type
end forward

global type w_general_cobranza_telefonica_bkp from window
integer width = 3365
integer height = 2132
boolean titlebar = true
string title = "Asignación Cobranza Telefónica"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_dias_mora dw_dias_mora
cb_pie_parcelado cb_pie_parcelado
dw_parque dw_parque
st_16 st_16
cb_historico cb_historico
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_genera_lista cb_genera_lista
cb_grabar_formula cb_grabar_formula
pb_1 pb_1
sle_1 sle_1
st_2 st_2
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
pb_5 pb_5
cb_ctacte cb_ctacte
cb_cerrar cb_cerrar
gb_2 gb_2
gb_1 gb_1
tab_cobranza tab_cobranza
dw_lista dw_lista
st_shift st_shift
cb_eliminar_mov cb_eliminar_mov
end type
global w_general_cobranza_telefonica_bkp w_general_cobranza_telefonica_bkp

type variables
long		il_row,il_row_aux,il_parque
Double	id_factor_gc,id_tasa_mant
end variables

forward prototypes
public subroutine wf_control_marcar (string as_control)
public subroutine wf_pos_contrato_isa ()
public subroutine wf_pos_otros_cttos ()
public subroutine wf_pos_promesa ()
public subroutine wf_cargar_dw_contrato ()
end prototypes

public subroutine wf_control_marcar (string as_control);long		ll_tot_reg,ll_indi,ll_est_marcar
String	ls_est_asignado
ll_tot_reg	= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_est_asignado	= dw_lista.getitemstring(ll_indi,'cliente_asignado_cobranza')
	if ls_est_asignado='N' then
		if ll_est_marcar=0 then
			if as_control='M' then dw_lista.setitem(ll_indi,'est_reg',0)
		end if
		if as_control='D' then dw_lista.setitem(ll_indi,'est_reg',1)
	end if
next
dw_lista.accepttext()
end subroutine

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

public subroutine wf_cargar_dw_contrato ();Long		ll_tot_reg,ll_indi,ll_numero,ll_mora_cred,ll_mora_mant,ll_dias_mora_cred,ll_dias_mora_mant,&
			ii_mora_cobro,ii_inc_gastos,i,ll_valor_total,ll_cta_pag_s,ll_cta_pag_m,ll_plazo,ll_cta_pag_la,&
			ll_cta_pag_isa
String	ls_base,ls_serie,ls_moneda,ls_estado_comi
Double	lld_tasa,lld_valor_cuota,lld_tasa_peso,lld_valor_cuota_peso,id_gc,id_im,lld_valor_cuota_m,&
			id_monto

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
							 id_gc 			= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0)
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
							 id_gc 			= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0)
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

on w_general_cobranza_telefonica_bkp.create
this.dw_dias_mora=create dw_dias_mora
this.cb_pie_parcelado=create cb_pie_parcelado
this.dw_parque=create dw_parque
this.st_16=create st_16
this.cb_historico=create cb_historico
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_genera_lista=create cb_genera_lista
this.cb_grabar_formula=create cb_grabar_formula
this.pb_1=create pb_1
this.sle_1=create sle_1
this.st_2=create st_2
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.pb_5=create pb_5
this.cb_ctacte=create cb_ctacte
this.cb_cerrar=create cb_cerrar
this.gb_2=create gb_2
this.gb_1=create gb_1
this.tab_cobranza=create tab_cobranza
this.dw_lista=create dw_lista
this.st_shift=create st_shift
this.cb_eliminar_mov=create cb_eliminar_mov
this.Control[]={this.dw_dias_mora,&
this.cb_pie_parcelado,&
this.dw_parque,&
this.st_16,&
this.cb_historico,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_genera_lista,&
this.cb_grabar_formula,&
this.pb_1,&
this.sle_1,&
this.st_2,&
this.pb_2,&
this.pb_3,&
this.pb_4,&
this.pb_5,&
this.cb_ctacte,&
this.cb_cerrar,&
this.gb_2,&
this.gb_1,&
this.tab_cobranza,&
this.dw_lista,&
this.st_shift,&
this.cb_eliminar_mov}
end on

on w_general_cobranza_telefonica_bkp.destroy
destroy(this.dw_dias_mora)
destroy(this.cb_pie_parcelado)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.cb_historico)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_genera_lista)
destroy(this.cb_grabar_formula)
destroy(this.pb_1)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.pb_5)
destroy(this.cb_ctacte)
destroy(this.cb_cerrar)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.tab_cobranza)
destroy(this.dw_lista)
destroy(this.st_shift)
destroy(this.cb_eliminar_mov)
end on

event open;Long	ll_tot_reg,ll_indi
SetPointer(HourGlass!)
gf_centrar(w_general_cobranza_telefonica)
SELECT "TASA"."GASTO_COB_MORA","TASA"."TASA_INT_UF" INTO :id_factor_gc,:id_tasa_mant FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
//id_factor_gc					= f_factor_gasto_cobranza()
st_shift.visible				= false
if gs_depto='I' then
	cb_eliminar_mov.visible	= true
else
	cb_eliminar_mov.visible	= false
end if
dw_dias_mora.settransobject(sqlca)
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
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion = "Parque El Prado" then
	il_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	il_parque	= 11
end if
dw_parque.setitem(1,'cod_parque',il_parque)
dw_parque.accepttext()
ll_tot_reg							= dw_lista.retrieve(date(gdt_fec_sistema),il_parque) //gdt_fec_sistema
tab_cobranza.visible				= false
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
	//	ll_est_marcar	= dw_lista.getitemnumber(ll_indi,'est_activo')
		dw_lista.setitem(ll_indi,'est_reg',1)
	next
end if
if gs_depto='G' then 
	cb_genera_lista.enabled							= false
	tab_cobranza.tabpage_4.cb_grabar.enabled	= false
else
	cb_genera_lista.enabled							= true
	tab_cobranza.tabpage_4.cb_grabar.enabled	= true
end if
SetPointer(Arrow!)
dw_lista.setfocus()
end event

event mousemove;st_shift.visible	= false
end event

type dw_dias_mora from datawindow within w_general_cobranza_telefonica_bkp
boolean visible = false
integer x = 347
integer y = 2032
integer width = 1563
integer height = 416
integer taborder = 170
string title = "none"
string dataobject = "dwe_lista_calculo_dias_mora_credito"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
end type

event doubleclicked;dw_dias_mora.print()
end event

type cb_pie_parcelado from commandbutton within w_general_cobranza_telefonica_bkp
integer x = 1399
integer y = 1912
integer width = 334
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Pie Parcelado"
end type

event clicked;Long		ll_cuotas_pactadas_pie,ll_numero
String	ls_uso,ls_string,ls_moneda,ls_base,ls_serie
Double	lld_pie
if il_row>0 then
	ll_cuotas_pactadas_pie	= dw_lista.getitemnumber(il_row,'vista_listado_mora_cred_mant_ctas_pactad')
	lld_pie						= dw_lista.getitemnumber(il_row,'vista_listado_mora_cred_mant_pie')
	if ll_cuotas_pactadas_pie>0 and lld_pie>0 then
		ls_moneda				= dw_lista.getitemstring(il_row,'vista_listado_mora_cred_mant_moneda')
		ls_uso					= trim(dw_lista.getitemstring(il_row,'vista_listado_mora_cred_mant_canal'))
		ls_base					= dw_lista.getitemstring(il_row,'codigo')
		ls_serie					= dw_lista.getitemstring(il_row,'serie')
		ll_numero				= dw_lista.getitemnumber(il_row,'numero')
		ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(lld_pie)+'~t'+ls_uso+'~t'+'C'+'~t'+ls_moneda
		if not isnull(ls_uso) and ls_uso<>'' and not isnull(ls_moneda) then openwithparm(w_ingreso_pie_pactado,ls_string)
	else
		messagebox("Advertencia","Contrato No Registra PIE Parcelado")
	end if
end if
end event

type dw_parque from datawindow within w_general_cobranza_telefonica_bkp
integer x = 219
integer y = 40
integer width = 594
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long	ll_tot_reg,ll_indi
SetPointer(HourGlass!)
dw_lista.reset()
dw_parque.accepttext()
il_parque							= dw_parque.getitemnumber(1,'cod_parque')
ll_tot_reg							= dw_lista.retrieve(date(gdt_fec_sistema),il_parque) //gdt_fec_sistema
tab_cobranza.visible				= false
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
	//	ll_est_marcar	= dw_lista.getitemnumber(ll_indi,'est_activo')
		dw_lista.setitem(ll_indi,'est_reg',1)
	next
end if
if gs_depto='G' then 
	cb_genera_lista.enabled							= false
	tab_cobranza.tabpage_4.cb_grabar.enabled	= false
else
	cb_genera_lista.enabled							= true
	tab_cobranza.tabpage_4.cb_grabar.enabled	= true
end if
SetPointer(Arrow!)
dw_lista.setfocus()
end event

type st_16 from statictext within w_general_cobranza_telefonica_bkp
integer x = 37
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

type cb_historico from commandbutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_dwnmousemove
integer x = 1102
integer y = 48
integer width = 283
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event ue_mousemove;st_shift.visible	= false
end event

event clicked;if dw_lista.getrow()>0 then
	gs_base			= dw_lista.getitemstring(il_row,'codigo')
	gs_serie			= dw_lista.getitemstring(il_row,'serie')
	gi_numero		= dw_lista.getitemnumber(il_row,'numero')
	gi_rut			= dw_lista.getitemnumber(il_row,'rut')
	open(w_cobranza_historica)
end if
end event

type cb_imprimir from commandbutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 3040
integer y = 48
integer width = 247
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_exportar from commandbutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 2747
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
string text = "&Exportar"
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 2496
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
string text = "&Filtrar"
end type

event ue_mousemove;st_shift.visible				= false
end event

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

type cb_ordenar from commandbutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_dwnmousemove
integer x = 2245
integer y = 48
integer width = 247
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

event ue_mousemove;st_shift.visible				= false
end event

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_genera_lista from commandbutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 466
integer y = 1912
integer width = 311
integer height = 100
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Asignar"
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;long	ll_fila, ll_tot_reg
ll_tot_reg	= dw_lista.rowcount()
ll_fila = dw_lista.Find("est_reg = 0",1, ll_tot_reg)
if ll_fila>0 then 
	open(w_generar_lista_cliente_gestion_cobranza)
else
	messagebox("Advertencia","No registra Contrato Seleccionado")
end if
end event

type cb_grabar_formula from commandbutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 805
integer y = 1912
integer width = 567
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar/Gra&bar Formula"
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;open(w_formulas)
end event

type pb_1 from picturebutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 2409
integer y = 1916
integer width = 105
integer height = 92
integer taborder = 150
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Lupa.bmp"
string disabledname = "Lupa.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;STRING	ls_string,ls_rut
long		ll_row
if trim(sle_1.text)<>'' then
	dw_lista.scrolltorow(1)
	ls_rut		= trim(sle_1.text)
	ls_string	= "rut="+trim(ls_rut)
	ll_row 		= dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
	IF ll_row > 0 THEN
		dw_lista.ScrollToRow( ll_row )
		dw_lista.setfocus()
	ELSE
		MessageBox("Advertencia", "Rut Inexistente")
	END IF
end if
end event

type sle_1 from singlelineedit within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 2025
integer y = 1916
integer width = 375
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_shift.visible				= false
end event

event modified;pb_1.triggerevent (clicked!)
end event

type st_2 from statictext within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 1861
integer y = 1932
integer width = 151
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_shift.visible				= false
end event

type pb_2 from picturebutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 2569
integer y = 1920
integer width = 101
integer height = 84
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;dw_lista.ScrollToRow(1)
end event

type pb_3 from picturebutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 2674
integer y = 1920
integer width = 101
integer height = 84
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;dw_lista.ScrollPriorPage( )
end event

type pb_4 from picturebutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 2779
integer y = 1920
integer width = 101
integer height = 84
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;dw_lista.ScrollNextPage( )
end event

type pb_5 from picturebutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 2885
integer y = 1920
integer width = 101
integer height = 84
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;dw_lista.ScrollToRow(dw_lista.rowcount() )
end event

type cb_ctacte from commandbutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1912
integer width = 407
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;if dw_lista.rowcount()>0 then
	gs_base 						= dw_lista.GetItemString(il_row, "codigo")
	gs_serie 					= dw_lista.GetItemString(il_row, "serie")
	gi_numero 					= dw_lista.GetItemNumber(il_row, "numero")
	gi_rut 						= dw_lista.GetItemNumber(il_row, "rut")
	gs_apellido_paterno		= dw_lista.GetItemString(il_row, "a_paterno")
	gs_apellido_materno		= dw_lista.GetItemString(il_row, "a_materno")
	gs_nombres					= dw_lista.GetItemString(il_row, "nombre")
	gs_dv							= dw_lista.GetItemString(il_row, "dv")
	gs_estado					= dw_lista.GetItemString(il_row, "estado")
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

type cb_cerrar from commandbutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 3040
integer y = 1912
integer width = 270
integer height = 100
integer taborder = 200
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;close(w_general_cobranza_telefonica)
end event

type gb_2 from groupbox within w_general_cobranza_telefonica_bkp
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

event ue_mousemove;st_shift.visible				= false
end event

type gb_1 from groupbox within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 2222
integer width = 1088
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

event ue_mousemove;st_shift.visible				= false
end event

type tab_cobranza from uo_cobranza within w_general_cobranza_telefonica_bkp
integer x = 434
integer y = 200
integer width = 2523
integer height = 1584
integer taborder = 90
integer textsize = -9
string facename = "Verdana"
boolean raggedright = false
boolean boldselectedtext = true
alignment alignment = center!
end type

type dw_lista from datawindow within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_dwnmousemove
integer x = 32
integer y = 176
integer width = 3278
integer height = 1688
integer taborder = 80
string dataobject = "dwv_listado_mora_credito_mantencion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_shift.visible	= true
end event

event clicked;string	ls_columna,ls_tipo_cob
Long		ll_folio,ll_estado_reg,ll_ini,ll_fin,ll_indi
Date		ld_fecha_prox_llamado
ls_columna	= dwo.name

if ls_columna='t_marcar_todo' then
	if dw_lista.rowcount()>0 then
		if dw_lista.object.t_marcar_todo.text='Seleccionar Todo' then
			wf_control_marcar('M')
			dw_lista.object.t_marcar_todo.text='Desmarcar Todo'
		else
			wf_control_marcar('D')
			dw_lista.object.t_marcar_todo.text='Seleccionar Todo'
		end if
	end if

elseif ls_columna='t_cobranza' or ls_columna='t_rojo' or ls_columna='t_texto_rojo' then
	if dw_lista.object.t_cobranza.text='Mostrar Solo Cobranza' then
		gs_formula	= "fecha > fecha_prox_llamado and cliente_asignado_cobranza <> '"+"S"+"'"
		dw_lista.object.t_cobranza.text='Mostrar Todo Cobranza'
	else
		gs_formula	= ''
		dw_lista.object.t_cobranza.text='Mostrar Solo Cobranza'
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
	if ls_columna='est_reg' and (KeyDown(65) or KeyDown(KeyShift!)) then
		il_row					= row
	//	This.SelectRow(0, FALSE)
		This.SelectRow(il_row, TRUE)
		This.scrolltorow(il_row)
		ll_estado_reg	= this.getitemnumber(il_row,'est_reg')
		if ll_estado_reg=1 then
			this.setitem(il_row,'est_reg',1)
			if il_row_aux <> il_row and il_row_aux>0 and il_row>0 then
				if il_row>il_row_aux then
					ll_ini	= il_row_aux 
					ll_fin	= il_row
				else
					ll_ini	= il_row 
					ll_fin	= il_row_aux
				end if
				ll_fin		= ll_fin - 1
				for ll_indi=ll_ini to ll_fin
					this.setitem(ll_indi,'est_reg',0)
					This.SelectRow(il_row, TRUE)
					This.scrolltorow(il_row)
				next
				setnull(il_row_aux);setnull(il_row_aux)
			end if
		else
			this.setitem(il_row,'est_reg',0)
			This.SelectRow(il_row, FALSE)
			il_row_aux	= il_row
		end if
		this.accepttext()
	else
		il_row					= row
		il_row_aux				= row
		This.SelectRow(0, FALSE)
		This.SelectRow(il_row, TRUE)
		This.scrolltorow(il_row)
	end if
	gi_rut 					= dw_lista.GetItemNumber(il_row, "rut")
	gs_base					= dw_lista.getitemstring(il_row, "codigo")
	gs_serie					= dw_lista.getitemstring(il_row, "serie")
	gi_numero				= dw_lista.getitemnumber(il_row, "numero")
	ld_fecha_prox_llamado= date(dw_lista.getitemdatetime(il_row, "fecha_prox_llamado"))
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
	if (KeyDown(65) or KeyDown(KeyShift!)) then
		il_row			= this.getrow()
		ll_estado_reg	= this.getitemnumber(il_row,'est_reg')
		ls_asignado		= this.getitemString(il_row,'cliente_asignado_cobranza')
		if ls_asignado<>'S' then
			This.SelectRow(il_row, TRUE)
			this.scrolltorow(il_row)
			if ll_estado_reg=0 then
				dw_lista.setitem(il_row,'est_reg',1)
				This.SelectRow(il_row, false)
				this.accepttext()
			elseif ll_estado_reg=1 then
				dw_lista.setitem(il_row,'est_reg',0)
				This.SelectRow(il_row, true)
				this.scrolltorow(il_row)
				this.accepttext()
			end if
		end if
	else
		il_row					= this.getrow()
		il_row_aux				= this.getrow()
		This.SelectRow(0, FALSE)
		This.SelectRow(il_row, TRUE)
		this.scrolltorow(il_row)
	end if
	this.accepttext()	
//	il_row					= this.getrow()
//	This.SelectRow(0, FALSE)
//	This.SelectRow(il_row, TRUE)
	
	gi_rut 					= dw_lista.GetItemNumber(il_row, "rut")
	gs_base					= dw_lista.getitemstring(il_row, "codigo")
	gs_serie					= dw_lista.getitemstring(il_row, "serie")
	gi_numero				= dw_lista.getitemnumber(il_row, "numero")
	ld_fecha_prox_llamado= date(dw_lista.getitemdatetime(il_row, "fecha_prox_llamado"))
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

type st_shift from statictext within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 475
integer y = 108
integer width = 1554
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Presione Tecla ~"SHIFT~" para Seleccionar más de Un Registro"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_shift.visible				= false
end event

type cb_eliminar_mov from commandbutton within w_general_cobranza_telefonica_bkp
event ue_mousemove pbm_mousemove
integer x = 1431
integer y = 48
integer width = 763
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = easteuropecharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial CE"
string text = "Eli&minar Cobranza Gestionadas"
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;long	ll_resp,ll_codigo_grupo

ll_resp	= MessageBox("Eliminar","Está Seguro Eliminar Todas las Llamadas Gestionadas",Exclamation!, YesNo!, 2)
IF ll_resp = 1 THEN
	COMMIT USING Trans_1;
	DECLARE	x1 CURSOR FOR  
	SELECT 	"GESTION_LISTA"."CODIGO"  
	FROM 		"GESTION_LISTA"  
	WHERE 	"GESTION_LISTA"."ESTADO" <> 'P'   
	USING		sqlca;
	open x1;
	DO WHILE sqlca.sqlcode=0
		if sqlca.sqlcode=0 then
			fetch x1 into :ll_codigo_grupo;
			if ll_codigo_grupo>0 then
				DELETE FROM "GESTION_LISTA"  
				WHERE 		"GESTION_LISTA"."CODIGO" = :ll_codigo_grupo   
				USING			Trans_1;
				if Trans_1.sqlcode=0 then
					commit;
					DELETE FROM "GESTION_COBRANZA"  
					WHERE 		"GESTION_COBRANZA"."CODIGO_GRUPO" = :ll_codigo_grupo   
					USING			Trans_1;
					if Trans_1.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				else
					rollback;
				end if
			end if
		end if
	LOOP
	close x1;
	messagebox("Eliminación Llamadas Gestionados","Eliminación Exitosa")
	DISCONNECT USING Trans_1; 
END IF
end event

