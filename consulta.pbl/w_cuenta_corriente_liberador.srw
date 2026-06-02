forward
global type w_cuenta_corriente_liberador from window
end type
type mdi_1 from mdiclient within w_cuenta_corriente_liberador
end type
type mditbb_1 from tabbedbar within w_cuenta_corriente_liberador
end type
type mdirbb_1 from ribbonbar within w_cuenta_corriente_liberador
end type
type pb_clasif_liberador from picturebutton within w_cuenta_corriente_liberador
end type
type st_at_gestion from statictext within w_cuenta_corriente_liberador
end type
type cb_documento from commandbutton within w_cuenta_corriente_liberador
end type
type cb_planimetria from commandbutton within w_cuenta_corriente_liberador
end type
type st_help_abono from statictext within w_cuenta_corriente_liberador
end type
type dw_abono from datawindow within w_cuenta_corriente_liberador
end type
type st_pac from statictext within w_cuenta_corriente_liberador
end type
type pb_datos_cliente from picturebutton within w_cuenta_corriente_liberador
end type
type pb_ubicacion from picturebutton within w_cuenta_corriente_liberador
end type
type cb_11 from commandbutton within w_cuenta_corriente_liberador
end type
type cb_convenio from commandbutton within w_cuenta_corriente_liberador
end type
type cb_est_cheque from commandbutton within w_cuenta_corriente_liberador
end type
type cb_6 from commandbutton within w_cuenta_corriente_liberador
end type
type cb_detalle from commandbutton within w_cuenta_corriente_liberador
end type
type cb_cupones from commandbutton within w_cuenta_corriente_liberador
end type
type cb_rescomi_vta from commandbutton within w_cuenta_corriente_liberador
end type
type cb_operaciones from commandbutton within w_cuenta_corriente_liberador
end type
type cb_agente from commandbutton within w_cuenta_corriente_liberador
end type
type cb_5 from commandbutton within w_cuenta_corriente_liberador
end type
type cb_2 from commandbutton within w_cuenta_corriente_liberador
end type
type cb_1 from commandbutton within w_cuenta_corriente_liberador
end type
type cb_imprimir from commandbutton within w_cuenta_corriente_liberador
end type
type cb_cerrar from commandbutton within w_cuenta_corriente_liberador
end type
type dw_estado_cta_cte from datawindow within w_cuenta_corriente_liberador
end type
type dw_agente_super from datawindow within w_cuenta_corriente_liberador
end type
type dw_listado_cuenta_cte from datawindow within w_cuenta_corriente_liberador
end type
type dw_listado_cuenta_cte_cta from datawindow within w_cuenta_corriente_liberador
end type
type dw_cons_docu_w from datawindow within w_cuenta_corriente_liberador
end type
type dw_encabezado_cuenta_cte from datawindow within w_cuenta_corriente_liberador
end type
end forward

global type w_cuenta_corriente_liberador from window
integer x = 229
integer y = 288
integer width = 3232
integer height = 1964
boolean titlebar = true
string title = "Cta.Cte. ANEXO LIBERADOR (base = L)"
string menuname = "m_menu_cuenta_corriente_liberador"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = mdihelp!
long backcolor = 79741120
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
pb_clasif_liberador pb_clasif_liberador
st_at_gestion st_at_gestion
cb_documento cb_documento
cb_planimetria cb_planimetria
st_help_abono st_help_abono
dw_abono dw_abono
st_pac st_pac
pb_datos_cliente pb_datos_cliente
pb_ubicacion pb_ubicacion
cb_11 cb_11
cb_convenio cb_convenio
cb_est_cheque cb_est_cheque
cb_6 cb_6
cb_detalle cb_detalle
cb_cupones cb_cupones
cb_rescomi_vta cb_rescomi_vta
cb_operaciones cb_operaciones
cb_agente cb_agente
cb_5 cb_5
cb_2 cb_2
cb_1 cb_1
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_estado_cta_cte dw_estado_cta_cte
dw_agente_super dw_agente_super
dw_listado_cuenta_cte dw_listado_cuenta_cte
dw_listado_cuenta_cte_cta dw_listado_cuenta_cte_cta
dw_cons_docu_w dw_cons_docu_w
dw_encabezado_cuenta_cte dw_encabezado_cuenta_cte
end type
global w_cuenta_corriente_liberador w_cuenta_corriente_liberador

type variables
Long		il_count_print=0,il_abono

end variables

on w_cuenta_corriente_liberador.create
if this.MenuName = "m_menu_cuenta_corriente_liberador" then this.MenuID = create m_menu_cuenta_corriente_liberador
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.pb_clasif_liberador=create pb_clasif_liberador
this.st_at_gestion=create st_at_gestion
this.cb_documento=create cb_documento
this.cb_planimetria=create cb_planimetria
this.st_help_abono=create st_help_abono
this.dw_abono=create dw_abono
this.st_pac=create st_pac
this.pb_datos_cliente=create pb_datos_cliente
this.pb_ubicacion=create pb_ubicacion
this.cb_11=create cb_11
this.cb_convenio=create cb_convenio
this.cb_est_cheque=create cb_est_cheque
this.cb_6=create cb_6
this.cb_detalle=create cb_detalle
this.cb_cupones=create cb_cupones
this.cb_rescomi_vta=create cb_rescomi_vta
this.cb_operaciones=create cb_operaciones
this.cb_agente=create cb_agente
this.cb_5=create cb_5
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_estado_cta_cte=create dw_estado_cta_cte
this.dw_agente_super=create dw_agente_super
this.dw_listado_cuenta_cte=create dw_listado_cuenta_cte
this.dw_listado_cuenta_cte_cta=create dw_listado_cuenta_cte_cta
this.dw_cons_docu_w=create dw_cons_docu_w
this.dw_encabezado_cuenta_cte=create dw_encabezado_cuenta_cte
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1,&
this.pb_clasif_liberador,&
this.st_at_gestion,&
this.cb_documento,&
this.cb_planimetria,&
this.st_help_abono,&
this.dw_abono,&
this.st_pac,&
this.pb_datos_cliente,&
this.pb_ubicacion,&
this.cb_11,&
this.cb_convenio,&
this.cb_est_cheque,&
this.cb_6,&
this.cb_detalle,&
this.cb_cupones,&
this.cb_rescomi_vta,&
this.cb_operaciones,&
this.cb_agente,&
this.cb_5,&
this.cb_2,&
this.cb_1,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_estado_cta_cte,&
this.dw_agente_super,&
this.dw_listado_cuenta_cte,&
this.dw_listado_cuenta_cte_cta,&
this.dw_cons_docu_w,&
this.dw_encabezado_cuenta_cte}
end on

on w_cuenta_corriente_liberador.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
destroy(this.pb_clasif_liberador)
destroy(this.st_at_gestion)
destroy(this.cb_documento)
destroy(this.cb_planimetria)
destroy(this.st_help_abono)
destroy(this.dw_abono)
destroy(this.st_pac)
destroy(this.pb_datos_cliente)
destroy(this.pb_ubicacion)
destroy(this.cb_11)
destroy(this.cb_convenio)
destroy(this.cb_est_cheque)
destroy(this.cb_6)
destroy(this.cb_detalle)
destroy(this.cb_cupones)
destroy(this.cb_rescomi_vta)
destroy(this.cb_operaciones)
destroy(this.cb_agente)
destroy(this.cb_5)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_estado_cta_cte)
destroy(this.dw_agente_super)
destroy(this.dw_listado_cuenta_cte)
destroy(this.dw_listado_cuenta_cte_cta)
destroy(this.dw_cons_docu_w)
destroy(this.dw_encabezado_cuenta_cte)
end on

event open;Long		ll_count,ll_count_reg,ll_status,ll_count_cup,ll_obj_id_estado
String		ls_base_aux,ls_pac,ls_nom_usuario,ls_cod_usuario,ls_tipo_cobro,ls_usuario,ls_nombre, ls_descrip_depto  

dw_abono.SetTransObject(SQLCA)
if gs_serie<>'' and gi_numero>0 and gs_base<>'' then
	DECLARE sp_cadena_mora_cta_cte PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
	EXECUTE sp_cadena_mora_cta_cte;
	
	DECLARE sp_actualizar_cuponeras_1 PROCEDURE FOR sp_actualizar_cuponeras_1(:gs_base,:gs_serie,:gi_numero);
	EXECUTE sp_actualizar_cuponeras_1;
	gf_centrar (w_cuenta_corriente_liberador)
   dw_encabezado_cuenta_cte.SetTransObject(SQLCA)
   if dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)=0 then
		messagebox("Advertencia","No Registra Datos Anexo Liberador "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
		close(w_cuenta_corriente_liberador)
	else
		
		il_abono							= dw_abono.retrieve(gs_base,gs_serie,gi_numero)
		if il_abono > 0 then
			dw_abono.visible	= true
		else
			dw_abono.visible	= false
		end if
		dw_estado_cta_cte.SetTransObject(SQLCA)
		dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
		dw_listado_cuenta_cte.SetTransObject(SQLCA)
		dw_listado_cuenta_cte.Retrieve(gs_serie, gi_numero,gs_base)
		gs_ventana	= 'w_cuenta_corriente_liberador'
		f_valida_objeto()
		ls_pac							= f_buscar_pac(gs_base, gs_serie, gi_numero)
		st_pac.text						= ls_pac
//		if gs_depto = 'V' or gs_depto='G' or gs_depto='I' or gs_depto='O' or gs_depto='T' or &
//			gs_depto='D' or gs_depto='R' or gs_depto='B' or gs_depto='K' or gs_depto='E' or gs_depto='X' then
			cb_agente.enabled			= true
			cb_rescomi_vta.enabled		= true
//		else
//			cb_agente.enabled			= false
//			cb_rescomi_vta.enabled		= false
//		end if
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
			m_menu_cuenta_corriente_liberador.m_imprimircuponera.enabled	= true
		else
			m_menu_cuenta_corriente_liberador.m_imprimircuponera.enabled	= false
		end if
		ll_obj_id_estado																				= dw_encabezado_cuenta_cte.GetItemNumber(1, 'cadena_objeto_id_estado')
		if ll_obj_id_estado=0 or isnull(ll_obj_id_estado) then
			m_menu_cuenta_corriente_liberador.m_consultar.m_documentación.enabled	= false
		else
			m_menu_cuenta_corriente_liberador.m_consultar.m_documentación.enabled	= true
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
		
		ll_status						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_status_geo")
		if ll_status>0 then
			pb_ubicacion.enabled		= true
			m_menu_cuenta_corriente_liberador.m_consultar.m_geo-referenciación.enabled		= true
		else
			pb_ubicacion.enabled		= false
			m_menu_cuenta_corriente_liberador.m_consultar.m_geo-referenciación.enabled		= false
		end if
		if cb_agente.enabled=true then
			m_menu_cuenta_corriente_liberador.m_consultar.m_pagoscomisiónagente.enabled	= true
		else
			m_menu_cuenta_corriente_liberador.m_consultar.m_pagoscomisiónagente.enabled	= false
		end if
		if cb_rescomi_vta.enabled=true then
			m_menu_cuenta_corriente_liberador.m_consultar.m_pagosventas.enabled				= true
		else
			m_menu_cuenta_corriente_liberador.m_consultar.m_pagosventas.enabled				= false
		end if
		if cb_est_cheque.enabled=true then
			m_menu_cuenta_corriente_liberador.m_consultar.m_estadocheques.enabled			= true
		else
			m_menu_cuenta_corriente_liberador.m_consultar.m_estadocheques.enabled			= false
		end if
		if cb_convenio.enabled=true then
			m_menu_cuenta_corriente_liberador.m_consultar.m_conveniopagocheuqe.enabled		= true
		else
			m_menu_cuenta_corriente_liberador.m_consultar.m_conveniopagocheuqe.enabled		= false
		end if
		if gs_depto='I' then
			m_menu_cuenta_corriente_liberador.m_mantenedor.m_actualizarmora.visible		= true
			m_menu_cuenta_corriente_liberador.m_mantenedor.m_-2.visible						= true
		else
			m_menu_cuenta_corriente_liberador.m_mantenedor.m_actualizarmora.visible		= false
			m_menu_cuenta_corriente_liberador.m_mantenedor.m_-2.visible						= false
		end if
		if date(dw_encabezado_cuenta_cte.getitemdatetime(1,'anexo_liberador_cierre_venta')) >= date('31/01/2011') then
			pb_clasif_liberador.enabled		= true
			m_menu_cuenta_corriente_liberador.m_consultar.m_clasificaciónventa.enabled	= true
		else
			pb_clasif_liberador.enabled		= false
			m_menu_cuenta_corriente_liberador.m_consultar.m_clasificaciónventa.enabled	= false
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
		if gi_rut>0 then 
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
	end if
else
	close(w_cuenta_corriente_liberador)
end if
end event

event close;if gs_serie<>'' and gi_numero>0 and gs_base<>'' and dw_encabezado_cuenta_cte.rowcount()>0 then
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
	dw_abono.visible	= true
else
	dw_abono.visible	= false
end if
end event

type mdi_1 from mdiclient within w_cuenta_corriente_liberador
long BackColor=268435456
end type

type mditbb_1 from tabbedbar within w_cuenta_corriente_liberador
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_cuenta_corriente_liberador
int X=0
int Y=0
int Width=0
int Height=596
end type

type pb_clasif_liberador from picturebutton within w_cuenta_corriente_liberador
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2693
integer y = 1856
integer width = 114
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Desembosos (o).bmp"
string disabledname = "Desembosos (o)_no.bmp"
alignment htextalign = left!
end type

event ue_mousemove;//w_cuenta_corriente_oferta.SetMicroHelp('Muestra Clasificación Promesa')
//st_mant_cred.visible						= false
//st_mant_mant.visible						= false
//st_operaciones.visible						= false
//st_cobranza.visible						= false
//st_derecho_especial.visible				= false
//st_pagare.visible							= false
//st_funeraria.visible						= false
//st_aval.visible								= false
//st_institucion.visible						= false
//st_ver_pagos_gral.visible				= false
//st_ver_pagos_cred.visible				= false
//st_ver_pagos_mant.visible				= false
//st_datos_agente.visible					= false
//st_pagos_venta.visible					= false
//st_cuponeras.visible						= false
//st_seguro_comp.visible					= false
//st_datos_contrato.visible					= false
//st_cartera_rescatable.visible			= false
//st_control_documentario.visible		= false
//st_estado_cheque.visible					= false
//st_convenio_pago_ch.visible				= false
//st_fallecido.visible							= false
//st_geo_referencia.visible					= false
//st_clasifica_riesgo.visible					= false
//st_print.visible								= false
//st_salir.visible								= false
//st_datos_cliente.visible					= false
//st_ejecutivo.visible							= false
//st_print_cuponera.visible					= false
//st_beneficios.visible						= false
//st_2_beneficiario.visible					= false
//st_ultima_voluntad.visible				= false
//st_coprop_promesa.visible				= false
//st_reclamos_web.visible					= false
//st_clasif_promesa.visible					= true
//st_actualiza_mora.visible					= false
//st_comi_comp.visible						= false
//st_planimetria.visible						= false
//st_requerimientos.visible					= false
//st_doc_sig.visible							= false
end event

event clicked;String	ls_string

//gs_base		= dw_encabezado_cuenta_cte.GetItemString(1, 'cadena_codigo')
gs_base		= 'L'
gs_serie		= dw_encabezado_cuenta_cte.GetItemString(1, 'anexo_liberador_serie_m')
gi_numero	= dw_encabezado_cuenta_cte.GetItemNumber(1, 'anexo_liberador_nro_liberador')
if gi_numero > 0 then
	ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	if isvalid(w_clasifica_venta) then close(w_clasifica_venta)
	OpenWithParm(w_clasifica_venta, ls_string)
end if
end event

type st_at_gestion from statictext within w_cuenta_corriente_liberador
integer x = 155
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

type cb_documento from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 2313
integer y = 1896
integer width = 297
integer height = 84
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

type cb_planimetria from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 2313
integer y = 1888
integer width = 297
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "planimetria"
end type

event clicked;long ret
Inet  iinet_base
ret = GetContextService("Internet", iinet_base)
if ret = -1 then
	messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
	return
end if
if gs_conexion	= "Parque El Prado" then
	ret = iinet_base.HyperlinkToURL("http://intra2.nuestrosparques.cl/postfrompb/post.php?barra="+gs_base+gs_serie+string(gi_numero)+"&parque=1")
elseif gs_conexion	= "Parque La Foresta" then
	ret = iinet_base.HyperlinkToURL("http://intra2.nuestrosparques.cl/postfrompb/post.php?barra="+gs_base+gs_serie+string(gi_numero)+"&parque=11")
end if
if ret = -1 then
	messagebox('No Existe','No existe el plano del sector buscado.',stopsign!)
	return
end if

end event

type st_help_abono from statictext within w_cuenta_corriente_liberador
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1842
integer y = 560
integer width = 539
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

type dw_abono from datawindow within w_cuenta_corriente_liberador
event ue_mousemove pbm_move
integer x = 1856
integer y = 628
integer width = 526
integer height = 80
integer taborder = 30
string title = "none"
string dataobject = "dw_suma_monto_abono_por_ctto_ctacte"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_help_abono.visible	= false
end event

type st_pac from statictext within w_cuenta_corriente_liberador
event ue_mousemove pbm_mousemove
integer x = 55
integer y = 928
integer width = 2226
integer height = 60
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

event ue_mousemove;if il_abono > 0 then
	dw_abono.visible	= true
else
	dw_abono.visible	= false
end if
end event

type pb_datos_cliente from picturebutton within w_cuenta_corriente_liberador
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2693
integer y = 1724
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
if not isnull(gs_base) and gi_numero>0 and gi_rut>0 then
	if isvalid(w_datos_cliente) then close(w_datos_cliente)
	Open(w_datos_cliente)
end if
end event

type pb_ubicacion from picturebutton within w_cuenta_corriente_liberador
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2235
integer y = 1736
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
elseif gs_conexion	= "Parque La Foresta" then
	ret = iinet_base.HyperlinkToURL("http://intra2.nuestrosparques.cl/geoforesta/dbutil/pw1.php?barra="+gs_base+gs_serie+string(gi_numero))
end if
if ret = -1 then
	messagebox('No Existe','No existe el plano del sector buscado.',stopsign!)
	return
end if

end event

type cb_11 from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 1742
integer y = 1808
integer width = 439
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

type cb_convenio from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 1742
integer y = 1728
integer width = 443
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Con&venio Pago CH"
end type

event clicked;String	ls_string
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
if isvalid(w_detalle_convenio_pago_cheque_protesto) then close(w_detalle_convenio_pago_cheque_protesto)
ls_string				= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
openwithparm(w_detalle_convenio_pago_cheque_protesto,ls_string)
end event

type cb_est_cheque from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 1376
integer y = 1808
integer width = 361
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Estado Cheque"
end type

event clicked;String	ls_string
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
if gi_rut>0 then
	ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	if isvalid(w_consultar_estado_de_cheques) then close(w_consultar_estado_de_cheques)
	openwithparm(w_consultar_estado_de_cheques,ls_string)
end if
end event

type cb_6 from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 46
integer y = 1808
integer width = 411
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuo&tas Crédito"
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
		if isvalid(w_repacta) then close(w_repacta)
		open(w_repacta)
	end if
end if
end event

type cb_detalle from commandbutton within w_cuenta_corriente_liberador
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1376
integer y = 1728
integer width = 361
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Control &Dcto"
end type

event clicked;String	ls_string
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
ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
if not isnull(gs_base) and gi_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end event

type cb_cupones from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 1010
integer y = 1808
integer width = 361
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cupo&nes"
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
if isvalid(w_ver_cupones) then close(w_ver_cupones)
open(w_ver_cupones)
end event

type cb_rescomi_vta from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 1010
integer y = 1728
integer width = 361
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Pagos Venta"
end type

event clicked;gs_base 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_codigo")
gs_serie 									= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_serie")
gi_numero 								= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_numero")
gi_rut 									= dw_encabezado_cuenta_cte.GetItemNumber(1, "cliente_rut")
gs_apellido_paterno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_paterno")
gs_apellido_materno					= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_a_materno")
gs_nombres								= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_nombre")
gs_dv										= dw_encabezado_cuenta_cte.GetItemString(1, "cliente_dv")
gs_estado								= dw_encabezado_cuenta_cte.GetItemString(1, "cadena_estado")
gl_cod_parque_cta						= dw_encabezado_cuenta_cte.GetItemNumber(1, "cadena_cod_parque")
if isvalid(w_rescomi_por_vta) then close(w_rescomi_por_vta)
open(w_rescomi_por_vta)
end event

type cb_operaciones from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 695
integer y = 1808
integer width = 311
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Operaciones"
end type

event clicked;String	ls_string, ls_nombre, ls_ap_pat,ls_ap_mat,ls_dv, ls_nom_comp, ls_rut_comp
Long		ll_rut
if isvalid(w_ingreso_solicitudes) then close(w_ingreso_solicitudes)
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
ls_nombre	= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_nombre')
ls_ap_pat	= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_a_paterno')
ls_ap_mat	= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_a_materno')
ll_rut		= dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
ls_dv			= dw_encabezado_cuenta_cte.getitemstring(1,'cliente_dv')
ls_nom_comp	= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
ls_rut_comp	= string(ll_rut,'###,###,###')+' - '+ls_dv
ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+ls_nom_comp+'~t'+ls_rut_comp
OpenWithParm(w_ingreso_solicitudes,ls_string)

end event

type cb_agente from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 695
integer y = 1728
integer width = 311
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&gente"
end type

event clicked;string ls_age, ls_sup, ls_string
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
ls_string	= dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente')+'~t'+&
				  dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super')
if isvalid(w_agente_info) then close(w_agente_info)
openwithparm(w_agente_info,ls_string)


end event

type cb_5 from commandbutton within w_cuenta_corriente_liberador
event clicked pbm_bnclicked
boolean visible = false
integer x = 46
integer y = 1728
integer width = 411
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cobranza"
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
if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
open(w_cobranza_historica)
end event

type cb_2 from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 462
integer y = 1808
integer width = 229
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uotas"
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
dw_listado_cuenta_cte_cta.SetTransObject(SQLCA)
dw_listado_cuenta_cte_cta.Retrieve(gs_serie, gi_numero,gs_base)
dw_listado_cuenta_cte_cta.visible	= true
end event

type cb_1 from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 462
integer y = 1728
integer width = 229
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Total"
end type

event clicked;dw_listado_cuenta_cte.visible	= true

end event

type cb_imprimir from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 2400
integer y = 1728
integer width = 256
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;gs_datawindow_a_imprimir = 'd_rep_impresion_ctta_cte_liberador'
if isvalid(w_impresion_previa_de_ctta_ctes) then close(w_impresion_previa_de_ctta_ctes)
Open(w_impresion_previa_de_ctta_ctes)
il_count_print ++
end event

type cb_cerrar from commandbutton within w_cuenta_corriente_liberador
boolean visible = false
integer x = 2917
integer y = 1728
integer width = 261
integer height = 84
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_cuenta_corriente_liberador)
end event

type dw_estado_cta_cte from datawindow within w_cuenta_corriente_liberador
event ue_mousemove pbm_mousemove
integer x = 2400
integer y = 976
integer width = 782
integer height = 716
string dataobject = "d_estado_cta_cte_liberador"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;if il_abono > 0 then
	dw_abono.visible	= true
else
	dw_abono.visible	= false
end if
end event

type dw_agente_super from datawindow within w_cuenta_corriente_liberador
boolean visible = false
integer x = 503
integer y = 352
integer width = 2089
integer height = 1100
integer taborder = 20
boolean titlebar = true
string title = "Nombre Agente / Supervisor"
string dataobject = "d_agente_oferta2"
boolean controlmenu = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;this.visible = FALSE
end event

type dw_listado_cuenta_cte from datawindow within w_cuenta_corriente_liberador
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 988
integer width = 2327
integer height = 696
integer taborder = 50
boolean titlebar = true
string title = "Detalle Cta Cte Total"
string dataobject = "d_listado_cuenta_cte"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;if il_abono > 0 then
	dw_abono.visible	= true
else
	dw_abono.visible	= false
end if
end event

event doubleclicked;long 		folio1
string 	tcom1
if getrow() > 0 then
	folio1	= getitemnumber(getrow(), "folio")
	tcom1 	= getitemstring(getrow(), "tipo_cob")
	dw_cons_docu_w.settransobject(sqlca)
	dw_cons_docu_w.retrieve(folio1, tcom1)
	dw_cons_docu_w.visible	= true
end if

end event

event clicked;String		ls_columna,ls_tipo_cob,ls_sociedad,ls_link,ls_tipo_dte,ls_rut_empresa
Double	ll_folio
long		ret,ll_res1,ll_row
Inet		iinet_base

ls_columna		= dwo.name
ll_row				= row
if ls_columna='folio' then
	ll_folio		= dw_listado_cuenta_cte.getitemnumber(ll_row,'folio')
	ls_tipo_cob	= dw_listado_cuenta_cte.getitemstring(ll_row,'tipo_cob')
	ls_sociedad	= dw_listado_cuenta_cte.getitemstring(ll_row,'ingreso_viene_de')
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
			ret = GetContextService("Internet", iinet_base)
			if ret = -1 then
				messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
				return
			end if
//			ls_link		= 'http://intra2.nuestrosparques.cl/DTE_PDF/?folio='+string(50)+'&'+'tipo_doc='+string(ls_tipo_dte)+'&'+'sociedad='+string(ls_rut_empresa)+'&'+'env=testing'
			ls_link		= 'http://intra2.nuestrosparques.cl/DTE_PDF/?folio='+string(ll_folio)+'&'+'tipo_doc='+string(ls_tipo_dte)+'&'+'sociedad='+string(ls_rut_empresa)+'&'+'env=production'
//			messagebox("ls_link",ls_link)
			ret			= iinet_base.HyperlinkToURL(ls_link)
			if ret = -1 then
				messagebox('No Existe','No existe Documento Electrónico',stopsign!)
				return
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

type dw_listado_cuenta_cte_cta from datawindow within w_cuenta_corriente_liberador
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 988
integer width = 2327
integer height = 696
integer taborder = 60
boolean titlebar = true
string title = "Detalle Cuotas Cta. Cte."
string dataobject = "d_listado_cuenta_cte_cta"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;if il_abono > 0 then
	dw_abono.visible	= true
else
	dw_abono.visible	= false
end if
end event

event doubleclicked;long 		folio1
string 	tcom1
if getrow()>0 then
	folio1 						= getitemnumber(getrow(), "folio")
	tcom1 						= getitemstring(getrow(), "tipo_cob")
	dw_cons_docu_w.settransobject(sqlca)
	dw_cons_docu_w.retrieve(folio1, tcom1)
	dw_cons_docu_w.visible	= true
end if
end event

type dw_cons_docu_w from datawindow within w_cuenta_corriente_liberador
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 37
integer y = 988
integer width = 2341
integer height = 696
integer taborder = 40
boolean titlebar = true
string title = "Detalle de Pago"
string dataobject = "cons_docu_w"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;if il_abono > 0 then
	dw_abono.visible	= true
else
	dw_abono.visible	= false
end if
end event

event clicked;this.visible = FALSE
end event

type dw_encabezado_cuenta_cte from datawindow within w_cuenta_corriente_liberador
event ue_mousemove pbm_mousemove
integer x = 23
integer y = 180
integer width = 3168
integer height = 764
integer taborder = 10
string dataobject = "d_encabezado_cuenta_cte_liberador"
boolean border = false
end type

event ue_mousemove;if il_abono > 0 then
	dw_abono.visible	= true
else
	dw_abono.visible	= false
end if
end event

event doubleclicked;string agente, superv,ls_columna,ls_moneda,ls_uso,ls_string
double	lld_pie

ls_columna					= dwo.name
if ls_columna='pago_liberador_pie_t' or ls_columna='pago_liberador_pie' then
	lld_pie			= double(dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_pie'))
	ls_moneda		= dw_encabezado_cuenta_cte.getitemstring(1,'pago_liberador_moneda')
	if lld_pie>0 then
		ls_uso		= 'NF'
		ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(lld_pie)+'~t'+ls_uso+'~t'+'C'+'~t'+ls_moneda
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
else
	agente 						= getitemstring(1,"anexo_liberador_cod_agente")
	superv 						= getitemstring(1,"anexo_liberador_cod_super")
	dw_agente_super.settransobject(sqlca)
	dw_agente_super.retrieve(agente, superv)
	dw_agente_super.visible	= true
end if

end event

