forward
global type w_detalle_solicitudes from window
end type
type mdi_1 from mdiclient within w_detalle_solicitudes
end type
type mditbb_1 from tabbedbar within w_detalle_solicitudes
end type
type mdirbb_1 from ribbonbar within w_detalle_solicitudes
end type
type st_help from statictext within w_detalle_solicitudes
end type
type sle_1 from uo_convierte_numero within w_detalle_solicitudes
end type
type dw_print_ctto from datawindow within w_detalle_solicitudes
end type
type cb_print_ctto from commandbutton within w_detalle_solicitudes
end type
type dw_print from datawindow within w_detalle_solicitudes
end type
type cb_sort from commandbutton within w_detalle_solicitudes
end type
type cb_exportar from commandbutton within w_detalle_solicitudes
end type
type cb_imprimir from commandbutton within w_detalle_solicitudes
end type
type cb_eliminar from commandbutton within w_detalle_solicitudes
end type
type cb_nuevo from commandbutton within w_detalle_solicitudes
end type
type cb_cerrar from commandbutton within w_detalle_solicitudes
end type
type dw_reporte from datawindow within w_detalle_solicitudes
end type
type cb_filtrar from commandbutton within w_detalle_solicitudes
end type
type cb_aceptar_operaciones from commandbutton within w_detalle_solicitudes
end type
type cb_aceptar_informatica from commandbutton within w_detalle_solicitudes
end type
end forward

global type w_detalle_solicitudes from window
integer width = 2862
integer height = 2152
boolean titlebar = true
string title = "Solicitudes"
string menuname = "m_solicitudes"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = mdihelp!
long backcolor = 67108864
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
st_help st_help
sle_1 sle_1
dw_print_ctto dw_print_ctto
cb_print_ctto cb_print_ctto
dw_print dw_print
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_eliminar cb_eliminar
cb_nuevo cb_nuevo
cb_cerrar cb_cerrar
dw_reporte dw_reporte
cb_filtrar cb_filtrar
cb_aceptar_operaciones cb_aceptar_operaciones
cb_aceptar_informatica cb_aceptar_informatica
end type
global w_detalle_solicitudes w_detalle_solicitudes

type variables
String		is_base,is_serie,is_tipo_sol,is_estado_demanda
Long		il_row=0, il_rut,il_corr
Date		idt_fecha_hoy
Double	il_numero
end variables

forward prototypes
public function string wf_fecha_palabra (date ad_fecha)
public subroutine wf_grabar_transferencia ()
public subroutine wf_grabar_repacta_aumento ()
public subroutine wf_grabar_repacta_compraventa ()
public subroutine wf_grabar_repacta_liberador ()
public subroutine wf_grabar_repacta_pagare ()
public subroutine wf_print_ctto_rescilia (long al_cod_parque)
public subroutine wf_actualizar_cadena_estado (string as_estado)
public subroutine wf_grabar_repacta_funeraria ()
end prototypes

public function string wf_fecha_palabra (date ad_fecha);string	ls_fec_comp,ls_fecha
Long		ll_dia_fec,ll_mes_fec,ll_anno_fec
ls_fecha							= string(ad_fecha,"dd/mm/yyyy")
CHOOSE CASE UPPER(DayName(date(ls_fecha)))
	CASE 'LUNES','MONDAY'
		ls_fec_comp				= 'Lunes'
	CASE 'MARTES','TUESDAY'
		ls_fec_comp				= 'Martes'
	CASE 'MIERCOLES','WEDNESDAY'
		ls_fec_comp				= 'Miércoles'
	CASE 'JUEVES','THURSDAY'
		ls_fec_comp				= 'Jueves'
	CASE 'VIERNES','FRIDAY'
		ls_fec_comp				= 'Viernes'
	CASE 'SABADO','SATURDAY'
		ls_fec_comp				= 'Sábado'
	CASE 'DOMINGO','SUNDAY'
		ls_fec_comp				= 'Domingo'
END CHOOSE
ll_dia_fec						= day(ad_fecha)
ll_mes_fec						= month(ad_fecha)
ll_anno_fec						= year(ad_fecha)
if ll_mes_fec=1 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Enero de '+string(ll_anno_fec)
elseif ll_mes_fec=2 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Febrero de '+string(ll_anno_fec)
elseif ll_mes_fec=3 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Marzo de '+string(ll_anno_fec)
elseif ll_mes_fec=4 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Abril de '+string(ll_anno_fec)
elseif ll_mes_fec=5 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Mayo de '+string(ll_anno_fec)
elseif ll_mes_fec=6 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Junio de '+string(ll_anno_fec)
elseif ll_mes_fec=7 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Julio de '+string(ll_anno_fec)
elseif ll_mes_fec=8 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Agosto de '+string(ll_anno_fec)
elseif ll_mes_fec=9 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Septiembre de '+string(ll_anno_fec)
elseif ll_mes_fec=10 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Octubre de '+string(ll_anno_fec)
elseif ll_mes_fec=11 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Noviembre de '+string(ll_anno_fec)
elseif ll_mes_fec=12 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Diciembre de '+string(ll_anno_fec)
end if
Return ls_fec_comp
end function

public subroutine wf_grabar_transferencia ();String	ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_direc_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,&
			ls_fono_p,ls_sexo,ls_est_civil,ls_domicilio_c,ls_fono_c,ls_usuario,ls_base,ls_serie,&
			ls_tipo,ls_est_cob,ls_glosa_cob,ls_est_titular,ls_estado_responso,&
			ls_dv_ben,ls_nom_ben,ls_ap_pat_ben,ls_ap_mat_ben,ls_dv_cli,ls_nom_cli,& 
			ls_pat_cli,ls_mat_cli,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
Long		ll_rut,ll_total_renta,ll_grupo_f,ll_correlativo,ll_rut_cli_original,ll_rut_aux,&
			ll_rut_contacto,ll_rut_ben,ll_contar,ll_count_rut
Datetime	ld_fec_nac,ld_fec_ing,ld_fec_cob,ld_fec_actual
Double	ll_numero
ld_fec_actual	= datetime(idt_fecha_hoy,time("00:00:00"))
SELECT	"SOL_CLIENTE"."RUT",   "SOL_CLIENTE"."DV",   "SOL_CLIENTE"."NOMBRES",   "SOL_CLIENTE"."AP_PATERNO",   "SOL_CLIENTE"."AP_MATERNO",   "SOL_CLIENTE"."DIRECCION_P",   "SOL_CLIENTE"."POBLACION",   "SOL_CLIENTE"."SECTOR",   "SOL_CLIENTE"."COMUNA",   "SOL_CLIENTE"."CIUDAD",   "SOL_CLIENTE"."FONO_P",   "SOL_CLIENTE"."SEXO",   "SOL_CLIENTE"."FECHA_NAC",   "SOL_CLIENTE"."ESTADO_CIVIL",   "SOL_CLIENTE"."DOMICILIO_C",   "SOL_CLIENTE"."FONO_C",   "SOL_CLIENTE"."FECHA_ING",   "SOL_CLIENTE"."TOTAL_RENTA",   "SOL_CLIENTE"."GRUPO_F",   "SOL_CLIENTE"."USUARIO",   "SOL_CLIENTE"."BASE",   "SOL_CLIENTE"."SERIE",   "SOL_CLIENTE"."NUMERO",   "SOL_CLIENTE"."CORRELATIVO",   "SOL_CLIENTE"."RUT_CLIENTE_ORI",   "SOL_CLIENTE"."TIPO_VIA",   "SOL_CLIENTE"."NUMERO_PARTICULAR",   "SOL_CLIENTE"."DEPTO_PARTICULAR",   "SOL_CLIENTE"."BLOCK_PARTICULAR"
INTO 		:ll_rut,   				  :ls_dv,   				:ls_nombre,   					:ls_ap_pat,   						:ls_ap_mat,   						:ls_direc_p,   					 :ls_pob,   						:ls_sector,   				  :ls_comuna,   				 :ls_ciudad,   				:ls_fono_p,   				  :ls_sexo,   				  :ld_fec_nac,   					 :ls_est_civil,   					:ls_domicilio_c,   				 :ls_fono_c,   				:ld_fec_ing,   				  :ll_total_renta,   				:ll_grupo_f,   				:ls_usuario,   				:ls_base,   				:ls_serie,   				 :ll_numero,   				:ll_correlativo,   				 :ll_rut_cli_original  ,				:ls_tipo_via,					 :ls_nro_part,								  :ls_depto_part,								:ls_block_part
FROM 	"SOL_CLIENTE"  
WHERE 	"SOL_CLIENTE"."RUT_CLIENTE_ORI" = :il_rut and
			"SOL_CLIENTE"."BASE" = :gs_base and  
			"SOL_CLIENTE"."SERIE" = :gs_serie and   
			"SOL_CLIENTE"."NUMERO" = :gi_numero and    
			"SOL_CLIENTE"."CORRELATIVO" = :il_corr   
USING		sqlca;
if sqlca.sqlcode=0 then
	SELECT	"CLIENTE"."RUT"  
	INTO 		:ll_rut_aux  
	FROM 	"CLIENTE"  
	WHERE 	"CLIENTE"."RUT" = :ll_rut   
	USING		sqlca;
	if sqlca.sqlcode=100 then
		messagebox("Advertencia","Cliente a Transferir No Existe, será grabado a Tabla de CLIENTE")
		ls_tipo					= '0'
		ls_est_cob				= '0'
		setnull(ld_fec_cob)
		ls_glosa_cob			= ''
		ls_est_titular			= 'A'
		ll_rut_contacto			= 0
		ls_estado_responso	= '0'
		SELECT	Count("CLIENTE"."RUT")  
		INTO 		:ll_count_rut  
		FROM 	"CLIENTE"  
		WHERE 	"CLIENTE"."RUT" = :ll_rut   
		Using		sqlca;
		if ll_count_rut=0 or isnull(ll_count_rut) then
			INSERT INTO	  "CLIENTE"  
							( "RUT",   "TIPO",   "NOMBRE",   "A_PATERNO",   "A_MATERNO",   "DIRECCION_P",   "POBLACION",   "SECTOR",   "COMUNA",   "CIUDAD",   "FONO_P",   "SEXO",   "FECHA_NAC",   "ESTA_CIVIL",   "DOMICILIO_C",   "FONO_C",   "FECHA_INGR",   "TOTAL_RENT",   "GRUPO_F",   "DV",   "ESTADO_COBRANZA",   "FECHA_COBRANZA",   "GLOSA_COBRANZA",   "USUARIO",   "ESTADO_TITULAR",   "RUT_CONTACTO",   "ESTADO_RESPONSO",	"TIPO_VIA",		"NUMERO_PARTICULAR",	"DEPTO_PARTICULAR",	"BLOCK_PARTICULAR" )  
			VALUES 		( :ll_rut, :ls_tipo, :ls_nombre, :ls_ap_pat,    :ls_ap_mat,    :ls_direc_p, 	  :ls_pob, 		  :ls_sector, :ls_comuna, :ls_ciudad, :ls_fono_p, :ls_sexo, :ld_fec_nac,   :ls_est_civil,  :ls_domicilio_c, :ls_fono_c, :ld_fec_ing,    :ll_total_renta,:ll_grupo_f, :ls_dv, :ls_est_cob,         :ld_fec_cob,        :ls_glosa_cob,      :gs_user,    :ls_est_titular,    :ll_rut_contacto, :ls_estado_responso,	:ls_tipo_via,	:ls_nro_part,			:ls_depto_part,		:ls_block_part )  
			Using		  sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if	
		elseif ll_count_rut=1 then
			UPDATE	"CLIENTE"  
			SET		"TIPO" = :ls_tipo,
						"NOMBRE" = :ls_nombre,   
						"A_PATERNO" = :ls_ap_pat,   
						"A_MATERNO" = :ls_ap_mat,   
						"DIRECCION_P" = :ls_direc_p,   
						"POBLACION" = :ls_pob,   
						"SECTOR" = :ls_sector,   
						"COMUNA" = :ls_comuna,   
						"CIUDAD" = :ls_ciudad,   
						"FONO_P" = :ls_fono_p,   
						"SEXO" = :ls_sexo,   
						"FECHA_NAC" = :ld_fec_nac,   
						"ESTA_CIVIL" = :ls_est_civil,   
						"DOMICILIO_C" = :ls_domicilio_c,   
						"FONO_C" = :ls_fono_c,   
						"FECHA_INGR" = :ld_fec_ing,   
						"TOTAL_RENT" = :ll_total_renta,   
						"GRUPO_F" = :ll_grupo_f,   
						"DV" = :ls_dv,   
						"ESTADO_COBRANZA" = :ls_est_cob,   
						"FECHA_COBRANZA" = :ld_fec_cob,   
						"GLOSA_COBRANZA" = :ls_glosa_cob,   
						"USUARIO" = :gs_user,   
						"ESTADO_TITULAR" = :ls_est_titular,   
						"RUT_CONTACTO" = :ll_rut_contacto,   
						"ESTADO_RESPONSO" = :ls_estado_responso,	
						"TIPO_VIA" = :ls_tipo_via,		
						"NUMERO_PARTICULAR" = :ls_nro_part,	
						"DEPTO_PARTICULAR" = :ls_depto_part,	
						"BLOCK_PARTICULAR" = :ls_block_part 
			WHERE 	"CLIENTE"."RUT" = :ll_rut     
			Using		  sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if	
		end if
	elseif sqlca.sqlcode=0 then
		UPDATE	"CLIENTE"  
		SET		"TIPO" = :ls_tipo,
					"NOMBRE" = :ls_nombre,   
					"A_PATERNO" = :ls_ap_pat,   
					"A_MATERNO" = :ls_ap_mat,   
					"DIRECCION_P" = :ls_direc_p,   
					"POBLACION" = :ls_pob,   
					"SECTOR" = :ls_sector,   
					"COMUNA" = :ls_comuna,   
					"CIUDAD" = :ls_ciudad,   
					"FONO_P" = :ls_fono_p,   
					"SEXO" = :ls_sexo,   
					"FECHA_NAC" = :ld_fec_nac,   
					"ESTA_CIVIL" = :ls_est_civil,   
					"DOMICILIO_C" = :ls_domicilio_c,   
					"FONO_C" = :ls_fono_c,   
					"FECHA_INGR" = :ld_fec_ing,   
					"TOTAL_RENT" = :ll_total_renta,   
					"GRUPO_F" = :ll_grupo_f,   
					"DV" = :ls_dv,   
					"ESTADO_COBRANZA" = :ls_est_cob,   
					"FECHA_COBRANZA" = :ld_fec_cob,   
					"GLOSA_COBRANZA" = :ls_glosa_cob,   
					"USUARIO" = :gs_user,   
					"ESTADO_TITULAR" = :ls_est_titular,   
					"RUT_CONTACTO" = :ll_rut_contacto,   
					"ESTADO_RESPONSO" = :ls_estado_responso,	
					"TIPO_VIA" = :ls_tipo_via,		
					"NUMERO_PARTICULAR" = :ls_nro_part,	
					"DEPTO_PARTICULAR" = :ls_depto_part,	
					"BLOCK_PARTICULAR" = :ls_block_part 
		WHERE 	"CLIENTE"."RUT" = :ll_rut     
		Using		  sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if	
	end if
end if
// modificar cadena
CHOOSE CASE gs_base //actualiza rut dependiendo la BASE
	CASE "O" // Oferta
		if is_tipo_sol='19' then
			DELETE FROM "COPROP_ISACRUZ"  
			WHERE 	 ( "COPROP_ISACRUZ"."SERIE" = :gs_serie ) AND  
						 ( "COPROP_ISACRUZ"."NUMERO" = :gi_numero )   
			Using		sqlca  ;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			DECLARE x2 CURSOR FOR  
			SELECT 	  "SOL_COPROP"."RUT",   "SOL_COPROP"."DV",   "SOL_COPROP"."NOMBRES",   "SOL_COPROP"."AP_PATERNO",   "SOL_COPROP"."AP_MATERNO"  
			FROM 	  "SOL_COPROP"  
			WHERE    ( "SOL_COPROP"."RUT_CLIENTE" = :il_rut ) AND  
						( "SOL_COPROP"."RUT_CLIENTE_TRAN" = :ll_rut ) AND  
						( "SOL_COPROP"."ESTADO_A_N" = 'N' ) AND 
						( "SOL_COPROP"."BASE" = :gs_base ) AND  
						( "SOL_COPROP"."SERIE" = :gs_serie ) AND  
						( "SOL_COPROP"."NUMERO" = :gi_numero )   
			USING		sqlca  ;
			open x2;
			setnull(ll_rut_ben);setnull(ls_dv_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)
			ll_contar=0
			DO WHILE sqlca.sqlcode=0
				fetch x2 into :ll_rut_ben,:ls_dv_ben,:ls_nom_ben,:ls_ap_pat_ben,:ls_ap_mat_ben;
				if not isnull(ls_nom_ben) and not isnull(ls_ap_pat_ben) and ls_nom_ben<>'' and ls_ap_pat_ben<>'' then
					if isnull(ll_rut_ben) 		then ll_rut_ben	= 0
					if isnull(ls_dv_ben) 		then ls_dv_ben		= ''
					if isnull(ls_ap_mat_ben) 	then ls_ap_mat_ben= ''
					ll_contar++
					INSERT INTO "COPROP_ISACRUZ"  
								( "SERIE",   "NUMERO",   "LINEA",   "RUT",   	"DV",   		"NOMBRES",   "APATERNO",   	"AMATERNO",			"BASE",			"ESTADO_HEREDERO" )  
					VALUES 	( :gs_serie, :gi_numero, :ll_contar,:ll_rut_ben,:ls_dv_ben, :ls_nom_ben, :ls_ap_pat_ben,  :ls_ap_mat_ben,	:gs_base,		'S' )  
					Using		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
				setnull(ll_rut_ben);setnull(ls_dv_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)
			LOOP
			close x2;
		else
			UPDATE	"CADENA"  
			SET 		"RUT" = :ll_rut  
			WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
					 ( "CADENA"."SERIE" = :gs_serie ) AND  
					 ( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				UPDATE	"OFERTA_V"  
				SET 		"RUT" = :ll_rut  
				WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) AND  
						 ( "OFERTA_V"."ULT_FOLIO" = (  SELECT  "OFERTA_V"."ULT_FOLIO"  
																 FROM    "OFERTA_V",   
																			"PAGO_OFERTA"  
																 WHERE ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
																		 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
																		 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
																		 (("OFERTA_V"."SERIE" = :gs_serie ) AND  
																		 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ))))   
				Using	sqlca;
				if sqlca.sqlcode=0 then
					commit;
					DELETE FROM "CO_PROP"  
					WHERE 		( "CO_PROP"."SERIE" = :gs_serie ) AND  
									( "CO_PROP"."NRO_OFERTA" = :gi_numero )   
					Using	sqlca ;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					ll_contar	= 0
					setnull(ll_rut_ben);setnull(ls_dv_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)
					DECLARE x1 CURSOR FOR  
					SELECT 	  "SOL_COPROP"."RUT",   "SOL_COPROP"."DV",   "SOL_COPROP"."NOMBRES",   "SOL_COPROP"."AP_PATERNO",   "SOL_COPROP"."AP_MATERNO"  
					FROM 	  "SOL_COPROP"  
					WHERE    ( "SOL_COPROP"."RUT_CLIENTE" = :il_rut ) AND  
								( "SOL_COPROP"."RUT_CLIENTE_TRAN" = :ll_rut ) AND  
								( "SOL_COPROP"."ESTADO_A_N" = 'N' ) AND 
								( "SOL_COPROP"."BASE" = :gs_base ) AND  
								( "SOL_COPROP"."SERIE" = :gs_serie ) AND  
								( "SOL_COPROP"."NUMERO" = :gi_numero )   
					USING		sqlca  ;
					open x1;
					DO WHILE sqlca.sqlcode=0
						fetch x1 into :ll_rut_ben,:ls_dv_ben,:ls_nom_ben,:ls_ap_pat_ben,:ls_ap_mat_ben;
						ll_contar++
						if not isnull(ls_nom_ben) and not isnull(ls_ap_pat_ben) and ls_nom_ben<>'' and ls_ap_pat_ben<>'' then
							if isnull(ll_rut_ben) 		then ll_rut_ben	= 0
							if isnull(ls_dv_ben) 		then ls_dv_ben		= ''
							if isnull(ls_ap_mat_ben) 	then ls_ap_mat_ben= ''
							INSERT INTO "CO_PROP"  
											( "CONTADOR",   "SERIE",   "NRO_OFERTA",   "RUT",      "NOMBRE",   "A_PATERNO",   "A_MATERNO" )  
							VALUES 		( :ll_contar,   :gs_serie, :gi_numero,     :ll_rut_ben,:ls_nom_ben,:ls_ap_pat_ben,:ls_ap_mat_ben )  
							Using		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
						setnull(ll_rut_ben);setnull(ls_dv_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)
					LOOP
					close x1;
				else
					rollback;
				end if
			else
				rollback;
			end if
		end if
		if isvalid(w_cuenta_corriente_oferta) then
			w_cuenta_corriente_oferta.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
			w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
		end if
		
	CASE "L" // Anexo Liberador
		UPDATE	"CADENA"  
		SET 		"RUT" = :ll_rut  
		WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			UPDATE	  "ANEXO_LIBERADOR"  
			SET 		  "RUT" = :ll_rut  
			WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND  
						( "ANEXO_LIBERADOR"."ULT_FOLIO" = (  SELECT   "ANEXO_LIBERADOR"."ULT_FOLIO"  
																		 FROM     "ANEXO_LIBERADOR",   
																					 "PAGO_LIBERADOR"  
																		 WHERE (  "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
																				  ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
																				  ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
																				  (("ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
																				  ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ))))
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		else
			rollback;
		end if
		if isvalid(w_cuenta_corriente_liberador) then
			w_cuenta_corriente_liberador.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
			w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
		end if
		
	CASE "A" // Aumento Capacidad
		UPDATE	"CADENA"  
		SET 		"RUT" = :ll_rut  
		WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			UPDATE	"ANEXO_AUMENTO"  
			SET 		"RUT" = :ll_rut  
			WHERE 	( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) AND  
						( "ANEXO_AUMENTO"."ULT_FOLIO" = (  SELECT     "ANEXO_AUMENTO"."ULT_FOLIO"  
																		 FROM     "ANEXO_AUMENTO",   
																					 "PAGO_AUMENTO"  
																		 WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
																				  ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
																				  ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
																				  (("ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
																				  ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero ))))
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		else
			rollback;
		end if
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
			w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
		end if
		
	CASE "P" // Pagaré
		UPDATE	"CADENA"  
		SET 		"RUT" = :ll_rut  
		WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			UPDATE	"PAGARE"  
			SET 		"RUT" = :ll_rut  
			WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
					 ( "PAGARE"."NRO_PAGARE" = :gi_numero )   
			USING		sqlca  ;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		else
			rollback;
		end if
		if isvalid(w_cuenta_corriente_pagare) then
			w_cuenta_corriente_pagare.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
			w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
		end if
		
	CASE "C" // Contrato ISA	
		if is_tipo_sol='19' then //Posesión Efectiva
			DELETE FROM "COPROP_ISACRUZ"  
			WHERE 	 ( "COPROP_ISACRUZ"."SERIE" = :gs_serie ) AND  
						 ( "COPROP_ISACRUZ"."NUMERO" = :gi_numero )   
			Using		sqlca  ;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			DECLARE x21 CURSOR FOR  
			SELECT 	  "SOL_COPROP"."RUT",   "SOL_COPROP"."DV",   "SOL_COPROP"."NOMBRES",   "SOL_COPROP"."AP_PATERNO",   "SOL_COPROP"."AP_MATERNO"  
			FROM 		  "SOL_COPROP"  
			WHERE    ( "SOL_COPROP"."RUT_CLIENTE" = :il_rut ) AND  
						( "SOL_COPROP"."RUT_CLIENTE_TRAN" = :ll_rut ) AND  
						( "SOL_COPROP"."ESTADO_A_N" = 'N' ) AND 
						( "SOL_COPROP"."BASE" = :gs_base ) AND  
						( "SOL_COPROP"."SERIE" = :gs_serie ) AND  
						( "SOL_COPROP"."NUMERO" = :gi_numero )   
			USING		sqlca  ;
			open x21;
			setnull(ll_rut_ben);setnull(ls_dv_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)
			ll_contar=0
			DO WHILE sqlca.sqlcode=0
				fetch x21 into :ll_rut_ben,:ls_dv_ben,:ls_nom_ben,:ls_ap_pat_ben,:ls_ap_mat_ben;
				if not isnull(ls_nom_ben) and not isnull(ls_ap_pat_ben) and ls_nom_ben<>'' and ls_ap_pat_ben<>'' then
					if isnull(ll_rut_ben) 		then ll_rut_ben	= 0
					if isnull(ls_dv_ben) 		then ls_dv_ben		= ''
					if isnull(ls_ap_mat_ben) 	then ls_ap_mat_ben= ''
					ll_contar++
					INSERT INTO "COPROP_ISACRUZ"  
								( "SERIE",   "NUMERO",   "LINEA",   "RUT",   	"DV",   		"NOMBRES",   "APATERNO",   	"AMATERNO",			"BASE",		"ESTADO_HEREDERO" )  
					VALUES 	( :gs_serie, :gi_numero, :ll_contar,:ll_rut_ben,:ls_dv_ben, :ls_nom_ben, :ls_ap_pat_ben,  :ls_ap_mat_ben,	:gs_base,	'S' )  
					Using		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
				setnull(ll_rut_ben);setnull(ls_dv_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)
			LOOP
			close x21;
		else
			UPDATE	"CADENA"  
			SET 		"RUT" = :ll_rut  
			WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
					 ( "CADENA"."SERIE" = :gs_serie ) AND  
					 ( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				UPDATE	"CONTRATO"  
				SET 		"RUT" = :ll_rut  
				WHERE  ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
						 ( "CONTRATO"."NRO_CONTRATO" = :gi_numero )   
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
					DELETE FROM "COPROP_ISACRUZ"  
					WHERE 	( "COPROP_ISACRUZ"."SERIE" = :gs_serie ) AND  
								( "COPROP_ISACRUZ"."NUMERO" = :gi_numero )   
					Using		sqlca  ;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					DECLARE x22 CURSOR FOR  
					SELECT 	  "SOL_COPROP"."RUT",   "SOL_COPROP"."DV",   "SOL_COPROP"."NOMBRES",   "SOL_COPROP"."AP_PATERNO",   "SOL_COPROP"."AP_MATERNO"  
					FROM 		  "SOL_COPROP"  
					WHERE    ( "SOL_COPROP"."RUT_CLIENTE" = :il_rut ) AND  
								( "SOL_COPROP"."RUT_CLIENTE_TRAN" = :ll_rut ) AND  
								( "SOL_COPROP"."ESTADO_A_N" = 'N' ) AND 
								( "SOL_COPROP"."BASE" = :gs_base ) AND  
								( "SOL_COPROP"."SERIE" = :gs_serie ) AND  
								( "SOL_COPROP"."NUMERO" = :gi_numero )   
					USING		sqlca  ;
					open x22;
					setnull(ll_rut_ben);setnull(ls_dv_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)
					ll_contar=0
					DO WHILE sqlca.sqlcode=0
						fetch x22 into :ll_rut_ben,:ls_dv_ben,:ls_nom_ben,:ls_ap_pat_ben,:ls_ap_mat_ben;
						if not isnull(ls_nom_ben) and not isnull(ls_ap_pat_ben) and ls_nom_ben<>'' and ls_ap_pat_ben<>'' then
							if isnull(ll_rut_ben) 		then ll_rut_ben	= 0
							if isnull(ls_dv_ben) 		then ls_dv_ben		= ''
							if isnull(ls_ap_mat_ben) 	then ls_ap_mat_ben= ''
							ll_contar++
							INSERT INTO "COPROP_ISACRUZ"  
										( "SERIE",   "NUMERO",   "LINEA",   "RUT",   	"DV",   		"NOMBRES",   "APATERNO",   	"AMATERNO" )  
							VALUES 	( :gs_serie, :gi_numero, :ll_contar,:ll_rut_ben,:ls_dv_ben, :ls_nom_ben, :ls_ap_pat_ben,  :ls_ap_mat_ben )  
							Using		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
						setnull(ll_rut_ben);setnull(ls_dv_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)
					LOOP
					close x22;
				else
					rollback;
				end if
			else
				rollback;
			end if
		end if
		if isvalid(w_cuenta_corriente_contrato_isa) then
			w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
			w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
		end if
		
	CASE "D" // Derecho Especial
		UPDATE	"CADENA"  
		SET 		"RUT" = :ll_rut  
		WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			UPDATE	"DERECHO"  
			SET 		"RUT" = :ll_rut  
			WHERE  ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
					 ( "DERECHO"."NRO_PAGARE" = :gi_numero )   
			USING		sqlca  ;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		else
			rollback;
		end if
		if isvalid(w_cuenta_corriente_derecho) then
			w_cuenta_corriente_derecho.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
			w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
		end if
		
	CASE "F","G" // Funeraria
		UPDATE	"CADENA"  
		SET 		"RUT" = :ll_rut  
		WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			UPDATE	"PRODUCTO_ANEXO"  
			SET 		"RUT" = :ll_rut  
			WHERE 	( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
						( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
						( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) AND  
						( "PRODUCTO_ANEXO"."ULT_FOLIO" = ( SELECT    "PRODUCTO_ANEXO"."ULT_FOLIO"  
																		 	FROM     "PRODUCTO_ANEXO",   
																					 	"PRODUCTO_PAGO"  
																		 	WHERE  ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
																				  	   ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
																				  	   ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
																				 	   (("PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
																				 	   ( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
																				  	   ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ))))
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		else
			rollback;
		end if
		if isvalid(w_cuenta_corriente_funeraria) then
			w_cuenta_corriente_funeraria.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
			w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
		end if
		
	CASE "R" //Repactación Ctas.Mantencion
		UPDATE	"CADENA"  
		SET 		"RUT" = :ll_rut  
		WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			UPDATE	"REPACTA_MANTENCION"  
			SET 		"RUT_CLIENTE" = :ll_rut  
			WHERE  ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
					 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero ) AND  
					 ( "REPACTA_MANTENCION"."CORRELATIVO" = (SELECT max("REPACTA_MANTENCION"."CORRELATIVO") 
																		 FROM "REPACTA_MANTENCION" 
																		 WHERE ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND 
																		 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero ) ) )   
			USING		sqlca  ;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		else
			rollback;
		end if
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
			w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.Retrieve(gs_serie, gi_numero)
		end if
END CHOOSE
UPDATE	"CUPONERAS_DETALLE"  
SET 		"RUT" = :ll_rut,   
			"DV" = :ls_dv  
WHERE  ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
		 ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
		 ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) 
using		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if
SELECT	"SOL_CLIENTE"."DV",   "SOL_CLIENTE"."NOMBRES",   "SOL_CLIENTE"."AP_PATERNO",   "SOL_CLIENTE"."AP_MATERNO"  
INTO 		:ls_dv_cli,   			 :ls_nom_cli,   				 :ls_pat_cli,   					 :ls_mat_cli  
FROM 		"SOL_CLIENTE"  
WHERE  ( "SOL_CLIENTE"."RUT" = :ll_rut ) AND  
		 ( "SOL_CLIENTE"."BASE" = :gs_base ) AND  
		 ( "SOL_CLIENTE"."SERIE" = :gs_serie ) AND  
		 ( "SOL_CLIENTE"."NUMERO" = :gi_numero ) AND  
		 ( "SOL_CLIENTE"."CORRELATIVO" = :il_corr )   
Using		sqlca;
if sqlca.sqlcode=0 then
	if isvalid(w_ingreso_solicitudes) then
		w_ingreso_solicitudes.st_rut.text		= string(ll_rut,"###,###,###,##0")+' - '+ls_dv_cli
		w_ingreso_solicitudes.st_nombre.text	= trim(ls_nom_cli)+' '+trim(ls_pat_cli)+' '+trim(ls_mat_cli)
	end if
	if isvalid(w_listado_contratos) then
		w_listado_contratos.dw_listado.Retrieve(gi_numero)
	end if
	w_detalle_solicitudes.dw_reporte.object.ctto.text		= gs_base+' - '+gs_serie+' - '+string(gi_numero,'###,###,###,##0')
	w_detalle_solicitudes.dw_reporte.object.t_rut.text		= string(ll_rut,"###,###,###,##0")+' - '+ls_dv_cli
	w_detalle_solicitudes.dw_reporte.object.t_nombre.text	= trim(ls_nom_cli)+' '+trim(ls_pat_cli)+' '+trim(ls_mat_cli)
end if
end subroutine

public subroutine wf_grabar_repacta_aumento ();date		ld_fec_1er_vcto,ld_fec_vcto,ld_fec_prox_pago
datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_ult,ldt_fecha_entre,ldt_fecha_pie,ldt_fecha_mod,&
			ldt_fecha_fact,ldt_fecha_hoy,ld_fec_1er_vcto1,ld_fec_vcto1,ldt_fecha_m,ldt_fec_venc_mant,ldt_fecha_prim_pie
Long		ll_correlativo,ll_des_esp,ll_nro_cuotas,ll_parque,ll_derecho_lib,ll_gastos_adm,	ll_factura,ll_pie_pagado,ll_cod_parque,ll_rut,&
			ll_count_vig,ll_capacidad,ll_ctas_pag_pie,ll_ctas_pac_pie,ll_count_reg_atencion
String		ls_serie,ls_n_reduccion,ls_moneda,ls_modificado,ls_area,ls_sector,ls_sepultura,ls_carta_bienv,ls_nro_tecnico,ls_dv,ls_base,ls_glosa,ls_estado='67'
Double	ll_pie,ll_tasa,ll_valor_cuota,ll_uf_dia,ll_total_fact,ldb_valor_cuota_m=0,ll_numero,ll_ult_folio,ll_nro_aumento,ll_folio,ll_precio,&
			ldb_tasa_base,ldb_tasa_interes_cuota

Setnull(ldt_fecha_m)
ldt_fecha				= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy		= datetime(idt_fecha_hoy,time("00:00:00"))
ld_fec_1er_vcto1	= dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecrep_1_vcto')
ld_fec_vcto1			= dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecrep_ult_vcto')
ld_fec_prox_pago	= date(dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecha_prox_vcto'))
ll_numero			= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_numero')
ll_correlativo		= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_correlativo')
// ver si existe en anexo_capacidad y rescatar ult_folio
SELECT	"ANEXO_AUMENTO"."ULT_FOLIO",
			"CADENA"."COD_PARQUE",
			"ANEXO_AUMENTO"."RUT",
			"CLIENTE"."DV"
INTO 		:ll_ult_folio,
			:ll_cod_parque,
			:ll_rut,
			:ls_dv
FROM 		"ANEXO_AUMENTO",   
			"CADENA",   
			"PAGO_AUMENTO",
			"CLIENTE"
WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
		 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
		 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
		 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
		 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
		 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
		 ( "ANEXO_AUMENTO"."RUT" = "CLIENTE"."RUT" ) and
		 (("ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
		 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) and
		 ( "CADENA"."CODIGO" = :gs_base ))   
Using		sqlca;
if sqlca.sqlcode=0 then // si existe rescata todo los datos
	SELECT	"PAGO_AUMENTO"."SERIE_M",  "PAGO_AUMENTO"."NRO_AUMENTO", "PAGO_AUMENTO"."FECHA", "PAGO_AUMENTO"."FOLIO", "PAGO_AUMENTO"."PRECIO",   "PAGO_AUMENTO"."PIE_PAGADO",  "PAGO_AUMENTO"."PIE",   "PAGO_AUMENTO"."TASA",  "PAGO_AUMENTO"."VALOR_CUOTA", "PAGO_AUMENTO"."NRO_CUOTAS",  "PAGO_AUMENTO"."UF_DIA",   "PAGO_AUMENTO"."MONEDA",   "PAGO_AUMENTO"."FECHA_PRIM",  "PAGO_AUMENTO"."FECHA_ULT",   "PAGO_AUMENTO"."FECHA_PIE",   "PAGO_AUMENTO"."MODIFICADO",  "PAGO_AUMENTO"."FECHA_MOD",   "PAGO_AUMENTO"."GASTOS_ADM",   "PAGO_AUMENTO"."CAPACIDAD",   "PAGO_AUMENTO"."TASA_BASE",   "PAGO_AUMENTO"."CTAS_PAGADAS_PIE",   "PAGO_AUMENTO"."CTAS_PACTADAS_PIE",   "PAGO_AUMENTO"."FECHA_PRIM_PIE",   "PAGO_AUMENTO"."BASE",   "PAGO_AUMENTO"."TASA_INTERES_CUOTA"
	INTO 		:ls_serie,   							:ll_nro_aumento,   						:ldt_fecha,   						:ll_folio,   						:ll_precio,   							:ll_pie_pagado,   						:ll_pie,   							:ll_tasa,   						:ll_valor_cuota,   							:ll_nro_cuotas,   							:ll_uf_dia,   							:ls_moneda,   						:ldt_fecha_prim,   							:ldt_fecha_ult,   						:ldt_fecha_pie,   						:ls_modificado,   							:ldt_fecha_mod,   						:ll_gastos_adm,							:ll_capacidad,								:ldb_tasa_base,						:ll_ctas_pag_pie,										:ll_ctas_pac_pie,									:ldt_fecha_prim_pie,							:ls_base,								:ldb_tasa_interes_cuota
	FROM 		"PAGO_AUMENTO"  
	WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
			 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) AND
			 ( "PAGO_AUMENTO"."FOLIO" = :ll_ult_folio )
	USING	sqlca;
	if sqlca.sqlcode=0 then // incrementa 1 el folio y lo inserta en pago_aumento
		ll_folio	= Double(string(ll_numero)+string(ll_correlativo))
		INSERT INTO	"PAGO_AUMENTO"  
					( "SERIE_M",   "NRO_AUMENTO",   	"FECHA",   	"FOLIO",   "PRECIO",   "PIE_PAGADO",   "PIE",   "TASA",   "VALOR_CUOTA",   "NRO_CUOTAS",   	"UF_DIA",   "MONEDA",   "FECHA_PRIM",   		"FECHA_ULT",   	"FECHA_PIE",   		"MODIFICADO",   "FECHA_MOD",   	"GASTOS_ADM",	"CAPACIDAD",   "TASA_BASE",   "CTAS_PAGADAS_PIE",   "CTAS_PACTADAS_PIE",   "FECHA_PRIM_PIE",   "BASE",   "TASA_INTERES_CUOTA" )  
		VALUES 	( :ls_serie,		:ll_nro_aumento,		:ldt_fecha, :ll_folio, 	:ll_precio, 	:ll_pie_pagado, 	:ll_pie, :ll_tasa, :ll_valor_cuota, 		:ll_nro_cuotas, 		:ll_uf_dia, 	:ls_moneda, :ld_fec_1er_vcto1,	:ld_fec_vcto1,		:ldt_fecha_pie,   	:ls_modificado, 	:ldt_fecha_mod,	:ll_gastos_adm,	:ll_capacidad,	:ldb_tasa_base, :ll_ctas_pag_pie,				:ll_ctas_pac_pie,			:ldt_fecha_prim_pie,	:ls_base,	:ldb_tasa_interes_cuota )  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			UPDATE	"ANEXO_AUMENTO"  
			SET 		"ULT_FOLIO" = :ll_folio  
			WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
					 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )   
			Using		sqlca ;
			if sqlca.sqlcode=0 then
				commit;
				INSERT INTO "CUPONERAS_MODIFICA"  
							( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",		"FECHA_PRIM",			"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
				VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_nro_cuotas,	:ll_rut,	:ls_dv,	:ll_valor_cuota,		0,							:ll_cod_parque,	:ld_fec_1er_vcto1,	:ldt_fecha_m,		:ls_moneda,	'C' )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					///// nuevo mirko 11/09/2020
					DECLARE sp_mod_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
					EXECUTE sp_mod_cadena_mora;
					
					SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
					INTO 		:ldt_fec_venc_mant  
					FROM 	"CADENA_MORA"  
					WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
							 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
							 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
					USING	sqlca;
					
					SELECT	"CUPONERAS"."NUMERO"  
					INTO 		:ll_count_vig  
					FROM 	"CUPONERAS"  
					WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
							 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
							 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
							 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
					using		SQLCA;
					if sqlca.sqlcode = 0 and ll_count_vig > 0 then
						UPDATE 		"CUPONERAS"  
						SET 			"ESTADO_CUPONERA" = 'R'  
						WHERE 	   ( "CUPONERAS"."BASE" = :gs_base ) AND  
										( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )  
						USING		sqlca;
						if sqlca.sqlcode=0 THEN
							commit;
							UPDATE 	"CUPONERAS_DETALLE"  
							SET 		"ESTADO_PAGO_CUPON" = 'A'  
							WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
									  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
									  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
									  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )  
							USING		sqlca;
							if sqlca.sqlcode=0 THEN
								commit;
							else
								rollback;
							end if
						else
							rollback;
						end if
//						DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :as_base, :as_serie, :al_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda);
//						EXECUTE sp_proc_genera_cuponera;
						
						DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda);
						EXECUTE sp_proc_genera_cuponera;
						
						SELECT 	Count("ATENCION_LOG"."RUT")
						INTO 		:ll_count_reg_atencion  
						FROM 	"ATENCION_LOG"  
						WHERE ( "ATENCION_LOG"."RUT" = :gi_rut ) AND  
								  ( "ATENCION_LOG"."ESTADO" = :ls_estado ) AND  
								  ( "ATENCION_LOG"."FECHA" = :gdt_fec_sistema ) AND  
								  ( "ATENCION_LOG"."USUARIO" = :gs_user ) AND  
								  ( "ATENCION_LOG"."BASE" = :gs_base ) AND  
								  ( "ATENCION_LOG"."SERIE" = :gs_serie ) AND  
								  ( "ATENCION_LOG"."NUMERO" = :gi_numero )   ;
						if ll_count_reg_atencion = 0 then
							ls_glosa						= 'SE GENERA NUEVA CUPONERA POR MOTIVO REPACTACION CAMBIO DE FECHA EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy')
							INSERT INTO "ATENCION_LOG"  
											( "RUT"  ,	"ESTADO"  ,"FECHA"  ,			"GLOSA",		"USUARIO" ,		"BASE"  ,		"SERIE"  ,	"NUMERO" )  
							VALUES 		( :ll_rut,		:ls_estado,	:gdt_fec_sistema,	:ls_glosa,	:gs_user,		:gs_base,	:gs_serie,	:gi_numero)  ;
							if sqlca.sqlcode <> 0 then
								messagebox('Error','Error al Grabar '+sqlca.SQLErrText,information!)
								ROLLBACK;
							else
								commit;
							end if
						end if
//						DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
//						EXECUTE sp_proc_modifica_cuponera;
					end if
					///// fin nuevo mirko 11/09/2020
//					DECLARE sp_mod_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
//					EXECUTE sp_mod_cadena_mora;
//					
//					SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
//					INTO 		:ldt_fec_venc_mant  
//					FROM 		"CADENA_MORA"  
//					WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
//							 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
//							 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
//					USING		sqlca;
//					
//					SELECT	"CUPONERAS"."NUMERO"  
//					INTO 		:ll_count_vig  
//					FROM 		"CUPONERAS"  
//					WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
//							 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
//							 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
//							 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
//					using		SQLCA;
//					if sqlca.sqlcode = 0 and ll_count_vig > 0 then
//						DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
//						EXECUTE sp_proc_modifica_cuponera;
//					end if
				else
					rollback;
				end if
				if isvalid(w_cuenta_corriente_aumento_capacidad) then
					w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
					w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
				end if
			else
				rollback;
			end if
		else
			rollback;
			messagebox("Error SQL","Error SQL: "+sqlca.sqlerrtext)
		end if
	end if
elseif sqlca.sqlcode=100 then
	messagebox("Advertencia","No Existe Promesa "+gs_base+'-'+gs_serie+'-'+string(gi_numero))
elseif sqlca.sqlcode=-1 then
	messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
end if
end subroutine

public subroutine wf_grabar_repacta_compraventa ();date		ld_fec_1er_vcto,ld_fec_vcto,ld_fec_prox_pago
datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_ult,ldt_fecha_entre,ldt_fecha_pie,ldt_fecha_mod,ldt_fecha_fact,ldt_fecha_hoy,ldt_fecha_m,ldt_fec_venc_mant,ldt_fecha_prim_pie
Long		ll_correlativo,ll_capacidad,ll_des_esp,ll_nro_cuotas,ll_parque,ll_derecho_lib,ll_gastos_adm,	ll_factura,ll_pie_pagado,ll_cod_Parque,ll_rut,&
			ll_count_vig,ll_codigo_tipo_seguro,ll_ctas_pac_pie,ll_ctas_pag_pie,ll_count_reg_atencion
String		ls_serie,ls_n_reduccion,ls_moneda,ls_modificado,ls_area,ls_sector,ls_sepultura,ls_carta_bienv,ls_nro_tecnico,ls_dv,ls_obs_sepultura,&
			ls_dicom,ls_base,ls_glosa,ls_estado='67'
Double	ll_pie,ll_tasa,ll_valor_cuota,ll_uf_dia,ll_total_fact,ldb_valor_cuota_m,ll_numero,ll_ult_folio,ll_nro_oferta,ll_folio,ll_precio,ldb_tasa_base,	ldb_tasa_interes_cuota

ldt_fecha				= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy		= datetime(idt_fecha_hoy,time("00:00:00"))
ld_fec_1er_vcto	= date(dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecrep_1_vcto'))
ld_fec_vcto			= date(dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecrep_ult_vcto'))
ld_fec_prox_pago	= date(dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecha_prox_vcto'))
ll_numero			= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_numero')
ll_correlativo		= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_correlativo')
SELECT	"OFERTA_V"."ULT_FOLIO",
			"CADENA"."COD_PARQUE",
			"OFERTA_V"."RUT",
			"CLIENTE"."DV",
			"OFERTA_V"."VALOR_CUOTA_M",
			"OFERTA_V"."FECHA_M"
INTO 		:ll_ult_folio,
			:ll_cod_parque,
			:ll_rut,
			:ls_dv,
			:ldb_valor_cuota_m,
			:ldt_fecha_m
FROM 	"OFERTA_V",   
			"PAGO_OFERTA",   
			"CADENA",
			"CLIENTE"
WHERE 	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
			( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
			( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
			( "OFERTA_V"."RUT" = "CLIENTE"."RUT" ) and
			( "PAGO_OFERTA"."SERIE" = "CADENA"."SERIE" ) and  
			( "PAGO_OFERTA"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
			( ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
			( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) AND  
			( "CADENA"."CODIGO" = :gs_base ) ) 
Using		sqlca;
if sqlca.sqlcode=0 then // si existe rescata todo los datos
	SELECT	"PAGO_OFERTA"."SERIE",   "PAGO_OFERTA"."NRO_OFERTA",   "PAGO_OFERTA"."FECHA",   "PAGO_OFERTA"."FOLIO",   "PAGO_OFERTA"."PRECIO",   "PAGO_OFERTA"."PIE",   "PAGO_OFERTA"."TASA",   "PAGO_OFERTA"."CAPACIDAD",   "PAGO_OFERTA"."N_REDUCCION",   "PAGO_OFERTA"."VALOR_CUOTA",   "PAGO_OFERTA"."DES_ESP",   "PAGO_OFERTA"."NRO_CUOTAS",   "PAGO_OFERTA"."UF_DIA",   "PAGO_OFERTA"."MONEDA",   "PAGO_OFERTA"."FECHA_PRIM",   "PAGO_OFERTA"."FECHA_ULT",   "PAGO_OFERTA"."FECHA_ENTRE",   "PAGO_OFERTA"."FECHA_PIE",   "PAGO_OFERTA"."MODIFICADO",   "PAGO_OFERTA"."FECHA_MOD",   "PAGO_OFERTA"."AREA",   "PAGO_OFERTA"."PARQUE",   "PAGO_OFERTA"."SECTOR",   "PAGO_OFERTA"."SEPULTURA",   "PAGO_OFERTA"."DERECHO_LIB",   "PAGO_OFERTA"."GASTOS_ADM",   "PAGO_OFERTA"."FACTURA",   "PAGO_OFERTA"."FECHA_FACT",   "PAGO_OFERTA"."TOTAL_FACT",   "PAGO_OFERTA"."CARTA_BIENV",   "PAGO_OFERTA"."PIE_PAGADO",   "PAGO_OFERTA"."NRO_TECNICO",   "PAGO_OFERTA"."OBS_SEPULTURA",   "PAGO_OFERTA"."TASA_BASE",   "PAGO_OFERTA"."CODIGO_TIPO_SEGURO",   "PAGO_OFERTA"."DICOM",   "PAGO_OFERTA"."CTAS_PACTADAS_PIE",   "PAGO_OFERTA"."CTAS_PAGADAS_PIE",   "PAGO_OFERTA"."FECHA_PRIM_PIE",   "PAGO_OFERTA"."BASE",   "PAGO_OFERTA"."TASA_INTERES_CUOTA"
	INTO 		:ls_serie,   					 :ll_nro_oferta,   							 :ldt_fecha,   			  		:ll_folio,   						:ll_precio,   				  			:ll_pie,   						:ll_tasa,   				 	:ll_capacidad,   						:ls_n_reduccion,   				 			:ll_valor_cuota,   				  			:ll_des_esp,   				 		 :ll_nro_cuotas,   				 		 :ll_uf_dia,   				 		:ls_moneda,   					:ldt_fecha_prim,   						:ldt_fecha_ult,   			  			:ldt_fecha_entre,   						:ldt_fecha_pie,   			  		:ls_modificado,   				  		:ldt_fecha_mod,   						 :ls_area,   						 :ll_parque,   						:ls_sector,   				  		:ls_sepultura,   				 	:ll_derecho_lib,   				 		 :ll_gastos_adm,   				  			:ll_factura,   				 		 :ldt_fecha_fact,   			 			 :ll_total_fact,   				  			:ls_carta_bienv,   						:ll_pie_pagado,   						:ls_nro_tecnico  ,							:ls_obs_sepultura,								:ldb_tasa_base,					:ll_codigo_tipo_seguro,								:ls_dicom,						:ll_ctas_pac_pie,									:ll_ctas_pag_pie,									:ldt_fecha_prim_pie,						:ls_base,							:ldb_tasa_interes_cuota
	FROM 	"PAGO_OFERTA"  
	WHERE 	( "PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
				( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) AND  
				( "PAGO_OFERTA"."FOLIO" = :ll_ult_folio )   
	Using		sqlca;
	if sqlca.sqlcode=0 then // incrementa 1 el folio y lo inserta en pago_oferta
		ll_folio		= Double(string(ll_numero)+string(ll_correlativo))
		INSERT INTO "PAGO_OFERTA"  
				 ( "SERIE",   "NRO_OFERTA",   "FECHA",   		"FOLIO",   "PRECIO",   "PIE",   "TASA",   "CAPACIDAD",   "N_REDUCCION",   "VALOR_CUOTA",   	"DES_ESP",   "NRO_CUOTAS",   "UF_DIA",   "MONEDA",   "FECHA_PRIM",   	"FECHA_ULT",   "FECHA_ENTRE",   "FECHA_PIE",   "MODIFICADO",   "FECHA_MOD",   	"AREA",   "PARQUE",   "SECTOR",   "SEPULTURA",   "DERECHO_LIB",   "GASTOS_ADM",   "FACTURA",   "FECHA_FACT",   "TOTAL_FACT",   "CARTA_BIENV",   "PIE_PAGADO",   "NRO_TECNICO",   "OBS_SEPULTURA",   "TASA_BASE",   "CODIGO_TIPO_SEGURO",   "DICOM",   "CTAS_PACTADAS_PIE",   "CTAS_PAGADAS_PIE",   "FECHA_PRIM_PIE",   "BASE",   "TASA_INTERES_CUOTA" )  
		VALUES ( :ls_serie, :ll_nro_oferta, :ldt_fecha_hoy,	:ll_folio, 	:ll_precio, 	:ll_pie, :ll_tasa, 	:ll_capacidad, 	:ls_n_reduccion, 	:ll_valor_cuota, 		:ll_des_esp, :ll_nro_cuotas, 	:ll_uf_dia, 	:ls_moneda, :ld_fec_1er_vcto, 	:ld_fec_vcto, 	:ldt_fecha_entre,	:ldt_fecha_pie,	:ls_modificado, 	:ldt_fecha_mod,   :ls_area, :ll_parque, 	:ls_sector, 	:ls_sepultura, 	:ll_derecho_lib, 		:ll_gastos_adm, :ll_factura, 		:ldt_fecha_fact,	:ll_total_fact, 		:ls_carta_bienv, 	:ll_pie_pagado, 	:ls_nro_tecnico,	:ls_obs_sepultura,		:ldb_tasa_base,:ll_codigo_tipo_seguro,		:ls_dicom, :ll_ctas_pac_pie,				:ll_ctas_pag_pie,			:ldt_fecha_prim_pie,	:ls_base,	 :ldb_tasa_interes_cuota )  
		Using	sqlca;
		if sqlca.sqlcode=0 then
			commit;
			//INSERTAR SEGURO ASOCIADO GRABAR LOS SEGUROS ANTES AL INGRESAR
			UPDATE	"OFERTA_V"  
			SET 		"ULT_FOLIO" = :ll_folio  
			WHERE 	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
						( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) 
			Using		sqlca ;
			if sqlca.sqlcode=0 then
				commit;
				INSERT INTO "CUPONERAS_MODIFICA"  
							( "BASE",		"SERIE",		"NUMERO",	"FECHA_CREA",	"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",			"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",	"FECHA_PRIM",		"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
				VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,				'V',					:ll_nro_cuotas,	:ll_rut,	:ls_dv,	:ll_valor_cuota,				:ldb_valor_cuota_m,		:ll_cod_parque,		:ld_fec_1er_vcto,	:ldt_fecha_m,		:ls_moneda,		'C' )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					
					DECLARE sp_mod_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
					EXECUTE sp_mod_cadena_mora;
					
//					SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
//					INTO 		:ldt_fec_venc_mant  
//					FROM 	"CADENA_MORA"  
//					WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
//							 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
//							 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
//					USING	sqlca;
					ldt_fec_venc_mant		= ldt_fecha_m
					SELECT	"CUPONERAS"."NUMERO"  
					INTO 		:ll_count_vig  
					FROM 	"CUPONERAS"  
					WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
							 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
							 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
							 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
					using		SQLCA;
					if sqlca.sqlcode = 0 and ll_count_vig > 0 then
						UPDATE 		"CUPONERAS"  
						SET 			"ESTADO_CUPONERA" = 'R'  
						WHERE 	   ( "CUPONERAS"."BASE" = :gs_base ) AND  
										( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )  
						USING		sqlca;
						if sqlca.sqlcode=0 THEN
							commit;
							UPDATE 	"CUPONERAS_DETALLE"  
							SET 		"ESTADO_PAGO_CUPON" = 'A'  
							WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
									  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
									  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
									  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )  
							USING		sqlca;
							if sqlca.sqlcode=0 THEN
								commit;
							else
								rollback;
							end if
						else
							rollback;
						end if
//						DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :as_base, :as_serie, :al_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda);
//						EXECUTE sp_proc_genera_cuponera;
						
						DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda);
						EXECUTE sp_proc_genera_cuponera;
						
						SELECT 	Count("ATENCION_LOG"."RUT")
						INTO 		:ll_count_reg_atencion  
						FROM 	"ATENCION_LOG"  
						WHERE ( "ATENCION_LOG"."RUT" = :gi_rut ) AND  
								  ( "ATENCION_LOG"."ESTADO" = :ls_estado ) AND  
								  ( "ATENCION_LOG"."FECHA" = :gdt_fec_sistema ) AND  
								  ( "ATENCION_LOG"."USUARIO" = :gs_user ) AND  
								  ( "ATENCION_LOG"."BASE" = :gs_base ) AND  
								  ( "ATENCION_LOG"."SERIE" = :gs_serie ) AND  
								  ( "ATENCION_LOG"."NUMERO" = :gi_numero )   ;
						if ll_count_reg_atencion = 0 then
							ls_glosa						= 'SE GENERA NUEVA CUPONERA POR MOTIVO REPACTACION CAMBIO DE FECHA EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy')
							INSERT INTO "ATENCION_LOG"  
											( "RUT"  ,	"ESTADO"  ,"FECHA"  ,			"GLOSA",		"USUARIO" ,		"BASE"  ,		"SERIE"  ,	"NUMERO" )  
							VALUES 		( :ll_rut,		:ls_estado,	:gdt_fec_sistema,	:ls_glosa,	:gs_user,		:gs_base,	:gs_serie,	:gi_numero)  ;
							if sqlca.sqlcode <> 0 then
								messagebox('Error','Error al Grabar '+sqlca.SQLErrText,information!)
								ROLLBACK;
							else
								commit;
							end if
						end if
//						DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
//						EXECUTE sp_proc_modifica_cuponera;
					end if
				else
					rollback;
				end if
				if isvalid(w_cuenta_corriente_oferta) then
					w_cuenta_corriente_oferta.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
					w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
				end if
			else
				rollback;
			end if
		else
			rollback;
			messagebox("Error SQL","Error SQL: "+sqlca.sqlerrtext)
		end if
	end if
elseif sqlca.sqlcode=100 then
	messagebox("Advertencia","No Existe Promesa "+gs_base+'-'+gs_serie+'-'+string(gi_numero))
elseif sqlca.sqlcode=-1 then
	messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
end if
end subroutine

public subroutine wf_grabar_repacta_liberador ();date		ld_fec_1er_vcto,ld_fec_vcto,ld_fec_prox_pago
datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_ult,ldt_fecha_entre,ldt_fecha_pie,ldt_fecha_mod,&
			ldt_fecha_fact,ldt_fecha_hoy,ldt_fecha_m,ldt_fec_venc_mant,ldt_fecha_prim_pie
Long		ll_correlativo,ll_capacidad,ll_des_esp,ll_nro_cuotas,ll_parque,ll_derecho_lib,ll_gastos_adm,	ll_factura,ll_pie_pagado,ll_cod_Parque,ll_rut,ll_count_vig,&
			ll_ctas_pag_pie,ll_anno_liberar,ll_ctas_pac_pie,ll_count_reg_atencion
String		ls_serie,ls_n_reduccion,ls_moneda,ls_modificado,ls_area,ls_sector,ls_sepultura,ls_carta_bienv,ls_nro_tecnico,ls_dv,ls_base,ls_glosa,ls_estado='67'
Double	ll_pie,ll_tasa,ll_valor_cuota,ll_uf_dia,ll_total_fact,ldb_valor_cuota_m=0,ll_numero,ll_ult_folio,ll_nro_aumento,ll_folio,ldb_tasa_base,&
			ldb_tasa_interes_cuota,ll_precio

SetNull(ldt_fecha_m)
ldt_fecha				= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy		= datetime(idt_fecha_hoy,time("00:00:00"))
ld_fec_1er_vcto	= date(dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecrep_1_vcto'))		//Fecha Nueva Prim
ld_fec_vcto			= date(dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecrep_ult_vcto'))	//Fecha Nueva ultima
ld_fec_prox_pago	= date(dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecha_prox_vcto'))
ll_numero			= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_numero')
ll_correlativo		= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_correlativo')
// ver si existe en anexo_capacidad y rescatar ult_folio
SELECT	"ANEXO_LIBERADOR"."ULT_FOLIO",
			"CADENA"."COD_PARQUE",
			"ANEXO_LIBERADOR"."RUT",
			"CLIENTE"."DV"
INTO 		:ll_ult_folio,
			:ll_cod_parque,
			:ll_rut,
			:ls_dv
FROM 	"ANEXO_LIBERADOR",   
			"CADENA",   
			"PAGO_LIBERADOR",
			"CLIENTE"
WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
		 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
		 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
		 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
		 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
		 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
		 ( "ANEXO_LIBERADOR"."RUT" = "CLIENTE"."RUT" ) and
		 (("ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
		 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) and
		 ( "CADENA"."CODIGO" = :gs_base ))   
Using		sqlca;

if sqlca.sqlcode=0 then // si existe rescata todo los datos
	SELECT	"PAGO_LIBERADOR"."SERIE_M",  "PAGO_LIBERADOR"."NRO_LIBERADOR", "PAGO_LIBERADOR"."FECHA", "PAGO_LIBERADOR"."FOLIO", "PAGO_LIBERADOR"."PRECIO",   "PAGO_LIBERADOR"."PIE_PAGADO",  "PAGO_LIBERADOR"."PIE",   "PAGO_LIBERADOR"."TASA",  "PAGO_LIBERADOR"."VALOR_CUOTA", "PAGO_LIBERADOR"."NRO_CUOTAS",  "PAGO_LIBERADOR"."UF_DIA",   "PAGO_LIBERADOR"."MONEDA",   "PAGO_LIBERADOR"."FECHA_PRIM",  "PAGO_LIBERADOR"."FECHA_ULT",   "PAGO_LIBERADOR"."FECHA_PIE",   "PAGO_LIBERADOR"."MODIFICADO",  "PAGO_LIBERADOR"."FECHA_MOD",   "PAGO_LIBERADOR"."GASTOS_ADM",	 "PAGO_LIBERADOR"."TASA_BASE",	"PAGO_LIBERADOR"."CTAS_PAGADAS_PIE",		"PAGO_LIBERADOR"."FECHA_PRIM_PIE",		"PAGO_LIBERADOR"."BASE",	"PAGO_LIBERADOR"."ANNO_LIBERAR",	"PAGO_LIBERADOR"."CTAS_PACTADAS_PIE",	"PAGO_LIBERADOR"."TASA_INTERES_CUOTA"
	INTO 		:ls_serie,   								:ll_nro_aumento,   							:ldt_fecha,   					:ll_folio,   							:ll_precio,   							:ll_pie_pagado,   							:ll_pie,   							:ll_tasa,   							:ll_valor_cuota,   							:ll_nro_cuotas,   							:ll_uf_dia,   								:ls_moneda,   						:ldt_fecha_prim,   							:ldt_fecha_ult,   							:ldt_fecha_pie,   						:ls_modificado,   							:ldt_fecha_mod,   							:ll_gastos_adm ,								:ldb_tasa_base,							:ll_ctas_pag_pie,										:ldt_fecha_prim_pie,								:ls_base,								:ll_anno_liberar,								:ll_ctas_pac_pie,										:ldb_tasa_interes_cuota
	FROM 	"PAGO_LIBERADOR"  
	WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
			   ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND
			   ( "PAGO_LIBERADOR"."FOLIO" = :ll_ult_folio )
	USING	sqlca;
	if sqlca.sqlcode=0 then // incrementa 1 el folio y lo inserta en PAGO_LIBERADOR
		ll_folio				= Double(string(ll_numero)+string(ll_correlativo))
		ldt_fecha_prim		= datetime(date(ld_fec_1er_vcto),time('00:00:00'))
		ldt_fecha_ult		= datetime(date(ld_fec_vcto),time('00:00:00'))
		INSERT INTO	"PAGO_LIBERADOR"  
					( "SERIE_M",   "NRO_LIBERADOR",  "FECHA",   		"FOLIO",   	"PRECIO",   "PIE_PAGADO",   "PIE",   "TASA",   "VALOR_CUOTA",   "NRO_CUOTAS",   "UF_DIA",   "MONEDA",   "FECHA_PRIM",   	"FECHA_ULT",   	"FECHA_PIE",   	"MODIFICADO",   "FECHA_MOD",   	"GASTOS_ADM",	 "TASA_BASE",		"CTAS_PAGADAS_PIE",		"FECHA_PRIM_PIE",		"BASE",		"ANNO_LIBERAR",	"CTAS_PACTADAS_PIE",	"TASA_INTERES_CUOTA" )  
		VALUES 	( :ls_serie,		:ll_nro_aumento,		:ldt_fecha, :ll_folio, 		:ll_precio, 	:ll_pie_pagado, :ll_pie, :ll_tasa, 	:ll_valor_cuota, 	:ll_nro_cuotas, 		:ll_uf_dia, 	:ls_moneda, :ldt_fecha_prim,	:ldt_fecha_ult,		:ldt_fecha_pie,   :ls_modificado, :ldt_fecha_mod,		:ll_gastos_adm,	:ldb_tasa_base,	:ll_ctas_pag_pie,				:ldt_fecha_prim_pie,		:ls_base,		:ll_anno_liberar,	:ll_ctas_pac_pie,			:ldb_tasa_interes_cuota )  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			UPDATE	"ANEXO_LIBERADOR"  
			SET 		"ULT_FOLIO" = :ll_folio  
			WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
					   ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )   
			Using		sqlca ;
			if sqlca.sqlcode=0 then
				commit;
				INSERT INTO "CUPONERAS_MODIFICA"  
							( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",		"FECHA_PRIM",		"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
				VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_nro_cuotas,	:ll_rut,	:ls_dv,	:ll_valor_cuota,		0,							:ll_cod_parque,	:ldt_fecha_prim,	:ldt_fecha_m,		:ls_moneda,	'C' )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
					///// nuevo mirko 11/09/2020
					DECLARE sp_mod_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
					EXECUTE sp_mod_cadena_mora;
					
					SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
					INTO 		:ldt_fec_venc_mant  
					FROM 	"CADENA_MORA"  
					WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
							 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
							 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
					USING	sqlca;
					
					SELECT	"CUPONERAS"."NUMERO"  
					INTO 		:ll_count_vig  
					FROM 	"CUPONERAS"  
					WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
							 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
							 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
							 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
					using		SQLCA;
					if sqlca.sqlcode = 0 and ll_count_vig > 0 then
						UPDATE 		"CUPONERAS"  
						SET 			"ESTADO_CUPONERA" = 'R'  
						WHERE 	   ( "CUPONERAS"."BASE" = :gs_base ) AND  
										( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )  
						USING		sqlca;
						if sqlca.sqlcode=0 THEN
							commit;
							UPDATE 	"CUPONERAS_DETALLE"  
							SET 		"ESTADO_PAGO_CUPON" = 'A'  
							WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
									  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
									  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
									  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )  
							USING		sqlca;
							if sqlca.sqlcode=0 THEN
								commit;
							else
								rollback;
							end if
						else
							rollback;
						end if
//						DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :as_base, :as_serie, :al_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda);
//						EXECUTE sp_proc_genera_cuponera;
						
						DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda);
						EXECUTE sp_proc_genera_cuponera;
						
						SELECT 	Count("ATENCION_LOG"."RUT")
						INTO 		:ll_count_reg_atencion  
						FROM 	"ATENCION_LOG"  
						WHERE ( "ATENCION_LOG"."RUT" = :gi_rut ) AND  
								  ( "ATENCION_LOG"."ESTADO" = :ls_estado ) AND  
								  ( "ATENCION_LOG"."FECHA" = :gdt_fec_sistema ) AND  
								  ( "ATENCION_LOG"."USUARIO" = :gs_user ) AND  
								  ( "ATENCION_LOG"."BASE" = :gs_base ) AND  
								  ( "ATENCION_LOG"."SERIE" = :gs_serie ) AND  
								  ( "ATENCION_LOG"."NUMERO" = :gi_numero )   ;
						if ll_count_reg_atencion = 0 then
							ls_glosa						= 'SE GENERA NUEVA CUPONERA POR MOTIVO REPACTACION CAMBIO DE FECHA EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy')
							INSERT INTO "ATENCION_LOG"  
											( "RUT"  ,	"ESTADO"  ,"FECHA"  ,			"GLOSA",		"USUARIO" ,		"BASE"  ,		"SERIE"  ,	"NUMERO" )  
							VALUES 		( :ll_rut,		:ls_estado,	:gdt_fec_sistema,	:ls_glosa,	:gs_user,		:gs_base,	:gs_serie,	:gi_numero)  ;
							if sqlca.sqlcode <> 0 then
								messagebox('Error','Error al Grabar '+sqlca.SQLErrText,information!)
								ROLLBACK;
							else
								commit;
							end if
						end if
//						DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
//						EXECUTE sp_proc_modifica_cuponera;
					end if
					///// fin nuevo mirko 11/09/2020
//					DECLARE sp_mod_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
//					EXECUTE sp_mod_cadena_mora;
//					
//					SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
//					INTO 		:ldt_fec_venc_mant  
//					FROM 	"CADENA_MORA"  
//					WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
//							   ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
//							   ( "CADENA_MORA"."NUMERO" = :gi_numero )   
//					USING	sqlca;
//					
//					SELECT	"CUPONERAS"."NUMERO"  
//					INTO 		:ll_count_vig  
//					FROM 	"CUPONERAS"  
//					WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
//							   ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
//							   ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
//							   ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
//					using		SQLCA;
//					if sqlca.sqlcode = 0 and ll_count_vig > 0 then
//						DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
//						EXECUTE sp_proc_modifica_cuponera;
//					end if
				else
					rollback;
				end if
				if isvalid(w_cuenta_corriente_liberador) then
					w_cuenta_corriente_liberador.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
					w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
				end if
			else
				rollback;
			end if
		else
			rollback;
			messagebox("Error SQL","Error SQL: "+sqlca.sqlerrtext)
		end if
	end if
elseif sqlca.sqlcode=100 then
	messagebox("Advertencia","No Existe Promesa "+gs_base+'-'+gs_serie+'-'+string(gi_numero))
elseif sqlca.sqlcode=-1 then
	messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
end if
end subroutine

public subroutine wf_grabar_repacta_pagare ();date		ld_fec_1er_vcto,ld_fec_vcto,ld_fec_prox_pago
datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_ult,ldt_fecha_entre,ldt_fecha_pie,ldt_fecha_mod,&
			ldt_fecha_fact,ldt_fecha_hoy,ld_fec_1er_vcto1,ld_fec_vcto1,ldt_fecha_m,ldt_fec_venc_mant
Long		ll_correlativo,ll_precio,ll_capacidad,ll_des_esp,ll_nro_cuotas,ll_parque,ll_derecho_lib,ll_gastos_adm,&
			ll_factura,ll_pie_pagado,ll_cod_parque,ll_rut,ll_count_vig,ll_count_reg_atencion
String	ls_serie,ls_n_reduccion,ls_moneda,ls_modificado,ls_area,ls_sector,ls_sepultura,ls_carta_bienv,ls_nro_tecnico,ls_glosa,ls_dv,ls_estado='67'
Double	ll_pie,ll_tasa,ll_valor_cuota,ll_uf_dia,ll_total_fact,ldb_valor_cuota_m=0,ll_numero,ll_ult_folio,ll_nro_aumento,ll_folio

Setnull(ldt_fecha_m)
ldt_fecha			= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy		= datetime(idt_fecha_hoy,time("00:00:00"))
ld_fec_1er_vcto1	= dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecrep_1_vcto')
ld_fec_vcto1		= dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecrep_ult_vcto')
ld_fec_prox_pago	= date(dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecha_prox_vcto'))
ll_numero			= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_numero')
ll_correlativo		= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_correlativo')
// ver si existe en anexo_capacidad y rescatar ult_folio
SELECT	"CLIENTE"."RUT",	"CLIENTE"."DV",	"PAGARE"."PLAZO",	"PAGARE"."VALOR_CUO",	"CADENA"."COD_PARQUE",	"PAGARE"."MONEDA"
INTO		:ll_rut,				:ls_dv,				:ll_nro_cuotas,	:ll_valor_cuota,			:ll_cod_parque,			:ls_moneda
FROM 		"PAGARE",	"CADENA",	"CLIENTE"  
WHERE  ( "PAGARE"."SERIE_P" = "CADENA"."SERIE" ) and  
		 ( "PAGARE"."NRO_PAGARE" = "CADENA"."NUMERO" ) and 
		 ( "CADENA"."RUT" = "CLIENTE"."RUT") AND  
		 ( "CADENA"."CODIGO" = :gs_base ) AND  
		 ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
		 ( "PAGARE"."NRO_PAGARE" = :gi_numero  )   
USING		sqlca;
if sqlca.sqlcode=0 then
	UPDATE	"PAGARE"  
	SET 		"FECHA_PRIM" = :ld_fec_1er_vcto1,   
				"FECHA_ULT" = :ld_fec_vcto1  
	WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
			 ( "PAGARE"."NRO_PAGARE" = :gi_numero )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		commit;
		
		DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
		EXECUTE sp_nuevo_cadena_mora;
		
		INSERT INTO "CUPONERAS_MODIFICA"  
					( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",		"FECHA_PRIM",			"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
		VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_nro_cuotas,	:ll_rut,	:ls_dv,	:ll_valor_cuota,		0,							:ll_cod_parque,	:ld_fec_1er_vcto1,	:ldt_fecha_m,		:ls_moneda,	'C' )  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			///// nuevo mirko 11/09/2020
			DECLARE sp_mod_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
			EXECUTE sp_mod_cadena_mora;
			
			SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
			INTO 		:ldt_fec_venc_mant  
			FROM 	"CADENA_MORA"  
			WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
					 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
					 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
			USING	sqlca;
			
			SELECT	"CUPONERAS"."NUMERO"  
			INTO 		:ll_count_vig  
			FROM 	"CUPONERAS"  
			WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
					 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
					 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
					 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
			using		SQLCA;
			if sqlca.sqlcode = 0 and ll_count_vig > 0 then
				UPDATE 		"CUPONERAS"  
				SET 			"ESTADO_CUPONERA" = 'R'  
				WHERE 	   ( "CUPONERAS"."BASE" = :gs_base ) AND  
								( "CUPONERAS"."SERIE" = :gs_serie ) AND  
								( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
								( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )  
				USING		sqlca;
				if sqlca.sqlcode=0 THEN
					commit;
					UPDATE 	"CUPONERAS_DETALLE"  
					SET 		"ESTADO_PAGO_CUPON" = 'A'  
					WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
							  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
							  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
							  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )  
					USING		sqlca;
					if sqlca.sqlcode=0 THEN
						commit;
					else
						rollback;
					end if
				else
					rollback;
				end if
//						DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :as_base, :as_serie, :al_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda);
//						EXECUTE sp_proc_genera_cuponera;
				
				DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda);
				EXECUTE sp_proc_genera_cuponera;
				
				SELECT 	Count("ATENCION_LOG"."RUT")
				INTO 		:ll_count_reg_atencion  
				FROM 	"ATENCION_LOG"  
				WHERE ( "ATENCION_LOG"."RUT" = :gi_rut ) AND  
						  ( "ATENCION_LOG"."ESTADO" = :ls_estado ) AND  
						  ( "ATENCION_LOG"."FECHA" = :gdt_fec_sistema ) AND  
						  ( "ATENCION_LOG"."USUARIO" = :gs_user ) AND  
						  ( "ATENCION_LOG"."BASE" = :gs_base ) AND  
						  ( "ATENCION_LOG"."SERIE" = :gs_serie ) AND  
						  ( "ATENCION_LOG"."NUMERO" = :gi_numero )   ;
				if ll_count_reg_atencion = 0 then
					ls_glosa						= 'SE GENERA NUEVA CUPONERA POR MOTIVO REPACTACION CAMBIO DE FECHA EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy')
					INSERT INTO "ATENCION_LOG"  
									( "RUT"  ,	"ESTADO"  ,"FECHA"  ,			"GLOSA",		"USUARIO" ,		"BASE"  ,		"SERIE"  ,	"NUMERO" )  
					VALUES 		( :ll_rut,		:ls_estado,	:gdt_fec_sistema,	:ls_glosa,	:gs_user,		:gs_base,	:gs_serie,	:gi_numero)  ;
					if sqlca.sqlcode <> 0 then
						messagebox('Error','Error al Grabar '+sqlca.SQLErrText,information!)
						ROLLBACK;
					else
						commit;
					end if
				end if
//						DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
//						EXECUTE sp_proc_modifica_cuponera;
			end if
			///// fin nuevo mirko 11/09/2020
			
			
//			SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
//			INTO 		:ldt_fec_venc_mant  
//			FROM 		"CADENA_MORA"  
//			WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
//					 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
//					 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
//			USING		sqlca;
//			
//			SELECT	"CUPONERAS"."NUMERO"  
//			INTO 		:ll_count_vig  
//			FROM 		"CUPONERAS"  
//			WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
//					 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
//					 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
//					 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
//			using		SQLCA;
//			if sqlca.sqlcode = 0 and ll_count_vig > 0 then
//				DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto1, :ldt_fec_venc_mant, :ls_moneda, 'C' );
//				EXECUTE sp_proc_modifica_cuponera;
//			end if
		else
			rollback;
			messagebox("Error Grabar","Error Insertar Cuponera SQL: "+sqlca.sqlerrtext)
		end if
		if isvalid(w_cuenta_corriente_pagare) then
			w_cuenta_corriente_pagare.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
			w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
		end if
	else
		rollback;
		messagebox("Error Grabar","Error Actualizar Pagaré SQL: "+sqlca.sqlerrtext)
	end if
elseif sqlca.sqlcode=100 then
	messagebox("Advertencia","No Existe Pagaré "+gs_base+'-'+gs_serie+'-'+string(gi_numero))
elseif sqlca.sqlcode=-1 then
	messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
end if
end subroutine

public subroutine wf_print_ctto_rescilia (long al_cod_parque);if gs_conexion	= "Parque El Prado" then
	if gs_base='C' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_stgo_isacruz'
	elseif gs_base='O' and gi_numero>=21506 then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_stgo_o_mayor21506'
	elseif gs_base='O' and gi_numero<21506 then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_stgo_o_menor21506'
	elseif gs_base='A' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_stgo_a_aumento'
	elseif gs_base='L' then
		if al_cod_parque=1 then
			dw_print_ctto.dataobject	= 'dw_print_ctto_rescilia_prado_liberador'
		elseif al_cod_parque=102 then
			dw_print_ctto.dataobject	= 'dw_print_ctto_rescilia_manantial_libera'
		elseif al_cod_parque=103 then
			dw_print_ctto.dataobject	= 'dw_print_ctto_rescilia_stgo_a_libera'
		end if
	elseif gs_base='F' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_funeraria'
	end if
elseif gs_conexion	= "Parque La Foresta" then
	if gs_base='C' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_serena_isacruz'
	elseif gs_base='O' and gi_numero>=4251 then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_sere_o_mayor4251'
	elseif gs_base='O' and gi_numero<4251 then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_sere_o_menor4251'
	elseif gs_base='A' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_sere_a_aumento'
	elseif gs_base='L' then
		if al_cod_parque=11 then
			dw_print_ctto.dataobject	= 'dw_print_ctto_rescilia_foresta_libera'
		end if
	elseif gs_base='F' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_sere_funeraria'
	end if
elseif gs_conexion	= "Parque Concepción" then
	if gs_base='C' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_conce_isacruz'
	elseif gs_base='O' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_conce'
//	elseif gs_base='O' and gi_numero<4251 then
//		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_stgo_o_menor21506'
	elseif gs_base='A' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_conce_aumento'
	elseif gs_base='L' then
		if al_cod_parque=801 then
			dw_print_ctto.dataobject	= 'dw_print_ctto_rescilia_concep_libera'
		end if
	end if
end if
dw_print_ctto.settransobject(sqlca)					
if gs_base='C' or gs_base='O' or gs_base='A' or gs_base='L' or gs_base='F' then
	if dw_print_ctto.retrieve(gs_base,gs_serie,gi_numero,il_corr)>0 then
		f_Print( dw_print_ctto )
		dw_print_ctto.print()
	end if
else
	messagebox("Advertercia","Solo se puede imprimir Contrato / Promesas / Anexo Liberador / Aumento Capacidad / Producto Funerario")
end if
end subroutine

public subroutine wf_actualizar_cadena_estado (string as_estado);if isvalid(w_listado_contratos) then
	w_listado_contratos.dw_listado.setitem(w_listado_contratos.dw_listado.getrow(),'cadena_estado',as_estado)
end if
CHOOSE CASE gs_base
	CASE "O","U" // Oferta
		if isvalid(w_cuenta_corriente_oferta) then
			w_cuenta_corriente_oferta.dw_estado_cta_cte.setitem(1,'cadena_estado',as_estado)
		end if
	CASE "L" // Anexo Liberador
		if isvalid(w_cuenta_corriente_liberador) then
			w_cuenta_corriente_liberador.dw_estado_cta_cte.setitem(1,'cadena_estado',as_estado)
		end if
	CASE "P" // Pagaré
		if isvalid(w_cuenta_corriente_pagare) then
			w_cuenta_corriente_pagare.dw_estado_cta_cte.setitem(1,'cadena_estado',as_estado)
		end if
	CASE "C" // Contrato ISA	
		if isvalid(w_cuenta_corriente_contrato_isa) then
			w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.setitem(1,'cadena_estado',as_estado)
		end if
	CASE "D" // Derecho Especial
		if isvalid(w_cuenta_corriente_derecho) then
			w_cuenta_corriente_derecho.dw_estado_cta_cte.setitem(1,'cadena_estado',as_estado)
		end if
	CASE "R" //Repactación Ctas.Mantencion
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.setitem(1,'cadena_estado',as_estado)
		end if
	CASE "A" //Repactación Aumento Capacidad
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.setitem(1,'cadena_estado',as_estado)
		end if
	CASE "F" ,"G" // Anexo Funeraria
		if isvalid(w_cuenta_corriente_funeraria) then
			w_cuenta_corriente_funeraria.dw_estado_cta_cte.setitem(1,'cadena_estado',as_estado)
		end if
END CHOOSE
end subroutine

public subroutine wf_grabar_repacta_funeraria ();date		ld_fec_1er_vcto,ld_fec_vcto,ld_fec_prox_pago
datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_ult,ldt_fecha_entre,ldt_fecha_pie,ldt_fecha_mod,	ldt_fecha_fact,ldt_fecha_hoy,ldt_fecha_m,ldt_fec_venc_mant,ldt_fecha_pie_prim
Long		ll_correlativo,ll_precio,ll_capacidad,ll_des_esp,ll_nro_cuotas,ll_parque,ll_derecho_lib,ll_gastos_adm,ll_ctas_pie_plazo,ll_ctas_pie_pagadas,ll_codigo_servicio,&
			ll_factura,ll_pie_pagado,ll_cod_Parque,ll_rut,ll_count_vig,ll_count_reg_atencion
String		ls_serie,ls_n_reduccion,ls_moneda,ls_modificado,ls_area,ls_sector,ls_sepultura,ls_carta_bienv,ls_nro_tecnico,ls_dv,ls_base,ls_usuario_crea,ls_glosa,ls_estado='67'
Double	ll_pie,ll_tasa,ll_valor_cuota,ll_uf_dia,ll_total_fact,ldb_valor_cuota_m=0,ll_numero,ll_ult_folio,ll_nro_aumento,ll_folio,ldb_tasa_base,ldb_der_esp

SetNull(ldt_fecha_m)
ldt_fecha			= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy		= datetime(idt_fecha_hoy,time("00:00:00"))
ld_fec_1er_vcto	= date(dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecrep_1_vcto'))
ld_fec_vcto			= date(dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecrep_ult_vcto'))
ld_fec_prox_pago	= date(dw_reporte.getitemdatetime(il_row,'sol_repacta_cvta_fecha_prox_vcto'))
ll_numero			= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_numero')
ll_correlativo		= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_correlativo')
// ver si existe en anexo_capacidad y rescatar ult_folio
SELECT	"PRODUCTO_ANEXO"."ULT_FOLIO",
			"CADENA"."COD_PARQUE",
			"PRODUCTO_ANEXO"."RUT",
			"CLIENTE"."DV"
INTO 		:ll_ult_folio,
			:ll_cod_parque,
			:ll_rut,
			:ls_dv
FROM 	"PRODUCTO_ANEXO",   
			"CADENA",   
			"PRODUCTO_PAGO",
			"CLIENTE"
WHERE  ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
		 ( "PRODUCTO_ANEXO"."SERIE" = "CADENA"."SERIE" ) and  
		 ( "PRODUCTO_ANEXO"."NUMERO" = "CADENA"."NUMERO" ) and  
		 ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
		 ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
		 ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
		 ( "PRODUCTO_ANEXO"."RUT" = "CLIENTE"."RUT" ) and
		 (("PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
		 ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) and
		 ( "CADENA"."CODIGO" = :gs_base ))   
Using		sqlca;

if sqlca.sqlcode=0 then // si existe rescata todo los datos
	SELECT	"PRODUCTO_PAGO"."BASE",	"PRODUCTO_PAGO"."SERIE",  	"PRODUCTO_PAGO"."NUMERO", 	"PRODUCTO_PAGO"."FECHA", 	"PRODUCTO_PAGO"."FOLIO", 	"PRODUCTO_PAGO"."PRECIO",  	"PRODUCTO_PAGO"."PIE_PAGADO", 	"PRODUCTO_PAGO"."PIE",   "PRODUCTO_PAGO"."TASA", 	"PRODUCTO_PAGO"."VALOR_CUOTA", 	"PRODUCTO_PAGO"."PLAZO",  	"PRODUCTO_PAGO"."UF_DIA",  	"PRODUCTO_PAGO"."MONEDA", 	"PRODUCTO_PAGO"."FECHA_PRIM",  "PRODUCTO_PAGO"."FECHA_ULT",  	"PRODUCTO_PAGO"."FECHA_PIE",  	"PRODUCTO_PAGO"."GASTO_ADM" ,		"PRODUCTO_PAGO"."CTAS_PIE_PLAZO",		"PRODUCTO_PAGO"."CTAS_PIE_PAGADAS",		"PRODUCTO_PAGO"."CODIGO_SERVICIO",	"PRODUCTO_PAGO"."FECHA_PIE_PRIM",		"PRODUCTO_PAGO"."USUARIO_CREA",		"PRODUCTO_PAGO"."TASA_BASE",		"PRODUCTO_PAGO"."DER_ESP",		"PRODUCTO_PAGO"."FECHA_ENTRE",		"PRODUCTO_PAGO"."CAPACIDAD"
	INTO 		:ls_base,								:ls_serie,   							:ll_nro_aumento,   					:ldt_fecha,   						:ll_folio,   							:ll_precio,   								:ll_pie_pagado,   							:ll_pie,   							:ll_tasa,   							:ll_valor_cuota,   								:ll_nro_cuotas,   					:ll_uf_dia,   								:ls_moneda,   							:ldt_fecha_prim,   							:ldt_fecha_ult,   							:ldt_fecha_pie,   							:ll_gastos_adm ,								:ll_ctas_pie_plazo,									:ll_ctas_pie_pagadas,									:ll_codigo_servicio,								:ldt_fecha_pie_prim,								:ls_usuario_crea,									:ldb_tasa_base,								:ldb_der_esp,								:ldt_fecha_entre,								:ll_capacidad
	FROM 	"PRODUCTO_PAGO"  
	WHERE  ( "PRODUCTO_PAGO"."SERIE" = :gs_serie ) AND  
			   ( "PRODUCTO_PAGO"."NUMERO" = :gi_numero ) AND
			   ( "PRODUCTO_PAGO"."FOLIO" = :ll_ult_folio )
	USING	sqlca;
	if sqlca.sqlcode=0 then // incrementa 1 el folio y lo inserta en PRODUCTO_PAGO
		ll_folio					= Double(string(ll_numero)+string(ll_correlativo))
		INSERT INTO	"PRODUCTO_PAGO"  
					( "BASE",		"SERIE",   	"NUMERO",  		"PRODUCTO_PAGO"."FECHA", 	"PRODUCTO_PAGO"."FOLIO", 	"PRODUCTO_PAGO"."PRECIO",  	"PRODUCTO_PAGO"."PIE_PAGADO", 	"PRODUCTO_PAGO"."PIE",   "PRODUCTO_PAGO"."TASA", 	"PRODUCTO_PAGO"."VALOR_CUOTA", 	"PRODUCTO_PAGO"."PLAZO",  	"PRODUCTO_PAGO"."UF_DIA",  	"PRODUCTO_PAGO"."MONEDA", 	"PRODUCTO_PAGO"."FECHA_PRIM",  "PRODUCTO_PAGO"."FECHA_ULT",  	"PRODUCTO_PAGO"."FECHA_PIE",  	"PRODUCTO_PAGO"."GASTO_ADM",		"PRODUCTO_PAGO"."CTAS_PIE_PLAZO",		"PRODUCTO_PAGO"."CTAS_PIE_PAGADAS",		"PRODUCTO_PAGO"."CODIGO_SERVICIO",	"PRODUCTO_PAGO"."FECHA_PIE_PRIM",		"PRODUCTO_PAGO"."USUARIO_CREA",		"PRODUCTO_PAGO"."TASA_BASE",		"PRODUCTO_PAGO"."DER_ESP",		"PRODUCTO_PAGO"."FECHA_ENTRE",		"PRODUCTO_PAGO"."CAPACIDAD"  )
		VALUES 	( :ls_base,	:ls_serie,		:ll_nro_aumento,	:ldt_fecha,   						:ll_folio,   							:ll_precio,   								:ll_pie_pagado,   							:ll_pie,   							:ll_tasa,   							:ll_valor_cuota,   								:ll_nro_cuotas,   					:ll_uf_dia,   								:ls_moneda,   							:ldt_fecha_prim,   							:ldt_fecha_ult,   							:ldt_fecha_pie,   							:ll_gastos_adm,								:ll_ctas_pie_plazo,									:ll_ctas_pie_pagadas,									:ll_codigo_servicio,								:ldt_fecha_pie_prim,								:ls_usuario_crea,									:ldb_tasa_base,								:ldb_der_esp,								:ldt_fecha_entre,								:ll_capacidad )
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			UPDATE	"PRODUCTO_ANEXO"  
			SET 		"ULT_FOLIO" = :ll_folio  
			WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :ls_serie ) AND  
					   ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero )   
			Using		sqlca ;
			if sqlca.sqlcode=0 then
				commit;
				INSERT INTO  "CUPONERAS_MODIFICA"  
								( "BASE",		"SERIE",		"NUMERO",	"FECHA_CREA",	"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",	"FECHA_PRIM",		"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
				VALUES		( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,				'V',					:ll_nro_cuotas,		:ll_rut,	:ls_dv,	:ll_valor_cuota,				0,								:ll_cod_parque,		:ldt_fecha_prim,	:ldt_fecha_m,			:ls_moneda,	'C' )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
					///// nuevo mirko 11/09/2020
					DECLARE sp_mod_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
					EXECUTE sp_mod_cadena_mora;
					
					SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
					INTO 		:ldt_fec_venc_mant  
					FROM 	"CADENA_MORA"  
					WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
							 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
							 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
					USING	sqlca;
					
					SELECT	"CUPONERAS"."NUMERO"  
					INTO 		:ll_count_vig  
					FROM 	"CUPONERAS"  
					WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
							 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
							 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
							 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
					using		SQLCA;
					if sqlca.sqlcode = 0 and ll_count_vig > 0 then
						UPDATE 		"CUPONERAS"  
						SET 			"ESTADO_CUPONERA" = 'R'  
						WHERE 	   ( "CUPONERAS"."BASE" = :gs_base ) AND  
										( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )  
						USING		sqlca;
						if sqlca.sqlcode=0 THEN
							commit;
							UPDATE 	"CUPONERAS_DETALLE"  
							SET 		"ESTADO_PAGO_CUPON" = 'A'  
							WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
									  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
									  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
									  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )  
							USING		sqlca;
							if sqlca.sqlcode=0 THEN
								commit;
							else
								rollback;
							end if
						else
							rollback;
						end if
//						DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :as_base, :as_serie, :al_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda);
//						EXECUTE sp_proc_genera_cuponera;
						
						DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda);
						EXECUTE sp_proc_genera_cuponera;
						
						SELECT 	Count("ATENCION_LOG"."RUT")
						INTO 		:ll_count_reg_atencion  
						FROM 	"ATENCION_LOG"  
						WHERE ( "ATENCION_LOG"."RUT" = :gi_rut ) AND  
								  ( "ATENCION_LOG"."ESTADO" = :ls_estado ) AND  
								  ( "ATENCION_LOG"."FECHA" = :gdt_fec_sistema ) AND  
								  ( "ATENCION_LOG"."USUARIO" = :gs_user ) AND  
								  ( "ATENCION_LOG"."BASE" = :gs_base ) AND  
								  ( "ATENCION_LOG"."SERIE" = :gs_serie ) AND  
								  ( "ATENCION_LOG"."NUMERO" = :gi_numero )   ;
						if ll_count_reg_atencion = 0 then
							ls_glosa						= 'SE GENERA NUEVA CUPONERA POR MOTIVO REPACTACION CAMBIO DE FECHA EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy')
							INSERT INTO "ATENCION_LOG"  
											( "RUT"  ,	"ESTADO"  ,"FECHA"  ,			"GLOSA",		"USUARIO" ,		"BASE"  ,		"SERIE"  ,	"NUMERO" )  
							VALUES 		( :ll_rut,		:ls_estado,	:gdt_fec_sistema,	:ls_glosa,	:gs_user,		:gs_base,	:gs_serie,	:gi_numero)  ;
							if sqlca.sqlcode <> 0 then
								messagebox('Error','Error al Grabar '+sqlca.SQLErrText,information!)
								ROLLBACK;
							else
								commit;
							end if
						end if
//						DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
//						EXECUTE sp_proc_modifica_cuponera;
					end if
					///// fin nuevo mirko 11/09/2020
//					DECLARE sp_mod_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
//					EXECUTE sp_mod_cadena_mora;
//					
//					SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
//					INTO 		:ldt_fec_venc_mant  
//					FROM 	"CADENA_MORA"  
//					WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
//							   ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
//							   ( "CADENA_MORA"."NUMERO" = :gi_numero )   
//					USING	sqlca;
//					
//					SELECT	"CUPONERAS"."NUMERO"  
//					INTO 		:ll_count_vig  
//					FROM 	"CUPONERAS"  
//					WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
//							   ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
//							   ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
//							   ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
//					using		SQLCA;
//					if sqlca.sqlcode = 0 and ll_count_vig > 0 then
//						DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
//						EXECUTE sp_proc_modifica_cuponera;
//					end if
				else
					rollback;
				end if
				if isvalid(w_cuenta_corriente_liberador) then
					w_cuenta_corriente_liberador.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
					w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
				end if
			else
				rollback;
			end if
		else
			rollback;
			messagebox("Error SQL","Error SQL: "+sqlca.sqlerrtext)
		end if
	end if
elseif sqlca.sqlcode=100 then
	messagebox("Advertencia","No Existe Promesa "+gs_base+'-'+gs_serie+'-'+string(gi_numero))
elseif sqlca.sqlcode=-1 then
	messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
end if
end subroutine

on w_detalle_solicitudes.create
if this.MenuName = "m_solicitudes" then this.MenuID = create m_solicitudes
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.st_help=create st_help
this.sle_1=create sle_1
this.dw_print_ctto=create dw_print_ctto
this.cb_print_ctto=create cb_print_ctto
this.dw_print=create dw_print
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_eliminar=create cb_eliminar
this.cb_nuevo=create cb_nuevo
this.cb_cerrar=create cb_cerrar
this.dw_reporte=create dw_reporte
this.cb_filtrar=create cb_filtrar
this.cb_aceptar_operaciones=create cb_aceptar_operaciones
this.cb_aceptar_informatica=create cb_aceptar_informatica
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1,&
this.st_help,&
this.sle_1,&
this.dw_print_ctto,&
this.cb_print_ctto,&
this.dw_print,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_eliminar,&
this.cb_nuevo,&
this.cb_cerrar,&
this.dw_reporte,&
this.cb_filtrar,&
this.cb_aceptar_operaciones,&
this.cb_aceptar_informatica}
end on

on w_detalle_solicitudes.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
destroy(this.st_help)
destroy(this.sle_1)
destroy(this.dw_print_ctto)
destroy(this.cb_print_ctto)
destroy(this.dw_print)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_eliminar)
destroy(this.cb_nuevo)
destroy(this.cb_cerrar)
destroy(this.dw_reporte)
destroy(this.cb_filtrar)
destroy(this.cb_aceptar_operaciones)
destroy(this.cb_aceptar_informatica)
end on

event open;String	ls_descrip,ls_base_aux,ls_obs,ls_estado_reg,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat  
datetime	ldt_fecha
Long		ll_row_ant,ll_fila,ll_cant,ll_rut

connect using Trans_1;
idt_fecha_hoy																= date(gdt_fec_sistema)
gf_centrar(w_detalle_solicitudes)
is_base 																		= substr(1,1,Message.StringParm)  
is_serie																		= substr(1,2,Message.StringParm)
il_numero																	= Double(substr(1,3,Message.StringParm))
is_tipo_sol																	= substr(1,4,Message.StringParm)
dw_print.settransobject(sqlca)
cb_print_ctto.enabled														= false
m_solicitudes.m_imprimir.m_contratoresciliado.enabled			= false
m_solicitudes.m_imprimir.m_títulodedominio.enabled				= false
CHOOSE CASE is_tipo_sol
	CASE '1'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_rescilia_cliente'
		m_solicitudes.m_imprimir.m_contratoresciliado.enabled	= true
		cb_print_ctto.enabled												= true
	CASE '2'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_rescilia_reprog'
	CASE '3'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_por_tipo_ctto'
	CASE '4'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_seguro_desgravamen'
	CASE '5'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_repacta_compraventa'
	CASE '6'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_titulo_dominio'
	CASE '7'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_contrato_definitivo'
	CASE '8'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_entrega_pagare'
	CASE '10'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_transferencia'
	CASE '11'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_resolucion'
	CASE '12'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_mod_antece_cliente'
		is_base																= 'W'
		is_serie																= 'W'
		SELECT	"SOL_ESTATUS"."BASE"  
		INTO 		:ls_base_aux  
		FROM 	"SOL_ESTATUS"  
		WHERE 	"SOL_ESTATUS"."RUT_CLIENTE" = :il_numero   
		USING		sqlca;
		if sqlca.sqlcode=100 then
			SELECT	"SOL_MOD_ANTECE"."FECHA"  
			INTO 		:ldt_fecha  
			FROM 	"SOL_MOD_ANTECE"  
			WHERE 	"SOL_MOD_ANTECE"."RUT" = :il_numero  ;
			
			SELECT	"ENCARGADOS"."NOMBRE"  
			INTO 		:gs_nom_comp_usuario  
			FROM 	"ENCARGADOS"  
			WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user ;
			
			ls_obs						= 'Actualización Antecedentes del Cliente por '+gs_nom_comp_usuario
			INSERT INTO	"SOL_ESTATUS"  
							 ( "BASE",   "SERIE",   "NUMERO",   "CORRELATIVO",   "CODIGO_SOLICITUD",   "OBSERVACION",   	"ESTADO_REG",   "RUT_CLIENTE" )  
					VALUES ( 'W',   	 'W',   		:il_numero, 1,   				  '12',   					:ls_obs, 			'A',   			 :il_numero )  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				UPDATE	"SOL_MOD_ANTECE"  
				SET 		"USUARIO_OPERA" = :gs_user,   
							"FECHA_OPERA" = :ldt_fecha,   
							"ESTATUS_OPERACIONES" = 0  
				WHERE 	"SOL_MOD_ANTECE"."RUT" = :il_numero   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			else
				rollback;
			end if
		end if
	CASE '13'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_nula_por_dacion'
	CASE '14'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_cambio_est_titular'
	CASE '15'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_seguro'
	CASE '16'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_novacion'
	CASE '17'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_coprop_promesa'
	CASE '18'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_ultima_voluntad'
	CASE '19'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_posesion_efectiva'
	CASE '20'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_pac'
	CASE '21'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_pat'
	CASE '22'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_seguro_fallece'
	CASE '23'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_en_demanda'
	CASE '24'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_bono_fraterno'
	CASE '25'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_mant_perpetua'
	CASE '26'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_titulo_dominio_parque'		
	CASE '27'
		dw_reporte.dataobject											= 'dw_lista_solicitudes_compromiso_pago'
END CHOOSE
dw_reporte.settransobject(sqlca)
if is_tipo_sol='12' then
	dw_reporte.retrieve(il_numero)
else
	dw_reporte.retrieve(is_base,is_serie,il_numero,is_tipo_sol)
end if
dw_reporte.object.ctto.text												= is_base+' - '+is_serie+' - '+string(il_numero,'###,###,###,##0')
if is_base='W' then 
	dw_reporte.object.ctto.visible										= false
	dw_reporte.object.numero_t.visible								= false
else
	dw_reporte.object.ctto.visible										= true
	dw_reporte.object.numero_t.visible								= true
end if
if isvalid(w_ingreso_solicitudes) then
	dw_reporte.object.t_rut.text											= trim(w_ingreso_solicitudes.st_rut.text)
	dw_reporte.object.t_nombre.text									= trim(w_ingreso_solicitudes.st_nombre.text)
	dw_reporte.object.t_titulo.text										= trim(w_ingreso_solicitudes.dw_lista.getitemstring(w_ingreso_solicitudes.dw_lista.getrow(),'descripcion'))
	w_detalle_solicitudes.title											= trim(w_ingreso_solicitudes.dw_lista.getitemstring(w_ingreso_solicitudes.dw_lista.getrow(),'descripcion'))
elseif isvalid(w_cuotas) then
	ll_rut																		= w_cuotas.dw_repacta.getitemnumber(1,'rut_ctto_original')
	ls_dv																		= w_cuotas.dw_repacta.getitemstring(1,'dv_ctto_original')
	SELECT	"CLIENTE"."NOMBRE",   
				"CLIENTE"."A_PATERNO",   
				"CLIENTE"."A_MATERNO"  
	INTO 		:ls_nom,   
				:ls_ap_pat,   
				:ls_ap_mat  
	FROM 	"CLIENTE"  
	WHERE 	"CLIENTE"."RUT" = :ll_rut   
	USING	sqlca;
	dw_reporte.object.t_rut.text											= w_cuotas.dw_repacta.getitemstring(1,'c_rut_comp')
	dw_reporte.object.t_nombre.text									= ls_nom+ ' '+ls_ap_pat+' '+ls_ap_mat
	dw_reporte.object.t_titulo.text										= 'Resciliación por Reprogramación'
	w_detalle_solicitudes.title											= 'Resciliación por Reprogramación'
elseif isvalid(w_cuotas_funeraria) then
	ll_rut																		= w_cuotas_funeraria.dw_repacta.getitemnumber(1,'rut_ctto_original')
	ls_dv																		= w_cuotas_funeraria.dw_repacta.getitemstring(1,'dv_ctto_original')
	SELECT	"CLIENTE"."NOMBRE",   
				"CLIENTE"."A_PATERNO",   
				"CLIENTE"."A_MATERNO"  
	INTO 		:ls_nom,   
				:ls_ap_pat,   
				:ls_ap_mat  
	FROM 	"CLIENTE"  
	WHERE 	"CLIENTE"."RUT" = :ll_rut   
	USING	sqlca;
	dw_reporte.object.t_rut.text											= w_cuotas_funeraria.dw_repacta.getitemstring(1,'c_rut_comp')
	dw_reporte.object.t_nombre.text									= ls_nom+ ' '+ls_ap_pat+' '+ls_ap_mat
	dw_reporte.object.t_titulo.text										= 'Resciliación por Reprogramación'
	w_detalle_solicitudes.title											= 'Resciliación por Reprogramación'
elseif isvalid(w_cuotas_pagare) then
	ll_rut																		= w_cuotas_pagare.dw_repacta.getitemnumber(1,'rut_ctto_original')
	ls_dv																		= w_cuotas_pagare.dw_repacta.getitemstring(1,'dv_ctto_original')
	SELECT	"CLIENTE"."NOMBRE",   
				"CLIENTE"."A_PATERNO",   
				"CLIENTE"."A_MATERNO"  
	INTO 		:ls_nom,   
				:ls_ap_pat,   
				:ls_ap_mat  
	FROM 	"CLIENTE"  
	WHERE 	"CLIENTE"."RUT" = :ll_rut   
	USING	sqlca;
	dw_reporte.object.t_rut.text											= w_cuotas_pagare.dw_repacta.getitemstring(1,'c_rut_comp')
	dw_reporte.object.t_nombre.text									= ls_nom+ ' '+ls_ap_pat+' '+ls_ap_mat
	dw_reporte.object.t_titulo.text										= 'Resciliación por Reprogramación'
	w_detalle_solicitudes.title											= 'Resciliación por Reprogramación'
end if
if gs_solicitudes='1' then//operaciones 1 crea
	cb_nuevo.enabled														= true
	m_solicitudes.m_mantenedor.m_nuevasolicitud.enabled		= true
	cb_aceptar_operaciones.enabled									= false
	m_solicitudes.m_mantenedor.m_autorizarsolicitud.enabled	= false
	if is_tipo_sol='1' then 
		cb_print_ctto.enabled												= false
		m_solicitudes.m_imprimir.m_contratoresciliado.enabled	= false
	end if
elseif gs_solicitudes='2' then //operaciones 2 crea y actualiza
	cb_nuevo.enabled														= true
	m_solicitudes.m_mantenedor.m_nuevasolicitud.enabled		= true
	cb_aceptar_operaciones.enabled									= true
	m_solicitudes.m_mantenedor.m_autorizarsolicitud.enabled	= true
	if is_tipo_sol='1' then 
		cb_print_ctto.enabled												= true
		m_solicitudes.m_imprimir.m_contratoresciliado.enabled	= true
	end if
elseif gs_solicitudes='3' then  //informatica 3
	m_solicitudes.m_mantenedor.m_actualizarsolicitud.enabled	= true
	m_solicitudes.m_mantenedor.m_autorizarsolicitud.enabled	= false
	if is_tipo_sol='1' then 
		cb_print_ctto.enabled												= true
		m_solicitudes.m_imprimir.m_contratoresciliado.enabled	= true
	end if
elseif gs_solicitudes<>'1' and gs_solicitudes<>'2' and gs_solicitudes<>'3' then
	m_solicitudes.m_mantenedor.m_actualizarsolicitud.enabled	= false
	m_solicitudes.m_mantenedor.m_autorizarsolicitud.enabled	= false
	cb_nuevo.enabled														= false	
	m_solicitudes.m_mantenedor.m_nuevasolicitud.enabled		= false
	cb_eliminar.enabled													= false	
	m_solicitudes.m_mantenedor.m_rechazarsolicitud.enabled	= false
	if is_tipo_sol='1' then 
		cb_print_ctto.enabled												= false
		m_solicitudes.m_imprimir.m_contratoresciliado.enabled	= false
	end if
end if
if trim(gs_opera)='1' or gs_depto='I' then
	cb_nuevo.enabled														= true
	m_solicitudes.m_mantenedor.m_nuevasolicitud.enabled		= true
	cb_eliminar.enabled													= true
	m_solicitudes.m_mantenedor.m_rechazarsolicitud.enabled	= true
else
	cb_nuevo.enabled														= false
	m_solicitudes.m_mantenedor.m_nuevasolicitud.enabled		= false
	cb_eliminar.enabled													= false
	m_solicitudes.m_mantenedor.m_rechazarsolicitud.enabled	= false
end if
SELECT	"SOL_PERMISOS_USUARIO"."ESTADO"  
INTO 		:ls_estado_reg  
FROM 	"SOL_PERMISOS_USUARIO"  
WHERE  ( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = :is_tipo_sol ) AND  
		 ( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user )   
USING		sqlca;
if ls_estado_reg='A' or gs_depto='I' then
	m_solicitudes.m_mantenedor.m_actualizarsolicitud.enabled	= true
	m_solicitudes.m_imprimir.m_títulodedominio.enabled			= true
else
	m_solicitudes.m_mantenedor.m_actualizarsolicitud.enabled	= false
end if
gs_ventana																	= 'w_detalle_solicitudes'
f_valida_objeto()
end event

event mousemove;st_help.visible	= false
end event

event close;disconnect using Trans_1;
end event

type mdi_1 from mdiclient within w_detalle_solicitudes
long BackColor=268435456
end type

type mditbb_1 from tabbedbar within w_detalle_solicitudes
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_detalle_solicitudes
int X=0
int Y=0
int Width=0
int Height=596
end type

type st_help from statictext within w_detalle_solicitudes
event ue_mousemove pbm_mousemove
integer x = 1499
integer y = 40
integer width = 1115
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 31064063
string text = "   <<   Seleccione Opción en Menú Superior"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_help.visible	= false
end event

type sle_1 from uo_convierte_numero within w_detalle_solicitudes
boolean visible = false
integer x = 114
integer y = 2188
integer width = 494
integer taborder = 20
boolean hideselection = false
end type

type dw_print_ctto from datawindow within w_detalle_solicitudes
boolean visible = false
integer x = 1499
integer y = 2028
integer width = 837
integer height = 432
string title = "none"
string dataobject = "dw_print_ctto_rescilia_foresta_libera"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print_ctto from commandbutton within w_detalle_solicitudes
boolean visible = false
integer x = 1065
integer y = 1824
integer width = 389
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print C&tto Rescil"
end type

event clicked;string	ls_est_reg
Long		ll_est_ope,ll_cod_parque
Datetime	ldt_fec_ctto,ldt_fecha_hoy
dw_reporte.accepttext()
if dw_reporte.rowcount()>0 and is_tipo_sol='1' then
	if il_row>0 then
		ldt_fecha_hoy	= datetime(idt_fecha_hoy,time("00:00:00"))
		ls_est_reg		= dw_reporte.getitemstring(il_row,'sol_estatus_estado_reg')
		gs_base			= dw_reporte.getitemstring(il_row,'sol_estatus_base')
		gs_serie			= dw_reporte.getitemstring(il_row,'sol_estatus_serie')
		gi_numero		= dw_reporte.getitemnumber(il_row,'sol_estatus_numero')
		il_corr			= dw_reporte.getitemnumber(il_row,'sol_estatus_correlativo')
		ll_est_ope		= dw_reporte.getitemnumber(il_row,'sol_rescilia_cliente_estatus_operacion')
		ll_cod_parque	= dw_reporte.getitemnumber(il_row,'cadena_cod_parque')
		if ll_est_ope=0 then
			if ls_est_reg='A' then
				SELECT	"SOL_RESCILIA_CLIENTE"."FECHA_CONTRATO"  
				INTO 		:ldt_fec_ctto  
				FROM 	"SOL_ESTATUS",   
							"SOL_RESCILIA_CLIENTE"  
				WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_RESCILIA_CLIENTE"."BASE" ) and  
						 ( "SOL_ESTATUS"."SERIE" = "SOL_RESCILIA_CLIENTE"."SERIE" ) and  
						 ( "SOL_ESTATUS"."NUMERO" = "SOL_RESCILIA_CLIENTE"."NUMERO" ) and  
						 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESCILIA_CLIENTE"."CORRELATIVO" ) and 
						 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '1') AND
						 (("SOL_ESTATUS"."BASE" = :gs_base ) AND  
						 ( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
						 ( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
						 ( "SOL_ESTATUS"."CORRELATIVO" = :il_corr ) )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if isnull(ldt_fec_ctto) or date(ldt_fec_ctto)=date("01/01/1900") or date(ldt_fec_ctto)=date("00/00/0000") then
						//ldt_fecha_hoy
						UPDATE 	"SOL_RESCILIA_CLIENTE"  
						SET 		"FECHA_CONTRATO" = :ldt_fecha_hoy  
						WHERE  ( "SOL_RESCILIA_CLIENTE"."BASE" = :gs_base ) AND  
								 ( "SOL_RESCILIA_CLIENTE"."SERIE" = :gs_serie ) AND  
								 ( "SOL_RESCILIA_CLIENTE"."NUMERO" = :gi_numero ) AND  
								 ( "SOL_RESCILIA_CLIENTE"."CORRELATIVO" = :il_corr )  
						Using		sqlca ;
						if sqlca.sqlcode=0 then
							commit;
							wf_print_ctto_rescilia(ll_cod_parque)
						else
							rollback;
						end if
					else
						wf_print_ctto_rescilia(ll_cod_parque)
					end if
				else
					messagebox("Advertencia","Antes de Imprimir Contrato debe Grabar Solicitud")
				end if
			else
				messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,##0")+'-'+string(il_corr)+" Anulada")
			end if
		else
			messagebox("Advertencia","Solicitud debe estar Autorizado por Operaciones")
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Solicitud")
	end if
end if
end event

type dw_print from datawindow within w_detalle_solicitudes
boolean visible = false
integer x = 722
integer y = 2024
integer width = 654
integer height = 432
string dataobject = "dw_documento_solicitud_acepta_o_rechaza"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_sort from commandbutton within w_detalle_solicitudes
boolean visible = false
integer x = 2034
integer y = 1824
integer width = 224
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_reporte.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_reporte.SETSORT(NULO)
	dw_reporte.SORT()
end if
end event

type cb_exportar from commandbutton within w_detalle_solicitudes
boolean visible = false
integer x = 1806
integer y = 1824
integer width = 224
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_reporte
if dw_reporte.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_detalle_solicitudes
boolean visible = false
integer x = 512
integer y = 1824
integer width = 229
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_reporte.rowcount() > 0 then
	f_Print( dw_reporte )
end if
end event

type cb_eliminar from commandbutton within w_detalle_solicitudes
boolean visible = false
integer x = 256
integer y = 1824
integer width = 251
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Rechazar"
end type

event clicked;Long		ll_resp,ll_row,ll_corr, ll_fila,ll_cant, ll_est_ope,ll_est_inf
String	ls_string,ls_obs,ls_est_reg

ll_row	= dw_reporte.getrow()
if ll_row > 0 then
	ls_est_reg				= dw_reporte.getitemstring(ll_row,'sol_estatus_estado_reg')
	if ls_est_reg='I' then
		messagebox("Advertencia","Solicitud Inactiva")
	else
		CHOOSE CASE is_tipo_sol
			CASE "1"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_rescilia_cliente_estatus_operacion')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_rescilia_cliente_estatus_informatica')
			CASE "2"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_rescilia_reprog_estatus_operacion')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_rescilia_reprog_estatus_informatica')				
			CASE "3"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_reactiva_estatus_operacion')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_reactiva_estatus_informatica')
			CASE "4"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_seguro_desg_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_seguro_desg_estatus_informatica')
			CASE "5"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_repacta_cvta_estatus_operacion')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_repacta_cvta_estatus_informatica')
			CASE "6"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_tit_dominio_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_tit_dominio_estatus_informatica')
			CASE "7"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_contrato_def_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_contrato_def_estatus_informatica')
			CASE "8"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_entrega_pag_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_entrega_pag_estatus_informatica')
			CASE "10"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_transferencia_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_transferencia_estatus_informatica')
			CASE "11"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_resolucion_estatus_operacion')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_resolucion_estatus_informatica')
			CASE "12"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_mod_antece_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_mod_antece_estatus_informatica')
			CASE "13"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_cambio_estado_estatus_operacion')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_cambio_estado_estatus_informatica')
			CASE "14"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_cambio_estado_titular_estatus_operac')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_cambio_estado_titular_estatus_inform')
			CASE "15"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_seguro_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_seguro_estatus_informatica')
			CASE "16"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_novacion_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_novacion_estatus_informatica')
			CASE "17"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_coprop_promesa_estatus_opera')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_coprop_promesa_estatus_infor')
			CASE "18"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_ultima_voluntad_estatus_opera')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_ultima_voluntad_estatus_infor')
			CASE "19"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_pos_efec_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_pos_efec_estatus_informatica')
			CASE "20"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_pac_estatus_operacion')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_pac_estatus_informatica')
			CASE "21"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_pat_estatus_operacion')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_pat_estatus_informatica')
			CASE "22"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_seguro_fallece_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_seguro_fallece_estatus_informatica')
			CASE "23"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_en_demanda_estatus_operacion')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_en_demanda_estatus_informatica')
			CASE "24"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_bono_fraterno_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_bono_fraterno_estatus_informatica')
			CASE "25"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_mant_perpetua_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_mant_perpetua_estatus_informatica')
			CASE "26"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_tit_dominio_parque_estatus_operaciones')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_tit_dominio_parque_estatus_informatica')
			CASE "27"
				ll_est_ope	= dw_reporte.getitemnumber(ll_row,'sol_compromiso_pago_estatus_operacion')
				ll_est_inf		= dw_reporte.getitemnumber(ll_row,'sol_compromiso_pago_estatus_informatica')
		END CHOOSE
		ll_corr				= dw_reporte.getitemnumber(ll_row,'sol_estatus_correlativo')
		ls_obs				= dw_reporte.getitemstring(ll_row,'sol_estatus_observacion')
		if long(gs_solicitudes)>1 then
			if is_tipo_sol='20' or is_tipo_sol='21' then
				ll_resp		= MessageBox("Advertencia", "Está seguro de Anular Solicitud Nº "+string(ll_row,"###,###,##0"), Exclamation!, YesNo!, 2)
				IF ll_resp = 1 THEN
					ls_string	= string(ll_corr)+'~t'+is_tipo_sol+'~t'+string(ll_row)+'~t'+ls_obs+'~t'+is_base+'~t'+is_serie+'~t'+string(il_numero)
					if isvalid(w_eliminar_solicitud) then close(w_eliminar_solicitud)
					openwithparm(w_eliminar_solicitud,ls_string)
				END IF
			else
				if ll_est_ope=0 and ll_est_inf=0 and is_tipo_sol <> '27' then
					messagebox("Advertencia","No se puede Anular, ya fue aceptada la Solicitud")
				else
					ll_resp		= MessageBox("Advertencia", "Está seguro de Anular Solicitud Nº "+string(ll_row,"###,###,##0"), Exclamation!, YesNo!, 2)
					IF ll_resp = 1 THEN
						ls_string	= string(ll_corr)+'~t'+is_tipo_sol+'~t'+string(ll_row)+'~t'+ls_obs+'~t'+is_base+'~t'+is_serie+'~t'+string(il_numero)
						if isvalid(w_eliminar_solicitud) then close(w_eliminar_solicitud)
						openwithparm(w_eliminar_solicitud,ls_string)
					END IF
				end if
			end if
		else
			messagebox("Advertencia","No está autorizado para Rechazar Solicitud")
		end if
	end if
end if
end event

type cb_nuevo from commandbutton within w_detalle_solicitudes
boolean visible = false
integer x = 32
integer y = 1824
integer width = 219
integer height = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;Long		ll_corr,ll_sum_est,ll_tot_reg,ll_indi,ll_est_inf,ll_sum,ll_count,&
			ll_estado_aux,ll_mora_cred,ll_mora_mant,ll_resp,ll_fallecido,ll_count_repacta,ll_cant_repacta
String		ls_string, ls_estado,ls_est_reg,ls_est_tit,ls_pasa,ls_base_ori,ls_serie_ori,&
			ls_estado_aux,ls_estado_ctto_aux
Datetime	ldt_fecha_res,ldt_fec_tit,ldt_fec_venc_comp,ldt_fecha_repacta_valida
Double	ll_numero_ori,ll_folio_mandato
ll_corr				= 0
CHOOSE CASE is_tipo_sol
	CASE '1' // resciliacion por parte del cliente
		SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
		INTO 		:ls_estado,				:ldt_fecha_res
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			if ls_estado='V' or ls_estado='C' then
				SELECT	SUM("SOL_RESCILIA_CLIENTE"."ESTATUS_INFORMATICA")
				INTO 		:ll_sum_est  
				FROM 		"SOL_RESCILIA_CLIENTE",   
							"SOL_ESTATUS"  
				WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_RESCILIA_CLIENTE"."BASE" ) and  
							( "SOL_ESTATUS"."SERIE" = "SOL_RESCILIA_CLIENTE"."SERIE" ) and  
							( "SOL_ESTATUS"."NUMERO" = "SOL_RESCILIA_CLIENTE"."NUMERO" ) and  
							( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESCILIA_CLIENTE"."CORRELATIVO" ) and  
							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
							(("SOL_RESCILIA_CLIENTE"."BASE" = :is_base ) AND  
							( "SOL_RESCILIA_CLIENTE"."SERIE" = :is_serie ) AND  
							( "SOL_RESCILIA_CLIENTE"."NUMERO" = :il_numero ) AND  
							( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
				Using		sqlca;
				if sqlca.sqlcode=0 then
					if ll_sum_est=0 or isnull(ll_sum_est) then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					else
						messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
					end if
				elseif sqlca.sqlcode=100 then
					if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
					if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
					ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
					openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
				end if
			else
				messagebox("Advertencia","El Contrato debe estar Estado V-Vigente")
			end if
		elseif sqlca.sqlcode=100 then
			messagebox("Advertencia","Contrato no Existe")
		elseif sqlca.sqlcode=-1 then
			messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
		end if

	CASE '2' // resciliacion por reprogramación
		if is_base='O' then
			SELECT	count("REPACTA_CREDITO"."ESTADO")  
			INTO 		:ll_estado_aux  
			FROM 	"REPACTA_CREDITO"  
			WHERE  ( "REPACTA_CREDITO"."BASE_ORIGINAL" = :gs_base ) AND  
					 ( "REPACTA_CREDITO"."SERIE_ORIGINAL" = :gs_serie ) AND  
					 ( "REPACTA_CREDITO"."NUMERO_ORIGINAL" = :gi_numero ) AND 
					 ( "REPACTA_CREDITO"."ESTADO" = 'V' )
			USING		sqlca;
			if ll_estado_aux=1 then
				SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
				INTO 		:ls_estado,				:ldt_fecha_res
				FROM 	"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
							( "CADENA"."SERIE" = :gs_serie ) AND  
							( "CADENA"."NUMERO" = :gi_numero )   
				Using		sqlca;
				if sqlca.sqlcode=0 then
					if ls_estado='V' or ls_estado='R' then
						SELECT	SUM("SOL_RESCILIA_REPROG"."ESTATUS_INFORMATICA")
						INTO 		:ll_sum_est  
						FROM 	"SOL_RESCILIA_REPROG",   
									"SOL_ESTATUS"  
						WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_RESCILIA_REPROG"."BASE" ) and  
									( "SOL_ESTATUS"."SERIE" = "SOL_RESCILIA_REPROG"."SERIE" ) and  
									( "SOL_ESTATUS"."NUMERO" = "SOL_RESCILIA_REPROG"."NUMERO" ) and  
									( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESCILIA_REPROG"."CORRELATIVO" ) and  
									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
									( ( "SOL_RESCILIA_REPROG"."BASE" = :is_base ) AND  
									( "SOL_RESCILIA_REPROG"."SERIE" = :is_serie ) AND  
									( "SOL_RESCILIA_REPROG"."NUMERO" = :il_numero ) AND  
									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
						Using		sqlca;
						if sqlca.sqlcode=0 then
							if ll_sum_est=0 or isnull(ll_sum_est) then
								if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
								if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
								ls_string		= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
								openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
							else
								messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
							end if
						elseif sqlca.sqlcode=100 then
							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
						end if
					else
						messagebox("Advertencia","El Contrato debe estar Estado V-Vigente")
					end if
				elseif sqlca.sqlcode=100 then
					messagebox("Advertencia","Contrato no Existe")
				elseif sqlca.sqlcode=-1 then
					messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
				end if
				
			elseif ll_estado_aux=0 or isnull(ll_estado_aux) then
				messagebox("Advertencia","Antes de Generar Solicitud, Contrato Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###")+" tiene que Existir Reprogramación de Crédito Vigente")
			elseif ll_estado_aux>1 then
				messagebox("Advertencia","Para Contrato Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###")+" Existe más de Una Reprogramación de Crédito Vigente")
			end if
		elseif is_base='C' or is_base='P' or is_base='D' or is_base='A' or is_base='F' then
			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
			INTO 		:ls_estado,				:ldt_fecha_res
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
						( "CADENA"."SERIE" = :gs_serie ) AND  
						( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='V' or ls_estado='R' then
					SELECT	SUM("SOL_RESCILIA_REPROG"."ESTATUS_INFORMATICA")
					INTO 		:ll_sum_est  
					FROM 	"SOL_RESCILIA_REPROG",   
								"SOL_ESTATUS"  
					WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_RESCILIA_REPROG"."BASE" ) and  
								( "SOL_ESTATUS"."SERIE" = "SOL_RESCILIA_REPROG"."SERIE" ) and  
								( "SOL_ESTATUS"."NUMERO" = "SOL_RESCILIA_REPROG"."NUMERO" ) and  
								( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESCILIA_REPROG"."CORRELATIVO" ) and  
								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
								( ( "SOL_RESCILIA_REPROG"."BASE" = :is_base ) AND  
								( "SOL_RESCILIA_REPROG"."SERIE" = :is_serie ) AND  
								( "SOL_RESCILIA_REPROG"."NUMERO" = :il_numero ) AND  
								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
					Using		sqlca;
					if sqlca.sqlcode=0 then
						if ll_sum_est=0 or isnull(ll_sum_est) then
							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
						else
							messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
						end if
					elseif sqlca.sqlcode=100 then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					end if
				else
					messagebox("Advertencia","El Contrato debe estar Estado V-Vigente")
				end if
			elseif sqlca.sqlcode=100 then
				messagebox("Advertencia","Contrato no Existe")
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
		end if

	CASE '3' // reactivación por contrato resuelto
		messagebox("Advertencia","Ya NO es posible Generar Solicitud")
//		if is_base='O' or is_base='C' or is_base='P' or is_base='R' or is_base='L' or is_base='A' or is_base='F' then
//			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
//			INTO 		:ls_estado,				:ldt_fecha_res
//			FROM 	"CADENA"  
//			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
//						( "CADENA"."SERIE" = :gs_serie ) AND  
//						( "CADENA"."NUMERO" = :gi_numero )   
//			Using		sqlca;
//			if sqlca.sqlcode=0 then
//				if ls_estado='N' or ls_estado='R' then
//					if is_base='R' then
//						SELECT 	"REPACTA_MANTENCION"."BASE_ORIGINAL",	"REPACTA_MANTENCION"."SERIE_ORIGINAL",	"REPACTA_MANTENCION"."NUMERO_ORIGINAL"  
//						INTO 		:ls_base_ori,									:ls_serie_ori,									:ll_numero_ori  
//						FROM 	"REPACTA_MANTENCION"  
//						WHERE  ( "REPACTA_MANTENCION"."BASE" = :is_base ) AND  
//								 ( "REPACTA_MANTENCION"."SERIE" = :is_serie ) AND  
//								 ( "REPACTA_MANTENCION"."NUMERO" = :il_numero )   
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							SELECT	COUNT("REPACTA_MANTENCION"."BASE")  
//							INTO 		:ll_count  
//							FROM 		"REPACTA_MANTENCION"  
//							WHERE  ( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :ls_base_ori ) AND  
//									 ( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :ls_serie_ori ) AND  
//									 ( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :ll_numero_ori ) and
//									 ( "REPACTA_MANTENCION"."ESTADO_PAGO" = 'V' )
//							USING		sqlca;
//							if ll_count>0 then
//								ls_pasa	= 'N'
//							else
//								ls_pasa	= 'S'
//							end if
//						else
//							ls_pasa		= 'S'
//						end if
//					else
//						ls_pasa			= 'S'
//					end if
//					if ls_pasa='S' then
//						SELECT	COUNT("SOL_REACTIVA"."ESTATUS_INFORMATICA")
//						INTO 		:ll_sum_est  
//						FROM 	"SOL_REACTIVA",   
//									"SOL_ESTATUS"  
//						WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_REACTIVA"."BASE" ) and  
//									( "SOL_ESTATUS"."SERIE" = "SOL_REACTIVA"."SERIE" ) and  
//									( "SOL_ESTATUS"."NUMERO" = "SOL_REACTIVA"."NUMERO" ) and  
//									( "SOL_ESTATUS"."CORRELATIVO" = "SOL_REACTIVA"."CORRELATIVO" ) and  
//									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
//									( ( "SOL_REACTIVA"."BASE" = :is_base ) AND  
//									( "SOL_REACTIVA"."SERIE" = :is_serie ) AND  
//									( "SOL_REACTIVA"."NUMERO" = :il_numero ) AND  
//									( "SOL_REACTIVA"."ESTATUS_INFORMATICA" = 1 ) AND  
//									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
//						Using		sqlca;
//						if sqlca.sqlcode=0 then
//							if ll_sum_est=0 or isnull(ll_sum_est) then
//								if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
//								if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
//								ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
//								openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
//							else
//								messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
//							end if
//						elseif sqlca.sqlcode=100 then
//							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
//							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
//							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
//							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
//						end if
//					else
//						messagebox("Advertencia","No es Posible Crear Reprogramación de Mantención para el Contrato Nº "+ls_base_ori+'-'+ls_serie_ori+'-'+string(ll_numero_ori,"###,###,###,###,###")+', tiene '+string(ll_count)+' VIGENTE(S)')
//					end if
//				else
//					messagebox("Advertencia","El Contrato debe estar Estado N-Nulo / R-Resciliado")
//				end if
//			elseif sqlca.sqlcode=100 then
//				messagebox("Advertencia","Contrato no Existe")
//			elseif sqlca.sqlcode=-1 then
//				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
//			end if
//		else
//			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
//		end if
//
	CASE '4' // seguro desgravamen
		if is_base='O' or is_base='L' or is_base='D' or is_base='A' or is_base='P' or is_base='F' then
			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
			INTO 		:ls_estado,				:ldt_fecha_res
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
						( "CADENA"."SERIE" = :gs_serie ) AND  
						( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='C' or ls_estado='V' or ls_estado='R' or ls_estado='P' then
					SELECT	SUM("SOL_SEGURO_DESG"."ESTATUS_INFORMATICA")
					INTO 		:ll_sum_est  
					FROM 	"SOL_SEGURO_DESG",   
								"SOL_ESTATUS"  
					WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_DESG"."BASE" ) and  
								( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_DESG"."SERIE" ) and  
								( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_DESG"."NUMERO" ) and  
								( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_DESG"."CORRELATIVO" ) and  
								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
								( ( "SOL_SEGURO_DESG"."BASE" = :is_base ) AND  
								( "SOL_SEGURO_DESG"."SERIE" = :is_serie ) AND  
								( "SOL_SEGURO_DESG"."NUMERO" = :il_numero ) AND  
								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
					Using		sqlca;
					if sqlca.sqlcode=0 then
						if ll_sum_est=0 or isnull(ll_sum_est) then
							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
						else
							messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
						end if
					elseif sqlca.sqlcode=100 then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					end if
				else
					messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado / V-Vigente / R-Resciliado / P-Reprogramado")
				end if
			elseif sqlca.sqlcode=100 then
				messagebox("Advertencia","Contrato no Existe")
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
		end if

	CASE '5' // repactación por cambio de fecha
		if is_base='O' or is_base='A' or is_base='L' or is_base='P' or is_base='F' THEN //  or is_base='R' then
			SELECT "TASA"."FECHA_REPACTA_VALIDAR"  INTO :ldt_fecha_repacta_valida  FROM "TASA"  ;
			if isnull(ldt_fecha_repacta_valida) then 
				ldt_fecha_repacta_valida = Datetime('01/08/2019')
			end if
			SELECT 	count("SOL_REPACTA_CVTA"."NUMERO")
			INTO 		:ll_count_repacta  
			FROM 	"SOL_REPACTA_CVTA"  
			WHERE 	( "SOL_REPACTA_CVTA"."BASE" = :gs_base ) AND  
						( "SOL_REPACTA_CVTA"."SERIE" = :gs_serie ) AND  
						( "SOL_REPACTA_CVTA"."NUMERO" = :gi_numero ) AND  
						( "SOL_REPACTA_CVTA"."FECHA_SOLICITUD" >= :ldt_fecha_repacta_valida ) AND  
						( "SOL_REPACTA_CVTA"."ESTATUS_OPERACION" = 0 ) AND  
						( "SOL_REPACTA_CVTA"."ESTATUS_INFORMATICA" = 0 ) AND
						( "SOL_REPACTA_CVTA"."SW_CONTAR_REPRO" = 1 )
			USING	sqlca;
			
			SELECT "TASA"."CANT_REPACTA"  
			INTO :ll_cant_repacta  
			FROM "TASA"  ;

			if ll_cant_repacta = 0 then ll_cant_repacta = 6
			
			if ll_count_repacta <= ll_cant_repacta then
				if ll_count_repacta = (ll_cant_repacta -1) then
					messagebox("Advertencia","Ultima Solicitud Que Se Puede Generar, Informar a Cliente")
				end if	
				SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
				INTO 		:ls_estado,				:ldt_fecha_res
				FROM 	"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
							( "CADENA"."SERIE" = :gs_serie ) AND  
							( "CADENA"."NUMERO" = :gi_numero )   
				Using		sqlca;
				if sqlca.sqlcode=0 then
					if ls_estado='V' then
						SELECT	SUM("SOL_REPACTA_CVTA"."ESTATUS_INFORMATICA")
						INTO 		:ll_sum_est  
						FROM 		"SOL_REPACTA_CVTA",   
									"SOL_ESTATUS"  
						WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_REPACTA_CVTA"."BASE" ) and  
									( "SOL_ESTATUS"."SERIE" = "SOL_REPACTA_CVTA"."SERIE" ) and  
									( "SOL_ESTATUS"."NUMERO" = "SOL_REPACTA_CVTA"."NUMERO" ) and  
									( "SOL_ESTATUS"."CORRELATIVO" = "SOL_REPACTA_CVTA"."CORRELATIVO" ) and  
									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
									( ( "SOL_REPACTA_CVTA"."BASE" = :is_base ) AND  
									( "SOL_REPACTA_CVTA"."SERIE" = :is_serie ) AND  
									( "SOL_REPACTA_CVTA"."NUMERO" = :il_numero ) AND  
									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
						Using		sqlca;
						if sqlca.sqlcode=0 then
							if ll_sum_est=0 or isnull(ll_sum_est) then
								if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
								if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
								ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
								openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
							else
								messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
							end if
						elseif sqlca.sqlcode=100 then
							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
						end if
					else
						messagebox("Advertencia","El Contrato debe estar Estado V-Vigente")
					end if
				elseif sqlca.sqlcode=100 then
					messagebox("Advertencia","Contrato no Existe")
				elseif sqlca.sqlcode=-1 then
					messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
				end if	
			else
				messagebox("Advertencia","Se Alcanzo el Limite de Solicitudes de Repactacion")
			end if	
		else
			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
		end if
	CASE '6' // titulo de dominio
		if is_base='O' or is_base='C' then
			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES" , "CADENA"."ESTADO_TITULO",	"CADENA"."FECHA_TITULO"
			INTO 		:ls_estado,				:ldt_fecha_res			,:ls_est_tit,						:ldt_fec_tit
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
						( "CADENA"."SERIE" = :gs_serie ) AND  
						( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='C' or ls_estado='V' then
					if ls_est_tit='P' or isnull(ls_est_tit) or (ls_est_tit<>'P' and date(ldt_fec_tit)<date("01/10/2002")) then
						SELECT	SUM("SOL_TIT_DOMINIO"."ESTATUS_INFORMATICA")
						INTO 		:ll_sum_est  
						FROM 		"SOL_TIT_DOMINIO",   
									"SOL_ESTATUS"  
						WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_TIT_DOMINIO"."BASE" ) and  
									( "SOL_ESTATUS"."SERIE" = "SOL_TIT_DOMINIO"."SERIE" ) and  
									( "SOL_ESTATUS"."NUMERO" = "SOL_TIT_DOMINIO"."NUMERO" ) and  
									( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TIT_DOMINIO"."CORRELATIVO" ) and  
									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
									( ( "SOL_TIT_DOMINIO"."BASE" = :is_base ) AND  
									( "SOL_TIT_DOMINIO"."SERIE" = :is_serie ) AND  
									( "SOL_TIT_DOMINIO"."NUMERO" = :il_numero ) AND  
									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
						Using		sqlca;
						if sqlca.sqlcode=0 then
							if ll_sum_est=0 or isnull(ll_sum_est) then
								if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
								if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
								ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
								openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
							else
								messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
							end if
						elseif sqlca.sqlcode=100 then
							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
						end if
					else
						messagebox("Advertencia","No es posible generar Solicitud, Verifique Estado y Fecha de Título de Dominio (Estado actual='" +ls_est_tit+"')")
					end if
				else
					messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado")
				end if
			elseif sqlca.sqlcode=100 then
				messagebox("Advertencia","Contrato no Existe")
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
		end if

	CASE '7' // contrato definitivo
		SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
		INTO 		:ls_estado,				:ldt_fecha_res
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			if ls_estado='C' or ls_estado='V' then
				SELECT	SUM("SOL_CONTRATO_DEF"."ESTATUS_INFORMATICA")
				INTO 		:ll_sum_est  
				FROM 	"SOL_CONTRATO_DEF",   
							"SOL_ESTATUS"  
				WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_CONTRATO_DEF"."BASE" ) and  
							( "SOL_ESTATUS"."SERIE" = "SOL_CONTRATO_DEF"."SERIE" ) and  
							( "SOL_ESTATUS"."NUMERO" = "SOL_CONTRATO_DEF"."NUMERO" ) and  
							( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CONTRATO_DEF"."CORRELATIVO" ) and  
							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
							( ( "SOL_CONTRATO_DEF"."BASE" = :is_base ) AND  
							( "SOL_CONTRATO_DEF"."SERIE" = :is_serie ) AND  
							( "SOL_CONTRATO_DEF"."NUMERO" = :il_numero ) AND  
							( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
				Using		sqlca;
				if sqlca.sqlcode=0 then
					if ll_sum_est=0 or isnull(ll_sum_est) then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					else
						messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
					end if
				elseif sqlca.sqlcode=100 then
					if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
					if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
					ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
					openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
				end if
			else
				messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado / V-Vigente")
			end if
		elseif sqlca.sqlcode=100 then
			messagebox("Advertencia","Contrato no Existe")
		elseif sqlca.sqlcode=-1 then
			messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
		end if

	CASE '8'	// entrega pagare
		SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
		INTO 		:ls_estado,				:ldt_fecha_res
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			if ls_estado='C' or ls_estado='V' then
				SELECT	SUM("SOL_ENTREGA_PAG"."ESTATUS_INFORMATICA")
				INTO 		:ll_sum_est  
				FROM 	"SOL_ENTREGA_PAG",   
							"SOL_ESTATUS"  
				WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_ENTREGA_PAG"."BASE" ) and  
							( "SOL_ESTATUS"."SERIE" = "SOL_ENTREGA_PAG"."SERIE" ) and  
							( "SOL_ESTATUS"."NUMERO" = "SOL_ENTREGA_PAG"."NUMERO" ) and  
							( "SOL_ESTATUS"."CORRELATIVO" = "SOL_ENTREGA_PAG"."CORRELATIVO" ) and  
							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
							( ( "SOL_ENTREGA_PAG"."BASE" = :is_base ) AND  
							( "SOL_ENTREGA_PAG"."SERIE" = :is_serie ) AND  
							( "SOL_ENTREGA_PAG"."NUMERO" = :il_numero ) AND  
							( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
				Using		sqlca;
				if sqlca.sqlcode=0 then
					if ll_sum_est=0 or isnull(ll_sum_est) then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					else
						messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
					end if
				elseif sqlca.sqlcode=100 then
					if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
					if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
					ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
					openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
				end if
			else
				messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado / V-Vigente")
			end if
		elseif sqlca.sqlcode=100 then
			messagebox("Advertencia","Contrato no Existe")
		elseif sqlca.sqlcode=-1 then
			messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
		end if

	CASE '9' // Certificados Varios
		messagebox("Advertencia","Solicitud No Definida")

	CASE '10' // solicitud de transferencia (cambio titular del contrato)
		messagebox("Advertencia","Ya NO es posible Generar Solicitud")
//		if is_base='O' or is_base='C' or is_base='P' or is_base='L' or is_base='A' or is_base='F' or is_base='R' then
//			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
//			INTO 		:ls_estado,				:ldt_fecha_res
//			FROM 	"CADENA"  
//			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
//						( "CADENA"."SERIE" = :gs_serie ) AND  
//						( "CADENA"."NUMERO" = :gi_numero )   
//			Using		sqlca;
//			if sqlca.sqlcode=0 then
//				if ls_estado='C' or ls_estado='V' then
//					SELECT	SUM("SOL_TRANSFERENCIA"."ESTATUS_INFORMATICA")
//					INTO 		:ll_sum_est  
//					FROM 	"SOL_TRANSFERENCIA",   
//								"SOL_ESTATUS"  
//					WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_TRANSFERENCIA"."BASE" ) and  
//								( "SOL_ESTATUS"."SERIE" = "SOL_TRANSFERENCIA"."SERIE" ) and  
//								( "SOL_ESTATUS"."NUMERO" = "SOL_TRANSFERENCIA"."NUMERO" ) and  
//								( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TRANSFERENCIA"."CORRELATIVO" ) and  
//								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
//								( ( "SOL_TRANSFERENCIA"."BASE" = :is_base ) AND  
//								( "SOL_TRANSFERENCIA"."SERIE" = :is_serie ) AND  
//								( "SOL_TRANSFERENCIA"."NUMERO" = :il_numero ) AND  
//								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
//					Using		sqlca;
//					if sqlca.sqlcode=0 then
//						if ll_sum_est=0 or isnull(ll_sum_est) then
//							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
//							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
//							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
//							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
//						else
//							messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
//						end if
//					elseif sqlca.sqlcode=100 then
//						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
//						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
//						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
//						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
//					end if
//				else
//					messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado / V-Vigente")
//				end if
//			elseif sqlca.sqlcode=100 then
//				messagebox("Advertencia","Contrato no Existe")
//			elseif sqlca.sqlcode=-1 then
//				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
//			end if
//		else
//			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
//		end if
//
	CASE '11' // resolucion
		SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
		INTO 		:ls_estado,				:ldt_fecha_res
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			if ls_estado='V' then
				SELECT	SUM("SOL_RESOLUCION"."ESTATUS_INFORMATICA")
				INTO 		:ll_sum_est  
				FROM 	"SOL_RESOLUCION",   
							"SOL_ESTATUS"  
				WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_RESOLUCION"."BASE" ) and  
							( "SOL_ESTATUS"."SERIE" = "SOL_RESOLUCION"."SERIE" ) and  
							( "SOL_ESTATUS"."NUMERO" = "SOL_RESOLUCION"."NUMERO" ) and  
							( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESOLUCION"."CORRELATIVO" ) and  
							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
							( ( "SOL_RESOLUCION"."BASE" = :is_base ) AND  
							( "SOL_RESOLUCION"."SERIE" = :is_serie ) AND  
							( "SOL_RESOLUCION"."NUMERO" = :il_numero ) AND  
							( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
				Using		sqlca;
				if sqlca.sqlcode=0 then
					if ll_sum_est=0 or isnull(ll_sum_est) then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					else
						messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
					end if
				elseif sqlca.sqlcode=100 then
					if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
					if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
					ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
					openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
				end if
			else
				messagebox("Advertencia","El Contrato debe estar Estado V-Vigente")
			end if
		elseif sqlca.sqlcode=100 then
			messagebox("Advertencia","Contrato no Existe")
		elseif sqlca.sqlcode=-1 then
			messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
		end if

	CASE '12' // modificación antecedentes del cliente
		ll_tot_reg			= dw_reporte.rowcount()
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ll_est_inf		= dw_reporte.getitemnumber(ll_indi,'sol_mod_antece_estatus_informatica')
				ls_est_reg	= dw_reporte.getitemstring(ll_indi,'sol_estatus_estado_reg')
				if ls_est_reg<>'I' then
					ll_sum	= ll_sum + ll_est_inf
				end if
			next
			if ll_sum=0 or isnull(ll_sum) then
				if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
				if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
				ll_corr		= ll_tot_reg + 1
				ls_string		= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
				openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
			else
				messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
			end if
		else
			if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
			if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
			ll_corr			= 1
			ls_string			= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
			openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
		end if

	CASE '13' // Dación en Pago
//		messagebox("Advertencia","Ya NO es posible Generar Solicitud")
		SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
		INTO 		:ls_estado,				:ldt_fecha_res
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			if ls_estado='V' or ls_estado='C' then
				SELECT	SUM("SOL_CAMBIO_ESTADO"."ESTATUS_INFORMATICA")
				INTO 		:ll_sum_est  
				FROM 	"SOL_CAMBIO_ESTADO",   
							"SOL_ESTATUS"  
				WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_CAMBIO_ESTADO"."BASE" ) and  
							( "SOL_ESTATUS"."SERIE" = "SOL_CAMBIO_ESTADO"."SERIE" ) and  
							( "SOL_ESTATUS"."NUMERO" = "SOL_CAMBIO_ESTADO"."NUMERO" ) and  
							( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CAMBIO_ESTADO"."CORRELATIVO" ) and  
							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
							(("SOL_CAMBIO_ESTADO"."BASE" = :is_base ) AND  
							( "SOL_CAMBIO_ESTADO"."SERIE" = :is_serie ) AND  
							( "SOL_CAMBIO_ESTADO"."NUMERO" = :il_numero ) AND  
							( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
				Using		sqlca;
				if sqlca.sqlcode=0 then
					if ll_sum_est=0 or isnull(ll_sum_est) then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string		= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					else
						messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
					end if
				elseif sqlca.sqlcode=100 then
					if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
					if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
					ls_string			= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
					openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
				end if
			else
				messagebox("Advertencia","El Contrato debe estar Estado V-Vigente")
			end if
		elseif sqlca.sqlcode=100 then
			messagebox("Advertencia","Contrato no Existe")
		elseif sqlca.sqlcode=-1 then
			messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
		end if
	
	CASE '14' // Cambio estado Titular
		SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
		INTO 		:ls_estado,				:ldt_fecha_res
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			SELECT	SUM("SOL_CAMBIO_ESTADO_TITULAR"."ESTATUS_INFORMATICA")
			INTO 		:ll_sum_est  
			FROM 	"SOL_CAMBIO_ESTADO_TITULAR",   
						"SOL_ESTATUS"  
			WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_CAMBIO_ESTADO_TITULAR"."BASE" ) and  
						( "SOL_ESTATUS"."SERIE" = "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" ) and  
						( "SOL_ESTATUS"."NUMERO" = "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" ) and  
						( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" ) and  
						( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
						(("SOL_CAMBIO_ESTADO_TITULAR"."BASE" = :is_base ) AND  
						( "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" = :is_serie ) AND  
						( "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" = :il_numero ) AND  
						( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if ll_sum_est=0 or isnull(ll_sum_est) then
					if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
					if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
					ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
					openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
				else
					messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
				end if
			elseif sqlca.sqlcode=100 then
				if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
				if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
				ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
				openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
			end if
		elseif sqlca.sqlcode=100 then
			messagebox("Advertencia","Contrato no Existe")
		elseif sqlca.sqlcode=-1 then
			messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
		end if
		
	CASE '15' // Solicitud Seguro
		if is_base='O' or is_base='F' then
			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
			INTO 		:ls_estado,				:ldt_fecha_res
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
						( "CADENA"."SERIE" = :gs_serie ) AND  
						( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='C' or ls_estado='V' or ls_estado='R' or ls_estado='P' then
					SELECT	SUM("SOL_SEGURO"."ESTATUS_INFORMATICA")
					INTO 		:ll_sum_est  
					FROM 	"SOL_SEGURO",   
								"SOL_ESTATUS"  
					WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_SEGURO"."BASE" ) and  
								( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO"."SERIE" ) and  
								( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO"."NUMERO" ) and  
								( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO"."CORRELATIVO" ) and  
								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
								( ( "SOL_SEGURO"."BASE" = :is_base ) AND  
								( "SOL_SEGURO"."SERIE" = :is_serie ) AND  
								( "SOL_SEGURO"."NUMERO" = :il_numero ) AND  
								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
					Using		sqlca;
					if sqlca.sqlcode=0 then
						if ll_sum_est=0 or isnull(ll_sum_est) then
							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
						else
							messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
						end if
					elseif sqlca.sqlcode=100 then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					end if
				else
					messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado / V-Vigente / R-Resciliado / P-Reprogramado")
				end if
			elseif sqlca.sqlcode=100 then
				messagebox("Advertencia","Contrato no Existe")
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
		end if
		
	CASE '16' // solicitud de Novacion (cambio titular del contrato)
		messagebox("Advertencia","Ya NO es posible Generar Solicitud")
//		if is_base='O' or is_base='C' or is_base='P' or is_base='L' or is_base='A' or is_base='F' then
//			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
//			INTO 		:ls_estado,				:ldt_fecha_res
//			FROM 	"CADENA"  
//			WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
//					 ( "CADENA"."SERIE" = :gs_serie ) AND  
//					 ( "CADENA"."NUMERO" = :gi_numero )   
//			Using		sqlca;
//			if sqlca.sqlcode=0 then
//				if ls_estado='C' or ls_estado='V' then
//					SELECT	SUM("SOL_NOVACION"."ESTATUS_INFORMATICA")
//					INTO 		:ll_sum_est  
//					FROM 	"SOL_NOVACION",   
//								"SOL_ESTATUS"  
//					WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_NOVACION"."BASE" ) and  
//								( "SOL_ESTATUS"."SERIE" = "SOL_NOVACION"."SERIE" ) and  
//								( "SOL_ESTATUS"."NUMERO" = "SOL_NOVACION"."NUMERO" ) and  
//								( "SOL_ESTATUS"."CORRELATIVO" = "SOL_NOVACION"."CORRELATIVO" ) and  
//								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
//								(("SOL_NOVACION"."BASE" = :is_base ) AND  
//								( "SOL_NOVACION"."SERIE" = :is_serie ) AND  
//								( "SOL_NOVACION"."NUMERO" = :il_numero ) AND  
//								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
//					Using		sqlca;
//					if sqlca.sqlcode=0 then
//						if ll_sum_est=0 or isnull(ll_sum_est) then
//							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
//							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
//							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
//							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
//						else
//							messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
//						end if
//					elseif sqlca.sqlcode=100 then
//						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
//						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
//						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
//						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
//					end if
//				else
//					messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado / V-Vigente")
//				end if
//			elseif sqlca.sqlcode=100 then
//				messagebox("Advertencia","Contrato no Existe")
//			elseif sqlca.sqlcode=-1 then
//				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
//			end if
//		else
//			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
//		end if
		
	CASE '17','18' //17-Solicitud Anexo Ingreso Copropietario Promesas , 18-Declaración de Ultima Voluntad
		if is_base='O' then
			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
			INTO 		:ls_estado,				:ldt_fecha_res
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
						( "CADENA"."SERIE" = :gs_serie ) AND  
						( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
				ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
				openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
			end if
		else
			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
		end if

	CASE '19'//Solicitud Posesión Efectiva
		if is_base='O' or is_base='C' or is_base='F' then
			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
			INTO 		:ls_estado,				:ldt_fecha_res
			FROM 	"CADENA"  
			WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
					 ( "CADENA"."SERIE" = :gs_serie ) AND  
					 ( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='C' or ls_estado='V' then
					SELECT	SUM("SOL_POS_EFEC"."ESTATUS_INFORMATICA")
					INTO 		:ll_sum_est  
					FROM 		"SOL_POS_EFEC",   
								"SOL_ESTATUS"  
					WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_POS_EFEC"."BASE" ) and  
								( "SOL_ESTATUS"."SERIE" = "SOL_POS_EFEC"."SERIE" ) and  
								( "SOL_ESTATUS"."NUMERO" = "SOL_POS_EFEC"."NUMERO" ) and  
								( "SOL_ESTATUS"."CORRELATIVO" = "SOL_POS_EFEC"."CORRELATIVO" ) and  
								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
								(("SOL_POS_EFEC"."BASE" = :is_base ) AND  
								( "SOL_POS_EFEC"."SERIE" = :is_serie ) AND  
								( "SOL_POS_EFEC"."NUMERO" = :il_numero ) AND  
								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
					Using		sqlca;
					if sqlca.sqlcode=0 then
						if ll_sum_est=0 or isnull(ll_sum_est) then
							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
						else
							messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
						end if
					elseif sqlca.sqlcode=100 then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					end if
				else
					messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado / V-Vigente")
				end if
			elseif sqlca.sqlcode=100 then
				messagebox("Advertencia","Contrato no Existe")
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
		end if

	CASE '20' // Solicitud PAC
		SELECT	"CADENA"."ESTADO",	"CADENA"."FECHA_RES",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT"  
		INTO		:ls_estado,				:ldt_fecha_res,			:ll_mora_cred,					:ll_mora_mant
		FROM 	"CADENA",	"CADENA_MORA"  
		WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
				 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
				 (("CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero )   )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			if ls_estado='V' or ls_estado='C' then
				if ll_mora_cred>0 and ll_mora_mant>0 then
					ll_resp	= messagebox("Advertencia","Contrato Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,'###,###,###,###,###')+' tiene '+string(ll_mora_cred)+' Cuota(s) Mora Crédito y '+string(ll_mora_mant)+' Cuota(s) Mora Mantención, desea Continuar ?',Exclamation!,YesNo!,2)
				elseif ll_mora_cred>0 then
					ll_resp	= messagebox("Advertencia","Contrato Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,'###,###,###,###,###')+' tiene '+string(ll_mora_cred)+' Cuota(s) Mora Crédito, desea Continuar ?',Exclamation!,YesNo!,2)
				elseif ll_mora_mant>0 then
					ll_resp	= messagebox("Advertencia","Contrato Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,'###,###,###,###,###')+' tiene '+string(ll_mora_mant)+' Cuota(s) Mora mantención, desea Continuar ?',Exclamation!,YesNo!,2)
				else
					ll_resp	= 1
				end if
				if ll_resp=1 then
					SELECT	"SOL_PAC"."FOLIO_MANDATO"
					INTO 		:ll_folio_mandato
					FROM 	"SOL_PAC",   
								"SOL_ESTATUS"  
					WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_PAC"."BASE" ) and  
								( "SOL_ESTATUS"."SERIE" = "SOL_PAC"."SERIE" ) and  
								( "SOL_ESTATUS"."NUMERO" = "SOL_PAC"."NUMERO" ) and  
								( "SOL_ESTATUS"."CORRELATIVO" = "SOL_PAC"."CORRELATIVO" ) and  
								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
								(("SOL_PAC"."BASE" = :is_base ) AND  
								( "SOL_PAC"."SERIE" = :is_serie ) AND  
								( "SOL_PAC"."NUMERO" = :il_numero ) AND  
								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
					Using		sqlca;
					if sqlca.sqlcode=0 then
						messagebox("Advertencia","Para este Contrato existe Solicitud Vigente Mandato Nº "+string(ll_folio_mandato,'###,###,###,###,###'))
	//					if ll_sum_est=0 or isnull(ll_sum_est) then
	//						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
	//						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
	//						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
	//						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
	//					else
	//						messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
	//					end if
					elseif sqlca.sqlcode=100 then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					end if
				end if
			else
				messagebox("Advertencia","El Contrato debe estar Estado V-Vigente o C-Cancelado")
			end if
		elseif sqlca.sqlcode=100 then
			messagebox("Advertencia","Contrato no Existe")
		elseif sqlca.sqlcode=-1 then
			messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
		end if
		
	CASE '21' // Solicitud PAT
		SELECT	"CADENA"."ESTADO",	"CADENA"."FECHA_RES",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT"  
		INTO		:ls_estado,				:ldt_fecha_res,				:ll_mora_cred,							:ll_mora_mant
		FROM 	"CADENA",	"CADENA_MORA"  
		WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
				 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
				 (("CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero )   )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			if ls_estado='V' or ls_estado='C' then
				if ll_mora_cred>0 and ll_mora_mant>0 then
					ll_resp	= messagebox("Advertencia","Contrato Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,'###,###,###,###,###')+' tiene '+string(ll_mora_cred)+' Cuota(s) Mora Crédito y '+string(ll_mora_mant)+' Cuota(s) Mora Mantención, desea Continuar ?',Exclamation!,YesNo!,2)
				elseif ll_mora_cred>0 then
					ll_resp	= messagebox("Advertencia","Contrato Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,'###,###,###,###,###')+' tiene '+string(ll_mora_cred)+' Cuota(s) Mora Crédito, desea Continuar ?',Exclamation!,YesNo!,2)
				elseif ll_mora_mant>0 then
					ll_resp	= messagebox("Advertencia","Contrato Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,'###,###,###,###,###')+' tiene '+string(ll_mora_mant)+' Cuota(s) Mora mantención, desea Continuar ?',Exclamation!,YesNo!,2)
				else
					ll_resp	= 1
				end if
				if ll_resp=1 then
					SELECT	"SOL_PAT"."FOLIO_MANDATO"
					INTO 		:ll_folio_mandato
					FROM 	"SOL_PAT",   
								"SOL_ESTATUS"  
					WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_PAT"."BASE" ) and  
								( "SOL_ESTATUS"."SERIE" = "SOL_PAT"."SERIE" ) and  
								( "SOL_ESTATUS"."NUMERO" = "SOL_PAT"."NUMERO" ) and  
								( "SOL_ESTATUS"."CORRELATIVO" = "SOL_PAT"."CORRELATIVO" ) and  
								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
								(("SOL_PAT"."BASE" = :is_base ) AND  
								( "SOL_PAT"."SERIE" = :is_serie ) AND  
								( "SOL_PAT"."NUMERO" = :il_numero ) AND  
								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
					Using		sqlca;
					if sqlca.sqlcode=0 then
						messagebox("Advertencia","Para este Contrato existe Solicitud Vigente Mandato Nº "+string(ll_folio_mandato,'###,###,###,###,###'))
	//					if ll_sum_est=0 or isnull(ll_sum_est) then
	//						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
	//						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
	//						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
	//						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
	//					else
	//						messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
	//					end if
					elseif sqlca.sqlcode=100 then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					end if
				end if
			else
				messagebox("Advertencia","El Contrato debe estar Estado V-Vigente o C-Cancelado")
			end if
		elseif sqlca.sqlcode=100 then
			messagebox("Advertencia","Contrato no Existe")
		elseif sqlca.sqlcode=-1 then
			messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
		end if
		
	CASE '22' // seguro fallecimiento
		if is_base='O' or is_base='L' or is_base='D' or is_base='A' or is_base='P' or is_base='F' then
			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
			INTO 		:ls_estado,				:ldt_fecha_res
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
						( "CADENA"."SERIE" = :gs_serie ) AND  
						( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='C' or ls_estado='V' or ls_estado='R' or ls_estado='P' then
					SELECT	SUM("SOL_SEGURO_FALLECE"."ESTATUS_INFORMATICA")
					INTO 		:ll_sum_est  
					FROM 	"SOL_SEGURO_FALLECE",   
								"SOL_ESTATUS"  
					WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_FALLECE"."BASE" ) and  
								( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_FALLECE"."SERIE" ) and  
								( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_FALLECE"."NUMERO" ) and  
								( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_FALLECE"."CORRELATIVO" ) and  
								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
								( ( "SOL_SEGURO_FALLECE"."BASE" = :is_base ) AND  
								( "SOL_SEGURO_FALLECE"."SERIE" = :is_serie ) AND  
								( "SOL_SEGURO_FALLECE"."NUMERO" = :il_numero ) AND  
								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
					Using		sqlca;
					if sqlca.sqlcode=0 then
						if ll_sum_est=0 or isnull(ll_sum_est) then
							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
						else
							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
//							messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
						end if
					elseif sqlca.sqlcode=100 then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					end if
				else
					messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado / V-Vigente / R-Resciliado / P-Reprogramado")
				end if
			elseif sqlca.sqlcode=100 then
				messagebox("Advertencia","Contrato no Existe")
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
		end if
		
	CASE '23' // en demanda
		SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES","CADENA"."ESTADO_CONTRATO_AUX"
		INTO 		:ls_estado,				:ldt_fecha_res ,  						:ls_estado_ctto_aux 
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			SELECT 	count("FALLECIDOS"."FOLIO")
			INTO 		:ll_fallecido  
			FROM 	"FALLECIDOS"  
			WHERE 	( "FALLECIDOS"."BASE" = :gs_base ) AND  
						( "FALLECIDOS"."SS" = :gs_serie ) AND  
						( "FALLECIDOS"."CONTRATO" = :gi_numero )  AND
						( "FALLECIDOS"."ESTADO_REG" = 'A' )
			Using		sqlca;
			if ls_estado='C' or ls_estado='V' or (ls_estado = 'R' and ll_fallecido > 0 and (ls_estado_ctto_aux = 'M' or ls_estado_ctto_aux= 'B' or ls_estado_ctto_aux= 'R' or isnull(ls_estado_ctto_aux))) then 
				SELECT	SUM("SOL_EN_DEMANDA"."ESTATUS_INFORMATICA")
				INTO 		:ll_sum_est  
				FROM 	"SOL_EN_DEMANDA",   
							"SOL_ESTATUS"  
				WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_EN_DEMANDA"."BASE" ) and  
							( "SOL_ESTATUS"."SERIE" = "SOL_EN_DEMANDA"."SERIE" ) and  
							( "SOL_ESTATUS"."NUMERO" = "SOL_EN_DEMANDA"."NUMERO" ) and  
							( "SOL_ESTATUS"."CORRELATIVO" = "SOL_EN_DEMANDA"."CORRELATIVO" ) and  
							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
							( ( "SOL_EN_DEMANDA"."BASE" = :is_base ) AND  
							( "SOL_EN_DEMANDA"."SERIE" = :is_serie ) AND  
							( "SOL_EN_DEMANDA"."NUMERO" = :il_numero ) AND  
							( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
				Using		sqlca;
				if sqlca.sqlcode=0 then
					if ll_sum_est=0 or isnull(ll_sum_est) then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					else
						messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
					end if
				elseif sqlca.sqlcode=100 then
					if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
					if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
					ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
					openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
				end if
			elseif ls_estado='M' then
				SELECT	SUM("SOL_EN_DEMANDA"."ESTATUS_INFORMATICA")
				INTO 		:ll_sum_est  
				FROM 	"SOL_EN_DEMANDA",   
							"SOL_ESTATUS"  
				WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_EN_DEMANDA"."BASE" ) and  
							( "SOL_ESTATUS"."SERIE" = "SOL_EN_DEMANDA"."SERIE" ) and  
							( "SOL_ESTATUS"."NUMERO" = "SOL_EN_DEMANDA"."NUMERO" ) and  
							( "SOL_ESTATUS"."CORRELATIVO" = "SOL_EN_DEMANDA"."CORRELATIVO" ) and  
							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
							( ( "SOL_EN_DEMANDA"."BASE" = :is_base ) AND  
							( "SOL_EN_DEMANDA"."SERIE" = :is_serie ) AND  
							( "SOL_EN_DEMANDA"."NUMERO" = :il_numero ) AND
							( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) AND
							( "SOL_EN_DEMANDA"."ESTADO_CTTO_FINAL" = 'M' ) )   
				Using		sqlca;
				if sqlca.sqlcode=0 then
					if ll_sum_est=0 or isnull(ll_sum_est) then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					else
						messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
						
					end if
				elseif sqlca.sqlcode=100 then
					if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
					if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
					ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
					openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
				end if
			else
				messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado / V-Vigente / R-Resuelto con Fallecidos")
			end if
		elseif sqlca.sqlcode=100 then
			messagebox("Advertencia","Contrato no Existe")
		elseif sqlca.sqlcode=-1 then
			messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
		end if
	CASE '24' // Bono Fraternal
		if is_base='O' or is_base='L' or is_base='D' or is_base='A' or is_base='P' or is_base='F' then
			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
			INTO 		:ls_estado,				:ldt_fecha_res
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
						( "CADENA"."SERIE" = :gs_serie ) AND  
						( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='C' or ls_estado='V' or ls_estado='R' or ls_estado='P' or ls_estado= 'S' then
					SELECT	SUM("SOL_BONO_FRATERNO"."ESTATUS_INFORMATICA")
					INTO 		:ll_sum_est  
					FROM 	"SOL_BONO_FRATERNO",   
								"SOL_ESTATUS"  
					WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_BONO_FRATERNO"."BASE" ) and  
								( "SOL_ESTATUS"."SERIE" = "SOL_BONO_FRATERNO"."SERIE" ) and  
								( "SOL_ESTATUS"."NUMERO" = "SOL_BONO_FRATERNO"."NUMERO" ) and  
								( "SOL_ESTATUS"."CORRELATIVO" = "SOL_BONO_FRATERNO"."CORRELATIVO" ) and  
								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
								( ( "SOL_BONO_FRATERNO"."BASE" = :is_base ) AND  
								( "SOL_BONO_FRATERNO"."SERIE" = :is_serie ) AND  
								( "SOL_BONO_FRATERNO"."NUMERO" = :il_numero ) AND  
								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
					Using		sqlca;
					if sqlca.sqlcode=0 then
						if ll_sum_est=0 or isnull(ll_sum_est) then
							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
						else
							messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
						end if
					elseif sqlca.sqlcode=100 then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					end if
				else
					messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado / V-Vigente / R-Resciliado / P-Reprogramado / S-Seguro Desg.")
				end if
			elseif sqlca.sqlcode=100 then
				messagebox("Advertencia","Contrato no Existe")
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
		end if
	CASE '25' // Mantencion Perpetua
		if is_base='O' or is_base='C' then //is_base='L' or is_base='D' or is_base='A' or is_base='P' or is_base='F' then
			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
			INTO 		:ls_estado,				:ldt_fecha_res
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
						( "CADENA"."SERIE" = :gs_serie ) AND  
						( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='C' or ls_estado='V' or ls_estado='R' or ls_estado='P' or ls_estado= 'S' then
					SELECT	SUM("SOL_MANT_PERPETUA"."ESTATUS_INFORMATICA")
					INTO 		:ll_sum_est  
					FROM 	"SOL_MANT_PERPETUA",   
								"SOL_ESTATUS"  
					WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_MANT_PERPETUA"."BASE" ) and  
								( "SOL_ESTATUS"."SERIE" = "SOL_MANT_PERPETUA"."SERIE" ) and  
								( "SOL_ESTATUS"."NUMERO" = "SOL_MANT_PERPETUA"."NUMERO" ) and  
								( "SOL_ESTATUS"."CORRELATIVO" = "SOL_MANT_PERPETUA"."CORRELATIVO" ) and  
								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
								( ( "SOL_MANT_PERPETUA"."BASE" = :is_base ) AND  
								( "SOL_MANT_PERPETUA"."SERIE" = :is_serie ) AND  
								( "SOL_MANT_PERPETUA"."NUMERO" = :il_numero ) AND  
								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
					Using		sqlca;
					if sqlca.sqlcode=0 then
						if ll_sum_est=0 or isnull(ll_sum_est) then
							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
						else
							messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
						end if
					elseif sqlca.sqlcode=100 then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					end if
				else
					messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado / V-Vigente / R-Resciliado / P-Reprogramado / S-Seguro Desg.")
				end if
			elseif sqlca.sqlcode=100 then
				messagebox("Advertencia","Contrato no Existe")
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
		end if
	CASE '26' // titulo de dominio parque
		if is_base='O' or is_base='C' then
			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES" , "CADENA"."ESTADO_TITULO",	"CADENA"."FECHA_TITULO"
			INTO 		:ls_estado,				:ldt_fecha_res			,:ls_est_tit,						:ldt_fec_tit
			FROM 	"CADENA"
			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
						( "CADENA"."SERIE" = :gs_serie ) AND  
						( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='C' or ls_estado='V' then
//					if ls_est_tit='P' or isnull(ls_est_tit) or (ls_est_tit<>'P' and date(ldt_fec_tit)<date("01/10/2002")) then
					if ls_est_tit = 'S' then
						setnull(ls_pasa)
						ll_resp				= messagebox("Advertencia","Titulo ya Impreso,Desea Reimprimir Título Dominio",Exclamation!,YesNo!,2)
						if ll_resp = 1 then
							ls_pasa = 'S'
						else
							ls_pasa = 'N'
						end if	
					else
						ls_pasa = 'S'
					end if
					if ls_pasa = 'S' then
						SELECT	SUM("SOL_TIT_DOMINIO_PARQUE"."ESTATUS_INFORMATICA")
						INTO 		:ll_sum_est  
						FROM 	"SOL_TIT_DOMINIO_PARQUE",   
									"SOL_ESTATUS"  
						WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_TIT_DOMINIO_PARQUE"."BASE" ) and  
									( "SOL_ESTATUS"."SERIE" = "SOL_TIT_DOMINIO_PARQUE"."SERIE" ) and  
									( "SOL_ESTATUS"."NUMERO" = "SOL_TIT_DOMINIO_PARQUE"."NUMERO" ) and  
									( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TIT_DOMINIO_PARQUE"."CORRELATIVO" ) and  
									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
									( ( "SOL_TIT_DOMINIO_PARQUE"."BASE" = :is_base ) AND  
									( "SOL_TIT_DOMINIO_PARQUE"."SERIE" = :is_serie ) AND  
									( "SOL_TIT_DOMINIO_PARQUE"."NUMERO" = :il_numero ) AND  
									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
						Using		sqlca;
						if sqlca.sqlcode=0 then
							if ll_sum_est=0 or isnull(ll_sum_est) then
								if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
								if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
								ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
								openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
							else
								messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
							end if
						elseif sqlca.sqlcode=100 then
							if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
							if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
							ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
							openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
						end if
					//else
					//	messagebox("Advertencia","No es posible generar Solicitud, Verifique Estado y Fecha de Título de Dominio (Estado actual='" +ls_est_tit+"')")
					end if
				else
					messagebox("Advertencia","El Contrato debe estar Estado C-Cancelado")
				end if
			elseif sqlca.sqlcode=100 then
				messagebox("Advertencia","Contrato no Existe")
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
		end if
	
	CASE '27' // Compromiso de Pago
		if is_base='O' or is_base='C' THEN //  or is_base='R' then
			SELECT 	"CADENA"."ESTADO",	"CADENA"."FECHA_RES"
			INTO 		:ls_estado,				:ldt_fecha_res
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
						( "CADENA"."SERIE" = :gs_serie ) AND  
						( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='V' or ls_estado='C' then
					SELECT	SUM("SOL_COMPROMISO_PAGO"."ESTATUS_INFORMATICA")
					INTO 		:ll_sum_est 
					FROM 	"SOL_COMPROMISO_PAGO",   
								"SOL_ESTATUS"  
					WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_COMPROMISO_PAGO"."BASE" ) and  
								( "SOL_ESTATUS"."SERIE" = "SOL_COMPROMISO_PAGO"."SERIE" ) and  
								( "SOL_ESTATUS"."NUMERO" = "SOL_COMPROMISO_PAGO"."NUMERO" ) and  
								( "SOL_ESTATUS"."CORRELATIVO" = "SOL_COMPROMISO_PAGO"."CORRELATIVO" ) and  
								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
								( ( "SOL_COMPROMISO_PAGO"."BASE" = :is_base ) AND  
								( "SOL_COMPROMISO_PAGO"."SERIE" = :is_serie ) AND  
								( "SOL_COMPROMISO_PAGO"."NUMERO" = :il_numero ) AND  
								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   
					Using		sqlca;
					if sqlca.sqlcode=0 then
						
						SELECT	"SOL_COMPROMISO_PAGO"."FECREP_ULT_VCTO"
						INTO 		:ldt_fec_venc_comp
						FROM 	"SOL_COMPROMISO_PAGO",   
									"SOL_ESTATUS"  
						WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_COMPROMISO_PAGO"."BASE" ) and  
									( "SOL_ESTATUS"."SERIE" = "SOL_COMPROMISO_PAGO"."SERIE" ) and  
									( "SOL_ESTATUS"."NUMERO" = "SOL_COMPROMISO_PAGO"."NUMERO" ) and  
									( "SOL_ESTATUS"."CORRELATIVO" = "SOL_COMPROMISO_PAGO"."CORRELATIVO" ) and  
									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
									( ( "SOL_COMPROMISO_PAGO"."BASE" = :is_base ) AND  
									( "SOL_COMPROMISO_PAGO"."SERIE" = :is_serie ) AND  
									( "SOL_COMPROMISO_PAGO"."NUMERO" = :il_numero ) AND  
									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) )   ;
						if date(gdt_fec_sistema) > date(ldt_fec_venc_comp) then
							if ll_sum_est=0 or isnull(ll_sum_est)  then
								if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
								if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
								ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
								openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
							else
								messagebox("Advertencia","Para este Contrato existe Solicitud Vigente")
							end if
						else
							messagebox("Advertencia","Para este Contrato existe Compromiso de Pago Pendiente, Ultima Fecha Compromiso "+string(ldt_fec_venc_comp,'dd/mm/yyyy'))
						end if
					elseif sqlca.sqlcode=100 then
						if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
						if isnull(ldt_fecha_res) then ldt_fecha_res = datetime("01/01/1900")
						ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'N'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
						openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
					end if
				else
					messagebox("Advertencia","El Contrato debe estar Estado V-Vigente o C-Cancelado")
				end if
			elseif sqlca.sqlcode=100 then
				messagebox("Advertencia","Contrato no Existe")
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","Para este Tipo de Contrato NO es posible Generar Solicitud")
		end if
END CHOOSE
end event

type cb_cerrar from commandbutton within w_detalle_solicitudes
boolean visible = false
integer x = 2546
integer y = 1824
integer width = 265
integer height = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_solicitudes)
end event

type dw_reporte from datawindow within w_detalle_solicitudes
event ue_mousemove pbm_mousemove
integer x = 18
integer y = 112
integer width = 2793
integer height = 1760
integer taborder = 10
string dataobject = "dw_lista_solicitudes_rescilia_cliente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_help.visible	= true
end event

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;Long		ll_corr
String	ls_string,ls_estado
datetime	ldt_fecha_res
il_row				= this.getrow()
if il_row>0 then
	ll_corr			= this.getitemnumber(il_row,'sol_estatus_correlativo')
	if is_tipo_sol='12' then
		ls_estado		= 'V'
	else
		ls_estado		= this.getitemstring(il_row,'cadena_estado')
		ldt_fecha_res	= this.getitemdatetime(il_row,'cadena_fecha_res')
	end if
	if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
	if isnull(ldt_fecha_res) then ldt_fecha_res=datetime("01/01/1900")
	ls_string		= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+is_tipo_sol+'~t'+string(ll_corr)+'~t'+'M'+'~t'+ls_estado+'~t'+string(date(ldt_fecha_res))
	openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
end if
end event

type cb_filtrar from commandbutton within w_detalle_solicitudes
boolean visible = false
integer x = 2263
integer y = 1824
integer width = 224
integer height = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_reporte.SETfilter(NULO)
dw_reporte.filter()
end event

type cb_aceptar_operaciones from commandbutton within w_detalle_solicitudes
boolean visible = false
integer x = 768
integer y = 1824
integer width = 270
integer height = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Autori&zar"
end type

event clicked;long		ll_estatus, ll_corr,ll_est_inf,ll_rut, Net,ll_count_trans
String		ls_obs, ls_cod_sol, ls_est_reg, ls_string, ls_comentario, ls_conex,ls_ejecutivo,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_estado_ctto_final,ls_descrip_parque,ls_nom_completo,&
			ls_rut,ls_descrip_estado_ctto,ls_asunto,ls_texto,email_de,ls_email_para,ls_res

if il_row>0 then
	ls_est_reg			= dw_reporte.getitemstring(il_row,'sol_estatus_estado_reg')
	gs_base				= dw_reporte.getitemstring(il_row,'sol_estatus_base')
	gs_serie				= dw_reporte.getitemstring(il_row,'sol_estatus_serie')
	gi_numero			= dw_reporte.getitemnumber(il_row,'sol_estatus_numero')
	ll_corr				= dw_reporte.getitemnumber(il_row,'sol_estatus_correlativo')
	ls_cod_sol			= dw_reporte.getitemstring(il_row,'sol_estatus_codigo_solicitud')
	ll_rut					= dw_reporte.getitemnumber(il_row,'cliente_rut')
	CHOOSE CASE is_tipo_sol
		CASE '1'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_rescilia_cliente_estatus_operacion')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_rescilia_cliente_estatus_informatica')
		CASE '2'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_rescilia_reprog_estatus_operacion')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_rescilia_reprog_estatus_informatica')
		CASE '3'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_reactiva_estatus_operacion')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_reactiva_estatus_informatica')
		CASE '4'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_seguro_desg_estatus_operaciones')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_seguro_desg_estatus_informatica')
		CASE '5'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_estatus_operacion')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_estatus_informatica')
		CASE '6'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_tit_dominio_estatus_operaciones')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_tit_dominio_estatus_informatica')
		CASE '7'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_contrato_def_estatus_operaciones')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_contrato_def_estatus_informatica')
		CASE '8'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_entrega_pag_estatus_operaciones')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_entrega_pag_estatus_informatica')
		CASE '10'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_transferencia_estatus_operaciones')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_transferencia_estatus_informatica')
		CASE '11'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_resolucion_estatus_operacion')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_resolucion_estatus_informatica')
		CASE '13'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_cambio_estado_estatus_operacion')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_cambio_estado_estatus_informatica')
		CASE '14'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_cambio_estado_titular_estatus_operac')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_cambio_estado_titular_estatus_inform')
		CASE '15'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_seguro_estatus_operaciones')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_seguro_estatus_informatica')
		CASE '16'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_novacion_estatus_operaciones')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_novacion_estatus_informatica')
		CASE '17'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_coprop_promesa_estatus_opera')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_coprop_promesa_estatus_infor')
		CASE '18'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_ultima_voluntad_estatus_opera')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_ultima_voluntad_estatus_infor')
		CASE '19'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_pos_efec_estatus_operaciones')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_pos_efec_estatus_informatica')
		CASE '20'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_pac_estatus_operacion')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_pac_estatus_informatica')
		CASE '21'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_pat_estatus_operacion')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_pat_estatus_informatica')
		CASE '22'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_seguro_fallece_estatus_operaciones')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_seguro_fallece_estatus_informatica')
		CASE '23'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_en_demanda_estatus_operacion')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_en_demanda_estatus_informatica')
		CASE '24'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_bono_fraterno_estatus_operaciones')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_bono_fraterno_estatus_informatica')
		CASE '25'	
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_mant_perpetua_estatus_operaciones')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_mant_perpetua_estatus_informatica')
		CASE '26'	
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_tit_dominio_parque_estatus_operaciones')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_tit_dominio_parque_estatus_informatica')
		CASE '27'
			ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_compromiso_pago_estatus_operacion')
			ll_est_inf		= dw_reporte.getitemnumber(il_row,'sol_compromiso_pago_estatus_informatica')
	END CHOOSE
	if (ls_cod_sol='10' or ls_cod_sol='16' or ls_cod_sol='19') and ls_est_reg='A' then
		SELECT	Count("SOL_CLIENTE"."RUT")
		INTO 		:ll_count_trans
		FROM 	"SOL_CLIENTE"  
		WHERE 	"SOL_CLIENTE"."RUT_CLIENTE_ORI" = :gi_rut and
					"SOL_CLIENTE"."BASE" = :gs_base and  
					"SOL_CLIENTE"."SERIE" = :gs_serie and   
					"SOL_CLIENTE"."NUMERO" = :gi_numero and    
					"SOL_CLIENTE"."CORRELATIVO" = :ll_corr
		USING	sqlca;
	end if		
	if ls_est_reg='I' then
		messagebox("Advertencia","Solicitud Inactiva")
	elseif (ls_cod_sol='10' /*or ls_cod_sol='16'*/ or ls_cod_sol='19') and (ll_count_trans=0 or isnull(ll_count_trans)) then
		messagebox("Advertencia","Debe Ingresar Cliente a Transferir")
	elseif ls_cod_sol='3' or ls_cod_sol='10' or ls_cod_sol='16' then	//ls_cod_sol='13' or
		messagebox("Advertencia","Ya NO es posible Autorizar Esta Solicitud")
	else
		if ll_estatus=1 then
			Net 				= MessageBox("Advertencia","Está seguro Autorizar la solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(ll_corr,"###,###,###,##0"), Exclamation!, YesNo!, 2)
			IF Net = 1 THEN
				CHOOSE CASE is_tipo_sol
					CASE '1'
						dw_reporte.setitem(il_row,'sol_rescilia_cliente_estatus_operacion',0)
						dw_reporte.setitem(il_row,'sol_rescilia_cliente_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_rescilia_cliente_fecha_opera',idt_fecha_hoy)
						if dw_print.retrieve(gs_base,gs_serie,gi_numero,ll_corr) > 0 then
							if gs_conexion = "Parque El Prado" then
								ls_conex											= "P"
								dw_print.setitem(1,'conexion',ls_conex)
								dw_print.object.t_4.text						= 'Inmobiliaria Parque La Florida SpA'
								if ls_est_reg = 'A' then
									dw_print.object.txt_rechazo.visible	= false
									dw_print.object.txt_aceptada.visible	= true
								else
									dw_print.object.txt_aceptada.visible	= false
									dw_print.object.txt_rechazo.visible	= true
								end if
							elseif gs_conexion = "Parque La Foresta" then
								dw_print.object.t_4.text						= 'Inmobiliaria Parque de La Serena SpA'
								ls_conex											= "F"
								dw_print.setitem(1,'conexion',ls_conex)
								if ls_est_reg = 'A' then
									dw_print.object.txt_rechazo.visible	= false
									dw_print.object.txt_aceptada.visible	= true
								else
									dw_print.object.txt_aceptada.visible	= false
									dw_print.object.txt_rechazo.visible	= true
								end if
							elseif gs_conexion = "Parque Concepción" then
								dw_print.object.t_4.text						= 'Parque de Concepción SpA'
								ls_conex											= "C"
								dw_print.setitem(1,'conexion',ls_conex)
								if ls_est_reg = 'A' then
									dw_print.object.txt_rechazo.visible	= false
									dw_print.object.txt_aceptada.visible	= true
								else
									dw_print.object.txt_aceptada.visible	= false
									dw_print.object.txt_rechazo.visible	= true
								end if
							end if
							f_Print( dw_print )
						end if
					CASE '2'
						dw_reporte.setitem(il_row,'sol_rescilia_reprog_estatus_operacion',0)
						dw_reporte.setitem(il_row,'sol_rescilia_reprog_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_rescilia_reprog_fecha_opera',idt_fecha_hoy)
					CASE '3'
						dw_reporte.setitem(il_row,'sol_reactiva_estatus_operacion',0)
						dw_reporte.setitem(il_row,'sol_reactiva_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_reactiva_fecha_opera',idt_fecha_hoy)
					CASE '4'
						dw_reporte.setitem(il_row,'sol_seguro_desg_estatus_operaciones',0)
						dw_reporte.setitem(il_row,'sol_seguro_desg_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_seguro_desg_fecha_opera',idt_fecha_hoy)
					CASE '5'
						dw_reporte.setitem(il_row,'sol_repacta_cvta_estatus_operacion',0)
						dw_reporte.setitem(il_row,'sol_repacta_cvta_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_repacta_cvta_fecha_opera',idt_fecha_hoy)
					CASE '6'
						dw_reporte.setitem(il_row,'sol_tit_dominio_estatus_operaciones',0)
						dw_reporte.setitem(il_row,'sol_tit_dominio_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_tit_dominio_fecha_opera',idt_fecha_hoy)
					CASE '7'
						dw_reporte.setitem(il_row,'sol_contrato_def_estatus_operaciones',0)
						dw_reporte.setitem(il_row,'sol_contrato_def_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_contrato_def_fecha_opera',idt_fecha_hoy)
					CASE '8'
						dw_reporte.setitem(il_row,'sol_entrega_pag_estatus_operaciones',0)
						dw_reporte.setitem(il_row,'sol_entrega_pag_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_entrega_pag_fecha_opera',idt_fecha_hoy)
					CASE '10'
						dw_reporte.setitem(il_row,'sol_transferencia_estatus_operaciones',0)
						dw_reporte.setitem(il_row,'sol_transferencia_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_transferencia_fecha_opera',idt_fecha_hoy)
					CASE '11'
						dw_reporte.setitem(il_row,'sol_resolucion_estatus_operacion',0)
						dw_reporte.setitem(il_row,'sol_resolucion_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_resolucion_fecha_opera',idt_fecha_hoy)
					CASE '13'
						dw_reporte.setitem(il_row,'sol_cambio_estado_estatus_operacion',0)
						dw_reporte.setitem(il_row,'sol_cambio_estado_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_cambio_estado_fecha_opera',idt_fecha_hoy)
					CASE '14'
						dw_reporte.setitem(il_row,'sol_cambio_estado_titular_estatus_operac',0)
						dw_reporte.setitem(il_row,'sol_cambio_estado_titular_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_cambio_estado_titular_fecha_opera',idt_fecha_hoy)
					CASE '15'
						dw_reporte.setitem(il_row,'sol_seguro_estatus_operaciones',0)
						dw_reporte.setitem(il_row,'sol_seguro_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_seguro_fecha_opera',idt_fecha_hoy)
					CASE '16'
						dw_reporte.setitem(il_row,'sol_novacion_estatus_operaciones',0)
						dw_reporte.setitem(il_row,'sol_novacion_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_novacion_fecha_opera',idt_fecha_hoy)
					CASE '17'
						dw_reporte.setitem(il_row,'sol_coprop_promesa_estatus_opera',0)
						dw_reporte.setitem(il_row,'sol_coprop_promesa_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_coprop_promesa_fecha_opera',idt_fecha_hoy)
					CASE '18'
						dw_reporte.setitem(il_row,'sol_ultima_voluntad_estatus_opera',0)
						dw_reporte.setitem(il_row,'sol_ultima_voluntad_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_ultima_voluntad_fecha_opera',idt_fecha_hoy)
					CASE '19'
						dw_reporte.setitem(il_row,'sol_pos_efec_estatus_operaciones',0)
						dw_reporte.setitem(il_row,'sol_pos_efec_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_pos_efec_fecha_opera',idt_fecha_hoy)
					CASE '20'
						dw_reporte.setitem(il_row,'sol_pac_estatus_operacion',0)
						dw_reporte.setitem(il_row,'sol_pac_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_pac_fecha_opera',idt_fecha_hoy)
					CASE '21'
						dw_reporte.setitem(il_row,'sol_pat_estatus_operacion',0)
						dw_reporte.setitem(il_row,'sol_pat_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_pat_fecha_opera',idt_fecha_hoy)
					CASE '22'
						dw_reporte.setitem(il_row,'sol_seguro_fallece_estatus_operaciones',0)
						dw_reporte.setitem(il_row,'sol_seguro_fallece_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_seguro_fallece_fecha_opera',idt_fecha_hoy)
					CASE '23'
						dw_reporte.setitem(il_row,'sol_en_demanda_estatus_operacion',0)
						dw_reporte.setitem(il_row,'sol_en_demanda_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_en_demanda_fecha_opera',idt_fecha_hoy)
					CASE '24'
						dw_reporte.setitem(il_row,'sol_bono_fraterno_estatus_operaciones',0)
						dw_reporte.setitem(il_row,'sol_bono_fraterno_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_bono_fraterno_fecha_opera',idt_fecha_hoy)
					CASE '25'
						dw_reporte.setitem(il_row,'sol_mant_perpetua_estatus_operaciones',0)
						dw_reporte.setitem(il_row,'sol_mant_perpetua_usuario_opera',gs_user)
						dw_reporte.setitem(il_row,'sol_mant_perpetua_fecha_opera',idt_fecha_hoy)
					CASE "26"
						dw_reporte.setitem(il_row,'sol_tit_dominio_parque_estatus_operaciones',0)
						dw_reporte.setitem(il_row,'sol_tit_dominio_parque_estatus_informatica',gs_user)
						dw_reporte.setitem(il_row,'sol_tit_dominio_parque_fecha_opera',idt_fecha_hoy)
					CASE '27'
						dw_reporte.setitem(il_row,'sol_compromiso_pago_estatus_operacion',0)
						dw_reporte.setitem(il_row,'sol_compromiso_pago_estatus_informatica',gs_user)
						dw_reporte.setitem(il_row,'sol_compromiso_pago_fecha_opera',idt_fecha_hoy)
				END CHOOSE
				dw_reporte.accepttext()
				if dw_reporte.update()=1 then
					commit;
					ls_obs					= trim(dw_reporte.getitemstring(il_row,'sol_estatus_observacion'))
					ls_obs					= ls_obs+', Autoriza Atención Cliente por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
					dw_reporte.setitem(il_row,'sol_estatus_observacion',ls_obs)
					UPDATE	"SOL_ESTATUS"  
					SET 		"OBSERVACION" = :ls_obs  
					WHERE 	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
								( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
								( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
								( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol )   
					Using		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						if ls_cod_sol='4' or ls_cod_sol='22' then
							long		ll_estado=11
							datetime	ld_fecha_hoy
							ld_fecha_hoy		= datetime(idt_fecha_hoy,now())
							if ls_cod_sol='4' then
								ls_comentario	= 'SEGURO DESGRAVAMEN EN TRAMITE' //'Solicitud de Seguro Aprobado'
							elseif ls_cod_sol='22' then
								ls_comentario	= 'SEGURO PLAN ASISTENCIAL FAMILIAR EN TRAMITE'
							end if
							INSERT INTO "ATENCION_LOG"  
										( "RUT",   "ESTADO",   	"FECHA",   		"GLOSA",   			"USUARIO",  "BASE",   	"SERIE",   	"NUMERO" )  
							VALUES	( :ll_rut, :ll_estado,	:ld_fecha_hoy,	:ls_comentario,	:gs_user,	:gs_base,	:gs_serie,	:gi_numero )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
//						elseif ls_cod_sol = '23' then
//							ls_estado_ctto_final	= dw_reporte.getitemstring(dw_reporte.getrow(),'sol_en_demanda_estado_ctto_final')
//							SELECT	"ENCARGADOS"."NOMBRE"  
//							INTO 		:ls_ejecutivo  
//							FROM 	"ENCARGADOS"  
//							WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
//
//							SELECT 	"CADENA"."RUT", 	"CLIENTE"."DV", 	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO", 	"COD_PARQ"."NOMBRE" 
//							INTO 		:ll_rut,   				:ls_dv,   				:ls_nombre,   				:ls_ap_pat,   					:ls_ap_mat,   					:ls_descrip_parque  
//							FROM 	"CADENA",   "CLIENTE", 	"COD_PARQ"  
//							WHERE 	( "CADENA"."COD_PARQUE" = "COD_PARQ"."CODIGO" ) and  
//										( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
//										( ( "CADENA"."CODIGO" = :gs_base ) AND  
//										( "CADENA"."SERIE" = :gs_serie ) AND  
//										( "CADENA"."NUMERO" = :gi_numero ) )   
//							USING	sqlca;
//							if isnull(ls_nombre) then ls_nombre=''
//							if isnull(ls_ap_pat) then ls_ap_pat=''
//							if isnull(ls_ap_mat) then ls_ap_mat=''
//							if isnull(ls_dv) then ls_dv=''
//							ls_nom_completo		= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
//							ls_rut						= string(ll_rut,'###,###,###,###')+'-'+ls_dv
//							SELECT 	"ESTADO"."NOMBRE_ESTADO",	sysdate
//							INTO 		:ls_descrip_estado_ctto ,				:gdt_fec_sistema
//							FROM 	"ESTADO"  
//							WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado_ctto_final   ;
//							
////							ls_descrip_estado_ctto			= mid(ls_descrip_estado_ctto,3)
//							ls_asunto				= 'AVISO CAMBIO ESTADO CONTRATO A '+ls_descrip_estado_ctto+ ', Contrato ' +gs_base+'-' +gs_serie+String(gi_numero,'###,###,###,###')+'.'+'~r'
//							ls_texto 					= 'Con Fecha ' +STRING(gdt_fec_sistema,"dd/mm/yyyy")+' HORA: '+string(gdt_fec_sistema,'hh:mm')+' Se Solicita Cambio de Estado a '+ls_descrip_estado_ctto +', Contrato ' +gs_base+'-' +gs_serie+String(gi_numero,'###,###,###,###')+'~r'
//							ls_texto					= ls_texto+'Cliente Rut '+ls_rut+' Nombre '+ls_nom_completo+'~r'
//							ls_texto					= ls_texto+'Parque '+ls_descrip_parque+'~r'
//							ls_texto					= ls_texto+'Solicitado por '+gs_user+'-'+ls_ejecutivo+'.'
//							SELECT DISTINCT "ENCARGADOS"."EMAIL"  
//							INTO 		:email_de  
//							FROM 	"ENCARGADOS"  
//							WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
//							USING	sqlca;
//							if isnull(email_de) or email_de='-' or email_de='' then
//								email_de				= 'consulta@nuestrosparques.cl'
//							end if
//							
//							SELECT 	"TASA"."CORREO_DESTINO_DEMANDA"  INTO :ls_email_para 	FROM "TASA"  	WHERE "TASA"."LOOK" = 1   ;
//
//							select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
//							INTO 		:ls_res
//							from 		DUAL;
//							if ls_res='OK' then
//								messagebox("Envio Email","Envio Email Exitoso")
//							else
//								messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
//							end if
						end if
//						if ls_cod_sol='6' then
//							// insertar registro tabla ATENCION_LOG
//							if isvalid(w_ingreso_atencion_log) then close(w_ingreso_atencion_log)
//							ls_string	= string(ll_rut)
//							openwithparm(w_ingreso_atencion_log,ls_string)
//						end if
					else
						rollback;
					end if
					messagebox("Actualizar","Actualización Exitosa")
				else
					rollback;
				end if
			END IF
		else
			if ll_est_inf=0 then
				messagebox("Advertencia","Solicitud "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(ll_corr,"###,###,###,##0")+ ' está Aceptada')
			else
				messagebox("Advertencia","Solicitud "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(ll_corr,"###,###,###,##0")+ ', ya está autorizada por Atención Cliente')
			end if
		end if
	end if
end if
end event

type cb_aceptar_informatica from commandbutton within w_detalle_solicitudes
boolean visible = false
integer x = 1481
integer y = 1824
integer width = 297
integer height = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actuali&zar"
end type

event clicked;Datetime	ldt_fecha,ldt_fec_nac,fecha_prim,fecha_man,fecha_vto,ldt_fecha_hoy,ldt_fecha_promesa,ldt_fecha_mant,ldt_fec_nac_co
String		ls_est_reg,ls_cod_sol,ls_est_mod,ls_obs,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado,ls_string,ls_est_cob,&
			ls_nombre,ls_ap_pat,ls_ap_mat,ls_base,ls_serie,ls_anexo_lib,ls_anexo_repacta,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_estado_cadena,ls_descrip_ciudad,&
			ls_descrip_comuna,ls_descrip_tipo_via,ls_dir_1,ls_dir_2,ls_trato,	ls_dv,ls_nombre_cliente,	ls_nro_sepultura,ls_area,ls_tipo_construccion,ls_direccion_p,&
			ls_nro_particular,ls_depto_particular,ls_block_particular,ls_poblacion,ls_estado_obs,ls_estado_civil,ls_estado_contrato,	ls_fecha_promesa_palabas,&
			ls_sexo,ls_nom,ls_total_pagado_palabras,ls_tipo_via_titulo,ls_base_new,ls_serie_new,ls_pasa,ls_descrip_estado,ls_dv_co,ls_nom_co,ls_ap_pat_co,ls_ap_mat_co,&
			ls_estado_ctto,ls_cobrador,ls_estado_at_pub,ls_glosa,ls_estado_fact
Long		ll_est_ope,ll_estatus,ll_rut,ll_renta,ll_grupo_f,ll_corr,ll_max,ll_mora_credito,ll_mora_mant,cta_pag_s,cta_pag_m,nro_cuotas,RET,dias,ret1,ret11,cta_pag_la,&
			cta_pag_isa,Net, ll_resp,ll_cta_pag_m,ll_ctas,ll_ctas_en_mora,ll_ctas_repacta,ll_ctas_pag_m,ll_count_reg,ll_correlativo,ll_capacidad,ll_anno_liberar,&
			ll_total_pagado,ll_rut_gerente_operaciones,ll_cod_parque,ll_rut_cambio,ll_rut_co,ll_max_co
Double	ll_numero,ll_numero_new
Date		ls_fec_sistema
if il_row>0 then
	SELECT	sysdate	INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
	ls_fec_sistema		= date(gdt_fec_sistema)
	
	SELECT	count("SOL_PERMISOS_USUARIO"."ESTADO")  
	INTO 		:ll_count_reg  
	FROM 	"SOL_PERMISOS_USUARIO"  
	WHERE  ( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = :is_tipo_sol ) AND  
			 ( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND
			 ( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' )
	USING		sqlca;
	if ll_count_reg>0 or gs_depto='I' then
		ldt_fecha					= datetime(idt_fecha_hoy,now())
		ldt_fecha_hoy			= datetime(idt_fecha_hoy,time('00:00:00'))
		ls_est_reg				= dw_reporte.getitemstring(il_row,'sol_estatus_estado_reg')
		gs_base					= dw_reporte.getitemstring(il_row,'sol_estatus_base')
		gs_serie					= dw_reporte.getitemstring(il_row,'sol_estatus_serie')
		gi_numero				= dw_reporte.getitemnumber(il_row,'sol_estatus_numero')
		ll_corr					= dw_reporte.getitemnumber(il_row,'sol_estatus_correlativo')
		il_corr					= dw_reporte.getitemnumber(il_row,'sol_estatus_correlativo')
		ls_cod_sol				= dw_reporte.getitemstring(il_row,'sol_estatus_codigo_solicitud')
		ll_rut_cambio			= dw_reporte.getitemnumber(il_row,'cliente_rut')
		ls_pasa					= 'S'
		if is_tipo_sol="2" then
			ls_base_new		= dw_reporte.getitemstring(il_row,'sol_rescilia_reprog_base_nuevo')
			ls_serie_new		= dw_reporte.getitemstring(il_row,'sol_rescilia_reprog_serie_nuevo')
			ll_numero_new		= dw_reporte.getitemnumber(il_row,'sol_rescilia_reprog_numero_nuevo')
			SELECT	"CADENA"."CODIGO"  
			INTO 		:ls_descrip_estado  
			FROM 	"CADENA"  
			WHERE  ( "CADENA"."CODIGO" = :ls_base_new ) AND  
					 ( "CADENA"."SERIE" = :ls_serie_new ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero_new ) 
			USING	sqlca;
			if sqlca.sqlcode <> 0 then
				messagebox("Advertencia","Recuerde Para Resciliar Contrato Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###") +", el Contrato Nº "+ls_base_new+'-'+ls_serie_new+'-'+string(ll_numero_new,"###,###,###,###,###")+' debe estar DIGITADO')
				ls_pasa			= 'N'
			end if
		end if
		if ls_pasa='S' then
			CHOOSE CASE is_tipo_sol
				CASE "1"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_rescilia_cliente_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_rescilia_cliente_estatus_operacion')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_rescilia_cliente_estatus_informatica')	
				CASE "2"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_rescilia_reprog_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_rescilia_reprog_estatus_operacion')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_rescilia_reprog_estatus_informatica')
				CASE "3"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_reactiva_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_reactiva_estatus_operacion')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_reactiva_estatus_informatica')
				CASE "4"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_seguro_desg_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_seguro_desg_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_seguro_desg_estatus_informatica')
				CASE "5"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_repacta_cvta_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_estatus_operacion')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_repacta_cvta_estatus_informatica')
				CASE "6"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_tit_dominio_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_tit_dominio_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_tit_dominio_estatus_informatica')
				CASE "7"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_contrato_def_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_contrato_def_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_contrato_def_estatus_informatica')
				CASE "8"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_entrega_pag_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_entrega_pag_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_entrega_pag_estatus_informatica')
				CASE "10"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_transferencia_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_transferencia_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_transferencia_estatus_informatica')
					il_rut		= dw_reporte.getitemnumber(il_row,'sol_transferencia_rut_titular')
				CASE "11"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_resolucion_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_resolucion_estatus_operacion')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_resolucion_estatus_informatica')
				CASE "12"
					ls_est_mod	= 'N'
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_mod_antece_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_mod_antece_estatus_informatica')
				CASE "13"
					ls_est_mod	= 'N'
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_cambio_estado_estatus_operacion')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_cambio_estado_estatus_informatica')
				CASE "14"
					ls_est_mod	= 'N'
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_cambio_estado_titular_estatus_operac')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_cambio_estado_titular_estatus_inform')
				CASE "15"
					ls_est_mod	= 'N'
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_seguro_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_seguro_estatus_informatica')
				CASE "16"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_novacion_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_novacion_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_novacion_estatus_informatica')
					il_rut		= dw_reporte.getitemnumber(il_row,'sol_novacion_rut_titular')
				CASE "17"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_coprop_promesa_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_coprop_promesa_estatus_opera')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_coprop_promesa_estatus_infor')
				CASE "18"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_ultima_voluntad_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_ultima_voluntad_estatus_opera')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_ultima_voluntad_estatus_infor')
				CASE "19"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_pos_efec_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_pos_efec_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_pos_efec_estatus_informatica')
					il_rut		= dw_reporte.getitemnumber(il_row,'sol_pos_efec_rut_titular')
				CASE "20"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_pac_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_pac_estatus_operacion')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_pac_estatus_informatica')
					il_rut		= dw_reporte.getitemnumber(il_row,'sol_pac_rut_titular')
				CASE "21"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_pat_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_pat_estatus_operacion')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_pat_estatus_informatica')
					il_rut		= dw_reporte.getitemnumber(il_row,'sol_pat_rut_titular')
				CASE "22"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_seguro_fallece_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_seguro_fallece_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_seguro_fallece_estatus_informatica')
				CASE "23"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_en_demanda_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_en_demanda_estatus_operacion')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_en_demanda_estatus_informatica')
				CASE "24"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_bono_fraterno_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_bono_fraterno_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_bono_fraterno_estatus_informatica')	
				CASE "25"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_mant_perpetua_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_mant_perpetua_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_mant_perpetua_estatus_informatica')
				CASE "26"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_tit_dominio_parque_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_tit_dominio_parque_estatus_operaciones')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_tit_dominio_parque_estatus_informatica')	
				CASE "27"
					ls_est_mod	= dw_reporte.getitemstring(il_row,'sol_compromiso_pago_mod_ant_cliente')
					ll_est_ope	= dw_reporte.getitemnumber(il_row,'sol_compromiso_pago_estatus_operacion')
					ll_estatus	= dw_reporte.getitemnumber(il_row,'sol_compromiso_pago_estatus_informatica')	
			END CHOOSE
			if ls_est_reg='I' then
				messagebox("Advertencia","Solicitud Inactiva")
			elseif ls_cod_sol='3'or ls_cod_sol='10' or ls_cod_sol='16' then		//or ls_cod_sol='13' 
				messagebox("Advertencia","Ya NO es posible Autorizar Esta Solicitud")	
			else
				if ll_estatus=1 then
					if ll_est_ope=1 then
						messagebox("Advertencia","Atención Cliente NO ha Autorizado la Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(ll_corr,"###,###,###,##0"))
					else
						Net = MessageBox("Advertencia","Está seguro Autorizar la Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(ll_corr,"###,###,###,##0"), Exclamation!, YesNo!, 2)
						IF Net = 1 THEN
							CHOOSE CASE is_tipo_sol
								CASE "1"
									dw_reporte.setitem(il_row,'sol_rescilia_cliente_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_rescilia_cliente_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_rescilia_cliente_fecha_infor',idt_fecha_hoy)
								CASE "2"
									dw_reporte.setitem(il_row,'sol_rescilia_reprog_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_rescilia_reprog_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_rescilia_reprog_fecha_infor',idt_fecha_hoy)
								CASE "3"
									dw_reporte.setitem(il_row,'sol_reactiva_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_reactiva_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_reactiva_fecha_infor',idt_fecha_hoy)
								CASE "4"
									dw_reporte.setitem(il_row,'sol_seguro_desg_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_seguro_desg_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_seguro_desg_fecha_infor',idt_fecha_hoy)
								CASE "5"
									dw_reporte.setitem(il_row,'sol_repacta_cvta_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_repacta_cvta_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_repacta_cvta_fecha_infor',idt_fecha_hoy)
								CASE "6"
									dw_reporte.setitem(il_row,'sol_tit_dominio_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_tit_dominio_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_tit_dominio_fecha_infor',idt_fecha_hoy)
								CASE "7"
									dw_reporte.setitem(il_row,'sol_contrato_def_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_contrato_def_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_contrato_def_fecha_infor',idt_fecha_hoy)
								CASE "8"
									dw_reporte.setitem(il_row,'sol_entrega_pag_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_entrega_pag_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_entrega_pag_fecha_infor',idt_fecha_hoy)
								CASE "10"
									dw_reporte.setitem(il_row,'sol_transferencia_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_transferencia_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_transferencia_fecha_infor',idt_fecha_hoy)
								CASE "11"
									dw_reporte.setitem(il_row,'sol_resolucion_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_resolucion_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_resolucion_fecha_infor',idt_fecha_hoy)
								CASE "12"
									dw_reporte.setitem(il_row,'sol_mod_antece_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_mod_antece_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_mod_antece_fecha_infor',idt_fecha_hoy)
								CASE "13"
									dw_reporte.setitem(il_row,'sol_cambio_estado_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_cambio_estado_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_cambio_estado_fecha_infor',idt_fecha_hoy)
								CASE "14"
									dw_reporte.setitem(il_row,'sol_cambio_estado_titular_estatus_inform',0)
									dw_reporte.setitem(il_row,'sol_cambio_estado_titular_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_cambio_estado_titular_fecha_infor',idt_fecha_hoy)
								CASE "15"
									dw_reporte.setitem(il_row,'sol_seguro_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_seguro_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_seguro_fecha_infor',idt_fecha_hoy)
								CASE "16"
									dw_reporte.setitem(il_row,'sol_novacion_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_novacion_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_novacion_fecha_infor',idt_fecha_hoy)
								CASE "17"
									dw_reporte.setitem(il_row,'sol_coprop_promesa_estatus_infor',0)
									dw_reporte.setitem(il_row,'sol_coprop_promesa_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_coprop_promesa_fecha_infor',idt_fecha_hoy)
								CASE "18"
									dw_reporte.setitem(il_row,'sol_ultima_voluntad_estatus_infor',0)
									dw_reporte.setitem(il_row,'sol_ultima_voluntad_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_ultima_voluntad_fecha_infor',idt_fecha_hoy)
								CASE "19"
									dw_reporte.setitem(il_row,'sol_pos_efec_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_pos_efec_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_pos_efec_fecha_infor',idt_fecha_hoy)
								CASE "20"
									dw_reporte.setitem(il_row,'sol_pac_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_pac_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_pac_fecha_infor',idt_fecha_hoy)
								CASE "21"
									dw_reporte.setitem(il_row,'sol_pat_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_pat_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_pat_fecha_infor',idt_fecha_hoy)
								CASE "22"
									dw_reporte.setitem(il_row,'sol_seguro_fallece_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_seguro_fallece_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_seguro_fallece_fecha_infor',idt_fecha_hoy)
								CASE "23"
									dw_reporte.setitem(il_row,'sol_en_demanda_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_en_demanda_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_en_demanda_fecha_infor',idt_fecha_hoy)
								CASE "24"
									dw_reporte.setitem(il_row,'sol_bono_fraterno_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_bono_fraterno_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_bono_fraterno_fecha_infor',idt_fecha_hoy)
								CASE "25"
									dw_reporte.setitem(il_row,'sol_mant_perpetua_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_mant_perpetua_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_mant_perpetua_fecha_infor',idt_fecha_hoy)	
								CASE "26"
									dw_reporte.setitem(il_row,'sol_tit_dominio_parque_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_tit_dominio_parque_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_tit_dominio_parque_fecha_infor',idt_fecha_hoy)	
								CASE "27"
									dw_reporte.setitem(il_row,'sol_compromiso_pago_estatus_informatica',0)
									dw_reporte.setitem(il_row,'sol_compromiso_pago_usuario_infor',gs_user)
									dw_reporte.setitem(il_row,'sol_compromiso_pago_fecha_infor',idt_fecha_hoy)
							END CHOOSE
							dw_reporte.accepttext()
							if dw_reporte.update()=1 then
								commit;
								ls_obs		= trim(dw_reporte.getitemstring(il_row,'sol_estatus_observacion'))
								ls_obs		= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
								dw_reporte.setitem(il_row,'sol_estatus_observacion',ls_obs)
								UPDATE	"SOL_ESTATUS"  
								SET 		"OBSERVACION" = :ls_obs  
								WHERE 	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
											( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
											( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
											( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
											( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol )   
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								//	"FECHA_RES" = Null  
								if ls_cod_sol="1" or ls_cod_sol="2" then
									if gs_base='L' then
										SELECT	"ANEXO_LIBERADOR"."BASE",   
													"ANEXO_LIBERADOR"."SERIE",   
													"ANEXO_LIBERADOR"."NRO_OFERTA" ,
													"PAGO_LIBERADOR"."ANNO_LIBERAR"
										INTO 		:ls_base,   
													:ls_serie,   
													:ll_numero  ,
													:ll_anno_liberar
										FROM 	"ANEXO_LIBERADOR",   
													"PAGO_LIBERADOR"  
										WHERE ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
												 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
												 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
												 (("ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
												 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) )   
										using		sqlca;
										if sqlca.sqlcode=0 then
											CHOOSE CASE ls_base
												CASE 'O', 'U'
													SELECT	"OFERTA_V"."ANEXO_LIB",   
																"OFERTA_V"."CTA_PAG_M"  
													INTO 		:ls_anexo_lib,   
																:ll_cta_pag_m  
													FROM 	"OFERTA_V",   
																"PAGO_OFERTA"  
													WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
															 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
															 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
															 (("OFERTA_V"."SERIE" = :ls_serie ) AND  
															 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )
													USING		sqlca;
													if sqlca.sqlcode=0 then
														if ll_cta_pag_m >= ll_anno_liberar then
															ll_ctas	= ll_cta_pag_m - ll_anno_liberar  
															UPDATE	"OFERTA_V"  
															SET 		"ANEXO_LIB" = '',   
																		"CTA_PAG_M" = :ll_ctas
															WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
																	   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
															USING	sqlca;
															if sqlca.sqlcode=0 then
																commit;
															else
																rollback;
															end if
														end if
													end if
												CASE 'L'
												CASE 'C'
													SELECT	"CONTRATO"."CTA_PAG_M",   
																"CONTRATO"."ANEXO_LIB"  
													INTO 		:ll_cta_pag_m,   
																:ls_anexo_lib  
													FROM 	"CONTRATO"  
													WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
															   ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														if ll_cta_pag_m >= ll_anno_liberar then
															ll_ctas	= ll_cta_pag_m - ll_anno_liberar  
															UPDATE	"CONTRATO"  
															SET 		"ANEXO_LIB" = '',   
																		"CTA_PAG_M" = :ll_ctas  
															WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
																	   ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
															USING		sqlca;
															if sqlca.sqlcode=0 then
																commit;
															else
																rollback;
															end if
														end if
													end if
												CASE 'P'
												CASE 'D'
												CASE 'R'
													
											END CHOOSE
										end if
										
									elseif gs_base='A' then
										SELECT	"ANEXO_AUMENTO"."BASE",   
													"ANEXO_AUMENTO"."SERIE",   
													"ANEXO_AUMENTO"."NRO_OFERTA"  
										INTO 		:ls_base,   
													:ls_serie,   
													:ll_numero  
										FROM 	"ANEXO_AUMENTO",   
													"PAGO_AUMENTO"  
										WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
												 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
												 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
												 (("ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
												 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) )   
										using		sqlca;
										if sqlca.sqlcode=0 then
											CHOOSE CASE ls_base
												CASE 'O'
													SELECT	"OFERTA_V"."ANEXO_AUMENTO",   
																"OFERTA_V"."CTA_AUMENTO"  
													INTO 		:ls_anexo_lib,   
																:ll_cta_pag_m  
													FROM 	"OFERTA_V",   
																"PAGO_OFERTA"  
													WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
															 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
															 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
															 (("OFERTA_V"."SERIE" = :ls_serie ) AND  
															 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )
													USING		sqlca;
													if ll_cta_pag_m>0 then
													//	ll_ctas	= 0
														UPDATE	"OFERTA_V"  
														SET 		"ANEXO_AUMENTO" = ''
														WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
																   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
														USING	sqlca;
														if sqlca.sqlcode=0 then
															commit;
														else
															rollback;
														end if
													end if
											END CHOOSE
										end if
										
									elseif gs_base='R' then
										SELECT	"REPACTA_MANTENCION"."BASE_ORIGINAL",	
													"REPACTA_MANTENCION"."SERIE_ORIGINAL",	
													"REPACTA_MANTENCION"."NUMERO_ORIGINAL",   
													"REPACTA_MANTENCION"."CUOTAS_EN_MORA"  
										INTO 		:ls_base,   									
													:ls_serie,   									
													:ll_numero,   										
													:ll_ctas_en_mora  
										FROM 	"REPACTA_MANTENCION"  
										WHERE  ( "REPACTA_MANTENCION"."BASE" = :gs_base ) AND  
												   ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
												   ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero ) 
										USING	sqlca;
										if sqlca.sqlcode=0 then
											CHOOSE CASE ls_base
												CASE 'O'
													SELECT	"OFERTA_V"."ANEXO_REPACTA",   
																"OFERTA_V"."CTA_REPACTA",
																"OFERTA_V"."CTA_PAG_M"
													INTO 		:ls_anexo_lib,  
																:ll_ctas_repacta,
																:ll_cta_pag_m  
													FROM 	"OFERTA_V",   
																"PAGO_OFERTA"  
													WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
															 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
															 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
															 (("OFERTA_V"."SERIE" = :ls_serie ) AND  
															 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )
													USING		sqlca;
													if sqlca.sqlcode=0 then
														ll_ctas	= ll_cta_pag_m - ll_ctas_en_mora
														UPDATE	"OFERTA_V"  
														SET 		"ANEXO_REPACTA" = '',   
																	"CTA_REPACTA" = 0,
																	"CTA_PAG_M" = :ll_ctas
														WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
																   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
														USING	sqlca;
														if sqlca.sqlcode=0 then
															commit;
														else
															rollback;
														end if
													end if
												CASE 'L'
												CASE 'C'
													SELECT	"CONTRATO"."CTA_PAG_M",   
																"CONTRATO"."ANEXO_REPACTA",
																"CONTRATO"."CTA_REPACTA"
													INTO 		:ll_cta_pag_m,   
																:ls_anexo_lib,
																:ll_ctas_repacta
													FROM 	"CONTRATO"  
													WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
															   ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														ll_ctas	= ll_cta_pag_m - ll_ctas_en_mora  
														UPDATE	"CONTRATO"  
														SET 		"ANEXO_REPACTA" = '',   
																	"CTA_PAG_M" = :ll_ctas  ,
																	"CTA_REPACTA" = 0
														WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
																   ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
														USING	sqlca;
														if sqlca.sqlcode=0 then
															commit;
														else
															rollback;
														end if
													end if
												CASE 'P'
												CASE 'D'
												CASE 'R'
													
											END CHOOSE
										end if
									end if
									////////////////////////nuevo
									if ls_cod_sol="1" then
										ls_estado_at_pub		= '68'
										ls_glosa					= 'SE RESCILIA POR PARTE DEL CLIENTE CONTRATO N° '+gs_base+gs_serie+string(gi_numero)+ 'EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy hh:mm')
									elseif ls_cod_sol="2" then
										ls_estado_at_pub		= '3'
										ls_glosa					= 'SE RESCILIA CONTRATO N° '+gs_base+gs_serie+string(gi_numero)+ 'EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy hh:mm')
									end if
									INSERT INTO "ATENCION_LOG"  
												( "RUT", 		"ESTADO",   			"FECHA",  			"GLOSA",   	"USUARIO",   	"BASE", 		"SERIE", 		"NUMERO" )  
									VALUES 	( :gi_rut,  	:ls_estado_at_pub,   	:gdt_fec_sistema, :ls_glosa,		:gs_user,   		:gs_base,   :gs_serie,   	:gi_numero )
									USING	sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									////////////////////////nuevo
									if isvalid(w_ingreso_fecha_res) then close(w_ingreso_fecha_res)
									openwithparm(w_ingreso_fecha_res,ls_cod_sol)
	
								elseif is_tipo_sol="3" then //reactivacion ctto resuelto	
									ls_estado	= 'V'
									UPDATE	"CADENA"  
									SET 		"ESTADO" = :ls_estado   
									WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
												( "CADENA"."SERIE" = :gs_serie ) AND  
												( "CADENA"."NUMERO" = :gi_numero )   
									Using		sqlca ;
									if sqlca.sqlcode=0 then
										commit;
										if gs_base='L' then
											SELECT	"ANEXO_LIBERADOR"."BASE",   
														"ANEXO_LIBERADOR"."SERIE",   
														"ANEXO_LIBERADOR"."NRO_OFERTA"  ,
														"PAGO_LIBERADOR"."ANNO_LIBERAR"
											INTO 		:ls_base,   
														:ls_serie,   
														:ll_numero  ,
														:ll_anno_liberar
											FROM 	"ANEXO_LIBERADOR",   
														"PAGO_LIBERADOR"  
											WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
													 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
													 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
													 (("ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
													 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) )   
											using		SQLCA;
											if sqlca.sqlcode=0 then
												CHOOSE CASE ls_base
													CASE 'O','U'
														SELECT	"OFERTA_V"."CTA_PAG_M"  
														INTO 		:ll_ctas_pag_m  
														FROM 	"OFERTA_V",   
																	"PAGO_OFERTA"  
														WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
																 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
																 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
																 (("OFERTA_V"."SERIE" = :ls_serie ) AND  
																 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )   
														USING		sqlca;
														if sqlca.sqlcode=0 then
															if ll_ctas_pag_m < ll_anno_liberar then
																ll_ctas			= ll_anno_liberar + ll_ctas_pag_m
																ls_anexo_lib	= gs_base+gs_serie+string(gi_numero)
																UPDATE	"OFERTA_V"  
																SET 		"CTA_PAG_M" = :ll_ctas,   
																			"ANEXO_LIB" = :ls_anexo_lib  
																WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
																		   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																end if
															end if
														end if
						
													CASE 'C'
														SELECT	"CONTRATO"."CTA_PAG_M"  
														INTO 		:ll_ctas_pag_m  
														FROM 	"CONTRATO"  
														WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
																   ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
														USING	sqlca;
														if sqlca.sqlcode=0 then
															if ll_ctas_pag_m < ll_anno_liberar then
																ll_ctas			= ll_anno_liberar + ll_ctas_pag_m
																ls_anexo_lib	= gs_base+gs_serie+string(gi_numero)
																UPDATE	"CONTRATO"  
																SET 		"CTA_PAG_M" = :ll_ctas,   
																			"ANEXO_LIB" = :ls_anexo_lib  
																WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
																		   ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																end if
															end if
														end if
												END CHOOSE
											end if
											
										elseif gs_base='A' then
											SELECT	"ANEXO_AUMENTO"."BASE",   
														"ANEXO_AUMENTO"."SERIE",   
														"ANEXO_AUMENTO"."NRO_OFERTA",  
														"PAGO_AUMENTO"."NRO_CUOTAS"
											INTO 		:ls_base,   
														:ls_serie,   
														:ll_numero,
														:ll_ctas
											FROM 	"ANEXO_AUMENTO",   
														"PAGO_AUMENTO"  
											WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
													 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
													 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
													 (("ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
													 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) )   
											using		SQLCA;
											if sqlca.sqlcode=0 then
												CHOOSE CASE ls_base
													CASE 'O'
														if ll_ctas > 0 then
															ls_anexo_lib	= gs_base+gs_serie+string(gi_numero)
															UPDATE	"OFERTA_V"  
															SET 		"CTA_AUMENTO" = :ll_ctas,   
																		"ANEXO_AUMENTO" = :ls_anexo_lib  
															WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
																	   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
															USING	sqlca;
															if sqlca.sqlcode=0 then
																commit;
															else
																rollback;
															end if
														end if
						
													CASE 'C'
														if ll_ctas > 0 then
															ls_anexo_lib	= gs_base+gs_serie+string(gi_numero)
															UPDATE	"CONTRATO"  
															SET 		"CTA_AUMENTO" = :ll_ctas,   
																		"ANEXO_AUMENTO" = :ls_anexo_lib  
															WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
																	   ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
															USING	sqlca;
															if sqlca.sqlcode=0 then
																commit;
															else
																rollback;
															end if
														end if
												END CHOOSE
											end if
										elseif gs_base='R' then
											UPDATE	"REPACTA_MANTENCION"  
											SET 		"ESTADO_PAGO" = :ls_estado 
											WHERE  ( "REPACTA_MANTENCION"."BASE" = :gs_base ) AND  
													   ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
													   ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   
											USING	sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											SELECT	"REPACTA_MANTENCION"."BASE_ORIGINAL",   
														"REPACTA_MANTENCION"."SERIE_ORIGINAL",   
														"REPACTA_MANTENCION"."NUMERO_ORIGINAL",
														"REPACTA_MANTENCION"."CUOTAS_EN_MORA"
											INTO 		:ls_base,   
														:ls_serie,   
														:ll_numero,
														:ll_ctas_en_mora
											FROM 	"REPACTA_MANTENCION"  
											WHERE  ( "REPACTA_MANTENCION"."BASE" = :gs_base ) AND  
													   ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
													   ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero ) 
											USING		sqlca;
											if sqlca.sqlcode=0 then
												CHOOSE CASE ls_base
													CASE 'O'
														SELECT	"OFERTA_V"."CTA_PAG_M"  
														INTO 		:ll_ctas_repacta  
														FROM 	"OFERTA_V",   
																	"PAGO_OFERTA"  
														WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
																 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
																 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
																 (("OFERTA_V"."SERIE" = :ls_serie ) AND  
																 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )  
														USING	sqlca;
														if sqlca.sqlcode=0 then
															ls_anexo_repacta	= gs_base+gs_serie+string(gi_numero)
															ll_ctas				= ll_ctas_repacta + ll_ctas_en_mora
															UPDATE	"OFERTA_V"  
															SET 		"ANEXO_REPACTA" = :ls_anexo_repacta,   
																		"CTA_PAG_M" = :ll_ctas,
																		"CTA_REPACTA" = :ll_ctas_en_mora  
															WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
																	   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
															USING	sqlca;
															if sqlca.sqlcode=0 then
																commit;
															else
																rollback;
															end if
														end if
						
													CASE 'C'
														SELECT	"CONTRATO"."CTA_PAG_M"  
														INTO 		:ll_ctas_repacta  
														FROM 	"CONTRATO"  
														WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
																   ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
														USING	sqlca;
														if sqlca.sqlcode=0 then
															ls_anexo_repacta	= gs_base+gs_serie+string(gi_numero)
															ll_ctas				= ll_ctas_repacta + ll_ctas_en_mora
															UPDATE	"CONTRATO"  
															SET 		"ANEXO_REPACTA" = :ls_anexo_repacta,   
																		"CTA_PAG_M" = :ll_ctas,
																		"CTA_REPACTA" = :ll_ctas_en_mora  
															WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
																	   ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
															USING	sqlca;
															if sqlca.sqlcode=0 then
																commit;
															else
																rollback;
															end if
														end if
												END CHOOSE
											end if
										end if
										wf_actualizar_cadena_estado(ls_estado)
										UPDATE	"CLIENTE"  
										SET 		"ESTADO_COBRANZA" = '0'  
										WHERE 	"CLIENTE"."RUT" = :ll_rut   
										USING	sqlca  ;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									else
										rollback;
									end if
								elseif is_tipo_sol="4" then //seguro desgravamen
									ls_estado	= 'S'
									UPDATE	"CADENA"  
									SET 		"ESTADO" = :ls_estado  
									WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
											   ( "CADENA"."SERIE" = :gs_serie ) AND  
											   ( "CADENA"."NUMERO" = :gi_numero )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
										wf_actualizar_cadena_estado(ls_estado)
									else
										rollback;
									end if
								elseif is_tipo_sol="5" then //repacta compraventa
									if gs_base='O' or gs_base='U' then
										wf_grabar_repacta_compraventa()
									elseif gs_base='A' then
										wf_grabar_repacta_aumento()
									elseif gs_base='L' then
										wf_grabar_repacta_liberador()
									elseif gs_base='P' then
										wf_grabar_repacta_pagare()
									elseif gs_base='F' then
										wf_grabar_repacta_funeraria()
									end if
									////////////////////////nuevo
									ls_estado_at_pub		= '4'
									ls_glosa					= 'SE REALIZA REPACTACION POR CAMBIO DE FECHA CONTRATO N° '+gs_base+gs_serie+string(gi_numero)+ 'EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy hh:mm')
									INSERT INTO "ATENCION_LOG"  
												( "RUT", 		"ESTADO",   			"FECHA",  			"GLOSA",   	"USUARIO",   	"BASE", 		"SERIE", 		"NUMERO" )  
									VALUES 	( :gi_rut,  	:ls_estado_at_pub,   	:gdt_fec_sistema, :ls_glosa,		:gs_user,   		:gs_base,   :gs_serie,   	:gi_numero )
									USING	sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									////////////////////////nuevo
								elseif is_tipo_sol="6" then //titulo de dominio
									if gs_base='C' or gs_base='O' then
										UPDATE	"CADENA"  
										SET 		"ESTADO_TITULO" = 'E',
													"FECHA_TITULO" = :ldt_fecha
										WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
													( "CADENA"."SERIE" = :gs_serie ) AND  
													( "CADENA"."NUMERO" = :gi_numero )   
										Using		sqlca ;
										if sqlca.sqlcode=0 then
											commit;
											if gs_base='C' then
												SELECT	"CLIENTE"."SEXO",   	"CLIENTE"."RUT",  "CLIENTE"."DV",   "CLIENTE"."NOMBRE",  "CLIENTE"."A_PATERNO",  "CLIENTE"."A_MATERNO",  "CONTRATO"."SEPULTURA", "CONTRATO"."SECTOR", "CONTRATO"."ZONA",   "CONTRATO"."CAPACIDAD", "CONTRATO"."FECHA",  "CLIENTE"."DIRECCION_P",   "CLIENTE"."NUMERO_PARTICULAR",   "CLIENTE"."DEPTO_PARTICULAR", "CLIENTE"."BLOCK_PARTICULAR", "COMUNA"."CODIGO_COMUNA",  "CIUDAD"."CODIGO_CIUDAD",  "CLIENTE"."POBLACION",  "CLIENTE"."ESTA_CIVIL", "CONTRATO"."TOT_PAGADO",   "CADENA"."ESTADO",   "CADENA"."COD_PARQUE",  "GERENTE_OPERACIONES"."RUT",	"CONTRATO"."FECHA_M",	"TIPO_VIA"."DESCRIPCION"  
												INTO 		:ls_sexo,				:ll_rut,				:ls_dv,				:ls_nom,					:ls_ap_pat,					:ls_ap_mat,					:ls_nro_sepultura,		:ls_sector,				:ls_area,				:ll_capacidad,				:ldt_fecha_promesa,	:ls_direccion_p,				:ls_nro_particular,					:ls_depto_particular,			:ls_block_particular,			:ls_comuna,						:ls_ciudad,						:ls_poblacion,				:ls_estado_civil,			:ll_total_pagado,				:ls_estado_cadena,	:ll_cod_parque,			:ll_rut_gerente_operaciones,	:ldt_fecha_mant,			:ls_tipo_via_titulo
												FROM 		"CADENA",   "CIUDAD",   "CLIENTE",   "COMUNA",   "CONTRATO",   "GERENTE_OPERACIONES",	"TIPO_VIA"  
												WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
														 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
														 ( "CONTRATO"."RUT" = "CLIENTE"."RUT" ) and  
														 ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and
														 ( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) and  
														 ( "CLIENTE"."CIUDAD" = "CIUDAD"."CODIGO_CIUDAD" ) and  
														 (("CADENA"."CODIGO" = :gs_base ) AND  
														 ( "CADENA"."SERIE" = :gs_serie ) AND  
														 ( "CADENA"."NUMERO" = :gi_numero ) AND  
														 ( "GERENTE_OPERACIONES"."ESTADO" = 'A' ) )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													if ls_sexo='M' then
														ls_trato						= 'Don'
													elseif ls_sexo='F' then
														ls_trato						= 'Doña'
													end if
													SELECT	MAX("PROCESO_TITULO_ISACRUZ"."CORRELATIVO")  
													INTO 		:ll_correlativo
													FROM 		"PROCESO_TITULO_ISACRUZ"  
													USING		sqlca;
													if ll_correlativo=0 OR isnull(ll_correlativo) then
														ll_correlativo 			= 1
													else
														ll_correlativo	++
													end if
													ls_nombre_cliente				= ls_nom+ ' ' +ls_ap_pat+ ' '+ls_ap_mat
													ls_tipo_construccion			= 'T'
													ls_total_pagado_palabras	= sle_1.uo_convertir_numero(string(ll_total_pagado))
													ls_fecha_promesa_palabas	= wf_fecha_palabra(date(ldt_fecha_promesa))
													INSERT INTO	  "PROCESO_TITULO_ISACRUZ"  
																	( "CORRELATIVO",		"NRO_LIBRO",	"FOJA",		"ROLA",	"TRATO",		"RUT",	"DV",		"NOMBRE_CLIENTE",		"NRO_SEPULTURA",		"SECTOR",	"AREA",		"CAPACIDAD",	"TIPO_CONSTRUCCION",		"BASE",		"SERIE",		"NUMERO",	"FECHA_PROMESA",		"DIRECCION_P",		"NRO_PARTICULAR",		"DEPTO_PARTICULAR",		"BLOCK_PARTICULAR",		"COMUNA",	"CIUDAD",	"POBLACION",	"ESTADO_OBS",		"ESTADO_CIVIL",	"USUARIO",	"TOTAL_PAGADO",	"TOTAL_PAGADO_PALABRAS",	"ESTADO_CONTRATO",	"COD_PARQUE",		"FECHA_PROMESA_PALABRAS",	"RUT_GERENTE_OPERACIONES",		"FECHA_MANT",		"TIPO_VIA"	 ) 
													VALUES 		( :ll_correlativo,	0,					0,				0,			:ls_trato,	:ll_rut,	:ls_dv,	:ls_nombre_cliente,	:ls_nro_sepultura,	:ls_sector,	:ls_area,	:ll_capacidad,	:ls_tipo_construccion,	:gs_base,	:gs_serie,	:gi_numero,	:ldt_fecha_promesa,	:ls_direccion_p,	:ls_nro_particular,	:ls_depto_particular,	:ls_block_particular,	:ls_comuna,	:ls_ciudad,	:ls_poblacion,	:ls_estado_obs,	:ls_estado_civil,	:gs_user,	:ll_total_pagado,	:ls_total_pagado_palabras,	:ls_estado_contrato,	:ll_cod_parque,	:ls_fecha_promesa_palabas,	:ll_rut_gerente_operaciones,	:ldt_fecha_mant,	:ls_tipo_via_titulo)  
													USING			sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
												end if
											end if
											
											CHOOSE CASE gs_base
												CASE "O", "U" // Oferta
													if isvalid(w_cuenta_corriente_oferta) then
														w_cuenta_corriente_oferta.dw_estado_cta_cte.setitem(1,'cadena_estado_titulo','E')
														w_cuenta_corriente_oferta.dw_estado_cta_cte.setitem(1,'cadena_fecha_titulo',ldt_fecha)
													end if
			//									CASE "L" // Anexo Liberador
			//									CASE "P" // Pagaré
												CASE "C" // Contrato ISA	
													if isvalid(w_cuenta_corriente_contrato_isa) then
														w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.setitem(1,'estado_titulo','E')
														w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.setitem(1,'fecha_titulo',ldt_fecha)
													end if
			//									CASE "D" // Derecho Especial
												CASE "R" //Repactación Ctas.Mantencion
													if isvalid(w_cuenta_corriente_repactar_cta_mant) then
														w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.setitem(1,'estado_titulo','E')
														w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.setitem(1,'fecha_titulo',ldt_fecha)
													end if
											END CHOOSE
											UPDATE	"CLIENTE"  
											SET 		"ESTADO_COBRANZA" = '0'  
											WHERE 	"CLIENTE"."RUT" = :ll_rut   
											USING		sqlca  ;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										else
											rollback;
										end if
									end if
		
								elseif is_tipo_sol="7" then //contrato definitivo
									SELECT	max("CARTA_LOG"."CORRELATIVO")  
									INTO 		:ll_max  
									FROM 	"CARTA_LOG"  
									Using		sqlca;
									if sqlca.sqlcode=0 then
										if ll_max<=0 then
											ll_max	= 1
										else
											ll_max++
										end if
										CHOOSE CASE gs_base
											CASE 'O','U'
												SELECT	"OFERTA_V"."CTA_PAG_S",   "OFERTA_V"."CTA_PAG_M",   "PAGO_OFERTA"."FECHA_PRIM",	"PAGO_OFERTA"."NRO_CUOTAS",	"OFERTA_V"."FECHA_M",	"CADENA"."ESTADO"
												INTO 		:cta_pag_s,   				  :cta_pag_m,   				 :fecha_prim, 						:nro_cuotas,						:fecha_man,					:ls_estado_cadena
												FROM 	"OFERTA_V",   
															"PAGO_OFERTA",
															"CADENA"
												WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
														 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
														 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
														 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
														 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and
														 ( ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
														 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) )   
												Using		sqlca;
												if sqlca.sqlcode=0 then
													RET 			= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado_cadena)
											/// codigo nuevo
													fecha_vto	= datetime(funcion_venc( fecha_prim , cta_pag_s ))   //<--
													dias 			= - daysafter (idt_fecha_hoy,date(fecha_vto))
													if dias <= 5 then ret = 0    //<--
											/// fin codigo
													ret1 			= f_mant (fecha_man, cta_pag_m)
													ret11 			= -daysafter(idt_fecha_hoy,funcion_venc_ano( fecha_man , cta_pag_m  ))
													if ret11 < 0 then 
														ret1		= 0
													end if
													if ret <= 0 then
														ret			= 0 //mora_credito
													end if
													ll_mora_credito= ret
		
													if ret1 <= 0 then
														ret1		= 0 //mora mantencion
													end if	
													ll_mora_mant= ret1
												end if
												
											CASE 'C'
												SELECT	"CONTRATO"."CTA_PAG_M",   "CONTRATO"."FECHA_M"  
												INTO 		:cta_pag_m,   				 	 :fecha_prim  
												FROM 	"CADENA",   
															"CONTRATO"  
												WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
														 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
														 (("CADENA"."CODIGO" = :gs_base ) AND  
														 ( "CADENA"."SERIE" = :gs_serie ) AND  
														 ( "CADENA"."NUMERO" = :gi_numero ) )   
												Using		sqlca;
												if sqlca.sqlcode=0 then
													ret1 					= f_mant (fecha_prim, cta_pag_m)
													ret11 					= -daysafter(idt_fecha_hoy,funcion_venc_ano( fecha_prim , cta_pag_m  ))
													ll_mora_credito	= 0
													if ret11 < 0 then 
														ret1				= 0
													end if
													ll_mora_mant		= ret1
													if ret1 <= 0 then
														ll_mora_mant	= 0
													end if
												end if
												
											CASE 'L'
												SELECT	"PAGO_LIBERADOR"."NRO_CUOTAS",   "PAGO_LIBERADOR"."FECHA_PRIM",   "ANEXO_LIBERADOR"."CTA_PAG_M",	"CADENA"."ESTADO"
												INTO 		:nro_cuotas,   						:fecha_prim,   						:cta_pag_s  ,							:ls_estado_cadena
												FROM 	"ANEXO_LIBERADOR",   
															"PAGO_LIBERADOR",
															"CADENA"
												WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
														 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
														 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
														 ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
														 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
														 (("ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
														 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) )   
												Using		sqlca;
												if sqlca.sqlcode=0 then
													ll_mora_credito	= 0
													RET 					= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado_cadena)
											/// codigo nuevo
													fecha_vto			= datetime(funcion_venc( fecha_prim , cta_pag_s ))   //<--
													dias 					= - daysafter (idt_fecha_hoy,date(fecha_vto))
													if dias <= 5 then 
														ret 				= 0
													end if
											/// fin codigo
													if ret <= 0 then
														ret 				= 0
													end if	
													ll_mora_mant		= ret
												end if
												
											CASE 'F','G'
												SELECT	"PRODUCTO_PAGO"."PLAZO",   "PRODUCTO_PAGO"."FECHA_PRIM",   "PRODUCTO_ANEXO"."CUOTAS_PAG",	"CADENA"."ESTADO"
												INTO 		:nro_cuotas,   						:fecha_prim,   								:cta_pag_s  ,									:ls_estado_cadena
												FROM 	"PRODUCTO_ANEXO",   
															"PRODUCTO_PAGO",
															"CADENA"
												WHERE  ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
														 ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
														 ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
														 ( "CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" ) and  
														 ( "CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" ) and  
														 (("PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
														 ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) )   
												Using		sqlca;
												if sqlca.sqlcode=0 then
													ll_mora_credito	= 0
													RET 					= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado_cadena)
											/// codigo nuevo
													fecha_vto			= datetime(funcion_venc( fecha_prim , cta_pag_s ))   //<--
													dias 					= - daysafter (idt_fecha_hoy,date(fecha_vto))
													if dias <= 5 then 
														ret 				= 0
													end if
											/// fin codigo
													if ret <= 0 then
														ret 				= 0
													end if	
													ll_mora_mant		= ret
												end if
												
											CASE 'P'
												SELECT	"PAGARE"."FECHA_PRIM",   "PAGARE"."PLAZO",   "PAGARE"."CTA_PAG_LA",   "PAGARE"."CTA_PAG_ISA",	"CADENA"."ESTADO"  
												INTO 		:fecha_prim,   			 :nro_cuotas,   		:cta_pag_la,   			 :cta_pag_isa  ,				:ls_estado_cadena
												FROM 	"CADENA",   
															"PAGARE"  
												WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
														 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
														 (("CADENA"."CODIGO" = :gs_base ) AND  
														 ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
														 ( "PAGARE"."NRO_PAGARE" = :gi_numero ) )   
												Using		sqlca;
												if sqlca.sqlcode=0 then
													ll_mora_credito	= 0
													cta_pag_s  			= cta_pag_la + cta_pag_isa
													RET 					= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado_cadena)
											/// codigo nuevo
													fecha_vto			= datetime(funcion_venc( fecha_prim , cta_pag_s ))   //<--
													dias 					= - daysafter (idt_fecha_hoy,date(fecha_vto))
													if dias <= 5 then 
														ret 				= 0
													end if
											/// fin codigo
													if ret <= 0 then
														ret					= 0
													end if	
													ll_mora_mant		= ret
												end if
												
											CASE 'D'
												SELECT	"DERECHO"."FECHA_PRIM",   "DERECHO"."PLAZO",   "DERECHO"."CTA_PAG_LA",   "DERECHO"."CTA_PAG_ISA" ,	"CADENA"."ESTADO"
												INTO 		:fecha_prim,   			  :nro_cuotas,   		  :cta_pag_la,   				 :cta_pag_isa  ,				:ls_estado_cadena
												FROM 	"CADENA",   
															"DERECHO"  
												WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
														 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
														 (("CADENA"."CODIGO" = :gs_base ) AND  
														 ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
														 ( "DERECHO"."NRO_PAGARE" = :gi_numero ) )   
												Using		sqlca;
												if sqlca.sqlcode=0 then
													ll_mora_credito	= 0
													cta_pag_s  			= cta_pag_la + cta_pag_isa
													RET 					= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado_cadena)
											/// codigo nuevo
													fecha_vto			= datetime(funcion_venc( fecha_prim , cta_pag_s ))   //<--
													dias 					= - daysafter (idt_fecha_hoy,date(fecha_vto))
													if dias <= 5 then 
														ret 				= 0
													end if
											/// fin codigo
													if ret <= 0 then
														ret					= 0
													end if	
													ll_mora_mant		= ret
												end if	
												
											CASE 'R'
												SELECT	"REPACTA_MANTENCION"."CUOTAS_PACTADAS",   "REPACTA_MANTENCION"."FECHA_PRIMERA_CTA",   "REPACTA_MANTENCION"."CTAS_PAGADAS",	"CADENA"."ESTADO"  
												INTO 		:nro_cuotas,   									:fecha_prim,   										:cta_pag_s  ,								:ls_estado_cadena
												FROM 	"CADENA",   
															"REPACTA_MANTENCION"  
												WHERE  ( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
														 ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
														 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
														 (("REPACTA_MANTENCION"."BASE" = :gs_base ) AND  
														 ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
														 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero ) )   
												Using	sqlca;
												if sqlca.sqlcode=0 then
													ll_mora_credito	= 0
													RET 					= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado_cadena)
											/// codigo nuevo
													fecha_vto			= datetime(funcion_venc( fecha_prim , cta_pag_s ))   //<--
													dias 					= - daysafter (idt_fecha_hoy,date(fecha_vto))
													if dias <= 5 then 
														ret 				= 0
													end if
											/// fin codigo
													if ret <= 0 then
														ret 				= 0
													end if	
													ll_mora_mant		= ret
												end if										
										END CHOOSE
										// insertar registro en tabla CARTA_LOG
										INSERT INTO "CARTA_LOG"  
													( "BASE",   "SERIE",   "NUMERO",   "RUT",   "COD_ENVIO",   "ESTADO_ENV",   "FECHA_CARTA",   "MORA",   			"COD_ACCION",   "CORRELATIVO",   "MORA_MANT",   "CLASIFICACION" )  
										VALUES   ( :gs_base, :gs_serie, :gi_numero, :ll_rut, :gs_base,   	  '0',   			:ldt_fecha,   		:ll_mora_credito, '8',   			 :ll_corr,   		:ll_mora_mant, '0' )  
										Using		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if
		
								elseif is_tipo_sol="8" then //entrega pagare
									// no hacer nada
		
								elseif is_tipo_sol="10" or is_tipo_sol="16" or is_tipo_sol="19" then //transferencia o Novacion o posesion efectiva
									wf_grabar_transferencia()
		
								elseif is_tipo_sol="11" then //solicitud resolucion 
									// pendiente
									
								elseif is_tipo_sol="12" then //solicitud Mod. Antecedentes cliente
									ls_est_mod	= 'N'
									ls_est_cob	= '0'
									SELECT	"SOL_MOD_ANTECE"."DIRECCION_P_NUEVA",   "SOL_MOD_ANTECE"."POBLACION_NUEVA",   "SOL_MOD_ANTECE"."SECTOR_NUEVA",   "SOL_MOD_ANTECE"."COMUNA_NUEVA",   "SOL_MOD_ANTECE"."CIUDAD_NUEVA",   "SOL_MOD_ANTECE"."FONO_P_NUEVA",   "SOL_MOD_ANTECE"."FECHA_NAC_NUEVA",   "SOL_MOD_ANTECE"."ESTADO_CIVIL_NUEVA",   "SOL_MOD_ANTECE"."DOMICILIO_C_NUEVA",   "SOL_MOD_ANTECE"."FONO_C_NUEVA",   "SOL_MOD_ANTECE"."TOTAL_RENTA_NUEVA",   "SOL_MOD_ANTECE"."GRUPO_F_NUEVA",   "SOL_MOD_ANTECE"."ESTADO_COB_NUEVA",   "SOL_MOD_ANTECE"."NOMBRE_NUEVA",   "SOL_MOD_ANTECE"."AP_PATERNO_NUEVA",   "SOL_MOD_ANTECE"."AP_MATERNO_NUEVA",   "SOL_MOD_ANTECE"."TIPO_VIA_NUEVA",   "SOL_MOD_ANTECE"."NUMERO_PARTICULAR_NUEVA",   "SOL_MOD_ANTECE"."DEPTO_NUEVA",   "SOL_MOD_ANTECE"."BLOCK_NUEVA"
									INTO 		:ls_dir_p,   									:ls_pob,   										:ls_sector,   								:ls_comuna,   							 :ls_ciudad,   							:ls_fono_p,   								:ldt_fec_nac,   							 :ls_est_civil,   								:ls_dir_c,   									 :ls_fono_c,   							:ll_renta,   									 :ll_grupo_f,   							 :ls_est_cob,   								 :ls_nombre,   							:ls_ap_pat,   									:ls_ap_mat,										:ls_tipo_via,								 :ls_nro_part,											  :ls_depto_part,							:ls_block_part
									FROM 	"SOL_MOD_ANTECE"  
									WHERE 	"SOL_MOD_ANTECE"."RUT" = :il_numero  and 
												"SOL_MOD_ANTECE"."CORRELATIVO" = :il_corr
									USING	sqlca;
									if sqlca.sqlcode=0 then
										UPDATE	"CLIENTE"  
										SET 		"NOMBRE" = :ls_nombre,   
													"A_PATERNO" = :ls_ap_pat,   
													"A_MATERNO" = :ls_ap_mat,   
													"DIRECCION_P" = :ls_dir_p,   
													"TIPO_VIA" = :ls_tipo_via,
													"NUMERO_PARTICULAR" = :ls_nro_part,
													"DEPTO_PARTICULAR" = :ls_depto_part,
													"BLOCK_PARTICULAR" = :ls_block_part,
													"POBLACION" = :ls_pob,   
													"SECTOR" = :ls_sector,   
													"COMUNA" = :ls_comuna,   
													"CIUDAD" = :ls_ciudad,   
													"FONO_P" = :ls_fono_p,   
													"FECHA_NAC" = :ldt_fec_nac,   
													"ESTA_CIVIL" = :ls_est_civil,   
													"DOMICILIO_C" = :ls_dir_c,   
													"FONO_C" = :ls_fono_c,   
													"TOTAL_RENT" = :ll_renta,   
													"GRUPO_F" = :ll_grupo_f,   
													"TIPO" = 'I',
													"ESTADO_COBRANZA" = :ls_est_cob
										WHERE 	"CLIENTE"."RUT" = :il_numero   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
											SELECT 	"CIUDAD"."CIUDAD",   
														"COMUNA"."COMUNA"  
											INTO 		:ls_descrip_ciudad,   
														:ls_descrip_comuna  
											FROM 	"CIUDAD",   
														"COMUNA"  
											WHERE  ( "CIUDAD"."CODIGO_CIUDAD" = "COMUNA"."CODIGO_CIUDAD" ) and  
													 (("COMUNA"."CODIGO_CIUDAD" = :ls_ciudad ) AND  
													 ( "COMUNA"."CODIGO_COMUNA" = :ls_comuna ) )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												SELECT	"TIPO_VIA"."DESCRIPCION"  
												INTO 		:ls_descrip_tipo_via  
												FROM 	"TIPO_VIA"  
												WHERE 	"TIPO_VIA"."TIPO_VIA" = :ls_tipo_via   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													ls_dir_1	= ls_descrip_tipo_via+' '+ls_dir_p+' Nº: '+ls_nro_part+' D/:'+ls_depto_part+' B/:'+ls_block_part+', '+ls_pob
													ls_dir_2	= ls_descrip_comuna+', '+ls_descrip_ciudad
													UPDATE	"GESTION_CARTA"  
													SET 		"DIRECCION_1" = :ls_dir_1,   
																"DIRECCION_2" = :ls_dir_2  
													WHERE 	"GESTION_CARTA"."RUT" = :il_numero
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
												end if
											end if
											UPDATE	"CLIENTE_DEUDOR_TERCERO"  
											SET 		"NOMBRE" = :ls_nombre,   
														"A_PATERNO" = :ls_ap_pat,   
														"A_MATERNO" = :ls_ap_mat,   
														"DIRECCION_P" = :ls_dir_p,   
														"TIPO_VIA" = :ls_tipo_via,
														"NUMERO_PARTICULAR" = :ls_nro_part,
														"DEPTO_PARTICULAR" = :ls_depto_part,
														"BLOCK_PARTICULAR" = :ls_block_part,
														"POBLACION" = :ls_pob,   
														"SECTOR" = :ls_sector,   
														"COMUNA" = :ls_comuna,   
														"CIUDAD" = :ls_ciudad,   
														"FONO_P" = :ls_fono_p,   
														"FECHA_NAC" = :ldt_fec_nac,   
														"ESTA_CIVIL" = :ls_est_civil,   
														"DOMICILIO_C" = :ls_dir_c,   
														"FONO_C" = :ls_fono_c,   
														"TOTAL_RENT" = :ll_renta,   
														"GRUPO_F" = :ll_grupo_f,   
														"ESTADO_COBRANZA" = :ls_est_cob  
											WHERE 	"CLIENTE_DEUDOR_TERCERO"."RUT" = :il_numero   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										else
											rollback;
											messagebox("Error Grabar","Error al Grabar Cliente SQL: "+sqlca.sqlerrtext)
										end if
									end if
								elseif is_tipo_sol="13" then //solicitud Mod. Estado
									ls_estado			= dw_reporte.getitemstring(il_row,'sol_cambio_estado_estado_ctto_final')
									UPDATE	"CADENA"  
									SET 		"ESTADO" = :ls_estado,   
												"FECHA_RES" = :ldt_fecha_hoy
									WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
												( "CADENA"."SERIE" = :gs_serie ) AND  
												( "CADENA"."NUMERO" = :gi_numero )   
									Using		sqlca ;
									if sqlca.sqlcode=0 then
										commit;
										wf_actualizar_cadena_estado(ls_estado)
									else
										rollback;
									end if
									
								elseif is_tipo_sol="14" then //solicitud Mod. Estado
									ls_estado			= dw_reporte.getitemstring(il_row,'sol_cambio_estado_titular_estado_ctto_fi')
									UPDATE	"CLIENTE"  
									SET 		"ESTADO_TITULAR" = :ls_estado  
									WHERE 	"CLIENTE"."RUT" = :ll_rut_cambio   
									Using		sqlca ;
									if sqlca.sqlcode=0 then
										commit;
										wf_actualizar_cadena_estado(ls_estado)
									else
										rollback;
									end if
								elseif is_tipo_sol="15" then // seguro
									// No hace nada 
								elseif is_tipo_sol="17" then
									DELETE FROM   "COPROP_ISACRUZ"  
									WHERE 		( "COPROP_ISACRUZ"."BASE" = :gs_base ) AND  
													( "COPROP_ISACRUZ"."SERIE" = :gs_serie ) AND  
													( "COPROP_ISACRUZ"."NUMERO" = :gi_numero )   
									USING			sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									DECLARE x1 CURSOR FOR  
									SELECT	"SOL_COPROP_PROMESA_DETALLE"."RUT_COPROP",   
												"SOL_COPROP_PROMESA_DETALLE"."DV_COPROP",   
												"SOL_COPROP_PROMESA_DETALLE"."NOMBRES_COPROP",   
												"SOL_COPROP_PROMESA_DETALLE"."AP_PAT_COPROP",   
												"SOL_COPROP_PROMESA_DETALLE"."AP_MAT_COPROP",   
												"SOL_COPROP_PROMESA_DETALLE"."FECHA_NACIMIENTO_COPROP"  
									FROM 	"SOL_COPROP_PROMESA_DETALLE"  
									WHERE  ( "SOL_COPROP_PROMESA_DETALLE"."BASE" = :gs_base ) AND  
											 ( "SOL_COPROP_PROMESA_DETALLE"."SERIE" = :gs_serie ) AND  
											 ( "SOL_COPROP_PROMESA_DETALLE"."NUMERO" = :gi_numero ) AND  
											 ( "SOL_COPROP_PROMESA_DETALLE"."CORRELATIVO" = :il_corr ) AND  
											 ( "SOL_COPROP_PROMESA_DETALLE"."ESTADO_REG" = 'A' )   
									USING		sqlca;
									open x1;
									if sqlca.sqlcode=0 then
										DO WHILE sqlca.sqlcode=0 
											fetch x1 into :ll_rut_co, :ls_dv_co, :ls_nom_co, :ls_ap_pat_co, :ls_ap_mat_co, :ldt_fec_nac_co;
											if not isnull(ls_dv_co) then
												SELECT	MAX("COPROP_ISACRUZ"."LINEA")  
												INTO 		:ll_max_co  
												FROM 		"COPROP_ISACRUZ"  
												USING		sqlca;
												ll_max_co ++
												if ll_max_co > 0 then
													INSERT INTO "COPROP_ISACRUZ"  
																(	"SERIE",		"NUMERO",	"LINEA",		"RUT",		"DV",			"NOMBRES",	"APATERNO",		"AMATERNO",		"BASE" )  
													VALUES 	( :gs_serie,	:gi_numero,	:ll_max_co,	:ll_rut_co,	:ls_dv_co,	:ls_nom_co, :ls_ap_pat_co, :ls_ap_mat_co, :gs_base)  
													USING		sqlca;
													if Trans_1.sqlcode=0 then
														commit using Trans_1;
													else
														rollback using Trans_1;
													end if
												end if
											end if
											setnull(ls_dv_co)
										LOOP
									end if
									close x1;
								
								elseif is_tipo_sol="20" then // 
									//No hacer Nada
									
								elseif is_tipo_sol="21" then // 
									//No hacer Nada
									
								elseif is_tipo_sol="22" then //seguro fallecimiento
									ls_estado	= 'S'
									UPDATE	"CADENA"  
									SET 		"ESTADO" = :ls_estado
									WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
											 ( "CADENA"."SERIE" = :gs_serie ) AND  
											 ( "CADENA"."NUMERO" = :gi_numero )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
										wf_actualizar_cadena_estado(ls_estado)
									else
										rollback;
									end if
								elseif is_tipo_sol="23" then //En demanda
									ls_estado_ctto		= dw_reporte.getitemstring(il_row,'sol_en_demanda_estado_ctto_final')
								//	ls_estado	= 'M'
									SELECT 	"CADENA"."ESTADO"
									INTO 		:ls_estado
									FROM 	"CADENA"  
									WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
												( "CADENA"."SERIE" = :gs_serie ) AND  
												( "CADENA"."NUMERO" = :gi_numero )   
									Using		sqlca;
									if sqlca.sqlcode=0 then
										
										/////////////////nuevo
										if ls_estado_ctto = 'M' then
											ls_estado_at_pub		= '42'
											ls_glosa					= 'CONTRATO N° '+gs_base+gs_serie+string(gi_numero)+ 'SE CAMBIA ESTADO M-EN DEMANDA EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy hh:mm')
										elseif ls_estado_ctto = 'B' then
											ls_estado_at_pub		= '43'
											ls_glosa					= 'CONTRATO N° '+gs_base+gs_serie+string(gi_numero)+ 'SE CAMBIA ESTADO B-EN SENTENCIA EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy hh:mm')
										end if
										
										INSERT INTO "ATENCION_LOG"  
													( "RUT", 		"ESTADO",   			"FECHA",  			"GLOSA",   	"USUARIO",   	"BASE", 		"SERIE", 		"NUMERO" )  
										VALUES 	( :gi_rut,  	:ls_estado_at_pub,   	:gdt_fec_sistema, :ls_glosa,		:gs_user,   		:gs_base,   :gs_serie,   	:gi_numero )
										USING	sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
										/////////////////nuevo
										SELECT 	"ESTADO"."ESTADO_FACTURACION"  
										INTO 		:ls_estado_fact 
										FROM 	"ESTADO"  
										WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado
										USING	sqlca;
										if ls_estado_fact = 'R' then
											UPDATE	"CADENA"  
											SET 		"ESTADO_CONTRATO_AUX" = :ls_estado_ctto,
														"FECHA_RES" = :ls_fec_sistema
											WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
														( "CADENA"."SERIE" = :gs_serie ) AND  
														( "CADENA"."NUMERO" = :gi_numero )   
											USING		sqlca;
										else	
											UPDATE	"CADENA"  
											SET 		"ESTADO" = :ls_estado_ctto,
														"ESTADO_CONTRATO_AUX" = :ls_estado_ctto//,
														//"FECHA_RES" = :ls_fec_sistema
											WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
														( "CADENA"."SERIE" = :gs_serie ) AND  
														( "CADENA"."NUMERO" = :gi_numero )   
											USING		sqlca;
										end if	
										if sqlca.sqlcode=0 then
											commit;
											// Insertar Funcion Cambio Cartera
											SELECT  "ENCARGADOS"."CODIGO_USUARIO"  
											INTO     :ls_cobrador
											FROM   "ENCARGADOS"  
											WHERE "ENCARGADOS"."TIPO_COBRANZA_TERRENO" = 'J' AND "ENCARGADOS"."ESTADO" = 'A'
											USING  sqlca;
											if not isnull(ls_cobrador) then
												f_demanda_cliente_cartera(gs_base,gs_serie,gi_numero,ls_cobrador)
											end if
//											f_demanda_cliente_cartera(gs_base,gs_serie,gi_numero,'ET30')
											if ls_estado <> 'R' then
												wf_actualizar_cadena_estado(ls_estado_ctto)
											end if	
											if ls_estado_ctto <> 'V' then
												UPDATE 	"CUPONERAS"  
												SET 		"ESTADO_CUPONERA" = 'A'  
												WHERE 	"CUPONERAS"."BASE" = :gs_base AND  
															"CUPONERAS"."SERIE" = :gs_serie AND  
															"CUPONERAS"."NUMERO" = :gi_numero and
															"CUPONERAS"."ESTADO_CUPONERA" = 'V'
												USING	sqlca;
												if sqlca.sqlcode = 0 then
													UPDATE 	"CUPONERAS_DETALLE"  
													SET 		"ESTADO_PAGO_CUPON" = 'A'  
													WHERE 	"CUPONERAS_DETALLE"."BASE" = :gs_base AND  
																"CUPONERAS_DETALLE"."SERIE" = :gs_serie AND  
																"CUPONERAS_DETALLE"."NUMERO" = :gi_numero AND
																"CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V'
													USING	sqlca;				
												end if	
											end if
										else
											rollback;
										end if
									else	
									end if	
								elseif is_tipo_sol="24" then //bono fraterno

								elseif is_tipo_sol="25" then //Mantención Perpetua
									
								elseif is_tipo_sol="26" then //Titulo de Dominio
									
								elseif is_tipo_sol="27" then //Compromiso Pago
									
								end if
								if ls_est_mod='S' then
									ll_resp				= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
									if ll_resp=1 then
										CHOOSE CASE is_tipo_sol
											CASE "1" //resciliacion por parte del cliente
												SELECT	"SOL_RESCILIA_CLIENTE"."DIRECCION_P",   "SOL_RESCILIA_CLIENTE"."POBLACION",   "SOL_RESCILIA_CLIENTE"."SECTOR",   "SOL_RESCILIA_CLIENTE"."COMUNA",   "SOL_RESCILIA_CLIENTE"."CIUDAD",   "SOL_RESCILIA_CLIENTE"."FONO_P",   "SOL_RESCILIA_CLIENTE"."FECHA_NAC",   "SOL_RESCILIA_CLIENTE"."ESTADO_CIVIL",   "SOL_RESCILIA_CLIENTE"."DOMICILIO_C",   "SOL_RESCILIA_CLIENTE"."TOTAL_RENTA",   "SOL_RESCILIA_CLIENTE"."FONO_C",   "SOL_RESCILIA_CLIENTE"."GRUPO_F",   "SOL_RESCILIA_CLIENTE"."RUT_TITULAR",   "SOL_RESCILIA_CLIENTE"."TIPO_VIA",   "SOL_RESCILIA_CLIENTE"."NUMERO_PARTICULAR",   "SOL_RESCILIA_CLIENTE"."DEPTO_PARTICULAR",   "SOL_RESCILIA_CLIENTE"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   									 :ls_pob,   									:ls_sector,   							  :ls_comuna,   							 :ls_ciudad,   							:ls_fono_p,   							  :ldt_fec_nac,   							 :ls_est_civil,   								:ls_dir_c,   									 :ll_renta,   										:ls_fono_c,   							 :ll_grupo_f,   							 :ll_rut  	,									  :ls_tipo_via,								:ls_nro_part,											 :ls_depto_part,											:ls_block_part
												FROM 	"SOL_RESCILIA_CLIENTE",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_RESCILIA_CLIENTE"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_RESCILIA_CLIENTE"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_RESCILIA_CLIENTE"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESCILIA_CLIENTE"."CORRELATIVO" ) and  
														 ( ( "SOL_RESCILIA_CLIENTE"."BASE" = :gs_base ) AND  
														 ( "SOL_RESCILIA_CLIENTE"."SERIE" = :gs_serie ) AND  
														 ( "SOL_RESCILIA_CLIENTE"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_RESCILIA_CLIENTE"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
												
											CASE "2" //resciliacion por reprogramacion
												SELECT	"SOL_RESCILIA_REPROG"."DIRECCION_P",   "SOL_RESCILIA_REPROG"."POBLACION",   "SOL_RESCILIA_REPROG"."SECTOR",   "SOL_RESCILIA_REPROG"."COMUNA",   "SOL_RESCILIA_REPROG"."CIUDAD",   "SOL_RESCILIA_REPROG"."FONO_P",   "SOL_RESCILIA_REPROG"."FECHA_NAC",   "SOL_RESCILIA_REPROG"."ESTADO_CIVIL",   "SOL_RESCILIA_REPROG"."DOMICILIO_C",   "SOL_RESCILIA_REPROG"."TOTAL_RENTA",   "SOL_RESCILIA_REPROG"."FONO_C",   "SOL_RESCILIA_REPROG"."GRUPO_F",   "SOL_RESCILIA_REPROG"."RUT_TITULAR",   "SOL_RESCILIA_REPROG"."TIPO_VIA",   "SOL_RESCILIA_REPROG"."NUMERO_PARTICULAR",   "SOL_RESCILIA_REPROG"."DEPTO_PARTICULAR",   "SOL_RESCILIA_REPROG"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   									:ls_pob,   									 :ls_sector,   							:ls_comuna,   							:ls_ciudad,   							 :ls_fono_p,   						  :ldt_fec_nac,   							:ls_est_civil,   								 :ls_dir_c,   									 :ll_renta,   									 :ls_fono_c,   						  :ll_grupo_f,   							 :ll_rut  ,										 :ls_tipo_via,								 :ls_nro_part,												:ls_depto_part,									:ls_block_part
												FROM 	"SOL_RESCILIA_REPROG",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_RESCILIA_REPROG"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_RESCILIA_REPROG"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_RESCILIA_REPROG"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESCILIA_REPROG"."CORRELATIVO" ) and  
														 ( ( "SOL_RESCILIA_REPROG"."BASE" = :gs_base ) AND  
														 ( "SOL_RESCILIA_REPROG"."SERIE" = :gs_serie ) AND  
														 ( "SOL_RESCILIA_REPROG"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_RESCILIA_REPROG"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
												
											CASE "3" // reactivacion
												SELECT	"SOL_REACTIVA"."DIRECCION_P",   "SOL_REACTIVA"."POBLACION",   "SOL_REACTIVA"."SECTOR",   "SOL_REACTIVA"."COMUNA",   "SOL_REACTIVA"."CIUDAD",   "SOL_REACTIVA"."FONO_P",   "SOL_REACTIVA"."FECHA_NAC",   "SOL_REACTIVA"."ESTADO_CIVIL",   "SOL_REACTIVA"."DOMICILIO_C",   "SOL_REACTIVA"."TOTAL_RENTA",   "SOL_REACTIVA"."FONO_C",   "SOL_REACTIVA"."GRUPO_F",   "SOL_REACTIVA"."RUT_TITULAR",   "SOL_REACTIVA"."TIPO_VIA",   "SOL_REACTIVA"."NUMERO_PARTICULAR",   "SOL_REACTIVA"."DEPTO_PARTICULAR",   "SOL_REACTIVA"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   						  :ls_pob,   						  :ls_sector,   				  :ls_comuna,   				  :ls_ciudad,   				  :ls_fono_p,   				  :ldt_fec_nac,   				  :ls_est_civil,   						:ls_dir_c,   						 :ll_renta,   							:ls_fono_c,   					:ll_grupo_f,   				 :ll_rut  ,								:ls_tipo_via,					  :ls_nro_part,									:ls_depto_part,							:ls_block_part
												FROM 	"SOL_REACTIVA",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_REACTIVA"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_REACTIVA"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_REACTIVA"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_REACTIVA"."CORRELATIVO" ) and  
														 ( ( "SOL_REACTIVA"."BASE" = :gs_base ) AND  
														 ( "SOL_REACTIVA"."SERIE" = :gs_serie ) AND  
														 ( "SOL_REACTIVA"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_REACTIVA"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
												
											CASE "4" // seguro desgravamen
												SELECT	"SOL_SEGURO_DESG"."DIRECCION_P",   "SOL_SEGURO_DESG"."POBLACION",   "SOL_SEGURO_DESG"."SECTOR",   "SOL_SEGURO_DESG"."COMUNA",   "SOL_SEGURO_DESG"."CIUDAD",   "SOL_SEGURO_DESG"."FONO_P",   "SOL_SEGURO_DESG"."FECHA_NAC",   "SOL_SEGURO_DESG"."ESTADO_CIVIL",   "SOL_SEGURO_DESG"."DOMICILIO_C",   "SOL_SEGURO_DESG"."TOTAL_RENTA",   "SOL_SEGURO_DESG"."FONO_C",   "SOL_SEGURO_DESG"."GRUPO_F",   "SOL_SEGURO_DESG"."RUT_TITULAR",   "SOL_SEGURO_DESG"."TIPO_VIA",   "SOL_SEGURO_DESG"."NUMERO_PARTICULAR",   "SOL_SEGURO_DESG"."DEPTO_PARTICULAR",   "SOL_SEGURO_DESG"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   					  :ldt_fec_nac,   						:ls_est_civil,   							:ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut  	,								:ls_tipo_via,							:ls_nro_part,										:ls_depto_part,								:ls_block_part
												FROM 	"SOL_SEGURO_DESG",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_DESG"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_DESG"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_DESG"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_DESG"."CORRELATIVO" ) and  
														 ( ( "SOL_SEGURO_DESG"."BASE" = :gs_base ) AND  
														 ( "SOL_SEGURO_DESG"."SERIE" = :gs_serie ) AND  
														 ( "SOL_SEGURO_DESG"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_SEGURO_DESG"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
												
											CASE "5" // repacta compraventa
												SELECT	"SOL_REPACTA_CVTA"."DIRECCION_P",   "SOL_REPACTA_CVTA"."POBLACION",   "SOL_REPACTA_CVTA"."SECTOR",   "SOL_REPACTA_CVTA"."COMUNA",   "SOL_REPACTA_CVTA"."CIUDAD",   "SOL_REPACTA_CVTA"."FONO_P",   "SOL_REPACTA_CVTA"."FECHA_NAC",   "SOL_REPACTA_CVTA"."ESTADO_CIVIL",   "SOL_REPACTA_CVTA"."DOMICILIO_C",   "SOL_REPACTA_CVTA"."TOTAL_RENTA",   "SOL_REPACTA_CVTA"."FONO_C",   "SOL_REPACTA_CVTA"."GRUPO_F",   "SOL_REPACTA_CVTA"."RUT_TITULAR",   "SOL_REPACTA_CVTA"."TIPO_VIA",   "SOL_REPACTA_CVTA"."NUMERO_PARTICULAR",   "SOL_REPACTA_CVTA"."DEPTO_PARTICULAR",   "SOL_REPACTA_CVTA"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   								:ls_pob,   								 :ls_sector,   						:ls_comuna,   						:ls_ciudad,   						 :ls_fono_p,   					  :ldt_fec_nac,   						:ls_est_civil,   							 :ls_dir_c,   								 :ll_renta,   								 :ls_fono_c,   					  :ll_grupo_f,   						 :ll_rut  ,									 :ls_tipo_via,							 :ls_nro_part,										 :ls_depto_part,									:ls_block_part
												FROM 	"SOL_REPACTA_CVTA",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_REPACTA_CVTA"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_REPACTA_CVTA"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_REPACTA_CVTA"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_REPACTA_CVTA"."CORRELATIVO" ) and 
														 ( ( "SOL_REPACTA_CVTA"."BASE" = :gs_base ) AND 
														 ( "SOL_REPACTA_CVTA"."SERIE" = :gs_serie ) AND 
														 ( "SOL_REPACTA_CVTA"."NUMERO" = :gi_numero ) AND 
														 ( "SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_corr ) AND 
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) ) 
												Using	sqlca;
										
											CASE "6" // TITULO DE DOMINIO
												SELECT	"SOL_TIT_DOMINIO"."DIRECCION_P",   "SOL_TIT_DOMINIO"."POBLACION",   "SOL_TIT_DOMINIO"."SECTOR",   "SOL_TIT_DOMINIO"."COMUNA",   "SOL_TIT_DOMINIO"."CIUDAD",   "SOL_TIT_DOMINIO"."FONO_P",   "SOL_TIT_DOMINIO"."FECHA_NAC",   "SOL_TIT_DOMINIO"."ESTADO_CIVIL",   "SOL_TIT_DOMINIO"."DOMICILIO_C",   "SOL_TIT_DOMINIO"."TOTAL_RENTA",   "SOL_TIT_DOMINIO"."FONO_C",   "SOL_TIT_DOMINIO"."GRUPO_F",   "SOL_TIT_DOMINIO"."RUT_TITULAR"  ,   "SOL_TIT_DOMINIO"."TIPO_VIA",   "SOL_TIT_DOMINIO"."NUMERO_PARTICULAR",   "SOL_TIT_DOMINIO"."DEPTO_PARTICULAR",   "SOL_TIT_DOMINIO"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   							  :ls_pob,   								:ls_sector,   						:ls_comuna,   						:ls_ciudad,   						:ls_fono_p,   						:ldt_fec_nac,   						:ls_est_civil,   							:ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut  ,										:ls_tipo_via,						 :ls_nro_part,										:ls_depto_part,								 :ls_block_part
												FROM 	"SOL_TIT_DOMINIO",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_TIT_DOMINIO"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_TIT_DOMINIO"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_TIT_DOMINIO"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TIT_DOMINIO"."CORRELATIVO" ) and  
														 ( ( "SOL_TIT_DOMINIO"."BASE" = :gs_base ) AND  
														 ( "SOL_TIT_DOMINIO"."SERIE" = :gs_serie ) AND  
														 ( "SOL_TIT_DOMINIO"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_TIT_DOMINIO"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
											
											CASE "7" // CONTRATO DEFINITIVO
												SELECT	"SOL_CONTRATO_DEF"."DIRECCION_P",   "SOL_CONTRATO_DEF"."POBLACION",   "SOL_CONTRATO_DEF"."SECTOR",   "SOL_CONTRATO_DEF"."COMUNA",   "SOL_CONTRATO_DEF"."CIUDAD",   "SOL_CONTRATO_DEF"."FONO_P",   "SOL_CONTRATO_DEF"."FECHA_NAC",   "SOL_CONTRATO_DEF"."ESTADO_CIVIL",   "SOL_CONTRATO_DEF"."DOMICILIO_C",   "SOL_CONTRATO_DEF"."TOTAL_RENTA",   "SOL_CONTRATO_DEF"."FONO_C",   "SOL_CONTRATO_DEF"."GRUPO_F",   "SOL_CONTRATO_DEF"."RUT_TITULAR",   "SOL_CONTRATO_DEF"."TIPO_VIA",   "SOL_CONTRATO_DEF"."NUMERO_PARTICULAR",   "SOL_CONTRATO_DEF"."DEPTO_PARTICULAR",   "SOL_CONTRATO_DEF"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   								:ls_pob,   								 :ls_sector,   					  :ls_comuna,   						:ls_ciudad,   						 :ls_fono_p,   					  :ldt_fec_nac,   						:ls_est_civil,   							 :ls_dir_c,   								 :ll_renta,   								 :ls_fono_c,   						:ll_grupo_f,   					  :ll_rut  ,								 :ls_tipo_via,							 :ls_nro_part,										 :ls_depto_part,									:ls_block_part
												FROM 	"SOL_CONTRATO_DEF",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_CONTRATO_DEF"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_CONTRATO_DEF"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_CONTRATO_DEF"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CONTRATO_DEF"."CORRELATIVO" ) and  
														 (("SOL_CONTRATO_DEF"."BASE" = :gs_base ) AND  
														 ( "SOL_CONTRATO_DEF"."SERIE" = :gs_serie ) AND  
														 ( "SOL_CONTRATO_DEF"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_CONTRATO_DEF"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
												
											CASE "8" // entrega pagare
												SELECT	"SOL_ENTREGA_PAG"."DIRECCION_P",   "SOL_ENTREGA_PAG"."POBLACION",   "SOL_ENTREGA_PAG"."SECTOR",   "SOL_ENTREGA_PAG"."COMUNA",   "SOL_ENTREGA_PAG"."CIUDAD",   "SOL_ENTREGA_PAG"."FONO_P",   "SOL_ENTREGA_PAG"."FECHA_NAC",   "SOL_ENTREGA_PAG"."ESTADO_CIVIL",   "SOL_ENTREGA_PAG"."DOMICILIO_C",   "SOL_ENTREGA_PAG"."TOTAL_RENTA",   "SOL_ENTREGA_PAG"."FONO_C",   "SOL_ENTREGA_PAG"."GRUPO_F",   "SOL_ENTREGA_PAG"."RUT_TITULAR"  ,   "SOL_ENTREGA_PAG"."TIPO_VIA",   "SOL_ENTREGA_PAG"."NUMERO_PARTICULAR",   "SOL_ENTREGA_PAG"."DEPTO_PARTICULAR",   "SOL_ENTREGA_PAG"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   								:ls_pob,   								:ls_sector,   						:ls_comuna,   						:ls_ciudad,   						:ls_fono_p,   						:ldt_fec_nac,   						:ls_est_civil,   							:ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut  ,									  :ls_tipo_via,						 :ls_nro_part,										:ls_depto_part,									:ls_block_part
												FROM 	"SOL_ENTREGA_PAG",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_ENTREGA_PAG"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_ENTREGA_PAG"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_ENTREGA_PAG"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_ENTREGA_PAG"."CORRELATIVO" ) and  
														 (("SOL_ENTREGA_PAG"."BASE" = :gs_base ) AND  
														 ( "SOL_ENTREGA_PAG"."SERIE" = :gs_serie ) AND  
														 ( "SOL_ENTREGA_PAG"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_ENTREGA_PAG"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
												
											CASE "10" // transferencia
												SELECT	"SOL_TRANSFERENCIA"."DIRECCION_P",   "SOL_TRANSFERENCIA"."POBLACION",   "SOL_TRANSFERENCIA"."SECTOR",   "SOL_TRANSFERENCIA"."COMUNA",   "SOL_TRANSFERENCIA"."CIUDAD",   "SOL_TRANSFERENCIA"."FONO_P",   "SOL_TRANSFERENCIA"."FECHA_NAC",   "SOL_TRANSFERENCIA"."ESTADO_CIVIL",   "SOL_TRANSFERENCIA"."DOMICILIO_C",   "SOL_TRANSFERENCIA"."TOTAL_RENTA",   "SOL_TRANSFERENCIA"."FONO_C",   "SOL_TRANSFERENCIA"."GRUPO_F",   "SOL_TRANSFERENCIA"."RUT_TITULAR"  ,   "SOL_TRANSFERENCIA"."TIPO_VIA",   "SOL_TRANSFERENCIA"."NUMERO_PARTICULAR",   "SOL_TRANSFERENCIA"."DEPTO_PARTICULAR",   "SOL_TRANSFERENCIA"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   								 :ls_pob,   								:ls_sector,   							:ls_comuna,   						  :ls_ciudad,   						:ls_fono_p,   							:ldt_fec_nac,   						 :ls_est_civil,   							:ls_dir_c,   								 :ll_renta,   								  :ls_fono_c,   						 :ll_grupo_f,   						 :ll_rut  ,										 :ls_tipo_via,							  :ls_nro_part,										:ls_depto_part,									:ls_block_part
												FROM 	"SOL_TRANSFERENCIA",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_TRANSFERENCIA"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_TRANSFERENCIA"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_TRANSFERENCIA"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TRANSFERENCIA"."CORRELATIVO" ) and  
														 (("SOL_TRANSFERENCIA"."BASE" = :gs_base ) AND  
														 ( "SOL_TRANSFERENCIA"."SERIE" = :gs_serie ) AND  
														 ( "SOL_TRANSFERENCIA"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_TRANSFERENCIA"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
												
											CASE "11" // resolucion
												SELECT	"SOL_RESOLUCION"."DIRECCION_P",   "SOL_RESOLUCION"."POBLACION",   "SOL_RESOLUCION"."SECTOR",   "SOL_RESOLUCION"."COMUNA",   "SOL_RESOLUCION"."CIUDAD",   "SOL_RESOLUCION"."FONO_P",   "SOL_RESOLUCION"."FECHA_NAC",   "SOL_RESOLUCION"."ESTADO_CIVIL",   "SOL_RESOLUCION"."DOMICILIO_C",   "SOL_RESOLUCION"."TOTAL_RENTA",   "SOL_RESOLUCION"."FONO_C",   "SOL_RESOLUCION"."GRUPO_F",   "SOL_RESOLUCION"."RUT_TITULAR",   "SOL_RESOLUCION"."TIPO_VIA",   "SOL_RESOLUCION"."NUMERO_PARTICULAR",   "SOL_RESOLUCION"."DEPTO_PARTICULAR",   "SOL_RESOLUCION"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   							 :ls_pob,   							:ls_sector,   					  :ls_comuna,   					 :ls_ciudad,   					:ls_fono_p,   					  :ldt_fec_nac,   					 :ls_est_civil,   						:ls_dir_c,   							 :ll_renta,   							  :ls_fono_c,   					 :ll_grupo_f,   					 :ll_rut  ,								  :ls_tipo_via,						:ls_nro_part,										:ls_depto_part,								:ls_block_part
												FROM 	"SOL_RESOLUCION",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_RESOLUCION"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_RESOLUCION"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_RESOLUCION"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESOLUCION"."CORRELATIVO" ) and  
														 (("SOL_RESOLUCION"."BASE" = :gs_base ) AND  
														 ( "SOL_RESOLUCION"."SERIE" = :gs_serie ) AND  
														 ( "SOL_RESOLUCION"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_RESOLUCION"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
											CASE "13" // cambio estado
												SELECT	"SOL_CAMBIO_ESTADO"."DIRECCION_P",   "SOL_CAMBIO_ESTADO"."POBLACION",   "SOL_CAMBIO_ESTADO"."SECTOR",   "SOL_CAMBIO_ESTADO"."COMUNA",   "SOL_CAMBIO_ESTADO"."CIUDAD",   "SOL_CAMBIO_ESTADO"."FONO_P",   "SOL_CAMBIO_ESTADO"."FECHA_NAC",   "SOL_CAMBIO_ESTADO"."ESTADO_CIVIL",   "SOL_CAMBIO_ESTADO"."DOMICILIO_C",   "SOL_CAMBIO_ESTADO"."TOTAL_RENTA",   "SOL_CAMBIO_ESTADO"."FONO_C",   "SOL_CAMBIO_ESTADO"."GRUPO_F",   "SOL_CAMBIO_ESTADO"."RUT_TITULAR",   "SOL_CAMBIO_ESTADO"."TIPO_VIA",   "SOL_CAMBIO_ESTADO"."NUMERO_PARTICULAR",   "SOL_CAMBIO_ESTADO"."DEPTO_PARTICULAR",   "SOL_CAMBIO_ESTADO"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   							 	:ls_pob,   									:ls_sector,   					  		:ls_comuna,   					 	:ls_ciudad,   							:ls_fono_p,   					  		:ldt_fec_nac,   					 	:ls_est_civil,   								:ls_dir_c,   							 	:ll_renta,   							  		:ls_fono_c,   					 	:ll_grupo_f,   					 	:ll_rut  ,								  		:ls_tipo_via,							:ls_nro_part,										:ls_depto_part,									:ls_block_part
												FROM 	"SOL_CAMBIO_ESTADO",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_CAMBIO_ESTADO"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_CAMBIO_ESTADO"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_CAMBIO_ESTADO"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CAMBIO_ESTADO"."CORRELATIVO" ) and  
														 (("SOL_CAMBIO_ESTADO"."BASE" = :gs_base ) AND  
														 ( "SOL_CAMBIO_ESTADO"."SERIE" = :gs_serie ) AND  
														 ( "SOL_CAMBIO_ESTADO"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_CAMBIO_ESTADO"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
											CASE "14" // cambio estado titular
												SELECT	"SOL_CAMBIO_ESTADO_TITULAR"."DIRECCION_P",   "SOL_CAMBIO_ESTADO_TITULAR"."POBLACION",  "SOL_CAMBIO_ESTADO_TITULAR"."SECTOR",  "SOL_CAMBIO_ESTADO_TITULAR"."COMUNA",  "SOL_CAMBIO_ESTADO_TITULAR"."CIUDAD",  "SOL_CAMBIO_ESTADO_TITULAR"."FONO_P",  "SOL_CAMBIO_ESTADO_TITULAR"."FECHA_NAC",  "SOL_CAMBIO_ESTADO_TITULAR"."ESTADO_CIVIL",  "SOL_CAMBIO_ESTADO_TITULAR"."DOMICILIO_C",   "SOL_CAMBIO_ESTADO_TITULAR"."TOTAL_RENTA",   "SOL_CAMBIO_ESTADO_TITULAR"."FONO_C",  "SOL_CAMBIO_ESTADO_TITULAR"."GRUPO_F", "SOL_CAMBIO_ESTADO_TITULAR"."RUT_TITULAR",   "SOL_CAMBIO_ESTADO_TITULAR"."TIPO_VIA",   "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO_PARTICULAR",   "SOL_CAMBIO_ESTADO_TITULAR"."DEPTO_PARTICULAR", "SOL_CAMBIO_ESTADO_TITULAR"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   							 				:ls_pob,   											:ls_sector,   					  				:ls_comuna,   					 				:ls_ciudad,   									:ls_fono_p,   					  				:ldt_fec_nac,   					 				:ls_est_civil,   										:ls_dir_c,   							 				:ll_renta,   							  				:ls_fono_c,   					 				:ll_grupo_f,   					 			:ll_rut  ,								  				:ls_tipo_via,										:ls_nro_part,													:ls_depto_part,											:ls_block_part
												FROM 	"SOL_CAMBIO_ESTADO_TITULAR",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_CAMBIO_ESTADO_TITULAR"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" ) and  
														 (("SOL_CAMBIO_ESTADO_TITULAR"."BASE" = :gs_base ) AND  
														 ( "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" = :gs_serie ) AND  
														 ( "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
											CASE "15"
												SELECT	"SOL_SEGURO"."DIRECCION_P",   "SOL_SEGURO"."POBLACION",  "SOL_SEGURO"."SECTOR",  "SOL_SEGURO"."COMUNA",  "SOL_SEGURO"."CIUDAD",  "SOL_SEGURO"."FONO_P",  "SOL_SEGURO"."FECHA_NAC",  "SOL_SEGURO"."ESTADO_CIVIL",  "SOL_SEGURO"."DOMICILIO_C",   "SOL_SEGURO"."TOTAL_RENTA",   "SOL_SEGURO"."FONO_C",  "SOL_SEGURO"."GRUPO_F", "SOL_SEGURO"."RUT_TITULAR",   "SOL_SEGURO"."TIPO_VIA",   "SOL_SEGURO"."NUMERO_PARTICULAR",   "SOL_SEGURO"."DEPTO_PARTICULAR",   	"SOL_SEGURO"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   						:ls_pob,   						:ls_sector,   				:ls_comuna,   				:ls_ciudad,   				:ls_fono_p,   				:ldt_fec_nac,   				:ls_est_civil,   					:ls_dir_c,   						:ll_renta,   						:ls_fono_c,   				:ll_grupo_f,   			:ll_rut  ,							:ls_tipo_via,					:ls_nro_part,								:ls_depto_part,							:ls_block_part
												FROM 	"SOL_SEGURO",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_SEGURO"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO"."CORRELATIVO" ) and  
														 (("SOL_SEGURO"."BASE" = :gs_base ) AND  
														 ( "SOL_SEGURO"."SERIE" = :gs_serie ) AND  
														 ( "SOL_SEGURO"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_SEGURO"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
											CASE "16" // Novacion
												SELECT	"SOL_NOVACION"."DIRECCION_P", "SOL_NOVACION"."POBLACION",   "SOL_NOVACION"."SECTOR",   "SOL_NOVACION"."COMUNA",   "SOL_NOVACION"."CIUDAD",   "SOL_NOVACION"."FONO_P",   "SOL_NOVACION"."FECHA_NAC",   "SOL_NOVACION"."ESTADO_CIVIL",   "SOL_NOVACION"."DOMICILIO_C",   "SOL_NOVACION"."TOTAL_RENTA",   "SOL_NOVACION"."FONO_C",   "SOL_NOVACION"."GRUPO_F",   "SOL_NOVACION"."RUT_TITULAR"  ,   "SOL_NOVACION"."TIPO_VIA",   "SOL_NOVACION"."NUMERO_PARTICULAR",   "SOL_NOVACION"."DEPTO_PARTICULAR",   "SOL_NOVACION"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   						:ls_pob,   							:ls_sector,   					:ls_comuna,   					:ls_ciudad,   					:ls_fono_p,   					:ldt_fec_nac,   					:ls_est_civil,   						:ls_dir_c,   						  :ll_renta,   						 :ls_fono_c,   				 :ll_grupo_f,   				  :ll_rut  ,								:ls_tipo_via,					  :ls_nro_part,								 :ls_depto_part,							  :ls_block_part
												FROM 	"SOL_NOVACION",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_NOVACION"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_NOVACION"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_NOVACION"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_NOVACION"."CORRELATIVO" ) and  
														 (("SOL_NOVACION"."BASE" = :gs_base ) AND  
														 ( "SOL_NOVACION"."SERIE" = :gs_serie ) AND  
														 ( "SOL_NOVACION"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_NOVACION"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
											CASE "19" // Posesion Efectiva
												SELECT	"SOL_POS_EFEC"."DIRECCION_P",   "SOL_POS_EFEC"."POBLACION",   "SOL_POS_EFEC"."SECTOR",   "SOL_POS_EFEC"."COMUNA",   "SOL_POS_EFEC"."CIUDAD",   "SOL_POS_EFEC"."FONO_P",   "SOL_POS_EFEC"."FECHA_NAC",   "SOL_POS_EFEC"."ESTADO_CIVIL",   "SOL_POS_EFEC"."DOMICILIO_C",   "SOL_POS_EFEC"."TOTAL_RENTA",   "SOL_POS_EFEC"."FONO_C",   "SOL_POS_EFEC"."GRUPO_F",   "SOL_POS_EFEC"."RUT_TITULAR"  ,   "SOL_POS_EFEC"."TIPO_VIA",   "SOL_POS_EFEC"."NUMERO_PARTICULAR",   "SOL_POS_EFEC"."DEPTO_PARTICULAR",   "SOL_POS_EFEC"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   						  :ls_pob,   						  :ls_sector,   				  :ls_comuna,   				  :ls_ciudad,   				  :ls_fono_p,   				  :ldt_fec_nac,   				  :ls_est_civil,   					  :ls_dir_c,   						 :ll_renta,   						   :ls_fono_c,   					:ll_grupo_f,   				 :ll_rut  ,								  :ls_tipo_via,					 :ls_nro_part,									:ls_depto_part,							 :ls_block_part
												FROM 	"SOL_POS_EFEC",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_POS_EFEC"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_POS_EFEC"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_POS_EFEC"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_POS_EFEC"."CORRELATIVO" ) and  
														 (("SOL_POS_EFEC"."BASE" = :gs_base ) AND  
														 ( "SOL_POS_EFEC"."SERIE" = :gs_serie ) AND  
														 ( "SOL_POS_EFEC"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_POS_EFEC"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
											CASE "20" // PAC
												SELECT	"SOL_PAC"."DIRECCION_P",   "SOL_PAC"."POBLACION",   "SOL_PAC"."SECTOR",   "SOL_PAC"."COMUNA",   "SOL_PAC"."CIUDAD",  "SOL_PAC"."FONO_P",  "SOL_PAC"."FECHA_NAC",  "SOL_PAC"."ESTADO_CIVIL",  "SOL_PAC"."DOMICILIO_C",   "SOL_PAC"."TOTAL_RENTA",   "SOL_PAC"."FONO_C",  "SOL_PAC"."GRUPO_F", "SOL_PAC"."RUT_TITULAR"  , "SOL_PAC"."TIPO_VIA",   "SOL_PAC"."NUMERO_PARTICULAR",   "SOL_PAC"."DEPTO_PARTICULAR", "SOL_PAC"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   					:ls_pob,   					 :ls_sector,   		  :ls_comuna,   			:ls_ciudad,   			:ls_fono_p,   			:ldt_fec_nac,   			:ls_est_civil,   				:ls_dir_c,   					:ll_renta,   					:ls_fono_c,   			:ll_grupo_f,   		:ll_rut  ,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
												FROM 	"SOL_PAC",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_PAC"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_PAC"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_PAC"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_PAC"."CORRELATIVO" ) and  
														 (("SOL_PAC"."BASE" = :gs_base ) AND  
														 ( "SOL_PAC"."SERIE" = :gs_serie ) AND  
														 ( "SOL_PAC"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_PAC"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
											CASE "21" // PAT
												SELECT	"SOL_PAT"."DIRECCION_P",   "SOL_PAT"."POBLACION",   "SOL_PAT"."SECTOR",   "SOL_PAT"."COMUNA",   "SOL_PAT"."CIUDAD",  "SOL_PAT"."FONO_P",  "SOL_PAT"."FECHA_NAC",  "SOL_PAT"."ESTADO_CIVIL",  "SOL_PAT"."DOMICILIO_C",   "SOL_PAT"."TOTAL_RENTA",   "SOL_PAT"."FONO_C",  "SOL_PAT"."GRUPO_F", "SOL_PAT"."RUT_TITULAR"  , "SOL_PAT"."TIPO_VIA",   "SOL_PAT"."NUMERO_PARTICULAR",   "SOL_PAT"."DEPTO_PARTICULAR", "SOL_PAT"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   					:ls_pob,   					 :ls_sector,   		  :ls_comuna,   			:ls_ciudad,   			:ls_fono_p,   			:ldt_fec_nac,   			:ls_est_civil,   				:ls_dir_c,   					:ll_renta,   					:ls_fono_c,   			:ll_grupo_f,   		:ll_rut  ,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
												FROM 	"SOL_PAT",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_PAT"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_PAT"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_PAT"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_PAT"."CORRELATIVO" ) and  
														 (("SOL_PAT"."BASE" = :gs_base ) AND  
														 ( "SOL_PAT"."SERIE" = :gs_serie ) AND  
														 ( "SOL_PAT"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_PAT"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
											CASE "22" // seguro fallecimiento
												SELECT	"SOL_SEGURO_FALLECE"."DIRECCION_P",   "SOL_SEGURO_FALLECE"."POBLACION",	"SOL_SEGURO_FALLECE"."SECTOR",   "SOL_SEGURO_FALLECE"."COMUNA",   "SOL_SEGURO_FALLECE"."CIUDAD",   "SOL_SEGURO_FALLECE"."FONO_P",   "SOL_SEGURO_FALLECE"."FECHA_NAC",   "SOL_SEGURO_FALLECE"."ESTADO_CIVIL",   "SOL_SEGURO_FALLECE"."DOMICILIO_C", "SOL_SEGURO_FALLECE"."TOTAL_RENTA", "SOL_SEGURO_FALLECE"."FONO_C",   "SOL_SEGURO_FALLECE"."GRUPO_F",  "SOL_SEGURO_FALLECE"."RUT_TITULAR", "SOL_SEGURO_FALLECE"."TIPO_VIA", "SOL_SEGURO_FALLECE"."NUMERO_PARTICULAR", "SOL_SEGURO_FALLECE"."DEPTO_PARTICULAR",  "SOL_SEGURO_FALLECE"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   							  		:ls_pob,   							  	:ls_sector,   					  		:ls_comuna,   					  		:ls_ciudad,   					  		:ls_fono_p,   					  		:ldt_fec_nac,   							:ls_est_civil,   								:ls_dir_c,   							 	:ll_renta,   								:ls_fono_c,   							:ll_grupo_f,   					 	:ll_rut  	,								:ls_tipo_via,							:ls_nro_part,										:ls_depto_part,									:ls_block_part
												FROM 	"SOL_SEGURO_FALLECE",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_FALLECE"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_FALLECE"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_FALLECE"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_FALLECE"."CORRELATIVO" ) and  
														 ( ( "SOL_SEGURO_FALLECE"."BASE" = :gs_base ) AND  
														 ( "SOL_SEGURO_FALLECE"."SERIE" = :gs_serie ) AND  
														 ( "SOL_SEGURO_FALLECE"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_SEGURO_FALLECE"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
											CASE "23" // en demanda
												SELECT	"SOL_EN_DEMANDA"."DIRECCION_P",   "SOL_EN_DEMANDA"."POBLACION",	"SOL_EN_DEMANDA"."SECTOR",   "SOL_EN_DEMANDA"."COMUNA",   "SOL_EN_DEMANDA"."CIUDAD",   "SOL_EN_DEMANDA"."FONO_P",   "SOL_EN_DEMANDA"."FECHA_NAC",   "SOL_EN_DEMANDA"."ESTADO_CIVIL",   "SOL_EN_DEMANDA"."DOMICILIO_C", "SOL_EN_DEMANDA"."TOTAL_RENTA", "SOL_EN_DEMANDA"."FONO_C",   "SOL_EN_DEMANDA"."GRUPO_F",  "SOL_EN_DEMANDA"."RUT_TITULAR", "SOL_EN_DEMANDA"."TIPO_VIA", "SOL_EN_DEMANDA"."NUMERO_PARTICULAR", "SOL_EN_DEMANDA"."DEPTO_PARTICULAR",  "SOL_EN_DEMANDA"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   							  		:ls_pob,   							  	:ls_sector,   					  		:ls_comuna,   					  		:ls_ciudad,   					  		:ls_fono_p,   					  		:ldt_fec_nac,   							:ls_est_civil,   								:ls_dir_c,   							 	:ll_renta,   								:ls_fono_c,   							:ll_grupo_f,   					 	:ll_rut  	,								:ls_tipo_via,							:ls_nro_part,										:ls_depto_part,									:ls_block_part
												FROM 	"SOL_EN_DEMANDA",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_EN_DEMANDA"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_EN_DEMANDA"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_EN_DEMANDA"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_EN_DEMANDA"."CORRELATIVO" ) and  
														 ( ( "SOL_EN_DEMANDA"."BASE" = :gs_base ) AND  
														 ( "SOL_EN_DEMANDA"."SERIE" = :gs_serie ) AND  
														 ( "SOL_EN_DEMANDA"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_EN_DEMANDA"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;
											CASE "24" // bono fraterno
												SELECT	"SOL_BONO_FRATERNO"."DIRECCION_P",   "SOL_BONO_FRATERNO"."POBLACION",   "SOL_BONO_FRATERNO"."SECTOR",   "SOL_BONO_FRATERNO"."COMUNA",   "SOL_BONO_FRATERNO"."CIUDAD",   "SOL_BONO_FRATERNO"."FONO_P",   "SOL_BONO_FRATERNO"."FECHA_NAC",   "SOL_BONO_FRATERNO"."ESTADO_CIVIL",   "SOL_BONO_FRATERNO"."DOMICILIO_C",   "SOL_BONO_FRATERNO"."TOTAL_RENTA",   "SOL_BONO_FRATERNO"."FONO_C",   "SOL_BONO_FRATERNO"."GRUPO_F",   "SOL_BONO_FRATERNO"."RUT_TITULAR",   "SOL_BONO_FRATERNO"."TIPO_VIA",   "SOL_BONO_FRATERNO"."NUMERO_PARTICULAR",   "SOL_BONO_FRATERNO"."DEPTO_PARTICULAR",   "SOL_BONO_FRATERNO"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   					  :ldt_fec_nac,   						:ls_est_civil,   							:ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut  	,								:ls_tipo_via,							:ls_nro_part,										:ls_depto_part,								:ls_block_part
												FROM 	"SOL_BONO_FRATERNO",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_BONO_FRATERNO"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_BONO_FRATERNO"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_BONO_FRATERNO"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_BONO_FRATERNO"."CORRELATIVO" ) and  
														 ( ( "SOL_BONO_FRATERNO"."BASE" = :gs_base ) AND  
														 ( "SOL_BONO_FRATERNO"."SERIE" = :gs_serie ) AND  
														 ( "SOL_BONO_FRATERNO"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_BONO_FRATERNO"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;	
											CASE "25" // mantencion_perpeptua
												SELECT	"SOL_MANT_PERPETUA"."DIRECCION_P",   "SOL_MANT_PERPETUA"."POBLACION",   "SOL_MANT_PERPETUA"."SECTOR",   "SOL_MANT_PERPETUA"."COMUNA",   "SOL_MANT_PERPETUA"."CIUDAD",   "SOL_MANT_PERPETUA"."FONO_P",   "SOL_MANT_PERPETUA"."FECHA_NAC",   "SOL_MANT_PERPETUA"."ESTADO_CIVIL",   "SOL_MANT_PERPETUA"."DOMICILIO_C",   "SOL_MANT_PERPETUA"."TOTAL_RENTA",   "SOL_MANT_PERPETUA"."FONO_C",   "SOL_MANT_PERPETUA"."GRUPO_F",   "SOL_MANT_PERPETUA"."RUT_TITULAR",   "SOL_MANT_PERPETUA"."TIPO_VIA",   "SOL_MANT_PERPETUA"."NUMERO_PARTICULAR",   "SOL_MANT_PERPETUA"."DEPTO_PARTICULAR",   "SOL_MANT_PERPETUA"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   					  :ldt_fec_nac,   						:ls_est_civil,   							:ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut  	,								:ls_tipo_via,							:ls_nro_part,										:ls_depto_part,								:ls_block_part
												FROM 	"SOL_MANT_PERPETUA",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_MANT_PERPETUA"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_MANT_PERPETUA"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_MANT_PERPETUA"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_MANT_PERPETUA"."CORRELATIVO" ) and  
														 ( ( "SOL_MANT_PERPETUA"."BASE" = :gs_base ) AND  
														 ( "SOL_MANT_PERPETUA"."SERIE" = :gs_serie ) AND  
														 ( "SOL_MANT_PERPETUA"."NUMERO" = :gi_numero ) AND  
														 ( "SOL_MANT_PERPETUA"."CORRELATIVO" = :ll_corr ) AND  
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
												Using	sqlca;		
											
											CASE "26" // Titulo de Dominio
												SELECT	"SOL_TIT_DOMINIO_PARQUE"."DIRECCION_P",   "SOL_TIT_DOMINIO_PARQUE"."POBLACION",   "SOL_TIT_DOMINIO_PARQUE"."SECTOR",   "SOL_TIT_DOMINIO_PARQUE"."COMUNA",   "SOL_TIT_DOMINIO_PARQUE"."CIUDAD",   "SOL_TIT_DOMINIO_PARQUE"."FONO_P",   "SOL_TIT_DOMINIO_PARQUE"."FECHA_NAC",   "SOL_TIT_DOMINIO_PARQUE"."ESTADO_CIVIL",   "SOL_TIT_DOMINIO_PARQUE"."DOMICILIO_C",   "SOL_TIT_DOMINIO_PARQUE"."TOTAL_RENTA",   "SOL_TIT_DOMINIO_PARQUE"."FONO_C",   "SOL_TIT_DOMINIO_PARQUE"."GRUPO_F",   "SOL_TIT_DOMINIO_PARQUE"."RUT_TITULAR",   "SOL_TIT_DOMINIO_PARQUE"."TIPO_VIA",   "SOL_TIT_DOMINIO_PARQUE"."NUMERO_PARTICULAR",   "SOL_TIT_DOMINIO_PARQUE"."DEPTO_PARTICULAR",   "SOL_TIT_DOMINIO_PARQUE"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   								:ls_pob,   								 :ls_sector,   						:ls_comuna,   						:ls_ciudad,   						 :ls_fono_p,   					  :ldt_fec_nac,   						:ls_est_civil,   							 :ls_dir_c,   								 :ll_renta,   								 :ls_fono_c,   					  :ll_grupo_f,   						 :ll_rut  ,									 :ls_tipo_via,							 :ls_nro_part,										 :ls_depto_part,									:ls_block_part
												FROM 	"SOL_TIT_DOMINIO_PARQUE",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_TIT_DOMINIO_PARQUE"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_TIT_DOMINIO_PARQUE"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_TIT_DOMINIO_PARQUE"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TIT_DOMINIO_PARQUE"."CORRELATIVO" ) and 
														 ( ( "SOL_TIT_DOMINIO_PARQUE"."BASE" = :gs_base ) AND 
														 ( "SOL_TIT_DOMINIO_PARQUE"."SERIE" = :gs_serie ) AND 
														 ( "SOL_TIT_DOMINIO_PARQUE"."NUMERO" = :gi_numero ) AND 
														 ( "SOL_TIT_DOMINIO_PARQUE"."CORRELATIVO" = :ll_corr ) AND 
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) ) 
												Using	sqlca;
											
											CASE "27" // Compromiso de Pago
												SELECT	"SOL_COMPROMISO_PAGO"."DIRECCION_P",   "SOL_COMPROMISO_PAGO"."POBLACION",   "SOL_COMPROMISO_PAGO"."SECTOR",   "SOL_COMPROMISO_PAGO"."COMUNA",   "SOL_COMPROMISO_PAGO"."CIUDAD",   "SOL_COMPROMISO_PAGO"."FONO_P",   "SOL_COMPROMISO_PAGO"."FECHA_NAC",   "SOL_COMPROMISO_PAGO"."ESTADO_CIVIL",   "SOL_COMPROMISO_PAGO"."DOMICILIO_C",   "SOL_COMPROMISO_PAGO"."TOTAL_RENTA",   "SOL_COMPROMISO_PAGO"."FONO_C",   "SOL_COMPROMISO_PAGO"."GRUPO_F",   "SOL_COMPROMISO_PAGO"."RUT_TITULAR",   "SOL_COMPROMISO_PAGO"."TIPO_VIA",   "SOL_COMPROMISO_PAGO"."NUMERO_PARTICULAR",   "SOL_COMPROMISO_PAGO"."DEPTO_PARTICULAR",   "SOL_COMPROMISO_PAGO"."BLOCK_PARTICULAR"
												INTO 		:ls_dir_p,   								:ls_pob,   								 :ls_sector,   						:ls_comuna,   						:ls_ciudad,   						 :ls_fono_p,   					  :ldt_fec_nac,   						:ls_est_civil,   							 :ls_dir_c,   								 :ll_renta,   								 :ls_fono_c,   					  :ll_grupo_f,   						 :ll_rut  ,									 :ls_tipo_via,							 :ls_nro_part,										 :ls_depto_part,									:ls_block_part
												FROM 	"SOL_COMPROMISO_PAGO",   
															"SOL_ESTATUS"  
												WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_COMPROMISO_PAGO"."BASE" ) and  
														 ( "SOL_ESTATUS"."SERIE" = "SOL_COMPROMISO_PAGO"."SERIE" ) and  
														 ( "SOL_ESTATUS"."NUMERO" = "SOL_COMPROMISO_PAGO"."NUMERO" ) and  
														 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_COMPROMISO_PAGO"."CORRELATIVO" ) and 
														 ( ( "SOL_COMPROMISO_PAGO"."BASE" = :gs_base ) AND 
														 ( "SOL_COMPROMISO_PAGO"."SERIE" = :gs_serie ) AND 
														 ( "SOL_COMPROMISO_PAGO"."NUMERO" = :gi_numero ) AND 
														 ( "SOL_COMPROMISO_PAGO"."CORRELATIVO" = :ll_corr ) AND 
														 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) ) 
												Using	sqlca;
										END CHOOSE
										if sqlca.sqlcode=0 then
											UPDATE	"CLIENTE"  
											SET 		"DIRECCION_P" = :ls_dir_p,   
														"TIPO_VIA" = :ls_tipo_via,
														"NUMERO_PARTICULAR" = :ls_nro_part,
														"DEPTO_PARTICULAR" = :ls_depto_part,
														"BLOCK_PARTICULAR" = :ls_block_part,
														"POBLACION" = :ls_pob,   
														"SECTOR" = :ls_sector,   
														"COMUNA" = :ls_comuna,   
														"CIUDAD" = :ls_ciudad,   
														"FONO_P" = :ls_fono_p,   
														"FECHA_NAC" = :ldt_fec_nac,   
														"ESTA_CIVIL" = :ls_est_civil,   
														"DOMICILIO_C" = :ls_dir_c,   
														"FONO_C" = :ls_fono_c,   
														"TOTAL_RENT" = :ll_renta,   
														"GRUPO_F" = :ll_grupo_f
											WHERE 	"CLIENTE"."RUT" = :ll_rut   
											USING		sqlca  ;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										end if
									end if
								end if
								if ls_cod_sol<>"1" AND ls_cod_sol<>"2" then
									messagebox("Actualizar","Actualización Exitosa")
								end if
							else
								rollback;
							end if
						END IF
					end if
				else
					messagebox("Advertencia","Solicitud "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(ll_corr,"###,###,###,##0")+ ' está Aceptada')
				end if
			end if
		end if
	else
		messagebox("Advertencia","Ud. NO tiene permiso para Actualizar Solicitud")
	end if
end if
end event

