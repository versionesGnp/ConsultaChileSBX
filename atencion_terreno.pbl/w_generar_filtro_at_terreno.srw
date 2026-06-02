forward
global type w_generar_filtro_at_terreno from window
end type
type rb_generadas from radiobutton within w_generar_filtro_at_terreno
end type
type rb_nuevo from radiobutton within w_generar_filtro_at_terreno
end type
type st_1 from statictext within w_generar_filtro_at_terreno
end type
type em_ctto from editmask within w_generar_filtro_at_terreno
end type
type pb_buscar from picturebutton within w_generar_filtro_at_terreno
end type
type cbx_parque from checkbox within w_generar_filtro_at_terreno
end type
type cb_1 from commandbutton within w_generar_filtro_at_terreno
end type
type cb_actualizar from commandbutton within w_generar_filtro_at_terreno
end type
type cb_seleccionar from commandbutton within w_generar_filtro_at_terreno
end type
type cb_mostrar from commandbutton within w_generar_filtro_at_terreno
end type
type cb_limpiar from commandbutton within w_generar_filtro_at_terreno
end type
type st_buscar from statictext within w_generar_filtro_at_terreno
end type
type cb_grabar_formula from picturebutton within w_generar_filtro_at_terreno
end type
type pb_filtrar from picturebutton within w_generar_filtro_at_terreno
end type
type dw_filtro from datawindow within w_generar_filtro_at_terreno
end type
type cb_geo from commandbutton within w_generar_filtro_at_terreno
end type
type tab_cobranza from uo_atencion_terreno within w_generar_filtro_at_terreno
end type
type tab_cobranza from uo_atencion_terreno within w_generar_filtro_at_terreno
end type
type st_porc from statictext within w_generar_filtro_at_terreno
end type
type hpb_1 from hprogressbar within w_generar_filtro_at_terreno
end type
type st_fondo from statictext within w_generar_filtro_at_terreno
end type
type cb_ordenar from commandbutton within w_generar_filtro_at_terreno
end type
type cb_filtrar from commandbutton within w_generar_filtro_at_terreno
end type
type cb_imprimir from commandbutton within w_generar_filtro_at_terreno
end type
type cb_historico from commandbutton within w_generar_filtro_at_terreno
end type
type cb_ctacte from commandbutton within w_generar_filtro_at_terreno
end type
type cb_asignar from commandbutton within w_generar_filtro_at_terreno
end type
type pb_ok from picturebutton within w_generar_filtro_at_terreno
end type
type dw_seleccionar from datawindow within w_generar_filtro_at_terreno
end type
type cb_cerrar from commandbutton within w_generar_filtro_at_terreno
end type
type dw_lista from datawindow within w_generar_filtro_at_terreno
end type
type gb_1 from groupbox within w_generar_filtro_at_terreno
end type
type gb_2 from groupbox within w_generar_filtro_at_terreno
end type
type gb_4 from groupbox within w_generar_filtro_at_terreno
end type
end forward

global type w_generar_filtro_at_terreno from window
integer width = 3479
integer height = 2216
boolean titlebar = true
string title = "Asignar Cartera Atención Terreno"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
rb_generadas rb_generadas
rb_nuevo rb_nuevo
st_1 st_1
em_ctto em_ctto
pb_buscar pb_buscar
cbx_parque cbx_parque
cb_1 cb_1
cb_actualizar cb_actualizar
cb_seleccionar cb_seleccionar
cb_mostrar cb_mostrar
cb_limpiar cb_limpiar
st_buscar st_buscar
cb_grabar_formula cb_grabar_formula
pb_filtrar pb_filtrar
dw_filtro dw_filtro
cb_geo cb_geo
tab_cobranza tab_cobranza
st_porc st_porc
hpb_1 hpb_1
st_fondo st_fondo
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_imprimir cb_imprimir
cb_historico cb_historico
cb_ctacte cb_ctacte
cb_asignar cb_asignar
pb_ok pb_ok
dw_seleccionar dw_seleccionar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
gb_4 gb_4
end type
global w_generar_filtro_at_terreno w_generar_filtro_at_terreno

type variables
Datetime	idt_fecha_hoy
Long		il_row,il_row_aux
Double	id_factor_gc
string		is_tipo_cob
end variables

forward prototypes
public subroutine wf_pos_promesa ()
public subroutine wf_pos_contrato_isa ()
public subroutine wf_pos_otros_cttos ()
public subroutine wf_control_marcar (string as_control)
public subroutine wf_cargar_dw_contrato ()
end prototypes

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
tab_cobranza.tabpage_3.dw_detalle_cuotas.height		= 292

tab_cobranza.tabpage_3.st_8.x									= 27
tab_cobranza.tabpage_3.st_8.y									= 724
tab_cobranza.tabpage_3.st_8.width							= 850
tab_cobranza.tabpage_3.st_8.height							= 56
tab_cobranza.tabpage_3.dw_detalle_mantencion.x		= 18
tab_cobranza.tabpage_3.dw_detalle_mantencion.y		= 780
tab_cobranza.tabpage_3.dw_detalle_mantencion.width	= 2277
tab_cobranza.tabpage_3.dw_detalle_mantencion.height	= 292

tab_cobranza.tabpage_3.st_3.x									= 27
tab_cobranza.tabpage_3.st_3.y									= 1084
tab_cobranza.tabpage_3.st_3.width							= 1001
tab_cobranza.tabpage_3.st_3.height							= 56
tab_cobranza.tabpage_3.dw_detalle_pagos.x				= 18
tab_cobranza.tabpage_3.dw_detalle_pagos.y				= 1140
tab_cobranza.tabpage_3.dw_detalle_pagos.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_pagos.height			= 292
end subroutine

public subroutine wf_pos_contrato_isa ();tab_cobranza.tabpage_3.st_6.x										= 27
tab_cobranza.tabpage_3.st_6.y										= 4
tab_cobranza.tabpage_3.st_6.width								= 850
tab_cobranza.tabpage_3.st_6.height								= 56
tab_cobranza.tabpage_3.dw_detalle_total.x						= 18
tab_cobranza.tabpage_3.dw_detalle_total.y						= 60
tab_cobranza.tabpage_3.dw_detalle_total.width				= 2277
tab_cobranza.tabpage_3.dw_detalle_total.height				= 412

tab_cobranza.tabpage_3.st_8.x										= 27
tab_cobranza.tabpage_3.st_8.y										= 480
tab_cobranza.tabpage_3.st_8.width								= 850
tab_cobranza.tabpage_3.st_8.height								= 56
tab_cobranza.tabpage_3.dw_detalle_mantencion.x			= 18
tab_cobranza.tabpage_3.dw_detalle_mantencion.y			= 536
tab_cobranza.tabpage_3.dw_detalle_mantencion.width		= 2277
tab_cobranza.tabpage_3.dw_detalle_mantencion.height		= 412

tab_cobranza.tabpage_3.st_3.x										= 27
tab_cobranza.tabpage_3.st_3.y										= 956
tab_cobranza.tabpage_3.st_3.width								= 1001
tab_cobranza.tabpage_3.st_3.height								= 56
tab_cobranza.tabpage_3.dw_detalle_pagos.x					= 18
tab_cobranza.tabpage_3.dw_detalle_pagos.y					= 1012
tab_cobranza.tabpage_3.dw_detalle_pagos.width				= 2277
tab_cobranza.tabpage_3.dw_detalle_pagos.height				= 412
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
tab_cobranza.tabpage_3.dw_detalle_pagos.x				= 18
tab_cobranza.tabpage_3.dw_detalle_pagos.y				= 1012
tab_cobranza.tabpage_3.dw_detalle_pagos.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_pagos.height			= 412
end subroutine

public subroutine wf_control_marcar (string as_control);long		ll_tot_reg,ll_indi,ll_estado_reg
String	ls_usuario_asig,ls_estado_llamada


ll_tot_reg						= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_estado_reg				= dw_lista.getitemnumber(ll_indi,'estado_reg')
	ls_usuario_asig				= dw_lista.getitemstring(ll_indi,'usuario_asignado')
	ls_estado_llamada			= dw_lista.getitemstring(ll_indi,'vista_atencion_terreno_estado_llamada')
	if isnull(ls_usuario_asig) or ls_usuario_asig='' or ls_usuario_asig='No Asignado' then
		if ll_estado_reg=1 and (ls_estado_llamada='' or isnull(ls_estado_llamada)) then
			if as_control='M' then dw_lista.setitem(ll_indi,'estado_reg',0)
		end if
		if as_control='D' then dw_lista.setitem(ll_indi,'estado_reg',1)
	end if
next
dw_lista.accepttext()
end subroutine

public subroutine wf_cargar_dw_contrato ();Long		ll_tot_reg,ll_indi,ll_mora_cred,ll_mora_mant,ll_dias_mora_cred,ll_dias_mora_mant,&
			ii_mora_cobro,ii_inc_gastos,i,ll_valor_total,ll_cta_pag_s,ll_cta_pag_m,ll_plazo,ll_cta_pag_la,&
			ll_cta_pag_isa
String	ls_base,ls_serie,ls_moneda,ls_estado_comi
Double	lld_tasa,lld_valor_cuota,lld_tasa_peso,lld_valor_cuota_peso,id_gc,id_im,lld_valor_cuota_m,&
			id_monto,ll_numero

ll_tot_reg											= tab_cobranza.tabpage_1.dw_contrato.retrieve(gi_rut)
for ll_indi=1 to ll_tot_reg
	ls_base											= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi,'cadena_codigo')
	ls_serie											= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi,'cadena_serie')
	ll_numero										= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_numero')
	ll_mora_cred									= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_mora_cred')
	ll_mora_mant									= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_mora_mant')
	ll_dias_mora_cred								= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_dias_mora_cred')
	ll_dias_mora_mant							= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_dias_mora_mant')
	CHOOSE CASE ls_base
		CASE 'O'
			SELECT	"PAGO_OFERTA"."TASA",   "PAGO_OFERTA"."MONEDA",   	"PAGO_OFERTA"."VALOR_CUOTA" ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"OFERTA_V"."VALOR_CUOTA_M",	"OFERTA_V"."CTA_PAG_S",	"OFERTA_V"."CTA_PAG_M",	"OFERTA_V"."ESTADO_COMI",	"PAGO_OFERTA"."NRO_CUOTAS"
			INTO 		:lld_tasa,   				:ls_moneda,   					:lld_valor_cuota  ,   				:lld_tasa_peso,   		:lld_tasa  ,				:lld_valor_cuota_m,				:ll_cta_pag_s,				:ll_cta_pag_m,				:ls_estado_comi,				:ll_plazo
			FROM 	"CADENA",   "OFERTA_V",   "PAGO_OFERTA"  ,	"TASA"
			WHERE	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
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
					lld_valor_cuota_peso			= lld_valor_cuota * gd_uf_dia
					lld_tasa							= lld_tasa
				else
					lld_tasa							= lld_tasa_peso
				end if
				lld_valor_cuota_peso 				= Round(lld_valor_cuota_peso, 0)
				id_gc 									= 0
				id_im 									= 0
				ii_mora_cobro 						= 1
				ii_inc_gastos 						= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro 				= (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto 					= (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto 					= (id_monto)
						id_monto 					= round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im 							= id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc 						= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
							ii_inc_gastos 			= 1
						END IF
					END IF
				NEXT
				ll_valor_total						= ll_mora_cred * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
// 			Promesa Calculo Mantencion				
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso			= lld_valor_cuota_m * gd_uf_dia
					lld_tasa							= lld_tasa
				else
					lld_tasa							= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 									= 0
				id_im 									= 0
				ii_mora_cobro 						= 0
				ii_inc_gastos 						= 0
				FOR i = 1 TO ll_mora_mant 
					IF (ll_dias_mora_mant - (i - 1) * 365) > 1 THEN 
						ii_mora_cobro				= (ll_dias_mora_mant - (i - 1) * 365)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto 					= (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto 					= (id_monto)
						id_monto 					= round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im 							= id_im + id_monto
						IF (ll_dias_mora_mant - (i - 1) * 365) > 30 THEN 
							 id_gc 					= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // CAMBIO DE 10 A 5%
							 ii_inc_gastos 			= 1
						END IF
					END IF
				NEXT
				ll_valor_total						= ll_mora_mant * lld_valor_cuota_peso
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
					lld_valor_cuota_peso				= lld_valor_cuota_m * gd_uf_dia
					lld_tasa								= lld_tasa
				else
					lld_tasa								= lld_tasa_peso
				end if
				lld_valor_cuota_peso 					= Round(lld_valor_cuota_peso, 0)
				id_gc 										= 0
				id_im 										= 0
				ii_mora_cobro 							= 0
				ii_inc_gastos 							= 0
				FOR i = 1 TO ll_mora_mant 
					IF (ll_dias_mora_mant - (i - 1) * 365) > 1 THEN 
						ii_mora_cobro					= (ll_dias_mora_mant - (i - 1) * 365)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto 						= (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto 						= (id_monto)
						id_monto 						= round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im 								= id_im + id_monto
						IF (ll_dias_mora_mant - (i - 1) * 365) > 30 THEN 
							 id_gc 						= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // CAMBIO DE 10 A 5%
							 ii_inc_gastos 				= 1
						END IF
					END IF
				NEXT
				ll_valor_total							= ll_mora_mant * lld_valor_cuota_peso
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
					lld_valor_cuota_peso				= lld_valor_cuota * gd_uf_dia
					lld_tasa								= lld_tasa
				else
					lld_tasa								= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 										= 0
				id_im 										= 0
				ii_mora_cobro 							= 1
				ii_inc_gastos 							= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro 					= (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto 						= (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto 						= (id_monto)
						id_monto 						= round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im 								= id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc 							= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
							ii_inc_gastos 				= 1
						END IF
					END IF
				NEXT
				ll_valor_total							= ll_mora_cred * lld_valor_cuota_peso
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
					lld_valor_cuota_peso				= lld_valor_cuota * gd_uf_dia
					lld_tasa								= lld_tasa
				else
					lld_tasa								= lld_tasa_peso
				end if
				lld_valor_cuota_peso 					= Round(lld_valor_cuota_peso, 0)
				id_gc 										= 0
				id_im 										= 0
				ii_mora_cobro 							= 1
				ii_inc_gastos 							= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro 					= (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto 						= (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto 						= (id_monto)
						id_monto 						= round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im 								= id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc 							= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
							ii_inc_gastos 				= 1
						END IF
					END IF
				NEXT
				ll_valor_total							= ll_mora_cred * lld_valor_cuota_peso
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
					lld_valor_cuota_peso				= lld_valor_cuota * gd_uf_dia
					lld_tasa								= lld_tasa
				else
					lld_tasa								= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 										= 0
				id_im 										= 0
				ii_mora_cobro 							= 1
				ii_inc_gastos 							= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro 					= (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto 						= (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto 						= (id_monto)
						id_monto 						= round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im 								= id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc 							= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
							ii_inc_gastos 				= 1
						END IF
					END IF
				NEXT
				ll_valor_total							= ll_mora_cred * lld_valor_cuota_peso
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
			SELECT	"PAGO_AUMENTO"."TASA",	 "PAGO_AUMENTO"."VALOR_CUOTA",	"PAGO_AUMENTO"."MONEDA",	"TASA"."TASA_INT_P",	"TASA"."TASA_INT_UF",	"ANEXO_AUMENTO"."CTA_PAG_M",	"ANEXO_AUMENTO"."ESTADO_COMI",	"PAGO_AUMENTO"."NRO_CUOTAS"
			INTO 		:lld_tasa,   						:lld_valor_cuota,   								:ls_moneda  ,						:lld_tasa_peso,   			:lld_tasa ,					:ll_cta_pag_m,								:ls_estado_comi,								:ll_plazo
			FROM 	"ANEXO_AUMENTO",   "CADENA",   "PAGO_AUMENTO"  ,	"TASA"
			WHERE	( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
						( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
					 	( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
					 	( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
					 	( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
					 	(("CADENA"."CODIGO" = 'A' ) AND  
					 	( "CADENA"."SERIE" = :ls_serie ) AND  
					 	( "CADENA"."NUMERO" = :ll_numero ) )   
		 	USING	sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso							= lld_valor_cuota * gd_uf_dia
					lld_tasa											= lld_tasa
				else
					lld_tasa											= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 													= 0
				id_im 													= 0
				ii_mora_cobro 										= 1
				ii_inc_gastos 										= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro 								= (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto 									= (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto 									= (id_monto)
						id_monto 									= round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im 											= id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc 										= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
							ii_inc_gastos 							= 1
						END IF
					END IF
				NEXT
				ll_valor_total										= ll_mora_cred * lld_valor_cuota_peso
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
			FROM		"CADENA",   "REPACTA_MANTENCION",   "TASA"  
			WHERE	( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
						( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
					 	(("CADENA"."CODIGO" = 'R' ) AND  
					 	( "CADENA"."SERIE" = :ls_serie ) AND  
					 	( "CADENA"."NUMERO" = :ll_numero ) )   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso					= lld_valor_cuota * gd_uf_dia
					lld_tasa									= lld_tasa
				else
					lld_tasa									= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 											= 0
				id_im 											= 0
				ii_mora_cobro 								= 1
				ii_inc_gastos 								= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro 						= (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto 							= (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto 							= (id_monto)
						id_monto 							= round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im 									= id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc 								= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
							ii_inc_gastos 					= 1
						END IF
					END IF
				NEXT
				ll_valor_total								= ll_mora_cred * lld_valor_cuota_peso
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
	END CHOOSE
next
end subroutine

on w_generar_filtro_at_terreno.create
this.rb_generadas=create rb_generadas
this.rb_nuevo=create rb_nuevo
this.st_1=create st_1
this.em_ctto=create em_ctto
this.pb_buscar=create pb_buscar
this.cbx_parque=create cbx_parque
this.cb_1=create cb_1
this.cb_actualizar=create cb_actualizar
this.cb_seleccionar=create cb_seleccionar
this.cb_mostrar=create cb_mostrar
this.cb_limpiar=create cb_limpiar
this.st_buscar=create st_buscar
this.cb_grabar_formula=create cb_grabar_formula
this.pb_filtrar=create pb_filtrar
this.dw_filtro=create dw_filtro
this.cb_geo=create cb_geo
this.tab_cobranza=create tab_cobranza
this.st_porc=create st_porc
this.hpb_1=create hpb_1
this.st_fondo=create st_fondo
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_imprimir=create cb_imprimir
this.cb_historico=create cb_historico
this.cb_ctacte=create cb_ctacte
this.cb_asignar=create cb_asignar
this.pb_ok=create pb_ok
this.dw_seleccionar=create dw_seleccionar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_4=create gb_4
this.Control[]={this.rb_generadas,&
this.rb_nuevo,&
this.st_1,&
this.em_ctto,&
this.pb_buscar,&
this.cbx_parque,&
this.cb_1,&
this.cb_actualizar,&
this.cb_seleccionar,&
this.cb_mostrar,&
this.cb_limpiar,&
this.st_buscar,&
this.cb_grabar_formula,&
this.pb_filtrar,&
this.dw_filtro,&
this.cb_geo,&
this.tab_cobranza,&
this.st_porc,&
this.hpb_1,&
this.st_fondo,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_imprimir,&
this.cb_historico,&
this.cb_ctacte,&
this.cb_asignar,&
this.pb_ok,&
this.dw_seleccionar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.gb_4}
end on

on w_generar_filtro_at_terreno.destroy
destroy(this.rb_generadas)
destroy(this.rb_nuevo)
destroy(this.st_1)
destroy(this.em_ctto)
destroy(this.pb_buscar)
destroy(this.cbx_parque)
destroy(this.cb_1)
destroy(this.cb_actualizar)
destroy(this.cb_seleccionar)
destroy(this.cb_mostrar)
destroy(this.cb_limpiar)
destroy(this.st_buscar)
destroy(this.cb_grabar_formula)
destroy(this.pb_filtrar)
destroy(this.dw_filtro)
destroy(this.cb_geo)
destroy(this.tab_cobranza)
destroy(this.st_porc)
destroy(this.hpb_1)
destroy(this.st_fondo)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_imprimir)
destroy(this.cb_historico)
destroy(this.cb_ctacte)
destroy(this.cb_asignar)
destroy(this.pb_ok)
destroy(this.dw_seleccionar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_4)
end on

event open;Long		ll_fila,ll_new
String		ls_ciudad

dw_filtro.reset()
SetPointer(HourGlass!)

if rb_nuevo.checked = true then
	gs_tipo_cob 									= 'N'
elseif 	rb_generadas.checked = true then
	gs_tipo_cob 									= 'T'
end if
dw_filtro.enabled									= false
pb_filtrar.enabled									= false
idt_fecha_hoy										= datetime(date(gdt_fec_sistema),time('00:00:00'))
id_factor_gc											= f_factor_gasto_cobranza()
gf_centrar(w_generar_filtro_at_terreno)
dw_lista.settransobject(sqlca)
st_fondo.visible										= false
hpb_1.visible 										= false
st_porc.visible 										= false
dw_seleccionar.object.parque.visible			= true
dw_seleccionar.object.parque2.visible		= false
cbx_parque.checked 								= true
cbx_parque.text 									= 'Selección Opción Por Parque'
dw_seleccionar.dataobject						= 'dwe_seleccionar_filtro'
dw_seleccionar.settransobject(sqlca)
ll_new												= dw_seleccionar.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	dw_seleccionar.setitem(ll_new,'parque',1)
	ls_ciudad											= '130'
elseif gs_conexion	= "Parque La Foresta" then
	dw_seleccionar.setitem(ll_new,'parque',11)
	ls_ciudad											= '40'
elseif gs_conexion	= "Parque Concepción" then
	dw_seleccionar.setitem(ll_new,'parque',801)
	ls_ciudad											= '80301'
end if

dw_seleccionar.accepttext()
dw_seleccionar.object.uso.visible           = false //nuevo
dw_seleccionar.object.t_uso.visible        = false //nuevo
//pb_ok.X                                       		= 809 //nuevo
dw_seleccionar.accepttext()
dw_filtro.SetTransObject(SQLCA)
dw_filtro.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
ll_fila				= dw_filtro.InsertRow(0)
//dw_filtro.setitem(ll_fila,'ciudad',ls_ciudad)
//idw_detalle.retrieve(ls_ciudad)
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
SetPointer(Arrow!)
end event

event mousemove;st_buscar.visible	= false
end event

type rb_generadas from radiobutton within w_generar_filtro_at_terreno
integer x = 882
integer y = 128
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Generadas"
end type

event clicked;if rb_nuevo.checked = true then
	rb_nuevo.checked = false
end if	
end event

type rb_nuevo from radiobutton within w_generar_filtro_at_terreno
integer x = 882
integer y = 64
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nuevo"
boolean checked = true
end type

event clicked;if rb_generadas.checked = true then
	rb_generadas.checked = false
end if	
end event

type st_1 from statictext within w_generar_filtro_at_terreno
integer x = 2208
integer y = 1900
integer width = 293
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Ctto:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_ctto from editmask within w_generar_filtro_at_terreno
integer x = 2510
integer y = 1880
integer width = 462
integer height = 92
integer taborder = 200
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if long(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_generar_filtro_at_terreno
integer x = 2976
integer y = 1880
integer width = 110
integer height = 92
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string		ls_string
Double	ll_numero
ll_numero							= Double(em_ctto.text)
ll_tot_reg							= dw_lista.rowcount()
if ll_numero>0 and ll_tot_reg>0 then
	ls_string							= "numero = "+string(ll_numero)
	ll_fila 								= dw_lista.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_lista.scrolltorow(ll_fila)
		dw_lista.SelectRow(ll_fila, true)
		dw_lista.setitem(ll_fila,'estado_reg',0)
		dw_lista.accepttext()
	else
		messagebox("Advertencia","Nº Contrato No Existe en Lista")
		dw_lista.scrolltorow(1)
	end if
end if

end event

type cbx_parque from checkbox within w_generar_filtro_at_terreno
integer x = 69
integer y = 8
integer width = 823
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selección Opción Por Parque"
boolean checked = true
end type

event clicked;string	ls_ciudad
long	ll_new,ll_fila

dw_filtro.reset()
if cbx_parque.checked = true then
	cbx_parque.text 								= 'Selección Opción Por Parque'
	dw_seleccionar.object.parque.visible		= true
	dw_seleccionar.object.parque2.visible	= false
	cbx_parque.width								= 827
elseif cbx_parque.checked = false then
	cbx_parque.text 								= 'Selección Opción'
	dw_seleccionar.object.parque.visible		= false
	dw_seleccionar.object.parque2.visible	= true
	cbx_parque.width								= 526
	dw_seleccionar.setitem(1,'parque2',99)
end if
ll_new											= dw_seleccionar.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	dw_seleccionar.setitem(ll_new,'parque',1)
	ls_ciudad											= '130'
elseif gs_conexion	= "Parque La Foresta" then
	dw_seleccionar.setitem(ll_new,'parque',11)
	ls_ciudad											= '40'
end if
dw_seleccionar.accepttext()
ll_fila													= dw_filtro.insertrow(0)
//dw_filtro.setitem(ll_fila,'ciudad',ls_ciudad)
//idw_detalle.retrieve(ls_ciudad)
	
end event

type cb_1 from commandbutton within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 302
integer y = 1880
integer width = 393
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar Formula"
end type

event clicked;open(w_formulas)
end event

type cb_actualizar from commandbutton within w_generar_filtro_at_terreno
boolean visible = false
integer x = 1792
integer y = 1884
integer width = 183
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

type cb_seleccionar from commandbutton within w_generar_filtro_at_terreno
integer x = 1769
integer y = 1992
integer width = 411
integer height = 92
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Seleccionar Todo"
end type

event clicked;if dw_lista.rowcount()>0 then
	if cb_seleccionar.text='Seleccionar Todo' then
		wf_control_marcar('M')
		cb_seleccionar.text='Desmarcar Todo'
	else
		wf_control_marcar('D')
		cb_seleccionar.text='Seleccionar Todo'
	end if
end if
end event

type cb_mostrar from commandbutton within w_generar_filtro_at_terreno
integer x = 1376
integer y = 1992
integer width = 389
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Mostrar Dato"
end type

event clicked;Long		ll_folio
String	ls_tipo_cob,ls_nulo
if il_row>0 and dw_lista.rowcount()>0 then
	setnull(ls_nulo)
	gi_rut 																	= dw_lista.GetItemNumber(il_row, "rut")
	gs_base																	= dw_lista.getitemstring(il_row, "base")
	gs_serie																	= dw_lista.getitemstring(il_row, "serie")
	gi_numero																= dw_lista.getitemnumber(il_row, "numero")
	wf_cargar_dw_contrato()
	tab_cobranza.tabpage_1.dw_cliente.retrieve(gi_rut)
	tab_cobranza.tabpage_2.dw_cobranza.retrieve(gi_rut)
	tab_cobranza.tabpage_2.dw_carta.retrieve(gi_rut)
	tab_cobranza.tabpage_2.dw_publico.retrieve(gi_rut)
	tab_cobranza.tabpage_3.dw_detalle_cuotas.retrieve(gs_serie,gi_numero,gs_base)
	tab_cobranza.tabpage_3.dw_detalle_mantencion.retrieve(gs_serie,gi_numero,gs_base)
	if tab_cobranza.tabpage_3.dw_detalle_total.retrieve(gs_serie,gi_numero,gs_base)>0 then
		ll_folio																= tab_cobranza.tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
		ls_tipo_cob															= tab_cobranza.tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
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
	tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'estado',ls_nulo)
	tab_cobranza.tabpage_4.rb_si.checked							= true
	tab_cobranza.tabpage_4.em_fecha_prox.text					= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
	tab_cobranza.tabpage_4.em_fecha_prox_terre.text			= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
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
	tab_cobranza.tabpage_5.dw_ingreso_terreno.setitem(1,'estado',ls_nulo)
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
end if
end event

type cb_limpiar from commandbutton within w_generar_filtro_at_terreno
integer x = 1769
integer y = 1884
integer width = 411
integer height = 92
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_filtro.reset()
dw_lista.reset()
w_generar_filtro_at_terreno.triggerevent(open!)

end event

type st_buscar from statictext within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 2907
integer y = 188
integer width = 567
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Buscar/ Grabar Formula"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_buscar.visible	= false
end event

type cb_grabar_formula from picturebutton within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 3177
integer y = 44
integer width = 201
integer height = 164
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Desembosos (o).BMP"
alignment htextalign = left!
end type

event ue_mousemove;st_buscar.visible	= true
end event

event clicked;if isvalid(w_formulas) then close(w_formulas)
open(w_formulas)
end event

type pb_filtrar from picturebutton within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 3017
integer y = 72
integer width = 123
integer height = 112
integer taborder = 50
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

event ue_mousemove;st_buscar.visible	= false
end event

event clicked;String	ls_ciudad,ls_comuna,ls_filtro

dw_filtro.accepttext()
ls_ciudad					= dw_filtro.getitemstring(1,'ciudad')
ls_comuna				= dw_filtro.getitemstring(1,'comuna')
gs_formula				= "pasa ='S'"
if not isnull(ls_ciudad) and ls_ciudad<>'' and not isnull(ls_comuna) and ls_comuna<>'' then
	ls_filtro				= "ciudad='"+ls_ciudad+"' and comuna='"+ls_comuna+"'"
//	if gs_formula<>'' and not isnull(gs_formula) then
//		ls_filtro		= gs_formula+" and ciudad='"+ls_ciudad+"' and comuna='"+ls_comuna+"'"
//	else
//	end if
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
	if dw_lista.rowcount()>0 then
		dw_lista.accepttext()
		dw_lista.scrolltorow(1)
		dw_lista.SelectRow(0, FALSE)
		dw_lista.SelectRow(1, TRUE)
		dw_lista.setfocus()
	else
		il_row			= 0
	end if
elseif not isnull(ls_ciudad) and ls_ciudad<>'' and ( isnull(ls_comuna) or ls_comuna='') then
	ls_filtro				= "cliente_ciudad='"+ls_ciudad+"'"
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
	if dw_lista.rowcount()>0 then
		dw_lista.accepttext()
		dw_lista.scrolltorow(1)
		dw_lista.SelectRow(0, FALSE)
		dw_lista.SelectRow(1, TRUE)
		dw_lista.setfocus()
	else
		il_row			= 0
	end if
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

type dw_filtro from datawindow within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 1559
integer y = 76
integer width = 1454
integer height = 120
integer taborder = 40
string title = "none"
string dataobject = "dwe_filtrar_por_comuna"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_buscar.visible	= false
end event

event itemchanged;String	ls_columna,ls_ciudad
this.accepttext()
ls_columna						= dw_filtro.GetColumnName ( )
if ls_columna='ciudad' then
	ls_ciudad						= dw_filtro.getitemstring(1,'ciudad')
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
tab_cobranza.visible	= false
 pb_filtrar.triggerevent(Clicked!)
end event

event doubleclicked;Long		ll_fila
dw_filtro.reset()
dw_filtro.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
ll_fila										= dw_filtro.InsertRow(0)
end event

type cb_geo from commandbutton within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 1376
integer y = 1884
integer width = 389
integer height = 92
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Geo-Referencia"
end type

event ue_mousemove;st_buscar.visible	= false
end event

event clicked;long ret
Inet  iinet_base
if dw_lista.rowcount()>0 then
	gi_rut 					= dw_lista.GetItemNumber(il_row, "rut")
	gs_base					= dw_lista.getitemstring(il_row, "base")
	gs_serie					= dw_lista.getitemstring(il_row, "serie")
	gi_numero				= dw_lista.getitemnumber(il_row, "numero")
	ret 						= GetContextService("Internet", iinet_base)
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

type tab_cobranza from uo_atencion_terreno within w_generar_filtro_at_terreno
boolean visible = false
integer x = 448
integer y = 220
integer taborder = 60
end type

type st_porc from statictext within w_generar_filtro_at_terreno
boolean visible = false
integer x = 1641
integer y = 964
integer width = 233
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_generar_filtro_at_terreno
boolean visible = false
integer x = 1102
integer y = 1040
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_fondo from statictext within w_generar_filtro_at_terreno
boolean visible = false
integer x = 1070
integer y = 936
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_ordenar from commandbutton within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 718
integer y = 1884
integer width = 219
integer height = 80
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event ue_mousemove;st_buscar.visible	= false
end event

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_filtrar from commandbutton within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 937
integer y = 1884
integer width = 187
integer height = 80
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event ue_mousemove;st_buscar.visible	= false
end event

event clicked;long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string ls_texto
setnull (gs_formula)
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
ll_filas						= dw_lista.rowcount()
gs_formula 					= dw_lista.describe("datawindow.syntax")
ll_largototal					= len(gs_formula)
ll_posini						= Pos(gs_formula, "filter") + 8
ll_posfin						= len("~nfilter~n")
ls_texto						= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi 					= ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin				= ll_indi
		ll_indi					= ll_largototal
	end if
next
ll_resto						= ll_posfin - ll_posini
gs_formula					= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' then
	gs_formula	= ''
end if

end event

type cb_imprimir from commandbutton within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 1125
integer y = 1884
integer width = 219
integer height = 80
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event ue_mousemove;st_buscar.visible	= false
end event

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
//	f_printdlg(dw_lista,gstr_print,parent)
end if
end event

type cb_historico from commandbutton within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 302
integer y = 1980
integer width = 393
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

event ue_mousemove;st_buscar.visible	= false
end event

event clicked;if dw_lista.getrow()>0 then
	gs_base			= dw_lista.getitemstring(il_row,'base')
	gs_serie			= dw_lista.getitemstring(il_row,'serie')
	gi_numero		= dw_lista.getitemnumber(il_row,'numero')
	gi_rut				= dw_lista.getitemnumber(il_row,'rut')
	if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
	open(w_cobranza_historica)
end if
end event

type cb_ctacte from commandbutton within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1980
integer width = 265
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

event ue_mousemove;st_buscar.visible	= false
end event

event clicked;string param
if il_row > 0 and dw_lista.rowcount()>0 then
	gs_base   			= dw_lista.getitemstring(il_row,'base' )
	gs_serie  			= dw_lista.getitemstring(il_row,'serie')
	gi_numero 			= dw_lista.getitemnumber(il_row,'numero' )
	gi_rut    				= dw_lista.getitemnumber(il_row,'rut')
	param     			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
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
		CASE "A"
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			OpenWithParm(w_cuenta_corriente_aumento_capacidad,param)
		CASE "F","G","V"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				Open(w_cuenta_corriente_funeraria)
	END CHOOSE
else
	messagebox('Seleción','Debe Seleccionar un contrato.',information!)
end if
end event

type cb_asignar from commandbutton within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1880
integer width = 265
integer height = 92
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Asignar"
end type

event ue_mousemove;st_buscar.visible	= false
end event

event clicked;long ll_fila

ll_fila									= dw_lista.Find("estado_reg = 0", 1, dw_lista.RowCount())

if ll_fila=0 or isnull(ll_fila) then
	messagebox("Advertencia","Debe Seleccionar Contrato para Asignar")
else
	if isvalid(w_asignar_ejecutivo_atencion_terreno) then close(w_asignar_ejecutivo_atencion_terreno)
	open(w_asignar_ejecutivo_atencion_terreno)
end if
end event

type pb_ok from picturebutton within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 1271
integer y = 76
integer width = 123
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_buscar.visible	= false
end event

event clicked;Long		ll_parque,ll_indi,ll_tot_reg,ll_sum_reg,ll_rut,ll_tot_porc,ll_tot_porc_aux,&
			ll_numero
String		ls_base,ls_serie,ls_usuario_asignado,ls_pasa,ls_parque

SetPointer(HourGlass!)
dw_seleccionar.accepttext()
gs_formula								= ""
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
dw_lista.accepttext()
//--
if rb_nuevo.checked = true then
	gs_tipo_cob 										= 'N'
elseif 	rb_generadas.checked = true then
	gs_tipo_cob 										= 'T'
end if
//--
if cbx_parque.checked=true then
	ll_parque								= dw_seleccionar.getitemnumber(1,'parque')
	ls_parque							= string(ll_parque)
	ls_parque							= 'cod_parque = ' + ls_parque + ' and '
//	dw_lista.dataobject				= 'dw_lista_filtro_asigna_cartera_terr_parq'
	dw_lista.dataobject				= 'dw_lista_filtro_asigna_cartera_terreno'
	dw_lista.settransobject(sqlca)
	if not isnull(ll_parque) and ll_parque>0 then
		ls_pasa							= 'S'
	else
		ls_pasa							= 'N'
		if isnull(ll_parque) or ll_parque=0  then
			messagebox("Advertencia","Debe Ingresar Parque")
			dw_seleccionar.setfocus()
			dw_seleccionar.Setcolumn('parque')
		end if
	end if
elseif cbx_parque.checked=false then
	dw_lista.dataobject				= 'dw_lista_filtro_asigna_cartera_terreno'
	dw_lista.settransobject(sqlca)
	ls_pasa								= 'S'
end if
if ls_pasa='S' then
	//-- original, se comentario para probar filtro por datwindow en vez de por retrieve
//	if cbx_parque.checked=true then
//		ll_tot_reg						= dw_lista.retrieve(ll_parque)
//	elseif cbx_parque.checked=false then
		ll_tot_reg						= dw_lista.retrieve()
//	end if
	//-- fin 
	
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Dato")
		dw_filtro.enabled				= false
		pb_filtrar.enabled				= false
	else
//--	
		if gs_tipo_cob = 'T' then
			dw_lista.SETfilter("vista_atencion_terreno_tipo_cobranza = 'T'" )
		elseif gs_tipo_cob = 'N' then
			dw_lista.SETfilter("vista_atencion_terreno_tipo_cobranza = 'N'" )	
		end if	
//--			
		st_fondo.visible					= true
		hpb_1.visible 					= true
		st_porc.visible 					= true
		ll_tot_porc						= 0
		ll_tot_porc_aux					= 0			
		hpb_1.Position					= ll_tot_porc
		for ll_indi=1 to ll_tot_reg
			ll_rut							= dw_lista.getitemnumber(ll_indi,'rut')
			ls_base						= dw_lista.getitemstring(ll_indi,'base')
			ls_serie						= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero					= dw_lista.getitemnumber(ll_indi,'numero')
			dw_lista.setitem(ll_indi,'estado_reg',1)
			//Estatus Cobranza Telefónica
			ll_sum_reg	= 0
			SELECT	COUNT("TELE_LOG"."RUT")  
			INTO 		:ll_sum_reg  
			FROM 	"TELE_LOG"  
			WHERE 	"TELE_LOG"."RUT" = :ll_rut   
			USING	sqlca;
			if ll_sum_reg>0 then
				dw_lista.setitem(ll_indi,'estatus_telefonico',0)
			else
				dw_lista.setitem(ll_indi,'estatus_telefonico',1)
			end if
			//Estatus Envio Carta
			ll_sum_reg					= 0
			SELECT 	COUNT("CARTA_LOG"."RUT")  
			INTO 		:ll_sum_reg  
			FROM 	"CARTA_LOG"  
			WHERE 	"CARTA_LOG"."RUT" = :ll_rut   
			USING	sqlca;
			if ll_sum_reg>0 then
				dw_lista.setitem(ll_indi,'estatus_carta',0)
			else
				dw_lista.setitem(ll_indi,'estatus_carta',1)
			end if
			//Estatus Atencion Público
			ll_sum_reg					= 0
			SELECT 	COUNT("ATENCION_LOG"."RUT")  
			INTO 		:ll_sum_reg  
			FROM 	"ATENCION_LOG"  
			WHERE 	"ATENCION_LOG"."RUT" = :ll_rut   
			USING	sqlca;
			if ll_sum_reg>0 then
				dw_lista.setitem(ll_indi,'estatus_publico',0)
			else
				dw_lista.setitem(ll_indi,'estatus_publico',1)
			end if
//			SELECT	DISTINCT "AT_GESTION"."USUARIO_ASIGNADO"
//			INTO 		:ls_usuario_asignado  
//			FROM 	"AT_GESTION"  
//			WHERE	( "AT_GESTION"."BASE" = :ls_base ) AND  
//						( "AT_GESTION"."SERIE" = :ls_serie ) AND  
//					 	( "AT_GESTION"."NUMERO" = :ll_numero )  AND
//						( "AT_GESTION"."TIPO_COBRANZA" = 'N' )
//			USING	sqlca;
			SELECT	DISTINCT "AT_GESTION"."USUARIO_ASIGNADO"
			INTO 		:ls_usuario_asignado  
			FROM 	"AT_GESTION"  
			WHERE	( "AT_GESTION"."BASE" = :ls_base ) AND  
						( "AT_GESTION"."SERIE" = :ls_serie ) AND  
					 	( "AT_GESTION"."NUMERO" = :ll_numero )  AND
						( "AT_GESTION"."TIPO_COBRANZA" = :gs_tipo_cob )
			USING	sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_indi,'pasa','N')
				dw_lista.setitem(ll_indi,'usuario_asignado',ls_usuario_asignado)
			else
				dw_lista.setitem(ll_indi,'pasa','S')
				dw_lista.setitem(ll_indi,'usuario_asignado','No Asignado')
			end if
			if ll_tot_porc <> ll_tot_porc_aux then 
				st_porc.text					= string(ll_tot_porc)+" %"
				ll_tot_porc_aux				= ll_tot_porc
			end if
			ll_tot_porc						= (ll_indi / ll_tot_reg) * 100
			hpb_1.Position 					= ll_tot_porc
			dw_lista.accepttext()
		next
		st_fondo.visible						= false
		hpb_1.visible 						= false
		st_porc.visible 						= false
//		gs_formula							= "pasa ='S'"
		if gs_tipo_cob = 'N' then
			if cbx_parque.checked=true then
				gs_formula							= ls_parque +"pasa ='S' and vista_atencion_terreno_tipo_cobranza = 'N' "
			elseif cbx_parque.checked=false then	
				gs_formula							= "pasa ='S' and vista_atencion_terreno_tipo_cobranza = 'N' "
			end if	
		elseif gs_tipo_cob = 'T' then
			if cbx_parque.checked=true then
				gs_formula							= ls_parque +"pasa ='S' and vista_atencion_terreno_tipo_cobranza = 'T' "
			elseif cbx_parque.checked=false then	
				gs_formula							= "pasa ='S' and vista_atencion_terreno_tipo_cobranza = 'T' "
			end if	
		end if
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.accepttext()
		tab_cobranza.visible				= false
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra Dato")
			dw_filtro.enabled				= false
			pb_filtrar.enabled				= false
		else
			dw_filtro.enabled				= true
			pb_filtrar.enabled				= true
			dw_lista.accepttext()
			dw_lista.scrolltorow(1)
			dw_lista.SelectRow(0, FALSE)
			dw_lista.SelectRow(1, TRUE)
			dw_lista.setfocus()
		end if
	end if
end if
tab_cobranza.visible						= false
dw_lista.setfocus()
SetPointer(Arrow!)
end event

type dw_seleccionar from datawindow within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 59
integer y = 80
integer width = 745
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_filtro"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_buscar.visible	= false
end event

event itemchanged;Long		ll_fila,ll_new,ll_cod_parque
String		ls_ciudad

dw_seleccionar.accepttext()
if cbx_parque.checked = true then
	ll_cod_parque						= dw_seleccionar.getitemnumber(1,'parque')
	if ll_cod_parque=11 then
		ls_ciudad							= '40'
	else
		ls_ciudad							= '130'
	end if
else
//	ls_ciudad								= '130'	
end if
gs_formula								= ''
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
dw_lista.reset()
dw_filtro.reset()
dw_filtro.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
ll_fila										= dw_filtro.InsertRow(0)
//dw_filtro.setitem(1,'ciudad',ls_ciudad)
dw_filtro.accepttext()
idw_detalle.retrieve(ls_ciudad)
tab_cobranza.visible					= false
end event

type cb_cerrar from commandbutton within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 3118
integer y = 1880
integer width = 265
integer height = 92
integer taborder = 180
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_mousemove;st_buscar.visible	= false
end event

event clicked;close(w_generar_filtro_at_terreno)
end event

type dw_lista from datawindow within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 244
integer width = 3346
integer height = 1604
integer taborder = 70
string dataobject = "dw_lista_filtro_asigna_cartera_terreno"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_buscar.visible	= false
end event

event clicked;String	ls_columna,ls_tipo_cob
Long		ll_estado_reg,ll_ini,ll_fin,ll_indi,ll_folio,ll_status

ls_columna				= dwo.name
tab_cobranza.visible	= false
if row>0 then
	if ls_columna='estado_reg' and (KeyDown(65) or KeyDown(KeyShift!)) then
		il_row					= row
		This.SelectRow(il_row, TRUE)
		ll_estado_reg	= this.getitemnumber(il_row,'estado_reg')
		if ll_estado_reg=1 then
			this.setitem(il_row,'estado_reg',1)
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
					this.setitem(ll_indi,'estado_reg',0)
					This.SelectRow(il_row, TRUE)
				next
				setnull(il_row_aux);setnull(il_row_aux)
			end if
		else
			this.setitem(il_row,'estado_reg',0)
			This.SelectRow(il_row, FALSE)
			il_row_aux	= il_row
		end if
		this.accepttext()
	else
		il_row					= row
		il_row_aux				= row
		This.SelectRow(0, FALSE)
		This.SelectRow(il_row, TRUE)
	end if
	gi_rut 					= dw_lista.GetItemNumber(il_row, "rut")
	gs_base					= dw_lista.getitemstring(il_row, "base")
	gs_serie					= dw_lista.getitemstring(il_row, "serie")
	gi_numero				= dw_lista.getitemnumber(il_row, "numero")
	ll_status				= dw_lista.GetItemNumber(il_row, "vista_atencion_terreno_status_geo")
	if ll_status>0 then
		cb_geo.enabled		= true
	else
		cb_geo.enabled		= false
	end if
end if
end event

event rowfocuschanged;String	ls_tipo_cob,ls_nulo
Long		ll_estado_reg,ll_ini,ll_fin,ll_indi,ll_folio,LL_STATUS

Setnull(ls_nulo)
if getrow()>0 then
	il_row					= getrow()
	il_row_aux				= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gi_rut 					= dw_lista.GetItemNumber(il_row, "rut")
	gs_base					= dw_lista.getitemstring(il_row, "base")
	gs_serie					= dw_lista.getitemstring(il_row, "serie")
	gi_numero				= dw_lista.getitemnumber(il_row, "numero")
	ll_status				= dw_lista.GetItemNumber(il_row, "vista_atencion_terreno_status_geo")
	if ll_status>0 then
		cb_geo.enabled		= true
	else
		cb_geo.enabled		= false
	end if
end if
end event

type gb_1 from groupbox within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 1531
integer y = 12
integer width = 1641
integer height = 212
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar"
end type

event ue_mousemove;st_buscar.visible	= false
end event

type gb_2 from groupbox within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 704
integer y = 1836
integer width = 658
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_4 from groupbox within w_generar_filtro_at_terreno
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 12
integer width = 1413
integer height = 216
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

event ue_mousemove;st_buscar.visible	= false
end event

