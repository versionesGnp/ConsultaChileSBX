forward
global type w_general_cobranza_telefonica from window
end type
type cb_1 from commandbutton within w_general_cobranza_telefonica
end type
type pb_exportar from picturebutton within w_general_cobranza_telefonica
end type
type pb_ordenar from picturebutton within w_general_cobranza_telefonica
end type
type pb_filtrar from picturebutton within w_general_cobranza_telefonica
end type
type pb_imprimir from picturebutton within w_general_cobranza_telefonica
end type
type st_4 from statictext within w_general_cobranza_telefonica
end type
type ddplb_permanencia from dropdownpicturelistbox within w_general_cobranza_telefonica
end type
type st_3 from statictext within w_general_cobranza_telefonica
end type
type pb_6 from picturebutton within w_general_cobranza_telefonica
end type
type sle_marca from singlelineedit within w_general_cobranza_telefonica
end type
type st_1 from statictext within w_general_cobranza_telefonica
end type
type pb_ok from picturebutton within w_general_cobranza_telefonica
end type
type em_fec_ini from editmask within w_general_cobranza_telefonica
end type
type st_10 from statictext within w_general_cobranza_telefonica
end type
type p_ini from picture within w_general_cobranza_telefonica
end type
type cb_actualizar from commandbutton within w_general_cobranza_telefonica
end type
type cb_ctacte2 from commandbutton within w_general_cobranza_telefonica
end type
type dw_dias_mora from datawindow within w_general_cobranza_telefonica
end type
type cb_pie_parcelado from commandbutton within w_general_cobranza_telefonica
end type
type dw_parque from datawindow within w_general_cobranza_telefonica
end type
type st_16 from statictext within w_general_cobranza_telefonica
end type
type cb_historico from commandbutton within w_general_cobranza_telefonica
end type
type cb_genera_lista from commandbutton within w_general_cobranza_telefonica
end type
type cb_grabar_formula from commandbutton within w_general_cobranza_telefonica
end type
type pb_1 from picturebutton within w_general_cobranza_telefonica
end type
type sle_1 from singlelineedit within w_general_cobranza_telefonica
end type
type st_2 from statictext within w_general_cobranza_telefonica
end type
type pb_2 from picturebutton within w_general_cobranza_telefonica
end type
type pb_3 from picturebutton within w_general_cobranza_telefonica
end type
type pb_4 from picturebutton within w_general_cobranza_telefonica
end type
type pb_5 from picturebutton within w_general_cobranza_telefonica
end type
type cb_ctacte from commandbutton within w_general_cobranza_telefonica
end type
type cb_cerrar from commandbutton within w_general_cobranza_telefonica
end type
type gb_2 from groupbox within w_general_cobranza_telefonica
end type
type tab_cobranza from uo_cobranza within w_general_cobranza_telefonica
end type
type tab_cobranza from uo_cobranza within w_general_cobranza_telefonica
end type
type dw_lista from datawindow within w_general_cobranza_telefonica
end type
type st_shift from statictext within w_general_cobranza_telefonica
end type
type cb_eliminar_mov from commandbutton within w_general_cobranza_telefonica
end type
type gb_1 from groupbox within w_general_cobranza_telefonica
end type
end forward

global type w_general_cobranza_telefonica from window
integer width = 4046
integer height = 2488
boolean titlebar = true
string title = "Asignación Cobranza Telefónica"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
pb_exportar pb_exportar
pb_ordenar pb_ordenar
pb_filtrar pb_filtrar
pb_imprimir pb_imprimir
st_4 st_4
ddplb_permanencia ddplb_permanencia
st_3 st_3
pb_6 pb_6
sle_marca sle_marca
st_1 st_1
pb_ok pb_ok
em_fec_ini em_fec_ini
st_10 st_10
p_ini p_ini
cb_actualizar cb_actualizar
cb_ctacte2 cb_ctacte2
dw_dias_mora dw_dias_mora
cb_pie_parcelado cb_pie_parcelado
dw_parque dw_parque
st_16 st_16
cb_historico cb_historico
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
tab_cobranza tab_cobranza
dw_lista dw_lista
st_shift st_shift
cb_eliminar_mov cb_eliminar_mov
gb_1 gb_1
end type
global w_general_cobranza_telefonica w_general_cobranza_telefonica

type variables
long		il_row,il_row_aux,il_parque,il_marca_ini
Double	id_factor_gc,id_tasa_mant
end variables

forward prototypes
public subroutine wf_pos_contrato_isa ()
public subroutine wf_pos_otros_cttos ()
public subroutine wf_pos_promesa ()
public subroutine wf_cargar_dw_contrato ()
public subroutine wf_calcular_interes (string as_cobro, string as_base, string as_serie, long al_numero, long al_fila)
public subroutine wf_control_marcar (string as_control)
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

public subroutine wf_cargar_dw_contrato ();Long		ll_tot_reg_ctto,ll_indi_ctto,ll_mora_cred,ll_mora_mant,ll_dias_mora_cred,ll_dias_mora_mant,&
			ii_mora_cobro,ii_inc_gastos,i,ll_valor_total,ll_cta_pag_s,ll_cta_pag_m,ll_plazo,ll_cta_pag_la,&
			ll_cta_pag_isa
String	ls_base,ls_serie,ls_moneda,ls_estado_comi
Double	ldb_numero,lld_tasa,lld_valor_cuota,lld_tasa_peso,lld_valor_cuota_peso,id_gc,id_im,lld_valor_cuota_m,&
			id_monto

SetPointer(HourGlass!)
ll_tot_reg_ctto		= tab_cobranza.tabpage_1.dw_contrato.rowcount()
for ll_indi_ctto=1 to ll_tot_reg_ctto
	ls_base				= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi_ctto,'cadena_codigo')
	ls_serie				= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi_ctto,'cadena_serie')
	ldb_numero			= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_numero')
	ll_mora_cred		= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_mora_mora_cred')
	ll_mora_mant		= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_mora_mora_mant')
	ll_dias_mora_cred	= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_mora_dias_mora_cred')
	ll_dias_mora_mant	= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_mora_dias_mora_mant')
	
	CHOOSE CASE ls_base
		CASE 'O'
			//	Promesa Calculo Credito				
			wf_calcular_interes('E',ls_base,ls_serie,ldb_numero,ll_indi_ctto)
			// Promesa Calculo Mantencion				
			wf_calcular_interes('F',ls_base,ls_serie,ldb_numero,ll_indi_ctto)

		CASE 'C'
			// Calculo Mantencion
			wf_calcular_interes('F',ls_base,ls_serie,ldb_numero,ll_indi_ctto)

		CASE 'D'
			// Calculo Credito
			wf_calcular_interes('E',ls_base,ls_serie,ldb_numero,ll_indi_ctto)

		CASE 'P'
			// Calculo Credito
			wf_calcular_interes('E',ls_base,ls_serie,ldb_numero,ll_indi_ctto)

		CASE 'L'
			// Calculo Credito
			wf_calcular_interes('E',ls_base,ls_serie,ldb_numero,ll_indi_ctto)

		CASE 'A'
			// Calculo Credito
			wf_calcular_interes('E',ls_base,ls_serie,ldb_numero,ll_indi_ctto)

		CASE 'R'
			// Calculo Credito
			wf_calcular_interes('E',ls_base,ls_serie,ldb_numero,ll_indi_ctto)

	END CHOOSE
next
SetPointer(Arrow!)






//Long		ll_tot_reg,ll_indi,ll_numero,ll_mora_cred,ll_mora_mant,ll_dias_mora_cred,ll_dias_mora_mant,&
//			ii_mora_cobro,ii_inc_gastos,i,ll_valor_total,ll_cta_pag_s,ll_cta_pag_m,ll_plazo,ll_cta_pag_la,&
//			ll_cta_pag_isa
//String	ls_base,ls_serie,ls_moneda,ls_estado_comi
//Double	lld_tasa,lld_valor_cuota,lld_tasa_peso,lld_valor_cuota_peso,id_gc,id_im,lld_valor_cuota_m,&
//			id_monto
//
//ll_tot_reg		= tab_cobranza.tabpage_1.dw_contrato.retrieve(gi_rut)
//for ll_indi=1 to ll_tot_reg
//	ls_base				= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi,'cadena_codigo')
//	ls_serie				= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi,'cadena_serie')
//	ll_numero			= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_numero')
//	ll_mora_cred		= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_mora_cred')
//	ll_mora_mant		= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_mora_mant')
//	ll_dias_mora_cred	= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_dias_mora_cred')
//	ll_dias_mora_mant	= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_dias_mora_mant')
//	CHOOSE CASE ls_base
//		CASE 'O'
//			SELECT 	"PAGO_OFERTA"."TASA",   "PAGO_OFERTA"."MONEDA",   	"PAGO_OFERTA"."VALOR_CUOTA" ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"OFERTA_V"."VALOR_CUOTA_M",	"OFERTA_V"."CTA_PAG_S",	"OFERTA_V"."CTA_PAG_M",	"OFERTA_V"."ESTADO_COMI",	"PAGO_OFERTA"."NRO_CUOTAS"
//			INTO 		:lld_tasa,   				:ls_moneda,   					:lld_valor_cuota  ,   				:lld_tasa_peso,   		:lld_tasa  ,				:lld_valor_cuota_m,				:ll_cta_pag_s,				:ll_cta_pag_m,				:ls_estado_comi,				:ll_plazo
//			FROM 		"CADENA",   "OFERTA_V",   "PAGO_OFERTA"  ,	"TASA"
//			WHERE	 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
//					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
//					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
//					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
//					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
//					 (("CADENA"."CODIGO" = 'O' ) AND  
//					 ( "CADENA"."SERIE" = :ls_serie ) AND  
//					 ( "CADENA"."NUMERO" = :ll_numero ) )   
//			Using		sqlca;
//			if sqlca.sqlcode=0 then
//// 			Promesa Calculo Credito
//				setnull(ll_valor_total)
//				if ls_moneda='2' then // uf
//					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
//					lld_tasa					= lld_tasa
//				else
//					lld_valor_cuota_peso	= lld_valor_cuota
//					lld_tasa					= lld_tasa_peso
//				end if
//				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
//				id_gc 				= 0
//				id_im 				= 0
//				ii_mora_cobro 		= 1
//				ii_inc_gastos 		= 1
//				FOR i = 1 TO ll_mora_cred 
//					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
//						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
//						//	Funcion gf_int_mora
//						setnull(id_monto)
//						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
//						id_monto = (id_monto)
//						id_monto = round((id_monto * ii_mora_cobro),0)
//						//	Fin Funcion
//						id_im = id_im + id_monto
//						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
//							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
//							ii_inc_gastos = 1
//						END IF
//					END IF
//				NEXT
//				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
//// 			Promesa Calculo Mantencion				
//				setnull(ll_valor_total)
//				if ls_moneda='2' then // uf
//					lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
//					lld_tasa					= lld_tasa
//				else
//					lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
//					lld_tasa					= lld_tasa_peso
//				end if
//				lld_valor_cuota_peso		= Round(lld_valor_cuota_peso,0)
//				id_gc 						= 0
//				id_im 						= 0
//				ii_mora_cobro 				= 0
//				ii_inc_gastos 				= 0
//				FOR i = 1 TO ll_mora_mant 
//					IF (ll_dias_mora_mant - (i - 1) * 365) > 5 THEN 
//						ii_mora_cobro		= (ll_dias_mora_mant - (i - 1) * 365)
//						id_im 				= id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, lld_valor_cuota_peso)
//						IF (ll_dias_mora_mant - (i - 1) * 365) > 30 THEN 
//							 id_gc 			= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0)
//							 ii_inc_gastos = 1
//						END IF
//					END IF
//				NEXT
//				ll_valor_total	= ll_mora_mant * lld_valor_cuota_peso
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',id_gc)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',id_im)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',(id_gc + id_im + ll_valor_total))
//
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',ll_cta_pag_s)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',ll_cta_pag_m)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi',ls_estado_comi)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
//			end if
//
//		CASE 'C'
//			SELECT	"CONTRATO"."TASA",   "CONTRATO"."VALOR_CUO",   	"CONTRATO"."MONEDA"  ,	"CONTRATO"."VALOR_CUOTA_M",	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF",	"CONTRATO"."PLAZO",	"CONTRATO"."CTA_PAG_LA",	"CONTRATO"."CTA_PAG_ISA",	"CONTRATO"."CTA_PAG_M"
//			INTO 		:lld_tasa,   			:lld_valor_cuota,   			:ls_moneda  ,			 	:lld_valor_cuota_m,				:lld_tasa_peso,   		:lld_tasa  ,				:ll_plazo,				:ll_cta_pag_la,				:ll_cta_pag_isa,				:ll_cta_pag_m
//			FROM 		"CADENA",   "CONTRATO"  , "TASA"
//			WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
//					 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
//					 (("CADENA"."CODIGO" = 'C' ) AND  
//					 ( "CADENA"."SERIE" = :ls_serie ) AND  
//					 ( "CADENA"."NUMERO" = :ll_numero ) )   
//			USING		sqlca;
//			if sqlca.sqlcode=0 then
//				// Calculo Credito
//				setnull(ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',(ll_cta_pag_la + ll_cta_pag_isa))
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',ll_cta_pag_m)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi','')
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
//				
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',0)
//				// Calculo Mantencion
//				setnull(ll_valor_total)
//				if ls_moneda='2' then // uf
//					lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
//					lld_tasa					= lld_tasa
//				else
//					lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
//					lld_tasa					= lld_tasa_peso
//				end if
//				lld_valor_cuota_peso		= Round(lld_valor_cuota_peso,0)
//				id_gc 						= 0
//				id_im 						= 0
//				ii_mora_cobro 				= 0
//				ii_inc_gastos 				= 0
//				FOR i = 1 TO ll_mora_mant 
//					IF (ll_dias_mora_mant - (i - 1) * 365) > 5 THEN 
//						ii_mora_cobro		= (ll_dias_mora_mant - (i - 1) * 365)
//						id_im 				= id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, lld_valor_cuota_peso)
//						IF (ll_dias_mora_mant - (i - 1) * 365) > 30 THEN 
//							 id_gc 			= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0)
//							 ii_inc_gastos = 1
//						END IF
//					END IF
//				NEXT
//				ll_valor_total	= ll_mora_mant * lld_valor_cuota_peso
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',id_gc)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',id_im)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',(id_gc + id_im + ll_valor_total))
//			end if
//
//		CASE 'D'
//			SELECT	"DERECHO"."TASA",   	"DERECHO"."VALOR_CUO",  "DERECHO"."MONEDA"  ,	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF",	"DERECHO"."PLAZO",	"DERECHO"."CTA_PAG_LA",	"DERECHO"."CTA_PAG_ISA" 
//			INTO 		:lld_tasa,   			:lld_valor_cuota,   		:ls_moneda ,				:lld_tasa_peso,   		:lld_tasa ,					:ll_plazo,				:ll_cta_pag_la,			:ll_cta_pag_isa
//			FROM 		"CADENA",   "DERECHO"  ,	"TASA"
//			WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
//					 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
//					 (("CADENA"."CODIGO" = 'D' ) AND  
//					 ( "CADENA"."SERIE" = :ls_serie ) AND  
//					 ( "CADENA"."NUMERO" = :ll_numero ) )   
//			USING		sqlca;
//			if sqlca.sqlcode=0 then
//				// Calculo Credito
//				setnull(ll_valor_total)
//				if ls_moneda='2' then // uf
//					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
//					lld_tasa					= lld_tasa
//				else
//					lld_valor_cuota_peso	= lld_valor_cuota
//					lld_tasa					= lld_tasa_peso
//				end if
//				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
//				id_gc 				= 0
//				id_im 				= 0
//				ii_mora_cobro 		= 1
//				ii_inc_gastos 		= 1
//				FOR i = 1 TO ll_mora_cred 
//					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
//						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
//						//	Funcion gf_int_mora
//						setnull(id_monto)
//						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
//						id_monto = (id_monto)
//						id_monto = round((id_monto * ii_mora_cobro),0)
//						//	Fin Funcion
//						id_im = id_im + id_monto
//						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
//							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
//							ii_inc_gastos = 1
//						END IF
//					END IF
//				NEXT
//				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
//				// Calculo Mantencion
//				setnull(ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
//				
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',(ll_cta_pag_la + ll_cta_pag_isa))
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi','')
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
//			end if
//
//		CASE 'P'
//			SELECT	"PAGARE"."TASA",  "PAGARE"."VALOR_CUO",   "PAGARE"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"PAGARE"."PLAZO",	"PAGARE"."CTA_PAG_LA",	"PAGARE"."CTA_PAG_ISA"
//			INTO 		:lld_tasa,   		:lld_valor_cuota,   		:ls_moneda  ,				:lld_tasa_peso,   		:lld_tasa ,					:ll_plazo			:ll_cta_pag_la,			:ll_cta_pag_isa
//			FROM 		"CADENA",   "PAGARE"  ,	"TASA"
//			WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
//					 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
//					 (("CADENA"."CODIGO" = 'P' ) AND  
//					 ( "CADENA"."SERIE" = :ls_serie ) AND  
//					 ( "CADENA"."NUMERO" = :ll_numero ) )   
//			USING		sqlca;
//			if sqlca.sqlcode=0 then
//				// Calculo Credito
//				setnull(ll_valor_total)
//				if ls_moneda='2' then // uf
//					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
//					lld_tasa					= lld_tasa
//				else
//					lld_valor_cuota_peso	= lld_valor_cuota
//					lld_tasa					= lld_tasa_peso
//				end if
//				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
//				id_gc 				= 0
//				id_im 				= 0
//				ii_mora_cobro 		= 1
//				ii_inc_gastos 		= 1
//				FOR i = 1 TO ll_mora_cred 
//					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
//						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
//						//	Funcion gf_int_mora
//						setnull(id_monto)
//						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
//						id_monto = (id_monto)
//						id_monto = round((id_monto * ii_mora_cobro),0)
//						//	Fin Funcion
//						id_im = id_im + id_monto
//						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
//							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
//							ii_inc_gastos = 1
//						END IF
//					END IF
//				NEXT
//				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
//				// Calculo Mantencion
//				setnull(ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
//				
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',(ll_cta_pag_la + ll_cta_pag_isa))
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi','')
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
//			end if
//
//		CASE 'L'
//			SELECT	"PAGO_LIBERADOR"."TASA",   "PAGO_LIBERADOR"."VALOR_CUOTA",  "PAGO_LIBERADOR"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"ANEXO_LIBERADOR"."CTA_PAG_M",	"ANEXO_LIBERADOR"."ESTADO_COMI",	"PAGO_LIBERADOR"."NRO_CUOTAS"
//			INTO 		:lld_tasa,   					:lld_valor_cuota,   					:ls_moneda  ,							:lld_tasa_peso,   		:lld_tasa ,					:ll_cta_pag_m,							:ls_estado_comi,						:ll_plazo
//			FROM 		"ANEXO_LIBERADOR",   "CADENA",   "PAGO_LIBERADOR"  ,	"TASA"
//			WHERE	 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
//					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
//					 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
//					 ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
//					 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
//					 (("CADENA"."CODIGO" = 'L' ) AND  
//					 ( "CADENA"."SERIE" = :ls_serie ) AND  
//					 ( "CADENA"."NUMERO" = :ll_numero ) )   
//		 	USING		sqlca;
//			if sqlca.sqlcode=0 then
//				// Calculo Credito
//				setnull(ll_valor_total)
//				if ls_moneda='2' then // uf
//					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
//					lld_tasa					= lld_tasa
//				else
//					lld_valor_cuota_peso	= lld_valor_cuota
//					lld_tasa					= lld_tasa_peso
//				end if
//				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
//				id_gc 				= 0
//				id_im 				= 0
//				ii_mora_cobro 		= 1
//				ii_inc_gastos 		= 1
//				FOR i = 1 TO ll_mora_cred 
//					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
//						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
//						//	Funcion gf_int_mora
//						setnull(id_monto)
//						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
//						id_monto = (id_monto)
//						id_monto = round((id_monto * ii_mora_cobro),0)
//						//	Fin Funcion
//						id_im = id_im + id_monto
//						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
//							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
//							ii_inc_gastos = 1
//						END IF
//					END IF
//				NEXT
//				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
//				// Calculo Mantencion
//				setnull(ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
//				
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',ll_cta_pag_m)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi',ls_estado_comi)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
//			end if
//
//		CASE 'A'
//			SELECT	"PAGO_AUMENTO"."TASA",  "PAGO_AUMENTO"."VALOR_CUOTA", "PAGO_AUMENTO"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"ANEXO_AUMENTO"."CTA_PAG_M",	"ANEXO_AUMENTO"."ESTADO_COMI",	"PAGO_AUMENTO"."NRO_CUOTAS"
//			INTO 		:lld_tasa,   				:lld_valor_cuota,   				:ls_moneda  ,						:lld_tasa_peso,   		:lld_tasa ,					:ll_cta_pag_m,						:ls_estado_comi,						:ll_plazo
//			FROM 		"ANEXO_AUMENTO",   "CADENA",   "PAGO_AUMENTO"  ,	"TASA"
//			WHERE	 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
//					 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
//					 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
//					 ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
//					 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
//					 (("CADENA"."CODIGO" = 'A' ) AND  
//					 ( "CADENA"."SERIE" = :ls_serie ) AND  
//					 ( "CADENA"."NUMERO" = :ll_numero ) )   
//		 	USING		sqlca;
//			if sqlca.sqlcode=0 then
//				// Calculo Credito
//				setnull(ll_valor_total)
//				if ls_moneda='2' then // uf
//					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
//					lld_tasa					= lld_tasa
//				else
//					lld_valor_cuota_peso	= lld_valor_cuota
//					lld_tasa					= lld_tasa_peso
//				end if
//				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
//				id_gc 				= 0
//				id_im 				= 0
//				ii_mora_cobro 		= 1
//				ii_inc_gastos 		= 1
//				FOR i = 1 TO ll_mora_cred 
//					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
//						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
//						//	Funcion gf_int_mora
//						setnull(id_monto)
//						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
//						id_monto = (id_monto)
//						id_monto = round((id_monto * ii_mora_cobro),0)
//						//	Fin Funcion
//						id_im = id_im + id_monto
//						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
//							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
//							ii_inc_gastos = 1
//						END IF
//					END IF
//				NEXT
//				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
//				// Calculo Mantencion
//				setnull(ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
//				
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',ll_cta_pag_m)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi',ls_estado_comi)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
//			end if
//			
//		CASE 'R'
//			SELECT	"REPACTA_MANTENCION"."VALOR_CUOTA_UF", "REPACTA_MANTENCION"."TIPO_MONEDA",   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF"  ,	"REPACTA_MANTENCION"."CUOTAS_PACTADAS",	"REPACTA_MANTENCION"."CTAS_PAGADAS"
//			INTO 		:lld_valor_cuota,   							:ls_moneda,   								  	:lld_tasa_peso,   		:lld_tasa  ,				:ll_plazo,											:ll_cta_pag_s
//			FROM 		"CADENA",   "REPACTA_MANTENCION",   "TASA"  
//			WHERE  ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
//					 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
//					 (("CADENA"."CODIGO" = 'R' ) AND  
//					 ( "CADENA"."SERIE" = :ls_serie ) AND  
//					 ( "CADENA"."NUMERO" = :ll_numero ) )   
//			USING		sqlca;
//			if sqlca.sqlcode=0 then
//				// Calculo Credito
//				setnull(ll_valor_total)
//				if ls_moneda='2' then // uf
//					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
//					lld_tasa					= lld_tasa
//				else
//					lld_valor_cuota_peso	= lld_valor_cuota
//					lld_tasa					= lld_tasa_peso
//				end if
//				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
//				id_gc 				= 0
//				id_im 				= 0
//				ii_mora_cobro 		= 1
//				ii_inc_gastos 		= 1
//				FOR i = 1 TO ll_mora_cred 
//					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
//						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
//						//	Funcion gf_int_mora
//						setnull(id_monto)
//						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
//						id_monto = (id_monto)
//						id_monto = round((id_monto * ii_mora_cobro),0)
//						//	Fin Funcion
//						id_im = id_im + id_monto
//						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
//							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
//							ii_inc_gastos = 1
//						END IF
//					END IF
//				NEXT
//				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
//				// Calculo Mantencion
//				setnull(ll_valor_total)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
//				
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',ll_cta_pag_s)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi','')
//				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
//			end if
//	END CHOOSE
//next
end subroutine

public subroutine wf_calcular_interes (string as_cobro, string as_base, string as_serie, long al_numero, long al_fila);Long		ii_cantidad,ii_dmora,ii_mora_cobro,ii_inc_gastos,i,ll_gasto_cob,ll_mora,ll_gastos,&
			ll_tot_reg,ll_monto,ll_total_monto,ll_cuota,ll_day,ll_month,ll_year,ll_suma_dias,&
			ll_tot_fila,ll_reg,ll_dias_mora,ll_ctas_mora,ll_calc_dias,ld_dias_sum_mora,ldb_mora=0,&
			id_valor_cuota,id_im, id_gc,ll_new,ll_dias_dif,ll_ctas_pag,ldb_suma_gasto_cob=0,ll_max,&
			ll_dia_prox_pago,ll_cta_pag_s,ll_cta_pag_m,ll_plazo,ll_cta_pag_la,ll_cta_pag_isa,ll_cta_mora_m,&
			ii_dmora_m,ll_tot_reg_dias
String	ls_tipo_cob,ls_pasa,ls_fecha,ls_moneda,ls_estado_comi
Date		ld_fecha_prox_pago,ld_fecha_hoy,ld_fecha_inicial,ld_fecha_prox_venc
Datetime	ldt_fecha_prim
Double	ldb_valor,lld_tasa,lld_valor_cuota,lld_tasa_peso,lld_valor_cuota_m,ll_valor_total,&
			ldb_tasa,id_valor_cuota_m

IF gs_rezago <> "S" THEN
	CHOOSE CASE as_base
		CASE 'O'
			SELECT 	"PAGO_OFERTA"."TASA",   "PAGO_OFERTA"."MONEDA",   	"PAGO_OFERTA"."VALOR_CUOTA" ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"OFERTA_V"."VALOR_CUOTA_M",	"OFERTA_V"."CTA_PAG_S",	"OFERTA_V"."CTA_PAG_M",	"OFERTA_V"."ESTADO_COMI",	"PAGO_OFERTA"."NRO_CUOTAS",	"PAGO_OFERTA"."FECHA_PRIM",	"OFERTA_V"."CTA_PAG_S"
			INTO 		:lld_tasa,   				:ls_moneda,   					:lld_valor_cuota  ,   				:lld_tasa_peso,   		:lld_tasa  ,				:lld_valor_cuota_m,				:ll_cta_pag_s,				:ll_cta_pag_m,				:ls_estado_comi,				:ll_plazo,							:ldt_fecha_prim,					:ll_ctas_pag
			FROM 		"CADENA",   "OFERTA_V",   "PAGO_OFERTA"  ,	"TASA"
			WHERE	 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = 'O' ) AND  
					 ( "CADENA"."SERIE" = :as_serie ) AND  
					 ( "CADENA"."NUMERO" = :al_numero ) )   
			Using		sqlca;
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_cta_pag_s)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',ll_cta_pag_m)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'est_comi',ls_estado_comi)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			
		CASE 'C'
			SELECT	"CONTRATO"."TASA",   "CONTRATO"."VALOR_CUO",   	"CONTRATO"."MONEDA"  ,	"CONTRATO"."VALOR_CUOTA_M",	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF",	"CONTRATO"."PLAZO",	"CONTRATO"."CTA_PAG_LA",	"CONTRATO"."CTA_PAG_ISA",	"CONTRATO"."CTA_PAG_M"
			INTO 		:lld_tasa,   			:lld_valor_cuota,   			:ls_moneda  ,			 	:lld_valor_cuota_m,				:lld_tasa_peso,   		:lld_tasa  ,				:ll_plazo,				:ll_cta_pag_la,				:ll_cta_pag_isa,				:ll_cta_pag_m
			FROM 		"CADENA",   "CONTRATO"  , "TASA"
			WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					 (("CADENA"."CODIGO" = 'C' ) AND  
					 ( "CADENA"."SERIE" = :as_serie ) AND  
					 ( "CADENA"."NUMERO" = :al_numero ) )   
			USING		sqlca;
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_cta_pag_la + ll_cta_pag_isa)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'est_comi','')
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',ll_cta_pag_m)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			
		CASE 'D'
			SELECT	"DERECHO"."TASA",   	"DERECHO"."VALOR_CUO",  "DERECHO"."MONEDA"  ,	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF",	"DERECHO"."PLAZO",	"DERECHO"."CTA_PAG_LA",	"DERECHO"."CTA_PAG_ISA",	"DERECHO"."FECHA_PRIM"
			INTO 		:lld_tasa,   			:lld_valor_cuota,   		:ls_moneda ,				:lld_tasa_peso,   		:lld_tasa ,					:ll_plazo,				:ll_cta_pag_la,			:ll_cta_pag_isa,				:ldt_fecha_prim
			FROM 		"CADENA",   "DERECHO"  ,	"TASA"
			WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
					 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
					 (("CADENA"."CODIGO" = 'D' ) AND  
					 ( "CADENA"."SERIE" = :as_serie ) AND  
					 ( "CADENA"."NUMERO" = :al_numero ) )   
			USING		sqlca;
			ll_ctas_pag		= ll_cta_pag_la + ll_cta_pag_isa
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_ctas_pag)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',0)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'est_comi','')
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			
		CASE 'P'
			SELECT	"PAGARE"."TASA",  "PAGARE"."VALOR_CUO",   "PAGARE"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"PAGARE"."PLAZO",	"PAGARE"."CTA_PAG_LA",	"PAGARE"."CTA_PAG_ISA",		"PAGARE"."FECHA_PRIM"
			INTO 		:lld_tasa,   		:lld_valor_cuota,   		:ls_moneda  ,				:lld_tasa_peso,   		:lld_tasa ,					:ll_plazo			:ll_cta_pag_la,			:ll_cta_pag_isa,				:ldt_fecha_prim
			FROM 		"CADENA",   "PAGARE"  ,	"TASA"
			WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
					 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
					 (("CADENA"."CODIGO" = 'P' ) AND  
					 ( "CADENA"."SERIE" = :as_serie ) AND  
					 ( "CADENA"."NUMERO" = :al_numero ) )   
			USING		sqlca;
			ll_ctas_pag		= ll_cta_pag_la + ll_cta_pag_isa
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_ctas_pag)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',0)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'est_comi','')
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			
		CASE 'L'
			SELECT	"PAGO_LIBERADOR"."TASA",   "PAGO_LIBERADOR"."VALOR_CUOTA",  "PAGO_LIBERADOR"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"ANEXO_LIBERADOR"."CTA_PAG_M",	"ANEXO_LIBERADOR"."ESTADO_COMI",	"PAGO_LIBERADOR"."NRO_CUOTAS",	"PAGO_LIBERADOR"."FECHA_PRIM",	"ANEXO_LIBERADOR"."CTA_PAG_M"
			INTO 		:lld_tasa,   					:lld_valor_cuota,   					:ls_moneda  ,							:lld_tasa_peso,   		:lld_tasa ,					:ll_cta_pag_m,							:ls_estado_comi,						:ll_plazo,								:ldt_fecha_prim,						:ll_ctas_pag
			FROM 		"ANEXO_LIBERADOR",   "CADENA",   "PAGO_LIBERADOR"  ,	"TASA"
			WHERE	 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
					 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
					 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
					 (("CADENA"."CODIGO" = 'L' ) AND  
					 ( "CADENA"."SERIE" = :as_serie ) AND  
					 ( "CADENA"."NUMERO" = :al_numero ) )   
		 	USING		sqlca;
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_ctas_pag)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',0)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'est_comi',ls_estado_comi)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			 
		CASE 'A'
			SELECT	"PAGO_AUMENTO"."TASA",  "PAGO_AUMENTO"."VALOR_CUOTA", "PAGO_AUMENTO"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"ANEXO_AUMENTO"."CTA_PAG_M",	"ANEXO_AUMENTO"."ESTADO_COMI",	"PAGO_AUMENTO"."NRO_CUOTAS",	"PAGO_AUMENTO"."FECHA_PRIM",	"ANEXO_AUMENTO"."CTA_PAG_M"
			INTO 		:lld_tasa,   				:lld_valor_cuota,   				:ls_moneda  ,						:lld_tasa_peso,   		:lld_tasa ,					:ll_cta_pag_m,						:ls_estado_comi,						:ll_plazo,							:ldt_fecha_prim,					:ll_ctas_pag
			FROM 		"ANEXO_AUMENTO",   "CADENA",   "PAGO_AUMENTO"  ,	"TASA"
			WHERE	 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
					 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
					 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "PAGO_AUMENTO"."SERIE_M" ) and  
					 ( "CADENA"."NUMERO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
					 (("CADENA"."CODIGO" = 'L' ) AND  
					 ( "CADENA"."SERIE" = :as_serie ) AND  
					 ( "CADENA"."NUMERO" = :al_numero ) )   
		 	USING		sqlca;
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_ctas_pag)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',0)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'est_comi',ls_estado_comi)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			
		CASE 'R'
			SELECT	"REPACTA_MANTENCION"."VALOR_CUOTA_UF", "REPACTA_MANTENCION"."TIPO_MONEDA",   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF"  ,	"REPACTA_MANTENCION"."CUOTAS_PACTADAS",	"REPACTA_MANTENCION"."CTAS_PAGADAS",	"REPACTA_MANTENCION"."FECHA_PRIMERA_CTA",	"REPACTA_MANTENCION"."CTAS_PAGADAS"
			INTO 		:lld_valor_cuota,   							:ls_moneda,   								  	:lld_tasa_peso,   		:lld_tasa  ,				:ll_plazo,											:ll_cta_pag_s,									:ldt_fecha_prim,									:ll_ctas_pag
			FROM 		"CADENA",   "REPACTA_MANTENCION",   "TASA"  
			WHERE  ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
					 (("CADENA"."CODIGO" = 'R' ) AND  
					 ( "CADENA"."SERIE" = :as_serie ) AND  
					 ( "CADENA"."NUMERO" = :al_numero ) )   
			USING		sqlca;
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_cta_pag_s)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',0)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'est_comi','')
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			
	END CHOOSE
	ld_fecha_hoy								= date(gdt_fec_sistema)
//	ll_tot_reg									= tab_cobranza.tabpage_1.dw_contrato.rowcount()
//	if ll_tot_reg>0 then
//		for ll_indi=1 to ll_tot_reg
			if as_cobro='E' then
				ll_cuota							= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(al_fila, "cadena_mora_mora_cred")
			else
				ll_cuota							= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(al_fila, "cadena_mora_mora_mant")
			end if
			ls_tipo_cob							= as_cobro
			if ll_cuota>0 then
				if ls_tipo_cob='E' or ls_tipo_cob='A' or ls_tipo_cob='F' then
					if ls_tipo_cob='E' then
						ii_cantidad 			= ll_cuota
						gl_n_cuotas_pag 		= ii_cantidad 
						if ls_moneda='1' then
							id_valor_cuota 	= lld_valor_cuota
							ldb_tasa				= lld_tasa_peso
						else
							id_valor_cuota 	= ROUND((lld_valor_cuota * gf_uf(String(today(),'dd/mm/yyyy'))) ,0)
							ldb_tasa				= lld_tasa
						end if
						ll_monto					= id_valor_cuota * ii_cantidad
						ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag )))
						ii_dmora 				= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(al_fila, "cadena_mora_dias_mora_cred")
						ll_ctas_mora			= ll_cuota

					elseif ls_tipo_cob='A' then
						if ls_moneda='1' then
//							id_valor_cuota 	= lld_valor_cuota
						else
//							id_valor_cuota 	= ROUND((lld_valor_cuota * gf_uf(String(today(),'dd/mm/yyyy'))) ,0)
						end if
//						ll_monto					= id_valor_cuota * ii_cantidad
//						ii_dmora 				= w_ingreso.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1,'c_dias_mora_pie')

					elseif ls_tipo_cob='F' then
						if as_base='O' or as_base='C' then
							id_valor_cuota_m 	= Round(lld_valor_cuota_m * gf_uf(String(today(),'dd/mm/yyyy')), 0)
							ii_dmora_m 			= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(al_fila, "cadena_mora_dias_mora_mant")
							ll_cta_mora_m		= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(al_fila, "cadena_mora_mora_mant")
						end if
					end if
					id_gc 						= 0
					id_im 						= 0
					if ls_tipo_cob='A' or ls_tipo_cob='E' then
						ii_mora_cobro 			= 1
						ii_inc_gastos 			= 1
					elseif ls_tipo_cob='F' then
						ii_mora_cobro 			= 0
						ii_inc_gastos 			= 0
					end if
					if ls_tipo_cob='E' then
						dw_dias_mora.reset()
						ll_dia_prox_pago		= day(ld_fecha_prox_pago)
						ld_fecha_inicial		= ld_fecha_prox_pago
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
						FOR i = 1 TO ll_max
							ll_new				= dw_dias_mora.insertrow(0)
							dw_dias_mora.scrolltorow(ll_new)
							ll_day				= ll_dia_prox_pago
							ll_month				= month(ld_fecha_inicial)
							ll_year				= year(ld_fecha_inicial)
							ll_month	++
							if (ll_month=1 and ll_dia_prox_pago>31) then
								ls_pasa			= 'S'
								ll_day			= 31
							elseif (ll_month=2 and ll_dia_prox_pago>28) then
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
						ll_tot_reg_dias				= dw_dias_mora.rowcount()
						FOR i = 1 TO ii_cantidad 
							if i <= ll_tot_reg_dias then
								if i <= ll_ctas_mora then
									ll_calc_dias		= dw_dias_mora.getitemnumber(i,'dias_mora')
									ii_dmora				= dw_dias_mora.getitemnumber(i,'suma_dias_acum')
									ld_dias_sum_mora	= dw_dias_mora.getitemnumber(i,'suma_dias')
								else
									ll_calc_dias		= 0
									ii_dmora				= 0
									ld_dias_sum_mora	= 0
								end if
							end if
							IF ld_dias_sum_mora > 5 THEN
								ii_mora_cobro 			= ld_dias_sum_mora	//(ii_dmora - (i - 1) * ll_calc_dias)
								id_im 					= id_im + gf_int_mora(ldb_tasa, ii_mora_cobro, id_valor_cuota)
								IF ld_dias_sum_mora > ll_calc_dias  THEN		//(ii_dmora - (i - 1) * ll_calc_dias)
									id_gc 				= id_gc + Round(id_valor_cuota * id_factor_gc, 0)
									ii_inc_gastos		= 1
								END IF
							ELSE
	//								ii_mora_cobro 	= 0
	//								id_im 			= 0
	//								id_gc 			= 0
							END IF	
						NEXT
						ll_mora						= ll_mora + id_im
						ll_gasto_cob				= ll_gasto_cob + id_gc
						ll_valor_total				= round(ll_cuota * id_valor_cuota,0)
						tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'gastos_adm_mora_cred',ll_gasto_cob)
						tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'valor_mora_cred',ll_valor_total)
						tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'interes_mora_cred',ll_mora)
						tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'total_cred',(ll_gasto_cob + ll_mora + ll_valor_total))

					elseif ls_tipo_cob='A' then
//						FOR i = 1 TO ii_cantidad 
//							if i > 1 then
//								il_suma_dia ++
//								ii_dmora			= ii_dmora - il_suma_dia
//							else
//								il_suma_dia		= 0
//							end if
//							IF (ii_dmora - (i - 1) * 30) > 5 THEN
//								ii_mora_cobro 		= (ii_dmora - (i - 1) * 30)
//								id_im 				= id_im + gf_int_mora(w_ingreso.tab_ingreso.tp_ci.dw_datos_ci.GetItemNumber(1,"c_tasa"), ii_mora_cobro, id_valor_cuota)
//								IF (ii_dmora - (i - 1) * 30) > 30  THEN		
//									id_gc 			= id_gc + Round(id_valor_cuota * id_factor_gc, 0)
//									ii_inc_gastos	= 1
//								END IF
//							ELSE
////								ii_mora_cobro 	= 0
////								id_im 			= 0
////								id_gc 			= 0
//							END IF	
//						NEXT
//						ll_gasto_cob				= ll_gasto_cob + id_gc
//						ll_mora						= ll_mora + id_im
//						w_ingreso.tab_ingreso.tp_ci.dw_gastos_ci.SetItem(1,"gastos_cob", ll_gasto_cob)
//						w_ingreso.tab_ingreso.tp_ci.dw_gastos_ci.SetItem(1,"mora", ll_mora)
//						w_ingreso.tab_ingreso.tp_ci.dw_detalle_ci.accepttext()
//						ll_total_monto	= w_ingreso.tab_ingreso.tp_ci.dw_detalle_ci.GetItemNumber(1,"c_subtotal_total")
//						w_ingreso.tab_ingreso.tp_ci.dw_gastos_ci.SetItem(1,"Subtotal", ll_total_monto)
//						w_ingreso.tab_ingreso.tp_ci.dw_gastos_ci.accepttext()
						
					elseif ls_tipo_cob='F' then
						id_gc 						= 0
						id_im 						= 0
						ii_mora_cobro 				= 0
						ii_inc_gastos 				= 0
						FOR i = 1 TO ll_cta_mora_m 
							IF (ii_dmora_m - (i - 1) * 365) > 5 THEN 
								ii_mora_cobro		= (ii_dmora_m - (i - 1) * 365)
								id_im 				= id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota_m)
								IF (ii_dmora_m - (i - 1) * 365) > 30 THEN 
									 id_gc 			= id_gc + Round(id_valor_cuota_m * id_factor_gc, 0)
									 ii_inc_gastos = 1
								END IF
							ELSE
//								id_gc 				= 0
//								id_im 				= 0
//								ii_mora_cobro		= 0
							END IF
						NEXT
						ll_gasto_cob				= ll_gasto_cob + id_gc
						ll_mora						= ll_mora + id_im
						ll_valor_total				= Round(lld_valor_cuota_m * gf_uf(String(today(),'dd/mm/yyyy')), 0) * ll_cta_mora_m
						tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'gastos_adm_mora_mant',ll_gasto_cob)
						tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'valor_mora_mant',ll_valor_total)
						tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'interes_mora_mant',ll_mora)
						tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'total_mant',(ll_gasto_cob + ll_mora + ll_valor_total))
					end if
				end if
			end if
//		next
//	end if
end if
end subroutine

public subroutine wf_control_marcar (string as_control);long		ll_tot_reg,ll_indi,ll_est_marcar,ll_ctas_pag_s,ll_count
String	ls_est_asignado,ls_base,ls_serie
Date		ldt_fecha,ldt_fecha_cierre
double  	ldb_numero
ll_tot_reg				= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_base				= dw_lista.getitemstring(ll_indi,'codigo')
	ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
	ldb_numero			= dw_lista.getitemnumber(ll_indi,'numero')
	ll_ctas_pag_s		= dw_lista.getitemnumber(ll_indi,'ctas_pag_s')
	ldt_fecha_cierre	= Date(dw_lista.getitemdatetime(ll_indi,'fecha_prox_llamado'))
	ldt_fecha				= date(gdt_fec_sistema)
	ls_est_asignado	= dw_lista.getitemstring(ll_indi,'asignado_cobranza')
	if ldt_fecha > ldt_fecha_cierre or isnull(ldt_fecha_cierre) then
		if ll_est_marcar=0 then
			if as_control='M' then 
				dw_lista.setitem(ll_indi,'est_reg',0)
//				SELECT	Count("AT_GESTION"."USUARIO_ASIGNADO")  
//				INTO 		:ll_count  
//				FROM 		"AT_GESTION"  
//				WHERE  ( "AT_GESTION"."BASE" = :ls_base ) AND  
//						 ( "AT_GESTION"."SERIE" = :ls_serie ) AND  
//						 ( "AT_GESTION"."NUMERO" = :ll_numero )   
//				USING		sqlca;
//				if ll_count > 0 then
//					if ll_ctas_pag_s < 12 then
//						dw_lista.setitem(ll_indi,'est_reg',1)
//					end if
//				end if	
			end if
		end if
		if as_control='D' then dw_lista.setitem(ll_indi,'est_reg',1)
	end if
next
dw_lista.accepttext()
end subroutine

on w_general_cobranza_telefonica.create
this.cb_1=create cb_1
this.pb_exportar=create pb_exportar
this.pb_ordenar=create pb_ordenar
this.pb_filtrar=create pb_filtrar
this.pb_imprimir=create pb_imprimir
this.st_4=create st_4
this.ddplb_permanencia=create ddplb_permanencia
this.st_3=create st_3
this.pb_6=create pb_6
this.sle_marca=create sle_marca
this.st_1=create st_1
this.pb_ok=create pb_ok
this.em_fec_ini=create em_fec_ini
this.st_10=create st_10
this.p_ini=create p_ini
this.cb_actualizar=create cb_actualizar
this.cb_ctacte2=create cb_ctacte2
this.dw_dias_mora=create dw_dias_mora
this.cb_pie_parcelado=create cb_pie_parcelado
this.dw_parque=create dw_parque
this.st_16=create st_16
this.cb_historico=create cb_historico
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
this.tab_cobranza=create tab_cobranza
this.dw_lista=create dw_lista
this.st_shift=create st_shift
this.cb_eliminar_mov=create cb_eliminar_mov
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.pb_exportar,&
this.pb_ordenar,&
this.pb_filtrar,&
this.pb_imprimir,&
this.st_4,&
this.ddplb_permanencia,&
this.st_3,&
this.pb_6,&
this.sle_marca,&
this.st_1,&
this.pb_ok,&
this.em_fec_ini,&
this.st_10,&
this.p_ini,&
this.cb_actualizar,&
this.cb_ctacte2,&
this.dw_dias_mora,&
this.cb_pie_parcelado,&
this.dw_parque,&
this.st_16,&
this.cb_historico,&
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
this.tab_cobranza,&
this.dw_lista,&
this.st_shift,&
this.cb_eliminar_mov,&
this.gb_1}
end on

on w_general_cobranza_telefonica.destroy
destroy(this.cb_1)
destroy(this.pb_exportar)
destroy(this.pb_ordenar)
destroy(this.pb_filtrar)
destroy(this.pb_imprimir)
destroy(this.st_4)
destroy(this.ddplb_permanencia)
destroy(this.st_3)
destroy(this.pb_6)
destroy(this.sle_marca)
destroy(this.st_1)
destroy(this.pb_ok)
destroy(this.em_fec_ini)
destroy(this.st_10)
destroy(this.p_ini)
destroy(this.cb_actualizar)
destroy(this.cb_ctacte2)
destroy(this.dw_dias_mora)
destroy(this.cb_pie_parcelado)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.cb_historico)
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
destroy(this.tab_cobranza)
destroy(this.dw_lista)
destroy(this.st_shift)
destroy(this.cb_eliminar_mov)
destroy(this.gb_1)
end on

event open;Long	ll_tot_reg,ll_indi

SetPointer(HourGlass!)
gf_centrar(w_general_cobranza_telefonica)
SELECT "TASA"."GASTO_COB_MORA","TASA"."TASA_INT_UF" INTO :id_factor_gc,:id_tasa_mant FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
//id_factor_gc					= f_factor_gasto_cobranza()
il_marca_ini						= 1
st_shift.visible					= false
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
if gs_conexion	= "Parque El Prado" then
	il_parque	= 1
elseif gs_conexion = 'Parque La Foresta' then
	il_parque	= 11
elseif gs_conexion = "Parque Concepción" then
	il_parque	= 801
elseif gs_conexion = 'Parque Memorial PARK' then
	il_parque	= 104	
end if
dw_parque.setitem(1,'cod_parque',il_parque)
dw_parque.accepttext()
em_fec_ini.text					= string(date(gdt_fec_sistema),'dd/mm/yyyy')
//ll_tot_reg							= dw_lista.retrieve(date(gdt_fec_sistema),il_parque) //gdt_fec_sistema
tab_cobranza.visible				= false
//if ll_tot_reg>0 then
//	for ll_indi=1 to ll_tot_reg
//	//	ll_est_marcar	= dw_lista.getitemnumber(ll_indi,'est_activo')
//		dw_lista.setitem(ll_indi,'est_reg',1)
//	next
//end if
if gs_depto='G' then 
	cb_genera_lista.enabled								= false
	tab_cobranza.tabpage_4.cb_grabar.enabled	= false
else
	cb_genera_lista.enabled								= true
	tab_cobranza.tabpage_4.cb_grabar.enabled	= true
end if
ddplb_permanencia.text									= '3'
SetPointer(Arrow!)
em_fec_ini.setfocus()
end event

event mousemove;st_shift.visible	= false
end event

type cb_1 from commandbutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 293
integer y = 2220
integer width = 379
integer height = 100
integer taborder = 180
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cartera Cobr."
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;if isvalid(w_formulas_cartera_cob) then close(w_formulas_cartera_cob)
OpenWithParm(w_formulas_cartera_cob,'V')
end event

type pb_exportar from picturebutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 3186
integer y = 48
integer width = 137
integer height = 116
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_ordenar from picturebutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 3333
integer y = 48
integer width = 137
integer height = 116
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
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

type pb_filtrar from picturebutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 3474
integer y = 48
integer width = 137
integer height = 116
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;long 		ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string 	ls_texto
setnull (gs_formula)
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
ll_filas				= dw_lista.rowcount()
gs_formula 			= dw_lista.describe("datawindow.syntax")
ll_largototal			= len(gs_formula)
ll_posini				= Pos(gs_formula, "filter") + 8
ll_posfin				= len("~nfilter~n")
ls_texto				= mid(gs_formula, ll_posini, ll_posfin)
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

type pb_imprimir from picturebutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 3616
integer y = 48
integer width = 137
integer height = 116
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event ue_mousemove;st_shift.visible				= false

end event

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type st_4 from statictext within w_general_cobranza_telefonica
integer x = 2053
integer y = 72
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "meses"
boolean focusrectangle = false
end type

type ddplb_permanencia from dropdownpicturelistbox within w_general_cobranza_telefonica
integer x = 1842
integer y = 56
integer width = 187
integer height = 352
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"1","2","3","4","5","6","7","8","9","10"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2,3,4,5,6,7,8,9,10}
long picturemaskcolor = 536870912
end type

type st_3 from statictext within w_general_cobranza_telefonica
integer x = 1518
integer y = 72
integer width = 315
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Permanencia"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_6 from picturebutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 2318
integer y = 2220
integer width = 105
integer height = 92
integer taborder = 170
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "check_si.bmp"
string disabledname = "Lupa.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;long		ll_row,ll_tot_reg,ll_rango_ini,ll_rango_fin,ll_rango,ll_indi

dw_lista.accepttext()
ll_tot_reg							= dw_lista.RowCount()
if long(sle_marca.text)>0 and ll_tot_reg > 0 then
	ll_rango							= long(sle_marca.text)
	ll_rango_fin						= (il_marca_ini + ll_rango) - 1
	if ll_rango_fin > ll_tot_reg then ll_rango_fin=ll_tot_reg
	for ll_indi=il_marca_ini to ll_rango_fin
		dw_lista.setitem(ll_indi,'est_reg',0)
	next
	dw_lista.accepttext()
	il_marca_ini						= ll_rango_fin + 1
end if
end event

type sle_marca from singlelineedit within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 2062
integer y = 2224
integer width = 247
integer height = 92
integer taborder = 160
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

event modified;pb_6.triggerevent (clicked!)
end event

type st_1 from statictext within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 1810
integer y = 2240
integer width = 233
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "# Marcar"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_shift.visible				= false
end event

type pb_ok from picturebutton within w_general_cobranza_telefonica
integer x = 2258
integer y = 24
integer width = 178
integer height = 156
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_meses
Date		ld_fecha_ult_pago

SetPointer(HourGlass!)
dw_lista.reset()
dw_parque.accepttext()
il_parque													= dw_parque.getitemnumber(1,'cod_parque')
ld_fecha_ult_pago										= date(em_fec_ini.text)
ll_meses													= long(ddplb_permanencia.text)
if isnull(il_parque) then
	messagebox("Advertencia","Debe Seleccionar Parque")
	dw_parque.setfocus()
elseif isnull(ld_fecha_ult_pago) or em_fec_ini.text='00/00/0000' then
	messagebox("Advertencia","Debe Ingresar Fecha Tope Ultimo Pago")
	em_fec_ini.setfocus()
elseif ll_meses=0 or isnull(ll_meses) then
	messagebox("Advertencia","Debe Seleccionar Meses de Permanencia")
	ddplb_permanencia.setfocus()
else
	gs_formula											= ''
	dw_lista.SETfilter(gs_formula)
	dw_lista.filter()
	ll_tot_reg											= dw_lista.retrieve(date(gdt_fec_sistema),il_parque)
	tab_cobranza.visible								= false
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			dw_lista.setitem(ll_indi,'est_reg',1)
			dw_lista.setitem(ll_indi,'fecha_tope_digitada',ld_fecha_ult_pago)
		next
		dw_lista.accepttext()
	end if
	if gs_depto='G' then 
		cb_genera_lista.enabled								= false
		tab_cobranza.tabpage_4.cb_grabar.enabled	= false
	else
		cb_genera_lista.enabled								= true
		tab_cobranza.tabpage_4.cb_grabar.enabled	= true
	end if
end if
SetPointer(Arrow!)
dw_lista.setfocus()
end event

type em_fec_ini from editmask within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 375
integer y = 60
integer width = 293
integer height = 88
integer taborder = 10
integer textsize = -8
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

event modified;dw_lista.reset()
end event

type st_10 from statictext within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 18
integer y = 72
integer width = 352
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Ult.Pago"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_ini from picture within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 677
integer y = 60
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf
dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text	= string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha 			= em_fec_ini.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_fec_ini.text	= Message.StringParm
END IF
end event

type cb_actualizar from commandbutton within w_general_cobranza_telefonica
boolean visible = false
integer x = 1728
integer y = 2468
integer width = 119
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Actuali&zar Pagos"
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

type cb_ctacte2 from commandbutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2025
integer y = 2540
integer width = 407
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;Long	ll_fila

tab_cobranza.tabpage_1.dw_contrato.accepttext()
if tab_cobranza.tabpage_1.dw_contrato.rowcount()>0 and tab_cobranza.tabpage_1.dw_contrato.getrow()>0 then
	ll_fila						= tab_cobranza.tabpage_1.dw_contrato.getrow()
	gs_base 						= tab_cobranza.tabpage_1.dw_contrato.GetItemString(ll_fila, "cadena_codigo")
	gs_serie 					= tab_cobranza.tabpage_1.dw_contrato.GetItemString(ll_fila, "cadena_serie")
	gi_numero 					= tab_cobranza.tabpage_1.dw_contrato.GetItemNumber(ll_fila, "cadena_numero")
	gi_rut 						= tab_cobranza.tabpage_1.dw_contrato.GetItemNumber(ll_fila, "cliente_rut")
	gs_apellido_paterno		= tab_cobranza.tabpage_1.dw_contrato.GetItemString(ll_fila, "cliente_a_paterno")
	gs_apellido_materno		= tab_cobranza.tabpage_1.dw_contrato.GetItemString(ll_fila, "cliente_a_materno")
	gs_nombres					= tab_cobranza.tabpage_1.dw_contrato.GetItemString(ll_fila, "cliente_nombre")
	gs_dv							= tab_cobranza.tabpage_1.dw_contrato.GetItemString(ll_fila, "cliente_dv")
	gs_estado					= tab_cobranza.tabpage_1.dw_contrato.GetItemString(ll_fila, "cadena_estado")
	if not isnull(gs_base) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O" 	// Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
		END CHOOSE
	end if
end if
end event

type dw_dias_mora from datawindow within w_general_cobranza_telefonica
boolean visible = false
integer x = 105
integer y = 2448
integer width = 1563
integer height = 416
string title = "none"
string dataobject = "dwe_lista_calculo_dias_mora_credito"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
end type

event doubleclicked;dw_dias_mora.print()
end event

type cb_pie_parcelado from commandbutton within w_general_cobranza_telefonica
integer x = 1189
integer y = 2220
integer width = 334
integer height = 100
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Pie Parcelado"
end type

event clicked;Long		ll_cuotas_pactadas_pie
String	ls_uso,ls_string,ls_moneda,ls_base,ls_serie
Double	lld_pie,ldb_numero
if il_row>0 then
	ll_cuotas_pactadas_pie	= dw_lista.getitemnumber(il_row,'ctas_pactadas_pie')
	lld_pie						= dw_lista.getitemnumber(il_row,'pie')
	if ll_cuotas_pactadas_pie>0 and lld_pie>0 then
		ls_moneda				= dw_lista.getitemstring(il_row,'moneda')
		ls_uso					= trim(dw_lista.getitemstring(il_row,'canal'))
		ls_base					= dw_lista.getitemstring(il_row,'codigo')
		ls_serie					= dw_lista.getitemstring(il_row,'serie')
		ldb_numero				= dw_lista.getitemnumber(il_row,'numero')
		ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+string(lld_pie)+'~t'+ls_uso+'~t'+'C'+'~t'+ls_moneda
		if not isnull(ls_uso) and ls_uso<>'' and not isnull(ls_moneda) then openwithparm(w_ingreso_pie_pactado,ls_string)
	else
		messagebox("Advertencia","Contrato No Registra PIE Parcelado")
	end if
end if
end event

type dw_parque from datawindow within w_general_cobranza_telefonica
integer x = 942
integer y = 60
integer width = 594
integer height = 96
integer taborder = 20
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()

end event

type st_16 from statictext within w_general_cobranza_telefonica
integer x = 763
integer y = 72
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

type cb_historico from commandbutton within w_general_cobranza_telefonica
event ue_mousemove pbm_dwnmousemove
integer x = 1522
integer y = 2220
integer width = 279
integer height = 100
integer taborder = 150
integer textsize = -8
integer weight = 400
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

type cb_genera_lista from commandbutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 2220
integer width = 256
integer height = 100
integer taborder = 120
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

if not isnull(gs_cartera) and gs_cartera<>'' and  not isnull(gl_ind_cart) and gl_ind_cart>0 then
	ll_tot_reg	= dw_lista.rowcount()
	ll_fila = dw_lista.Find("est_reg = 0",1, ll_tot_reg)
	if ll_fila>0 then 
		open(w_generar_lista_cliente_gestion_cobranza)
	else
		messagebox("Advertencia","No registra Contrato Seleccionado")
	end if
else
	messagebox("Advertencia","Debe Filtrar Cartera Cobranza")
end if
end event

type cb_grabar_formula from commandbutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 965
integer y = 2220
integer width = 229
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Formula"
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;open(w_formulas)
end event

type pb_1 from picturebutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 3095
integer y = 2220
integer width = 105
integer height = 92
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
long		ll_row,ll_tot_reg

dw_lista.accepttext()
ll_tot_reg	= dw_lista.RowCount()
if long(trim(sle_1.text))>0 then
	dw_lista.scrolltorow(1)
	ls_rut		= trim(sle_1.text)
	ls_string	= "numero="+trim(ls_rut)
	ll_row 		= dw_lista.Find(ls_string, 1, ll_tot_reg )
	IF ll_row > 0 THEN
		dw_lista.ScrollToRow( ll_row )
		dw_lista.setfocus()
	ELSE
		MessageBox("Advertencia", "Nº Contrato Inexistente")
	END IF
end if
end event

type sle_1 from singlelineedit within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 2775
integer y = 2224
integer width = 311
integer height = 92
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

type st_2 from statictext within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 2469
integer y = 2240
integer width = 293
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Nº Contrato"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_shift.visible				= false
end event

type pb_2 from picturebutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 3264
integer y = 2228
integer width = 101
integer height = 84
integer taborder = 180
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

type pb_3 from picturebutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 3369
integer y = 2228
integer width = 101
integer height = 84
integer taborder = 190
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

type pb_4 from picturebutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 3474
integer y = 2228
integer width = 101
integer height = 84
integer taborder = 200
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

type pb_5 from picturebutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 3579
integer y = 2228
integer width = 101
integer height = 84
integer taborder = 210
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

type cb_ctacte from commandbutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 731
integer y = 2220
integer width = 238
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&ta.Cte."
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

type cb_cerrar from commandbutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 3744
integer y = 2220
integer width = 242
integer height = 100
integer taborder = 220
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

type gb_2 from groupbox within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 3241
integer y = 2180
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

type tab_cobranza from uo_cobranza within w_general_cobranza_telefonica
integer x = 800
integer y = 360
integer width = 2523
integer height = 1584
integer taborder = 100
integer textsize = -9
string facename = "Verdana"
boolean raggedright = false
boolean boldselectedtext = true
alignment alignment = center!
end type

type dw_lista from datawindow within w_general_cobranza_telefonica
event ue_mousemove pbm_dwnmousemove
integer x = 32
integer y = 204
integer width = 3954
integer height = 1972
integer taborder = 90
string dataobject = "dwv_listado_mora_credito_mantencion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_shift.visible	= true
end event

event clicked;string	ls_columna,ls_tipo_cob,ls_base,ls_serie,ls_pasa='S'
Long		ll_folio,ll_estado_reg,ll_ini,ll_fin,ll_indi,ll_count,ll_ctas_pag_s,ll_est_reg
Date		ld_fecha_prox_llamado
double	ldb_numero
ls_columna	= dwo.name

if ls_columna='t_marcar_todo' then
	if dw_lista.rowcount()>0 then
		SetPointer(HourGlass!)
		if dw_lista.object.t_marcar_todo.text='Seleccionar Todo' then
			wf_control_marcar('M')
			dw_lista.object.t_marcar_todo.text='Desmarcar Todo'
		else
			wf_control_marcar('D')
			dw_lista.object.t_marcar_todo.text='Seleccionar Todo'
		end if
		SetPointer(Arrow!)
	end if

elseif ls_columna='t_cobranza' or ls_columna='t_rojo' or ls_columna='t_texto_rojo' then
	if dw_lista.object.t_cobranza.text='Mostrar Solo Cobranza' then
		gs_formula	= "fecha > fecha_prox_llamado and asignado_cobranza <> '"+"S"+"'"
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
		gs_formula	= "asignado_cobranza = '"+"S"+"'"
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
	il_row			= row
	ls_base			= dw_lista.getitemstring(il_row,'codigo')
	ls_serie			= dw_lista.getitemstring(il_row,'serie')
	ldb_numero		= dw_lista.getitemnumber(il_row,'numero')
	ll_ctas_pag_s	= dw_lista.getitemnumber(il_row,'ctas_pag_s')
//	if ls_columna='est_reg' then
//		ll_est_reg	= dw_lista.getitemnumber(il_row,'est_reg')
//		SELECT	Count("AT_GESTION"."USUARIO_ASIGNADO")  
//		INTO 		:ll_count  
//		FROM 		"AT_GESTION"  
//		WHERE  ( "AT_GESTION"."BASE" = :ls_base ) AND  
//				 ( "AT_GESTION"."SERIE" = :ls_serie ) AND  
//				 ( "AT_GESTION"."NUMERO" = :ll_numero )   
//		USING		sqlca;
//		if ll_count > 0 then
//			if ll_ctas_pag_s < 12 then
//				messagebox("Advertencia","No es posible Asignar, Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###,##0')+" está en Atención Terreno")
//				dw_lista.setitem(il_row,'est_reg',1)
//				dw_lista.setitem(il_row,'c_estado_terreno','S')
//				dw_lista.accepttext()
//				ls_pasa	= 'N'
//			else
//				dw_lista.setitem(il_row,'est_reg',ll_est_reg)
//				dw_lista.setitem(il_row,'c_estado_terreno','N')
//			end if
//		else
//			dw_lista.setitem(il_row,'est_reg',ll_est_reg)
//			dw_lista.setitem(il_row,'c_estado_terreno','N')
//		end if
//	
//	end if
	if ls_pasa='S' then
		if ls_columna='est_reg' and (KeyDown(65) or KeyDown(KeyShift!)) then
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
		gi_rut 						= dw_lista.GetItemNumber(il_row, "rut")
		gs_base						= dw_lista.getitemstring(il_row, "codigo")
		gs_serie						= dw_lista.getitemstring(il_row, "serie")
		gi_numero					= dw_lista.getitemnumber(il_row, "numero")
		tab_cobranza.tabpage_1.dw_contrato.retrieve(gi_rut)
		tab_cobranza.tabpage_1.dw_cliente.retrieve(gi_rut)
		wf_cargar_dw_contrato()
		tab_cobranza.tabpage_2.dw_cobranza.retrieve(gi_rut)
		tab_cobranza.tabpage_2.dw_carta.retrieve(gi_rut)
		tab_cobranza.tabpage_2.dw_publico.retrieve(gi_rut)
		tab_cobranza.tabpage_3.dw_detalle_cuotas.retrieve(gs_serie,gi_numero,gs_base)
		tab_cobranza.tabpage_3.dw_detalle_mantencion.retrieve(gs_serie,gi_numero,gs_base)
		tab_cobranza.tabpage_4.dw_cliente2.retrieve(gi_rut)
		if tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.retrieve(gi_rut)=0 then
			tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.insertrow(0)
			tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.setitem(1,'glosa','NO REGISTRA COBRANZA TELEFONICA')
		end if
		tab_cobranza.tabpage_4.dw_ingreso.reset()
		tab_cobranza.tabpage_4.dw_ingreso.insertrow(0)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'usuario',gs_user)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'fecha',gdt_fec_sistema)
		tab_cobranza.tabpage_4.em_fecha_prox.text						= string(RelativeDate(date(gdt_fec_sistema), 15),"dd/mm/yyyy")
		if tab_cobranza.tabpage_3.dw_detalle_total.retrieve(gs_serie,gi_numero,gs_base)>0 then
			ll_folio					= tab_cobranza.tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
			ls_tipo_cob				= tab_cobranza.tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
			tab_cobranza.tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
		else
			tab_cobranza.tabpage_3.dw_detalle_pagos.reset()
		end if
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
		tab_cobranza.visible													= true
	end if
end if
end event

event rowfocuschanged;String	ls_tipo_cob,ls_asignado
Long		ll_folio,ll_estado_reg,ll_ini,ll_fin,ll_indi
Date		ld_fecha_prox_llamado

if this.getrow()>0 then 
	if (KeyDown(65) or KeyDown(KeyShift!)) then
		il_row			= this.getrow()
		ll_estado_reg	= this.getitemnumber(il_row,'est_reg')
		ls_asignado		= this.getitemString(il_row,'asignado_cobranza')
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
	gi_rut 																= dw_lista.GetItemNumber(il_row, "rut")
	gs_base																= dw_lista.getitemstring(il_row, "codigo")
	gs_serie																= dw_lista.getitemstring(il_row, "serie")
	gi_numero															= dw_lista.getitemnumber(il_row, "numero")
	tab_cobranza.tabpage_1.dw_contrato.retrieve(gi_rut)
	tab_cobranza.tabpage_1.dw_cliente.retrieve(gi_rut)
	wf_cargar_dw_contrato()
	tab_cobranza.tabpage_2.dw_cobranza.retrieve(gi_rut)
	tab_cobranza.tabpage_2.dw_carta.retrieve(gi_rut)
	tab_cobranza.tabpage_2.dw_publico.retrieve(gi_rut)
	tab_cobranza.tabpage_3.dw_detalle_cuotas.retrieve(gs_serie,gi_numero,gs_base)
	tab_cobranza.tabpage_3.dw_detalle_mantencion.retrieve(gs_serie,gi_numero,gs_base)
	tab_cobranza.tabpage_4.dw_cliente2.retrieve(gi_rut)
	if tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.retrieve(gi_rut)=0 then
		tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.insertrow(0)
		tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.setitem(1,'glosa','NO REGISTRA COBRANZA TELEFONICA')
	end if
	tab_cobranza.tabpage_4.dw_ingreso.reset()
	tab_cobranza.tabpage_4.dw_ingreso.insertrow(0)
	tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'usuario',gs_user)
	tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'fecha',gdt_fec_sistema)
	tab_cobranza.tabpage_4.em_fecha_prox.text						= string(RelativeDate(date(gdt_fec_sistema), 15),"dd/mm/yyyy")
	if tab_cobranza.tabpage_3.dw_detalle_total.retrieve(gs_serie,gi_numero,gs_base)>0 then
		ll_folio															= tab_cobranza.tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
		ls_tipo_cob														= tab_cobranza.tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
		tab_cobranza.tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
	else
		tab_cobranza.tabpage_3.dw_detalle_pagos.reset()
	end if
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
	tab_cobranza.visible													= true
end if
end event

event itemfocuschanged;//String	ls_columna,ls_base,ls_serie
//Long		ll_fila,ll_numero,ll_ctas_pag_s,ll_count,ll_est_reg
//
//ls_columna				= dwo.name //dw_lista.GetColumnName()
//ll_fila					= this.getrow()
//if ll_fila > 0 then 
//	ll_est_reg			= dw_lista.getitemnumber(ll_fila,'est_reg')
//	if ll_est_reg=0 then
//		ls_base			= dw_lista.getitemstring(ll_fila,'codigo')
//		ls_serie			= dw_lista.getitemstring(ll_fila,'serie')
//		ll_numero		= dw_lista.getitemnumber(ll_fila,'numero')
//		ll_ctas_pag_s	= dw_lista.getitemnumber(ll_fila,'vista_listado_mora_cred_mant_ctas_pag_s')
//		SELECT	Count("AT_GESTION"."USUARIO_ASIGNADO")  
//		INTO 		:ll_count  
//		FROM 		"AT_GESTION"  
//		WHERE  ( "AT_GESTION"."BASE" = :ls_base ) AND  
//				 ( "AT_GESTION"."SERIE" = :ls_serie ) AND  
//				 ( "AT_GESTION"."NUMERO" = :ll_numero )   
//		USING		sqlca;
//		if ll_count > 0 then
//			if ll_ctas_pag_s < 12 then
//				messagebox("Advertencia","No es posible Asignar, Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###,##0')+" está en Atención Terreno")
//				dw_lista.setitem(ll_fila,'est_reg',1)
//				dw_lista.setitem(ll_fila,'c_estado_terreno','S')
//				dw_lista.accepttext()
//				dw_lista.setcolumn('numero')
//			end if
//		end if
//	end if
//end if
end event

type st_shift from statictext within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 389
integer y = 144
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

type cb_eliminar_mov from commandbutton within w_general_cobranza_telefonica
event ue_mousemove pbm_mousemove
integer x = 2848
integer y = 64
integer width = 247
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = easteuropecharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial CE"
string text = "Eli&m Gru"
end type

event ue_mousemove;st_shift.visible				= false
end event

event clicked;long	ll_resp,ll_codigo_grupo

ll_resp	= MessageBox("Eliminar","Está Seguro Eliminar Todas las Llamadas Gestionadas",Exclamation!, YesNo!, 2)
IF ll_resp = 1 THEN
	COMMIT USING Trans_1;
	DECLARE	x1 CURSOR FOR  
	SELECT 	"GESTION_LISTA"."CODIGO"  
	FROM 	"GESTION_LISTA"  
	WHERE 	"GESTION_LISTA"."ESTADO" <> 'P'   
	USING		sqlca;
	open x1;
	DO WHILE sqlca.sqlcode=0
		if sqlca.sqlcode=0 then
			fetch x1 into :ll_codigo_grupo;
			if ll_codigo_grupo>0 then
				DELETE FROM "GESTION_LISTA"  
				WHERE 			"GESTION_LISTA"."CODIGO" = :ll_codigo_grupo   
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

type gb_1 from groupbox within w_general_cobranza_telefonica
integer x = 3159
integer width = 617
integer height = 184
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

