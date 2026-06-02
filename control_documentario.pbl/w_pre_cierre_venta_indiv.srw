forward
global type w_pre_cierre_venta_indiv from window
end type
type cb_cta_cte from commandbutton within w_pre_cierre_venta_indiv
end type
type cb_valida from commandbutton within w_pre_cierre_venta_indiv
end type
type pb_1 from picturebutton within w_pre_cierre_venta_indiv
end type
type cb_imprimir from commandbutton within w_pre_cierre_venta_indiv
end type
type cb_cerrar from commandbutton within w_pre_cierre_venta_indiv
end type
type dw_lista from datawindow within w_pre_cierre_venta_indiv
end type
end forward

global type w_pre_cierre_venta_indiv from window
integer width = 3465
integer height = 1324
boolean titlebar = true
string title = "Pre-Cierre Venta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cta_cte cb_cta_cte
cb_valida cb_valida
pb_1 pb_1
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_pre_cierre_venta_indiv w_pre_cierre_venta_indiv

type variables
Long		il_mes,il_ano,il_row
string	is_infor
end variables

on w_pre_cierre_venta_indiv.create
this.cb_cta_cte=create cb_cta_cte
this.cb_valida=create cb_valida
this.pb_1=create pb_1
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cta_cte,&
this.cb_valida,&
this.pb_1,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_pre_cierre_venta_indiv.destroy
destroy(this.cb_cta_cte)
destroy(this.cb_valida)
destroy(this.pb_1)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;//string	ls_base,ls_serie,ls_age_cd,ls_age_dg,ls_sup_cd,ls_sup_dg,ls_jef_cd,ls_jef_dg,&
//			ls_tipo_cob,ls_estado_ch,ls_forma_pago,ls_nulo
//long		ll_numero,ll_tot_reg,ll_indi,ll_dif_age,ll_dif_sup,ll_dif_jef,ll_estado,&
//			ll_folio,ll_monto,ll_nulo
//datetime	ldt_fec_venc_ch,ldt_fecha_pago,ldt_fecha_estado_ch,ldt_nulo,ldt_fecha_cierre,ldt_fecha_ctto
//
//gf_centrar(w_pre_cierre_venta_indiv)
//dw_lista.settransobject(sqlca)
//setnull(ls_nulo);setnull(ll_nulo);setnull(ldt_nulo)
//ls_base							= substr(1,1,Message.StringParm)
//ls_serie							= substr(1,2,Message.StringParm)
//ll_numero						= long(substr(1,3,Message.StringParm))
//ll_tot_reg						= dw_lista.retrieve(ls_base,ls_serie,ll_numero)
//if ll_tot_reg>0 then
//	for ll_indi=1 to ll_tot_reg
//		ll_estado					= dw_lista.getitemnumber(ll_indi,'ult_estado')
//		ls_age_cd					= dw_lista.getitemstring(ll_indi,'cod_agente')
//		ls_sup_cd					= dw_lista.getitemstring(ll_indi,'cod_supervisor')
//		ls_jef_cd					= dw_lista.getitemstring(ll_indi,'cod_jefe_venta')
//		
//		SELECT 	"DOCUMENTOS"."FOLIO",	"DOCUMENTOS"."TIPO_COB",	"DOCUMENTOS"."FECHA_PAGO",	"DOCUMENTOS"."ESTADO_CH",	"DOCUMENTOS"."FECHA_ESTADO_CH",	"DOCUMENTOS"."MONTO",	"DOCUMENTOS"."COD_PAGO"
//		INTO 		:ll_folio,					:ls_tipo_cob,					:ldt_fecha_pago,				:ls_estado_ch,					:ldt_fecha_estado_ch,				:ll_monto,					:ls_forma_pago
//		FROM 		"DOCUMENTOS","INGRESO" 
//		WHERE  	( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
//					( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
//					( "INGRESO"."REZAGO" <> 'S' ) AND  
//					( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A') AND
//					( "INGRESO"."BASE" = :ls_base ) AND  
//					( "INGRESO"."SERIE" = :ls_serie ) AND  
//					( "INGRESO"."CONTRATO" = :ll_numero ) AND  
//					( "DOCUMENTOS"."COD_PAGO" = 'CH' ) AND
//					( "DOCUMENTOS"."FECHA_VENC" = (	SELECT 	MIN("DOCUMENTOS"."FECHA_VENC")  
//																INTO 		:ldt_fec_venc_ch  
//																FROM 		"DOCUMENTOS","INGRESO"  
//																WHERE  	( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
//																			( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
//																			( "INGRESO"."REZAGO" <> 'S' ) AND 
//																			( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A') AND
//																			( "DOCUMENTOS"."COD_PAGO" = 'CH' ) AND 
//																			( "INGRESO"."BASE" = :ls_base ) AND  
//																			( "INGRESO"."SERIE" = :ls_serie ) AND  
//																			( "INGRESO"."CONTRATO" = :ll_numero ) ) )  
//		USING		sqlca;
//		if sqlca.sqlcode=0 then
//			dw_lista.setitem(ll_indi,'tiene_cheque','S')
//			dw_lista.setitem(ll_indi,'tipo_cob',ls_tipo_cob)
//			dw_lista.setitem(ll_indi,'folio',ll_folio)
//			dw_lista.setitem(ll_indi,'fecha_pago',ldt_fecha_pago)
//			dw_lista.setitem(ll_indi,'estado_cheque',ls_estado_ch)
//			dw_lista.setitem(ll_indi,'fecha_estado_cheque',ldt_fecha_estado_ch)
//			dw_lista.setitem(ll_indi,'fecha_venc_cheque',ldt_fec_venc_ch)
//			dw_lista.setitem(ll_indi,'monto_pagado',ll_monto)
//			dw_lista.setitem(ll_indi,'forma_pago',ls_forma_pago)
//		else
//			dw_lista.setitem(ll_indi,'tiene_cheque','S')
//			dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
//			dw_lista.setitem(ll_indi,'folio',ll_nulo)
//			dw_lista.setitem(ll_indi,'fecha_pago',ldt_nulo)
//			dw_lista.setitem(ll_indi,'estado_cheque',ls_nulo)
//			dw_lista.setitem(ll_indi,'fecha_estado_cheque',ldt_nulo)
//			dw_lista.setitem(ll_indi,'fecha_venc_cheque',ldt_nulo)
//			dw_lista.setitem(ll_indi,'monto_pagado',ll_nulo)
//		end if				
//		else
//			SELECT 	MIN("DOCUMENTOS"."FECHA_VENC")  
//			INTO 		:ldt_fec_venc_ch  
//			FROM 		"DOCUMENTOS","INGRESO"  
//			WHERE  	( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
//						( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
//						( "INGRESO"."REZAGO" <> 'S' ) AND 
//						( "DOCUMENTOS"."COD_PAGO" <> 'CH' ) AND 
//						( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A') AND
//						( "INGRESO"."BASE" = :ls_base ) AND  
//						( "INGRESO"."SERIE" = :ls_serie ) AND  
//						( "INGRESO"."CONTRATO" = :ll_numero )   
//			USING		sqlca;
//			if not isnull(ldt_fec_venc_ch) then //pago cheque en rezago
//				SELECT 	"DOCUMENTOS"."FOLIO",	"DOCUMENTOS"."TIPO_COB",	"DOCUMENTOS"."FECHA_PAGO",	"DOCUMENTOS"."ESTADO_CH",	"DOCUMENTOS"."FECHA_ESTADO_CH",	"DOCUMENTOS"."MONTO",	"DOCUMENTOS"."COD_PAGO"
//				INTO 		:ll_folio,					:ls_tipo_cob,					:ldt_fecha_pago,				:ls_estado_ch,					:ldt_fecha_estado_ch,				:ll_monto,					:ls_forma_pago
//				FROM 		"DOCUMENTOS","INGRESO" 
//				WHERE  	( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
//							( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
//							( "INGRESO"."REZAGO" <> 'S' ) AND  
//							( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A') AND
//							( "INGRESO"."BASE" = :ls_base ) AND  
//							( "INGRESO"."SERIE" = :ls_serie ) AND  
//							( "INGRESO"."CONTRATO" = :ll_numero ) AND  
//							( "DOCUMENTOS"."COD_PAGO" <> 'CH' ) AND
//							( "DOCUMENTOS"."FECHA_VENC" = :ldt_fec_venc_ch )  
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					dw_lista.setitem(ll_indi,'tiene_cheque','N')
//					dw_lista.setitem(ll_indi,'tipo_cob',ls_tipo_cob)
//					dw_lista.setitem(ll_indi,'folio',ll_folio)
//					dw_lista.setitem(ll_indi,'fecha_pago',ldt_fecha_pago)
//					dw_lista.setitem(ll_indi,'monto_pagado',ll_monto)
//					dw_lista.setitem(ll_indi,'forma_pago',ls_forma_pago)
//				else
//					dw_lista.setitem(ll_indi,'tiene_cheque','N')
//					dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
//					dw_lista.setitem(ll_indi,'folio',ll_nulo)
//					dw_lista.setitem(ll_indi,'fecha_pago',ldt_nulo)
//					dw_lista.setitem(ll_indi,'estado_cheque',ls_nulo)
//					dw_lista.setitem(ll_indi,'fecha_estado_cheque',ldt_nulo)
//					dw_lista.setitem(ll_indi,'fecha_venc_cheque',ldt_nulo)
//					dw_lista.setitem(ll_indi,'monto_pagado',ll_nulo)
//				end if				
//			else
//				dw_lista.setitem(ll_indi,'tiene_cheque','N')
//				dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
//				dw_lista.setitem(ll_indi,'folio',ll_nulo)
//				dw_lista.setitem(ll_indi,'fecha_pago',ldt_nulo)
//				dw_lista.setitem(ll_indi,'estado_cheque',ls_nulo)
//				dw_lista.setitem(ll_indi,'fecha_estado_cheque',ldt_nulo)
//				dw_lista.setitem(ll_indi,'fecha_venc_cheque',ldt_nulo)
//				dw_lista.setitem(ll_indi,'monto_pagado',ll_nulo)
//			end if
//		end if
//		if ll_estado=11 then
//			if ls_base='O' then
//				Setnull(ldt_fecha_cierre)
//				SELECT	"OFERTA_V"."CIERRE_VENTA",	"OFERTA_V"."COD_AGE",	"OFERTA_V"."COD_SUP",	"OFERTA_V"."COD_JEF"
//				INTO 		:ldt_fecha_cierre,			:ls_age_dg,					:ls_sup_dg,					:ls_jef_dg    
//				FROM 		"OFERTA_V","CADENA","PAGO_OFERTA"  
//				WHERE  ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
//						 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
//						 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
//						 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
//						 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
//						 (("CADENA"."CODIGO" = :ls_base ) AND  
//						 ( "CADENA"."SERIE" = :ls_serie ) AND  
//						 ( "CADENA"."NUMERO" = :ll_numero ) )   
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
//					dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
//					dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
//					dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
//				else
//					dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_nulo,'dd/mm/yyyy'))
//					dw_lista.setitem(ll_indi,'cod_age',ls_nulo)
//					dw_lista.setitem(ll_indi,'cod_sup',ls_nulo)
//					dw_lista.setitem(ll_indi,'cod_jef',ls_nulo)
//				end if
//			elseif ls_base='L' then
//				Setnull(ldt_fecha_cierre)
//				SELECT	"ANEXO_LIBERADOR"."CIERRE_VENTA",	"ANEXO_LIBERADOR"."COD_AGENTE", 	"ANEXO_LIBERADOR"."COD_SUPER", 	"ANEXO_LIBERADOR"."COD_JEF"  
//				INTO 		:ldt_fecha_cierre,						:ls_age_dg,								:ls_sup_dg,								:ls_jef_dg       
//				FROM 		"ANEXO_LIBERADOR","CADENA","PAGO_LIBERADOR"  
//				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
//						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
//						 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
//						 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
//						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
//						 (("CADENA"."CODIGO" = :ls_base ) AND  
//						 ( "CADENA"."SERIE" = :ls_serie ) AND  
//						 ( "CADENA"."NUMERO" = :ll_numero ) )   
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
//					dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
//					dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
//					dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
//				else
//					dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_nulo,'dd/mm/yyyy'))
//					dw_lista.setitem(ll_indi,'cod_age',ls_nulo)
//					dw_lista.setitem(ll_indi,'cod_sup',ls_nulo)
//					dw_lista.setitem(ll_indi,'cod_jef',ls_nulo)
//				end if
//			else
//				dw_lista.setitem(ll_indi,'mostrar','N')
//			end if
//		end if
//	next
//else
//	messagebox("Advertencia","No Registra Datos")
//end if
end event

type cb_cta_cte from commandbutton within w_pre_cierre_venta_indiv
integer x = 1225
integer y = 1088
integer width = 421
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;long	ll_tot_reg,ll_indi

ll_tot_reg		= dw_lista.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		gi_numero 	= dw_lista.getitemnumber(ll_indi,'numero')
		gs_base		= dw_lista.getitemstring(ll_indi,'base')
		gs_serie		= dw_lista.getitemstring(ll_indi,'serie')
		gi_rut 		= dw_lista.GetItemNumber(ll_indi, "cadena_rut")
		SELECT	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO"  
		INTO 		:gs_nombres,			:gs_apellido_paterno,	:gs_apellido_materno,	:gl_cod_parque_cta,		:gs_estado   
		FROM 		"CADENA",	"CLIENTE"  
		WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 (("CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero ) AND  
				 ( "CADENA"."RUT" = :gi_rut ) )   
		USING		sqlca;
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" //Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G","V"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	next
end if
end event

type cb_valida from commandbutton within w_pre_cierre_venta_indiv
integer x = 1650
integer y = 1088
integer width = 407
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Validar Venta"
end type

type pb_1 from picturebutton within w_pre_cierre_venta_indiv
integer x = 3259
integer y = 36
integer width = 165
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;//if ll_estado=11 then
//			if ls_base='O' then
//				Setnull(ldt_fecha_cierre)
//				SELECT	"OFERTA_V"."CIERRE_VENTA",	"OFERTA_V"."COD_AGE",	"OFERTA_V"."COD_SUP",	"OFERTA_V"."COD_JEF"
//				INTO 		:ldt_fecha_cierre,			:ls_age_dg,					:ls_sup_dg,					:ls_jef_dg    
//				FROM 		"OFERTA_V","CADENA","PAGO_OFERTA"  
//				WHERE  ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
//						 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
//						 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
//						 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
//						 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
//						 (("CADENA"."CODIGO" = :ls_base ) AND  
//						 ( "CADENA"."SERIE" = :ls_serie ) AND  
//						 ( "CADENA"."NUMERO" = :ll_numero ) )   
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
//					dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
//					if ls_age_cd=ls_age_dg then
//						ll_dif_age							= 0
//					else
//						ll_dif_age							= 1
//					end if
//					dw_lista.setitem(ll_indi,'dif_age',ll_dif_age)
//					dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
//					if ls_sup_cd=ls_sup_dg then
//						ll_dif_sup							= 0
//					else
//						ll_dif_sup							= 1
//					end if
//					dw_lista.setitem(ll_indi,'dif_sup',ll_dif_sup)
//					dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
//					if ls_jef_cd=ls_jef_dg then
//						ll_dif_jef							= 0
//					else
//						ll_dif_jef							= 1
//					end if
//					dw_lista.setitem(ll_indi,'dif_jef',ll_dif_jef)
//				else
//					dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
//					dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
//					if ls_age_cd=ls_age_dg then
//						ll_dif_age							= 0
//					else
//						ll_dif_age							= 1
//					end if
//					dw_lista.setitem(ll_indi,'dif_age',ll_dif_age)
//					dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
//					if ls_sup_cd=ls_sup_dg then
//						ll_dif_sup							= 0
//					else
//						ll_dif_sup							= 1
//					end if
//					dw_lista.setitem(ll_indi,'dif_sup',ll_dif_sup)
//					dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
//					if ls_jef_cd=ls_jef_dg then
//						ll_dif_jef							= 0
//					else
//						ll_dif_jef							= 1
//					end if
//					dw_lista.setitem(ll_indi,'dif_jef',ll_dif_jef)
//				end if
//			elseif ls_base='L' then
//				Setnull(ldt_fecha_cierre)
//				SELECT	"ANEXO_LIBERADOR"."CIERRE_VENTA",	"ANEXO_LIBERADOR"."COD_AGENTE", 	"ANEXO_LIBERADOR"."COD_SUPER", 	"ANEXO_LIBERADOR"."COD_JEF"  
//				INTO 		:ldt_fecha_cierre,						:ls_age_dg,								:ls_sup_dg,								:ls_jef_dg       
//				FROM 		"ANEXO_LIBERADOR","CADENA","PAGO_LIBERADOR"  
//				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
//						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
//						 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
//						 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
//						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
//						 (("CADENA"."CODIGO" = :ls_base ) AND  
//						 ( "CADENA"."SERIE" = :ls_serie ) AND  
//						 ( "CADENA"."NUMERO" = :ll_numero ) )   
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
//					dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
//					if ls_age_cd=ls_age_dg then
//						ll_dif_age							= 0
//					else
//						ll_dif_age							= 1
//					end if
//					dw_lista.setitem(ll_indi,'dif_age',ll_dif_age)
//					dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
//					if ls_sup_cd=ls_sup_dg then
//						ll_dif_sup							= 0
//					else
//						ll_dif_sup							= 1
//					end if
//					dw_lista.setitem(ll_indi,'dif_sup',ll_dif_sup)
//					dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
//					if ls_jef_cd=ls_jef_dg then
//						ll_dif_jef							= 0
//					else
//						ll_dif_jef							= 1
//					end if
//					dw_lista.setitem(ll_indi,'dif_jef',ll_dif_jef)
//				else
//					dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
//					dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
//					if ls_age_cd=ls_age_dg then
//						ll_dif_age							= 0
//					else
//						ll_dif_age							= 1
//					end if
//					dw_lista.setitem(ll_indi,'dif_age',ll_dif_age)
//					dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
//					if ls_sup_cd=ls_sup_dg then
//						ll_dif_sup							= 0
//					else
//						ll_dif_sup							= 1
//					end if
//					dw_lista.setitem(ll_indi,'dif_sup',ll_dif_sup)
//					dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
//					if ls_jef_cd=ls_jef_dg then
//						ll_dif_jef							= 0
//					else
//						ll_dif_jef							= 1
//					end if
//					dw_lista.setitem(ll_indi,'dif_jef',ll_dif_jef)
//				end if
//			else
//				dw_lista.setitem(ll_indi,'mostrar','N')
//			end if
//		end if
end event

type cb_imprimir from commandbutton within w_pre_cierre_venta_indiv
integer x = 37
integer y = 1088
integer width = 329
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
end if
end event

type cb_cerrar from commandbutton within w_pre_cierre_venta_indiv
integer x = 2679
integer y = 1088
integer width = 329
integer height = 96
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_pre_cierre_venta_indiv)
end event

type dw_lista from datawindow within w_pre_cierre_venta_indiv
integer x = 37
integer y = 28
integer width = 2971
integer height = 1024
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_pre_cierre_ventas_indiv"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_filtro
ls_columna														= dwo.name
if ls_columna='t_dif_age' then
	ls_filtro													= " dif_age ='N' "
elseif ls_columna='t_dif_sup' then
	ls_filtro													= " dif_sup ='N' "
elseif ls_columna='t_dif_jef' then
	ls_filtro													= " dif_jef ='N' "
elseif ls_columna='t_todos' then
	ls_filtro													= ""
elseif ls_columna='t_digit' then
	ls_filtro													= "ult_estado = 11 "
elseif ls_columna='t_no_digit' then
	ls_filtro													= "ult_estado <> 11 "
end if
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
this.accepttext()
	
	
	
end event

event doubleclicked;//if row>0 then
//	il_row	= row
//	cb_cta_cte.triggerevent(clicked!)
//end if
end event

