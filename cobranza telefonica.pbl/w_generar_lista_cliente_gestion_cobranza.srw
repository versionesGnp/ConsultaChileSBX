forward
global type w_generar_lista_cliente_gestion_cobranza from window
end type
type cb_historico from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type dw_cobranza_rut from datawindow within w_generar_lista_cliente_gestion_cobranza
end type
type cb_cerrar from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type cb_ctacte from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type cb_eliminar from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type pb_grabar from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type cb_formulas from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type cb_imprimir from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type cb_exportar from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type cb_filtrar from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type cb_ordenar from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type dw_lista_base from datawindow within w_generar_lista_cliente_gestion_cobranza
end type
type pb_5 from picturebutton within w_generar_lista_cliente_gestion_cobranza
end type
type pb_4 from picturebutton within w_generar_lista_cliente_gestion_cobranza
end type
type pb_3 from picturebutton within w_generar_lista_cliente_gestion_cobranza
end type
type pb_2 from picturebutton within w_generar_lista_cliente_gestion_cobranza
end type
type st_2 from statictext within w_generar_lista_cliente_gestion_cobranza
end type
type cb_8 from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type cb_5 from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type sle_1 from singlelineedit within w_generar_lista_cliente_gestion_cobranza
end type
type pb_1 from picturebutton within w_generar_lista_cliente_gestion_cobranza
end type
type cb_4 from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type cb_3 from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type cb_1 from commandbutton within w_generar_lista_cliente_gestion_cobranza
end type
type gb_1 from groupbox within w_generar_lista_cliente_gestion_cobranza
end type
type gb_2 from groupbox within w_generar_lista_cliente_gestion_cobranza
end type
type dw_lista from datawindow within w_generar_lista_cliente_gestion_cobranza
end type
end forward

global type w_generar_lista_cliente_gestion_cobranza from window
integer x = 110
integer y = 312
integer width = 3401
integer height = 1976
boolean titlebar = true
string title = "Gestión Cobranza Cliente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_historico cb_historico
dw_cobranza_rut dw_cobranza_rut
cb_cerrar cb_cerrar
cb_ctacte cb_ctacte
cb_eliminar cb_eliminar
pb_grabar pb_grabar
cb_formulas cb_formulas
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
dw_lista_base dw_lista_base
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
st_2 st_2
cb_8 cb_8
cb_5 cb_5
sle_1 sle_1
pb_1 pb_1
cb_4 cb_4
cb_3 cb_3
cb_1 cb_1
gb_1 gb_1
gb_2 gb_2
dw_lista dw_lista
end type
global w_generar_lista_cliente_gestion_cobranza w_generar_lista_cliente_gestion_cobranza

type variables
long		il_row
Double	id_factor_gc
end variables

forward prototypes
public subroutine wf_sql (ref string sql, string ls_base)
public subroutine wf_cargar_dw_contrato (long al_fila)
end prototypes

public subroutine wf_sql (ref string sql, string ls_base);string ls_letra,ls_contrato,ls_promesa,ls_liberador,ls_derecho,ls_pagare

this.title = mid(gs_app_name,1,len(gs_app_name)-3)
//-----------------PROMESAS--------------------------------------------
if ls_base = 'O' then
	sql ='    SELECT CLIENTE.RUT,   '+&
		  '    CLIENTE.FECHA_COBRANZA,   '+&
		  '    CLIENTE.ESTADO_COBRANZA,   '+&
		  '    CLIENTE.NOMBRE,   '+&
		  '    CLIENTE.A_PATERNO,   '+&
		  '    CLIENTE.A_MATERNO,   '+&
		  '    CADENA.CODIGO,   '+&
		  '    CADENA.SERIE,   '+&
		  '    CADENA.NUMERO,   '+&
		  '    PAGO_OFERTA.FECHA_PRIM,   '+&
		  '    OFERTA_V.CTA_PAG_S,   '+&
		  '    PAGO_OFERTA.NRO_CUOTAS,  '+&
		  '    PAGO_OFERTA.FECHA_ULT '+&
		  'FROM CADENA,   '+&
		  '    CLIENTE,   '+&
		  '    OFERTA_V,   '+&
		  '    PAGO_OFERTA  '+&
		  'WHERE ( CADENA.RUT = CLIENTE.RUT ) and  '+&
		  '    ( OFERTA_V.SERIE = PAGO_OFERTA.SERIE ) and  '+&
		  '    ( CADENA.SERIE = OFERTA_V.SERIE ) and  '+&
		  '    ( CADENA.NUMERO = OFERTA_V.NRO_OFERTA ) and  '+&
		  '    ( OFERTA_V.NRO_OFERTA = PAGO_OFERTA.NRO_OFERTA ) and  '+&
		  '    ( OFERTA_V.ULT_FOLIO = PAGO_OFERTA.FOLIO ) and  '+&
		  "    (( CADENA.ESTADO = '"+'V'+"' ) OR  "+&
		  "    ( CADENA.ESTADO = '"+'C'+"' )) and  "+&
		  "    ( CADENA.CODIGO = '"+'O'+"' ) and "+&
		  "    ( CADENA.EST_CUP <> 6 )  "
//-----------------LIBERADORES--------------------------------------------
ELSEif ls_base = 'L' then
	SQL = '   SELECT CLIENTE.RUT,       '+&
		   '   CLIENTE.FECHA_COBRANZA,   '+&
		   '   CLIENTE.ESTADO_COBRANZA,  '+&
			'   CLIENTE.NOMBRE,      '+&
			'   CLIENTE.A_PATERNO,   '+&
			'   CLIENTE.A_MATERNO,   '+&
			'   CADENA.CODIGO,  '+&
			'   CADENA.SERIE,   '+&
			'   CADENA.NUMERO,  '+&
			'   PAGO_LIBERADOR.FECHA_PRIM,  '+&
			'   ANEXO_LIBERADOR.CTA_PAG_M,  '+&
			'   PAGO_LIBERADOR.NRO_CUOTAS,  '+&
		   '	 PAGO_LIBERADOR.FECHA_ULT    '+&
			'FROM ANEXO_LIBERADOR,   '+&
			'   PAGO_LIBERADOR,      '+&
			'   CADENA,   '+&
			'   CLIENTE   '+&
			'WHERE ( ANEXO_LIBERADOR.SERIE_M = PAGO_LIBERADOR.SERIE_M ) and  '+&
			'   ( ANEXO_LIBERADOR.NRO_LIBERADOR = PAGO_LIBERADOR.NRO_LIBERADOR ) and  '+&
			'   ( ANEXO_LIBERADOR.ULT_FOLIO = PAGO_LIBERADOR.FOLIO ) and  '+&
			'   ( CADENA.SERIE = ANEXO_LIBERADOR.SERIE_M ) and  '+&
			'   ( CADENA.NUMERO = ANEXO_LIBERADOR.NRO_LIBERADOR ) and  '+&
			'   ( CADENA.RUT = CLIENTE.RUT (+) ) and  '+&
			"   ( CADENA.ESTADO = '"+'V'+"'  OR  "+&
			"     CADENA.ESTADO = '"+'C'+"' ) and  "+&
			"   ( CADENA.CODIGO = '"+'L'+"' )    " 
//-----------------DERECHO--------------------------------------------			
ELSEif ls_base = 'D' then
	SQL = '   SELECT CLIENTE.RUT,   '+&
		   '   CLIENTE.FECHA_COBRANZA,   '+&
		   '   CLIENTE.ESTADO_COBRANZA,   '+&
			'   CLIENTE.NOMBRE,   '+&
			'   CLIENTE.A_PATERNO,   '+&
			'   CLIENTE.A_MATERNO,   '+&
			'   CADENA.CODIGO,   '+&
			'   CADENA.SERIE,   '+&
			'   CADENA.NUMERO,   '+&
			'   DERECHO.FECHA_PRIM,   '+&
			'   DERECHO.CTA_PAG_LA+DERECHO.CTA_PAG_ISA AS CTAS_PAG,   '+&
			'   DERECHO.PLAZO,  '+&
		   '	 DERECHO.FECHA_ULT    '+&
			'FROM CADENA,   '+&
			'   CLIENTE,   '+&
			'   DERECHO  '+&
			'WHERE ( CLIENTE.RUT = CADENA.RUT ) and  '+&
			'   ( CADENA.SERIE = DERECHO.SERIE_P ) and  '+&
			'   ( CADENA.NUMERO = DERECHO.NRO_PAGARE ) and  '+&
			"   (( CADENA.ESTADO = '"+'V'+"' ) OR  "+&
			"   ( CADENA.ESTADO = '"+'C'+"' )) and  "+&
			"   ( ( CADENA.CODIGO = '"+'D'+"' ) )     "
//-----------------PAGARE--------------------------------------------
ELSEif ls_base = 'P' then
	SQL = '   SELECT CLIENTE.RUT,   '+&
		   '   CLIENTE.FECHA_COBRANZA,   '+&
 		   '   CLIENTE.ESTADO_COBRANZA,   '+&
			'   CLIENTE.NOMBRE,   '+&
			'   CLIENTE.A_PATERNO,   '+&
			'   CLIENTE.A_MATERNO,   '+&
			'   CADENA.CODIGO,   '+&
			'   CADENA.SERIE,   '+&
			'   CADENA.NUMERO,   '+&
			'   PAGARE.FECHA_PRIM,   '+&
			'   PAGARE.CTA_PAG_LA+PAGARE.CTA_PAG_ISA as ctas_pag,  '+&
			'   PAGARE.PLAZO,  '+&
		   '	 PAGARE.FECHA_ULT    '+&
			'FROM CADENA,   '+&
			'   CLIENTE,   '+&
			'   PAGARE  '+&
			'WHERE ( CLIENTE.RUT = CADENA.RUT ) and  '+&
			'   ( CADENA.SERIE = PAGARE.SERIE_P ) and  '+&
			'   ( CADENA.NUMERO = PAGARE.NRO_PAGARE ) and  '+&
			"   ( CADENA.ESTADO = '"+'V'+"'  OR  "+&
			"     CADENA.ESTADO = '"+'C'+"' ) and  "+&
			"   ( CADENA.CODIGO = '"+'P'+"' )    " 
end if
//-------------------------------------------------------------------
end subroutine

public subroutine wf_cargar_dw_contrato (long al_fila);Long		ll_mora_cred,ll_mora_mant,ll_dias_mora_cred,ll_dias_mora_mant,&
			ii_mora_cobro,ii_inc_gastos,i,ll_valor_total
String	ls_base,ls_serie,ls_moneda
Double	ldb_numero,lld_tasa,lld_valor_cuota,lld_tasa_peso,lld_valor_cuota_peso,id_gc,id_im,lld_valor_cuota_m,&
			id_monto
			
ls_base				= dw_lista.getitemstring(al_fila,'base')
ls_serie				= dw_lista.getitemstring(al_fila,'serie')
ldb_numero			= dw_lista.getitemnumber(al_fila,'numero')
ll_mora_cred		= dw_lista.getitemnumber(al_fila,'mora_cred')
ll_mora_mant		= dw_lista.getitemnumber(al_fila,'mora_mant')
ll_dias_mora_cred	= dw_lista.getitemnumber(al_fila,'dias_mora_cred')
ll_dias_mora_mant	= dw_lista.getitemnumber(al_fila,'dias_mora_mant')
CHOOSE CASE ls_base
	CASE 'O'
		SELECT 	"PAGO_OFERTA"."TASA",   "PAGO_OFERTA"."MONEDA",   	"PAGO_OFERTA"."VALOR_CUOTA" ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"OFERTA_V"."VALOR_CUOTA_M"
		INTO 		:lld_tasa,   				:ls_moneda,   					:lld_valor_cuota  ,   				:lld_tasa_peso,   		:lld_tasa  ,				:lld_valor_cuota_m
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
				lld_tasa					= lld_tasa_peso
				lld_valor_cuota_peso	= lld_valor_cuota
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
			dw_lista.setitem(al_fila,'gastos_adm_mora_cred',id_gc)
			dw_lista.setitem(al_fila,'monto_mora_cred',ll_valor_total)
			dw_lista.setitem(al_fila,'interes_mora_cred',id_im)
			dw_lista.setitem(al_fila,'total_mora_cred',(id_gc + id_im + ll_valor_total))
// 			Promesa Calculo Mantencion				
			setnull(ll_valor_total)
			if ls_moneda='2' then // uf
				lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
				lld_tasa					= lld_tasa
			else
				lld_tasa					= lld_tasa_peso
				lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
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
			dw_lista.setitem(al_fila,'gastos_adm_mora_mant',id_gc)
			dw_lista.setitem(al_fila,'monto_mora_mant',ll_valor_total)
			dw_lista.setitem(al_fila,'interes_mora_mant',id_im)
			dw_lista.setitem(al_fila,'total_mora_mant',(id_gc + id_im + ll_valor_total))
		end if

	CASE 'C'
		SELECT	"CONTRATO"."TASA",   "CONTRATO"."VALOR_CUO",   	"CONTRATO"."MONEDA"  ,	"CONTRATO"."VALOR_CUOTA_M",	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" 
		INTO 		:lld_tasa,   			:lld_valor_cuota,   			:ls_moneda  ,			 	:lld_valor_cuota_m,				:lld_tasa_peso,   		:lld_tasa  
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
			dw_lista.setitem(al_fila,'gastos_adm_mora_cred',0)
			dw_lista.setitem(al_fila,'monto_mora_cred',0)
			dw_lista.setitem(al_fila,'interes_mora_cred',0)
			dw_lista.setitem(al_fila,'total_mora_cred',0)
			// Calculo Mantencion
			setnull(ll_valor_total)
			if ls_moneda='2' then // uf
				lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
				lld_tasa					= lld_tasa
			else
				lld_tasa					= lld_tasa_peso
				lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
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
			dw_lista.setitem(al_fila,'gastos_adm_mora_mant',id_gc)
			dw_lista.setitem(al_fila,'monto_mora_mant',ll_valor_total)
			dw_lista.setitem(al_fila,'interes_mora_mant',id_im)
			dw_lista.setitem(al_fila,'total_mora_mant',(id_gc + id_im + ll_valor_total))
		end if

	CASE 'D'
		SELECT	"DERECHO"."TASA",   	"DERECHO"."VALOR_CUO",  "DERECHO"."MONEDA"  ,	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" 
		INTO 		:lld_tasa,   			:lld_valor_cuota,   		:ls_moneda ,				:lld_tasa_peso,   		:lld_tasa 
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
				lld_tasa					= lld_tasa_peso
				lld_valor_cuota_peso	= lld_valor_cuota
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
			dw_lista.setitem(al_fila,'gastos_adm_mora_cred',id_gc)
			dw_lista.setitem(al_fila,'monto_mora_cred',ll_valor_total)
			dw_lista.setitem(al_fila,'interes_mora_cred',id_im)
			dw_lista.setitem(al_fila,'total_mora_cred',(id_gc + id_im + ll_valor_total))
			// Calculo Mantencion
			setnull(ll_valor_total)
			dw_lista.setitem(al_fila,'gastos_adm_mora_mant',0)
			dw_lista.setitem(al_fila,'monto_mora_mant',0)
			dw_lista.setitem(al_fila,'interes_mora_mant',0)
			dw_lista.setitem(al_fila,'total_mora_mant',0)
		end if

	CASE 'P'
		SELECT	"PAGARE"."TASA",  "PAGARE"."VALOR_CUO",   "PAGARE"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" 
		INTO 		:lld_tasa,   		:lld_valor_cuota,   		:ls_moneda  ,				:lld_tasa_peso,   		:lld_tasa 
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
				lld_tasa					= lld_tasa_peso
				lld_valor_cuota_peso	= lld_valor_cuota
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
			dw_lista.setitem(al_fila,'gastos_adm_mora_cred',id_gc)
			dw_lista.setitem(al_fila,'monto_mora_cred',ll_valor_total)
			dw_lista.setitem(al_fila,'interes_mora_cred',id_im)
			dw_lista.setitem(al_fila,'total_mora_cred',(id_gc + id_im + ll_valor_total))
			// Calculo Mantencion
			setnull(ll_valor_total)
			dw_lista.setitem(al_fila,'gastos_adm_mora_mant',0)
			dw_lista.setitem(al_fila,'monto_mora_mant',0)
			dw_lista.setitem(al_fila,'interes_mora_mant',0)
			dw_lista.setitem(al_fila,'total_mora_mant',0)				
		end if

	CASE 'L'
		SELECT	"PAGO_LIBERADOR"."TASA",   "PAGO_LIBERADOR"."VALOR_CUOTA",  "PAGO_LIBERADOR"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" 
		INTO 		:lld_tasa,   					:lld_valor_cuota,   					:ls_moneda  ,							:lld_tasa_peso,   		:lld_tasa 
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
				lld_tasa					= lld_tasa_peso
				lld_valor_cuota_peso	= lld_valor_cuota
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
			dw_lista.setitem(al_fila,'gastos_adm_mora_cred',id_gc)
			dw_lista.setitem(al_fila,'monto_mora_cred',ll_valor_total)
			dw_lista.setitem(al_fila,'interes_mora_cred',id_im)
			dw_lista.setitem(al_fila,'total_mora_cred',(id_gc + id_im + ll_valor_total))
			// Calculo Mantencion
			setnull(ll_valor_total)
			dw_lista.setitem(al_fila,'gastos_adm_mora_mant',0)
			dw_lista.setitem(al_fila,'monto_mora_mant',0)
			dw_lista.setitem(al_fila,'interes_mora_mant',0)
			dw_lista.setitem(al_fila,'total_mora_mant',0)				
		end if

	CASE 'R'
		SELECT	"REPACTA_MANTENCION"."VALOR_CUOTA_UF", "REPACTA_MANTENCION"."TIPO_MONEDA",   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF"  
		INTO 		:lld_valor_cuota,   							:ls_moneda,   								  	:lld_tasa_peso,   		:lld_tasa  
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
				lld_tasa					= lld_tasa_peso
				lld_valor_cuota_peso	= lld_valor_cuota
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
			dw_lista.setitem(al_fila,'gastos_adm_mora_cred',id_gc)
			dw_lista.setitem(al_fila,'monto_mora_cred',ll_valor_total)
			dw_lista.setitem(al_fila,'interes_mora_cred',id_im)
			dw_lista.setitem(al_fila,'total_mora_cred',(id_gc + id_im + ll_valor_total))
			// Calculo Mantencion
			setnull(ll_valor_total)
			dw_lista.setitem(al_fila,'gastos_adm_mora_mant',0)
			dw_lista.setitem(al_fila,'monto_mora_mant',0)
			dw_lista.setitem(al_fila,'interes_mora_mant',0)
			dw_lista.setitem(al_fila,'total_mora_mant',0)				
		end if
		
	CASE 'A'
		SELECT	"PAGO_AUMENTO"."TASA",  "PAGO_AUMENTO"."VALOR_CUOTA", "PAGO_AUMENTO"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" 
		INTO 		:lld_tasa,   				:lld_valor_cuota,   				:ls_moneda  ,						:lld_tasa_peso,   		:lld_tasa 
		FROM 		"ANEXO_AUMENTO",   "CADENA",   "PAGO_AUMENTO"  ,	"TASA"
		WHERE	 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
				 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
				 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
				 ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
				 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
				 (("CADENA"."CODIGO" = 'A' ) AND  
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
				lld_tasa					= lld_tasa_peso
				lld_valor_cuota_peso	= lld_valor_cuota
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
			dw_lista.setitem(al_fila,'gastos_adm_mora_cred',id_gc)
			dw_lista.setitem(al_fila,'monto_mora_cred',ll_valor_total)
			dw_lista.setitem(al_fila,'interes_mora_cred',id_im)
			dw_lista.setitem(al_fila,'total_mora_cred',(id_gc + id_im + ll_valor_total))
			// Calculo Mantencion
			setnull(ll_valor_total)
			dw_lista.setitem(al_fila,'gastos_adm_mora_mant',0)
			dw_lista.setitem(al_fila,'monto_mora_mant',0)
			dw_lista.setitem(al_fila,'interes_mora_mant',0)
			dw_lista.setitem(al_fila,'total_mora_mant',0)				
		end if
END CHOOSE
end subroutine

on w_generar_lista_cliente_gestion_cobranza.create
this.cb_historico=create cb_historico
this.dw_cobranza_rut=create dw_cobranza_rut
this.cb_cerrar=create cb_cerrar
this.cb_ctacte=create cb_ctacte
this.cb_eliminar=create cb_eliminar
this.pb_grabar=create pb_grabar
this.cb_formulas=create cb_formulas
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.dw_lista_base=create dw_lista_base
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.st_2=create st_2
this.cb_8=create cb_8
this.cb_5=create cb_5
this.sle_1=create sle_1
this.pb_1=create pb_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_1=create cb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_lista=create dw_lista
this.Control[]={this.cb_historico,&
this.dw_cobranza_rut,&
this.cb_cerrar,&
this.cb_ctacte,&
this.cb_eliminar,&
this.pb_grabar,&
this.cb_formulas,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.dw_lista_base,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.st_2,&
this.cb_8,&
this.cb_5,&
this.sle_1,&
this.pb_1,&
this.cb_4,&
this.cb_3,&
this.cb_1,&
this.gb_1,&
this.gb_2,&
this.dw_lista}
end on

on w_generar_lista_cliente_gestion_cobranza.destroy
destroy(this.cb_historico)
destroy(this.dw_cobranza_rut)
destroy(this.cb_cerrar)
destroy(this.cb_ctacte)
destroy(this.cb_eliminar)
destroy(this.pb_grabar)
destroy(this.cb_formulas)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.dw_lista_base)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.st_2)
destroy(this.cb_8)
destroy(this.cb_5)
destroy(this.sle_1)
destroy(this.pb_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_lista)
end on

event open;Long		ll_tot_reg,ll_indi,ll_estado,ll_row,ll_tot_reg2,ll_indi2,&
			ll_mora_cred,ll_dias_mora_cred,ll_mora_mant,ll_dias_mora_mant,ll_fallecido,&
			ll_rut,ll_new,ll_rut_cliente,ll_sum_reg,ll_cod_parque,ll_count_reg,ll_numero_cliente
String	ls_string,ls_base,ls_serie,ls_estado_ctto,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,&
			ls_direc_c,ls_cod_ciudad,ls_ciudad,ls_cod_comuna,ls_comuna,ls_fono_p,ls_fono_c,&
			ls_est_cob,ls_glosa_cob,ls_est_titular,ls_base_cliente,ls_serie_cliente,ls_clasif
Datetime	ldt_fec_venc_cred,ldt_fec_venc_mant,ldt_fec_cob,ldt_fec_prox_llam,ldt_fecha_hoy
time		lt_hora=time('00:00:00')		
double	ldb_numero

ldt_fecha_hoy									= datetime(date(gdt_fec_sistema),lt_hora)
SetPointer(HourGlass!)
gf_centrar(w_generar_lista_cliente_gestion_cobranza)
id_factor_gc										= f_factor_gasto_cobranza()
dw_lista.settransobject(sqlca)
dw_lista_base.settransobject(sqlca)
dw_cobranza_rut.settransobject(sqlca)
if gs_conexion = 'Parque El Prado' then
	dw_lista.object.t_parque.text 			= 'Parque El Prado / Manantial / Santiago/ Canaan'
elseif gs_conexion = "Parque La Foresta" then
	dw_lista.object.t_parque.text 			= 'Parque La Foresta'
elseif gs_conexion = "Parque Concepción" then
	dw_lista.object.t_parque.text 			= 'Parque Concepción'
elseif gs_conexion = "Memorial PARK" then
	dw_lista.object.t_parque.text 			= 'Parque Memorial PARK'	
end if
dw_lista.object.t_titulo.text 					= 'Gestión Cobranza'
dw_lista.object.t_titulo1.text 				= 'Con Mora Crédito o Mora Mantención'
if isvalid(w_general_cobranza_telefonica) then
	ll_tot_reg									= w_general_cobranza_telefonica.dw_lista.rowcount()
	for ll_indi=1 to ll_tot_reg
		ll_estado									= w_general_cobranza_telefonica.dw_lista.getitemnumber(ll_indi,'est_reg')
		if ll_estado=0 then
			ll_rut_cliente						= w_general_cobranza_telefonica.dw_lista.getitemnumber(ll_indi,'rut')
			ls_base_cliente						= w_general_cobranza_telefonica.dw_lista.getitemstring(ll_indi,'codigo')
			ls_serie_cliente						= w_general_cobranza_telefonica.dw_lista.getitemstring(ll_indi,'serie')
			ll_numero_cliente					= w_general_cobranza_telefonica.dw_lista.getitemnumber(ll_indi,'numero')
			ls_string								= "rut="+trim(string(ll_rut_cliente))
			ll_row 								= dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
			IF ll_row <= 0 THEN
				ll_tot_reg2						= dw_cobranza_rut.retrieve(date(ldt_fecha_hoy),ll_rut_cliente)
				if ll_tot_reg2>0 then
					for ll_indi2=1 to ll_tot_reg2
						ll_cod_parque			= dw_cobranza_rut.getitemnumber(ll_indi2,'cod_parque')
						ls_base					= dw_cobranza_rut.getitemstring(ll_indi2,'codigo')
						ls_serie					= dw_cobranza_rut.getitemstring(ll_indi2,'serie')
						ldb_numero				= dw_cobranza_rut.getitemnumber(ll_indi2,'numero')
						ls_estado_ctto			= dw_cobranza_rut.getitemstring(ll_indi2,'estado')
						ll_mora_cred			= dw_cobranza_rut.getitemnumber(ll_indi2,'mora_cred')
						ll_dias_mora_cred		= dw_cobranza_rut.getitemnumber(ll_indi2,'dias_mora_cred')
						ldt_fec_venc_cred		= dw_cobranza_rut.getitemdatetime(ll_indi2,'fecha_venc_cred')
						ll_mora_mant			= dw_cobranza_rut.getitemnumber(ll_indi2,'mora_mant')
						ll_dias_mora_mant	= dw_cobranza_rut.getitemnumber(ll_indi2,'dias_mora_mant')
						ldt_fec_venc_mant		= dw_cobranza_rut.getitemdatetime(ll_indi2,'fecha_venc_mant')
						ll_fallecido				= dw_cobranza_rut.getitemnumber(ll_indi2,'fallecidos')
						ll_rut						= dw_cobranza_rut.getitemnumber(ll_indi2,'rut')
						ls_dv						= dw_cobranza_rut.getitemstring(ll_indi2,'dv')
						ls_nombre				= dw_cobranza_rut.getitemstring(ll_indi2,'nombre')
						ls_ap_pat				= dw_cobranza_rut.getitemstring(ll_indi2,'a_paterno')
						ls_ap_mat				= dw_cobranza_rut.getitemstring(ll_indi2,'a_materno')
						ls_direc_c				= dw_cobranza_rut.getitemstring(ll_indi2,'direccion_p')
						ls_cod_ciudad			= dw_cobranza_rut.getitemstring(ll_indi2,'codigo_ciudad')
						ls_ciudad					= dw_cobranza_rut.getitemstring(ll_indi2,'ciudad')
						ls_cod_comuna			= dw_cobranza_rut.getitemstring(ll_indi2,'codigo_comuna')
						ls_comuna				= dw_cobranza_rut.getitemstring(ll_indi2,'comuna')
						ls_fono_p				= dw_cobranza_rut.getitemstring(ll_indi2,'fono_p')
						ls_fono_c				= dw_cobranza_rut.getitemstring(ll_indi2,'fono_c')
						ls_est_cob				= dw_cobranza_rut.getitemstring(ll_indi2,'estado_cobranza')
						ldt_fec_cob				= dw_cobranza_rut.getitemdatetime(ll_indi2,'fecha_cobranza')
						ls_glosa_cob			= dw_cobranza_rut.getitemstring(ll_indi2,'glosa_cobranza')
						ls_est_titular			= dw_cobranza_rut.getitemstring(ll_indi2,'estado_titular')
						ldt_fec_prox_llam		= dw_cobranza_rut.getitemdatetime(ll_indi2,'fecha_prox_llamado')
						ls_clasif					= dw_cobranza_rut.getitemstring(ll_indi2,'clasif')
						SELECT	COUNT("GESTION_COBRANZA"."BASE")  
						INTO 		:ll_count_reg  
						FROM 	"GESTION_COBRANZA"  
						WHERE	"GESTION_COBRANZA"."BASE" = :ls_base  AND  
									"GESTION_COBRANZA"."SERIE" = :ls_serie AND  
									"GESTION_COBRANZA"."NUMERO" = :ldb_numero AND  
									"GESTION_COBRANZA"."FECHA_ASIGNACION" = :ldt_fecha_hoy AND  
								 	"GESTION_COBRANZA"."RUT" = :ll_rut    
						USING	sqlca;
						if ll_count_reg=0 then
							ll_new				= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,'base',ls_base)
							dw_lista.setitem(ll_new,'serie',ls_serie)
							dw_lista.setitem(ll_new,'numero',ldb_numero)
							dw_lista.setitem(ll_new,'fecha_asignacion',ldt_fecha_hoy)
							dw_lista.setitem(ll_new,'estado',ls_estado_ctto)
							dw_lista.setitem(ll_new,'mora_cred',ll_mora_cred)
							dw_lista.setitem(ll_new,'dias_mora_cred',ll_dias_mora_cred)
							dw_lista.setitem(ll_new,'fecha_venc_cred',ldt_fec_venc_cred)
							dw_lista.setitem(ll_new,'mora_mant',ll_mora_mant)
							dw_lista.setitem(ll_new,'dias_mora_mant',ll_dias_mora_mant)
							dw_lista.setitem(ll_new,'fecha_venc_mant',ldt_fec_venc_mant)
							dw_lista.setitem(ll_new,'fallecidos',ll_fallecido)
							dw_lista.setitem(ll_new,'rut',ll_rut)
							dw_lista.setitem(ll_new,'dv',ls_dv)
							dw_lista.setitem(ll_new,'nombre',ls_nombre)
							dw_lista.setitem(ll_new,'a_paterno',ls_ap_pat)
							dw_lista.setitem(ll_new,'a_materno',ls_ap_mat)
							dw_lista.setitem(ll_new,'direccion_p',ls_direc_c)
							dw_lista.setitem(ll_new,'codigo_ciudad',ls_cod_ciudad)
							dw_lista.setitem(ll_new,'ciudad',ls_ciudad)
							dw_lista.setitem(ll_new,'codigo_comuna',ls_cod_comuna)
							dw_lista.setitem(ll_new,'comuna',ls_comuna)
							dw_lista.setitem(ll_new,'fono_p',ls_fono_p)
							dw_lista.setitem(ll_new,'fono_c',ls_fono_c)
							dw_lista.setitem(ll_new,'estado_cobranza',ls_est_cob)
							dw_lista.setitem(ll_new,'fecha_cobranza',ldt_fec_cob)
							dw_lista.setitem(ll_new,'glosa_cobranza',ls_glosa_cob)
							dw_lista.setitem(ll_new,'estado_titular',ls_est_titular)
							dw_lista.setitem(ll_new,'fecha_prox_llamado',ldt_fec_prox_llam)
							dw_lista.setitem(ll_new,'cadena_cod_parque',ll_cod_parque)
							dw_lista.setitem(ll_new,'gestion_cobranza_clasif',ls_clasif)
							//Estatus Cobranza Telefónica
							ll_sum_reg	= 0
							SELECT 	Count("TELE_LOG"."RUT")  
							INTO 		:ll_sum_reg  
							FROM 	"TELE_LOG"  
							WHERE 	"TELE_LOG"."RUT" = :ll_rut   
							USING	sqlca;
							if ll_sum_reg>0 then
								dw_lista.setitem(ll_new,'estatus_telefonico',0)
							else
								dw_lista.setitem(ll_new,'estatus_telefonico',1)
							end if
							//Estatus Envio Carta
							ll_sum_reg	= 0
							SELECT 	Count("CARTA_LOG"."RUT")  
							INTO 		:ll_sum_reg  
							FROM 	"CARTA_LOG"  
							WHERE 	"CARTA_LOG"."RUT" = :ll_rut   
							Using		sqlca;
							if ll_sum_reg>0 then
								dw_lista.setitem(ll_new,'estatus_carta',0)
							else
								dw_lista.setitem(ll_new,'estatus_carta',1)
							end if
							//Estatus Atencion Público
							ll_sum_reg	= 0
							SELECT 	Count("ATENCION_LOG"."RUT")  
							INTO 		:ll_sum_reg  
							FROM 	"ATENCION_LOG"  
							WHERE 	"ATENCION_LOG"."RUT" = :ll_rut   
							USING	sqlca;
							if ll_sum_reg>0 then
								dw_lista.setitem(ll_new,'estatus_publico',0)
							else
								dw_lista.setitem(ll_new,'estatus_publico',1)
							end if
							wf_cargar_dw_contrato(ll_new)
						end if
					next
				end if
			END IF
		end if
	next
	dw_lista.SORT()
	dw_lista.setfocus()
end if
SetPointer(Arrow!)
if dw_lista.rowcount()=0 then 
	messagebox("Advertencia","No registra cliente seleccionado")
	close(w_generar_lista_cliente_gestion_cobranza)
end if
end event

event close;disconnect using trans_1;
end event

type cb_historico from commandbutton within w_generar_lista_cliente_gestion_cobranza
event ue_mousemove pbm_dwnmousemove
integer x = 1248
integer y = 1728
integer width = 283
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_lista.getrow()>0 then
	gs_base			= dw_lista.getitemstring(il_row,'base')
	gs_serie			= dw_lista.getitemstring(il_row,'serie')
	gi_numero		= dw_lista.getitemnumber(il_row,'numero')
	gi_rut				= dw_lista.getitemnumber(il_row,'rut')
	if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
	open(w_cobranza_historica)
end if
end event

type dw_cobranza_rut from datawindow within w_generar_lista_cliente_gestion_cobranza
boolean visible = false
integer x = 1893
integer y = 1892
integer width = 411
integer height = 432
integer taborder = 170
string title = "none"
string dataobject = "dwv_listado_mora_credito_mantencion_rut"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_generar_lista_cliente_gestion_cobranza
integer x = 3072
integer y = 1728
integer width = 265
integer height = 100
integer taborder = 180
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_generar_lista_cliente_gestion_cobranza)
end event

type cb_ctacte from commandbutton within w_generar_lista_cliente_gestion_cobranza
integer x = 690
integer y = 1728
integer width = 416
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;string param
if il_row > 0 then
	gs_base   		= dw_lista.getitemstring(il_row,'base' )
	gs_serie  		= dw_lista.getitemstring(il_row,'serie')
	gi_numero 		= dw_lista.getitemnumber(il_row,'numero' )
	gi_rut    			= dw_lista.getitemnumber(il_row,'rut')
	param     		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
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
		CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if
end event

type cb_eliminar from commandbutton within w_generar_lista_cliente_gestion_cobranza
integer x = 306
integer y = 1728
integer width = 247
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eli&minar"
end type

event clicked;Long	ll_resp
ll_resp	= MessageBox("Advertencia", "Está seguro de Eliminar Cliente Nº "+string(il_row,"###,###,###,##0")+" de la Lista", &
								Exclamation!, YesNo!, 2)
IF ll_resp = 1 THEN
	dw_lista.deleterow(il_row)
END IF
end event

type pb_grabar from commandbutton within w_generar_lista_cliente_gestion_cobranza
integer x = 55
integer y = 1728
integer width = 247
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;open(w_grabar_lista_gestion)

end event

type cb_formulas from commandbutton within w_generar_lista_cliente_gestion_cobranza
integer x = 2706
integer y = 80
integer width = 594
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Narrow"
string text = "&Buscar / Grabar Formula"
end type

event clicked;open(w_formulas)
end event

type cb_imprimir from commandbutton within w_generar_lista_cliente_gestion_cobranza
integer x = 910
integer y = 80
integer width = 247
integer height = 84
integer taborder = 40
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

type cb_exportar from commandbutton within w_generar_lista_cliente_gestion_cobranza
integer x = 562
integer y = 80
integer width = 247
integer height = 84
integer taborder = 30
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

type cb_filtrar from commandbutton within w_generar_lista_cliente_gestion_cobranza
integer x = 329
integer y = 80
integer width = 229
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;//string nulo
long		ll_filas
//setnull (nulo)
//dw_lista.SETfilter(NULO)
//dw_lista.filter()
//gs_formula 	= dw_lista.describe("datawindow.syntax")
//messagebox("",gs_formula)

long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto
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

type cb_ordenar from commandbutton within w_generar_lista_cliente_gestion_cobranza
integer x = 96
integer y = 80
integer width = 229
integer height = 84
integer taborder = 10
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

type dw_lista_base from datawindow within w_generar_lista_cliente_gestion_cobranza
boolean visible = false
integer x = 1422
integer y = 1896
integer width = 411
integer height = 432
string dataobject = "dw_lista_cobranza_por_base_o"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_5 from picturebutton within w_generar_lista_cliente_gestion_cobranza
integer x = 2583
integer y = 1736
integer width = 101
integer height = 84
integer taborder = 160
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

type pb_4 from picturebutton within w_generar_lista_cliente_gestion_cobranza
integer x = 2478
integer y = 1736
integer width = 101
integer height = 84
integer taborder = 150
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

type pb_3 from picturebutton within w_generar_lista_cliente_gestion_cobranza
integer x = 2373
integer y = 1736
integer width = 101
integer height = 84
integer taborder = 140
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

type pb_2 from picturebutton within w_generar_lista_cliente_gestion_cobranza
integer x = 2267
integer y = 1736
integer width = 101
integer height = 84
integer taborder = 130
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

type st_2 from statictext within w_generar_lista_cliente_gestion_cobranza
event ue_mousemove pbm_mousemove
integer x = 1467
integer y = 84
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

type cb_8 from commandbutton within w_generar_lista_cliente_gestion_cobranza
boolean visible = false
integer x = 498
integer y = 2188
integer width = 434
integer height = 108
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Asoc.por Cont."
end type

event clicked;//string ls_base,ls_serie,param
//long 	 ll_numero,ll_rut
//if ll_fila > 0 then
//	ls_base   = dw_1.getitemstring(ll_fila,'base' )
//	ls_serie  = dw_1.getitemstring(ll_fila,'serie')
//	ll_numero = dw_1.getitemnumber(ll_fila,'numero' )
//	ll_rut    = dw_1.getitemnumber(ll_fila,'rut' )
//	param     = ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(ll_rut)
//	OpenWithParm(w_listado_contratos_por_todas_las_tablas,param)
//else
//	messagebox('Seleción','Seleciones un contrato.',information!)
//end if
end event

type cb_5 from commandbutton within w_generar_lista_cliente_gestion_cobranza
boolean visible = false
integer x = 937
integer y = 2072
integer width = 434
integer height = 108
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Historico"
end type

event clicked;//string ls_base,ls_serie,param
//long 	 ll_numero,ll_rut
//if ll_fila > 0 then
//	param     = string(dw_1.getitemnumber(ll_fila,'rut' ))
//	OpenWithParm(w_cobranza_historica,param)
//else
//	messagebox('Seleción','Seleciones un contrato.',information!)
//end if
end event

type sle_1 from singlelineedit within w_generar_lista_cliente_gestion_cobranza
event modified pbm_enmodified
event ue_mousemove pbm_mousemove
integer x = 1774
integer y = 68
integer width = 375
integer height = 92
integer taborder = 50
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

type pb_1 from picturebutton within w_generar_lista_cliente_gestion_cobranza
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 2158
integer y = 68
integer width = 105
integer height = 92
integer taborder = 60
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

type cb_4 from commandbutton within w_generar_lista_cliente_gestion_cobranza
event clicked pbm_bnclicked
boolean visible = false
integer x = 498
integer y = 2072
integer width = 434
integer height = 108
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Imprimir"
end type

event clicked;//if dw_1.rowcount()>0 then
//	f_Print( dw_1 )
//end if
end event

type cb_3 from commandbutton within w_generar_lista_cliente_gestion_cobranza
boolean visible = false
integer x = 59
integer y = 2188
integer width = 434
integer height = 108
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Cont. por Rut"
end type

event clicked;//string ls_base,ls_serie,param
//long 	 ll_numero,ll_rut
//if ll_fila > 0 then
//	ls_base   = dw_1.getitemstring(ll_fila,'base' )
//	ls_serie  = dw_1.getitemstring(ll_fila,'serie')
//	ll_numero = dw_1.getitemnumber(ll_fila,'numero' )
//	ll_rut    = dw_1.getitemnumber(ll_fila,'rut' )
//	param     = ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(ll_rut)
//	OpenWithParm(w_listado_contratos_rut,param)
//else
//	messagebox('Seleción','Seleciones un contrato.',information!)
//end if
end event

type cb_1 from commandbutton within w_generar_lista_cliente_gestion_cobranza
boolean visible = false
integer x = 59
integer y = 2072
integer width = 434
integer height = 108
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Estado"
end type

event clicked;//string ls_base,ls_serie,param,ls_retorno
//long 	 ll_numero,ll_rut
//if ll_fila > 0 then
//	ls_base   = dw_1.getitemstring(ll_fila,'base' )
//	ls_serie  = dw_1.getitemstring(ll_fila,'serie')
//	ll_numero = dw_1.getitemnumber(ll_fila,'numero' )
//	ll_rut    = dw_1.getitemnumber(ll_fila,'rut' )
//	param     = ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(ll_rut)
//	OpenWithParm(w_mensaje_cobranza_telefonica,param)
//	ls_retorno = trim(mid(Message.StringParm,1,2))
//	dw_1.setitem(ll_fila,'estado', ls_retorno)
//	dw_1.accepttext ()
//else
//	messagebox('Selección','Seleciones un Contrato.',information!)
//end if
end event

type gb_1 from groupbox within w_generar_lista_cliente_gestion_cobranza
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 8
integer width = 3287
integer height = 184
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción"
end type

type gb_2 from groupbox within w_generar_lista_cliente_gestion_cobranza
integer x = 2245
integer y = 1700
integer width = 462
integer height = 144
integer textsize = -5
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

type dw_lista from datawindow within w_generar_lista_cliente_gestion_cobranza
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 208
integer width = 3287
integer height = 1476
integer taborder = 80
string dataobject = "dw_lista_gestion_cobranza"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base			= this.getitemstring(il_row,'base')
	gs_serie			= this.getitemstring(il_row,'serie')
	gi_numero		= this.getitemnumber(il_row,'numero')
	gi_rut			= this.getitemnumber(il_row,'rut')
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base			= this.getitemstring(il_row,'base')
	gs_serie			= this.getitemstring(il_row,'serie')
	gi_numero		= this.getitemnumber(il_row,'numero')
	gi_rut			= this.getitemnumber(il_row,'rut')
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	cb_ctacte.triggerevent(clicked!)
end if
end event

