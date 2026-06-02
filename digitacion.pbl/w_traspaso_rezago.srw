forward
global type w_traspaso_rezago from window
end type
type cb_cambiar from commandbutton within w_traspaso_rezago
end type
type pb_proceso from picturebutton within w_traspaso_rezago
end type
type sle_numero from editmask within w_traspaso_rezago
end type
type sle_serie from editmask within w_traspaso_rezago
end type
type sle_base from editmask within w_traspaso_rezago
end type
type sle_folio from editmask within w_traspaso_rezago
end type
type cb_limpiar from commandbutton within w_traspaso_rezago
end type
type st_1 from statictext within w_traspaso_rezago
end type
type cb_ver_cta_cte from commandbutton within w_traspaso_rezago
end type
type dw_datos_contrato from datawindow within w_traspaso_rezago
end type
type st_6 from statictext within w_traspaso_rezago
end type
type st_5 from statictext within w_traspaso_rezago
end type
type st_4 from statictext within w_traspaso_rezago
end type
type dw_cadena from datawindow within w_traspaso_rezago
end type
type dw_ingreso from datawindow within w_traspaso_rezago
end type
type st_3 from statictext within w_traspaso_rezago
end type
type st_2 from statictext within w_traspaso_rezago
end type
type ddlb_tipo_cob from dropdownlistbox within w_traspaso_rezago
end type
type cb_cancelar from commandbutton within w_traspaso_rezago
end type
type cb_asignar from commandbutton within w_traspaso_rezago
end type
type gb_1 from groupbox within w_traspaso_rezago
end type
type gb_2 from groupbox within w_traspaso_rezago
end type
end forward

global type w_traspaso_rezago from window
integer x = 832
integer y = 360
integer width = 2962
integer height = 1736
boolean titlebar = true
string title = "Traspaso de Rezago"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cb_cambiar cb_cambiar
pb_proceso pb_proceso
sle_numero sle_numero
sle_serie sle_serie
sle_base sle_base
sle_folio sle_folio
cb_limpiar cb_limpiar
st_1 st_1
cb_ver_cta_cte cb_ver_cta_cte
dw_datos_contrato dw_datos_contrato
st_6 st_6
st_5 st_5
st_4 st_4
dw_cadena dw_cadena
dw_ingreso dw_ingreso
st_3 st_3
st_2 st_2
ddlb_tipo_cob ddlb_tipo_cob
cb_cancelar cb_cancelar
cb_asignar cb_asignar
gb_1 gb_1
gb_2 gb_2
end type
global w_traspaso_rezago w_traspaso_rezago

type variables
string is_sql
end variables

forward prototypes
public function integer f_actualizar_mov (string as_tipo_mov, double al_monto, long al_no_cuotas)
public function string wf_buscar_pie (string as_base, string as_serie, double al_numero)
public function integer f_actualiza_mov_hijos (string as_tipo_mov, double al_monto, long al_no_cuotas, string as_base, string as_serie, double al_numero)
end prototypes

public function integer f_actualizar_mov (string as_tipo_mov, double al_monto, long al_no_cuotas);LONG 	ll_CTA_PAG_S, ll_total_pagado, ll_ultimo_folio, ll_abono, ll_total_cuotas,ll_pie_pagado,&
		ll_total_pagado_pie,ll_fila

gd_hoy		= Datetime(Today())
IF gs_rezago = "S" THEN
	RETURN 1
END IF
CHOOSE CASE gs_base
	CASE "O", "U", "M"  // OFERTAS / COLUMBARIO
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"OFERTA_V"."TOT_PAGADO",   
							"OFERTA_V"."CTA_PAG_S"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							( "OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
				ll_CTA_PAG_S 		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"OFERTA_V"  
				SET 		"CTA_PAG_S" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							( "OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
			CASE "L"	
				// Otros, no modifica valores
			CASE "A"
				SELECT	"PAGO_OFERTA"."PIE_PAGADO"  
				INTO 		:ll_pie_pagado  
				FROM 		"PAGO_OFERTA",   
							"OFERTA_V"  
				WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
						 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
						 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
						 (("OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ("OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) )   ;
				if isnull(ll_pie_pagado) then ll_pie_pagado=0
				SELECT	"OFERTA_V"."TOT_PAGADO",
							"OFERTA_V"."ULT_FOLIO"
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							( "OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"OFERTA_V"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							( "OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
				ll_total_pagado_pie	= round(ll_pie_pagado + al_monto,0)
				UPDATE	"PAGO_OFERTA"  
				SET 		"PIE_PAGADO" = :ll_total_pagado_pie  
				WHERE  ( "PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
						 ( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) AND  
						 ( "PAGO_OFERTA"."BASE" = :gs_base ) AND  
						 ( "PAGO_OFERTA"."FOLIO" = :ll_ultimo_folio );    
		   CASE "F"
				SELECT	"OFERTA_V"."TOT_PAGADO_M",   
							"OFERTA_V"."CTA_PAG_M"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							( "OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
				ll_CTA_PAG_S 		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"OFERTA_V"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO_M" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							( "OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
			CASE "M"
				// no hace nada
			CASE "N" //Abono mantención
				SELECT	"OFERTA_V"."ABONO_M", "OFERTA_V"."TOT_PAGADO_M"   
				INTO 		:ll_abono, :ll_total_pagado   
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							( "OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
				ll_total_pagado 	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono
				UPDATE	"OFERTA_V"  
				SET 		"ABONO_M" = :ll_abono, 
							"TOT_PAGADO_M" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							( "OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
			CASE "I" // Abono cuota
				SELECT	"OFERTA_V"."ABONO_C", 
							"OFERTA_V"."TOT_PAGADO"   
				INTO 		:ll_abono, 
							:ll_total_pagado
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							( "OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE	"OFERTA_V"  
				SET 		"ABONO_C" = :ll_abono, 
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							( "OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
			CASE "K"
				SELECT	"OFERTA_V"."TOT_PAGADO", 
							"OFERTA_V"."ULT_FOLIO"   
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							( "OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
				SELECT	"PAGO_OFERTA"."NRO_CUOTAS"
				INTO 		:ll_total_cuotas
				FROM 		"PAGO_OFERTA"
				WHERE  ( "PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
							( "PAGO_OFERTA"."BASE" = :gs_base ) AND  
						 ( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) AND  
						 ( "PAGO_OFERTA"."FOLIO" = :ll_ultimo_folio );    
				ll_CTA_PAG_S		= ll_total_cuotas
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"OFERTA_V"  
				SET 		"CTA_PAG_S" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							( "OFERTA_V"."BASE" = :gs_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					IF gs_tipo_cobro = "BL" THEN
						SELECT	"OFERTA_V"."TOT_PAGADO_M",
									"OFERTA_V"."ULT_FOLIO"
						INTO 		:ll_total_pagado, 
									:ll_ultimo_folio   
						FROM 		"OFERTA_V"  
						WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
									( "OFERTA_V"."BASE" = :gs_base ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
						ll_total_pagado	= ll_total_pagado + al_monto 
						UPDATE	"OFERTA_V"
						SET 		"TOT_PAGADO_M" = :ll_total_pagado  
						WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
									( "OFERTA_V"."BASE" = :gs_base ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
					ELSE	
						SELECT	"OFERTA_V"."TOT_PAGADO",
									"OFERTA_V"."ULT_FOLIO"
						INTO 		:ll_total_pagado, 
									:ll_ultimo_folio   
						FROM 		"OFERTA_V"  
						WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
									( "OFERTA_V"."BASE" = :gs_base ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
						ll_total_pagado	= ll_total_pagado + al_monto 
						UPDATE	"OFERTA_V"
						SET 		"TOT_PAGADO" = :ll_total_pagado  
						WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
									( "OFERTA_V"."BASE" = :gs_base ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
					END IF
				else
					// No hace nada
				end if
		END CHOOSE
	CASE "C" // CONTRATOS ISA
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				// No se da este caso
			CASE "L"	
				// Otros, no modifica valores
			CASE "A"
				// No se da este caso
         CASE "F"
				SELECT	"CONTRATO"."TOT_PAGADO",   
							"CONTRATO"."CTA_PAG_M"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"CONTRATO"  
				WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE	"CONTRATO"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );
			CASE "M"
				// no hace nada
			CASE "N" //Abono mantención
				SELECT	"CONTRATO"."ABONO_M", 
							"CONTRATO"."TOT_PAGADO"   
				INTO 		:ll_abono, 
							:ll_total_pagado   
				FROM 		"CONTRATO"  
				WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono
				UPDATE	"CONTRATO"  
				SET 		"ABONO_M" = :ll_abono, 
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );
			CASE "I" // Abono cuota
				// NO SE DA ESTA OPCION
			CASE "K"
				//NO SE DA ESTA OPCION
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"CONTRATO"."TOT_PAGADO"
					INTO 		:ll_total_pagado 
					FROM 		"CONTRATO"  
					WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );    
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE	"CONTRATO"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );
				else
					// No hace nada
				end if
							
		END CHOOSE
	CASE "L" // LIBERADOR
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",   
							"ANEXO_LIBERADOR"."CTA_PAG_M"  
				INTO		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"ANEXO_LIBERADOR"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );
			CASE "L"	
				// OPCION NO UTILIZADA
			CASE "A"
				SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",
							"ANEXO_LIBERADOR"."ULT_FOLIO"
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"ANEXO_LIBERADOR"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );

				UPDATE	"PAGO_LIBERADOR"  
				SET		"PIE_PAGADO" = :al_monto  
				WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND  
						 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ultimo_folio );    
		   CASE "F"
				// NO EXISTE OPCION
			CASE "M"
				// NO EXISTE OPCION
			CASE "N" //Abono mantención
				// NO EXISTE OPCION				
			CASE "I" // Abono cuota
				SELECT	"ANEXO_LIBERADOR"."ABONO_M", 
							"ANEXO_LIBERADOR"."TOT_PAGADO"   
				INTO 		:ll_abono, 
							:ll_total_pagado
				FROM 		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE	"ANEXO_LIBERADOR"  
				SET 		"ABONO_M" = :ll_abono, 
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );
				
			CASE "K"
				SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO", "ANEXO_LIBERADOR"."ULT_FOLIO"   
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
				
				SELECT	"PAGO_LIBERADOR"."NRO_CUOTAS"
				INTO 		:ll_total_cuotas
				FROM 		"PAGO_LIBERADOR"
				WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND  
						 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ultimo_folio );    
				ll_CTA_PAG_S		= ll_total_cuotas
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"ANEXO_LIBERADOR"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );
			   
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",
								"ANEXO_LIBERADOR"."ULT_FOLIO"
					INTO 		:ll_total_pagado, 
								:ll_ultimo_folio   
					FROM 		"ANEXO_LIBERADOR"  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE	"ANEXO_LIBERADOR"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );
				else
					// No hace nada
				end if
		END CHOOSE
	CASE "P" // PAGARE
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"PAGARE"."TOT_PAGADO",   
							"PAGARE"."CTA_PAG_LA"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado 	= al_monto + ll_total_pagado

				UPDATE	"PAGARE"  
				SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );
			CASE "L"	
				// OPCION NO EXISTE
			CASE "A"
				SELECT	"PAGARE"."TOT_PAGADO"
				INTO 		:ll_total_pagado 
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"PAGARE"
				SET 		"TOT_PAGADO" = :ll_total_pagado ,
							"PIE_PAGADO" = :al_monto 
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );
		   CASE "F"
				// OPCION NO EXISTE
 			CASE "M"
				// OPCION NO EXISTE
			CASE "N" //Abono mantención
				// OPCION NO EXISTE				
			CASE "I" // Abono cuota
				SELECT	"PAGARE"."ABONO_PAG", 
							"PAGARE"."TOT_PAGADO"   
				INTO 		:ll_abono, :ll_total_pagado
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE	"PAGARE"  
				SET 		"ABONO_PAG" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );
			CASE "K"
				SELECT	"PAGARE"."TOT_PAGADO", 
							"PAGARE"."PLAZO"
				INTO 		:ll_total_pagado, 
							:ll_total_cuotas 
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
				ll_CTA_PAG_S		= ll_total_cuotas
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"PAGARE"  
				SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"PAGARE"."TOT_PAGADO"
					INTO 		:ll_total_pagado
					FROM 		"PAGARE"  
					WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE 	"PAGARE"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :gi_numero );
				else
					//No hace nada
				end if
		END CHOOSE
   CASE "D" // DERECHO 
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"DERECHO"."TOT_PAGADO",   
							"DERECHO"."CTA_PAG_LA"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"DERECHO"  
				SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );
			CASE "L"	
				// OPCION NO EXISTE
			CASE "A"
				SELECT	"DERECHO"."TOT_PAGADO"
				INTO 		:ll_total_pagado 
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE 	"DERECHO"
				SET 		"TOT_PAGADO" = :ll_total_pagado ,
							"PIE_PAGADO" = :al_monto 
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );
		   CASE "F"
				// OPCION NO EXISTE
 			CASE "M"
				// OPCION NO EXISTE
			CASE "N" //Abono mantención
				// OPCION NO EXISTE				
			CASE "I" // Abono cuota
				SELECT	"DERECHO"."ABONO_PAG", 
							"DERECHO"."TOT_PAGADO"   
				INTO 		:ll_abono, 
							:ll_total_pagado
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE	"DERECHO"  
				SET 		"ABONO_PAG" = :ll_abono, 
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );

			CASE "K"
				SELECT	"DERECHO"."TOT_PAGADO", 
							"DERECHO"."PLAZO"
				INTO 		:ll_total_pagado, 
							:ll_total_cuotas 
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
				ll_CTA_PAG_S		= ll_total_cuotas
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE	"DERECHO"  
				SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"DERECHO"."TOT_PAGADO"
					INTO 		:ll_total_pagado
					FROM 		"DERECHO"  
					WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE 	"DERECHO"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :gi_numero );
				else
					// No hace nada
				end if
		END CHOOSE
	CASE "R" // Reprogramaciones de cuotas de mantención
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"REPACTA_MANTENCION"."TOTAL_PAGADO",   
							"REPACTA_MANTENCION"."CTAS_PAGADAS"  
				INTO 		:ll_total_pagado,:ll_CTA_PAG_S 
				FROM 		"REPACTA_MANTENCION"  
				WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
						 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   ;
				ll_CTA_PAG_S    = al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado = al_monto     + ll_total_pagado
				UPDATE	"REPACTA_MANTENCION"  
				SET  		"CTAS_PAGADAS" = :ll_CTA_PAG_S,   
							"TOTAL_PAGADO" = :ll_total_pagado  
				WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
						 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   ;
			CASE "S"	
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"REPACTA_MANTENCION"."TOTAL_PAGADO" 
					INTO 		:ll_total_pagado 
					FROM 		"REPACTA_MANTENCION"  
					WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
							 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   ;
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE	"REPACTA_MANTENCION"  
					SET   	"TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
							 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   ;
				else
					// No hace nada
				end if
		END CHOOSE
	CASE "A" // AUMENTO CAPACIDAD
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",   
							"ANEXO_AUMENTO"."CTA_PAG_M"  
				INTO		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM		"ANEXO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"ANEXO_AUMENTO"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );
			CASE "L"	
				// OPCION NO UTILIZADA
			CASE "A"
				SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",
							"ANEXO_AUMENTO"."ULT_FOLIO"
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"ANEXO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"ANEXO_AUMENTO"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );

				UPDATE	"PAGO_AUMENTO"  
				SET		"PIE_PAGADO" = :al_monto  
				WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) AND  
						 ( "PAGO_AUMENTO"."FOLIO" = :ll_ultimo_folio );    
		   CASE "F"
				// NO EXISTE OPCION
			CASE "M"
				// NO EXISTE OPCION
			CASE "N" //Abono mantención
				// NO EXISTE OPCION				
			CASE "I" // Abono cuota
				SELECT	"ANEXO_AUMENTO"."ABONO_M", 
							"ANEXO_AUMENTO"."TOT_PAGADO"   
				INTO 		:ll_abono, 
							:ll_total_pagado
				FROM 		"ANEXO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE	"ANEXO_AUMENTO"  
				SET 		"ABONO_M" = :ll_abono, 
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );
				
			CASE "K"
				SELECT	"ANEXO_AUMENTO"."TOT_PAGADO", "ANEXO_AUMENTO"."ULT_FOLIO"   
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"ANEXO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );    
				
				SELECT	"PAGO_AUMENTO"."NRO_CUOTAS"
				INTO 		:ll_total_cuotas
				FROM 		"PAGO_AUMENTO"
				WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) AND  
						 ( "PAGO_AUMENTO"."FOLIO" = :ll_ultimo_folio );    
				ll_CTA_PAG_S		= ll_total_cuotas
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"ANEXO_AUMENTO"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );
			   
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",
								"ANEXO_AUMENTO"."ULT_FOLIO"
					INTO 		:ll_total_pagado, 
								:ll_ultimo_folio   
					FROM 		"ANEXO_AUMENTO"  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );    
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE	"ANEXO_AUMENTO"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );
				else
					// No hace nada
				end if
		END CHOOSE
		
	CASE "F", "G", "V" // Funeraria / Cremacion
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",   
							"PRODUCTO_ANEXO"."CUOTAS_PAG"  
				INTO		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM		"PRODUCTO_ANEXO"  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
							( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND 
						 ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"PRODUCTO_ANEXO"  
				SET 		"CUOTAS_PAG" = :ll_CTA_PAG_S,   
							"TOTAL_PAGADO" = :ll_total_pagado  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
							( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND 
						 ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero );
			CASE "L"	
				// OPCION NO UTILIZADA
			CASE "A"
				SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",
							"PRODUCTO_ANEXO"."ULT_FOLIO"
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"PRODUCTO_ANEXO"  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
							( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND 
						 ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"PRODUCTO_ANEXO"
				SET 		"TOTAL_PAGADO" = :ll_total_pagado  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
							( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND 
						 ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero );

				UPDATE	"PRODUCTO_PAGO"  
				SET		"PIE_PAGADO" = :al_monto  
				WHERE  ( "PRODUCTO_PAGO"."SERIE" = :gs_serie ) AND  
						 ( "PRODUCTO_PAGO"."NUMERO" = :gi_numero ) AND  
						 ( "PRODUCTO_PAGO"."FOLIO" = :ll_ultimo_folio );    
		   CASE "F"
				// NO EXISTE OPCION
			CASE "M"
				// NO EXISTE OPCION
			CASE "N" //Abono mantención
				// NO EXISTE OPCION				

			CASE "K"
				SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO", "PRODUCTO_ANEXO"."ULT_FOLIO"   
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"PRODUCTO_ANEXO"  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
							( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND 
						 ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero );    
				
				SELECT	"PRODUCTO_PAGO"."PLAZO"
				INTO 		:ll_total_cuotas
				FROM 	"PRODUCTO_PAGO"
				WHERE  ( "PRODUCTO_PAGO"."SERIE" = :gs_serie ) AND  
							( "PRODUCTO_PAGO"."BASE" = :gs_base ) AND 
						 ( "PRODUCTO_PAGO"."NUMERO" = :gi_numero ) AND  
						 ( "PRODUCTO_PAGO"."FOLIO" = :ll_ultimo_folio );    
				ll_CTA_PAG_S		= ll_total_cuotas
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"PRODUCTO_ANEXO"  
				SET 		"CUOTAS_PAG" = :ll_CTA_PAG_S,   
							"TOTAL_PAGADO" = :ll_total_pagado  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
							( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND 
						 ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero );
			   
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",
								"PRODUCTO_ANEXO"."ULT_FOLIO"
					INTO 		:ll_total_pagado, 
								:ll_ultimo_folio   
					FROM 	"PRODUCTO_ANEXO"  
					WHERE  	( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
								( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND 
							 	( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero );    
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE	"PRODUCTO_ANEXO"
					SET 		"TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
								( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND 
							 ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero );
				else
					// No hace nada
				end if
		END CHOOSE		
		
END CHOOSE
RETURN 0
end function

public function string wf_buscar_pie (string as_base, string as_serie, double al_numero);String		ls_return='S'
Double	ldb_pie

if as_base='O' or as_base='U' then
	SELECT		"PAGO_OFERTA"."PIE"  
	INTO 			:ldb_pie  
	FROM 		"OFERTA_V",   
					"PAGO_OFERTA",   
					"CADENA"  
	WHERE 	  ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				  ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				  ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				  ( ( "CADENA"."CODIGO" = :as_base ) AND  
				  ( "CADENA"."SERIE" = :as_serie ) AND  
				  ( "CADENA"."NUMERO" = :al_numero ) )  
	USING	sqlca;
	if ldb_pie=0 or isnull(ldb_pie) then ls_return='N'
	
elseif as_base='L' then
	SELECT 	"PAGO_LIBERADOR"."PIE"  
	INTO 		:ldb_pie  
	FROM 	"ANEXO_LIBERADOR",   
				"CADENA",   
				"PAGO_LIBERADOR"  
	WHERE ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
			( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
			( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
			( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
			( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
			( ( "CADENA"."CODIGO" = :as_base ) AND  
			( "CADENA"."SERIE" = :as_serie ) AND  
			( "CADENA"."NUMERO" = :al_numero ) )  
	USING	sqlca;
	if ldb_pie=0 or isnull(ldb_pie) then ls_return='N'
	
elseif as_base='A' then
	SELECT 	"PAGO_AUMENTO"."PIE"  
	INTO 		:ldb_pie  
	FROM 	"ANEXO_AUMENTO",   
				"CADENA",   
				"PAGO_AUMENTO"  
	WHERE ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
			( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
			( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
			( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
			( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
			( ( "CADENA"."CODIGO" = :as_base ) AND  
			( "CADENA"."SERIE" = :as_serie ) AND  
			( "CADENA"."NUMERO" = :al_numero ) )  
	USING	sqlca;
	if ldb_pie=0 or isnull(ldb_pie) then ls_return='N'
	
elseif as_base='D' then
	SELECT	"DERECHO"."PIE"  
	INTO 		:ldb_pie  
	FROM 	"CADENA",   
				"DERECHO"  
	WHERE ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
				( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
				( ( "CADENA"."CODIGO" = :as_base ) AND  
				( "CADENA"."SERIE" = :as_serie ) AND  
				( "CADENA"."NUMERO" = :al_numero ) )   
	USING	sqlca;
	if ldb_pie=0 or isnull(ldb_pie) then ls_return='N'

elseif as_base='P' then
	SELECT 	"PAGARE"."PIE"  
	INTO 		:ldb_pie  
	FROM 	"CADENA",   
				"PAGARE"  
	WHERE ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
			( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
			( ( "CADENA"."CODIGO" = :as_base ) AND  
			( "CADENA"."SERIE" = :as_serie ) AND  
			( "CADENA"."NUMERO" = :al_numero ) )   
	USING	sqlca;
	if ldb_pie=0 or isnull(ldb_pie) then ls_return='N'

elseif as_base='R' then
	SELECT	"REPACTA_MANTENCION"."PIE"  
	INTO 		:ldb_pie  
	FROM 	"CADENA",   
				"REPACTA_MANTENCION"  
	WHERE ( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
			( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
			( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
			( ( "CADENA"."CODIGO" = :as_base ) AND  
			( "CADENA"."SERIE" = :as_serie ) AND  
			( "CADENA"."NUMERO" = :al_numero ) )    
	USING	sqlca;
	if ldb_pie=0 or isnull(ldb_pie) then ls_return='N'
	
elseif as_base='F' or as_base='G' or as_base='V' then
	SELECT 	"PRODUCTO_PAGO"."PIE"  
	INTO 		:ldb_pie  
	FROM 	"CADENA",   
				"PRODUCTO_ANEXO",   
				"PRODUCTO_PAGO"  
	WHERE ( "CADENA"."CODIGO" = "PRODUCTO_ANEXO"."BASE" ) and  
			( "CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" ) and  
			( "CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" ) and  
			( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
			( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
			( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
			( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
			( ( "CADENA"."CODIGO" = :as_base ) AND  
			( "CADENA"."SERIE" = :as_serie ) AND  
			( "CADENA"."NUMERO" = :al_numero ) )   
	USING	sqlca;
	if ldb_pie=0 or isnull(ldb_pie) then ls_return='N'

end if
Return ls_return;

end function

public function integer f_actualiza_mov_hijos (string as_tipo_mov, double al_monto, long al_no_cuotas, string as_base, string as_serie, double al_numero);LONG 	ll_CTA_PAG_S, ll_total_pagado, ll_ultimo_folio, ll_abono, ll_total_cuotas,ll_pie_pagado,&
		ll_total_pagado_pie,ll_fila

gd_hoy		= Datetime(Today())
IF gs_rezago = "S" THEN
	RETURN 1
END IF
CHOOSE CASE as_base
	CASE "O", "U" // OFERTAS / COLUMBARIO
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"OFERTA_V"."TOT_PAGADO",   
							"OFERTA_V"."CTA_PAG_S"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							( "OFERTA_V"."BASE" = :as_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );    
				ll_CTA_PAG_S 		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"OFERTA_V"  
				SET 		"CTA_PAG_S" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							( "OFERTA_V"."BASE" = :as_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );
			CASE "L"	
				// Otros, no modifica valores
			CASE "A"
				SELECT	"PAGO_OFERTA"."PIE_PAGADO"  
				INTO 		:ll_pie_pagado  
				FROM 		"PAGO_OFERTA",   
							"OFERTA_V"  
				WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
						 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
						 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
						 (("OFERTA_V"."SERIE" = :as_serie ) AND  
						 ("OFERTA_V"."BASE" = :as_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero ) )   ;
				if isnull(ll_pie_pagado) then ll_pie_pagado=0
				SELECT	"OFERTA_V"."TOT_PAGADO",
							"OFERTA_V"."ULT_FOLIO"
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							( "OFERTA_V"."BASE" = :as_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"OFERTA_V"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );
				ll_total_pagado_pie	= round(ll_pie_pagado + al_monto,0)
				UPDATE	"PAGO_OFERTA"  
				SET 		"PIE_PAGADO" = :ll_total_pagado_pie  
				WHERE  ( "PAGO_OFERTA"."SERIE" = :as_serie ) AND  
						 ( "PAGO_OFERTA"."NRO_OFERTA" = :al_numero ) AND  
						 ( "PAGO_OFERTA"."BASE" = :as_base ) AND  
						 ( "PAGO_OFERTA"."FOLIO" = :ll_ultimo_folio );    
		   CASE "F"
				SELECT	"OFERTA_V"."TOT_PAGADO_M",   
							"OFERTA_V"."CTA_PAG_M"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							( "OFERTA_V"."BASE" = :as_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );    
				ll_CTA_PAG_S 		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"OFERTA_V"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO_M" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							( "OFERTA_V"."BASE" = :as_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );
			CASE "M"
				// no hace nada
			CASE "N" //Abono mantención
				SELECT	"OFERTA_V"."ABONO_M", "OFERTA_V"."TOT_PAGADO_M"   
				INTO 		:ll_abono, :ll_total_pagado   
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							( "OFERTA_V"."BASE" = :as_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );    
				ll_total_pagado 	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono
				UPDATE	"OFERTA_V"  
				SET 		"ABONO_M" = :ll_abono, 
							"TOT_PAGADO_M" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );
			CASE "I" // Abono cuota
				SELECT	"OFERTA_V"."ABONO_C", 
							"OFERTA_V"."TOT_PAGADO"   
				INTO 		:ll_abono, 
							:ll_total_pagado
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							( "OFERTA_V"."BASE" = :as_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE	"OFERTA_V"  
				SET 		"ABONO_C" = :ll_abono, 
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );
			CASE "K"
				SELECT	"OFERTA_V"."TOT_PAGADO", 
							"OFERTA_V"."ULT_FOLIO"   
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							( "OFERTA_V"."BASE" = :as_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );    
				SELECT	"PAGO_OFERTA"."NRO_CUOTAS"
				INTO 		:ll_total_cuotas
				FROM 		"PAGO_OFERTA"
				WHERE  ( "PAGO_OFERTA"."SERIE" = :as_serie ) AND  
						 ( "PAGO_OFERTA"."NRO_OFERTA" = :al_numero ) AND  
						 ( "PAGO_OFERTA"."BASE" = :as_base ) AND  
						 ( "PAGO_OFERTA"."FOLIO" = :ll_ultimo_folio );    
				ll_CTA_PAG_S		= ll_total_cuotas
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"OFERTA_V"  
				SET 		"CTA_PAG_S" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
							( "OFERTA_V"."BASE" = :as_base ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					IF gs_tipo_cobro = "BL" THEN
						SELECT	"OFERTA_V"."TOT_PAGADO_M",
									"OFERTA_V"."ULT_FOLIO"
						INTO 		:ll_total_pagado, 
									:ll_ultimo_folio   
						FROM 		"OFERTA_V"  
						WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
									 ( "OFERTA_V"."BASE" = :as_base ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );    
						ll_total_pagado	= ll_total_pagado + al_monto 
						UPDATE	"OFERTA_V"
						SET 		"TOT_PAGADO_M" = :ll_total_pagado  
						WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );
					ELSE	
						SELECT	"OFERTA_V"."TOT_PAGADO",
									"OFERTA_V"."ULT_FOLIO"
						INTO 		:ll_total_pagado, 
									:ll_ultimo_folio   
						FROM 		"OFERTA_V"  
						WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
									( "OFERTA_V"."BASE" = :as_base ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );    
						ll_total_pagado	= ll_total_pagado + al_monto 
						UPDATE	"OFERTA_V"
						SET 		"TOT_PAGADO" = :ll_total_pagado  
						WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
									( "OFERTA_V"."BASE" = :as_base ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :al_numero );
					END IF
				else
					// No hace nada
				end if
		END CHOOSE
	CASE "C" // CONTRATOS ISA
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				// No se da este caso
			CASE "L"	
				// Otros, no modifica valores
			CASE "A"
				// No se da este caso
         CASE "F"
				SELECT	"CONTRATO"."TOT_PAGADO",   
							"CONTRATO"."CTA_PAG_M"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"CONTRATO"  
				WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :al_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE	"CONTRATO"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :al_numero );
			CASE "M"
				// no hace nada
			CASE "N" //Abono mantención
				SELECT	"CONTRATO"."ABONO_M", 
							"CONTRATO"."TOT_PAGADO"   
				INTO 		:ll_abono, 
							:ll_total_pagado   
				FROM 		"CONTRATO"  
				WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :al_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono
				UPDATE	"CONTRATO"  
				SET 		"ABONO_M" = :ll_abono, 
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :al_numero );
			CASE "I" // Abono cuota
				// NO SE DA ESTA OPCION
			CASE "K"
				//NO SE DA ESTA OPCION
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"CONTRATO"."TOT_PAGADO"
					INTO 		:ll_total_pagado 
					FROM 		"CONTRATO"  
					WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :al_numero );    
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE	"CONTRATO"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :al_numero );
				else
					// No hace nada
				end if
							
		END CHOOSE
	CASE "L" // LIBERADOR
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",   
							"ANEXO_LIBERADOR"."CTA_PAG_M"  
				INTO		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"ANEXO_LIBERADOR"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );
			CASE "L"	
				// OPCION NO UTILIZADA
			CASE "A"
				SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",
							"ANEXO_LIBERADOR"."ULT_FOLIO"
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"ANEXO_LIBERADOR"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );

				UPDATE	"PAGO_LIBERADOR"  
				SET		"PIE_PAGADO" = :al_monto  
				WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :al_numero ) AND  
						 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ultimo_folio );    
		   CASE "F"
				// NO EXISTE OPCION
			CASE "M"
				// NO EXISTE OPCION
			CASE "N" //Abono mantención
				// NO EXISTE OPCION				
			CASE "I" // Abono cuota
				SELECT	"ANEXO_LIBERADOR"."ABONO_M", 
							"ANEXO_LIBERADOR"."TOT_PAGADO"   
				INTO 		:ll_abono, 
							:ll_total_pagado
				FROM 		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE	"ANEXO_LIBERADOR"  
				SET 		"ABONO_M" = :ll_abono, 
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );
				
			CASE "K"
				SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO", "ANEXO_LIBERADOR"."ULT_FOLIO"   
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );    
				
				SELECT	"PAGO_LIBERADOR"."NRO_CUOTAS"
				INTO 		:ll_total_cuotas
				FROM 		"PAGO_LIBERADOR"
				WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :al_numero ) AND  
						 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ultimo_folio );    
				ll_CTA_PAG_S		= ll_total_cuotas
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"ANEXO_LIBERADOR"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );
			   
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",
								"ANEXO_LIBERADOR"."ULT_FOLIO"
					INTO 		:ll_total_pagado, 
								:ll_ultimo_folio   
					FROM 		"ANEXO_LIBERADOR"  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );    
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE	"ANEXO_LIBERADOR"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero );
				else
					// No hace nada
				end if
		END CHOOSE
	CASE "P" // PAGARE
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"PAGARE"."TOT_PAGADO",   
							"PAGARE"."CTA_PAG_LA"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :al_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado 	= al_monto + ll_total_pagado

				UPDATE	"PAGARE"  
				SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :al_numero );
			CASE "L"	
				// OPCION NO EXISTE
			CASE "A"
				SELECT	"PAGARE"."TOT_PAGADO"
				INTO 		:ll_total_pagado 
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :al_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"PAGARE"
				SET 		"TOT_PAGADO" = :ll_total_pagado ,
							"PIE_PAGADO" = :al_monto 
				WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :al_numero );
		   CASE "F"
				// OPCION NO EXISTE
 			CASE "M"
				// OPCION NO EXISTE
			CASE "N" //Abono mantención
				// OPCION NO EXISTE				
			CASE "I" // Abono cuota
				SELECT	"PAGARE"."ABONO_PAG", 
							"PAGARE"."TOT_PAGADO"   
				INTO 		:ll_abono, :ll_total_pagado
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :al_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE	"PAGARE"  
				SET 		"ABONO_PAG" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :al_numero );
			CASE "K"
				SELECT	"PAGARE"."TOT_PAGADO", 
							"PAGARE"."PLAZO"
				INTO 		:ll_total_pagado, 
							:ll_total_cuotas 
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :al_numero );    
				ll_CTA_PAG_S		= ll_total_cuotas
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"PAGARE"  
				SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :al_numero );
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"PAGARE"."TOT_PAGADO"
					INTO 		:ll_total_pagado
					FROM 		"PAGARE"  
					WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :al_numero );    
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE 	"PAGARE"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :al_numero );
				else
					//No hace nada
				end if
		END CHOOSE
   CASE "D" // DERECHO 
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"DERECHO"."TOT_PAGADO",   
							"DERECHO"."CTA_PAG_LA"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :al_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"DERECHO"  
				SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :al_numero );
			CASE "L"	
				// OPCION NO EXISTE
			CASE "A"
				SELECT	"DERECHO"."TOT_PAGADO"
				INTO 		:ll_total_pagado 
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :al_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE 	"DERECHO"
				SET 		"TOT_PAGADO" = :ll_total_pagado ,
							"PIE_PAGADO" = :al_monto 
				WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :al_numero );
		   CASE "F"
				// OPCION NO EXISTE
 			CASE "M"
				// OPCION NO EXISTE
			CASE "N" //Abono mantención
				// OPCION NO EXISTE				
			CASE "I" // Abono cuota
				SELECT	"DERECHO"."ABONO_PAG", 
							"DERECHO"."TOT_PAGADO"   
				INTO 		:ll_abono, 
							:ll_total_pagado
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :al_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE	"DERECHO"  
				SET 		"ABONO_PAG" = :ll_abono, 
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :al_numero );

			CASE "K"
				SELECT	"DERECHO"."TOT_PAGADO", 
							"DERECHO"."PLAZO"
				INTO 		:ll_total_pagado, 
							:ll_total_cuotas 
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :al_numero );    
				ll_CTA_PAG_S		= ll_total_cuotas
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE	"DERECHO"  
				SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :al_numero );
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"DERECHO"."TOT_PAGADO"
					INTO 		:ll_total_pagado
					FROM 		"DERECHO"  
					WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :al_numero );    
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE 	"DERECHO"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
							 ( "DERECHO"."NRO_PAGARE" = :al_numero );
				else
					// No hace nada
				end if
		END CHOOSE
	CASE "R" // Reprogramaciones de cuotas de mantención
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"REPACTA_MANTENCION"."TOTAL_PAGADO",   
							"REPACTA_MANTENCION"."CTAS_PAGADAS"  
				INTO 		:ll_total_pagado,:ll_CTA_PAG_S 
				FROM 		"REPACTA_MANTENCION"  
				WHERE  ( "REPACTA_MANTENCION"."SERIE" = :as_serie ) AND  
						 ( "REPACTA_MANTENCION"."NUMERO" = :al_numero )   ;
				ll_CTA_PAG_S    = al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado = al_monto     + ll_total_pagado
				UPDATE	"REPACTA_MANTENCION"  
				SET  		"CTAS_PAGADAS" = :ll_CTA_PAG_S,   
							"TOTAL_PAGADO" = :ll_total_pagado  
				WHERE  ( "REPACTA_MANTENCION"."SERIE" = :as_serie ) AND  
						 ( "REPACTA_MANTENCION"."NUMERO" = :al_numero )   ;
			CASE "S"	
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"REPACTA_MANTENCION"."TOTAL_PAGADO" 
					INTO 		:ll_total_pagado 
					FROM 		"REPACTA_MANTENCION"  
					WHERE  ( "REPACTA_MANTENCION"."SERIE" = :as_serie ) AND  
							 ( "REPACTA_MANTENCION"."NUMERO" = :al_numero )   ;
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE	"REPACTA_MANTENCION"  
					SET   	"TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  ( "REPACTA_MANTENCION"."SERIE" = :as_serie ) AND  
							 ( "REPACTA_MANTENCION"."NUMERO" = :al_numero )   ;
				else
					// No hace nada
				end if
		END CHOOSE
	CASE "A" // AUMENTO CAPACIDAD
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",   
							"ANEXO_AUMENTO"."CTA_PAG_M"  
				INTO		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM		"ANEXO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"ANEXO_AUMENTO"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero );
			CASE "L"	
				// OPCION NO UTILIZADA
			CASE "A"
				SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",
							"ANEXO_AUMENTO"."ULT_FOLIO"
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"ANEXO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"ANEXO_AUMENTO"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero );

				UPDATE	"PAGO_AUMENTO"  
				SET		"PIE_PAGADO" = :al_monto  
				WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :al_numero ) AND  
						 ( "PAGO_AUMENTO"."FOLIO" = :ll_ultimo_folio );    
		   CASE "F"
				// NO EXISTE OPCION
			CASE "M"
				// NO EXISTE OPCION
			CASE "N" //Abono mantención
				// NO EXISTE OPCION				
			CASE "I" // Abono cuota
				SELECT	"ANEXO_AUMENTO"."ABONO_M", 
							"ANEXO_AUMENTO"."TOT_PAGADO"   
				INTO 		:ll_abono, 
							:ll_total_pagado
				FROM 		"ANEXO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE	"ANEXO_AUMENTO"  
				SET 		"ABONO_M" = :ll_abono, 
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero );
				
			CASE "K"
				SELECT	"ANEXO_AUMENTO"."TOT_PAGADO", "ANEXO_AUMENTO"."ULT_FOLIO"   
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"ANEXO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero );    
				
				SELECT	"PAGO_AUMENTO"."NRO_CUOTAS"
				INTO 		:ll_total_cuotas
				FROM 		"PAGO_AUMENTO"
				WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :al_numero ) AND  
						 ( "PAGO_AUMENTO"."FOLIO" = :ll_ultimo_folio );    
				ll_CTA_PAG_S		= ll_total_cuotas
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"ANEXO_AUMENTO"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero );
			   
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",
								"ANEXO_AUMENTO"."ULT_FOLIO"
					INTO 		:ll_total_pagado, 
								:ll_ultimo_folio   
					FROM 		"ANEXO_AUMENTO"  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero );    
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE	"ANEXO_AUMENTO"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero );
				else
					// No hace nada
				end if
		END CHOOSE
		
	CASE "F", "G", "V" // Funeraria / Cremacion
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",   
							"PRODUCTO_ANEXO"."CUOTAS_PAG"  
				INTO		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM		"PRODUCTO_ANEXO"  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
							( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
						 ( "PRODUCTO_ANEXO"."NUMERO" = :al_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"PRODUCTO_ANEXO"  
				SET 		"CUOTAS_PAG" = :ll_CTA_PAG_S,   
							"TOTAL_PAGADO" = :ll_total_pagado  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
							( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
						 ( "PRODUCTO_ANEXO"."NUMERO" = :al_numero );
			CASE "L"	
				// OPCION NO UTILIZADA
			CASE "A"
				SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",
							"PRODUCTO_ANEXO"."ULT_FOLIO"
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"PRODUCTO_ANEXO"  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
							( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
						 ( "PRODUCTO_ANEXO"."NUMERO" = :al_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"PRODUCTO_ANEXO"
				SET 		"TOTAL_PAGADO" = :ll_total_pagado  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
							( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
						 ( "PRODUCTO_ANEXO"."NUMERO" = :al_numero );

				UPDATE	"PRODUCTO_PAGO"  
				SET		"PIE_PAGADO" = :al_monto  
				WHERE  ( "PRODUCTO_PAGO"."SERIE" = :as_serie ) AND  
						 ( "PRODUCTO_PAGO"."NUMERO" = :al_numero ) AND  
						 ( "PRODUCTO_PAGO"."BASE" = :as_base ) AND  
						 ( "PRODUCTO_PAGO"."FOLIO" = :ll_ultimo_folio );    
		   CASE "F"
				// NO EXISTE OPCION
			CASE "M"
				// NO EXISTE OPCION
			CASE "N" //Abono mantención
				// NO EXISTE OPCION				

			CASE "K"
				SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO", "PRODUCTO_ANEXO"."ULT_FOLIO"   
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"PRODUCTO_ANEXO"  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
							( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
						 ( "PRODUCTO_ANEXO"."NUMERO" = :al_numero );    
				
				SELECT	"PRODUCTO_PAGO"."PLAZO"
				INTO 		:ll_total_cuotas
				FROM 	"PRODUCTO_PAGO"
				WHERE  ( "PRODUCTO_PAGO"."SERIE" = :as_serie ) AND  
						 ( "PRODUCTO_PAGO"."NUMERO" = :al_numero ) AND  
						 ( "PRODUCTO_PAGO"."BASE" = :as_base ) AND  
						 ( "PRODUCTO_PAGO"."FOLIO" = :ll_ultimo_folio );    
				ll_CTA_PAG_S		= ll_total_cuotas
				ll_total_pagado	= al_monto + ll_total_pagado
				UPDATE	"PRODUCTO_ANEXO"  
				SET 		"CUOTAS_PAG" = :ll_CTA_PAG_S,   
							"TOTAL_PAGADO" = :ll_total_pagado  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
							( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
						 ( "PRODUCTO_ANEXO"."NUMERO" = :al_numero );
			   
			CASE "S"
				ll_fila	= dw_ingreso.Find("codigo_otro = '101' or codigo_otro = '102'", 1, dw_ingreso.RowCount())
				if ll_fila > 0 then
					SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",
								"PRODUCTO_ANEXO"."ULT_FOLIO"
					INTO 		:ll_total_pagado, 
								:ll_ultimo_folio   
					FROM 	"PRODUCTO_ANEXO"  
					WHERE  	( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
								( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
							 	( "PRODUCTO_ANEXO"."NUMERO" = :al_numero );    
					ll_total_pagado	= ll_total_pagado + al_monto 
					UPDATE	"PRODUCTO_ANEXO"
					SET 		"TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
								( "PRODUCTO_ANEXO"."BASE" = :as_base ) AND  
							 ( "PRODUCTO_ANEXO"."NUMERO" = :al_numero );
				else
					// No hace nada
				end if
		END CHOOSE		
		
END CHOOSE
RETURN 0
end function

on w_traspaso_rezago.create
this.cb_cambiar=create cb_cambiar
this.pb_proceso=create pb_proceso
this.sle_numero=create sle_numero
this.sle_serie=create sle_serie
this.sle_base=create sle_base
this.sle_folio=create sle_folio
this.cb_limpiar=create cb_limpiar
this.st_1=create st_1
this.cb_ver_cta_cte=create cb_ver_cta_cte
this.dw_datos_contrato=create dw_datos_contrato
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.dw_cadena=create dw_cadena
this.dw_ingreso=create dw_ingreso
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_tipo_cob=create ddlb_tipo_cob
this.cb_cancelar=create cb_cancelar
this.cb_asignar=create cb_asignar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_cambiar,&
this.pb_proceso,&
this.sle_numero,&
this.sle_serie,&
this.sle_base,&
this.sle_folio,&
this.cb_limpiar,&
this.st_1,&
this.cb_ver_cta_cte,&
this.dw_datos_contrato,&
this.st_6,&
this.st_5,&
this.st_4,&
this.dw_cadena,&
this.dw_ingreso,&
this.st_3,&
this.st_2,&
this.ddlb_tipo_cob,&
this.cb_cancelar,&
this.cb_asignar,&
this.gb_1,&
this.gb_2}
end on

on w_traspaso_rezago.destroy
destroy(this.cb_cambiar)
destroy(this.pb_proceso)
destroy(this.sle_numero)
destroy(this.sle_serie)
destroy(this.sle_base)
destroy(this.sle_folio)
destroy(this.cb_limpiar)
destroy(this.st_1)
destroy(this.cb_ver_cta_cte)
destroy(this.dw_datos_contrato)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.dw_cadena)
destroy(this.dw_ingreso)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_tipo_cob)
destroy(this.cb_cancelar)
destroy(this.cb_asignar)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;String		ls_cod,ls_descrip,ls_string

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_traspaso_rezago)
dw_ingreso.SetTransObject(SQLCA)
dw_cadena.SetTransObject(SQLCA)
is_sql = dw_cadena.GetSQLSelect( )
ddlb_tipo_cob.reset()
DECLARE x1 CURSOR FOR  
SELECT	"COD_PAGO"."TIPO_COB",   
			"COD_PAGO"."DESCRIPCION_PRINT"  
FROM		"COD_PAGO"  
WHERE 	"COD_PAGO"."DESCRIPCION_PRINT" is not Null  
ORDER BY "COD_PAGO"."TIPO_COB" ASC 
USING	sqlca;
open x1;
do while sqlca.sqlcode=0
	fetch x1 into :ls_cod, :ls_descrip;
	if not isnull(ls_cod) and not isnull(ls_descrip) then
		ls_string	= ls_cod+' - '+ls_descrip
		ddlb_tipo_cob.additem(ls_string)
	end if
	setnull(ls_cod);setnull(ls_descrip)
loop
close x1;
//ddlb_tipo_cob.additem('CI - Comprobante de Ingreso')
//ddlb_tipo_cob.additem('CU - Cupón de Pago')
//ddlb_tipo_cob.additem('BL - Boleta')
//ddlb_tipo_cob.additem('BM - Boletas Monumento')
//ddlb_tipo_cob.additem('C1 - Comprobante de Ingreso')
//ddlb_tipo_cob.additem('CC - Cupón')
//ddlb_tipo_cob.additem('C0 - C.I.')
//ddlb_tipo_cob.additem('B0 - Boletas')
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_cambiar from commandbutton within w_traspaso_rezago
boolean visible = false
integer x = 1522
integer y = 1496
integer width = 480
integer height = 108
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Cambiar &Promesa"
end type

event clicked;open(w_cambiar_promesa_de_pago_en_rezago)
end event

type pb_proceso from picturebutton within w_traspaso_rezago
integer x = 2674
integer y = 100
integer width = 178
integer height = 156
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;sle_folio.triggerevent(modified!)
end event

type sle_numero from editmask within w_traspaso_rezago
integer x = 448
integer y = 1204
integer width = 576
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###############"
end type

event modified;string 	ls_where, ls_sql,ls_pasa='S'
Long		ll_fila

IF Double(sle_numero.text) > 0 THEN
	IF sle_base.text <> "" AND sle_serie.text <> "" THEN
		ls_where 						= " WHERE CADENA.CODIGO = '" + sle_base.text +"' AND CADENA.SERIE = '"+ sle_serie.text +"' AND CADENA.NUMERO = "+ sle_numero.text +""+" AND (CADENA.ESTADO='V' OR CADENA.ESTADO='C')"
	ELSE
		ls_where 						= " WHERE CADENA.NUMERO = "+ sle_numero.text +""+" AND (CADENA.ESTADO='V' OR CADENA.ESTADO='C')"
	END IF
	dw_datos_contrato.Reset()
	ls_sql 								= is_sql + ls_where
	dw_cadena.SetSQLSelect(ls_sql)
	if dw_cadena.Retrieve()>0 then
		dw_cadena.SelectRow(0, FALSE)
		cb_ver_cta_cte.Enabled 		= False
		cb_cambiar.enabled			= false
		gs_base 							= sle_base.text
		gs_serie 							= sle_serie.text
		gi_numero 						= Double(sle_numero.text)
		ll_fila								= dw_ingreso.Find("tipo_mov = 'A'", 1, dw_ingreso.RowCount())
		if ll_fila > 0 then
			ls_pasa						= wf_buscar_pie(gs_base,gs_serie,gi_numero)
			if ls_pasa='N' then
				messagebox("Advertencia","No es posible Traspaso Rezago Pie, NO existe Pie Definido en Contrato "+gs_base+'-'+gs_serie+'-'+string(gi_numero,'###,###,###,##0'))
				sle_base.text			= ''
				sle_serie.text			= ''
				sle_numero.text		= ''
				Setnull(gi_numero);Setnull(gs_base);Setnull(gs_serie)
				sle_base.setfocus()
			end if
		end if
		if ls_pasa='S' then
			if not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 then
				cb_ver_cta_cte.Enabled	= TRUE
				cb_cambiar.enabled		= TRUE
				dw_datos_contrato.Reset()
				CHOOSE CASE gs_base
					CASE "O"
						dw_datos_contrato.DataObject	= "d_trapaso_datos_oferta"
						dw_datos_contrato.SetTransObject(SQLCA)
						dw_datos_contrato.Retrieve(gs_serie, gi_numero)
					CASE "A"
						dw_datos_contrato.DataObject	= "d_trapaso_datos_aumento"
						dw_datos_contrato.SetTransObject(SQLCA)
						dw_datos_contrato.Retrieve(gs_serie, gi_numero)
					CASE "L"
						dw_datos_contrato.DataObject	= "d_trapaso_datos_anexo"
						dw_datos_contrato.SetTransObject(SQLCA)
						dw_datos_contrato.Retrieve(gs_serie, gi_numero)
					CASE "C"
						dw_datos_contrato.DataObject	= "d_trapaso_datos_contrato_isa"
						dw_datos_contrato.SetTransObject(SQLCA)
						dw_datos_contrato.Retrieve(gs_serie, gi_numero)
					CASE "P"
						dw_datos_contrato.DataObject	= "d_trapaso_datos_pagare"
						dw_datos_contrato.SetTransObject(SQLCA)
						dw_datos_contrato.Retrieve(gs_serie, gi_numero)
					CASE "D"
						dw_datos_contrato.DataObject	= "d_trapaso_datos_derecho"
						dw_datos_contrato.SetTransObject(SQLCA)
						dw_datos_contrato.Retrieve(gs_serie, gi_numero)
					CASE "R"
						dw_datos_contrato.DataObject	= "d_trapaso_repacta_mantencion"
						dw_datos_contrato.SetTransObject(SQLCA)
						dw_datos_contrato.Retrieve(gs_serie, gi_numero)
				END CHOOSE
				if dw_datos_contrato.rowcount()=0 then
					dw_datos_contrato.DataObject	= 'dwe_no_existe_contrato'
					dw_datos_contrato.SetTransObject(SQLCA)
					dw_datos_contrato.insertrow(0)
				end if
			end if
		end if
	else
		messagebox("Advertencia","No Existe Contrato o No está VIGENTE / CANCELADO")
		sle_base.text		= ''
		sle_serie.text		= ''
		sle_numero.text	= ''
	end if
END IF
end event

type sle_serie from editmask within w_traspaso_rezago
integer x = 265
integer y = 1204
integer width = 183
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

type sle_base from editmask within w_traspaso_rezago
integer x = 82
integer y = 1204
integer width = 183
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

type sle_folio from editmask within w_traspaso_rezago
integer x = 2048
integer y = 124
integer width = 562
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###############"
end type

event modified;long		ret
string 	ls_sql, ls_where

dw_cadena.Reset()
dw_datos_contrato.Reset()
dw_ingreso.Reset()
sle_base.text						= ''
sle_serie.text						= ''
sle_numero.text					= ''
if long(sle_folio.text)>0 and trim(ddlb_tipo_cob.text)<>'' and not isnull(ddlb_tipo_cob.text) then
	ret 								= dw_ingreso.Retrieve(Mid(ddlb_tipo_cob.text,1,2), Long(sle_folio.text),gs_depto)
	IF ret = 0 THEN
		MessageBox("Error", "El documento de ingreso ingresado no se encuentra o no figura en rezago")
		dw_ingreso.Reset()
		dw_cadena.SelectRow(0, FALSE)
		sle_base.text				= ""
		sle_serie.text 				= ""
		sle_numero.text 			= ""
		sle_base.Enabled 			= False
		sle_serie.Enabled 			= False
		sle_numero.Enabled 		= False
		cb_ver_cta_cte.Enabled	= False
		cb_cambiar.enabled		= false
	ELSE
		sle_base.Enabled 			= True
		sle_serie.Enabled 			= True
		sle_numero.Enabled 		= True 
		ls_where 					= " WHERE CADENA.RUT = "+ String(dw_ingreso.GetItemNumber(1, "rut")) + ""
		ls_sql 						= is_sql + ls_where
		dw_cadena.SetSQLSelect(ls_sql)
		ret 							= dw_cadena.Retrieve()
		dw_cadena.SelectRow(0, FALSE)
		IF ret = 0 THEN 
			MessageBox("Advertencia", "El R.U.T. utilizado en este documento de ingreso no existe como cliente !")
		END IF
	END IF
end if
end event

type cb_limpiar from commandbutton within w_traspaso_rezago
integer x = 2025
integer y = 1496
integer width = 247
integer height = 108
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;String		ls_cod, ls_descrip, ls_string

ddlb_tipo_cob.reset()
DECLARE x1 CURSOR FOR  
SELECT	"COD_PAGO"."TIPO_COB",   
			"COD_PAGO"."DESCRIPCION_PRINT"  
FROM		"COD_PAGO"  
WHERE 	"COD_PAGO"."DESCRIPCION_PRINT" is not Null  
ORDER BY "COD_PAGO"."TIPO_COB" ASC 
USING	sqlca;
open x1;
do while sqlca.sqlcode=0
	fetch x1 into :ls_cod, :ls_descrip;
	if not isnull(ls_cod) and not isnull(ls_descrip) then
		ls_string	= ls_cod+' - '+ls_descrip
		ddlb_tipo_cob.additem(ls_string)
	end if
	setnull(ls_cod);setnull(ls_descrip)
loop
close x1;
sle_folio.text				= ''
dw_ingreso.reset()
dw_datos_contrato.reset()
sle_base.text				= ''
sle_serie.text				= ''
sle_numero.text			= ''
dw_cadena.reset()
cb_ver_cta_cte.enabled	= false
cb_cambiar.enabled		= false
ddlb_tipo_cob.setfocus()
end event

type st_1 from statictext within w_traspaso_rezago
integer x = 1093
integer y = 924
integer width = 1161
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Contrato"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_ver_cta_cte from commandbutton within w_traspaso_rezago
integer x = 1088
integer y = 1496
integer width = 416
integer height = 108
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "C&uenta Corriente"
end type

event clicked;CHOOSE CASE gs_base
	CASE "O"
		if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
		Open(w_cuenta_corriente_oferta)
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
		Open(w_cuenta_corriente_liberador)
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
		Open(w_cuenta_corriente_aumento_capacidad)
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
		Open(w_cuenta_corriente_contrato_isa)
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
		Open(w_cuenta_corriente_pagare)
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
		Open(w_cuenta_corriente_derecho)
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
		Open(w_cuenta_corriente_repactar_cta_mant)
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
		open(w_cuenta_corriente_funeraria)
END CHOOSE


end event

type dw_datos_contrato from datawindow within w_traspaso_rezago
integer x = 2290
integer y = 916
integer width = 626
integer height = 568
string dataobject = "d_trapaso_datos_producto"
boolean border = false
boolean livescroll = true
end type

event doubleclicked;String	ls_columna,ls_moneda, ls_uso, ls_string
Double	lld_pie
ls_columna	= dwo.name
if ls_columna='pago_oferta_pie' or ls_columna='pago_oferta_pie_t' then
	lld_pie			= double(dw_datos_contrato.getitemnumber(1,'pago_oferta_pie'))
	ls_moneda		= dw_datos_contrato.getitemstring(1,'pago_oferta_moneda')
	if lld_pie>0 then
		ls_uso			= trim(dw_datos_contrato.getitemstring(1,'oferta_v_uso'))
		ls_string		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(lld_pie)+'~t'+ls_uso+'~t'+'C'+'~t'+ls_moneda
		if not isnull(ls_uso) and ls_uso<>'' and not isnull(ls_moneda) then
			openwithparm(w_ingreso_pie_pactado,ls_string)
		else
			if isnull(ls_uso) then
				messagebox("Advertencia","Debe ingresar antes Uso")
			elseif isnull(ls_moneda) then
				messagebox("Advertencia","Debe ingresar antes Moneda")
			end if
		end if
	end if
end if
end event

type st_6 from statictext within w_traspaso_rezago
integer x = 448
integer y = 1080
integer width = 576
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Número "
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_5 from statictext within w_traspaso_rezago
integer x = 265
integer y = 1080
integer width = 183
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Serie"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_4 from statictext within w_traspaso_rezago
integer x = 82
integer y = 1080
integer width = 183
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Base"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_cadena from datawindow within w_traspaso_rezago
integer x = 1088
integer y = 1008
integer width = 1184
integer height = 464
integer taborder = 80
string title = "Seleccione un Contrato"
string dataobject = "d_traspaso_cadena"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base 						= This.GetItemString(row, "codigo")
	gs_serie 						= This.GetItemString(row, "serie")
	gi_numero 					= This.GetItemNumber(row, "numero")
	sle_base.text				= gs_base
	sle_serie.text				= gs_serie
	sle_numero.text			= string(gi_numero,"###,###,###,###,###")
	cb_ver_cta_cte.Enabled	= TRUE
	dw_datos_contrato.Reset()
	CHOOSE CASE gs_base
		CASE "O", "U", "M"
			dw_datos_contrato.DataObject	= "d_trapaso_datos_oferta"
			dw_datos_contrato.SetTransObject(SQLCA)
			dw_datos_contrato.Retrieve(gs_serie, gi_numero, gs_base)
		CASE "L"
			dw_datos_contrato.DataObject	= "d_trapaso_datos_anexo"
			dw_datos_contrato.SetTransObject(SQLCA)
			dw_datos_contrato.Retrieve(gs_serie, gi_numero)
		CASE "F", "G", "V"
			dw_datos_contrato.DataObject	= "d_trapaso_datos_producto"
			dw_datos_contrato.SetTransObject(SQLCA)
			dw_datos_contrato.Retrieve(gs_serie, gi_numero,gs_base)
		CASE "C"
			dw_datos_contrato.DataObject	= "d_trapaso_datos_contrato_isa"
			dw_datos_contrato.SetTransObject(SQLCA)
			dw_datos_contrato.Retrieve(gs_serie, gi_numero)
		CASE "P"
			dw_datos_contrato.DataObject	= "d_trapaso_datos_pagare"
			dw_datos_contrato.SetTransObject(SQLCA)
			dw_datos_contrato.Retrieve(gs_serie, gi_numero)
		CASE "D"
			dw_datos_contrato.DataObject	= "d_trapaso_datos_derecho"
			dw_datos_contrato.SetTransObject(SQLCA)
			dw_datos_contrato.Retrieve(gs_serie, gi_numero)
		CASE "R"
			dw_datos_contrato.DataObject	= "d_trapaso_repacta_mantencion"
			dw_datos_contrato.SetTransObject(SQLCA)
			dw_datos_contrato.Retrieve(gs_serie, gi_numero)
		CASE "A"
			dw_datos_contrato.DataObject	= "d_trapaso_datos_aumento"
			dw_datos_contrato.SetTransObject(SQLCA)
			dw_datos_contrato.Retrieve(gs_serie, gi_numero)
	END CHOOSE
	if dw_datos_contrato.rowcount()=0 then
		dw_datos_contrato.DataObject	= 'dwe_no_existe_contrato'
		dw_datos_contrato.SetTransObject(SQLCA)
		dw_datos_contrato.insertrow(0)
	end if
END IF
end event

type dw_ingreso from datawindow within w_traspaso_rezago
integer x = 32
integer y = 304
integer width = 2875
integer height = 600
integer taborder = 40
string dataobject = "d_traspaso_datos_ingreso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

event itemchanged;string	ls_columna,ls_tipo_mov
ls_columna		= dwo.name
dw_ingreso.accepttext()
if ls_columna='tipo_mov' then
	ls_tipo_mov	= trim(dw_ingreso.getitemstring(dw_ingreso.getrow(),'tipo_mov'))
	if ls_tipo_mov = 'A' then 
		dw_ingreso.setitem(dw_ingreso.getrow(),'cuotas_pag',0)
	end if
	if ls_tipo_mov <> 'L' then 
		dw_ingreso.setitem(dw_ingreso.getrow(),'codigo_otro','0')
	end if
end if
dw_ingreso.accepttext()
end event

type st_3 from statictext within w_traspaso_rezago
integer x = 1797
integer y = 140
integer width = 224
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Folio"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_traspaso_rezago
integer x = 87
integer y = 140
integer width = 393
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Tipo de Cobro"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_tipo_cob from dropdownlistbox within w_traspaso_rezago
integer x = 507
integer y = 124
integer width = 1266
integer height = 776
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_cancelar from commandbutton within w_traspaso_rezago
integer x = 2510
integer y = 1496
integer width = 379
integer height = 108
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(w_traspaso_rezago)
end event

type cb_asignar from commandbutton within w_traspaso_rezago
integer x = 306
integer y = 1416
integer width = 457
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Asignar"
end type

event clicked;Long		ret,ll_tot_reg,ll_indi,ll_cuotas_pag, ll_folio,ll_folio_pie,ll_monto_pagado,ll_numero_cuota,ll_suma_pie,ll_suma_cuota,ll_fila,ll_folio_pie_p,ll_ctas_pag,ll_indi_cupon,ll_folio_cancel,&
			ll_folio_cob,ll_count,ll_ctas_pagadas,ll_ctas_pag_h,ll_cuponera,ll_count_pie_h
double 	ld_tot_pagado,lld_monto,ld_uf_pago,lld_pie,ldb_monto,ll_folio_h,ldb_monto_h, ll_numero_h
String		ls_estado,ls_tipo_mov,ls_tipo_cobro,ls_estado_pago,ls_tipo_moneda,ls_moneda,ls_uso, ls_string,ls_cod_cob,ls_tipo_mov_cancel,ls_tipo_cob_cancel,ls_tipo_cob,ls_cod_movi,&
			ls_pasa,ls_tipo_cob_h,ls_tipo_mov_h,ls_base_h,ls_serie_h
Datetime	ldt_fecha_pago,ldt_fecha_venc,ldt_fec_venc_min,ldt_fecha_cancel,ldt_fecha_pago_h,ldt_fec_venc_cred_h,ldt_fec_venc_mant_h  

dw_ingreso.AcceptText()
SELECT sysdate  INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;

ls_pasa											= 'S'
gs_base											= sle_base.text
gs_serie											= sle_serie.text
gi_numero										= Double(sle_numero.text)
ll_tot_reg										= dw_ingreso.rowcount()
if ll_tot_reg>0 and not isnull(gs_base) and gs_base<>'' and not isnull(gs_base) and gs_serie<>'' and not isnull(gs_serie) and gi_numero>0 and not isnull(gi_numero) then
	if dw_ingreso.Update() = 1 then
		commit;
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Tabla Ingreso SQL: "+sqlca.sqlerrtext)
	end if
	SELECT	"CADENA"."ESTADO"  
	INTO 		:ls_estado  
	FROM 	"CADENA"  
	WHERE	( "CADENA"."CODIGO" = :gs_base ) AND  
				( "CADENA"."SERIE" = :gs_serie ) AND  
			 	( "CADENA"."NUMERO" = :gi_numero )   
	USING	sqlca;
	if ls_estado='V' or ls_estado='C' or ls_estado='S' then
		ls_tipo_cob									= Mid(ddlb_tipo_cob.text,1,2)
		ll_folio_cob									= long(sle_folio.text)
		SELECT	Count("DOCUMENTOS"."TIPO_COB")  
		INTO 		:ll_count  
		FROM 	"DOCUMENTOS"  
		WHERE	( "DOCUMENTOS"."FOLIO" = :ll_folio_cob ) AND  
					( "DOCUMENTOS"."TIPO_COB" = :ls_tipo_cob ) AND  
				 	( "DOCUMENTOS"."ESTADO_CH" = 'P' OR "DOCUMENTOS"."ESTADO_CH" = 'T')   
		USING	sqlca;
		if ll_count=0 then
			ll_fila										= dw_ingreso.Find("tipo_mov = 'A'", 1, dw_ingreso.RowCount())
			if ll_fila>0 then
				if gs_base='O' or gs_base='U' or gs_base='M' then
					ls_moneda						= dw_datos_contrato.getitemstring(1,'pago_oferta_moneda')
					ls_uso							= trim(dw_datos_contrato.getitemstring(1,'oferta_v_uso'))
					lld_pie							= double(dw_datos_contrato.getitemnumber(1,'pago_oferta_pie'))
					if lld_pie>0 then
						ls_cod_cob					= Mid(ddlb_tipo_cob.text,1,2)
						ll_folio_pie_p				= long(sle_folio.text)
						ls_string						= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(lld_pie)+'~t'+ls_cod_cob+'~t'+string(ll_folio_pie_p)
						if not isnull(ls_uso) and ls_uso <> '' and not isnull(ls_moneda) then
							openwithparm(w_lista_ingreso_asignar_traspaso, ls_string)//	w_ingreso_pie_pactado,ls_string)
							ls_pasa					= Message.StringParm
							if ls_pasa<>'S' then ls_pasa='N'
						else
							if isnull(ls_uso) then
								messagebox("Advertencia","Debe ingresar antes Uso")
								ls_pasa				= 'N'
							elseif isnull(ls_moneda) then
								messagebox("Advertencia","Debe ingresar antes Moneda")
								ls_pasa				= 'N'
							end if
						end if
					end if
				elseif gs_base='L' then //Nuevo
					ls_moneda						= dw_datos_contrato.getitemstring(1,'pago_liberador_moneda')
					lld_pie							= double(dw_datos_contrato.getitemnumber(1,'pago_liberador_pie'))
					if lld_pie>0 then
						ls_cod_cob					= Mid(ddlb_tipo_cob.text,1,2)
						ll_folio_pie_p				= long(sle_folio.text)
						ls_string						= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(lld_pie)+'~t'+ls_cod_cob+'~t'+string(ll_folio_pie_p)
						if not isnull(ls_moneda) then
							openwithparm(w_lista_ingreso_asignar_traspaso, ls_string)//	w_ingreso_pie_pactado,ls_string)
							ls_pasa					= Message.StringParm
							if ls_pasa<>'S' then ls_pasa='N'
						else
							if isnull(ls_moneda) then
								messagebox("Advertencia","Debe ingresar antes Moneda")
								ls_pasa				= 'N'
							end if
						end if
					end if
				elseif gs_base='A' then //Nuevo
					ls_moneda						= dw_datos_contrato.getitemstring(1,'pago_aumento_moneda')
					lld_pie							= double(dw_datos_contrato.getitemnumber(1,'pago_aumento_pie'))
					if lld_pie>0 then
						ls_cod_cob					= Mid(ddlb_tipo_cob.text,1,2)
						ll_folio_pie_p				= long(sle_folio.text)
						ls_string						= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(lld_pie)+'~t'+ls_cod_cob+'~t'+string(ll_folio_pie_p)
						if not isnull(ls_moneda) then
							openwithparm(w_lista_ingreso_asignar_traspaso, ls_string)//	w_ingreso_pie_pactado,ls_string)
							ls_pasa					= Message.StringParm
							if ls_pasa<>'S' then ls_pasa='N'
						else
							if isnull(ls_moneda) then
								messagebox("Advertencia","Debe ingresar antes Moneda")
								ls_pasa				= 'N'
							end if
						end if
					end if
				elseif gs_base='F' or gs_base='G' or gs_base='V' then //Nuevo
					ls_moneda						= dw_datos_contrato.getitemstring(1,'producto_pago_moneda')
					lld_pie							= double(dw_datos_contrato.getitemnumber(1,'producto_pago_pie'))
					if lld_pie>0 then
						ls_cod_cob					= Mid(ddlb_tipo_cob.text,1,2)
						ll_folio_pie_p				= long(sle_folio.text)
						ls_string						= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(lld_pie)+'~t'+ls_cod_cob+'~t'+string(ll_folio_pie_p)
						if not isnull(ls_moneda) then
							openwithparm(w_lista_ingreso_asignar_traspaso, ls_string)//	w_ingreso_pie_pactado,ls_string)
							ls_pasa					= Message.StringParm
							if ls_pasa<>'S' then ls_pasa='N'
						else
							if isnull(ls_moneda) then
								messagebox("Advertencia","Debe ingresar antes Moneda")
								ls_pasa				= 'N'
							end if
						end if
					end if
				else
					ls_pasa							= 'S'
				end if
			
			end if
			if ls_pasa='S' then
				for ll_indi=1 to ll_tot_reg
					dw_ingreso.SetItem(ll_indi, "base", gs_base)
					dw_ingreso.SetItem(ll_indi, "serie", gs_serie)
					dw_ingreso.SetItem(ll_indi, "contrato", gi_numero)
				next
				dw_ingreso.accepttext()
				Ret									= dw_ingreso.Update()
				ll_folio 								= dw_ingreso.GetItemNumber(1, "folio")
				ldt_fecha_pago						= dw_ingreso.GetItemdatetime(1, "fecha_pago")
				SetNull(ldt_fecha_venc)
				if gs_base='O' or gs_base='U' or gs_base='M' then
					SELECT	"OFERTA_V"."USO"  
					INTO 		:ls_uso  
					FROM 	"OFERTA_V","PAGO_OFERTA","CADENA"  
					WHERE	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							 	( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
							 	( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
							 	(("OFERTA_V"."SERIE" = :gs_serie ) AND  
							 	( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) AND  
							 	( "CADENA"."CODIGO" = :gs_base )  )   
					USING	sqlca;
	//				if ls_uso='NF' then
						ls_cod_cob					= Mid(ddlb_tipo_cob.text,1,2)
						SELECT	MIN("DOCUMENTOS"."FECHA_VENC")
						INTO 		:ldt_fecha_venc  
						FROM 	"DOCUMENTOS","INGRESO"  
						WHERE	( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
									( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
								 	( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
								 	(("DOCUMENTOS"."FOLIO" = :ll_folio ) AND  
								 	( "DOCUMENTOS"."TIPO_COB" = :ls_cod_cob ) AND  
								 	( "DOCUMENTOS"."COD_PAGO" = 'CH' ) )   AND
								 	( "INGRESO"."SERIE" = :gs_serie ) AND  
								 	( "INGRESO"."CONTRATO" = :gi_numero ) AND  
								 	( "INGRESO"."BASE" = :gs_base ) 
						USING	sqlca;
	//				end if
				end if
				if not isnull(ldt_fecha_venc) then
					UPDATE	"INGRESO"  
					SET 		"SERVIPAG" = :ldt_fecha_venc,
								"FECHA_TRASPASO_REZAGO" = :gdt_fec_sistema,
								"REZAGO" = ' '
					WHERE  ( "INGRESO"."FOLIO" = :ll_folio ) AND  
							 ( "INGRESO"."SERIE" = :gs_serie ) AND  
							 ( "INGRESO"."CONTRATO" = :gi_numero ) AND  
							 ( "INGRESO"."BASE" = :gs_base )   ;
				else
					UPDATE	"INGRESO"  
					SET 		"REZAGO" = ' ',
								"FECHA_TRASPASO_REZAGO" = :gdt_fec_sistema
					WHERE  ( "INGRESO"."FOLIO" = :ll_folio ) AND  
							 ( "INGRESO"."SERIE" = :gs_serie ) AND  
							 ( "INGRESO"."CONTRATO" = :gi_numero ) AND  
							 ( "INGRESO"."BASE" = :gs_base )   ;
				end if
				IF ret = 1 THEN
					gs_rezago						= " "
					for ll_indi=1 to ll_tot_reg
						gs_tipo_cobro				= dw_ingreso.GetItemString(ll_indi, "tipo_cob")
						ls_cod_movi					= dw_ingreso.GetItemString(ll_indi, "tipo_mov")
						ldb_monto					= dw_ingreso.GetItemNumber(ll_indi, "monto")
						ll_ctas_pagadas			= dw_ingreso.GetItemNumber(ll_indi, "cuotas_pag")
						f_actualizar_mov(ls_cod_movi, ldb_monto,ll_ctas_pagadas)
						if gs_base='M' then
							DECLARE x10 CURSOR FOR  
							SELECT	DISTINCT "INGRESO"."FOLIO", 	"INGRESO"."TIPO_COB", 		"INGRESO"."FECHA_PAGO",	"INGRESO"."TIPO_MOV",		"INGRESO"."MONTO",	"INGRESO"."CUOTAS_PAG",	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO" 
							FROM 	"INGRESO",	"CADENA"  
							WHERE 	SUBSTR("INGRESO"."CTTO_MP",1,1) = "CADENA"."MPBASE" AND
										SUBSTR("INGRESO"."CTTO_MP",2,1) ="CADENA"."MPSERIE" AND
										( "INGRESO"."BASE" = "CADENA"."CODIGO" ) AND  
										( "INGRESO"."SERIE" =  "CADENA"."SERIE" ) AND  
										( ( substr("INGRESO"."CTTO_MP",1,1) = :gs_base ) AND  
										( "INGRESO"."TIPO_COB_MP" = :gs_tipo_cobro ) AND  
										( "INGRESO"."FOLIO_MP" = :ll_folio ) AND  
										( "INGRESO"."FECHA_PAGO_MP" = :ldt_fecha_pago ) AND  
										( "CADENA"."MPBASE" = :gs_base ) AND  
										( "CADENA"."MPSERIE" = :gs_serie ) AND  
										( "CADENA"."MPNUMERO" = :gi_numero ) )   
							USING 	Trans_1;
							open x10;
								do while Trans_1.sqlcode=0
									fetch x10 into :ll_folio_h, :ls_tipo_cob_h, :ldt_fecha_pago_h, :ls_tipo_mov_h, :ldb_monto_h, :ll_ctas_pag_h, :ls_base_h, :ls_serie_h, :ll_numero_h;
									if not isnull(ls_base_h) then
										f_actualiza_mov_hijos(ls_tipo_mov_h, ldb_monto_h,ll_ctas_pag_h, ls_base_h, ls_serie_h, ll_numero_h)
									end if
									Setnull(ls_base_h)
								loop
							close x10;
						end if

					next
					commit using SQLCA;
					
					
					if gs_base='M' then
						DECLARE x11 CURSOR FOR  
						SELECT DISTINCT	"INGRESO"."FOLIO", 	"INGRESO"."TIPO_COB", "INGRESO"."FECHA_PAGO",	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO" ,		"INGRESO"."TIPO_MOV"
						FROM 	"INGRESO",	"CADENA"  
						WHERE 	SUBSTR("INGRESO"."CTTO_MP",1,1) = "CADENA"."MPBASE" AND
									SUBSTR("INGRESO"."CTTO_MP",2,1) ="CADENA"."MPSERIE" AND
									( "INGRESO"."BASE" = "CADENA"."CODIGO" ) AND  
									( "INGRESO"."SERIE" =  "CADENA"."SERIE" ) AND  
									( ( substr("INGRESO"."CTTO_MP",1,1) = 'M' ) AND  
									( "INGRESO"."TIPO_COB_MP" = :gs_tipo_cobro ) AND  
									( "INGRESO"."TIPO_MOV"='A' OR "INGRESO"."TIPO_MOV"='E' OR "INGRESO"."TIPO_MOV"='F') AND
									( "INGRESO"."FOLIO_MP" = :ll_folio ) AND  
									( "INGRESO"."FECHA_PAGO_MP" = :ldt_fecha_pago ) AND  
									( "CADENA"."MPBASE" = :gs_base ) AND  
									( "CADENA"."MPSERIE" = :gs_serie ) AND  
									( "CADENA"."MPNUMERO" = :gi_numero ) ) 
						USING	Trans_1;
						open x11;
						if Trans_1.sqlcode=0 then
							do while Trans_1.sqlcode=0
								fetch x11 into :ll_folio_h, :ls_tipo_cob_h, :ldt_fecha_pago_h, :ls_base_h, :ls_serie_h, :ll_numero_h, :ls_tipo_mov_h;
								if not isnull(ls_base_h) then
									UPDATE 	"INGRE"  
									SET 		"CONTRATO" = :ll_numero_h,   
												"REZAGO" = ' '
									WHERE 	( "INGRE"."FOLIO" = :ll_folio_h ) AND  
												( "INGRE"."TIPO_COB" = :ls_tipo_cob_h ) AND  
												( "INGRE"."FECHA_PAGO" = :ldt_fecha_pago_h ) AND  
												( "INGRE"."BASE" = :ls_base_h ) AND  
												( "INGRE"."SERIE" = :ls_serie_h ) 
									USING	Trans_2;
												
									UPDATE 	"INGRESO"  
									SET 		"CONTRATO" = :ll_numero_h,   
												"REZAGO" = ' ',
												"FECHA_TRASPASO_REZAGO" = :gdt_fec_sistema  
									WHERE 	( "INGRESO"."FOLIO" = :ll_folio_h ) AND  
												( "INGRESO"."TIPO_COB" = :ls_tipo_cob_h ) AND  
												( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago_h ) AND  
												( "INGRESO"."BASE" = :ls_base_h ) AND  
												( "INGRESO"."SERIE" = :ls_serie_h ) 
									USING	Trans_2;
									if Trans_2.sqlcode=0 then
										commit using Trans_2;
									else
										rollback using Trans_2;
									end if
									UPDATE	"CLIENTE_REZAGO"  
									SET 		"BASE" = :ls_base_h,   
												"SERIE" = :ls_serie_h,   
												"NUMERO" = :ll_numero_h,
												"ESTADO" = 'T',   
												"FECHA_TRASPASO_REZAGO" = :gdt_fec_sistema,   
												"USUARIO_GENERA_TRASPASO" = :gs_user  
									WHERE  	( "CLIENTE_REZAGO"."COD_PAGO" = :ls_tipo_cob_h ) AND  
												( "CLIENTE_REZAGO"."FOLIO" = :ll_folio_h )   AND
												( "CLIENTE_REZAGO"."FECHA_PAGO" = :ldt_fecha_pago_h ) 
									USING		sqlca;
									if Trans_2.sqlcode=0 then
										commit using Trans_2;
									else
										rollback using Trans_2;
									end if
									DECLARE sp_nuevo_cadena_mora2 PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base_h,:ls_serie_h,:ll_numero_h,'M');
									EXECUTE sp_nuevo_cadena_mora2;
									
									SELECT 	"CADENA_MORA"."FECHA_VENC_CRED",  	"CADENA_MORA"."FECHA_VENC_MANT"  
									INTO 		:ldt_fec_venc_cred_h,  							:ldt_fec_venc_mant_h  
									FROM 	"CADENA_MORA"  
									WHERE 	( "CADENA_MORA"."BASE" = :ls_base_h ) AND  
												( "CADENA_MORA"."SERIE" = :ls_serie_h ) AND  
												( "CADENA_MORA"."NUMERO" = :ll_numero_h )   
									USING	Trans_2;
									SELECT DISTINCT MAX("CUPONERAS_DETALLE"."NRO_CUPONERA") 
									INTO			:ll_cuponera
									FROM 		"CUPONERAS_DETALLE"
									WHERE 		( "CUPONERAS_DETALLE"."BASE" = :ls_base_h ) AND 
													( "CUPONERAS_DETALLE"."SERIE" = :ls_serie_h ) AND 
													( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero_h )
									USING	Trans_2;
													
									if ls_tipo_mov_h='A' then
										SELECT 	"DETALLE_PAGO_PIE"."BASE"  
										INTO 		:ll_count_pie_h  
										FROM 	"DETALLE_PAGO_PIE"  
										WHERE 	( "DETALLE_PAGO_PIE"."BASE" = :ls_base_h ) AND  
													( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie_h ) AND  
													( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero_h )  AND
													( "DETALLE_PAGO_PIE"."ESTADO" = 'P' )
										USING 	Trans_2;
										if isnull(ll_count_pie_h) then ll_count_pie_h=0
										if ll_count_pie_h > 0 then
											UPDATE 	"DETALLE_PAGO_PIE"  
											SET 		"ESTADO" = 'C'  
											WHERE 	( "DETALLE_PAGO_PIE"."BASE" = :ls_base_h ) AND  
														( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie_h ) AND  
														( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero_h ) AND  
														( "DETALLE_PAGO_PIE"."ESTADO" = 'P' ) AND  
														( "DETALLE_PAGO_PIE"."NUMERO_CUOTA" = (	SELECT 	MIN("DETALLE_PAGO_PIE"."NUMERO_CUOTA") 
																													FROM 	"DETALLE_PAGO_PIE" 
																													WHERE 	( "DETALLE_PAGO_PIE"."BASE" = :ls_base_h ) AND 
																																( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie_h ) AND 
																																( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero_h ) AND 
																																( "DETALLE_PAGO_PIE"."ESTADO" = 'P' ) ) )  
											USING		Trans_2;
											if Trans_2.sqlcode=0 then
												commit using Trans_2;
											else
												rollback using Trans_2;
											end if;
										end if

									elseif ls_tipo_mov_h='E' or ls_tipo_mov_h='F' then
										UPDATE 	"CUPONERAS_DETALLE"  
										SET 		"ESTADO_PAGO_CUPON" = 'C'  
										WHERE 	( "CUPONERAS_DETALLE"."BASE" = :ls_base_h ) AND  
													( "CUPONERAS_DETALLE"."SERIE" = :ls_serie_h ) AND  
													( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero_h ) AND  
													( "CUPONERAS_DETALLE"."TIPO_MOV" = :ls_tipo_mov_h ) AND  
													( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fec_venc_cred_h ) AND  
													( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera  ) 
										USING		Trans_2;
										if Trans_2.sqlcode=0 then
											commit using Trans_2;
										else
											rollback using Trans_2;
										end if
									end if
									
								end if
								Setnull(ls_base_h)
							loop
						end if
						close x11;
					end if	
					
					
					INSERT INTO "LOG_TRASPASO_REZAGO"  
								( "FOLIO",	"COD_PAGO",	"BASE",		"SERIE",		"NUMERO",	"FECHA_TRASPASO",	"USUARIO" )  
					VALUES	( :ll_folio,	:gs_tipo_cobro,	:gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,		:gs_user)  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						UPDATE	"CLIENTE_REZAGO"  
						SET 		"BASE" = :gs_base,   
									"SERIE" = :gs_serie,   
									"NUMERO" = :gi_numero,
									"ESTADO" = 'T',   
									"FECHA_TRASPASO_REZAGO" = :gdt_fec_sistema,   
									"USUARIO_GENERA_TRASPASO" = :gs_user  
						WHERE  ( "CLIENTE_REZAGO"."COD_PAGO" = :gs_tipo_cobro ) AND  
								 ( "CLIENTE_REZAGO"."FOLIO" = :ll_folio )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
							messagebox("Error","Error al Actualizar Cliente Rezago SQL: "+sqlca.sqlerrtext)
						end if
					else
						rollback;
					end if
					for ll_indi=1 to ll_tot_reg
						ls_tipo_mov_cancel		= dw_ingreso.GetItemString(ll_indi, 'tipo_mov')
						ll_ctas_pag					= dw_ingreso.GetItemNumber(ll_indi, 'cuotas_pag')
						ls_tipo_cob_cancel			= dw_ingreso.GetItemString(ll_indi, 'tipo_cob')
						ll_folio_cancel				= dw_ingreso.GetItemNumber(ll_indi, 'folio')
						ldt_fecha_cancel			= dw_ingreso.GetItemDatetime(ll_indi, 'fecha_pago')
						if ls_tipo_mov_cancel='E' then
							for ll_indi_cupon=1 to ll_ctas_pag
								SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
								INTO 		:ldt_fec_venc_min  
								FROM 	"CUPONERAS_DETALLE"  
								WHERE	( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
											( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
										 	( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
										 	( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' )   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									UPDATE	"CUPONERAS_DETALLE"  
									SET 		"TIPO_COB_PAGO" = :ls_tipo_cob_cancel,   
												"FOLIO_PAGO" = :ll_folio_cancel,   
												"ESTADO_PAGO_CUPON" = 'C',
												"FECHA_PAGO" = :ldt_fec_venc_min  
									WHERE	( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
												( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
											 	( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
											 	( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fec_venc_min ) AND  
											 	( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
											 	( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
									USING	sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							next
							
						elseif ls_tipo_mov_cancel='F' then
							for ll_indi_cupon=1 to ll_ctas_pag
								SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
								INTO 		:ldt_fec_venc_min  
								FROM 	"CUPONERAS_DETALLE"  
								WHERE 	( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
											( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
										 	( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
										 	( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
										 	( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									UPDATE	"CUPONERAS_DETALLE"  
									SET 		"TIPO_COB_PAGO" = :ls_tipo_cob_cancel,   
												"FOLIO_PAGO" = :ll_folio_cancel,   
												"ESTADO_PAGO_CUPON" = 'C',
												"FECHA_PAGO" = :ldt_fec_venc_min  
									WHERE	( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
												( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
												( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
												( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fec_venc_min ) AND  
												( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
												( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
									USING	sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							next
						elseif ls_tipo_mov_cancel='A' then
							for ll_indi_cupon=1 to ll_ctas_pag
								SELECT	MIN("CUPONERAS_DETALLE_WEB"."FECHA_VENC")  
								INTO 		:ldt_fec_venc_min  
								FROM 	"CUPONERAS_DETALLE_WEB"  
								WHERE	( "CUPONERAS_DETALLE_WEB"."BASE" = :gs_base ) AND  
											( "CUPONERAS_DETALLE_WEB"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS_DETALLE_WEB"."NUMERO" = :gi_numero ) AND  
										 	( "CUPONERAS_DETALLE_WEB"."ESTADO_PAGO_CUPON" = 'V' ) AND  
										 	( "CUPONERAS_DETALLE_WEB"."TIPO_MOV" = 'A' )   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									UPDATE	"CUPONERAS_DETALLE_WEB"  
									SET 		"TIPO_COB_PAGO" = :ls_tipo_cob_cancel,   
												"FOLIO_PAGO" = :ll_folio_cancel,   
												"ESTADO_PAGO_CUPON" = 'C',
												"FECHA_PAGO" = :ldt_fec_venc_min  
									WHERE	( "CUPONERAS_DETALLE_WEB"."BASE" = :gs_base ) AND  
												( "CUPONERAS_DETALLE_WEB"."SERIE" = :gs_serie ) AND  
											 	( "CUPONERAS_DETALLE_WEB"."NUMERO" = :gi_numero ) AND  
											 	( "CUPONERAS_DETALLE_WEB"."FECHA_VENC" = :ldt_fec_venc_min ) AND  
											 	( "CUPONERAS_DETALLE_WEB"."TIPO_MOV" = 'A' ) AND  
											 	( "CUPONERAS_DETALLE_WEB"."ESTADO_PAGO_CUPON" = 'V' )   
									USING	sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							next
						end if
					next
					DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
					EXECUTE sp_nuevo_cadena_mora;
					IF MessageBox("Grabar", "Grabación Exitosa, desea Traspasar otro Documento en Rezago", Question!, YesNo!, 2) = 1 THEN
						cb_limpiar.triggerevent(clicked!)
					ELSE	
						Close(w_traspaso_rezago)
					END IF
				ELSE
					Rollback using SQLCA;
					MessageBox("Error", "No pudo grabar los datos")
				END IF
			end if
		else
			messagebox("Advertencia","No es Posible Asignar Rezago a Contrato por Tener Cheque en Estado: P-Protestado o T-Castigado")
		end if
	else
		messagebox("Advertencia","No es Posible Asignar Rezago a Contrato en Estado: "+ls_estado)
	end if
else
	MessageBox("Advertencia", "No Existen Datos Válidos para Traspaso, debe ingresar N° Contrato")
end if
end event

type gb_1 from groupbox within w_traspaso_rezago
integer x = 32
integer y = 924
integer width = 1038
integer height = 680
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Asignación de Contrato"
end type

type gb_2 from groupbox within w_traspaso_rezago
integer x = 32
integer y = 36
integer width = 2875
integer height = 244
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Datos"
end type

