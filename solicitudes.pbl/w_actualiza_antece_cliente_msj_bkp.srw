forward
global type w_actualiza_antece_cliente_msj_bkp from window
end type
type cbx_actualiza_datos from checkbox within w_actualiza_antece_cliente_msj_bkp
end type
type cbx_no_info from checkbox within w_actualiza_antece_cliente_msj_bkp
end type
type cbx_datos_correctos from checkbox within w_actualiza_antece_cliente_msj_bkp
end type
type cb_guardar from commandbutton within w_actualiza_antece_cliente_msj_bkp
end type
type cb_cerrar from commandbutton within w_actualiza_antece_cliente_msj_bkp
end type
type dw_mod_antecedentes from datawindow within w_actualiza_antece_cliente_msj_bkp
end type
end forward

global type w_actualiza_antece_cliente_msj_bkp from window
integer width = 3447
integer height = 1236
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
cbx_actualiza_datos cbx_actualiza_datos
cbx_no_info cbx_no_info
cbx_datos_correctos cbx_datos_correctos
cb_guardar cb_guardar
cb_cerrar cb_cerrar
dw_mod_antecedentes dw_mod_antecedentes
end type
global w_actualiza_antece_cliente_msj_bkp w_actualiza_antece_cliente_msj_bkp

type variables
String		is_base,is_serie,is_estado,is_tipo_sol,is_mod_antec_cli= 'N' ,is_mod	= 'N',ls_no_act	= 'N',is_est_cob_original,is_glosa_cob_original,is_est_tele_orinial,&
			is_glosa_tele_original,is_estado_original,is_glosa_original,is_estado_nuevo,is_glosa_nuevo
Long		il_rut,il_tot_renta,il_grupo_f,il_sw=0,il_correlativo
double	il_numero
Date		id_fec_nac,idt_fecha_hoy
end variables

on w_actualiza_antece_cliente_msj_bkp.create
this.cbx_actualiza_datos=create cbx_actualiza_datos
this.cbx_no_info=create cbx_no_info
this.cbx_datos_correctos=create cbx_datos_correctos
this.cb_guardar=create cb_guardar
this.cb_cerrar=create cb_cerrar
this.dw_mod_antecedentes=create dw_mod_antecedentes
this.Control[]={this.cbx_actualiza_datos,&
this.cbx_no_info,&
this.cbx_datos_correctos,&
this.cb_guardar,&
this.cb_cerrar,&
this.dw_mod_antecedentes}
end on

on w_actualiza_antece_cliente_msj_bkp.destroy
destroy(this.cbx_actualiza_datos)
destroy(this.cbx_no_info)
destroy(this.cbx_datos_correctos)
destroy(this.cb_guardar)
destroy(this.cb_cerrar)
destroy(this.dw_mod_antecedentes)
end on

event open;String		ls_est_reg,ls_nombre,ls_a_pat,ls_a_mat,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_domi_c,ls_fono_c,&
			ls_dv,ls_est_cob,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_celular,ls_email,ls_descrip,ls_estado_cob,ls_string,ls_estado_inubi,&
			ls_glosa_inubi,ls_estado_tele_log,ls_estado_aten_log
Long		ll_sum_est, ll_est_ope, ll_est_inf,ll_tot_renta,ll_grupo_f,ll_estado_carta,ll_estado_cob,ll_new,ll_count_demanda=0
date		ldt_fecha_hoy,ldt_fec_nac,ld_max_fecha
datetime	ld_fecha_tele_log,ld_fecha_anten_log

gf_centrar(w_actualiza_antece_cliente_msj)

SELECT 	count("CADENA"."NUMERO")
INTO		:ll_count_demanda
FROM 	"CADENA"  
WHERE 	( "CADENA"."RUT" = :gi_rut ) AND  
			("CADENA"."ESTADO" = 'M' OR  
			"CADENA"."ESTADO" = 'B')   
USING	sqlca;

if ll_count_demanda > 0 then
	 close(w_actualiza_antece_cliente_msj)
elseif ll_count_demanda = 0 then 	
	is_base 				= 'W'
	is_serie				= 'W'
	il_numero			= gi_rut
	il_rut 					= gi_rut
	
	is_estado			= 'N'
	dw_mod_antecedentes.settransobject(sqlca)
	
	SELECT	"TELE_LOG"."ESTADO","TELE_LOG"."FECHA"
	INTO		:ls_estado_tele_log,:ld_fecha_tele_log
	FROM 	"TELE_LOG","CADENA"
	WHERE 	"TELE_LOG"."BASE" = "CADENA"."CODIGO" and  
				"TELE_LOG"."SERIE" = "CADENA"."SERIE" and  
				"TELE_LOG"."NUMERO" = "CADENA"."NUMERO" and  
				"TELE_LOG"."RUT" = :gi_rut and
				"TELE_LOG"."BASE" = :gs_base  and
				"TELE_LOG"."SERIE" = :gs_serie and
				"TELE_LOG"."NUMERO" = :gi_numero and
				"TELE_LOG"."FECHA" = (SELECT	MAX("TELE_LOG"."FECHA")
												FROM 	"TELE_LOG","CADENA"
												WHERE 	"TELE_LOG"."BASE" = "CADENA"."CODIGO" and  
															"TELE_LOG"."SERIE" = "CADENA"."SERIE" and  
															"TELE_LOG"."NUMERO" = "CADENA"."NUMERO" and  
															"TELE_LOG"."RUT" = :gi_rut and
															"TELE_LOG"."BASE" = :gs_base  and
															"TELE_LOG"."SERIE" = :gs_serie and
															"TELE_LOG"."NUMERO" = :gi_numero)
	Using sqlca;														
	
	SELECT	"ATENCION_LOG"."ESTADO","ATENCION_LOG"."FECHA"
	INTO		:ls_estado_aten_log,:ld_fecha_anten_log
	FROM 	"ATENCION_LOG","CADENA"
	WHERE 	"ATENCION_LOG"."BASE" = "CADENA"."CODIGO" and  
				"ATENCION_LOG"."SERIE" = "CADENA"."SERIE" and  
				"ATENCION_LOG"."NUMERO" = "CADENA"."NUMERO" and  
				"ATENCION_LOG"."RUT" = :gi_rut and
				"ATENCION_LOG"."BASE" = :gs_base  and
				"ATENCION_LOG"."SERIE" = :gs_serie and
				"ATENCION_LOG"."NUMERO" = :gi_numero and
				"ATENCION_LOG"."FECHA" = (SELECT	MAX("ATENCION_LOG"."FECHA")
												FROM 	"ATENCION_LOG","CADENA"
												WHERE 	"ATENCION_LOG"."BASE" = "CADENA"."CODIGO" and  
															"ATENCION_LOG"."SERIE" = "CADENA"."SERIE" and  
															"ATENCION_LOG"."NUMERO" = "CADENA"."NUMERO" and  
															"ATENCION_LOG"."RUT" = :gi_rut and
															"ATENCION_LOG"."BASE" = :gs_base  and
															"ATENCION_LOG"."SERIE" = :gs_serie and
															"ATENCION_LOG"."NUMERO" = :gi_numero)
	Using sqlca;	
	
	is_est_cob_original	= ls_estado_aten_log
	is_est_tele_orinial		= ls_estado_tele_log
	
	SELECT 	"ESTADO_ATENCION"."GLOSA_ESTADO"
	INTO		:is_glosa_cob_original
	FROM 	"ESTADO_ATENCION"  
	WHERE 	"ESTADO_ATENCION"."ESTADO_STRING" = :ls_estado_aten_log;
	
	SELECT 	"ESTADO_COBRANZA"."GLOSA_ESTADO"
	INTO		:is_glosa_tele_original
	FROM 	"ESTADO_COBRANZA"  
	WHERE 	"ESTADO_COBRANZA"."COD_ESTADO_STRING" = :ls_estado_tele_log;
	
	
	if ld_fecha_anten_log > ld_fecha_tele_log then
		//is_estado_original	= ls_estado_aten_log
		SELECT	"ESTADO_COBRANZA_INUBICABLES"."COD_ESTADO",   
					"ESTADO_COBRANZA_INUBICABLES"."GLOSA_ESTADO"
		INTO		:ls_estado_inubi,:ls_glosa_inubi		
		FROM		"ESTADO_COBRANZA_INUBICABLES"  
		WHERE	"ESTADO_COBRANZA_INUBICABLES"."ESTADO_REG" = 'A' and
					"ESTADO_COBRANZA_INUBICABLES"."DEPTO_ORIGEN" = 'A' and
					"ESTADO_COBRANZA_INUBICABLES"."COD_ESTADO" = :ls_estado_aten_log;
	elseif	ld_fecha_tele_log > ld_fecha_anten_log then
		//is_estado_original	= ls_estado_tele_log
		SELECT	"ESTADO_COBRANZA_INUBICABLES"."COD_ESTADO",   
					"ESTADO_COBRANZA_INUBICABLES"."GLOSA_ESTADO"
		INTO		:ls_estado_inubi,:ls_glosa_inubi		
		FROM		"ESTADO_COBRANZA_INUBICABLES"  
		WHERE	"ESTADO_COBRANZA_INUBICABLES"."ESTADO_REG" = 'A' and
					"ESTADO_COBRANZA_INUBICABLES"."DEPTO_ORIGEN" = 'C' and
					"ESTADO_COBRANZA_INUBICABLES"."COD_ESTADO" = :ls_estado_tele_log;
	else
	//	SELECT	"ESTADO_COBRANZA_INUBICABLES"."COD_ESTADO",   
	//				"ESTADO_COBRANZA_INUBICABLES"."GLOSA_ESTADO"
	//	INTO		:ls_estado_inubi,:ls_glosa_inubi		
	//	FROM		"ESTADO_COBRANZA_INUBICABLES"  
	//	WHERE	"ESTADO_COBRANZA_INUBICABLES"."ESTADO_REG" = 'A' and
	//				"ESTADO_COBRANZA_INUBICABLES"."COD_ESTADO" = :ls_estado_tele_log;
	end if
	
	if isnull(ls_estado_inubi) or ls_estado_inubi='' then
		//messagebox('Aviso','Confirmar Datos Cliente')
	else	
		dw_mod_antecedentes.Modify("DataWindow.Color = 255") // rojo
		cbx_datos_correctos.enabled	= false
		//messagebox('Advertencia','Cliente Inubicable, Favor de Actualizar Datos')
	end if
	
	//dw_mod_antecedentes.getchild('sol_mod_antece_ciudad_nueva',idw_detalle)
	//idw_detalle.settransobject(sqlca)
	//idw_detalle.insertrow(0)
	//dw_mod_antecedentes.getchild('sol_mod_antece_tipo_via_nueva',idw_detalle2)
	//idw_detalle2.settransobject(sqlca)
	//idw_detalle2.insertrow(0)
	
	dw_mod_antecedentes.getchild('sol_mod_antece_comuna_nueva',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	idw_detalle3.insertrow(0)
	
	SELECT 	MAX("SOL_MOD_ANTECE"."CORRELATIVO")
	INTO		:il_correlativo
	FROM 	"SOL_MOD_ANTECE"  
	WHERE 	"SOL_MOD_ANTECE"."RUT" = :il_rut 
	USing		sqlca;
	
	if il_correlativo = 0 or isnull(il_correlativo) then
		il_correlativo	= 1
	else 
		il_correlativo= il_correlativo+1
	end if	
	ldt_fecha_hoy		= date(gdt_fec_sistema)
	if il_rut > 0 then
		SELECT	"CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."CELULAR",	"CLIENTE"."EMAIL"
		INTO 		:ls_nombre,   			 :ls_a_pat,   				  :ls_a_mat,   				:ls_dir_p,   					:ls_pob,   					 :ls_sector,   		  :ls_comuna,   			:ls_ciudad,   			 :ls_fono_p,   		  :ldt_fec_nac,   			:ls_est_civil,   			  :ls_domi_c,   				  :ls_fono_c,   			:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,					:ls_celular,			:ls_email
		FROM 	"CLIENTE"  
		WHERE 	"CLIENTE"."RUT" = :il_rut   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if len(trim(ls_a_pat))>40 then
				ls_a_pat	= mid(trim(ls_a_pat),1,40)
			else
				if len(trim(ls_a_pat))=0 then ls_a_pat = '-'
			end if
			if len(trim(ls_a_mat))>40 then
				ls_a_mat	= mid(trim(ls_a_mat),1,40)
			else
				if len(trim(ls_a_mat))=0 then ls_a_mat = '-'
			end if
			if len(trim(ls_nombre))>40 then
				ls_nombre	= mid(trim(ls_nombre),1,40)
			else
				if len(trim(ls_nombre))=0 then ls_nombre = '-'
			end if
			if len(trim(ls_dv))>1 then
				ls_dv	= mid(trim(ls_dv),1,1)
			end if
			if len(trim(ls_dir_p))>60 then
				ls_dir_p	= mid(trim(ls_dir_p),1,60)
			else
				if len(trim(ls_dir_p))=0 then ls_dir_p = '-'
			end if
			if len(trim(ls_pob))>60 then
				ls_pob	= mid(trim(ls_pob),1,60)
			else
				if len(trim(ls_pob))=0 then ls_pob = '-'
			end if
			if len(trim(ls_sector))>60 then
				ls_sector= mid(trim(ls_sector),1,60)
			else
				if len(trim(ls_sector))=0 then ls_sector = '-'
			end if
			if len(trim(ls_comuna))>20 then
				ls_comuna	= mid(trim(ls_comuna),1,20)
			else
				if len(trim(ls_comuna))=0 then ls_comuna = '-'
			end if
			if len(trim(ls_ciudad))>15 then
				ls_ciudad	= mid(trim(ls_ciudad),1,15)
			else
				if len(trim(ls_ciudad))=0 then ls_ciudad = '-'
			end if
			if len(trim(ls_fono_p))>25 then
				ls_fono_p	= mid(trim(ls_fono_p),1,25)
			else
				if len(trim(ls_fono_p))=0 then ls_fono_p = '-'
			end if
			if len(trim(ls_domi_c))>60 then
				ls_domi_c	= mid(trim(ls_domi_c),1,60)
			else
				if len(trim(ls_domi_c))=0 then ls_domi_c = '-'
			end if
			if len(trim(ls_fono_c))>25 then
				ls_fono_c	= mid(trim(ls_fono_c),1,25)
			else
				if len(trim(ls_fono_c))=0 then ls_fono_c = '-'
			end if
			if len(trim(ls_celular))>25 then
				ls_celular	= mid(trim(ls_celular),1,25)
			else
				if len(trim(ls_celular))=0 then ls_celular = '-'
			end if
			if len(trim(ls_email))>300 then
				ls_email	= mid(trim(ls_email),1,300)
			else
				if len(trim(ls_email))=0 then ls_email = '-'
			end if
			if len(trim(ls_est_cob))>2 then
				ls_est_cob	= mid(trim(ls_est_cob),1,2)
			else
				if len(trim(ls_est_cob))=0 then ls_est_cob = '0'
			end if
			if len(trim(ls_est_civil))>1 then
				ls_est_civil= mid(trim(ls_est_civil),1,1)
			end if
			if len(trim(ls_tipo_via))=0 then ls_tipo_via = ''
			if len(trim(ls_nro_part))=0 then ls_nro_part = '-'
			if len(trim(ls_depto_part))=0 then ls_depto_part = '-'
			if len(trim(ls_block_part))=0 then ls_block_part = '-'
			//	if is_estado="N" then
			ll_new	= dw_mod_antecedentes.insertrow(0)
			dw_mod_antecedentes.scrolltorow(ll_new)
			dw_mod_antecedentes.setfocus()
			dw_mod_antecedentes.setitem(ll_new,'sw_ver',0)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_rut',gi_rut)
			dw_mod_antecedentes.setitem(ll_new,'sol_estatus_rut_cliente',gi_rut)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_dv',ls_dv)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_estatus_mod',1)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_nombres',ls_nombre)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_ap_paterno',ls_a_pat)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_ap_materno',ls_a_mat)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_usuario',gs_user)
			dw_mod_antecedentes.setitem(ll_new,'sol_estatus_correlativo',il_correlativo)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_correlativo',il_correlativo)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_fecha',date(string(gdt_fec_sistema,"dd/mm/yyyy")))
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_direcion_p_original',ls_dir_p)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_poblacion_original',ls_pob)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_sector_original',ls_sector)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_comuna_original',ls_comuna)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_ciudad_original',ls_ciudad)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_fono_p_original',ls_fono_p)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_celular_original',ls_celular)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_email_original',ls_email)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_fecha_nac_original',ldt_fec_nac)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_estado_civil_original',ls_est_civil)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_domicilio_c_original',ls_domi_c)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_fono_c_original',ls_fono_c)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_total_renta_original',ll_tot_renta)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_grupo_f_original',ll_grupo_f)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_estado_cob_original',ls_est_cob)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_nombre_original',ls_nombre)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_ap_paterno_original',ls_a_pat)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_ap_materno_original',ls_a_mat)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_tipo_via_original',ls_tipo_via)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_numero_particular_origina',ls_nro_part)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_depto_original',ls_depto_part)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_block_original',ls_block_part)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_direccion_p_nueva',ls_dir_p)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_poblacion_nueva',ls_pob)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_sector_nueva',ls_sector)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_comuna_nueva',ls_comuna)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_ciudad_nueva',ls_ciudad)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_fono_p_nueva',ls_fono_p)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_celular_nueva',ls_celular)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_email_nueva',ls_email)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_fecha_nac_nueva',ldt_fec_nac)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_estado_civil_nueva',ls_est_civil)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_domicilio_c_nueva',ls_domi_c)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_fono_c_nueva',ls_fono_c)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_total_renta_nueva',ll_tot_renta)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_grupo_f_nueva',ll_grupo_f)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_estado_cob_nueva',ls_est_cob)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_nombre_nueva',ls_nombre)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_ap_paterno_nueva',ls_a_pat)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_ap_materno_nueva',ls_a_mat)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_tipo_via_nueva',ls_tipo_via)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_numero_particular_nueva',ls_nro_part)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_depto_nueva',ls_depto_part)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_block_nueva',ls_block_part)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_usuario_opera',gs_user)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_fecha_opera',ldt_fecha_hoy)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_estatus_operaciones',1)
			dw_mod_antecedentes.setitem(ll_new,'sol_mod_antece_estatus_informatica',1)
			dw_mod_antecedentes.accepttext()
			
			ls_ciudad			= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_ciudad_nueva')
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle3.retrieve(ls_ciudad)
			end if
			dw_mod_antecedentes.accepttext()
	//		ls_tipo_via		= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_tipo_via_nueva')
	//		if not isnull(ls_tipo_via) and ls_tipo_via<>'' then
	//			idw_detalle2.retrieve(ls_tipo_via)
	//		end if			
	//		ls_comuna		=  dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_comuna_nueva')
	//		if not isnull(ls_comuna) and ls_comuna<>'' then
	//			idw_detalle3.retrieve(ls_ciudad)
	//		end if
			SELECT	"ENCARGADOS"."NOMBRE"  
			INTO 		:gs_nom_comp_usuario  
			FROM 		"ENCARGADOS"  
			WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
			Using		sqlca;
			if sqlca.sqlcode=0 then
				ls_string	= 'Solicitud en Tramite, realizada el: '+string(idt_fecha_hoy,"dd/mm/yyyy")+' por '+gs_nom_comp_usuario
				dw_mod_antecedentes.setitem(ll_new,'sol_estatus_observacion',ls_string)
			end if
		end if	
		dw_mod_antecedentes.accepttext()
		dw_mod_antecedentes.setfocus()
	end if
	dw_mod_antecedentes.accepttext()
	dw_mod_antecedentes.setfocus()
end if	
end event

type cbx_actualiza_datos from checkbox within w_actualiza_antece_cliente_msj_bkp
integer x = 32
integer y = 56
integer width = 704
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Cliente Actualiza Datos"
boolean checked = true
end type

event clicked;if cbx_actualiza_datos.checked = true then
	cbx_no_info.checked				= false
	cbx_datos_correctos.checked	= false
	cb_guardar.text					= 'Guardar'
	dw_mod_antecedentes.enabled	= True
	cb_cerrar.enabled					= true
elseif cbx_actualiza_datos.checked = false and cbx_datos_correctos.checked = false and cbx_no_info.checked = false then
	cbx_actualiza_datos.checked = true
end if
//if cbx_datos_correctos.checked = false then
//	cbx_no_info.checked				= false
//	cbx_datos_correctos.checked	= false
//	cb_guardar.enabled				= true
//else
//	cb_guardar.enabled				= false
//end if	
end event

type cbx_no_info from checkbox within w_actualiza_antece_cliente_msj_bkp
integer x = 1554
integer y = 56
integer width = 891
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Cliente no Entrega Información"
end type

event clicked;if cbx_no_info.checked = true then
	cbx_datos_correctos.checked	= false
	cbx_actualiza_datos.checked	= false
	cb_guardar.text					= 'Actualizar'
	dw_mod_antecedentes.enabled	= False
	cb_cerrar.enabled					= false
elseif cbx_actualiza_datos.checked = false and cbx_datos_correctos.checked = false and cbx_no_info.checked = false then
	cbx_no_info.checked 				= true
end if		
//if cbx_no_info.checked = false then
////	cbx_no_info.checked				= true
//	cb_guardar.enabled				= false
//else
//	//cbx_no_info.checked				= false
//	cb_guardar.enabled				= false
//end if	
end event

type cbx_datos_correctos from checkbox within w_actualiza_antece_cliente_msj_bkp
integer x = 800
integer y = 56
integer width = 699
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos estan correctos"
end type

event clicked;if cbx_datos_correctos.checked = true then
	cbx_no_info.checked					= false
	cbx_actualiza_datos.checked		= false
	cb_guardar.text						= 'Actualizar'
	dw_mod_antecedentes.enabled	= False
	cb_cerrar.enabled						= false
elseif cbx_actualiza_datos.checked = false and cbx_datos_correctos.checked = false and cbx_no_info.checked = false then
	cbx_datos_correctos.checked 		= true
end if	
//if cbx_datos_correctos.checked = false then
//	cbx_datos_correctos.checked	= true
//	cb_guardar.enabled				= true
//else
//	//cbx_datos_correctos.checked	= false
//	cb_guardar.enabled				= false
//end if	
end event

type cb_guardar from commandbutton within w_actualiza_antece_cliente_msj_bkp
integer x = 32
integer y = 996
integer width = 315
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Guardar"
end type

event clicked;string	ls_dir_p,ls_comuna,ls_ciudad,ls_nombre,ls_a_pat,ls_a_mat,ls_tipo_via,ls_nro_part,ls_pasa,ls_string,ls_base_aux,&
		ls_est_cob,ls_pob,ls_sector,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_depto_part,ls_block_part,ls_celular,ls_email,ls_ap_pat,ls_ap_mat,&
		ls_dir_p_c,ls_pob_c,ls_sector_c,ls_comuna_c,ls_ciudad_c,ls_fono_p_c,ls_nro_p_c,ls_depto_p_c,ls_block_p_c,ls_tipo_via_p_c,ls_estado_cobranza_c,&
		ls_descrip_ciudad,ls_descrip_comuna,ls_descrip_tipo_via,ls_dir_1,ls_dir_2,ls_celular_c,ls_estado_tele,ls_glosa_tele,ls_estado_atencion,ls_glosa_atencion
long	ll_sw=0,ll_est_cob,ll_renta,ll_grupo_f
date	ld_fecha
datetime	ldt_fecha_nac,ldt_fec_nac,ldt_fec_prox_llamado_c,ldt_fecha_hoy

ldt_fecha_hoy	= gdt_fec_sistema
is_tipo_sol	= '12'
if cbx_datos_correctos.checked= true then
	cb_cerrar.triggerevent(clicked!)
elseif cbx_no_info.checked = true then
	cb_cerrar.triggerevent(clicked!)
elseif cbx_actualiza_datos.checked = true then
	if is_mod	= 'S' then
		is_mod_antec_cli	= 'S'
	end if
	if is_mod_antec_cli = 'S' then
		dw_mod_antecedentes.setitem(1,'sol_mod_antece_estatus_operaciones',0) // autorizar de inmediato
		dw_mod_antecedentes.setitem(1,'sol_mod_antece_estatus_mod',0)//autorizar de inmediato
		dw_mod_antecedentes.setitem(1,'sol_mod_antece_estatus_informatica',0) //autorizar de inmediato
		dw_mod_antecedentes.setitem(1,'sol_mod_antece_usuario_opera',gs_user)
		dw_mod_antecedentes.setitem(1,'sol_mod_antece_fecha_opera',idt_fecha_hoy)
		dw_mod_antecedentes.setitem(1,'sol_mod_antece_usuario_infor',gs_user)
		dw_mod_antecedentes.setitem(1,'sol_mod_antece_fecha_infor',idt_fecha_hoy)
		dw_mod_antecedentes.setitem(1,'sol_mod_antece_mod_antece_mensaje',is_mod_antec_cli)
		//dw_reporte.setitem(1,'sol_mod_antece_correlativo',il_correlativo)
		dw_mod_antecedentes.setitem(1,'sol_mod_antece_rut',il_numero)
		dw_mod_antecedentes.accepttext()
		ldt_fecha_nac	= dw_mod_antecedentes.getitemdatetime(1,"sol_mod_antece_fecha_nac_nueva")
		ls_dir_p			= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_direccion_p_nueva')
		ls_comuna		= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_comuna_nueva')
		ls_ciudad			= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_ciudad_nueva')
		ls_nombre		= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_nombre_nueva')
		ls_ap_pat		= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_ap_paterno_nueva')
		ls_ap_mat		= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_ap_materno_nueva')
		ls_tipo_via		= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_tipo_via_nueva')
		ls_nro_part		= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_numero_particular_nueva')
		ls_pob			= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_poblacion_nueva')
		ls_sector			= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_sector_nueva')
		ls_fono_p		= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_fono_p_nueva')
		ls_est_civil		= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_estado_civil_nueva')
		ls_dir_c			= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_domicilio_c_original')
		ls_fono_c		= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_fono_c_original')
		ll_renta			= dw_mod_antecedentes.getitemnumber(1,'sol_mod_antece_total_renta_nueva')
		ll_grupo_f		= dw_mod_antecedentes.getitemnumber(1,'sol_mod_antece_grupo_f_nueva')
		ls_depto_part	= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_depto_nueva')
		ls_block_part	= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_block_nueva')
		ls_celular		= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_celular_nueva')
		ls_email			= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_email_nueva')
		
		if isnull(ls_dir_p) or isnull(ls_comuna) or isnull(ls_ciudad) or isnull(ls_tipo_via) or &
			isnull(ls_nro_part) or isnull(ldt_fecha_nac) or date(ldt_fecha_nac)=date("00/00/0000") then ll_sw	= 1
		dw_mod_antecedentes.setitem(1,'sol_mod_antece_rut',gi_rut)
		dw_mod_antecedentes.setitem(1,'sol_estatus_rut_cliente',gi_rut)
		
		//if ls_pasa='S' then
			if ll_sw=0 then
				if dw_mod_antecedentes.update() = 1 then
					commit;
				//	il_sw_print	= 0
					if is_estado="N" then
						ld_fecha			= date(dw_mod_antecedentes.getitemdatetime(1,'sol_mod_antece_fecha'))
						ls_string			= 'Se Genera Solicitud y Actualiza Antecedentes del Cliente, realizada el: '+string(ld_fecha,"dd/mm/yyyy")+' por '+gs_nom_comp_usuario
						SELECT	"SOL_ESTATUS"."BASE"  
						INTO 		:ls_base_aux  
						FROM 		"SOL_ESTATUS"  
						WHERE  ( "SOL_ESTATUS"."NUMERO" = :gi_rut ) AND  
								 ( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND
								 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							UPDATE	"SOL_ESTATUS"  
							SET 		"BASE" = :is_base,   
										"SERIE" = :is_serie,   
										"NUMERO" = :il_numero,   
										"CORRELATIVO" = :il_correlativo,   
										"CODIGO_SOLICITUD" = :is_tipo_sol,   
										"OBSERVACION" = :ls_string,   
										"ESTADO_REG" = 'A',   
										"RUT_CLIENTE" = :gi_rut  
							WHERE  ( "SOL_ESTATUS"."NUMERO" = :gi_rut ) AND  
									 ( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
								/// Nuevo
								ls_est_cob	= '0'
								ll_est_cob	= 0
								SELECT	"SOL_MOD_ANTECE"."DIRECCION_P_NUEVA",   "SOL_MOD_ANTECE"."POBLACION_NUEVA",   "SOL_MOD_ANTECE"."SECTOR_NUEVA",   "SOL_MOD_ANTECE"."COMUNA_NUEVA",   "SOL_MOD_ANTECE"."CIUDAD_NUEVA",   "SOL_MOD_ANTECE"."FONO_P_NUEVA",   "SOL_MOD_ANTECE"."FECHA_NAC_NUEVA",   "SOL_MOD_ANTECE"."ESTADO_CIVIL_NUEVA",   "SOL_MOD_ANTECE"."DOMICILIO_C_NUEVA",   "SOL_MOD_ANTECE"."FONO_C_NUEVA",   "SOL_MOD_ANTECE"."TOTAL_RENTA_NUEVA",   "SOL_MOD_ANTECE"."GRUPO_F_NUEVA",   "SOL_MOD_ANTECE"."ESTADO_COB_NUEVA",   "SOL_MOD_ANTECE"."NOMBRE_NUEVA",   "SOL_MOD_ANTECE"."AP_PATERNO_NUEVA",   "SOL_MOD_ANTECE"."AP_MATERNO_NUEVA",   "SOL_MOD_ANTECE"."TIPO_VIA_NUEVA",   "SOL_MOD_ANTECE"."NUMERO_PARTICULAR_NUEVA",   "SOL_MOD_ANTECE"."DEPTO_NUEVA",   "SOL_MOD_ANTECE"."BLOCK_NUEVA",	"SOL_MOD_ANTECE"."CELULAR_NUEVA",	"SOL_MOD_ANTECE"."EMAIL_NUEVA"
								INTO 		:ls_dir_p,   									:ls_pob,   										:ls_sector,   								:ls_comuna,   							 :ls_ciudad,   							:ls_fono_p,   								:ldt_fec_nac,   							 :ls_est_civil,   								:ls_dir_c,   									 :ls_fono_c,   							:ll_renta,   									 :ll_grupo_f,   							 :ls_est_cob,   								 :ls_nombre,   							:ls_ap_pat,   									:ls_ap_mat,										:ls_tipo_via,								 :ls_nro_part,											  :ls_depto_part,							:ls_block_part,						:ls_celular,								:ls_email
								FROM 		"SOL_MOD_ANTECE"  
								WHERE 	"SOL_MOD_ANTECE"."RUT" = :gi_rut  and 
											"SOL_MOD_ANTECE"."CORRELATIVO" = :il_correlativo
								USING		sqlca;
								if sqlca.sqlcode=0 then
									SELECT	"CLIENTE"."DIRECCION_P",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."FECHA_PROX_LLAMADO"
									INTO 		:ls_dir_p_c, 					:ls_pob_c,					:ls_sector_c,			:ls_comuna_c,			:ls_ciudad_c,			:ls_fono_p_c,			:ls_nro_p_c,							:ls_depto_p_c,						:ls_block_p_c,						:ls_tipo_via_p_c,			:ls_estado_cobranza_c,			:ldt_fec_prox_llamado_c
									FROM 		"CLIENTE"  
									WHERE 	"CLIENTE"."RUT" = :gi_rut
									USING		sqlca;
									if sqlca.sqlcode=0 then
										if ls_dir_p_c<>ls_dir_p or ls_sector_c<>ls_sector or ls_pob_c<>ls_pob or ls_fono_p_c<>ls_fono_p or not isnull(ls_email) or &
											ls_comuna_c<>ls_comuna or ls_ciudad_c<>ls_ciudad or ls_nro_p_c<>ls_nro_part or not isnull(ls_fono_c) or &
											ls_depto_p_c<>ls_depto_part or ls_block_p_c<>ls_block_part or ls_tipo_via_p_c<>ls_tipo_via or not isnull(ls_celular) then
											
											UPDATE	"CADENA"  
											SET 		"ESTADO_CARTA" = 0
											WHERE  ( "CADENA"."RUT" = :il_numero ) AND  
													 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C' )
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										end if
									end if
									if ls_fono_p_c<>ls_fono_p then
										ldt_fec_prox_llamado_c	= ldt_fecha_hoy
									end if
									//------									
									ls_estado_tele			= '40'
									ls_estado_atencion	= '9'
											
									SELECT 	"ESTADO_ATENCION"."GLOSA_ESTADO"
									INTO		:ls_glosa_atencion
									FROM 	"ESTADO_ATENCION"  
									WHERE 	"ESTADO_ATENCION"."ESTADO_STRING" = :ls_estado_atencion;
									
									SELECT 	"ESTADO_COBRANZA"."GLOSA_ESTADO"
									INTO		:ls_glosa_tele
									FROM 	"ESTADO_COBRANZA"  
									WHERE 	"ESTADO_COBRANZA"."COD_ESTADO_STRING" = :ls_estado_tele;
									
									is_glosa_nuevo			= ls_glosa_atencion
									is_estado_nuevo		= ls_estado_atencion
									//-------								
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
												"CELULAR" = :ls_celular,
												"EMAIL" = :ls_email,
												"FECHA_NAC" = :ldt_fec_nac,   
												"ESTA_CIVIL" = :ls_est_civil,   
												"DOMICILIO_C" = :ls_dir_c,   
												"FONO_C" = :ls_fono_c,   
												"TOTAL_RENT" = :ll_renta,   
												"GRUPO_F" = :ll_grupo_f,   
												"TIPO" = 'I',
									//			"ESTADO_COBRANZA" = '0',
												"FECHA_PROX_LLAMADO" = :ldt_fec_prox_llamado_c,
												"ESTADO_COBRANZA" = :ls_estado_tele,   
												"FECHA_COBRANZA" = :gdt_fec_sistema,   
												"GLOSA_COBRANZA" = :ls_glosa_tele ,
												"ULT_ESTADO_PUB" = :ls_estado_atencion,   
												"ULT_GLOSA_PUB"= :ls_glosa_atencion,   
												"ULT_FECHA_PUB"= :gdt_fec_sistema ,   
												"LAT_GEO" = 0,
												"LON_GEO" = 0,
												"STATUS_GEO" = 0
									WHERE 	"CLIENTE"."RUT" = :gi_rut   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
										UPDATE	"CAJA_ACTUALIZA_FONO"  
										SET 		"FONO_ACTUAL" = :ls_fono_p,   
													"FONO_NUEVO" = :ls_fono_p,   
													"FONO_COMERCIAL_ACTUAL" = :ls_fono_c,   
													"FONO_COMERCIAL_NUEVO" = :ls_fono_c,   
													"CELULAR_ACTUAL" = :ls_celular,   
													"CELULAR_NUEVO" = :ls_celular  
										WHERE 	"CAJA_ACTUALIZA_FONO"."RUT" = :gi_rut   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
		
		//								if isvalid(w_ingreso_solicitudes) then
		//									w_ingreso_solicitudes.st_nombre.text							= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
		//								end if
		//								if isvalid(w_detalle_solicitudes) then
		//									if w_detalle_solicitudes.dw_reporte.dataobject = 'dw_lista_solicitudes_mod_antece_cliente' then
		//										w_detalle_solicitudes.dw_reporte.object.t_nombre.text	= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
		//									end if
		//								end if
										SELECT 	"CIUDAD"."CIUDAD",   
													"COMUNA"."COMUNA"  
										INTO 		:ls_descrip_ciudad,   
													:ls_descrip_comuna  
										FROM 		"CIUDAD",   
													"COMUNA"  
										WHERE  ( "CIUDAD"."CODIGO_CIUDAD" = "COMUNA"."CODIGO_CIUDAD" ) and  
												 (("COMUNA"."CODIGO_CIUDAD" = :ls_ciudad ) AND  
												 ( "COMUNA"."CODIGO_COMUNA" = :ls_comuna ) )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											SELECT	"TIPO_VIA"."DESCRIPCION"  
											INTO 		:ls_descrip_tipo_via  
											FROM 		"TIPO_VIA"  
											WHERE 	"TIPO_VIA"."TIPO_VIA" = :ls_tipo_via   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												ls_dir_1	= ls_descrip_tipo_via+' '+ls_dir_p+' Nº: '+ls_nro_part+' D/:'+ls_depto_part+' B/:'+ls_block_part+', '+ls_pob
												ls_dir_2	= ls_descrip_comuna+', '+ls_descrip_ciudad
												UPDATE	"GESTION_CARTA"  
												SET 		"DIRECCION_1" = :ls_dir_1,   
															"DIRECCION_2" = :ls_dir_2  
												WHERE 	"GESTION_CARTA"."RUT" = :gi_rut
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											end if
										end if
										//-- inicio modificacion grabar teblas log atencion y telelog--//
										
//										ls_estado_tele			= '40'
//										ls_estado_atencion	= '9'
//										
//										
//										SELECT 	"ESTADO_ATENCION"."GLOSA_ESTADO"
//										INTO		:ls_glosa_atencion
//										FROM 	"ESTADO_ATENCION"  
//										WHERE 	"ESTADO_ATENCION"."ESTADO_STRING" = :ls_estado_atencion;

//										SELECT 	"ESTADO_COBRANZA"."GLOSA_ESTADO"
//										INTO		:ls_glosa_tele
//										FROM 	"ESTADO_COBRANZA"  
//										WHERE 	"ESTADO_COBRANZA"."COD_ESTADO_STRING" = :ls_estado_tele;

										
										INSERT INTO "TELE_LOG"  
													( "RUT"  ,"ESTADO"  ,"FECHA"   			,"GLOSA"    ,"USUARIO"  ,"BASE"  ,"SERIE"  ,"NUMERO" )  
										VALUES	( :gi_rut,:ls_estado_tele,:gdt_fec_sistema ,:ls_glosa_tele,:gs_user	  ,:gs_base,:gs_serie,:gi_numero)  ;
										if sqlca.sqlcode = 0 then
											commit;
										else
											rollback;
										end if
										
										INSERT INTO "ATENCION_LOG"
													( "RUT"  ,"ESTADO"  ,"FECHA"   			,"GLOSA"    ,"USUARIO"  ,"BASE"  ,"SERIE"  ,"NUMERO" )  
										VALUES	( :gi_rut,:ls_estado_atencion,:gdt_fec_sistema ,:ls_glosa_atencion,:gs_user	  ,:gs_base,:gs_serie,:gi_numero)  ;
										if sqlca.sqlcode = 0 then
											commit;
										else
											rollback;
										end if
//										
										//--modificacion fin//
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
										WHERE 	"CLIENTE_DEUDOR_TERCERO"."RUT" = :gi_rut   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
											//messagebox("Aviso","Grabacion Exitosa")
											cb_cerrar.triggerevent(Clicked!)
										else
											rollback;
										end if
									else
										rollback;
										messagebox("Error Grabar","Error al Grabar Cliente SQL: "+sqlca.sqlerrtext)
									end if
								end if
								// Fin Nuevo
							else
								rollback;
							end if
						elseif sqlca.sqlcode=100 then
							INSERT INTO	"SOL_ESTATUS"  
										( "BASE",   "SERIE",   "NUMERO",   "CORRELATIVO",   "CODIGO_SOLICITUD",   "ESTADO_REG",	"OBSERVACION", "RUT_CLIENTE" )  
							VALUES 	( :is_base, :is_serie, :il_numero, :il_correlativo, :is_tipo_sol,   		  'A',				:ls_string,	   :gi_rut )  
							Using		sqlca;
							if sqlca.sqlcode=0 then
								commit;
								/// Nuevo
								ls_est_cob	= '0'
								ll_est_cob	= 0
								SELECT	"SOL_MOD_ANTECE"."DIRECCION_P_NUEVA",   "SOL_MOD_ANTECE"."POBLACION_NUEVA",   "SOL_MOD_ANTECE"."SECTOR_NUEVA",   "SOL_MOD_ANTECE"."COMUNA_NUEVA",   "SOL_MOD_ANTECE"."CIUDAD_NUEVA",   "SOL_MOD_ANTECE"."FONO_P_NUEVA",   "SOL_MOD_ANTECE"."FECHA_NAC_NUEVA",   "SOL_MOD_ANTECE"."ESTADO_CIVIL_NUEVA",   "SOL_MOD_ANTECE"."DOMICILIO_C_NUEVA",   "SOL_MOD_ANTECE"."FONO_C_NUEVA",   "SOL_MOD_ANTECE"."TOTAL_RENTA_NUEVA",   "SOL_MOD_ANTECE"."GRUPO_F_NUEVA",   "SOL_MOD_ANTECE"."ESTADO_COB_NUEVA",   "SOL_MOD_ANTECE"."NOMBRE_NUEVA",   "SOL_MOD_ANTECE"."AP_PATERNO_NUEVA",   "SOL_MOD_ANTECE"."AP_MATERNO_NUEVA",   "SOL_MOD_ANTECE"."TIPO_VIA_NUEVA",   "SOL_MOD_ANTECE"."NUMERO_PARTICULAR_NUEVA",   "SOL_MOD_ANTECE"."DEPTO_NUEVA",   "SOL_MOD_ANTECE"."BLOCK_NUEVA",	"SOL_MOD_ANTECE"."CELULAR_NUEVA",	"SOL_MOD_ANTECE"."EMAIL_NUEVA"
								INTO 		:ls_dir_p,   									:ls_pob,   										:ls_sector,   								:ls_comuna,   							 :ls_ciudad,   							:ls_fono_p,   								:ldt_fec_nac,   							 :ls_est_civil,   								:ls_dir_c,   									 :ls_fono_c,   							:ll_renta,   									 :ll_grupo_f,   							 :ls_est_cob,   								 :ls_nombre,   							:ls_ap_pat,   									:ls_ap_mat,										:ls_tipo_via,								 :ls_nro_part,											  :ls_depto_part,							:ls_block_part,						:ls_celular,								:ls_email
								FROM 		"SOL_MOD_ANTECE"  
								WHERE 	"SOL_MOD_ANTECE"."RUT" = :gi_rut  and 
											"SOL_MOD_ANTECE"."CORRELATIVO" = :il_correlativo
								USING		sqlca;
								if sqlca.sqlcode=0 then
									SELECT	"CLIENTE"."DIRECCION_P",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."FECHA_PROX_LLAMADO",	"CLIENTE"."CELULAR"  
									INTO 		:ls_dir_p_c, 					:ls_pob_c,					:ls_sector_c,			:ls_comuna_c,			:ls_ciudad_c,			:ls_fono_p_c,			:ls_nro_p_c,							:ls_depto_p_c,						:ls_block_p_c,						:ls_tipo_via_p_c,			:ls_estado_cobranza_c,			:ldt_fec_prox_llamado_c,			:ls_celular_c
									FROM 		"CLIENTE"  
									WHERE 	"CLIENTE"."RUT" = :gi_rut
									USING		sqlca;
									if sqlca.sqlcode=0 then
										if ls_dir_p_c<>ls_dir_p or ls_sector_c<>ls_sector or ls_pob_c<>ls_pob or &
											ls_comuna_c<>ls_comuna or ls_ciudad_c<>ls_ciudad or ls_nro_p_c<>ls_nro_part or &
											ls_depto_p_c<>ls_depto_part or ls_block_p_c<>ls_block_part or ls_tipo_via_p_c<>ls_tipo_via then
											
											UPDATE	"CADENA"  
											SET 		"ESTADO_CARTA" = 0
											WHERE  ( "CADENA"."RUT" = :gi_rut ) AND  
													 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C' )
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										end if
									end if
									if ls_fono_p_c<>ls_fono_p then
										//ldt_fec_prox_llamado_c	= ldt_fecha_hoy
										UPDATE	"CLIENTE"  
										SET 		"ESTADO_COBRANZA" = '0',
													"FECHA_PROX_LLAMADO" = :ldt_fec_prox_llamado_c
										WHERE 	"CLIENTE"."RUT" = :gi_rut   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if
									//------									
									ls_estado_tele			= '40'
									ls_estado_atencion	= '9'
											
									SELECT 	"ESTADO_ATENCION"."GLOSA_ESTADO"
									INTO		:ls_glosa_atencion
									FROM 	"ESTADO_ATENCION"  
									WHERE 	"ESTADO_ATENCION"."ESTADO_STRING" = :ls_estado_atencion;
									
									SELECT 	"ESTADO_COBRANZA"."GLOSA_ESTADO"
									INTO		:ls_glosa_tele
									FROM 	"ESTADO_COBRANZA"  
									WHERE 	"ESTADO_COBRANZA"."COD_ESTADO_STRING" = :ls_estado_tele;
									
									is_glosa_nuevo			= ls_glosa_atencion
									is_estado_nuevo		= ls_estado_atencion
									//-------								
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
												"CELULAR" = :ls_celular,
												"EMAIL" = :ls_email,
												"FECHA_NAC" = :ldt_fec_nac,
												"ESTA_CIVIL" = :ls_est_civil,
												"DOMICILIO_C" = :ls_dir_c,
												"FONO_C" = :ls_fono_c,
												"TOTAL_RENT" = :ll_renta,
												"GRUPO_F" = :ll_grupo_f,   
												"TIPO" = 'I',
												"ESTADO_COBRANZA" = :ls_estado_tele,   
												"FECHA_COBRANZA" = :gdt_fec_sistema,   
												"GLOSA_COBRANZA" = :ls_glosa_tele ,
												"ULT_ESTADO_PUB" = :ls_estado_atencion,   
												"ULT_GLOSA_PUB"= :ls_glosa_atencion,   
												"ULT_FECHA_PUB"= :gdt_fec_sistema ,  
												"LAT_GEO" = 0,
												"LON_GEO" = 0,
												"STATUS_GEO" = 0
									WHERE 	"CLIENTE"."RUT" = :gi_rut   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
										UPDATE	"CAJA_ACTUALIZA_FONO"  
										SET 		"FONO_ACTUAL" = :ls_fono_p,   
													"FONO_NUEVO" = :ls_fono_p,   
													"FONO_COMERCIAL_ACTUAL" = :ls_fono_c,   
													"FONO_COMERCIAL_NUEVO" = :ls_fono_c,   
													"CELULAR_ACTUAL" = :ls_celular,   
													"CELULAR_NUEVO" = :ls_celular  
										WHERE 	"CAJA_ACTUALIZA_FONO"."RUT" = :gi_rut   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
										if isvalid(w_ingreso_solicitudes) then
											w_ingreso_solicitudes.st_nombre.text							= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
										end if
										if isvalid(w_detalle_solicitudes) then
											if w_detalle_solicitudes.dw_reporte.dataobject = 'dw_lista_solicitudes_mod_antece_cliente' then
												w_detalle_solicitudes.dw_reporte.object.t_nombre.text	= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
											end if
										end if
										SELECT 	"CIUDAD"."CIUDAD",   
													"COMUNA"."COMUNA"  
										INTO 		:ls_descrip_ciudad,   
													:ls_descrip_comuna  
										FROM 		"CIUDAD",   
													"COMUNA"  
										WHERE  ( "CIUDAD"."CODIGO_CIUDAD" = "COMUNA"."CODIGO_CIUDAD" ) and  
												 (("COMUNA"."CODIGO_CIUDAD" = :ls_ciudad ) AND  
												 ( "COMUNA"."CODIGO_COMUNA" = :ls_comuna ) )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											SELECT	"TIPO_VIA"."DESCRIPCION"  
											INTO 		:ls_descrip_tipo_via  
											FROM 		"TIPO_VIA"  
											WHERE 	"TIPO_VIA"."TIPO_VIA" = :ls_tipo_via   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												ls_dir_1	= ls_descrip_tipo_via+' '+ls_dir_p+' Nº: '+ls_nro_part+' D/:'+ls_depto_part+' B/:'+ls_block_part+', '+ls_pob
												ls_dir_2	= ls_descrip_comuna+', '+ls_descrip_ciudad
												UPDATE	"GESTION_CARTA"  
												SET 		"DIRECCION_1" = :ls_dir_1,   
															"DIRECCION_2" = :ls_dir_2  
												WHERE 	"GESTION_CARTA"."RUT" = :gi_rut
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											end if
										end if
										//-- inicio modificacion grabar teblas log atencion y telelog--//	
										ls_estado_tele			= '40'
										ls_estado_atencion	= '9'
										
										
										SELECT 	"ESTADO_ATENCION"."GLOSA_ESTADO"
										INTO		:ls_glosa_atencion
										FROM 	"ESTADO_ATENCION"  
										WHERE 	"ESTADO_ATENCION"."ESTADO_STRING" = :ls_estado_atencion;
										
										SELECT 	"ESTADO_COBRANZA"."GLOSA_ESTADO"
										INTO		:ls_glosa_tele
										FROM 	"ESTADO_COBRANZA"  
										WHERE 	"ESTADO_COBRANZA"."COD_ESTADO_STRING" = :ls_estado_tele;

										
										INSERT INTO "TELE_LOG"  
													( "RUT"  ,"ESTADO"  ,"FECHA"   			,"GLOSA"    ,"USUARIO"  ,"BASE"  ,"SERIE"  ,"NUMERO" )  
										VALUES	( :gi_rut,:ls_estado_tele,:gdt_fec_sistema ,:ls_glosa_tele,:gs_user	  ,:gs_base,:gs_serie,:gi_numero)  ;
										if sqlca.sqlcode = 0 then
											commit;
										else
											rollback;
										end if
										
										INSERT INTO "ATENCION_LOG"
													( "RUT"  ,"ESTADO"  ,"FECHA"   			,"GLOSA"    ,"USUARIO"  ,"BASE"  ,"SERIE"  ,"NUMERO" )  
										VALUES	( :gi_rut,:ls_estado_atencion,:gdt_fec_sistema ,:ls_glosa_atencion,:gs_user	  ,:gs_base,:gs_serie,:gi_numero)  ;
										if sqlca.sqlcode = 0 then
											commit;
										else
											rollback;
										end if
										//--modificacion fin//
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
										WHERE 	"CLIENTE_DEUDOR_TERCERO"."RUT" = :gi_rut   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
											//messagebox("Aviso","Grabacion Exitosa")
											cb_cerrar.triggerevent(Clicked!)
		//									close(w_actualiza_antece_cliente_msj)
										else
											rollback;
										end if
									else
										rollback;
										messagebox("Error Grabar","Error al Grabar Cliente SQL: "+sqlca.sqlerrtext)
									end if
								end if
								// Fin Nuevo
							else
								rollback;
							end if
						elseif sqlca.sqlcode = -1 then
							messagebox("Error","Error al Grabar Tabla SOL_ESTATUS: "+SQLCA.SQLErrText)
						end if
		//				if isvalid(w_detalle_solicitudes) then
		//					ll_row_ant	= 1
		//					if w_detalle_solicitudes.dw_reporte.retrieve(il_numero)>0 then
		//						w_detalle_solicitudes.dw_reporte.scrolltorow(ll_row_ant)
		//						w_detalle_solicitudes.dw_reporte.SelectRow(0, FALSE)
		//						w_detalle_solicitudes.dw_reporte.SelectRow(ll_row_ant, TRUE)
		//					end if
		//				end if
						if isvalid(w_cuotas) then
							if w_detalle_solicitudes.dw_reporte.retrieve(is_base,is_serie,il_numero,is_tipo_sol)>0 then
								w_detalle_solicitudes.dw_reporte.scrolltorow(1)
								w_detalle_solicitudes.dw_reporte.SelectRow(0, FALSE)
								w_detalle_solicitudes.dw_reporte.SelectRow(1, TRUE)
							end if
						end if
						if isvalid(w_cuotas_pagare) then
							if w_detalle_solicitudes.dw_reporte.retrieve(is_base,is_serie,il_numero,is_tipo_sol)>0 then
								w_detalle_solicitudes.dw_reporte.scrolltorow(1)
								w_detalle_solicitudes.dw_reporte.SelectRow(0, FALSE)
								w_detalle_solicitudes.dw_reporte.SelectRow(1, TRUE)
							end if
						end if
		//				if isvalid(w_ingreso_solicitudes) and is_estado="N" then
		//					ll_fila	= w_ingreso_solicitudes.dw_lista.getrow()
		//					ll_cant	= w_ingreso_solicitudes.dw_lista.getitemnumber(ll_fila,'cantidad')
		//					ll_cant++
		//					w_ingreso_solicitudes.dw_lista.setitem(ll_fila,'estado',0)
		//					w_ingreso_solicitudes.dw_lista.setitem(ll_fila,'cantidad',ll_cant)
		//					w_ingreso_solicitudes.dw_lista.accepttext()
		//				end if
					end if
				end if
			else
				  messagebox("Advertencia","Debe Completar Antecedentes del Cliente")
				  dw_mod_antecedentes.setfocus()		
			end if
		//end if	
	else
		messagebox("Advertencia","No Hay Cambios Antecedentes del Cliente")
		dw_mod_antecedentes.setfocus()		
	end if
end if
end event

type cb_cerrar from commandbutton within w_actualiza_antece_cliente_msj_bkp
integer x = 3081
integer y = 996
integer width = 315
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;string	ls_obs_mensaje,ls_mod_antec_cli,ls_mod_antece
long	ll_mod_mensaje
date	ld_fecha_hoy

ld_fecha_hoy		= date(gdt_fec_sistema)
ls_mod_antec_cli	= is_mod_antec_cli

if is_mod_antec_cli = 'S' and cbx_actualiza_datos.checked = true then
	ls_obs_mensaje	= 'Modificación de Datos Clientes, Gestionado por '+ gs_user + ' Fecha '+ string(ld_fecha_hoy)
	ll_mod_mensaje	= 1
	ls_mod_antece		= 'S'
elseif cbx_datos_correctos.checked = true and ls_no_act = 'N' then
	ls_obs_mensaje	= 'Datos Cliente estan Correctos, Gestionado por '+ gs_user + ' Fecha '+ string(ld_fecha_hoy)
	ll_mod_mensaje	= 2
	ls_mod_antece		= 'N'
elseif cbx_no_info.checked = true and ls_no_act = 'N' then
	ls_obs_mensaje	= 'Cliente no Entrega información, Gestionado por '+ gs_user + ' Fecha '+ string(ld_fecha_hoy)
	ll_mod_mensaje	= 3
	ls_mod_antece		= 'N'
elseif 	is_mod_antec_cli = 'N' and cbx_actualiza_datos.checked = true and ls_no_act= 'N' then
	ls_obs_mensaje	= 'Sin Gestión por Usuario '+ gs_user + ' Fecha '+ string(ld_fecha_hoy)
	ll_mod_mensaje	= 4
	ls_mod_antece		= 'N'
elseif 	ls_no_act= 'S' then
	ls_obs_mensaje	= 'Error en Ingreso Gestión, Usuario '+ gs_user + ' Fecha '+ string(ld_fecha_hoy) 
	ll_mod_mensaje	= 5
	ls_mod_antece		= 'N'
end if	

//INSERT INTO "LOG_MOD_ANTECE_MENSAJE" 
//			("RUT","BASE","SERIE","NUMERO","USUARRIO","DEPTO","OBSERVACION_MODIFICA","MODIFICA_SOLICITUD" )  
//VALUES ( :gi_rut, :gs_base, :gs_serie, :gi_numero, :gs_user, :gs_depto,:ls_obs_mensaje,:ll_mod_mensaje)
//USING	sqlca;
INSERT INTO "LOG_MOD_ANTECE_MENSAJE" 
			("RUT","BASE","SERIE","NUMERO","USUARRIO","DEPTO","OBSERVACION_MODIFICA","MODIFICA_SOLICITUD","EST_COB_ORIGINAL", "GLOSA_COB_ORIGINAL","EST_COB_NUEVO", "GLOSA_COB_NUEVO", "EST_PUB_ORIGINAL","GLOSA_PUB_ORIGINAL","MOD_ANTECE_MENSAJE" ,"IP_USUARIO"  )  
VALUES ( :gi_rut, :gs_base, :gs_serie, :gi_numero, :gs_user, :gs_depto,:ls_obs_mensaje,:ll_mod_mensaje,				:is_est_tele_orinial,		:is_glosa_tele_original,			:is_estado_nuevo,:is_glosa_nuevo,:is_est_cob_original,:is_glosa_cob_original,:ls_mod_antece, :gs_tcp_ip)
USING	sqlca;

//
if sqlca.sqlcode=0 then
	commit;
	if ll_mod_mensaje >= 1 and ll_mod_mensaje <= 3 then
		messagebox('Aviso','Grabacion Exitosa')
	end if	
else
	rollback;
	if ll_mod_mensaje >= 1 and ll_mod_mensaje <= 3 then
		messagebox('Error','Error al Grabar')
	end if	
end if
close(w_actualiza_antece_cliente_msj)
end event

type dw_mod_antecedentes from datawindow within w_actualiza_antece_cliente_msj_bkp
integer x = 37
integer y = 164
integer width = 3365
integer height = 800
integer taborder = 10
string title = "none"
string dataobject = "dw_modifica_antece_cliente_deptos"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String		ls_columna,ls_ciudad,ls_comuna
long		ll_resp
Datetime	ldt_fecha, ldt_fecha_crea
Time		lt_hora

ls_columna	= dwo.name
ldt_fecha		= this.getitemdatetime(1,'sol_mod_antece_fecha_nac_nueva')
ldt_fecha_crea	= datetime(date(ldt_fecha),lt_hora)
if isnull(ldt_fecha) then 
	messagebox("Advertencia","Fecha Invalida")
	setnull(ldt_fecha);setnull(ldt_fecha_crea)
	this.setitem(1,'sol_mod_antece_fecha_nac_nueva',ldt_fecha_crea)
	this.accepttext()
	this.setcolumn("sol_mod_antece_fecha_nac_nueva")
end if
CHOOSE CASE ls_columna
	CASE 'sol_mod_antece_ciudad_nueva'
		setnull(ls_ciudad)
		this.accepttext()
		ls_ciudad		= dw_mod_antecedentes.getitemstring(1,'sol_mod_antece_ciudad_nueva')
		if not isnull(ls_ciudad) then idw_detalle3.retrieve(ls_ciudad)
//		ls_comuna	= this.getitemstring(1,'sol_mod_antece_comuna_nueva')
		this.accepttext()
//		if not isnull(ls_ciudad) and ls_ciudad<>'' then
//			dw_mod_antecedentes.setitem(1,'sol_mod_antece_comuna_nueva','')
//			idw_detalle.retrieve(ls_ciudad)
//		end if
//		this.accepttext()
		//if not isnull(ls_comuna) and ls_comuna<>'' then
//			idw_detalle3.retrieve(ls_ciudad)
		//end if	
//		this.accepttext()
//	CASE 'sol_mod_antece_comuna_nueva'
//		ls_comuna	= this.getitemstring(1,'sol_mod_antece_comuna_nueva')
//		ls_ciudad		= this.getitemstring(1,'sol_mod_antece_ciudad_nueva') //
//		this.accepttext()
//		if not isnull(ls_comuna) and ls_comuna<>'' then
//			idw_detalle3.retrieve(ls_ciudad)
//		end if
//		this.accepttext()
END CHOOSE
is_mod	= 'S'
this.accepttext()
dw_mod_antecedentes.setitem(1,'sol_mod_antece_estatus_operaciones',0) // autorizar de inmediato
dw_mod_antecedentes.setitem(1,'sol_mod_antece_estatus_mod',0)//autorizar de inmediato
dw_mod_antecedentes.setitem(1,'sol_mod_antece_estatus_informatica',0) //autorizar de inmediato

end event

event itemfocuschanged;string	ls_obs_mensaje
long ll_resp,ll_mod_mensaje
datetime ldt_fecha_crea,ldt_fecha
Time		lt_hora
date	ld_fecha_hoy

ldt_fecha			= this.getitemdatetime(1,'sol_mod_antece_fecha_nac_nueva')
ldt_fecha_crea	= datetime(date(ldt_fecha),lt_hora)
if isnull(ldt_fecha) then 
	setnull(ldt_fecha);setnull(ldt_fecha_crea)
	this.setitem(1,'sol_mod_antece_fecha_nac_nueva',ldt_fecha_crea)
	this.accepttext()
	this.setcolumn("sol_mod_antece_fecha_nac_nueva")
end if
this.accepttext()

end event

event clicked;STRING	ls_columna,ls_fecha

CHOOSE CASE ls_columna
	CASE 'p_fec_nac'
		ls_fecha	= string(date(this.getitemdatetime(1,'sol_mod_antece_fecha_nac_nueva')))
		if isnull(ls_fecha) then ls_fecha = string(idt_fecha_hoy,"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			this.setitem(1,'sol_mod_antece_fecha_nac_nueva',date(string(idt_fecha_hoy,gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			this.setitem(1,'sol_mod_antece_fecha_nac_nueva',date(ls_fecha))
		END IF
END CHOOSE		
end event

event losefocus;string ls_obs_mensaje
long	ll_resp,ll_mod_mensaje
date	ld_fecha_hoy

this.accepttext()
if is_mod	= 'S' then
	ll_resp= messagebox("Aviso","Datos Modificados, ¿Desea Actualizar?",Exclamation!,YesNo!,1)
	if ll_resp	= 1 then
		cbx_datos_correctos.enabled	= false
		cbx_no_info.enabled				= false
		cb_guardar.triggerevent(Clicked!)					
	else
		ls_no_act	= 'S'
		cb_cerrar.triggerevent(Clicked!)
	end if
end if

end event

