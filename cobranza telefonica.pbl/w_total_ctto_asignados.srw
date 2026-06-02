forward
global type w_total_ctto_asignados from window
end type
type st_ejecutivo from statictext within w_total_ctto_asignados
end type
type dw_ejecutivo from datawindow within w_total_ctto_asignados
end type
type cb_asig_hist from commandbutton within w_total_ctto_asignados
end type
type pb_ctto from picturebutton within w_total_ctto_asignados
end type
type sle_2 from singlelineedit within w_total_ctto_asignados
end type
type st_1 from statictext within w_total_ctto_asignados
end type
type cb_mensaje from commandbutton within w_total_ctto_asignados
end type
type hpb_1 from hprogressbar within w_total_ctto_asignados
end type
type cb_actualizar from commandbutton within w_total_ctto_asignados
end type
type cb_ctacte2 from commandbutton within w_total_ctto_asignados
end type
type dw_dias_mora from datawindow within w_total_ctto_asignados
end type
type cb_cerrar from commandbutton within w_total_ctto_asignados
end type
type cb_ctacte from commandbutton within w_total_ctto_asignados
end type
type pb_5 from picturebutton within w_total_ctto_asignados
end type
type pb_4 from picturebutton within w_total_ctto_asignados
end type
type pb_3 from picturebutton within w_total_ctto_asignados
end type
type pb_2 from picturebutton within w_total_ctto_asignados
end type
type st_2 from statictext within w_total_ctto_asignados
end type
type sle_1 from singlelineedit within w_total_ctto_asignados
end type
type pb_1 from picturebutton within w_total_ctto_asignados
end type
type cb_grabar_formula from commandbutton within w_total_ctto_asignados
end type
type cb_genera_lista from commandbutton within w_total_ctto_asignados
end type
type cb_historico from commandbutton within w_total_ctto_asignados
end type
type cb_imprimir from commandbutton within w_total_ctto_asignados
end type
type cb_exportar from commandbutton within w_total_ctto_asignados
end type
type cb_filtrar from commandbutton within w_total_ctto_asignados
end type
type cb_ordenar from commandbutton within w_total_ctto_asignados
end type
type gb_1 from groupbox within w_total_ctto_asignados
end type
type gb_2 from groupbox within w_total_ctto_asignados
end type
type st_porc from statictext within w_total_ctto_asignados
end type
type st_fondo from statictext within w_total_ctto_asignados
end type
type tab_cobranza from uo_cobranza within w_total_ctto_asignados
end type
type tab_cobranza from uo_cobranza within w_total_ctto_asignados
end type
type dw_lista from datawindow within w_total_ctto_asignados
end type
end forward

global type w_total_ctto_asignados from window
integer width = 3835
integer height = 2536
boolean titlebar = true
string title = "Ingreso Cobranza Telefónica"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
integer animationtime = 50
event ue_cargar pbm_custom01
st_ejecutivo st_ejecutivo
dw_ejecutivo dw_ejecutivo
cb_asig_hist cb_asig_hist
pb_ctto pb_ctto
sle_2 sle_2
st_1 st_1
cb_mensaje cb_mensaje
hpb_1 hpb_1
cb_actualizar cb_actualizar
cb_ctacte2 cb_ctacte2
dw_dias_mora dw_dias_mora
cb_cerrar cb_cerrar
cb_ctacte cb_ctacte
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
st_2 st_2
sle_1 sle_1
pb_1 pb_1
cb_grabar_formula cb_grabar_formula
cb_genera_lista cb_genera_lista
cb_historico cb_historico
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
gb_1 gb_1
gb_2 gb_2
st_porc st_porc
st_fondo st_fondo
tab_cobranza tab_cobranza
dw_lista dw_lista
end type
global w_total_ctto_asignados w_total_ctto_asignados

type variables
string		is_codigo
long		il_row
Double	id_factor_gc,id_tasa_mant
end variables

forward prototypes
public subroutine wf_pos_otros_cttos ()
public subroutine wf_pos_promesa ()
public subroutine wf_pos_contrato_isa ()
public subroutine wf_cargar_dw_contrato ()
public subroutine wf_calcular_interes (string as_cobro, string as_base, string as_serie, long al_numero, long al_fila)
public subroutine wf_carga_datos (string as_codigo)
end prototypes

event ue_cargar;//Long		ll_tot_reg,ll_indi,ll_rut,ll_count_reg,ll_count_pago,ll_tot_porc,ll_tot_porc_aux
//Datetime	ldt_fecha,ldt_fec_llama
//String		ls_base,ls_serie,ls_fecha
//date		ld_fecha_hoy
//double	ldb_numero
//
//SetPointer(HourGlass!)
//ld_fecha_hoy				= date(gdt_fec_sistema)
//ll_tot_reg					= dw_lista.retrieve(is_codigo,date(gdt_fec_sistema))
//tab_cobranza.visible		= false
//if ll_tot_reg>0 then
//	SetPointer(HourGlass!)
//	st_fondo.visible			= true
//	hpb_1.visible 			= true
//	st_porc.visible 			= true
//	ll_tot_porc				= 0
//	ll_tot_porc_aux			= 0			
//	hpb_1.Position			= ll_tot_porc
//	for ll_indi=1 to ll_tot_reg
//		ll_rut					= dw_lista.getitemnumber(ll_indi,'gestion_cobranza_rut')
//		ldt_fecha				= dw_lista.getitemdatetime(ll_indi,'gestion_cobranza_fecha_asignacion')
//		ldt_fec_llama		= dw_lista.getitemdatetime(ll_indi,'gestion_cobranza_fecha_llamado')
//		ls_base				= dw_lista.getitemstring(ll_indi,'gestion_cobranza_base')
//		ls_serie				= dw_lista.getitemstring(ll_indi,'gestion_cobranza_serie')
//		ldb_numero			= dw_lista.getitemnumber(ll_indi,'gestion_cobranza_numero')
//		ll_count_reg			= 0
//		ls_fecha				=  mid(string(ld_fecha_hoy,'dd/mm/yyyy'),4,7)
//		if ls_base='C' and ldb_numero=329375 then
//			messagebox("ls_fecha",string(ls_fecha))
//		end if
//		SELECT	Count("INGRESO"."FOLIO")  
//		INTO 		:ll_count_pago  
//		FROM 	"INGRESO"  
//		WHERE	( "INGRESO"."BASE" = :ls_base ) AND  
//					( "INGRESO"."SERIE" = :ls_serie ) AND  
//					( "INGRESO"."CONTRATO" = :ldb_numero ) AND  
//					( SUBSTR(to_char("INGRESO"."FECHA_PAGO",'dd/mm/yyyy'),4,7) = :ls_fecha) AND
//					( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'F')   
//		USING		sqlca;
//		if ll_count_pago > 0 then
//			dw_lista.setitem(ll_indi,'gestion_cobranza_existe_pago','S')
//		else
//			dw_lista.setitem(ll_indi,'gestion_cobranza_existe_pago','N')
//		end if
//		SELECT	count("TELE_LOG"."RUT")  
//		INTO 		:ll_count_reg  
//		FROM 	"TELE_LOG"  
//		WHERE	( "TELE_LOG"."RUT" = :ll_rut ) and
//					( "TELE_LOG"."FECHA" >= :ldt_fecha )
//		Using		sqlca;
//		if ll_count_reg>0 then
//			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_telefonico',0)
//		else
//			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_telefonico',1)
//		end if
//		ll_count_reg													= 0
//		SELECT	count("CARTA_LOG"."RUT")  
//		INTO 		:ll_count_reg  
//		FROM 		"CARTA_LOG"  
//		WHERE  ( "CARTA_LOG"."RUT" = :ll_rut ) and
//				 ( "CARTA_LOG"."FECHA_CARTA" >= :ldt_fecha )
//		Using		sqlca;
//		if ll_count_reg>0 then
//			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_carta',0)
//		else
//			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_carta',1)
//		end if
//		ll_count_reg													= 0
//		SELECT	count("ATENCION_LOG"."RUT")  
//		INTO 		:ll_count_reg  
//		FROM 		"ATENCION_LOG"  
//		WHERE  ( "ATENCION_LOG"."RUT" = :ll_rut ) and
//				 ( "ATENCION_LOG"."FECHA" >= :ldt_fecha )
//		Using		sqlca;
//		if ll_count_reg>0 then
//			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_publico',0)
//		else
//			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_publico',1)
//		end if
//		if ll_tot_porc <> ll_tot_porc_aux then 
//			st_porc.text												= string(ll_tot_porc)+" %"
//			ll_tot_porc_aux											= ll_tot_porc
//		end if
//		ll_tot_porc													= (ll_indi / ll_tot_reg) * 100
//		hpb_1.Position 												= ll_tot_porc
//	next
//	st_fondo.visible													= false
//	hpb_1.visible 													= false
//	st_porc.visible 													= false
//	dw_lista.accepttext()
//end if
//if gs_depto='F' or gs_depto='O' or gs_depto='I' then 
//	cb_genera_lista.enabled										= true
//	tab_cobranza.tabpage_4.cb_grabar.enabled			= true
//else
//	cb_genera_lista.enabled										= false
//	tab_cobranza.tabpage_4.cb_grabar.enabled			= false
//end if
//SetPointer(Arrow!)
//dw_lista.setfocus()
end event

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
			ii_dmora_m,ll_tot_for
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
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',0)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_mant',ll_cta_pag_m)
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'est_comi','')
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
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_cta_pag_m)
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
			tab_cobranza.tabpage_1.dw_contrato.setitem(al_fila,'ctas_pag_cred',ll_ctas_pag)
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
						if dw_dias_mora.rowcount() > 0 then
							if ii_cantidad <= dw_dias_mora.rowcount() then
								ll_tot_for	= ii_cantidad
							elseif ii_cantidad > dw_dias_mora.rowcount() then
								ll_tot_for	= dw_dias_mora.rowcount()
							end if
							FOR i = 1 TO ll_tot_for
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
									ii_mora_cobro 			= ld_dias_sum_mora	//(ii_dmora - (i - 1) * ll_calc_dias)
									id_im 					= id_im + gf_int_mora(ldb_tasa, ii_mora_cobro, id_valor_cuota)
									IF ld_dias_sum_mora > ll_calc_dias  THEN		//(ii_dmora - (i - 1) * ll_calc_dias)
										id_gc 				= id_gc + Round(id_valor_cuota * id_factor_gc, 0)
										ii_inc_gastos		= 1
									END IF
								ELSE
		//								ii_mora_cobro 		= 0
		//								id_im 				= 0
		//								id_gc 				= 0
								END IF	
							NEXT
						else
							ll_calc_dias					= 0
							ii_dmora							= 0
							ld_dias_sum_mora				= 0
						end if
						ll_mora								= ll_mora + id_im
						ll_gasto_cob						= ll_gasto_cob + id_gc
						ll_valor_total						= round(ll_cuota * id_valor_cuota,0)
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

public subroutine wf_carga_datos (string as_codigo);Long		ll_tot_reg,ll_indi,ll_rut,ll_count_reg,ll_count_pago,ll_tot_porc,ll_tot_porc_aux
Datetime	ldt_fecha,ldt_fec_llama
String		ls_base,ls_serie,ls_fecha,ls_moneda
date		ld_fecha_hoy
double	ldb_numero,ldb_valor_cta_cred,ldb_valor_cta_mant

SetPointer(HourGlass!)
ld_fecha_hoy				= date(gdt_fec_sistema)
ll_tot_reg					= dw_lista.retrieve(as_codigo,date(gdt_fec_sistema))
tab_cobranza.visible		= false
if ll_tot_reg>0 then
	SetPointer(HourGlass!)
	st_fondo.visible			= true
	hpb_1.visible 			= true
	st_porc.visible 			= true
	ll_tot_porc				= 0
	ll_tot_porc_aux			= 0			
	hpb_1.Position			= ll_tot_porc
	for ll_indi=1 to ll_tot_reg
		ll_rut					= dw_lista.getitemnumber(ll_indi,'gestion_cobranza_rut')
		ldt_fecha				= dw_lista.getitemdatetime(ll_indi,'gestion_cobranza_fecha_asignacion')
		ldt_fec_llama		= dw_lista.getitemdatetime(ll_indi,'gestion_cobranza_fecha_llamado')
		ls_base				= dw_lista.getitemstring(ll_indi,'gestion_cobranza_base')
		ls_serie				= dw_lista.getitemstring(ll_indi,'gestion_cobranza_serie')
		ldb_numero			= dw_lista.getitemnumber(ll_indi,'gestion_cobranza_numero')
		ll_count_reg			= 0
		ls_fecha				=  mid(string(ld_fecha_hoy,'dd/mm/yyyy'),4,7)
//		if ls_base='C' and ldb_numero=329375 then
//			messagebox("ls_fecha",string(ls_fecha))
//		end if


		if  ls_base = 'O' THEN 
			SELECT	"PAGO_OFERTA"."MONEDA",	"PAGO_OFERTA"."VALOR_CUOTA","OFERTA_V"."VALOR_CUOTA_M"
			INTO		:ls_moneda,:ldb_valor_cta_cred,:ldb_valor_cta_mant
			FROM		"OFERTA_V","PAGO_OFERTA"
			WHERE 	"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND
						"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND
						"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND
						"OFERTA_V"."SERIE" = :ls_serie AND
						"OFERTA_V"."NRO_OFERTA" = :ldb_numero
			USING	sqlca;
		elseif  ls_base = 'L' THEN 	
			SELECT	"PAGO_LIBERADOR"."MONEDA",	"PAGO_LIBERADOR"."VALOR_CUOTA", 0 
			INTO		:ls_moneda,:ldb_valor_cta_cred,:ldb_valor_cta_mant
			FROM 	"ANEXO_LIBERADOR","PAGO_LIBERADOR"
			WHERE 	"ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" and
						"ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" and
						"ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" AND
						"ANEXO_LIBERADOR"."SERIE_M" = :ls_serie AND
						"ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero
			USING	sqlca;
		elseif  ls_base = 'A' THEN 	
			SELECT 	"PAGO_AUMENTO"."MONEDA",	"PAGO_AUMENTO"."VALOR_CUOTA", 0 
			INTO		:ls_moneda,:ldb_valor_cta_cred,:ldb_valor_cta_mant
			FROM 	"ANEXO_AUMENTO","PAGO_AUMENTO"
			WHERE 	"ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" and
						"ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" and
						"ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" AND
						"ANEXO_AUMENTO"."SERIE_M" = :ls_serie AND
						"ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero
			USING	sqlca;
		elseif  ls_base = 'D' THEN			
			SELECT	"DERECHO"."MONEDA", "DERECHO"."VALOR_CUO", 0 
			INTO		:ls_moneda,:ldb_valor_cta_cred,:ldb_valor_cta_mant
			FROM 	"DERECHO"
			WHERE 	"DERECHO"."SERIE_P" = :ls_serie AND
						"DERECHO"."NRO_PAGARE" = :ldb_numero
			USING	sqlca;
		elseif  ls_base = 'P' THEN				
			SELECT	"PAGARE"."MONEDA",	"PAGARE"."VALOR_CUO", 0 
			INTO		:ls_moneda,:ldb_valor_cta_cred,:ldb_valor_cta_mant
			FROM 	"PAGARE"
			WHERE 	"PAGARE"."SERIE_P" = :ls_serie AND
						"PAGARE"."NRO_PAGARE" = :ldb_numero
			USING	sqlca;
		elseif ls_base = 'R' THEN
			SELECT	'UF',	"REPACTA_MANTENCION"."VALOR_CUOTA_UF", 0 
			INTO		:ls_moneda,:ldb_valor_cta_cred,:ldb_valor_cta_mant
			FROM 	"REPACTA_MANTENCION"
			WHERE 	"REPACTA_MANTENCION"."BASE" = :ls_base AND
						"REPACTA_MANTENCION"."SERIE" = :ls_serie AND
						"REPACTA_MANTENCION"."NUMERO" = :ldb_numero
			USING	sqlca;
		elseif  ls_base = 'C' THEN			
			SELECT 	"CONTRATO"."MONEDA",0,"CONTRATO"."VALOR_CUOTA_M"
			INTO		:ls_moneda,:ldb_valor_cta_cred,:ldb_valor_cta_mant
			FROM 	"CONTRATO"
			WHERE 	"CONTRATO"."SERIE_C" = :ls_serie AND
						"CONTRATO"."NRO_CONTRATO" = :ldb_numero
			USING	sqlca;
		end if
		if isnull(ls_moneda) then ls_moneda='UF'
		if isnull(ldb_valor_cta_cred) then ldb_valor_cta_cred=0
		if isnull(ldb_valor_cta_mant) then ldb_valor_cta_mant=0
		
		dw_lista.setitem(ll_indi,'moneda',ls_moneda)
		dw_lista.setitem(ll_indi,'valor_cta_cred',ldb_valor_cta_cred)
		dw_lista.setitem(ll_indi,'valor_cta_mant',ldb_valor_cta_mant)


		SELECT	Count("INGRESO"."FOLIO")  
		INTO 		:ll_count_pago  
		FROM 	"INGRESO"  
		WHERE	( "INGRESO"."BASE" = :ls_base ) AND  
					( "INGRESO"."SERIE" = :ls_serie ) AND  
					( "INGRESO"."CONTRATO" = :ldb_numero ) AND  
					( SUBSTR(to_char("INGRESO"."FECHA_PAGO",'dd/mm/yyyy'),4,7) = :ls_fecha) AND
					( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'F')   
		USING		sqlca;
		if ll_count_pago > 0 then
			dw_lista.setitem(ll_indi,'gestion_cobranza_existe_pago','S')
		else
			dw_lista.setitem(ll_indi,'gestion_cobranza_existe_pago','N')
		end if
		SELECT	count("TELE_LOG"."RUT")  
		INTO 		:ll_count_reg  
		FROM 	"TELE_LOG"  
		WHERE	( "TELE_LOG"."RUT" = :ll_rut ) and
					( "TELE_LOG"."FECHA" >= :ldt_fecha )
		Using		sqlca;
		if ll_count_reg>0 then
			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_telefonico',0)
		else
			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_telefonico',1)
		end if
		ll_count_reg													= 0
		SELECT	count("CARTA_LOG"."RUT")  
		INTO 		:ll_count_reg  
		FROM 		"CARTA_LOG"  
		WHERE  ( "CARTA_LOG"."RUT" = :ll_rut ) and
				 ( "CARTA_LOG"."FECHA_CARTA" >= :ldt_fecha )
		Using		sqlca;
		if ll_count_reg>0 then
			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_carta',0)
		else
			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_carta',1)
		end if
		ll_count_reg													= 0
		SELECT	count("ATENCION_LOG"."RUT")  
		INTO 		:ll_count_reg  
		FROM 		"ATENCION_LOG"  
		WHERE  ( "ATENCION_LOG"."RUT" = :ll_rut ) and
				 ( "ATENCION_LOG"."FECHA" >= :ldt_fecha )
		Using		sqlca;
		if ll_count_reg>0 then
			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_publico',0)
		else
			dw_lista.setitem(ll_indi,'gestion_cobranza_estatus_publico',1)
		end if
		if ll_tot_porc <> ll_tot_porc_aux then 
			st_porc.text												= string(ll_tot_porc)+" %"
			ll_tot_porc_aux											= ll_tot_porc
		end if
		ll_tot_porc													= (ll_indi / ll_tot_reg) * 100
		hpb_1.Position 												= ll_tot_porc
	next
	st_fondo.visible													= false
	hpb_1.visible 													= false
	st_porc.visible 													= false
	dw_lista.accepttext()
end if
if gs_depto='F' or gs_depto='O' or gs_depto='I' then 
	cb_genera_lista.enabled										= true
	tab_cobranza.tabpage_4.cb_grabar.enabled			= true
else
	cb_genera_lista.enabled										= false
	tab_cobranza.tabpage_4.cb_grabar.enabled			= false
end if
SetPointer(Arrow!)
dw_lista.setfocus()
end subroutine

on w_total_ctto_asignados.create
this.st_ejecutivo=create st_ejecutivo
this.dw_ejecutivo=create dw_ejecutivo
this.cb_asig_hist=create cb_asig_hist
this.pb_ctto=create pb_ctto
this.sle_2=create sle_2
this.st_1=create st_1
this.cb_mensaje=create cb_mensaje
this.hpb_1=create hpb_1
this.cb_actualizar=create cb_actualizar
this.cb_ctacte2=create cb_ctacte2
this.dw_dias_mora=create dw_dias_mora
this.cb_cerrar=create cb_cerrar
this.cb_ctacte=create cb_ctacte
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.st_2=create st_2
this.sle_1=create sle_1
this.pb_1=create pb_1
this.cb_grabar_formula=create cb_grabar_formula
this.cb_genera_lista=create cb_genera_lista
this.cb_historico=create cb_historico
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.st_porc=create st_porc
this.st_fondo=create st_fondo
this.tab_cobranza=create tab_cobranza
this.dw_lista=create dw_lista
this.Control[]={this.st_ejecutivo,&
this.dw_ejecutivo,&
this.cb_asig_hist,&
this.pb_ctto,&
this.sle_2,&
this.st_1,&
this.cb_mensaje,&
this.hpb_1,&
this.cb_actualizar,&
this.cb_ctacte2,&
this.dw_dias_mora,&
this.cb_cerrar,&
this.cb_ctacte,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.st_2,&
this.sle_1,&
this.pb_1,&
this.cb_grabar_formula,&
this.cb_genera_lista,&
this.cb_historico,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.gb_1,&
this.gb_2,&
this.st_porc,&
this.st_fondo,&
this.tab_cobranza,&
this.dw_lista}
end on

on w_total_ctto_asignados.destroy
destroy(this.st_ejecutivo)
destroy(this.dw_ejecutivo)
destroy(this.cb_asig_hist)
destroy(this.pb_ctto)
destroy(this.sle_2)
destroy(this.st_1)
destroy(this.cb_mensaje)
destroy(this.hpb_1)
destroy(this.cb_actualizar)
destroy(this.cb_ctacte2)
destroy(this.dw_dias_mora)
destroy(this.cb_cerrar)
destroy(this.cb_ctacte)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.pb_1)
destroy(this.cb_grabar_formula)
destroy(this.cb_genera_lista)
destroy(this.cb_historico)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.st_porc)
destroy(this.st_fondo)
destroy(this.tab_cobranza)
destroy(this.dw_lista)
end on

event open;Long		ll_tot_reg,ll_indi,ll_rut,ll_count_reg,ll_numero,ll_count_pago,ll_cta
Datetime	ldt_fecha,ldt_fec_llama
String	ls_base,ls_serie
date		ld_fecha_hoy

connect using Trans_1;
connect using Trans_2;
SetPointer(HourGlass!)
gf_centrar(w_total_ctto_asignados)


SELECT	COUNT("ENCARGADOS"."CODIGO_USUARIO")
INTO		:ll_cta
FROM		"AGENTES","ENCARGADOS"  
WHERE	"AGENTES"."RUT" = "ENCARGADOS"."RUT" and  
         	"AGENTES"."ESTADO" = 'A' AND  
         	"AGENTES"."CANAL" = 'EC' AND  
			"ENCARGADOS"."CODIGO_USUARIO" = :gs_user AND
         	"ENCARGADOS"."ESTADO" = 'A'    
ORDER BY "AGENTES"."FECHA_INI" ASC
USING	sqlca;
if isnull(ll_cta) then ll_cta=0
if ll_cta=0 then
	dw_ejecutivo.settransobject(sqlca)
	dw_ejecutivo.insertrow(0)
	st_ejecutivo.visible					= true
	dw_ejecutivo.visible				= true
end if
	


SELECT "TASA"."GASTO_COB_MORA","TASA"."TASA_INT_UF" INTO :id_factor_gc,:id_tasa_mant FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
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

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type st_ejecutivo from statictext within w_total_ctto_asignados
boolean visible = false
integer x = 704
integer y = 64
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Ejecutivo :"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_ejecutivo from datawindow within w_total_ctto_asignados
boolean visible = false
integer x = 1061
integer y = 52
integer width = 1152
integer height = 88
integer taborder = 50
string title = "none"
string dataobject = "dwe_ejecutivo_cob"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_codigo
datetime	ldt_fecha

dw_ejecutivo.accepttext()
ls_codigo						= dw_ejecutivo.getitemstring(1,'ejecutivo')
if  not isnull(ls_codigo) and ls_codigo<>'' then 
	wf_carga_datos(ls_codigo)
	SetPointer(Arrow!)
	dw_lista.setfocus()
end if
end event

type cb_asig_hist from commandbutton within w_total_ctto_asignados
integer x = 1221
integer y = 2308
integer width = 293
integer height = 100
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Asig.Hist."
end type

event clicked;string	ls_base,ls_serie,ls_string
double ldb_numero,ldb_rut

if dw_lista.rowcount()>0 then
	ls_base 						= dw_lista.GetItemString(il_row, "gestion_cobranza_base")
	ls_serie 						= dw_lista.GetItemString(il_row, "gestion_cobranza_serie")
	ldb_numero 				= dw_lista.GetItemNumber(il_row, "gestion_cobranza_numero")
	ldb_rut 						= dw_lista.GetItemNumber(il_row, "gestion_cobranza_rut")
	if not isnull(ls_base) and ls_base<>''  and not isnull(ls_serie) and ls_serie<>'' and  not isnull(ldb_numero) and ldb_numero>0 and not isnull(ldb_rut) and ldb_rut>0 then
		ls_string						= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+string(ldb_rut)
		OpenWithParm(w_asignacion_historica_ctto, ls_string)
	end if
end if

end event

type pb_ctto from picturebutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 2894
integer y = 2312
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

event clicked;STRING	ls_string,ls_rut
long		ll_row,ll_tot_reg

ll_tot_reg					= dw_lista.RowCount() 
if trim(sle_2.text)<>'' and ll_tot_reg > 0 then
	dw_lista.scrolltorow(1)
	ls_rut						= trim(sle_2.text)
	ls_string					= "gestion_cobranza_numero="+trim(ls_rut)
	ll_row 					= dw_lista.Find(ls_string, 1, ll_tot_reg)
	IF ll_row > 0 THEN
		dw_lista.ScrollToRow( ll_row )
		dw_lista.setfocus()
	ELSE
		MessageBox("Advertencia", "N° Contrato Inexistente")
		tab_cobranza.visible	= false
	END IF
end if
end event

type sle_2 from singlelineedit within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 2551
integer y = 2312
integer width = 338
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

event modified;sle_1.text		= ''
pb_ctto.triggerevent (clicked!)
end event

type st_1 from statictext within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 2235
integer y = 2328
integer width = 302
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "N° Contrato"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_mensaje from commandbutton within w_total_ctto_asignados
integer x = 992
integer y = 2308
integer width = 229
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Mensaje"
end type

event clicked;if il_row > 0 then
	if isvalid(w_crear_mensajes) then close(w_crear_mensajes)
	open(w_crear_mensajes)
end if
end event

type hpb_1 from hprogressbar within w_total_ctto_asignados
boolean visible = false
integer x = 1280
integer y = 1032
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type cb_actualizar from commandbutton within w_total_ctto_asignados
boolean visible = false
integer x = 1499
integer y = 2464
integer width = 87
integer height = 100
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

type cb_ctacte2 from commandbutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2034
integer y = 2612
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

type dw_dias_mora from datawindow within w_total_ctto_asignados
boolean visible = false
integer x = 347
integer y = 2588
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

type cb_cerrar from commandbutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 3506
integer y = 2308
integer width = 283
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

event clicked;close(w_total_ctto_asignados)
end event

type cb_ctacte from commandbutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 2308
integer width = 402
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.rowcount()>0 then
	gs_base 						= dw_lista.GetItemString(il_row, "gestion_cobranza_base")
	gs_serie 						= dw_lista.GetItemString(il_row, "gestion_cobranza_serie")
	gi_numero 					= dw_lista.GetItemNumber(il_row, "gestion_cobranza_numero")
	gi_rut 						= dw_lista.GetItemNumber(il_row, "gestion_cobranza_rut")
	gs_apellido_paterno		= dw_lista.GetItemString(il_row, "gestion_cobranza_a_paterno")
	gs_apellido_materno		= dw_lista.GetItemString(il_row, "gestion_cobranza_a_materno")
	gs_nombres					= dw_lista.GetItemString(il_row, "gestion_cobranza_nombre")
	gs_dv							= dw_lista.GetItemString(il_row, "gestion_cobranza_dv")
	gs_estado					= dw_lista.GetItemString(il_row, "gestion_cobranza_estado")
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

type pb_5 from picturebutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 3360
integer y = 2316
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

event clicked;dw_lista.ScrollToRow(dw_lista.rowcount() )
end event

type pb_4 from picturebutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 3255
integer y = 2316
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

event clicked;dw_lista.ScrollNextPage( )
end event

type pb_3 from picturebutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 3150
integer y = 2316
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

event clicked;dw_lista.ScrollPriorPage( )
end event

type pb_2 from picturebutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 3045
integer y = 2316
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

event clicked;dw_lista.ScrollToRow(1)
end event

type st_2 from statictext within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 1609
integer y = 2328
integer width = 114
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

type sle_1 from singlelineedit within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 1755
integer y = 2312
integer width = 352
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;sle_2.text		= ''
pb_1.triggerevent (clicked!)
end event

type pb_1 from picturebutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 2112
integer y = 2312
integer width = 105
integer height = 92
integer taborder = 130
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
long		ll_row,ll_tot_reg

ll_tot_reg					= dw_lista.RowCount() 
if trim(sle_1.text)<>'' and ll_tot_reg > 0 then
	dw_lista.scrolltorow(1)
	ls_rut						= trim(sle_1.text)
	ls_string					= "gestion_cobranza_rut="+trim(ls_rut)
	ll_row 						= dw_lista.Find(ls_string, 1, ll_tot_reg)
	IF ll_row > 0 THEN
		dw_lista.ScrollToRow( ll_row )
		dw_lista.setfocus()
	ELSE
		MessageBox("Advertencia", "Rut Inexistente")
		tab_cobranza.visible	= false
	END IF
end if
end event

type cb_grabar_formula from commandbutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 763
integer y = 2308
integer width = 233
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Formula"
end type

event clicked;open(w_formulas)
end event

type cb_genera_lista from commandbutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 430
integer y = 2308
integer width = 338
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Generar Lista"
end type

event clicked;if isvalid(w_generar_lista_cliente_gestion_cobranza) then close(w_generar_lista_cliente_gestion_cobranza)
if dw_lista.rowcount() > 0 then open(w_generar_lista_cliente_gestion_cobranza)
end event

type cb_historico from commandbutton within w_total_ctto_asignados
event ue_mousemove pbm_dwnmousemove
integer x = 32
integer y = 48
integer width = 283
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_lista.getrow()>0 then
	gs_base			= dw_lista.getitemstring(il_row,'gestion_cobranza_base')
	gs_serie			= dw_lista.getitemstring(il_row,'gestion_cobranza_serie')
	gi_numero		= dw_lista.getitemnumber(il_row,'gestion_cobranza_numero')
	gi_rut				= dw_lista.getitemnumber(il_row,'gestion_cobranza_rut')
	open(w_cobranza_historica)
end if
end event

type cb_imprimir from commandbutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 3529
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
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_exportar from commandbutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 3237
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
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 2985
integer y = 48
integer width = 247
integer height = 92
integer taborder = 30
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

type cb_ordenar from commandbutton within w_total_ctto_asignados
event ue_mousemove pbm_dwnmousemove
integer x = 2734
integer y = 48
integer width = 247
integer height = 92
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

type gb_1 from groupbox within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 2711
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

type gb_2 from groupbox within w_total_ctto_asignados
event ue_mousemove pbm_mousemove
integer x = 3022
integer y = 2268
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

type st_porc from statictext within w_total_ctto_asignados
boolean visible = false
integer x = 1280
integer y = 956
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

type st_fondo from statictext within w_total_ctto_asignados
boolean visible = false
integer x = 1248
integer y = 928
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

type tab_cobranza from uo_cobranza within w_total_ctto_asignados
boolean visible = false
integer x = 649
integer y = 312
integer taborder = 40
end type

type dw_lista from datawindow within w_total_ctto_asignados
integer x = 32
integer y = 180
integer width = 3758
integer height = 2088
integer taborder = 70
string title = "none"
string dataobject = "dw_ingreso_por_usuario_cobranza_telefono"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_tipo_cob,ls_fecha
Long		ll_folio,ll_estado_reg,ll_ini,ll_fin,ll_indi,ll_mes,ll_anno,ll_dia,ll_month_asig,ll_year_asig,ll_dia_asig
Date		ld_fecha_prox_llamado,ld_fecha_hoy,ld_fec_asigna,ldt_fec_prox_3_meses

ls_columna					= dwo.name

if row > 0 then
	il_row					= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gi_rut 						= dw_lista.GetItemNumber(il_row, "gestion_cobranza_rut")
	gs_base						= dw_lista.getitemstring(il_row, "gestion_cobranza_base")
	gs_serie						= dw_lista.getitemstring(il_row, "gestion_cobranza_serie")
	gi_numero					= dw_lista.getitemnumber(il_row, "gestion_cobranza_numero")
	ld_fecha_prox_llamado	= date(dw_lista.getitemdatetime(il_row, "gestion_cobranza_fecha_prox_llamado"))
//	if ld_fecha_prox_llamado < date(gdt_fec_sistema) then 
		if gs_depto='F' or gs_depto='O' or gs_depto='I' then 
			tab_cobranza.tabpage_4.cb_grabar.enabled	= true
		else
			tab_cobranza.tabpage_4.cb_grabar.enabled	= false
		end if
//	else
//		tab_cobranza.tabpage_4.cb_grabar.enabled		= false
//	end if
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
	
	ld_fecha_hoy				= date(gdt_fec_sistema)
//	ll_mes						= month(ld_fecha_hoy)
//	ll_anno						= year(ld_fecha_hoy)
//	if ll_mes=1 then
//		ll_dia					= 31
//	elseif ll_mes=2 then
//		ll_dia					= 28
//	elseif ll_mes=3 then
//		ll_dia					= 31
//	elseif ll_mes=4 then
//		ll_dia					= 30
//	elseif ll_mes=5 then
//		ll_dia					= 31
//	elseif ll_mes=6 then
//		ll_dia					= 30
//	elseif ll_mes=7 then
//		ll_dia					= 31
//	elseif ll_mes=8 then
//		ll_dia					= 31
//	elseif ll_mes=9 then
//		ll_dia					= 30
//	elseif ll_mes=10 then
//		ll_dia					= 31
//	elseif ll_mes=11 then
//		ll_dia					= 30
//	elseif ll_mes=12 then
//		ll_dia					= 31
//	end if
	ld_fec_asigna				= date(dw_lista.getitemdatetime(row,'gestion_lista_fecha'))
	ls_fecha						= string( dw_lista.getitemdatetime(row,'gestion_lista_fecha_termino_asignacion'),'dd/mm/yyyy')
//	DECLARE sp_prox_3_meses PROCEDURE FOR sp_calcular_3_meses( :ld_fec_asigna );
//	EXECUTE sp_prox_3_meses;
//	if sqlca.sqlcode=0 then
//		fetch sp_prox_3_meses into :ldt_fec_prox_3_meses ;
//		close sp_prox_3_meses;
//	end if
//	ls_fecha						= STRING(ldt_fec_prox_3_meses,'dd/mm/yyyy')
//	ll_month_asig				= month(ld_fec_asigna)
//	ll_year_asig					= year(ld_fec_asigna)
//	if ll_mes = ll_month_asig and ll_anno = ll_year_asig then
//		ls_fecha					= string(ll_dia)+'/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//	else
//		if ll_month_asig=1 then
//			ll_dia_asig			= 31
//		elseif ll_month_asig=2 then
//			ll_dia_asig			= 28
//		elseif ll_month_asig=3 then
//			ll_dia_asig			= 31
//		elseif ll_month_asig=4 then
//			ll_dia_asig			= 30
//		elseif ll_month_asig=5 then
//			ll_dia_asig			= 31
//		elseif ll_month_asig=6 then
//			ll_dia_asig			= 30
//		elseif ll_month_asig=7 then
//			ll_dia_asig			= 31
//		elseif ll_month_asig=8 then
//			ll_dia_asig			= 31
//		elseif ll_month_asig=9 then
//			ll_dia_asig			= 30
//		elseif ll_month_asig=10 then
//			ll_dia_asig			= 31
//		elseif ll_month_asig=11 then
//			ll_dia_asig			= 30
//		elseif ll_month_asig=12 then
//			ll_dia_asig			= 31
//		end if
//		ls_fecha					= string(ll_dia_asig)+'/'+string(ll_month_asig,'00')+'/'+string(ll_year_asig,'0000')
//	end if
	tab_cobranza.tabpage_4.em_prox_llamado.text					= string(RelativeDate(date(gdt_fec_sistema), 10),"dd/mm/yyyy")
	tab_cobranza.tabpage_4.em_fecha_prox.text						= ls_fecha
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

else
	if ls_columna='t_rojo' or ls_columna='t_texto_rojo' then
		gs_formula			= "fecha  >= c_1_dia_mas AND  fecha  <= c_3_dia_mas AND  gestion_cobranza_existe_pago ='N'"
	elseif ls_columna='t_amarillo' or ls_columna='t_texto_amarillo' then
		gs_formula			= "isnull(gestion_cobranza_fecha_llamado)"
	elseif ls_columna='t_verde' or ls_columna='t_texto_verde' then
		gs_formula			= "fecha  >= c_4_dia_mas AND  gestion_cobranza_existe_pago ='N'"
	elseif ls_columna='t_blanco' or ls_columna='t_texto_blanco' then
		gs_formula			= "fecha <=  gestion_cobranza_fecha_llamado and gestion_cobranza_existe_pago ='N'"
	elseif ls_columna='t_celeste' or ls_columna='t_texto_celeste' then
		gs_formula			= "gestion_cobranza_existe_pago ='S'"
	elseif ls_columna='t_todo' then
		gs_formula			= ''
	end if
	dw_lista.SETfilter(gs_formula)
	dw_lista.filter()
	dw_lista.sort()	
	tab_cobranza.visible	= false
end if
end event

event rowfocuschanged;String	ls_tipo_cob,ls_asignado,ls_fecha
Long		ll_folio,ll_estado_reg,ll_ini,ll_fin,ll_indi,ll_mes,ll_anno,ll_dia,ll_month_asig,ll_year_asig,ll_dia_asig
Date		ld_fecha_prox_llamado,ld_fecha_hoy,ld_fec_asigna,ldt_fec_prox_3_meses

if this.getrow()>0 then 
	il_row					= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gi_rut 					= dw_lista.GetItemNumber(il_row, "gestion_cobranza_rut")
	gs_base					= dw_lista.getitemstring(il_row, "gestion_cobranza_base")
	gs_serie					= dw_lista.getitemstring(il_row, "gestion_cobranza_serie")
	gi_numero				= dw_lista.getitemnumber(il_row, "gestion_cobranza_numero")
	ld_fecha_prox_llamado= date(dw_lista.getitemdatetime(il_row, "gestion_cobranza_fecha_prox_llamado"))
	ls_fecha					= string( dw_lista.getitemdatetime(il_row,'gestion_lista_fecha_termino_asignacion'),'dd/mm/yyyy')
//	if ld_fecha_prox_llamado < date(gdt_fec_sistema) then 
		if gs_depto='F' or gs_depto='O' or gs_depto='I' then 
			tab_cobranza.tabpage_4.cb_grabar.enabled	= true
		else
			tab_cobranza.tabpage_4.cb_grabar.enabled	= false
		end if
//	else
//		tab_cobranza.tabpage_4.cb_grabar.enabled		= false
//	end if
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
	ld_fecha_hoy				= date(gdt_fec_sistema)
	ld_fec_asigna				= date(dw_lista.getitemdatetime(getrow(),'gestion_lista_fecha'))
	
//	DECLARE sp_prox_3_meses PROCEDURE FOR sp_calcular_3_meses( :ld_fec_asigna );
//	EXECUTE sp_prox_3_meses;
//	if sqlca.sqlcode=0 then
//		fetch sp_prox_3_meses into :ldt_fec_prox_3_meses ;
//		close sp_prox_3_meses;
//	end if
//	ls_fecha						= STRING(ldt_fec_prox_3_meses,'dd/mm/yyyy')
	
	tab_cobranza.tabpage_4.em_prox_llamado.text					= string(RelativeDate(date(gdt_fec_sistema), 10),"dd/mm/yyyy")
	tab_cobranza.tabpage_4.em_fecha_prox.text						= ls_fecha

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
else
	tab_cobranza.visible													= false
end if
end event

