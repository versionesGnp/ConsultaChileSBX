forward
global type w_cuenta_corriente_contrato_isa from window
end type
type mdi_1 from mdiclient within w_cuenta_corriente_contrato_isa
end type
type mditbb_1 from tabbedbar within w_cuenta_corriente_contrato_isa
end type
type mdirbb_1 from ribbonbar within w_cuenta_corriente_contrato_isa
end type
type pb_ficha_sepul from commandbutton within w_cuenta_corriente_contrato_isa
end type
type pb_cliente_tercero from picturebutton within w_cuenta_corriente_contrato_isa
end type
type st_at_gestion from statictext within w_cuenta_corriente_contrato_isa
end type
type cb_documento from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_requerimiento from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_planimetria from commandbutton within w_cuenta_corriente_contrato_isa
end type
type st_help_abono from statictext within w_cuenta_corriente_contrato_isa
end type
type dw_abono from datawindow within w_cuenta_corriente_contrato_isa
end type
type cb_aval from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_consul_hist from commandbutton within w_cuenta_corriente_contrato_isa
end type
type st_pac from statictext within w_cuenta_corriente_contrato_isa
end type
type cb_reclamo from commandbutton within w_cuenta_corriente_contrato_isa
end type
type pb_datos_cliente from picturebutton within w_cuenta_corriente_contrato_isa
end type
type pb_ubicacion from picturebutton within w_cuenta_corriente_contrato_isa
end type
type cb_fallecidos from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_11 from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_cupones from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_convenio from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_est_cheque from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_cartera from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_3 from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_5 from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_1 from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_imprimir from commandbutton within w_cuenta_corriente_contrato_isa
end type
type dw_encabezado_cuenta_cte from datawindow within w_cuenta_corriente_contrato_isa
end type
type cb_cerrar from commandbutton within w_cuenta_corriente_contrato_isa
end type
type dw_estado_cta_cte from datawindow within w_cuenta_corriente_contrato_isa
end type
type cb_operacion from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_7 from commandbutton within w_cuenta_corriente_contrato_isa
end type
type cb_2 from commandbutton within w_cuenta_corriente_contrato_isa
end type
type dw_listado_cuenta_cte from datawindow within w_cuenta_corriente_contrato_isa
end type
type dw_listado_cuenta_cte_man from datawindow within w_cuenta_corriente_contrato_isa
end type
type dw_cons_docu_w from datawindow within w_cuenta_corriente_contrato_isa
end type
end forward

global type w_cuenta_corriente_contrato_isa from window
integer x = 192
integer y = 300
integer width = 3246
integer height = 2136
boolean titlebar = true
string title = "Cuenta Corriente CONTRATOS (base = C)"
string menuname = "m_menu_cuenta_corriente_isacruz"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = mdihelp!
long backcolor = 79741120
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
pb_ficha_sepul pb_ficha_sepul
pb_cliente_tercero pb_cliente_tercero
st_at_gestion st_at_gestion
cb_documento cb_documento
cb_requerimiento cb_requerimiento
cb_planimetria cb_planimetria
st_help_abono st_help_abono
dw_abono dw_abono
cb_aval cb_aval
cb_consul_hist cb_consul_hist
st_pac st_pac
cb_reclamo cb_reclamo
pb_datos_cliente pb_datos_cliente
pb_ubicacion pb_ubicacion
cb_fallecidos cb_fallecidos
cb_11 cb_11
cb_cupones cb_cupones
cb_convenio cb_convenio
cb_est_cheque cb_est_cheque
cb_cartera cb_cartera
cb_3 cb_3
cb_5 cb_5
cb_1 cb_1
cb_imprimir cb_imprimir
dw_encabezado_cuenta_cte dw_encabezado_cuenta_cte
cb_cerrar cb_cerrar
dw_estado_cta_cte dw_estado_cta_cte
cb_operacion cb_operacion
cb_7 cb_7
cb_2 cb_2
dw_listado_cuenta_cte dw_listado_cuenta_cte
dw_listado_cuenta_cte_man dw_listado_cuenta_cte_man
dw_cons_docu_w dw_cons_docu_w
end type
global w_cuenta_corriente_contrato_isa w_cuenta_corriente_contrato_isa

type variables
Long		il_count_print=0,il_abono
datetime	idt_fecha_base
String	is_cod_age
Long		il_status
end variables

on w_cuenta_corriente_contrato_isa.create
if this.MenuName = "m_menu_cuenta_corriente_isacruz" then this.MenuID = create m_menu_cuenta_corriente_isacruz
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.pb_ficha_sepul=create pb_ficha_sepul
this.pb_cliente_tercero=create pb_cliente_tercero
this.st_at_gestion=create st_at_gestion
this.cb_documento=create cb_documento
this.cb_requerimiento=create cb_requerimiento
this.cb_planimetria=create cb_planimetria
this.st_help_abono=create st_help_abono
this.dw_abono=create dw_abono
this.cb_aval=create cb_aval
this.cb_consul_hist=create cb_consul_hist
this.st_pac=create st_pac
this.cb_reclamo=create cb_reclamo
this.pb_datos_cliente=create pb_datos_cliente
this.pb_ubicacion=create pb_ubicacion
this.cb_fallecidos=create cb_fallecidos
this.cb_11=create cb_11
this.cb_cupones=create cb_cupones
this.cb_convenio=create cb_convenio
this.cb_est_cheque=create cb_est_cheque
this.cb_cartera=create cb_cartera
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cb_1=create cb_1
this.cb_imprimir=create cb_imprimir
this.dw_encabezado_cuenta_cte=create dw_encabezado_cuenta_cte
this.cb_cerrar=create cb_cerrar
this.dw_estado_cta_cte=create dw_estado_cta_cte
this.cb_operacion=create cb_operacion
this.cb_7=create cb_7
this.cb_2=create cb_2
this.dw_listado_cuenta_cte=create dw_listado_cuenta_cte
this.dw_listado_cuenta_cte_man=create dw_listado_cuenta_cte_man
this.dw_cons_docu_w=create dw_cons_docu_w
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1,&
this.pb_ficha_sepul,&
this.pb_cliente_tercero,&
this.st_at_gestion,&
this.cb_documento,&
this.cb_requerimiento,&
this.cb_planimetria,&
this.st_help_abono,&
this.dw_abono,&
this.cb_aval,&
this.cb_consul_hist,&
this.st_pac,&
this.cb_reclamo,&
this.pb_datos_cliente,&
this.pb_ubicacion,&
this.cb_fallecidos,&
this.cb_11,&
this.cb_cupones,&
this.cb_convenio,&
this.cb_est_cheque,&
this.cb_cartera,&
this.cb_3,&
this.cb_5,&
this.cb_1,&
this.cb_imprimir,&
this.dw_encabezado_cuenta_cte,&
this.cb_cerrar,&
this.dw_estado_cta_cte,&
this.cb_operacion,&
this.cb_7,&
this.cb_2,&
this.dw_listado_cuenta_cte,&
this.dw_listado_cuenta_cte_man,&
this.dw_cons_docu_w}
end on

on w_cuenta_corriente_contrato_isa.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
destroy(this.pb_ficha_sepul)
destroy(this.pb_cliente_tercero)
destroy(this.st_at_gestion)
destroy(this.cb_documento)
destroy(this.cb_requerimiento)
destroy(this.cb_planimetria)
destroy(this.st_help_abono)
destroy(this.dw_abono)
destroy(this.cb_aval)
destroy(this.cb_consul_hist)
destroy(this.st_pac)
destroy(this.cb_reclamo)
destroy(this.pb_datos_cliente)
destroy(this.pb_ubicacion)
destroy(this.cb_fallecidos)
destroy(this.cb_11)
destroy(this.cb_cupones)
destroy(this.cb_convenio)
destroy(this.cb_est_cheque)
destroy(this.cb_cartera)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cb_1)
destroy(this.cb_imprimir)
destroy(this.dw_encabezado_cuenta_cte)
destroy(this.cb_cerrar)
destroy(this.dw_estado_cta_cte)
destroy(this.cb_operacion)
destroy(this.cb_7)
destroy(this.cb_2)
destroy(this.dw_listado_cuenta_cte)
destroy(this.dw_listado_cuenta_cte_man)
destroy(this.dw_cons_docu_w)
end on

event open;Long		ll_count,ll_count_reg,ll_status,ll_count_cup,ll_count_reclamo,ll_count_hist,ll_rut_aval,ll_count_aval,ll_obj_id_estado,ll_correlativo,ll_cuotas_pie,ll_plazo,&
			ll_mora_original,ll_ctas_pag_m
String		ls_base_aux,ls_sector,ls_sepult,ls_pac, ls_nom_usuario,ls_tipo_cobro,ls_cod_usuario,ls_usuario, ls_nombre,ls_descrip_depto,ls_dv,ls_estado,ls_nombre_sol,&
			ls_string
Double	ll_rut,ll_monto_pie,ldb_valor_cuota,ldb_interes,ldb_gasto,ldb_uf_dia
Datetime	ldt_fecha_sol,ldt_fecha_prim

dw_encabezado_cuenta_cte.SetTransObject(SQLCA)
dw_abono.SetTransObject(SQLCA)
gf_centrar (w_cuenta_corriente_contrato_isa)
if gs_serie<>'' and gi_numero>0 and gs_base<>'' then
	DECLARE sp_cadena_mora_cta_cte PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
	EXECUTE sp_cadena_mora_cta_cte;
	
	DECLARE sp_actualizar_cuponeras_1 PROCEDURE FOR sp_actualizar_cuponeras_1(:gs_base,:gs_serie,:gi_numero);
	EXECUTE sp_actualizar_cuponeras_1;
	if dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)=0 then
		messagebox("Advertencia","No Registra Datos Contrato IsaCruz "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
		close(w_cuenta_corriente_contrato_isa)
	else
		
		il_abono				= dw_abono.retrieve(gs_base,gs_serie,gi_numero)
		if il_abono > 0 then
			st_help_abono.visible	= true
		else
			st_help_abono.visible	= false
		end if
		if dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')>0 or &
			len(dw_encabezado_cuenta_cte.getitemstring(1,'contrato_anexo_repacta'))>0 then
			cb_7.enabled	= true
		else
			cb_7.enabled	= true
		end if
		ls_sector			= trim(dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector'))
		ls_sepult			= trim(dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura'))
		SELECT	COUNT("WEB_RECLAMOS"."ID_RECLAMO")  
		INTO 		:ll_count_reclamo  
		FROM 		"WEB_RECLAMOS"  
		WHERE  ( "WEB_RECLAMOS"."SECTOR" = :ls_sector ) AND  
				 ( "WEB_RECLAMOS"."SEPULTURA" = :ls_sepult )   
		USING		sqlca;
		if ll_count_reclamo > 0 then
			m_menu_cuenta_corriente_isacruz.m_consultar.m_reclamosweb.enabled	= true
		else
			m_menu_cuenta_corriente_isacruz.m_consultar.m_reclamosweb.enabled	= false
		end if
		
		dw_estado_cta_cte.SetTransObject(SQLCA)
		dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
		dw_listado_cuenta_cte.SetTransObject(SQLCA)
		dw_listado_cuenta_cte.Retrieve(gs_serie, gi_numero,gs_base)
		dw_listado_cuenta_cte.visible	= true
		gs_ventana	= 'w_cuenta_corriente_contrato_isa'
		f_valida_objeto()	
		ls_pac							= f_buscar_pac(gs_base, gs_serie, gi_numero)
		st_pac.text						= ls_pac
		SELECT	"GEO_PRADO_CRESCATABLE"."FECHA_BASE",   
					"GEO_PRADO_CRESCATABLE"."COD_AGE",   
					"GEO_PRADO_CRESCATABLE"."STATUS"  
		INTO 		:idt_fecha_base,   
					:is_cod_age,   
					:il_status  
		FROM 		"GEO_PRADO_CRESCATABLE"  
		WHERE  ( "GEO_PRADO_CRESCATABLE"."CODIGO" = :gs_base ) AND  
				 ( "GEO_PRADO_CRESCATABLE"."SERIE" = :gs_serie ) AND  
				 ( "GEO_PRADO_CRESCATABLE"."NUMERO" = :gi_numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			cb_cartera.enabled	= True
		else
			cb_cartera.enabled	= False
		end if
		ll_obj_id_estado																				= dw_encabezado_cuenta_cte.GetItemNumber(1, 'cadena_objeto_id_estado')
		if ll_obj_id_estado=0 or isnull(ll_obj_id_estado) then
			m_menu_cuenta_corriente_isacruz.m_consultar.m_documentación.enabled	= false
		else
			m_menu_cuenta_corriente_isacruz.m_consultar.m_documentación.enabled	= true
		end if
		SELECT	Count("RECLAMO_SOLICITUD"."NUMERO_RECLAMO")
		INTO 		:ll_count_reclamo  
		FROM 	"RECLAMO_SOLICITUD"  
		WHERE ( "RECLAMO_SOLICITUD"."BASE" = :gs_base ) AND  
				  ( "RECLAMO_SOLICITUD"."SERIE" = :gs_serie ) AND  
				  ( "RECLAMO_SOLICITUD"."NUMERO" = :gi_numero ) AND  
				  ( "RECLAMO_SOLICITUD"."COD_ESTADO_REG" <> 'A' )   
		USING	sqlca;
		if ll_count_reclamo > 0 then
			m_menu_cuenta_corriente_isacruz.m_consultar.m_requerimientos.enabled	 =	true
		else
			m_menu_cuenta_corriente_isacruz.m_consultar.m_requerimientos.enabled	 =	false
		end if
		
		SELECT	COUNT("CUPONERAS"."NUMERO")  
		INTO 		:ll_count_cup  
		FROM 		"CUPONERAS",   
					"CUPONERAS_DETALLE"  
		WHERE  ( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
				 ( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
				 ( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
				 ( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
				 (("CUPONERAS"."BASE" = :gs_base ) AND  
				 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
				 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
				 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND  
				 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) )   
		USING		sqlca;
		if ll_count_cup > 0 and ( gs_depto = 'E' or gs_depto = 'I' or gs_depto = 'P' or (gs_depto = 'O' and gs_digita='1')) then
			m_menu_cuenta_corriente_isacruz.m_imprimircuponera.enabled	= true
		else
			m_menu_cuenta_corriente_isacruz.m_imprimircuponera.enabled	= false
		end if
		SELECT	COUNT("DOCUMENTOS"."FOLIO")  
		INTO 		:ll_count  
		FROM 		"DOCUMENTOS",   
					"INGRESO"  
		WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
				 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
				 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
				 ( "INGRESO"."BASE" = :gs_base ) AND  
				 ( "INGRESO"."SERIE" = :gs_serie ) AND  
				 ( "INGRESO"."CONTRATO" = :gi_numero ) AND
				 ( "DOCUMENTOS"."ESTADO_CH" = 'P' OR "DOCUMENTOS"."ESTADO_CH" = 'T' ) AND
				 ( "DOCUMENTOS"."COD_PAGO" = 'CH');
		if ll_count>0 then
			cb_est_cheque.enabled	= true
		else
			cb_est_cheque.enabled	= false
		end if	
		ll_status						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_status_geo")
		if ll_status>0 then
			pb_ubicacion.enabled		= true
			m_menu_cuenta_corriente_isacruz.m_consultar.m_geo-referenciación.enabled	= true
		else
			pb_ubicacion.enabled		= false
			m_menu_cuenta_corriente_isacruz.m_consultar.m_geo-referenciación.enabled	= false
		end if
		ll_rut_aval						= dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_rut_aval')
		SELECT	COUNT("AVAL"."RUT")  
		INTO 		:ll_count_aval  
		FROM 		"AVAL"  
		WHERE 	"AVAL"."RUT" = :ll_rut_aval   
		USING		sqlca;
		if ll_count_aval > 0 then
			cb_aval.enabled			= true
			m_menu_cuenta_corriente_isacruz.m_consultar.m_aval.enabled						= true
		else
			cb_aval.enabled			= true
			m_menu_cuenta_corriente_isacruz.m_consultar.m_aval.enabled						= false
		end if

		SELECT	COUNT("DETALLE_CONVENIO_PROTESTO"."BASE_ORIGINAL")  
		INTO 		:ll_count_reg  
		FROM 		"DETALLE_CONVENIO_PROTESTO"  
		WHERE  ( "DETALLE_CONVENIO_PROTESTO"."BASE_ORIGINAL" = :gs_base ) AND  
				 ( "DETALLE_CONVENIO_PROTESTO"."SERIE_ORIGINAL" = :gs_serie ) AND  
				 ( "DETALLE_CONVENIO_PROTESTO"."NUMERO_ORIGINAL" = :gi_numero )   
		USING		sqlca;
		if ll_count_reg>0 then
			cb_convenio.enabled		= true
		else
			cb_convenio.enabled		= false
		end if
		if cb_7.enabled=true then
			m_menu_cuenta_corriente_isacruz.m_mantenedor.m_cuotascrédito.enabled			= true
		else
			m_menu_cuenta_corriente_isacruz.m_mantenedor.m_cuotascrédito.enabled			= false
		end if
//		if cb_cartera.enabled=True then
//			m_menu_cuenta_corriente_isacruz.m_consultar.m_carterarescatable.enabled		= true
//		else
//			m_menu_cuenta_corriente_isacruz.m_consultar.m_carterarescatable.enabled		= false
//		end if
		if cb_est_cheque.enabled=true then
			m_menu_cuenta_corriente_isacruz.m_consultar.m_estadocheques.enabled			= true
		else
			m_menu_cuenta_corriente_isacruz.m_consultar.m_estadocheques.enabled			= false
		end if
		if cb_convenio.enabled=true then
			m_menu_cuenta_corriente_isacruz.m_consultar.m_conveniopagocheuqe.enabled	= true
		else
			m_menu_cuenta_corriente_isacruz.m_consultar.m_conveniopagocheuqe.enabled	= false
		end if
		if f_fallecido(gs_serie, gi_numero, gs_base)>0 then
			cb_fallecidos.enabled	=  true
			m_menu_cuenta_corriente_isacruz.m_consultar.m_fallecidos.enabled				= true
		else
			cb_fallecidos.enabled	=  true
			m_menu_cuenta_corriente_isacruz.m_consultar.m_fallecidos.enabled				= false
		end if
		if f_regitra_sepul(gs_base,gs_serie, gi_numero )<>'' then
			cb_planimetria.enabled	=  true
			m_menu_cuenta_corriente_isacruz.m_consultar.m_planimetria.enabled				= true
		else
			cb_planimetria.enabled	=  true
			m_menu_cuenta_corriente_isacruz.m_consultar.m_planimetria.enabled				= false
		end if
		if gs_depto='I' then
			m_menu_cuenta_corriente_isacruz.m_mantenedor.m_actualizarmora.visible		= true
			m_menu_cuenta_corriente_isacruz.m_mantenedor.m_-6.visible						= true
		else
			m_menu_cuenta_corriente_isacruz.m_mantenedor.m_actualizarmora.visible		= false
			m_menu_cuenta_corriente_isacruz.m_mantenedor.m_-6.visible						= false
		end if
		SELECT	Count("PAGO_HISTORICO"."RUT_CLIENTE")  
		INTO 		:ll_count_hist  
		FROM 		"PAGO_HISTORICO"  
		WHERE  ( "PAGO_HISTORICO"."RUT_CLIENTE" = :gi_rut ) AND  
				 ( "PAGO_HISTORICO"."CORRELATIVO" = :gs_serie )   
		USING		sqlca;
		if ll_count_hist > 0 then
			m_menu_cuenta_corriente_isacruz.m_consultar.m_pagoshistórico.enabled			= true
			cb_consul_hist.enabled	= true
		else
			m_menu_cuenta_corriente_isacruz.m_consultar.m_pagoshistórico.enabled			= false
			cb_consul_hist.enabled	= false
		end if
		SELECT	"CADENA"."EJECUTIVO_CYBER",	"ENCARGADOS"."NOMBRE",		"CODIGO_DEPTO"."DESCRIPCION"  
		INTO 		:ls_usuario,   							:ls_nombre,   						:ls_descrip_depto  
		FROM 	"CADENA",	"CODIGO_DEPTO", 	"ENCARGADOS"  
		WHERE 	( "CADENA"."EJECUTIVO_CYBER" = "ENCARGADOS"."CODIGO_USUARIO" (+)) and  
					( "ENCARGADOS"."DEPTO" = "CODIGO_DEPTO"."CODIGO" (+)) and  
					( ( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero ) ) 
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ls_descrip_depto) then ls_nombre = ls_usuario
			if isnull(ls_nombre) then ls_nombre = ''
			if isnull(ls_descrip_depto) then ls_descrip_depto = ''
			st_at_gestion.text		= 'EJEC. '+ ls_descrip_depto + ': ' + ls_usuario +' - '+ls_nombre
		else
			st_at_gestion.text		= ''
		end if

		if gi_rut > 0 then 
			if isvalid(w_aviso_mensajes) then close(w_aviso_mensajes)
			if not isvalid(w_ingreso_gestion_ejecutivo_terreno) or not isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
				SELECT	COUNT("MENSAJES"."FECHA_CREACION")  
				INTO 		:ll_count  
				FROM 		"MENSAJES"  
				WHERE  ( "MENSAJES"."RUT" = :gi_rut ) and
						 ( "MENSAJES"."ESTADO_GESTION" = 'A' ) AND
						 ( "MENSAJES"."SW_MENSAJE" = 'R' ) and
						 ( "MENSAJES"."FECHA_FIN" > :gdt_fec_sistema )
				USING		sqlca;
				if ll_count>0 then
					OpenWithParm(w_aviso_mensajes, "R")
				else
					SELECT	COUNT("MENSAJES"."FECHA_CREACION")  
					INTO 		:ll_count  
					FROM 		"MENSAJES"  
					WHERE  ( "MENSAJES"."BASE" = :gs_base ) and
							 ( "MENSAJES"."SERIE" = :gs_serie ) and
							 ( "MENSAJES"."NUMERO" = :gi_numero ) and
							 ( "MENSAJES"."ESTADO_GESTION" = 'A' ) AND
							 ( "MENSAJES"."SW_MENSAJE" = 'C' ) and
							 ( "MENSAJES"."FECHA_FIN" > :gdt_fec_sistema )
					USING		sqlca;
					if ll_count>0 then
						OpenWithParm(w_aviso_mensajes, "C")
					end if
				end if
			end if
		end if
		if today() <> date(gdt_fec_sistema) then
			messagebox("Advertencia","Debe Revisar Fecha del Computador NO Corresponde al día de Hoy "+string(gdt_fec_sistema,'dd/mm/yyyy'))
		end if
		f_validar_mensaje_mod_antece(gs_base,gs_serie,gi_numero,gi_rut)
		
		ll_ctas_pag_m			= dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_m')
		SELECT 	"SOL_ESTATUS"."CORRELATIVO",		"SOL_COMPROMISO_PAGO"."RUT_TITULAR",	"SOL_COMPROMISO_PAGO"."DV",		"SOL_COMPROMISO_PAGO"."FECHA_SOLICITUD",		"SOL_ESTATUS"."ESTADO_REG",	"SOL_COMPROMISO_PAGO"."NOMBRE_CLIENTE",	"SOL_COMPROMISO_PAGO"."FECHA_PRIM_MANT",	"SOL_COMPROMISO_PAGO"."MONTO_PIE_MANT",	"SOL_COMPROMISO_PAGO"."CUOTAS_PIE_MANT",	"SOL_COMPROMISO_PAGO"."PLAZO_MANT",	"SOL_COMPROMISO_PAGO"."MONTO_CUOTA_MANT",	"SOL_COMPROMISO_PAGO"."MORA_PAGAR_MANT",		"SOL_COMPROMISO_PAGO"."GASTO_PAGAR_MANT",	"SOL_COMPROMISO_PAGO"."UF_DIA",	"SOL_COMPROMISO_PAGO"."CUOTAS_MORA_ORIGINAL"
		INTO 		:ll_correlativo,								:ll_rut,													:ls_dv,										:ldt_fecha_sol,													:ls_estado,								:ls_nombre_sol,											:ldt_fecha_prim,												:ll_monto_pie,													:ll_cuotas_pie,													:ll_plazo,													:ldb_valor_cuota,													:ldb_interes,														:ldb_gasto,															:ldb_uf_dia,										:ll_mora_original
		FROM 	"SOL_COMPROMISO_PAGO",   	"SOL_ESTATUS"  
		WHERE 	( "SOL_COMPROMISO_PAGO"."BASE" = "SOL_ESTATUS"."BASE" ) and  
					( "SOL_COMPROMISO_PAGO"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
					( "SOL_COMPROMISO_PAGO"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
					( "SOL_COMPROMISO_PAGO"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
					( ( "SOL_COMPROMISO_PAGO"."BASE" = :gs_base ) AND  
					( "SOL_COMPROMISO_PAGO"."SERIE" = :gs_serie ) AND  
					( "SOL_COMPROMISO_PAGO"."NUMERO" = :gi_numero ) AND  
					( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '27' ) AND  
					( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
					( "SOL_COMPROMISO_PAGO"."CORRELATIVO" = (	SELECT 	"SOL_ESTATUS"."CORRELATIVO" 
																						FROM 	"SOL_ESTATUS" 
																						WHERE 	( "SOL_ESTATUS"."BASE" = :gs_base ) AND 
																									( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND 
																									( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND
																									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '27' ) AND 
																									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) ) )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ldb_interes) then ldb_interes=0
			if isnull(ldb_gasto) then ldb_gasto=0
			ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_rut)+'~t'+string(ll_correlativo)+'~t'+ls_dv+'~t'+ls_estado+'~t'+'27'+'~t'+ls_nombre_sol+'~t'+string(ldt_fecha_prim,'dd/mm/yyyy')+'~t'+string(ll_cuotas_pie)+'~t'+string(ll_monto_pie)+'~t'+string(ldb_uf_dia)+'~t'+ string(ldb_valor_cuota)+'~t'+string(ll_mora_original)+'~t'+string(ldb_interes)+'~t'+string(ldb_gasto)+'~t'+string(ll_ctas_pag_m)+'~t'+string(ll_plazo)+'~t'+string(ldt_fecha_sol,'dd/mm/yyyy')
			openwithparm(w_detalle_compromiso_pago,ls_string)
		end if			
	end if
else
	close(w_cuenta_corriente_contrato_isa)
end if
end event

event close;if isvalid(w_plano_sector_parque) then w_plano_sector_parque.dw_plano_sector_parque.enabled	= true
if gs_serie<>'' and gi_numero>0 and gs_base<>'' and dw_encabezado_cuenta_cte.rowcount()>0 then
	gs_base 					= 'C'
	gs_serie 					= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_serie_c")
	gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "contrato_nro_contrato")
	gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
	gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
	gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
	gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
	gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
	gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
	gl_cod_parque_cta	= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
	INSERT INTO 	"LOG_CONSULTA"  
					( 	"BASE",   	"SERIE",   	"NUMERO",	"FECHA",   				"RUT_CLIENTE",	"USUARIO",	"NRO_PRINT" ,		"TCP_IP",		"USUARIO_WIN")  
	VALUES 		( 	:gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,		:gi_rut,   		:gs_user,	:il_count_print,	:gs_tcp_ip,		:gs_user_maq )  
	USING				sqlca;
	if sqlca.sqlcode=0 then
		commit;
	else
		rollback;
	end if
end if
f_limpiar_caja_de_ctacte()
end event

event mousemove;if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type mdi_1 from mdiclient within w_cuenta_corriente_contrato_isa
long BackColor=268435456
end type

type mditbb_1 from tabbedbar within w_cuenta_corriente_contrato_isa
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_cuenta_corriente_contrato_isa
int X=0
int Y=0
int Width=0
int Height=596
end type

type pb_ficha_sepul from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 2839
integer y = 2048
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;String		ls_string,ls_boton_reclamo,ls_area,ls_sector,ls_sepultura
long		ll_parque

gs_base					= 'C' //dw_encabezado_cuenta_cte.GetItemString(1, 'cadena_codigo')
gs_serie					= dw_encabezado_cuenta_cte.GetItemString(1, 'contrato_serie_c')
gi_numero				= dw_encabezado_cuenta_cte.GetItemNumber(1, 'contrato_nro_contrato')
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
ll_parque					= dw_estado_cta_cte.GetItemNumber(1, "cadena_cod_parque")
ls_sector					= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_sector")
ls_sepultura				= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_sepultura")
if gi_numero > 0 and not isnull(ls_sector) then
	ls_string		= gs_base +'~t'+ gs_serie +'~t'+ string(gi_numero)+'~t'+ string(gi_rut) +'~t'+ gs_dv +'~t'+string(ll_parque) +'~t'+ ls_area +'~t'+ ls_sector +'~t'+ ls_sepultura +'~t'+ 'O'
	if isvalid(w_ingreso_ficha_sepultacion) then close(w_ingreso_ficha_sepultacion)
	OpenWithParm (w_ingreso_ficha_sepultacion,ls_string)
end if
end event

type pb_cliente_tercero from picturebutton within w_cuenta_corriente_contrato_isa
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2094
integer y = 1964
integer width = 114
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Custom020!"
alignment htextalign = left!
end type

event clicked;String		ls_string

gs_base			= 'C'
gs_serie			= dw_encabezado_cuenta_cte.GetItemString(1, 'contrato_serie_c')
gi_numero		= dw_encabezado_cuenta_cte.GetItemNumber(1, 'contrato_nro_contrato')
if gi_numero > 0 then
	ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	if isvalid(w_listado_terceros_individual) then close(w_listado_terceros_individual)
	openwithparm(w_listado_terceros_individual,ls_string)
end if
end event

type st_at_gestion from statictext within w_cuenta_corriente_contrato_isa
integer x = 78
integer y = 112
integer width = 3017
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_documento from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 1458
integer y = 2104
integer width = 288
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "documento"
end type

event clicked;long ret,ll_obj_id,ll_obj_id_estado,ll_res

ll_res						= messagebox("Advertencia","Recuerde Desbloquear Ventana Emergente (pop-up) en su Navegador de Internet",Exclamation!,YesNo!,2)
if ll_res=1 then
	ll_obj_id				= dw_encabezado_cuenta_cte.GetItemNumber(1, 'cadena_objeto_id')
	ll_obj_id_estado	= dw_encabezado_cuenta_cte.GetItemNumber(1, 'cadena_objeto_id_estado')
	if not isnull(ll_obj_id) then
		Inet  iinet_base
		ret = GetContextService("Internet", iinet_base)
		if ret = -1 then
			messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
			return
		end if
		ret = iinet_base.HyperlinkToURL("http://sig.nuestrosparques.cl/?coid="+string(ll_obj_id))
		if ret = -1 then
			messagebox('No Existe','No existe Documentación Asociada al Contrato.',stopsign!)
			return
		end if
	end if
end if
end event

type cb_requerimiento from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 1819
integer y = 2120
integer width = 343
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "requerimiento"
end type

event clicked;String		ls_string

gs_base			= dw_encabezado_cuenta_cte.GetItemString(1, 'cadena_codigo')
gs_serie			= dw_encabezado_cuenta_cte.GetItemString(1, 'contrato_serie_c')
gi_numero		= dw_encabezado_cuenta_cte.GetItemNumber(1, 'contrato_nro_contrato')
if gi_numero > 0 then
	ls_string		= gs_base +'~t'+ gs_serie +'~t'+ string(gi_numero)
	if isvalid(w_detalle_gestion_por_contrato) then close(w_detalle_gestion_por_contrato)
	OpenWithParm (w_detalle_gestion_por_contrato,ls_string)
end if
end event

type cb_planimetria from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 1161
integer y = 2096
integer width = 279
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "planimetria"
end type

event clicked;long 		ret,ll_cod_parque
String		ls_sector,ls_sepultura
Inet 		iinet_base

ll_cod_parque					= dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
ls_sector							= dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
ls_sepultura						= dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
ret = GetContextService("Internet", iinet_base)
if ret = -1 then
	messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
	return
end if
ret 								= iinet_base.HyperlinkToURL("https://mapas.nuestrosparques.cl/?parque="+string(ll_cod_parque)+"&sepultura="+ls_sepultura+"&sector="+ls_sector)
if ret = -1 then
	messagebox('No Existe','No existe el plano del sector buscado.',stopsign!)
	return
end if

end event

type st_help_abono from statictext within w_cuenta_corriente_contrato_isa
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2574
integer y = 572
integer width = 530
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 28573695
string text = "Cliente Posee ABONO"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type dw_abono from datawindow within w_cuenta_corriente_contrato_isa
event ue_mousemove pbm_mousemove
integer x = 2583
integer y = 636
integer width = 517
integer height = 76
integer taborder = 20
string title = "none"
string dataobject = "dw_suma_monto_abono_por_ctto_ctacte"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_help_abono.visible	= false
end event

type cb_aval from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 837
integer y = 2104
integer width = 265
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aval"
end type

event clicked;gs_base 					= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_serie_c")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "contrato_nro_contrato")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_rut_aval')>0 then 
	if isvalid(w_aval) then close(w_aval)
	OpenWithParm(w_aval, STRING(dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_rut_aval')))
else
	messagebox("Advertencia","No Registra Aval")
end if
end event

type cb_consul_hist from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 105
integer y = 2124
integer width = 530
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consul Hist"
end type

event clicked;String	ls_string
Long	ll_cod_parque
if isvalid(w_consultar_historico_retiro) then close(w_consultar_historico_retiro)
ll_cod_parque	= dw_estado_cta_cte.getitemnumber(1,'cadena_cod_parque')
ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_cod_parque)
openwithparm(w_consultar_historico_retiro,ls_string)
end event

type st_pac from statictext within w_cuenta_corriente_contrato_isa
integer x = 73
integer y = 1252
integer width = 2267
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_reclamo from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 2555
integer y = 1952
integer width = 247
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reclamos"
end type

event clicked;String	ls_string,ls_sector,ls_sepult,ls_nom,ls_ap_pat,ls_ap_mat,ls_nombre
Long		ll_cod_parque
if isvalid(w_lista_web_reclamos) then close(w_lista_web_reclamos)
ls_sector		= trim(dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector'))
ls_sepult		= trim(dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura'))
ls_nom			= trim(dw_encabezado_cuenta_cte.getitemstring(1,'cliente_nombre'))
ls_ap_pat		= trim(dw_encabezado_cuenta_cte.getitemstring(1,'cliente_a_paterno'))
ls_ap_mat		= trim(dw_encabezado_cuenta_cte.getitemstring(1,'cliente_a_materno'))
ll_cod_parque	= dw_estado_cta_cte.getitemnumber(1,'cadena_cod_parque')
ls_nombre		= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
ls_string		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+ls_sector+'~t'+ls_sepult+'~t'+ls_nombre+'~t'+string(ll_cod_parque)
openwithparm(w_lista_web_reclamos,ls_string)
end event

type pb_datos_cliente from picturebutton within w_cuenta_corriente_contrato_isa
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2437
integer y = 1944
integer width = 114
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "datos_cliente.bmp"
string disabledname = "datos_cliente_no.bmp"
alignment htextalign = left!
end type

event clicked;gs_base 					= 'C'
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_serie_c")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "contrato_nro_contrato")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if not isnull(gs_base) and gi_numero>0 and gi_rut>0 then
	if isvalid(w_datos_cliente) then close(w_datos_cliente)
	Open(w_datos_cliente)
end if
end event

type pb_ubicacion from picturebutton within w_cuenta_corriente_contrato_isa
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1947
integer y = 1956
integer width = 114
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ubicacion.bmp"
string disabledname = "ubicacion_no.bmp"
alignment htextalign = left!
end type

event clicked;long ret
Inet  iinet_base
ret = GetContextService("Internet", iinet_base)
if ret = -1 then
	messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
	return
end if
if gs_conexion	= "Parque El Prado" then
	ret = iinet_base.HyperlinkToURL("http://intra2.nuestrosparques.cl/geomod/dbutil/pw1.php?barra="+gs_base+gs_serie+string(gi_numero))
else
	ret = iinet_base.HyperlinkToURL("http://intra2.nuestrosparques.cl/geoforesta/dbutil/pw1.php?barra="+gs_base+gs_serie+string(gi_numero))
end if
if ret = -1 then
	messagebox('No Existe','No existe el plano del sector buscado.',stopsign!)
	return
end if

end event

type cb_fallecidos from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 1925
integer y = 2028
integer width = 251
integer height = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fallecidos"
end type

event clicked;if dw_encabezado_cuenta_cte.rowcount()>0 then
	gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
	gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
	gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
	gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
	gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
	gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
	gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
	gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
	gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
	gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		if isvalid(w_listado_fallecidos) then close(w_listado_fallecidos)
		Open(w_listado_fallecidos)
	end if
end if
end event

type cb_11 from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 2354
integer y = 2032
integer width = 297
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Dato&s Ctto"
end type

event clicked;gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 and gi_rut>0 and dw_encabezado_cuenta_cte.rowcount()>0 then
	CHOOSE CASE gs_base
		CASE "O","U","M" // Oferta
			if isvalid(w_datos_contrato_oferta) then close(w_datos_contrato_oferta)
			Open(w_datos_contrato_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_datos_contrato_liberador) then close(w_datos_contrato_liberador)
			Open(w_datos_contrato_liberador)
		CASE "P" // Pagaré
			if isvalid(w_datos_contrato_pagare) then close(w_datos_contrato_pagare)
			Open(w_datos_contrato_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_datos_contrato_isa) then close(w_datos_contrato_isa)
			Open(w_datos_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_datos_contrato_derecho) then close(w_datos_contrato_derecho)
			Open(w_datos_contrato_derecho)	
		CASE "R" // Reprogramacion Cta. Mant.
			if isvalid(w_datos_contrato_reprogramacion_cta_mant) then close(w_datos_contrato_reprogramacion_cta_mant)
			open(w_datos_contrato_reprogramacion_cta_mant)
		CASE "A" // Aumento Capacidad
			if isvalid(w_datos_contrato_aumento_capacidad) then close(w_datos_contrato_aumento_capacidad)
			open(w_datos_contrato_aumento_capacidad)
	END CHOOSE
end if
end event

type cb_cupones from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 1664
integer y = 1944
integer width = 251
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cupo&nes"
end type

event clicked;gs_base 					= 'C'
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_serie_c")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "contrato_nro_contrato")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_ver_cupones) then close(w_ver_cupones)
open(w_ver_cupones)
end event

type cb_convenio from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 1326
integer y = 2032
integer width = 590
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Con&venio Pago Cheque"
end type

event clicked;String	ls_string
gs_base 					= 'C'
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_serie_c")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "contrato_nro_contrato")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_detalle_convenio_pago_cheque_protesto) then close(w_detalle_convenio_pago_cheque_protesto)
ls_string				= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
openwithparm(w_detalle_convenio_pago_cheque_protesto,ls_string)
end event

type cb_est_cheque from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 1216
integer y = 1944
integer width = 443
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Estado C&heque"
end type

event clicked;String	ls_string
gs_base 					= 'C'
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_serie_c")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "contrato_nro_contrato")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if gi_rut>0 then
	ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	if isvalid(w_consultar_estado_de_cheques) then close(w_consultar_estado_de_cheques)
	openwithparm(w_consultar_estado_de_cheques,ls_string)
end if
end event

type cb_cartera from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 837
integer y = 2032
integer width = 485
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cartera &Rescatable"
end type

event clicked;gs_base 					= 'C'
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_serie_c")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "contrato_nro_contrato")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_cartera_crescatable) then close(w_cartera_crescatable)
open(w_cartera_crescatable)
end event

type cb_3 from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 2094
integer y = 2028
integer width = 251
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar"
end type

event clicked;open(w_actuliza_pagos_contrato_isa)
end event

type cb_5 from commandbutton within w_cuenta_corriente_contrato_isa
event clicked pbm_bnclicked
boolean visible = false
integer x = 46
integer y = 1944
integer width = 251
integer height = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&obranza"
end type

event clicked;gs_base 					= 'C'
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_serie_c")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "contrato_nro_contrato")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
open(w_cobranza_historica)
end event

type cb_1 from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 46
integer y = 2032
integer width = 251
integer height = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Total"
end type

event clicked;
dw_listado_cuenta_cte.visible	= true

end event

type cb_imprimir from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 2094
integer y = 1940
integer width = 251
integer height = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;gs_datawindow_a_imprimir	= 'd_rep_impresion_ctta_cte_contrato_isa'
if isvalid(w_impresion_previa_de_ctta_ctes) then close(w_impresion_previa_de_ctta_ctes)
Open(w_impresion_previa_de_ctta_ctes)
il_count_print ++

end event

type dw_encabezado_cuenta_cte from datawindow within w_cuenta_corriente_contrato_isa
event ue_mousemove pbm_mousemove
integer x = 64
integer y = 180
integer width = 3090
integer height = 1072
integer taborder = 10
string dataobject = "d_encabezado_cuenta_cte_contrato_isa"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

event doubleclicked;String	ls_columna,ls_string
ls_columna	= dwo.name
if ls_columna='contrato_nro_reprog_mant' or ls_columna='t_12' then
	gs_base 					= 'C'
	gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_serie_c")
	gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "contrato_nro_contrato")
	gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
	gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
	gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
	gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
	gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
	gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
	gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
	if isvalid(w_detalle_de_reprogramaciones_mantencion) then close(w_detalle_de_reprogramaciones_mantencion)
	if dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_nro_reprog_mant')>0 then
		ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
		OpenWithParm(w_detalle_de_reprogramaciones_mantencion,ls_string)
	end if
end if
end event

type cb_cerrar from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 2830
integer y = 1944
integer width = 293
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_cuenta_corriente_contrato_isa)
end event

type dw_estado_cta_cte from datawindow within w_cuenta_corriente_contrato_isa
event ue_mousemove pbm_mousemove
integer x = 2491
integer y = 1288
integer width = 718
integer height = 624
string dataobject = "d_estado_cta_cte_contrato_isa"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type cb_operacion from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 727
integer y = 1944
integer width = 485
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Op&eraciones"
end type

event clicked;String	ls_string, ls_nombre, ls_ap_pat,ls_ap_mat,ls_dv, ls_nom_comp, ls_rut_comp
Long		ll_rut
gs_base 					= 'C'
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_serie_c")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "contrato_nro_contrato")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
ls_nombre				= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_nombre')
ls_ap_pat				= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_a_paterno')
ls_ap_mat				= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_a_materno')
ll_rut					= dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
ls_dv						= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_dv')
ls_nom_comp				= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
ls_rut_comp				= string(ll_rut,'###,###,###')+' - '+ls_dv
ls_string				= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+ls_nom_comp+'~t'+ls_rut_comp
if isvalid(w_ingreso_solicitudes) then close(w_ingreso_solicitudes)
OpenWithParm(w_ingreso_solicitudes,ls_string)

end event

type cb_7 from commandbutton within w_cuenta_corriente_contrato_isa
event clicked pbm_bnclicked
boolean visible = false
integer x = 302
integer y = 2032
integer width = 530
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuotas &Mantención"
end type

event clicked;gs_base 					= 'C'
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_serie_c")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "contrato_nro_contrato")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_boletas_cuotas) then close(w_boletas_cuotas)
open(w_boletas_cuotas)

end event

type cb_2 from commandbutton within w_cuenta_corriente_contrato_isa
boolean visible = false
integer x = 302
integer y = 1944
integer width = 421
integer height = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ma&ntención"
end type

event clicked;gs_base 					= 'C'
gs_serie 				= dw_encabezado_cuenta_cte.GetItemString(1, "contrato_serie_c")
gi_numero 				= dw_encabezado_cuenta_cte.GetItemNumber(1, "contrato_nro_contrato")
gi_rut 					= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno	= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres				= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv						= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado				= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta		= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
dw_listado_cuenta_cte_man.SetTransObject(SQLCA)
dw_listado_cuenta_cte_man.Retrieve(gs_serie, gi_numero,gs_base)
dw_listado_cuenta_cte_man.visible	= true
dw_cons_docu_w.visible					= false
end event

type dw_listado_cuenta_cte from datawindow within w_cuenta_corriente_contrato_isa
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1316
integer width = 2427
integer height = 592
integer taborder = 40
boolean titlebar = true
string title = "Detalle Cta Cte Total"
string dataobject = "d_listado_cuenta_cte"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

event doubleclicked;long 		folio1
string 	tcom1

if getrow() > 0 then
	folio1 	= getitemnumber(getrow(), "folio")
	tcom1 	= getitemstring(getrow(), "tipo_cob")
	dw_cons_docu_w.settransobject(sqlca)
	dw_cons_docu_w.retrieve(folio1, tcom1)
	dw_cons_docu_w.visible	= true
end if

end event

event clicked;String		ls_columna,ls_tipo_cob,ls_sociedad,ls_link,ls_tipo_dte,ls_rut_empresa,ls_cod_caja,ls_url
Double	ll_folio
long		ret,ll_res1,ll_row
datetime	ldt_fecha_pago
Inet		iinet_base

ls_columna			= dwo.name
ll_row					= row
if ls_columna='folio' then
	ll_folio			= dw_listado_cuenta_cte.getitemnumber(ll_row,'folio')
	ls_tipo_cob		= dw_listado_cuenta_cte.getitemstring(ll_row,'tipo_cob')
	ls_sociedad		= dw_listado_cuenta_cte.getitemstring(ll_row,'ingreso_viene_de')
	ldt_fecha_pago	= dw_listado_cuenta_cte.getitemdatetime(ll_row,'fecha_pago')
	ls_cod_caja		= dw_listado_cuenta_cte.getitemstring(ll_row,'ingreso_cod_caja')
	
	if ls_tipo_cob = 'BE' or ls_tipo_cob = 'BA' or ls_tipo_cob = 'FA' or ls_tipo_cob = 'FE' then  
		SELECT 	"ELECTRONICA_FB_TIPO"."TIPO_DTE"  
		INTO 		:ls_tipo_dte  
		FROM 	"ELECTRONICA_FB_TIPO"  
		WHERE 	"ELECTRONICA_FB_TIPO"."TIPO_DOCUMENTO" = :ls_tipo_cob  
		USING	sqlca;
		
		if ls_sociedad='CL02' then
			SELECT 	"MEMBRETE_EMPRESA"."RUT_SIN_GUION"  
			INTO 		:ls_rut_empresa  
			FROM 	"MEMBRETE_EMPRESA"  
			WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = 1   ;

		elseif ls_sociedad='CL03' then
			SELECT 	"MEMBRETE_EMPRESA"."RUT_SIN_GUION"  
			INTO 		:ls_rut_empresa  
			FROM 	"MEMBRETE_EMPRESA"  
			WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = 11   ;
		elseif ls_sociedad='CL04' then
			SELECT 	"MEMBRETE_EMPRESA"."RUT_SIN_GUION"  
			INTO 		:ls_rut_empresa  
			FROM 	"MEMBRETE_EMPRESA"  
			WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = 99   ;
		end if
		ll_res1	= messagebox("Advertencia","Desea Visualizar Documento Electrónico Folio "+ls_tipo_cob+'-'+string(ll_folio),Exclamation!,YesNo!,2) 
		if ll_res1	= 1 then
			SELECT 	"LOG_DTE_PDF"."URL_DOCUMENTO"  
			INTO 		:ls_url  
			FROM 	"LOG_DTE_PDF"  
			WHERE 	( "LOG_DTE_PDF"."BASE" = :gs_base ) AND  
						( "LOG_DTE_PDF"."SERIE" = :gs_serie ) AND  
						( "LOG_DTE_PDF"."NUMERO" = :gi_numero ) AND  
						( "LOG_DTE_PDF"."TIPO_COB" = :ls_tipo_cob ) AND  
						( "LOG_DTE_PDF"."FOLIO" = :ll_folio ) AND  
						( "LOG_DTE_PDF"."FECHA_PAGO" = :ldt_fecha_pago ) AND  
						( "LOG_DTE_PDF"."COD_CAJA" = :ls_cod_caja )  
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				
				ret = GetContextService("Internet", iinet_base)
				if ret = -1 then
					messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
					return
				end if
	//			ls_link		= 'http://intra2.nuestrosparques.cl/DTE_PDF/?folio='+string(50)+'&'+'tipo_doc='+string(ls_tipo_dte)+'&'+'sociedad='+string(ls_rut_empresa)+'&'+'env=testing'
	//			ls_link		= 'http://intra2.nuestrosparques.cl/DTE_PDF/?folio='+string(ll_folio)+'&'+'tipo_doc='+string(ls_tipo_dte)+'&'+'sociedad='+string(ls_rut_empresa)+'&'+'env=production'
	//			messagebox("ls_link",ls_link)
				ret			= iinet_base.HyperlinkToURL(ls_url)
				if ret = -1 then
					messagebox('No Existe','No existe Documento Electrónico',stopsign!)
					return
				end if
			end if
		end if
		
		
		//ls_link		= 'http://intra2.nuestrosparques.cl/DTE_PDF/?folio='+string(ll_folio)+'&'+'tipo_doc='+string(ls_tipo_dte)+'&'+'sociedad='+string(ls_rut_empresa)+'&'+'env=production'
//		ls_link		= 'http://intra2.nuestrosparques.cl/DTE_PDF/?folio='+string(50)+'&'+'tipo_doc='+string(ls_tipo_dte)+'&'+'sociedad='+string(ls_rut_empresa)+'&'+'env=testing'
//		messagebox("ls_link",ls_link)
//		http://intra2.nuestrosparques.cl/DTE_PDF/?folio=2&tipo_doc=39&sociedad=968440004&env=testing		Qas
//		http://intra2.nuestrosparques.cl/DTE_PDF/?folio=2&tipo_doc=39&sociedad=968440004&env=production	Produccion
//		ret			= iinet_base.HyperlinkToURL(ls_link)
//		ret			= iinet_base.HyperlinkToURL("http://"+is_ip+"/nusoap/cpagos.php?conexion=RF&caja="+ls_caja+"&sociedad="+ls_sociedad+"&fecha="+string(ldt_fecha_pago)+"&item="+string(ll_item))
	end if
end if
end event

type dw_listado_cuenta_cte_man from datawindow within w_cuenta_corriente_contrato_isa
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1316
integer width = 2304
integer height = 592
integer taborder = 60
boolean titlebar = true
string title = "Pago Mantenciones"
string dataobject = "d_listado_cuenta_cte_man"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type dw_cons_docu_w from datawindow within w_cuenta_corriente_contrato_isa
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 41
integer y = 1316
integer width = 2304
integer height = 592
integer taborder = 30
boolean titlebar = true
string title = "Detalle Pago"
string dataobject = "cons_docu_w"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

event clicked;visible = false
end event

