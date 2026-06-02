forward
global type w_asignar_envio_carta from window
end type
type cb_limpiar from commandbutton within w_asignar_envio_carta
end type
type dw_especial from datawindow within w_asignar_envio_carta
end type
type cb_cargar_archivo from commandbutton within w_asignar_envio_carta
end type
type cb_ctacte2 from commandbutton within w_asignar_envio_carta
end type
type cb_actualizar from commandbutton within w_asignar_envio_carta
end type
type st_click from statictext within w_asignar_envio_carta
end type
type cb_sacar from commandbutton within w_asignar_envio_carta
end type
type dw_dias_mora from datawindow within w_asignar_envio_carta
end type
type p_ini from picture within w_asignar_envio_carta
end type
type em_fec_ini from editmask within w_asignar_envio_carta
end type
type st_9 from statictext within w_asignar_envio_carta
end type
type tab_carta from uo_cobranza_carta within w_asignar_envio_carta
end type
type tab_carta from uo_cobranza_carta within w_asignar_envio_carta
end type
type cb_marcar from commandbutton within w_asignar_envio_carta
end type
type cb_1 from commandbutton within w_asignar_envio_carta
end type
type cb_asignar from commandbutton within w_asignar_envio_carta
end type
type cb_ctacte from commandbutton within w_asignar_envio_carta
end type
type st_fondo from statictext within w_asignar_envio_carta
end type
type hpb_1 from hprogressbar within w_asignar_envio_carta
end type
type st_porc from statictext within w_asignar_envio_carta
end type
type cb_filtro from commandbutton within w_asignar_envio_carta
end type
type cb_imprimir from commandbutton within w_asignar_envio_carta
end type
type cb_exportar from commandbutton within w_asignar_envio_carta
end type
type cb_ordenar from commandbutton within w_asignar_envio_carta
end type
type pb_ok from picturebutton within w_asignar_envio_carta
end type
type cb_cerrar from commandbutton within w_asignar_envio_carta
end type
type dw_lista from datawindow within w_asignar_envio_carta
end type
type gb_1 from groupbox within w_asignar_envio_carta
end type
type dw_select from datawindow within w_asignar_envio_carta
end type
end forward

global type w_asignar_envio_carta from window
integer width = 3730
integer height = 2228
boolean titlebar = true
string title = "Confeccionar Envio Carta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_limpiar cb_limpiar
dw_especial dw_especial
cb_cargar_archivo cb_cargar_archivo
cb_ctacte2 cb_ctacte2
cb_actualizar cb_actualizar
st_click st_click
cb_sacar cb_sacar
dw_dias_mora dw_dias_mora
p_ini p_ini
em_fec_ini em_fec_ini
st_9 st_9
tab_carta tab_carta
cb_marcar cb_marcar
cb_1 cb_1
cb_asignar cb_asignar
cb_ctacte cb_ctacte
st_fondo st_fondo
hpb_1 hpb_1
st_porc st_porc
cb_filtro cb_filtro
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_ordenar cb_ordenar
pb_ok pb_ok
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
dw_select dw_select
end type
global w_asignar_envio_carta w_asignar_envio_carta

type variables
Long		il_suma_dia,il_row,il_row_aux
Double	id_factor_gc,id_tasa_mant

end variables

forward prototypes
public subroutine wf_pos_otros_cttos ()
public subroutine wf_pos_promesa ()
public subroutine wf_pos_contrato_isa ()
public subroutine wf_cargar_dw_contrato ()
public subroutine wf_calcular_interes (string as_cobro, string as_base, string as_serie, double al_numero, long al_fila)
public subroutine wf_calcular_interes_ctto (string as_cobro, string as_base, string as_serie, double al_numero, long al_fila)
end prototypes

public subroutine wf_pos_otros_cttos ();tab_carta.tabpage_3.st_6.x									= 27
tab_carta.tabpage_3.st_6.y									= 4
tab_carta.tabpage_3.st_6.width							= 850
tab_carta.tabpage_3.st_6.height							= 56
tab_carta.tabpage_3.dw_detalle_total.x					= 18
tab_carta.tabpage_3.dw_detalle_total.y					= 60
tab_carta.tabpage_3.dw_detalle_total.width			= 2277
tab_carta.tabpage_3.dw_detalle_total.height			= 412

tab_carta.tabpage_3.st_7.x									= 27
tab_carta.tabpage_3.st_7.y									= 480
tab_carta.tabpage_3.st_7.width							= 850
tab_carta.tabpage_3.st_7.height							= 56
tab_carta.tabpage_3.dw_detalle_cuotas.x				= 18
tab_carta.tabpage_3.dw_detalle_cuotas.y				= 536
tab_carta.tabpage_3.dw_detalle_cuotas.width			= 2277
tab_carta.tabpage_3.dw_detalle_cuotas.height			= 412

tab_carta.tabpage_3.st_3.x									= 27
tab_carta.tabpage_3.st_3.y									= 956
tab_carta.tabpage_3.st_3.width							= 1001
tab_carta.tabpage_3.st_3.height							= 56
tab_carta.tabpage_3.dw_detalle_pagos.x					= 18
tab_carta.tabpage_3.dw_detalle_pagos.y					= 1012
tab_carta.tabpage_3.dw_detalle_pagos.width			= 2277
tab_carta.tabpage_3.dw_detalle_pagos.height			= 412
end subroutine

public subroutine wf_pos_promesa ();tab_carta.tabpage_3.st_6.x									= 27
tab_carta.tabpage_3.st_6.y									= 4
tab_carta.tabpage_3.st_6.width							= 850
tab_carta.tabpage_3.st_6.height							= 56
tab_carta.tabpage_3.dw_detalle_total.x					= 18
tab_carta.tabpage_3.dw_detalle_total.y					= 60
tab_carta.tabpage_3.dw_detalle_total.width			= 2277
tab_carta.tabpage_3.dw_detalle_total.height			= 292

tab_carta.tabpage_3.st_7.x									= 27
tab_carta.tabpage_3.st_7.y									= 364
tab_carta.tabpage_3.st_7.width							= 850
tab_carta.tabpage_3.st_7.height							= 56
tab_carta.tabpage_3.dw_detalle_cuotas.x				= 18
tab_carta.tabpage_3.dw_detalle_cuotas.y				= 420
tab_carta.tabpage_3.dw_detalle_cuotas.width			= 2277
tab_carta.tabpage_3.dw_detalle_cuotas.height			= 292

tab_carta.tabpage_3.st_8.x									= 27
tab_carta.tabpage_3.st_8.y									= 724
tab_carta.tabpage_3.st_8.width							= 850
tab_carta.tabpage_3.st_8.height							= 56
tab_carta.tabpage_3.dw_detalle_mantencion.x			= 18
tab_carta.tabpage_3.dw_detalle_mantencion.y			= 780
tab_carta.tabpage_3.dw_detalle_mantencion.width		= 2277
tab_carta.tabpage_3.dw_detalle_mantencion.height	= 292

tab_carta.tabpage_3.st_3.x									= 27
tab_carta.tabpage_3.st_3.y									= 1084
tab_carta.tabpage_3.st_3.width							= 1001
tab_carta.tabpage_3.st_3.height							= 56
tab_carta.tabpage_3.dw_detalle_pagos.x					= 18
tab_carta.tabpage_3.dw_detalle_pagos.y					= 1140
tab_carta.tabpage_3.dw_detalle_pagos.width			= 2277
tab_carta.tabpage_3.dw_detalle_pagos.height			= 292
end subroutine

public subroutine wf_pos_contrato_isa ();tab_carta.tabpage_3.st_6.x									= 27
tab_carta.tabpage_3.st_6.y									= 4
tab_carta.tabpage_3.st_6.width							= 850
tab_carta.tabpage_3.st_6.height							= 56
tab_carta.tabpage_3.dw_detalle_total.x					= 18
tab_carta.tabpage_3.dw_detalle_total.y					= 60
tab_carta.tabpage_3.dw_detalle_total.width			= 2277
tab_carta.tabpage_3.dw_detalle_total.height			= 412

tab_carta.tabpage_3.st_8.x									= 27
tab_carta.tabpage_3.st_8.y									= 480
tab_carta.tabpage_3.st_8.width							= 850
tab_carta.tabpage_3.st_8.height							= 56
tab_carta.tabpage_3.dw_detalle_mantencion.x			= 18
tab_carta.tabpage_3.dw_detalle_mantencion.y			= 536
tab_carta.tabpage_3.dw_detalle_mantencion.width		= 2277
tab_carta.tabpage_3.dw_detalle_mantencion.height	= 412

tab_carta.tabpage_3.st_3.x									= 27
tab_carta.tabpage_3.st_3.y									= 956
tab_carta.tabpage_3.st_3.width							= 1001
tab_carta.tabpage_3.st_3.height							= 56
tab_carta.tabpage_3.dw_detalle_pagos.x					= 18
tab_carta.tabpage_3.dw_detalle_pagos.y					= 1012
tab_carta.tabpage_3.dw_detalle_pagos.width			= 2277
tab_carta.tabpage_3.dw_detalle_pagos.height			= 412
end subroutine

public subroutine wf_cargar_dw_contrato ();Long		ll_tot_reg_ctto,ll_indi_ctto,ll_mora_cred,ll_mora_mant,ll_dias_mora_cred,ll_dias_mora_mant,&
			ii_mora_cobro,ii_inc_gastos,i,ll_valor_total,ll_cta_pag_s,ll_cta_pag_m,ll_plazo,ll_cta_pag_la,&
			ll_cta_pag_isa
String	ls_base,ls_serie,ls_moneda,ls_estado_comi
Double	lld_tasa,lld_valor_cuota,lld_tasa_peso,lld_valor_cuota_peso,id_gc,id_im,lld_valor_cuota_m,&
			id_monto,ll_numero

SetPointer(HourGlass!)
ll_tot_reg_ctto		= tab_carta.tabpage_1.dw_contrato.rowcount()
for ll_indi_ctto=1 to ll_tot_reg_ctto
	ls_base				= tab_carta.tabpage_1.dw_contrato.getitemstring(ll_indi_ctto,'cadena_codigo')
	ls_serie				= tab_carta.tabpage_1.dw_contrato.getitemstring(ll_indi_ctto,'cadena_serie')
	ll_numero			= tab_carta.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_numero')
	ll_mora_cred		= tab_carta.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_mora_mora_cred')
	ll_mora_mant		= tab_carta.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_mora_mora_mant')
	ll_dias_mora_cred	= tab_carta.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_mora_dias_mora_cred')
	ll_dias_mora_mant	= tab_carta.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_mora_dias_mora_mant')
	
	CHOOSE CASE ls_base
		CASE 'O'
			//	Promesa Calculo Credito				
			wf_calcular_interes('E',ls_base,ls_serie,ll_numero,ll_indi_ctto)
			// Promesa Calculo Mantencion				
			wf_calcular_interes('F',ls_base,ls_serie,ll_numero,ll_indi_ctto)

		CASE 'C'
			// Calculo Mantencion
			wf_calcular_interes('F',ls_base,ls_serie,ll_numero,ll_indi_ctto)

		CASE 'D'
			// Calculo Credito
			wf_calcular_interes('E',ls_base,ls_serie,ll_numero,ll_indi_ctto)

		CASE 'P'
			// Calculo Credito
			wf_calcular_interes('E',ls_base,ls_serie,ll_numero,ll_indi_ctto)

		CASE 'L'
			// Calculo Credito
			wf_calcular_interes('E',ls_base,ls_serie,ll_numero,ll_indi_ctto)

		CASE 'A'
			// Calculo Credito
			wf_calcular_interes('E',ls_base,ls_serie,ll_numero,ll_indi_ctto)

		CASE 'R'
			// Calculo Credito
			wf_calcular_interes('E',ls_base,ls_serie,ll_numero,ll_indi_ctto)

	END CHOOSE
next
SetPointer(Arrow!)
end subroutine

public subroutine wf_calcular_interes (string as_cobro, string as_base, string as_serie, double al_numero, long al_fila);Long		ii_cantidad,ii_dmora,ii_mora_cobro,ii_inc_gastos,i,ll_gasto_cob,ll_mora,ll_gastos,&
			ll_tot_reg,ll_monto,ll_total_monto,ll_cuota,ll_day,ll_month,ll_year,ll_suma_dias,&
			ll_tot_fila,ll_reg,ll_dias_mora,ll_ctas_mora,ll_calc_dias,ld_dias_sum_mora,ldb_mora=0,&
			id_valor_cuota,id_im, id_gc,ll_new,ll_dias_dif,ll_ctas_pag,ldb_suma_gasto_cob=0,ll_max,&
			ll_dia_prox_pago,ll_cta_pag_s,ll_cta_pag_m,ll_plazo,ll_cta_pag_la,ll_cta_pag_isa,ll_cta_mora_m,&
			ii_dmora_m
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
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_cta_pag_s)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',ll_cta_pag_m)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'est_comi',ls_estado_comi)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			
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
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',0)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',ll_cta_pag_m)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'est_comi','')
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			
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
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_ctas_pag)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',0)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'est_comi','')
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			
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
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_ctas_pag)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',0)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'est_comi','')
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			
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
		 	tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_cta_pag_m)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',0)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'est_comi',ls_estado_comi)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			 
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
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_cta_pag_m)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',0)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'est_comi',ls_estado_comi)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			
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
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_cta_pag_s)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',0)
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'est_comi','')
			tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'ctas_plazo',ll_plazo)
			
	END CHOOSE
	ld_fecha_hoy								= date(gdt_fec_sistema)
//	ll_tot_reg									= tab_carta.tabpage_1.dw_contrato.rowcount()
//	if ll_tot_reg>0 then
//		for ll_indi=1 to ll_tot_reg
			if as_cobro='E' then
				ll_cuota							= tab_carta.tabpage_1.dw_contrato.getitemnumber(al_fila, "cadena_mora_mora_cred")
			else
				ll_cuota							= tab_carta.tabpage_1.dw_contrato.getitemnumber(al_fila, "cadena_mora_mora_mant")
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
						ii_dmora 				= tab_carta.tabpage_1.dw_contrato.getitemnumber(al_fila, "cadena_mora_dias_mora_cred")
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
							ii_dmora_m 			= tab_carta.tabpage_1.dw_contrato.getitemnumber(al_fila, "cadena_mora_dias_mora_mant")
							ll_cta_mora_m		= tab_carta.tabpage_1.dw_contrato.getitemnumber(al_fila, "cadena_mora_mora_mant")
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
						if ll_tot_fila>0 then
							for ll_reg=1 to ll_tot_fila
								ll_suma_dias				= ll_suma_dias - ll_dias_mora
								dw_dias_mora.setitem(ll_reg,'suma_dias',ll_suma_dias)
								ll_dias_mora				= dw_dias_mora.getitemnumber(ll_reg,'dias_mora')
							next
							dw_dias_mora.accepttext()
							FOR i = 1 TO ii_cantidad 
								if i <= ll_ctas_mora then
									ll_calc_dias			= dw_dias_mora.getitemnumber(i,'dias_mora')
									ii_dmora					= dw_dias_mora.getitemnumber(i,'suma_dias_acum')
									ld_dias_sum_mora		= dw_dias_mora.getitemnumber(i,'suma_dias')
								else
									ll_calc_dias			= 0
									ii_dmora					= 0
									ld_dias_sum_mora		= 0
								end if
								IF ld_dias_sum_mora > 5 THEN
									ii_mora_cobro 			= ld_dias_sum_mora
									id_im 					= id_im + gf_int_mora(ldb_tasa, ii_mora_cobro, id_valor_cuota)
									IF ld_dias_sum_mora > ll_calc_dias  THEN
										id_gc 				= id_gc + Round(id_valor_cuota * id_factor_gc, 0)
										ii_inc_gastos		= 1
									END IF
								ELSE
	//								ii_mora_cobro 	= 0
	//								id_im 			= 0
	//								id_gc 			= 0
								END IF	
							NEXT
						end if
						ll_mora						= ll_mora + id_im
						ll_gasto_cob				= ll_gasto_cob + id_gc
						ll_valor_total				= round(ll_cuota * id_valor_cuota,0)
						tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'gastos_adm_mora_cred',ll_gasto_cob)
						tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'valor_mora_cred',ll_valor_total)
						tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'interes_mora_cred',ll_mora)
						tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'total_cred',(ll_gasto_cob + ll_mora + ll_valor_total))

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
						tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'gastos_adm_mora_mant',ll_gasto_cob)
						tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'valor_mora_mant',ll_valor_total)
						tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'interes_mora_mant',ll_mora)
						tab_carta.tabpage_1.dw_contrato.setitem(al_fila,'total_mant',(ll_gasto_cob + ll_mora + ll_valor_total))
					end if
				end if
			end if
//		next
//	end if
end if
end subroutine

public subroutine wf_calcular_interes_ctto (string as_cobro, string as_base, string as_serie, double al_numero, long al_fila);Long		ii_cantidad,ii_dmora,ii_mora_cobro,ii_inc_gastos,i,ll_gasto_cob,ll_mora,ll_gastos,&
			ll_tot_reg,ll_monto,ll_total_monto,ll_cuota,ll_day,ll_month,ll_year,ll_suma_dias,&
			ll_tot_fila,ll_reg,ll_dias_mora,ll_ctas_mora,ll_calc_dias,ld_dias_sum_mora,ldb_mora=0,&
			id_valor_cuota,id_im, id_gc,ll_new,ll_dias_dif,ll_ctas_pag,ldb_suma_gasto_cob=0,ll_max,&
			ll_dia_prox_pago,ll_cta_pag_s,ll_cta_pag_m,ll_plazo,ll_cta_pag_la,ll_cta_pag_isa,ll_cta_mora_m,&
			ii_dmora_m
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
			
	END CHOOSE
	ld_fecha_hoy								= date(gdt_fec_sistema)
//	ll_tot_reg									= tab_carta.tabpage_1.dw_contrato.rowcount()
//	if ll_tot_reg>0 then
//		for ll_indi=1 to ll_tot_reg
			if as_cobro='E' then
				ll_cuota							= dw_lista.getitemnumber(al_fila, "mora_cred")
			else
				ll_cuota							= dw_lista.getitemnumber(al_fila, "mora_mant")
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
						ii_dmora 				= dw_lista.getitemnumber(al_fila, "dias_mora_cred")
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
							ii_dmora_m 			= dw_lista.getitemnumber(al_fila, "dias_mora_mant")
							ll_cta_mora_m		= dw_lista.getitemnumber(al_fila, "mora_mant")
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
						if ll_tot_fila>0 then
							for ll_reg=1 to ll_tot_fila
								ll_suma_dias				= ll_suma_dias - ll_dias_mora
								dw_dias_mora.setitem(ll_reg,'suma_dias',ll_suma_dias)
								ll_dias_mora				= dw_dias_mora.getitemnumber(ll_reg,'dias_mora')
							next
							dw_dias_mora.accepttext()
							FOR i = 1 TO ii_cantidad 
								if i <= ll_ctas_mora and i <= dw_dias_mora.rowcount() then
									ll_calc_dias			= dw_dias_mora.getitemnumber(i,'dias_mora')
									ii_dmora					= dw_dias_mora.getitemnumber(i,'suma_dias_acum')
									ld_dias_sum_mora		= dw_dias_mora.getitemnumber(i,'suma_dias')
								else
									ll_calc_dias			= 0
									ii_dmora					= 0
									ld_dias_sum_mora		= 0
								end if
								IF ld_dias_sum_mora > 5 THEN
									ii_mora_cobro 			= ld_dias_sum_mora
									id_im 					= id_im + gf_int_mora(ldb_tasa, ii_mora_cobro, id_valor_cuota)
									IF ld_dias_sum_mora > ll_calc_dias  THEN
										id_gc 				= id_gc + Round(id_valor_cuota * id_factor_gc, 0)
										ii_inc_gastos		= 1
									END IF
								ELSE
	//								ii_mora_cobro 	= 0
	//								id_im 			= 0
	//								id_gc 			= 0
								END IF	
							NEXT
						end if
						ll_mora						= ll_mora + id_im
						ll_gasto_cob				= ll_gasto_cob + id_gc
						ll_valor_total				= round(ll_cuota * id_valor_cuota,0)
						dw_lista.setitem(al_fila,'total_deuda_cred',(ll_gasto_cob + ll_mora + ll_valor_total))

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
//						dw_lista.setitem(al_fila,'total_deuda_mant',(ll_gasto_cob + ll_mora + ll_valor_total))
					end if
				end if
			end if
//		next
//	end if
end if
end subroutine

on w_asignar_envio_carta.create
this.cb_limpiar=create cb_limpiar
this.dw_especial=create dw_especial
this.cb_cargar_archivo=create cb_cargar_archivo
this.cb_ctacte2=create cb_ctacte2
this.cb_actualizar=create cb_actualizar
this.st_click=create st_click
this.cb_sacar=create cb_sacar
this.dw_dias_mora=create dw_dias_mora
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_9=create st_9
this.tab_carta=create tab_carta
this.cb_marcar=create cb_marcar
this.cb_1=create cb_1
this.cb_asignar=create cb_asignar
this.cb_ctacte=create cb_ctacte
this.st_fondo=create st_fondo
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.cb_filtro=create cb_filtro
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.pb_ok=create pb_ok
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.dw_select=create dw_select
this.Control[]={this.cb_limpiar,&
this.dw_especial,&
this.cb_cargar_archivo,&
this.cb_ctacte2,&
this.cb_actualizar,&
this.st_click,&
this.cb_sacar,&
this.dw_dias_mora,&
this.p_ini,&
this.em_fec_ini,&
this.st_9,&
this.tab_carta,&
this.cb_marcar,&
this.cb_1,&
this.cb_asignar,&
this.cb_ctacte,&
this.st_fondo,&
this.hpb_1,&
this.st_porc,&
this.cb_filtro,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_ordenar,&
this.pb_ok,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.dw_select}
end on

on w_asignar_envio_carta.destroy
destroy(this.cb_limpiar)
destroy(this.dw_especial)
destroy(this.cb_cargar_archivo)
destroy(this.cb_ctacte2)
destroy(this.cb_actualizar)
destroy(this.st_click)
destroy(this.cb_sacar)
destroy(this.dw_dias_mora)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_9)
destroy(this.tab_carta)
destroy(this.cb_marcar)
destroy(this.cb_1)
destroy(this.cb_asignar)
destroy(this.cb_ctacte)
destroy(this.st_fondo)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.cb_filtro)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.pb_ok)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.dw_select)
end on

event open;Long	ll_new,ll_cod_parque,ll_count_reg
SetPointer(HourGlass!)
cb_sacar.italic	= false
st_fondo.visible	= false
hpb_1.visible 		= false
st_porc.visible 	= false
SELECT	"TASA"."TASA_INT_UF",	"TASA"."GASTO_COB_MORA"  	
INTO 		:id_tasa_mant,				:id_factor_gc 	
FROM 		"TASA"  
WHERE 	"TASA"."LOOK" = 1 ;
gf_centrar(w_asignar_envio_carta)
dw_select.settransobject(sqlca)
dw_lista.settransobject(sqlca)
dw_especial.settransobject(sqlca)
dw_dias_mora.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque	= 1
	dw_select.setitem(ll_new,'parque',ll_cod_parque)
elseif gs_conexion = "Parque La Foresta" then
	ll_cod_parque	= 11
	dw_select.setitem(ll_new,'parque',ll_cod_parque)
elseif gs_conexion = "Parque Concepción" then
	ll_cod_parque	= 801
	dw_select.setitem(ll_new,'parque',ll_cod_parque)
end if
dw_select.accepttext()
dw_select.getchild('clasificacion',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve(ll_cod_parque)
ll_new				= dw_select.insertrow(0)
dw_select.accepttext()
tab_carta.tabpage_1.dw_contrato.settransobject(sqlca)
tab_carta.tabpage_1.dw_cliente.settransobject(sqlca)
tab_carta.tabpage_2.dw_cobranza.settransobject(sqlca)
tab_carta.tabpage_2.dw_carta.settransobject(sqlca)
tab_carta.tabpage_2.dw_publico.settransobject(sqlca)
tab_carta.tabpage_3.dw_detalle_pagos.settransobject(sqlca)
tab_carta.tabpage_3.dw_detalle_total.settransobject(sqlca)
tab_carta.tabpage_3.dw_detalle_cuotas.settransobject(sqlca)
tab_carta.tabpage_3.dw_detalle_mantencion.settransobject(sqlca)
tab_carta.tabpage_3.dw_boton_cerrar.settransobject(sqlca)
tab_carta.tabpage_3.dw_boton_cerrar.insertrow(0)
tab_carta.visible		= false
st_9.visible			= false
em_fec_ini.visible	= false
p_ini.visible			= false
pb_ok.x					= 2533
SELECT	COUNT("SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD")
INTO 		:ll_count_reg  
FROM 		"SOL_PERMISOS_USUARIO"  
WHERE  ( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
		 ( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' )   
USING		sqlca;
if ll_count_reg>0 or gs_depto='I' then
	cb_sacar.visible	= true
else
	cb_sacar.visible	= false
end if
dw_select.setfocus()
SetPointer(Arrow!)
end event

event mousemove;st_click.visible	= false
end event

type cb_limpiar from commandbutton within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 2976
integer y = 1972
integer width = 197
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;cb_marcar.text='Marcar Todo'
dw_lista.reset()
dw_especial.reset()
dw_dias_mora.reset()
tab_carta.visible	= false
cb_sacar.italic	= false
end event

type dw_especial from datawindow within w_asignar_envio_carta
boolean visible = false
integer x = 1563
integer y = 2076
integer width = 411
integer height = 432
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_contrato_especial"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cargar_archivo from commandbutton within w_asignar_envio_carta
integer x = 1673
integer y = 1972
integer width = 366
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cargar Arc&hivo"
end type

event clicked;string		ls_archivo,ls_base,ls_serie,ls_nulo,LS_USO,LS_TIPO_VENTA,ls_clasif,ls_filtro
Long		ll_tot_reg,ll_indi,ll_rut,ll_grupo,ll_new,ll_nulo,ll_corr,ll_cod_parque
Datetime	ldt_nulo,LDT_FECHA_CARTA,LDT_FECHA_VENC_CRED,LDT_FECHA_VENC_MANT,LDT_FECHA_COBRANZA,&
			LDT_FECHA_CONTRATO,LDT_FECHA_PROX_ENVIO_CARTA,LDT_ULT_FECHA_PUB,ldt_fecha_max_envio
String		LS_ESTADO_CONTRATO,LS_NRO_CARTA,LS_DV,&
			LS_ESTADO_CARTA,LS_ESTADO_COMI,LS_NOMBRE,LS_A_PATERNO,LS_A_MATERNO,LS_DIRECCION_P,&
			LS_NUMERO_PARTICULAR,LS_DEPTO_PARTICULAR,LS_BLOCK_PARTICULAR,LS_POBLACION,LS_CODIGO_CIUDAD,&
			LS_CIUDAD_DESCRIPCION,LS_CODIGO_COMUNA,LS_COMUNA_DESCRIPCION,LS_FONO_P,LS_FONO_C,LS_ESTADO_COBRANZA,&
			LS_GLOSA_COBRANZA,LS_ESTADO_TITULAR,LS_BASE_ASOC,LS_SERIE_ASOC,LS_MONEDA,&
			LS_ESTADO_ENVIO_CARTA,LS_ULT_ESTADO_ENVIO_CARTA,LS_ULT_ESTADO_PUB,LS_ULT_GLOSA_PUB,&
			LS_DUENO,LS_TIPO_VIA_DESCRIPCION,LS_AREA,LS_SECTOR,LS_SEPULTURA
Long		LL_PARQUE,LL_MORA_CRED,LL_DIAS_MORA_CRED,LL_MORA_MANT,LL_DIAS_MORA_MANT,LL_FALLECIDOS,LL_PLAZO,&
			LL_TOT_PAGADO,LL_VALOR_CUOTA,LL_VALOR_CUOTA_M,LL_CTAS_PAGADAS,LL_CTA_PAG_MANT,&
			LL_CAPACIDAD,ll_tot_porc,ll_tot_porc_aux
Double	ll_numero,LL_NUMERO_ASOC

SetPointer(HourGlass!)
ll_cod_parque						= dw_select.getitemnumber(1,'parque')
ls_clasif							= trim(dw_select.getitemstring(1,'clasificacion'))
if ll_cod_parque=0 or isnull(ll_cod_parque) then
	messagebox("Advertencia","Debe Seleccionar Parque")
	dw_select.setfocus()
	dw_select.setcolumn('parque')
elseif ls_clasif='' or isnull(ls_clasif) then
	messagebox("Advertencia","Debe Seleccionar Tipo Carta")
	dw_select.setfocus()
	dw_select.setcolumn('clasificacion')
else
	Setnull(ls_nulo);setnull(ll_nulo);setnull(ldt_nulo)
	dw_lista.reset()
	dw_especial.reset()
	dw_especial.accepttext()
	SetNull(ls_archivo)
	dw_especial.ImportFile(ls_archivo)
	dw_especial.accepttext()
	ll_tot_reg			= dw_especial.rowcount()
	if ll_tot_reg>0 then
		st_fondo.visible				= true
		hpb_1.visible 					= true
		st_porc.visible 				= true
		ll_tot_porc						= 0
		ll_tot_porc_aux				= 0			
		hpb_1.Position					= ll_tot_porc
		for ll_indi=1 to ll_tot_reg
			ls_base			= dw_especial.getitemstring(ll_indi,'base')
			ls_serie			= dw_especial.getitemstring(ll_indi,'serie')
			ll_numero		= dw_especial.getitemnumber(ll_indi,'numero')
			if ls_base='C' then
				SELECT	"CADENA"."CODIGO",	"CADENA"."COD_PARQUE",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."ESTADO",	"CADENA"."NRO_CARTA",	"CADENA"."FECHA_CARTA",	"CADENA"."ESTADO_CARTA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."DIAS_MORA_CRED",	"CADENA_MORA"."FECHA_VENC_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."DIAS_MORA_MANT",	"CADENA_MORA"."FECHA_VENC_MANT",	"CADENA_MORA"."FALLECIDOS",	"CADENA_MORA"."ESTADO_COMI",	"CADENA_MORA"."PLAZO",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."CIUDAD",	"CIUDAD"."SIGLA_CIUDAD",	"CLIENTE"."COMUNA",	"COMUNA"."COMUNA",		"CLIENTE"."FONO_P",	"CLIENTE"."FONO_C",	"CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."FECHA_COBRANZA",	"CLIENTE"."GLOSA_COBRANZA",	"CLIENTE"."ESTADO_TITULAR",	"CONTRATO"."TOT_PAGADO",	'',				"CONTRATO"."SERIE_C",	"CONTRATO"."NRO_CONTRATO",	"CONTRATO"."FECHA",	"CONTRATO"."MONEDA",	"CONTRATO"."VALOR_CUO",	"CONTRATO"."VALOR_CUOTA_M",	"CONTRATO"."CTA_PAG_ISA",	"CONTRATO"."CTA_PAG_M",	"CLIENTE"."FECHA_PROX_ENVIO_CARTA",	"CLIENTE"."ESTADO_ENVIO_CARTA",	"CLIENTE"."ULT_ESTADO_ENVIO_CARTA",	"CLIENTE"."ULT_ESTADO_PUB",	"CLIENTE"."ULT_GLOSA_PUB",	"CLIENTE"."ULT_FECHA_PUB",	"CONTRATO"."DUENO",	"TIPO_VIA"."DESCRIPCION",	"CONTRATO"."ZONA",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."CAPACIDAD"
				INTO		:LS_BASE,				:LL_PARQUE,					:LS_SERIE,			:LL_NUMERO,				:LS_ESTADO_CONTRATO,	:LS_NRO_CARTA,				:LDT_FECHA_CARTA,			:LS_ESTADO_CARTA,				:LL_MORA_CRED,					:LL_DIAS_MORA_CRED,					:LDT_FECHA_VENC_CRED,				:LL_MORA_MANT,					:LL_DIAS_MORA_MANT,					:LDT_FECHA_VENC_MANT,				:LL_FALLECIDOS,					:LS_ESTADO_COMI,					:LL_PLAZO,					:LL_RUT,				:LS_DV,				:LS_NOMBRE,				:LS_A_PATERNO,				:LS_A_MATERNO,				:LS_DIRECCION_P,				:LS_NUMERO_PARTICULAR,				:LS_DEPTO_PARTICULAR,			:LS_BLOCK_PARTICULAR,			:LS_POBLACION,				:LS_CODIGO_CIUDAD,	:LS_CIUDAD_DESCRIPCION,		:LS_CODIGO_COMUNA,	:LS_COMUNA_DESCRIPCION,	:LS_FONO_P,				:LS_FONO_C,				:LS_ESTADO_COBRANZA,				:LDT_FECHA_COBRANZA,				:LS_GLOSA_COBRANZA,				:LS_ESTADO_TITULAR,				:LL_TOT_PAGADO,				:LS_BASE_ASOC,	:LS_SERIE_ASOC,			:LL_NUMERO_ASOC,				:LDT_FECHA_CONTRATO,	:LS_MONEDA,				:LL_VALOR_CUOTA,			:LL_VALOR_CUOTA_M,				:LL_CTAS_PAGADAS,				:LL_CTA_PAG_MANT,			:LDT_FECHA_PROX_ENVIO_CARTA,			:LS_ESTADO_ENVIO_CARTA,				:LS_ULT_ESTADO_ENVIO_CARTA,			:LS_ULT_ESTADO_PUB,				:LS_ULT_GLOSA_PUB,			:LDT_ULT_FECHA_PUB,			:LS_DUENO,				:LS_TIPO_VIA_DESCRIPCION,	:LS_AREA,				:LS_SECTOR,				:LS_SEPULTURA,				:LL_CAPACIDAD
				FROM  	"CADENA",  "CADENA_MORA", "CIUDAD",  "CLIENTE", "COMUNA", "CONTRATO",  "TIPO_VIA"
				WHERE	 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" )       and     					 
						 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" )       and     					 
						 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" )       and     					 
						 ( "CADENA"."RUT" = "CLIENTE"."RUT" (+) )       and     					 
						 ( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA"      )       and     					 
						 ( "CLIENTE"."CIUDAD" = "CIUDAD"."CODIGO_CIUDAD"      )       and     					 
						 ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA"       )       and     					 
						 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" )       and     					 
						 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO"      )       and     					 
						 ( "CADENA"."CODIGO" = :ls_base )       and 
						 ( "CADENA"."SERIE" = :ls_serie )  and
						 ( "CADENA"."NUMERO" = :ll_numero )
				USING		sqlca;
			elseif ls_base='O' then
				SELECT	"CADENA"."CODIGO",	"CADENA"."COD_PARQUE",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."ESTADO",	"CADENA"."NRO_CARTA",	"CADENA"."FECHA_CARTA",	"CADENA"."ESTADO_CARTA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."DIAS_MORA_CRED",	"CADENA_MORA"."FECHA_VENC_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."DIAS_MORA_MANT",	"CADENA_MORA"."FECHA_VENC_MANT",	"CADENA_MORA"."FALLECIDOS" ,	"CADENA_MORA"."ESTADO_COMI",	"CADENA_MORA"."PLAZO",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."CIUDAD",	"CIUDAD"."SIGLA_CIUDAD",	"CLIENTE"."COMUNA",	"COMUNA"."COMUNA",		"CLIENTE"."FONO_P",	"CLIENTE"."FONO_C",	"CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."FECHA_COBRANZA",	"CLIENTE"."GLOSA_COBRANZA",	"CLIENTE"."ESTADO_TITULAR",	"OFERTA_V"."TOT_PAGADO",	"OFERTA_V"."FECHA",	"PAGO_OFERTA"."MONEDA",	"PAGO_OFERTA"."VALOR_CUOTA" ,	"OFERTA_V"."VALOR_CUOTA_M",	"OFERTA_V"."CTA_PAG_S",	"OFERTA_V"."CTA_PAG_M",	"OFERTA_V"."TIPO_VENTA",	"CLIENTE"."FECHA_PROX_ENVIO_CARTA",	"CLIENTE"."ESTADO_ENVIO_CARTA",	"CLIENTE"."ULT_ESTADO_ENVIO_CARTA",	"CLIENTE"."ULT_ESTADO_PUB",	"CLIENTE"."ULT_GLOSA_PUB",	"CLIENTE"."ULT_FECHA_PUB",	"TIPO_VIA"."DESCRIPCION",	"OFERTA_V"."USO",	"PAGO_OFERTA"."AREA",	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"PAGO_OFERTA"."CAPACIDAD"	
				INTO		:LS_BASE,				:LL_PARQUE,					:LS_SERIE,			:LL_NUMERO,				:LS_ESTADO_CONTRATO,	:LS_NRO_CARTA,				:LDT_FECHA_CARTA,			:LS_ESTADO_CARTA,				:LL_MORA_CRED,					:LL_DIAS_MORA_CRED,					:LDT_FECHA_VENC_CRED,				:LL_MORA_MANT,					:LL_DIAS_MORA_MANT,					:LDT_FECHA_VENC_MANT,				:LL_FALLECIDOS,					:LS_ESTADO_COMI,					:LL_PLAZO,					:LL_RUT,				:LS_DV,				:LS_NOMBRE,				:LS_A_PATERNO,				:LS_A_MATERNO,				:LS_DIRECCION_P,				:LS_NUMERO_PARTICULAR,				:LS_DEPTO_PARTICULAR,			:LS_BLOCK_PARTICULAR,			:LS_POBLACION,				:LS_CODIGO_CIUDAD,	:LS_CIUDAD_DESCRIPCION,		:LS_CODIGO_COMUNA,	:LS_COMUNA_DESCRIPCION,	:LS_FONO_P,				:LS_FONO_C,				:LS_ESTADO_COBRANZA,				:LDT_FECHA_COBRANZA,				:LS_GLOSA_COBRANZA,				:LS_ESTADO_TITULAR,				:LL_TOT_PAGADO,				:LDT_FECHA_CONTRATO,	:LS_MONEDA,					:LL_VALOR_CUOTA,					:LL_VALOR_CUOTA_M,				:LL_CTAS_PAGADAS,			:LL_CTA_PAG_MANT,			:LS_TIPO_VENTA,				:LDT_FECHA_PROX_ENVIO_CARTA,			:LS_ESTADO_ENVIO_CARTA,				:LS_ULT_ESTADO_ENVIO_CARTA,			:LS_ULT_ESTADO_PUB,				:LS_ULT_GLOSA_PUB,			:LDT_ULT_FECHA_PUB,			:LS_TIPO_VIA_DESCRIPCION,	:LS_USO,				:LS_AREA,					:LS_SECTOR,					:LS_SEPULTURA,					:LL_CAPACIDAD
				FROM    "CADENA", 	"CADENA_MORA",  	"CIUDAD", 	"CLIENTE",  "COMUNA", "OFERTA_V", "PAGO_OFERTA", "TIPO_VIA"     			
				WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" )       and  
						( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" )       and  
						( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" )       and    
						( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" )       and    
						( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" )   and 
						( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" )   and 
						( "CADENA"."SERIE" = "OFERTA_V"."SERIE" )       and     		
						( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" )      and    
						( "CADENA"."RUT" = "CLIENTE"."RUT" )       and 
						( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" )    and
						( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" )   and    
						( "CLIENTE"."CIUDAD" = "CIUDAD"."CODIGO_CIUDAD" )     and 
						( "CADENA"."CODIGO" = :ls_base )   and     		
						( "CADENA"."SERIE" = :ls_serie )  and
						( "CADENA"."NUMERO" = :ll_numero )
				USING		sqlca;
			elseif ls_base='P' then
				
				SELECT 	"CADENA"."CODIGO",
							"CADENA"."COD_PARQUE",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."ESTADO",	"CADENA"."NRO_CARTA",	"CADENA"."FECHA_CARTA",	"CADENA"."ESTADO_CARTA",	"CADENA_MORA_A"."MORA_CRED",	"CADENA_MORA_A"."DIAS_MORA_CRED",	"CADENA_MORA_A"."FECHA_VENC_CRED",	"CADENA_MORA_A"."MORA_MANT",	"CADENA_MORA_A"."DIAS_MORA_MANT",	"CADENA_MORA_A"."FECHA_VENC_MANT",	"CADENA_MORA_B"."FALLECIDOS",	"CADENA_MORA_A"."ESTADO_COMI",	"CADENA_MORA_A"."PLAZO",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."CIUDAD",	"CIUDAD"."SIGLA_CIUDAD",	"CLIENTE"."COMUNA",	"COMUNA"."SIGLA_COMUNA",	"CLIENTE"."FONO_P",	"CLIENTE"."FONO_C",	"CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."FECHA_COBRANZA",	"CLIENTE"."GLOSA_COBRANZA",	"CLIENTE"."ESTADO_TITULAR",	"PAGARE"."TOT_PAGADO",	"PAGARE"."FECHA",		"PAGARE"."MONEDA",	"PAGARE"."VALOR_CUO",	"CONTRATO"."VALOR_CUOTA_M",	"CADENA_MORA_A"."CTAS_PAG_S",	"CONTRATO"."CTA_PAG_M",	"PAGARE"."FORMA_PAGO",	"CLIENTE"."FECHA_PROX_ENVIO_CARTA",	"CLIENTE"."ESTADO_ENVIO_CARTA",	"CLIENTE"."ULT_ESTADO_PUB",	"CLIENTE"."ULT_GLOSA_PUB",	"CLIENTE"."ULT_FECHA_PUB",	"TIPO_VIA"."DESCRIPCION",	"CONTRATO"."USO",	"CONTRATO"."ZONA",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."CAPACIDAD" 
				INTO		:LL_PARQUE,					:LS_SERIE,			:LL_NUMERO,				:LS_ESTADO_CONTRATO,	:LS_NRO_CARTA,				:LDT_FECHA_CARTA,			:LS_ESTADO_CARTA,				:LL_MORA_CRED,						:LL_DIAS_MORA_CRED,						:LDT_FECHA_VENC_CRED,					:LL_MORA_MANT,						:LL_DIAS_MORA_MANT,						:LDT_FECHA_VENC_MANT,					:LL_FALLECIDOS,					:LS_ESTADO_COMI,						:LL_PLAZO,						:LL_RUT,				:LS_DV,				:LS_NOMBRE,				:LS_A_PATERNO,				:LS_A_MATERNO,				:LS_DIRECCION_P,				:LS_NUMERO_PARTICULAR,				:LS_DEPTO_PARTICULAR,			:LS_BLOCK_PARTICULAR,			:LS_POBLACION,				:LS_CODIGO_CIUDAD,	:LS_CIUDAD_DESCRIPCION,		:LS_CODIGO_COMUNA,	:LS_COMUNA_DESCRIPCION,		:LS_FONO_P,				:LS_FONO_C,				:LS_ESTADO_COBRANZA,				:LDT_FECHA_COBRANZA,				:LS_GLOSA_COBRANZA,				:LS_ESTADO_TITULAR,				:LL_TOT_PAGADO,			:LDT_FECHA_CONTRATO,	:LS_MONEDA,				:LL_VALOR_CUOTA,			:LL_VALOR_CUOTA_M,				:LL_CTAS_PAGADAS,					:LL_CTA_PAG_MANT,			:LS_TIPO_VENTA,			:LDT_FECHA_PROX_ENVIO_CARTA,			:LS_ESTADO_ENVIO_CARTA,				:LS_ULT_ESTADO_PUB,				:LS_ULT_GLOSA_PUB,			:LDT_ULT_FECHA_PUB,			:LS_TIPO_VIA_DESCRIPCION,	:LS_USO,				:LS_AREA,				:LS_SECTOR,				:LS_SEPULTURA,				:LL_CAPACIDAD
				FROM 		"CADENA",   
							"CADENA_MORA" "CADENA_MORA_A",   
							"CIUDAD",   
							"CLIENTE",   
							"COMUNA",   
							"CONTRATO",   
							"PAGARE",   
							"TIPO_VIA",   
							"CADENA_MORA" "CADENA_MORA_B"  
				WHERE  ( "CADENA"."SERIE" = "CADENA_MORA_A"."SERIE" ) and  
						 ( "CADENA"."CODIGO" = "CADENA_MORA_A"."BASE" ) and  
						 ( "CADENA"."NUMERO" = "CADENA_MORA_A"."NUMERO" ) and  
						 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
						 ( "CLIENTE"."CIUDAD" = "CIUDAD"."CODIGO_CIUDAD" ) and  
						 ( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) and  
						 ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
						 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
						 ( "PAGARE"."SERIE" = "CONTRATO"."SERIE_C" ) and  
						 ( "PAGARE"."NRO_OFERTA" = "CONTRATO"."NRO_CONTRATO" ) and  
						 ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
						 ( "CONTRATO"."SERIE_C" = "CADENA_MORA_B"."SERIE" ) and  
						 ( "CONTRATO"."NRO_CONTRATO" = "CADENA_MORA_B"."NUMERO" ) and  
						 ( "CADENA"."CODIGO" = :ls_base )   and     		
						 ( "CADENA"."SERIE" = :ls_serie )  and
						 ( "CADENA"."NUMERO" = :ll_numero )
				 USING	sqlca;
			end if
			if sqlca.sqlcode=0 then
				ll_new		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,'parque',ll_parque)
				dw_lista.setitem(ll_new,'base',ls_base)
				dw_lista.setitem(ll_new,'serie',ls_serie)
				dw_lista.setitem(ll_new,'numero',ll_numero)
	//LS_BASE,LL_PARQUE,LS_SERIE,LL_NUMERO,LS_BASE_ASOC,LS_SERIE_ASOC,LL_NUMERO_ASOC,LS_DUENO
				dw_lista.setitem(ll_new,'estado_contrato',LS_ESTADO_CONTRATO)
				dw_lista.setitem(ll_new,'nro_carta',LS_NRO_CARTA)
				dw_lista.setitem(ll_new,'fecha_carta',LDT_FECHA_CARTA)
				dw_lista.setitem(ll_new,'estado_carta',LS_ESTADO_CARTA)
				dw_lista.setitem(ll_new,'mora_cred',LL_MORA_CRED)
				dw_lista.setitem(ll_new,'dias_mora_cred',LL_DIAS_MORA_CRED)
				dw_lista.setitem(ll_new,'fecha_venc_cred',LDT_FECHA_VENC_CRED)
				dw_lista.setitem(ll_new,'mora_mant',LL_MORA_MANT)
				dw_lista.setitem(ll_new,'dias_mora_mant',LL_DIAS_MORA_MANT)
				dw_lista.setitem(ll_new,'fecha_venc_mant',LDT_FECHA_VENC_MANT)
				dw_lista.setitem(ll_new,'fallecidos',LL_FALLECIDOS)
				dw_lista.setitem(ll_new,'plazo',LL_PLAZO)
				dw_lista.setitem(ll_new,'fecha_contrato',LDT_FECHA_CONTRATO)
				dw_lista.setitem(ll_new,'rut',LL_RUT)
				dw_lista.setitem(ll_new,'dv',LS_DV)
				dw_lista.setitem(ll_new,'nombre',LS_NOMBRE)
				dw_lista.setitem(ll_new,'a_paterno',LS_A_PATERNO)
				dw_lista.setitem(ll_new,'a_materno',LS_A_MATERNO)
				dw_lista.setitem(ll_new,'tipo_via_descripcion',LS_TIPO_VIA_DESCRIPCION)
				dw_lista.setitem(ll_new,'direccion_p',LS_DIRECCION_P)
				dw_lista.setitem(ll_new,'numero_particular',LS_NUMERO_PARTICULAR)
				dw_lista.setitem(ll_new,'depto_particular',LS_DEPTO_PARTICULAR)
				dw_lista.setitem(ll_new,'block_particular',LS_BLOCK_PARTICULAR)
				dw_lista.setitem(ll_new,'poblacion',LS_POBLACION)
				dw_lista.setitem(ll_new,'codigo_ciudad',LS_CODIGO_CIUDAD)
				dw_lista.setitem(ll_new,'ciudad_descripcion',LS_CIUDAD_DESCRIPCION)
				dw_lista.setitem(ll_new,'codigo_comuna',LS_CODIGO_COMUNA)
				dw_lista.setitem(ll_new,'comuna_descripcion',LS_COMUNA_DESCRIPCION)
				dw_lista.setitem(ll_new,'fono_p',LS_FONO_P)
				dw_lista.setitem(ll_new,'fono_c',LS_FONO_C)
				dw_lista.setitem(ll_new,'estado_cobranza',LS_ESTADO_COBRANZA)
				dw_lista.setitem(ll_new,'fecha_cobranza',LDT_FECHA_COBRANZA)
				dw_lista.setitem(ll_new,'glosa_cobranza',LS_GLOSA_COBRANZA)
				dw_lista.setitem(ll_new,'estado_titular',LS_ESTADO_TITULAR)
				dw_lista.setitem(ll_new,'tot_pagado',LL_TOT_PAGADO)
				dw_lista.setitem(ll_new,'moneda',LS_MONEDA)
				dw_lista.setitem(ll_new,'valor_cuota',LL_VALOR_CUOTA)
				dw_lista.setitem(ll_new,'valor_cuota_m',LL_VALOR_CUOTA_M)
				dw_lista.setitem(ll_new,'ctas_pagadas',LL_CTAS_PAGADAS)
				dw_lista.setitem(ll_new,'cta_pag_mant',LL_CTA_PAG_MANT)
				dw_lista.setitem(ll_new,'fecha_prox_envio_carta',LDT_FECHA_PROX_ENVIO_CARTA)
				dw_lista.setitem(ll_new,'ult_estado_envio_carta',LS_ULT_ESTADO_ENVIO_CARTA)
				dw_lista.setitem(ll_new,'ult_estado_pub',LS_ULT_ESTADO_PUB)
				dw_lista.setitem(ll_new,'ult_glosa_pub',LS_ULT_GLOSA_PUB)
				dw_lista.setitem(ll_new,'ult_fecha_pub',LDT_ULT_FECHA_PUB)
				dw_lista.setitem(ll_new,'estado_comi',LS_ESTADO_COMI)
				dw_lista.setitem(ll_new,'area',LS_AREA)
				dw_lista.setitem(ll_new,'sector',LS_SECTOR)
				dw_lista.setitem(ll_new,'sepultura',LS_SEPULTURA)
				dw_lista.setitem(ll_new,'capacidad',LL_CAPACIDAD)
				if ls_base='O' then
					dw_lista.setitem(ll_new,'fecha_contrato',LDT_FECHA_CONTRATO)
					dw_lista.setitem(ll_new,'uso',LS_USO)
					dw_lista.setitem(ll_new,'tipo_venta',LS_TIPO_VENTA)
				elseif ls_base='C' then
					dw_lista.setitem(ll_new,'base_asoc',LS_BASE_ASOC)
					dw_lista.setitem(ll_new,'serie_asoc',LS_SERIE_ASOC)
					dw_lista.setitem(ll_new,'numero_asoc',LL_NUMERO_ASOC)
					dw_lista.setitem(ll_new,'dueno',LS_DUENO)
					
				end if
			end if
			SELECT	"CARTA_LOG"."FECHA_CARTA"  
			INTO 		:ldt_fecha_max_envio  
			FROM 		"CARTA_LOG"  
			WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
					 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
					 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
					 ( "CARTA_LOG"."CLASIFICACION" = :ls_clasif ) AND  
					 ( "CARTA_LOG"."FECHA_CARTA" = 	(	SELECT 	MAX("CARTA_LOG"."FECHA_CARTA") 
																	FROM 		"CARTA_LOG" 
																	WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND 
																			 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND 
																			 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND 
																			 ( "CARTA_LOG"."CLASIFICACION" = :ls_clasif ) ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new,'c_fecha_ult_clasif',ldt_fecha_max_envio)
			else
				dw_lista.setitem(ll_new,'c_fecha_ult_clasif',datetime(date('01/01/1900'),time('00:00:00')))
			end if
			SELECT	"SOL_ESTATUS"."CORRELATIVO"  
			INTO 		:ll_corr  
			FROM 		"SOL_ESTATUS"  
			WHERE  ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
					 ( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
					 ( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
					 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
					 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '1' )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new,'solicitud','1')
			else
				SELECT	"SOL_ESTATUS"."CORRELATIVO"  
				INTO 		:ll_corr  
				FROM 		"SOL_ESTATUS"  
				WHERE  ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
						 ( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
						 ( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
						 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
						 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '2' )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new,'solicitud','2')
				else
					dw_lista.setitem(ll_new,'solicitud','No Tiene')
				end if
			end if
			if ll_tot_porc <> ll_tot_porc_aux then 
				st_porc.text			= string(ll_tot_porc)+" %"
				ll_tot_porc_aux		= ll_tot_porc
			end if
			ll_tot_porc					= (ll_indi / ll_tot_reg) * 100
			hpb_1.Position 			= ll_tot_porc
		next
		st_fondo.visible				= false
		hpb_1.visible 					= false
		st_porc.visible 				= false
		dw_lista.accepttext()
		if ls_clasif='I' or ls_clasif='A3' or ls_clasif='B3' or ls_clasif='C3' or &
			ls_clasif='B5' or ls_clasif='E5' or ls_clasif='B19' or ls_clasif='C19'  or &
			ls_clasif='B20' or ls_clasif='C20' then
			ls_filtro					= 'c_fecha_ult_clasif <= c_fecha_menos_180 AND solicitud="No Tiene" and nro_carta<>"'+ls_clasif+'"'
		else
			ls_filtro					= 'c_fecha_ult_clasif <= c_fecha_menos_180 AND solicitud="No Tiene"'
		end if
		dw_lista.accepttext()
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	end if
end if
SetPointer(Arrow!)
tab_carta.visible	= false
end event

type cb_ctacte2 from commandbutton within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1810
integer y = 2092
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

event clicked;if tab_carta.tabpage_1.dw_contrato.getrow()>0 then
	gs_base 						= tab_carta.tabpage_1.dw_contrato.GetItemString(tab_carta.tabpage_1.dw_contrato.getrow(), "cadena_codigo")
	gs_serie 					= tab_carta.tabpage_1.dw_contrato.GetItemString(tab_carta.tabpage_1.dw_contrato.getrow(), "cadena_serie")
	gi_numero 					= tab_carta.tabpage_1.dw_contrato.GetItemNumber(tab_carta.tabpage_1.dw_contrato.getrow(), "cadena_numero")
	gi_rut 						= tab_carta.tabpage_1.dw_contrato.GetItemNumber(tab_carta.tabpage_1.dw_contrato.getrow(), "cliente_rut")
	gs_apellido_paterno		= tab_carta.tabpage_1.dw_contrato.GetItemString(tab_carta.tabpage_1.dw_contrato.getrow(), "cliente_a_paterno")
	gs_apellido_materno		= tab_carta.tabpage_1.dw_contrato.GetItemString(tab_carta.tabpage_1.dw_contrato.getrow(), "cliente_a_materno")
	gs_nombres					= tab_carta.tabpage_1.dw_contrato.GetItemString(tab_carta.tabpage_1.dw_contrato.getrow(), "cliente_nombre")
	gs_dv							= tab_carta.tabpage_1.dw_contrato.GetItemString(tab_carta.tabpage_1.dw_contrato.getrow(), "cliente_dv")
	gs_estado					= tab_carta.tabpage_1.dw_contrato.GetItemString(tab_carta.tabpage_1.dw_contrato.getrow(), "cadena_estado")
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

type cb_actualizar from commandbutton within w_asignar_envio_carta
boolean visible = false
integer x = 1431
integer y = 2072
integer width = 64
integer height = 92
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Actualizar Pagos"
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

type st_click from statictext within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 663
integer y = 160
integer width = 677
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Presione Click para Ver Filtro"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_click.visible	= false
end event

type cb_sacar from commandbutton within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 1262
integer y = 1972
integer width = 407
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
string text = "&Permitir Marcar"
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;Long	ll_tot_reg,ll_indi
ll_tot_reg				= dw_lista.rowcount()
if ll_tot_reg>0 then
	dw_lista.Modify("estado_reg.Protect=0")
	cb_sacar.italic	= true
//	for ll_indi=1 to ll_tot_reg
//		dw_lista.setitem(ll_indi,'estado_reg',0)
//	next
end if
end event

type dw_dias_mora from datawindow within w_asignar_envio_carta
boolean visible = false
integer x = 133
integer y = 2084
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

type p_ini from picture within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 3237
integer y = 60
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;string ls_fecha,fech
long uf
dw_lista.reset()
tab_carta.visible		= false
cb_sacar.italic		= false
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

type em_fec_ini from editmask within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 2930
integer y = 60
integer width = 302
integer height = 88
integer taborder = 20
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

event ue_mousemove;st_click.visible	= false
end event

event modified;dw_lista.reset()
tab_carta.visible	= false
cb_sacar.italic	= false
end event

type st_9 from statictext within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 2551
integer y = 72
integer width = 370
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Espera"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_click.visible	= false
end event

type tab_carta from uo_cobranza_carta within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 635
integer y = 256
integer taborder = 170
end type

event ue_mousemove;st_click.visible	= false
end event

type cb_marcar from commandbutton within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 453
integer y = 1972
integer width = 402
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Marcar Todo"
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;Long		ll_indi,ll_tot_reg
Datetime	ldt_fec_ult_clas,ldt_fecha_menos_180
String	ls_clasif,ls_sicom2,ls_estado

ll_tot_reg							= dw_lista.rowcount()
ls_clasif							= trim(dw_select.getitemstring(1,'clasificacion'))
if ll_tot_reg>0 then
	if cb_marcar.text='Marcar Todo' then
		for ll_indi=1 to ll_tot_reg
			ldt_fec_ult_clas		= dw_lista.getitemdatetime(ll_indi,'c_fecha_ult_clasif')
			if ls_clasif='I' or ls_clasif='A3' or ls_clasif='B3' or ls_clasif='C3' or &
				ls_clasif='B5' or ls_clasif='E5' or ls_clasif='B19' or ls_clasif='C19'  or &
				ls_clasif='B20' or ls_clasif='C20' then
				dw_lista.setitem(ll_indi,'estado_reg',0)
			elseif ls_clasif='SIC_2' then
				ls_sicom2			= dw_lista.getitemstring(ll_indi,'c_sicom2')
				ls_estado			= dw_lista.getitemstring(ll_indi,'estado_contrato')
				if ls_sicom2 = 'N' and ls_estado='V' then
					dw_lista.setitem(ll_indi,'estado_reg',0)
				end if
			elseif ls_clasif='SIC_3' then
				ls_sicom2			= dw_lista.getitemstring(ll_indi,'c_sicom3')
				ls_estado			= dw_lista.getitemstring(ll_indi,'estado_contrato')
				if ls_sicom2 = 'N' and ls_estado='V' then
					dw_lista.setitem(ll_indi,'estado_reg',0)
				end if
			else
				if cb_sacar.italic = true then
					dw_lista.setitem(ll_indi,'estado_reg',0)
				else
					ldt_fecha_menos_180	= dw_lista.getitemdatetime(ll_indi,'c_fecha_menos_180')
					if ldt_fec_ult_clas <= ldt_fecha_menos_180 then
						dw_lista.setitem(ll_indi,'estado_reg',0)
					end if
				end if
			end if
		next
		cb_marcar.text				= 'Desmarcar Todo'

	elseif cb_marcar.text='Desmarcar Todo' then
		for ll_indi=1 to ll_tot_reg
			dw_lista.setitem(ll_indi,'estado_reg',1)
		next
		cb_marcar.text				= 'Marcar Todo'
	end if
	dw_lista.accepttext()
end if
end event

type cb_1 from commandbutton within w_asignar_envio_carta
boolean visible = false
integer x = 2254
integer y = 2100
integer width = 713
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Listar Cristian"
end type

event clicked;open(w_lista_cristian)
end event

type cb_asignar from commandbutton within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1972
integer width = 407
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Generar Carta"
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;long 		ll_fila,ll_parque,ll_accion,ll_tot_reg
String	ls_filtro,ls_clasif

ll_tot_reg			= dw_lista.RowCount()
if ll_tot_reg > 0 then
	ll_fila			= dw_lista.Find("estado_reg = 0", 1, ll_tot_reg)
	if ll_fila=0 or isnull(ll_fila) then
		messagebox("Advertencia","Debe Seleccionar Contrato para Asignar")
	else
		if isvalid(w_imprimir_carta_cobranza) then close(w_imprimir_carta_cobranza)
		ll_parque	= dw_select.getitemnumber(1,'parque')
		ls_clasif	= trim(dw_select.getitemstring(1,'clasificacion'))
		SELECT	"GC_TIPO_CARTA"."ACCION"  
		INTO 		:ll_accion  
		FROM 		"GC_TIPO_CARTA"  
		WHERE  ( "GC_TIPO_CARTA"."CLASIFICACION" = :ls_clasif ) AND  
				 ( "GC_TIPO_CARTA"."PARQUE" = :ll_parque )   
		USING		sqlca;
	
		ls_filtro	= string(ll_parque)+'~t'+string(ll_accion)+'~t'+ls_clasif
		openwithparm(w_imprimir_carta_cobranza,ls_filtro)
	end if
end if
end event

type cb_ctacte from commandbutton within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 859
integer y = 1972
integer width = 398
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;if dw_lista.rowcount()>0 and il_row>0 then
	gs_base 						= dw_lista.GetItemString(il_row, "base")
	gs_serie 					= dw_lista.GetItemString(il_row, "serie")
	gi_numero 					= dw_lista.GetItemNumber(il_row, "numero")
	gi_rut 						= dw_lista.GetItemNumber(il_row, "rut")
	gs_apellido_paterno		= dw_lista.GetItemString(il_row, "a_paterno")
	gs_apellido_materno		= dw_lista.GetItemString(il_row, "a_materno")
	gs_nombres					= dw_lista.GetItemString(il_row, "nombre")
	gs_dv							= dw_lista.GetItemString(il_row, "dv")
	gs_estado					= dw_lista.GetItemString(il_row, "estado_contrato")
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

type st_fondo from statictext within w_asignar_envio_carta
boolean visible = false
integer x = 1056
integer y = 712
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_asignar_envio_carta
boolean visible = false
integer x = 1088
integer y = 816
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_asignar_envio_carta
boolean visible = false
integer x = 1088
integer y = 740
integer width = 1371
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_filtro from commandbutton within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 2546
integer y = 1972
integer width = 174
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
if dw_lista.rowcount()=0 then tab_carta.visible=false

end event

type cb_imprimir from commandbutton within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 2738
integer y = 1972
integer width = 219
integer height = 92
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_exportar from commandbutton within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 2313
integer y = 1972
integer width = 229
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ordenar from commandbutton within w_asignar_envio_carta
event ue_mousemove pbm_dwnmousemove
integer x = 2080
integer y = 1972
integer width = 229
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type pb_ok from picturebutton within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 3415
integer y = 28
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;Long		ll_cod_parque,ll_pasa,ll_indi,ll_tot_reg,ll_tot_porc,ll_tot_porc_aux,ll_corr,ll_count_reg,&
			ll_monto_pagado,ll_capacidad,ll_fallecido
String	ls_clasif,ls_base,ls_serie,ls_filtro,ls_dw
datetime	ldt_fecha_max_envio,ldt_nulo
Date		ld_fecha_hoy,ld_fecha_hoy_menor
Double	ll_numero

SetPointer(HourGlass!)
cb_sacar.italic						= false
cb_marcar.text						= 'Marcar Todo'
ls_filtro								= ''
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
dw_select.accepttext()
dw_lista.accepttext()
ld_fecha_hoy							= date(gdt_fec_sistema)
ll_pasa									= 0
ll_cod_parque							= dw_select.getitemnumber(1,'parque')
gl_cod_parque_cta					= ll_cod_parque
ls_clasif								= trim(dw_select.getitemstring(1,'clasificacion'))
ld_fecha_hoy_menor					= RelativeDate(ld_fecha_hoy,  - 10)
setnull(ldt_nulo)
if ll_cod_parque=0 or isnull(ll_cod_parque) then
	messagebox("Advertencia","Debe Seleccionar Parque")
	dw_select.setfocus()
	dw_select.setcolumn('parque')
	ll_pasa ++
elseif ls_clasif='' or isnull(ls_clasif) then
	messagebox("Advertencia","Debe Seleccionar Tipo Carta")
	dw_select.setfocus()
	dw_select.setcolumn('clasificacion')
	ll_pasa ++
elseif (ls_clasif='CG' or ls_clasif='PS_D') and (em_fec_ini.text='00/00/0000' or isnull(date(em_fec_ini.text))) then
	messagebox("Advertencia","Debe Ingresar Fecha Tope de Espera al Cliente")
	em_fec_ini.setfocus()
	ll_pasa ++
end if
if ll_pasa=0 then
	SELECT	"GC_TIPO_CARTA"."FILTRO"  
	INTO 		:ls_dw
	FROM 	"GC_TIPO_CARTA"  
	WHERE 	"GC_TIPO_CARTA"."CLASIFICACION" = :ls_clasif and 
				"GC_TIPO_CARTA"."PARQUE" = :ll_cod_parque
	USING		sqlca;
	if not isnull(ls_filtro) then 
		dw_lista.dataobject			= ls_dw
		dw_lista.settransobject(sqlca)
	end if
	if ls_clasif='SIC_2' or ls_clasif='SIC_3' then
		ll_tot_reg						= dw_lista.retrieve(ll_cod_parque,ld_fecha_hoy_menor)
	else
		ll_tot_reg						= dw_lista.retrieve(ll_cod_parque,ld_fecha_hoy)
	end if
	if ll_tot_reg>0 then
		st_fondo.visible				= true
		hpb_1.visible 					= true
		st_porc.visible 				= true
		ll_tot_porc						= 0
		ll_tot_porc_aux				= 0			
		hpb_1.Position					= ll_tot_porc
		for ll_indi=1 to ll_tot_reg
			dw_lista.setitem(ll_indi,'estado_reg',1)
			ls_base						= dw_lista.getitemstring(ll_indi,'base')
			ls_serie						= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero					= dw_lista.getitemnumber(ll_indi,'numero')
//			if ls_clasif='S1' or ls_clasif='D8' or ls_clasif='B5' or ls_clasif='B' or &
//				ls_clasif='D' or ls_clasif='PJ' or ls_clasif='J' or ls_clasif='PD' or &
//				ls_clasif='I' then
//				if ls_base='P' then
//					SELECT	"CADENA_MORA"."FALLECIDOS",	"CONTRATO"."CAPACIDAD"  
//					INTO 		:ll_fallecido,						:ll_capacidad
//					FROM 		"CADENA_MORA",	"CONTRATO",	"PAGARE"  
//					WHERE  ( "PAGARE"."SERIE" = "CONTRATO"."SERIE_C" ) and  
//							 ( "PAGARE"."NRO_OFERTA" = "CONTRATO"."NRO_CONTRATO" ) and  
//							 ( "CONTRATO"."SERIE_C" = "CADENA_MORA"."SERIE" ) and  
//							 ( "CONTRATO"."NRO_CONTRATO" = "CADENA_MORA"."NUMERO" ) and  
//							 (("CADENA_MORA"."BASE" = 'C' ) AND  
//							 ( "PAGARE"."SERIE_P" = :ls_serie ) AND  
//							 ( "PAGARE"."NRO_PAGARE" = :ll_numero ) )   
//					USING		sqlca;
//					if sqlca.sqlcode=0 then
//						dw_lista.setitem(ll_indi,'fallecidos',ll_fallecido)
//						dw_lista.setitem(ll_indi,'capacidad',ll_capacidad)
//					end if
//				elseif ls_base='O' then
//					SELECT	"PAGO_OFERTA"."CAPACIDAD",	"CADENA_MORA"."FALLECIDOS"  
//					INTO 		:ll_capacidad,					:ll_fallecido  
//					FROM 		"CADENA_MORA",	"OFERTA_V",	"PAGO_OFERTA"  
//					WHERE  ( "CADENA_MORA"."SERIE" = "OFERTA_V"."SERIE" ) and  
//							 ( "CADENA_MORA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
//							 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
//							 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
//							 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
//							 (("CADENA_MORA"."BASE" = :ls_base ) AND  
//							 ( "CADENA_MORA"."SERIE" = :ls_serie ) AND  
//							 ( "CADENA_MORA"."NUMERO" = :ll_numero ) )   
//					USING		sqlca;
//					if sqlca.sqlcode=0 then
//						dw_lista.setitem(ll_indi,'fallecidos',ll_fallecido)
//						dw_lista.setitem(ll_indi,'capacidad',ll_capacidad)
//					end if
//				end if
//			end if
			
			SELECT	"CARTA_LOG"."FECHA_CARTA"  
			INTO 		:ldt_fecha_max_envio  
			FROM 		"CARTA_LOG"  
			WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
					 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
					 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
					 ( "CARTA_LOG"."CLASIFICACION" = :ls_clasif ) AND  
					 ( "CARTA_LOG"."FECHA_CARTA" = 	(	SELECT 	MAX("CARTA_LOG"."FECHA_CARTA") 
																	FROM 		"CARTA_LOG" 
																	WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND 
																			 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND 
																			 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND 
																			 ( "CARTA_LOG"."CLASIFICACION" = :ls_clasif ) ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_clasif='A3' or ls_clasif='B3' or ls_clasif='C3' or ls_clasif='B5' or ls_clasif='E5' then
					dw_lista.setitem(ll_indi,'c_fecha_ult_clasif',datetime(date(gdt_fec_sistema),time('00:00:00')))
				else
					dw_lista.setitem(ll_indi,'c_fecha_ult_clasif',ldt_fecha_max_envio)
				end if
			else
				dw_lista.setitem(ll_indi,'c_fecha_ult_clasif',datetime(date('01/01/1900'),time('00:00:00')))
			end if
			SELECT	"SOL_ESTATUS"."CORRELATIVO"  
			INTO 		:ll_corr  
			FROM 		"SOL_ESTATUS"  
			WHERE  ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
					 ( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
					 ( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
					 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
					 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '1' )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_indi,'solicitud','1')
			else
				SELECT	"SOL_ESTATUS"."CORRELATIVO"  
				INTO 		:ll_corr  
				FROM 		"SOL_ESTATUS"  
				WHERE  ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
						 ( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
						 ( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
						 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
						 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '2' )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_indi,'solicitud','2')
				else
					dw_lista.setitem(ll_indi,'solicitud','No Tiene')
				end if
			end if
			if ls_clasif='SIC_1' then
				wf_calcular_interes_ctto('E',ls_base,ls_serie,ll_numero,ll_indi)
			end if
			if ls_clasif='SIC_2' then
				//'c_sicom2'
				SELECT	COUNT("GC_DETALLE_GESTION"."NUMERO")  
				INTO 		:ll_count_reg  
				FROM 		"GC_DETALLE_GESTION"  
				WHERE  ( "GC_DETALLE_GESTION"."BASE" = :ls_base ) AND  
						 ( "GC_DETALLE_GESTION"."SERIE" = :ls_serie ) AND  
						 ( "GC_DETALLE_GESTION"."NUMERO" = :ll_numero ) AND  
						 ( "GC_DETALLE_GESTION"."CLASIFICACION" = 'SIC_1' )   
				USING		sqlca;
				if ll_count_reg > 0 then
					SELECT	SUM("INGRESO"."MONTO")  
					INTO 		:ll_monto_pagado  
					FROM 		"GC_DETALLE_GESTION",	"INGRESO"  
					WHERE  ( "GC_DETALLE_GESTION"."BASE" = "INGRESO"."BASE" ) and  
							 ( "GC_DETALLE_GESTION"."SERIE" = "INGRESO"."SERIE" ) and  
							 ( "GC_DETALLE_GESTION"."NUMERO" = "INGRESO"."CONTRATO" ) and  
							 (("GC_DETALLE_GESTION"."BASE" = :ls_base ) AND  
							 ( "GC_DETALLE_GESTION"."SERIE" = :ls_serie ) AND  
							 ( "GC_DETALLE_GESTION"."NUMERO" = :ll_numero ) AND  
							 ( "GC_DETALLE_GESTION"."CLASIFICACION" = 'SIC_1' ) AND  
							 ( "INGRESO"."TIPO_MOV" = 'E' ) AND  
							 ( "INGRESO"."FECHA_PAGO" >= ( SELECT 	MAX("GC_DETALLE_GESTION"."FECHA_CARTA_ENVIO") 
							 																 FROM 	"GC_DETALLE_GESTION" 
																							 WHERE ( "GC_DETALLE_GESTION"."BASE" = :ls_base ) AND 
																							 		 ( "GC_DETALLE_GESTION"."SERIE" = :ls_serie ) AND 
																									 ( "GC_DETALLE_GESTION"."NUMERO" = :ll_numero ) AND 
																									 ( "GC_DETALLE_GESTION"."CLASIFICACION" = 'SIC_1' ) ) ) AND  
							 ( "INGRESO"."FECHA_PAGO" <= :ld_fecha_hoy ) )   
					USING		sqlca;
					if ll_monto_pagado > 0 then
						dw_lista.setitem(ll_indi,'c_sicom2','S')
					else
						dw_lista.setitem(ll_indi,'c_sicom2','N')
					end if
				else
					dw_lista.setitem(ll_indi,'c_sicom2','X')
				end if
				wf_calcular_interes_ctto('E',ls_base,ls_serie,ll_numero,ll_indi)
			end if
			if ls_clasif='SIC_3' then
				//'c_sicom2'
				SELECT	COUNT("GC_DETALLE_GESTION"."NUMERO")  
				INTO 		:ll_count_reg  
				FROM 		"GC_DETALLE_GESTION"  
				WHERE  ( "GC_DETALLE_GESTION"."BASE" = :ls_base ) AND  
						 ( "GC_DETALLE_GESTION"."SERIE" = :ls_serie ) AND  
						 ( "GC_DETALLE_GESTION"."NUMERO" = :ll_numero ) AND  
						 ( "GC_DETALLE_GESTION"."CLASIFICACION" = 'SIC_2' )   
				USING		sqlca;
				if ll_count_reg > 0 then
					SELECT	SUM("INGRESO"."MONTO")  
					INTO 		:ll_monto_pagado  
					FROM 		"GC_DETALLE_GESTION",	"INGRESO"  
					WHERE  ( "GC_DETALLE_GESTION"."BASE" = "INGRESO"."BASE" ) and  
							 ( "GC_DETALLE_GESTION"."SERIE" = "INGRESO"."SERIE" ) and  
							 ( "GC_DETALLE_GESTION"."NUMERO" = "INGRESO"."CONTRATO" ) and  
							 (("GC_DETALLE_GESTION"."BASE" = :ls_base ) AND  
							 ( "GC_DETALLE_GESTION"."SERIE" = :ls_serie ) AND  
							 ( "GC_DETALLE_GESTION"."NUMERO" = :ll_numero ) AND  
							 ( "GC_DETALLE_GESTION"."CLASIFICACION" = 'SIC_2' ) AND  
							 ( "INGRESO"."TIPO_MOV" = 'E' ) AND  
							 ( "INGRESO"."FECHA_PAGO" >= ( SELECT 	MAX("GC_DETALLE_GESTION"."FECHA_CARTA_ENVIO") 
							 																 FROM 	"GC_DETALLE_GESTION" 
																							 WHERE ( "GC_DETALLE_GESTION"."BASE" = :ls_base ) AND 
																							 		 ( "GC_DETALLE_GESTION"."SERIE" = :ls_serie ) AND 
																									 ( "GC_DETALLE_GESTION"."NUMERO" = :ll_numero ) AND 
																									 ( "GC_DETALLE_GESTION"."CLASIFICACION" = 'SIC_2' ) ) ) AND  
							 ( "INGRESO"."FECHA_PAGO" <= :ld_fecha_hoy ) )   
					USING		sqlca;
					if ll_monto_pagado > 0 then
						dw_lista.setitem(ll_indi,'c_sicom3','S')
					else
						dw_lista.setitem(ll_indi,'c_sicom3','N')
					end if
				else
					dw_lista.setitem(ll_indi,'c_sicom3','X')
				end if
				wf_calcular_interes_ctto('E',ls_base,ls_serie,ll_numero,ll_indi)
			end if
			
			if ll_tot_porc <> ll_tot_porc_aux then 
				st_porc.text			= string(ll_tot_porc)+" %"
				ll_tot_porc_aux		= ll_tot_porc
			end if
			ll_tot_porc					= (ll_indi / ll_tot_reg) * 100
			hpb_1.Position 			= ll_tot_porc
		next
		st_fondo.visible				= false
		hpb_1.visible 					= false
		st_porc.visible 				= false
		if ls_clasif='I' or ls_clasif='A3' or ls_clasif='B3' or ls_clasif='C3' or &
			ls_clasif='B5' or ls_clasif='E5' or ls_clasif='B19' or ls_clasif='C19'  or &
			ls_clasif='B20' or ls_clasif='C20' then
			ls_filtro					= 'solicitud="No Tiene" and (nro_carta<>"'+ls_clasif+'" or isnull(nro_carta))'
		else
			ls_filtro					= '(c_fecha_ult_clasif <= c_fecha_menos_180 AND solicitud="No Tiene" and nro_carta="'+ ls_clasif +'") or ((nro_carta<>"'+ ls_clasif +'" or isnull(nro_carta)) AND solicitud="No Tiene")'
		end if
		if ls_clasif='S1' or ls_clasif='D8' or ls_clasif='B5' or ls_clasif='E5' then
			if ll_cod_parque=1 then
				ls_filtro				= ls_filtro+' and numero <= '+string(129499)
			elseif ll_cod_parque=102 then
				ls_filtro				= ls_filtro+' and numero <= '+string(130900)
			elseif ll_cod_parque=11 then
				ls_filtro				= ls_filtro+' and numero <= '+string(23499)
			end if
		end if
		if ls_clasif='S1_D' or ls_clasif='SIC_1' or ls_clasif='PS_D' then
			if ll_cod_parque=1 then
				ls_filtro				= ls_filtro+' and numero > '+string(129499)
			elseif ll_cod_parque=102 then
				ls_filtro				= ls_filtro+' and numero > '+string(130900)
			elseif ll_cod_parque=11 then
				ls_filtro				= ls_filtro+' and numero > '+string(23499)
			end if
		end if
		if ls_clasif='SIC_2' then
			ls_filtro					= ''
//			if ll_cod_parque=1 then
//				ls_filtro				= ls_filtro+' and c_sicom2 = "N" and numero > '+string(129499)
//			elseif ll_cod_parque=102 then
//				ls_filtro				= ls_filtro+' and c_sicom2 = "N" and numero > '+string(130900)
//			elseif ll_cod_parque=11 then
//				ls_filtro				= ls_filtro+' and c_sicom2 = "N" and numero > '+string(23499)
//			end if
		end if
		if ls_clasif='SIC_3' then
			ls_filtro					= ''
//			if ll_cod_parque=1 then
//				ls_filtro				= ls_filtro+' and c_sicom3 = "N" and numero > '+string(129499)
//			elseif ll_cod_parque=102 then
//				ls_filtro				= ls_filtro+' and c_sicom3 = "N" and numero > '+string(130900)
//			elseif ll_cod_parque=11 then
//				ls_filtro				= ls_filtro+' and c_sicom3 = "N" and numero > '+string(23499)
//			end if
		end if
		dw_lista.accepttext()
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	else
		messagebox("Advertencia","No Registra dato")
	end if
end if
tab_carta.visible						= false
SetPointer(Arrow!)
end event

type cb_cerrar from commandbutton within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 3410
integer y = 1972
integer width = 261
integer height = 92
integer taborder = 160
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;close(w_asignar_envio_carta)
end event

type dw_lista from datawindow within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 204
integer width = 3630
integer height = 1716
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_gc_a1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_click.visible	= false
end event

event clicked;String	ls_columna,ls_tipo_cob,ls_solicitud,ls_filtro,ls_clasif
Long		ll_estado_reg,ll_ini,ll_fin,ll_indi,ll_folio,ll_cod_parque
Datetime	ldt_fec_ult_clas,ldt_fecha_menos_180

this.accepttext()
ls_columna						= dwo.name
if row > 0 then
	if ls_columna='estado_reg' and (KeyDown(65) or KeyDown(KeyShift!)) then
		il_row						= row
		This.SelectRow(il_row, TRUE)
		This.scrolltorow(il_row)
		ll_estado_reg			= this.getitemnumber(il_row,'estado_reg')
		if ll_estado_reg=1 then
			this.setitem(il_row,'estado_reg',1)
			if il_row_aux <> il_row and il_row_aux>0 and il_row>0 then
				if il_row>il_row_aux then
					ll_ini			= il_row_aux 
					ll_fin			= il_row
				else
					ll_ini			= il_row 
					ll_fin			= il_row_aux
				end if
				ll_fin				= ll_fin - 1
				for ll_indi=ll_ini to ll_fin
					this.setitem(ll_indi,'estado_reg',0)
					This.SelectRow(il_row, TRUE)
					This.scrolltorow(il_row)
				next
				setnull(il_row_aux);setnull(il_row_aux)
			end if
		else
			this.setitem(il_row,'estado_reg',0)
			This.SelectRow(il_row, FALSE)
			il_row_aux			= il_row
		end if
		this.accepttext()
	else
		il_row						= row
		il_row_aux				= row
		This.SelectRow(0, FALSE)
		This.SelectRow(il_row, TRUE)
		This.scrolltorow(il_row)
	end if
	gi_rut 						= dw_lista.GetItemNumber(il_row, "rut")
	gs_base						= dw_lista.getitemstring(il_row, "base")
	gs_serie						= dw_lista.getitemstring(il_row, "serie")
	gi_numero					= dw_lista.getitemnumber(il_row, "numero")
	tab_carta.tabpage_1.dw_contrato.retrieve(gi_rut)
	tab_carta.tabpage_1.dw_cliente.retrieve(gi_rut)
	wf_cargar_dw_contrato()
	tab_carta.tabpage_2.dw_cobranza.retrieve(gi_rut)
	tab_carta.tabpage_2.dw_carta.retrieve(gi_rut)
	tab_carta.tabpage_2.dw_publico.retrieve(gi_rut)
	tab_carta.tabpage_3.dw_detalle_cuotas.retrieve(gs_serie,gi_numero,gs_base)
	tab_carta.tabpage_3.dw_detalle_mantencion.retrieve(gs_serie,gi_numero,gs_base)
	if tab_carta.tabpage_3.dw_detalle_total.retrieve(gs_serie,gi_numero,gs_base)>0 then
		ll_folio					= tab_carta.tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
		ls_tipo_cob				= tab_carta.tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
		tab_carta.tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
	else
		tab_carta.tabpage_3.dw_detalle_pagos.reset()
	end if
	if gs_base='C' then
		tab_carta.tabpage_3.st_6.visible							= true
		tab_carta.tabpage_3.dw_detalle_total.visible			= true
		tab_carta.tabpage_3.st_7.visible							= false
		tab_carta.tabpage_3.dw_detalle_cuotas.visible			= false
		tab_carta.tabpage_3.st_8.visible							= true
		tab_carta.tabpage_3.dw_detalle_mantencion.visible	= true
		tab_carta.tabpage_3.st_3.visible							= true
		tab_carta.tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_contrato_isa()
	elseif gs_base='D' or gs_base='P' or gs_base='L' or gs_base='R' then
		tab_carta.tabpage_3.st_6.visible							= true
		tab_carta.tabpage_3.dw_detalle_total.visible			= true
		tab_carta.tabpage_3.st_7.visible							= true
		tab_carta.tabpage_3.dw_detalle_cuotas.visible		= true
		tab_carta.tabpage_3.st_8.visible							= false
		tab_carta.tabpage_3.dw_detalle_mantencion.visible	= false
		tab_carta.tabpage_3.st_3.visible							= true
		tab_carta.tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_otros_cttos()
	elseif gs_base='O' then
		tab_carta.tabpage_3.st_6.visible							= true
		tab_carta.tabpage_3.dw_detalle_total.visible			= true
		tab_carta.tabpage_3.st_7.visible							= true
		tab_carta.tabpage_3.dw_detalle_cuotas.visible			= true
		tab_carta.tabpage_3.st_8.visible							= true
		tab_carta.tabpage_3.dw_detalle_mantencion.visible	= true
		tab_carta.tabpage_3.st_3.visible							= true
		tab_carta.tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_promesa()
	end if	
	tab_carta.visible													= true
else
	if dw_lista.dataobject='dw_lista_gc_sicom2' then
		ls_clasif					= trim(dw_select.getitemstring(1,'clasificacion'))
		ll_cod_parque			= dw_select.getitemnumber(1,'parque')
		ls_filtro					= ''
		if ls_columna='t_rojo' then
			ls_filtro				= 'c_sicom2 = "N"'
			dw_lista.SetFilter(ls_filtro)
			dw_lista.Filter()
		elseif ls_columna='t_amarillo' then
			ls_filtro				= 'c_sicom2 = "S"'
			dw_lista.SetFilter(ls_filtro)
			dw_lista.Filter()
		elseif ls_columna='t_blanco' then
			ls_filtro				= 'c_sicom2 = "X"'
			dw_lista.SetFilter(ls_filtro)
			dw_lista.Filter()
		elseif ls_columna='t_todo' then
			ls_filtro				= ''
			dw_lista.SetFilter(ls_filtro)
			dw_lista.Filter()
		end if
	elseif dw_lista.dataobject='dw_lista_gc_sicom3' then
		ls_clasif					= trim(dw_select.getitemstring(1,'clasificacion'))
		ll_cod_parque				= dw_select.getitemnumber(1,'parque')
		ls_filtro					= ''
		if ls_columna='t_rojo' then
			ls_filtro				= 'c_sicom3 = "N"'
			dw_lista.SetFilter(ls_filtro)
			dw_lista.Filter()
		elseif ls_columna='t_amarillo' then
			ls_filtro				= 'c_sicom3 = "S"'
			dw_lista.SetFilter(ls_filtro)
			dw_lista.Filter()
		elseif ls_columna='t_blanco' then
			ls_filtro				= 'c_sicom3 = "X"'
			dw_lista.SetFilter(ls_filtro)
			dw_lista.Filter()
		elseif ls_columna='t_todo' then
			ls_filtro				= ''
			dw_lista.SetFilter(ls_filtro)
			dw_lista.Filter()
		end if
	end if
end if
this.accepttext()
end event

event rowfocuschanged;Long		ll_folio,ll_estado_reg
String	ls_tipo_cob

dw_lista.accepttext()
if dw_lista.getrow()>0 then //and is_muestra_tab='S'
	if (KeyDown(65) or KeyDown(KeyShift!)) then
		il_row			= this.getrow()
		ll_estado_reg	= this.getitemnumber(il_row,'estado_reg')
		This.SelectRow(il_row, TRUE)
		this.scrolltorow(il_row)
		if ll_estado_reg=0 then
			dw_lista.setitem(il_row,'estado_reg',1)
			This.SelectRow(il_row, false)
			this.accepttext()
		elseif ll_estado_reg=1 then
			dw_lista.setitem(il_row,'estado_reg',0)
			This.SelectRow(il_row, true)
			this.scrolltorow(il_row)
			this.accepttext()
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
	gs_base																= dw_lista.getitemstring(il_row, "base")
	gs_serie																= dw_lista.getitemstring(il_row, "serie")
	gi_numero															= dw_lista.getitemnumber(il_row, "numero")
	tab_carta.tabpage_1.dw_contrato.retrieve(gi_rut)
	tab_carta.tabpage_1.dw_cliente.retrieve(gi_rut)
	wf_cargar_dw_contrato()
	tab_carta.tabpage_2.dw_cobranza.retrieve(gi_rut)
	tab_carta.tabpage_2.dw_carta.retrieve(gi_rut)
	tab_carta.tabpage_2.dw_publico.retrieve(gi_rut)
	tab_carta.tabpage_3.dw_detalle_cuotas.retrieve(gs_serie,gi_numero,gs_base)
	tab_carta.tabpage_3.dw_detalle_mantencion.retrieve(gs_serie,gi_numero,gs_base)
	if tab_carta.tabpage_3.dw_detalle_total.retrieve(gs_serie,gi_numero,gs_base)>0 then
		ll_folio															= tab_carta.tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
		ls_tipo_cob														= tab_carta.tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
		tab_carta.tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
	else
		tab_carta.tabpage_3.dw_detalle_pagos.reset()
	end if
	if gs_base='C' then
		tab_carta.tabpage_3.st_6.visible							= true
		tab_carta.tabpage_3.dw_detalle_total.visible			= true
		tab_carta.tabpage_3.st_7.visible							= false
		tab_carta.tabpage_3.dw_detalle_cuotas.visible		= false
		tab_carta.tabpage_3.st_8.visible							= true
		tab_carta.tabpage_3.dw_detalle_mantencion.visible	= true
		tab_carta.tabpage_3.st_3.visible							= true
		tab_carta.tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_contrato_isa()
	elseif gs_base='D' or gs_base='P' or gs_base='L' or gs_base='R' then
		tab_carta.tabpage_3.st_6.visible							= true
		tab_carta.tabpage_3.dw_detalle_total.visible			= true
		tab_carta.tabpage_3.st_7.visible							= true
		tab_carta.tabpage_3.dw_detalle_cuotas.visible		= true
		tab_carta.tabpage_3.st_8.visible							= false
		tab_carta.tabpage_3.dw_detalle_mantencion.visible	= false
		tab_carta.tabpage_3.st_3.visible							= true
		tab_carta.tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_otros_cttos()
	elseif gs_base='O' then
		tab_carta.tabpage_3.st_6.visible							= true
		tab_carta.tabpage_3.dw_detalle_total.visible			= true
		tab_carta.tabpage_3.st_7.visible							= true
		tab_carta.tabpage_3.dw_detalle_cuotas.visible		= true
		tab_carta.tabpage_3.st_8.visible							= true
		tab_carta.tabpage_3.dw_detalle_mantencion.visible	= true
		tab_carta.tabpage_3.st_3.visible							= true
		tab_carta.tabpage_3.dw_detalle_pagos.visible			= true
		wf_pos_promesa()
	end if	
	tab_carta.visible													= true
else
	tab_carta.visible													= false
end if
this.accepttext()
end event

type gb_1 from groupbox within w_asignar_envio_carta
event ue_mousemove pbm_mousemove
integer x = 2057
integer y = 1924
integer width = 1143
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

event ue_mousemove;st_click.visible	= false
end event

type dw_select from datawindow within w_asignar_envio_carta
event ue_mousemove pbm_dwnmousemove
integer x = 23
integer y = 56
integer width = 2478
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "dwe_select_parque_clasif"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;string	ls_columna
ls_columna				= dwo.name
if ls_columna='clasificacion_t' then
	st_click.visible	= true
else
	st_click.visible	= false
end if
end event

event itemchanged;String	ls_columna,ls_clasif,ls_fecha
Long		ll_parque,ll_month
Date		ld_fecha

this.accepttext()
dw_lista.reset()
tab_carta.visible				= false
cb_sacar.italic				= false
cb_marcar.text					= 'Marcar Todo'
ls_columna						= dwo.name
if ls_columna='parque' then
	ll_parque					= dw_select.getitemnumber(1,'parque')
	if ll_parque>0 then
		idw_detalle.retrieve(ll_parque)
	end if
elseif ls_columna='clasificacion' then
	ls_clasif					= dw_select.getitemstring(1,'clasificacion')
	if ls_clasif='CG' or ls_clasif='D8' or ls_clasif='PS_D' then
		st_9.visible			= true
		em_fec_ini.visible	= true
		p_ini.visible			= true
		ld_fecha					= date(gdt_fec_sistema)
		ll_month					= month(ld_fecha)
		if ll_month=1 then
			ls_fecha				= '31/01/'+string(year(ld_fecha),"0000")
		elseif ll_month=2 then
			ls_fecha				= '28/02/'+string(year(ld_fecha),"0000")
		elseif ll_month=3 then
			ls_fecha				= '31/03/'+string(year(ld_fecha),"0000")
		elseif ll_month=4 then
			ls_fecha				= '30/04/'+string(year(ld_fecha),"0000")
		elseif ll_month=5 then
			ls_fecha				= '31/05/'+string(year(ld_fecha),"0000")
		elseif ll_month=6 then
			ls_fecha				= '30/06/'+string(year(ld_fecha),"0000")
		elseif ll_month=7 then
			ls_fecha				= '31/07/'+string(year(ld_fecha),"0000")
		elseif ll_month=8 then
			ls_fecha				= '31/08/'+string(year(ld_fecha),"0000")
		elseif ll_month=9 then
			ls_fecha				= '30/09/'+string(year(ld_fecha),"0000")
		elseif ll_month=10 then
			ls_fecha				= '31/10/'+string(year(ld_fecha),"0000")
		elseif ll_month=11 then
			ls_fecha				= '30/11/'+string(year(ld_fecha),"0000")
		elseif ll_month=12 then
			ls_fecha				= '31/12/'+string(year(ld_fecha),"0000")
		end if
		em_fec_ini.text		= string(date(ls_fecha),"dd/mm/yyyy")
		pb_ok.x					= 3415
	else
		st_9.visible			= false
		em_fec_ini.visible	= false
		p_ini.visible			= false
		pb_ok.x					= 2533
	end if
end if

end event

event clicked;String	ls_columna,ls_filtro,ls_clasif
Long		ll_cod_parque

dw_select.accepttext()
ls_columna			= dwo.name
if ls_columna='clasificacion_t' then
	ll_cod_parque	= dw_select.getitemnumber(1,'parque')
	ls_clasif		= trim(dw_select.getitemstring(1,'clasificacion'))
	if ll_cod_parque>0 and not isnull(ls_clasif) and ls_clasif<>'' then
		ls_filtro	= string(ll_cod_parque)+'~t'+ls_clasif
		openwithparm(w_significado_tipo_carta,ls_filtro)
	else
		if ll_cod_parque=0 or isnull(ll_cod_parque) then
			messagebox("Advertencia","Debe Seleccionar Parque")
			dw_select.setfocus()
			dw_select.setcolumn('parque')
		elseif ls_clasif='' or isnull(ls_clasif) then
			messagebox("Advertencia","Debe Seleccionar Tipo Carta")
			dw_select.setfocus()
			dw_select.setcolumn('clasificacion')
		end if
	end if
end if
end event

