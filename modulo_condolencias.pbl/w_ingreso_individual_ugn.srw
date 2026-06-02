forward
global type w_ingreso_individual_ugn from window
end type
type cb_1 from commandbutton within w_ingreso_individual_ugn
end type
type pb_ok3 from picturebutton within w_ingreso_individual_ugn
end type
type st_7 from statictext within w_ingreso_individual_ugn
end type
type p_1 from picture within w_ingreso_individual_ugn
end type
type fec_ini_falle from editmask within w_ingreso_individual_ugn
end type
type st_filtrar from statictext within w_ingreso_individual_ugn
end type
type st_buscar from statictext within w_ingreso_individual_ugn
end type
type st_6 from statictext within w_ingreso_individual_ugn
end type
type pb_ok1 from picturebutton within w_ingreso_individual_ugn
end type
type pb_buscar from picturebutton within w_ingreso_individual_ugn
end type
type em_grupo from editmask within w_ingreso_individual_ugn
end type
type st_3 from statictext within w_ingreso_individual_ugn
end type
type st_5 from statictext within w_ingreso_individual_ugn
end type
type em_agente from editmask within w_ingreso_individual_ugn
end type
type cb_print_informe from commandbutton within w_ingreso_individual_ugn
end type
type cb_modif_antece from commandbutton within w_ingreso_individual_ugn
end type
type hpb_1 from hprogressbar within w_ingreso_individual_ugn
end type
type cb_actualizar from commandbutton within w_ingreso_individual_ugn
end type
type cb_ctacte2 from commandbutton within w_ingreso_individual_ugn
end type
type dw_dias_mora from datawindow within w_ingreso_individual_ugn
end type
type cb_cerrar from commandbutton within w_ingreso_individual_ugn
end type
type cb_ctacte from commandbutton within w_ingreso_individual_ugn
end type
type st_2 from statictext within w_ingreso_individual_ugn
end type
type sle_nombre from singlelineedit within w_ingreso_individual_ugn
end type
type pb_ok2 from picturebutton within w_ingreso_individual_ugn
end type
type cb_grabar_formula from commandbutton within w_ingreso_individual_ugn
end type
type cb_historico from commandbutton within w_ingreso_individual_ugn
end type
type cb_imprimir from commandbutton within w_ingreso_individual_ugn
end type
type cb_exportar from commandbutton within w_ingreso_individual_ugn
end type
type cb_filtrar from commandbutton within w_ingreso_individual_ugn
end type
type cb_ordenar from commandbutton within w_ingreso_individual_ugn
end type
type gb_1 from groupbox within w_ingreso_individual_ugn
end type
type st_porc from statictext within w_ingreso_individual_ugn
end type
type st_fondo from statictext within w_ingreso_individual_ugn
end type
type sle_ap_pat from singlelineedit within w_ingreso_individual_ugn
end type
type gb_4 from groupbox within w_ingreso_individual_ugn
end type
type gb_2 from groupbox within w_ingreso_individual_ugn
end type
type gb_3 from groupbox within w_ingreso_individual_ugn
end type
type tab_cobranza from uo_ugn_gestion within w_ingreso_individual_ugn
end type
type tab_cobranza from uo_ugn_gestion within w_ingreso_individual_ugn
end type
type dw_lista from datawindow within w_ingreso_individual_ugn
end type
type dw_print_agente from datawindow within w_ingreso_individual_ugn
end type
end forward

global type w_ingreso_individual_ugn from window
integer width = 3968
integer height = 2692
boolean titlebar = true
string title = "Ingreso Cobranza Telefónica"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
event ue_cargar pbm_custom01
cb_1 cb_1
pb_ok3 pb_ok3
st_7 st_7
p_1 p_1
fec_ini_falle fec_ini_falle
st_filtrar st_filtrar
st_buscar st_buscar
st_6 st_6
pb_ok1 pb_ok1
pb_buscar pb_buscar
em_grupo em_grupo
st_3 st_3
st_5 st_5
em_agente em_agente
cb_print_informe cb_print_informe
cb_modif_antece cb_modif_antece
hpb_1 hpb_1
cb_actualizar cb_actualizar
cb_ctacte2 cb_ctacte2
dw_dias_mora dw_dias_mora
cb_cerrar cb_cerrar
cb_ctacte cb_ctacte
st_2 st_2
sle_nombre sle_nombre
pb_ok2 pb_ok2
cb_grabar_formula cb_grabar_formula
cb_historico cb_historico
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
gb_1 gb_1
st_porc st_porc
st_fondo st_fondo
sle_ap_pat sle_ap_pat
gb_4 gb_4
gb_2 gb_2
gb_3 gb_3
tab_cobranza tab_cobranza
dw_lista dw_lista
dw_print_agente dw_print_agente
end type
global w_ingreso_individual_ugn w_ingreso_individual_ugn

type variables
datawindowchild	idw_detalle5,idw_detalle6,idw_detalle7
long		il_row,il_cta_max_plazo
Double	id_factor_gc,id_tasa_mant
String	is_tipo_usuario,is_opcion
end variables

forward prototypes
public subroutine wf_cargar_dw_contrato ()
public subroutine wf_pos_otros_cttos ()
public subroutine wf_pos_promesa ()
public subroutine wf_pos_contrato_isa ()
public function string wf_cod_age ()
public subroutine wf_calcular_interes (string as_cobro, string as_base, string as_serie, double al_numero, long al_fila)
end prototypes

event ue_cargar;Long		ll_tot_reg,ll_indi,ll_rut,ll_count_reg,ll_count_pago,ll_tot_porc,ll_tot_porc_aux,&
			ll_tot_filas,ll_cod_parque,ll_dias_ugn,ll_dias_sup,ll_dias_ejec_ugn
Datetime	ldt_fecha,ldt_fec_llama
String		ls_nombre,ls_ap_pat,ls_ap_mat,ls_estado
date		ld_fecha_hoy
Double	ll_numero
SetPointer(HourGlass!)
ld_fecha_hoy				= date(gdt_fec_sistema)
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque	= 1
else
	ll_cod_parque	= 11
end if
SELECT	"COD_PARQ"."CANT_DIAS_UGN",
			"COD_PARQ"."CANT_DIAS_SUP",
			"COD_PARQ"."CANT_DIAS_EJEC_UGN"
INTO 		:ll_dias_ugn,
			:ll_dias_sup,
			:ll_dias_ejec_ugn
FROM 		"COD_PARQ"  
WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque   ;
if is_tipo_usuario = 'SUP' then
	if gs_depto='K' or gs_depto='M' then
		SELECT	"AGENTES"."ESTADO"  
		INTO 		:ls_estado  
		FROM 		"AGENTES"  
		WHERE 	"AGENTES"."COD_AGE" = :gs_user 
		USING		sqlca;
	elseif gs_depto='R' then
		SELECT 	"SUPERVISOR"."ESTADO" 
		INTO 		:ls_estado  
		FROM 		"SUPERVISOR"  
		WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
		USING		sqlca;
	elseif gs_depto='B' then
		SELECT 	"JEFE_VENTAS"."ESTADO"
		INTO 		:ls_estado  
		FROM 		"JEFE_VENTAS"  
		WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user    
		USING		sqlca;	
	end if
elseif is_tipo_usuario = 'UGN' then
	if gs_depto = 'X' then
		SELECT	"ENCARGADOS"."ESTADO"  
		INTO 		:ls_estado  
		FROM 		"ENCARGADOS"  
		WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) AND  
					 ( "ENCARGADOS"."DEPTO" = 'X' and (:gs_user <> 'JU2') )   
		USING		sqlca;
	elseif gs_depto = 'R' then
		SELECT 	"SUPERVISOR"."ESTADO" 
		INTO 		:ls_estado  
		FROM 		"SUPERVISOR"  
		WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
		USING		sqlca;
	end if	
//	ll_dias_ugn      = ll_dias_ejec_ugn
// 	ll_dias_sup      = ll_dias_ejec_ugn
end if
if sqlca.sqlcode=0 then
	if ls_estado='A' then
		ll_tot_reg					= dw_lista.retrieve(gs_user,date(gdt_fec_sistema),ll_dias_sup,ll_dias_ugn)
		tab_cobranza.visible		= false
		if ll_tot_reg > 0 then
			st_fondo.visible		= true
			hpb_1.visible 			= true
			st_porc.visible 		= true
			ll_tot_porc				= 0
			ll_tot_porc_aux		= 0			
			hpb_1.Position			= ll_tot_porc
			for ll_indi=1 to ll_tot_reg
				ll_rut				= dw_lista.getitemnumber(ll_indi,'ugn_cliente_rut')
				ls_nombre			= dw_lista.getitemstring(ll_indi,'ugn_cliente_nombre')
				ls_ap_pat			= dw_lista.getitemstring(ll_indi,'ugn_cliente_a_paterno')
				ls_ap_mat			= dw_lista.getitemstring(ll_indi,'ugn_cliente_a_materno')
				ll_count_reg		= 0
				if ll_rut > 0 then
					SELECT	Count("CADENA"."CODIGO")  
					INTO 		:ll_count_reg  
					FROM 		"CADENA"  
					WHERE  ( "CADENA"."CODIGO" = 'O' ) AND  
							 ( "CADENA"."RUT" = :ll_rut )   
					USING		sqlca;
					if ll_count_reg > 0 then
						dw_lista.setitem(ll_indi,'c_estado_digitado',0)
					else
						dw_lista.setitem(ll_indi,'c_estado_digitado',1)
					end if
				elseif not isnull(ls_nombre) and ls_nombre<>'' and not isnull(ls_ap_pat) and ls_ap_pat<>'' and &
					not isnull(ls_ap_mat) and ls_ap_mat<>'' then	
					SELECT	Count("CLIENTE"."RUT")  
					INTO 		:ll_count_reg  
					FROM 		"CLIENTE"  
					WHERE  ( "CLIENTE"."NOMBRE" = :ls_nombre ) AND  
							 ( "CLIENTE"."A_PATERNO" = :ls_ap_pat ) AND  
							 ( "CLIENTE"."A_MATERNO" = :ls_ap_mat )   
					USING		sqlca;
					if ll_count_reg > 0 then
						dw_lista.setitem(ll_indi,'c_estado_digitado',0)
					else
						dw_lista.setitem(ll_indi,'c_estado_digitado',1)
					end if
				else
					dw_lista.setitem(ll_indi,'c_estado_digitado',1)
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
		end if
	else	
		dw_lista.dataobject	= 'dw_ingreso_por_usuario_cobranza_ugn'	 //dw_ingreso_por_administrador_ugn
		dw_lista.settransobject(sqlca)
	//	ll_tot_filas			= dw_lista.retrieve(date(gdt_fec_sistema),ll_dias_ugn,ll_dias_sup)
		ll_tot_filas			 =  dw_lista.retrieve(gs_user,date(gdt_fec_sistema),ll_dias_sup,ll_dias_ugn)
//		dw_lista.SETfilter("c_tipo_usuario = '"+is_tipo_usuario+"'" )
//		dw_lista.filter()
		ll_tot_filas				= dw_lista.rowcount()
	//	tab_cobranza.visible		= false
		if ll_tot_filas>0 then
			SetPointer(HourGlass!)
			st_fondo.visible		= true
			hpb_1.visible 			= true
			st_porc.visible 		= true
			ll_tot_porc				= 0
			ll_tot_porc_aux		= 0			
			hpb_1.Position			= ll_tot_porc
			for ll_indi=1 to ll_tot_filas
				ll_rut				= dw_lista.getitemnumber(ll_indi,'ugn_cliente_rut')
				ls_nombre			= dw_lista.getitemstring(ll_indi,'ugn_cliente_nombre')
				ls_ap_pat			= dw_lista.getitemstring(ll_indi,'ugn_cliente_a_paterno')
				ls_ap_mat			= dw_lista.getitemstring(ll_indi,'ugn_cliente_a_materno')
				ll_count_reg		= 0
				if ll_rut > 0 then
					SELECT	Count("CADENA"."CODIGO")  
					INTO 		:ll_count_reg  
					FROM 		"CADENA"  
					WHERE  ( "CADENA"."CODIGO" = 'O' ) AND  
							 ( "CADENA"."RUT" = :ll_rut )   
					USING		sqlca;
					if ll_count_reg > 0 then
						dw_lista.setitem(ll_indi,'c_estado_digitado',0)
					else
						dw_lista.setitem(ll_indi,'c_estado_digitado',1)
					end if
				elseif not isnull(ls_nombre) and ls_nombre<>'' and not isnull(ls_ap_pat) and ls_ap_pat<>'' and &
					not isnull(ls_ap_mat) and ls_ap_mat<>'' then	
					SELECT	Count("CLIENTE"."RUT")  
					INTO 		:ll_count_reg  
					FROM 		"CLIENTE"  
					WHERE  ( "CLIENTE"."NOMBRE" = :ls_nombre ) AND  
							 ( "CLIENTE"."A_PATERNO" = :ls_ap_pat ) AND  
							 ( "CLIENTE"."A_MATERNO" = :ls_ap_mat )   
					USING		sqlca;
					if ll_count_reg > 0 then
						dw_lista.setitem(ll_indi,'c_estado_digitado',0)
					else
						dw_lista.setitem(ll_indi,'c_estado_digitado',1)
					end if
				else
					dw_lista.setitem(ll_indi,'c_estado_digitado',1)
				end if
				if ll_tot_porc <> ll_tot_porc_aux then 
					st_porc.text			= string(ll_tot_porc)+" %"
					ll_tot_porc_aux		= ll_tot_porc
				end if
				ll_tot_porc					= (ll_indi / ll_tot_filas) * 100
				hpb_1.Position 			= ll_tot_porc
			next
			st_fondo.visible				= false
			hpb_1.visible 					= false
			st_porc.visible 				= false
			dw_lista.accepttext()
		end if
	end if
else
	if gs_depto = 'G' or gs_depto = 'I' or gs_user = 'JU2' then
		dw_lista.dataobject		= 'dw_ingreso_por_administrador_ugn'	
		dw_lista.settransobject(sqlca)
		ll_tot_filas				= dw_lista.retrieve(date(gdt_fec_sistema),ll_dias_sup,ll_dias_ugn)
//		dw_lista.SETfilter("c_tipo_usuario = '"+is_tipo_usuario+"'" )
//		dw_lista.filter()
		ll_tot_filas				= dw_lista.rowcount()
	//	tab_cobranza.visible		= false
		if ll_tot_filas>0 then
			SetPointer(HourGlass!)
			st_fondo.visible		= true
			hpb_1.visible 			= true
			st_porc.visible 		= true
			ll_tot_porc				= 0
			ll_tot_porc_aux		= 0			
			hpb_1.Position			= ll_tot_porc
			for ll_indi=1 to ll_tot_filas
				ll_rut				= dw_lista.getitemnumber(ll_indi,'ugn_cliente_rut')
				ls_nombre			= dw_lista.getitemstring(ll_indi,'ugn_cliente_nombre')
				ls_ap_pat			= dw_lista.getitemstring(ll_indi,'ugn_cliente_a_paterno')
				ls_ap_mat			= dw_lista.getitemstring(ll_indi,'ugn_cliente_a_materno')
				ll_count_reg		= 0
				if ll_rut > 0 then
					SELECT	Count("CADENA"."CODIGO")  
					INTO 		:ll_count_reg  
					FROM 		"CADENA"  
					WHERE  ( "CADENA"."CODIGO" = 'O' ) AND  
							 ( "CADENA"."RUT" = :ll_rut )   
					USING		sqlca;
					if ll_count_reg > 0 then
						dw_lista.setitem(ll_indi,'c_estado_digitado',0)
					else
						dw_lista.setitem(ll_indi,'c_estado_digitado',1)
					end if
				elseif not isnull(ls_nombre) and ls_nombre<>'' and not isnull(ls_ap_pat) and ls_ap_pat<>'' and &
					not isnull(ls_ap_mat) and ls_ap_mat<>'' then	
					SELECT	Count("CLIENTE"."RUT")  
					INTO 		:ll_count_reg  
					FROM 		"CLIENTE"  
					WHERE  ( "CLIENTE"."NOMBRE" = :ls_nombre ) AND  
							 ( "CLIENTE"."A_PATERNO" = :ls_ap_pat ) AND  
							 ( "CLIENTE"."A_MATERNO" = :ls_ap_mat )   
					USING		sqlca;
					if ll_count_reg > 0 then
						dw_lista.setitem(ll_indi,'c_estado_digitado',0)
					else
						dw_lista.setitem(ll_indi,'c_estado_digitado',1)
					end if
				else
					dw_lista.setitem(ll_indi,'c_estado_digitado',1)
				end if
				if ll_tot_porc <> ll_tot_porc_aux then 
					st_porc.text			= string(ll_tot_porc)+" %"
					ll_tot_porc_aux		= ll_tot_porc
				end if
				ll_tot_porc					= (ll_indi / ll_tot_filas) * 100
				hpb_1.Position 			= ll_tot_porc
			next
			st_fondo.visible				= false
			hpb_1.visible 					= false
			st_porc.visible 				= false
			dw_lista.accepttext()
		end if
	end if
end if
if gs_depto='F' or gs_depto='O' or gs_depto='I' then 
	tab_cobranza.tabpage_4.cb_grabar.enabled	= true
else
	tab_cobranza.tabpage_4.cb_grabar.enabled	= false
end if
dw_print_agente.retrieve(gs_user,date(gdt_fec_sistema),ll_dias_sup,ll_dias_ugn)
//dw_print_agente.SETfilter("c_tipo_usuario = '"+is_tipo_usuario+"'" )
//dw_print_agente.filter()
SetPointer(Arrow!)
dw_lista.setfocus()
end event

public subroutine wf_cargar_dw_contrato ();Long		ll_tot_reg_ctto,ll_indi_ctto,ll_mora_cred,ll_mora_mant,ll_dias_mora_cred,ll_dias_mora_mant,&
			ii_mora_cobro,ii_inc_gastos,i,ll_valor_total,ll_cta_pag_s,ll_cta_pag_m,ll_plazo,ll_cta_pag_la,&
			ll_cta_pag_isa
String	ls_base,ls_serie,ls_moneda,ls_estado_comi
Double	lld_tasa,lld_valor_cuota,lld_tasa_peso,lld_valor_cuota_peso,id_gc,id_im,lld_valor_cuota_m,&
			id_monto,ll_numero

SetPointer(HourGlass!)
ll_tot_reg_ctto		= tab_cobranza.tabpage_1.dw_contrato.rowcount()
for ll_indi_ctto=1 to ll_tot_reg_ctto
	ls_base				= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi_ctto,'cadena_codigo')
	ls_serie				= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi_ctto,'cadena_serie')
	ll_numero			= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_numero')
	ll_mora_cred		= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_mora_mora_cred')
	ll_mora_mant		= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_mora_mora_mant')
	ll_dias_mora_cred	= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_mora_dias_mora_cred')
	ll_dias_mora_mant	= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi_ctto,'cadena_mora_dias_mora_mant')
	
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

public subroutine wf_pos_otros_cttos ();//tab_cobranza.tabpage_3.st_6.x									= 27
//tab_cobranza.tabpage_3.st_6.y									= 4
//tab_cobranza.tabpage_3.st_6.width							= 850
//tab_cobranza.tabpage_3.st_6.height							= 56
//tab_cobranza.tabpage_3.dw_detalle_total.x					= 18
//tab_cobranza.tabpage_3.dw_detalle_total.y					= 60
//tab_cobranza.tabpage_3.dw_detalle_total.width			= 2277
//tab_cobranza.tabpage_3.dw_detalle_total.height			= 412
//
//tab_cobranza.tabpage_3.st_7.x									= 27
//tab_cobranza.tabpage_3.st_7.y									= 480
//tab_cobranza.tabpage_3.st_7.width							= 850
//tab_cobranza.tabpage_3.st_7.height							= 56
//tab_cobranza.tabpage_3.dw_detalle_cuotas.x				= 18
//tab_cobranza.tabpage_3.dw_detalle_cuotas.y				= 536
//tab_cobranza.tabpage_3.dw_detalle_cuotas.width			= 2277
//tab_cobranza.tabpage_3.dw_detalle_cuotas.height			= 412
//
//tab_cobranza.tabpage_3.st_3.x									= 27
//tab_cobranza.tabpage_3.st_3.y									= 956
//tab_cobranza.tabpage_3.st_3.width							= 1001
//tab_cobranza.tabpage_3.st_3.height							= 56
//tab_cobranza.tabpage_3.dw_detalle_pagos.x					= 18
//tab_cobranza.tabpage_3.dw_detalle_pagos.y					= 1012
//tab_cobranza.tabpage_3.dw_detalle_pagos.width			= 2277
//tab_cobranza.tabpage_3.dw_detalle_pagos.height			= 412
end subroutine

public subroutine wf_pos_promesa ();//tab_cobranza.tabpage_3.st_6.x									= 27
//tab_cobranza.tabpage_3.st_6.y									= 4
//tab_cobranza.tabpage_3.st_6.width							= 850
//tab_cobranza.tabpage_3.st_6.height							= 56
//tab_cobranza.tabpage_3.dw_detalle_total.x					= 18
//tab_cobranza.tabpage_3.dw_detalle_total.y					= 60
//tab_cobranza.tabpage_3.dw_detalle_total.width			= 2277
//tab_cobranza.tabpage_3.dw_detalle_total.height			= 292
//
//tab_cobranza.tabpage_3.st_7.x									= 27
//tab_cobranza.tabpage_3.st_7.y									= 364
//tab_cobranza.tabpage_3.st_7.width							= 850
//tab_cobranza.tabpage_3.st_7.height							= 56
//tab_cobranza.tabpage_3.dw_detalle_cuotas.x				= 18
//tab_cobranza.tabpage_3.dw_detalle_cuotas.y				= 420
//tab_cobranza.tabpage_3.dw_detalle_cuotas.width			= 2277
//tab_cobranza.tabpage_3.dw_detalle_cuotas.height			= 292
//
//tab_cobranza.tabpage_3.st_8.x									= 27
//tab_cobranza.tabpage_3.st_8.y									= 724
//tab_cobranza.tabpage_3.st_8.width							= 850
//tab_cobranza.tabpage_3.st_8.height							= 56
//tab_cobranza.tabpage_3.dw_detalle_mantencion.x			= 18
//tab_cobranza.tabpage_3.dw_detalle_mantencion.y			= 780
//tab_cobranza.tabpage_3.dw_detalle_mantencion.width		= 2277
//tab_cobranza.tabpage_3.dw_detalle_mantencion.height	= 292
//
//tab_cobranza.tabpage_3.st_3.x									= 27
//tab_cobranza.tabpage_3.st_3.y									= 1084
//tab_cobranza.tabpage_3.st_3.width							= 1001
//tab_cobranza.tabpage_3.st_3.height							= 56
//tab_cobranza.tabpage_3.dw_detalle_pagos.x					= 18
//tab_cobranza.tabpage_3.dw_detalle_pagos.y					= 1140
//tab_cobranza.tabpage_3.dw_detalle_pagos.width			= 2277
//tab_cobranza.tabpage_3.dw_detalle_pagos.height			= 292
end subroutine

public subroutine wf_pos_contrato_isa ();//tab_cobranza.tabpage_3.st_6.x									= 27
//tab_cobranza.tabpage_3.st_6.y									= 4
//tab_cobranza.tabpage_3.st_6.width							= 850
//tab_cobranza.tabpage_3.st_6.height							= 56
//tab_cobranza.tabpage_3.dw_detalle_total.x					= 18
//tab_cobranza.tabpage_3.dw_detalle_total.y					= 60
//tab_cobranza.tabpage_3.dw_detalle_total.width			= 2277
//tab_cobranza.tabpage_3.dw_detalle_total.height			= 412
//
//tab_cobranza.tabpage_3.st_8.x									= 27
//tab_cobranza.tabpage_3.st_8.y									= 480
//tab_cobranza.tabpage_3.st_8.width							= 850
//tab_cobranza.tabpage_3.st_8.height							= 56
//tab_cobranza.tabpage_3.dw_detalle_mantencion.x			= 18
//tab_cobranza.tabpage_3.dw_detalle_mantencion.y			= 536
//tab_cobranza.tabpage_3.dw_detalle_mantencion.width		= 2277
//tab_cobranza.tabpage_3.dw_detalle_mantencion.height	= 412
//
//tab_cobranza.tabpage_3.st_3.x									= 27
//tab_cobranza.tabpage_3.st_3.y									= 956
//tab_cobranza.tabpage_3.st_3.width							= 1001
//tab_cobranza.tabpage_3.st_3.height							= 56
//tab_cobranza.tabpage_3.dw_detalle_pagos.x					= 18
//tab_cobranza.tabpage_3.dw_detalle_pagos.y					= 1012
//tab_cobranza.tabpage_3.dw_detalle_pagos.width			= 2277
//tab_cobranza.tabpage_3.dw_detalle_pagos.height			= 412
end subroutine

public function string wf_cod_age ();string	ls_ult_age,ls_codigo,ls_cod_age
long	ll_reg,ll_reg_sig,ll_cta

SELECT 	"COD_AGENTE"
INTO 		:ls_ult_age
FROM 	"COTIZACIONES"
WHERE 	"COTIZACIONES"."CORRELATIVO_INTERNO" = (	SELECT MAX("COTIZACIONES"."CORRELATIVO_INTERNO")
																			FROM 	"COTIZACIONES"
																			WHERE 	"COTIZACIONES"."CANAL" = 'UG'	)
USING sqlca;
if isnull(ls_ult_age) then ls_ult_age=''
if ls_ult_age='' then
	SELECT		"AGENTES"."COD_AGE"
	INTO			:ls_codigo
	FROM 		"AGENTES","UGN_COTIZACION_AGENTE"
	WHERE 		"AGENTES"."COD_AGE"="UGN_COTIZACION_AGENTE"."COD_AGENTE" AND
					"AGENTES"."ESTADO" = "UGN_COTIZACION_AGENTE"."ESTADO" AND
					"AGENTES"."ESTADO" = 'A' AND
					"UGN_COTIZACION_AGENTE"."ORDEN_DATOS" = (	SELECT	min("UGN_COTIZACION_AGENTE"."ORDEN_DATOS")
																						FROM 	"UGN_COTIZACION_AGENTE"
																						WHERE 	"UGN_COTIZACION_AGENTE"."ESTADO" = 'A' )
	USING	sqlca;
	if isnull(ls_codigo) then ls_codigo=''
else
	
	SELECT		count("AGENTES"."COD_AGE")
	INTO			:ll_cta
	FROM 		"AGENTES","UGN_COTIZACION_AGENTE"
	WHERE 		"AGENTES"."COD_AGE"="UGN_COTIZACION_AGENTE"."COD_AGENTE" AND
					"AGENTES"."ESTADO" = "UGN_COTIZACION_AGENTE"."ESTADO" AND
					"AGENTES"."ESTADO" = 'A' 
	USING	sqlca;
	if isnull(ll_cta) then ll_cta=0
	
	DECLARE x1 CURSOR FOR
	SELECT		"AGENTES"."COD_AGE"
	FROM 		"AGENTES","UGN_COTIZACION_AGENTE"
	WHERE 		"AGENTES"."COD_AGE"="UGN_COTIZACION_AGENTE"."COD_AGENTE" AND
					"AGENTES"."ESTADO" = "UGN_COTIZACION_AGENTE"."ESTADO" AND
					"AGENTES"."ESTADO" = 'A' 
	ORDER BY	"UGN_COTIZACION_AGENTE"."ORDEN_DATOS"
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x1 INTO	:ls_cod_age;
			if not isnull(ls_cod_age) or ls_cod_age <> '' then
				ll_reg++
				if ls_cod_age=ls_ult_age then
					ll_reg_sig			= ll_reg + 1
				end if
				if ll_reg_sig<=ll_cta then
					if ll_reg=ll_reg_sig then
						ls_codigo				= ls_cod_age
					end if
				else
					SELECT		"AGENTES"."COD_AGE"
					INTO			:ls_codigo
					FROM 		"AGENTES","UGN_COTIZACION_AGENTE"
					WHERE 		"AGENTES"."COD_AGE"="UGN_COTIZACION_AGENTE"."COD_AGENTE" AND
									"AGENTES"."ESTADO" = "UGN_COTIZACION_AGENTE"."ESTADO" AND
									"AGENTES"."ESTADO" = 'A' AND
									"UGN_COTIZACION_AGENTE"."ORDEN_DATOS" = (	SELECT	min("UGN_COTIZACION_AGENTE"."ORDEN_DATOS")
																										FROM 	"UGN_COTIZACION_AGENTE"
																										WHERE 	"UGN_COTIZACION_AGENTE"."ESTADO" = 'A' )
					USING	sqlca;
					if isnull(ls_codigo) then ls_codigo=''
				end if
			end if
			setnull(ls_cod_age)
		LOOP
	end if
close x1;
end if
if isnull(ls_codigo) then ls_codigo=''
return ls_codigo
end function

public subroutine wf_calcular_interes (string as_cobro, string as_base, string as_serie, double al_numero, long al_fila);Long		ii_cantidad,ii_dmora,ii_mora_cobro,ii_inc_gastos,i,ll_gasto_cob,ll_mora,ll_gastos,&
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

on w_ingreso_individual_ugn.create
this.cb_1=create cb_1
this.pb_ok3=create pb_ok3
this.st_7=create st_7
this.p_1=create p_1
this.fec_ini_falle=create fec_ini_falle
this.st_filtrar=create st_filtrar
this.st_buscar=create st_buscar
this.st_6=create st_6
this.pb_ok1=create pb_ok1
this.pb_buscar=create pb_buscar
this.em_grupo=create em_grupo
this.st_3=create st_3
this.st_5=create st_5
this.em_agente=create em_agente
this.cb_print_informe=create cb_print_informe
this.cb_modif_antece=create cb_modif_antece
this.hpb_1=create hpb_1
this.cb_actualizar=create cb_actualizar
this.cb_ctacte2=create cb_ctacte2
this.dw_dias_mora=create dw_dias_mora
this.cb_cerrar=create cb_cerrar
this.cb_ctacte=create cb_ctacte
this.st_2=create st_2
this.sle_nombre=create sle_nombre
this.pb_ok2=create pb_ok2
this.cb_grabar_formula=create cb_grabar_formula
this.cb_historico=create cb_historico
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.gb_1=create gb_1
this.st_porc=create st_porc
this.st_fondo=create st_fondo
this.sle_ap_pat=create sle_ap_pat
this.gb_4=create gb_4
this.gb_2=create gb_2
this.gb_3=create gb_3
this.tab_cobranza=create tab_cobranza
this.dw_lista=create dw_lista
this.dw_print_agente=create dw_print_agente
this.Control[]={this.cb_1,&
this.pb_ok3,&
this.st_7,&
this.p_1,&
this.fec_ini_falle,&
this.st_filtrar,&
this.st_buscar,&
this.st_6,&
this.pb_ok1,&
this.pb_buscar,&
this.em_grupo,&
this.st_3,&
this.st_5,&
this.em_agente,&
this.cb_print_informe,&
this.cb_modif_antece,&
this.hpb_1,&
this.cb_actualizar,&
this.cb_ctacte2,&
this.dw_dias_mora,&
this.cb_cerrar,&
this.cb_ctacte,&
this.st_2,&
this.sle_nombre,&
this.pb_ok2,&
this.cb_grabar_formula,&
this.cb_historico,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.gb_1,&
this.st_porc,&
this.st_fondo,&
this.sle_ap_pat,&
this.gb_4,&
this.gb_2,&
this.gb_3,&
this.tab_cobranza,&
this.dw_lista,&
this.dw_print_agente}
end on

on w_ingreso_individual_ugn.destroy
destroy(this.cb_1)
destroy(this.pb_ok3)
destroy(this.st_7)
destroy(this.p_1)
destroy(this.fec_ini_falle)
destroy(this.st_filtrar)
destroy(this.st_buscar)
destroy(this.st_6)
destroy(this.pb_ok1)
destroy(this.pb_buscar)
destroy(this.em_grupo)
destroy(this.st_3)
destroy(this.st_5)
destroy(this.em_agente)
destroy(this.cb_print_informe)
destroy(this.cb_modif_antece)
destroy(this.hpb_1)
destroy(this.cb_actualizar)
destroy(this.cb_ctacte2)
destroy(this.dw_dias_mora)
destroy(this.cb_cerrar)
destroy(this.cb_ctacte)
destroy(this.st_2)
destroy(this.sle_nombre)
destroy(this.pb_ok2)
destroy(this.cb_grabar_formula)
destroy(this.cb_historico)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.gb_1)
destroy(this.st_porc)
destroy(this.st_fondo)
destroy(this.sle_ap_pat)
destroy(this.gb_4)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.tab_cobranza)
destroy(this.dw_lista)
destroy(this.dw_print_agente)
end on

event open;Long		ll_tot_reg,ll_indi,ll_rut,ll_count_reg,ll_count_pago,ll_cod_parque,ll_new
Datetime	ldt_fecha,ldt_fec_llama,ldb_valor_uf_dia,ldt_fecha_hoy
String		ls_base,ls_serie,ls_cod_agente,ls_ult_agente
date		ld_fecha_hoy
Double	ll_numero

SetPointer(HourGlass!)
st_buscar.visible		= false
st_filtrar.visible			= false
is_tipo_usuario			= Message.StringParm
fec_ini_falle.text		= string(gdt_fec_sistema,'dd/mm/yyyy')
gf_centrar(w_ingreso_individual_ugn)
SELECT "TASA"."GASTO_COB_MORA","TASA"."TASA_INT_UF" INTO :id_factor_gc,:id_tasa_mant FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
dw_dias_mora.settransobject(sqlca)
tab_cobranza.tabpage_1.dw_contrato.settransobject(sqlca)
tab_cobranza.tabpage_1.dw_cliente.settransobject(sqlca)
tab_cobranza.tabpage_2.dw_cobranza.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_fallecido.settransobject(sqlca)
tab_cobranza.tabpage_4.dw_cliente2.settransobject(sqlca)
tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.settransobject(sqlca)
tab_cobranza.tabpage_5.enabled		= false 
if is_tipo_usuario = 'SUP' then
//	tab_cobranza.tabpage_4.dw_ingreso.dataobject	= 'dw_ingreso_gestion_ejecutivo_ugn' 
//	w_ingreso_individual_ugn.title					= 'Ingreso Gestión Telefónica'
//	em_agente.visible				= true
//	pb_buscar.visible				= true
//	cb_ordenar.visible 			= false
//	cb_filtrar.visible 			= false
//	cb_exportar.visible 			= false
//	cb_imprimir.visible 			= false
//	gb_1.visible					= false
//	cb_historico.visible 		= false
//	cb_grabar_formula.visible	= false
//	cb_ctacte.x						= 32
//	cb_ctacte.y						= 48
//	cb_print_informe.x			= 3460
//	cb_print_informe.y			= 48
//	cb_modif_antece.x				= 1673
//	cb_modif_antece.y				= 48
	/////
// ------------------------------------------- tab_cotizacion-----------------------------
	ldt_fecha_hoy					= datetime(date(gdt_fec_sistema),time('00:00:00'))
	tab_cobranza.tabpage_5.dw_cotizacion.settransobject(sqlca)		// cotizaciones ugn
	tab_cobranza.tabpage_5.dw_cotizacion_agente.settransobject(sqlca) // cotizaciones ugn
	tab_cobranza.tabpage_5.dw_cotiz_imprime.settransobject(sqlca) // IMPRESION
	tab_cobranza.tabpage_5.dw_email.settransobject(sqlca) // IMPRESION
	
	tab_cobranza.tabpage_5.enabled						= true // cotizaciones ugn
	if gs_conexion	= "Parque El Prado" then
		ll_cod_parque				= 1
	elseif gs_conexion = "Parque La Foresta" then
		ll_cod_parque				= 11	
	elseif gs_conexion = "Parque Concepción" then
		ll_cod_parque				= 801	
	end if
	tab_cobranza.tabpage_5.dw_cotizacion.getchild('sector',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	idw_detalle3.retrieve(ll_cod_parque)
	tab_cobranza.tabpage_5.dw_cotizacion.getchild('capacidad',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	idw_detalle4.insertrow(0)
	tab_cobranza.tabpage_5.dw_cotizacion.getchild('tipo_sepultura',idw_detalle5)
	idw_detalle5.settransobject(sqlca)
	idw_detalle5.insertrow(0)
	tab_cobranza.tabpage_5.dw_cotizacion.getchild('uso',idw_detalle6)
	idw_detalle6.settransobject(sqlca)
	idw_detalle6.insertrow(0)
	tab_cobranza.tabpage_5.dw_cotizacion.getchild('numero_reducciones',idw_detalle7)
	idw_detalle7.settransobject(sqlca)
	idw_detalle7.insertrow(0)
	tab_cobranza.tabpage_5.dw_cotizacion.insertrow(0)
	ll_new					= tab_cobranza.tabpage_5.dw_cotizacion.insertrow(0)
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_valor_uf_dia  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		tab_cobranza.tabpage_5.dw_cotizacion.setitem(ll_new,'uf_dia',ldb_valor_uf_dia)
	end if
	tab_cobranza.tabpage_5.dw_cotizacion.setitem(ll_new,'cod_parque',ll_cod_parque)
	tab_cobranza.tabpage_5.dw_cotizacion.setitem(ll_new,'moneda','2')
	tab_cobranza.tabpage_5.dw_cotizacion.setitem(ll_new,'cod_ejecutivo',gs_user)
	tab_cobranza.tabpage_5.dw_cotizacion.setitem(ll_new,'fecha',ldt_fecha_hoy)
// ----------------------------------- fin tab cotizacion	------------------------------------------------------
//	tab_cobranza.tabpage_4.dw_ingreso.dataobject	= 'dw_ingreso_gestion_supervisor_ugn'
	tab_cobranza.tabpage_4.dw_ingreso.dataobject	= 'dw_ingreso_gestion_ejecutivo_ugn'
	w_ingreso_individual_ugn.title					= 'Ingreso Gestión Telefónica - UGN'
	em_agente.visible	= true
	pb_buscar.visible	= false
	tab_cobranza.height 							= 2060
	tab_cobranza.tabpage_4.cb_grabar.y 	= 1800
	tab_cobranza.tabpage_4.cb_cerrar_4.y	= 1800
	if gs_user = 'JU4' or gs_depto = 'I' or gs_depto = 'G' then
		cb_print_informe.enabled				= true
		cb_exportar.enabled						= true
		cb_imprimir.enabled						= true
	end if
	//if gs_user = 'U3' then
		dw_print_agente.dataobject					= 'dw_imprimir_por_usuario_sup_ugn'
//	else
//		dw_print_agente.dataobject					= 'dw_imprimir_por_usuario_agente_ugn'
//	end if
	//dw_print_agente.dataobject					= 'dw_imprimir_por_usuario_sup_ugn'
	
//	dw_print_agente.SETfilter("c_tipo_usuario = '"+is_tipo_usuario+"'" )
//	dw_print_agente.filter()
//	tab_cobranza.tabpage_4.dw_encuesta.insertrow(0)
//	tab_cobranza.tabpage_4.dw_encuesta.settransobject(sqlca)
//	dw_print_agente.settransobject(sqlca)
elseif is_tipo_usuario = 'UGN' then
	tab_cobranza.tabpage_4.dw_ingreso.dataobject	= 'dw_ingreso_gestion_supervisor_ugn'
//	end if	
//	w_ingreso_individual_ugn.title					= 'Ingreso Gestión Telefónica - UGN'
//	em_agente.visible	= true
//	pb_buscar.visible	= false
	/////
	w_ingreso_individual_ugn.title					= 'Ingreso Gestión Telefónica'
	em_agente.visible				= true
	pb_buscar.visible				= true
	cb_ordenar.visible 			= false
	cb_filtrar.visible 				= false
	cb_exportar.visible 			= false
	cb_imprimir.visible 			= false
	gb_1.visible						= false
	cb_historico.visible 			= false
	cb_grabar_formula.visible	= false
	cb_ctacte.x						= 32
	cb_ctacte.y						= 48
	cb_print_informe.x				= 3460
	cb_print_informe.y				= 48
	cb_modif_antece.x				= 1673
	cb_modif_antece.y				= 48
	tab_cobranza.tabpage_4.cb_grabar.y 	= 1608
	tab_cobranza.tabpage_4.cb_cerrar_4.y	= 1608
	tab_cobranza.height 					= 1856
	//dw_print_agente.dataobject										= 'dw_imprimir_por_usuario_sup_ugn'
//	if gs_user = 'U3' then
		dw_print_agente.dataobject					= 'dw_imprimir_por_usuario_sup_ugn'
//	else
//		dw_print_agente.dataobject					= 'dw_imprimir_por_usuario_agente_ugn'
//	end if
//	dw_print_agente.dataobject										= 'dw_imprimir_por_usuario_agente_ugn'
	tab_cobranza.tabpage_4.dw_encuesta.visible = false
	
//	dw_print_agente.settransobject(sqlca)
end if
tab_cobranza.tabpage_4.dw_encuesta.settransobject(sqlca)
tab_cobranza.tabpage_4.dw_encuesta.getchild('nota_servicio',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve()=0 then
	idw_detalle.insertrow(0)
end if
tab_cobranza.tabpage_4.dw_encuesta.settransobject(sqlca)
tab_cobranza.tabpage_4.dw_encuesta.getchild('nota_maestro_c',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve()=0 then
	idw_detalle2.insertrow(0)
end if
tab_cobranza.tabpage_4.dw_encuesta.insertrow(0)

//tab_cobranza.tabpage_4.dw_encuesta.insertrow(0)
//tab_cobranza.tabpage_4.dw_encuesta.settransobject(sqlca)
tab_cobranza.tabpage_4.dw_ingreso.settransobject(sqlca)
dw_lista.dataobject										= 'dw_ingreso_por_usuario_cobranza_ugn'
dw_lista.settransobject(sqlca)
Postevent('ue_cargar')
SetPointer(Arrow!)
dw_lista.setfocus()
dw_print_agente.settransobject(sqlca)
end event

event mousemove;st_buscar.visible				= false
st_filtrar.visible					= false
end event

type cb_1 from commandbutton within w_ingreso_individual_ugn
integer x = 4064
integer y = 944
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;//string	ls_ult_age,ls_codigo,ls_cod_age
//long	ll_reg,ll_reg_sig,ll_cta
//
//SELECT 	"COD_AGENTE"
//INTO 		:ls_ult_age
//FROM 	"COTIZACIONES"
//WHERE 	"COTIZACIONES"."CORRELATIVO_INTERNO" = (	SELECT MAX("COTIZACIONES"."CORRELATIVO_INTERNO")
//																			FROM 	"COTIZACIONES"
//																			WHERE 	"COTIZACIONES"."CANAL" = 'UG'	)
//USING sqlca;
//if isnull(ls_ult_age) then ls_ult_age=''
//if ls_ult_age='' then
//	SELECT		"AGENTES"."COD_AGE"
//	FROM 		"AGENTES","UGN_COTIZACION_AGENTE"
//	WHERE 		"AGENTES"."COD_AGE"="UGN_COTIZACION_AGENTE"."COD_AGENTE" AND
//					"AGENTES"."ESTADO" = "UGN_COTIZACION_AGENTE"."ESTADO" AND
//					"AGENTES"."ESTADO" = 'A' AND
//					"UGN_COTIZACION_AGENTE"."ORDEN_DATOS" = (	SELECT	min("UGN_COTIZACION_AGENTE"."ORDEN_DATOS")
//																						FROM 	"UGN_COTIZACION_AGENTE"
//																						WHERE 	"UGN_COTIZACION_AGENTE"."ESTADO" = 'A' );
//	
//	
//	
//	
//	
//	
//	
//	
//	SELECT		"COD_AGE"
//	INTO			:ls_codigo
//	FROM 		"AGENTES"
//	WHERE 		"AGENTES"."COD_AGE"="UGN_COTIZACION_AGENTE"."COD_AGE" AND
//					"AGENTES"."ESTADO" = "UGN_COTIZACION_AGENTE"."ESTADO" AND
//					"AGENTES"."ESTADO" = 'A' AND
//					"AGENTES"."CANAL" = 'UG' AND
//					"AGENTES"."COD_SUP" = 'SU4' and
//					"AGENTES"."COD_AGE" not like 'U%' and
//					"AGENTES"."FECHA_INI" = (		SELECT	min("ORDEN_DATOS")
//															FROM 	"UGN_COTIZACION_AGENTE"
//															WHERE 	"UGN_COTIZACION_AGENTE"."ESTADO" = 'A' )
//	USING	sqlca;
//	if isnull(ls_codigo) then ls_codigo=''
//else
//	SELECT	count("COD_AGE")
//	INTO		:ll_cta
//	FROM 	"AGENTES"
//	WHERE 	"AGENTES"."ESTADO" = 'A' AND
//				"AGENTES"."CANAL" = 'UG' AND
//				"AGENTES"."COD_SUP" = 'SU4' and
//				"AGENTES"."COD_AGE" not like 'U%'
//	USING	sqlca;
//	if isnull(ll_cta) then ll_cta=0
//	
//	DECLARE x1 CURSOR FOR
//	SELECT		"COD_AGE"
//	FROM 		"AGENTES"
//	WHERE 		"AGENTES"."ESTADO" = 'A' AND
//					"AGENTES"."CANAL" = 'UG' AND
//					"AGENTES"."COD_SUP" = 'SU4' and
//					"AGENTES"."COD_AGE" not like 'U%'
//	ORDER BY	"FECHA_INI"
//	USING		sqlca;
//	open x1;
//	if sqlca.sqlcode=0 then
//		DO WHILE sqlca.sqlcode=0
//		fetch x1 INTO	:ls_cod_age;
//			if not isnull(ls_cod_age) or ls_cod_age <> '' then
//				ll_reg++
//				if ls_cod_age=ls_ult_age then
//					ll_reg_sig			= ll_reg + 1
//				end if
//				if ll_reg_sig<=ll_cta then
//					if ll_reg=ll_reg_sig then
//						ls_codigo				= ls_cod_age
//					end if
//				else
//					SELECT		"COD_AGE"
//					INTO			:ls_codigo
//					FROM 		"AGENTES"
//					WHERE 		"AGENTES"."ESTADO" = 'A' AND
//									"AGENTES"."CANAL" = 'UG' AND
//									"AGENTES"."COD_AGE" not like 'U%' and
//									"AGENTES"."FECHA_INI" = (		SELECT	min("FECHA_INI")
//																			FROM 	"AGENTES"
//																			WHERE 	"AGENTES"."ESTADO" = 'A' AND
//																						"AGENTES"."CANAL" = 'UG' AND
//																						"AGENTES"."COD_AGE" not like 'U%')
//					USING	sqlca;
//					if isnull(ls_codigo) then ls_codigo=''
//				end if
//			end if
//			setnull(ls_cod_age)
//		LOOP
//	end if
//close x1;
//end if
//if isnull(ls_codigo) then ls_codigo=''
//return ls_codigo
end event

type pb_ok3 from picturebutton within w_ingreso_individual_ugn
integer x = 3365
integer y = 2380
integer width = 128
integer height = 112
integer taborder = 190
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string ls_string,ls_fecha
date	ldt_fecha
long ll_row,ll_tot_reg

setnull (ls_string)
ll_tot_reg				= dw_lista.RowCount()
if ll_tot_reg>0 then
	if fec_ini_falle.text<>'00/00/0000' then
		ldt_fecha	= date(fec_ini_falle.text)
		ls_string	= "ugn_cliente_asignar_falle_fecha_sepultac= date('"+string(ldt_fecha)+"')"
		if not isnull(ldt_fecha) then
			dw_lista.SetFilter(ls_string)
			dw_lista.Filter( )
			dw_print_agente.setfilter(ls_string)
			dw_print_agente.filter()
		else
			messagebox("Advertencia","Nº Contrato No Existe en Lista")
		end if
	end if
end if
end event

type st_7 from statictext within w_ingreso_individual_ugn
integer x = 2779
integer y = 2412
integer width = 165
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_1 from picture within w_ingreso_individual_ugn
integer x = 3250
integer y = 2400
integer width = 78
integer height = 80
boolean bringtotop = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(fec_ini_falle.text)=-1 then 
 fec_ini_falle.text=string(today(),gs_formato_fecha)
 fec_ini_falle.setfocus()
 return
end if 
if fec_ini_falle.text<>'00/00/0000' then
 ls_fecha = fec_ini_falle.text
else
 ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

//IF Message.StringParm <> ls_fecha THEN
// IF DATE(Message.StringParm)>DATE(fec_ini_falle.TEXT) THEN
//  MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
//  fec_ini_falle.setfocus()
//  return
//else 
  fec_ini_falle.text = Message.StringParm
// end if 
//END IF
end event

type fec_ini_falle from editmask within w_ingreso_individual_ugn
integer x = 2949
integer y = 2396
integer width = 297
integer height = 92
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type st_filtrar from statictext within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 1093
integer y = 2308
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
string text = "Filtrar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_filtrar.visible	= false
st_buscar.visible		= false
end event

type st_buscar from statictext within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 366
integer y = 2308
integer width = 407
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
string text = "Buscar Agente"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_buscar.visible		= false
st_filtrar.visible	= false
end event

type st_6 from statictext within w_ingreso_individual_ugn
integer x = 1943
integer y = 2412
integer width = 265
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ap. Paterno"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_ok1 from picturebutton within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 1129
integer y = 2384
integer width = 128
integer height = 112
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_filtrar.visible	= true
st_buscar.visible		= false
end event

event clicked;String	ls_agente,ls_string
Long		ll_grupo

setnull (ls_string)
ls_agente	= trim(em_agente.text)
ll_grupo		= long(trim(em_grupo.text))
if isnull(ll_grupo) then ll_grupo=0
if not isnull(ls_agente) or ll_grupo > 0 then
	if not isnull(ls_agente) and ls_agente <> '' and ll_grupo > 0 then
		ls_string	= "ugn_cliente_asignar_falle_cod_age ='"+ls_agente+"' and ugn_cliente_grupo ="+string(ll_grupo)
	elseif not isnull(ls_agente) and ls_agente <> '' and ll_grupo=0 then
		ls_string	= "ugn_cliente_asignar_falle_cod_age = '"+ls_agente+"'"
	elseif ll_grupo > 0	and (isnull(ls_agente) or ls_agente='') then
		ls_string	= "ugn_cliente_grupo = "+string(ll_grupo)
	end if	
	dw_lista.setfilter(ls_string)
	dw_lista.filter()
	dw_print_agente.setfilter(ls_string)
	dw_print_agente.filter()
	if dw_lista.rowcount() = 0 then messagebox("Advertencia","No Registra Dato")
end if
end event

type pb_buscar from picturebutton within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 507
integer y = 2392
integer width = 110
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
alignment htextalign = right!
end type

event ue_mousemove;st_buscar.visible		= true
st_filtrar.visible	= false
end event

event clicked;if is_tipo_usuario = 'SUP' then
	is_opcion		= '3'
	openwithparm(w_lista_codigos,is_opcion)
elseif is_tipo_usuario = 'UGN' then
	is_opcion		= '3'
	openwithparm(w_lista_codigos,is_opcion)
end if
end event

type em_grupo from editmask within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 846
integer y = 2396
integer width = 274
integer height = 92
integer taborder = 130
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###"
end type

event ue_mousemove;st_buscar.visible		= false
st_filtrar.visible	= false
end event

type st_3 from statictext within w_ingreso_individual_ugn
integer x = 622
integer y = 2412
integer width = 219
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Grupo"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_ingreso_individual_ugn
integer x = 46
integer y = 2408
integer width = 169
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agente"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_agente from editmask within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 224
integer y = 2396
integer width = 279
integer height = 92
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!"
end type

event ue_mousemove;st_buscar.visible		= false
st_filtrar.visible	= false
end event

type cb_print_informe from commandbutton within w_ingreso_individual_ugn
integer x = 1947
integer y = 48
integer width = 393
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir Informe"
end type

event clicked;if dw_print_agente.rowcount()>0 then
	dw_print_agente.object.datawindow.Print.Preview	= true
	dw_print_agente.object.datawindow.zoom				= 75
	f_Print( dw_print_agente )
	dw_print_agente.object.datawindow.Print.Preview	= False
	dw_print_agente.object.datawindow.zoom				= 100
end if	
end event

type cb_modif_antece from commandbutton within w_ingreso_individual_ugn
integer x = 1093
integer y = 48
integer width = 590
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar Antecedentes"
end type

event clicked;Long	ll_grupo,ll_correlativo

if il_row > 0 then
	ll_grupo						= dw_lista.GetItemNumber(il_row,'ugn_cliente_grupo')
	ll_correlativo				= dw_lista.GetItemNumber(il_row,'ugn_cliente_correlativo')
	if ll_grupo > 0 and ll_correlativo > 0 then
		if isvalid(w_mantenedor_supervisor_condolencias) then close(w_mantenedor_supervisor_condolencias)
		open(w_mantenedor_supervisor_condolencias)
	end if
end if
end event

type hpb_1 from hprogressbar within w_ingreso_individual_ugn
boolean visible = false
integer x = 1262
integer y = 1032
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type cb_actualizar from commandbutton within w_ingreso_individual_ugn
boolean visible = false
integer x = 169
integer y = 2712
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

type cb_ctacte2 from commandbutton within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2034
integer y = 2720
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
		END CHOOSE
	end if
end if
end event

type dw_dias_mora from datawindow within w_ingreso_individual_ugn
boolean visible = false
integer x = 347
integer y = 2696
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

type cb_cerrar from commandbutton within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 3584
integer y = 2380
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

event clicked;close(w_ingreso_individual_ugn)
end event

type cb_ctacte from commandbutton within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 425
integer y = 48
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.rowcount()>0 then
	gi_rut	= dw_lista.getitemnumber(il_row,'ugn_cliente_rut')
	if gi_rut > 0 then
		gi_tipo_busqueda = 1
		if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
		if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
		if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
		if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
		if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
		Open(w_listado_contratos)
	end if
end if
end event

type st_2 from statictext within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 1321
integer y = 2412
integer width = 178
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Nombre"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_buscar.visible		= false
st_filtrar.visible	= false
end event

type sle_nombre from singlelineedit within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 1504
integer y = 2396
integer width = 430
integer height = 92
integer taborder = 150
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_buscar.visible		= false
st_filtrar.visible	= false
end event

type pb_ok2 from picturebutton within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 2610
integer y = 2384
integer width = 128
integer height = 112
integer taborder = 170
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Buscar.BMP"
string disabledname = "Buscar.BMP"
alignment htextalign = left!
end type

event clicked;STRING	ls_string,ls_nombre,ls_ap_pat
long		ll_row,ll_largo_nom,ll_largo_ap

ls_nombre		= trim(sle_nombre.text)
ls_ap_pat		= trim(sle_ap_pat.text)
if isnull(ls_nombre) then ls_nombre=''
ll_largo_nom	= len(ls_nombre)
ll_largo_ap		= len(ls_ap_pat)
if isnull(ls_ap_pat) then ls_ap_pat=''
if ls_nombre<>'' or ls_ap_pat<>'' then
	if ls_nombre<>'' and ls_ap_pat<>'' then
		ls_string	= "mid(ugn_cliente_asignar_falle_nombre_falleci,1,"+string(ll_largo_nom)+")='"+ls_nombre+"' and mid(ugn_cliente_asignar_falle_a_paterno_fall,1,"+string(ll_largo_ap)+") = '"+ls_ap_pat+"'"
		ll_row = dw_lista.Find(ls_string, 1, dw_lista.RowCount())
		if ll_row > 0 then
			dw_lista.ScrollToRow(ll_row)
		else
			MessageBox("Advertencia", "Nombre Inexistente")
		end if
	elseif ls_nombre<>'' and ls_ap_pat='' then
		ls_string	= "mid(ugn_cliente_asignar_falle_nombre_falleci,1,"+string(ll_largo_nom)+")='"+ls_nombre+"'"
		ll_row = dw_lista.Find(ls_string, 1, dw_lista.RowCount())
		if ll_row > 0 then
			dw_lista.ScrollToRow(ll_row)
		else
			MessageBox("Advertencia", "Nombre Inexistente")
		end if
	elseif ls_ap_pat<>'' and ls_nombre='' then
		ls_string	= "mid(ugn_cliente_asignar_falle_a_paterno_fall,1,"+string(ll_largo_ap)+")='"+ls_ap_pat+"'"
		ll_row = dw_lista.Find(ls_string, 1, dw_lista.RowCount())
		if ll_row > 0 then
			dw_lista.ScrollToRow(ll_row)
		else
			MessageBox("Advertencia", "Apellido Paterno Inexistente")
		end if
	end if
end if
end event

type cb_grabar_formula from commandbutton within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 837
integer y = 48
integer width = 576
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Buscar / Gra&bar Formula"
end type

event clicked;open(w_formulas)
end event

type cb_historico from commandbutton within w_ingreso_individual_ugn
event ue_mousemove pbm_dwnmousemove
integer x = 32
integer y = 48
integer width = 384
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Gestión"
end type

event clicked;Long		ll_grupo,ll_correlativo
String	ls_string

if dw_lista.getrow()>0 then
	il_row			= dw_lista.getrow()
	ll_grupo			= dw_lista.GetItemNumber(il_row,'ugn_cliente_grupo')
	ll_correlativo	= dw_lista.GetItemNumber(il_row,'ugn_cliente_correlativo')
	ls_string		= string(ll_grupo)+'~t'+string(ll_correlativo)
	if isvalid(w_mostrar_detalle_gestion_ugn) then close(w_mostrar_detalle_gestion_ugn)
	openwithparm(w_mostrar_detalle_gestion_ugn,ls_string)
end if
end event

type cb_imprimir from commandbutton within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 3602
integer y = 52
integer width = 238
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom				= 42
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview	= false
	dw_lista.object.datawindow.zoom				= 100
end if
end event

type cb_exportar from commandbutton within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 3360
integer y = 52
integer width = 238
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 3118
integer y = 52
integer width = 238
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;long 		ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string 	ls_texto

setnull (gs_formula)
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
ll_filas						= dw_lista.rowcount()
gs_formula 					= dw_lista.describe("datawindow.syntax")
ll_largototal				= len(gs_formula)
ll_posini					= Pos(gs_formula, "filter") + 8
ll_posfin					= len("~nfilter~n")
ls_texto						= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin			= ll_indi
		ll_indi				= ll_largototal
	end if
next
ll_resto						= ll_posfin - ll_posini
gs_formula					= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' then
	gs_formula				= ''
end if
dw_print_agente.SETfilter(gs_formula)
dw_print_agente.filter()
if gs_formula='' or isnull(gs_formula) then
	em_agente.text			= ''
	em_grupo.text			= ''
	sle_nombre.text		= ''
	sle_ap_pat.text		= ''
	fec_ini_falle.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
end if
end event

type cb_ordenar from commandbutton within w_ingreso_individual_ugn
event ue_mousemove pbm_dwnmousemove
integer x = 2875
integer y = 52
integer width = 238
integer height = 80
integer taborder = 50
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

type gb_1 from groupbox within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 2853
integer y = 4
integer width = 1010
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_porc from statictext within w_ingreso_individual_ugn
boolean visible = false
integer x = 1262
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

type st_fondo from statictext within w_ingreso_individual_ugn
boolean visible = false
integer x = 1234
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

type sle_ap_pat from singlelineedit within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 2217
integer y = 2396
integer width = 384
integer height = 92
integer taborder = 160
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 2775
integer y = 2324
integer width = 741
integer height = 196
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar Fecha Sepultación"
end type

event ue_mousemove;st_buscar.visible		= false
st_filtrar.visible	= false
end event

type gb_2 from groupbox within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 1307
integer y = 2324
integer width = 1454
integer height = 196
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Fallecido"
end type

event ue_mousemove;st_buscar.visible		= false
st_filtrar.visible	= false
end event

type gb_3 from groupbox within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 2324
integer width = 1248
integer height = 196
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por"
end type

event ue_mousemove;st_buscar.visible		= false
st_filtrar.visible	= false
end event

event constructor;//
end event

type tab_cobranza from uo_ugn_gestion within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 681
integer y = 216
integer taborder = 100
end type

event ue_mousemove;st_buscar.visible		= false
st_filtrar.visible	= false
end event

type dw_lista from datawindow within w_ingreso_individual_ugn
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 176
integer width = 3835
integer height = 2132
integer taborder = 90
string title = "none"
string dataobject = "dw_ingreso_por_usuario_cobranza_ugn"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_buscar.visible		= false
st_filtrar.visible	= false
end event

event clicked;string	ls_columna,ls_fecha,ls_nombre,ls_ap_pat,ls_ap_mat,ls_sector,ls_sepult,ls_nom_fall,&
			ls_ap_pat_fall,ls_ap_mat_fall
Long		ll_grupo,ll_correlativo,ll_new,ll_new_tele,ll_rut_fall,ll_nota_serv,ll_nota_mc
Date		ld_fecha_prox_llamado,ld_fecha_mas2
Datetime	ldt_fec_sepult

ls_columna					= dwo.name
if row > 0 then
	il_row					= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	//--
	tab_cobranza.tabpage_5.dw_cotizacion.getchild('sector',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	tab_cobranza.tabpage_5.dw_cotizacion.getchild('capacidad',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	idw_detalle4.insertrow(0)
	tab_cobranza.tabpage_5.dw_cotizacion.getchild('tipo_sepultura',idw_detalle5)
	idw_detalle5.settransobject(sqlca)
	idw_detalle5.insertrow(0)
	tab_cobranza.tabpage_5.dw_cotizacion.getchild('uso',idw_detalle6)
	idw_detalle6.settransobject(sqlca)
	idw_detalle6.insertrow(0)
	tab_cobranza.tabpage_5.dw_cotizacion.getchild('numero_reducciones',idw_detalle7)
	idw_detalle7.settransobject(sqlca)
	idw_detalle7.insertrow(0)
	//--
	gi_rut 						= dw_lista.GetItemNumber(il_row, "ugn_cliente_rut")
	ls_nombre					= dw_lista.getitemstring(il_row, "ugn_cliente_nombre")
	ls_ap_pat					= dw_lista.getitemstring(il_row, "ugn_cliente_a_paterno")
	ls_ap_mat					= dw_lista.getitemstring(il_row, "ugn_cliente_a_materno")
	ld_fecha_mas2				= RelativeDate(date(gdt_fec_sistema), 2)
	
	if isnull(gi_rut) then gi_rut=0
	if isnull(ls_nombre) then ls_nombre=''
	if isnull(ls_ap_pat) then ls_ap_pat=''
	if isnull(ls_ap_mat) then ls_ap_mat=''
	ld_fecha_prox_llamado	= date(dw_lista.getitemdatetime(il_row, "ugn_cliente_prox_llamado_cob"))
	ll_grupo						= dw_lista.GetItemNumber(il_row,'ugn_cliente_grupo')
	ll_correlativo				= dw_lista.GetItemNumber(il_row,'ugn_cliente_correlativo')
	if gs_depto='B' or gs_depto='R' or gs_depto='K' or gs_depto='X' or gs_depto='I' then 
		tab_cobranza.tabpage_4.cb_grabar.enabled	= true
	else
		tab_cobranza.tabpage_4.cb_grabar.enabled	= false
	end if
	if gi_rut > 0 then
		tab_cobranza.tabpage_1.dw_contrato.retrieve(gi_rut)
	else
		tab_cobranza.tabpage_1.dw_contrato.reset()
	end if
	tab_cobranza.tabpage_1.dw_cliente.retrieve(ll_grupo,ll_correlativo)
	wf_cargar_dw_contrato()
	tab_cobranza.tabpage_2.dw_cobranza.retrieve(ll_grupo,ll_correlativo)
	SELECT	"FICHA_SEPULTACION"."FECHA_SEPULTACION",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."RUT_FALLECIDO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL"
	INTO 		:ldt_fec_sepult,									:ls_sector,							:ls_sepult,								:ll_rut_fall,									:ls_nom_fall,										:ls_ap_pat_fall,								:ls_ap_mat_fall  
	FROM		"UGN_CLIENTE_ASIGNAR_FALLE",	"FICHA_SEPULTACION"  
	WHERE  ( "UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_SEPULTACION" = "FICHA_SEPULTACION"."FECHA_SEPULTACION" ) and  
			 ( "UGN_CLIENTE_ASIGNAR_FALLE"."NOMBRE_FALLECIDO" = "FICHA_SEPULTACION"."NOMBRE_FALLECIDO" ) and  
			 ( "UGN_CLIENTE_ASIGNAR_FALLE"."A_PATERNO_FALLECIDO" = "FICHA_SEPULTACION"."AP_PATERNO_FALL" ) and  
			 ( "UGN_CLIENTE_ASIGNAR_FALLE"."A_MATERNO_FALLECIDO" = "FICHA_SEPULTACION"."AP_MATERNO_FALL" ) and  
			 ( "UGN_CLIENTE_ASIGNAR_FALLE"."BASE" = "FICHA_SEPULTACION"."BASE" ) and  
			 ( "UGN_CLIENTE_ASIGNAR_FALLE"."SERIE" = "FICHA_SEPULTACION"."SERIE" ) and  
			 ( "UGN_CLIENTE_ASIGNAR_FALLE"."NUMERO" = "FICHA_SEPULTACION"."NUMERO" ) and  
			 (("UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO" = :ll_grupo ) )   
	UNION   
	SELECT	"FICHA_TRASLADO"."FECHA_TRASLADO",	"FICHA_TRASLADO"."SECTOR_DESTINO",	"FICHA_TRASLADO"."SEPULTURA_DESTINO",	"FICHA_TRASLADO"."RUT_FALLECIDO",	"FICHA_TRASLADO"."NOMBRE_FALLECIDO",	"FICHA_TRASLADO"."APELLIDO_PATERNO_FALL",	"FICHA_TRASLADO"."APELLIDO_MATERNO_FALL" 
	FROM		"FICHA_TRASLADO",	"UGN_CLIENTE_ASIGNAR_FALLE" 
	WHERE  ( "FICHA_TRASLADO"."FECHA_TRASLADO" = "UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_SEPULTACION" ) and  
			 ( "FICHA_TRASLADO"."NOMBRE_FALLECIDO" = "UGN_CLIENTE_ASIGNAR_FALLE"."NOMBRE_FALLECIDO" ) and  
			 ( "FICHA_TRASLADO"."APELLIDO_PATERNO_FALL" = "UGN_CLIENTE_ASIGNAR_FALLE"."A_PATERNO_FALLECIDO" ) and  
			 ( "FICHA_TRASLADO"."APELLIDO_MATERNO_FALL" = "UGN_CLIENTE_ASIGNAR_FALLE"."A_MATERNO_FALLECIDO" ) and  
			 ( "FICHA_TRASLADO"."BASE_DESTINO" = "UGN_CLIENTE_ASIGNAR_FALLE"."BASE" ) and  
			 ( "FICHA_TRASLADO"."SERIE_DESTINO" = "UGN_CLIENTE_ASIGNAR_FALLE"."SERIE" ) and  
			 ( "FICHA_TRASLADO"."NUMERO_DESTINO" = "UGN_CLIENTE_ASIGNAR_FALLE"."NUMERO" ) and  
			 (("UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO" = :ll_grupo ) )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		tab_cobranza.tabpage_3.dw_fallecido.retrieve(date(ldt_fec_sepult),ls_sector, ls_sepult, ll_rut_fall, ls_nom_fall, ls_ap_pat_fall, ls_ap_mat_fall)
	end if
	tab_cobranza.tabpage_4.dw_cliente2.retrieve(ll_grupo,ll_correlativo)
	if tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.retrieve(ll_grupo,ll_correlativo)=0 then
		ll_new_tele				= tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.insertrow(0)
		tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.setitem(ll_new_tele,'ult_glosa_gestion','NO REGISTRA GESTION TELEFONICA')
	end if
	tab_cobranza.tabpage_4.dw_ingreso.reset()
	
	if is_tipo_usuario = 'UGN' or is_tipo_usuario = 'SUP' then //sup
		tab_cobranza.tabpage_4.dw_ingreso.getchild('serie',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
	end if
	ll_new						= tab_cobranza.tabpage_4.dw_ingreso.insertrow(0)
	if is_tipo_usuario = 'UGN' then  //UGN
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'usuario_gestor', gs_user)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'fecha_gestion', datetime(date(gdt_fec_sistema),time('00:00:00')))
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'grupo',ll_grupo)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'correlativo',ll_correlativo)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'fecha_prox_llamado',ld_fecha_mas2)
		
		SELECT	"UGN_ENCUESTA_SERVICIO"."NOTA_SERVICIO",   
					"UGN_ENCUESTA_SERVICIO"."NOTA_MAESTRO_C"  
		INTO 		:ll_nota_serv,:ll_nota_mc  
		FROM 	"UGN_ENCUESTA_SERVICIO"  
		WHERE 	( "UGN_ENCUESTA_SERVICIO"."GRUPO" = :ll_grupo ) AND  
					( "UGN_ENCUESTA_SERVICIO"."CORRELATIVO" = :ll_correlativo )   
		USING	sqlca;
		tab_cobranza.tabpage_4.dw_encuesta.setitem(1,'nota_servicio',ll_nota_serv)
		tab_cobranza.tabpage_4.dw_encuesta.setitem(1,'nota_maestro_c',ll_nota_mc)
		
	elseif is_tipo_usuario = 'SUP' then //SUP
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'usuario', gs_user)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'fecha_gestion', datetime(date(gdt_fec_sistema),time('00:00:00')))
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'grupo_cliente',ll_grupo)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'correlativo_cliente',ll_correlativo)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'fecha_prox_llamado',ld_fecha_mas2)
		SELECT	"UGN_ENCUESTA_SERVICIO"."NOTA_SERVICIO",   
					"UGN_ENCUESTA_SERVICIO"."NOTA_MAESTRO_C"  
		INTO 		:ll_nota_serv,:ll_nota_mc  
		FROM 	"UGN_ENCUESTA_SERVICIO"  
		WHERE 	( "UGN_ENCUESTA_SERVICIO"."GRUPO" = :ll_grupo ) AND  
					( "UGN_ENCUESTA_SERVICIO"."CORRELATIVO" = :ll_correlativo )   
		USING	sqlca;
		tab_cobranza.tabpage_4.dw_encuesta.setitem(1,'nota_servicio',ll_nota_serv)
		tab_cobranza.tabpage_4.dw_encuesta.setitem(1,'nota_maestro_c',ll_nota_mc)
		
	end if
	tab_cobranza.tabpage_4.dw_ingreso.accepttext()
	tab_cobranza.visible													= true
else
	if ls_columna='t_rojo' or ls_columna='t_texto_rojo' then
		gs_formula			= "ugn_cliente_prox_llamado_cob <  fecha"
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()	
		tab_cobranza.visible	= false
	elseif ls_columna='t_amarillo' or ls_columna='t_texto_amarillo' then
		gs_formula			= "ugn_cliente_ult_estado_gestion='0'"
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()	
		tab_cobranza.visible	= false
	elseif ls_columna='t_verde' or ls_columna='t_texto_verde' then
		gs_formula			= "ugn_cliente_ult_estado_gestion='20'"
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()	
		tab_cobranza.visible	= false
	elseif ls_columna='t_azul' or ls_columna='t_texto_azul' then
		gs_formula			= "ugn_cliente_ult_estado_gestion <>'0' and ugn_cliente_ult_estado_gestion<> '20' and ugn_cliente_ult_estado_gestion <>'22'"
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()	
		tab_cobranza.visible	= false
	elseif ls_columna='t_celeste' or ls_columna='t_texto_celeste' then
		gs_formula			= "ugn_cliente_ult_estado_gestion='22'"
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()	
		tab_cobranza.visible	= false
	elseif ls_columna='t_todo' then
		gs_formula				= ''
		em_agente.text			= ''
		em_grupo.text			= ''
		sle_nombre.text		= ''
		sle_ap_pat.text		= ''
		fec_ini_falle.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()	
		tab_cobranza.visible	= false
//	---- boton calendario cotizaciones --- 
	elseif ls_columna = 'p_1' then
 		ls_fecha	= string(date(tab_cobranza.tabpage_5.dw_cotizacion.getitemdatetime(tab_cobranza.tabpage_5.dw_cotizacion.getrow(),'fecha')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			tab_cobranza.tabpage_5.dw_cotizacion.setitem(tab_cobranza.tabpage_5.dw_cotizacion.getrow(),'fecha',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			tab_cobranza.tabpage_5.dw_cotizacion.setitem(tab_cobranza.tabpage_5.dw_cotizacion.getrow(),'fecha',date(ls_fecha))
		END IF
//	---	 fin boton
	end if
//	dw_lista.SETfilter(gs_formula)
//	dw_lista.filter()
//	dw_lista.sort()	
//	tab_cobranza.visible	= false
end if
end event

event rowfocuschanged;string	ls_cod_age,ls_celular,ls_email,ls_fono,ls_fono_c,ls_nombre,ls_ap_pat,ls_ap_mat,ls_sector,ls_sepult,&
		ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall 
long	ll_grupo,ll_correlativo,ll_rut_fall,ll_new_tele,ll_new,ll_nota_serv,ll_nota_mc  
date	ld_fecha_mas2,ld_fecha_prox_llamado
datetime	ldt_fec_sepult

if getrow() > 0 then
	il_row						= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	//----------- Inicio Cotizaciones ---------------------
	tab_cobranza.tabpage_5.dw_cotizacion.reset()
	tab_cobranza.tabpage_5.dw_cotizacion.insertrow(0)
	tab_cobranza.tabpage_5.dw_cotizacion_agente.reset()
	tab_cobranza.tabpage_5.dw_cotizacion_agente.insertrow(0)
	tab_cobranza.tabpage_5.dw_cotizacion.setitem(1,'fecha',gdt_fec_sistema)
	//-----------------
	ls_cod_age								= wf_cod_age()
	if not isnull(ls_cod_age) and ls_cod_age <> '' then
		SELECT 	"UGN_COTIZACION_AGENTE"."CELULAR",   
					"UGN_COTIZACION_AGENTE"."EMAIL",   
					"UGN_COTIZACION_AGENTE"."FONO",   
					"UGN_COTIZACION_AGENTE"."FONO_COMERCIAL"
		INTO :ls_celular,:ls_email,:ls_fono,:ls_fono_c
		FROM "UGN_COTIZACION_AGENTE"
		WHERE "UGN_COTIZACION_AGENTE"."COD_AGENTE" = :ls_cod_age
		USING sqlca;
		if not isnull(ls_fono) then
			tab_cobranza.tabpage_5.dw_cotizacion.setitem(1,'fono_ejecutivo',ls_fono)
		elseif not isnull(ls_fono_c) and isnull(ls_fono) then
			tab_cobranza.tabpage_5.dw_cotizacion.setitem(1,'fono_ejecutivo',ls_fono_c)
		end if	
		tab_cobranza.tabpage_5.dw_cotizacion_agente.setitem(1,'codigo',ls_cod_age)
		tab_cobranza.tabpage_5.dw_cotizacion.setitem(1,'cod_agente',ls_cod_age)
		tab_cobranza.tabpage_5.dw_cotizacion.setitem(1,'canal','UG')
		tab_cobranza.tabpage_5.dw_cotizacion.setitem(1,'cod_ejecutivo',gs_user)
		tab_cobranza.tabpage_5.dw_cotizacion.setitem(1,'mail',ls_email)
		tab_cobranza.tabpage_5.dw_cotizacion.setitem(1,'celular_ejecutivo',ls_celular)
	end if	
	//-------------------------Fin Cotizaciones-------------------------------------
	
	gi_rut 						= dw_lista.GetItemNumber(il_row, "ugn_cliente_rut")
	ls_nombre					= dw_lista.getitemstring(il_row, "ugn_cliente_nombre")
	ls_ap_pat					= dw_lista.getitemstring(il_row, "ugn_cliente_a_paterno")
	ls_ap_mat					= dw_lista.getitemstring(il_row, "ugn_cliente_a_materno")
	ld_fecha_mas2				= RelativeDate(date(gdt_fec_sistema), 2)
	if isnull(gi_rut) then gi_rut=0
	if isnull(ls_nombre) then ls_nombre=''
	if isnull(ls_ap_pat) then ls_ap_pat=''
	if isnull(ls_ap_mat) then ls_ap_mat=''
	ld_fecha_prox_llamado	= date(dw_lista.getitemdatetime(il_row, "ugn_cliente_prox_llamado_cob"))
	ll_grupo						= dw_lista.GetItemNumber(il_row,'ugn_cliente_grupo')
	ll_correlativo				= dw_lista.GetItemNumber(il_row,'ugn_cliente_correlativo')
	if gs_depto='B' or gs_depto='R' or gs_depto='K' or gs_depto='X' or gs_depto='I' then 
		tab_cobranza.tabpage_4.cb_grabar.enabled	= true
	else
		tab_cobranza.tabpage_4.cb_grabar.enabled	= false
	end if
	if gi_rut > 0 then
		tab_cobranza.tabpage_1.dw_contrato.retrieve(gi_rut)
	else
		tab_cobranza.tabpage_1.dw_contrato.reset()
	end if
	tab_cobranza.tabpage_1.dw_cliente.retrieve(ll_grupo,ll_correlativo)
	wf_cargar_dw_contrato()
	tab_cobranza.tabpage_2.dw_cobranza.retrieve(ll_grupo,ll_correlativo)
	SELECT	"FICHA_SEPULTACION"."FECHA_SEPULTACION",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."RUT_FALLECIDO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL"
	INTO 		:ldt_fec_sepult,									:ls_sector,							:ls_sepult,								:ll_rut_fall,									:ls_nom_fall,										:ls_ap_pat_fall,								:ls_ap_mat_fall  
	FROM		"UGN_CLIENTE_ASIGNAR_FALLE",	"FICHA_SEPULTACION"  
	WHERE  ( "UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_SEPULTACION" = "FICHA_SEPULTACION"."FECHA_SEPULTACION" ) and  
			 ( "UGN_CLIENTE_ASIGNAR_FALLE"."NOMBRE_FALLECIDO" = "FICHA_SEPULTACION"."NOMBRE_FALLECIDO" ) and  
			 ( "UGN_CLIENTE_ASIGNAR_FALLE"."A_PATERNO_FALLECIDO" = "FICHA_SEPULTACION"."AP_PATERNO_FALL" ) and  
			 ( "UGN_CLIENTE_ASIGNAR_FALLE"."A_MATERNO_FALLECIDO" = "FICHA_SEPULTACION"."AP_MATERNO_FALL" ) and  
			 ( "UGN_CLIENTE_ASIGNAR_FALLE"."BASE" = "FICHA_SEPULTACION"."BASE" ) and  
			 ( "UGN_CLIENTE_ASIGNAR_FALLE"."SERIE" = "FICHA_SEPULTACION"."SERIE" ) and  
			 ( "UGN_CLIENTE_ASIGNAR_FALLE"."NUMERO" = "FICHA_SEPULTACION"."NUMERO" ) and  
			 (("UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO" = :ll_grupo ) )   
	UNION   
	SELECT	"FICHA_TRASLADO"."FECHA_TRASLADO",	"FICHA_TRASLADO"."SECTOR_DESTINO",	"FICHA_TRASLADO"."SEPULTURA_DESTINO",	"FICHA_TRASLADO"."RUT_FALLECIDO",	"FICHA_TRASLADO"."NOMBRE_FALLECIDO",	"FICHA_TRASLADO"."APELLIDO_PATERNO_FALL",	"FICHA_TRASLADO"."APELLIDO_MATERNO_FALL" 
	FROM		"FICHA_TRASLADO",	"UGN_CLIENTE_ASIGNAR_FALLE" 
	WHERE  ( "FICHA_TRASLADO"."FECHA_TRASLADO" = "UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_SEPULTACION" ) and  
			 ( "FICHA_TRASLADO"."NOMBRE_FALLECIDO" = "UGN_CLIENTE_ASIGNAR_FALLE"."NOMBRE_FALLECIDO" ) and  
			 ( "FICHA_TRASLADO"."APELLIDO_PATERNO_FALL" = "UGN_CLIENTE_ASIGNAR_FALLE"."A_PATERNO_FALLECIDO" ) and  
			 ( "FICHA_TRASLADO"."APELLIDO_MATERNO_FALL" = "UGN_CLIENTE_ASIGNAR_FALLE"."A_MATERNO_FALLECIDO" ) and  
			 ( "FICHA_TRASLADO"."BASE_DESTINO" = "UGN_CLIENTE_ASIGNAR_FALLE"."BASE" ) and  
			 ( "FICHA_TRASLADO"."SERIE_DESTINO" = "UGN_CLIENTE_ASIGNAR_FALLE"."SERIE" ) and  
			 ( "FICHA_TRASLADO"."NUMERO_DESTINO" = "UGN_CLIENTE_ASIGNAR_FALLE"."NUMERO" ) and  
			 (("UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO" = :ll_grupo ) )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		tab_cobranza.tabpage_3.dw_fallecido.retrieve(date(ldt_fec_sepult),ls_sector, ls_sepult, ll_rut_fall, ls_nom_fall, ls_ap_pat_fall, ls_ap_mat_fall)
	end if
	tab_cobranza.tabpage_4.dw_cliente2.retrieve(ll_grupo,ll_correlativo)
	if tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.retrieve(ll_grupo,ll_correlativo)=0 then
		ll_new_tele				= tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.insertrow(0)
		tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.setitem(ll_new_tele,'ult_glosa_gestion','NO REGISTRA GESTION TELEFONICA')
	end if
	tab_cobranza.tabpage_4.dw_ingreso.reset()
	if is_tipo_usuario = 'UGN' or is_tipo_usuario = 'SUP' then //SUP
		tab_cobranza.tabpage_4.dw_ingreso.getchild('serie',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
	//	tab_cobranza.tabpage_4.dw_encuesta.retrieve(ll_grupo,ll_correlativo)
	end if
	ll_new						= tab_cobranza.tabpage_4.dw_ingreso.insertrow(0)
	if is_tipo_usuario = 'UGN' then  //UGN
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'usuario_gestor', gs_user)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'fecha_gestion', datetime(date(gdt_fec_sistema),time('00:00:00')))
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'grupo',ll_grupo)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'correlativo',ll_correlativo)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'fecha_prox_llamado',ld_fecha_mas2)
		
		SELECT	"UGN_ENCUESTA_SERVICIO"."NOTA_SERVICIO",   
					"UGN_ENCUESTA_SERVICIO"."NOTA_MAESTRO_C"  
		INTO 		:ll_nota_serv,:ll_nota_mc  
		FROM 	"UGN_ENCUESTA_SERVICIO"  
		WHERE 	( "UGN_ENCUESTA_SERVICIO"."GRUPO" = :ll_grupo ) AND  
					( "UGN_ENCUESTA_SERVICIO"."CORRELATIVO" = :ll_correlativo )   
		USING	sqlca;
		tab_cobranza.tabpage_4.dw_encuesta.setitem(1,'nota_servicio',ll_nota_serv)
		tab_cobranza.tabpage_4.dw_encuesta.setitem(1,'nota_maestro_c',ll_nota_mc)
//		
	elseif is_tipo_usuario = 'SUP' then  //SUP
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'usuario', gs_user)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'fecha_gestion', datetime(date(gdt_fec_sistema),time('00:00:00')))
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'grupo_cliente',ll_grupo)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'correlativo_cliente',ll_correlativo)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(ll_new,'fecha_prox_llamado',ld_fecha_mas2)
	end if
	tab_cobranza.tabpage_4.dw_ingreso.accepttext()
	tab_cobranza.visible													= true
end if
end event

type dw_print_agente from datawindow within w_ingreso_individual_ugn
integer x = 4046
integer y = 168
integer width = 969
integer height = 1260
boolean bringtotop = true
string title = "none"
string dataobject = "dw_imprimir_por_usuario_sup_ugn"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

