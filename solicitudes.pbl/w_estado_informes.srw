forward
global type w_estado_informes from window
end type
type dw_exportar_rescil_cliente from datawindow within w_estado_informes
end type
type sle_1 from uo_convierte_numero within w_estado_informes
end type
type p_fin from picture within w_estado_informes
end type
type p_ini from picture within w_estado_informes
end type
type em_fec_fin from editmask within w_estado_informes
end type
type st_3 from statictext within w_estado_informes
end type
type em_fec_ini from editmask within w_estado_informes
end type
type st_2 from statictext within w_estado_informes
end type
type cb_seg_desg from commandbutton within w_estado_informes
end type
type cb_tit_dominio from commandbutton within w_estado_informes
end type
type dw_benefi from datawindow within w_estado_informes
end type
type dw_print_ctto from datawindow within w_estado_informes
end type
type cb_print_ctto from commandbutton within w_estado_informes
end type
type dw_print from datawindow within w_estado_informes
end type
type cbx_todo from checkbox within w_estado_informes
end type
type cb_problema from commandbutton within w_estado_informes
end type
type dw_linea from datawindow within w_estado_informes
end type
type cb_resolucion from commandbutton within w_estado_informes
end type
type st_porc from statictext within w_estado_informes
end type
type cb_po_rut from commandbutton within w_estado_informes
end type
type dw_solicitudes from datawindow within w_estado_informes
end type
type pb_ok from picturebutton within w_estado_informes
end type
type st_1 from statictext within w_estado_informes
end type
type rb_todo from radiobutton within w_estado_informes
end type
type rb_opera from radiobutton within w_estado_informes
end type
type cb_cta_cte from commandbutton within w_estado_informes
end type
type cb_imprimir from commandbutton within w_estado_informes
end type
type cb_exportar from commandbutton within w_estado_informes
end type
type cb_sort from commandbutton within w_estado_informes
end type
type cb_filtrar from commandbutton within w_estado_informes
end type
type cb_cerrar from commandbutton within w_estado_informes
end type
type rb_infor from radiobutton within w_estado_informes
end type
type gb_1 from groupbox within w_estado_informes
end type
type hpb_1 from hprogressbar within w_estado_informes
end type
type st_fondo from statictext within w_estado_informes
end type
type dw_lista from datawindow within w_estado_informes
end type
type cb_aceptar_informatica from commandbutton within w_estado_informes
end type
type cb_aceptar_operaciones from commandbutton within w_estado_informes
end type
end forward

global type w_estado_informes from window
integer width = 3214
integer height = 2064
boolean titlebar = true
string title = "Autorizar Solicitudes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_exportar_rescil_cliente dw_exportar_rescil_cliente
sle_1 sle_1
p_fin p_fin
p_ini p_ini
em_fec_fin em_fec_fin
st_3 st_3
em_fec_ini em_fec_ini
st_2 st_2
cb_seg_desg cb_seg_desg
cb_tit_dominio cb_tit_dominio
dw_benefi dw_benefi
dw_print_ctto dw_print_ctto
cb_print_ctto cb_print_ctto
dw_print dw_print
cbx_todo cbx_todo
cb_problema cb_problema
dw_linea dw_linea
cb_resolucion cb_resolucion
st_porc st_porc
cb_po_rut cb_po_rut
dw_solicitudes dw_solicitudes
pb_ok pb_ok
st_1 st_1
rb_todo rb_todo
rb_opera rb_opera
cb_cta_cte cb_cta_cte
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_sort cb_sort
cb_filtrar cb_filtrar
cb_cerrar cb_cerrar
rb_infor rb_infor
gb_1 gb_1
hpb_1 hpb_1
st_fondo st_fondo
dw_lista dw_lista
cb_aceptar_informatica cb_aceptar_informatica
cb_aceptar_operaciones cb_aceptar_operaciones
end type
global w_estado_informes w_estado_informes

type variables
long		il_row=0,il_rut,il_correlativo,il_tot_rescil_cli
String	is_tipo_sol='T',is_filtro
Date		idt_fecha_hoy
end variables

forward prototypes
public subroutine wf_grabar_todos_resolucion ()
public function string wf_fecha_palabra (date ad_fecha)
public subroutine wf_grabar_todos_cambio_estado ()
public subroutine wf_grabar_todos_cambio_estado_titular ()
public subroutine wf_grabar_todos_entrega_pagare ()
public subroutine wf_grabar_todos_seguro_desgravamen ()
public subroutine wf_grabar_todos_seguros ()
public subroutine wf_grabar_todos_titulo_dominio ()
public subroutine wf_grabar_todos_resciliacion_cliente ()
public subroutine wf_grabar_todos_antece_cliente ()
public subroutine wf_grabar_todos_novacion ()
public subroutine wf_grabar_todos_transferencia ()
public subroutine wf_grabar_todos_ultima_voluntad ()
public subroutine wf_grabar_todos_posesion_efectiva ()
public subroutine wf_grabar_transferencia ()
public subroutine wf_grabar_todos_coprop_promesa ()
public subroutine wf_grabar_todos_ctto_definitivo ()
public subroutine wf_grabar_todos_reactiva_ctto_resuelto ()
public subroutine wf_grabar_todos_pac ()
public subroutine wf_grabar_todos_repactacion_fecha ()
public subroutine wf_grabar_repacta_compraventa ()
public subroutine wf_actualizar_cadena_estado (string as_estado)
public subroutine wf_print_ctto_rescilia (long al_cod_parque)
public subroutine wf_grabar_todos_pat ()
public subroutine wf_grabar_todos_resciliacion_reprog ()
public subroutine wf_grabar_todos_seguro_fallecimiento ()
public subroutine wf_grabar_todos_en_demanda ()
public subroutine wf_grabar_todos_bono_fraterno ()
public subroutine wf_grabar_todos_mant_perpetua ()
end prototypes

public subroutine wf_grabar_todos_resolucion ();//
end subroutine

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

public subroutine wf_grabar_todos_cambio_estado ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp,ll_ctas_pag_m,ll_ctas,ll_ctas_repacta,ll_ctas_en_mora
Datetime	ldt_fec_nac,ldt_fecha,ldt_fecha_hoy
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado,ls_estado_reg,ls_base,&
			ls_serie,ls_anexo_lib,ls_anexo_repacta,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
Double	ll_numero
ldt_fecha					= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy			= datetime(idt_fecha_hoy,time('00:00:00'))
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
ll_rut						= dw_lista.getitemnumber(il_row,'rut_cliente')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_CAMBIO_ESTADO"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_CAMBIO_ESTADO"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																	  FROM 	"SOL_ESTATUS"  
																	  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																				( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_CAMBIO_ESTADO"."SERIE" = :gs_serie AND
						"SOL_CAMBIO_ESTADO"."NUMERO" = :gi_numero AND
						"SOL_CAMBIO_ESTADO"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			SELECT	"SOL_CAMBIO_ESTADO"."ESTADO_CTTO_FINAL"  
			INTO 		:ls_estado  
			FROM 	"SOL_CAMBIO_ESTADO",   
						"SOL_ESTATUS"  
			WHERE  ( "SOL_CAMBIO_ESTADO"."BASE" = "SOL_ESTATUS"."BASE" ) and  
					 ( "SOL_CAMBIO_ESTADO"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
					 ( "SOL_CAMBIO_ESTADO"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
					 ( "SOL_CAMBIO_ESTADO"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
					 (("SOL_CAMBIO_ESTADO"."BASE" = :ls_base ) AND  
					 ( "SOL_CAMBIO_ESTADO"."SERIE" = :ls_serie ) AND  
					 ( "SOL_CAMBIO_ESTADO"."NUMERO" = :ll_numero ) AND  
					 ( "SOL_CAMBIO_ESTADO"."CORRELATIVO" = :ll_corr ) AND  
					 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '13' ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
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
			if ls_est_mod='S' then
				ll_resp			= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_CAMBIO_ESTADO"."DIRECCION_P",   "SOL_CAMBIO_ESTADO"."POBLACION",   "SOL_CAMBIO_ESTADO"."SECTOR",   "SOL_CAMBIO_ESTADO"."COMUNA",   "SOL_CAMBIO_ESTADO"."CIUDAD",   "SOL_CAMBIO_ESTADO"."FONO_P",   "SOL_CAMBIO_ESTADO"."FECHA_NAC",   "SOL_CAMBIO_ESTADO"."ESTADO_CIVIL",   "SOL_CAMBIO_ESTADO"."DOMICILIO_C",   "SOL_CAMBIO_ESTADO"."TOTAL_RENTA",   "SOL_CAMBIO_ESTADO"."FONO_C",   "SOL_CAMBIO_ESTADO"."GRUPO_F",   "SOL_CAMBIO_ESTADO"."RUT_TITULAR"  ,   "SOL_CAMBIO_ESTADO"."TIPO_VIA",   "SOL_CAMBIO_ESTADO"."NUMERO_PARTICULAR",   "SOL_CAMBIO_ESTADO"."DEPTO_PARTICULAR",   "SOL_CAMBIO_ESTADO"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   						  		:ls_pob,   						  			:ls_sector,   				  			:ls_comuna,   				  		:ls_ciudad,   				  			:ls_fono_p,   				  			:ldt_fec_nac,   				  		:ls_est_civil,   					  			:ls_dir_c,   						 		:ll_renta,   									:ls_fono_c,   							:ll_grupo_f,   				 	:ll_rut ,											:ls_tipo_via,					 		:ls_nro_part,										:ls_depto_part,							 		:ls_block_part
					FROM 	"SOL_CAMBIO_ESTADO",   
								"SOL_ESTATUS"  
					WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_CAMBIO_ESTADO"."BASE" ) and  
							 ( "SOL_ESTATUS"."SERIE" = "SOL_CAMBIO_ESTADO"."SERIE" ) and  
							 ( "SOL_ESTATUS"."NUMERO" = "SOL_CAMBIO_ESTADO"."NUMERO" ) and  
							 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CAMBIO_ESTADO"."CORRELATIVO" ) and  
							 ( ( "SOL_CAMBIO_ESTADO"."BASE" = :gs_base ) AND  
							 ( "SOL_CAMBIO_ESTADO"."SERIE" = :gs_serie ) AND  
							 ( "SOL_CAMBIO_ESTADO"."NUMERO" = :gi_numero ) AND  
							 ( "SOL_CAMBIO_ESTADO"."CORRELATIVO" = :ll_corr ) AND  
							 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
					Using	sqlca;							
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_cambio_estado_titular ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp,ll_ctas_pag_m,ll_ctas,ll_ctas_repacta,ll_ctas_en_mora
Datetime	ldt_fec_nac,ldt_fecha,ldt_fecha_hoy
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado,ls_estado_reg,ls_base,&
			ls_serie,ls_anexo_lib,ls_anexo_repacta,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
Double	ll_numero
ldt_fecha					= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy			= datetime(idt_fecha_hoy,time('00:00:00'))
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
ll_rut					= dw_lista.getitemnumber(il_row,'rut_cliente')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_CAMBIO_ESTADO_TITULAR"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_CAMBIO_ESTADO_TITULAR"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																				  FROM 	"SOL_ESTATUS"  
																				  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																							( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																							( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																							( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																							( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_CAMBIO_ESTADO_TITULAR"."SERIE" = :gs_serie AND
						"SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" = :gi_numero AND
						"SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			SELECT	"SOL_CAMBIO_ESTADO_TITULAR"."ESTADO_CTTO_FINAL"  
			INTO 		:ls_estado  
			FROM 	"SOL_CAMBIO_ESTADO_TITULAR",   
						"SOL_ESTATUS"  
			WHERE  ( "SOL_CAMBIO_ESTADO_TITULAR"."BASE" = "SOL_ESTATUS"."BASE" ) and  
					 ( "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
					 ( "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
					 ( "SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
					 (("SOL_CAMBIO_ESTADO_TITULAR"."BASE" = :ls_base ) AND  
					 ( "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" = :ls_serie ) AND  
					 ( "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" = :ll_numero ) AND  
					 ( "SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" = :ll_corr ) AND  
					 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '14' ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				UPDATE	"CLIENTE"  
				SET 		"ESTADO_TITULAR" = :ls_estado
				WHERE 	"CLIENTE"."RUT" = :ll_rut   
				USING		sqlca  ;
				if sqlca.sqlcode=0 then
					wf_actualizar_cadena_estado(ls_estado)
					commit;
				else
					rollback;
				end if
			end if
			if ls_est_mod='S' then
				ll_resp			= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_CAMBIO_ESTADO_TITULAR"."DIRECCION_P",   "SOL_CAMBIO_ESTADO_TITULAR"."POBLACION",  "SOL_CAMBIO_ESTADO_TITULAR"."SECTOR",  "SOL_CAMBIO_ESTADO_TITULAR"."COMUNA",  "SOL_CAMBIO_ESTADO_TITULAR"."CIUDAD",  "SOL_CAMBIO_ESTADO_TITULAR"."FONO_P",  "SOL_CAMBIO_ESTADO_TITULAR"."FECHA_NAC",  "SOL_CAMBIO_ESTADO_TITULAR"."ESTADO_CIVIL",  "SOL_CAMBIO_ESTADO_TITULAR"."DOMICILIO_C",   "SOL_CAMBIO_ESTADO_TITULAR"."TOTAL_RENTA",   "SOL_CAMBIO_ESTADO_TITULAR"."FONO_C",  "SOL_CAMBIO_ESTADO_TITULAR"."GRUPO_F", "SOL_CAMBIO_ESTADO_TITULAR"."RUT_TITULAR"  , "SOL_CAMBIO_ESTADO_TITULAR"."TIPO_VIA",   "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO_PARTICULAR",   "SOL_CAMBIO_ESTADO_TITULAR"."DEPTO_PARTICULAR", "SOL_CAMBIO_ESTADO_TITULAR"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   						  					:ls_pob,   						  					:ls_sector,   				  					:ls_comuna,   				  					:ls_ciudad,   				  					:ls_fono_p,   				  					:ldt_fec_nac,   				  					:ls_est_civil,   					  					:ls_dir_c,   						 					:ll_renta,   											:ls_fono_c,   									:ll_grupo_f,   				 				:ll_rut ,												:ls_tipo_via,					 					:ls_nro_part,													:ls_depto_part,							 				:ls_block_part
					FROM 	"SOL_CAMBIO_ESTADO_TITULAR",   
								"SOL_ESTATUS"  
					WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_CAMBIO_ESTADO_TITULAR"."BASE" ) and  
							 ( "SOL_ESTATUS"."SERIE" = "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" ) and  
							 ( "SOL_ESTATUS"."NUMERO" = "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" ) and  
							 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" ) and  
							 ( ( "SOL_CAMBIO_ESTADO_TITULAR"."BASE" = :gs_base ) AND  
							 ( "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" = :gs_serie ) AND  
							 ( "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" = :gi_numero ) AND  
							 ( "SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" = :ll_corr ) AND  
							 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
					Using	sqlca;							
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_entrega_pagare ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part

ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_ENTREGA_PAG"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_ENTREGA_PAG"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																  FROM 	"SOL_ESTATUS"  
																  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																			( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																			( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																			( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																			( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																			( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_ENTREGA_PAG"."SERIE" = :gs_serie AND
						"SOL_ENTREGA_PAG"."NUMERO" = :gi_numero AND
						"SOL_ENTREGA_PAG"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			//ENTREGA PAGARE no hacer nada
			if ls_est_mod='S' then
				ll_resp			= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_ENTREGA_PAG"."DIRECCION_P",   "SOL_ENTREGA_PAG"."POBLACION",   "SOL_ENTREGA_PAG"."SECTOR",   "SOL_ENTREGA_PAG"."COMUNA",   "SOL_ENTREGA_PAG"."CIUDAD",   "SOL_ENTREGA_PAG"."FONO_P",   "SOL_ENTREGA_PAG"."FECHA_NAC",   "SOL_ENTREGA_PAG"."ESTADO_CIVIL",   "SOL_ENTREGA_PAG"."DOMICILIO_C",   "SOL_ENTREGA_PAG"."TOTAL_RENTA",   "SOL_ENTREGA_PAG"."FONO_C",   "SOL_ENTREGA_PAG"."GRUPO_F",   "SOL_ENTREGA_PAG"."RUT_TITULAR",   "SOL_ENTREGA_PAG"."TIPO_VIA",   "SOL_ENTREGA_PAG"."NUMERO_PARTICULAR",   "SOL_ENTREGA_PAG"."DEPTO_PARTICULAR",   "SOL_ENTREGA_PAG"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   					  :ldt_fec_nac,   					  :ls_est_civil,   						  :ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut  ,									:ls_tipo_via,							:ls_nro_part,									 :ls_depto_part,									:ls_block_part
					FROM 	"SOL_ENTREGA_PAG",   
								"SOL_ESTATUS"  
					WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_ENTREGA_PAG"."BASE" ) and  
							 ( "SOL_ESTATUS"."SERIE" = "SOL_ENTREGA_PAG"."SERIE" ) and  
							 ( "SOL_ESTATUS"."NUMERO" = "SOL_ENTREGA_PAG"."NUMERO" ) and  
							 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_ENTREGA_PAG"."CORRELATIVO" ) and  
							 ( ( "SOL_ENTREGA_PAG"."BASE" = :gs_base ) AND  
							 ( "SOL_ENTREGA_PAG"."SERIE" = :gs_serie ) AND  
							 ( "SOL_ENTREGA_PAG"."NUMERO" = :gi_numero ) AND  
							 ( "SOL_ENTREGA_PAG"."CORRELATIVO" = :ll_corr ) AND  
							 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
					Using	sqlca;
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_seguro_desgravamen ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
			
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_SEGURO_DESG"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_SEGURO_DESG"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																  FROM 	"SOL_ESTATUS"  
																  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																			( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																			( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																			( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																			( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																			( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_SEGURO_DESG"."SERIE" = :gs_serie AND
						"SOL_SEGURO_DESG"."NUMERO" = :gi_numero AND
						"SOL_SEGURO_DESG"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				UPDATE	"CADENA"  
				SET 		"ESTADO" = 'S'  
				WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
						 ( "CADENA"."SERIE" = :gs_serie ) AND  
						 ( "CADENA"."NUMERO" = :gi_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			else
				rollback;
			end if
			// no hacer nada
			if ls_est_mod='S' then
				ll_resp			= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_SEGURO_DESG"."DIRECCION_P",   "SOL_SEGURO_DESG"."POBLACION",   "SOL_SEGURO_DESG"."SECTOR",   "SOL_SEGURO_DESG"."COMUNA",   "SOL_SEGURO_DESG"."CIUDAD",   "SOL_SEGURO_DESG"."FONO_P",   "SOL_SEGURO_DESG"."FECHA_NAC",   "SOL_SEGURO_DESG"."ESTADO_CIVIL",   "SOL_SEGURO_DESG"."DOMICILIO_C",   "SOL_SEGURO_DESG"."TOTAL_RENTA",   "SOL_SEGURO_DESG"."FONO_C",   "SOL_SEGURO_DESG"."GRUPO_F",   "SOL_SEGURO_DESG"."RUT_TITULAR"  ,   "SOL_SEGURO_DESG"."TIPO_VIA",   "SOL_SEGURO_DESG"."NUMERO_PARTICULAR",   "SOL_SEGURO_DESG"."DEPTO_PARTICULAR",   "SOL_SEGURO_DESG"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   					  :ldt_fec_nac,   					  :ls_est_civil,   						  :ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut ,										:ls_tipo_via,						 :ls_nro_part,										:ls_depto_part,								 :ls_block_part
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_seguros ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
			
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_SEGURO"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_SEGURO"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
														  FROM 	"SOL_ESTATUS"  
														  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																	( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																	( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																	( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																	( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																	( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_SEGURO"."SERIE" = :gs_serie AND
						"SOL_SEGURO"."NUMERO" = :gi_numero AND
						"SOL_SEGURO"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			// no hacer nada
			if ls_est_mod='S' then
				ll_resp	= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_SEGURO"."DIRECCION_P",   "SOL_SEGURO"."POBLACION",  "SOL_SEGURO"."SECTOR",  "SOL_SEGURO"."COMUNA",  "SOL_SEGURO"."CIUDAD",  "SOL_SEGURO"."FONO_P",  "SOL_SEGURO"."FECHA_NAC",  "SOL_SEGURO"."ESTADO_CIVIL",  "SOL_SEGURO"."DOMICILIO_C",   "SOL_SEGURO"."TOTAL_RENTA",   "SOL_SEGURO"."FONO_C",  "SOL_SEGURO"."GRUPO_F", "SOL_SEGURO"."RUT_TITULAR"  , "SOL_SEGURO"."TIPO_VIA",   "SOL_SEGURO"."NUMERO_PARTICULAR",   "SOL_SEGURO"."DEPTO_PARTICULAR", "SOL_SEGURO"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   						:ls_pob,   						:ls_sector,   				:ls_comuna,   				:ls_ciudad,   				:ls_fono_p,   				:ldt_fec_nac,   				:ls_est_civil,   					:ls_dir_c,   						:ll_renta,   						:ls_fono_c,   				:ll_grupo_f,   			:ll_rut ,							:ls_tipo_via,					:ls_nro_part,								:ls_depto_part,						:ls_block_part
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_titulo_dominio ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp,ll_capacidad,ll_total_pagado,ll_cod_parque,ll_rut_gerente_operaciones,&
			ll_correlativo
Double	ll_numero
Datetime	ldt_fec_nac,ldt_fecha,ldt_fecha_promesa,ldt_fecha_mant
String		ls_cod_sol,ls_est_mod,ls_estado_reg,ls_obs,ls_sexo,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_nro_sepultura,ls_sector,ls_area,ls_direccion_p,&
			ls_nro_particular,ls_depto_particular,ls_block_particular,ls_comuna,ls_ciudad,ls_poblacion,ls_estado_civil,ls_estado_contrato,ls_trato,&
			ls_nombre_cliente,ls_tipo_construccion,ls_total_pagado_palabras,	ls_fecha_promesa_palabas,ls_dir_p,ls_pob,ls_est_civil,ls_estado_cadena,&
			ls_fono_p,ls_dir_c,ls_fono_c,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_tipo_via_titulo

ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_TIT_DOMINIO"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_TIT_DOMINIO"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																  FROM 	"SOL_ESTATUS"  
																  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																			( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																			( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																			( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																			( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																			( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_TIT_DOMINIO"."SERIE" = :gs_serie AND
						"SOL_TIT_DOMINIO"."NUMERO" = :gi_numero AND
						"SOL_TIT_DOMINIO"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
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
						FROM 	"CADENA",   "CIUDAD",   "CLIENTE",   "COMUNA",   "CONTRATO",   "GERENTE_OPERACIONES",	"TIPO_VIA"  
						WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
								 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
								 ( "CONTRATO"."RUT" = "CLIENTE"."RUT" ) and  
								 ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA") and
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
							FROM 	"PROCESO_TITULO_ISACRUZ"  
							USING	sqlca;
							if ll_correlativo>0 then
								ll_correlativo ++
							else
								ll_correlativo				= 1
							end if
							ls_nombre_cliente				= ls_nom+ ' ' +ls_ap_pat+ ' '+ls_ap_mat
							ls_tipo_construccion			= 'T'
							ls_total_pagado_palabras	= sle_1.uo_convertir_numero(string(ll_total_pagado))
							ls_fecha_promesa_palabas	= wf_fecha_palabra(date(ldt_fecha_promesa))
							INSERT INTO		"PROCESO_TITULO_ISACRUZ"  
											( "CORRELATIVO",		"NRO_LIBRO",	"FOJA",		"ROLA",	"TRATO",		"RUT",	"DV",		"NOMBRE_CLIENTE",		"NRO_SEPULTURA",		"SECTOR",	"AREA",		"CAPACIDAD",	"TIPO_CONSTRUCCION",		"BASE",		"SERIE",		"NUMERO",	"FECHA_PROMESA",		"DIRECCION_P",		"NRO_PARTICULAR",		"DEPTO_PARTICULAR",		"BLOCK_PARTICULAR",		"COMUNA",	"CIUDAD",	"POBLACION",	"ESTADO_CIVIL",	"USUARIO",	"TOTAL_PAGADO",	"TOTAL_PAGADO_PALABRAS",	"ESTADO_CONTRATO",	"COD_PARQUE",		"FECHA_PROMESA_PALABRAS",	"RUT_GERENTE_OPERACIONES",		"FECHA_MANT",		"TIPO_VIA"	 ) 
							VALUES 		( :ll_correlativo,	0,					0,				0,			:ls_trato,	:ll_rut,	:ls_dv,	:ls_nombre_cliente,	:ls_nro_sepultura,	:ls_sector,	:ls_area,	:ll_capacidad,	:ls_tipo_construccion,	:gs_base,	:gs_serie,	:gi_numero,	:ldt_fecha_promesa,	:ls_direccion_p,	:ls_nro_particular,	:ls_depto_particular,	:ls_block_particular,	:ls_comuna,	:ls_ciudad,	:ls_poblacion,	:ls_estado_civil,	:gs_user,	:ll_total_pagado,	:ls_total_pagado_palabras,	:ls_estado_contrato,	:ll_cod_parque,	:ls_fecha_promesa_palabas,	:ll_rut_gerente_operaciones,	:ldt_fecha_mant,	:ls_tipo_via_titulo)  
							USING			sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
					end if
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
			end if
//			UPDATE	"CADENA"  
//			SET 		"ESTADO_TITULO" = 'S',
//						"FECHA_TITULO" = :ldt_fecha
//			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
//						( "CADENA"."SERIE" = :gs_serie ) AND  
//						( "CADENA"."NUMERO" = :gi_numero )   
//			Using		sqlca ;
//			if sqlca.sqlcode=0 then
//				commit;
//				UPDATE	"CLIENTE"  
//				SET 		"ESTADO_COBRANZA" = '0'  
//				WHERE 	"CLIENTE"."RUT" = :ll_rut
//				USING		sqlca  ;
//				if sqlca.sqlcode=0 then
//					commit;
//					// insertar registro tabla ATENCION_LOG
//					if isvalid(w_ingreso_atencion_log) then close(w_ingreso_atencion_log)
//					ls_string	= string(ll_rut)
//					openwithparm(w_ingreso_atencion_log,ls_string)
//				else
//					rollback;
//				end if
//			else
//				rollback;
//			end if
			if ls_est_mod='S' then
				ll_resp			= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_TIT_DOMINIO"."DIRECCION_P",   "SOL_TIT_DOMINIO"."POBLACION",   "SOL_TIT_DOMINIO"."SECTOR",   "SOL_TIT_DOMINIO"."COMUNA",   "SOL_TIT_DOMINIO"."CIUDAD",   "SOL_TIT_DOMINIO"."FONO_P",   "SOL_TIT_DOMINIO"."FECHA_NAC",   "SOL_TIT_DOMINIO"."ESTADO_CIVIL",   "SOL_TIT_DOMINIO"."DOMICILIO_C",   "SOL_TIT_DOMINIO"."TOTAL_RENTA",   "SOL_TIT_DOMINIO"."FONO_C",   "SOL_TIT_DOMINIO"."GRUPO_F",   "SOL_TIT_DOMINIO"."RUT_TITULAR"  ,   "SOL_TIT_DOMINIO"."TIPO_VIA",   "SOL_TIT_DOMINIO"."NUMERO_PARTICULAR",   "SOL_TIT_DOMINIO"."DEPTO_PARTICULAR",   "SOL_TIT_DOMINIO"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   					  :ldt_fec_nac,   					  :ls_est_civil,   						  :ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut ,										:ls_tipo_via,						 :ls_nro_part,										:ls_depto_part,								 :ls_block_part
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_resciliacion_cliente ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp,ll_cta_pag_m,ll_ctas,ll_ctas_en_mora,ll_ctas_repacta,ll_anno_liberar
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_anexo_lib,&
			ls_base,ls_serie,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_estado_at_pub,ls_glosa
Double	ll_numero
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_RESCILIA_CLIENTE"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_RESCILIA_CLIENTE"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																		 FROM 	"SOL_ESTATUS"  
																		 WHERE 	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																					( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																					( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																					( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																					( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																					( "SOL_ESTATUS"."ESTADO_REG" = 'A' ))  AND
						"SOL_RESCILIA_CLIENTE"."SERIE" = :gs_serie AND
						"SOL_RESCILIA_CLIENTE"."NUMERO" = :gi_numero AND
						"SOL_RESCILIA_CLIENTE"."CORRELATIVO" = :ll_corr
			Using		sqlca ;
			if sqlca.sqlcode=0 then
				commit;
				// cambiar valores
				if gs_base='L' then
					SELECT	"ANEXO_LIBERADOR"."BASE",   
								"ANEXO_LIBERADOR"."SERIE",   
								"ANEXO_LIBERADOR"."NRO_OFERTA"  ,
								"PAGO_LIBERADOR"."ANNO_LIBERAR"
					INTO 		:ls_base,   
								:ls_serie,   
								:ll_numero,
								:ll_anno_liberar
					FROM 	"ANEXO_LIBERADOR",   
								"PAGO_LIBERADOR"  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
							 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
							 (("ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) )   
					using		sqlca;
					if sqlca.sqlcode=0 then
						CHOOSE CASE ls_base
							CASE 'O'
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
										USING		sqlca;
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
								FROM 		"CONTRATO"  
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
//									ll_ctas	= 0
									UPDATE	"OFERTA_V"  
									SET 		"ANEXO_AUMENTO" = ''
									WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
											 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
									USING		sqlca;
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
					USING		sqlca;
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
									USING		sqlca;
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
									USING		sqlca;
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
				// cambiar estado cadena
				UPDATE	"CADENA"  
				SET 		"ESTADO" = 'N',
							"FECHA_RES" = :gdt_fecha_res
				WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
							( "CADENA"."SERIE" = :gs_serie ) AND  
							( "CADENA"."NUMERO" = :gi_numero )   
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
					
					////////////////////////nuevo
					ls_estado_at_pub		= '68'
					ls_glosa					= 'SE RESCILIA POR PARTE DEL CLIENTE CONTRATO N° '+gs_base+gs_serie+string(gi_numero)+ 'EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy hh:mm')
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
					
					if gs_base='R' then
						UPDATE	"REPACTA_MANTENCION"  
						SET 		"ESTADO_PAGO" = 'N' 
						WHERE  ( "REPACTA_MANTENCION"."BASE" = :gs_base ) AND  
								 ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
								 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
				else
					rollback;
				end if				
			else
				rollback;
			end if
			if ls_est_mod='S' then
				ll_resp	= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_RESCILIA_CLIENTE"."DIRECCION_P",   "SOL_RESCILIA_CLIENTE"."POBLACION",   "SOL_RESCILIA_CLIENTE"."SECTOR",   "SOL_RESCILIA_CLIENTE"."COMUNA",   "SOL_RESCILIA_CLIENTE"."CIUDAD",   "SOL_RESCILIA_CLIENTE"."FONO_P",   "SOL_RESCILIA_CLIENTE"."FECHA_NAC",   "SOL_RESCILIA_CLIENTE"."ESTADO_CIVIL",   "SOL_RESCILIA_CLIENTE"."DOMICILIO_C",   "SOL_RESCILIA_CLIENTE"."TOTAL_RENTA",   "SOL_RESCILIA_CLIENTE"."FONO_C",   "SOL_RESCILIA_CLIENTE"."GRUPO_F",   "SOL_RESCILIA_CLIENTE"."RUT_TITULAR"  ,   "SOL_RESCILIA_CLIENTE"."TIPO_VIA",   "SOL_RESCILIA_CLIENTE"."NUMERO_PARTICULAR",   "SOL_RESCILIA_CLIENTE"."DEPTO_PARTICULAR",   "SOL_RESCILIA_CLIENTE"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   									 :ls_pob,   									:ls_sector,   							  :ls_comuna,   							 :ls_ciudad,   							:ls_fono_p,   							  :ldt_fec_nac,   							 :ls_est_civil,   								:ls_dir_c,   									 :ll_renta,   									  :ls_fono_c,   							 :ll_grupo_f,   							 :ll_rut ,											 :ls_tipo_via,									:ls_nro_part,											:ls_depto_part,										:ls_block_part
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_antece_cliente ();Long		ll_resp,ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_est_cob,ls_nombre,ls_ap_pat,ls_ap_mat,&
			ls_estado_reg,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_descrip_tipo_via,ls_descrip_ciudad,ls_descrip_comuna,ls_dir_1,ls_dir_2
			
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_MOD_ANTECE"  
			SET 		"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha,   
						"ESTATUS_INFORMATICA" = 0  
			WHERE 	"SOL_MOD_ANTECE"."RUT" = :gi_numero  AND
						"SOL_MOD_ANTECE"."CORRELATIVO" = :il_correlativo
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			// no hacer nada
			SELECT	"SOL_MOD_ANTECE"."DIRECCION_P_NUEVA",   "SOL_MOD_ANTECE"."POBLACION_NUEVA",   "SOL_MOD_ANTECE"."SECTOR_NUEVA",   "SOL_MOD_ANTECE"."COMUNA_NUEVA",   "SOL_MOD_ANTECE"."CIUDAD_NUEVA",   "SOL_MOD_ANTECE"."FONO_P_NUEVA",   "SOL_MOD_ANTECE"."FECHA_NAC_NUEVA",   "SOL_MOD_ANTECE"."ESTADO_CIVIL_NUEVA",   "SOL_MOD_ANTECE"."DOMICILIO_C_NUEVA",   "SOL_MOD_ANTECE"."FONO_C_NUEVA",   "SOL_MOD_ANTECE"."TOTAL_RENTA_NUEVA",   "SOL_MOD_ANTECE"."GRUPO_F_NUEVA",   "SOL_MOD_ANTECE"."ESTADO_COB_NUEVA",   "SOL_MOD_ANTECE"."NOMBRE_NUEVA",   "SOL_MOD_ANTECE"."AP_PATERNO_NUEVA",   "SOL_MOD_ANTECE"."AP_MATERNO_NUEVA",   "SOL_MOD_ANTECE"."TIPO_VIA_NUEVA",   "SOL_MOD_ANTECE"."NUMERO_PARTICULAR_NUEVA",   "SOL_MOD_ANTECE"."DEPTO_NUEVA",   "SOL_MOD_ANTECE"."BLOCK_NUEVA"
			INTO 		:ls_dir_p,   									:ls_pob,   										:ls_sector,   								:ls_comuna,   							 :ls_ciudad,   							:ls_fono_p,   								:ldt_fec_nac,   							 :ls_est_civil,   								:ls_dir_c,   									 :ls_fono_c,   							:ll_renta,   									 :ll_grupo_f,   							 :ls_est_cob,   								 :ls_nombre,   							:ls_ap_pat,   									:ls_ap_mat  ,									:ls_tipo_via,								 :ls_nro_part,											  :ls_depto_part,							:ls_block_part
			FROM 	"SOL_MOD_ANTECE"  
			WHERE 	"SOL_MOD_ANTECE"."RUT" = :gi_numero AND
						"SOL_MOD_ANTECE"."CORRELATIVO" = :il_correlativo
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_est_cob	= '0'
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
							"ESTADO_COBRANZA" = :ls_est_cob,
							"LAT_GEO" = 0,
							"LON_GEO" = 0,
							"STATUS_GEO" = 0
				WHERE 	"CLIENTE"."RUT" = :gi_numero   
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
							WHERE 	"GESTION_CARTA"."RUT" = :gi_numero
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
								"ESTADO_COBRANZA" = :ls_est_cob,  
								"TIPO_VIA" = :ls_tipo_via,
								"NUMERO_PARTICULAR" = :ls_nro_part,
								"DEPTO_PARTICULAR" = :ls_depto_part,
								"BLOCK_PARTICULAR" = :ls_block_part
					WHERE 	"CLIENTE_DEUDOR_TERCERO"."RUT" = :gi_numero   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				else
					rollback;
				end if
			end if
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_novacion ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
			
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_NOVACION"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_NOVACION"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
															  FROM 	"SOL_ESTATUS"  
															  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																		( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																		( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																		( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																		( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																		( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_NOVACION"."SERIE" = :gs_serie AND
						"SOL_NOVACION"."NUMERO" = :gi_numero AND
						"SOL_NOVACION"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			if ls_est_mod='S' then
				ll_resp		= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_NOVACION"."DIRECCION_P",   "SOL_NOVACION"."POBLACION",   "SOL_NOVACION"."SECTOR",   "SOL_NOVACION"."COMUNA",   "SOL_NOVACION"."CIUDAD",   "SOL_NOVACION"."FONO_P",   "SOL_NOVACION"."FECHA_NAC",   "SOL_NOVACION"."ESTADO_CIVIL", "SOL_NOVACION"."DOMICILIO_C",   "SOL_NOVACION"."TOTAL_RENTA",  "SOL_NOVACION"."FONO_C",   "SOL_NOVACION"."GRUPO_F",  "SOL_NOVACION"."RUT_TITULAR"  ,   "SOL_NOVACION"."TIPO_VIA",   "SOL_NOVACION"."NUMERO_PARTICULAR",   "SOL_NOVACION"."DEPTO_PARTICULAR",   "SOL_NOVACION"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   						  :ls_pob,   						  :ls_sector,   				  :ls_comuna,   				  :ls_ciudad,   				  :ls_fono_p,   				  :ldt_fec_nac,   				  :ls_est_civil,   					:ls_dir_c,   						  :ll_renta,   						:ls_fono_c,   					:ll_grupo_f,   				:ll_rut ,								 :ls_tipo_via,						:ls_nro_part,								  :ls_depto_part,								:ls_block_part
					FROM 	"SOL_NOVACION",   
								"SOL_ESTATUS"  
					WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_NOVACION"."BASE" ) and  
							 ( "SOL_ESTATUS"."SERIE" = "SOL_NOVACION"."SERIE" ) and  
							 ( "SOL_ESTATUS"."NUMERO" = "SOL_NOVACION"."NUMERO" ) and  
							 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_NOVACION"."CORRELATIVO" ) and  
							 ( ( "SOL_NOVACION"."BASE" = :gs_base ) AND  
							 ( "SOL_NOVACION"."SERIE" = :gs_serie ) AND  
							 ( "SOL_NOVACION"."NUMERO" = :gi_numero ) AND  
							 ( "SOL_NOVACION"."CORRELATIVO" = :ll_corr ) AND  
							 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
					Using	sqlca;
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
			wf_grabar_transferencia()
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_transferencia ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
			
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_TRANSFERENCIA"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_TRANSFERENCIA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																	  FROM 	"SOL_ESTATUS"  
																	  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																				( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_TRANSFERENCIA"."SERIE" = :gs_serie AND
						"SOL_TRANSFERENCIA"."NUMERO" = :gi_numero AND
						"SOL_TRANSFERENCIA"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			if ls_est_mod='S' then
				ll_resp		= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_TRANSFERENCIA"."DIRECCION_P",   "SOL_TRANSFERENCIA"."POBLACION",   "SOL_TRANSFERENCIA"."SECTOR",   "SOL_TRANSFERENCIA"."COMUNA",   "SOL_TRANSFERENCIA"."CIUDAD",   "SOL_TRANSFERENCIA"."FONO_P",   "SOL_TRANSFERENCIA"."FECHA_NAC",   "SOL_TRANSFERENCIA"."ESTADO_CIVIL",   "SOL_TRANSFERENCIA"."DOMICILIO_C",   "SOL_TRANSFERENCIA"."TOTAL_RENTA",   "SOL_TRANSFERENCIA"."FONO_C",   "SOL_TRANSFERENCIA"."GRUPO_F",   "SOL_TRANSFERENCIA"."RUT_TITULAR"  ,   "SOL_TRANSFERENCIA"."TIPO_VIA",   "SOL_TRANSFERENCIA"."NUMERO_PARTICULAR",   "SOL_TRANSFERENCIA"."DEPTO_PARTICULAR",   "SOL_TRANSFERENCIA"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   								 :ls_pob,   								:ls_sector,   						  :ls_comuna,   						 :ls_ciudad,   						:ls_fono_p,   						  :ldt_fec_nac,   						 :ls_est_civil,   							:ls_dir_c,   								 :ll_renta,   								  :ls_fono_c,   						 :ll_grupo_f,   						 :ll_rut ,										 :ls_tipo_via,								:ls_nro_part,										:ls_depto_part,									:ls_block_part
					FROM 	"SOL_TRANSFERENCIA",   
								"SOL_ESTATUS"  
					WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_TRANSFERENCIA"."BASE" ) and  
							 ( "SOL_ESTATUS"."SERIE" = "SOL_TRANSFERENCIA"."SERIE" ) and  
							 ( "SOL_ESTATUS"."NUMERO" = "SOL_TRANSFERENCIA"."NUMERO" ) and  
							 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TRANSFERENCIA"."CORRELATIVO" ) and  
							 ( ( "SOL_TRANSFERENCIA"."BASE" = :gs_base ) AND  
							 ( "SOL_TRANSFERENCIA"."SERIE" = :gs_serie ) AND  
							 ( "SOL_TRANSFERENCIA"."NUMERO" = :gi_numero ) AND  
							 ( "SOL_TRANSFERENCIA"."CORRELATIVO" = :ll_corr ) AND  
							 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
					Using	sqlca;
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
			wf_grabar_transferencia()
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_ultima_voluntad ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp,ll_capacidad,ll_total_pagado,ll_cod_parque,ll_rut_gerente_operaciones,ll_correlativo
Datetime	ldt_fec_nac,ldt_fecha,ldt_fecha_promesa,ldt_fecha_mant
String		ls_cod_sol,ls_est_mod,ls_estado_reg,ls_obs,ls_sexo,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_nro_sepultura,ls_sector,ls_area,ls_direccion_p,&
			ls_nro_particular,ls_depto_particular,ls_block_particular,ls_comuna,ls_ciudad,ls_poblacion,ls_estado_civil,ls_estado_contrato,ls_trato,&
			ls_nombre_cliente,ls_tipo_construccion,ls_total_pagado_palabras,	ls_fecha_promesa_palabas,ls_dir_p,ls_pob,ls_est_civil,ls_estado_cadena,&
			ls_fono_p,ls_dir_c,ls_fono_c,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_tipo_via_titulo
Double	ll_numero
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_ULTIMA_VOLUNTAD"  
			SET 		"ESTATUS_INFOR" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_ULTIMA_VOLUNTAD"."BASE" = ( SELECT  "SOL_ESTATUS"."BASE"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																				( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_ULTIMA_VOLUNTAD"."SERIE" = :gs_serie AND
						"SOL_ULTIMA_VOLUNTAD"."NUMERO" = :gi_numero AND
						"SOL_ULTIMA_VOLUNTAD"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_posesion_efectiva ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
			
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_POS_EFEC"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_POS_EFEC"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
															  FROM 	"SOL_ESTATUS"  
															  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																		( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																		( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																		( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																		( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																		( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_POS_EFEC"."SERIE" = :gs_serie AND
						"SOL_POS_EFEC"."NUMERO" = :gi_numero AND
						"SOL_POS_EFEC"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			if ls_est_mod='S' then
				ll_resp	= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_POS_EFEC"."DIRECCION_P",   "SOL_POS_EFEC"."POBLACION",   "SOL_POS_EFEC"."SECTOR",   "SOL_POS_EFEC"."COMUNA",   "SOL_POS_EFEC"."CIUDAD",   "SOL_POS_EFEC"."FONO_P",   "SOL_POS_EFEC"."FECHA_NAC",   "SOL_POS_EFEC"."ESTADO_CIVIL", "SOL_POS_EFEC"."DOMICILIO_C",   "SOL_POS_EFEC"."TOTAL_RENTA",  "SOL_POS_EFEC"."FONO_C",   "SOL_POS_EFEC"."GRUPO_F",  "SOL_POS_EFEC"."RUT_TITULAR"  ,   "SOL_POS_EFEC"."TIPO_VIA",   "SOL_POS_EFEC"."NUMERO_PARTICULAR",   "SOL_POS_EFEC"."DEPTO_PARTICULAR",   "SOL_POS_EFEC"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   						  :ls_pob,   						  :ls_sector,   				  :ls_comuna,   				  :ls_ciudad,   				  :ls_fono_p,   				  :ldt_fec_nac,   				  :ls_est_civil,   					:ls_dir_c,   						  :ll_renta,   						:ls_fono_c,   					:ll_grupo_f,   				:ll_rut ,								 :ls_tipo_via,						:ls_nro_part,								  :ls_depto_part,								:ls_block_part
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
			wf_grabar_transferencia()
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_transferencia ();String		ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_direc_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domicilio_c,ls_fono_c,ls_usuario,ls_base,ls_serie,&
			ls_tipo,ls_est_cob,ls_glosa_cob,ls_est_titular,ls_estado_responso,ls_dv_ben,ls_nom_ben,ls_ap_pat_ben,ls_ap_mat_ben,ls_dv_cli,ls_nom_cli,&
			ls_pat_cli,ls_mat_cli,ls_estado_reg,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_cod_sol
Long		ll_rut,ll_total_renta,ll_grupo_f,ll_correlativo,ll_rut_cli_original,ll_rut_aux,ll_rut_contacto,ll_rut_ben,ll_contar,ll_indi,ll_tot_reg
Datetime	ld_fec_nac,ld_fec_ing,ld_fec_cob
Double	ll_numero
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
il_rut						= dw_lista.getitemnumber(il_row,'rut_titular')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	SELECT	"SOL_CLIENTE"."RUT",   "SOL_CLIENTE"."DV",   "SOL_CLIENTE"."NOMBRES",   "SOL_CLIENTE"."AP_PATERNO",   "SOL_CLIENTE"."AP_MATERNO",   "SOL_CLIENTE"."DIRECCION_P",   "SOL_CLIENTE"."POBLACION",   "SOL_CLIENTE"."SECTOR",   "SOL_CLIENTE"."COMUNA",   "SOL_CLIENTE"."CIUDAD",   "SOL_CLIENTE"."FONO_P",   "SOL_CLIENTE"."SEXO",   "SOL_CLIENTE"."FECHA_NAC",   "SOL_CLIENTE"."ESTADO_CIVIL",   "SOL_CLIENTE"."DOMICILIO_C",   "SOL_CLIENTE"."FONO_C",   "SOL_CLIENTE"."FECHA_ING",   "SOL_CLIENTE"."TOTAL_RENTA",   "SOL_CLIENTE"."GRUPO_F",   "SOL_CLIENTE"."USUARIO",   "SOL_CLIENTE"."BASE",   "SOL_CLIENTE"."SERIE",   "SOL_CLIENTE"."NUMERO",   "SOL_CLIENTE"."CORRELATIVO",   "SOL_CLIENTE"."RUT_CLIENTE_ORI"  ,   "SOL_CLIENTE"."TIPO_VIA",   "SOL_CLIENTE"."NUMERO_PARTICULAR",   "SOL_CLIENTE"."DEPTO_PARTICULAR",   "SOL_CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ll_rut,   				  :ls_dv,   				:ls_nombre,   					:ls_ap_pat,   						:ls_ap_mat,   						:ls_direc_p,   					 :ls_pob,   						:ls_sector,   				  :ls_comuna,   				 :ls_ciudad,   				:ls_fono_p,   				  :ls_sexo,   				  :ld_fec_nac,   					 :ls_est_civil,   					:ls_domicilio_c,   				 :ls_fono_c,   				:ld_fec_ing,   				  :ll_total_renta,   				:ll_grupo_f,   				:ls_usuario,   				:ls_base,   				:ls_serie,   				 :ll_numero,   				:ll_correlativo,   				 :ll_rut_cli_original  ,				  :ls_tipo_via,					:ls_nro_part,								 :ls_depto_part,							 :ls_block_part
	FROM 	"SOL_CLIENTE"  
	WHERE 	"SOL_CLIENTE"."RUT_CLIENTE_ORI" = :il_rut and 
				"SOL_CLIENTE"."BASE" = :gs_base and  
				"SOL_CLIENTE"."SERIE" = :gs_serie and   
				"SOL_CLIENTE"."NUMERO" = :gi_numero and    
				"SOL_CLIENTE"."CORRELATIVO" = :il_correlativo   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		SELECT	"CLIENTE"."RUT"  
		INTO 		:ll_rut_aux  
		FROM 	"CLIENTE"  
		WHERE 	"CLIENTE"."RUT" = :ll_rut   
		USING	sqlca;
		if sqlca.sqlcode=100 then
			messagebox("Advertencia","Cliente a Transferir No Existe, será grabado a Tabla de CLIENTE")
			ls_tipo					= '0'
			ls_est_cob				= '0'
			setnull(ld_fec_cob)
			ls_glosa_cob			= ''
			ls_est_titular			= 'A'
			ll_rut_contacto			= 0
			ls_estado_responso	= '0'
			INSERT INTO	  "CLIENTE"  
							( "RUT",   "TIPO",   "NOMBRE",   "A_PATERNO",   "A_MATERNO",   "DIRECCION_P",   "POBLACION",   "SECTOR",   "COMUNA",   "CIUDAD",   "FONO_P",   "SEXO",   "FECHA_NAC",   "ESTA_CIVIL",   "DOMICILIO_C",   "FONO_C",   "FECHA_INGR",   "TOTAL_RENT",   "GRUPO_F",   "DV",   "ESTADO_COBRANZA",   "FECHA_COBRANZA",   "GLOSA_COBRANZA",   "USUARIO",   "ESTADO_TITULAR",   "RUT_CONTACTO",   "ESTADO_RESPONSO",	"TIPO_VIA",		"NUMERO_PARTICULAR",	"DEPTO_PARTICULAR",	"BLOCK_PARTICULAR" )  
			VALUES 		( :ll_rut, :ls_tipo, :ls_nombre, :ls_ap_pat,    :ls_ap_mat,   	:ls_direc_p,     :ls_pob,   	  :ls_sector, :ls_comuna, :ls_ciudad, :ls_fono_p, :ls_sexo, :ld_fec_nac,   :ls_est_civil,  :ls_domicilio_c, :ls_fono_c, :ld_fec_ing,    :ll_total_renta,:ll_grupo_f, :ls_dv, :ls_est_cob,   		  :ld_fec_cob,   		 :ls_glosa_cob,   	:gs_user,    :ls_est_titular,    :ll_rut_contacto, :ls_estado_responso,	:ls_tipo_via,	:ls_nro_part,			:ls_depto_part,		:ls_block_part )  
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
			if ls_cod_sol='19' then
				DELETE FROM "COPROP_ISACRUZ"  
				WHERE 	( "COPROP_ISACRUZ"."SERIE" = :gs_serie ) AND  
							( "COPROP_ISACRUZ"."NUMERO" = :gi_numero )   
				Using		sqlca  ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				ll_tot_reg					= dw_benefi.retrieve(gs_base,gs_serie,gi_numero,il_rut,ll_rut)
				if ll_tot_reg>0 then
					ll_contar=0
					for ll_indi=1 to ll_tot_reg
						ll_rut_ben			= dw_benefi.getitemnumber(ll_indi,'rut')
						ls_dv_ben			= dw_benefi.getitemstring(ll_indi,'dv')
						ls_nom_ben			= dw_benefi.getitemstring(ll_indi,'nombres')
						ls_ap_pat_ben		= dw_benefi.getitemstring(ll_indi,'ap_paterno')
						ls_ap_mat_ben		= dw_benefi.getitemstring(ll_indi,'ap_materno')
						if not isnull(ls_nom_ben) and not isnull(ls_ap_pat_ben) and ls_nom_ben<>'' and ls_ap_pat_ben<>'' then
							ll_contar++
							if isnull(ll_rut_ben) then ll_rut_ben=0
							if isnull(ls_dv_ben) then ls_dv_ben=''
							if isnull(ls_ap_mat_ben) then ls_ap_mat_ben=''
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
					next
				end if
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
							 ( "OFERTA_V"."ULT_FOLIO" = (   SELECT "OFERTA_V"."ULT_FOLIO"  
																	 	FROM   "OFERTA_V",   
																				  "PAGO_OFERTA"  
																		WHERE ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
																				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
																				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
																				 ( ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
																				 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ))))   
					Using	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						DELETE FROM "CO_PROP"  
						WHERE ( "CO_PROP"."SERIE" = :gs_serie ) AND  
								( "CO_PROP"."NRO_OFERTA" = :gi_numero )   
						Using	sqlca ;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
						ll_tot_reg					= dw_benefi.retrieve(gs_base,gs_serie,gi_numero,il_rut,ll_rut)
						if ll_tot_reg>0 then
							ll_contar					= 0
							for ll_indi=1 to ll_tot_reg
								ll_rut_ben			= dw_benefi.getitemnumber(ll_indi,'rut')
								ls_dv_ben			= dw_benefi.getitemstring(ll_indi,'dv')
								ls_nom_ben			= dw_benefi.getitemstring(ll_indi,'nombres')
								ls_ap_pat_ben		= dw_benefi.getitemstring(ll_indi,'ap_paterno')
								ls_ap_mat_ben		= dw_benefi.getitemstring(ll_indi,'ap_materno')
								if not isnull(ls_nom_ben) and not isnull(ls_ap_pat_ben) and ls_nom_ben<>'' and ls_ap_pat_ben<>'' then
									ll_contar++
									if isnull(ll_rut_ben) then ll_rut_ben=0
									if isnull(ls_dv_ben) then ls_dv_ben=''
									if isnull(ls_ap_mat_ben) then ls_ap_mat_ben=''
									INSERT INTO "CO_PROP"  
												( "CONTADOR",   "SERIE",   "NRO_OFERTA",   "RUT",   		"NOMBRE",   "A_PATERNO",   "A_MATERNO" )  
									VALUES 	( :ll_contar,   :gs_serie, :gi_numero,   	 :ll_rut_ben,  :ls_nom_ben,:ls_ap_pat_ben,:ls_ap_mat_ben )  
									Using		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if						
								end if
								setnull(ll_rut_ben);setnull(ls_dv_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)	
							next
						end if
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
				UPDATE	"ANEXO_LIBERADOR"  
				SET 		"RUT" = :ll_rut  
				WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND  
							( "ANEXO_LIBERADOR"."ULT_FOLIO" = (  SELECT "ANEXO_LIBERADOR"."ULT_FOLIO"  
																				 FROM "ANEXO_LIBERADOR",   
																						  "PAGO_LIBERADOR"  
																				 WHERE ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
																						  ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
																						  ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
																						  ( ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
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
			
		CASE "F","G" // Anexo Funeraria
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
							( "PRODUCTO_ANEXO"."ULT_FOLIO" = (  SELECT "PRODUCTO_ANEXO"."ULT_FOLIO"  
																				 FROM "PRODUCTO_ANEXO",   
																						  "PRODUCTO_PAGO"  
																				 WHERE ( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
																				 		  ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
																						  ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
																						  ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
																						  (("PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
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
							( "ANEXO_AUMENTO"."ULT_FOLIO" = (  SELECT "ANEXO_AUMENTO"."ULT_FOLIO"  
																				 FROM "ANEXO_AUMENTO",   
																						  "PAGO_AUMENTO"  
																				 WHERE ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
																						  ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
																						  ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
																						  ( ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
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
			if ls_cod_sol='19' then
				DELETE FROM "COPROP_ISACRUZ"  
				WHERE 	( "COPROP_ISACRUZ"."SERIE" = :gs_serie ) AND  
							( "COPROP_ISACRUZ"."NUMERO" = :gi_numero )   
				Using		sqlca  ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				ll_tot_reg	= dw_benefi.retrieve(gs_base,gs_serie,gi_numero,il_rut,ll_rut)
				if ll_tot_reg>0 then
					ll_contar=0
					for ll_indi=1 to ll_tot_reg
						ll_rut_ben		= dw_benefi.getitemnumber(ll_indi,'rut')
						ls_dv_ben		= dw_benefi.getitemstring(ll_indi,'dv')
						ls_nom_ben		= dw_benefi.getitemstring(ll_indi,'nombres')
						ls_ap_pat_ben	= dw_benefi.getitemstring(ll_indi,'ap_paterno')
						ls_ap_mat_ben	= dw_benefi.getitemstring(ll_indi,'ap_materno')
						if not isnull(ls_nom_ben) and not isnull(ls_ap_pat_ben) and ls_nom_ben<>'' and ls_ap_pat_ben<>'' then
							ll_contar++
							if isnull(ll_rut_ben) then ll_rut_ben=0
							if isnull(ls_dv_ben) then ls_dv_ben=''
							if isnull(ls_ap_mat_ben) then ls_ap_mat_ben=''
							if ls_cod_sol='19' then
								INSERT INTO "COPROP_ISACRUZ"  
											( "SERIE",   "NUMERO",   "LINEA",   "RUT",   	"DV",   		"NOMBRES",   "APATERNO",   	"AMATERNO",			"BASE",		"ESTADO_HEREDERO" )  
								VALUES 	( :gs_serie, :gi_numero, :ll_contar,:ll_rut_ben,:ls_dv_ben, :ls_nom_ben, :ls_ap_pat_ben,  :ls_ap_mat_ben,	:gs_base,	'S' )  
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							else
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
						end if
						setnull(ll_rut_ben);setnull(ls_dv_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)	
					next
				end if
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
						ll_tot_reg	= dw_benefi.retrieve(gs_base,gs_serie,gi_numero,il_rut,ll_rut)
						if ll_tot_reg>0 then
							ll_contar=0
							for ll_indi=1 to ll_tot_reg
								ll_rut_ben		= dw_benefi.getitemnumber(ll_indi,'rut')
								ls_dv_ben		= dw_benefi.getitemstring(ll_indi,'dv')
								ls_nom_ben		= dw_benefi.getitemstring(ll_indi,'nombres')
								ls_ap_pat_ben	= dw_benefi.getitemstring(ll_indi,'ap_paterno')
								ls_ap_mat_ben	= dw_benefi.getitemstring(ll_indi,'ap_materno')
								if not isnull(ls_nom_ben) and not isnull(ls_ap_pat_ben) and ls_nom_ben<>'' and ls_ap_pat_ben<>'' then
									ll_contar++
									if isnull(ll_rut_ben) then ll_rut_ben=0
									if isnull(ls_dv_ben) then ls_dv_ben=''
									if isnull(ls_ap_mat_ben) then ls_ap_mat_ben=''
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
							next
						end if
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
			 ( "SOL_CLIENTE"."CORRELATIVO" = :il_correlativo )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		if isvalid(w_ingreso_solicitudes) then
			w_ingreso_solicitudes.st_rut.text		= string(ll_rut,"###,###,###,##0")+' - '+ls_dv_cli
			w_ingreso_solicitudes.st_nombre.text	= trim(ls_nom_cli)+' '+trim(ls_pat_cli)+' '+trim(ls_mat_cli)
		end if
		if isvalid(w_listado_contratos) then
			w_listado_contratos.dw_listado.Retrieve(gi_numero)
		end if
		if isvalid(w_detalle_solicitudes) then
			w_detalle_solicitudes.dw_reporte.object.ctto.text		= gs_base+' - '+gs_serie+' - '+string(gi_numero,'###,###,###,##0')
			w_detalle_solicitudes.dw_reporte.object.t_rut.text		= string(ll_rut,"###,###,###,##0")+' - '+ls_dv_cli
			w_detalle_solicitudes.dw_reporte.object.t_nombre.text	= trim(ls_nom_cli)+' '+trim(ls_pat_cli)+' '+trim(ls_mat_cli)
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_coprop_promesa ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp,ll_ctas_pag_m,ll_ctas,ll_ctas_repacta,ll_ctas_en_mora,ll_rut_co,ll_max_co
Datetime	ldt_fec_nac,ldt_fecha,ldt_fecha_hoy,ldt_fec_nac_co
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado,ls_estado_reg,ls_base,&
			ls_serie,ls_anexo_lib,ls_anexo_repacta,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_dv_co, ls_nom_co, ls_ap_pat_co, ls_ap_mat_co
Double	ll_numero
ldt_fecha					= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy			= datetime(idt_fecha_hoy,time('00:00:00'))
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
ll_rut						= dw_lista.getitemnumber(il_row,'rut_cliente')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_COPROP_PROMESA"  
			SET 		"ESTATUS_INFOR" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_COPROP_PROMESA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																		  FROM 	"SOL_ESTATUS"  
																		  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																					( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																					( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																					( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																					( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																					( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_COPROP_PROMESA"."SERIE" = :gs_serie AND
						"SOL_COPROP_PROMESA"."NUMERO" = :gi_numero AND
						"SOL_COPROP_PROMESA"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
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
						 ( "SOL_COPROP_PROMESA_DETALLE"."CORRELATIVO" = :ll_corr ) AND  
						 ( "SOL_COPROP_PROMESA_DETALLE"."ESTADO_REG" = 'A' )   
				USING		sqlca;
				open x1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0 
						fetch x1 into :ll_rut_co, :ls_dv_co, :ls_nom_co, :ls_ap_pat_co, :ls_ap_mat_co, :ldt_fec_nac_co;
						if not isnull(ls_nom_co) then
							SELECT	MAX("COPROP_ISACRUZ"."LINEA")  
							INTO 		:ll_max_co  
							FROM 	"COPROP_ISACRUZ"  
							USING	sqlca;
							ll_max_co ++
							if ll_max_co>0 then
								INSERT INTO "COPROP_ISACRUZ"  
											(	"SERIE",		"NUMERO",	"LINEA",		"RUT",		"DV",			"NOMBRES",	"APATERNO",		"AMATERNO",		"BASE" )  
								VALUES 	( 	:gs_serie,	:gi_numero,	:ll_max_co,	:ll_rut_co,	:ls_dv_co,	:ls_nom_co, :ls_ap_pat_co, 	:ls_ap_mat_co, 	:gs_base)  
								USING		Trans_1;
								if Trans_1.sqlcode=0 then
									commit using Trans_1;
								else
									rollback using Trans_1;
								end if
							end if
						end if
						setnull(ls_nom_co)
					LOOP
				end if
				close x1;
			else
				rollback;
			end if
			
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_ctto_definitivo ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,cta_pag_s,cta_pag_m,nro_cuotas,ret,dias,ret1,ret11,ll_max,ll_mora_credito,&
			cta_pag_la,cta_pag_isa,ll_mora_mant,ll_resp
Datetime	ldt_fec_nac,ldt_fecha,ldt_fecha_prim,fecha_prim,fecha_man,fecha_vto
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part,ls_estado_cadena
Double	ll_numero
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_CONTRATO_DEF"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_CONTRATO_DEF"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																	  FROM 	"SOL_ESTATUS"  
																	  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																				( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_CONTRATO_DEF"."SERIE" = :gs_serie AND
						"SOL_CONTRATO_DEF"."NUMERO" = :gi_numero AND
						"SOL_CONTRATO_DEF"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		
			SELECT	max("CARTA_LOG"."CORRELATIVO")  
			INTO 		:ll_max  
			FROM 		"CARTA_LOG"  
			Using		sqlca;
			if sqlca.sqlcode=0 then
				if ll_max<=0 then
					ll_max	= 1
				else
					ll_max++
				end if
		
				CHOOSE CASE gs_base
					CASE 'O'
						SELECT	"OFERTA_V"."CTA_PAG_S",   "OFERTA_V"."CTA_PAG_M",   "PAGO_OFERTA"."FECHA_PRIM",	"PAGO_OFERTA"."NRO_CUOTAS",	"OFERTA_V"."FECHA_M",	"CADENA"."ESTADO"  
						INTO 		:cta_pag_s,   				  :cta_pag_m,   				 :fecha_prim, 						:nro_cuotas,						:fecha_man,					:ls_estado_cadena
						FROM 	"OFERTA_V",   
									"PAGO_OFERTA",
									"CADENA"
						WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
						       ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
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
							ret11 		= -daysafter(idt_fecha_hoy,funcion_venc_ano( fecha_man , cta_pag_m  ))
							if ret11 < 0 then 
								ret1		= 0
							end if
							if ret <= 0 then
								ret		= 0 //mora_credito
							end if
							ll_mora_credito= ret
		
							if ret1 <= 0 then
								ret1		= 0 //mora mantencion
							end if	
							ll_mora_mant= ret1
						end if
						
					CASE 'C'
						SELECT	"CONTRATO"."CTA_PAG_M",   "CONTRATO"."FECHA_M"  
						INTO 		:cta_pag_m,   				  :fecha_prim  
						FROM 		"CADENA",   
									"CONTRATO"  
						WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
								 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
								 (("CADENA"."CODIGO" = :gs_base ) AND  
								 ( "CADENA"."SERIE" = :gs_serie ) AND  
								 ( "CADENA"."NUMERO" = :gi_numero ) )   
						Using		sqlca;
						if sqlca.sqlcode=0 then
							ret1 					= f_mant (fecha_prim, cta_pag_m)
							ret11 				= -daysafter(idt_fecha_hoy,funcion_venc_ano( fecha_prim , cta_pag_m  ))
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
								ret				 	= 0
							end if	
							ll_mora_mant		= ret
						end if
		
					CASE 'F'
						SELECT	"PRODUCTO_PAGO"."PLAZO",   "PRODUCTO_PAGO"."FECHA_PRIM",   	"PRODUCTO_ANEXO"."CUOTAS_PAG",		"CADENA"."ESTADO"
						INTO 		:nro_cuotas,   						:fecha_prim,   									:cta_pag_s  ,										:ls_estado_cadena
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
								ret				 	= 0
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
						SELECT	"DERECHO"."FECHA_PRIM",   "DERECHO"."PLAZO",   "DERECHO"."CTA_PAG_LA",   "DERECHO"."CTA_PAG_ISA"  ,	"CADENA"."ESTADO"
						INTO 		:fecha_prim,   			  :nro_cuotas,   		  :cta_pag_la,   				 :cta_pag_isa  ,					:ls_estado_cadena
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
						SELECT	"REPACTA_MANTENCION"."CUOTAS_PACTADAS",   "REPACTA_MANTENCION"."FECHA_PRIMERA_CTA",   "REPACTA_MANTENCION"."CTAS_PAGADAS"  ,	"CADENA"."ESTADO"
						INTO 		:nro_cuotas,   									:fecha_prim,   									  :cta_pag_s  ,									:ls_estado_cadena
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
				VALUES   ( :gs_base, :gs_serie, :gi_numero, :ll_rut, :gs_base,   	  '0',   			:ldt_fecha,   	  :ll_mora_credito,  '8',   			 :ll_corr,   		:ll_mora_mant, '0' )  
				Using		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			end if
			if ls_est_mod='S' then
				ll_resp			= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_CONTRATO_DEF"."DIRECCION_P",   "SOL_CONTRATO_DEF"."POBLACION",   "SOL_CONTRATO_DEF"."SECTOR",   "SOL_CONTRATO_DEF"."COMUNA",   "SOL_CONTRATO_DEF"."CIUDAD",   "SOL_CONTRATO_DEF"."FONO_P",   "SOL_CONTRATO_DEF"."FECHA_NAC",   "SOL_CONTRATO_DEF"."ESTADO_CIVIL",   "SOL_CONTRATO_DEF"."DOMICILIO_C",   "SOL_CONTRATO_DEF"."TOTAL_RENTA",   "SOL_CONTRATO_DEF"."FONO_C",   "SOL_CONTRATO_DEF"."GRUPO_F",   "SOL_CONTRATO_DEF"."RUT_TITULAR",   "SOL_CONTRATO_DEF"."TIPO_VIA",   "SOL_CONTRATO_DEF"."NUMERO_PARTICULAR",   "SOL_CONTRATO_DEF"."DEPTO_PARTICULAR",   "SOL_CONTRATO_DEF"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   								:ls_pob,   								 :ls_sector,   					  :ls_comuna,   					   :ls_ciudad,   						 :ls_fono_p,   					  :ldt_fec_nac,   						:ls_est_civil,   							 :ls_dir_c,   								 :ll_renta,   								 :ls_fono_c,   					  :ll_grupo_f,   						 :ll_rut  ,									 :ls_tipo_via,							 :ls_nro_part,										 :ls_depto_part,									:ls_block_part
					FROM 	"SOL_CONTRATO_DEF",   
								"SOL_ESTATUS"  
					WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_CONTRATO_DEF"."BASE" ) and  
							 ( "SOL_ESTATUS"."SERIE" = "SOL_CONTRATO_DEF"."SERIE" ) and  
							 ( "SOL_ESTATUS"."NUMERO" = "SOL_CONTRATO_DEF"."NUMERO" ) and  
							 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CONTRATO_DEF"."CORRELATIVO" ) and  
							 ( ( "SOL_CONTRATO_DEF"."BASE" = :gs_base ) AND  
							 ( "SOL_CONTRATO_DEF"."SERIE" = :gs_serie ) AND  
							 ( "SOL_CONTRATO_DEF"."NUMERO" = :gi_numero ) AND  
							 ( "SOL_CONTRATO_DEF"."CORRELATIVO" = :ll_corr ) AND  
							 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
					Using	sqlca;
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_reactiva_ctto_resuelto ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp,ll_ctas_pag_m,ll_ctas,ll_ctas_repacta,ll_ctas_en_mora
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado,ls_estado_reg,ls_base,&
			ls_serie,ls_anexo_lib,ls_anexo_repacta,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
Double	ll_numero
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_REACTIVA"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_REACTIVA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
															  FROM 	"SOL_ESTATUS"  
															  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																		( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																		( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																		( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																		( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																		( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_REACTIVA"."SERIE" = :gs_serie AND
						"SOL_REACTIVA"."NUMERO" = :gi_numero AND
						"SOL_REACTIVA"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				if gs_base='L' then
					SELECT	"ANEXO_LIBERADOR"."BASE",   
								"ANEXO_LIBERADOR"."SERIE",   
								"ANEXO_LIBERADOR"."NRO_OFERTA"  
					INTO 		:ls_base,   
								:ls_serie,   
								:ll_numero  
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
							CASE 'O'
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
									if ll_ctas_pag_m < 99 then
										ll_ctas			= 99 + ll_ctas_pag_m
										ls_anexo_lib	= gs_base+gs_serie+string(gi_numero)
										UPDATE	"OFERTA_V"  
										SET 		"CTA_PAG_M" = :ll_ctas,   
													"ANEXO_LIB" = :ls_anexo_lib  
										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
										USING		sqlca;
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
								FROM 		"CONTRATO"  
								WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
										 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									if ll_ctas_pag_m < 99 then
										ll_ctas			= 99 + ll_ctas_pag_m
										ls_anexo_lib	= gs_base+gs_serie+string(gi_numero)
										UPDATE	"CONTRATO"  
										SET 		"CTA_PAG_M" = :ll_ctas,   
													"ANEXO_LIB" = :ls_anexo_lib  
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
									USING		sqlca;
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
									USING		sqlca;
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
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ls_anexo_repacta	= gs_base+gs_serie+string(gi_numero)
									ll_ctas				= ll_ctas_repacta + ll_ctas_en_mora
									UPDATE	"OFERTA_V"  
									SET 		"ANEXO_REPACTA" = :ls_anexo_repacta,   
												"CTA_PAG_M" = :ll_ctas,
												"CTA_REPACTA" = :ll_ctas_en_mora  
									WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
											 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
									USING		sqlca;
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
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ls_anexo_repacta	= gs_base+gs_serie+string(gi_numero)
									ll_ctas				= ll_ctas_repacta + ll_ctas_en_mora
									UPDATE	"CONTRATO"  
									SET 		"ANEXO_REPACTA" = :ls_anexo_repacta,   
												"CTA_PAG_M" = :ll_ctas,
												"CTA_REPACTA" = :ll_ctas_en_mora  
									WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
											 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
						END CHOOSE
					end if
				end if
				//////////////////////// Fin Nuevo ///////////////////////////////
			else
				rollback;
			end if
			ls_estado	= 'V'
			UPDATE	"CADENA"  
			SET 		"ESTADO" = :ls_estado   
			WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
						( "CADENA"."SERIE" = :gs_serie ) AND  
						( "CADENA"."NUMERO" = :gi_numero )   
			Using		sqlca ;
			if sqlca.sqlcode=0 then
				commit;
				if gs_base='R' then
					UPDATE	"REPACTA_MANTENCION"  
					SET 		"ESTADO_PAGO" = :ls_estado 
					WHERE  ( "REPACTA_MANTENCION"."BASE" = :gs_base ) AND  
							 ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
							 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
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
			if ls_est_mod='S' then
				ll_resp	= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_REACTIVA"."DIRECCION_P",   "SOL_REACTIVA"."POBLACION",   "SOL_REACTIVA"."SECTOR",   "SOL_REACTIVA"."COMUNA",   "SOL_REACTIVA"."CIUDAD",   "SOL_REACTIVA"."FONO_P",   "SOL_REACTIVA"."FECHA_NAC",   "SOL_REACTIVA"."ESTADO_CIVIL",   "SOL_REACTIVA"."DOMICILIO_C",   "SOL_REACTIVA"."TOTAL_RENTA",   "SOL_REACTIVA"."FONO_C",   "SOL_REACTIVA"."GRUPO_F",   "SOL_REACTIVA"."RUT_TITULAR"  ,   "SOL_REACTIVA"."TIPO_VIA",   "SOL_REACTIVA"."NUMERO_PARTICULAR",   "SOL_REACTIVA"."DEPTO_PARTICULAR",   "SOL_REACTIVA"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   						  :ls_pob,   						  :ls_sector,   				  :ls_comuna,   				  :ls_ciudad,   				  :ls_fono_p,   				  :ldt_fec_nac,   				  :ls_est_civil,   					  :ls_dir_c,   						 :ll_renta,   							:ls_fono_c,   					:ll_grupo_f,   				 :ll_rut ,									:ls_tipo_via,					 :ls_nro_part,									:ls_depto_part,							 :ls_block_part
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_pac ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
			
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_PAC"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_PAC"."BASE" =      ( SELECT	"SOL_ESTATUS"."BASE"  
														  FROM 	"SOL_ESTATUS"  
														  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																	( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																	( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																	( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																	( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																	( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_PAC"."SERIE" = :gs_serie AND
						"SOL_PAC"."NUMERO" = :gi_numero AND
						"SOL_PAC"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			if ls_est_mod='S' then
				ll_resp	= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_PAC"."DIRECCION_P",  "SOL_PAC"."POBLACION",   "SOL_PAC"."SECTOR",   "SOL_PAC"."COMUNA",   "SOL_PAC"."CIUDAD",   "SOL_PAC"."FONO_P",   "SOL_PAC"."FECHA_NAC",   "SOL_PAC"."ESTADO_CIVIL", "SOL_PAC"."DOMICILIO_C", "SOL_PAC"."TOTAL_RENTA", "SOL_PAC"."FONO_C",  "SOL_PAC"."GRUPO_F", "SOL_PAC"."RUT_TITULAR"  , "SOL_PAC"."TIPO_VIA",   "SOL_PAC"."NUMERO_PARTICULAR",   "SOL_PAC"."DEPTO_PARTICULAR",   "SOL_PAC"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   				  :ls_pob,   					:ls_sector,   			 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ldt_fec_nac,   			  :ls_est_civil,   			 :ls_dir_c,   				  :ll_renta,   				:ls_fono_c,   			:ll_grupo_f,   		:ll_rut ,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					  :ls_block_part
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_repactacion_fecha ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part,ls_estado_at_pub,ls_glosa

ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_REPACTA_CVTA"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_REPACTA_CVTA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																	  FROM 	"SOL_ESTATUS"  
																	  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																				( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_REPACTA_CVTA"."SERIE" = :gs_serie AND
						"SOL_REPACTA_CVTA"."NUMERO" = :gi_numero AND
						"SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
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
			else
				rollback;
			end if
			// grabar
			wf_grabar_repacta_compraventa()
			if ls_est_mod='S' then
				ll_resp	= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_REPACTA_CVTA"."DIRECCION_P",   "SOL_REPACTA_CVTA"."POBLACION",   "SOL_REPACTA_CVTA"."SECTOR",   "SOL_REPACTA_CVTA"."COMUNA",   "SOL_REPACTA_CVTA"."CIUDAD",   "SOL_REPACTA_CVTA"."FONO_P",   "SOL_REPACTA_CVTA"."FECHA_NAC",   "SOL_REPACTA_CVTA"."ESTADO_CIVIL",   "SOL_REPACTA_CVTA"."DOMICILIO_C",   "SOL_REPACTA_CVTA"."TOTAL_RENTA",   "SOL_REPACTA_CVTA"."FONO_C",   "SOL_REPACTA_CVTA"."GRUPO_F",   "SOL_REPACTA_CVTA"."RUT_TITULAR"  ,   "SOL_REPACTA_CVTA"."TIPO_VIA",   "SOL_REPACTA_CVTA"."NUMERO_PARTICULAR",   "SOL_REPACTA_CVTA"."DEPTO_PARTICULAR",   "SOL_REPACTA_CVTA"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   								:ls_pob,   								 :ls_sector,   					  :ls_comuna,   						:ls_ciudad,   						 :ls_fono_p,   					  :ldt_fec_nac,   						:ls_est_civil,   							 :ls_dir_c,   								 :ll_renta,   								 :ls_fono_c,   					  :ll_grupo_f,   						 :ll_rut ,										:ls_tipo_via,							:ls_nro_part,										:ls_depto_part,									:ls_block_part
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_repacta_compraventa ();datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_ult,ldt_fecha_entre,ldt_fecha_pie,ldt_fecha_mod,	ldt_fecha_fact,ld_fec_1er_vcto,ld_fec_vcto,ld_fec_prox_pago,ldt_fecha_hoy,ldt_fecha_m,&
			ldt_fec_venc_mant,ldt_fecha_prim_pie
Long		ll_correlativo,ll_precio,ll_capacidad,ll_des_esp,ll_nro_cuotas,ll_parque,ll_gastos_adm,&
			ll_factura,ll_pie_pagado,ll_rut,ll_cod_parque,ll_count_vig,ll_codigo_tipo_seguro,ll_ctas_pactadas_pie,ll_ctas_pagadas_pie
String		ls_serie,ls_n_reduccion,ls_moneda,ls_modificado,ls_area,ls_sector,ls_sepultura,ls_carta_bienv,ls_nro_tecnico,ls_estado_reg,ls_dv,ls_obs_sepultura,ls_dicom,&
			ls_base
Double	ll_pie,ll_tasa,ll_valor_cuota,ll_uf_dia,ll_total_fact,ldb_valor_cuota_m,ldb_tasa_base,ll_nro_aumento,ll_nro_oferta,ll_numero,ll_ult_folio,ll_folio,ll_derecho_lib

SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM 	"TASA"  ;
ldt_fecha					= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy			= datetime(idt_fecha_hoy,time("00:00:00"))
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if gs_base='O' then
	if ls_estado_reg='A' then
		SELECT 	"SOL_REPACTA_CVTA"."FECREP_1_VCTO",   "SOL_REPACTA_CVTA"."FECREP_ULT_VCTO",   "SOL_REPACTA_CVTA"."FECHA_PROX_VCTO"  
		INTO 		:ld_fec_1er_vcto,   						  :ld_fec_vcto,   								:ld_fec_prox_pago  
		FROM 	"SOL_REPACTA_CVTA"  
		WHERE 	( "SOL_REPACTA_CVTA"."BASE" = :gs_base ) AND  
					( "SOL_REPACTA_CVTA"."SERIE" = :gs_serie ) AND  
					( "SOL_REPACTA_CVTA"."NUMERO" = :ll_numero ) AND  
					( "SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_correlativo )   
		Using	sqlca;
		if sqlca.sqlcode=0 then
			// ver si existe en oferta_v y rescatar ult_folio
			SELECT	  "OFERTA_V"."ULT_FOLIO",	"OFERTA_V"."RUT",	"CLIENTE"."DV",	"OFERTA_V"."VALOR_CUOTA_M",	"CADENA"."COD_PARQUE",	"OFERTA_V"."FECHA_M"
			INTO 		  :ll_ult_folio,				:ll_rut,				:ls_dv,				:ldb_valor_cuota_m,				:ll_cod_parque,			:ldt_fecha_m
			FROM 	  "OFERTA_V",	"PAGO_OFERTA",	"CADENA",	"CLIENTE"
			WHERE 	( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
         			( "CLIENTE"."RUT" = "OFERTA_V"."RUT" ) and  
						( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						( "PAGO_OFERTA"."SERIE" = "CADENA"."SERIE" ) and  
						( "PAGO_OFERTA"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
						( ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) AND  
						( "CADENA"."CODIGO" = :gs_base ) ) 
			Using		sqlca;
			if sqlca.sqlcode=0 then // si existe rescata todo los datos
				SELECT	"PAGO_OFERTA"."SERIE",   "PAGO_OFERTA"."NRO_OFERTA",   "PAGO_OFERTA"."FECHA",   "PAGO_OFERTA"."FOLIO",   "PAGO_OFERTA"."PRECIO",   "PAGO_OFERTA"."PIE",   "PAGO_OFERTA"."TASA",   "PAGO_OFERTA"."CAPACIDAD",   "PAGO_OFERTA"."N_REDUCCION",   "PAGO_OFERTA"."VALOR_CUOTA",   "PAGO_OFERTA"."DES_ESP",   "PAGO_OFERTA"."NRO_CUOTAS",   "PAGO_OFERTA"."UF_DIA",   "PAGO_OFERTA"."MONEDA",   "PAGO_OFERTA"."FECHA_PRIM",   "PAGO_OFERTA"."FECHA_ULT",   "PAGO_OFERTA"."FECHA_ENTRE",   "PAGO_OFERTA"."FECHA_PIE",   "PAGO_OFERTA"."MODIFICADO",   "PAGO_OFERTA"."FECHA_MOD",   "PAGO_OFERTA"."AREA",   "PAGO_OFERTA"."PARQUE",   "PAGO_OFERTA"."SECTOR",   "PAGO_OFERTA"."SEPULTURA",   "PAGO_OFERTA"."DERECHO_LIB",   "PAGO_OFERTA"."GASTOS_ADM",   "PAGO_OFERTA"."FACTURA",   "PAGO_OFERTA"."FECHA_FACT",   "PAGO_OFERTA"."TOTAL_FACT",   "PAGO_OFERTA"."CARTA_BIENV",   "PAGO_OFERTA"."PIE_PAGADO",   "PAGO_OFERTA"."NRO_TECNICO",	"PAGO_OFERTA"."OBS_SEPULTURA"	,	"PAGO_OFERTA"."TASA_BASE",	"PAGO_OFERTA"."CODIGO_TIPO_SEGURO",	"PAGO_OFERTA"."DICOM",	"PAGO_OFERTA"."CTAS_PACTADAS_PIE",	"PAGO_OFERTA"."CTAS_PAGADAS_PIE",	"PAGO_OFERTA"."FECHA_PRIM_PIE"  
				INTO 		:ls_serie,   				 :ll_nro_oferta,   				 :ldt_fecha,   			  :ll_folio,   			   :ll_precio,   				  :ll_pie,   				 :ll_tasa,   				 :ll_capacidad,   				:ls_n_reduccion,   				 :ll_valor_cuota,   				  :ll_des_esp,   				  :ll_nro_cuotas,   				  :ll_uf_dia,   				 :ls_moneda,   			   :ldt_fecha_prim,   				:ldt_fecha_ult,   			  :ldt_fecha_entre,   				:ldt_fecha_pie,   			  :ls_modificado,   				  :ldt_fecha_mod,   				 :ls_area,   				 :ll_parque,   				:ls_sector,   				  :ls_sepultura,   				 :ll_derecho_lib,   				  :ll_gastos_adm,   				  :ll_factura,   				  :ldt_fecha_fact,   			  :ll_total_fact,   				  :ls_carta_bienv,   				:ll_pie_pagado,   				:ls_nro_tecnico,					:ls_obs_sepultura,					:ldb_tasa_base,				:ll_codigo_tipo_seguro,					:ls_dicom,					:ll_ctas_pactadas_pie,					:ll_ctas_pagadas_pie,					:ldt_fecha_prim_pie  
				FROM 	"PAGO_OFERTA"  
				WHERE 	( "PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
							( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) AND  
							( "PAGO_OFERTA"."FOLIO" = :ll_ult_folio )   
				Using		sqlca;
				if sqlca.sqlcode=0 then // incrementa 1 el folio y lo inserta en pago_oferta
					ll_folio		= Double(string(ll_numero)+string(ll_correlativo))
					INSERT INTO "PAGO_OFERTA"  
								( "SERIE",   "NRO_OFERTA",   "FECHA",   		"FOLIO",   "PRECIO",   "PIE",   "TASA",   "CAPACIDAD",   "N_REDUCCION",   "VALOR_CUOTA",   "DES_ESP",   "NRO_CUOTAS",   "UF_DIA",   "MONEDA",   "FECHA_PRIM",   	"FECHA_ULT",   "FECHA_ENTRE",   "FECHA_PIE",   "MODIFICADO",   "FECHA_MOD",   "AREA",   "PARQUE",   "SECTOR",   "SEPULTURA",   "DERECHO_LIB",   "GASTOS_ADM",   "FACTURA",   "FECHA_FACT",   "TOTAL_FACT",   "CARTA_BIENV",   "PIE_PAGADO",   "NRO_TECNICO",	"PAGO_OFERTA"."OBS_SEPULTURA"	,	"PAGO_OFERTA"."TASA_BASE",	"PAGO_OFERTA"."CODIGO_TIPO_SEGURO",	"PAGO_OFERTA"."DICOM",	"PAGO_OFERTA"."CTAS_PACTADAS_PIE",	"PAGO_OFERTA"."CTAS_PAGADAS_PIE",	"PAGO_OFERTA"."FECHA_PRIM_PIE"   )  
					VALUES 	( :ls_serie, :ll_nro_oferta, :ldt_fecha_hoy,	:ll_folio, :ll_precio, :ll_pie, :ll_tasa, :ll_capacidad, :ls_n_reduccion, :ll_valor_cuota, :ll_des_esp, :ll_nro_cuotas, :ll_uf_dia, :ls_moneda, :ld_fec_1er_vcto,:ld_fec_vcto,  :ldt_fecha_entre,:ldt_fecha_pie,:ls_modificado, :ldt_fecha_mod,:ls_area, :ll_parque, :ls_sector, :ls_sepultura, :ll_derecho_lib, :ll_gastos_adm, :ll_factura, :ldt_fecha_fact,:ll_total_fact, :ls_carta_bienv, :ll_pie_pagado, :ls_nro_tecnico,	:ls_obs_sepultura,					:ldb_tasa_base,				:ll_codigo_tipo_seguro,					:ls_dicom,					:ll_ctas_pactadas_pie,					:ll_ctas_pagadas_pie,					:ldt_fecha_prim_pie   )  
					Using	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						UPDATE	"OFERTA_V"  
						SET 		"ULT_FOLIO" = :ll_folio  
						WHERE 	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
									( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) 
						Using		sqlca ;
						if sqlca.sqlcode=0 then
							commit;
							
							DECLARE sp_mod_cadena_mora_o PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
							EXECUTE sp_mod_cadena_mora_o;
							
							SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
							INTO 		:ldt_fecha_m  
							FROM 	"CADENA_MORA"  
							WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
									 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
									 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								INSERT INTO "CUPONERAS_MODIFICA"  
											( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",		"FECHA_PRIM",		"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
								VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_nro_cuotas,	:ll_rut,	:ls_dv,	:ll_valor_cuota,		:ldb_valor_cuota_m,	:ll_cod_parque,	:ld_fec_1er_vcto,	:ldt_fecha_m,		:ls_moneda,	'C' )  
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
									INTO 		:ldt_fec_venc_mant  
									FROM 	"CADENA_MORA"  
									WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
											 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
											 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
									USING		sqlca;
									
									SELECT	"CUPONERAS"."NUMERO"  
									INTO 		:ll_count_vig  
									FROM 	"CUPONERAS"  
									WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
											 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
											 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
									using		SQLCA;
									if sqlca.sqlcode = 0 and ll_count_vig > 0 then
										DECLARE sp_proc_modifica_cuponera1 PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
										EXECUTE sp_proc_modifica_cuponera1;
									end if
								else
									rollback;
								end if
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
		end if
	end if
elseif gs_base='A' then
	if ls_estado_reg='A' then
		SELECT 	"SOL_REPACTA_CVTA"."FECREP_1_VCTO",   "SOL_REPACTA_CVTA"."FECREP_ULT_VCTO",   "SOL_REPACTA_CVTA"."FECHA_PROX_VCTO"  
		INTO 		:ld_fec_1er_vcto,   						  :ld_fec_vcto,   								:ld_fec_prox_pago  
		FROM 	"SOL_REPACTA_CVTA"  
		WHERE 	( "SOL_REPACTA_CVTA"."BASE" = :gs_base ) AND  
					( "SOL_REPACTA_CVTA"."SERIE" = :gs_serie ) AND  
					( "SOL_REPACTA_CVTA"."NUMERO" = :ll_numero ) AND  
					( "SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_correlativo )   
		Using	sqlca;
		if sqlca.sqlcode=0 then
			// ver si existe en anexo_capacidad y rescatar ult_folio
			SELECT	"ANEXO_AUMENTO"."ULT_FOLIO",	"CADENA"."COD_PARQUE",	"CADENA"."RUT",	"CLIENTE"."DV"  
			INTO 		:ll_ult_folio,						:ll_cod_parque,			:ll_rut,				:ls_dv
			FROM 	"ANEXO_AUMENTO",   
						"CADENA",   
						"PAGO_AUMENTO",
						"CLIENTE"
			WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
         		 ( "CLIENTE"."RUT" = "ANEXO_AUMENTO"."RUT" ) and  
					 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
					 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
					 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
					 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
					 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
					 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
					 (("ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
					 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) and
					 ( "CADENA"."CODIGO" = :gs_base ))   
			Using		sqlca;
			
			if sqlca.sqlcode=0 then // si existe rescata todo los datos
				SELECT	"PAGO_AUMENTO"."SERIE_M",  "PAGO_AUMENTO"."NRO_AUMENTO", "PAGO_AUMENTO"."FECHA", "PAGO_AUMENTO"."FOLIO", "PAGO_AUMENTO"."PRECIO",   "PAGO_AUMENTO"."PIE_PAGADO",  "PAGO_AUMENTO"."PIE",   "PAGO_AUMENTO"."TASA",  "PAGO_AUMENTO"."VALOR_CUOTA", "PAGO_AUMENTO"."NRO_CUOTAS",  "PAGO_AUMENTO"."UF_DIA",   "PAGO_AUMENTO"."MONEDA",   "PAGO_AUMENTO"."FECHA_PRIM",  "PAGO_AUMENTO"."FECHA_ULT",   "PAGO_AUMENTO"."FECHA_PIE",   "PAGO_AUMENTO"."MODIFICADO",  "PAGO_AUMENTO"."FECHA_MOD",   "PAGO_AUMENTO"."GASTOS_ADM"  
				INTO 		:ls_serie,   					:ll_nro_aumento,   				:ldt_fecha,   				:ll_folio,   				:ll_precio,   					:ll_pie_pagado,   				:ll_pie,   					:ll_tasa,   				:ll_valor_cuota,   				:ll_nro_cuotas,   				:ll_uf_dia,   					:ls_moneda,   					:ldt_fecha_prim,   				:ldt_fecha_ult,   				:ldt_fecha_pie,   				:ls_modificado,   				:ldt_fecha_mod,   				:ll_gastos_adm 
				FROM 	"PAGO_AUMENTO"  
				WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) AND
						 ( "PAGO_AUMENTO"."FOLIO" = :ll_ult_folio )
				USING	sqlca;
				if sqlca.sqlcode=0 then // incrementa 1 el folio y lo inserta en pago_aumento
					ll_folio	= Double(string(ll_numero)+string(ll_correlativo))
					INSERT INTO	"PAGO_AUMENTO"  
								( "SERIE_M",   "NRO_AUMENTO",   	"FECHA",   	"FOLIO",   "PRECIO",   "PIE_PAGADO",   "PIE",   "TASA",   "VALOR_CUOTA",   "NRO_CUOTAS",   "UF_DIA",   "MONEDA",   "FECHA_PRIM",   		"FECHA_ULT",   "FECHA_PIE",   	"MODIFICADO",   "FECHA_MOD",   	"GASTOS_ADM" )  
					VALUES 	( :ls_serie,	:ll_nro_aumento,	:ldt_fecha, :ll_folio, :ll_precio, :ll_pie_pagado, :ll_pie, :ll_tasa, :ll_valor_cuota, :ll_nro_cuotas, :ll_uf_dia, :ls_moneda, :ld_fec_1er_vcto,	:ld_fec_vcto,	:ldt_fecha_pie,   :ls_modificado, :ldt_fecha_mod,	:ll_gastos_adm )  
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
							Setnull(ldb_valor_cuota_m);SetNull(ldt_fecha_m)
							INSERT INTO "CUPONERAS_MODIFICA"  
										( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",		"FECHA_PRIM",		"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
							VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_nro_cuotas,	:ll_rut,	:ls_dv,	:ll_valor_cuota,		:ldb_valor_cuota_m,	:ll_cod_parque,	:ld_fec_1er_vcto,	:ldt_fecha_m,		:ls_moneda,	'C' )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
								
								DECLARE sp_mod_cadena_mora_a PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
								EXECUTE sp_mod_cadena_mora_a;
								
								SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
								INTO 		:ldt_fec_venc_mant  
								FROM 	"CADENA_MORA"  
								WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
										 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
										 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
								USING		sqlca;
								
								SELECT	"CUPONERAS"."NUMERO"  
								INTO 		:ll_count_vig  
								FROM 		"CUPONERAS"  
								WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
										 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
								using		SQLCA;
								if sqlca.sqlcode = 0 and ll_count_vig > 0 then
									DECLARE sp_proc_modifica_cuponera2 PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
									EXECUTE sp_proc_modifica_cuponera2;
								end if
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
				messagebox("Advertencia","No Existe Aumento Capacidad "+gs_base+'-'+gs_serie+'-'+string(gi_numero))
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
elseif gs_base='L' then	
	if ls_estado_reg='A' then
		SELECT 	"SOL_REPACTA_CVTA"."FECREP_1_VCTO",   "SOL_REPACTA_CVTA"."FECREP_ULT_VCTO",   "SOL_REPACTA_CVTA"."FECHA_PROX_VCTO"  
		INTO 		:ld_fec_1er_vcto,   						  :ld_fec_vcto,   								:ld_fec_prox_pago  
		FROM 	"SOL_REPACTA_CVTA"  
		WHERE 	( "SOL_REPACTA_CVTA"."BASE" = :gs_base ) AND  
					( "SOL_REPACTA_CVTA"."SERIE" = :gs_serie ) AND  
					( "SOL_REPACTA_CVTA"."NUMERO" = :ll_numero ) AND  
					( "SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_correlativo )   
		Using	sqlca;
		if sqlca.sqlcode=0 then
			// ver si existe en anexo_capacidad y rescatar ult_folio
			SELECT	"ANEXO_LIBERADOR"."ULT_FOLIO",	"CADENA"."COD_PARQUE",	"CADENA"."RUT",	"CLIENTE"."DV"    
			INTO 		:ll_ult_folio,							:ll_cod_parque,			:ll_rut,				:ls_dv  
			FROM 	"ANEXO_LIBERADOR",   
						"CADENA",   
						"PAGO_LIBERADOR",
						"CLIENTE"
			WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
         		 ( "CLIENTE"."RUT" = "ANEXO_LIBERADOR"."RUT" ) and  
					 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
					 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
					 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
					 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
					 (("ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) and
					 ( "CADENA"."CODIGO" = :gs_base ))   
			Using		sqlca;
			
			if sqlca.sqlcode=0 then // si existe rescata todo los datos
				SELECT	"PAGO_LIBERADOR"."SERIE_M",  "PAGO_LIBERADOR"."NRO_LIBERADOR", "PAGO_LIBERADOR"."FECHA",	"PAGO_LIBERADOR"."FOLIO", 	"PAGO_LIBERADOR"."PRECIO",   	"PAGO_LIBERADOR"."PIE_PAGADO",  	"PAGO_LIBERADOR"."PIE",   	"PAGO_LIBERADOR"."TASA",  "PAGO_LIBERADOR"."VALOR_CUOTA", "PAGO_LIBERADOR"."NRO_CUOTAS",  "PAGO_LIBERADOR"."UF_DIA",   "PAGO_LIBERADOR"."MONEDA",   "PAGO_LIBERADOR"."FECHA_PRIM",  "PAGO_LIBERADOR"."FECHA_ULT",   "PAGO_LIBERADOR"."FECHA_PIE",   "PAGO_LIBERADOR"."MODIFICADO",  "PAGO_LIBERADOR"."FECHA_MOD",   "PAGO_LIBERADOR"."GASTOS_ADM"  
				INTO 		:ls_serie,   						:ll_nro_aumento,   					:ldt_fecha,   					:ll_folio,   					:ll_precio,   						:ll_pie_pagado,   					:ll_pie,   						:ll_tasa,   				:ll_valor_cuota,   				:ll_nro_cuotas,   				:ll_uf_dia,   					:ls_moneda,   					:ldt_fecha_prim,   				:ldt_fecha_ult,   				:ldt_fecha_pie,   				:ls_modificado,   				:ldt_fecha_mod,   				:ll_gastos_adm 
				FROM 	"PAGO_LIBERADOR"  
				WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND
						 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ult_folio )
				USING	sqlca;
				if sqlca.sqlcode=0 then // incrementa 1 el folio y lo inserta en PAGO_LIBERADOR
					ll_folio	= Double(string(ll_numero)+string(ll_correlativo))
					INSERT INTO	"PAGO_LIBERADOR"  
								( "SERIE_M",   "NRO_LIBERADOR",  "FECHA",   	"FOLIO",   "PRECIO",   "PIE_PAGADO",   "PIE",   "TASA",   "VALOR_CUOTA",   "NRO_CUOTAS",   "UF_DIA",   "MONEDA",   "FECHA_PRIM",   		"FECHA_ULT",   "FECHA_PIE",   	"MODIFICADO",   "FECHA_MOD",   	"GASTOS_ADM" )  
					VALUES 	( :ls_serie,	:ll_nro_aumento,	:ldt_fecha, :ll_folio, :ll_precio, :ll_pie_pagado, :ll_pie, :ll_tasa, :ll_valor_cuota, :ll_nro_cuotas, :ll_uf_dia, :ls_moneda, :ld_fec_1er_vcto,	:ld_fec_vcto,	:ldt_fecha_pie,   :ls_modificado, :ldt_fecha_mod,	:ll_gastos_adm )  
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
							Setnull(ldb_valor_cuota_m);SetNull(ldt_fecha_m)
							INSERT INTO "CUPONERAS_MODIFICA"  
										( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",		"FECHA_PRIM",		"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
							VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_nro_cuotas,	:ll_rut,	:ls_dv,	:ll_valor_cuota,		:ldb_valor_cuota_m,	:ll_cod_parque,	:ld_fec_1er_vcto,	:ldt_fecha_m,		:ls_moneda,	'C' )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
								
								DECLARE sp_mod_cadena_mora_l PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
								EXECUTE sp_mod_cadena_mora_l;
								
								SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
								INTO 		:ldt_fec_venc_mant  
								FROM 	"CADENA_MORA"  
								WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
										 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
										 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
								USING		sqlca;
								
								SELECT	"CUPONERAS"."NUMERO"  
								INTO 		:ll_count_vig  
								FROM 		"CUPONERAS"  
								WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
										 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
								using		SQLCA;
								if sqlca.sqlcode = 0 and ll_count_vig > 0 then
									DECLARE sp_proc_modifica_cuponera3 PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
									EXECUTE sp_proc_modifica_cuponera3;
								end if
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
				messagebox("Advertencia","No Existe Anexo Liberador "+gs_base+'-'+gs_serie+'-'+string(gi_numero))
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if	
elseif gs_base='F' then	
	if ls_estado_reg='A' then
		SELECT 	"SOL_REPACTA_CVTA"."FECREP_1_VCTO",   "SOL_REPACTA_CVTA"."FECREP_ULT_VCTO",   "SOL_REPACTA_CVTA"."FECHA_PROX_VCTO"  
		INTO 		:ld_fec_1er_vcto,   						  :ld_fec_vcto,   								:ld_fec_prox_pago  
		FROM 	"SOL_REPACTA_CVTA"  
		WHERE 	( "SOL_REPACTA_CVTA"."BASE" = :gs_base ) AND  
					( "SOL_REPACTA_CVTA"."SERIE" = :gs_serie ) AND  
					( "SOL_REPACTA_CVTA"."NUMERO" = :ll_numero ) AND  
					( "SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_correlativo )   
		Using	sqlca;
		if sqlca.sqlcode=0 then
			// ver si existe en anexo_capacidad y rescatar ult_folio
			SELECT	"PRODUCTO_ANEXO"."ULT_FOLIO",	"CADENA"."COD_PARQUE",	"CADENA"."RUT",	"CLIENTE"."DV"    
			INTO 		:ll_ult_folio,									:ll_cod_parque,					:ll_rut,				:ls_dv  
			FROM 	"PRODUCTO_ANEXO",   
						"CADENA",   
						"PRODUCTO_PAGO",
						"CLIENTE"
			WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
         			 ( "CLIENTE"."RUT" = "PRODUCTO_ANEXO"."RUT" ) and  
					 ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
					 ( "PRODUCTO_ANEXO"."SERIE" = "CADENA"."SERIE" ) and  
					 ( "PRODUCTO_ANEXO"."NUMERO" = "CADENA"."NUMERO" ) and  
					 ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
					 ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
					 ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
					 (("PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
					 ( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) and
					 ( "CADENA"."CODIGO" = :gs_base ))   
			Using		sqlca;
			
			if sqlca.sqlcode=0 then // si existe rescata todo los datos
				SELECT	"PRODUCTO_PAGO"."SERIE",	"PRODUCTO_PAGO"."SERIE",  "PRODUCTO_PAGO"."NUMERO", 	"PRODUCTO_PAGO"."FECHA",	"PRODUCTO_PAGO"."FOLIO", 	"PRODUCTO_PAGO"."PRECIO",   	"PRODUCTO_PAGO"."PIE_PAGADO",  	"PRODUCTO_PAGO"."PIE",   "PRODUCTO_PAGO"."TASA",  	"PRODUCTO_PAGO"."VALOR_CUOTA", 	"PRODUCTO_PAGO"."PLAZO",  "PRODUCTO_PAGO"."UF_DIA",   "PRODUCTO_PAGO"."MONEDA",   "PRODUCTO_PAGO"."FECHA_PRIM",  "PRODUCTO_PAGO"."FECHA_ULT", 	"PRODUCTO_PAGO"."FECHA_PIE",   "PRODUCTO_PAGO"."GASTO_ADM"  
				INTO 		:ls_base,								:ls_serie,   							:ll_nro_aumento,   					:ldt_fecha,   						:ll_folio,   							:ll_precio,   								:ll_pie_pagado,   							:ll_pie,   							:ll_tasa,   							:ll_valor_cuota,   								:ll_nro_cuotas,   					:ll_uf_dia,   							:ls_moneda,   							:ldt_fecha_prim,   							:ldt_fecha_ult,   							:ldt_fecha_pie,   							:ll_gastos_adm 
				FROM 	"PRODUCTO_PAGO"  
				WHERE  ( "PRODUCTO_PAGO"."SERIE" = :gs_serie ) AND  
						 ( "PRODUCTO_PAGO"."NUMERO" = :gi_numero ) AND
						 ( "PRODUCTO_PAGO"."FOLIO" = :ll_ult_folio )
				USING	sqlca;
				if sqlca.sqlcode=0 then 
					ll_folio					= Double(string(ll_numero)+string(ll_correlativo))
					INSERT INTO	"PRODUCTO_PAGO"  
								( "BASE",		"SERIE",   	"NUMERO",  		"PRODUCTO_PAGO"."FECHA", 	"PRODUCTO_PAGO"."FOLIO", 	"PRODUCTO_PAGO"."PRECIO",  	"PRODUCTO_PAGO"."PIE_PAGADO", 	"PRODUCTO_PAGO"."PIE",   "PRODUCTO_PAGO"."TASA", 	"PRODUCTO_PAGO"."VALOR_CUOTA", 	"PRODUCTO_PAGO"."PLAZO",  	"PRODUCTO_PAGO"."UF_DIA",  	"PRODUCTO_PAGO"."MONEDA", 	"PRODUCTO_PAGO"."FECHA_PRIM",  "PRODUCTO_PAGO"."FECHA_ULT",  	"PRODUCTO_PAGO"."FECHA_PIE",  	"PRODUCTO_PAGO"."GASTO_ADM"  )
					VALUES 	( :ls_base,	:ls_serie,		:ll_nro_aumento,	:ldt_fecha,   						:ll_folio,   							:ll_precio,   								:ll_pie_pagado,   							:ll_pie,   							:ll_tasa,   							:ll_valor_cuota,   								:ll_nro_cuotas,   					:ll_uf_dia,   								:ls_moneda,   							:ldt_fecha_prim,   							:ldt_fecha_ult,   							:ldt_fecha_pie,   							:ll_gastos_adm )
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
							Setnull(ldb_valor_cuota_m);SetNull(ldt_fecha_m)
							INSERT INTO "CUPONERAS_MODIFICA"  
										( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",		"FECHA_PRIM",		"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
							VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_nro_cuotas,	:ll_rut,	:ls_dv,	:ll_valor_cuota,		:ldb_valor_cuota_m,	:ll_cod_parque,	:ld_fec_1er_vcto,	:ldt_fecha_m,		:ls_moneda,	'C' )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
								
								DECLARE sp_mod_cadena_mora_f PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
								EXECUTE sp_mod_cadena_mora_f;
								
								SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
								INTO 		:ldt_fec_venc_mant  
								FROM 	"CADENA_MORA"  
								WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
										 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
										 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
								USING		sqlca;
								
								SELECT	"CUPONERAS"."NUMERO"  
								INTO 		:ll_count_vig  
								FROM 	"CUPONERAS"  
								WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
										 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
								using		SQLCA;
								if sqlca.sqlcode = 0 and ll_count_vig > 0 then
									DECLARE sp_proc_modifica_cuponera4 PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
									EXECUTE sp_proc_modifica_cuponera4;
								end if
							else
								rollback;
							end if
							if isvalid(w_cuenta_corriente_funeraria) then
								w_cuenta_corriente_funeraria.dw_estado_cta_cte.Retrieve(gs_serie, gi_numero)
								w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
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
				messagebox("Advertencia","No Existe Producto Funerario "+gs_base+'-'+gs_serie+'-'+string(gi_numero))
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if	
	
elseif gs_base='P' then
	if ls_estado_reg='A' then
		SELECT 	"SOL_REPACTA_CVTA"."FECREP_1_VCTO",   "SOL_REPACTA_CVTA"."FECREP_ULT_VCTO",   "SOL_REPACTA_CVTA"."FECHA_PROX_VCTO"  
		INTO 		:ld_fec_1er_vcto,   						  :ld_fec_vcto,   								:ld_fec_prox_pago  
		FROM 	"SOL_REPACTA_CVTA"  
		WHERE 	( "SOL_REPACTA_CVTA"."BASE" = :gs_base ) AND  
					( "SOL_REPACTA_CVTA"."SERIE" = :gs_serie ) AND  
					( "SOL_REPACTA_CVTA"."NUMERO" = :ll_numero ) AND  
					( "SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_correlativo )   
		Using	sqlca;
		if sqlca.sqlcode=0 then
		// ver si existe en anexo_capacidad y rescatar ult_folio
			SELECT	"CLIENTE"."RUT",	"CLIENTE"."DV",	"PAGARE"."PLAZO",	"PAGARE"."VALOR_CUO",	"CADENA"."COD_PARQUE",	"PAGARE"."MONEDA"
			INTO		:ll_rut,				:ls_dv,				:ll_nro_cuotas,	:ll_valor_cuota,			:ll_cod_parque,			:ls_moneda
			FROM 	"PAGARE",	"CADENA",	"CLIENTE"  
			WHERE  ( "PAGARE"."SERIE_P" = "CADENA"."SERIE" ) and  
					 ( "PAGARE"."NRO_PAGARE" = "CADENA"."NUMERO" ) and 
					 ( "CADENA"."RUT" = "CLIENTE"."RUT") AND  
					 ( "CADENA"."CODIGO" = :gs_base ) AND  
					 ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
					 ( "PAGARE"."NRO_PAGARE" = :gi_numero  )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				UPDATE	"PAGARE"  
				SET 		"FECHA_PRIM" = :ld_fec_1er_vcto,   
							"FECHA_ULT" = :ld_fec_vcto  
				WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
						 ( "PAGARE"."NRO_PAGARE" = :gi_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					
					DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
					EXECUTE sp_nuevo_cadena_mora;
					
					INSERT INTO "CUPONERAS_MODIFICA"  
								( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",		"FECHA_PRIM",		"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
					VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_nro_cuotas,	:ll_rut,	:ls_dv,	:ll_valor_cuota,		0,							:ll_cod_parque,	:ld_fec_1er_vcto,	:ldt_fecha_m,		:ls_moneda,	'C' )  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
						INTO 		:ldt_fec_venc_mant  
						FROM 	"CADENA_MORA"  
						WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
								 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
								 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
						USING		sqlca;
						
						SELECT	"CUPONERAS"."NUMERO"  
						INTO 		:ll_count_vig  
						FROM 	"CUPONERAS"  
						WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
								 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
								 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
								 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
						using		SQLCA;
						if sqlca.sqlcode = 0 and ll_count_vig > 0 then
							DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto, :ldt_fec_venc_mant, :ls_moneda, 'C' );
							EXECUTE sp_proc_modifica_cuponera;
						end if
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
			end if
		elseif sqlca.sqlcode=100 then
			messagebox("Advertencia","No Existe Pagaré "+gs_base+'-'+gs_serie+'-'+string(gi_numero))
		elseif sqlca.sqlcode=-1 then
			messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end subroutine

public subroutine wf_actualizar_cadena_estado (string as_estado);if isvalid(w_listado_contratos) then
	w_listado_contratos.dw_listado.setitem(w_listado_contratos.dw_listado.getrow(),'cadena_estado',as_estado)
end if
CHOOSE CASE gs_base
	CASE "O" // Oferta
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
	CASE "F","G" // Anexo Funararia
		if isvalid(w_cuenta_corriente_funeraria) then
			w_cuenta_corriente_funeraria.dw_estado_cta_cte.setitem(1,'cadena_estado',as_estado)
		end if
END CHOOSE
end subroutine

public subroutine wf_print_ctto_rescilia (long al_cod_parque);Long	ll_cod_parque

SELECT	"CADENA"."COD_PARQUE"  
INTO		:ll_cod_parque  
FROM 		"CADENA"  
WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
		 ( "CADENA"."SERIE" = :gs_serie ) AND  
		 ( "CADENA"."NUMERO" = :gi_numero )   
USING		sqlca;
gl_cod_parque_cta							= ll_cod_parque
if ll_cod_parque = 1 or ll_cod_parque = 102 then
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
			dw_print_ctto.dataobject	= 'dw_print_ctto_rescilia_prado_liberador'
		end if
	elseif gs_base='F' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_funeraria'
	end if
elseif ll_cod_parque = 11 then
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
elseif ll_cod_parque = 103 then
	if gs_base='C' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_stgo_isacruz'
	elseif gs_base='O' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_stgo_o_mayor21506'
//	elseif gs_base='O' and gi_numero<4251 then
//		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_stgo_o_menor21506'
	elseif gs_base='A' then
		dw_print_ctto.dataobject		= 'dw_print_ctto_rescilia_stgo_a_aumento'
	elseif gs_base='L' then
		if al_cod_parque=103 then
			dw_print_ctto.dataobject	= 'dw_print_ctto_rescilia_prado_liberador'
		end if
	end if
end if

dw_print_ctto.settransobject(sqlca)					
if gs_base='C' or gs_base='O' or gs_base='A' or gs_base='L' or gs_base='F' then
	if dw_print_ctto.retrieve(gs_base,gs_serie,gi_numero,il_correlativo)>0 then
		f_Print( dw_print_ctto )
		dw_print_ctto.print()
	end if
else
	messagebox("Advertercia","Solo se puede imprimir Contrato IsaCruz / Promesas / Anexo Liberador / Aumento Capacidad / Producto Funerario")
end if
end subroutine

public subroutine wf_grabar_todos_pat ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
			
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_PAT"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_PAT"."BASE" =      ( SELECT	"SOL_ESTATUS"."BASE"  
														  FROM 	"SOL_ESTATUS"  
														  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																	( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																	( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																	( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																	( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																	( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_PAT"."SERIE" = :gs_serie AND
						"SOL_PAT"."NUMERO" = :gi_numero AND
						"SOL_PAT"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			if ls_est_mod='S' then
				ll_resp			= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_PAT"."DIRECCION_P",  "SOL_PAT"."POBLACION",   "SOL_PAT"."SECTOR",   "SOL_PAT"."COMUNA",   "SOL_PAT"."CIUDAD",   "SOL_PAT"."FONO_P",   "SOL_PAT"."FECHA_NAC",   "SOL_PAT"."ESTADO_CIVIL", "SOL_PAT"."DOMICILIO_C", "SOL_PAT"."TOTAL_RENTA", "SOL_PAT"."FONO_C",  "SOL_PAT"."GRUPO_F", "SOL_PAT"."RUT_TITULAR"  , "SOL_PAT"."TIPO_VIA",   "SOL_PAT"."NUMERO_PARTICULAR",   "SOL_PAT"."DEPTO_PARTICULAR",   "SOL_PAT"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   				  :ls_pob,   					:ls_sector,   			 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ldt_fec_nac,   			  :ls_est_civil,   			 :ls_dir_c,   				  :ll_renta,   				:ls_fono_c,   			:ll_grupo_f,   		:ll_rut ,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					  :ls_block_part
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_resciliacion_reprog ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp,ll_ctas,ll_cta_pag_m,ll_ctas_en_mora,ll_ctas_repacta,ll_hora,ll_min,&
			ll_monto,ll_tot_pagado,ll_suma_tot_pagado,ll_ctas_pag_pie,ll_pie_pagado_cs,ll_suma_pie_pagado,ll_ctas_pac_pie,ll_cod_parque
Datetime	ldt_fec_nac,ldt_fecha,ldt_fecha_hoy,ldt_fecha_com,ldt_fecha_promesa
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_base,ls_serie,&
			ls_anexo_lib,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_pasa,ls_base_new,ls_serie_new,ls_descrip_estado,ls_estado_comi,ls_estado_comi_sup,&
			ls_cod_age,ls_cod_sup,ls_cod_jef,ls_estado_age,ls_estado_sup,ls_estado_jef,	ls_base_cs,ls_serie_cs,ls_moneda_reprog,ls_serie_c,&
			ls_estado_at_pub,ls_glosa
Double	ldb_precio,ldb_porce_venta,ldb_porce_sup,ldb_porce_jefe,ldb_sum_porce,ldb_saldo_porce,ldb_nvo_saldo_age,ldb_nvo_saldo_sup,ldb_nvo_saldo_jef,&
			ldb_capital_pagado,ldb_uf_reprog,ll_numero_new,ll_ult_folio,ll_numero_cs,ll_folio,ll_numero_c,ll_numero,ll_ult_folio_cs

SELECT sysdate 	INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
ll_hora					= long(string(gdt_fec_sistema,'hh'))
ll_min						= long(string(gdt_fec_sistema,'mm'))
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
SELECT	"TAB_UF"."VALOR_UF" INTO :gd_uf_dia FROM "TAB_UF" WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   ;
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		ls_pasa	= 'S'
		if is_tipo_sol="2" then
			SELECT	"SOL_RESCILIA_REPROG"."BASE_NUEVO",	
						"SOL_RESCILIA_REPROG"."SERIE_NUEVO",   
						"SOL_RESCILIA_REPROG"."NUMERO_NUEVO"  
			INTO 		:ls_base_new,   
						:ls_serie_new,   
						:ll_numero_new  
			FROM 	"SOL_ESTATUS",   
						"SOL_RESCILIA_REPROG"  
			WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_RESCILIA_REPROG"."BASE" ) and  
					 ( "SOL_ESTATUS"."SERIE" = "SOL_RESCILIA_REPROG"."SERIE" ) and  
					 ( "SOL_ESTATUS"."NUMERO" = "SOL_RESCILIA_REPROG"."NUMERO" ) and  
					 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESCILIA_REPROG"."CORRELATIVO" ) and  
					 (("SOL_ESTATUS"."CODIGO_SOLICITUD" = '2' ) AND  
					 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
					 ( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
					 ( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
					 ( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
					 ( "SOL_RESCILIA_REPROG"."CORRELATIVO" = :ll_corr )    )  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				SELECT	"CADENA"."CODIGO"  
				INTO 		:ls_descrip_estado  
				FROM 	"CADENA"  
				WHERE  ( "CADENA"."CODIGO" = :ls_base_new ) AND  
						 ( "CADENA"."SERIE" = :ls_serie_new ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero_new ) 
				USING		sqlca;
				if sqlca.sqlcode<>0 then
					messagebox("Advertencia","Recuerde Para Resciliar Contrato Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###") +", el Contrato Nº "+ls_base_new+'-'+ls_serie_new+'-'+string(ll_numero_new,"###,###,###,###,###")+' debe estar DIGITADO')
					ls_pasa	= 'N'
				end if
			end if
		end if
		if ls_pasa='S' then
			dw_lista.setitem(il_row,'estatus_informatica',0)
			dw_lista.setitem(il_row,'usuario_infor',gs_user)
			dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
			ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
			ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
			dw_lista.setitem(il_row,'observacion',ls_obs)
			dw_lista.accepttext()
			if dw_lista.update()=1 then
				commit;
				UPDATE	"SOL_RESCILIA_REPROG"  
				SET 		"ESTATUS_INFORMATICA" = 0,   
							"USUARIO_INFOR" = :gs_user,   
							"FECHA_INFOR" = :ldt_fecha  
				WHERE 	"SOL_RESCILIA_REPROG"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																			 FROM 	"SOL_ESTATUS"  
																			 WHERE 	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																						( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																						( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																						( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																						( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																						( "SOL_ESTATUS"."ESTADO_REG" = 'A' ))  AND
							"SOL_RESCILIA_REPROG"."SERIE" = :gs_serie AND
							"SOL_RESCILIA_REPROG"."NUMERO" = :gi_numero AND
							"SOL_RESCILIA_REPROG"."CORRELATIVO" = :ll_corr
									
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
					if gs_base='L' then
						SELECT	"ANEXO_LIBERADOR"."BASE",   
									"ANEXO_LIBERADOR"."SERIE",   
									"ANEXO_LIBERADOR"."NRO_OFERTA"  
						INTO 		:ls_base,   
									:ls_serie,   
									:ll_numero  
						FROM 	"ANEXO_LIBERADOR",   
									"PAGO_LIBERADOR"  
						WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
								 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
								 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
								 (("ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
								 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) )   
						using		sqlca;
						if sqlca.sqlcode=0 then
							CHOOSE CASE ls_base
								CASE 'O'
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
										if ll_cta_pag_m>=99 then
											ll_ctas	= ll_cta_pag_m - 99  
											UPDATE	"OFERTA_V"  
											SET 		"ANEXO_LIB" = '',   
														"CTA_PAG_M" = :ll_ctas
											WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
													 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
											USING		sqlca;
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
										if ll_cta_pag_m>=99 then
											ll_ctas	= ll_cta_pag_m - 99  
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
										ll_ctas	= 0
										UPDATE	"OFERTA_V"  
										SET 		"ANEXO_AUMENTO" = '',   
													"CTA_PAG_M" = :ll_ctas
										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
												   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
										USING		sqlca;
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
						USING		sqlca;
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
										USING		sqlca;
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
										USING		sqlca;
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
				// modificar cadena estado	
					UPDATE	"CADENA"  
					SET 		"ESTADO" = 'P',
								"FECHA_RES" = :gdt_fecha_res
					WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
								( "CADENA"."SERIE" = :gs_serie ) AND  
								( "CADENA"."NUMERO" = :gi_numero )   
					Using		sqlca ;
					if sqlca.sqlcode=0 then
						commit;
						////////////////////////nuevo
						ls_estado_at_pub		= '3'
						ls_glosa					= 'SE RESCILIA CONTRATO N° '+gs_base+gs_serie+string(gi_numero)+ 'EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy hh:mm')
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
						if gs_base='P' then
							SELECT	"PAGARE"."SERIE",   
										"PAGARE"."NRO_OFERTA"  
							INTO 		:ls_serie_c,   
										:ll_numero_c  
							FROM 	"PAGARE"  
							WHERE  ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
									 ( "PAGARE"."NRO_PAGARE" = :gi_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 and ll_numero_c > 0 then
								UPDATE	"CADENA"  
								SET 		"ESTADO" = 'P',
											"FECHA_RES" = :gdt_fecha_res
								WHERE  ( "CADENA"."CODIGO" = 'C' ) AND  
										 ( "CADENA"."SERIE" = :ls_serie_c ) AND  
										 ( "CADENA"."NUMERO" = :ll_numero_c )   
								Using		sqlca ;
								if sqlca.sqlcode=0 then
									commit;
									UPDATE	"SOL_RESCILIA_REPROG"  
									SET		"ESTATUS_OPERACION" = 0,   
												"ESTATUS_INFORMATICA" = 0,   
												"USUARIO_OPERA" = :gs_user,   
												"FECHA_OPERA" = :ldt_fecha_hoy,   
												"USUARIO_INFOR" = :gs_user,   
												"FECHA_INFOR" = :ldt_fecha_hoy  
									WHERE  ( "SOL_RESCILIA_REPROG"."BASE" = 'C' ) AND  
											 ( "SOL_RESCILIA_REPROG"."SERIE" = :ls_serie_c ) AND  
											 ( "SOL_RESCILIA_REPROG"."NUMERO" = :ll_numero_c ) AND  
											 ( "SOL_RESCILIA_REPROG"."CORRELATIVO" = :ll_corr )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								else
									rollback;
								end if
							end if
						end if
						
						//Codigo Nuevo Grabar Promesa Asociada
						SELECT	"SOL_RESCILIA_REPROG"."BASE_NUEVO",   
									"SOL_RESCILIA_REPROG"."SERIE_NUEVO",   
									"SOL_RESCILIA_REPROG"."NUMERO_NUEVO"  
						INTO 		:ls_base_new,   
									:ls_serie_new,   
									:ll_numero_new  
						FROM 	"SOL_RESCILIA_REPROG"  
						WHERE  ( "SOL_RESCILIA_REPROG"."BASE" = :gs_base ) AND  
								 ( "SOL_RESCILIA_REPROG"."SERIE" = :gs_serie ) AND  
								 ( "SOL_RESCILIA_REPROG"."NUMERO" = :gi_numero ) AND  
								 ( "SOL_RESCILIA_REPROG"."CORRELATIVO" = :ll_corr )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if ls_base_new='O' then
								SELECT	"OFERTA_V"."ESTADO_COMI",	"OFERTA_V"."ESTADO_COMI_SUP",	"OFERTA_V"."ULT_FOLIO",	"PAGO_OFERTA"."PRECIO",	"OFERTA_V"."PORCE_VENTA",	"SUPERVISOR"."PORC_SUPERVISOR",	"JEFE_VENTAS"."PORC_JEFE_VTA",	"OFERTA_V"."COD_AGE",	"OFERTA_V"."COD_SUP",	"OFERTA_V"."COD_JEF",	"AGENTES"."ESTADO",	"JEFE_VENTAS"."ESTADO",	"SUPERVISOR"."ESTADO",	"OFERTA_V"."FECHA_COM",	"CADENA"."COD_PARQUE"
								INTO 		:ls_estado_comi,				:ls_estado_comi_sup,				:ll_ult_folio,				:ldb_precio,				:ldb_porce_venta,				:ldb_porce_sup,						:ldb_porce_jefe,						:ls_cod_age,				:ls_cod_sup,				:ls_cod_jef,				:ls_estado_age,		:ls_estado_jef,			:ls_estado_sup,			:ldt_fecha_com,			:ll_cod_parque
								FROM 	"CADENA","OFERTA_V","PAGO_OFERTA","AGENTES","JEFE_VENTAS","SUPERVISOR"   
								WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
										 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
										 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
										 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
										 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
										 ( "OFERTA_V"."COD_AGE" = "AGENTES"."COD_AGE" ) and  
										 ( "OFERTA_V"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
										 ( "OFERTA_V"."COD_JEF" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
										 (("CADENA"."CODIGO" = :ls_base_new ) AND  
										 ( "CADENA"."SERIE" = :ls_serie_new ) AND  
										 ( "CADENA"."NUMERO" = :ll_numero_new ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									if ls_estado_comi='N' or ls_estado_comi='S' or ls_estado_comi='C' then
										if ls_estado_age='A' then
											SELECT	SUM("RES_COMI"."PORC_VENTA")  
											INTO 		:ldb_sum_porce  
											FROM 	"RES_COMI"  
											WHERE  ( "RES_COMI"."COD_AGE_SUP" = :ls_cod_age ) AND  
													 ( "RES_COMI"."COD_CONTABLE" = '023' OR  
														"RES_COMI"."COD_CONTABLE" = '037') AND  
													 ( "RES_COMI"."SERIE" = :gs_serie ) AND  
													 ( "RES_COMI"."CONTRATO" = :gi_numero )  
											USING		sqlca;
											if isnull(ldb_sum_porce) or ldb_sum_porce=0 then ldb_sum_porce=0
											ldb_saldo_porce	= (ldb_porce_venta - ldb_sum_porce)
											ldb_nvo_saldo_age	= (ldb_precio * ldb_saldo_porce) / 100
										end if
									end if
									if ls_estado_comi_sup='N' then
										if ls_estado_sup='A' then
											SELECT	SUM("RES_COMI"."PORC_VENTA")  
											INTO 		:ldb_sum_porce  
											FROM 	"RES_COMI"  
											WHERE  ( "RES_COMI"."COD_AGE_SUP" = :ls_cod_sup ) AND  
													 ( "RES_COMI"."COD_CONTABLE" = '023' OR  
														"RES_COMI"."COD_CONTABLE" = '037') AND  
													 ( "RES_COMI"."SERIE" = :gs_serie ) AND  
													 ( "RES_COMI"."CONTRATO" = :gi_numero )  
											USING		sqlca;
											if isnull(ldb_sum_porce) or ldb_sum_porce=0 then ldb_sum_porce=0
											ldb_saldo_porce	= (ldb_porce_sup - ldb_sum_porce)
											ldb_nvo_saldo_sup	= (ldb_precio * ldb_saldo_porce) / 100
										end if
										if ls_estado_jef='A' then
											SELECT	SUM("RES_COMI"."PORC_VENTA")  
											INTO 		:ldb_sum_porce  
											FROM 	"RES_COMI"  
											WHERE  ( "RES_COMI"."COD_AGE_SUP" = :ls_cod_jef ) AND  
													 ( "RES_COMI"."COD_CONTABLE" = '023' OR  
														"RES_COMI"."COD_CONTABLE" = '037') AND  
													 ( "RES_COMI"."SERIE" = :gs_serie ) AND  
													 ( "RES_COMI"."CONTRATO" = :gi_numero )  
											USING		sqlca;
											if isnull(ldb_sum_porce) or ldb_sum_porce=0 then ldb_sum_porce=0
											ldb_saldo_porce	= (ldb_porce_jefe - ldb_sum_porce)
											ldb_nvo_saldo_jef	= (ldb_precio * ldb_saldo_porce) / 100
										end if
									end if
									UPDATE	"OFERTA_V"  
									SET 		"ESTADO_COMI" = :ls_estado_comi,   
												"ESTADO_COMI_SUP" = :ls_estado_comi_sup,
												"FECHA_COM" = :ldt_fecha_com
									WHERE  ( "OFERTA_V"."SERIE" = :ls_serie_new ) AND  
											 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_new ) 
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									if ls_estado_comi_sup='N' or ls_estado_comi='N' or ls_estado_comi='S' or ls_estado_comi='C' or ll_cod_parque = 103 then
										INSERT INTO   "REPROG_SALDO_COMISION"  
														( "BASE",	"SERIE",		"NUMERO",	"ESTADO_COMI",		"FECHA_PAGO",	"SALDO_MONTO_UF_AGE",	"SALDO_MONTO_UF_SUP",	"SALDO_MONTO_UF_JEFE" )  
										VALUES 		( :gs_base,	:gs_serie,	:gi_numero,	:ls_estado_comi,	null,				:ldb_nvo_saldo_age,		:ldb_nvo_saldo_sup,		:ldb_nvo_saldo_jef )  
										USING			sqlca;
										if sqlca.sqlcode=0 then
											commit;
											SELECT	MAX("INGRESO"."FOLIO")  
											INTO 		:ll_folio  
											FROM 	"INGRESO"  
											WHERE 	"INGRESO"."TIPO_COB" = 'CS'   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												if ll_folio>0 then
													ll_folio ++
												else
													ll_folio	= 1
												end if
											else
												ll_folio		= 1
											end if
											SELECT	"REPACTA_CREDITO"."CAPITAL_PAGADO",
														"REPACTA_CREDITO"."BASE",
														"REPACTA_CREDITO"."SERIE",
														"REPACTA_CREDITO"."NUMERO",
														"REPACTA_CREDITO"."UF_DIA",
														"REPACTA_CREDITO"."MONEDA_ORIGINAL"
											INTO 		:ldb_capital_pagado,
														:ls_base_cs,
														:ls_serie_cs,
														:ll_numero_cs,
														:ldb_uf_reprog,
														:ls_moneda_reprog
											FROM 	"REPACTA_CREDITO"  
											WHERE  ( "REPACTA_CREDITO"."BASE_ORIGINAL" = :gs_base ) AND  
													 ( "REPACTA_CREDITO"."SERIE_ORIGINAL" = :gs_serie ) AND  
													 ( "REPACTA_CREDITO"."NUMERO_ORIGINAL" = :gi_numero ) AND
													 ( "REPACTA_CREDITO"."ESTADO" = 'V' ) AND
													 ( "REPACTA_CREDITO"."FECHA_CREA" = ( 	SELECT	max("REPACTA_CREDITO"."FECHA_CREA")
																												FROM 		"REPACTA_CREDITO"  
																												WHERE     ( "REPACTA_CREDITO"."BASE_ORIGINAL" = :gs_base ) AND  
																															 ( "REPACTA_CREDITO"."SERIE_ORIGINAL" = :gs_serie ) AND  
																															 ( "REPACTA_CREDITO"."NUMERO_ORIGINAL" = :gi_numero ) ) ) 
											USING		sqlca;
											if sqlca.sqlcode=0 then
												ldb_uf_reprog					= gd_uf_dia
												if ls_base_cs='O' then
													SELECT	"OFERTA_V"."FECHA"  
													INTO 		:ldt_fecha_promesa  
													FROM 	"CADENA",	"OFERTA_V",	"PAGO_OFERTA"  
													WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
															 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
															 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
															 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
															 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
															 ( ( "CADENA"."CODIGO" = :ls_base_cs ) AND  
															 ( "CADENA"."SERIE" = :ls_serie_cs ) AND  
															 ( "CADENA"."NUMERO" = :ll_numero_cs )  )  
													USING		sqlca;
													if sqlca.sqlcode<>0 then
														ldt_fecha_promesa	= 	ldt_fecha_hoy
													end if
												else
													ldt_fecha_promesa		= 	ldt_fecha_hoy
												end if
												if ls_moneda_reprog='1' then //Peso
													ll_monto						= ldb_capital_pagado
												else
													ll_monto						= round(ldb_capital_pagado * ldb_uf_reprog,0)
												end if
												//VALIDAR MEJORAS SAP
												INSERT INTO "INGRESO"  
															( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",		"TIPO_MOV",	"MONTO",		"CUOTAS_PAG",	"SERIE",			"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",			"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"FECHA_SISTEMA",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",			"MONEDA_SAP" )  
												VALUES 	( :ll_folio,	'CS',				:ldt_fecha_promesa,	'Q',				:ll_monto,		0,						:ls_serie_cs,	:ll_numero_cs,		'AI',				' ',				:ldb_uf_reprog,		'A',				:ls_base_cs,		:gi_rut,	:gs_user,	null,			:ldt_fecha_hoy,		null,						null,						null,				null,				null,				:ldt_fecha_hoy,		'0',						null,					null,									:gdt_fec_sistema,		:ldt_fecha_promesa,	'S',					 1,							:ldb_capital_pagado,	:ls_moneda_reprog)  
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
													INSERT INTO "INGRESO"  
																( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",			"TIPO_MOV",	"MONTO",		"CUOTAS_PAG",	"SERIE",			"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",			"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"FECHA_SISTEMA",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )  
													VALUES 	( :ll_folio,	'CS',				:ldt_fecha_promesa,		'S',				:ll_monto * -1,	0,						:ls_serie_cs,	:ll_numero_cs,		'AI',				' ',				:ldb_uf_reprog,		'A',				:ls_base_cs,		:gi_rut,	:gs_user,	null,			:ldt_fecha_hoy,		null,						null,						null,			null,				null,				:ldt_fecha_hoy,		'135',					null,					null,									:gdt_fec_sistema,		:ldt_fecha_promesa,	'S',					0,							:ll_monto * -1,		'1'				 )  
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
													INSERT INTO "DOCUMENTOS"  
																( "FOLIO",	"TIPO_COB",	"N_CHEQUE",	"COD_BANCO",		"MONTO",	"FECHA_VENC",			"COD_PAGO",	"NUM_CHEQUES",		"REZAGO",	"FECHA_PAGO",			"COD_CAJA",	"ESTADO_CH",		"GLOSA_CH",	"FECHA_ESTADO_CH",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",		"COD_AUTORIZACION_CREDITO",		"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO",	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",		"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_PAGO_SAP",	"MONTO_UF",	"FECHA_DEPOSITO" ) 
													VALUES 	( :ll_folio,	'CS',				999,   			999,   				0,   			:ldt_fecha_promesa,   	'EF',   			999,   					' ',				:ldt_fecha_promesa,		'AI',   				'C',					null,   			null,   						0,   									0,   									'0',   											0,   									0,   								'0',   										0,   							'NN',   					0,   											:ll_hora,   			:ll_min,   				null,   						'CS',   					99,   							0,					:ldt_fecha_promesa ) 
													USING	sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
													UPDATE	"DETALLE_PAGO_PIE"  
													SET 		"TIPO_COB" = 'CS',   
																"FOLIO" = :ll_folio,   
																"CAJA" = 'AI',   
																"ESTADO" = 'C',   
																"USUARIO" = :gs_user,   
																"FECHA_PAGO" = :ldt_fecha_hoy,   
																"MONTO_PIE_PAGADO_PESO" = :ll_monto,   
																"MONTO_PIE_PAGADO_UF" = :ldb_capital_pagado  
													WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :ls_base_cs ) AND  
															 ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie_cs ) AND  
															 ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero_cs ) AND  
															 ( "DETALLE_PAGO_PIE"."ESTADO" = 'P' ) AND  
															 ( "DETALLE_PAGO_PIE"."NUMERO_CUOTA" = (SELECT MIN("DETALLE_PAGO_PIE"."NUMERO_CUOTA") FROM "DETALLE_PAGO_PIE" WHERE ( "DETALLE_PAGO_PIE"."BASE" = :ls_base_cs ) AND ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie_cs ) AND ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero_cs ) AND ( "DETALLE_PAGO_PIE"."ESTADO" = 'P' ) ) )   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
														INSERT INTO "DETALLE_PAGO_PIE_COMPROBANTE"  
																		( "TIPO_COB",	"FOLIO",		"RUT",	"FECHA_PAGO",		"BASE",			"SERIE",			"NUMERO",		"CAJA",	"USUARIO",	"MONTO_CANCELADO",	"REZAGO",	"MONTO_CANCELADO_UF",	"BASE_ORIGINAL",	"SERIE_ORIGINAL",	"NUMERO_ORIGINAL" )
														VALUES		( 'CS',				:ll_folio,		:gi_rut,	:ldt_fecha_hoy,	:ls_base_cs,	:ls_serie_cs,	:ll_numero_cs,	'AI',		:gs_user,	:ll_monto,				'N',			:ldb_capital_pagado,		:gs_base,			:gs_serie,			:gi_numero )  
														USING		sqlca;
														if sqlca.sqlcode=0 then
															commit;
															SELECT	"OFERTA_V"."TOT_PAGADO",   
																		"PAGO_OFERTA"."CTAS_PAGADAS_PIE",   
																		"OFERTA_V"."ULT_FOLIO",
																		"PAGO_OFERTA"."PIE_PAGADO",
																		"PAGO_OFERTA"."CTAS_PACTADAS_PIE"
															INTO 		:ll_tot_pagado,   
																		:ll_ctas_pag_pie,   
																		:ll_ult_folio_cs,
																		:ll_pie_pagado_cs,
																		:ll_ctas_pac_pie
															FROM 	"CADENA",   
																		"OFERTA_V",   
																		"PAGO_OFERTA"  
															WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
																	 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
																	 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
																	 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
																	 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
																	 (("CADENA"."CODIGO" = :ls_base_cs ) AND  
																	 ( "CADENA"."SERIE" = :ls_serie_cs ) AND  
																	 ( "CADENA"."NUMERO" = :ll_numero_cs ) )   
															USING		sqlca;
															if isnull(ll_tot_pagado) then ll_tot_pagado=0
															if isnull(ll_pie_pagado_cs) then ll_pie_pagado_cs=0
															ll_suma_tot_pagado	= ll_monto + ll_tot_pagado
															ll_suma_pie_pagado	= ll_monto + ll_pie_pagado_cs
															UPDATE	"OFERTA_V"  
															SET 		"TOT_PAGADO" = :ll_suma_tot_pagado  
															WHERE  ( "OFERTA_V"."SERIE" = :ls_serie_cs ) AND  
																	 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_cs )   
															USING		sqlca;
															if sqlca.sqlcode=0 then
																commit;
																if ll_ctas_pac_pie>0 then
																	if isnull(ll_ctas_pag_pie) then ll_ctas_pag_pie=0
																	ll_ctas_pag_pie ++
																	UPDATE	"PAGO_OFERTA"  
																	SET 		"CTAS_PAGADAS_PIE" = :ll_ctas_pag_pie,
																				"PIE_PAGADO" = :ll_suma_pie_pagado
																	WHERE  ( "PAGO_OFERTA"."SERIE" = :ls_serie_cs ) AND  
																			 ( "PAGO_OFERTA"."NRO_OFERTA" = :ll_numero_cs ) AND  
																			 ( "PAGO_OFERTA"."FOLIO" = :ll_ult_folio_cs )   
																	USING		sqlca;
																	if sqlca.sqlcode=0 then
																		commit;
																	else
																		rollback;
																	end if
																end if
															else
																rollback;
															end if
														else
															rollback;
														end if
													else
														rollback;
													end if
												else
													rollback;
												end if
											end if
										else
											rollback;
										end if
									else
										SELECT	MAX("INGRESO"."FOLIO")  
										INTO 		:ll_folio  
										FROM 	"INGRESO"  
										WHERE 	"INGRESO"."TIPO_COB" = 'CS'   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											if ll_folio>0 then
												ll_folio ++
											else
												ll_folio	= 1
											end if
										else
											ll_folio		= 1
										end if
										SELECT	"REPACTA_CREDITO"."CAPITAL_PAGADO",
													"REPACTA_CREDITO"."BASE",
													"REPACTA_CREDITO"."SERIE",
													"REPACTA_CREDITO"."NUMERO",
													"REPACTA_CREDITO"."UF_DIA",
													"REPACTA_CREDITO"."MONEDA_ORIGINAL"
										INTO 		:ldb_capital_pagado,
													:ls_base_cs,
													:ls_serie_cs,
													:ll_numero_cs,
													:ldb_uf_reprog,
													:ls_moneda_reprog
										FROM 	"REPACTA_CREDITO"  
										WHERE  ( "REPACTA_CREDITO"."BASE_ORIGINAL" = :gs_base ) AND  
												 ( "REPACTA_CREDITO"."SERIE_ORIGINAL" = :gs_serie ) AND  
												 ( "REPACTA_CREDITO"."NUMERO_ORIGINAL" = :gi_numero ) AND
												 ( "REPACTA_CREDITO"."ESTADO" = 'V' ) AND
												 ( "REPACTA_CREDITO"."FECHA_CREA" = ( 	SELECT	max("REPACTA_CREDITO"."FECHA_CREA")
																											FROM 		"REPACTA_CREDITO"  
																											WHERE  	( "REPACTA_CREDITO"."BASE_ORIGINAL" = :gs_base ) AND  
																														( "REPACTA_CREDITO"."SERIE_ORIGINAL" = :gs_serie ) AND  
																											 			( "REPACTA_CREDITO"."NUMERO_ORIGINAL" = :gi_numero ) ) )  
										USING		sqlca;
										if sqlca.sqlcode=0 then
											ldb_uf_reprog	= gd_uf_dia
											if ls_moneda_reprog='1' then //Peso
												ll_monto		= ldb_capital_pagado
											else
												ll_monto		= round(ldb_capital_pagado * ldb_uf_reprog,0)
											end if
											INSERT INTO "INGRESO"  
														( "FOLIO",		"TIPO_COB",	"FECHA_PAGO",		"TIPO_MOV",	"MONTO",		"CUOTAS_PAG",	"SERIE",			"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",			"PAGO_HIST",	"BASE",			"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",		"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",			"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"FECHA_SISTEMA",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",			"MONEDA_SAP" )  
											VALUES 	( :ll_folio,		'CS',				:ldt_fecha_hoy,			'Q',				:ll_monto,		0,						:ls_serie_cs,	:ll_numero_cs,		'AI',				' ',				:ldb_uf_reprog,			'A',				:ls_base_cs,		:gi_rut,	:gs_user,	null,			:ldt_fecha_hoy,			null,						null,						null,			null,				null,				:ldt_fecha_hoy,			'0',						null,					null,									:gdt_fec_sistema,		:ldt_fecha_hoy,			'S',					 1,							:ldb_capital_pagado,	:ls_moneda_reprog )  
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
												INSERT INTO "INGRESO"  
																( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",		"CUOTAS_PAG",	"SERIE",			"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",			"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"FECHA_SISTEMA",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )  
													VALUES 	( :ll_folio,	'CS',				:ldt_fecha_hoy,		'S',				:ll_monto * -1,	0,						:ls_serie_cs,	:ll_numero_cs,		'AI',				' ',				:ldb_uf_reprog,		'A',				:ls_base_cs,		:gi_rut,	:gs_user,	null,			:ldt_fecha_hoy,		null,						null,						null,			null,				null,				:ldt_fecha_hoy,		'135',					null,					null,									:gdt_fec_sistema,		:ldt_fecha_hoy,			'S',					0,							:ll_monto * -1,		'1' )  
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
													INSERT INTO "DOCUMENTOS"  
																( "FOLIO",	"TIPO_COB",	"N_CHEQUE",	"COD_BANCO",		"MONTO",	"FECHA_VENC",	"COD_PAGO",	"NUM_CHEQUES",		"REZAGO",	"FECHA_PAGO",	"COD_CAJA",	"ESTADO_CH",		"GLOSA_CH",	"FECHA_ESTADO_CH",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",		"COD_AUTORIZACION_CREDITO",		"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO",	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",		"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"ESTADO_PAGO_SAP",	"MONTO_UF",	"FECHA_DEPOSITO" ) 
													VALUES 	( :ll_folio,	'CS',				999,   			999,   				0,   			:ldt_fecha_hoy,   	'EF',   			999,   					' ',				:ldt_fecha_hoy,		'AI',   				'C',					null,   			null,   						0,   									0,   									'0',   											0,   									0,   								'0',   										0,   							'NN',   					0,   											:ll_hora,   			:ll_min,   				null,   						'CS',   					99,   							0,					:ldt_fecha_hoy ) 
													USING	sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
												UPDATE	"DETALLE_PAGO_PIE"  
												SET 		"TIPO_COB" = 'CS',   
															"FOLIO" = :ll_folio,   
															"CAJA" = 'AI',   
															"ESTADO" = 'C',   
															"USUARIO" = :gs_user,   
															"FECHA_PAGO" = :ldt_fecha_hoy,   
															"MONTO_PIE_PAGADO_PESO" = :ll_monto,   
															"MONTO_PIE_PAGADO_UF" = :ldb_capital_pagado  
												WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :ls_base_cs ) AND  
														 ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie_cs ) AND  
														 ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero_cs ) AND  
														 ( "DETALLE_PAGO_PIE"."ESTADO" = 'P' ) AND  
														 ( "DETALLE_PAGO_PIE"."NUMERO_CUOTA" = (SELECT MIN("DETALLE_PAGO_PIE"."NUMERO_CUOTA") FROM "DETALLE_PAGO_PIE" WHERE ( "DETALLE_PAGO_PIE"."BASE" = :ls_base_cs ) AND ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie_cs ) AND ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero_cs ) AND ( "DETALLE_PAGO_PIE"."ESTADO" = 'P' ) ) )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
													INSERT INTO "DETALLE_PAGO_PIE_COMPROBANTE"  
																( "TIPO_COB",	"FOLIO",		"RUT",	"FECHA_PAGO",		"BASE",			"SERIE",			"NUMERO",		"CAJA",	"USUARIO",	"MONTO_CANCELADO",	"REZAGO",	"MONTO_CANCELADO_UF",	"BASE_ORIGINAL",	"SERIE_ORIGINAL",	"NUMERO_ORIGINAL" )
													VALUES	( 'CS',				:ll_folio,	:gi_rut,	:ldt_fecha_hoy,	:ls_base_cs,	:ls_serie_cs,	:ll_numero_cs,	'AI',		:gs_user,	:ll_monto,				'N',			:ldb_capital_pagado,		:gs_base,			:gs_serie,			:gi_numero )  
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
														SELECT	"OFERTA_V"."TOT_PAGADO",   
																	"PAGO_OFERTA"."CTAS_PAGADAS_PIE",   
																	"OFERTA_V"."ULT_FOLIO",
																	"PAGO_OFERTA"."PIE_PAGADO",
																	"PAGO_OFERTA"."CTAS_PACTADAS_PIE"
														INTO 		:ll_tot_pagado,   
																	:ll_ctas_pag_pie,   
																	:ll_ult_folio_cs,
																	:ll_pie_pagado_cs,
																	:ll_ctas_pac_pie
														FROM 	"CADENA",   
																	"OFERTA_V",   
																	"PAGO_OFERTA"  
														WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
																 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
																 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
																 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
																 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
																 (("CADENA"."CODIGO" = :ls_base_cs ) AND  
																 ( "CADENA"."SERIE" = :ls_serie_cs ) AND  
																 ( "CADENA"."NUMERO" = :ll_numero_cs ) )   
														USING		sqlca;
														if isnull(ll_tot_pagado) then ll_tot_pagado=0
														if isnull(ll_pie_pagado_cs) then ll_pie_pagado_cs=0
														ll_suma_tot_pagado	= ll_monto + ll_tot_pagado
														ll_suma_pie_pagado	= ll_monto + ll_pie_pagado_cs
														UPDATE	"OFERTA_V"  
														SET 		"TOT_PAGADO" = :ll_suma_tot_pagado  
														WHERE  ( "OFERTA_V"."SERIE" = :ls_serie_cs ) AND  
																   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_cs )   
														USING		sqlca;
														if sqlca.sqlcode=0 then
															commit;
															if ll_ctas_pac_pie>0 then
																if isnull(ll_ctas_pag_pie) then ll_ctas_pag_pie=0
																ll_ctas_pag_pie ++
																UPDATE	"PAGO_OFERTA"  
																SET 		"CTAS_PAGADAS_PIE" = :ll_ctas_pag_pie,
																			"PIE_PAGADO" = :ll_suma_pie_pagado
																WHERE  ( "PAGO_OFERTA"."SERIE" = :ls_serie_cs ) AND  
																		 ( "PAGO_OFERTA"."NRO_OFERTA" = :ll_numero_cs ) AND  
																		 ( "PAGO_OFERTA"."FOLIO" = :ll_ult_folio_cs )   
																USING		sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																end if
															end if
														else
															rollback;
														end if
													else
														rollback;
													end if
												else
													rollback;
												end if
											else
												rollback;
											end if
										end if
									end if
								end if
							end if
						end if
						//Fin Codigo Nuevo Grabar Promesa Asociada
						if gs_base='R' then
							UPDATE	"REPACTA_MANTENCION"  
							SET 		"ESTADO_PAGO" = 'P' 
							WHERE  ( "REPACTA_MANTENCION"."BASE" = :gs_base ) AND  
									 ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
									 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
					else
						rollback;
					end if
				else
					rollback;
				end if
	
				if ls_est_mod='S' then
					ll_resp			= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
					if ll_resp=1 then
						SELECT	"SOL_RESCILIA_REPROG"."DIRECCION_P",   "SOL_RESCILIA_REPROG"."POBLACION",   "SOL_RESCILIA_REPROG"."SECTOR",   "SOL_RESCILIA_REPROG"."COMUNA",   "SOL_RESCILIA_REPROG"."CIUDAD",   "SOL_RESCILIA_REPROG"."FONO_P",   "SOL_RESCILIA_REPROG"."FECHA_NAC",   "SOL_RESCILIA_REPROG"."ESTADO_CIVIL",   "SOL_RESCILIA_REPROG"."DOMICILIO_C",   "SOL_RESCILIA_REPROG"."TOTAL_RENTA",   "SOL_RESCILIA_REPROG"."FONO_C",   "SOL_RESCILIA_REPROG"."GRUPO_F",   "SOL_RESCILIA_REPROG"."RUT_TITULAR",   "SOL_RESCILIA_REPROG"."TIPO_VIA",   "SOL_RESCILIA_REPROG"."NUMERO_PARTICULAR",   "SOL_RESCILIA_REPROG"."DEPTO_PARTICULAR",   "SOL_RESCILIA_REPROG"."BLOCK_PARTICULAR"
						INTO 		:ls_dir_p,   									:ls_pob,   									 :ls_sector,   						  :ls_comuna,   							:ls_ciudad,   							 :ls_fono_p,   						  :ldt_fec_nac,   							:ls_est_civil,   								 :ls_dir_c,   									 :ll_renta,   									 :ls_fono_c,   						  :ll_grupo_f,   							 :ll_rut ,										 :ls_tipo_via,								 :ls_nro_part,											 :ls_depto_part,										:ls_block_part
						FROM 	"SOL_RESCILIA_REPROG",   
									"SOL_ESTATUS"  
						WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_RESCILIA_REPROG"."BASE" ) and  
								 ( "SOL_ESTATUS"."SERIE" = "SOL_RESCILIA_REPROG"."SERIE" ) and  
								 ( "SOL_ESTATUS"."NUMERO" = "SOL_RESCILIA_REPROG"."NUMERO" ) and  
								 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESCILIA_REPROG"."CORRELATIVO" ) and  
								 (("SOL_RESCILIA_REPROG"."BASE" = :gs_base ) AND  
								 ( "SOL_RESCILIA_REPROG"."SERIE" = :gs_serie ) AND  
								 ( "SOL_RESCILIA_REPROG"."NUMERO" = :gi_numero ) AND  
								 ( "SOL_RESCILIA_REPROG"."CORRELATIVO" = :ll_corr ) AND  
								 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
						Using	sqlca;
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
			else
				rollback;
			end if
		end if		
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_seguro_fallecimiento ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
			
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_SEGURO_FALLECE"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_SEGURO_FALLECE"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																	  FROM 	"SOL_ESTATUS"  
																	  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																				( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_SEGURO_FALLECE"."SERIE" = :gs_serie AND
						"SOL_SEGURO_FALLECE"."NUMERO" = :gi_numero AND
						"SOL_SEGURO_FALLECE"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				UPDATE	"CADENA"  
				SET 		"ESTADO" = 'S'  
				WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
						 ( "CADENA"."SERIE" = :gs_serie ) AND  
						 ( "CADENA"."NUMERO" = :gi_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			else
				rollback;
			end if
			// no hacer nada
			if ls_est_mod='S' then
				ll_resp			= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_SEGURO_FALLECE"."DIRECCION_P", "SOL_SEGURO_FALLECE"."POBLACION",   "SOL_SEGURO_FALLECE"."SECTOR",   "SOL_SEGURO_FALLECE"."COMUNA",   "SOL_SEGURO_FALLECE"."CIUDAD",   "SOL_SEGURO_FALLECE"."FONO_P",   "SOL_SEGURO_FALLECE"."FECHA_NAC",   "SOL_SEGURO_FALLECE"."ESTADO_CIVIL",   "SOL_SEGURO_FALLECE"."DOMICILIO_C",		"SOL_SEGURO_FALLECE"."TOTAL_RENTA", "SOL_SEGURO_FALLECE"."FONO_C",   "SOL_SEGURO_FALLECE"."GRUPO_F",  "SOL_SEGURO_FALLECE"."RUT_TITULAR"  ,  "SOL_SEGURO_FALLECE"."TIPO_VIA", "SOL_SEGURO_FALLECE"."NUMERO_PARTICULAR", "SOL_SEGURO_FALLECE"."DEPTO_PARTICULAR",  "SOL_SEGURO_FALLECE"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   							  	:ls_pob,   							  		:ls_sector,   					  		:ls_comuna,   					  		:ls_ciudad,   					  		:ls_fono_p,   					  		:ldt_fec_nac,   					  		:ls_est_civil,   						  		:ls_dir_c,   							 		:ll_renta,   								:ls_fono_c,   							:ll_grupo_f,   					 	:ll_rut ,										:ls_tipo_via,						 	:ls_nro_part,										:ls_depto_part,								 	:ls_block_part
					FROM 	"SOL_SEGURO_FALLECE",   
								"SOL_ESTATUS"  
					WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_FALLECE"."BASE" ) and  
							 ( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_FALLECE"."SERIE" ) and  
							 ( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_FALLECE"."NUMERO" ) and  
							 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_FALLECE"."CORRELATIVO" ) and  
							 (("SOL_SEGURO_FALLECE"."BASE" = :gs_base ) AND  
							 ( "SOL_SEGURO_FALLECE"."SERIE" = :gs_serie ) AND  
							 ( "SOL_SEGURO_FALLECE"."NUMERO" = :gi_numero ) AND  
							 ( "SOL_SEGURO_FALLECE"."CORRELATIVO" = :ll_corr ) AND  
							 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
					Using	sqlca;
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_en_demanda ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp,ll_ctas_pag_m,ll_ctas,ll_ctas_repacta,ll_ctas_en_mora
Datetime	ldt_fec_nac,ldt_fecha,ldt_fecha_hoy
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado,ls_estado_reg,ls_base,&
			ls_serie,ls_anexo_lib,ls_anexo_repacta,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
Double	ll_numero
ldt_fecha					= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy			= datetime(idt_fecha_hoy,time('00:00:00'))
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
ll_rut						= dw_lista.getitemnumber(il_row,'rut_cliente')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_EN_DEMANDA"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_EN_DEMANDA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																	  FROM 	"SOL_ESTATUS"  
																	  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																				( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_EN_DEMANDA"."SERIE" = :gs_serie AND
						"SOL_EN_DEMANDA"."NUMERO" = :gi_numero AND
						"SOL_EN_DEMANDA"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			SELECT	"SOL_EN_DEMANDA"."ESTADO_CTTO_FINAL"  
			INTO 		:ls_estado  
			FROM 	"SOL_EN_DEMANDA",   
						"SOL_ESTATUS"  
			WHERE  ( "SOL_EN_DEMANDA"."BASE" = "SOL_ESTATUS"."BASE" ) and  
					 ( "SOL_EN_DEMANDA"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
					 ( "SOL_EN_DEMANDA"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
					 ( "SOL_EN_DEMANDA"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
					 (("SOL_EN_DEMANDA"."BASE" = :ls_base ) AND  
					 ( "SOL_EN_DEMANDA"."SERIE" = :ls_serie ) AND  
					 ( "SOL_EN_DEMANDA"."NUMERO" = :ll_numero ) AND  
					 ( "SOL_EN_DEMANDA"."CORRELATIVO" = :ll_corr ) AND  
					 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '23' ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
//				UPDATE	"CADENA"  
//				SET 		"ESTADO" = :ls_estado,
//							"FECHA_RES" = :ldt_fecha_hoy
//				WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
//							( "CADENA"."SERIE" = :gs_serie ) AND  
//							( "CADENA"."NUMERO" = :gi_numero )   
//				Using		sqlca ;

				if ls_estado = 'R' or ls_estado = 'B' or ls_estado = 'D' or ls_estado = 'P' or ls_estado = 'N' or ls_estado = 'A' or ls_estado = 'E' or ls_estado = 'F' then
					UPDATE	"CADENA"  
					SET 		"ESTADO_CONTRATO_AUX" = :ls_estado,
								"FECHA_RES" = :ldt_fecha_hoy
					WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
								( "CADENA"."SERIE" = :gs_serie ) AND  
								( "CADENA"."NUMERO" = :gi_numero )   
					USING		sqlca;
				else	
					UPDATE	"CADENA"  
					SET 		"ESTADO" = :ls_estado,
								"ESTADO_CONTRATO_AUX" = :ls_estado,
								"FECHA_RES" = :ldt_fecha_hoy
					WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
								( "CADENA"."SERIE" = :gs_serie ) AND  
								( "CADENA"."NUMERO" = :gi_numero )   
					USING		sqlca;
				end if	
				if sqlca.sqlcode=0 then
					commit;
					wf_actualizar_cadena_estado(ls_estado)
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
			if ls_est_mod='S' then
				ll_resp			= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_EN_DEMANDA"."DIRECCION_P",   "SOL_EN_DEMANDA"."POBLACION",   "SOL_EN_DEMANDA"."SECTOR",   "SOL_EN_DEMANDA"."COMUNA",   "SOL_EN_DEMANDA"."CIUDAD",   "SOL_EN_DEMANDA"."FONO_P",   "SOL_EN_DEMANDA"."FECHA_NAC",   "SOL_EN_DEMANDA"."ESTADO_CIVIL",   "SOL_EN_DEMANDA"."DOMICILIO_C",   "SOL_EN_DEMANDA"."TOTAL_RENTA",   "SOL_EN_DEMANDA"."FONO_C",   "SOL_EN_DEMANDA"."GRUPO_F",   "SOL_EN_DEMANDA"."RUT_TITULAR"  ,   "SOL_EN_DEMANDA"."TIPO_VIA",   "SOL_EN_DEMANDA"."NUMERO_PARTICULAR",   "SOL_EN_DEMANDA"."DEPTO_PARTICULAR",   "SOL_EN_DEMANDA"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   						  		:ls_pob,   						  			:ls_sector,   				  			:ls_comuna,   				  		:ls_ciudad,   				  			:ls_fono_p,   				  			:ldt_fec_nac,   				  		:ls_est_civil,   					  			:ls_dir_c,   						 		:ll_renta,   									:ls_fono_c,   							:ll_grupo_f,   				 	:ll_rut ,											:ls_tipo_via,					 		:ls_nro_part,										:ls_depto_part,							 		:ls_block_part
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_bono_fraterno ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
			
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_BONO_FRATERNO"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_BONO_FRATERNO"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																  FROM 	"SOL_ESTATUS"  
																  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																			( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																			( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																			( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																			( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																			( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_BONO_FRATERNO"."SERIE" = :gs_serie AND
						"SOL_BONO_FRATERNO"."NUMERO" = :gi_numero AND
						"SOL_BONO_FRATERNO"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			// no hacer nada
			if ls_est_mod='S' then
				ll_resp			= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_BONO_FRATERNO"."DIRECCION_P",   "SOL_BONO_FRATERNO"."POBLACION",   "SOL_BONO_FRATERNO"."SECTOR",   "SOL_BONO_FRATERNO"."COMUNA",   "SOL_BONO_FRATERNO"."CIUDAD",   "SOL_BONO_FRATERNO"."FONO_P",   "SOL_BONO_FRATERNO"."FECHA_NAC",   "SOL_BONO_FRATERNO"."ESTADO_CIVIL",   "SOL_BONO_FRATERNO"."DOMICILIO_C",   "SOL_BONO_FRATERNO"."TOTAL_RENTA",   "SOL_BONO_FRATERNO"."FONO_C",   "SOL_BONO_FRATERNO"."GRUPO_F",   "SOL_BONO_FRATERNO"."RUT_TITULAR"  ,   "SOL_BONO_FRATERNO"."TIPO_VIA",   "SOL_BONO_FRATERNO"."NUMERO_PARTICULAR",   "SOL_BONO_FRATERNO"."DEPTO_PARTICULAR",   "SOL_BONO_FRATERNO"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   					  :ldt_fec_nac,   					  :ls_est_civil,   						  :ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut ,										:ls_tipo_via,						 :ls_nro_part,										:ls_depto_part,								 :ls_block_part
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

public subroutine wf_grabar_todos_mant_perpetua ();long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_resp
Datetime	ldt_fec_nac,ldt_fecha
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_estado_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
			
ldt_fecha					= datetime(idt_fecha_hoy,now())
gs_base					= dw_lista.getitemstring(il_row,'base')
gs_serie					= dw_lista.getitemstring(il_row,'serie')
gi_numero				= dw_lista.getitemnumber(il_row,'numero')
ll_corr					= dw_lista.getitemnumber(il_row,'correlativo')
il_correlativo			= dw_lista.getitemnumber(il_row,'correlativo')
ll_estatus				= dw_lista.getitemnumber(il_row,'estatus_informatica')
ls_cod_sol				= dw_lista.getitemstring(il_row,'codigo_solicitud')
ls_est_mod				= dw_lista.getitemstring(il_row,'mod_ant_cliente')
ll_est_ope				= dw_lista.getitemnumber(il_row,'estatus_operacion')
ls_estado_reg			= dw_lista.getitemstring(il_row,'estado_reg')
if ls_estado_reg='A' then
	if ll_est_ope = 0 and ll_estatus=1 then
		dw_lista.setitem(il_row,'estatus_informatica',0)
		dw_lista.setitem(il_row,'usuario_infor',gs_user)
		dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
		ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
		ls_obs			= ls_obs+', Autoriza Operaciones por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
		dw_lista.setitem(il_row,'observacion',ls_obs)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			UPDATE	"SOL_MANT_PERPETUA"  
			SET 		"ESTATUS_INFORMATICA" = 0,   
						"USUARIO_INFOR" = :gs_user,   
						"FECHA_INFOR" = :ldt_fecha  
			WHERE 	"SOL_MANT_PERPETUA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																  FROM 	"SOL_ESTATUS"  
																  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																			( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																			( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																			( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																			( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																			( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
						"SOL_MANT_PERPETUA"."SERIE" = :gs_serie AND
						"SOL_MANT_PERPETUA"."NUMERO" = :gi_numero AND
						"SOL_MANT_PERPETUA"."CORRELATIVO" = :ll_corr
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			// no hacer nada
			if ls_est_mod='S' then
				ll_resp			= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	"SOL_MANT_PERPETUA"."DIRECCION_P",   "SOL_MANT_PERPETUA"."POBLACION",   "SOL_MANT_PERPETUA"."SECTOR",   "SOL_MANT_PERPETUA"."COMUNA",   "SOL_MANT_PERPETUA"."CIUDAD",   "SOL_MANT_PERPETUA"."FONO_P",   "SOL_MANT_PERPETUA"."FECHA_NAC",   "SOL_MANT_PERPETUA"."ESTADO_CIVIL",   "SOL_MANT_PERPETUA"."DOMICILIO_C",   "SOL_MANT_PERPETUA"."TOTAL_RENTA",   "SOL_MANT_PERPETUA"."FONO_C",   "SOL_MANT_PERPETUA"."GRUPO_F",   "SOL_MANT_PERPETUA"."RUT_TITULAR"  ,   "SOL_MANT_PERPETUA"."TIPO_VIA",   "SOL_MANT_PERPETUA"."NUMERO_PARTICULAR",   "SOL_MANT_PERPETUA"."DEPTO_PARTICULAR",   "SOL_MANT_PERPETUA"."BLOCK_PARTICULAR"
					INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   					  :ldt_fec_nac,   					  :ls_est_civil,   						  :ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut ,										:ls_tipo_via,						 :ls_nro_part,										:ls_depto_part,								 :ls_block_part
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
		else
			rollback;
		end if
	else
		if ll_est_ope = 1 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' NO está Autorizada por Atención Cliente')
		elseif ll_estatus=0 then
			messagebox("Advertencia","Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero)+'-'+string(il_correlativo)+' Ya está Autorizado por Operaciones')
		end if
	end if
end if
end subroutine

on w_estado_informes.create
this.dw_exportar_rescil_cliente=create dw_exportar_rescil_cliente
this.sle_1=create sle_1
this.p_fin=create p_fin
this.p_ini=create p_ini
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.cb_seg_desg=create cb_seg_desg
this.cb_tit_dominio=create cb_tit_dominio
this.dw_benefi=create dw_benefi
this.dw_print_ctto=create dw_print_ctto
this.cb_print_ctto=create cb_print_ctto
this.dw_print=create dw_print
this.cbx_todo=create cbx_todo
this.cb_problema=create cb_problema
this.dw_linea=create dw_linea
this.cb_resolucion=create cb_resolucion
this.st_porc=create st_porc
this.cb_po_rut=create cb_po_rut
this.dw_solicitudes=create dw_solicitudes
this.pb_ok=create pb_ok
this.st_1=create st_1
this.rb_todo=create rb_todo
this.rb_opera=create rb_opera
this.cb_cta_cte=create cb_cta_cte
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_sort=create cb_sort
this.cb_filtrar=create cb_filtrar
this.cb_cerrar=create cb_cerrar
this.rb_infor=create rb_infor
this.gb_1=create gb_1
this.hpb_1=create hpb_1
this.st_fondo=create st_fondo
this.dw_lista=create dw_lista
this.cb_aceptar_informatica=create cb_aceptar_informatica
this.cb_aceptar_operaciones=create cb_aceptar_operaciones
this.Control[]={this.dw_exportar_rescil_cliente,&
this.sle_1,&
this.p_fin,&
this.p_ini,&
this.em_fec_fin,&
this.st_3,&
this.em_fec_ini,&
this.st_2,&
this.cb_seg_desg,&
this.cb_tit_dominio,&
this.dw_benefi,&
this.dw_print_ctto,&
this.cb_print_ctto,&
this.dw_print,&
this.cbx_todo,&
this.cb_problema,&
this.dw_linea,&
this.cb_resolucion,&
this.st_porc,&
this.cb_po_rut,&
this.dw_solicitudes,&
this.pb_ok,&
this.st_1,&
this.rb_todo,&
this.rb_opera,&
this.cb_cta_cte,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_sort,&
this.cb_filtrar,&
this.cb_cerrar,&
this.rb_infor,&
this.gb_1,&
this.hpb_1,&
this.st_fondo,&
this.dw_lista,&
this.cb_aceptar_informatica,&
this.cb_aceptar_operaciones}
end on

on w_estado_informes.destroy
destroy(this.dw_exportar_rescil_cliente)
destroy(this.sle_1)
destroy(this.p_fin)
destroy(this.p_ini)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.cb_seg_desg)
destroy(this.cb_tit_dominio)
destroy(this.dw_benefi)
destroy(this.dw_print_ctto)
destroy(this.cb_print_ctto)
destroy(this.dw_print)
destroy(this.cbx_todo)
destroy(this.cb_problema)
destroy(this.dw_linea)
destroy(this.cb_resolucion)
destroy(this.st_porc)
destroy(this.cb_po_rut)
destroy(this.dw_solicitudes)
destroy(this.pb_ok)
destroy(this.st_1)
destroy(this.rb_todo)
destroy(this.rb_opera)
destroy(this.cb_cta_cte)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_sort)
destroy(this.cb_filtrar)
destroy(this.cb_cerrar)
destroy(this.rb_infor)
destroy(this.gb_1)
destroy(this.hpb_1)
destroy(this.st_fondo)
destroy(this.dw_lista)
destroy(this.cb_aceptar_informatica)
destroy(this.cb_aceptar_operaciones)
end on

event open;Long	ll_count_reg

connect using Trans_1;
gf_centrar(w_estado_informes)
idt_fecha_hoy								= date(gdt_fec_sistema)
dw_lista.settransobject(sqlca)
dw_benefi.settransobject(sqlca)
dw_solicitudes.settransobject(sqlca)
dw_exportar_rescil_cliente.settransobject(sqlca)
dw_linea.settransobject(sqlca)
dw_print.settransobject(sqlca)
em_fec_ini.text								= string(idt_fecha_hoy)
em_fec_fin.text								= string(idt_fecha_hoy)
st_fondo.visible								= false
hpb_1.visible 								= false
st_porc.visible 								= false
cbx_todo.visible							= false
cb_tit_dominio.enabled					= false
cb_seg_desg.enabled						= false
if gs_solicitudes='1' then//operaciones 1
//	cb_aceptar_operaciones.visible	= true
	cb_aceptar_operaciones.enabled	= false	
	cb_aceptar_informatica.enabled	= false	
	cb_print_ctto.enabled					= false
elseif gs_solicitudes='2' then //operaciones 2
//	cb_aceptar_operaciones.visible	= true
	cb_aceptar_operaciones.enabled	= true
	cb_aceptar_informatica.enabled	= false
	cb_print_ctto.enabled					= true
elseif gs_solicitudes='3' then // informatica 3
	cb_aceptar_informatica.enabled	= true
	cb_aceptar_operaciones.enabled	= false
	cbx_todo.visible						= true
	cb_print_ctto.enabled					= true
elseif gs_solicitudes<>'1' and gs_solicitudes<>'2' and gs_solicitudes<>'3' then

//	cb_aceptar_informatica.visible		= true
	cb_aceptar_informatica.enabled	= false
	cb_aceptar_operaciones.enabled	= false
	cb_print_ctto.enabled					= false
end if
rb_todo.checked							= true
dw_solicitudes.insertrow(0)
dw_solicitudes.setitem(1,'codigo',is_tipo_sol)
SELECT	COUNT("SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD")
INTO 		:ll_count_reg  
FROM 	"SOL_PERMISOS_USUARIO"  
WHERE  ( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
		   ( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' )   
USING	sqlca;
if ll_count_reg>0 or gs_depto='I' then
	cb_aceptar_informatica.enabled	= true
else
	cb_aceptar_informatica.enabled	= false
end if
gs_ventana									= 'w_estado_informes'
f_valida_objeto()
end event

event close;disconnect using Trans_1;
end event

type dw_exportar_rescil_cliente from datawindow within w_estado_informes
integer x = 3301
integer y = 420
integer width = 686
integer height = 400
integer taborder = 60
string title = "none"
string dataobject = "dw_exportar_rescil_cliente"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from uo_convierte_numero within w_estado_informes
boolean visible = false
integer x = 539
integer y = 2304
integer width = 494
integer taborder = 130
boolean hideselection = false
end type

type p_fin from picture within w_estado_informes
integer x = 2811
integer y = 44
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(idt_fecha_hoy,gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(idt_fecha_hoy,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type p_ini from picture within w_estado_informes
integer x = 2144
integer y = 44
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(idt_fecha_hoy,gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(idt_fecha_hoy,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_fin from editmask within w_estado_informes
integer x = 2450
integer y = 44
integer width = 357
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_3 from statictext within w_estado_informes
integer x = 2258
integer y = 60
integer width = 160
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_estado_informes
integer x = 1783
integer y = 44
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_estado_informes
integer x = 1262
integer y = 60
integer width = 498
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_seg_desg from commandbutton within w_estado_informes
integer x = 1815
integer y = 1824
integer width = 210
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Seguro"
end type

event clicked;if dw_lista.rowcount()>0 then Openwithparm(w_detalle_seguros_desgravamen,is_tipo_sol)
end event

type cb_tit_dominio from commandbutton within w_estado_informes
integer x = 1573
integer y = 1824
integer width = 238
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "T.&Dominio"
end type

event clicked;if dw_lista.rowcount()>0 then open(w_detalle_titulo_de_dominio)
end event

type dw_benefi from datawindow within w_estado_informes
boolean visible = false
integer x = 1138
integer y = 1932
integer width = 411
integer height = 432
string dataobject = "dw_lista_beneficiarios_nuevos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_print_ctto from datawindow within w_estado_informes
boolean visible = false
integer x = 2715
integer y = 2000
integer width = 411
integer height = 432
string dataobject = "dw_print_ctto_rescilia_stgo_isacruz"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print_ctto from commandbutton within w_estado_informes
integer x = 1189
integer y = 1824
integer width = 379
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print C&tto Rescil"
end type

event clicked;string	ls_est_reg,ls_cod_sol,ls_estado_reg
Long		ll_est_ope,ll_estatus,ll_cod_parque
Datetime	ldt_fec_ctto,ldt_fecha_hoy
ldt_fecha_hoy		= datetime(idt_fecha_hoy,time("00:00:00"))
if il_row>0 then
	gs_base			= dw_lista.getitemstring(il_row,'base')
	gs_serie			= dw_lista.getitemstring(il_row,'serie')
	gi_numero		= dw_lista.getitemnumber(il_row,'numero')
	il_correlativo	= dw_lista.getitemnumber(il_row,'correlativo')
	ll_estatus		= dw_lista.getitemnumber(il_row,'estatus_operacion')
	ls_cod_sol		= dw_lista.getitemstring(il_row,'codigo_solicitud')
	ls_estado_reg	= dw_lista.getitemstring(il_row,'estado_reg')
	if ls_estado_reg='A' then
		if ls_cod_sol='1' then
			if il_row>0 then
				if ll_est_ope=0 then
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
							 ( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if isnull(ldt_fec_ctto) or date(ldt_fec_ctto)=date("01/01/1900") or date(ldt_fec_ctto)=date("00/00/0000") then
							//ldt_fecha_hoy
							UPDATE 	"SOL_RESCILIA_CLIENTE"  
							SET 		"FECHA_CONTRATO" = :ldt_fecha_hoy  
							WHERE  ( "SOL_RESCILIA_CLIENTE"."BASE" = :gs_base ) AND  
									 ( "SOL_RESCILIA_CLIENTE"."SERIE" = :gs_serie ) AND  
									 ( "SOL_RESCILIA_CLIENTE"."NUMERO" = :gi_numero ) AND  
									 ( "SOL_RESCILIA_CLIENTE"."CORRELATIVO" = :il_correlativo )  
							Using		sqlca ;
							if sqlca.sqlcode=0 then
								commit;
								SELECT	"CADENA"."COD_PARQUE"  
								INTO 		:ll_cod_parque  
								FROM 	"CADENA"  
								WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
										 ( "CADENA"."SERIE" = :gs_serie ) AND  
										 ( "CADENA"."NUMERO" = :gi_numero )   
								USING		sqlca;
								if sqlca.sqlcode=0 and ll_cod_parque>0 then
									wf_print_ctto_rescilia(ll_cod_parque)
								else
									messagebox("Advertencia","No es Posible Imprimir Solicitud, No tiene Asignado Codigo Parque")
								end if
							else
								rollback;
							end if
						else
							SELECT	"CADENA"."COD_PARQUE"  
							INTO 		:ll_cod_parque  
							FROM 	"CADENA"  
							WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
									 ( "CADENA"."SERIE" = :gs_serie ) AND  
									 ( "CADENA"."NUMERO" = :gi_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 and ll_cod_parque>0 then
								wf_print_ctto_rescilia(ll_cod_parque)
							else
								messagebox("Advertencia","No es Posible Imprimir Solicitud, No tiene Asignado Codigo Parque")
							end if
						end if
					else
						messagebox("Advertencia","Antes de Imprimir Contrato debe Grabar Solicitud")
					end if
				else
					messagebox("Advertencia","Solicitud debe estar Autorizado por Operaciones")
				end if
			else
				messagebox("Advertencia","Debe Seleccionar Solicitud")
			end if
		else
			messagebox("Advertencia","Solo Imprime Contrato de Solicitud Resciliación por parte del Cliente")
		end if
	else
		messagebox("Advertencia","Solicitud Anulada")
	end if
end if
end event

type dw_print from datawindow within w_estado_informes
boolean visible = false
integer x = 2272
integer y = 2000
integer width = 562
integer height = 432
string dataobject = "dw_documento_solicitud_acepta_o_rechaza"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_todo from checkbox within w_estado_informes
integer x = 667
integer y = 164
integer width = 517
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Actualiza Todo"
end type

type cb_problema from commandbutton within w_estado_informes
boolean visible = false
integer x = 2368
integer y = 2152
integer width = 416
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Problem.&Resoluc."
end type

event clicked;if isvalid(w_listar_solicitudes_con_problemas) then close(w_listar_solicitudes_con_problemas)
open(w_listar_solicitudes_con_problemas)
end event

type dw_linea from datawindow within w_estado_informes
integer x = 169
integer y = 2004
integer width = 2176
integer height = 468
string title = "none"
string dataobject = "dwe_linea"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_resolucion from commandbutton within w_estado_informes
boolean visible = false
integer x = 2359
integer y = 2040
integer width = 375
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "I&mport.Resoluc."
end type

event clicked;String	null_str,ls_base,ls_serie,ls_obs,ls_ap_pat,ls_nombres,ls_ap_mat,&
			ls_direc_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,&
			ls_domi_c,ls_fono_c,ls_dv,ls_est_cob,ls_obs_sql,ls_estado_comi,ls_celular,&
			ls_cod_age,ls_cod_sup,ls_estado_ctto,ls_area,ls_sepultura,ls_sepultado,&
			ls_nombre_usuario,ls_nota,ls_base_aux,ls_sector_domi,ls_estado='R'
Long		ll_que,ll_tot_reg,ll_indi,cta_pag_s,cta_pag_m,nro_cuotas,&
			ret,ret1,ret11,dias,ll_mora_credito,ll_mora_mant,cta_pag_la,cta_pag_isa,&
			ll_rut,ll_total_renta,ll_grupo_f,ll_corr,ll_capacidad,ll_count_reg,&
			ll_new,ll_resp,sw_paso,ll_ok
Datetime	fecha_prim,fecha_man,fecha_vto,ldt_fec_nac,ldt_fecha_com,ldt_fecha_actual,&
			ldt_fecha_rescil
Double	ll_numero
ldt_fecha_actual	= datetime(idt_fecha_hoy,now())
SetNull(null_str)
dw_linea.reset()
dw_lista.reset()
ll_que		= dw_linea.ImportFile(null_str)
ll_ok	= MessageBox("Advertencia", "Está seguro la haber seleccionado el Archivo Correcto", Exclamation!, YesNo!, 2)
if ll_ok=1 then
	open(w_ingreso_fecha_res_solicitud_resolucion)
	ll_tot_reg	= dw_linea.rowcount()
	if ll_tot_reg > 0 then
		dw_lista.reset() 
		for ll_indi = 1 to ll_tot_reg
			cta_pag_s=0			;cta_pag_m=0			;ll_capacidad=0			;ll_mora_credito=0
			ll_mora_mant=0		;setnull(ls_area)		;setnull(ls_sector)		;setnull(ls_sepultura)	
			setnull(fecha_prim);nro_cuotas=0			;ll_rut=0					;setnull(ls_estado_comi)
			setnull(ldt_fecha_com);setnull(ls_cod_age);setnull(ls_cod_sup)	;setnull(fecha_man)
			setnull(ls_base)	;setnull(ls_serie)	;ll_numero=0				;setnull(ls_obs)
			setnull(ls_obs_sql);setnull(ls_nota)	;setnull(ls_sector_domi);sw_paso=0
	
			ls_base				= dw_linea.getitemstring(ll_indi,'base')
			ls_serie				= dw_linea.getitemstring(ll_indi,'serie')
			ll_numero			= Double(dw_linea.getitemstring(ll_indi,'numero'))
			ls_obs				= dw_linea.getitemstring(ll_indi,'observacion')
			if ls_base<>'' and not isnull(ls_base) and ls_serie<>'' and not isnull(ls_serie) and &
				ll_numero>0 then
				SELECT	"SOL_RESOLUCION"."BASE"  
				INTO 		:ls_base_aux  
				FROM 		"SOL_RESOLUCION"  
				WHERE ( "SOL_RESOLUCION"."BASE" = :ls_base ) AND  
						( "SOL_RESOLUCION"."SERIE" = :ls_serie ) AND  
						( "SOL_RESOLUCION"."NUMERO" = :ll_numero ) AND  
						(( "SOL_RESOLUCION"."ESTATUS_OPERACION" = 1 ) or  
						( "SOL_RESOLUCION"."ESTATUS_INFORMATICA" = 1 ))   
				Using		sqlca;
				if sqlca.sqlcode=100 then
					CHOOSE CASE ls_base
						CASE 'O'
							SELECT	"OFERTA_V"."CTA_PAG_S",   
										"CADENA"."ESTADO",   
										"CADENA"."FECHA_RES",
										"OFERTA_V"."CTA_PAG_M",   
										"PAGO_OFERTA"."CAPACIDAD",
										"PAGO_OFERTA"."AREA",
										"PAGO_OFERTA"."SECTOR",
										"PAGO_OFERTA"."SEPULTURA",
										"PAGO_OFERTA"."FECHA_PRIM",
										"PAGO_OFERTA"."NRO_CUOTAS",
										"OFERTA_V"."RUT",
										"OFERTA_V"."ESTADO_COMI",
										"OFERTA_V"."FECHA_COM",
										"OFERTA_V"."COD_AGE",
										"OFERTA_V"."COD_SUP",
										"OFERTA_V"."FECHA_M"
							INTO 		:cta_pag_s,   
										:ls_estado_ctto,   
										:ldt_fecha_rescil,
										:cta_pag_m,  
										:ll_capacidad,
										:ls_area,
										:ls_sector,
										:ls_sepultura,
										:fecha_prim, 
										:nro_cuotas,
										:ll_rut,
										:ls_estado_comi,
										:ldt_fecha_com,
										:ls_cod_age,
										:ls_cod_sup,
										:fecha_man
							FROM 		"OFERTA_V",  
										"CADENA",
										"PAGO_OFERTA"  
							WHERE  (("CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
									 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
									 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
									 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
									 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
									 (("CADENA"."CODIGO" = 'O') AND
									 ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero)))   
							Using		sqlca;
							
						CASE 'C'
							SELECT	"CONTRATO"."CTA_PAG_M",   
										"CONTRATO"."RUT",
										"CONTRATO"."AGENTE",
										"CADENA"."ESTADO",   
										"CADENA"."FECHA_RES",
										"CONTRATO"."SECTOR",
										"CONTRATO"."SEPULTURA",
										"CONTRATO"."CAPACIDAD",
										"CONTRATO"."ZONA",
										"CONTRATO"."FECHA_M"  
							INTO 		:cta_pag_m,   
										:ll_rut,
										:ls_cod_age,
										:ls_estado_ctto,   
										:ldt_fecha_rescil,
										:ls_sector,
										:ls_sepultura,
										:ll_capacidad,
										:ls_area,
										:fecha_prim  
							FROM 		"CADENA",   
										"CONTRATO"  
							WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
									 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
									 (("CADENA"."CODIGO" = :ls_base ) AND  
									 ( "CADENA"."SERIE" = :ls_serie ) AND  
									 ( "CADENA"."NUMERO" = :ll_numero ) )   
							Using		sqlca;
			
						CASE 'L'
							SELECT	"PAGO_LIBERADOR"."NRO_CUOTAS",   
										"CADENA"."ESTADO",   
										"CADENA"."FECHA_RES",
										"PAGO_LIBERADOR"."FECHA_PRIM",   
										"ANEXO_LIBERADOR"."RUT",   
										"ANEXO_LIBERADOR"."COD_AGENTE",
										"ANEXO_LIBERADOR"."COD_SUPER",
										"ANEXO_LIBERADOR"."ESTADO_COMI",
										"ANEXO_LIBERADOR"."FECHA_COM",
										"ANEXO_LIBERADOR"."CTA_PAG_M"  
							INTO 		:nro_cuotas,   
										:ls_estado_ctto,   
										:ldt_fecha_rescil,
										:fecha_prim,   
										:ll_rut,
										:ls_cod_age,
										:ls_cod_sup,
										:ls_estado_comi,
										:ldt_fecha_com,
										:cta_pag_s  
							FROM 		"ANEXO_LIBERADOR",   
										"PAGO_LIBERADOR",  
										"CADENA"
							WHERE  (("PAGO_LIBERADOR"."SERIE_M" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
									 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
									 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
									 ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
									 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
									 (("CADENA"."CODIGO" = 'L' ) AND 
									 ("ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
									 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero ))) 
							Using		sqlca;
			
						CASE 'P'
							SELECT	"PAGARE"."FECHA_PRIM",   
										"CADENA"."ESTADO",   
										"CADENA"."FECHA_RES",
										"PAGARE"."PLAZO",   
										"PAGARE"."RUT",
										"PAGARE"."CTA_PAG_LA", 
										"PAGARE"."SECTOR", 
										"PAGARE"."SEPULTURA", 
										"PAGARE"."CTA_PAG_ISA"  
							INTO 		:fecha_prim,   
										:ls_estado_ctto,   
										:ldt_fecha_rescil,
										:nro_cuotas, 
										:ll_rut,
										:cta_pag_la,   
										:ls_sector,
										:ls_sepultura,
										:cta_pag_isa  
							FROM 		"CADENA",   
										"PAGARE"  
							WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
									 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
									 (("CADENA"."CODIGO" = :ls_base ) AND  
									 ( "PAGARE"."SERIE_P" = :ls_serie ) AND  
									 ( "PAGARE"."NRO_PAGARE" = :ll_numero ) )   
							Using		sqlca;
			
						CASE 'D'
							SELECT	"DERECHO"."FECHA_PRIM",   
										"CADENA"."ESTADO",   
										"CADENA"."FECHA_RES",
										"DERECHO"."PLAZO",   
										"DERECHO"."RUT",   
										"DERECHO"."CTA_PAG_LA", 
										"DERECHO"."SECTOR", 
										"DERECHO"."SEPULTURA", 
										"DERECHO"."CTA_PAG_ISA"  
							INTO 		:fecha_prim,   
										:ls_estado_ctto,   
										:ldt_fecha_rescil,
										:nro_cuotas,  
										:ll_rut,
										:cta_pag_la,   
										:ls_sector,
										:ls_sepultura,
										:cta_pag_isa  
							FROM 		"CADENA",   
										"DERECHO"  
							WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
									 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
									 (("CADENA"."CODIGO" = :ls_base ) AND  
									 ( "DERECHO"."SERIE_P" = :ls_serie ) AND  
									 ( "DERECHO"."NRO_PAGARE" = :ll_numero ) )   
							Using		sqlca;
			
						CASE 'R'
							SELECT	"REPACTA_MANTENCION"."CUOTAS_PACTADAS",   
										"CADENA"."ESTADO",   
										"CADENA"."FECHA_RES",
										"REPACTA_MANTENCION"."FECHA_PRIMERA_CTA",   
										"REPACTA_MANTENCION"."RUT_CLIENTE",   
										"REPACTA_MANTENCION"."CTAS_PAGADAS"  
							INTO 		:nro_cuotas,   
										:ls_estado_ctto,   
										:ldt_fecha_rescil,
										:fecha_prim,   
										:ll_rut,
										:cta_pag_s  
							FROM 		"CADENA",   
										"REPACTA_MANTENCION"  
							WHERE  ( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
									 ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
									 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
									 (("REPACTA_MANTENCION"."BASE" = :ls_base ) AND  
									 ( "REPACTA_MANTENCION"."SERIE" = :ls_serie ) AND  
									 ( "REPACTA_MANTENCION"."NUMERO" = :ll_numero ) )   
							Using	sqlca;
			
					END CHOOSE
					if sqlca.sqlcode=0 then // buscar funcion mora (mant. / Credito)
						if ls_estado_ctto<>'V' then
							ls_obs_sql	= 'Estado distinto a VIGENTE'
							messagebox("Error SQL","Error Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,##0")+', '+ls_obs_sql)
							INSERT INTO   "SOL_PASO_RESOLUCION"  
											( "BASE",   
											  "SERIE",   
											  "NUMERO",   
											  "OBS_SQL",
											  "OBSERVACION" )  
							VALUES 		( :ls_base,   
											  :ls_serie,   
											  :ll_numero,   
											  :ls_obs_sql,
											  :ls_obs )  
							USING			sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						else
							CHOOSE CASE ls_base
								CASE 'O'
									RET 			= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado_ctto)
							/// codigo nuevo
									fecha_vto	= datetime(funcion_venc( fecha_prim , cta_pag_s ))   //<--
									dias 			= - daysafter (idt_fecha_hoy,date(fecha_vto))
									if dias <= 5 then ret = 0    //<--
							/// fin codigo
									ret1 			= f_mant (fecha_man, cta_pag_m)
									ret11 		= -daysafter(idt_fecha_hoy,funcion_venc_ano( fecha_man , cta_pag_m  ))
									if ret11 < 0 then 
										ret1		= 0
									end if
									if ret <= 0 then
										ret		= 0 //mora_credito
									end if
									ll_mora_credito= ret
									if ret1 <= 0 then
										ret1		= 0 //mora mantencion
									end if	
									ll_mora_mant= ret1
									
								CASE 'C'
									ret1 					= f_mant (fecha_prim, cta_pag_m)
									ret11 				= -daysafter(idt_fecha_hoy,funcion_venc_ano( fecha_prim , cta_pag_m  ))
									ll_mora_credito	= 0
									if ret11 < 0 then 
										ret1				= 0
									end if
									ll_mora_mant		= ret1
									if ret1 <= 0 then
										ll_mora_mant	= 0
									end if
					
								CASE 'L'
									ll_mora_credito	= 0
									RET 					= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado_ctto)
							/// codigo nuevo
									fecha_vto			= datetime(funcion_venc( fecha_prim , cta_pag_s ))   //<--
									dias 					= - daysafter (idt_fecha_hoy,date(fecha_vto))
									if dias <= 5 then 
										ret = 0
									end if
							/// fin codigo
									if ret <= 0 then
										ret = 0
									end if	
									ll_mora_mant	= ret
					
								CASE 'P'
									ll_mora_credito	= 0
									cta_pag_s  			= cta_pag_la + cta_pag_isa
									RET 					= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado_ctto)
							/// codigo nuevo
									fecha_vto			= datetime(funcion_venc( fecha_prim , cta_pag_s ))   //<--
									dias 					= - daysafter (idt_fecha_hoy,date(fecha_vto))
									if dias <= 5 then 
										ret = 0
									end if
							/// fin codigo
									if ret <= 0 then
										ret	= 0
									end if	
									ll_mora_mant	= ret
					
								CASE 'D'
									ll_mora_credito	= 0
									cta_pag_s  			= cta_pag_la + cta_pag_isa
									RET 					= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado_ctto)
							/// codigo nuevo
									fecha_vto			= datetime(funcion_venc( fecha_prim , cta_pag_s ))   //<--
									dias 					= - daysafter (idt_fecha_hoy,date(fecha_vto))
									if dias <= 5 then 
										ret 				= 0
									end if
							/// fin codigo
									if ret <= 0 then
										ret				= 0
									end if	
									ll_mora_mant		= ret
					
								CASE 'R'
									ll_mora_credito	= 0
									RET 					= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado_ctto)
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
							
							END CHOOSE
							if not isnull(ll_rut) and ll_rut>0 then
								SELECT	"CLIENTE"."NOMBRE",   
											"CLIENTE"."A_PATERNO",   
											"CLIENTE"."A_MATERNO",   
											"CLIENTE"."DIRECCION_P",   
											"CLIENTE"."POBLACION",   
											"CLIENTE"."SECTOR",   
											"CLIENTE"."COMUNA",   
											"CLIENTE"."CIUDAD",   
											"CLIENTE"."FONO_P",   
											"CLIENTE"."FECHA_NAC",   
											"CLIENTE"."ESTA_CIVIL",   
											"CLIENTE"."DOMICILIO_C",   
											"CLIENTE"."FONO_C",   
											"CLIENTE"."TOTAL_RENT",   
											"CLIENTE"."GRUPO_F",   
											"CLIENTE"."DV",   
											"CLIENTE"."ESTADO_COBRANZA"  
								INTO 		:ls_nombres,   
											:ls_ap_pat,   
											:ls_ap_mat,   
											:ls_direc_p,   
											:ls_pob,   
											:ls_sector_domi,   
											:ls_comuna,   
											:ls_ciudad,   
											:ls_fono_p,   
											:ldt_fec_nac,   
											:ls_est_civil,   
											:ls_domi_c,   
											:ls_fono_c,   
											:ll_total_renta,   
											:ll_grupo_f,   
											:ls_dv,   
											:ls_est_cob  
								FROM 		"CLIENTE"  
								WHERE 	"CLIENTE"."RUT" = :ll_rut   
								USING		sqlca  ;
								if sqlca.sqlcode=0 then
									SELECT	"ENCARGADOS"."NOMBRE"  
									INTO 		:ls_nombre_usuario  
									FROM 		"ENCARGADOS"  
									WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user ;
									
									SELECT count("FALLECIDOS"."LLAVE")  
									INTO :ll_count_reg  
									FROM "FALLECIDOS"  
									WHERE ( "FALLECIDOS"."BASE" = :ls_base ) AND  
											( "FALLECIDOS"."SS" = :ls_serie ) AND  
											( "FALLECIDOS"."CONTRATO" = :ll_numero )    AND
											( "FALLECIDOS"."ESTADO_REG" = 'A' )
									Using	sqlca;
									if sqlca.sqlcode=0 and ll_count_reg>0 then
										ls_sepultado	= 'S'
									else
										ls_sepultado	= 'N'
									end if
									
									SELECT MAX("SOL_ESTATUS"."CORRELATIVO")
									INTO :ll_corr
									FROM "SOL_ESTATUS"  
									WHERE ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
											( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
											( "SOL_ESTATUS"."NUMERO" = :ll_numero )
									USING	sqlca;
									if sqlca.sqlcode=0 then
										if ll_corr=0 or isnull(ll_corr) then 
											ll_corr	= 1
										else
											ll_corr++
										end if
									else
										ll_corr	= 1
									end if
//									if ll_corr > 1 then
//										ll_resp	= MessageBox("Advertencia", "Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,##0")+', ya tiene Solicitud anteriormente desea Ingresarlo Nuevamente', Exclamation!, YesNo!, 2)
//										IF ll_resp = 1 THEN
//											sw_paso	= 0
//										else
//											sw_paso	= 1
//										end if
//									end if
//									if sw_paso = 0 then
									ls_nota	= 'Solicitud Tramitada el: '+string(idt_fecha_hoy,"dd/mm/yyyy")+' por '+ls_nombre_usuario+', generada por Archivo'
									INSERT INTO  "SOL_ESTATUS"  
												  ( "BASE",   
													 "SERIE",   
													 "NUMERO",   
													 "CORRELATIVO",   
													 "CODIGO_SOLICITUD",   
													 "OBSERVACION",   
													 "ESTADO_REG" )  
									VALUES 	  ( :ls_base,   
													 :ls_serie,   
													 :ll_numero,   
													 :ll_corr,   
													 '11',   
													 :ls_nota,   
													 'A' )  
									USING			sqlca;
									if sqlca.sqlcode=0 then
										commit;
										ll_new	= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new)
										dw_lista.setitem(ll_new,'estatus_operacion',0)
										dw_lista.setitem(ll_new,'estatus_informatica',0)
										dw_lista.setitem(ll_new,'base',ls_base)
										dw_lista.setitem(ll_new,'serie',ls_serie)
										dw_lista.setitem(ll_new,'numero',ll_numero)
										dw_lista.setitem(ll_new,'correlativo',ll_corr)
										dw_lista.setitem(ll_new,'codigo_solicitud','11')
										dw_lista.setitem(ll_new,'usuario_opera',gs_user)
										dw_lista.setitem(ll_new,'fecha_opera',string(ldt_fecha_actual,"dd/mm/yyyy"))
										dw_lista.setitem(ll_new,'usuario_infor',gs_user)
										dw_lista.setitem(ll_new,'fecha_infor',string(ldt_fecha_actual,"dd/mm/yyyy"))
										dw_lista.setitem(ll_new,'mod_ant_cliente','N')
										if len(trim(ls_base))>1 then
											ls_base	= mid(trim(ls_base),1,1)
										end if
										if len(trim(ls_serie))>1 then
											ls_serie	= mid(trim(ls_serie),1,1)
										end if
										if len(trim(ls_obs))>500 then
											ls_obs	= mid(trim(ls_obs),1,500)
										end if
										if len(trim(ls_dv))>1 then
											ls_dv		= mid(trim(ls_dv),1,1)
										end if
										if len(trim(ls_direc_p))>40 then
											ls_direc_p	= mid(trim(ls_direc_p),1,40)
										end if
										if len(trim(ls_pob))>41 then
											ls_pob	= mid(trim(ls_pob),1,41)
										end if
										if len(trim(ls_sector_domi))>20 then
											ls_sector_domi	= mid(trim(ls_sector_domi),1,20)
										end if
										if len(trim(ls_comuna))>20 then
											ls_comuna	= mid(trim(ls_comuna),1,20)
										end if
										if len(trim(ls_ciudad))>15 then
											ls_ciudad	= mid(trim(ls_ciudad),1,15)
										end if
										if len(trim(ls_fono_p))>25 then
											ls_fono_p	= mid(trim(ls_fono_p),1,25)
										end if
										if len(trim(ls_est_civil))>1 then
											ls_est_civil	= mid(trim(ls_est_civil),1,1)
										end if
										if len(trim(ls_domi_c))>40 then
											ls_domi_c	= mid(trim(ls_domi_c),1,40)
										end if
										if len(trim(ls_fono_c))>25 then
											ls_fono_c	= mid(trim(ls_fono_c),1,25)
										end if
										if len(trim(ls_est_cob))>2 then
											ls_est_cob	= mid(trim(ls_est_cob),1,2)
										end if
										if len(trim(ls_celular))>25 then
											ls_celular	= mid(trim(ls_celular),1,25)
										end if
										if len(trim(ls_cod_age))>5 then
											ls_cod_age	= mid(trim(ls_cod_age),1,5)
										end if
										if len(trim(ls_cod_sup))>5 then
											ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
										end if
										if len(trim(ls_nombre_usuario))>80 then
											ls_nombre_usuario	= mid(trim(ls_nombre_usuario),1,80)
										end if
										if len(trim(ls_nombres))>20 then
											ls_nombres	= mid(trim(ls_nombres),1,20)
										end if
										if len(trim(ls_ap_pat))>15 then
											ls_ap_pat	= mid(trim(ls_ap_pat),1,15)
										end if
										if len(trim(ls_ap_mat))>15 then
											ls_ap_mat	= mid(trim(ls_ap_mat),1,15)
										end if
										if len(trim(ls_ap_pat))>15 then
											ls_ap_pat	= mid(trim(ls_ap_pat),1,15)
										end if
										if len(trim(ls_estado_ctto))>1 then
											ls_estado_ctto	= mid(trim(ls_estado_ctto),1,1)
										end if
										if len(trim(ls_estado_comi))>1 then
											ls_estado_comi	= mid(trim(ls_estado_comi),1,1)
										end if
										if len(trim(ls_area))>2 then
											ls_area	= mid(trim(ls_area),1,2)
										end if
										if len(trim(ls_sector))>2 then
											ls_sector	= mid(trim(ls_sector),1,2)
										end if
										if len(trim(ls_sepultura))>8 then
											ls_sepultura	= mid(trim(ls_sepultura),1,8)
										end if
										if len(trim(ls_sepultado))>8 then
											ls_sepultado	= mid(trim(ls_sepultado),1,8)
										end if
										if isnull(ldt_fecha_rescil) then ldt_fecha_rescil=datetime(date("00/00/0000"),time("00:00:00"))
										INSERT INTO	  "SOL_RESOLUCION"  
														( "BASE",  "SERIE",  "NUMERO",  "CORRELATIVO","OBSERVACION","RUT_TITULAR","DV_TITULAR","DIRECCION_P","POBLACION","SECTOR",       "COMUNA",  "CIUDAD",  "FONO_P",  "FECHA_NAC", "ESTADO_CIVIL","DOMICILIO_C","FONO_C",  "TOTAL_RENTA",  "GRUPO_F",  "ESTADO_COB","FECHA_ACTUAL",   "FECHA_RESCIL",   "MORA_MANT",  "MORA_CREDITO",  "CELULAR",  "OTRO_FONO_P","OTRO_FONO_C","COD_AGENTE","COD_SUPER","USUARIO",         "ESTATUS_OPERACION","ESTATUS_INFORMATICA","NOMBRE",   "AP_PATERNO","AP_MATERNO", "MOD_ANT_CLIENTE","USUARIO_OPERA","FECHA_OPERA",    "USUARIO_INFOR","FECHA_INFOR",     "DIRECCION_P_ORIGINAL","POBLACION_ORIGINAL","SECTOR_ORIGINAL","COMUNA_ORIGINAL","CIUDAD_ORIGINAL","FONO_P_ORIGINAL","FECHA_NAC_ORIGINAL","ESTADO_CIVIL_ORIGINAL","DOMICILIO_C_ORIGINAL","FONO_C_ORIGINAL","TOTAL_RENTA_ORIGINAL","GRUPO_F_ORIGINAL","ESTADO_CON_ORIGINAL","ESTADO_CTTO_ORIGINAL","FECHA_RESCIL_ORIGINAL","ESTADO_COMI",  "FECHA_COMI",  "AREA_SEPULTURA","SECTOR_SEPULTURA","SEPULTURA",  "SEPULTADO",  "CAPACIDAD" )  
										VALUES 		( :ls_base,:ls_serie,:ll_numero,:ll_corr,		 :ls_obs,		:ll_rut,		  :ls_dv,		:ls_direc_p,  :ls_pob,	  :ls_sector_domi,:ls_comuna,:ls_ciudad,:ls_fono_p,:ldt_fec_nac,:ls_est_civil, :ls_domi_c,	 :ls_fono_c,:ll_total_renta,:ll_grupo_f,:ls_est_cob, :ldt_fecha_actual,:ldt_fecha_rescil,:ll_mora_mant,:ll_mora_credito,:ls_celular,'',          '',			   :ls_cod_age, :ls_cod_sup,:ls_nombre_usuario,0,						  0,						   :ls_nombres,:ls_ap_pat,	 :ls_ap_mat,	'N',   				:gs_user,		 :ldt_fecha_actual,:gs_user, 		  :ldt_fecha_actual, :ls_direc_p, 			 :ls_pob,		  		 :ls_sector_domi,  :ls_comuna, 		 :ls_ciudad,		 :ls_fono_p,		 :ldt_fec_nac,  		 :ls_est_civil,  		    :ls_domi_c,  			   :ls_fono_c,  		:ll_total_renta,  	  :ll_grupo_f,  		:ls_est_cob,  		    :ls_estado_ctto,  		:ldt_fecha_rescil,  	   :ls_estado_comi,:ldt_fecha_com,:ls_area,  		:ls_sector,		    :ls_sepultura,:ls_sepultado,:ll_capacidad )  
										Using		sqlca;
										if sqlca.sqlcode=0 then
											commit;
											// actualizar fecha res y estado
											UPDATE	"CADENA"  
											SET 		"ESTADO" = :ls_estado,
														"FECHA_RES" = :gdt_fecha_res
											WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
														( "CADENA"."SERIE" = :ls_serie ) AND  
														( "CADENA"."NUMERO" = :ll_numero )   
											Using		sqlca ;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										else
											rollback;
										end if
									else
										rollback;
									end if
								end if			
							else
								ls_obs_sql	= 'Cliente NO Existe'
								messagebox("Error SQL","Error Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,##0")+', '+ls_obs_sql)
								INSERT INTO   "SOL_PASO_RESOLUCION"  
												( "BASE",   
												  "SERIE",   
												  "NUMERO",   
												  "OBS_SQL",
												  "OBSERVACION" )  
								VALUES 		( :ls_base,   
												  :ls_serie,   
												  :ll_numero,   
												  :ls_obs_sql,
												  :ls_obs )  
								USING			sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							end if
						end if
					else
						if sqlca.sqlcode=100 then
							ls_obs_sql	= 'No Existe'
						elseif sqlca.sqlcode=-1 then
							ls_obs_sql	= trim(SQLCA.SQLErrText)
						end if
						messagebox("Error SQL","Error Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,##0")+', '+ls_obs_sql)
						INSERT INTO   "SOL_PASO_RESOLUCION"  
										( "BASE",   
										  "SERIE",   
										  "NUMERO",   
										  "OBS_SQL",
										  "OBSERVACION" )  
						VALUES 		( :ls_base,   
										  :ls_serie,   
										  :ll_numero,   
										  :ls_obs_sql,
										  :ls_obs )  
						USING			sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
				else
					messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,##0")+' ya existe (está Vigente)')
				end if
			else
				messagebox("Advertencia","Contrato Inválido")
			end if
		next
	end if
end if
end event

type st_porc from statictext within w_estado_informes
boolean visible = false
integer x = 1454
integer y = 964
integer width = 233
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_po_rut from commandbutton within w_estado_informes
integer x = 553
integer y = 1824
integer width = 302
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Asociar*Rut"
end type

event clicked;if il_row>0 then
	if isvalid(w_listado_contratos_rut) then close(w_listado_contratos_rut)
	gi_rut	= 	dw_lista.getitemnumber(il_row,'rut_titular')
	gi_tipo_busqueda 	= 1
	open(w_listado_contratos_rut)
else
	messagebox("Adveretencia","Ud. debe seleccionar un Contrato")
end if
end event

type dw_solicitudes from datawindow within w_estado_informes
integer x = 1778
integer y = 144
integer width = 1134
integer height = 108
integer taborder = 30
string dataobject = "dwe_seleccionar_solicitud"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String			ls_descrip, ls_base, ls_serie, ls_tipo_sol, ls_mod_cliente, ls_usu_ope, ls_usu_inf,&
				ls_filtro,ls_estado_reg
long			ll_tot_reg, ll_indi,  ll_corr, ll_rut, ll_est_ope, ll_est_inf,ll_tot_porc_aux,&
				ll_tot_porc,ll_est_mod
Datetime		ld_fec_ope, ld_fec_inf,ldt_fec_max,ldt_fecha_crea,ld_fec_ini,ld_fec_fin
time			lt_ini=time('00:00:00'), lt_fin=time('23:59:59')
Double		ll_numero
SetPointer(HourGlass!)
this.accepttext()
is_tipo_sol						= dw_solicitudes.getitemstring(1,'codigo')
setnull(il_tot_rescil_cli)
ls_filtro 							= ""
dw_lista.SetFilter(ls_filtro)
if is_tipo_sol='T' then 
	is_tipo_sol					='%'
	w_estado_informes.title	= 'Autorizar Solicitudes'
end if
ld_fec_ini						= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin						= datetime(date(em_fec_fin.text),lt_fin)
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			st_fondo.visible				= true
			hpb_1.visible 					= true
			st_porc.visible 				= true
			ll_tot_porc						= 0
			ll_tot_porc_aux				= 0			
			ll_tot_reg						= dw_lista.retrieve(is_tipo_sol,ld_fec_ini,ld_fec_fin)
			if is_tipo_sol = '1' then
				il_tot_rescil_cli				= dw_exportar_rescil_cliente.retrieve(is_tipo_sol,ld_fec_ini,ld_fec_fin)
			end if	
			hpb_1.Position					= ll_tot_porc
			if ll_tot_reg=0 then
				if is_tipo_sol='%' then
					messagebox("Advertencia","No Registra Solicitudes")
				else
					SELECT	"SOLICITUDES"."DESCRIPCION"   
					INTO		:ls_descrip
					FROM 		"SOLICITUDES"  
					WHERE 	"SOLICITUDES"."CODIGO_SOLICITUD" = :is_tipo_sol      
					USING		sqlca;
					if sqlca.sqlcode=0 then
						messagebox("Advertencia","No Registra Solicitud: "+ls_descrip)
					end if
				end if
			else
				SELECT	"SOLICITUDES"."DESCRIPCION"   
				INTO		:ls_descrip
				FROM 		"SOLICITUDES"  
				WHERE 	"SOLICITUDES"."CODIGO_SOLICITUD" = :is_tipo_sol      
				USING		sqlca;
				if sqlca.sqlcode=0 then
					w_estado_informes.title	= ls_descrip
				end if
				for ll_indi=1 to ll_tot_reg
					ls_base					= trim(dw_lista.getitemstring(ll_indi,'base'))
					ls_serie					= trim(dw_lista.getitemstring(ll_indi,'serie'))
					ll_numero				= dw_lista.getitemnumber(ll_indi,'numero')
					ll_corr					= dw_lista.getitemnumber(ll_indi,'correlativo')
					ls_tipo_sol				= trim(dw_lista.getitemstring(ll_indi,'codigo_solicitud'))
					ls_estado_reg			= trim(dw_lista.getitemstring(ll_indi,'estado_reg'))
					CHOOSE CASE ls_tipo_sol
						CASE '1' // resciliacion por parte del cliente
							SELECT	"SOL_RESCILIA_CLIENTE"."RUT_TITULAR",   "SOL_RESCILIA_CLIENTE"."ESTATUS_OPERACION",   "SOL_RESCILIA_CLIENTE"."ESTATUS_INFORMATICA",   "SOL_RESCILIA_CLIENTE"."MOD_ANT_CLIENTE",   "SOL_RESCILIA_CLIENTE"."USUARIO_OPERA",   "SOL_RESCILIA_CLIENTE"."FECHA_OPERA",   "SOL_RESCILIA_CLIENTE"."USUARIO_INFOR",   "SOL_RESCILIA_CLIENTE"."FECHA_INFOR" ,   "SOL_RESCILIA_CLIENTE"."FECHA_ACTUAL"
							INTO 		:ll_rut,   										 :ll_est_ope,   											:ll_est_inf,   											:ls_mod_cliente,   								 :ls_usu_ope,   									 :ld_fec_ope,   									:ls_usu_inf,   									:ld_fec_inf,									 :ldt_fecha_crea
							FROM 		"SOL_RESCILIA_CLIENTE",   
										"SOL_ESTATUS"  
							WHERE 	( "SOL_RESCILIA_CLIENTE"."BASE" = "SOL_ESTATUS"."BASE" ) and  
										( "SOL_RESCILIA_CLIENTE"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
										( "SOL_RESCILIA_CLIENTE"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
										( "SOL_RESCILIA_CLIENTE"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) )   
							Using		sqlca;
			
						CASE '2' // resciliacion por reprogramar
							SELECT	"SOL_RESCILIA_REPROG"."RUT_TITULAR",   "SOL_RESCILIA_REPROG"."ESTATUS_OPERACION",   "SOL_RESCILIA_REPROG"."ESTATUS_INFORMATICA",   "SOL_RESCILIA_REPROG"."MOD_ANT_CLIENTE",   "SOL_RESCILIA_REPROG"."USUARIO_OPERA",   "SOL_RESCILIA_REPROG"."FECHA_OPERA",   "SOL_RESCILIA_REPROG"."USUARIO_INFOR",   "SOL_RESCILIA_REPROG"."FECHA_INFOR"  ,   "SOL_RESCILIA_REPROG"."FECHA_ACTUAL"
							INTO 		:ll_rut,   										:ll_est_ope,   										:ll_est_inf,   											:ls_mod_cliente,   								:ls_usu_ope,   									:ld_fec_ope,   								:ls_usu_inf,   								 :ld_fec_inf ,										:ldt_fecha_crea
							FROM 		"SOL_RESCILIA_REPROG",   
										"SOL_ESTATUS"  
							WHERE 	( "SOL_RESCILIA_REPROG"."BASE" = "SOL_ESTATUS"."BASE" ) and  
										( "SOL_RESCILIA_REPROG"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
										( "SOL_RESCILIA_REPROG"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
										( "SOL_RESCILIA_REPROG"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) )   
							Using		sqlca;
			
						CASE '3' // reactivacion
							SELECT	"SOL_REACTIVA"."RUT_TITULAR",   "SOL_REACTIVA"."ESTATUS_OPERACION",   "SOL_REACTIVA"."ESTATUS_INFORMATICA",   "SOL_REACTIVA"."MOD_ANT_CLIENTE",   "SOL_REACTIVA"."USUARIO_OPERA",   "SOL_REACTIVA"."FECHA_OPERA",   "SOL_REACTIVA"."USUARIO_INFOR",   "SOL_REACTIVA"."FECHA_INFOR"  ,   "SOL_REACTIVA"."FECHA_ACTUAL" 
							INTO 		:ll_rut,   							  :ll_est_ope,   								 :ll_est_inf,   									:ls_mod_cliente,   						:ls_usu_ope,   						:ld_fec_ope,   						:ls_usu_inf,   						:ld_fec_inf  ,							 :ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_REACTIVA"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_REACTIVA"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_REACTIVA"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_REACTIVA"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_REACTIVA"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) )  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '4' // seguro desgravamen
							SELECT	"SOL_SEGURO_DESG"."RUT_TITULAR",   "SOL_SEGURO_DESG"."ESTATUS_OPERACIONES",   "SOL_SEGURO_DESG"."ESTATUS_INFORMATICA",   "SOL_SEGURO_DESG"."MOD_ANT_CLIENTE",   "SOL_SEGURO_DESG"."USUARIO_OPERA",   "SOL_SEGURO_DESG"."FECHA_OPERA",   "SOL_SEGURO_DESG"."USUARIO_INFOR",   "SOL_SEGURO_DESG"."FECHA_INFOR",   "SOL_SEGURO_DESG"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								  :ll_est_ope,   										:ll_est_inf,   									 :ls_mod_cliente,   							 :ls_usu_ope,   							  :ld_fec_ope,   							 :ls_usu_inf,   							  :ld_fec_inf ,							 :ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_SEGURO_DESG"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_DESG"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_DESG"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_DESG"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_DESG"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
			
						CASE '5' // repacta compraventa
							SELECT	"SOL_REPACTA_CVTA"."RUT_TITULAR",   "SOL_REPACTA_CVTA"."ESTATUS_OPERACION",   "SOL_REPACTA_CVTA"."ESTATUS_INFORMATICA",   "SOL_REPACTA_CVTA"."MOD_ANT_CLIENTE",   "SOL_REPACTA_CVTA"."USUARIO_OPERA",   "SOL_REPACTA_CVTA"."FECHA_OPERA",   "SOL_REPACTA_CVTA"."USUARIO_INFOR",   "SOL_REPACTA_CVTA"."FECHA_INFOR"  ,   "SOL_REPACTA_CVTA"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   									:ll_est_ope,   									:ll_est_inf,   										:ls_mod_cliente,   							:ls_usu_ope,   								:ld_fec_ope,   							:ls_usu_inf,   							 :ld_fec_inf  ,								:ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_REPACTA_CVTA"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_REPACTA_CVTA"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_REPACTA_CVTA"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_REPACTA_CVTA"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_REPACTA_CVTA"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
			
						CASE '6' // titulo de dominio
							SELECT	"SOL_TIT_DOMINIO"."RUT_TITULAR",   "SOL_TIT_DOMINIO"."ESTATUS_OPERACIONES",   "SOL_TIT_DOMINIO"."ESTATUS_INFORMATICA",   "SOL_TIT_DOMINIO"."MOD_ANT_CLIENTE",   "SOL_TIT_DOMINIO"."USUARIO_OPERA",   "SOL_TIT_DOMINIO"."FECHA_OPERA",   "SOL_TIT_DOMINIO"."USUARIO_INFOR",   "SOL_TIT_DOMINIO"."FECHA_INFOR"  ,   "SOL_TIT_DOMINIO"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   									:ll_est_ope,   									:ll_est_inf,   									 :ls_mod_cliente,   							 :ls_usu_ope,   								:ld_fec_ope,   						 :ls_usu_inf,   								:ld_fec_inf  ,								:ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_TIT_DOMINIO"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_TIT_DOMINIO"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_TIT_DOMINIO"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_TIT_DOMINIO"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TIT_DOMINIO"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '7' // contrato definitivo
							SELECT	"SOL_CONTRATO_DEF"."RUT_TITULAR",   "SOL_CONTRATO_DEF"."ESTATUS_OPERACIONES",   "SOL_CONTRATO_DEF"."ESTATUS_INFORMATICA",   "SOL_CONTRATO_DEF"."MOD_ANT_CLIENTE",   "SOL_CONTRATO_DEF"."USUARIO_OPERA",   "SOL_CONTRATO_DEF"."FECHA_OPERA",   "SOL_CONTRATO_DEF"."USUARIO_INFOR",   "SOL_CONTRATO_DEF"."FECHA_INFOR"  ,   "SOL_CONTRATO_DEF"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   									:ll_est_ope,   										:ll_est_inf,   									 :ls_mod_cliente,   								:ls_usu_ope,   							 :ld_fec_ope,   							 :ls_usu_inf,   								:ld_fec_inf ,								  :ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_CONTRATO_DEF"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_CONTRATO_DEF"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_CONTRATO_DEF"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_CONTRATO_DEF"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CONTRATO_DEF"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '8' // ENTREGA PAGARE
							SELECT	"SOL_ENTREGA_PAG"."RUT_TITULAR",   "SOL_ENTREGA_PAG"."ESTATUS_OPERACIONES",   "SOL_ENTREGA_PAG"."ESTATUS_INFORMATICA",   "SOL_ENTREGA_PAG"."MOD_ANT_CLIENTE",   "SOL_ENTREGA_PAG"."USUARIO_OPERA",   "SOL_ENTREGA_PAG"."FECHA_OPERA",   "SOL_ENTREGA_PAG"."USUARIO_INFOR",   "SOL_ENTREGA_PAG"."FECHA_INFOR"  ,   "SOL_ENTREGA_PAG"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   									:ll_est_ope,   									:ll_est_inf,   									 :ls_mod_cliente,   							 :ls_usu_ope,   								:ld_fec_ope,   						 :ls_usu_inf,   								:ld_fec_inf  ,								:ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_ENTREGA_PAG"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_ENTREGA_PAG"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_ENTREGA_PAG"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_ENTREGA_PAG"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_ENTREGA_PAG"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '10' // TRANSFERENCIA
							SELECT	"SOL_TRANSFERENCIA"."RUT_TITULAR",   "SOL_TRANSFERENCIA"."ESTATUS_OPERACIONES",   "SOL_TRANSFERENCIA"."ESTATUS_INFORMATICA",   "SOL_TRANSFERENCIA"."MOD_ANT_CLIENTE",   "SOL_TRANSFERENCIA"."USUARIO_OPERA",   "SOL_TRANSFERENCIA"."FECHA_OPERA",   "SOL_TRANSFERENCIA"."USUARIO_INFOR",   "SOL_TRANSFERENCIA"."FECHA_INFOR"  ,   "SOL_TRANSFERENCIA"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   									 :ll_est_ope,   										 :ll_est_inf,   										 :ls_mod_cliente,   								:ls_usu_ope,   								:ld_fec_ope,   							 :ls_usu_inf,   								 :ld_fec_inf  ,								 :ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_TRANSFERENCIA"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_TRANSFERENCIA"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_TRANSFERENCIA"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_TRANSFERENCIA"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TRANSFERENCIA"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '11' // resolucion
							SELECT	"SOL_RESOLUCION"."RUT_TITULAR",   "SOL_RESOLUCION"."ESTATUS_OPERACION",   "SOL_RESOLUCION"."ESTATUS_INFORMATICA",   "SOL_RESOLUCION"."MOD_ANT_CLIENTE",   "SOL_RESOLUCION"."USUARIO_OPERA",   "SOL_RESOLUCION"."FECHA_OPERA",   "SOL_RESOLUCION"."USUARIO_INFOR",   "SOL_RESOLUCION"."FECHA_INFOR"  ,   "SOL_RESOLUCION"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								 :ll_est_ope,   									:ll_est_inf,   									:ls_mod_cliente,   						 :ls_usu_ope,   							 :ld_fec_ope,   							:ls_usu_inf,   							:ld_fec_inf ,							  :ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_RESOLUCION"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_RESOLUCION"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_RESOLUCION"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_RESOLUCION"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESOLUCION"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '12'
							SELECT	"SOL_ESTATUS"."RUT_CLIENTE",   "SOL_MOD_ANTECE"."ESTATUS_MOD",   "SOL_MOD_ANTECE"."USUARIO_OPERA",   "SOL_MOD_ANTECE"."FECHA_OPERA",   "SOL_MOD_ANTECE"."USUARIO_INFOR",   "SOL_MOD_ANTECE"."FECHA_INFOR",   "SOL_MOD_ANTECE"."ESTATUS_INFORMATICA",   "SOL_MOD_ANTECE"."ESTATUS_OPERACIONES"  ,	"SOL_MOD_ANTECE"."FECHA"
							INTO 		:ll_rut,   							  :ll_est_mod,   							:ls_usu_ope,     							:ld_fec_ope,   						 :ls_usu_inf,   							 :ld_fec_inf,   							:ll_est_inf,   									:ll_est_ope  ,										:ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_MOD_ANTECE"  
							WHERE  ( "SOL_ESTATUS"."RUT_CLIENTE" = "SOL_MOD_ANTECE"."RUT" ) and  
									 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_MOD_ANTECE"."CORRELATIVO" ) and  
									 (("SOL_ESTATUS"."RUT_CLIENTE" = :ll_numero ) AND  
									 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) AND  
									 ( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) ) //and
			//						 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							USING		sqlca;
							ls_mod_cliente	= 'S'
						CASE '13' // cambio estado
							SELECT	"SOL_CAMBIO_ESTADO"."RUT_TITULAR",   "SOL_CAMBIO_ESTADO"."ESTATUS_OPERACION",   "SOL_CAMBIO_ESTADO"."ESTATUS_INFORMATICA",   "SOL_CAMBIO_ESTADO"."MOD_ANT_CLIENTE",   "SOL_CAMBIO_ESTADO"."USUARIO_OPERA",   "SOL_CAMBIO_ESTADO"."FECHA_OPERA",   "SOL_CAMBIO_ESTADO"."USUARIO_INFOR",   "SOL_CAMBIO_ESTADO"."FECHA_INFOR"  ,   "SOL_CAMBIO_ESTADO"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								 	:ll_est_ope,   										:ll_est_inf,   										:ls_mod_cliente,   						 	:ls_usu_ope,   							 	:ld_fec_ope,   								:ls_usu_inf,   								:ld_fec_inf ,							  		:ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_CAMBIO_ESTADO"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_CAMBIO_ESTADO"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_CAMBIO_ESTADO"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_CAMBIO_ESTADO"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CAMBIO_ESTADO"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '14' // cambio estado TITULAR
							SELECT	"SOL_CAMBIO_ESTADO_TITULAR"."RUT_TITULAR",   "SOL_CAMBIO_ESTADO_TITULAR"."ESTATUS_OPERACION",   "SOL_CAMBIO_ESTADO_TITULAR"."ESTATUS_INFORMATICA", "SOL_CAMBIO_ESTADO_TITULAR"."MOD_ANT_CLIENTE",  "SOL_CAMBIO_ESTADO_TITULAR"."USUARIO_OPERA",   	"SOL_CAMBIO_ESTADO_TITULAR"."FECHA_OPERA",   "SOL_CAMBIO_ESTADO_TITULAR"."USUARIO_INFOR", "SOL_CAMBIO_ESTADO_TITULAR"."FECHA_INFOR"  ,   	"SOL_CAMBIO_ESTADO_TITULAR"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								 				:ll_est_ope,   												:ll_est_inf,   												:ls_mod_cliente,   						 				:ls_usu_ope,   							 				:ld_fec_ope,   										:ls_usu_inf,   										:ld_fec_inf ,							  					:ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_CAMBIO_ESTADO_TITULAR"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_CAMBIO_ESTADO_TITULAR"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '15' // seguro
							SELECT	"SOL_SEGURO"."RUT_TITULAR",   "SOL_SEGURO"."ESTATUS_OPERACIONES",   "SOL_SEGURO"."ESTATUS_INFORMATICA",    "SOL_SEGURO"."MOD_ANT_CLIENTE",  "SOL_SEGURO"."USUARIO_OPERA", "SOL_SEGURO"."FECHA_OPERA",   "SOL_SEGURO"."USUARIO_INFOR", "SOL_SEGURO"."FECHA_INFOR"  , "SOL_SEGURO"."FECHA_ACTUAL" 
							INTO 		:ll_rut,   							:ll_est_ope,   							:ll_est_inf,   								:ls_mod_cliente,   					:ls_usu_ope,   					:ld_fec_ope,   					:ls_usu_inf,   					:ld_fec_inf  ,						:ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_SEGURO"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_SEGURO"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) )  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '16' // NOVACION
							SELECT	"SOL_NOVACION"."RUT_TITULAR",  "SOL_NOVACION"."ESTATUS_OPERACIONES",   "SOL_NOVACION"."ESTATUS_INFORMATICA",   "SOL_NOVACION"."MOD_ANT_CLIENTE",   "SOL_NOVACION"."USUARIO_OPERA",   "SOL_NOVACION"."FECHA_OPERA",   "SOL_NOVACION"."USUARIO_INFOR",   "SOL_NOVACION"."FECHA_INFOR"  ,   "SOL_NOVACION"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   							 :ll_est_ope,   								  :ll_est_inf,   									:ls_mod_cliente,   						:ls_usu_ope,   						 :ld_fec_ope,   						:ls_usu_inf,   						 :ld_fec_inf  ,						  :ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_NOVACION"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_NOVACION"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_NOVACION"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_NOVACION"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_NOVACION"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '17'
							SELECT	"SOL_COPROP_PROMESA"."RUT_TITULAR", "SOL_COPROP_PROMESA"."ESTATUS_OPERA",   "SOL_COPROP_PROMESA"."ESTATUS_INFOR",		"SOL_COPROP_PROMESA"."MOD_ANT_CLIENTE",   "SOL_COPROP_PROMESA"."USUARIO_OPERA",  "SOL_COPROP_PROMESA"."FECHA_OPERA",	"SOL_COPROP_PROMESA"."USUARIO_INFOR",  "SOL_COPROP_PROMESA"."FECHA_INFOR",	"SOL_COPROP_PROMESA"."FECHA_CREACION"  
							INTO 		:ll_rut,   							 		:ll_est_ope,   								 :ll_est_inf,   									:ls_mod_cliente,   								:ls_usu_ope,   						 		:ld_fec_ope,   							:ls_usu_inf,   						 		:ld_fec_inf  ,						  		:ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_COPROP_PROMESA"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_COPROP_PROMESA"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_COPROP_PROMESA"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_COPROP_PROMESA"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_COPROP_PROMESA"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '18'
							SELECT	  "SOL_ULTIMA_VOLUNTAD"."RUT_TITULAR", 	"SOL_ULTIMA_VOLUNTAD"."ESTATUS_OPERA",  "SOL_ULTIMA_VOLUNTAD"."ESTATUS_INFOR",		"SOL_ULTIMA_VOLUNTAD"."MOD_ANT_CLIENTE",  "SOL_ULTIMA_VOLUNTAD"."USUARIO_OPERA",  	"SOL_ULTIMA_VOLUNTAD"."FECHA_OPERA",	"SOL_ULTIMA_VOLUNTAD"."USUARIO_INFOR",  	"SOL_ULTIMA_VOLUNTAD"."FECHA_INFOR",	"SOL_ULTIMA_VOLUNTAD"."FECHA_CREACION"  
							INTO 		  :ll_rut,   							 			:ll_est_ope,   								 :ll_est_inf,   										:ls_mod_cliente,   								:ls_usu_ope,   						 			:ld_fec_ope,   								:ls_usu_inf,   						 			:ld_fec_inf  ,						  			:ldt_fecha_crea
							FROM 		  "SOL_ESTATUS",   
										  "SOL_ULTIMA_VOLUNTAD"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_ULTIMA_VOLUNTAD"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_ULTIMA_VOLUNTAD"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_ULTIMA_VOLUNTAD"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_ULTIMA_VOLUNTAD"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '19'
							SELECT	  "SOL_POS_EFEC"."RUT_TITULAR", 	"SOL_POS_EFEC"."ESTATUS_OPERACIONES",  "SOL_POS_EFEC"."ESTATUS_INFORMATICA",		"SOL_POS_EFEC"."MOD_ANT_CLIENTE",  "SOL_POS_EFEC"."USUARIO_OPERA",  	"SOL_POS_EFEC"."FECHA_OPERA",	"SOL_POS_EFEC"."USUARIO_INFOR",  	"SOL_POS_EFEC"."FECHA_INFOR",	"SOL_POS_EFEC"."FECHA_ACTUAL"  
							INTO 		  :ll_rut,   							:ll_est_ope,   								:ll_est_inf,   									:ls_mod_cliente,   					  :ls_usu_ope,   						 	:ld_fec_ope,   					:ls_usu_inf,   						 	:ld_fec_inf  ,						:ldt_fecha_crea
							FROM 		  "SOL_ESTATUS",   
										  "SOL_POS_EFEC"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_POS_EFEC"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_POS_EFEC"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_POS_EFEC"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_POS_EFEC"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '20'
							SELECT	  "SOL_PAC"."RUT_TITULAR", 	"SOL_PAC"."ESTATUS_OPERACION",  "SOL_PAC"."ESTATUS_INFORMATICA",		"SOL_PAC"."MOD_ANT_CLIENTE",  "SOL_PAC"."USUARIO_OPERA",  	"SOL_PAC"."FECHA_OPERA",	"SOL_PAC"."USUARIO_INFOR",  	"SOL_PAC"."FECHA_INFOR",	"SOL_PAC"."FECHA_ACTUAL"  
							INTO 		  :ll_rut,   						:ll_est_ope,   					  :ll_est_inf,   								:ls_mod_cliente,   				:ls_usu_ope,   					:ld_fec_ope,   				:ls_usu_inf,   					:ld_fec_inf  ,					:ldt_fecha_crea
							FROM 		  "SOL_ESTATUS",   
										  "SOL_PAC"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_PAC"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_PAC"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_PAC"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_PAC"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '21'
							SELECT	  "SOL_PAT"."RUT_TITULAR", 	"SOL_PAT"."ESTATUS_OPERACION",  "SOL_PAT"."ESTATUS_INFORMATICA",		"SOL_PAT"."MOD_ANT_CLIENTE",  "SOL_PAT"."USUARIO_OPERA",  	"SOL_PAT"."FECHA_OPERA",	"SOL_PAT"."USUARIO_INFOR",  	"SOL_PAT"."FECHA_INFOR",	"SOL_PAT"."FECHA_ACTUAL"  
							INTO 		  :ll_rut,   						:ll_est_ope,   					  :ll_est_inf,   								:ls_mod_cliente,   				:ls_usu_ope,   					:ld_fec_ope,   				:ls_usu_inf,   					:ld_fec_inf  ,					:ldt_fecha_crea
							FROM 		  "SOL_ESTATUS",   
										  "SOL_PAT"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_PAT"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_PAT"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_PAT"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_PAT"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '22' // seguro fallecimiento
							SELECT	"SOL_SEGURO_FALLECE"."RUT_TITULAR",	"SOL_SEGURO_FALLECE"."ESTATUS_OPERACIONES",	"SOL_SEGURO_FALLECE"."ESTATUS_INFORMATICA",  "SOL_SEGURO_FALLECE"."MOD_ANT_CLIENTE", "SOL_SEGURO_FALLECE"."USUARIO_OPERA", "SOL_SEGURO_FALLECE"."FECHA_OPERA", "SOL_SEGURO_FALLECE"."USUARIO_INFOR",  "SOL_SEGURO_FALLECE"."FECHA_INFOR", "SOL_SEGURO_FALLECE"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								  	:ll_est_ope,   										:ll_est_inf,   									 	:ls_mod_cliente,   							 :ls_usu_ope,   							  	:ld_fec_ope,   							:ls_usu_inf,   							 	:ld_fec_inf ,							 	:ldt_fecha_crea
							FROM 		"SOL_ESTATUS",   
										"SOL_SEGURO_FALLECE"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_FALLECE"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_FALLECE"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_FALLECE"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_FALLECE"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '23' // en demanda
							SELECT	"SOL_EN_DEMANDA"."RUT_TITULAR",	"SOL_EN_DEMANDA"."ESTATUS_OPERACION",	"SOL_EN_DEMANDA"."ESTATUS_INFORMATICA",  "SOL_EN_DEMANDA"."MOD_ANT_CLIENTE", "SOL_EN_DEMANDA"."USUARIO_OPERA", "SOL_EN_DEMANDA"."FECHA_OPERA", "SOL_EN_DEMANDA"."USUARIO_INFOR",  "SOL_EN_DEMANDA"."FECHA_INFOR", "SOL_EN_DEMANDA"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								  	:ll_est_ope,   										:ll_est_inf,   									 	:ls_mod_cliente,   							 :ls_usu_ope,   							  	:ld_fec_ope,   							:ls_usu_inf,   							 	:ld_fec_inf ,							 	:ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_EN_DEMANDA"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_EN_DEMANDA"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_EN_DEMANDA"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_EN_DEMANDA"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_EN_DEMANDA"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;	
						CASE '24' // bono fraterno
							SELECT	"SOL_BONO_FRATERNO"."RUT_TITULAR",   "SOL_BONO_FRATERNO"."ESTATUS_OPERACIONES",   "SOL_BONO_FRATERNO"."ESTATUS_INFORMATICA",   "SOL_BONO_FRATERNO"."MOD_ANT_CLIENTE",   "SOL_BONO_FRATERNO"."USUARIO_OPERA",   "SOL_BONO_FRATERNO"."FECHA_OPERA",   "SOL_BONO_FRATERNO"."USUARIO_INFOR",   "SOL_BONO_FRATERNO"."FECHA_INFOR",   "SOL_BONO_FRATERNO"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								  :ll_est_ope,   										:ll_est_inf,   									 :ls_mod_cliente,   							 :ls_usu_ope,   							  :ld_fec_ope,   							 :ls_usu_inf,   							  :ld_fec_inf ,							 :ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_BONO_FRATERNO"
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_BONO_FRATERNO"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_BONO_FRATERNO"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_BONO_FRATERNO"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_BONO_FRATERNO"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '25' // mantención perpetua
							SELECT	"SOL_MANT_PERPETUA"."RUT_TITULAR",   "SOL_MANT_PERPETUA"."ESTATUS_OPERACIONES",   "SOL_MANT_PERPETUA"."ESTATUS_INFORMATICA",   "SOL_MANT_PERPETUA"."MOD_ANT_CLIENTE",   "SOL_MANT_PERPETUA"."USUARIO_OPERA",   "SOL_MANT_PERPETUA"."FECHA_OPERA",   "SOL_MANT_PERPETUA"."USUARIO_INFOR",   "SOL_MANT_PERPETUA"."FECHA_INFOR",   "SOL_MANT_PERPETUA"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								  :ll_est_ope,   										:ll_est_inf,   									 :ls_mod_cliente,   							 :ls_usu_ope,   							  :ld_fec_ope,   							 :ls_usu_inf,   							  :ld_fec_inf ,							 :ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_MANT_PERPETUA"
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_MANT_PERPETUA"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_MANT_PERPETUA"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_MANT_PERPETUA"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_MANT_PERPETUA"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;

					END CHOOSE
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_indi,'rut_titular',ll_rut)
						dw_lista.setitem(ll_indi,'estatus_operacion',ll_est_ope)
						dw_lista.setitem(ll_indi,'estatus_informatica',ll_est_inf)
						dw_lista.setitem(ll_indi,'usuario_opera',ls_usu_ope)
						if date(ld_fec_ope)<>date("01/01/1900") and date(ld_fec_ope)<>date("00/00/0000") and not isnull(ld_fec_ope) then
							dw_lista.setitem(ll_indi,'fecha_opera',string(ld_fec_ope,"dd/mm/yyyy"))
						end if
						dw_lista.setitem(ll_indi,'usuario_infor',ls_usu_inf)
						if date(ld_fec_inf)<>date("01/01/1900") and date(ld_fec_inf)<>date("00/00/0000") and not isnull(ld_fec_inf) then
							dw_lista.setitem(ll_indi,'fecha_infor',string(ld_fec_inf,"dd/mm/yyyy"))
						end if
						dw_lista.setitem(ll_indi,'mod_ant_cliente',ls_mod_cliente)
						dw_lista.setitem(ll_indi,'estado_reg',ls_estado_reg)
						dw_lista.setitem(ll_indi,'estatus_cupon',1)
					end if
					if ls_tipo_sol='5' and ll_est_inf=0 then
						SELECT	MAX("CARTA_LOG"."FECHA_CARTA")
						INTO 		:ldt_fec_max  
						FROM 		"CARTA_LOG"  
						WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
								 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
								 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
								 ( "CARTA_LOG"."COD_ACCION" = 6 )
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if date(ld_fec_inf) > date(ldt_fec_max) then
								dw_lista.setitem(ll_indi,'estatus_cupon',0)
							else
								dw_lista.setitem(ll_indi,'estatus_cupon',1)
							end if
						end if
					end if
					if ll_tot_porc <> ll_tot_porc_aux then 
						st_porc.text		= string(ll_tot_porc)+" %"
						ll_tot_porc_aux	= ll_tot_porc
					end if
					ll_tot_porc				= (ll_indi / ll_tot_reg) * 100
					hpb_1.Position 		= ll_tot_porc
					dw_lista.accepttext()
				next
				dw_lista.sort()
				if rb_todo.checked=true then
					rb_todo.triggerevent(clicked!)
				elseif rb_opera.checked=true then
					rb_opera.triggerevent(clicked!)
				elseif rb_infor.checked=true then
					rb_infor.triggerevent(clicked!)
				end if
			end if
			st_fondo.visible				= false
			hpb_1.visible 				= false
			st_porc.visible 				= false
		end if
	end if
end if
SetPointer(Arrow!)
end event

type pb_ok from picturebutton within w_estado_informes
integer x = 2958
integer y = 64
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;String			ls_descrip, ls_base, ls_serie, ls_tipo_sol, ls_mod_cliente, ls_usu_ope, ls_usu_inf,ls_filtro,ls_estado_reg
long			ll_tot_reg, ll_indi, ll_corr, ll_rut, ll_est_ope, ll_est_inf,ll_tot_porc_aux,ll_tot_porc,ll_est_mod
Datetime		ld_fec_ope, ld_fec_inf,ldt_fec_max,ldt_fecha_crea,ld_fec_ini,ld_fec_fin
time			lt_ini=time('00:00:00'), lt_fin=time('23:59:59')
Double		ll_numero
SetPointer(HourGlass!)
dw_solicitudes.accepttext()
is_tipo_sol								= dw_solicitudes.getitemstring(1,'codigo')
setnull(il_tot_rescil_cli)
ls_filtro 									= ""
dw_lista.SetFilter(ls_filtro)
if is_tipo_sol='T' then 
	is_tipo_sol							='%'
	w_estado_informes.title			= 'Autorizar Solicitudes'
end if
ld_fec_ini								= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin								= datetime(date(em_fec_fin.text),lt_fin)
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			st_fondo.visible				= true
			hpb_1.visible 				= true
			st_porc.visible 				= true
			ll_tot_porc					= 0
			ll_tot_porc_aux				= 0			
			ll_tot_reg					= dw_lista.retrieve(is_tipo_sol,ld_fec_ini,ld_fec_fin)
			if is_tipo_sol = '1' then
				il_tot_rescil_cli				= dw_exportar_rescil_cliente.retrieve(is_tipo_sol,ld_fec_ini,ld_fec_fin)
			end if	
			hpb_1.Position				= ll_tot_porc
			if ll_tot_reg=0 then
				if is_tipo_sol='%' then
					messagebox("Advertencia","No Registra Solicitudes")
				else
					SELECT	"SOLICITUDES"."DESCRIPCION"   
					INTO		:ls_descrip
					FROM 	"SOLICITUDES"  
					WHERE 	"SOLICITUDES"."CODIGO_SOLICITUD" = :is_tipo_sol      
					USING	sqlca;
					if sqlca.sqlcode=0 then
						messagebox("Advertencia","No Registra Solicitud: "+ls_descrip)
					end if
				end if
			else
				SELECT	"SOLICITUDES"."DESCRIPCION"   
				INTO		:ls_descrip
				FROM 	"SOLICITUDES"  
				WHERE 	"SOLICITUDES"."CODIGO_SOLICITUD" = :is_tipo_sol      
				USING	sqlca;
				if sqlca.sqlcode=0 then
					w_estado_informes.title	= ls_descrip
				end if
				for ll_indi=1 to ll_tot_reg
					ls_base					= trim(dw_lista.getitemstring(ll_indi,'base'))
					ls_serie					= trim(dw_lista.getitemstring(ll_indi,'serie'))
					ll_numero				= dw_lista.getitemnumber(ll_indi,'numero')
					ll_corr					= dw_lista.getitemnumber(ll_indi,'correlativo')
					ls_tipo_sol				= trim(dw_lista.getitemstring(ll_indi,'codigo_solicitud'))
					ls_estado_reg			= trim(dw_lista.getitemstring(ll_indi,'estado_reg'))
					CHOOSE CASE ls_tipo_sol
						CASE '1' // resciliacion por parte del cliente
							SELECT	"SOL_RESCILIA_CLIENTE"."RUT_TITULAR",   "SOL_RESCILIA_CLIENTE"."ESTATUS_OPERACION",   "SOL_RESCILIA_CLIENTE"."ESTATUS_INFORMATICA",   "SOL_RESCILIA_CLIENTE"."MOD_ANT_CLIENTE",   "SOL_RESCILIA_CLIENTE"."USUARIO_OPERA",   "SOL_RESCILIA_CLIENTE"."FECHA_OPERA",   "SOL_RESCILIA_CLIENTE"."USUARIO_INFOR",   "SOL_RESCILIA_CLIENTE"."FECHA_INFOR" ,   "SOL_RESCILIA_CLIENTE"."FECHA_ACTUAL"
							INTO 		:ll_rut,   										 :ll_est_ope,   											:ll_est_inf,   											:ls_mod_cliente,   								 :ls_usu_ope,   									 :ld_fec_ope,   									:ls_usu_inf,   									:ld_fec_inf,									 :ldt_fecha_crea
							FROM 	"SOL_RESCILIA_CLIENTE",   
										"SOL_ESTATUS"  
							WHERE 	( "SOL_RESCILIA_CLIENTE"."BASE" = "SOL_ESTATUS"."BASE" ) and  
										( "SOL_RESCILIA_CLIENTE"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
										( "SOL_RESCILIA_CLIENTE"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
										( "SOL_RESCILIA_CLIENTE"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) )   
							Using		sqlca;
			
						CASE '2' // resciliacion por reprogramar
							SELECT	"SOL_RESCILIA_REPROG"."RUT_TITULAR",   "SOL_RESCILIA_REPROG"."ESTATUS_OPERACION",   "SOL_RESCILIA_REPROG"."ESTATUS_INFORMATICA",   "SOL_RESCILIA_REPROG"."MOD_ANT_CLIENTE",   "SOL_RESCILIA_REPROG"."USUARIO_OPERA",   "SOL_RESCILIA_REPROG"."FECHA_OPERA",   "SOL_RESCILIA_REPROG"."USUARIO_INFOR",   "SOL_RESCILIA_REPROG"."FECHA_INFOR"  ,   "SOL_RESCILIA_REPROG"."FECHA_ACTUAL"
							INTO 		:ll_rut,   										:ll_est_ope,   										:ll_est_inf,   											:ls_mod_cliente,   								:ls_usu_ope,   									:ld_fec_ope,   								:ls_usu_inf,   								 :ld_fec_inf ,										:ldt_fecha_crea
							FROM 	"SOL_RESCILIA_REPROG",   
										"SOL_ESTATUS"  
							WHERE 	( "SOL_RESCILIA_REPROG"."BASE" = "SOL_ESTATUS"."BASE" ) and  
										( "SOL_RESCILIA_REPROG"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
										( "SOL_RESCILIA_REPROG"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
										( "SOL_RESCILIA_REPROG"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) )   
							Using		sqlca;
			
						CASE '3' // reactivacion
							SELECT	"SOL_REACTIVA"."RUT_TITULAR",   "SOL_REACTIVA"."ESTATUS_OPERACION",   "SOL_REACTIVA"."ESTATUS_INFORMATICA",   "SOL_REACTIVA"."MOD_ANT_CLIENTE",   "SOL_REACTIVA"."USUARIO_OPERA",   "SOL_REACTIVA"."FECHA_OPERA",   "SOL_REACTIVA"."USUARIO_INFOR",   "SOL_REACTIVA"."FECHA_INFOR"  ,   "SOL_REACTIVA"."FECHA_ACTUAL" 
							INTO 		:ll_rut,   							  :ll_est_ope,   								 :ll_est_inf,   									:ls_mod_cliente,   						:ls_usu_ope,   						:ld_fec_ope,   						:ls_usu_inf,   						:ld_fec_inf  ,							 :ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_REACTIVA"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_REACTIVA"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_REACTIVA"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_REACTIVA"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_REACTIVA"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) )  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '4' // seguro desgravamen
							SELECT	"SOL_SEGURO_DESG"."RUT_TITULAR",   "SOL_SEGURO_DESG"."ESTATUS_OPERACIONES",   "SOL_SEGURO_DESG"."ESTATUS_INFORMATICA",   "SOL_SEGURO_DESG"."MOD_ANT_CLIENTE",   "SOL_SEGURO_DESG"."USUARIO_OPERA",   "SOL_SEGURO_DESG"."FECHA_OPERA",   "SOL_SEGURO_DESG"."USUARIO_INFOR",   "SOL_SEGURO_DESG"."FECHA_INFOR",   "SOL_SEGURO_DESG"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								  :ll_est_ope,   										:ll_est_inf,   									 :ls_mod_cliente,   							 :ls_usu_ope,   							  :ld_fec_ope,   							 :ls_usu_inf,   							  :ld_fec_inf ,							 :ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_SEGURO_DESG"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_DESG"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_DESG"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_DESG"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_DESG"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
			
						CASE '5' // repacta compraventa
							SELECT	"SOL_REPACTA_CVTA"."RUT_TITULAR",   "SOL_REPACTA_CVTA"."ESTATUS_OPERACION",   "SOL_REPACTA_CVTA"."ESTATUS_INFORMATICA",   "SOL_REPACTA_CVTA"."MOD_ANT_CLIENTE",   "SOL_REPACTA_CVTA"."USUARIO_OPERA",   "SOL_REPACTA_CVTA"."FECHA_OPERA",   "SOL_REPACTA_CVTA"."USUARIO_INFOR",   "SOL_REPACTA_CVTA"."FECHA_INFOR"  ,   "SOL_REPACTA_CVTA"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   									:ll_est_ope,   									:ll_est_inf,   										:ls_mod_cliente,   							:ls_usu_ope,   								:ld_fec_ope,   							:ls_usu_inf,   							 :ld_fec_inf  ,								:ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_REPACTA_CVTA"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_REPACTA_CVTA"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_REPACTA_CVTA"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_REPACTA_CVTA"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_REPACTA_CVTA"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
			
						CASE '6' // titulo de dominio
							SELECT	"SOL_TIT_DOMINIO"."RUT_TITULAR",   "SOL_TIT_DOMINIO"."ESTATUS_OPERACIONES",   "SOL_TIT_DOMINIO"."ESTATUS_INFORMATICA",   "SOL_TIT_DOMINIO"."MOD_ANT_CLIENTE",   "SOL_TIT_DOMINIO"."USUARIO_OPERA",   "SOL_TIT_DOMINIO"."FECHA_OPERA",   "SOL_TIT_DOMINIO"."USUARIO_INFOR",   "SOL_TIT_DOMINIO"."FECHA_INFOR"  ,   "SOL_TIT_DOMINIO"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   									:ll_est_ope,   									:ll_est_inf,   									 :ls_mod_cliente,   							 :ls_usu_ope,   								:ld_fec_ope,   						 :ls_usu_inf,   								:ld_fec_inf  ,								:ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_TIT_DOMINIO"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_TIT_DOMINIO"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_TIT_DOMINIO"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_TIT_DOMINIO"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TIT_DOMINIO"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '7' // contrato definitivo
							SELECT	"SOL_CONTRATO_DEF"."RUT_TITULAR",   "SOL_CONTRATO_DEF"."ESTATUS_OPERACIONES",   "SOL_CONTRATO_DEF"."ESTATUS_INFORMATICA",   "SOL_CONTRATO_DEF"."MOD_ANT_CLIENTE",   "SOL_CONTRATO_DEF"."USUARIO_OPERA",   "SOL_CONTRATO_DEF"."FECHA_OPERA",   "SOL_CONTRATO_DEF"."USUARIO_INFOR",   "SOL_CONTRATO_DEF"."FECHA_INFOR"  ,   "SOL_CONTRATO_DEF"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   									:ll_est_ope,   										:ll_est_inf,   									 :ls_mod_cliente,   								:ls_usu_ope,   							 :ld_fec_ope,   							 :ls_usu_inf,   								:ld_fec_inf ,								  :ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_CONTRATO_DEF"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_CONTRATO_DEF"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_CONTRATO_DEF"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_CONTRATO_DEF"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CONTRATO_DEF"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '8' // ENTREGA PAGARE
							SELECT	"SOL_ENTREGA_PAG"."RUT_TITULAR",   "SOL_ENTREGA_PAG"."ESTATUS_OPERACIONES",   "SOL_ENTREGA_PAG"."ESTATUS_INFORMATICA",   "SOL_ENTREGA_PAG"."MOD_ANT_CLIENTE",   "SOL_ENTREGA_PAG"."USUARIO_OPERA",   "SOL_ENTREGA_PAG"."FECHA_OPERA",   "SOL_ENTREGA_PAG"."USUARIO_INFOR",   "SOL_ENTREGA_PAG"."FECHA_INFOR"  ,   "SOL_ENTREGA_PAG"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   									:ll_est_ope,   									:ll_est_inf,   									 :ls_mod_cliente,   							 :ls_usu_ope,   								:ld_fec_ope,   						 :ls_usu_inf,   								:ld_fec_inf  ,								:ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_ENTREGA_PAG"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_ENTREGA_PAG"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_ENTREGA_PAG"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_ENTREGA_PAG"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_ENTREGA_PAG"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '10' // TRANSFERENCIA
							SELECT	"SOL_TRANSFERENCIA"."RUT_TITULAR",   "SOL_TRANSFERENCIA"."ESTATUS_OPERACIONES",   "SOL_TRANSFERENCIA"."ESTATUS_INFORMATICA",   "SOL_TRANSFERENCIA"."MOD_ANT_CLIENTE",   "SOL_TRANSFERENCIA"."USUARIO_OPERA",   "SOL_TRANSFERENCIA"."FECHA_OPERA",   "SOL_TRANSFERENCIA"."USUARIO_INFOR",   "SOL_TRANSFERENCIA"."FECHA_INFOR"  ,   "SOL_TRANSFERENCIA"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   									 :ll_est_ope,   										 :ll_est_inf,   										 :ls_mod_cliente,   								:ls_usu_ope,   								:ld_fec_ope,   							 :ls_usu_inf,   								 :ld_fec_inf  ,								 :ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_TRANSFERENCIA"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_TRANSFERENCIA"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_TRANSFERENCIA"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_TRANSFERENCIA"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TRANSFERENCIA"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '11' // resolucion
							SELECT	"SOL_RESOLUCION"."RUT_TITULAR",   "SOL_RESOLUCION"."ESTATUS_OPERACION",   "SOL_RESOLUCION"."ESTATUS_INFORMATICA",   "SOL_RESOLUCION"."MOD_ANT_CLIENTE",   "SOL_RESOLUCION"."USUARIO_OPERA",   "SOL_RESOLUCION"."FECHA_OPERA",   "SOL_RESOLUCION"."USUARIO_INFOR",   "SOL_RESOLUCION"."FECHA_INFOR"  ,   "SOL_RESOLUCION"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								 :ll_est_ope,   									:ll_est_inf,   									:ls_mod_cliente,   						 :ls_usu_ope,   							 :ld_fec_ope,   							:ls_usu_inf,   							:ld_fec_inf ,							  :ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_RESOLUCION"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_RESOLUCION"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_RESOLUCION"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_RESOLUCION"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESOLUCION"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '12'
							SELECT	"SOL_ESTATUS"."RUT_CLIENTE",   "SOL_MOD_ANTECE"."ESTATUS_MOD",   "SOL_MOD_ANTECE"."USUARIO_OPERA",   "SOL_MOD_ANTECE"."FECHA_OPERA",   "SOL_MOD_ANTECE"."USUARIO_INFOR",   "SOL_MOD_ANTECE"."FECHA_INFOR",   "SOL_MOD_ANTECE"."ESTATUS_INFORMATICA",   "SOL_MOD_ANTECE"."ESTATUS_OPERACIONES"  ,	"SOL_MOD_ANTECE"."FECHA"
							INTO 		:ll_rut,   							  :ll_est_mod,   							:ls_usu_ope,     							:ld_fec_ope,   						 :ls_usu_inf,   							 :ld_fec_inf,   							:ll_est_inf,   									:ll_est_ope  ,										:ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_MOD_ANTECE"  
							WHERE  ( "SOL_ESTATUS"."RUT_CLIENTE" = "SOL_MOD_ANTECE"."RUT" ) and  
									 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_MOD_ANTECE"."CORRELATIVO" ) and  
									 (("SOL_ESTATUS"."RUT_CLIENTE" = :ll_numero ) AND  
									 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) AND  
									 ( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) ) //and
			//						 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							USING		sqlca;
							ls_mod_cliente	= 'S'
						CASE '13' // cambio estado
							SELECT	"SOL_CAMBIO_ESTADO"."RUT_TITULAR",   "SOL_CAMBIO_ESTADO"."ESTATUS_OPERACION",   "SOL_CAMBIO_ESTADO"."ESTATUS_INFORMATICA",   "SOL_CAMBIO_ESTADO"."MOD_ANT_CLIENTE",   "SOL_CAMBIO_ESTADO"."USUARIO_OPERA",   "SOL_CAMBIO_ESTADO"."FECHA_OPERA",   "SOL_CAMBIO_ESTADO"."USUARIO_INFOR",   "SOL_CAMBIO_ESTADO"."FECHA_INFOR"  ,   "SOL_CAMBIO_ESTADO"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								 	:ll_est_ope,   										:ll_est_inf,   										:ls_mod_cliente,   						 	:ls_usu_ope,   							 	:ld_fec_ope,   								:ls_usu_inf,   								:ld_fec_inf ,							  		:ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_CAMBIO_ESTADO"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_CAMBIO_ESTADO"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_CAMBIO_ESTADO"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_CAMBIO_ESTADO"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CAMBIO_ESTADO"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '14' // cambio estado TITULAR
							SELECT	"SOL_CAMBIO_ESTADO_TITULAR"."RUT_TITULAR",   "SOL_CAMBIO_ESTADO_TITULAR"."ESTATUS_OPERACION",   "SOL_CAMBIO_ESTADO_TITULAR"."ESTATUS_INFORMATICA", "SOL_CAMBIO_ESTADO_TITULAR"."MOD_ANT_CLIENTE",  "SOL_CAMBIO_ESTADO_TITULAR"."USUARIO_OPERA",   	"SOL_CAMBIO_ESTADO_TITULAR"."FECHA_OPERA",   "SOL_CAMBIO_ESTADO_TITULAR"."USUARIO_INFOR", "SOL_CAMBIO_ESTADO_TITULAR"."FECHA_INFOR"  ,   	"SOL_CAMBIO_ESTADO_TITULAR"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								 				:ll_est_ope,   												:ll_est_inf,   												:ls_mod_cliente,   						 				:ls_usu_ope,   							 				:ld_fec_ope,   										:ls_usu_inf,   										:ld_fec_inf ,							  					:ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_CAMBIO_ESTADO_TITULAR"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_CAMBIO_ESTADO_TITULAR"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '15' // seguro
							SELECT	"SOL_SEGURO"."RUT_TITULAR",   "SOL_SEGURO"."ESTATUS_OPERACIONES",   "SOL_SEGURO"."ESTATUS_INFORMATICA",    "SOL_SEGURO"."MOD_ANT_CLIENTE",  "SOL_SEGURO"."USUARIO_OPERA", "SOL_SEGURO"."FECHA_OPERA",   "SOL_SEGURO"."USUARIO_INFOR", "SOL_SEGURO"."FECHA_INFOR"  , "SOL_SEGURO"."FECHA_ACTUAL" 
							INTO 		:ll_rut,   							:ll_est_ope,   							:ll_est_inf,   								:ls_mod_cliente,   					:ls_usu_ope,   					:ld_fec_ope,   					:ls_usu_inf,   					:ld_fec_inf  ,						:ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_SEGURO"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_SEGURO"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) )  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '16' // NOVACION
							SELECT	"SOL_NOVACION"."RUT_TITULAR",  "SOL_NOVACION"."ESTATUS_OPERACIONES",   "SOL_NOVACION"."ESTATUS_INFORMATICA",   "SOL_NOVACION"."MOD_ANT_CLIENTE",   "SOL_NOVACION"."USUARIO_OPERA",   "SOL_NOVACION"."FECHA_OPERA",   "SOL_NOVACION"."USUARIO_INFOR",   "SOL_NOVACION"."FECHA_INFOR"  ,   "SOL_NOVACION"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   							 :ll_est_ope,   								  :ll_est_inf,   									:ls_mod_cliente,   						:ls_usu_ope,   						 :ld_fec_ope,   						:ls_usu_inf,   						 :ld_fec_inf  ,						  :ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_NOVACION"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_NOVACION"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_NOVACION"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_NOVACION"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_NOVACION"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '17'
							SELECT	"SOL_COPROP_PROMESA"."RUT_TITULAR", "SOL_COPROP_PROMESA"."ESTATUS_OPERA",   "SOL_COPROP_PROMESA"."ESTATUS_INFOR",		"SOL_COPROP_PROMESA"."MOD_ANT_CLIENTE",   "SOL_COPROP_PROMESA"."USUARIO_OPERA",  "SOL_COPROP_PROMESA"."FECHA_OPERA",	"SOL_COPROP_PROMESA"."USUARIO_INFOR",  "SOL_COPROP_PROMESA"."FECHA_INFOR",	"SOL_COPROP_PROMESA"."FECHA_CREACION"  
							INTO 		:ll_rut,   							 		:ll_est_ope,   								 :ll_est_inf,   									:ls_mod_cliente,   								:ls_usu_ope,   						 		:ld_fec_ope,   							:ls_usu_inf,   						 		:ld_fec_inf  ,						  		:ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_COPROP_PROMESA"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_COPROP_PROMESA"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_COPROP_PROMESA"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_COPROP_PROMESA"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_COPROP_PROMESA"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '18'
							SELECT	  "SOL_ULTIMA_VOLUNTAD"."RUT_TITULAR", 	"SOL_ULTIMA_VOLUNTAD"."ESTATUS_OPERA",  "SOL_ULTIMA_VOLUNTAD"."ESTATUS_INFOR",		"SOL_ULTIMA_VOLUNTAD"."MOD_ANT_CLIENTE",  "SOL_ULTIMA_VOLUNTAD"."USUARIO_OPERA",  	"SOL_ULTIMA_VOLUNTAD"."FECHA_OPERA",	"SOL_ULTIMA_VOLUNTAD"."USUARIO_INFOR",  	"SOL_ULTIMA_VOLUNTAD"."FECHA_INFOR",	"SOL_ULTIMA_VOLUNTAD"."FECHA_CREACION"  
							INTO 		  :ll_rut,   							 			:ll_est_ope,   								 :ll_est_inf,   										:ls_mod_cliente,   								:ls_usu_ope,   						 			:ld_fec_ope,   								:ls_usu_inf,   						 			:ld_fec_inf  ,						  			:ldt_fecha_crea
							FROM 	  "SOL_ESTATUS",   
										  "SOL_ULTIMA_VOLUNTAD"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_ULTIMA_VOLUNTAD"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_ULTIMA_VOLUNTAD"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_ULTIMA_VOLUNTAD"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_ULTIMA_VOLUNTAD"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '19'
							SELECT	  "SOL_POS_EFEC"."RUT_TITULAR", 	"SOL_POS_EFEC"."ESTATUS_OPERACIONES",  "SOL_POS_EFEC"."ESTATUS_INFORMATICA",		"SOL_POS_EFEC"."MOD_ANT_CLIENTE",  "SOL_POS_EFEC"."USUARIO_OPERA",  	"SOL_POS_EFEC"."FECHA_OPERA",	"SOL_POS_EFEC"."USUARIO_INFOR",  	"SOL_POS_EFEC"."FECHA_INFOR",	"SOL_POS_EFEC"."FECHA_ACTUAL"  
							INTO 		  :ll_rut,   							:ll_est_ope,   								:ll_est_inf,   									:ls_mod_cliente,   					  :ls_usu_ope,   						 	:ld_fec_ope,   					:ls_usu_inf,   						 	:ld_fec_inf  ,						:ldt_fecha_crea
							FROM 	  "SOL_ESTATUS",   
										  "SOL_POS_EFEC"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_POS_EFEC"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_POS_EFEC"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_POS_EFEC"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_POS_EFEC"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '20'
							SELECT	  "SOL_PAC"."RUT_TITULAR", 	"SOL_PAC"."ESTATUS_OPERACION",  "SOL_PAC"."ESTATUS_INFORMATICA",		"SOL_PAC"."MOD_ANT_CLIENTE",  "SOL_PAC"."USUARIO_OPERA",  	"SOL_PAC"."FECHA_OPERA",	"SOL_PAC"."USUARIO_INFOR",  	"SOL_PAC"."FECHA_INFOR",	"SOL_PAC"."FECHA_ACTUAL"  
							INTO 		  :ll_rut,   						:ll_est_ope,   					  :ll_est_inf,   								:ls_mod_cliente,   				:ls_usu_ope,   					:ld_fec_ope,   				:ls_usu_inf,   					:ld_fec_inf  ,					:ldt_fecha_crea
							FROM 	  "SOL_ESTATUS",   
										  "SOL_PAC"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_PAC"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_PAC"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_PAC"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_PAC"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '21'
							SELECT	  "SOL_PAT"."RUT_TITULAR", 	"SOL_PAT"."ESTATUS_OPERACION",  "SOL_PAT"."ESTATUS_INFORMATICA",		"SOL_PAT"."MOD_ANT_CLIENTE",  "SOL_PAT"."USUARIO_OPERA",  	"SOL_PAT"."FECHA_OPERA",	"SOL_PAT"."USUARIO_INFOR",  	"SOL_PAT"."FECHA_INFOR",	"SOL_PAT"."FECHA_ACTUAL"  
							INTO 		  :ll_rut,   						:ll_est_ope,   					  :ll_est_inf,   								:ls_mod_cliente,   				:ls_usu_ope,   					:ld_fec_ope,   				:ls_usu_inf,   					:ld_fec_inf  ,					:ldt_fecha_crea
							FROM 	  "SOL_ESTATUS",   
										  "SOL_PAT"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_PAT"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_PAT"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_PAT"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_PAT"."CORRELATIVO" ) and  
										(("SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '22' // seguro fallecimiento
							SELECT	"SOL_SEGURO_FALLECE"."RUT_TITULAR",	"SOL_SEGURO_FALLECE"."ESTATUS_OPERACIONES",	"SOL_SEGURO_FALLECE"."ESTATUS_INFORMATICA",  "SOL_SEGURO_FALLECE"."MOD_ANT_CLIENTE", "SOL_SEGURO_FALLECE"."USUARIO_OPERA", "SOL_SEGURO_FALLECE"."FECHA_OPERA", "SOL_SEGURO_FALLECE"."USUARIO_INFOR",  "SOL_SEGURO_FALLECE"."FECHA_INFOR", "SOL_SEGURO_FALLECE"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								  	:ll_est_ope,   										:ll_est_inf,   									 	:ls_mod_cliente,   							 :ls_usu_ope,   							  	:ld_fec_ope,   							:ls_usu_inf,   							 	:ld_fec_inf ,							 	:ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_SEGURO_FALLECE"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_FALLECE"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_FALLECE"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_FALLECE"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_FALLECE"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
							
						CASE '23' // en demanda
							SELECT	"SOL_EN_DEMANDA"."RUT_TITULAR",	"SOL_EN_DEMANDA"."ESTATUS_OPERACION",	"SOL_EN_DEMANDA"."ESTATUS_INFORMATICA",  "SOL_EN_DEMANDA"."MOD_ANT_CLIENTE", "SOL_EN_DEMANDA"."USUARIO_OPERA", "SOL_EN_DEMANDA"."FECHA_OPERA", "SOL_EN_DEMANDA"."USUARIO_INFOR",  "SOL_EN_DEMANDA"."FECHA_INFOR", "SOL_EN_DEMANDA"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								  	:ll_est_ope,   										:ll_est_inf,   									 	:ls_mod_cliente,   							 :ls_usu_ope,   							  	:ld_fec_ope,   							:ls_usu_inf,   							 	:ld_fec_inf ,							 	:ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_EN_DEMANDA"  
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_EN_DEMANDA"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_EN_DEMANDA"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_EN_DEMANDA"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_EN_DEMANDA"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '24' // bono fraterno
							SELECT	"SOL_BONO_FRATERNO"."RUT_TITULAR",   "SOL_BONO_FRATERNO"."ESTATUS_OPERACIONES",   "SOL_BONO_FRATERNO"."ESTATUS_INFORMATICA",   "SOL_BONO_FRATERNO"."MOD_ANT_CLIENTE",   "SOL_BONO_FRATERNO"."USUARIO_OPERA",   "SOL_BONO_FRATERNO"."FECHA_OPERA",   "SOL_BONO_FRATERNO"."USUARIO_INFOR",   "SOL_BONO_FRATERNO"."FECHA_INFOR",   "SOL_BONO_FRATERNO"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								  :ll_est_ope,   										:ll_est_inf,   									 :ls_mod_cliente,   							 :ls_usu_ope,   							  :ld_fec_ope,   							 :ls_usu_inf,   							  :ld_fec_inf ,							 :ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_BONO_FRATERNO"
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_BONO_FRATERNO"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_BONO_FRATERNO"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_BONO_FRATERNO"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_BONO_FRATERNO"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
						CASE '25' // mantención perpetua
							SELECT	"SOL_MANT_PERPETUA"."RUT_TITULAR",   "SOL_MANT_PERPETUA"."ESTATUS_OPERACIONES",   "SOL_MANT_PERPETUA"."ESTATUS_INFORMATICA",   "SOL_MANT_PERPETUA"."MOD_ANT_CLIENTE",   "SOL_MANT_PERPETUA"."USUARIO_OPERA",   "SOL_MANT_PERPETUA"."FECHA_OPERA",   "SOL_MANT_PERPETUA"."USUARIO_INFOR",   "SOL_MANT_PERPETUA"."FECHA_INFOR",   "SOL_MANT_PERPETUA"."FECHA_ACTUAL"  
							INTO 		:ll_rut,   								  :ll_est_ope,   										:ll_est_inf,   									 :ls_mod_cliente,   							 :ls_usu_ope,   							  :ld_fec_ope,   							 :ls_usu_inf,   							  :ld_fec_inf ,							 :ldt_fecha_crea
							FROM 	"SOL_ESTATUS",   
										"SOL_MANT_PERPETUA"
							WHERE 	( "SOL_ESTATUS"."BASE" = "SOL_MANT_PERPETUA"."BASE" ) and  
										( "SOL_ESTATUS"."SERIE" = "SOL_MANT_PERPETUA"."SERIE" ) and  
										( "SOL_ESTATUS"."NUMERO" = "SOL_MANT_PERPETUA"."NUMERO" ) and  
										( "SOL_ESTATUS"."CORRELATIVO" = "SOL_MANT_PERPETUA"."CORRELATIVO" ) and  
										( ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
										( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
										( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) ) //AND  
			//							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
							Using		sqlca;
					END CHOOSE
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_indi,'rut_titular',ll_rut)
						dw_lista.setitem(ll_indi,'estatus_operacion',ll_est_ope)
						dw_lista.setitem(ll_indi,'estatus_informatica',ll_est_inf)
						dw_lista.setitem(ll_indi,'usuario_opera',ls_usu_ope)
						if date(ld_fec_ope)<>date("01/01/1900") and date(ld_fec_ope)<>date("00/00/0000") and not isnull(ld_fec_ope) then
							dw_lista.setitem(ll_indi,'fecha_opera',string(ld_fec_ope,"dd/mm/yyyy"))
						end if
						dw_lista.setitem(ll_indi,'usuario_infor',ls_usu_inf)
						if date(ld_fec_inf)<>date("01/01/1900") and date(ld_fec_inf)<>date("00/00/0000") and not isnull(ld_fec_inf) then
							dw_lista.setitem(ll_indi,'fecha_infor',string(ld_fec_inf,"dd/mm/yyyy"))
						end if
						dw_lista.setitem(ll_indi,'mod_ant_cliente',ls_mod_cliente)
						dw_lista.setitem(ll_indi,'estado_reg',ls_estado_reg)
						dw_lista.setitem(ll_indi,'estatus_cupon',1)
					end if
					if ls_tipo_sol='5' and ll_est_inf=0 then
						SELECT	MAX("CARTA_LOG"."FECHA_CARTA")
						INTO 		:ldt_fec_max  
						FROM 	"CARTA_LOG"  
						WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
								 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
								 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
								 ( "CARTA_LOG"."COD_ACCION" = 6 )
						USING	sqlca;
						if sqlca.sqlcode=0 then
							if date(ld_fec_inf) > date(ldt_fec_max) then
								dw_lista.setitem(ll_indi,'estatus_cupon',0)
							else
								dw_lista.setitem(ll_indi,'estatus_cupon',1)
							end if
						end if
					end if
					if ll_tot_porc <> ll_tot_porc_aux then 
						st_porc.text		= string(ll_tot_porc)+" %"
						ll_tot_porc_aux	= ll_tot_porc
					end if
					ll_tot_porc			= (ll_indi / ll_tot_reg) * 100
					hpb_1.Position 		= ll_tot_porc
					dw_lista.accepttext()
				next
				dw_lista.sort()
				if rb_todo.checked=true then
					rb_todo.triggerevent(clicked!)
				elseif rb_opera.checked=true then
					rb_opera.triggerevent(clicked!)
				elseif rb_infor.checked=true then
					rb_infor.triggerevent(clicked!)
				end if
			end if
			st_fondo.visible				= false
			hpb_1.visible 				= false
			st_porc.visible 				= false
		end if
	end if
end if
SetPointer(Arrow!)
end event

type st_1 from statictext within w_estado_informes
integer x = 1326
integer y = 168
integer width = 434
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Solicitudes"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_todo from radiobutton within w_estado_informes
integer x = 105
integer y = 88
integer width = 338
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Todos"
end type

event clicked;string	ls_filtro

ls_filtro 		= ""
dw_lista.SetFilter(ls_filtro)
dw_lista.Filter( )
dw_lista.sort()
dw_lista.scrolltorow(1)
end event

type rb_opera from radiobutton within w_estado_informes
integer x = 105
integer y = 164
integer width = 485
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Atención Cliente"
end type

event clicked;String	ls_filtro

ls_filtro 		= "estatus_operacion = 1 and estado_reg='A'"
dw_lista.SetFilter(ls_filtro)
dw_lista.Filter( )
dw_lista.sort()
dw_lista.scrolltorow(1)
end event

type cb_cta_cte from commandbutton within w_estado_informes
integer x = 343
integer y = 1824
integer width = 210
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ct&a.Cte."
end type

event clicked;if il_row>0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	if gs_base='W' then
		cb_po_rut.triggerevent(clicked!)
	else
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
			CASE "F","G" // Anexo Funerario
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				Open(w_cuenta_corriente_funeraria)
		END CHOOSE
	end if
end if
end event

type cb_imprimir from commandbutton within w_estado_informes
integer x = 2048
integer y = 1824
integer width = 201
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )

end event

type cb_exportar from commandbutton within w_estado_informes
integer x = 2272
integer y = 1824
integer width = 215
integer height = 100
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
if il_tot_rescil_cli > 0 then
	dw_paso	= dw_exportar_rescil_cliente
else	
	dw_paso	= dw_lista
end if
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_sort from commandbutton within w_estado_informes
integer x = 2491
integer y = 1824
integer width = 210
integer height = 100
integer taborder = 150
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

type cb_filtrar from commandbutton within w_estado_informes
integer x = 2706
integer y = 1824
integer width = 174
integer height = 100
integer taborder = 160
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
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_cerrar from commandbutton within w_estado_informes
integer x = 2912
integer y = 1824
integer width = 238
integer height = 100
integer taborder = 170
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_estado_informes)
end event

type rb_infor from radiobutton within w_estado_informes
integer x = 667
integer y = 88
integer width = 393
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Operaciones"
end type

event clicked;String	ls_filtro
ls_filtro 		= "estatus_operacion = 0 and estatus_informatica = 1 and estado_reg='A'"
dw_lista.SetFilter(ls_filtro)
dw_lista.Filter()
dw_lista.sort()
dw_lista.scrolltorow(1)
end event

type gb_1 from groupbox within w_estado_informes
integer x = 55
integer y = 32
integer width = 1166
integer height = 232
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción: Solicitudes Pendientes"
end type

type hpb_1 from hprogressbar within w_estado_informes
boolean visible = false
integer x = 914
integer y = 1040
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_fondo from statictext within w_estado_informes
boolean visible = false
integer x = 882
integer y = 936
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_estado_informes
integer x = 55
integer y = 296
integer width = 3095
integer height = 1476
integer taborder = 50
string dataobject = "dw_lista_estado_generales_2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_cod_sol,ls_columna
Long		ll_count_reg

ls_columna							= dwo.name
if row>0 then
	il_row								= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base							= dw_lista.getitemstring(il_row,'base')
	gs_serie							= dw_lista.getitemstring(il_row,'serie')
	gi_numero						= dw_lista.getitemnumber(il_row,'numero')
	ls_cod_sol						= dw_lista.getitemstring(il_row,'codigo_solicitud')
	gi_rut								= long(dw_lista.getitemstring(il_row,'rut_titular'))
	if ls_cod_sol='1' and (gs_solicitudes='2' or gs_solicitudes='3') then
		cb_print_ctto.enabled		= true
	else
		cb_print_ctto.enabled		= false
	end if
	SELECT	COUNT("SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD")
	INTO 		:ll_count_reg  
	FROM 		"SOL_PERMISOS_USUARIO"  
	WHERE  ( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
			 ( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' ) AND
			 ( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = :ls_cod_sol)
	USING		sqlca;
	if ll_count_reg>0 or gs_depto='I' then
		cb_aceptar_informatica.enabled	= true
	else
		cb_aceptar_informatica.enabled	= false
	end if
else
	il_row	= 0
end if
if ls_columna='t_7' or ls_columna='t_13' or ls_columna='t_12' then
	if is_filtro='' or isnull(is_filtro) then
		is_filtro									= 'estatus_cupon=0'
	else
		is_filtro									= ''
	end if
	dw_lista.SETfilter(is_filtro)
	dw_lista.filter()
end if
if ls_columna='t_15' or ls_columna='t_16' then
	if is_filtro='' or isnull(is_filtro) or is_filtro='estado_reg="A" and estatus_operacion = 1' or is_filtro='estado_reg="A" and estatus_operacion = 0 and estatus_informatica = 1' then
		is_filtro									= 'estado_reg="I"'
	else
		if rb_opera.checked=true or rb_infor.checked=true then
			if rb_opera.checked=true 	then is_filtro	= 'estado_reg="A" and estatus_operacion = 1'
			if rb_infor.checked=true 		then is_filtro	= 'estado_reg="A" and estatus_operacion = 0 and estatus_informatica = 1'
		else
			is_filtro								= ''
		end if
	end if
	dw_lista.SETfilter(is_filtro)
	dw_lista.filter()
end if
if ls_columna='t_17' or ls_columna='t_18' then
	if is_filtro='' or isnull(is_filtro) then //or is_filtro='estado_reg="A" and estatus_operacion = 1' or is_filtro='estado_reg="A" and estatus_operacion = 0 and estatus_informatica = 1'
		is_filtro									= 'estado_reg="A" and estatus_cupon<>0'
	else
		if rb_opera.checked=true or rb_infor.checked=true then
			if rb_opera.checked=true 	then	is_filtro	= 'estado_reg="A" and estatus_operacion = 1'
			if rb_infor.checked=true 		then is_filtro		= 'estado_reg="A" and estatus_operacion = 0 and estatus_informatica = 1'
		else
			is_filtro								= ''
		end if
	end if
	dw_lista.SETfilter(is_filtro)
	dw_lista.filter()
end if
end event

event rowfocuschanged;String	ls_cod_sol
Long		ll_count_reg
if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'numero')
	ls_cod_sol	= dw_lista.getitemstring(il_row,'codigo_solicitud')
	gi_rut			= long(dw_lista.getitemstring(il_row,'rut_titular'))
	if ls_cod_sol='1' and (gs_solicitudes='2' or gs_solicitudes='3') then
		cb_print_ctto.enabled	= true
	else
		cb_print_ctto.enabled	= false
	end if
	SELECT	COUNT("SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD")
	INTO 		:ll_count_reg  
	FROM 		"SOL_PERMISOS_USUARIO"  
	WHERE  ( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
			 ( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' ) AND
			 ( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = :ls_cod_sol)
	USING		sqlca;
	if ll_count_reg>0 or gs_depto='I' then
		cb_aceptar_informatica.enabled	= true
	else
		cb_aceptar_informatica.enabled	= false
	end if
end if

end event

event doubleclicked;Long		ll_corr
Double	ll_numero
String		ls_string, ls_base, ls_serie,ls_tipo_sol

if row>0 then
	il_row							= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ll_corr						= this.getitemnumber(il_row,'correlativo')
	ls_base						= this.getitemstring(il_row,'base')
	ls_serie						= this.getitemstring(il_row,'serie')
	ls_tipo_sol					= this.getitemstring(il_row,'codigo_solicitud')
	ll_numero					= this.getitemnumber(il_row,'numero')
	if ls_tipo_sol='1' and (gs_solicitudes='2' or gs_solicitudes='3') then
		cb_print_ctto.enabled	= true
	else
		cb_print_ctto.enabled	= false
	end if
	if isvalid(w_mantencion_fromulario_solicitudes2) then close(w_mantencion_fromulario_solicitudes2)
	ls_string						= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+ls_tipo_sol+'~t'+string(ll_corr)+'~t'+'M'
	openwithparm(w_mantencion_fromulario_solicitudes2,ls_string)
end if
end event

event dberror;return(1)
end event

type cb_aceptar_informatica from commandbutton within w_estado_informes
integer x = 878
integer y = 1824
integer width = 288
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actuali&zar"
end type

event clicked;long		ll_estatus,ll_corr,ll_renta,ll_grupo_f,ll_rut,ll_est_ope,ll_correlativo,ll_precio,ll_pie,&
			ll_tasa,ll_capacidad,ll_valor_cuota,ll_des_esp,ll_uf_dia,ll_nro_cuotas,	ll_parque,ll_gastos_adm	,ll_factura,ll_total_fact,ll_pie_pagado,&
			cta_pag_s,cta_pag_m,nro_cuotas,ret,dias,ret1,ret11,ll_max,ll_mora_credito,cta_pag_la,cta_pag_isa,ll_mora_mant,ll_tot_reg,ll_indi,Net,ll_resp,ll_cta_pag_m,&
			ll_ctas,ll_ctas_en_mora,ll_ctas_repacta,ll_ctas_pag_m,ll_total_pagado,ll_cod_parque,ll_rut_gerente_operaciones
Double	ll_numero,ll_ult_folio,ll_nro_oferta,ll_folio,ll_derecho_lib,ll_numero_new
Datetime	ldt_fec_nac,ldt_fecha,ldt_fecha_prim,ldt_fecha_ult,ldt_fecha_entre,ldt_fecha_pie,ldt_fecha_mod,ldt_fecha_fact,fecha_prim,fecha_man,fecha_vto,&
			ldt_fecha_hoy,ld_fec_1er_vcto,ld_fec_vcto,ld_fec_prox_pago,ldt_fecha_promesa,ldt_fecha_mant
String		ls_obs,ls_cod_sol,ls_est_mod,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_serie,ls_moneda,ls_n_reduccion,&
			ls_modificado,ls_area,ls_sepultura,ls_carta_bienv,ls_nro_tecnico,ls_estado,	ls_string,ls_est_cob,ls_nombre,ls_ap_pat,ls_ap_mat,ls_estado_reg,ls_base,&
			ls_anexo_lib,ls_anexo_repacta,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_estado_cadena,ls_dv,ls_nom,ls_nro_sepultura,ls_sexo,ls_direccion_p,ls_nro_particular,&
			ls_depto_particular,ls_block_particular,ls_poblacion,ls_estado_civil,ls_trato,	ls_nombre_cliente,ls_tipo_construccion,ls_total_promesa_palabras,ls_total_pagado_palabras,&
			ls_estado_contrato,ls_fecha_promesa_palabas,ls_tipo_via_titulo,ls_pasa,ls_base_new,ls_serie_new,ls_descrip_estado,ls_cobrador,ls_estado_at_pub,ls_glosa
			
if dw_lista.rowcount()>0 then
	if cbx_todo.checked=true then
		if is_tipo_sol<>'T' and is_tipo_sol<>'%' then
			ll_tot_reg				= dw_lista.rowcount()
			if ll_tot_reg>0 then
				if is_tipo_sol='6' then	
					messagebox("Advertencia","Solicitud Titulo de Dominio No es posible Autorizar en grupo")
				else
					Net 				= MessageBox("Advertencia", "Está seguro de Actualizar Todo", Exclamation!, YesNo!, 2)
					IF Net = 1 THEN
						CHOOSE CASE is_tipo_sol
							CASE '1'
								if isvalid(w_ingreso_fecha_res_una_vez) then close(w_ingreso_fecha_res_una_vez)
								open(w_ingreso_fecha_res_una_vez)
							CASE '2'
								if isvalid(w_ingreso_fecha_res_una_vez) then close(w_ingreso_fecha_res_una_vez)
								open(w_ingreso_fecha_res_una_vez)
						END CHOOSE		
						for ll_indi = 1 to ll_tot_reg
							il_row	= ll_indi
							CHOOSE CASE is_tipo_sol
								CASE '1'
									wf_grabar_todos_resciliacion_cliente()
								CASE '2'
									wf_grabar_todos_resciliacion_reprog()
								CASE '3'
									wf_grabar_todos_reactiva_ctto_resuelto()
								CASE '4'
									wf_grabar_todos_seguro_desgravamen()
								CASE '5'
									wf_grabar_todos_repactacion_fecha()
								CASE '6' // no actualizar en grupo
									wf_grabar_todos_titulo_dominio()
		//						CASE '7'
		//							wf_grabar_todos_ctto_definitivo()
		//						CASE '8'
		//							wf_grabar_todos_entrega_pagare()
								CASE '9' // falta
								CASE '10'
									wf_grabar_todos_transferencia()
				//				CASE '11'
				//					wf_grabar_todos_resolucion()
								CASE '12'
									wf_grabar_todos_antece_cliente()
								CASE '13'
									wf_grabar_todos_cambio_estado()
								CASE '14'
									wf_grabar_todos_cambio_estado_titular()
								CASE '15'
									wf_grabar_todos_seguros()
								CASE '16'
									wf_grabar_todos_novacion()
								CASE '17'
									wf_grabar_todos_coprop_promesa()
								CASE '18'
									wf_grabar_todos_ultima_voluntad()
								CASE '19'
									wf_grabar_todos_posesion_efectiva()
								CASE '20'
									wf_grabar_todos_pac()
								CASE '21'
									wf_grabar_todos_pat()
								CASE '22'
									wf_grabar_todos_seguro_fallecimiento()
								CASE '23'
									wf_grabar_todos_en_demanda()
								CASE '24'
									wf_grabar_todos_bono_fraterno()
								CASE '25'
									wf_grabar_todos_mant_perpetua()	
							END CHOOSE
						next
					END IF
				end if
			else
				messagebox("Advertencia","No registra solicitud para actualizar")
			end if
		else
			messagebox("Advertencia","Debe Seleccionar un Tipo de Solicitud para Actualizar Todo")
		end if
	elseif cbx_todo.checked=false then
		ldt_fecha							= datetime(idt_fecha_hoy,now())
		ldt_fecha_hoy					= datetime(idt_fecha_hoy,time('00:00:00'))
		if il_row>0 then
			gs_base						= dw_lista.getitemstring(il_row,'base')
			gs_serie						= dw_lista.getitemstring(il_row,'serie')
			gi_numero					= dw_lista.getitemnumber(il_row,'numero')
			ll_corr						= dw_lista.getitemnumber(il_row,'correlativo')
			il_correlativo				= dw_lista.getitemnumber(il_row,'correlativo')
			ll_estatus					= dw_lista.getitemnumber(il_row,'estatus_informatica')
			ls_cod_sol					= dw_lista.getitemstring(il_row,'codigo_solicitud')
			ls_est_mod					= dw_lista.getitemstring(il_row,'mod_ant_cliente')
			ll_est_ope					= dw_lista.getitemnumber(il_row,'estatus_operacion')
			ls_estado_reg				= dw_lista.getitemstring(il_row,'estado_reg')
			ll_rut							= dw_lista.getitemnumber(il_row,'rut_titular')
			if ls_estado_reg='A' then
				if ll_estatus=1 then
					if ll_est_ope=1 then
						messagebox("Advertencia","Operaciones NO ha Autorizado la Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(ll_corr,"###,###,###,##0"))
					else
						ls_pasa			= 'S'
						if is_tipo_sol="2" then
							SELECT	"SOL_RESCILIA_REPROG"."BASE_NUEVO",   
										"SOL_RESCILIA_REPROG"."SERIE_NUEVO",   
										"SOL_RESCILIA_REPROG"."NUMERO_NUEVO"  
							INTO 		:ls_base_new,   
										:ls_serie_new,   
										:ll_numero_new  
							FROM 	"SOL_RESCILIA_REPROG"  
							WHERE  ( "SOL_RESCILIA_REPROG"."BASE" = :gs_base ) AND  
									   ( "SOL_RESCILIA_REPROG"."SERIE" = :gs_serie ) AND  
									   ( "SOL_RESCILIA_REPROG"."NUMERO" = :gi_numero ) AND  
									   ( "SOL_RESCILIA_REPROG"."CORRELATIVO" = :ll_corr )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								SELECT	"CADENA"."CODIGO"  
								INTO 		:ls_descrip_estado  
								FROM 	"CADENA"  
								WHERE  ( "CADENA"."CODIGO" = :ls_base_new ) AND  
										   ( "CADENA"."SERIE" = :ls_serie_new ) AND  
										   ( "CADENA"."NUMERO" = :ll_numero_new ) 
								USING	sqlca;
								if sqlca.sqlcode<>0 then
									messagebox("Advertencia","Recuerde Para Resciliar Contrato Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###") +", el Contrato Nº "+ls_base_new+'-'+ls_serie_new+'-'+string(ll_numero_new,"###,###,###,###,###")+' debe estar DIGITADO')
									ls_pasa		= 'N'
								end if
							end if
						end if
						if ls_pasa='S' then
							Net 					= MessageBox("Advertencia","Está seguro Autorizar la Solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(ll_corr,"###,###,###,##0"), Exclamation!, YesNo!, 2)
							IF Net = 1 THEN
								dw_lista.setitem(il_row,'estatus_informatica',0)
								dw_lista.setitem(il_row,'usuario_infor',gs_user)
								dw_lista.setitem(il_row,'fecha_infor',string(idt_fecha_hoy,"dd/mm/yyyy"))
								ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
								ls_obs			= ls_obs+', Autoriza Informática por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
								dw_lista.setitem(il_row,'observacion',ls_obs)
								dw_lista.accepttext()
								if dw_lista.update()=1 then
									commit;
									CHOOSE CASE ls_cod_sol
										CASE "1" //resciliacion por parte del cliente
											UPDATE	"SOL_RESCILIA_CLIENTE"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_RESCILIA_CLIENTE"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																										 FROM 	"SOL_ESTATUS"  
																										 WHERE 	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																													( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																													( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																													( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																													( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																													( "SOL_ESTATUS"."ESTADO_REG" = 'A' ))  AND
														"SOL_RESCILIA_CLIENTE"."SERIE" = :gs_serie AND
														"SOL_RESCILIA_CLIENTE"."NUMERO" = :gi_numero AND
														"SOL_RESCILIA_CLIENTE"."CORRELATIVO" = :ll_corr
											Using		sqlca ;
											if sqlca.sqlcode=0 then
												commit;
												// cambiar valores
												if gs_base='L' then
													SELECT	"ANEXO_LIBERADOR"."BASE",   
																"ANEXO_LIBERADOR"."SERIE",   
																"ANEXO_LIBERADOR"."NRO_OFERTA"  
													INTO 		:ls_base,   
																:ls_serie,   
																:ll_numero  
													FROM 	"ANEXO_LIBERADOR",   
																"PAGO_LIBERADOR"  
													WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
															 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
															 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
															 (("ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
															 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) )   
													using		sqlca;
													if sqlca.sqlcode=0 then
														CHOOSE CASE ls_base
															CASE 'O'
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
																	if ll_cta_pag_m>=99 then
																		ll_ctas	= ll_cta_pag_m - 99  
																		UPDATE	"OFERTA_V"  
																		SET 		"ANEXO_LIB" = '',   
																					"CTA_PAG_M" = :ll_ctas
																		WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
																				    ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
																		USING		sqlca;
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
																	if ll_cta_pag_m>=99 then
																		ll_ctas	= ll_cta_pag_m - 99  
																		UPDATE	"CONTRATO"  
																		SET 		"ANEXO_LIB" = '',   
																					"CTA_PAG_M" = :ll_ctas  
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
																	ll_ctas	= 0
																	UPDATE	"OFERTA_V"  
																	SET 		"ANEXO_AUMENTO" = '',   
																				"CTA_PAG_M" = :ll_ctas
																	WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
																			   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
																	USING		sqlca;
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
													USING		sqlca;
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
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	ll_ctas	= ll_cta_pag_m - ll_ctas_en_mora
																	UPDATE	"OFERTA_V"  
																	SET 		"ANEXO_REPACTA" = '',   
																				"CTA_REPACTA" = 0,
																				"CTA_PAG_M" = :ll_ctas
																	WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
																			   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
																	USING		sqlca;
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
																	USING		sqlca;
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
											else
												rollback;
											end if
				
										CASE "2" //resciliacion por reprogramacion
											UPDATE	"SOL_RESCILIA_REPROG"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_RESCILIA_REPROG"."BASE" = (  SELECT	"SOL_ESTATUS"."BASE"  
																										 FROM 	"SOL_ESTATUS"  
																										 WHERE 	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																													( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																													( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																													( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																													( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																													( "SOL_ESTATUS"."ESTADO_REG" = 'A' ))  AND
														"SOL_RESCILIA_REPROG"."SERIE" = :gs_serie AND
														"SOL_RESCILIA_REPROG"."NUMERO" = :gi_numero AND
														"SOL_RESCILIA_REPROG"."CORRELATIVO" = :ll_corr
																
											Using		sqlca ;
											if sqlca.sqlcode=0 then
												commit;
												// cambiar valores
												if gs_base='L' then
													SELECT	"ANEXO_LIBERADOR"."BASE",   
																"ANEXO_LIBERADOR"."SERIE",   
																"ANEXO_LIBERADOR"."NRO_OFERTA"  
													INTO 		:ls_base,   
																:ls_serie,   
																:ll_numero  
													FROM 	"ANEXO_LIBERADOR",   
																"PAGO_LIBERADOR"  
													WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
															 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
															 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
															 (("ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
															 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) )   
													using		sqlca;
													if sqlca.sqlcode=0 then
														CHOOSE CASE ls_base
															CASE 'O'
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
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	if ll_cta_pag_m>=99 then
																		ll_ctas		= ll_cta_pag_m - 99  
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
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	if ll_cta_pag_m>=99 then
																		ll_ctas	= ll_cta_pag_m - 99  
																		UPDATE	"CONTRATO"  
																		SET 		"ANEXO_LIB" = '',   
																					"CTA_PAG_M" = :ll_ctas  
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
																	ll_ctas	= 0
																	UPDATE	"OFERTA_V"  
																	SET 		"ANEXO_AUMENTO" = '',   
																				"CTA_PAG_M" = :ll_ctas
																	WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
																			   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
																	USING		sqlca;
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
																	USING		sqlca;
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
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	ll_ctas	= ll_cta_pag_m - ll_ctas_en_mora  
																	UPDATE	"CONTRATO"  
																	SET 		"ANEXO_REPACTA" = '',   
																				"CTA_PAG_M" = :ll_ctas  ,
																				"CTA_REPACTA" = 0
																	WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
																			   ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
																	USING		sqlca;
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
											else
												rollback;
											end if
				
										CASE "3" // reactivacion ctto.
											UPDATE	"SOL_REACTIVA"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_REACTIVA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																							  FROM 	"SOL_ESTATUS"  
																							  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																										( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																										( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																										( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_REACTIVA"."SERIE" = :gs_serie AND
														"SOL_REACTIVA"."NUMERO" = :gi_numero AND
														"SOL_REACTIVA"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
												//Nuevo
												if gs_base='L' then
													SELECT	"ANEXO_LIBERADOR"."BASE",   
																"ANEXO_LIBERADOR"."SERIE",   
																"ANEXO_LIBERADOR"."NRO_OFERTA"  
													INTO 		:ls_base,   
																:ls_serie,   
																:ll_numero  
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
															CASE 'O'
																SELECT	"OFERTA_V"."CTA_PAG_M"  
																INTO 		:ll_ctas_pag_m  
																FROM 	"OFERTA_V",   
																			"PAGO_OFERTA"  
																WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
																		   ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
																		   ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
																		   (("OFERTA_V"."SERIE" = :ls_serie ) AND  
																		   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )   
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	if ll_ctas_pag_m < 99 then
																		ll_ctas			= 99 + ll_ctas_pag_m
																		ls_anexo_lib	= gs_base+gs_serie+string(gi_numero)
																		UPDATE	"OFERTA_V"  
																		SET 		"CTA_PAG_M" = :ll_ctas,   
																					"ANEXO_LIB" = :ls_anexo_lib  
																		WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
																				   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
																		USING		sqlca;
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
																USING		sqlca;
																if sqlca.sqlcode=0 then
																	if ll_ctas_pag_m < 99 then
																		ll_ctas			= 99 + ll_ctas_pag_m
																		ls_anexo_lib		= gs_base+gs_serie+string(gi_numero)
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
																	ls_anexo_lib			= gs_base+gs_serie+string(gi_numero)
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
																	ls_anexo_lib		= gs_base+gs_serie+string(gi_numero)
																	UPDATE	"CONTRATO"  
																	SET 		"CTA_AUMENTO" = :ll_ctas,   
																				"ANEXO_AUMENTO" = :ls_anexo_lib  
																	WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
																			   ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
																	USING		sqlca;
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
																SELECT	"OFERTA_V"."CTA_PAG_M"  
																INTO 		:ll_ctas_repacta  
																FROM 	"OFERTA_V",   
																			"PAGO_OFERTA"  
																WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
																		 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
																		 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
																		 (("OFERTA_V"."SERIE" = :ls_serie ) AND  
																		 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )  
																USING		sqlca;
																if sqlca.sqlcode=0 then
																	ls_anexo_repacta	= gs_base+gs_serie+string(gi_numero)
																	ll_ctas				= ll_ctas_repacta + ll_ctas_en_mora
																	UPDATE	"OFERTA_V"  
																	SET 		"ANEXO_REPACTA" = :ls_anexo_repacta,   
																				"CTA_PAG_M" = :ll_ctas,
																				"CTA_REPACTA" = :ll_ctas_en_mora  
																	WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
																			   ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
																	USING		sqlca;
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
																	USING		sqlca;
																	if sqlca.sqlcode=0 then
																		commit;
																	else
																		rollback;
																	end if
																end if
														END CHOOSE
													end if
												end if
											else
												rollback;
											end if
				
										CASE "4" // Seguro Desgravamen
											UPDATE	"SOL_SEGURO_DESG"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_SEGURO_DESG"."BASE" = (   SELECT	"SOL_ESTATUS"."BASE"  
																									  FROM 	"SOL_ESTATUS"  
																									  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																												( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																												( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																												( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																												( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																												( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_SEGURO_DESG"."SERIE" = :gs_serie AND
														"SOL_SEGURO_DESG"."NUMERO" = :gi_numero AND
														"SOL_SEGURO_DESG"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
				
										CASE "5" // REPACTA COMPRAVENTA
											UPDATE	"SOL_REPACTA_CVTA"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_REPACTA_CVTA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																									  FROM 	"SOL_ESTATUS"  
																									  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																												( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																												( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																												( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																												( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																												( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_REPACTA_CVTA"."SERIE" = :gs_serie AND
														"SOL_REPACTA_CVTA"."NUMERO" = :gi_numero AND
														"SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
												messagebox("Advertencia","Recuerde solo puede actualizar PROMESAS")
											else
												rollback;
											end if
				
										CASE "6" // titulo de dominio
											if gs_base='C' or gs_base='O' then
												UPDATE	"SOL_TIT_DOMINIO"  
												SET 		"ESTATUS_INFORMATICA" = 0,   
															"USUARIO_INFOR" = :gs_user,   
															"FECHA_INFOR" = :ldt_fecha  
												WHERE 	"SOL_TIT_DOMINIO"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																									  FROM 	"SOL_ESTATUS"  
																									  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																												( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																												( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																												( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																												( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																												( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
															"SOL_TIT_DOMINIO"."SERIE" = :gs_serie AND
															"SOL_TIT_DOMINIO"."NUMERO" = :gi_numero AND
															"SOL_TIT_DOMINIO"."CORRELATIVO" = :ll_corr
												Using		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											end if
				
										CASE "7" // contrato definitivo
											UPDATE	"SOL_CONTRATO_DEF"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_CONTRATO_DEF"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																									  FROM 	"SOL_ESTATUS"  
																									  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																												( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																												( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																												( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																												( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																												( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_CONTRATO_DEF"."SERIE" = :gs_serie AND
														"SOL_CONTRATO_DEF"."NUMERO" = :gi_numero AND
														"SOL_CONTRATO_DEF"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
				
										CASE "8" // entrega pagare
											UPDATE	"SOL_ENTREGA_PAG"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_ENTREGA_PAG"."BASE" = (SELECT  "SOL_ESTATUS"."BASE"  
																								  FROM 	  "SOL_ESTATUS"  
																								  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																											( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																											( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																											( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																											( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																											( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_ENTREGA_PAG"."SERIE" = :gs_serie AND
														"SOL_ENTREGA_PAG"."NUMERO" = :gi_numero AND
														"SOL_ENTREGA_PAG"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
			
										CASE "10" // transferencia
											UPDATE	"SOL_TRANSFERENCIA"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_TRANSFERENCIA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																									  FROM 	"SOL_ESTATUS"  
																									  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																												( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																												( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																												( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																												( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																												( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_TRANSFERENCIA"."SERIE" = :gs_serie AND
														"SOL_TRANSFERENCIA"."NUMERO" = :gi_numero AND
														"SOL_TRANSFERENCIA"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
										CASE "11" // RESOLUCION
											UPDATE	"SOL_RESOLUCION"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_RESOLUCION"."BASE" = (  SELECT	  "SOL_ESTATUS"."BASE"  
																								  FROM 	  "SOL_ESTATUS"  
																								  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																											( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																											( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																											( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																											( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																											( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_RESOLUCION"."SERIE" = :gs_serie AND
														"SOL_RESOLUCION"."NUMERO" = :gi_numero AND
														"SOL_RESOLUCION"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
										CASE "12"
											UPDATE	"SOL_MOD_ANTECE"  
											SET 		"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha,   
														"ESTATUS_INFORMATICA" = 0  
											WHERE 	"SOL_MOD_ANTECE"."RUT" = :gi_numero   AND
														"SOL_MOD_ANTECE"."CORRELATIVO" = :il_correlativo
											USING	sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
										CASE "13" // cambio estado
											UPDATE	"SOL_CAMBIO_ESTADO"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_CAMBIO_ESTADO"."BASE" = (    SELECT	  "SOL_ESTATUS"."BASE"  
																										  FROM 	  "SOL_ESTATUS"  
																										  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																													( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																													( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																													( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																													( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																													( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_CAMBIO_ESTADO"."SERIE" = :gs_serie AND
														"SOL_CAMBIO_ESTADO"."NUMERO" = :gi_numero AND
														"SOL_CAMBIO_ESTADO"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										
										CASE "14" // cambio estado TITULO
											UPDATE	"SOL_CAMBIO_ESTADO_TITULAR"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_CAMBIO_ESTADO_TITULAR"."BASE" = (   SELECT	  "SOL_ESTATUS"."BASE"  
																													  FROM 	  "SOL_ESTATUS"  
																													  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																																( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																																( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																																( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																																( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																																( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_CAMBIO_ESTADO_TITULAR"."SERIE" = :gs_serie AND
														"SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" = :gi_numero AND
														"SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										
										CASE "15" // Seguro
											UPDATE	"SOL_SEGURO"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_SEGURO"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																						   FROM 		"SOL_ESTATUS"  
																						   WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																									    ( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																										( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																										( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_SEGURO"."SERIE" = :gs_serie AND
														"SOL_SEGURO"."NUMERO" = :gi_numero AND
														"SOL_SEGURO"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
										CASE "16" // NOVACION
											UPDATE	"SOL_NOVACION"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_NOVACION"."BASE" = ( SELECT  "SOL_ESTATUS"."BASE"  
																							  FROM 	  "SOL_ESTATUS"  
																							  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																										( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																										( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																										( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_NOVACION"."SERIE" = :gs_serie AND
														"SOL_NOVACION"."NUMERO" = :gi_numero AND
														"SOL_NOVACION"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
										CASE "17"
											UPDATE	"SOL_COPROP_PROMESA"  
											SET 		"ESTATUS_INFOR" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_COPROP_PROMESA"."BASE" = (  SELECT  "SOL_ESTATUS"."BASE"  
																										  FROM 	  "SOL_ESTATUS"  
																										  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																													( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																													( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																													( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																													( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																													( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_COPROP_PROMESA"."SERIE" = :gs_serie AND
														"SOL_COPROP_PROMESA"."NUMERO" = :gi_numero AND
														"SOL_COPROP_PROMESA"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
										CASE "18"
											UPDATE	"SOL_ULTIMA_VOLUNTAD"  
											SET 		"ESTATUS_INFOR" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_ULTIMA_VOLUNTAD"."BASE" = ( SELECT  "SOL_ESTATUS"."BASE"  
																										  FROM 	  "SOL_ESTATUS"  
																										  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																													( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																													( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																													( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																													( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																													( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_ULTIMA_VOLUNTAD"."SERIE" = :gs_serie AND
														"SOL_ULTIMA_VOLUNTAD"."NUMERO" = :gi_numero AND
														"SOL_ULTIMA_VOLUNTAD"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
										CASE "19" // POSESION EFECTIVA
											UPDATE	"SOL_POS_EFEC"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_POS_EFEC"."BASE" =  (  SELECT  "SOL_ESTATUS"."BASE"  
																								FROM 	  "SOL_ESTATUS"  
																								WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																										( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																										( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																										( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_POS_EFEC"."SERIE" = :gs_serie AND
														"SOL_POS_EFEC"."NUMERO" = :gi_numero AND
														"SOL_POS_EFEC"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
										CASE "20" // PAC
											UPDATE	"SOL_PAC"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_PAC"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																					  FROM 	"SOL_ESTATUS"  
																					  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																								( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																								( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																								( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_PAC"."SERIE" = :gs_serie AND
														"SOL_PAC"."NUMERO" = :gi_numero AND
														"SOL_PAC"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
										CASE "22" // Seguro FALLECIMIENTO
											UPDATE	"SOL_SEGURO_FALLECE"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_SEGURO_FALLECE"."BASE" = (   SELECT	  "SOL_ESTATUS"."BASE"  
																										  FROM 	  "SOL_ESTATUS"  
																										  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																													( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																													( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																													( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																													( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																													( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_SEGURO_FALLECE"."SERIE" = :gs_serie AND
														"SOL_SEGURO_FALLECE"."NUMERO" = :gi_numero AND
														"SOL_SEGURO_FALLECE"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
										CASE "23" // en demanda
											UPDATE	"SOL_EN_DEMANDA"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_EN_DEMANDA"."BASE" = (    SELECT	  "SOL_ESTATUS"."BASE"  
																										  FROM 	  "SOL_ESTATUS"  
																										  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																													( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																													( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																													( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																													( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																													( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_EN_DEMANDA"."SERIE" = :gs_serie AND
														"SOL_EN_DEMANDA"."NUMERO" = :gi_numero AND
														"SOL_EN_DEMANDA"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										CASE "24" // Bono Fraterno
											UPDATE	"SOL_BONO_FRATERNO"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_BONO_FRATERNO"."BASE" = (   SELECT	"SOL_ESTATUS"."BASE"  
																									  FROM 	"SOL_ESTATUS"  
																									  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																												( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																												( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																												( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																												( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																												( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_BONO_FRATERNO"."SERIE" = :gs_serie AND
														"SOL_BONO_FRATERNO"."NUMERO" = :gi_numero AND
														"SOL_BONO_FRATERNO"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if	
										CASE "25" // Mantención Perpetua
											UPDATE	"SOL_MANT_PERPETUA"  
											SET 		"ESTATUS_INFORMATICA" = 0,   
														"USUARIO_INFOR" = :gs_user,   
														"FECHA_INFOR" = :ldt_fecha  
											WHERE 	"SOL_MANT_PERPETUA"."BASE" = (   SELECT	"SOL_ESTATUS"."BASE"  
																									  FROM 	"SOL_ESTATUS"  
																									  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																												( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																												( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																												( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																												( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																												( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
														"SOL_MANT_PERPETUA"."SERIE" = :gs_serie AND
														"SOL_MANT_PERPETUA"."NUMERO" = :gi_numero AND
														"SOL_MANT_PERPETUA"."CORRELATIVO" = :ll_corr
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if		
									END CHOOSE
			
									//	"FECHA_RES" = Null 
									if ls_cod_sol="1" or ls_cod_sol="2" then
										if isvalid(w_ingreso_fecha_res) then close(w_ingreso_fecha_res)
										openwithparm(w_ingreso_fecha_res,ls_cod_sol)
	
									elseif ls_cod_sol="3" then // actualizar cadena estado en case de reactivacion ctto.
										ls_estado			= 'V'
										UPDATE	 "CADENA"  
										SET 		 "ESTADO" = :ls_estado   
										WHERE 	("CADENA"."CODIGO" = :gs_base ) AND  
													("CADENA"."SERIE" = :gs_serie ) AND  
													("CADENA"."NUMERO" = :gi_numero )   
										Using		sqlca ;
										if sqlca.sqlcode=0 then
											commit;
											if gs_base='L' then
												SELECT	"ANEXO_LIBERADOR"."BASE",   
															"ANEXO_LIBERADOR"."SERIE",   
															"ANEXO_LIBERADOR"."NRO_OFERTA"  
												INTO 		:ls_base,   
															:ls_serie,   
															:ll_numero  
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
														CASE 'O'
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
																if ll_ctas_pag_m < 99 then
																	ll_ctas			= 99 + ll_ctas_pag_m
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
																if ll_ctas_pag_m < 99 then
																	ll_ctas			= 99 + ll_ctas_pag_m
																	ls_anexo_lib		= gs_base+gs_serie+string(gi_numero)
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
															USING		sqlca;
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
															USING		sqlca;
															if sqlca.sqlcode=0 then
																ls_anexo_repacta	= gs_base+gs_serie+string(gi_numero)
																ll_ctas				= ll_ctas_repacta + ll_ctas_en_mora
																UPDATE	"CONTRATO"  
																SET 		"ANEXO_REPACTA" = :ls_anexo_repacta,   
																			"CTA_PAG_M" = :ll_ctas,
																			"CTA_REPACTA" = :ll_ctas_en_mora  
																WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
																		 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
																USING		sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																end if
															end if
													END CHOOSE
												end if
											end if
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
				
									elseif ls_cod_sol="4" then //SEGURO DESGRAVAMEN
										UPDATE	"CADENA"  
										SET 		"ESTADO" = 'S'  
										WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
												 ( "CADENA"."SERIE" = :gs_serie ) AND  
												 ( "CADENA"."NUMERO" = :gi_numero )   
										USING	sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
	
									elseif ls_cod_sol="5" then //REPACTA COMPRAVENTA
										// sacar fechas
										wf_grabar_repacta_compraventa()
				
									elseif ls_cod_sol="6" then //titulo de dominio
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
													FROM 	"CADENA",   "CIUDAD",   "CLIENTE",   "COMUNA",   "CONTRATO",   "GERENTE_OPERACIONES",	"TIPO_VIA"  
													WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
															 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
															 ( "CONTRATO"."RUT" = "CLIENTE"."RUT" ) and  
															 ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA") and
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
														if ll_correlativo>0 then
															ll_correlativo ++
														else
															ll_correlativo				= 1
														end if
														ls_nombre_cliente				= ls_nom+ ' ' +ls_ap_pat+ ' '+ls_ap_mat
														ls_tipo_construccion			= 'T'
														ls_total_pagado_palabras	= sle_1.uo_convertir_numero(string(ll_total_pagado))
														ls_fecha_promesa_palabas	= wf_fecha_palabra(date(ldt_fecha_promesa))
														INSERT INTO		"PROCESO_TITULO_ISACRUZ"  
																		( "CORRELATIVO",		"NRO_LIBRO",	"FOJA",		"ROLA",	"TRATO",		"RUT",	"DV",		"NOMBRE_CLIENTE",		"NRO_SEPULTURA",		"SECTOR",	"AREA",		"CAPACIDAD",	"TIPO_CONSTRUCCION",		"BASE",		"SERIE",		"NUMERO",	"FECHA_PROMESA",		"DIRECCION_P",		"NRO_PARTICULAR",		"DEPTO_PARTICULAR",		"BLOCK_PARTICULAR",		"COMUNA",	"CIUDAD",	"POBLACION",	"ESTADO_CIVIL",	"USUARIO",	"TOTAL_PAGADO",	"TOTAL_PAGADO_PALABRAS",	"ESTADO_CONTRATO",	"COD_PARQUE",		"FECHA_PROMESA_PALABRAS",	"RUT_GERENTE_OPERACIONES",		"FECHA_MANT",		"TIPO_VIA"	 ) 
														VALUES 		( :ll_correlativo,	0,					0,				0,			:ls_trato,	:ll_rut,	:ls_dv,	:ls_nombre_cliente,	:ls_nro_sepultura,	:ls_sector,	:ls_area,	:ll_capacidad,	:ls_tipo_construccion,	:gs_base,	:gs_serie,	:gi_numero,	:ldt_fecha_promesa,	:ls_direccion_p,	:ls_nro_particular,	:ls_depto_particular,	:ls_block_particular,	:ls_comuna,	:ls_ciudad,	:ls_poblacion,	:ls_estado_civil,	:gs_user,	:ll_total_pagado,	:ls_total_pagado_palabras,	:ls_estado_contrato,	:ll_cod_parque,	:ls_fecha_promesa_palabas,	:ll_rut_gerente_operaciones,	:ldt_fecha_mant,	:ls_tipo_via_titulo)  
														USING			sqlca;
														if sqlca.sqlcode=0 then
															commit;
														else
															rollback;
														end if
													end if
												end if
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
										end if
										
									elseif ls_cod_sol="7" then //contrato definitivo
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
												CASE 'O'
													SELECT	"OFERTA_V"."CTA_PAG_S",   "OFERTA_V"."CTA_PAG_M",   "PAGO_OFERTA"."FECHA_PRIM",	"PAGO_OFERTA"."NRO_CUOTAS",	"OFERTA_V"."FECHA_M",	"CADENA"."ESTADO"
													INTO 		:cta_pag_s,   				  :cta_pag_m,   				 :fecha_prim, 						:nro_cuotas,						:fecha_man,					:ls_estado_cadena
													FROM 	"OFERTA_V",   
																"PAGO_OFERTA",
																"CADENA"
													WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
															 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
															 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and 
															 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
															 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
															 ( ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
															 ( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) )   
													Using		sqlca;
													if sqlca.sqlcode=0 then
														RET 				= funcion_mora(fecha_prim,cta_pag_s,nro_cuotas,ls_estado_cadena)
												/// codigo nuevo
														fecha_vto		= datetime(funcion_venc( fecha_prim , cta_pag_s ))   //<--
														dias 				= - daysafter (idt_fecha_hoy,date(fecha_vto))
														if dias <= 5 then ret = 0    //<--
												/// fin codigo
														ret1 				= f_mant (fecha_man, cta_pag_m)
														ret11 				= -daysafter(idt_fecha_hoy,funcion_venc_ano( fecha_man , cta_pag_m  ))
														if ret11 < 0 then 
															ret1			= 0
														end if
														if ret <= 0 then
															ret				= 0 //mora_credito
														end if
														ll_mora_credito	= ret
				
														if ret1 <= 0 then
															ret1			= 0 //mora mantencion
														end if	
														ll_mora_mant	= ret1
													end if
													
												CASE 'C'
													SELECT	"CONTRATO"."CTA_PAG_M",   "CONTRATO"."FECHA_M"  
													INTO 		:cta_pag_m,   				  :fecha_prim  
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
													SELECT	"PAGO_LIBERADOR"."NRO_CUOTAS",   "PAGO_LIBERADOR"."FECHA_PRIM",   "ANEXO_LIBERADOR"."CTA_PAG_M"  ,	"CADENA"."ESTADO"
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
													
												CASE 'F'
													SELECT	"PRODUCTO_PAGO"."PLAZO",   "PRODUCTO_PAGO"."FECHA_PRIM",   "PRODUCTO_ANEXO"."CUOTAS_PAG"  ,	"CADENA"."ESTADO"
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
													SELECT	"PAGARE"."FECHA_PRIM",   "PAGARE"."PLAZO",   "PAGARE"."CTA_PAG_LA",   "PAGARE"."CTA_PAG_ISA"  ,	"CADENA"."ESTADO"
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
														ll_mora_credito		= 0
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
													SELECT	"DERECHO"."FECHA_PRIM",   "DERECHO"."PLAZO",   "DERECHO"."CTA_PAG_LA",   "DERECHO"."CTA_PAG_ISA"  ,	"CADENA"."ESTADO"
													INTO 		:fecha_prim,   			  :nro_cuotas,   		  :cta_pag_la,   				 :cta_pag_isa  ,					:ls_estado_cadena
													FROM 	"CADENA",   
																"DERECHO"  
													WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
															 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
															 (("CADENA"."CODIGO" = :gs_base ) AND  
															 ( "DERECHO"."SERIE_P" = :gs_serie ) AND  
															 ( "DERECHO"."NRO_PAGARE" = :gi_numero ) )   
													Using		sqlca;
													if sqlca.sqlcode=0 then
														ll_mora_credito		= 0
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
													SELECT	"REPACTA_MANTENCION"."CUOTAS_PACTADAS",   "REPACTA_MANTENCION"."FECHA_PRIMERA_CTA",   "REPACTA_MANTENCION"."CTAS_PAGADAS"  ,	"CADENA"."ESTADO"
													INTO 		:nro_cuotas,   									:fecha_prim,   									  :cta_pag_s  ,									:ls_estado_cadena
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
														ll_mora_credito		= 0
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
											VALUES   ( :gs_base, :gs_serie, :gi_numero, :ll_rut, :gs_base,   	  '0',   			:ldt_fecha,   	  :ll_mora_credito,  '8',   			 :ll_corr,   		:ll_mora_mant, '0' )  
											Using		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										end if
				
									elseif ls_cod_sol="8" then //ENTREGA PAGARE
										// no hacer nada
			
									elseif ls_cod_sol="9" then //CERTIFICADOS VARIOS
										// no hace nada
			
									elseif ls_cod_sol="10" or ls_cod_sol="16" or ls_cod_sol="19" then //TRANSFERENCIA o NOVACION o POSESION EFCTIVA
										wf_grabar_transferencia()
			
									elseif ls_cod_sol="11" then //resolucion
										// falta
			
									elseif ls_cod_sol="12" then //solicitud Mod. Antecedentes cliente
										ls_est_mod	= 'N'
										ls_est_cob	= '0'
										SELECT	"SOL_MOD_ANTECE"."DIRECCION_P_NUEVA",   "SOL_MOD_ANTECE"."POBLACION_NUEVA",   "SOL_MOD_ANTECE"."SECTOR_NUEVA",   "SOL_MOD_ANTECE"."COMUNA_NUEVA",   "SOL_MOD_ANTECE"."CIUDAD_NUEVA",   "SOL_MOD_ANTECE"."FONO_P_NUEVA",   "SOL_MOD_ANTECE"."FECHA_NAC_NUEVA",   "SOL_MOD_ANTECE"."ESTADO_CIVIL_NUEVA",   "SOL_MOD_ANTECE"."DOMICILIO_C_NUEVA",   "SOL_MOD_ANTECE"."FONO_C_NUEVA",   "SOL_MOD_ANTECE"."TOTAL_RENTA_NUEVA",   "SOL_MOD_ANTECE"."GRUPO_F_NUEVA",   "SOL_MOD_ANTECE"."ESTADO_COB_NUEVA",   "SOL_MOD_ANTECE"."NOMBRE_NUEVA",   "SOL_MOD_ANTECE"."AP_PATERNO_NUEVA",   "SOL_MOD_ANTECE"."AP_MATERNO_NUEVA",   "SOL_MOD_ANTECE"."TIPO_VIA_NUEVA",  "SOL_MOD_ANTECE"."NUMERO_PARTICULAR_NUEVA",  "SOL_MOD_ANTECE"."DEPTO_NUEVA",  "SOL_MOD_ANTECE"."BLOCK_NUEVA"  
										INTO 		:ls_dir_p,   									:ls_pob,   										:ls_sector,   								:ls_comuna,   							 :ls_ciudad,   							:ls_fono_p,   								:ldt_fec_nac,   							 :ls_est_civil,   								:ls_dir_c,   									 :ls_fono_c,   							:ll_renta,   									 :ll_grupo_f,   							 :ls_est_cob,   								 :ls_nombre,   							:ls_ap_pat,   									:ls_ap_mat,										:ls_tipo_via,								:ls_nro_part,											:ls_depto_part,						:ls_block_part
										FROM 	"SOL_MOD_ANTECE"  
										WHERE 	"SOL_MOD_ANTECE"."RUT" = :gi_numero  AND 
													"SOL_MOD_ANTECE"."CORRELATIVO" = :il_correlativo
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
											WHERE 	"CLIENTE"."RUT" = :gi_numero   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
												UPDATE	"CLIENTE_DEUDOR_TERCERO"  
												SET 		"NOMBRE" = :ls_nombre,   
															"A_PATERNO" = :ls_ap_pat,   
															"A_MATERNO" = :ls_ap_mat,   
															"DIRECCION_P" = :ls_dir_p,   
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
															"ESTADO_COBRANZA" = :ls_est_cob,  
															"TIPO_VIA" = :ls_tipo_via,
															"NUMERO_PARTICULAR" = :ls_nro_part,
															"DEPTO_PARTICULAR" = :ls_depto_part,
															"BLOCK_PARTICULAR" = :ls_block_part
												WHERE 	"CLIENTE_DEUDOR_TERCERO"."RUT" = :gi_numero   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
											else
												rollback;
											end if
										end if
									elseif ls_cod_sol="13" then // CAMBIO ESTADO
										SELECT	"SOL_CAMBIO_ESTADO"."ESTADO_CTTO_FINAL"  
										INTO 		:ls_estado  
										FROM 	"SOL_CAMBIO_ESTADO",   
													"SOL_ESTATUS"  
										WHERE  ( "SOL_CAMBIO_ESTADO"."BASE" = "SOL_ESTATUS"."BASE" ) and  
												 ( "SOL_CAMBIO_ESTADO"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
												 ( "SOL_CAMBIO_ESTADO"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
												 ( "SOL_CAMBIO_ESTADO"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
												 (("SOL_CAMBIO_ESTADO"."BASE" = :gs_base ) AND  
												 ( "SOL_CAMBIO_ESTADO"."SERIE" = :gs_serie ) AND  
												 ( "SOL_CAMBIO_ESTADO"."NUMERO" = :gi_numero ) AND  
												 ( "SOL_CAMBIO_ESTADO"."CORRELATIVO" = :il_correlativo ) AND  
												 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											UPDATE	 "CADENA"  
											SET 		 "ESTADO" = :ls_estado,
														 "FECHA_RES" = :ldt_fecha_hoy
											WHERE 	("CADENA"."CODIGO" = :gs_base ) AND  
														("CADENA"."SERIE" = :gs_serie ) AND  
														("CADENA"."NUMERO" = :gi_numero )   
											Using		sqlca ;
											if sqlca.sqlcode=0 then
												commit;
												wf_actualizar_cadena_estado(ls_estado)
											else
												rollback;
											end if
										end if
										
									elseif ls_cod_sol="14" then // CAMBIO ESTADO TITULAR
										SELECT	"SOL_CAMBIO_ESTADO_TITULAR"."ESTADO_CTTO_FINAL"  
										INTO 		:ls_estado  
										FROM 	"SOL_CAMBIO_ESTADO_TITULAR",   
													"SOL_ESTATUS"  
										WHERE  ( "SOL_CAMBIO_ESTADO_TITULAR"."BASE" = "SOL_ESTATUS"."BASE" ) and  
												 ( "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
												 ( "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
												 ( "SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
												 (("SOL_CAMBIO_ESTADO_TITULAR"."BASE" = :gs_base ) AND  
												 ( "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" = :gs_serie ) AND  
												 ( "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" = :gi_numero ) AND  
												 ( "SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" = :il_correlativo ) AND  
												 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											UPDATE	"CLIENTE"  
											SET 		"ESTADO_TITULAR" = :ls_estado
											WHERE 	"CLIENTE"."RUT" = :ll_rut   
											USING	sqlca  ;
											if sqlca.sqlcode=0 then
												commit;
												wf_actualizar_cadena_estado(ls_estado)
											else
												rollback;
											end if
										end if
									elseif ls_cod_sol="15" then
										// no hacer nada
									elseif ls_cod_sol="17" then
										wf_grabar_todos_coprop_promesa()
									elseif ls_cod_sol="18" then
										wf_grabar_todos_ultima_voluntad()
									elseif ls_cod_sol="22" then //SEGURO FALLECE
										UPDATE	"CADENA"  
										SET 		"ESTADO" = 'S'  
										WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
												 ( "CADENA"."SERIE" = :gs_serie ) AND  
												 ( "CADENA"."NUMERO" = :gi_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									elseif ls_cod_sol="23" then // EN DEMANDA
										SELECT	"SOL_EN_DEMANDA"."ESTADO_CTTO_FINAL"  
										INTO 		:ls_estado  
										FROM 	"SOL_EN_DEMANDA",   
													"SOL_ESTATUS"  
										WHERE  ( "SOL_EN_DEMANDA"."BASE" = "SOL_ESTATUS"."BASE" ) and  
												 ( "SOL_EN_DEMANDA"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
												 ( "SOL_EN_DEMANDA"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
												 ( "SOL_EN_DEMANDA"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
												 (("SOL_EN_DEMANDA"."BASE" = :gs_base ) AND  
												 ( "SOL_EN_DEMANDA"."SERIE" = :gs_serie ) AND  
												 ( "SOL_EN_DEMANDA"."NUMERO" = :gi_numero ) AND  
												 ( "SOL_EN_DEMANDA"."CORRELATIVO" = :il_correlativo ) AND  
												 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											UPDATE	 "CADENA"  
											SET 		 "ESTADO" = :ls_estado,
														 "FECHA_RES" = :ldt_fecha_hoy
											WHERE 	("CADENA"."CODIGO" = :gs_base ) AND  
														("CADENA"."SERIE" = :gs_serie ) AND  
														("CADENA"."NUMERO" = :gi_numero )   
											Using		sqlca ;
											if sqlca.sqlcode=0 then
												commit;
												/////////////////nuevo
												if ls_estado = 'M' then
													ls_estado_at_pub		= '42'
													ls_glosa					= 'CONTRATO N° '+gs_base+gs_serie+string(gi_numero)+ 'SE CAMBIA ESTADO M-EN DEMANDA EL DIA '+string(gdt_fec_sistema,'dd/mm/yyyy hh:mm')
												elseif ls_estado = 'B' then
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
												
												// Insertar Funcion Cambio Cartera
												SELECT  "ENCARGADOS"."CODIGO_USUARIO"  
												INTO     :ls_cobrador
												FROM   "ENCARGADOS"  
												WHERE "ENCARGADOS"."TIPO_COBRANZA_TERRENO" = 'J' AND "ENCARGADOS"."ESTADO" = 'A'
												USING  sqlca;
												if not isnull(ls_cobrador) then
													f_demanda_cliente_cartera(gs_base,gs_serie,gi_numero,ls_cobrador)
												end if
//												f_demanda_cliente_cartera(gs_base,gs_serie,gi_numero,'ET30')
												wf_actualizar_cadena_estado(ls_estado)
											else
												rollback;
											end if
										end if
									elseif ls_cod_sol="24" then //Bono Fraterno
										
									elseif ls_cod_sol="25" then //Mantención Perpetua
										
									end if
									if ls_est_mod='S' and ls_cod_sol<>"12" then
										ll_resp				= messagebox("Advertencia","Antecedente Cliente ha sido modificado, desea actualizar TABLA CLIENTE",Exclamation!,YesNo!,2)
										if ll_resp=1 then
											CHOOSE CASE ls_cod_sol
												CASE '1'
													SELECT	"SOL_RESCILIA_CLIENTE"."DIRECCION_P",   "SOL_RESCILIA_CLIENTE"."POBLACION",   "SOL_RESCILIA_CLIENTE"."SECTOR",   "SOL_RESCILIA_CLIENTE"."COMUNA",   "SOL_RESCILIA_CLIENTE"."CIUDAD",   "SOL_RESCILIA_CLIENTE"."FONO_P",   "SOL_RESCILIA_CLIENTE"."FECHA_NAC",   "SOL_RESCILIA_CLIENTE"."ESTADO_CIVIL",   "SOL_RESCILIA_CLIENTE"."DOMICILIO_C",   "SOL_RESCILIA_CLIENTE"."TOTAL_RENTA",   "SOL_RESCILIA_CLIENTE"."FONO_C",   "SOL_RESCILIA_CLIENTE"."GRUPO_F",   "SOL_RESCILIA_CLIENTE"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   									 :ls_pob,   									:ls_sector,   							  :ls_comuna,   							 :ls_ciudad,   							:ls_fono_p,   							  :ldt_fec_nac,   							 :ls_est_civil,   								:ls_dir_c,   									 :ll_renta,   									  :ls_fono_c,   							 :ll_grupo_f,   							 :ll_rut  
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
				
												CASE '2'
													SELECT	"SOL_RESCILIA_REPROG"."DIRECCION_P",   "SOL_RESCILIA_REPROG"."POBLACION",   "SOL_RESCILIA_REPROG"."SECTOR",   "SOL_RESCILIA_REPROG"."COMUNA",   "SOL_RESCILIA_REPROG"."CIUDAD",   "SOL_RESCILIA_REPROG"."FONO_P",   "SOL_RESCILIA_REPROG"."FECHA_NAC",   "SOL_RESCILIA_REPROG"."ESTADO_CIVIL",   "SOL_RESCILIA_REPROG"."DOMICILIO_C",   "SOL_RESCILIA_REPROG"."TOTAL_RENTA",   "SOL_RESCILIA_REPROG"."FONO_C",   "SOL_RESCILIA_REPROG"."GRUPO_F",   "SOL_RESCILIA_REPROG"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   									:ls_pob,   									 :ls_sector,   						  :ls_comuna,   							:ls_ciudad,   							 :ls_fono_p,   						  :ldt_fec_nac,   							:ls_est_civil,   								 :ls_dir_c,   									 :ll_renta,   									 :ls_fono_c,   						  :ll_grupo_f,   							 :ll_rut  
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
				
												CASE '3'
													SELECT	"SOL_REACTIVA"."DIRECCION_P",   "SOL_REACTIVA"."POBLACION",   "SOL_REACTIVA"."SECTOR",   "SOL_REACTIVA"."COMUNA",   "SOL_REACTIVA"."CIUDAD",   "SOL_REACTIVA"."FONO_P",   "SOL_REACTIVA"."FECHA_NAC",   "SOL_REACTIVA"."ESTADO_CIVIL",   "SOL_REACTIVA"."DOMICILIO_C",   "SOL_REACTIVA"."TOTAL_RENTA",   "SOL_REACTIVA"."FONO_C",   "SOL_REACTIVA"."GRUPO_F",   "SOL_REACTIVA"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   						  :ls_pob,   						  :ls_sector,   				  :ls_comuna,   				  :ls_ciudad,   				  :ls_fono_p,   				  :ldt_fec_nac,   				  :ls_est_civil,   					  :ls_dir_c,   						 :ll_renta,   							:ls_fono_c,   					:ll_grupo_f,   				 :ll_rut  
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
				
												CASE '4'
													SELECT	"SOL_SEGURO_DESG"."DIRECCION_P",   "SOL_SEGURO_DESG"."POBLACION",   "SOL_SEGURO_DESG"."SECTOR",   "SOL_SEGURO_DESG"."COMUNA",   "SOL_SEGURO_DESG"."CIUDAD",   "SOL_SEGURO_DESG"."FONO_P",   "SOL_SEGURO_DESG"."FECHA_NAC",   "SOL_SEGURO_DESG"."ESTADO_CIVIL",   "SOL_SEGURO_DESG"."DOMICILIO_C",   "SOL_SEGURO_DESG"."TOTAL_RENTA",   "SOL_SEGURO_DESG"."FONO_C",   "SOL_SEGURO_DESG"."GRUPO_F",   "SOL_SEGURO_DESG"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   					  :ldt_fec_nac,   					  :ls_est_civil,   						  :ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut
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
				
												CASE '5'
													SELECT	"SOL_REPACTA_CVTA"."DIRECCION_P",   "SOL_REPACTA_CVTA"."POBLACION",   "SOL_REPACTA_CVTA"."SECTOR",   "SOL_REPACTA_CVTA"."COMUNA",   "SOL_REPACTA_CVTA"."CIUDAD",   "SOL_REPACTA_CVTA"."FONO_P",   "SOL_REPACTA_CVTA"."FECHA_NAC",   "SOL_REPACTA_CVTA"."ESTADO_CIVIL",   "SOL_REPACTA_CVTA"."DOMICILIO_C",   "SOL_REPACTA_CVTA"."TOTAL_RENTA",   "SOL_REPACTA_CVTA"."FONO_C",   "SOL_REPACTA_CVTA"."GRUPO_F",   "SOL_REPACTA_CVTA"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   								:ls_pob,   								 :ls_sector,   					  :ls_comuna,   						:ls_ciudad,   						 :ls_fono_p,   					  :ldt_fec_nac,   						:ls_est_civil,   							 :ls_dir_c,   								 :ll_renta,   								 :ls_fono_c,   					  :ll_grupo_f,   						 :ll_rut  
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
				
												CASE '6'
													SELECT	"SOL_TIT_DOMINIO"."DIRECCION_P",   "SOL_TIT_DOMINIO"."POBLACION",   "SOL_TIT_DOMINIO"."SECTOR",   "SOL_TIT_DOMINIO"."COMUNA",   "SOL_TIT_DOMINIO"."CIUDAD",   "SOL_TIT_DOMINIO"."FONO_P",   "SOL_TIT_DOMINIO"."FECHA_NAC",   "SOL_TIT_DOMINIO"."ESTADO_CIVIL",   "SOL_TIT_DOMINIO"."DOMICILIO_C",   "SOL_TIT_DOMINIO"."TOTAL_RENTA",   "SOL_TIT_DOMINIO"."FONO_C",   "SOL_TIT_DOMINIO"."GRUPO_F",   "SOL_TIT_DOMINIO"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   						:ldt_fec_nac,   						:ls_est_civil,   							:ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut  
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
				
												CASE '7'
													SELECT	"SOL_CONTRATO_DEF"."DIRECCION_P",   "SOL_CONTRATO_DEF"."POBLACION",   "SOL_CONTRATO_DEF"."SECTOR",   "SOL_CONTRATO_DEF"."COMUNA",   "SOL_CONTRATO_DEF"."CIUDAD",   "SOL_CONTRATO_DEF"."FONO_P",   "SOL_CONTRATO_DEF"."FECHA_NAC",   "SOL_CONTRATO_DEF"."ESTADO_CIVIL",   "SOL_CONTRATO_DEF"."DOMICILIO_C",   "SOL_CONTRATO_DEF"."TOTAL_RENTA",   "SOL_CONTRATO_DEF"."FONO_C",   "SOL_CONTRATO_DEF"."GRUPO_F",   "SOL_CONTRATO_DEF"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   								:ls_pob,   								 :ls_sector,   					  :ls_comuna,   						:ls_ciudad,   						 :ls_fono_p,   					  :ldt_fec_nac,   						:ls_est_civil,   							 :ls_dir_c,   								 :ll_renta,   								 :ls_fono_c,   					  :ll_grupo_f,   						 :ll_rut  
													FROM 	"SOL_CONTRATO_DEF",   
																"SOL_ESTATUS"  
													WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_CONTRATO_DEF"."BASE" ) and  
															 ( "SOL_ESTATUS"."SERIE" = "SOL_CONTRATO_DEF"."SERIE" ) and  
															 ( "SOL_ESTATUS"."NUMERO" = "SOL_CONTRATO_DEF"."NUMERO" ) and  
															 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CONTRATO_DEF"."CORRELATIVO" ) and  
															 ( ( "SOL_CONTRATO_DEF"."BASE" = :gs_base ) AND  
															 ( "SOL_CONTRATO_DEF"."SERIE" = :gs_serie ) AND  
															 ( "SOL_CONTRATO_DEF"."NUMERO" = :gi_numero ) AND  
															 ( "SOL_CONTRATO_DEF"."CORRELATIVO" = :ll_corr ) AND  
															 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
													Using	sqlca;
				
												CASE '8'
													SELECT	"SOL_ENTREGA_PAG"."DIRECCION_P",   "SOL_ENTREGA_PAG"."POBLACION",   "SOL_ENTREGA_PAG"."SECTOR",   "SOL_ENTREGA_PAG"."COMUNA",   "SOL_ENTREGA_PAG"."CIUDAD",   "SOL_ENTREGA_PAG"."FONO_P",   "SOL_ENTREGA_PAG"."FECHA_NAC",   "SOL_ENTREGA_PAG"."ESTADO_CIVIL",   "SOL_ENTREGA_PAG"."DOMICILIO_C",   "SOL_ENTREGA_PAG"."TOTAL_RENTA",   "SOL_ENTREGA_PAG"."FONO_C",   "SOL_ENTREGA_PAG"."GRUPO_F",   "SOL_ENTREGA_PAG"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   					  :ldt_fec_nac,   					  :ls_est_civil,   							:ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut  
													FROM 	"SOL_ENTREGA_PAG",   
																"SOL_ESTATUS"  
													WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_ENTREGA_PAG"."BASE" ) and  
															 ( "SOL_ESTATUS"."SERIE" = "SOL_ENTREGA_PAG"."SERIE" ) and  
															 ( "SOL_ESTATUS"."NUMERO" = "SOL_ENTREGA_PAG"."NUMERO" ) and  
															 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_ENTREGA_PAG"."CORRELATIVO" ) and  
															 ( ( "SOL_ENTREGA_PAG"."BASE" = :gs_base ) AND  
															 ( "SOL_ENTREGA_PAG"."SERIE" = :gs_serie ) AND  
															 ( "SOL_ENTREGA_PAG"."NUMERO" = :gi_numero ) AND  
															 ( "SOL_ENTREGA_PAG"."CORRELATIVO" = :ll_corr ) AND  
															 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
													Using	sqlca;
				
												CASE '10'
													SELECT	"SOL_TRANSFERENCIA"."DIRECCION_P",   "SOL_TRANSFERENCIA"."POBLACION",   "SOL_TRANSFERENCIA"."SECTOR",   "SOL_TRANSFERENCIA"."COMUNA",   "SOL_TRANSFERENCIA"."CIUDAD",   "SOL_TRANSFERENCIA"."FONO_P",   "SOL_TRANSFERENCIA"."FECHA_NAC",   "SOL_TRANSFERENCIA"."ESTADO_CIVIL",   "SOL_TRANSFERENCIA"."DOMICILIO_C",   "SOL_TRANSFERENCIA"."TOTAL_RENTA",   "SOL_TRANSFERENCIA"."FONO_C",   "SOL_TRANSFERENCIA"."GRUPO_F",   "SOL_TRANSFERENCIA"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   								 :ls_pob,   								:ls_sector,   						  :ls_comuna,   						 :ls_ciudad,   						:ls_fono_p,   						  :ldt_fec_nac,   						 :ls_est_civil,   							:ls_dir_c,   								 :ll_renta,   									:ls_fono_c,   						 :ll_grupo_f,   						 :ll_rut  
													FROM 	"SOL_TRANSFERENCIA",   
																"SOL_ESTATUS"  
													WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_TRANSFERENCIA"."BASE" ) and  
															 ( "SOL_ESTATUS"."SERIE" = "SOL_TRANSFERENCIA"."SERIE" ) and  
															 ( "SOL_ESTATUS"."NUMERO" = "SOL_TRANSFERENCIA"."NUMERO" ) and  
															 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TRANSFERENCIA"."CORRELATIVO" ) and  
															 ( ( "SOL_TRANSFERENCIA"."BASE" = :gs_base ) AND  
															 ( "SOL_TRANSFERENCIA"."SERIE" = :gs_serie ) AND  
															 ( "SOL_TRANSFERENCIA"."NUMERO" = :gi_numero ) AND  
															 ( "SOL_TRANSFERENCIA"."CORRELATIVO" = :ll_corr ) AND  
															 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
													Using	sqlca;
													
												CASE '11'
													SELECT	"SOL_RESOLUCION"."DIRECCION_P",   "SOL_RESOLUCION"."POBLACION",   "SOL_RESOLUCION"."SECTOR",   "SOL_RESOLUCION"."COMUNA",   "SOL_RESOLUCION"."CIUDAD",   "SOL_RESOLUCION"."FONO_P",   "SOL_RESOLUCION"."FECHA_NAC",   "SOL_RESOLUCION"."ESTADO_CIVIL",   "SOL_RESOLUCION"."DOMICILIO_C",   "SOL_RESOLUCION"."TOTAL_RENTA",   "SOL_RESOLUCION"."FONO_C",   "SOL_RESOLUCION"."GRUPO_F",   "SOL_RESOLUCION"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   							 :ls_pob,   							:ls_sector,   					  :ls_comuna,   					 :ls_ciudad,   					:ls_fono_p,   					  :ldt_fec_nac,   					 :ls_est_civil,   						:ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   					 :ll_grupo_f,   					 :ll_rut  
													FROM 	"SOL_RESOLUCION",   
																"SOL_ESTATUS"  
													WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_RESOLUCION"."BASE" ) and  
															 ( "SOL_ESTATUS"."SERIE" = "SOL_RESOLUCION"."SERIE" ) and  
															 ( "SOL_ESTATUS"."NUMERO" = "SOL_RESOLUCION"."NUMERO" ) and  
															 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESOLUCION"."CORRELATIVO" ) and  
															 ( ( "SOL_RESOLUCION"."BASE" = :gs_base ) AND  
															 ( "SOL_RESOLUCION"."SERIE" = :gs_serie ) AND  
															 ( "SOL_RESOLUCION"."NUMERO" = :gi_numero ) AND  
															 ( "SOL_RESOLUCION"."CORRELATIVO" = :ll_corr ) AND  
															 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
													Using	sqlca;
												CASE '13'
													SELECT	"SOL_CAMBIO_ESTADO"."DIRECCION_P",   "SOL_CAMBIO_ESTADO"."POBLACION",   "SOL_CAMBIO_ESTADO"."SECTOR",   "SOL_CAMBIO_ESTADO"."COMUNA",   "SOL_CAMBIO_ESTADO"."CIUDAD",   "SOL_CAMBIO_ESTADO"."FONO_P",   "SOL_CAMBIO_ESTADO"."FECHA_NAC",   "SOL_CAMBIO_ESTADO"."ESTADO_CIVIL",   "SOL_CAMBIO_ESTADO"."DOMICILIO_C",   "SOL_CAMBIO_ESTADO"."TOTAL_RENTA",   "SOL_CAMBIO_ESTADO"."FONO_C",   "SOL_CAMBIO_ESTADO"."GRUPO_F",   "SOL_CAMBIO_ESTADO"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   							 	:ls_pob,   									:ls_sector,   					  		:ls_comuna,   					 		:ls_ciudad,   						:ls_fono_p,   					  		:ldt_fec_nac,   					 		:ls_est_civil,   							:ls_dir_c,   							 	:ll_renta,   									:ls_fono_c,   					 		:ll_grupo_f,   					 :ll_rut  
													FROM 	"SOL_CAMBIO_ESTADO",   
																"SOL_ESTATUS"  
													WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_CAMBIO_ESTADO"."BASE" ) and  
															 ( "SOL_ESTATUS"."SERIE" = "SOL_CAMBIO_ESTADO"."SERIE" ) and  
															 ( "SOL_ESTATUS"."NUMERO" = "SOL_CAMBIO_ESTADO"."NUMERO" ) and  
															 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CAMBIO_ESTADO"."CORRELATIVO" ) and  
															 ( ( "SOL_CAMBIO_ESTADO"."BASE" = :gs_base ) AND  
															 ( "SOL_CAMBIO_ESTADO"."SERIE" = :gs_serie ) AND  
															 ( "SOL_CAMBIO_ESTADO"."NUMERO" = :gi_numero ) AND  
															 ( "SOL_CAMBIO_ESTADO"."CORRELATIVO" = :ll_corr ) AND  
															 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
													Using	sqlca;
													
												CASE '14'
													SELECT	"SOL_CAMBIO_ESTADO_TITULAR"."DIRECCION_P",   "SOL_CAMBIO_ESTADO_TITULAR"."POBLACION",  "SOL_CAMBIO_ESTADO_TITULAR"."SECTOR",  "SOL_CAMBIO_ESTADO_TITULAR"."COMUNA",  "SOL_CAMBIO_ESTADO_TITULAR"."CIUDAD",  "SOL_CAMBIO_ESTADO_TITULAR"."FONO_P",  "SOL_CAMBIO_ESTADO_TITULAR"."FECHA_NAC",  "SOL_CAMBIO_ESTADO_TITULAR"."ESTADO_CIVIL",  "SOL_CAMBIO_ESTADO_TITULAR"."DOMICILIO_C",   "SOL_CAMBIO_ESTADO_TITULAR"."TOTAL_RENTA",   "SOL_CAMBIO_ESTADO_TITULAR"."FONO_C",  "SOL_CAMBIO_ESTADO_TITULAR"."GRUPO_F", "SOL_CAMBIO_ESTADO_TITULAR"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   							 				:ls_pob,   											:ls_sector,   					  				:ls_comuna,   					 				:ls_ciudad,   									:ls_fono_p,   					  				:ldt_fec_nac,   					 				:ls_est_civil,   										:ls_dir_c,   							 				:ll_renta,   											:ls_fono_c,   					 				:ll_grupo_f,   					 			:ll_rut  
													FROM 	"SOL_CAMBIO_ESTADO_TITULAR",   
																"SOL_ESTATUS"  
													WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_CAMBIO_ESTADO_TITULAR"."BASE" ) and  
															 ( "SOL_ESTATUS"."SERIE" = "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" ) and  
															 ( "SOL_ESTATUS"."NUMERO" = "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" ) and  
															 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" ) and  
															 ( ( "SOL_CAMBIO_ESTADO_TITULAR"."BASE" = :gs_base ) AND  
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
													
												CASE '16'
													SELECT	"SOL_NOVACION"."DIRECCION_P",   "SOL_NOVACION"."POBLACION", "SOL_NOVACION"."SECTOR",   "SOL_NOVACION"."COMUNA",   "SOL_NOVACION"."CIUDAD",   "SOL_NOVACION"."FONO_P",   "SOL_NOVACION"."FECHA_NAC",   "SOL_NOVACION"."ESTADO_CIVIL",   "SOL_NOVACION"."DOMICILIO_C",   "SOL_NOVACION"."TOTAL_RENTA",  "SOL_NOVACION"."FONO_C",   "SOL_NOVACION"."GRUPO_F",  "SOL_NOVACION"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   						  :ls_pob,   						:ls_sector,   					:ls_comuna,   					:ls_ciudad,   					:ls_fono_p,   					:ldt_fec_nac,   					:ls_est_civil,   						:ls_dir_c,   						  :ll_renta,   						:ls_fono_c,   					:ll_grupo_f,   				:ll_rut  
													FROM 	"SOL_NOVACION",   
																"SOL_ESTATUS"  
													WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_NOVACION"."BASE" ) and  
															 ( "SOL_ESTATUS"."SERIE" = "SOL_NOVACION"."SERIE" ) and  
															 ( "SOL_ESTATUS"."NUMERO" = "SOL_NOVACION"."NUMERO" ) and  
															 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_NOVACION"."CORRELATIVO" ) and  
															 ( ( "SOL_NOVACION"."BASE" = :gs_base ) AND  
															 ( "SOL_NOVACION"."SERIE" = :gs_serie ) AND  
															 ( "SOL_NOVACION"."NUMERO" = :gi_numero ) AND  
															 ( "SOL_NOVACION"."CORRELATIVO" = :ll_corr ) AND  
															 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
													Using	sqlca;
												
												CASE '19'
													SELECT	"SOL_POS_EFEC"."DIRECCION_P",   "SOL_POS_EFEC"."POBLACION", "SOL_POS_EFEC"."SECTOR",   "SOL_POS_EFEC"."COMUNA",   "SOL_POS_EFEC"."CIUDAD",   "SOL_POS_EFEC"."FONO_P",   "SOL_POS_EFEC"."FECHA_NAC",   "SOL_POS_EFEC"."ESTADO_CIVIL",   "SOL_POS_EFEC"."DOMICILIO_C",   "SOL_POS_EFEC"."TOTAL_RENTA",  "SOL_POS_EFEC"."FONO_C",   "SOL_POS_EFEC"."GRUPO_F",  "SOL_POS_EFEC"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   						  :ls_pob,   						:ls_sector,   					:ls_comuna,   					:ls_ciudad,   					:ls_fono_p,   					:ldt_fec_nac,   					:ls_est_civil,   						:ls_dir_c,   						  :ll_renta,   						:ls_fono_c,   					:ll_grupo_f,   				:ll_rut  
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
													
												CASE '20'
													SELECT	"SOL_PAC"."DIRECCION_P",   "SOL_PAC"."POBLACION", "SOL_PAC"."SECTOR",   "SOL_PAC"."COMUNA",   "SOL_PAC"."CIUDAD",   "SOL_PAC"."FONO_P",   "SOL_PAC"."FECHA_NAC",   "SOL_PAC"."ESTADO_CIVIL",   "SOL_PAC"."DOMICILIO_C",   "SOL_PAC"."TOTAL_RENTA",  "SOL_PAC"."FONO_C",   "SOL_PAC"."GRUPO_F",  "SOL_PAC"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   					:ls_pob,   				  :ls_sector,   			:ls_comuna,   			 :ls_ciudad,   		  :ls_fono_p,   			:ldt_fec_nac,   			:ls_est_civil,   				  :ls_dir_c,   				  :ll_renta,   				 :ls_fono_c,   			:ll_grupo_f,   		:ll_rut  
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
													
												CASE '21'
													SELECT	"SOL_PAT"."DIRECCION_P",   "SOL_PAT"."POBLACION", "SOL_PAT"."SECTOR",   "SOL_PAT"."COMUNA",   "SOL_PAT"."CIUDAD",   "SOL_PAT"."FONO_P",   "SOL_PAT"."FECHA_NAC",   "SOL_PAT"."ESTADO_CIVIL",   "SOL_PAT"."DOMICILIO_C",   "SOL_PAT"."TOTAL_RENTA",  "SOL_PAT"."FONO_C",   "SOL_PAT"."GRUPO_F",  "SOL_PAT"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   					:ls_pob,   				  :ls_sector,   			:ls_comuna,   			 :ls_ciudad,   		  :ls_fono_p,   			:ldt_fec_nac,   			:ls_est_civil,   				  :ls_dir_c,   				  :ll_renta,   				 :ls_fono_c,   			:ll_grupo_f,   		:ll_rut  
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
												
												CASE '22'
													SELECT	"SOL_SEGURO_FALLECE"."DIRECCION_P", "SOL_SEGURO_FALLECE"."POBLACION",   "SOL_SEGURO_FALLECE"."SECTOR",   "SOL_SEGURO_FALLECE"."COMUNA",   "SOL_SEGURO_FALLECE"."CIUDAD",   "SOL_SEGURO_FALLECE"."FONO_P",   "SOL_SEGURO_FALLECE"."FECHA_NAC",   "SOL_SEGURO_FALLECE"."ESTADO_CIVIL",   "SOL_SEGURO_FALLECE"."DOMICILIO_C",		"SOL_SEGURO_FALLECE"."TOTAL_RENTA",		"SOL_SEGURO_FALLECE"."FONO_C",   "SOL_SEGURO_FALLECE"."GRUPO_F",  "SOL_SEGURO_FALLECE"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   							  	:ls_pob,   							  		:ls_sector,   					  		:ls_comuna,   					  		:ls_ciudad,   					  		:ls_fono_p,   					  		:ldt_fec_nac,   					  		:ls_est_civil,   						  		:ls_dir_c,   							 		:ll_renta,   									:ls_fono_c,   							:ll_grupo_f,   					 	:ll_rut
													FROM 	"SOL_SEGURO_FALLECE",   
																"SOL_ESTATUS"  
													WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_SEGURO_FALLECE"."BASE" ) and  
															 ( "SOL_ESTATUS"."SERIE" = "SOL_SEGURO_FALLECE"."SERIE" ) and  
															 ( "SOL_ESTATUS"."NUMERO" = "SOL_SEGURO_FALLECE"."NUMERO" ) and  
															 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_SEGURO_FALLECE"."CORRELATIVO" ) and  
															 (("SOL_SEGURO_FALLECE"."BASE" = :gs_base ) AND  
															 ( "SOL_SEGURO_FALLECE"."SERIE" = :gs_serie ) AND  
															 ( "SOL_SEGURO_FALLECE"."NUMERO" = :gi_numero ) AND  
															 ( "SOL_SEGURO_FALLECE"."CORRELATIVO" = :ll_corr ) AND  
															 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
													Using	sqlca;						
												
												CASE '23'
													SELECT	"SOL_EN_DEMANDA"."DIRECCION_P", "SOL_EN_DEMANDA"."POBLACION",   "SOL_EN_DEMANDA"."SECTOR",   "SOL_EN_DEMANDA"."COMUNA",   "SOL_EN_DEMANDA"."CIUDAD",   "SOL_EN_DEMANDA"."FONO_P",   "SOL_EN_DEMANDA"."FECHA_NAC",   "SOL_EN_DEMANDA"."ESTADO_CIVIL",   "SOL_EN_DEMANDA"."DOMICILIO_C",		"SOL_EN_DEMANDA"."TOTAL_RENTA",		"SOL_EN_DEMANDA"."FONO_C",   "SOL_EN_DEMANDA"."GRUPO_F",  "SOL_EN_DEMANDA"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   							  	:ls_pob,   							  		:ls_sector,   					  		:ls_comuna,   					  		:ls_ciudad,   					  		:ls_fono_p,   					  		:ldt_fec_nac,   					  		:ls_est_civil,   						  		:ls_dir_c,   							 		:ll_renta,   									:ls_fono_c,   							:ll_grupo_f,   					 	:ll_rut
													FROM 	"SOL_EN_DEMANDA",   
																"SOL_ESTATUS"  
													WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_EN_DEMANDA"."BASE" ) and  
															 ( "SOL_ESTATUS"."SERIE" = "SOL_EN_DEMANDA"."SERIE" ) and  
															 ( "SOL_ESTATUS"."NUMERO" = "SOL_EN_DEMANDA"."NUMERO" ) and  
															 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_EN_DEMANDA"."CORRELATIVO" ) and  
															 (("SOL_EN_DEMANDA"."BASE" = :gs_base ) AND  
															 ( "SOL_EN_DEMANDA"."SERIE" = :gs_serie ) AND  
															 ( "SOL_EN_DEMANDA"."NUMERO" = :gi_numero ) AND  
															 ( "SOL_EN_DEMANDA"."CORRELATIVO" = :ll_corr ) AND  
															 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) )   
													Using	sqlca;	
												CASE '24'
													SELECT	"SOL_BONO_FRATERNO"."DIRECCION_P",   "SOL_BONO_FRATERNO"."POBLACION",   "SOL_BONO_FRATERNO"."SECTOR",   "SOL_BONO_FRATERNO"."COMUNA",   "SOL_BONO_FRATERNO"."CIUDAD",   "SOL_BONO_FRATERNO"."FONO_P",   "SOL_BONO_FRATERNO"."FECHA_NAC",   "SOL_BONO_FRATERNO"."ESTADO_CIVIL",   "SOL_BONO_FRATERNO"."DOMICILIO_C",   "SOL_BONO_FRATERNO"."TOTAL_RENTA",   "SOL_BONO_FRATERNO"."FONO_C",   "SOL_BONO_FRATERNO"."GRUPO_F",   "SOL_BONO_FRATERNO"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   					  :ldt_fec_nac,   					  :ls_est_civil,   						  :ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut
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
												CASE '25'
													SELECT	"SOL_MANT_PERPETUA"."DIRECCION_P",   "SOL_MANT_PERPETUA"."POBLACION",   "SOL_MANT_PERPETUA"."SECTOR",   "SOL_MANT_PERPETUA"."COMUNA",   "SOL_MANT_PERPETUA"."CIUDAD",   "SOL_MANT_PERPETUA"."FONO_P",   "SOL_MANT_PERPETUA"."FECHA_NAC",   "SOL_MANT_PERPETUA"."ESTADO_CIVIL",   "SOL_MANT_PERPETUA"."DOMICILIO_C",   "SOL_MANT_PERPETUA"."TOTAL_RENTA",   "SOL_MANT_PERPETUA"."FONO_C",   "SOL_MANT_PERPETUA"."GRUPO_F",   "SOL_MANT_PERPETUA"."RUT_TITULAR"  
													INTO 		:ls_dir_p,   							  :ls_pob,   							  :ls_sector,   					  :ls_comuna,   					  :ls_ciudad,   					  :ls_fono_p,   					  :ldt_fec_nac,   					  :ls_est_civil,   						  :ls_dir_c,   							 :ll_renta,   								:ls_fono_c,   						:ll_grupo_f,   					 :ll_rut
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
											END CHOOSE
											if sqlca.sqlcode=0 then
												UPDATE	"CLIENTE"  
												SET 		"DIRECCION_P" = :ls_dir_p,   
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
					end if
				else
					messagebox("Advertencia","Solicitud "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(ll_corr,"###,###,###,##0")+ ' está Aceptada')
				end if
			else
				messagebox("Advertencia","No puede actualizar, solicitud Anulada por Operaciones")
			end if
		end if
	//else
	//	messagebox("Advertencia","Para Actualizar una Solicitud debe Deshabilitar Opción Actualiza Todo")
	end if
end if
end event

type cb_aceptar_operaciones from commandbutton within w_estado_informes
integer x = 55
integer y = 1824
integer width = 261
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Autori&zar"
end type

event clicked;long		ll_estatus,ll_corr,ll_est_inf,ll_rut,Net,ll_count_trans,ll_estado=11
String		ls_obs,ls_cod_sol,ls_string,ls_estado_reg,ls_conex,ls_comentario,ls_pasa,ls_estado_ctto_final,ls_ejecutivo,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,&
			ls_descrip_parque,ls_nom_completo,ls_rut,ls_descrip_estado_ctto,ls_asunto,ls_texto,email_de,ls_email_para,ls_res
datetime	ldt_fecha

ldt_fecha				= datetime(idt_fecha_hoy,now())
ls_pasa				= 'S'
if il_row>0 and dw_lista.rowcount()>0 then
	gs_base			= dw_lista.getitemstring(il_row,'base')
	gs_serie			= dw_lista.getitemstring(il_row,'serie')
	gi_numero		= dw_lista.getitemnumber(il_row,'numero')
	ll_corr			= dw_lista.getitemnumber(il_row,'correlativo')
	ll_estatus		= dw_lista.getitemnumber(il_row,'estatus_operacion')
	ll_est_inf			= dw_lista.getitemnumber(il_row,'estatus_informatica')
	ls_cod_sol		= dw_lista.getitemstring(il_row,'codigo_solicitud')
	ll_rut				= dw_lista.getitemnumber(il_row,'rut_titular')
	ls_estado_reg	= dw_lista.getitemstring(il_row,'estado_reg')
	if ls_estado_reg = 'A' then
		if ll_estatus = 1 then
			if ls_cod_sol='10' or ls_cod_sol='16' or ls_cod_sol='19' then
				SELECT	Count("SOL_CLIENTE"."RUT")
				INTO 		:ll_count_trans
				FROM 	"SOL_CLIENTE"  
				WHERE 	"SOL_CLIENTE"."RUT_CLIENTE_ORI" = :gi_rut and
							"SOL_CLIENTE"."BASE" = :gs_base and  
							"SOL_CLIENTE"."SERIE" = :gs_serie and   
							"SOL_CLIENTE"."NUMERO" = :gi_numero and    
							"SOL_CLIENTE"."CORRELATIVO" = :ll_corr
				USING	sqlca;
				if ll_count_trans=0 or isnull(ll_count_trans) then
					if ls_cod_sol='19' then
						messagebox("Advertencia","Para el Contrato "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###")+" debe Ingresar Herederos")
					else
						messagebox("Advertencia","Para el Contrato "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###")+" debe Ingresar Cliente a Transferir")
					end if
					ls_pasa	= 'N'
				end if
			end if
			if ls_pasa='S' then
				Net 					= MessageBox("Advertencia","Está seguro Autorizar la solicitud Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(ll_corr,"###,###,###,##0"), Exclamation!, YesNo!, 2)
				IF Net = 1 THEN
					dw_lista.setitem(il_row,'estatus_operacion',0)
					dw_lista.setitem(il_row,'usuario_opera',gs_user)
					dw_lista.setitem(il_row,'fecha_opera',string(idt_fecha_hoy,"dd/mm/yyyy"))
					ls_obs			= trim(dw_lista.getitemstring(il_row,'observacion'))
					ls_obs			= ls_obs+', Autoriza Atención Cliente por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
					dw_lista.setitem(il_row,'observacion',ls_obs)
					dw_lista.accepttext()
					if dw_lista.update()=1 then
						commit;
						CHOOSE CASE ls_cod_sol
							CASE "1" //resciliacion por parte del cliente
								UPDATE	"SOL_RESCILIA_CLIENTE"  
								SET 		"ESTATUS_OPERACION" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_RESCILIA_CLIENTE"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																						 FROM 	"SOL_ESTATUS"  
																						 WHERE 	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																									( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																									( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																									( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ))  AND
											"SOL_RESCILIA_CLIENTE"."SERIE" = :gs_serie and
											"SOL_RESCILIA_CLIENTE"."NUMERO" = :gi_numero AND
											"SOL_RESCILIA_CLIENTE"."CORRELATIVO" = :ll_corr
								Using		sqlca ;
								if sqlca.sqlcode=0 then
									commit;
									if dw_print.retrieve(gs_base,gs_serie,gi_numero,ll_corr)>0 then
										if gs_conexion = 'Parque El Prado' then
											ls_conex										= "P"
											dw_print.setitem(1,'conexion',ls_conex)
											dw_print.object.t_4.text					= 'Inmobiliaria Parque La Florida SpA'
											dw_print.object.txt_rechazo.visible	= false
		//									dw_print.object.txt_aceptada.text		= 'Informamos a usted, que la solicitud de Resciliación de su contrato fue aceptada, por lo tanto, debe acercarse exclusivamente a nuestras oficinas de Estado 360 tercer piso, de Lunes a Viernes de 9:00 a 17:30 horas, a firmar la documentación correspondiente.      Cualquier duda llame a los teléfonos 3805730 - 3805733 - 3805734.'
											dw_print.object.txt_aceptada.visible	= true
										elseif gs_conexion = 'Parque La Foresta' then
											ls_conex	= "F"
											dw_print.setitem(1,'conexion',ls_conex)
											dw_print.object.t_4.text					= 'Inmobiliaria Parque de La Serena SpA'
											dw_print.object.txt_rechazo.visible	= false
		//									dw_print.object.txt_aceptada.text		= 'Informamos a usted, que la solicitud de Resciliación de su contrato fue aceptada, por lo tanto, debe acercarse exclusivamente a nuestras oficinas de Ruta 41 Sector Aeropuerto Camino Vicuña, de Lunes a Viernes de 9:00 a 17:30 horas, a firmar la documentación correspondiente.      Cualquier duda llame al teléfono 27 18 01.'
											dw_print.object.txt_aceptada.visible	= true
										elseif gs_conexion = 'Parque Concepción' then
											ls_conex	= "C"
											dw_print.setitem(1,'conexion',ls_conex)
											dw_print.object.t_4.text					= 'Parque de Concepción SpA'
											dw_print.object.txt_rechazo.visible	= false
		//									dw_print.object.txt_aceptada.text		= 'Informamos a usted, que la solicitud de Resciliación de su contrato fue aceptada, por lo tanto, debe acercarse exclusivamente a nuestras oficinas de Ruta 41 Sector Aeropuerto Camino Vicuña, de Lunes a Viernes de 9:00 a 17:30 horas, a firmar la documentación correspondiente.      Cualquier duda llame al teléfono 27 18 01.'
											dw_print.object.txt_aceptada.visible	= true
										end if
										f_Print( dw_print )
									end if
								else
									rollback;
								end if
		
							CASE "2" //resciliacion por reprogramacion
								UPDATE	"SOL_RESCILIA_REPROG"  
								SET 		"ESTATUS_OPERACION" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_RESCILIA_REPROG"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																						 FROM 	"SOL_ESTATUS"  
																						 WHERE 	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																									( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																									( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																									( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ))  AND
											"SOL_RESCILIA_REPROG"."SERIE" = :gs_serie AND 
											"SOL_RESCILIA_REPROG"."NUMERO" = :gi_numero AND
											"SOL_RESCILIA_REPROG"."CORRELATIVO" = :ll_corr
								Using		sqlca ;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "3" // reactivacion ctto.
								UPDATE	"SOL_REACTIVA"  
								SET 		"ESTATUS_OPERACION" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_REACTIVA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																			  FROM 	"SOL_ESTATUS"  
																			  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																						( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																						( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																						( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																						( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																						( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_REACTIVA"."SERIE" = :gs_serie AND
											"SOL_REACTIVA"."NUMERO" = :gi_numero AND
											"SOL_REACTIVA"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "4" // SEGURO DESGRAVAMEN
								UPDATE	"SOL_SEGURO_DESG"  
								SET 		"ESTATUS_OPERACIONES" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_SEGURO_DESG"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																			  FROM 	"SOL_ESTATUS"  
																			  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																						( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																						( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																						( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																						( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																						( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_SEGURO_DESG"."SERIE" = :gs_serie AND
											"SOL_SEGURO_DESG"."NUMERO" = :gi_numero AND
											"SOL_SEGURO_DESG"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									ldt_fecha				= datetime(idt_fecha_hoy,now())
									ls_comentario		= 'SOLICITUD DE SEGURO DESGRAVAMEN EN TRAMITE'
									INSERT INTO "ATENCION_LOG"  
												( "RUT",   
												  "ESTADO",   
												  "FECHA",   
												  "GLOSA",   
												  "USUARIO",   
												  "BASE",   
												  "SERIE",   
												  "NUMERO" )  
									VALUES	( :ll_rut,   
												  :ll_estado,   
												  :ldt_fecha,   
												  :ls_comentario,   
												  :gs_user,   
												  :gs_base,   
												  :gs_serie,   
												  :gi_numero )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								else
									rollback;
								end if	
								
							CASE "5" // REPACTA COMPRAVENTA
								UPDATE	"SOL_REPACTA_CVTA"  
								SET 		"ESTATUS_OPERACION" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_REPACTA_CVTA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																			  FROM 	"SOL_ESTATUS"  
																			  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																						( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																						( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																						( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																						( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																						( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_REPACTA_CVTA"."SERIE" = :gs_serie AND
											"SOL_REPACTA_CVTA"."NUMERO" = :gi_numero AND
											"SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									messagebox("Advertencia","Recuerde solo puede actualizar PROMESAS")
								else
									rollback;
								end if	
								
							CASE "6" // titulo de dominio
								UPDATE	"SOL_TIT_DOMINIO"  
								SET 		"ESTATUS_OPERACIONES" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_TIT_DOMINIO"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																					  FROM 	"SOL_ESTATUS"  
																					  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																								( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																								( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																								( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_TIT_DOMINIO"."SERIE" = :gs_serie AND
											"SOL_TIT_DOMINIO"."NUMERO" = :gi_numero AND
											"SOL_TIT_DOMINIO"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "7" // contrato definitivo
								UPDATE	"SOL_CONTRATO_DEF"  
								SET 		"ESTATUS_OPERACIONES" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_CONTRATO_DEF"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																						  FROM 	"SOL_ESTATUS"  
																						  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																									( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																									( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																									( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_CONTRATO_DEF"."SERIE" = :gs_serie AND
											"SOL_CONTRATO_DEF"."NUMERO" = :gi_numero AND
											"SOL_CONTRATO_DEF"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "8" // ENTREGA PAGARE
								UPDATE	"SOL_ENTREGA_PAG"  
								SET 		"ESTATUS_OPERACIONES" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_ENTREGA_PAG"."BASE" = (   SELECT	"SOL_ESTATUS"."BASE"  
																						  FROM 	"SOL_ESTATUS"  
																						  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																									( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																									( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																									( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_ENTREGA_PAG"."SERIE" = :gs_serie AND
											"SOL_ENTREGA_PAG"."NUMERO" = :gi_numero AND
											"SOL_ENTREGA_PAG"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "10" // TRANSFERENCIA
								UPDATE	"SOL_TRANSFERENCIA"  
								SET 		"ESTATUS_OPERACIONES" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_TRANSFERENCIA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																						  FROM 	"SOL_ESTATUS"  
																						  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																									( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																									( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																									( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_TRANSFERENCIA"."SERIE" = :gs_serie AND
											"SOL_TRANSFERENCIA"."NUMERO" = :gi_numero AND
											"SOL_TRANSFERENCIA"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "11" // resolucion
								UPDATE	"SOL_RESOLUCION"  
								SET 		"ESTATUS_OPERACION" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_RESOLUCION"."BASE" = (  SELECT	"SOL_ESTATUS"."BASE"  
																					  FROM 	"SOL_ESTATUS"  
																					  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																								( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																								( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																								( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND 
																								( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_RESOLUCION"."SERIE" = :gs_serie AND
											"SOL_RESOLUCION"."NUMERO" = :gi_numero AND
											"SOL_RESOLUCION"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							CASE "13" // cambio estado
								UPDATE	"SOL_CAMBIO_ESTADO"  
								SET 		"ESTATUS_OPERACION" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_CAMBIO_ESTADO"."BASE" = (SELECT	"SOL_ESTATUS"."BASE"  
																						  FROM 	"SOL_ESTATUS"  
																						  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																									( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																									( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																									( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_CAMBIO_ESTADO"."SERIE" = :gs_serie AND
											"SOL_CAMBIO_ESTADO"."NUMERO" = :gi_numero AND
											"SOL_CAMBIO_ESTADO"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							
							CASE "14" // cambio estado TITULAR
								UPDATE	"SOL_CAMBIO_ESTADO_TITULAR"  
								SET 		"ESTATUS_OPERACION" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_CAMBIO_ESTADO_TITULAR"."BASE" = (   SELECT	"SOL_ESTATUS"."BASE"  
																										  FROM 	"SOL_ESTATUS"  
																										  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																													( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																													( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																													( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																													( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																													( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_CAMBIO_ESTADO_TITULAR"."SERIE" = :gs_serie AND
											"SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" = :gi_numero AND
											"SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "15" // SEGURO
								UPDATE	"SOL_SEGURO"  
								SET 		"ESTATUS_OPERACIONES" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_SEGURO"."BASE" = (SELECT	"SOL_ESTATUS"."BASE"  
																			  FROM 	"SOL_ESTATUS"  
																			  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																						( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																						( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																						( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																						( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																						( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_SEGURO"."SERIE" = :gs_serie AND
											"SOL_SEGURO"."NUMERO" = :gi_numero AND
											"SOL_SEGURO"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									ldt_fecha				= datetime(idt_fecha_hoy,now())
									ls_comentario		= 'SEGURO DESGRAVAMEN EN TRAMITE' //'SOLICITUD DE SEGURO APROBADO'
									INSERT INTO "ATENCION_LOG"  
												( "RUT",		"ESTADO", 		"FECHA",   	"GLOSA",   			"USUARIO",   	"BASE",   	"SERIE",   	"NUMERO" )  
									VALUES	( :ll_rut,   	:ll_estado,   	:ldt_fecha,   :ls_comentario,   	:gs_user,   		:gs_base,   	:gs_serie,   :gi_numero )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								else
									rollback;
								end if	
								
							CASE "16" // NOVACION
								UPDATE	"SOL_NOVACION"  
								SET 		"ESTATUS_OPERACIONES" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_NOVACION"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																				  FROM 	"SOL_ESTATUS"  
																				  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																							( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																							( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																							( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																							( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																							( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_NOVACION"."SERIE" = :gs_serie AND
											"SOL_NOVACION"."NUMERO" = :gi_numero AND
											"SOL_NOVACION"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "17" //Copropietario Promesa
								UPDATE	"SOL_COPROP_PROMESA"  
								SET 		"ESTATUS_OPERA" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_COPROP_PROMESA"."BASE" = ( SELECT		"SOL_ESTATUS"."BASE"  
																							FROM 		"SOL_ESTATUS"  
																							WHERE	 ( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																									 ( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																									 ( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																									 ( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																									 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																									 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_COPROP_PROMESA"."SERIE" = :gs_serie AND
											"SOL_COPROP_PROMESA"."NUMERO" = :gi_numero AND
											"SOL_COPROP_PROMESA"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "18" //Ultima Voluntad
								UPDATE	"SOL_ULTIMA_VOLUNTAD"  
								SET 		"ESTATUS_OPERA" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_ULTIMA_VOLUNTAD"."BASE" = ( 	SELECT	"SOL_ESTATUS"."BASE"  
																								FROM 	"SOL_ESTATUS"  
																								WHERE	 ( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																										 ( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																										 ( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																										 ( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																										 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																										 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_ULTIMA_VOLUNTAD"."SERIE" = :gs_serie AND
											"SOL_ULTIMA_VOLUNTAD"."NUMERO" = :gi_numero AND
											"SOL_ULTIMA_VOLUNTAD"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "19" //Posesion Efectiva
								UPDATE	"SOL_POS_EFEC"  
								SET 		"ESTATUS_OPERACIONES" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_POS_EFEC"."BASE" = (  	SELECT	"SOL_ESTATUS"."BASE"  
																					FROM 	"SOL_ESTATUS"  
																					WHERE	 ( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																							 ( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																							 ( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																							 ( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																							 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																							 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_POS_EFEC"."SERIE" = :gs_serie AND
											"SOL_POS_EFEC"."NUMERO" = :gi_numero AND
											"SOL_POS_EFEC"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "20" //Pac
								UPDATE	"SOL_PAC"  
								SET 		"ESTATUS_OPERACION" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_PAC"."BASE" = (   SELECT	"SOL_ESTATUS"."BASE"  
																			FROM 	"SOL_ESTATUS"  
																			WHERE	 ( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																					 ( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																					 ( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																					 ( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																					 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																					 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_PAC"."SERIE" = :gs_serie AND
											"SOL_PAC"."NUMERO" = :gi_numero AND
											"SOL_PAC"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "21" //PaT
								UPDATE	"SOL_PAT"  
								SET 		"ESTATUS_OPERACION" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_PAT"."BASE" = 		(   SELECT	"SOL_ESTATUS"."BASE"  
																				FROM 	"SOL_ESTATUS"  
																				WHERE	 ( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																						 ( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																						 ( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																						 ( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																						 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																						 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_PAT"."SERIE" = :gs_serie AND
											"SOL_PAT"."NUMERO" = :gi_numero AND
											"SOL_PAT"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								
							CASE "22" // SEGURO FALLECIMIENTO
								UPDATE	"SOL_SEGURO_FALLECE"  
								SET 		"ESTATUS_OPERACIONES" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_SEGURO_FALLECE"."BASE" = ( 	  SELECT	"SOL_ESTATUS"."BASE"  
																							  FROM 	"SOL_ESTATUS"  
																							  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																										( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																										( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																										( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																										( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																										( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_SEGURO_FALLECE"."SERIE" = :gs_serie AND
											"SOL_SEGURO_FALLECE"."NUMERO" = :gi_numero AND
											"SOL_SEGURO_FALLECE"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									ldt_fecha				= datetime(idt_fecha_hoy,now())
									ls_comentario		= 'SOLICITUD DE SEGURO PLAN ASISTENCIAL FAMILIAR EN TRAMITE'
									INSERT INTO  "ATENCION_LOG"  
													( "RUT",   	"ESTADO",   	"FECHA",   	"GLOSA",   			"USUARIO",   	"BASE",   	"SERIE",   	"NUMERO" )  
									VALUES		( :ll_rut,   	:ll_estado,   	:ldt_fecha,   :ls_comentario,   	:gs_user,   		:gs_base,   :gs_serie,   	:gi_numero )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								else
									rollback;
								end if	
								
						CASE "23" // EN DEMANDA
								UPDATE	"SOL_EN_DEMANDA"  
								SET 		"ESTATUS_OPERACION" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_EN_DEMANDA"."BASE" = (SELECT	"SOL_ESTATUS"."BASE"  
																						  FROM 	"SOL_ESTATUS"  
																						  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																									( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																									( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																									( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																									( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																									( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_EN_DEMANDA"."SERIE" = :gs_serie AND
											"SOL_EN_DEMANDA"."NUMERO" = :gi_numero AND
											"SOL_EN_DEMANDA"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									
//									SELECT 	"SOL_EN_DEMANDA"."ESTADO_CTTO_FINAL"  
//									INTO 		:ls_estado_ctto_final  
//									FROM 	"SOL_EN_DEMANDA",  	"SOL_ESTATUS"  
//									WHERE 	( "SOL_EN_DEMANDA"."BASE" = "SOL_ESTATUS"."BASE" ) and  
//												( "SOL_EN_DEMANDA"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
//												( "SOL_EN_DEMANDA"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
//												( "SOL_EN_DEMANDA"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
//												( ( "SOL_EN_DEMANDA"."BASE" = :gs_base ) AND  
//												( "SOL_EN_DEMANDA"."SERIE" = :gs_serie ) AND  
//												( "SOL_EN_DEMANDA"."NUMERO" = :gi_numero ) AND  
//												( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
//												( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
//												( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   ;
//										
//									SELECT	"ENCARGADOS"."NOMBRE"  
//									INTO 		:ls_ejecutivo  
//									FROM 	"ENCARGADOS"  
//									WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
//		
//									SELECT 	"CADENA"."RUT", 	"CLIENTE"."DV", 	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO", 	"COD_PARQ"."NOMBRE" 
//									INTO 		:ll_rut,   				:ls_dv,   				:ls_nombre,   				:ls_ap_pat,   					:ls_ap_mat,   					:ls_descrip_parque  
//									FROM 	"CADENA",   "CLIENTE", 	"COD_PARQ"  
//									WHERE 	( "CADENA"."COD_PARQUE" = "COD_PARQ"."CODIGO" ) and  
//												( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
//												( ( "CADENA"."CODIGO" = :gs_base ) AND  
//												( "CADENA"."SERIE" = :gs_serie ) AND  
//												( "CADENA"."NUMERO" = :gi_numero ) )   
//									USING	sqlca;
//									if isnull(ls_nombre) then ls_nombre=''
//									if isnull(ls_ap_pat) then ls_ap_pat=''
//									if isnull(ls_ap_mat) then ls_ap_mat=''
//									if isnull(ls_dv) then ls_dv=''
//									ls_nom_completo		= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
//									ls_rut						= string(ll_rut,'###,###,###,###')+'-'+ls_dv
//									SELECT 	"ESTADO"."NOMBRE_ESTADO",	sysdate
//									INTO 		:ls_descrip_estado_ctto ,				:gdt_fec_sistema
//									FROM 	"ESTADO"  
//									WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado_ctto_final   ;
//									
//									ls_asunto				= 'AVISO CAMBIO ESTADO CONTRATO A '+ls_descrip_estado_ctto+ ', Contrato ' +gs_base+'-' +gs_serie+String(gi_numero,'###,###,###,###')+'.'+'~r'
//									ls_texto 					= 'Con Fecha ' +STRING(gdt_fec_sistema,"dd/mm/yyyy")+' HORA: '+string(gdt_fec_sistema,'hh:mm')+' Se Solicita Cambio de Estado a '+ls_descrip_estado_ctto +', Contrato ' +gs_base+'-' +gs_serie+String(gi_numero,'###,###,###,###')+'~r'
//									ls_texto					= ls_texto+'Cliente Rut '+ls_rut+' Nombre '+ls_nom_completo+'~r'
//									ls_texto					= ls_texto+'Parque '+ls_descrip_parque+'~r'
//									ls_texto					= ls_texto+'Solicitado por '+gs_user+'-'+ls_ejecutivo+'.'
//									SELECT DISTINCT "ENCARGADOS"."EMAIL"  
//									INTO 		:email_de  
//									FROM 	"ENCARGADOS"  
//									WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
//									USING	sqlca;
//									if isnull(email_de) or email_de='-' or email_de='' then
//										email_de				= 'consulta@nuestrosparques.cl'
//									end if
//									
//									SELECT 	"TASA"."CORREO_DESTINO_DEMANDA"  INTO :ls_email_para 	FROM "TASA"  	WHERE "TASA"."LOOK" = 1   ;
//		
//									select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
//									INTO 		:ls_res
//									from 		DUAL;
//									if ls_res='OK' then
//										messagebox("Envio Email","Envio Email Exitoso")
//									else
//										messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
//									end if
								else
									rollback;
								end if
						CASE "24" // Bono Fraterno
								UPDATE	"SOL_BONO_FRATERNO"  
								SET 		"ESTATUS_OPERACIONES" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_BONO_FRATERNO"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																			  FROM 	"SOL_ESTATUS"  
																			  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																						( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																						( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																						( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																						( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																						( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_BONO_FRATERNO"."SERIE" = :gs_serie AND
											"SOL_BONO_FRATERNO"."NUMERO" = :gi_numero AND
											"SOL_BONO_FRATERNO"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									ldt_fecha				= datetime(idt_fecha_hoy,now())
									ls_comentario		= 'SOLICITUD DE BONO FRATERNO EN TRAMITE'
									INSERT INTO "ATENCION_LOG"  
												( "RUT",   
												  "ESTADO",   
												  "FECHA",   
												  "GLOSA",   
												  "USUARIO",   
												  "BASE",   
												  "SERIE",   
												  "NUMERO" )  
									VALUES	( :ll_rut,   
												  :ll_estado,   
												  :ldt_fecha,   
												  :ls_comentario,   
												  :gs_user,   
												  :gs_base,   
												  :gs_serie,   
												  :gi_numero )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								else
									rollback;
								end if
						CASE "25" // MANTENCION PERPETUA
								UPDATE	"SOL_MANT_PERPETUA"  
								SET 		"ESTATUS_OPERACIONES" = 0,   
											"USUARIO_OPERA" = :gs_user,   
											"FECHA_OPERA" = :ldt_fecha  
								WHERE 	"SOL_MANT_PERPETUA"."BASE" = ( SELECT	"SOL_ESTATUS"."BASE"  
																			  FROM 	"SOL_ESTATUS"  
																			  WHERE	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
																						( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
																						( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
																						( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
																						( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_cod_sol ) AND  
																						( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) ) AND
											"SOL_MANT_PERPETUA"."SERIE" = :gs_serie AND
											"SOL_MANT_PERPETUA"."NUMERO" = :gi_numero AND
											"SOL_MANT_PERPETUA"."CORRELATIVO" = :ll_corr
								Using		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									ldt_fecha				= datetime(idt_fecha_hoy,now())
									ls_comentario		= 'SOLICITUD DE MANTENCION PERPETUA EN TRAMITE'
									INSERT INTO "ATENCION_LOG"  
												( "RUT",   
												  "ESTADO",   
												  "FECHA",   
												  "GLOSA",   
												  "USUARIO",   
												  "BASE",   
												  "SERIE",   
												  "NUMERO" )  
									VALUES	( :ll_rut,   
												  :ll_estado,   
												  :ldt_fecha,   
												  :ls_comentario,   
												  :gs_user,   
												  :gs_base,   
												  :gs_serie,   
												  :gi_numero )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								else
									rollback;
								end if			
						END CHOOSE
						messagebox("Actualizar","Actualización Exitosa")
					else
						rollback;
					end if
				END IF
			end if
		else
			if ll_est_inf=0 then
				messagebox("Advertencia","Solicitud "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(ll_corr,"###,###,###,##0")+ ' está Aceptada')
			else
				messagebox("Advertencia","Solicitud "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(ll_corr,"###,###,###,##0")+ ', ya está autorizada por Atención Cliente')
			end if
		end if
	else
		messagebox("Advertencia","No puede actualizar, solicitud Anulada")
	end if
end if
end event

