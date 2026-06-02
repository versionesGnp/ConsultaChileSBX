forward
global type w_ing_corpbanca from window
end type
type st_tipo_mov from statictext within w_ing_corpbanca
end type
type em_fecha_servipag from editmask within w_ing_corpbanca
end type
type st_6 from statictext within w_ing_corpbanca
end type
type cb_cancelar from commandbutton within w_ing_corpbanca
end type
type cb_ingresar from commandbutton within w_ing_corpbanca
end type
type em_monto from editmask within w_ing_corpbanca
end type
type em_fecha from editmask within w_ing_corpbanca
end type
type sle_contrato from singlelineedit within w_ing_corpbanca
end type
type sle_folio from singlelineedit within w_ing_corpbanca
end type
type st_5 from statictext within w_ing_corpbanca
end type
type st_4 from statictext within w_ing_corpbanca
end type
type st_3 from statictext within w_ing_corpbanca
end type
type st_2 from statictext within w_ing_corpbanca
end type
type st_1 from statictext within w_ing_corpbanca
end type
type p_1 from picture within w_ing_corpbanca
end type
end forward

global type w_ing_corpbanca from window
integer x = 832
integer y = 360
integer width = 1659
integer height = 1152
boolean titlebar = true
string title = "Ingreso de Cupones / Caja Auxiliar"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
st_tipo_mov st_tipo_mov
em_fecha_servipag em_fecha_servipag
st_6 st_6
cb_cancelar cb_cancelar
cb_ingresar cb_ingresar
em_monto em_monto
em_fecha em_fecha
sle_contrato sle_contrato
sle_folio sle_folio
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
p_1 p_1
end type
global w_ing_corpbanca w_ing_corpbanca

type variables

end variables

forward prototypes
public function integer f_ingresar_ingre (long al_folio, string as_tipo_mov, double ad_monto, integer ai_cuotas_pag)
public function integer f_ingresar_doc (long al_n_cheque, long al_cod_banco, double ld_monto, datetime ad_fecha_venc, string as_cod_pago, long al_n_cheques)
public function integer f_actualizar_mov (string as_tipo_mov, long al_monto, long al_no_cuotas)
end prototypes

public function integer f_ingresar_ingre (long al_folio, string as_tipo_mov, double ad_monto, integer ai_cuotas_pag);//gd_hoy = Datetime(Today())

INSERT INTO "INGRE" 
( "FOLIO"    , "TIPO_COB"   , "FECHA_PAGO", "TIPO_MOV", "MONTO" , "CUOTAS_PAG", "SERIE"  , "CONTRATO", "COD_CAJA", "REZAGO",   
 "VALOR_UF", "PAGO_HIST", "BASE"  , "RUT"  , "USUARIO"         , "PAGO_EXTERNO", "LUGAR_EXTERNO", "AUX", "VIENE_DE" ,"CODIGO_OTRO", "SERVIPAG")  
VALUES 
( :al_folio,:gs_tipo_cobro, :gd_hoy     , :as_tipo_mov,:ad_monto, :ai_cuotas_pag, :gs_serie, :gi_numero, :gs_caja  , :gs_rezago,  
 :gd_uf    ,   'A'      ,:gs_base , :gi_rut, :gs_user				, ' '           , 'interno'      , ' '  , ' ',			'0',				:gd_fecha_servipag);

INSERT INTO "INGRESO"  
( "FOLIO"    , "TIPO_COB"   , "FECHA_PAGO", "TIPO_MOV", "MONTO" , "CUOTAS_PAG", "SERIE"  , "CONTRATO", "COD_CAJA", "REZAGO",   
 "VALOR_UF", "PAGO_HIST", "BASE"  , "RUT"  , "USUARIO"         , "PAGO_EXTERNO", "LUGAR_EXTERNO", "VIENE_DE" ,"CODIGO_OTRO", "SERVIPAG")  
VALUES 
( :al_folio,:gs_tipo_cobro, :gd_hoy     , :as_tipo_mov ,:ad_monto, :ai_cuotas_pag, :gs_serie, :gi_numero, :gs_caja  , :gs_rezago,  
 :gd_uf    ,   'A'      ,:gs_base , :gi_rut, :gs_user				, ' '           , 'interno'      ,  ' ',			'0',				:gd_fecha_servipag);

RETURN 0
end function

public function integer f_ingresar_doc (long al_n_cheque, long al_cod_banco, double ld_monto, datetime ad_fecha_venc, string as_cod_pago, long al_n_cheques);//gd_hoy = Datetime(Today())

INSERT INTO "DOC_COB"  
( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , "COD_BANCO", 		"MONTO"  ,    	"FECHA_VENC", "COD_PAGO", "NUM_CHEQUES", "REZAGO" , "FECHA_PAGO", "COD_CAJA" )  
VALUES 
( :gl_folio, :gs_tipo_cobro,:al_n_cheque, :al_cod_banco , 	:ld_monto, 		:ad_fecha_venc, :as_cod_pago , :al_n_cheques , :gs_rezago, :gd_hoy     , :gs_caja    );

INSERT INTO "DOCUMENTOS"  	
( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , "COD_BANCO", 	"MONTO"  ,    "FECHA_VENC", "COD_PAGO", "NUM_CHEQUES", "REZAGO" , "FECHA_PAGO", "COD_CAJA" )  
VALUES 
( :gl_folio, :gs_tipo_cobro,:al_n_cheque, :al_cod_banco , :ld_monto, :ad_fecha_venc, :as_cod_pago, :al_n_cheques , :gs_rezago, :gd_hoy     , :gs_caja    );

RETURN 0
end function

public function integer f_actualizar_mov (string as_tipo_mov, long al_monto, long al_no_cuotas);Long	ll_CTA_PAG_S, ll_total_pagado, ll_ultimo_folio, ll_abono, ll_total_cuotas,&
		ll_cuotas_pag_pie,ll_total_pie_pagado
//gd_hoy = Datetime(Today())
IF gs_rezago = "S" THEN
	RETURN 1
END IF
CHOOSE CASE gs_base
	CASE "O" // OFERTAS
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"OFERTA_V"."TOT_PAGADO",   
							"OFERTA_V"."CTA_PAG_S"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
			  ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
			  ll_total_pagado = al_monto + ll_total_pagado
				UPDATE	"OFERTA_V"  
				SET 		"CTA_PAG_S" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
			CASE "L"	
				// Otros, no modifica valores
			CASE "A"
				SELECT 	"OFERTA_V"."TOT_PAGADO",
							"OFERTA_V"."ULT_FOLIO"
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
				ll_total_pagado = al_monto + ll_total_pagado
				UPDATE	"OFERTA_V"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
				
				UPDATE 	"PAGO_OFERTA"  
				SET 		"PIE_PAGADO" = :al_monto  
				WHERE  ( "PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
						 ( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) AND  
						 ( "PAGO_OFERTA"."FOLIO" = :ll_ultimo_folio );    
			CASE "F"
				SELECT 	"OFERTA_V"."TOT_PAGADO_M",   
							"OFERTA_V"."CTA_PAG_M"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE 	"OFERTA_V"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO_M" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
			CASE "M"
				// no hace nada
			CASE "N" //Abono mantención
				SELECT 	"OFERTA_V"."ABONO_M", "OFERTA_V"."TOT_PAGADO_M"   
				INTO 		:ll_abono, :ll_total_pagado   
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono
				UPDATE 	"OFERTA_V"  
				SET 		"ABONO_M" = :ll_abono, "TOT_PAGADO_M" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
			CASE "I" // Abono cuota
				SELECT	"OFERTA_V"."ABONO_C", "OFERTA_V"."TOT_PAGADO"   
				INTO 		:ll_abono, :ll_total_pagado
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE 	"OFERTA_V"  
				SET 		"ABONO_C" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
			CASE "K"
				SELECT	"OFERTA_V"."TOT_PAGADO", "OFERTA_V"."ULT_FOLIO"   
				INTO 		:ll_total_pagado, 		:ll_ultimo_folio   
				FROM 		"OFERTA_V"  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
				
				SELECT 	"PAGO_OFERTA"."NRO_CUOTAS"
				INTO 		:ll_total_cuotas
				FROM 		"PAGO_OFERTA"
				WHERE  ( "PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
						 ( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) AND  
						 ( "PAGO_OFERTA"."FOLIO" = :ll_ultimo_folio );    
				ll_CTA_PAG_S 		= ll_total_cuotas
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE 	"OFERTA_V"  
				SET 		"CTA_PAG_S" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
			CASE "S"
				IF gs_tipo_cobro = "BL" or gs_tipo_cobro = "B0" THEN
					SELECT 	"OFERTA_V"."TOT_PAGADO_M",
								"OFERTA_V"."ULT_FOLIO"
					INTO 		:ll_total_pagado, 
								:ll_ultimo_folio   
					FROM 		"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
					ll_total_pagado	= ll_total_pagado - al_monto 
					UPDATE 	"OFERTA_V"
					SET 		"TOT_PAGADO_M" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
				ELSE	
					SELECT 	"OFERTA_V"."TOT_PAGADO",
								"OFERTA_V"."ULT_FOLIO"
					INTO 		:ll_total_pagado, 
								:ll_ultimo_folio   
					FROM 		"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );    
					ll_total_pagado 	= ll_total_pagado - al_monto 
					UPDATE 	"OFERTA_V"
					SET 		"TOT_PAGADO" = :ll_total_pagado  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
							 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero );
				END IF
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
				SELECT 	"CONTRATO"."TOT_PAGADO",   
							"CONTRATO"."CTA_PAG_M"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"CONTRATO"  
				WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );    
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE 	"CONTRATO"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );
			CASE "M"
				// no hace nada
			CASE "N" //Abono mantención
				SELECT 	"CONTRATO"."ABONO_M", "CONTRATO"."TOT_PAGADO"   
				INTO 		:ll_abono, :ll_total_pagado   
				FROM 		"CONTRATO"  
				WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );    
				ll_total_pagado 	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono
				UPDATE 	"CONTRATO"  
				SET 		"ABONO_M" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );
			CASE "I" // Abono cuota
				// NO SE DA ESTA OPCION
			CASE "K"
				//NO SE DA ESTA OPCION
			CASE "S"
				SELECT 	"CONTRATO"."TOT_PAGADO"
				INTO 		:ll_total_pagado 
				FROM 		"CONTRATO"  
				WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );    
				ll_total_pagado 	= ll_total_pagado - al_monto 
				UPDATE 	"CONTRATO"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero );
		END CHOOSE
		
	CASE "L" // LIBERADOR
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT 	"ANEXO_LIBERADOR"."TOT_PAGADO",   
							"ANEXO_LIBERADOR"."CTA_PAG_M"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
				ll_CTA_PAG_S 		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE 	"ANEXO_LIBERADOR"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );
			CASE "L"	
				// OPCION NO UTILIZADA
			CASE "A"
				SELECT 	"ANEXO_LIBERADOR"."TOT_PAGADO",
							"ANEXO_LIBERADOR"."ULT_FOLIO"
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
				ll_total_pagado	= al_monto + ll_total_pagado
				
				UPDATE 	"ANEXO_LIBERADOR"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );
			 
				UPDATE 	"PAGO_LIBERADOR"  
				SET 		"PIE_PAGADO" = :al_monto  
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
				SELECT 	"ANEXO_LIBERADOR"."ABONO_M", "ANEXO_LIBERADOR"."TOT_PAGADO"   
				INTO 		:ll_abono, :ll_total_pagado
				FROM 		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
				ll_total_pagado 	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE 	"ANEXO_LIBERADOR"  
				SET 		"ABONO_M" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );
			CASE "K"
				SELECT 	"ANEXO_LIBERADOR"."TOT_PAGADO", "ANEXO_LIBERADOR"."ULT_FOLIO"   
				INTO 		:ll_total_pagado, 				:ll_ultimo_folio   
				FROM 		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
				
				SELECT 	"PAGO_LIBERADOR"."NRO_CUOTAS"
				INTO 		:ll_total_cuotas
				FROM 		"PAGO_LIBERADOR"
				WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND  
						 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ultimo_folio );    
				ll_CTA_PAG_S 		= ll_total_cuotas
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE 	"ANEXO_LIBERADOR"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );
			CASE "S"
				SELECT 	"ANEXO_LIBERADOR"."TOT_PAGADO",
							"ANEXO_LIBERADOR"."ULT_FOLIO"
				INTO 		:ll_total_pagado, 
							:ll_ultimo_folio   
				FROM 		"ANEXO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );    
				ll_total_pagado	= ll_total_pagado - al_monto 
				UPDATE 	"ANEXO_LIBERADOR"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero );
		END CHOOSE
		
   CASE "P" // PAGARE
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT 	"PAGARE"."TOT_PAGADO",   
							"PAGARE"."CTA_PAG_LA"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
				ll_CTA_PAG_S 		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE 	"PAGARE"  
				SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );
			CASE "L"	
				// OPCION NO EXISTE
			CASE "A"
				SELECT 	"PAGARE"."TOT_PAGADO"
				INTO 		:ll_total_pagado 
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE 	"PAGARE"
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
				SELECT 	"PAGARE"."ABONO_PAG", "PAGARE"."TOT_PAGADO"   
				INTO 		:ll_abono, :ll_total_pagado
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
				ll_total_pagado 	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE 	"PAGARE"  
				SET 		"ABONO_PAG" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );
			CASE "K"
				SELECT 	"PAGARE"."TOT_PAGADO", "PAGARE"."PLAZO"
				INTO 		:ll_total_pagado, :ll_total_cuotas 
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
				ll_CTA_PAG_S 		= ll_total_cuotas
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE 	"PAGARE"  
				SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );
			CASE "S"
				SELECT 	"PAGARE"."TOT_PAGADO"
				INTO 		:ll_total_pagado
				FROM 		"PAGARE"  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );    
				ll_total_pagado 	= ll_total_pagado - al_monto 
				UPDATE 	"PAGARE"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero );
		END CHOOSE
		
   CASE "D" // DERECHO 
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT 	"DERECHO"."TOT_PAGADO",   
							"DERECHO"."CTA_PAG_LA"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
				ll_CTA_PAG_S 		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE 	"DERECHO"  
				SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );
			CASE "L"	
				// OPCION NO EXISTE
			CASE "A"
				SELECT 	"DERECHO"."TOT_PAGADO"
				INTO 		:ll_total_pagado 
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
				ll_total_pagado 	= al_monto + ll_total_pagado
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
				SELECT 	"DERECHO"."ABONO_PAG", "DERECHO"."TOT_PAGADO"   
				INTO 		:ll_abono, :ll_total_pagado
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
				ll_total_pagado 	= al_monto + ll_total_pagado
				ll_abono 			= al_monto + ll_abono 
				UPDATE 	"DERECHO"  
				SET 		"ABONO_PAG" = :ll_abono, "TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );
			CASE "K"
				SELECT	"DERECHO"."TOT_PAGADO", "DERECHO"."PLAZO"
				INTO 		:ll_total_pagado, :ll_total_cuotas 
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
				ll_CTA_PAG_S 		= ll_total_cuotas
				ll_total_pagado 	= al_monto + ll_total_pagado
				UPDATE 	"DERECHO"  
				SET 		"CTA_PAG_LA" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );
			CASE "S"
				SELECT 	"DERECHO"."TOT_PAGADO"
				INTO 		:ll_total_pagado
				FROM 		"DERECHO"  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );    
				ll_total_pagado 	= ll_total_pagado - al_monto 
				UPDATE 	"DERECHO"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
						 ( "DERECHO"."NRO_PAGARE" = :gi_numero );
		END CHOOSE
		
	CASE "A"
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",   
							"ANEXO_AUMENTO"."CTA_PAG_M"  
				INTO 		:ll_total_pagado,   
							:ll_CTA_PAG_S  
				FROM 		"ANEXO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero );    
				
				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado 	= al_monto + ll_total_pagado

				UPDATE	"ANEXO_AUMENTO"  
				SET 		"CTA_PAG_M" = :ll_CTA_PAG_S,   
							"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )
				USING		sqlca;		
				
			CASE "A"
				SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",   
							"ANEXO_AUMENTO"."ULT_FOLIO",   
							"PAGO_AUMENTO"."CTAS_PAGADAS_PIE",
							"PAGO_AUMENTO"."PIE_PAGADO"
				INTO 		:ll_total_pagado,   
							:ll_ultimo_folio,   
							:ll_cuotas_pag_pie,
							:ll_total_pie_pagado
				FROM 		"ANEXO_AUMENTO",   
							"PAGO_AUMENTO",   
							"CADENA"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE" = "PAGO_AUMENTO"."SERIE_M" ) and  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
						 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
						 ( "ANEXO_AUMENTO"."SERIE" = "CADENA"."SERIE" ) and  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
						 (("CADENA"."CODIGO" = 'O' ) AND  
						 ( "ANEXO_AUMENTO"."SERIE" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) )   
				Using		sqlca;
				if isnull(ll_total_pagado) then ll_total_pagado=0
				if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
				if isnull(ll_cuotas_pag_pie) then ll_cuotas_pag_pie=0
				if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
				ll_total_pagado		= al_monto + ll_total_pagado
				UPDATE	"ANEXO_AUMENTO"
				SET 		"TOT_PAGADO" = :ll_total_pagado  
				WHERE  ( "ANEXO_AUMENTO"."SERIE" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )
				USING		sqlca;
				ll_cuotas_pag_pie		= ll_cuotas_pag_pie + al_no_cuotas
				ll_total_pie_pagado	= ll_total_pie_pagado + al_monto
				UPDATE	"PAGO_AUMENTO"  
				SET 		"PIE_PAGADO" = :ll_total_pie_pagado,  
							"CTAS_PAGADAS_PIE" = :ll_cuotas_pag_pie  
				WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) AND  
						 ( "PAGO_AUMENTO"."FOLIO" = :ll_ultimo_folio )
				USING		sqlca;
				
			CASE "S"
				if gs_codigo_otro='101' then
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
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )
					USING		sqlca;

				end if
		END CHOOSE
		
	CASE "R" // Reprogramación de Contratos de Mantención
		CHOOSE CASE as_tipo_mov
			CASE "E"	
				SELECT	"REPACTA_MANTENCION"."CTAS_PAGADAS",
							"REPACTA_MANTENCION"."TOTAL_PAGADO"  
				INTO 		:ll_CTA_PAG_S, 	:ll_total_pagado  
				FROM 		"REPACTA_MANTENCION"  
				WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
						 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   ;				

				ll_CTA_PAG_S		= al_no_cuotas + ll_CTA_PAG_S
				ll_total_pagado 	= al_monto + ll_total_pagado
				
				UPDATE	"REPACTA_MANTENCION"  
				SET 		"REPACTA_MANTENCION"."CTAS_PAGADAS" = :ll_CTA_PAG_S,   
							"REPACTA_MANTENCION"."TOTAL_PAGADO" = :ll_total_pagado  
				WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
						 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )
				USING		sqlca;

			CASE "L"	
				// Otros, no modifica valores
			CASE "S"
				IF (gs_tipo_cobro = "BL" or gs_tipo_cobro = "B0") and gs_codigo_otro='101' THEN
					SELECT	"REPACTA_MANTENCION"."TOTAL_PAGADO"  
					INTO 		:ll_total_pagado  
					FROM 		"REPACTA_MANTENCION"  
					WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
							 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   ;				
					
					ll_total_pagado	= ll_total_pagado + al_monto 

					UPDATE	"REPACTA_MANTENCION"
					SET 		"REPACTA_MANTENCION"."TOTAL_PAGADO" = :ll_total_pagado  
					WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
							 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )
					USING		sqlca;

				END IF
		END CHOOSE
END CHOOSE
RETURN 0
end function

on w_ing_corpbanca.create
this.st_tipo_mov=create st_tipo_mov
this.em_fecha_servipag=create em_fecha_servipag
this.st_6=create st_6
this.cb_cancelar=create cb_cancelar
this.cb_ingresar=create cb_ingresar
this.em_monto=create em_monto
this.em_fecha=create em_fecha
this.sle_contrato=create sle_contrato
this.sle_folio=create sle_folio
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.p_1=create p_1
this.Control[]={this.st_tipo_mov,&
this.em_fecha_servipag,&
this.st_6,&
this.cb_cancelar,&
this.cb_ingresar,&
this.em_monto,&
this.em_fecha,&
this.sle_contrato,&
this.sle_folio,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.p_1}
end on

on w_ing_corpbanca.destroy
destroy(this.st_tipo_mov)
destroy(this.em_fecha_servipag)
destroy(this.st_6)
destroy(this.cb_cancelar)
destroy(this.cb_ingresar)
destroy(this.em_monto)
destroy(this.em_fecha)
destroy(this.sle_contrato)
destroy(this.sle_folio)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_1)
end on

event open;gf_centrar(w_ing_corpbanca)
if gs_conexion = "Parque El Prado" then
	if gl_cod_parque=1 then
		p_1.picturename 	= 'logo_e.bmp'
	elseif gl_cod_parque=102 then
		p_1.picturename 	= 'logo_manantial.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 	= 'logo_parque_stgo.bmp'
	elseif gl_cod_parque=801 then
		p_1.picturename 	= 'logo_parque_conce.bmp'
	else
		p_1.picturename 	= 'logo_e.bmp'
	end if
else
	p_1.picturename 		= 'logo_e_s.bmp'
end if
end event

type st_tipo_mov from statictext within w_ing_corpbanca
integer x = 1499
integer y = 300
integer width = 101
integer height = 92
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_fecha_servipag from editmask within w_ing_corpbanca
integer x = 974
integer y = 732
integer width = 626
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = "~b"
end type

event modified;
cb_ingresar.SetFocus()
end event

type st_6 from statictext within w_ing_corpbanca
integer x = 256
integer y = 732
integer width = 677
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha de Pago Servipag:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cancelar from commandbutton within w_ing_corpbanca
integer x = 41
integer y = 912
integer width = 393
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(w_ing_corpbanca)
end event

type cb_ingresar from commandbutton within w_ing_corpbanca
integer x = 1207
integer y = 912
integer width = 393
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;double	ll_monto_ef
datetime ld_hoy, ld_vencimiento
long 		ll_monto, ll_n_cheque, ll_cant_cheques, ll_cod_banco, ll_n_cuotas,ll_n_cuotas_pag, ll_n_cupon, ll_rut, ll_CTA_PAG_S, ll_total_pagado,&
			ll_nro_cuponera,ll_count_vig,job,i, Net, ret
string 	ls_tipo_pago, ls_doc, ls_tipo_mov

IF sle_folio.text = "" THEN
	MessageBox("Error", "Debe ingresar el número del cupón")
	Return 1
END IF
IF sle_contrato.text = "" THEN
	MessageBox("Error", "Debe ingresar en contrato correspondiente")
	Return 1
END IF
IF IsNull(em_monto.text) THEN 
	MessageBox("Error", "Debe ingresar el monto del cupón")
	Return 1
END IF
IF IsNull(em_fecha.text) THEN
	MessageBox("Error", "Debe ingresar la fecha de pago")
	Return 1
END IF
gd_total 						= Double(em_monto.text)
gs_rezago 					= " "
gs_tipo_cobro 				= "CU"
gl_folio 						= Long(sle_folio.text)
ld_hoy 						= Datetime(Date(em_fecha.text))
gd_hoy 						= Datetime(Date(em_fecha.text))
gd_fecha_servipag			= Datetime(Date(em_fecha_servipag.text))
ll_monto_ef 					= long(gd_total)
gd_uf 						= gf_uf(em_fecha.text)
gi_rut 						= 0 //???
//Net 							= MessageBox("Ingresar Pago", "Desea Actualizar Documento " + gs_tipo_cobro + " Nº " +String(gl_folio) +" ?", Exclamation!, YesNo!, 2)
Net 							= 1
IF Net = 1 THEN 
	// Process OK.
	ls_tipo_mov				= trim(st_tipo_mov.text)
	f_ingresar_doc(999, 999, ll_monto_ef, gd_hoy, 'EF', 999)
   	f_ingresar_ingre(gl_folio, ls_tipo_mov, ll_monto_ef, 1)
	f_actualizar_mov(ls_tipo_mov, (ll_monto_ef * 1), 1)
	Commit;
	UPDATE	"CUPONERAS_DETALLE"  
	SET 		"ESTADO_PAGO_CUPON" = 'C',   
				"TIPO_COB_PAGO" = :gs_tipo_cobro,   
				"FOLIO_PAGO" = :gl_folio,   
				"FECHA_PAGO" = :gd_hoy  
	WHERE  ( "CUPONERAS_DETALLE"."NRO_CUPON" = :gl_folio )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		commit;
			SELECT	"CUPONERAS"."NRO_CUPONERA"  
			INTO 		:ll_nro_cuponera  
			FROM 		"CUPONERAS"  
			WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
					 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
					 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
					 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				SELECT	COUNT("CUPONERAS_DETALLE"."NUMERO")  
				INTO 		:ll_count_vig  
				FROM 		"CUPONERAS_DETALLE"  
				WHERE  ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
						 ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
						 ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
						 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
						 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_nro_cuponera )   
				USING		sqlca;
				if ll_count_vig=0 then
					UPDATE	"CUPONERAS"  
					SET 		"ESTADO_CUPONERA" = 'C'  
					WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
							 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
							 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
							 ( "CUPONERAS"."NRO_CUPONERA" = :ll_nro_cuponera )   
					USING		sqlca;
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

	Net = MessageBox("Ingresar Pago", "Desea Ingresar otro cupón ?", Question!, YesNo!, 1)
	IF Net = 1 THEN 
		sle_folio.text 			= ""
		sle_contrato.text 		= ""
		st_tipo_mov.text		= ""
		em_monto.text 		= ""
		em_fecha.text 			= ""
		sle_folio.SetFocus()
	ELSE
		Close(w_ing_corpbanca)
	END IF
END IF

end event

type em_monto from editmask within w_ing_corpbanca
integer x = 974
integer y = 516
integer width = 626
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###"
string displaydata = ""
end type

event modified;if long(this.text)<=0 or trim(this.text)='' or isnull(trim(this.text)) then
	messagebox("Advertencia","Debe Ingresar Monto")
	em_monto.text	= ''
end if
em_fecha.SetFocus()
end event

type em_fecha from editmask within w_ing_corpbanca
integer x = 974
integer y = 624
integer width = 626
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = "~b"
end type

type sle_contrato from singlelineedit within w_ing_corpbanca
integer x = 974
integer y = 408
integer width = 626
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;string 	is_base, is_serie,ls_columna, ls_base_contrato, ls_serie_contrato
long  		il_nenc, il_ncred,ll_nro, ll_nro_contrato
Double	il_numero

IF len(sle_contrato.text) >= 3 THEN
	is_base 		= Mid(sle_contrato.text, 1, 1)
	is_serie 		= Mid(sle_contrato.text, 2, 1)
	il_numero 	= Double(Mid(sle_contrato.text, 3, len(sle_contrato.text)-2))
	SELECT	cadena.numero
	INTO 		:ll_nro_contrato
	FROM 		cadena
	WHERE   (cadena.codigo = :is_base) and 
	        (cadena.serie = :is_serie) and
			  (cadena.numero = :il_numero);
	IF il_numero <> ll_nro_contrato THEN
		Beep(1)
		MessageBox("Fallecimiento" , "No existe el contrato asociado !!!")	
	ELSE
		//MessageBox("Fallecimiento" , "Contrato OK!")	
		Beep(1)
		gs_base 		= is_base
		gs_serie 		= is_serie 
		gi_numero 	= il_numero 
		em_monto.SetFocus()
	END IF
END IF
end event

type sle_folio from singlelineedit within w_ing_corpbanca
integer x = 974
integer y = 300
integer width = 512
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;String	ls_tipo_mov
Long		ll_num_cupon

ll_num_cupon	= long(sle_folio.text)
IF sle_folio.text <> "" AND ll_num_cupon > 0 THEN
	IF gf_existe_cupon(ll_num_cupon) THEN
		beep(1)
		MessageBox("Ingreso Cupón", "El Número de cupón ya existe !")
		sle_folio.text = ""
	ELSE
		SELECT	"CUPONERAS_DETALLE"."TIPO_MOV"  
		INTO 		:ls_tipo_mov  
		FROM 		"CUPONERAS_DETALLE"  
		WHERE  ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_num_cupon ) 
		USING		sqlca;
		if sqlca.sqlcode=0 then
			st_tipo_mov.text			= ls_tipo_mov
		else
			messagebox("Advertencia","No Existe Nº Cupon "+string(ll_num_cupon))
			sle_folio.text				= ''
			st_tipo_mov.text			= ''
			sle_contrato.text			= ''
			em_monto.text				= ''
			em_fecha.text				= ''
			em_fecha_servipag.text	= ''
		end if
		beep(1)
		sle_contrato.SetFocus()
	END IF
END IF
end event

type st_5 from statictext within w_ing_corpbanca
integer x = 558
integer y = 24
integer width = 955
integer height = 200
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
boolean enabled = false
string text = "Ingreso de Cupón Caja Auxiliar"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_ing_corpbanca
integer x = 498
integer y = 624
integer width = 434
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha de Pago:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ing_corpbanca
integer x = 581
integer y = 516
integer width = 352
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Monto:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ing_corpbanca
integer x = 677
integer y = 408
integer width = 256
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Contrato:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ing_corpbanca
integer x = 667
integer y = 300
integer width = 265
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Cupón Nº"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_1 from picture within w_ing_corpbanca
integer x = 37
integer y = 32
integer width = 489
integer height = 424
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

