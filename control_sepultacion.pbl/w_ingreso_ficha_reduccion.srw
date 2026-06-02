forward
global type w_ingreso_ficha_reduccion from window
end type
type cb_2 from commandbutton within w_ingreso_ficha_reduccion
end type
type dw_resumen from datawindow within w_ingreso_ficha_reduccion
end type
type dw_reduccion from datawindow within w_ingreso_ficha_reduccion
end type
type cb_1 from commandbutton within w_ingreso_ficha_reduccion
end type
type cb_tablas from commandbutton within w_ingreso_ficha_reduccion
end type
type cb_carta from commandbutton within w_ingreso_ficha_reduccion
end type
type cb_volver from commandbutton within w_ingreso_ficha_reduccion
end type
type cb_print from commandbutton within w_ingreso_ficha_reduccion
end type
type cb_eliminar from commandbutton within w_ingreso_ficha_reduccion
end type
type cb_buscar from commandbutton within w_ingreso_ficha_reduccion
end type
type pb_primer from picturebutton within w_ingreso_ficha_reduccion
end type
type pb_sigue from picturebutton within w_ingreso_ficha_reduccion
end type
type pb_antes from picturebutton within w_ingreso_ficha_reduccion
end type
type pb_fin from picturebutton within w_ingreso_ficha_reduccion
end type
type cb_grabar from commandbutton within w_ingreso_ficha_reduccion
end type
type cb_limpiar from commandbutton within w_ingreso_ficha_reduccion
end type
type dw_print from datawindow within w_ingreso_ficha_reduccion
end type
type tab_1 from tab within w_ingreso_ficha_reduccion
end type
type tabpage_3 from userobject within tab_1
end type
type st_6 from statictext within tabpage_3
end type
type em_rut from editmask within tabpage_3
end type
type st_5 from statictext within tabpage_3
end type
type st_help from statictext within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type dw_ficha_sepult from datawindow within tabpage_3
end type
type gb_3 from groupbox within tabpage_3
end type
type tabpage_3 from userobject within tab_1
st_6 st_6
em_rut em_rut
st_5 st_5
st_help st_help
st_3 st_3
dw_ficha_sepult dw_ficha_sepult
gb_3 gb_3
end type
type tabpage_2 from userobject within tab_1
end type
type st_2 from statictext within tabpage_2
end type
type dw_ant_titular from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_2 st_2
dw_ant_titular dw_ant_titular
end type
type tabpage_1 from userobject within tab_1
end type
type st_1 from statictext within tabpage_1
end type
type dw_ant_fall from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_1 st_1
dw_ant_fall dw_ant_fall
end type
type tabpage_4 from userobject within tab_1
end type
type st_4 from statictext within tabpage_4
end type
type dw_aranceles from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
st_4 st_4
dw_aranceles dw_aranceles
end type
type tab_1 from tab within w_ingreso_ficha_reduccion
tabpage_3 tabpage_3
tabpage_2 tabpage_2
tabpage_1 tabpage_1
tabpage_4 tabpage_4
end type
type cb_cerrar from commandbutton within w_ingreso_ficha_reduccion
end type
type gb_1 from groupbox within w_ingreso_ficha_reduccion
end type
type gb_2 from groupbox within w_ingreso_ficha_reduccion
end type
end forward

global type w_ingreso_ficha_reduccion from window
integer width = 3867
integer height = 2752
boolean titlebar = true
string title = "Ficha de Reducción"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_2 cb_2
dw_resumen dw_resumen
dw_reduccion dw_reduccion
cb_1 cb_1
cb_tablas cb_tablas
cb_carta cb_carta
cb_volver cb_volver
cb_print cb_print
cb_eliminar cb_eliminar
cb_buscar cb_buscar
pb_primer pb_primer
pb_sigue pb_sigue
pb_antes pb_antes
pb_fin pb_fin
cb_grabar cb_grabar
cb_limpiar cb_limpiar
dw_print dw_print
tab_1 tab_1
cb_cerrar cb_cerrar
gb_1 gb_1
gb_2 gb_2
end type
global w_ingreso_ficha_reduccion w_ingreso_ficha_reduccion

type variables
datawindowchild			idw_detalle5,idw_detalle6,idw_detalle7,idw_detalle8,idw_detalle9,idw_detalle16,idw_detalle17,idw_detalle18,idw_detalle19,idw_detalle20,idw_detalle21,&
								idw_detalle22,idw_detalle23,idw_detalle24,idw_detalle25
Long		il_tab,il_count_reg,il_count_otro,il_hora_ini,il_min_ini,il_hora_fin,il_min_fin,	il_intervalo,il_veces,il_capacidad,il_dw_tit_fall,il_modif1,il_modif2,il_modif3,il_modif4,&
			il_modif5,il_modif6
String	is_nro_tecnico,is_usuario_esta,is_nuevo,is_modif,is_codigo_otro_reduc
Datetime	idt_fecha_sistema
end variables

forward prototypes
public subroutine wf_setear_datos ()
public subroutine wf_valida_contrato ()
public function string wf_validar ()
public subroutine wf_actualizar_calculo (long al_fila)
public function string wf_validar_detalle_dscto (string as_tipo_dscto)
public subroutine wf_carga_detalle_boletas (string as_base, string as_serie, long al_numero, long al_corr_interno, long al_rut_tit, date adt_fech_sepult, long al_parque)
end prototypes

public subroutine wf_setear_datos ();Long		ll_tot_reg,ll_indi,ll_corr_interno,ll_rut_fall,ll_edad_fall,ll_rut_tit,ll_comprobante,ll_hora_def,ll_min_def,ll_sw_derecho_sepult,ll_sw_mov_sarcofago,ll_sw_cambio_ubicacion,&
			ll_sw_reduccion,ll_sw_certificado_defun,ll_sw_pago_liberado,ll_hora_util,ll_minuto_util,ll_sw_tit_fall,ll_sw_otros_pagos,ll_sw_alto_impacto,ll_llave,ll_sw_urna,ll_sw_1,&
			ll_sw_2,ll_sw_3,ll_sw_4,ll_sw_5,ll_sw_6,ll_sw_dscto_1,ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,ll_sw_dscto_5,ll_sw_dscto_6
String		ls_dv_fall,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_sexo_fall,ls_tipo_via_fall,ls_direc_fall,ls_num_dir_fall,ls_dpto_dir_fall,ls_block_dir_fall,ls_sector_fall,&
			ls_villa_fall,ls_ciud_fall,ls_comu_fall,ls_cod_est_fall,ls_causa_fall,ls_dv_tit,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_tipo_via_tit,ls_direc_tit,ls_num_dir_tit,&
			ls_dpto_dir_tit,ls_block_dir_tit,ls_villa_tit,ls_sector_tit,ls_ciud_tit,ls_comu_tit,ls_fono_funera,ls_pase_sepult,ls_base,ls_serie,ls_fono_titular,ls_ejecutivo,ls_estad_contrato,&
			ls_sector,ls_sepultura,ls_numero_tecni,ls_nivel,ls_est_sep_compl,ls_obs_sep_comp,ls_obs_credito,ls_obs_manten,ls_parentesco,ls_obs,ls_capilla,ls_dir_capilla,ls_periodo_nac,ls_tamano,&
			ls_obs_fall,ls_usar_capilla,ls_obs_alto_impacto,ls_obs_cuerpo,ls_cod_est_ctto,ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,ls_pago_5,ls_pago_6,ls_dscto_1,ls_dscto_2,&
			ls_dscto_3,ls_dscto_4,ls_dscto_5,ls_dscto_6,ls_pago_d1,ls_pago_d2,ls_pago_d3,ls_pago_d4,ls_pago_d5,ls_pago_d6,ls_dscto_d1,ls_dscto_d2,ls_dscto_d3,ls_dscto_d4,&
			ls_dscto_d5,ls_dscto_d6
Datetime	ldt_fec_defun,ldt_fec_nac,ldt_fech_sepult,ldt_fech_contrato,ldt_fech_recep
Double	ldb_uf_dia,ldb_der_sepult_uf,ldb_mov_sarcofago,ldb_cambio_ubica,ldb_reduccion,ldb_cert_defuncion,ldb_monto_canc,ldb_otros_pagos,ldb_valor_urna,ll_numero,&
			ldb_pago_1,ldb_pago_2,ldb_pago_3,ldb_pago_4,ldb_pago_5,ldb_pago_6,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,ldb_dscto_6,ldb_total_dscto,&
			ldb_pago_d1,ldb_pago_d2,ldb_pago_d3,ldb_pago_d4,ldb_pago_d5,ldb_pago_d6,ldb_dscto_d1,ldb_dscto_d2,ldb_dscto_d3,ldb_dscto_d4,ldb_dscto_d5,ldb_dscto_d6,&
			ll_llave_fallecido

ll_tot_reg						= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_cod_est_ctto				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'cod_estado_contrato')
	ls_base						= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'base')
	ls_serie						= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'serie')
	ll_numero					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'numero')
	if not isnull(ls_base) and not isnull(ls_serie) and isnull(ls_cod_est_ctto) and ll_numero>0 then
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_estado_contrato','E')
	end if
	ll_corr_interno				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_interno')
	ll_llave						= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'llave')
	ll_rut_fall						= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'rut_fallecido')
	ls_dv_fall						= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'dv_fallecido')
	ls_nombre_fall		 		= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'nombre_fallecido'))
	ls_ap_pat_fall		 		= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_paterno_fall'))
	ls_ap_mat_fall		 		= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_materno_fall'))
	ls_sexo_fall      			= tab_1.tabpage_1.dw_ant_fall.getItemString(ll_indi,'sexo_fallecido')
	ll_edad_fall     				= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'edad_fallecido')
	ls_tipo_via_fall  			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'tipo_via_fallecido')
	ls_direc_fall					= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'direccion_fall'))
	ls_num_dir_fall				= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'numero_direccion_fall'))
	ls_dpto_dir_fall				= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'depto_direccion_fall'))
	ls_block_dir_fall			= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'block_direccion_fall'))
	ls_sector_fall	   			= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'sector_fall'))
	ls_villa_fall	   				= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'poblacion_villa_fall'))
	ls_ciud_fall	 				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_ciudad_fall')
	ls_comu_fall	   				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_comuna_fall')
	ls_cod_est_fall   			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_estado_fall')
	ls_causa_fall	   			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'causa_fallecimiento')
	ls_capilla						= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'capilla_velatoria')
	ls_dir_capilla				= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'direccion_capilla'))
	ldt_fec_defun	   			= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_defuncion')
	ldt_fec_nac 	   				= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_nacimiento_fall')
	ls_periodo_nac				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'periodo_nacimiento')
	ls_tamano					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_tamano_cuerpo')
	ls_obs_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'observacion_fallecido')
	ls_usar_capilla				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'usar_capilla')
	ll_hora_util					= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'hora_util_capilla')
	ll_minuto_util				= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'minuto_util_capilla')
	ll_sw_tit_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'sw_titular_fall')
	ll_sw_alto_impacto		= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'sw_alto_impacto')
	ls_obs_alto_impacto		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'obs_alto_impacto')
	ls_obs_cuerpo				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_obs_cuerpo')
	ll_llave_fallecido			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'llave_fallecido')
	
	ll_rut_tit						= tab_1.tabpage_2.dw_ant_titular.GetItemNumber(ll_indi,'rut_titular')
	ls_dv_tit			 			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'dv_titular')
	ls_nombre_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'nombre_titular')
	ls_ap_pat_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_paterno_titular')
	ls_ap_mat_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_materno_titular')
	ls_tipo_via_tit   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'tipo_via_titular')
	ls_direc_tit					= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'direccion_titular')
	ls_num_dir_tit	   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'num_direccion_titular')
	ls_dpto_dir_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'depto_direccion_titular')
	ls_block_dir_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'block_direccion_titular')
	ls_villa_tit	   				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'poblacion_villa_titular')
	ls_sector_tit	   				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'sector_titular')
	ls_ciud_tit	 	   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_ciudad_titular')
	ls_comu_tit	      			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_comuna_titular')
	ls_fono_titular   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'fono_titular')
	
	ls_parentesco				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'codigo_parentesco')
	ldb_monto_canc			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_cancelar')
	ll_comprobante				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'folio_comprobante')
	ldb_uf_dia					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'uf_dia')
	ldb_pago_1					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_1')
	ldb_pago_2					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_2')
	ldb_pago_3					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_3')
	ldb_pago_4					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_4')
	ldb_pago_5					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_5')
	ldb_pago_6					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_6')
	ll_sw_1						= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_1')
	ll_sw_2						= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_2')
	ll_sw_3						= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_3')
	ll_sw_4						= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_4')
	ll_sw_5						= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_5')
	ll_sw_6						= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_6')
	ls_pago_1					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_1')
	ls_pago_2					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_2')
	ls_pago_3					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_3')
	ls_pago_4					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_4')
	ls_pago_5					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_5')
	ls_pago_6					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_6')
	
	ldb_dscto_1					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_1')
	ldb_dscto_2					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_2')
	ldb_dscto_3					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_3')
	ldb_dscto_4					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_4')
	ldb_dscto_5					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_5')
	ldb_dscto_6					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_6')
	ll_sw_dscto_1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_1')
	ll_sw_dscto_2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_2')
	ll_sw_dscto_3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_3')
	ll_sw_dscto_4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_4')
	ll_sw_dscto_5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_5')
	ll_sw_dscto_6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_6')
	ls_dscto_1					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_1')
	ls_dscto_2					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_2')
	ls_dscto_3					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_3')
	ls_dscto_4					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_4')
	ls_dscto_5					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_5')
	ls_dscto_6					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_6')
	ldb_total_dscto				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_total_dscto')
	
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'capilla_velatoria',ls_capilla)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'direccion_capilla',ls_dir_capilla)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'rut_fallecido',ll_rut_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dv_fallecido',ls_dv_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'nombre_fallecido',ls_nombre_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'ap_paterno_fall',ls_ap_pat_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'ap_materno_fall',ls_ap_mat_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sexo_fallecido',ls_sexo_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'edad_fallecido',ll_edad_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'tipo_via_fallecido',ls_tipo_via_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'direccion_fall',ls_direc_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'numero_direccion_fall',ls_num_dir_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'depto_direccion_fall',ls_dpto_dir_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'block_direccion_fall',ls_block_dir_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sector_fall',ls_sector_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'poblacion_villa_fall',ls_villa_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_ciudad_fall',ls_ciud_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_comuna_fall',ls_comu_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_estado_fall',ls_cod_est_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'causa_fallecimiento',ls_causa_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fecha_defuncion',ldt_fec_defun)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fecha_nacimiento_fall',ldt_fec_nac)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'rut_titular',ll_rut_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dv_titular',ls_dv_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'nombre_titular',ls_nombre_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'ap_paterno_titular',ls_ap_pat_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'ap_materno_titular',ls_ap_mat_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'tipo_via_titular',ls_tipo_via_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'direccion_titular',ls_direc_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'num_direccion_titular',ls_num_dir_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'depto_direccion_titular',ls_dpto_dir_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'block_direccion_titular',ls_block_dir_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'poblacion_villa_titular',ls_villa_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sector_titular',ls_sector_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_ciudad_titular',ls_ciud_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_comuna_titular',ls_comu_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fono_titular',ls_fono_titular)
	
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_parentesco',ls_parentesco)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'folio_comprobante',ll_comprobante)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'uf_dia',ldb_uf_dia)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion',ls_obs)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_cancelar',ldb_monto_canc)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_otro_1',ldb_pago_1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_otro_2',ldb_pago_2)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_otro_3',ldb_pago_3)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_otro_4',ldb_pago_4)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_otro_5',ldb_pago_5)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_otro_6',ldb_pago_6)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_1',ll_sw_1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_2',ll_sw_2)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_3',ll_sw_3)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_4',ll_sw_4)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_5',ll_sw_5)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_6',ll_sw_6)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pago_otro_1',ls_pago_1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pago_otro_2',ls_pago_2)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pago_otro_3',ls_pago_3)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pago_otro_4',ls_pago_4)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pago_otro_5',ls_pago_5)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pago_otro_6',ls_pago_6)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_total_dscto',ldb_total_dscto)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_dscto_1',ldb_dscto_1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_dscto_2',ldb_dscto_2)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_dscto_3',ldb_dscto_3)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_dscto_4',ldb_dscto_4)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_dscto_5',ldb_dscto_5)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_dscto_6',ldb_dscto_6)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_dscto_1',ll_sw_dscto_1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_dscto_2',ll_sw_dscto_2)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_dscto_3',ll_sw_dscto_3)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_dscto_4',ll_sw_dscto_4)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_dscto_5',ll_sw_dscto_5)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_dscto_6',ll_sw_dscto_6)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dscto_otro_1',ls_dscto_1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dscto_otro_2',ls_dscto_2)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dscto_otro_3',ls_dscto_3)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dscto_otro_4',ls_dscto_4)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dscto_otro_5',ls_dscto_5)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dscto_otro_6',ls_dscto_6)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_liberado',ll_sw_pago_liberado)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'periodo_nacimiento',ls_periodo_nac)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_tamano_cuerpo',ls_tamano)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_fallecido',ls_obs_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'usar_capilla',ls_usar_capilla)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_util_capilla',ll_hora_util)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_util_capilla',ll_minuto_util)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_titular_fall',ll_sw_tit_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_alto_impacto',ll_sw_alto_impacto)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'obs_alto_impacto',ls_obs_alto_impacto)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_obs_cuerpo',ls_obs_cuerpo)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'llave',ll_llave)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'llave_fallecido',ll_llave_fallecido)
	
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'nombre_fallecido',ls_nombre_fall)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'ap_paterno_fall',ls_ap_pat_fall)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'ap_materno_fall',ls_ap_mat_fall)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'direccion_fall',ls_direc_fall)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'numero_direccion_fall',ls_num_dir_fall)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'depto_direccion_fall',ls_dpto_dir_fall)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'block_direccion_fall',ls_block_dir_fall)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sector_fall',ls_sector_fall)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'poblacion_villa_fall',ls_villa_fall)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'direccion_capilla',ls_dir_capilla)
	
next
tab_1.tabpage_2.dw_ant_titular.accepttext()
tab_1.tabpage_1.dw_ant_fall.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
end subroutine

public subroutine wf_valida_contrato ();String	ls_base,ls_serie,ls_sector_sepult,ls_nro_sepultura,ls_estado_ctto,&
			ls_nro_tecnico,ls_dv_titular,ls_nom_titular,ls_ap_pat_titular,ls_ap_mat_titular,&
			ls_cod_tipo_via,ls_direccion_p,ls_nro_part,ls_depto_part,ls_block_part,&
			ls_pob_part,ls_sector_part,ls_comuna_part,ls_ciudad_part,ls_fono_part,&
			ls_parque,ls_cod_age_aux,ls_descrip_estado,ls_sector,ls_sepultura,ls_base_aux,ls_serie_aux,&
			ls_pasa
Long		ll_count_fall,ll_cod_parque,ll_capacidad,ll_mora_cred,ll_mora_mant,ll_nulo,&
			ll_rut_titular,ll_resp,ll_parque_aux,ll_parque_cons
datetime	ldt_fecha_ctto
Double	ll_numero,ll_numero_aux

ls_base			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'base')
ls_serie			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'serie')
ll_numero		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero')
ll_parque_cons	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
ls_sector		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')
ls_sepultura	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')
Setnull(ll_nulo)
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ll_numero>0 and &
	not isnull(ll_numero) then
	if ls_base='O' then
		ls_pasa	= 'S'
		if ls_pasa='S' then
			SELECT	COUNT("FALLECIDOS"."LLAVE")  
			INTO 		:ll_count_fall  
			FROM 		"FALLECIDOS"  
			WHERE  ( "FALLECIDOS"."BASE" = :ls_base ) AND  
					 ( "FALLECIDOS"."SS" = :ls_serie ) AND  
					 ( "FALLECIDOS"."CONTRATO" = :ll_numero ) AND
					 ( "FALLECIDOS"."ESTADO_REG" = 'A' )   ;
			if isnull(ll_count_fall) then ll_count_fall=0
	
			SELECT	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"CADENA"."COD_PARQUE",	"PAGO_OFERTA"."CAPACIDAD",	"CADENA"."ESTADO",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"PAGO_OFERTA"."NRO_TECNICO",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR", 	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION", 	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"OFERTA_V"."FECHA" 
			INTO 		:ls_sector_sepult,		:ls_nro_sepultura,			:ll_cod_parque,			:ll_capacidad, 				:ls_estado_ctto,		:ll_mora_cred,					:ll_mora_mant,					:ls_nro_tecnico,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,						:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part,			:ldt_fecha_ctto
			FROM 		"CADENA",   "CADENA_MORA",	"CLIENTE",	"OFERTA_V",	"PAGO_OFERTA"  
			WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
					 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
					 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
					 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = 'O' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado_ctto='V' or ls_estado_ctto='C' then
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','S')
					if tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')=ll_cod_parque then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
					else
						SELECT 	"COD_PARQ"."NOMBRE"  
						INTO 		:ls_parque  
						FROM 	"COD_PARQ"  
						WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
						USING	sqlca;
						ll_resp	= messagebox("Advertencia","Parque Inválido, Promesa Registra "+ls_parque+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')=ls_sector_sepult then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector',ls_sector_sepult)
					else
						ll_resp	= messagebox("Advertencia","Sector Inválido, Promesa Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector',ls_sector_sepult)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')=ls_nro_sepultura then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura',ls_nro_sepultura)
					else
						ll_resp	= messagebox("Advertencia","Sepultura Inválida, Promesa Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura',ls_nro_sepultura)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura')
						end if
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'capacidad',ll_capacidad)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_credito',ll_mora_cred)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_mantencion',ll_mora_mant)
					if isnull(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_tecnico')) or &
						trim(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_tecnico'))='' then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_tecnico',ls_nro_tecnico)
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_estado_contrato',ls_estado_ctto)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cantidad_sepultados',ll_count_fall)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'capacidad_libre_sepultura',ll_capacidad - ll_count_fall)
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
					if (ll_capacidad - ll_count_fall)=0 then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_completa','S')
					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_completa','N')
					end if
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'rut_titular',ll_rut_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'dv_titular',ls_dv_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'nombre_titular',ls_nom_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_paterno_titular',ls_ap_pat_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_materno_titular',ls_ap_mat_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'tipo_via_titular',ls_cod_tipo_via)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'direccion_titular',ls_direccion_p)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'num_direccion_titular',ls_nro_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'depto_direccion_titular',ls_depto_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'block_direccion_titular',ls_block_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'poblacion_villa_titular',ls_pob_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'sector_titular',ls_sector_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_ciudad_titular',ls_ciudad_part)
					if idw_detalle3.retrieve(ls_ciudad_part)=0 then
						idw_detalle3.insertrow(0)
					end if
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_comuna_titular',ls_comuna_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'fono_titular',ls_fono_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_contrato',ldt_fecha_ctto)
				else
					SELECT	"ESTADO"."NOMBRE_ESTADO"  
					INTO 		:ls_descrip_estado  
					FROM 		"ESTADO"  
					WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado_ctto   ;
					messagebox("Advertencia","Recuerde Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" Estado Actual es "+ls_descrip_estado+" debe estar VIGENTE o CANCELADO, regularice en Depto. Atención Cliente")
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
				end if
			else
				SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
				INTO 		:ll_parque_aux,				:ls_cod_age_aux  
				FROM 		"CD_FOLIO"  
				WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
						 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
						 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
//					if isnull(ls_cod_age_aux) or ls_cod_age_aux='' then
//						messagebox("Advertencia","Este Contrato NO tiene Agente Asignado")
//						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
//					else
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','S')
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_credito',0)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_mantencion',0)
//					end if
				else
					messagebox("Advertencia","Contrato No Existe en Control Documentario")
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
				end if
			end if
		end if
		
	elseif ls_base='C' then
		ls_pasa		= 'S'
		if ls_pasa='S' then
			SELECT	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."CAPACIDAD",	"CONTRATO"."NRO_TEC",	"CONTRATO"."FECHA"  
			INTO 		:ls_estado_ctto,		:ll_cod_parque,			:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part  ,		:ls_sector_sepult,	:ls_nro_sepultura,		:ll_capacidad, 			:ls_nro_tecnico,			:ldt_fecha_ctto			
			FROM 		"CADENA",	"CADENA_MORA",	"CLIENTE",	"CONTRATO"  
			WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
					 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					 (("CADENA"."CODIGO" = 'C' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado_ctto='V' or ls_estado_ctto='C' then
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','S')
					if tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')=ll_cod_parque then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
					else
						SELECT 	"COD_PARQ"."NOMBRE"  
						INTO 		:ls_parque  
						FROM 	"COD_PARQ"  
						WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
						USING	sqlca;
						ll_resp	= messagebox("Advertencia","Parque Inválido, Contrato IsaCruz Registra "+ls_parque+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')=ls_sector_sepult then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector',ls_sector_sepult)
					else
						ll_resp	= messagebox("Advertencia","Sector Inválido, Contrato IsaCruz Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector',ls_sector_sepult)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')=ls_nro_sepultura then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura',ls_nro_sepultura)
					else
						ll_resp	= messagebox("Advertencia","Sepultura Inválida, Contrato IsaCruz Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura',ls_nro_sepultura)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura')
						end if
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'capacidad',ll_capacidad)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_credito',ll_mora_cred)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_mantencion',ll_mora_mant)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_tecnico',ls_nro_tecnico)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_estado_contrato',ls_estado_ctto)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'rut_titular',ll_rut_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'dv_titular',ls_dv_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'nombre_titular',ls_nom_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_paterno_titular',ls_ap_pat_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_materno_titular',ls_ap_mat_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'tipo_via_titular',ls_cod_tipo_via)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'direccion_titular',ls_direccion_p)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'num_direccion_titular',ls_nro_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'depto_direccion_titular',ls_depto_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'block_direccion_titular',ls_block_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'poblacion_villa_titular',ls_pob_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'sector_titular',ls_sector_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_ciudad_titular',ls_ciudad_part)
					if idw_detalle3.retrieve(ls_ciudad_part)=0 then
						idw_detalle3.insertrow(0)
					end if
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_comuna_titular',ls_comuna_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'fono_titular',ls_fono_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_contrato',ldt_fecha_ctto)
				else
					SELECT	"ESTADO"."NOMBRE_ESTADO"  
					INTO 		:ls_descrip_estado  
					FROM 		"ESTADO"  
					WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado_ctto   ;
					messagebox("Advertencia","Recuerde Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" Estado Actual es "+ls_descrip_estado+" debe estar VIGENTE o CANCELADO, regularice en Depto. Atención Cliente")
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
				end if
			else
				messagebox("Advertencia","Contrato No Existe en Control Documentario")
				tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
			end if
		end if
	end if
end if
end subroutine

public function string wf_validar ();string   	ls_sw='S',ls_dv_fall,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_direc_fall,ls_dpto_dir_fall,&
         	ls_block_dir_fall,ls_sector_fall,ls_villa_fall,ls_ciud_fall,ls_comu_fall,ls_cod_est_fall,ls_causa_fall,ls_num_dir_fall,ls_dv_tit,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_direc_tit,ls_num_dir_tit,&
			ls_dpto_dir_tit,ls_block_dir_tit,ls_sector_tit,ls_villa_tit,ls_ciud_tit,ls_comu_tit,ls_base,	ls_serie,ls_estad_contrato,ls_sector,ls_sepultura,ls_numero_tecni,ls_nivel,ls_est_sep_compl,&
			ls_obs_sep_comp,ls_obs_credito,ls_obs_manten,ls_fono_titular,ls_ejecutivo,ls_fono_funera,ls_pase_sepult,ls_sexo_fall,ls_tipo_via_fall,ls_tipo_via_tit,ls_parentesco,ls_sector1,ls_sepultura1,ls_obs,ls_estado_reg,&
			ls_estado_ctto,ls_cod_age_aux,ls_estado_doc1,ls_estado_doc2,ls_periodo_nac,ls_tamano,ls_obs_fall,ls_usar_capilla,ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,ls_pago_5,&
			ls_pago_6,ls_dscto_1,ls_dscto_2,ls_dscto_3,ls_dscto_4,ls_dscto_5,ls_dscto_6,ls_opera
long 		ll_rut_fall,ret,ll_rut_tit,ll_hora_sepult,ll_minuto_sepult,ll_funeraria,ll_parque,ll_capacidad,ll_cant_sepultados,ll_cap_libre_sep,&
			ll_est_credito,ll_est_manten,ll_count,ll_hora_hoy,ll_minutos_hoy,ll_edad_fall,ll_comprobante,ll_tot_reg,ll_indi,ll_corr_interno,ll_parque1,ll_parque_aux,&
			ll_hora_uso_capilla,ll_min_uso_capilla,ll_sw_otros_pagos,ll_sw_pagos1,ll_sw_pagos2,ll_sw_pagos3,ll_sw_pagos4,ll_sw_pagos5,ll_sw_pagos6,ll_sw_dscto1,&
			ll_sw_dscto2,ll_sw_dscto3,ll_sw_dscto4,ll_sw_dscto5,ll_sw_dscto6
Datetime	ldt_fec_defun,ldt_fec_nac,ldt_fech_sepult,ldt_fech_contrato,ldt_fech_recep,ldt_fecha_hoy,ldt_fecha_sepult1
Double	ldb_uf_dia,ldb_der_sepult_uf,ldb_mov_sarcofago,ldb_cambio_ubica,ldb_reduccion,ldb_cert_defuncion,ldb_monto_canc,ldb_otros_pagos,ll_numero,ldb_otros_pagos1,ldb_otros_pagos2,&
			ldb_otros_pagos3,ldb_otros_pagos4,ldb_otros_pagos5,ldb_otros_pagos6,ldb_otros_dscto1,ldb_otros_dscto2,ldb_otros_dscto3,ldb_otros_dscto4,ldb_otros_dscto5,ldb_otros_dscto6

SELECT sysdate INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
ldt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
ll_hora_hoy					= long(string(gdt_fec_sistema,'hh'))
ll_minutos_hoy				= long(string(gdt_fec_sistema,'mm'))
if is_usuario_esta='S' then
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'fecha_recepcion',ldt_fecha_hoy)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'hora_recepcion',ll_hora_hoy)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'minuto_recepcion',ll_minutos_hoy)
end if
ll_parque1					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
ls_sector1					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sector')
ls_sepultura1				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sepultura')
ldt_fecha_sepult1			= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(1,'fecha_sepultacion')
tab_1.tabpage_1.dw_ant_fall.accepttext()
tab_1.tabpage_2.dw_ant_titular.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
tab_1.tabpage_4.dw_aranceles.accepttext()
ll_tot_reg					= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
for ll_indi=1 to ll_tot_reg
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sector',ls_sector1)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sepultura',ls_sepultura1)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'fecha_sepultacion',ldt_fecha_sepult1)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'correlativo_interno',ll_indi)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'sector',ls_sector1)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'sepultura',ls_sepultura1)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'fecha_sepultacion',ldt_fecha_sepult1)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'correlativo_interno',ll_indi)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sector',ls_sector1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sepultura',ls_sepultura1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fecha_sepultacion',ldt_fecha_sepult1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'correlativo_interno',ll_indi)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'sector',ls_sector1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'sepultura',ls_sepultura1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'fecha_sepultacion',ldt_fecha_sepult1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'correlativo_interno',ll_indi)
	ll_rut_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'rut_fallecido')
	ls_dv_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'dv_fallecido')
	ls_nombre_fall		 	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'nombre_fallecido')
	ls_ap_pat_fall		 	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_paterno_fall')
	ls_ap_mat_fall		 	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_materno_fall')
	ls_sexo_fall      		= tab_1.tabpage_1.dw_ant_fall.getItemString(ll_indi,'sexo_fallecido')
	ll_edad_fall     			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'edad_fallecido')
	ls_tipo_via_fall  		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'tipo_via_fallecido')
	ls_direc_fall				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'direccion_fall')
	ls_num_dir_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'numero_direccion_fall')
	ls_dpto_dir_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'depto_direccion_fall')
	ls_block_dir_fall		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'block_direccion_fall')
	ls_sector_fall	   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'sector_fall')
	ls_villa_fall	   			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'poblacion_villa_fall')
	ls_ciud_fall	 			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_ciudad_fall')
	ls_comu_fall	   			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_comuna_fall')
	ls_cod_est_fall   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_estado_fall')
	ls_causa_fall	   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'causa_fallecimiento')
	ldt_fec_defun	   		= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_defuncion')
	ldt_fec_nac 	   			= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_nacimiento_fall')
	ls_periodo_nac			= tab_1.tabpage_1.dw_ant_fall.Getitemstring(ll_indi,'periodo_nacimiento')
	ls_tamano				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_tamano_cuerpo')
	ls_obs_fall				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'observacion_fallecido')
	ls_usar_capilla			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'usar_capilla')
	ll_hora_uso_capilla	= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'hora_util_capilla')
	ll_min_uso_capilla		= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'minuto_util_capilla')
	//ficha titular//
	ll_rut_tit					= tab_1.tabpage_2.dw_ant_titular.GetItemNumber(ll_indi,'rut_titular')
	ls_dv_tit			 		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'dv_titular')
	ls_nombre_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'nombre_titular')
	ls_ap_pat_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_paterno_titular')
	ls_ap_mat_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_materno_titular')
	ls_tipo_via_tit   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'tipo_via_titular')
	ls_direc_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'direccion_titular')
	ls_num_dir_tit	   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'num_direccion_titular')
	ls_dpto_dir_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'depto_direccion_titular')
	ls_block_dir_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'block_direccion_titular')
	ls_villa_tit	   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'poblacion_villa_titular')
	ls_sector_tit	   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'sector_titular')
	ls_ciud_tit	 	   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_ciudad_titular')
	ls_comu_tit	      		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_comuna_titular')
	ls_fono_titular   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'fono_titular')
	// ficha de sepultacion //
	ls_estado_ctto			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'c_existe_ctto')
	ls_ejecutivo        		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'codigo_ejecutivo')
	ldt_fech_sepult   		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_sepultacion')
	ll_hora_sepult    		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'hora')
	ll_minuto_sepult		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'minutos')
	ll_funeraria				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'codigo_funeraria')
	ls_fono_funera			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'fono_funeraria')
	ls_opera					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'tipo_operacion')
	ls_pase_sepult			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'pase_sepultacion')
	ls_base					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'base')
	ls_serie					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'serie')
	ll_numero				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'numero')
	ldt_fech_contrato		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_contrato')
	ls_estad_contrato		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_estado_contrato')
	ll_parque					= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cod_parque')
	ls_sector					= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'sector')
	ls_sepultura				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'sepultura')
	ls_numero_tecni		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'numero_tecnico')
	ll_capacidad				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad')
	ls_nivel					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nivel')
	ll_cant_sepultados		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cantidad_sepultados')	
	ls_est_sep_compl		= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'estado_sepultura_completa')
	ll_cap_libre_sep		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad_libre_sepultura')
	ls_obs_sep_comp		= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'observacion_sepultura_completa')
	ll_est_credito			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'estado_credito')
	ls_obs_credito			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'observacion_credito')
	ll_est_manten			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'estado_mantencion')
	ls_obs_manten			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'observacion_mantencion')
	ldt_fech_recep			= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_recepcion')
	//ARANCELES//
	ls_parentesco        	= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'codigo_parentesco')
//	ldb_monto_canc       	= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_cancelar')
	ll_comprobante       	= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'folio_comprobante')
	
	ll_sw_pagos1			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_1')
	ll_sw_pagos2			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_2')
	ll_sw_pagos3			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_3')
	ll_sw_pagos4			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_4')
	ll_sw_pagos5			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_5')
	ll_sw_pagos6			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_6')
	ls_pago_1				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_1')
	ls_pago_2				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_2')
	ls_pago_3				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_3')
	ls_pago_4				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_4')
	ls_pago_5				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_5')
	ls_pago_6				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_6')
	ldb_otros_pagos1		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_1')
	ldb_otros_pagos2		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_2')
	ldb_otros_pagos3		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_3')
	ldb_otros_pagos4		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_4')
	ldb_otros_pagos5		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_5')
	ldb_otros_pagos6		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_6')
	
	ll_sw_dscto1			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_1')
	ll_sw_dscto2			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_2')
	ll_sw_dscto3			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_3')
	ll_sw_dscto4			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_4')
	ll_sw_dscto5			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_5')
	ll_sw_dscto6			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_6')
	ls_dscto_1				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_1')
	ls_dscto_2				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_2')
	ls_dscto_3				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_3')
	ls_dscto_4				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_4')
	ls_dscto_5				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_5')
	ls_dscto_6				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_6')
	ldb_otros_dscto1		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_1')
	ldb_otros_dscto2		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_2')
	ldb_otros_dscto3		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_3')
	ldb_otros_dscto4		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_4')
	ldb_otros_dscto5		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_5')
	ldb_otros_dscto6		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_6')

	ls_estado_doc1			= 'N'
	ls_estado_doc2			= 'N'
	if isnull(ll_rut_fall) then 
		ll_rut_fall=0
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'rut_fallecido',ll_rut_fall)
	end if
	if isnull(ls_dv_fall) then
		ls_dv_fall				= ''
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'dv_fallecido',ls_dv_fall)
	end if
	if isnull(ls_nombre_fall) and ll_rut_fall>0 then
		ls_nombre_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'nombre_fallecido',ls_nombre_fall)
	end if
	if isnull(ls_ap_pat_fall) and ll_rut_fall>0 then
		ls_ap_pat_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'ap_paterno_fall',ls_ap_pat_fall)
	end if
	if isnull(ls_ap_mat_fall) and ll_rut_fall>0 then
		ls_ap_mat_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'ap_materno_fall',ls_ap_mat_fall)
	end if
	if isnull(ls_sexo_fall) and ll_rut_fall>0 then
		ls_sexo_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sexo_fallecido',ls_sexo_fall)
	end if
	if isnull(ll_edad_fall) and ll_rut_fall>0 then
		ll_edad_fall		= 0
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'edad_fallecido',ll_edad_fall)
	end if
	if isnull(ls_tipo_via_fall) and ll_rut_fall>0 then
		ls_tipo_via_fall	= '0'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'tipo_via_fallecido',ls_tipo_via_fall)
	end if
	if isnull(ls_direc_fall) and ll_rut_fall>0 then
		ls_direc_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'direccion_fall',ls_direc_fall)
	end if
	if isnull(ls_num_dir_fall) and ll_rut_fall>0 then
		ls_num_dir_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'numero_direccion_fall',ls_num_dir_fall)
	end if
	if isnull(ls_dpto_dir_fall) and ll_rut_fall>0 then
		ls_dpto_dir_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'depto_direccion_fall',ls_dpto_dir_fall)
	end if
	if isnull(ls_block_dir_fall) and ll_rut_fall>0 then
		ls_block_dir_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'block_direccion_fall',ls_block_dir_fall)
	end if
	if isnull(ls_sector_fall) and ll_rut_fall>0 then
		ls_sector_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sector_fall',ls_sector_fall)
	end if
	if isnull(ls_villa_fall) and ll_rut_fall>0 then
		ls_villa_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'poblacion_villa_fall',ls_villa_fall)
	end if
	if isnull(ls_ciud_fall) and ll_rut_fall>0 then
		ls_ciud_fall		= '0'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'codigo_ciudad_fall',ls_ciud_fall)
		if idw_detalle2.retrieve(ls_ciud_fall)=0 then
			idw_detalle2.insertrow(0)
		end if
	end if
	if (isnull(ls_comu_fall) or ls_ciud_fall='0') and ll_rut_fall>0 then
		ls_comu_fall		= '0'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'codigo_comuna_fall',ls_comu_fall)
	end if
	if isnull(ls_cod_est_fall) and ll_rut_fall>0 then
		ls_cod_est_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'cod_estado_fall',ls_cod_est_fall)
	end if
	if isnull(ls_tamano) and ll_rut_fall>0 then
		ls_tamano	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'cod_tamano_cuerpo',ls_tamano)
	end if
	if isnull(ls_obs_fall) and ll_rut_fall>0 then
		ls_obs_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'observacion_fallecido',ls_obs_fall)
	end if
	if isnull(ls_causa_fall) and ll_rut_fall>0 then
		ls_causa_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'causa_fallecimiento',ls_causa_fall)
	end if
	
	if isnull(ls_usar_capilla) then
		ls_usar_capilla	= 'N'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'usar_capilla',ls_usar_capilla)
	end if
	if isnull(ll_hora_uso_capilla) then
		ll_hora_uso_capilla	= 0
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'hora_util_capilla',ll_hora_uso_capilla)
	end if
	if isnull(ll_min_uso_capilla) then
		ll_min_uso_capilla	= 0
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'minuto_util_capilla',ll_min_uso_capilla)
	end if
//	if isnull(ll_rut_tit) then
//		ll_rut_tit			= 0
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'rut_titular',ll_rut_tit)
//	end if
//	if isnull(ls_dv_tit) then
//		ls_dv_tit			= ''
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'dv_titular',ls_dv_tit)
//	end if
//	if isnull(ls_nombre_tit) then
//		ls_nombre_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'nombre_titular',ls_nombre_tit)
//	end if
//	if isnull(ls_ap_pat_tit) then
//		ls_ap_pat_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'ap_paterno_titular',ls_ap_pat_tit)
//	end if
//	if isnull(ls_ap_mat_tit) then
//		ls_ap_mat_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'ap_materno_titular',ls_ap_mat_tit)
//	end if
//	if isnull(ls_tipo_via_tit) then
//		ls_tipo_via_tit	= '0'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'tipo_via_titular',ls_tipo_via_tit)
//	end if
//	if isnull(ls_direc_tit) then
//		ls_direc_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'direccion_titular',ls_direc_tit)
//	end if
//	if isnull(ls_num_dir_tit) then
//		ls_num_dir_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'num_direccion_titular',ls_num_dir_tit)
//	end if
//	if isnull(ls_dpto_dir_tit) then
//		ls_dpto_dir_tit	= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'depto_direccion_titular',ls_dpto_dir_tit)
//	end if
//	if isnull(ls_block_dir_tit) then
//		ls_block_dir_tit	= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'block_direccion_titular',ls_block_dir_tit)
//	end if
//	if isnull(ls_villa_tit) then
//		ls_villa_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'poblacion_villa_titular',ls_villa_tit)
//	end if
//	if isnull(ls_sector_tit) then
//		ls_sector_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'sector_titular',ls_sector_tit)
//	end if
//	if isnull(ls_ciud_tit) then
//		ls_ciud_tit			= '0'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'codigo_ciudad_titular',ls_ciud_tit)
//		if idw_detalle3.retrieve(ls_ciud_tit)=0 then
//			idw_detalle3.insertrow(0)
//		end if
//	end if
//	if isnull(ls_comu_tit) or ls_ciud_tit='0' then
//		ls_comu_tit			= '0'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'codigo_comuna_titular',ls_comu_tit)
//	end if
	if isnull(ls_fono_titular) then
		ls_fono_titular	= '-'
		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'fono_titular',ls_fono_titular)
	end if
	if isnull(ls_ejecutivo) then
		ls_ejecutivo		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_ejecutivo',ls_ejecutivo)
	end if
//	if isnull(ll_hora_sepult) then
//		ll_hora_sepult		= 0
//		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora',ll_hora_sepult)
//	end if
	if isnull(ll_minuto_sepult) then
		ll_minuto_sepult	= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minutos',ll_minuto_sepult)
	end if
	if isnull(ll_funeraria) then
		ll_funeraria		= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_funeraria',ll_funeraria)
	end if
	
	if isnull(ls_fono_funera) then
		ls_fono_funera		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fono_funeraria',ls_fono_funera)
	end if
	if isnull(ls_pase_sepult) then
		ls_pase_sepult		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pase_sepultacion',ls_pase_sepult)
	end if
	if isnull(ll_capacidad) then
		ll_capacidad		= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'capacidad',ll_capacidad)
	end if
	if isnull(ls_nivel) then
		ls_nivel				= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'nivel',ls_nivel)
	end if
	if isnull(ll_cant_sepultados) then
		ll_cant_sepultados=0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cantidad_sepultados',ll_cant_sepultados)	
	end if
	if isnull(ls_est_sep_compl) then
		ls_est_sep_compl	= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'estado_sepultura_completa',ls_est_sep_compl)
	end if
	if isnull(ll_cap_libre_sep) then
		ll_cap_libre_sep	= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'capacidad_libre_sepultura',ll_cap_libre_sep)
	end if
	if isnull(ls_obs_sep_comp) then
		ls_obs_sep_comp	= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_sepultura_completa',ls_obs_sep_comp)
	end if
	if isnull(ll_est_credito) then
		ll_est_credito		= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'estado_credito',ll_est_credito)
	end if
	if isnull(ls_obs_credito) then
		ls_obs_credito		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_credito',ls_obs_credito)
	end if
	if isnull(ll_est_manten) then
		ll_est_manten		= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'estado_mantencion',ll_est_manten)
	end if
	if isnull(ls_obs_manten) then
		ls_obs_manten		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_mantencion',ls_obs_manten)
	end if
	if isnull(ldb_monto_canc) then
		ldb_monto_canc		= 0
		tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'monto_cancelar',ldb_monto_canc)
	end if
	if isnull(ll_comprobante) then
		ll_comprobante		= 0
		tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'folio_comprobante',ll_comprobante)
	end if
	if (ls_base='O' and ll_numero>=84001 and gs_conexion="Parque El Prado") or &
		(ls_base='O' and ll_numero>=15885 and gs_conexion="Parque La Foresta") then
		SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
		INTO 		:ll_parque_aux,				:ls_cod_age_aux  
		FROM 		"CD_FOLIO"  
		WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
				 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
				 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
//			if isnull(ls_cod_age_aux) or ls_cod_age_aux='' then
//				ls_estado_doc1	= 'S'
//			end if
		else
			ls_estado_doc2	= 'S'
		end if
	end if
	if ls_estado_doc1 = 'S' then
		messagebox("Advertencia","Este Contrato NO tiene Agente Asignado")
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
		ls_sw		= 'N'
		exit
	elseif ls_estado_doc2 = 'S' then
		messagebox("Advertencia","Contrato No Existe en Control Documentario")
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
		ls_sw		= 'N'
		exit
	//FICHA SEPULTACION//
	elseif isnull(ll_hora_sepult) then
		messagebox('Advertencia','Debe Ingresar HORA DE SEPULTACION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ejecutivo) or ls_ejecutivo='' then
		messagebox('Advertencia','Debe Ingresar CODIGO EJECUTIVO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('codigo_ejecutivo')
		ls_sw		= 'N'
		exit
	elseif isnull(ldt_fech_sepult) then
		messagebox('Advertencia','Debe Ingresar FECHA SEPULTACION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_sepultacion')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_minuto_sepult) then
		messagebox('Advertencia','Debe Ingresar MINUTO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('minutos')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_funeraria) then
		messagebox('Advertencia','Debe Ingresar FUNERARIA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('codigo_funeraria')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_fono_funera) or ls_fono_funera='' then
		messagebox('Advertencia','Debe Ingresar FONO FUNERARIA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fono_funeraria')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_opera) or ls_opera='' then
		messagebox('Advertencia','Debe Ingresar TIPO OPERACION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('tipo_operacion')
		ls_sw		= 'N'
		exit	
	elseif isnull(ls_pase_sepult) or ls_pase_sepult='' then
		messagebox('Advertencia','Debe Ingresar PASE DE SEPULTACION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('pase_sepultacion')
		ls_sw		= 'N'
		exit
	elseif (isnull(ls_base) or ls_base='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar TIPO DE CONTRATO "BASE"')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('base')
		ls_sw		= 'N'
		exit
	elseif (isnull(ls_serie) or ls_serie='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar SERIE DE CONTRATO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('serie')
		ls_sw		= 'N'
		exit
	elseif (isnull(ll_numero) or ll_numero=0) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar NUMERO DE CONTRATO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
		ls_sw		= 'N'
		exit
	elseif (isnull(ldt_fech_contrato) or string(ldt_fech_contrato)='00/00/0000') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar FECHA DE CONTRATO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_contrato')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_estad_contrato) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar ESTADO CONTRATO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_estado_contrato')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_parque) or ll_parque=0 then
		messagebox('Advertencia','Debe Ingresar PARQUE')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_sector) or ls_sector='' then
		messagebox('Advertencia','Debe Ingresar SECTOR')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_sepultura) or ls_sepultura='' then
		messagebox('Advertencia','Debe Ingresar SEPULTURA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura')
		ls_sw		= 'N'
		exit
	elseif (isnull(ls_numero_tecni) or ls_numero_tecni='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar NUMERO TECNICO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_tecnico')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_capacidad) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar CAPACIDAD')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('capacidad')
		ls_sw		= 'N'
		exit
	elseif (isnull(ls_nivel) or ls_nivel='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar NIVEL')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('nivel')
		ls_sw		= 'N'
		exit
	elseif (isnull(ll_cant_sepultados) or ll_cant_sepultados < 0) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar CANTIDAD DE SEPULTADOS')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cantidad_sepultados')
		ls_sw		= 'N'
		exit
	elseif (isnull(ls_est_sep_compl) or ls_est_sep_compl='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar ESTADO SEPULTURA COMPLETA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_sepultura_completa')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_cap_libre_sep) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar CAPACIDAD LIBRE DE SEPULTURA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('capacidad_libre_sepultura')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_obs_sep_comp) or ls_obs_sep_comp='' then
		messagebox('Advertencia','Debe Ingresar OBSERVACION SEPULTURA COMPLETA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('observacion_sepultura_completa')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_est_credito) then
		messagebox('Advertencia','Debe Ingresar ESTADO CREDITO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_credito')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_est_manten) then
		messagebox('Advertencia','Debe Ingresar ESTADO MANTENCION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_mantencion')
		ls_sw		= 'N'
		exit
	elseif isnull(ldt_fech_recep) and is_usuario_esta='S' then
		messagebox('Advertencia','Debe Ingresar FECHA DE RECEPCION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_recepcion')
		ls_sw		= 'N'
		exit
	//FICHA FALLECIDO //
	elseif isnull(ll_rut_fall) then
		messagebox('Advertencia','Debe Ingresar RUT FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_dv_fall) then
		messagebox('Advertencia','Debe Ingresar DIGITO VERIFICADOR')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('dv_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_nombre_fall) or ls_nombre_fall='' then
		messagebox('Advertencia','Debe Ingresar NOMBRE FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('nombre_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ap_pat_fall) or ls_ap_pat_fall='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO PATERNO FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('ap_paterno_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ap_mat_fall) or ls_ap_mat_fall='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO MATERNO FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('ap_materno_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_sexo_fall) or ls_sexo_fall='' then
		messagebox('Advertencia','Debe Ingresar SEXO FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('sexo_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ldt_fec_nac) then
		messagebox('Advertencia','Debe Ingresar FECHA NACIMIENTO FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('fecha_nacimiento_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_edad_fall) then
		messagebox('Advertencia','Debe Ingresar EDAD FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('edad_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_periodo_nac) then
		messagebox('Advertencia','Debe Ingresar PERIODO NACIMIENTO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('periodo_nacimiento')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_tipo_via_fall) or ls_tipo_via_fall='' then
		messagebox('Advertencia','Debe Ingresar TIPO VIA')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('tipo_via_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_direc_fall) or ls_direc_fall='' then
		messagebox('Advertencia','Debe Ingresar DIRECCION FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('direccion_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_num_dir_fall) or ls_num_dir_fall='' then
		messagebox('Advertencia','Debe Ingresar NUMERO DIRECCION')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('numero_direccion_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_dpto_dir_fall) or ls_dpto_dir_fall='' then
		messagebox('Advertencia','Debe Ingresar DEPTO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('depto_direccion_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_block_dir_fall) or ls_block_dir_fall='' then
		messagebox('Advertencia','Debe Ingresar BLOCK')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('block_direccion_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_sector_fall) or ls_sector_fall='' then
		messagebox('Advertencia','Debe Ingresar SECTOR')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('sector_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_villa_fall) or ls_villa_fall='' then
		messagebox('Advertencia','Debe Ingresar VILLA O POBLACION')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('poblacion_villa_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ciud_fall) or ls_ciud_fall='' then
		messagebox('Advertencia','Debe Ingresar CIUDAD')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('codigo_ciudad_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_comu_fall) or ls_comu_fall='' then
		messagebox('Advertencia','Debe Ingresar COMUNA')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('codigo_comuna_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_cod_est_fall) or ls_cod_est_fall='' then
		messagebox('Advertencia','Debe Ingresar ESTADO CUERPO FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('cod_estado_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_tamano) or ls_tamano='' then
		messagebox('Advertencia','Debe Ingresar TAMAÑO CUERPO FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('cod_tamano_cuerpo')
		ls_sw		= 'N'
		exit
	elseif isnull(ldt_fec_defun) then
		messagebox('Advertencia','Debe Ingresar FECHA DE DEFUNCION')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('fecha_defuncion')
		ls_sw		= 'N'
		exit
//	elseif ll_parque1=102 and ls_usar_capilla='S' and (ll_hora_uso_capilla=0 or isnull(ll_hora_uso_capilla)) then
//		messagebox('Advertencia','Debe Ingresar HORARIO UTILIZACION DE CAPILLA')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('hora_util_capilla')
//		ls_sw		= 'N'
//		exit
	elseif isnull(ls_obs_fall) or ls_obs_fall='' then
		messagebox('Advertencia','Debe Ingresar OBSERVACION FALLECIMIENTO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('observacion_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_causa_fall) or ls_causa_fall='' then
		messagebox('Advertencia','Debe Ingresar CAUSA FALLECIMIENTO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('causa_fallecimiento')
		ls_sw		= 'N'
		exit
		//FICHA TITULAR//
	elseif isnull(ll_rut_tit) then
		messagebox('Advertencia','Debe Ingresar RUT TITULAR')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('rut_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_dv_tit) or ls_dv_tit='' then
		messagebox('Advertencia','Debe Ingresar DIGITO VERIFICADOR')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('dv_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_nombre_tit) or ls_nombre_tit='' then
		messagebox('Advertencia','Debe Ingresar NOMBRE FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('nombre_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ap_pat_tit) or ls_ap_pat_tit='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO PATERNO FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('ap_paterno_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ap_mat_tit) or ls_ap_mat_tit='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO MATERNO FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('ap_materno_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_tipo_via_tit) or ls_tipo_via_tit='' then
		messagebox('Advertencia','Debe Ingresar TIPO VIA')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('tipo_via_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_direc_tit) or ls_direc_tit='' then
		messagebox('Advertencia','Debe Ingresar DIRECCION FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('direccion_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_num_dir_tit) or ls_num_dir_tit='' then
		messagebox('Advertencia','Debe Ingresar NUMERO DIRECCION')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('num_direccion_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_dpto_dir_tit) or ls_dpto_dir_tit='' then
		messagebox('Advertencia','Debe Ingresar DEPTO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('depto_direccion_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_block_dir_tit) or ls_block_dir_tit='' then
		messagebox('Advertencia','Debe Ingresar BLOCK')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('block_direccion_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_sector_tit) or ls_sector_tit='' then
		messagebox('Advertencia','Debe Ingresar SECTOR')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('sector_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_villa_tit) or ls_villa_tit='' then
		messagebox('Advertencia','Debe Ingresar VILLA O POBLACION')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('poblacion_villa_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ciud_tit) or ls_ciud_tit='' then
		messagebox('Advertencia','Debe Ingresar CIUDAD')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('codigo_ciudad_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_comu_tit) or ls_comu_tit='' then
		messagebox('Advertencia','Debe Ingresar COMUNA')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('codigo_comuna_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_fono_titular) or ls_fono_titular='' then
		messagebox('Advertencia','Debe Ingresar FONO TITULAR')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('fono_titular')
		ls_sw		= 'N'
		exit
	//ARANCELES//
	elseif isnull(ls_parentesco) or ls_parentesco='' then
		tab_1.SelectedTab	= 4
		messagebox('Advertencia','Debe Ingresar PARENTESCO')
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('codigo_parentesco')
		ls_sw		= 'N'
		exit
	elseif ll_sw_pagos1=0 and isnull(ls_pago_1)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 1 Otros Pagos a Cancelar')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_1')
		ls_sw		= 'N'
		exit
	elseif ll_sw_pagos1=0 and (isnull(ldb_otros_pagos1) or ldb_otros_pagos1=0)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 1 Monto a Cancelar')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_1')
		ls_sw		= 'N'
		exit
	elseif ll_sw_pagos2=0 and isnull(ls_pago_2)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 2 Otros Pagos a Cancelar')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_2')
		ls_sw		= 'N'
		exit
	elseif ll_sw_pagos2=0 and (isnull(ldb_otros_pagos2) or ldb_otros_pagos2=0)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 2 Monto a Cancelar')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_2')
		ls_sw		= 'N'
		exit
	elseif ll_sw_pagos3=0 and isnull(ls_pago_3)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 3 Otros Pagos a Cancelar')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_3')
		ls_sw		= 'N'
		exit
	elseif ll_sw_pagos3=0 and ( isnull(ldb_otros_pagos3) or ldb_otros_pagos3=0)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 3 Monto a Cancelar')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_3')
		ls_sw		= 'N'
		exit
	elseif ll_sw_pagos4=0 and isnull(ls_pago_4)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 4 Otros Pagos a Cancelar')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_4')
		ls_sw		= 'N'
		exit
	elseif ll_sw_pagos4=0 and (isnull(ldb_otros_pagos4) or ldb_otros_pagos4=0)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 4 Monto a Cancelar')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_4')
		ls_sw		= 'N'
		exit
	elseif ll_sw_pagos5=0 and isnull(ls_pago_5)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 5 Otros Pagos a Cancelar')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_5')
		ls_sw		= 'N'
		exit
	elseif ll_sw_pagos5=0 and (isnull(ldb_otros_pagos5) or ldb_otros_pagos5=0) then
		messagebox('Advertencia','Debe Ingresar Detalle Item 5 Monto a Cancelar')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_5')
		ls_sw		= 'N'
		exit
	elseif ll_sw_pagos6=0 and isnull(ls_pago_6)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 6 Otros Pagos a Cancelar')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_6')
		ls_sw		= 'N'
		exit
	elseif ll_sw_pagos6=0 and ( isnull(ldb_otros_pagos6) or ldb_otros_pagos6=0 )  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 6 Monto a Cancelar')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_6')
		ls_sw		= 'N'
		exit
	elseif ll_sw_dscto1=0 and isnull(ls_dscto_1)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 1 Tipo Descuento')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_1')
		ls_sw		= 'N'
		exit
	elseif ll_sw_dscto1=0 and (isnull(ldb_otros_dscto1) or ldb_otros_dscto1=0)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 1 Monto Descuento')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_1')
		ls_sw		= 'N'
		exit
	elseif ll_sw_dscto2=0 and isnull(ls_dscto_2)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 2 Tipo Descuento')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_2')
		ls_sw		= 'N'
		exit
	elseif ll_sw_dscto2=0 and (isnull(ldb_otros_dscto2) or ldb_otros_dscto2=0)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 2 Monto Descuento')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_2')
		ls_sw		= 'N'
		exit
	elseif ll_sw_dscto3=0 and isnull(ls_dscto_3)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 3 Tipo Descuento')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_3')
		ls_sw		= 'N'
		exit
	elseif ll_sw_dscto3=0 and ( isnull(ldb_otros_dscto3) or ldb_otros_dscto3=0)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 3 Monto Descuento')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_3')
		ls_sw		= 'N'
		exit
	elseif ll_sw_dscto4=0 and isnull(ls_dscto_4)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 4 Tipo Descuento')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_4')
		ls_sw		= 'N'
		exit
	elseif ll_sw_dscto4=0 and (isnull(ldb_otros_dscto4) or ldb_otros_dscto4=0)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 4 Monto Descuento')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_4')
		ls_sw		= 'N'
		exit
	elseif ll_sw_dscto5=0 and isnull(ls_dscto_5)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 5 Tipo Descuento')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_5')
		ls_sw		= 'N'
		exit
	elseif ll_sw_dscto5=0 and (isnull(ldb_otros_dscto5) or ldb_otros_dscto5=0) then
		messagebox('Advertencia','Debe Ingresar Detalle Item 5 Monto Descuento')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_5')
		ls_sw		= 'N'
		exit
	elseif ll_sw_dscto6=0 and isnull(ls_dscto_6)  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 6 Tipo Descuento')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_6')
		ls_sw		= 'N'
		exit
	elseif ll_sw_dscto6=0 and ( isnull(ldb_otros_dscto6) or ldb_otros_dscto6=0 )  then
		messagebox('Advertencia','Debe Ingresar Detalle Item 6 Monto Descuento')
		tab_1.SelectedTab	= 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_6')
		ls_sw		= 'N'
		exit
	end if
next
return(ls_sw)
end function

public subroutine wf_actualizar_calculo (long al_fila);Double	ldb_valor_1,ldb_valor_2,ldb_valor_3,ldb_valor_4,ldb_valor_5,ldb_valor_6,ldb_total,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,&
			ldb_dscto_6,ldb_total_dscto

tab_1.tabpage_4.dw_aranceles.accepttext()
ldb_valor_1				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_otro_1')
ldb_valor_2				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_otro_2')
ldb_valor_3				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_otro_3')
ldb_valor_4				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_otro_4')
ldb_valor_5				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_otro_5')
ldb_valor_6				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_otro_6')
ldb_total					= round(ldb_valor_1 + ldb_valor_2 + ldb_valor_3 + ldb_valor_4 + ldb_valor_5 + ldb_valor_6,2)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'monto_cancelar',ldb_total)

ldb_dscto_1				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_dscto_1')
ldb_dscto_2				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_dscto_2')
ldb_dscto_3				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_dscto_3')
ldb_dscto_4				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_dscto_4')
ldb_dscto_5				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_dscto_5')
ldb_dscto_6				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_dscto_6')
ldb_total_dscto			= round(ldb_dscto_1 + ldb_dscto_2 + ldb_dscto_3 + ldb_dscto_4 + ldb_dscto_5 + ldb_dscto_6,2)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'monto_total_dscto',ldb_total_dscto)
tab_1.tabpage_4.dw_aranceles.accepttext()
end subroutine

public function string wf_validar_detalle_dscto (string as_tipo_dscto);String		ls_return,ls_cod_otro,ls_tipo_cob,ls_pago_m, ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,ls_pago_5,ls_pago_6
//
DECLARE x1 CURSOR FOR  
SELECT 	"TIPO_COB_OTRO_VALIDA"."CODIGO_OTRO",	 "TIPO_COB_OTRO_VALIDA"."TIPO_COB_REFERENCIA"  
FROM 	"TIPO_COB_OTRO_VALIDA"  
WHERE ("TIPO_COB_OTRO_VALIDA"."TIPO_COB_REFERENCIA" = 'L' ) AND  
			"TIPO_COB_OTRO_VALIDA"."TIPO_COMPROBANTE" = 'BE'   
USING	sqlca;
open  x1;
DO WHILE sqlca.sqlcode=0
	fetch x1 into :ls_cod_otro, :ls_tipo_cob;
	if not isnull(ls_cod_otro) then
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_1') =0 or tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_dscto_1') =0 then
			ls_pago_1			= 'L'
		end if
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_2') =0 or tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_dscto_2') =0 then
			ls_pago_2			= 'L'
		end if
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_3') =0 or tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_dscto_3') =0 then
			ls_pago_3			= 'L'
		end if
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_4') =0 or tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_dscto_4') =0 then
			ls_pago_4			= 'L'
		end if
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_5') =0 or tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_dscto_5') =0 then
			ls_pago_5			= 'L'
		end if
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_6') =0 or tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_dscto_6') =0 then
			ls_pago_6			= 'L'
		end if
		if ls_cod_otro = as_tipo_dscto and ls_pago_1 = ls_tipo_cob then
			ls_return				= 'S'
			exit
		elseif ls_cod_otro = as_tipo_dscto and ls_pago_2 = ls_tipo_cob then
			ls_return				= 'S'
			exit
		elseif ls_cod_otro = as_tipo_dscto and ls_pago_3 = ls_tipo_cob then
			ls_return				= 'S'
			exit
		elseif ls_cod_otro = as_tipo_dscto and ls_pago_4 = ls_tipo_cob then
			ls_return				= 'S'
			exit
		elseif ls_cod_otro = as_tipo_dscto and ls_pago_5 = ls_tipo_cob then
			ls_return				= 'S'
			exit
		elseif ls_cod_otro = as_tipo_dscto and ls_pago_6 = ls_tipo_cob then
			ls_return				= 'S'
			exit
		else
			ls_return				= 'N'
		end if
	end if
	Setnull(ls_cod_otro)
LOOP
close x1;

return ls_return
end function

public subroutine wf_carga_detalle_boletas (string as_base, string as_serie, long al_numero, long al_corr_interno, long al_rut_tit, date adt_fech_sepult, long al_parque);String		ls_estado_reg,ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,ls_pago_5,ls_pago_6,ls_dscto_1,ls_dscto_2,ls_dscto_3,ls_dscto_4,&
			ls_dscto_5,ls_dscto_6,ls_tipo_mov,ls_tipo_cob,ls_adicional_1,ls_adicional_2,ls_adicional_3,ls_adicional_4,ls_tipo_cobro_aux,ls_cob,&
			ls_pago_21='N'
Long		ll_tot_reg,ll_indi,ll_sw_derecho_sepult,ll_sw_pago_1,ll_sw_pago_2,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_5,ll_sw_pago_6,&
			ll_sw_dscto_1,ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,ll_sw_dscto_5,ll_sw_dscto_6,ll_total_apagar
Double	ldb_der_sepult_uf,ldb_pago_1,ldb_pago_2,ldb_pago_3,ldb_pago_4,ldb_pago_5,ldb_pago_6,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_pago,&
			ldb_dscto_4,ldb_dscto_5,ldb_dscto_6,ldb_total_dscto,ldb_monto_adc_1,ldb_monto_adc_2,ldb_monto_adc_3,ldb_monto_adc_4,ldb_iva_der_sep_uf,&
			ll_sumar,ll_calculo

DELETE FROM "FICHA_SEPULTACION_PAGO"  
WHERE 		( "FICHA_SEPULTACION_PAGO"."BASE" = :as_base ) AND  
				( "FICHA_SEPULTACION_PAGO"."SERIE" = :as_serie ) AND  
				( "FICHA_SEPULTACION_PAGO"."NUMERO" = :al_numero ) AND  
				( "FICHA_SEPULTACION_PAGO"."CORRELATIVO_FICHA" = :al_corr_interno ) AND  
				( "FICHA_SEPULTACION_PAGO"."RUT_TITULAR" = :al_rut_tit ) AND  
				( "FICHA_SEPULTACION_PAGO"."FECHA_SEPULTACION" = :adt_fech_sepult ) AND  
				( "FICHA_SEPULTACION_PAGO"."COD_PARQUE" = :al_parque ) AND
				( "FICHA_SEPULTACION_PAGO"."FOLIO_BOLETA" = 0 ) AND 
				( "FICHA_SEPULTACION_PAGO"."TIPO_FICHA" ='FR' )
USING	sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if	
ll_tot_reg						= tab_1.tabpage_4.dw_aranceles.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_estado_reg				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'estado_reg')
//	ldb_der_sepult_uf			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'valor_derecho_sepultacion_uf')
//	ldb_iva_der_sep_uf		= round(tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'compute_7'),10)
//	ll_sw_derecho_sepult		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_derecho_sepult')
	ll_sw_pago_1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_1')
	ll_sw_pago_2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_2')
	ll_sw_pago_3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_3')
	ll_sw_pago_4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_4')
	ll_sw_pago_5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_5')
	ll_sw_pago_6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_6')
	ls_pago_1					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_1')
	ls_pago_2					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_2')
	ls_pago_3					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_3')
	ls_pago_4					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_4')
	ls_pago_5					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_5')
	ls_pago_6					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_6')
	ldb_pago_1					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_1')
	ldb_pago_2					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_2')
	ldb_pago_3					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_3')
	ldb_pago_4					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_4')
	ldb_pago_5					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_5')
	ldb_pago_6					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_6')
	ll_sw_dscto_1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_1')
	ll_sw_dscto_2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_2')
	ll_sw_dscto_3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_3')
	ll_sw_dscto_4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_4')
	ll_sw_dscto_5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_5')
	ll_sw_dscto_6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_6')
	ls_dscto_1					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_1')
	ls_dscto_2					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_2')
	ls_dscto_3					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_3')
	ls_dscto_4					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_4')
	ls_dscto_5					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_5')
	ls_dscto_6					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_6')
	ldb_dscto_1					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_1')
	ldb_dscto_2					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_2')
	ldb_dscto_3					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_3')
	ldb_dscto_4					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_4')
	ldb_dscto_5					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_5')
	ldb_dscto_6					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_6')
	ldb_total_dscto				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_total_dscto')
	///////////////////////////////////////////// ADICIONALES FRANCK///////////////////////////////////////////
//	ls_adicional_1				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'adicional_1')
//	ls_adicional_2				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'adicional_2')
//	ls_adicional_3				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'adicional_3')
//	ls_adicional_4				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'adicional_4')
//	ldb_monto_adc_1			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_adicional_1')
//	ldb_monto_adc_2			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_adicional_2')
//	ldb_monto_adc_3			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_adicional_3')
//	ldb_monto_adc_4			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_adicional_4')
//	
//	ll_total_apagar				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'compute_5')
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	if ldb_dscto_1 > 0 then ldb_dscto_1 = ldb_dscto_1 * -1
	if ldb_dscto_2 > 0 then ldb_dscto_2 = ldb_dscto_2 * -1
	if ldb_dscto_3 > 0 then ldb_dscto_3 = ldb_dscto_3 * -1
	if ldb_dscto_4 > 0 then ldb_dscto_4 = ldb_dscto_4 * -1
	if ldb_dscto_5 > 0 then ldb_dscto_5 = ldb_dscto_5 * -1
	if ldb_dscto_6 > 0 then ldb_dscto_6 = ldb_dscto_6 * -1
	
//	if ll_sw_derecho_sepult=0 then
//		ls_tipo_mov				= 'M'
//		if ll_total_apagar = 0 or ll_total_apagar = 1 then
//			ls_cob				= 'BE'
//		else
//			ll_sumar				= ldb_der_sepult_uf + ldb_iva_der_sep_uf
//			if ls_pago_1 = '21' then
//				ll_sumar			= ll_sumar + ldb_pago_1
//				ls_pago_21		= 'S'
//			elseif ls_pago_2 = '21' then
//				ll_sumar			= ll_sumar + ldb_pago_2
//				ls_pago_21		= 'S'
//			elseif ls_pago_3 = '21' then
//				ll_sumar			= ll_sumar + ldb_pago_3
//				ls_pago_21		= 'S'
//			elseif ls_pago_4 = '21' then
//				ll_sumar			= ll_sumar + ldb_pago_4
//				ls_pago_21		= 'S'
//			elseif ls_pago_5 = '21' then
//				ll_sumar			= ll_sumar + ldb_pago_5
//				ls_pago_21		= 'S'
//			elseif ls_pago_6 = '21' then
//				ll_sumar			= ll_sumar + ldb_pago_6
//				ls_pago_21		= 'S'
//			end if
//			if ls_dscto_1='109' or ls_dscto_2='109' or ls_dscto_3='109' or ls_dscto_4='109' or ls_dscto_5='109' or ls_dscto_6='109' then
//				if (round(round(ll_sumar,2) + round(ldb_dscto_1,2),2) = 0) or (round(round(ll_sumar,2) + round(ldb_dscto_2,2),2) = 0) or (round(round(ll_sumar,2) + round(ldb_dscto_3,2),2) = 0) or &
//					(round(round(ll_sumar,2) + round(ldb_dscto_4,2),2) = 0) or (round(round(ll_sumar,2) + round(ldb_dscto_5,2),2) = 0) or (round(round(ll_sumar,2) + round(ldb_dscto_6,2),2) = 0) then
//					ls_cob		= 'BE'
//				else
//					ls_cob		= 'BA'
//				end if
//			else
//				ls_cob			= 'BA'
//			end if
//		end if
//		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"
//		INTO 		:ls_tipo_cob,																		:ls_tipo_cobro_aux
//		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
//		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '0' ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   AND
//					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_cob )
//		USING	sqlca;
//		if sqlca.sqlcode=0 then
//			if (ll_total_apagar = 0 or ll_total_apagar = 1) then
//				if ldb_der_sepult_uf + ldb_iva_der_sep_uf > 0 then
//					if ls_dscto_1='109' then
//						if ls_pago_1 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_1
//						elseif ls_pago_2 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_2
//						elseif ls_pago_3 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_3
//						elseif ls_pago_4 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_4
//						elseif ls_pago_5 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_5
//						elseif ls_pago_6 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_6
//						
//						else
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf
//						end if
//						if ldb_pago = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_2='109' then
//						if ls_pago_1 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_1
//						elseif ls_pago_2 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_2
//						elseif ls_pago_3 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_3
//						elseif ls_pago_4 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_4
//						elseif ls_pago_5 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_5
//						elseif ls_pago_6 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_6
//						else
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf
//						end if
//						if ldb_pago = ( ldb_dscto_2 * -1 )  then ls_tipo_cob = 'BE'
//					elseif ls_dscto_3='109' then
//						if ls_pago_1 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_1
//						elseif ls_pago_2 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_2
//						elseif ls_pago_3 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_3
//						elseif ls_pago_4 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_4
//						elseif ls_pago_5 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_5
//						elseif ls_pago_6 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_6
//						else
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf
//						end if
//						if ldb_pago = ( ldb_dscto_3 * -1 )  then ls_tipo_cob = 'BE'
//					elseif ls_dscto_4='109' then
//						if ls_pago_1 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_1
//						elseif ls_pago_2 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_2
//						elseif ls_pago_3 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_3
//						elseif ls_pago_4 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_4
//						elseif ls_pago_5 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_5
//						elseif ls_pago_6 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_6
//						else
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf
//						end if
//						if ldb_pago = ( ldb_dscto_4 * -1 )  then ls_tipo_cob = 'BE'
//					elseif ls_dscto_5='109' then
//						if ls_pago_1 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_1
//						elseif ls_pago_2 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_2
//						elseif ls_pago_3 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_3
//						elseif ls_pago_4 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_4
//						elseif ls_pago_5 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_5
//						elseif ls_pago_6 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_6
//						else
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf
//						end if
//						if ldb_pago = ( ldb_dscto_5 * -1 )  then ls_tipo_cob = 'BE'
//					elseif ls_dscto_6='109' then
//						if ls_pago_1 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_1
//						elseif ls_pago_2 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_2
//						elseif ls_pago_3 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_3
//						elseif ls_pago_4 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_4
//						elseif ls_pago_5 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_5
//						elseif ls_pago_6 = '21' then
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf + ldb_pago_6
//						else
//							ldb_pago			= ldb_der_sepult_uf + ldb_iva_der_sep_uf
//						end if
//						if ldb_pago = ( ldb_dscto_6 * -1 )  then ls_tipo_cob = 'BE'
//					end if
//				end if
//			elseif ldb_der_sepult_uf > 0 then
//				if ls_pago_1='21' then
//					if ls_dscto_1='109' then
//						ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_2='109' then
//						ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_3='109' then
//						ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_4='109' then
//						ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_5='109' then
//						ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_6='109' then
//						ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
//					end if	
//				elseif ls_pago_2='21' then
//					if ls_dscto_1='109' then
//						ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_2='109' then
//						ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_3='109' then
//						ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_4='109' then
//						ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_5='109' then
//						ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_6='109' then
//						ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
//					end if
//				elseif ls_pago_3='21' then
//					if ls_dscto_1='109' then
//						ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_2='109' then
//						ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_3='109' then
//						ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_4='109' then
//						ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_5='109' then
//						ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_6='109' then
//						ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
//					end if
//				elseif ls_pago_4='21' then
//					if ls_dscto_1='109' then
//						ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_4 = (ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_2='109' then
//						ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_4 = (ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_3='109' then
//						ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_4 = (ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_4='109' then
//						ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_4 = (ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_5='109' then
//						ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_4 = (ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_6='109' then
//						ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_4 = (ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
//					end if
//				elseif ls_pago_5='21' then
//					if ls_dscto_1='109' then
//						ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_2='109' then
//						ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_3='109' then
//						ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_4='109' then
//						ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_5='109' then
//						ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_6='109' then
//						ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
//					end if
//				elseif ls_pago_6='21' then
//					if ls_dscto_1='109' then
//						ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_2='109' then
//						ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_3='109' then
//						ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_4='109' then
//						ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_5='109' then
//						ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
//					elseif ls_dscto_6='109' then
//						ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
//						if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
//					end if
//				elseif (ldb_der_sepult_uf + ldb_iva_der_sep_uf) = (ldb_dscto_1 * -1) and ls_dscto_1='109' then
//					ls_tipo_cob = 'BE'
//				elseif (ldb_der_sepult_uf + ldb_iva_der_sep_uf) = (ldb_dscto_2 * -1) and ls_dscto_2='109' then
//					ls_tipo_cob = 'BE'
//				elseif (ldb_der_sepult_uf + ldb_iva_der_sep_uf) = (ldb_dscto_3 * -1) and ls_dscto_3='109' then
//					ls_tipo_cob = 'BE'
//				elseif (ldb_der_sepult_uf + ldb_iva_der_sep_uf) = (ldb_dscto_4 * -1) and ls_dscto_4='109' then
//					ls_tipo_cob = 'BE'
//				elseif (ldb_der_sepult_uf + ldb_iva_der_sep_uf) = (ldb_dscto_5 * -1) and ls_dscto_5='109' then
//					ls_tipo_cob = 'BE'
//				elseif (ldb_der_sepult_uf + ldb_iva_der_sep_uf) = (ldb_dscto_6 * -1) and ls_dscto_6='109' then
//					ls_tipo_cob = 'BE'
//				end if
//			end if
//			INSERT INTO "FICHA_SEPULTACION_PAGO"  
//						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   				"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX" )  
//			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_der_sepult_uf,	'0',   						:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',				:ls_tipo_cobro_aux )  
//			USING	sqlca;
//			if sqlca.sqlcode=0 then
//				commit;
//			else
//				rollback;
//			end if
//		end if
//	end if
	
	if not isnull(ls_pago_1) then
		ls_tipo_mov				= 'L'
		if ls_pago_21 = 'S' and ls_pago_1='21' then 
			SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
			INTO 		:ls_tipo_cob,																		:ls_tipo_cobro_aux  
			FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
			WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_1 ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  AND 
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_cob )
			USING	sqlca;
		else
			SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
			INTO 		:ls_tipo_cob,																		:ls_tipo_cobro_aux  
			FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
			WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_1 ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
			USING	sqlca;
		end if
		if sqlca.sqlcode=0 then
			if ls_pago_1='21' then
				if ls_dscto_1='109' and ls_pago_21='S' then
//					ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_2='109' and ls_pago_21='S' then
//					ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_3='109' and ls_pago_21='S' then
//					ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_4='109' and ls_pago_21='S' then
//					ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_5='109' and ls_pago_21='S' and ls_pago_21='S' then
//					ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_6='109' and ls_pago_21='S' then
//					ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
				end if	
			end if
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",		"TIPO_COBRO_AUX"  )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_1,	:ls_pago_1,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	if not isnull(ls_dscto_1) then
		ls_tipo_mov				= 'S'

		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"		  
		INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_1 ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  AND
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_cob )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if ls_dscto_1='109' then
				if ls_pago_1='21' then
	//				ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					ldb_dscto_1				= round(ldb_dscto_1,2) + ldb_iva_der_sep_uf
				elseif ls_pago_2='21' then
	//				ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					ldb_dscto_1				= round(ldb_dscto_1,2) + ldb_iva_der_sep_uf
				elseif ls_pago_3='21' then
	//				ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					ldb_dscto_1				= round(ldb_dscto_1,2) + ldb_iva_der_sep_uf
				elseif ls_pago_4='21' then
	//				ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_4 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					ldb_dscto_1				= round(ldb_dscto_1,2) + ldb_iva_der_sep_uf
				elseif ls_pago_5='21' then
	//				ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					ldb_dscto_1				= round(ldb_dscto_1,2) + ldb_iva_der_sep_uf
				elseif ls_pago_6='21' then
	//				ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
//					ldb_dscto_1				= round(ldb_dscto_1,2) + ldb_iva_der_sep_uf
				else
					if ldb_der_sepult_uf > 0 then
						if ldb_der_sepult_uf + ldb_iva_der_sep_uf = ( ldb_dscto_1 * -1) then
							ls_tipo_cob 			= 'BE'
						elseif ldb_der_sepult_uf + ldb_iva_der_sep_uf = ( ldb_dscto_2 * -1) then
							ls_tipo_cob 			= 'BE'	
						elseif ldb_der_sepult_uf + ldb_iva_der_sep_uf = ( ldb_dscto_3 * -1) then
							ls_tipo_cob 			= 'BE'
						elseif ldb_der_sepult_uf + ldb_iva_der_sep_uf = ( ldb_dscto_4 * -1) then
							ls_tipo_cob 			= 'BE'
						elseif ldb_der_sepult_uf + ldb_iva_der_sep_uf = ( ldb_dscto_5 * -1) then
							ls_tipo_cob 			= 'BE'
						elseif ldb_der_sepult_uf + ldb_iva_der_sep_uf = ( ldb_dscto_6 * -1) then
							ls_tipo_cob 			= 'BE'
						end if
						ldb_dscto_1				= ldb_dscto_1 + ldb_iva_der_sep_uf
					end if
				end if	
			end if
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",		"TIPO_COBRO_AUX"   )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_1,	:ls_dscto_1,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	if not isnull(ls_pago_2) then
		ls_tipo_mov				= 'L'
		if ls_pago_21 = 'S' and ls_pago_2='21' then 
			SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
			INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
			FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
			WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_2 ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   AND 
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_cob )
			USING	sqlca;
		else
			SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
			INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
			FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
			WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_2 ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
			USING	sqlca;
		end if
		if sqlca.sqlcode=0 then
			if ls_pago_2='21' then
				if ls_dscto_1='109' then
//					ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_2='109' then
//					ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_3='109' then
//					ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_4='109' then
//					ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_5='109' then
//					ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_6='109' then
//					ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
				end if	
			end if
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",		"TIPO_COBRO_AUX"   )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_2,	:ls_pago_2,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	if not isnull(ls_dscto_2) then
		ls_tipo_mov				= 'S'

		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
		INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_2 ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if ls_dscto_2='109' then
				if ls_pago_1='21' then
					ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_2='21' then
					ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_3='21' then
					ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_4='21' then
					ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_4 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_5='21' then
					ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_6='21' then
					ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
				end if	
			end if
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,		"TIPO_COBRO_AUX"  )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_2,	:ls_dscto_2,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	if not isnull(ls_pago_3) then
		ls_tipo_mov				= 'L'
		if ls_pago_21 = 'S' and ls_pago_3='21' then 
			SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
			INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
			FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
			WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_3 ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   AND 
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_cob )
			USING	sqlca;
		else
			SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
			INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
			FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
			WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_3 ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
			USING	sqlca;
		end if
		if sqlca.sqlcode=0 then
			if ls_pago_3='21' then
				if ls_dscto_1='109' then
//					ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_2='109' then
//					ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_3='109' then
//					ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_4='109' then
//					ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_5='109' then
//					ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_6='109' then
//					ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
				end if	
			end if
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,		"TIPO_COBRO_AUX"  )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_3,	:ls_pago_3,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	if not isnull(ls_dscto_3) then
		ls_tipo_mov				= 'S'

		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
		INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_3 ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if ls_dscto_3='109' then
				if ls_pago_1='21' then
//					ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_2='21' then
//					ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_3='21' then
//					ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_4='21' then
//					ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_4 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_5='21' then
//					ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_6='21' then
//					ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
				end if	
			end if
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",		"TIPO_COBRO_AUX"   )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_3,	:ls_dscto_3,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	if not isnull(ls_pago_4) then
		ls_tipo_mov				= 'L'
		if ls_pago_21 = 'S' and ls_pago_4='21' then 
			SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" 
			INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
			FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
			WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_4 ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   AND 
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_cob )
			USING	sqlca;
		else
			SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX" 
			INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
			FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
			WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_4 ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' ) 
			USING	sqlca;
		end if
		if sqlca.sqlcode=0 then
			if ls_pago_4='21' then
				if ls_dscto_1='109' then
//					ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_4 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_2='109' then
//					ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_4 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_3='109' then
//					ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_4 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_4='109' then
//					ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_4 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_5='109' then
//					ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_4 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_6='109' then
//					ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_4 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
				end if	
			end if
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",		"TIPO_COBRO_AUX"   )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_4,	:ls_pago_4,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	if not isnull(ls_dscto_4) then
		ls_tipo_mov				= 'S'

		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
		INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_4 ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if ls_dscto_4='109' then
				if ls_pago_1='21' then
//					ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_2='21' then
//					ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_3='21' then
//					ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_4='21' then
//					ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_4 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_5='21' then
//					ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_6='21' then
//					ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
				end if	
			end if
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,		"TIPO_COBRO_AUX"  )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_4,	:ls_dscto_4,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	if not isnull(ls_pago_5) then
		ls_tipo_mov				= 'L'
		if ls_pago_21 = 'S' and ls_pago_5='21' then 
			SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
			INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
			FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
			WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_5 ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   AND 
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_cob )
			USING	sqlca;
		else
			SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
			INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
			FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
			WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_5 ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' ) 
			USING	sqlca;
		end if
		if sqlca.sqlcode=0 then
			if ls_pago_5='21' then
				if ls_dscto_1='109' then
//					ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_2='109' then
//					ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_3='109' then
//					ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_4='109' then
//					ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_5='109' then
//					ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_6='109' then
//					ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
				end if	
			end if
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,		"TIPO_COBRO_AUX"  )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_5,	:ls_pago_5,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	if not isnull(ls_dscto_5) then
		ls_tipo_mov				= 'S'

		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
		INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_5 ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if ls_dscto_5='109' then
				if ls_pago_1='21' then
//					ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_2='21' then
//					ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_3='21' then
//					ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_4='21' then
//					ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_4 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_5='21' then
//					ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_6='21' then
//					ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
				end if	
			end if
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,		"TIPO_COBRO_AUX"  )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_5,	:ls_dscto_5,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	if not isnull(ls_pago_6) then
		ls_tipo_mov				= 'L'
		if ls_pago_21 = 'S' and ls_pago_6='21' then 
			SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
			INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
			FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
			WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_6 ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   AND 
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_cob )
			USING	sqlca;
		else
			SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
			INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
			FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
			WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_6 ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
						( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' ) 
			USING	sqlca;
		end if
		if sqlca.sqlcode=0 then
			if ls_pago_6='21' then
				if ls_dscto_1='109' then
//					ldb_dscto_1			= ldb_dscto_1 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_1 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_2='109' then
//					ldb_dscto_2			= ldb_dscto_2 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_2 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_3='109' then
//					ldb_dscto_3			= ldb_dscto_3 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_3 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_4='109' then
//					ldb_dscto_4			= ldb_dscto_4 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_4 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_5='109' then
//					ldb_dscto_5			= ldb_dscto_5 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_5 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_dscto_6='109' then
//					ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
				end if	
			end if
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",		"TIPO_COBRO_AUX"   )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_6,	:ls_pago_6,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	if not isnull(ls_dscto_6) then
		ls_tipo_mov				= 'S'

		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
		INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_6 ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if ls_dscto_6='109' then
				if ls_pago_1='21' then
//					ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_1 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_2='21' then
//					ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_2 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_3='21' then
//					ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_3 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_4='21' then
//					ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_4 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_5='21' then
//					ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_5 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
				elseif ls_pago_6='21' then
//					ldb_dscto_6			= ldb_dscto_6 + ldb_iva_der_sep_uf
					if ldb_der_sepult_uf + ldb_pago_6 = ( ldb_dscto_6 * -1 ) then ls_tipo_cob = 'BE'
				end if	
			end if
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,		"TIPO_COBRO_AUX"  )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_6,	:ls_dscto_6,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	/////////////// ADICIONALES ///////////////
//	if not isnull(ls_adicional_1) then
//		ls_tipo_mov				= 'L'
//
//		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
//		INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
//		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
//		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_adicional_1 ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
//		USING	sqlca;
//		if sqlca.sqlcode=0 then
//			INSERT INTO "FICHA_SEPULTACION_PAGO"  
//						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   				"CODIGO_OTRO",   		"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",		"TIPO_COBRO_AUX"   )  
//			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_monto_adc_1,	:ls_adicional_1,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
//			USING	sqlca;
//			if sqlca.sqlcode=0 then
//				commit;
//			else
//				rollback;
//			end if
//		end if
//	end if
//	if not isnull(ls_adicional_2) then
//		ls_tipo_mov				= 'L'
//
//		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
//		INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
//		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
//		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_adicional_2 ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
//		USING	sqlca;
//		if sqlca.sqlcode=0 then
//			INSERT INTO "FICHA_SEPULTACION_PAGO"  
//						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   				"CODIGO_OTRO",   		"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",		"TIPO_COBRO_AUX"   )  
//			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_monto_adc_2,	:ls_adicional_2,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
//			USING	sqlca;
//			if sqlca.sqlcode=0 then
//				commit;
//			else
//				rollback;
//			end if
//		end if
//	end if
//	if not isnull(ls_adicional_3) then
//		ls_tipo_mov				= 'L'
//
//		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
//		INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
//		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
//		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_adicional_3 ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
//		USING	sqlca;
//		if sqlca.sqlcode=0 then
//			INSERT INTO "FICHA_SEPULTACION_PAGO"  
//						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   				"CODIGO_OTRO",   		"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",		"TIPO_COBRO_AUX"   )  
//			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_monto_adc_3,	:ls_adicional_3,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
//			USING	sqlca;
//			if sqlca.sqlcode=0 then
//				commit;
//			else
//				rollback;
//			end if
//		end if
//	end if
//	if not isnull(ls_adicional_4) then
//		ls_tipo_mov				= 'L'
//
//		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		  	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
//		INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
//		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
//		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_adicional_4 ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FR' ) AND  
//					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' ) 
//		USING	sqlca;
//		if sqlca.sqlcode=0 then
//			INSERT INTO "FICHA_SEPULTACION_PAGO"  
//						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   				"CODIGO_OTRO",   		"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,		"TIPO_COBRO_AUX"  )  
//			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_monto_adc_4,	:ls_adicional_4,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FR',					:ls_tipo_cobro_aux )  
//			USING	sqlca;
//			if sqlca.sqlcode=0 then
//				commit;
//			else
//				rollback;
//			end if
//		end if
//	end if
next
end subroutine

on w_ingreso_ficha_reduccion.create
this.cb_2=create cb_2
this.dw_resumen=create dw_resumen
this.dw_reduccion=create dw_reduccion
this.cb_1=create cb_1
this.cb_tablas=create cb_tablas
this.cb_carta=create cb_carta
this.cb_volver=create cb_volver
this.cb_print=create cb_print
this.cb_eliminar=create cb_eliminar
this.cb_buscar=create cb_buscar
this.pb_primer=create pb_primer
this.pb_sigue=create pb_sigue
this.pb_antes=create pb_antes
this.pb_fin=create pb_fin
this.cb_grabar=create cb_grabar
this.cb_limpiar=create cb_limpiar
this.dw_print=create dw_print
this.tab_1=create tab_1
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_2,&
this.dw_resumen,&
this.dw_reduccion,&
this.cb_1,&
this.cb_tablas,&
this.cb_carta,&
this.cb_volver,&
this.cb_print,&
this.cb_eliminar,&
this.cb_buscar,&
this.pb_primer,&
this.pb_sigue,&
this.pb_antes,&
this.pb_fin,&
this.cb_grabar,&
this.cb_limpiar,&
this.dw_print,&
this.tab_1,&
this.cb_cerrar,&
this.gb_1,&
this.gb_2}
end on

on w_ingreso_ficha_reduccion.destroy
destroy(this.cb_2)
destroy(this.dw_resumen)
destroy(this.dw_reduccion)
destroy(this.cb_1)
destroy(this.cb_tablas)
destroy(this.cb_carta)
destroy(this.cb_volver)
destroy(this.cb_print)
destroy(this.cb_eliminar)
destroy(this.cb_buscar)
destroy(this.pb_primer)
destroy(this.pb_sigue)
destroy(this.pb_antes)
destroy(this.pb_fin)
destroy(this.cb_grabar)
destroy(this.cb_limpiar)
destroy(this.dw_print)
destroy(this.tab_1)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;long		ll_new,ll_count_usuario
Double	ldb_valor_uf_dia

Connect using Trans_1;
Connect using Trans_2;
idt_fecha_sistema	= datetime(date(gdt_fec_sistema),time('00:00:00'))
gf_centrar(w_ingreso_ficha_reduccion)
tab_1.tabpage_1.dw_ant_fall.settransobject(sqlca)
tab_1.tabpage_2.dw_ant_titular.settransobject(sqlca)
tab_1.tabpage_3.dw_ficha_sepult.settransobject(sqlca)
tab_1.tabpage_4.dw_aranceles.settransobject(sqlca)
dw_print.settransobject(sqlca)
dw_reduccion.settransobject(sqlca)
dw_resumen.settransobject(sqlca)
is_nuevo					= 'N'
SELECT	COUNT("FICHA_USUARIO_ESTADISTICO"."USUARIO")  
INTO 		:ll_count_usuario  
FROM 		"FICHA_USUARIO_ESTADISTICO"  
WHERE  ( "FICHA_USUARIO_ESTADISTICO"."ESTADO" = 'A' ) AND  
		 ( "FICHA_USUARIO_ESTADISTICO"."USUARIO" = :gs_user )   
USING		sqlca;
if ll_count_usuario=1 then
	is_usuario_esta	= 'S'
else
	is_usuario_esta	= 'N'
end if

tab_1.tabpage_3.dw_ficha_sepult.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.insertrow(0)

tab_1.tabpage_1.dw_ant_fall.getchild('llave',idw_detalle9)
idw_detalle9.settransobject(sqlca)
idw_detalle9.insertrow(0)

tab_1.tabpage_1.dw_ant_fall.getchild('codigo_comuna_fall',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.insertrow(0)

tab_1.tabpage_2.dw_ant_titular.getchild('codigo_comuna_titular',idw_detalle3)
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('sector',idw_detalle5)
idw_detalle5.settransobject(sqlca)
if idw_detalle5.retrieve(1)=0 then idw_detalle5.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('nivel',idw_detalle7)
idw_detalle7.settransobject(sqlca)
idw_detalle7.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura',idw_detalle6)
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)
tab_1.tabpage_3.dw_ficha_sepult.getchild('fecha_sepultacion_1',idw_detalle8)
idw_detalle8.settransobject(sqlca)
idw_detalle8.insertrow(0)

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_1',idw_detalle13)
idw_detalle13.settransobject(sqlca)
if idw_detalle13.retrieve('FR')=0 then
	idw_detalle13.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_2',idw_detalle14)
idw_detalle14.settransobject(sqlca)
if idw_detalle14.retrieve('FR')=0 then
	idw_detalle14.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_3',idw_detalle15)
idw_detalle15.settransobject(sqlca)
if idw_detalle15.retrieve('FR')=0 then
	idw_detalle15.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_4',idw_detalle16)
idw_detalle16.settransobject(sqlca)
if idw_detalle16.retrieve('FR')=0 then
	idw_detalle16.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_5',idw_detalle17)
idw_detalle17.settransobject(sqlca)
if idw_detalle17.retrieve('FR')=0 then
	idw_detalle17.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_6',idw_detalle18)
idw_detalle18.settransobject(sqlca)
if idw_detalle18.retrieve('FR')=0 then
	idw_detalle18.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_1',idw_detalle20)
idw_detalle20.settransobject(sqlca)
if idw_detalle20.retrieve('FR')=0 then
	idw_detalle20.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_2',idw_detalle21)
idw_detalle21.settransobject(sqlca)
if idw_detalle21.retrieve('FR')=0 then
	idw_detalle21.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_3',idw_detalle22)
idw_detalle22.settransobject(sqlca)
if idw_detalle22.retrieve('FR')=0 then
	idw_detalle22.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_4',idw_detalle23)
idw_detalle23.settransobject(sqlca)
if idw_detalle23.retrieve('FR')=0 then
	idw_detalle23.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_5',idw_detalle24)
idw_detalle24.settransobject(sqlca)
if idw_detalle24.retrieve('FR')=0 then
	idw_detalle24.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_6',idw_detalle25)
idw_detalle25.settransobject(sqlca)
if idw_detalle25.retrieve('FR')=0 then
	idw_detalle25.insertrow(0)
end if

ll_new	= tab_1.tabpage_1.dw_ant_fall.insertrow(0)
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'sw_titular_fall',1)
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'usar_capilla','N')
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'sw_alto_impacto',1)
tab_1.tabpage_2.dw_ant_titular.insertrow(0)
ll_new	= tab_1.tabpage_3.dw_ficha_sepult.insertrow(0)
if gs_depto='R' or gs_depto='M' then
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
end if
tab_1.tabpage_4.dw_aranceles.getchild('codigo_parentesco',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	idw_detalle4.retrieve(1,'FS')
elseif gs_conexion = "Parque La Foresta" then
	idw_detalle4.retrieve(11,'FS')
end if
SELECT "TASA"."CODIGO_OTRO_REDUCION" INTO :is_codigo_otro_reduc FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;

tab_1.tabpage_4.dw_aranceles.insertrow(0)
tab_1.tabpage_2.dw_ant_titular.enabled		= false
tab_1.tabpage_1.dw_ant_fall.enabled			= false
tab_1.tabpage_4.dw_aranceles.enabled		= false
tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
gs_ventana	= 'w_ingreso_ficha_reduccion'
f_valida_objeto2()

tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
w_ingreso_ficha_reduccion.setfocus()
tab_1.tabpage_3.dw_ficha_sepult.setfocus()
end event

event mousemove;tab_1.tabpage_3.st_help.visible	= false
end event

event close;Disconnect using Trans_1;
Disconnect using Trans_2;
end event

type cb_2 from commandbutton within w_ingreso_ficha_reduccion
integer x = 2107
integer y = 2512
integer width = 375
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ficha Marcado"
end type

event clicked;Long		ll_cod_parque,ll_count_reg
String	ls_sector,ls_sepultura
Datetime	ldt_fecha_sepult

tab_1.tabpage_3.dw_ficha_sepult.accepttext()
ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
ls_sector				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')
ls_sepultura			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')
ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
SELECT	Count("FICHA_REDUCCION"."FECHA_SEPULTACION")  
INTO 		:ll_count_reg  
FROM 		"FICHA_REDUCCION"  
WHERE  ( "FICHA_REDUCCION"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
		 ( "FICHA_REDUCCION"."SECTOR" = :ls_sector ) AND  
		 ( "FICHA_REDUCCION"."SEPULTURA" = :ls_sepultura ) AND  
		 ( "FICHA_REDUCCION"."COD_PARQUE" = :ll_cod_parque )   
USINg		sqlca;
if ll_count_reg>0 then
	dw_resumen.reset()
	dw_resumen.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
	if dw_resumen.rowcount() > 0 then 
		f_Print( dw_resumen )
	end if
end if
end event

type dw_resumen from datawindow within w_ingreso_ficha_reduccion
boolean visible = false
integer x = 1449
integer y = 2656
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dw_ingreso_reduccion_print_resumen"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_reduccion from datawindow within w_ingreso_ficha_reduccion
integer x = 1481
integer y = 2672
integer width = 571
integer height = 600
string title = "none"
string dataobject = "dw_imprimir_autoriza_reduccion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_ingreso_ficha_reduccion
boolean visible = false
integer x = 73
integer y = 2792
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "E-Mail"
end type

event clicked;// (pSender    VARCHAR2,--Mail Origen
//pRecipient VARCHAR2,--Mail Destino
//pSubject   VARCHAR2,--Asunto
//pMessage   VARCHAR2)--Mensaje
//String	ls_email1,ls_email2,ls_asunto,ls_texto,ls_res
//ls_email1	= 'mirkom@elprado.cl'
//ls_email2	= 'sep_prado@elprado.cl'
//ls_asunto	= 'Ejemplo2'
//ls_texto		= 'prueba ejemplo2'
//
//select	EnviarMail(:ls_email1,:ls_email2,:ls_asunto,:ls_texto) 
//INTO 		:ls_res
//from 		DUAL;
//messagebox("",ls_res)
end event

type cb_tablas from commandbutton within w_ingreso_ficha_reduccion
integer x = 2482
integer y = 2512
integer width = 201
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Tablas"
end type

event clicked;if isvalid(w_mantenedor_fune_diac_parques) then close(w_mantenedor_fune_diac_parques)
open(w_mantenedor_fune_diac_parques)
end event

type cb_carta from commandbutton within w_ingreso_ficha_reduccion
integer x = 1646
integer y = 2512
integer width = 457
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Carta &Autorización"
end type

event clicked;Long		ll_corr,ll_parque
String	ls_sector,ls_sepul
Datetime	ldt_fecha
if tab_1.tabpage_3.dw_ficha_sepult.rowcount() > 0 then 
	ll_corr		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'correlativo_interno')
	ll_parque	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
	ls_sector	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')
	ls_sepul		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')
	ldt_fecha	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
	dw_print.getchild('codigo_parentesco',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	idw_detalle4.retrieve(ll_parque,'FS')
	if ll_parque>0 and not isnull(ls_sepul) then
		if dw_print.retrieve(ll_parque,ls_sector,ls_sepul,ldt_fecha)>0 then
			dw_reduccion.retrieve(ll_parque,ls_sector,ls_sepul,ldt_fecha,ll_corr)
			f_Print( dw_reduccion )
			dw_reduccion.print()
		else
			messagebox("Advertencia","No Registra Carta de Autorización de Reduccción, debe Grabar FICHA antes de Imprimir")
		end if
	end if
end if
end event

type cb_volver from commandbutton within w_ingreso_ficha_reduccion
boolean visible = false
integer x = 2432
integer y = 2688
integer width = 215
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Volver"
end type

event getfocus;tab_1.tabpage_2.dw_ant_titular.ScrollToRow(tab_1.tabpage_2.dw_ant_titular.rowcount())
tab_1.tabpage_2.dw_ant_titular.setfocus()

tab_1.tabpage_4.dw_aranceles.ScrollToRow(tab_1.tabpage_4.dw_aranceles.rowcount())
tab_1.tabpage_4.dw_aranceles.setfocus()

tab_1.tabpage_3.dw_ficha_sepult.ScrollToRow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
tab_1.tabpage_3.dw_ficha_sepult.setfocus()

tab_1.SelectedTab	= 3
tab_1.tabpage_1.dw_ant_fall.ScrollToRow(tab_1.tabpage_1.dw_ant_fall.rowcount())
tab_1.tabpage_1.dw_ant_fall.setfocus()
tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
end event

type cb_print from commandbutton within w_ingreso_ficha_reduccion
integer x = 878
integer y = 2516
integer width = 238
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;Long		ll_cod_parque,ll_count_reg
String	ls_sector,ls_sepultura
Datetime	ldt_fecha_sepult

tab_1.tabpage_3.dw_ficha_sepult.accepttext()
ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
ls_sector				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')
ls_sepultura			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')
ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
SELECT	Count("FICHA_REDUCCION"."FECHA_SEPULTACION")  
INTO 		:ll_count_reg  
FROM 		"FICHA_REDUCCION"  
WHERE  ( "FICHA_REDUCCION"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
		 ( "FICHA_REDUCCION"."SECTOR" = :ls_sector ) AND  
		 ( "FICHA_REDUCCION"."SEPULTURA" = :ls_sepultura ) AND  
		 ( "FICHA_REDUCCION"."COD_PARQUE" = :ll_cod_parque )   
USINg		sqlca;
if ll_count_reg>0 then
	dw_print.reset()
	dw_print.getchild('codigo_parentesco',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	idw_detalle4.retrieve(ll_cod_parque,'FS')
	
	dw_print.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
	if dw_print.rowcount() > 0 then 
		f_Print( dw_print )
		dw_print.print()
	else
		messagebox("Advertencia","No Registra Ficha de Reduccción, debe Grabar antes de Imprimir")
	end if
end if
end event

type cb_eliminar from commandbutton within w_ingreso_ficha_reduccion
integer x = 1147
integer y = 2516
integer width = 229
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_resp,ll_tot_reg,ll_cod_parque2,ll_count,ll_corr,ll_rut_diacono,ll_hora,ll_min,ll_cod_fune,&
			ll_rut_fall,ll_cod_parque_desde,ll_cod_parque_hacia,ll_folio,ll_capacidad,ll_cod_parque,&
			ll_cantidad_sepult,ll_cap_libre_sepult,ll_hora_recep,ll_min_recep,ll_hora_llegada_efec,ll_min_llegada_efec,&
			ll_rut_tit,ll_edad_fall,ll_corr_int,ll_corr_mensual,ll_corr_anual,ll_anno_pase,ll_hora_def,ll_min_def,&
			ll_sw_der_sep,ll_sw_mov_sercof,ll_sw_cambio_ubi,ll_sw_reduc,ll_sw_certif_def,ll_sw_pago_lib,ll_hora_util_cap,&
			ll_min_util_cap,ll_sw_tit_fall,ll_sw_otros_pagos,ll_sw_pase_sepult,ll_sw_alto_impac,ll_sw_exhuma,ll_corr_ficha,&
			ll_elimina
String	ls_sector,ls_sepultura,ls_nom_fall,ls_ap_pat_fall,ls_nom_fall2,ls_ap_pat_fall2,ls_ap_mat_fall2,ls_dir_fall,&
			ls_pob_fall,ls_sector_fall,ls_cod_comuna_fall,ls_cod_ciudad_fall,ls_cod_ejec,ls_est_responso,ls_dv_diacono,&
			ls_dv_fall,ls_cod_estado_fall,ls_pase_sepult,ls_causa_fall,ls_capilla_vela,ls_dire_capilla,ls_cod_parentesco,&
			ls_obs,ls_base,ls_serie,ls_sector2,ls_sepultura2,ls_num_tec,ls_nivel,ls_nom_tit,ls_ap_pat_tit,ls_ap_mat_tit,&
			ls_direc_tit,ls_num_dir_tit,ls_depto_tit,ls_block_tit,ls_pob_villa_tit,ls_sector_tit,ls_cod_comuna_tit,&
			ls_cod_ciudad_tit,ls_fono_tit,ls_estado_sepult_comp,ls_obs_sepult_comp,ls_estado_cred,ls_obs_cred,ls_estado_mant,&
			ls_obs_mant,ls_vb_estadistico,ls_fono_fune,ls_cod_est_ctto,ls_dv_tit,ls_sexo_fall,ls_tipo_via_fall,ls_tipo_via_tit,&
			ls_estado_reg,ls_cod_reg_pase,ls_inscrip_pase,ls_registro_pase,ls_modif_adm,ls_periodo_nac,ls_cod_tamano_cuerpo,&
			ls_obs_fall,ls_usar_capilla,ls_ip,ls_obs_alto_imp,ls_cod_obs_cuerpo,ls_nro_dire_fall,ls_depto_fall,ls_block_fall,&
			ls_ap_mat_fall
Datetime	ldt_fecha_sepult,ldt_fec_defuncion,ldt_fec_sep,ldt_fec_nac_fall,ldt_fec_ctto,ldt_fec_recep,&
			ldt_fec_pase,ldt_fec_sistema
Double	ldb_val_der_esp,ldb_monto_cancelar,ldb_val_mov_sarcof,ldb_val_cambio_ubi,ldb_val_reduc,&
			ldb_val_certif_def,ldb_uf_dia,ldb_val_otros_pag,ldb_val_axhuma,ll_numero

ll_elimina					= 0
ll_tot_reg					= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
ll_cod_parque				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_tot_reg,'cod_parque')
ls_sector					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_tot_reg,'sector')
ls_sepultura				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_tot_reg,'sepultura')
ldt_fecha_sepult			= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(ll_tot_reg,'fecha_sepultacion')
if ll_tot_reg > 0 and not isnull(ldt_fecha_sepult) and not isnull(ls_sector) and not isnull(ls_sepultura) and ll_cod_parque > 0 then
	ll_resp					= messagebox("Advertencia","Recuerde se Eliminará Siempre La Ultima Ficha, Está seguro de Eliminar",Exclamation!,YesNo!,2)
	if ll_resp=1 then
		ls_nom_fall			= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_tot_reg,'nombre_fallecido')
		ls_ap_pat_fall		= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_tot_reg,'ap_paterno_fall')
		ls_ap_mat_fall		= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_tot_reg,'ap_materno_fall')
		ll_corr				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_tot_reg,'correlativo_interno')
		if not isnull(ldt_fecha_sepult) and ll_cod_parque>0 and not isnull(ls_sector) and not isnull(ls_sepultura) then
			SELECT	Count("FICHA_REDUCCION"."COD_PARQUE")  
			INTO 		:ll_count  
			FROM 		"FICHA_REDUCCION"  
			WHERE  ( "FICHA_REDUCCION"."COD_PARQUE" = :ll_cod_parque ) AND  
					 ( "FICHA_REDUCCION"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
					 ( "FICHA_REDUCCION"."SECTOR" = :ls_sector ) AND  
					 ( "FICHA_REDUCCION"."SEPULTURA" = :ls_sepultura )  AND
					 ( "FICHA_REDUCCION"."NOMBRE_FALLECIDO" = :ls_nom_fall )  AND
					 ( "FICHA_REDUCCION"."AP_PATERNO_FALL" = :ls_ap_pat_fall ) AND
					 ( "FICHA_REDUCCION"."AP_MATERNO_FALL" = :ls_ap_mat_fall )
			USING		sqlca;
			if ll_count>0 then
				SELECT 	"FICHA_REDUCCION"."CODIGO_EJECUTIVO",	"FICHA_REDUCCION"."FECHA_SEPULTACION",	"FICHA_REDUCCION"."HORA",	"FICHA_REDUCCION"."MINUTOS",	"FICHA_REDUCCION"."CODIGO_FUNERARIA",	"FICHA_REDUCCION"."NOMBRE_FALLECIDO",	"FICHA_REDUCCION"."AP_PATERNO_FALL",	"FICHA_REDUCCION"."AP_MATERNO_FALL",	"FICHA_REDUCCION"."DIRECCION_FALL",	"FICHA_REDUCCION"."NUMERO_DIRECCION_FALL",	"FICHA_REDUCCION"."DEPTO_DIRECCION_FALL",	"FICHA_REDUCCION"."BLOCK_DIRECCION_FALL",	"FICHA_REDUCCION"."POBLACION_VILLA_FALL",	"FICHA_REDUCCION"."SECTOR_FALL",	"FICHA_REDUCCION"."CODIGO_COMUNA_FALL",	"FICHA_REDUCCION"."CODIGO_CIUDAD_FALL",	"FICHA_REDUCCION"."FECHA_DEFUNCION",	"FICHA_REDUCCION"."ESTADO_RESPONSO",	"FICHA_REDUCCION"."RUT_DIACONO",	"FICHA_REDUCCION"."DV_DIACONO",	"FICHA_REDUCCION"."FECHA_NACIMIENTO_FALL",	"FICHA_REDUCCION"."RUT_FALLECIDO",	"FICHA_REDUCCION"."DV_FALLECIDO",	"FICHA_REDUCCION"."COD_ESTADO_FALL",	"FICHA_REDUCCION"."COD_PARQUE_DESDE",	"FICHA_REDUCCION"."COD_PARQUE_HACIA",	"FICHA_REDUCCION"."PASE_SEPULTACION",	"FICHA_REDUCCION"."CAUSA_FALLECIMIENTO",	"FICHA_REDUCCION"."CAPILLA_VELATORIA",	"FICHA_REDUCCION"."DIRECCION_CAPILLA",	"FICHA_REDUCCION"."CODIGO_PARENTESCO",	"FICHA_REDUCCION"."MONTO_CANCELAR",	"FICHA_REDUCCION"."FOLIO_COMPROBANTE",	"FICHA_REDUCCION"."OBSERVACION",	"FICHA_REDUCCION"."BASE",	"FICHA_REDUCCION"."SERIE",	"FICHA_REDUCCION"."NUMERO",	"FICHA_REDUCCION"."FECHA_CONTRATO",	"FICHA_REDUCCION"."SECTOR",	"FICHA_REDUCCION"."SEPULTURA",	"FICHA_REDUCCION"."NUMERO_TECNICO",	"FICHA_REDUCCION"."CAPACIDAD",	"FICHA_REDUCCION"."NIVEL",	"FICHA_REDUCCION"."COD_PARQUE",	"FICHA_REDUCCION"."NOMBRE_TITULAR",	"FICHA_REDUCCION"."AP_PATERNO_TITULAR",	"FICHA_REDUCCION"."AP_MATERNO_TITULAR",	"FICHA_REDUCCION"."DIRECCION_TITULAR",	"FICHA_REDUCCION"."NUM_DIRECCION_TITULAR",	"FICHA_REDUCCION"."DEPTO_DIRECCION_TITULAR",	"FICHA_REDUCCION"."BLOCK_DIRECCION_TITULAR",	"FICHA_REDUCCION"."POBLACION_VILLA_TITULAR",	"FICHA_REDUCCION"."SECTOR_TITULAR",	"FICHA_REDUCCION"."CODIGO_COMUNA_TITULAR",	"FICHA_REDUCCION"."CODIGO_CIUDAD_TITULAR",	"FICHA_REDUCCION"."FONO_TITULAR",	"FICHA_REDUCCION"."CANTIDAD_SEPULTADOS",	"FICHA_REDUCCION"."ESTADO_SEPULTURA_COMPLETA",	"FICHA_REDUCCION"."CAPACIDAD_LIBRE_SEPULTURA",	"FICHA_REDUCCION"."OBSERVACION_SEPULTURA_COMPLETA",	"FICHA_REDUCCION"."ESTADO_CREDITO",	"FICHA_REDUCCION"."OBSERVACION_CREDITO",	"FICHA_REDUCCION"."ESTADO_MANTENCION",	"FICHA_REDUCCION"."OBSERVACION_MANTENCION",	"FICHA_REDUCCION"."FECHA_RECEPCION",	"FICHA_REDUCCION"."HORA_RECEPCION",	"FICHA_REDUCCION"."MINUTO_RECEPCION",	"FICHA_REDUCCION"."HORA_LLEGADA_EFECTIVA",	"FICHA_REDUCCION"."MINUTO_LLEGADA_EFECTIVA",	"FICHA_REDUCCION"."VB_ESTADISTICO",	"FICHA_REDUCCION"."FONO_FUNERARIA",	"FICHA_REDUCCION"."COD_ESTADO_CONTRATO",	"FICHA_REDUCCION"."RUT_TITULAR",	"FICHA_REDUCCION"."DV_TITULAR",	"FICHA_REDUCCION"."VALOR_MOV_SARCOFAGO",	"FICHA_REDUCCION"."VALOR_CAMBIO_DE_UBICACION",	"FICHA_REDUCCION"."VALOR_REDUCCION",	"FICHA_REDUCCION"."VALOR_CERTIFICADO_DEFUNCION",	"FICHA_REDUCCION"."UF_DIA",	"FICHA_REDUCCION"."EDAD_FALLECIDO",	"FICHA_REDUCCION"."SEXO_FALLECIDO",	"FICHA_REDUCCION"."TIPO_VIA_FALLECIDO",	"FICHA_REDUCCION"."TIPO_VIA_TITULAR",	"FICHA_REDUCCION"."CORRELATIVO_INTERNO",	"FICHA_REDUCCION"."CORRELATIVO_MENSUAL",	"FICHA_REDUCCION"."CORRELATIVO_ANUAL",	"FICHA_REDUCCION"."ESTADO_REG",	"FICHA_REDUCCION"."COD_REGISTRO_PASE",	"FICHA_REDUCCION"."INSCRIPCION_PASE",	"FICHA_REDUCCION"."REGISTRO_PASE",	"FICHA_REDUCCION"."ANNO_PASE",	"FICHA_REDUCCION"."FECHA_PASE",	"FICHA_REDUCCION"."FECHA_SISTEMA",	"FICHA_REDUCCION"."HORA_DEF",	"FICHA_REDUCCION"."MINUTO_DEF",	"FICHA_REDUCCION"."MODIF_ADM",	"FICHA_REDUCCION"."SW_MOV_SARCOFAGO",	"FICHA_REDUCCION"."SW_CAMBIO_UBICACION",	"FICHA_REDUCCION"."SW_REDUCCION",	"FICHA_REDUCCION"."SW_CERTIFICADO_DEFUN",	"FICHA_REDUCCION"."SW_PAGO_LIBERADO",	"FICHA_REDUCCION"."PERIODO_NACIMIENTO",	"FICHA_REDUCCION"."COD_TAMANO_CUERPO",	"FICHA_REDUCCION"."OBSERVACION_FALLECIDO",	"FICHA_REDUCCION"."USAR_CAPILLA",	"FICHA_REDUCCION"."HORA_UTIL_CAPILLA",	"FICHA_REDUCCION"."MINUTO_UTIL_CAPILLA",	"FICHA_REDUCCION"."IP",	"FICHA_REDUCCION"."SW_TITULAR_FALL",	"FICHA_REDUCCION"."SW_OTROS_PAGOS",	"FICHA_REDUCCION"."VALOR_OTROS_PAGOS",	"FICHA_REDUCCION"."SW_PASE_SEPULTACION",	"FICHA_REDUCCION"."SW_ALTO_IMPACTO",	"FICHA_REDUCCION"."OBS_ALTO_IMPACTO",	"FICHA_REDUCCION"."COD_OBS_CUERPO",	"FICHA_REDUCCION"."VALOR_EXHUMACION",	"FICHA_REDUCCION"."SW_EXHUMACION",	"FICHA_REDUCCION"."CORRELATIVO_FICHA"
				INTO 		:ls_cod_ejec,									:ldt_fec_sep,									:ll_hora,						:ll_min,								:ll_cod_fune,									:ls_nom_fall2,									:ls_ap_pat_fall2,								:ls_ap_mat_fall2,								:ls_dir_fall,								:ls_nro_dire_fall,									:ls_depto_fall,									:ls_block_fall,									:ls_pob_fall,										:ls_sector_fall,						:ls_cod_comuna_fall,								:ls_cod_ciudad_fall,								:ldt_fec_defuncion,							:ls_est_responso,								:ll_rut_diacono,						:ls_dv_diacono,						:ldt_fec_nac_fall,									:ll_rut_fall,								:ls_dv_fall,								:ls_cod_estado_fall,							:ll_cod_parque_desde,						:ll_cod_parque_hacia,						:ls_pase_sepult,								:ls_causa_fall,									:ls_capilla_vela,								:ls_dire_capilla,								:ls_cod_parentesco,							:ldb_monto_cancelar,						:ll_folio,										:ls_obs,									:ls_base,						:ls_serie,						:ll_numero,							:ldt_fec_ctto,								:ls_sector2,						:ls_sepultura2,						:ls_num_tec,								:ll_capacidad,							:ls_nivel,						:ll_cod_parque2,						:ls_nom_tit,								:ls_ap_pat_tit,									:ls_ap_mat_tit,									:ls_direc_tit,									:ls_num_dir_tit,										:ls_depto_tit,											:ls_block_tit,											:ls_pob_villa_tit,									:ls_sector_tit,							:ls_cod_comuna_tit,									:ls_cod_ciudad_tit,									:ls_fono_tit,								:ll_cantidad_sepult,								:ls_estado_sepult_comp,									:ll_cap_libre_sepult,									:ls_obs_sepult_comp,												:ls_estado_cred,							:ls_obs_cred,   									:ls_estado_mant,								:ls_obs_mant,											:ldt_fec_recep,								:ll_hora_recep, 							:ll_min_recep,									:ll_hora_llegada_efec,								:ll_min_llegada_efec,								:ls_vb_estadistico,						:ls_fono_fune,								:ls_cod_est_ctto,									:ll_rut_tit,							:ls_dv_tit,								:ldb_val_mov_sarcof,								:ldb_val_cambio_ubi,										:ldb_val_reduc,								:ldb_val_certif_def,											:ldb_uf_dia,						:ll_edad_fall,								:ls_sexo_fall,								:ls_tipo_via_fall,								:ls_tipo_via_tit,								:ll_corr_int,										:ll_corr_mensual,									:ll_corr_anual,								:ls_estado_reg, 						:ls_cod_reg_pase, 							:ls_inscrip_pase,								:ls_registro_pase,						:ll_anno_pase,							:ldt_fec_pase,							:ldt_fec_sistema,							:ll_hora_def,						:ll_min_def, 							:ls_modif_adm,							:ll_sw_mov_sercof,							:ll_sw_cambio_ubi,								:ll_sw_reduc,								:ll_sw_certif_def,								:ll_sw_pago_lib,								:ls_periodo_nac,									:ls_cod_tamano_cuerpo,						:ls_obs_fall,											:ls_usar_capilla, 						:ll_hora_util_cap, 							:ll_min_util_cap,									:ls_ip,						:ll_sw_tit_fall, 								:ll_sw_otros_pagos,						:ldb_val_otros_pag,							:ll_sw_pase_sepult,								:ll_sw_alto_impac,							:ls_obs_alto_imp,								:ls_cod_obs_cuerpo,						:ldb_val_axhuma,								:ll_sw_exhuma,								:ll_corr_ficha
				FROM 		"FICHA_REDUCCION"  
				WHERE  ( "FICHA_REDUCCION"."COD_PARQUE" = :ll_cod_parque ) AND  
						 ( "FICHA_REDUCCION"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
						 ( "FICHA_REDUCCION"."SECTOR" = :ls_sector ) AND  
						 ( "FICHA_REDUCCION"."SEPULTURA" = :ls_sepultura ) AND  
						 ( "FICHA_REDUCCION"."NOMBRE_FALLECIDO" = :ls_nom_fall ) AND  
						 ( "FICHA_REDUCCION"."AP_PATERNO_FALL" = :ls_ap_pat_fall )  AND
						 ( "FICHA_REDUCCION"."AP_MATERNO_FALL" = :ls_ap_mat_fall )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					INSERT INTO "LOG_FICHA_REDUCCION"  
							 ( "LOG_FICHA_REDUCCION"."CODIGO_EJECUTIVO",	"LOG_FICHA_REDUCCION"."FECHA_SEPULTACION",	"LOG_FICHA_REDUCCION"."HORA",	"LOG_FICHA_REDUCCION"."MINUTOS",	"LOG_FICHA_REDUCCION"."CODIGO_FUNERARIA",	"LOG_FICHA_REDUCCION"."NOMBRE_FALLECIDO",	"LOG_FICHA_REDUCCION"."AP_PATERNO_FALL",	"LOG_FICHA_REDUCCION"."AP_MATERNO_FALL",	"LOG_FICHA_REDUCCION"."DIRECCION_FALL",	"LOG_FICHA_REDUCCION"."NUMERO_DIRECCION_FALL",	"LOG_FICHA_REDUCCION"."DEPTO_DIRECCION_FALL",	"LOG_FICHA_REDUCCION"."BLOCK_DIRECCION_FALL",	"LOG_FICHA_REDUCCION"."POBLACION_VILLA_FALL",	"LOG_FICHA_REDUCCION"."SECTOR_FALL",	"LOG_FICHA_REDUCCION"."CODIGO_COMUNA_FALL",	"LOG_FICHA_REDUCCION"."CODIGO_CIUDAD_FALL",	"LOG_FICHA_REDUCCION"."FECHA_DEFUNCION",	"LOG_FICHA_REDUCCION"."ESTADO_RESPONSO",	"LOG_FICHA_REDUCCION"."RUT_DIACONO",	"LOG_FICHA_REDUCCION"."DV_DIACONO",	"LOG_FICHA_REDUCCION"."FECHA_NACIMIENTO_FALL",	"LOG_FICHA_REDUCCION"."RUT_FALLECIDO",	"LOG_FICHA_REDUCCION"."DV_FALLECIDO",	"LOG_FICHA_REDUCCION"."COD_ESTADO_FALL",	"LOG_FICHA_REDUCCION"."COD_PARQUE_DESDE",	"LOG_FICHA_REDUCCION"."COD_PARQUE_HACIA",	"LOG_FICHA_REDUCCION"."PASE_SEPULTACION",	"LOG_FICHA_REDUCCION"."CAUSA_FALLECIMIENTO",	"LOG_FICHA_REDUCCION"."CAPILLA_VELATORIA",	"LOG_FICHA_REDUCCION"."DIRECCION_CAPILLA",	"LOG_FICHA_REDUCCION"."CODIGO_PARENTESCO",	"LOG_FICHA_REDUCCION"."MONTO_CANCELAR",	"LOG_FICHA_REDUCCION"."FOLIO_COMPROBANTE",	"LOG_FICHA_REDUCCION"."OBSERVACION",	"LOG_FICHA_REDUCCION"."BASE",	"LOG_FICHA_REDUCCION"."SERIE",	"LOG_FICHA_REDUCCION"."NUMERO",	"LOG_FICHA_REDUCCION"."FECHA_CONTRATO",	"LOG_FICHA_REDUCCION"."SECTOR",	"LOG_FICHA_REDUCCION"."SEPULTURA",	"LOG_FICHA_REDUCCION"."NUMERO_TECNICO",	"LOG_FICHA_REDUCCION"."CAPACIDAD",	"LOG_FICHA_REDUCCION"."NIVEL",	"LOG_FICHA_REDUCCION"."COD_PARQUE",	"LOG_FICHA_REDUCCION"."NOMBRE_TITULAR",	"LOG_FICHA_REDUCCION"."AP_PATERNO_TITULAR",	"LOG_FICHA_REDUCCION"."AP_MATERNO_TITULAR",	"LOG_FICHA_REDUCCION"."DIRECCION_TITULAR",	"LOG_FICHA_REDUCCION"."NUM_DIRECCION_TITULAR",	"LOG_FICHA_REDUCCION"."DEPTO_DIRECCION_TITULAR",	"LOG_FICHA_REDUCCION"."BLOCK_DIRECCION_TITULAR",	"LOG_FICHA_REDUCCION"."POBLACION_VILLA_TITULAR",	"LOG_FICHA_REDUCCION"."SECTOR_TITULAR",	"LOG_FICHA_REDUCCION"."CODIGO_COMUNA_TITULAR",	"LOG_FICHA_REDUCCION"."CODIGO_CIUDAD_TITULAR",	"LOG_FICHA_REDUCCION"."FONO_TITULAR",	"LOG_FICHA_REDUCCION"."CANTIDAD_SEPULTADOS",	"LOG_FICHA_REDUCCION"."ESTADO_SEPULTURA_COMPLETA",	"LOG_FICHA_REDUCCION"."CAPACIDAD_LIBRE_SEPULTURA",	"LOG_FICHA_REDUCCION"."OBSERVACION_SEPULTURA_COMPLETA",	"LOG_FICHA_REDUCCION"."ESTADO_CREDITO",	"LOG_FICHA_REDUCCION"."OBSERVACION_CREDITO",	"LOG_FICHA_REDUCCION"."ESTADO_MANTENCION",	"LOG_FICHA_REDUCCION"."OBSERVACION_MANTENCION",	"LOG_FICHA_REDUCCION"."FECHA_RECEPCION",	"LOG_FICHA_REDUCCION"."HORA_RECEPCION",	"LOG_FICHA_REDUCCION"."MINUTO_RECEPCION",	"LOG_FICHA_REDUCCION"."HORA_LLEGADA_EFECTIVA",	"LOG_FICHA_REDUCCION"."MINUTO_LLEGADA_EFECTIVA",	"LOG_FICHA_REDUCCION"."VB_ESTADISTICO",	"LOG_FICHA_REDUCCION"."FONO_FUNERARIA",	"LOG_FICHA_REDUCCION"."COD_ESTADO_CONTRATO",	"LOG_FICHA_REDUCCION"."RUT_TITULAR",	"LOG_FICHA_REDUCCION"."DV_TITULAR",	"LOG_FICHA_REDUCCION"."VALOR_MOV_SARCOFAGO",	"LOG_FICHA_REDUCCION"."VALOR_CAMBIO_DE_UBICACION",	"LOG_FICHA_REDUCCION"."VALOR_REDUCCION",	"LOG_FICHA_REDUCCION"."VALOR_CERTIFICADO_DEFUNCION",	"LOG_FICHA_REDUCCION"."UF_DIA",	"LOG_FICHA_REDUCCION"."EDAD_FALLECIDO",	"LOG_FICHA_REDUCCION"."SEXO_FALLECIDO",	"LOG_FICHA_REDUCCION"."TIPO_VIA_FALLECIDO",	"LOG_FICHA_REDUCCION"."TIPO_VIA_TITULAR",	"LOG_FICHA_REDUCCION"."CORRELATIVO_INTERNO",	"LOG_FICHA_REDUCCION"."CORRELATIVO_MENSUAL",	"LOG_FICHA_REDUCCION"."CORRELATIVO_ANUAL",	"LOG_FICHA_REDUCCION"."ESTADO_REG",	"LOG_FICHA_REDUCCION"."COD_REGISTRO_PASE",	"LOG_FICHA_REDUCCION"."INSCRIPCION_PASE",	"LOG_FICHA_REDUCCION"."REGISTRO_PASE",	"LOG_FICHA_REDUCCION"."ANNO_PASE",	"LOG_FICHA_REDUCCION"."FECHA_PASE",	"LOG_FICHA_REDUCCION"."FECHA_SISTEMA",	"LOG_FICHA_REDUCCION"."HORA_DEF",	"LOG_FICHA_REDUCCION"."MINUTO_DEF",	"LOG_FICHA_REDUCCION"."MODIF_ADM",	"LOG_FICHA_REDUCCION"."SW_MOV_SARCOFAGO",	"LOG_FICHA_REDUCCION"."SW_CAMBIO_UBICACION",	"LOG_FICHA_REDUCCION"."SW_REDUCCION",	"LOG_FICHA_REDUCCION"."SW_CERTIFICADO_DEFUN",	"LOG_FICHA_REDUCCION"."SW_PAGO_LIBERADO",	"LOG_FICHA_REDUCCION"."PERIODO_NACIMIENTO",	"LOG_FICHA_REDUCCION"."COD_TAMANO_CUERPO",	"LOG_FICHA_REDUCCION"."OBSERVACION_FALLECIDO",	"LOG_FICHA_REDUCCION"."USAR_CAPILLA",	"LOG_FICHA_REDUCCION"."HORA_UTIL_CAPILLA",	"LOG_FICHA_REDUCCION"."MINUTO_UTIL_CAPILLA",	"LOG_FICHA_REDUCCION"."IP",	"LOG_FICHA_REDUCCION"."SW_TITULAR_FALL",	"LOG_FICHA_REDUCCION"."SW_OTROS_PAGOS",	"LOG_FICHA_REDUCCION"."VALOR_OTROS_PAGOS",	"LOG_FICHA_REDUCCION"."SW_PASE_SEPULTACION",	"LOG_FICHA_REDUCCION"."SW_ALTO_IMPACTO",	"LOG_FICHA_REDUCCION"."OBS_ALTO_IMPACTO",	"LOG_FICHA_REDUCCION"."COD_OBS_CUERPO",	"LOG_FICHA_REDUCCION"."VALOR_EXHUMACION",	"LOG_FICHA_REDUCCION"."SW_EXHUMACION",	"CORRELATIVO_FICHA",	"USUARIO_ELIMINA" )
					VALUES ( :ls_cod_ejec,											:ldt_fec_sep,											:ll_hora,								:ll_min,										:ll_cod_fune,											:ls_nom_fall2,											:ls_ap_pat_fall2,										:ls_ap_mat_fall2,										:ls_dir_fall,										:ls_nro_dire_fall,											:ls_depto_fall,											:ls_block_fall,											:ls_pob_fall,												:ls_sector_fall,								:ls_cod_comuna_fall,										:ls_cod_ciudad_fall,										:ldt_fec_defuncion,									:ls_est_responso,										:ll_rut_diacono,								:ls_dv_diacono,								:ldt_fec_nac_fall,											:ll_rut_fall,										:ls_dv_fall,										:ls_cod_estado_fall,									:ll_cod_parque_desde,								:ll_cod_parque_hacia,								:ls_pase_sepult,										:ls_causa_fall,											:ls_capilla_vela,										:ls_dire_capilla,										:ls_cod_parentesco,									:ldb_monto_cancelar,								:ll_folio,												:ls_obs,											:ls_base,								:ls_serie,								:ll_numero,									:ldt_fec_ctto,										:ls_sector2,								:ls_sepultura2,								:ls_num_tec,										:ll_capacidad,									:ls_nivel,								:ll_cod_parque2,								:ls_nom_tit,										:ls_ap_pat_tit,											:ls_ap_mat_tit,											:ls_direc_tit,											:ls_num_dir_tit,												:ls_depto_tit,													:ls_block_tit,													:ls_pob_villa_tit,											:ls_sector_tit,									:ls_cod_comuna_tit,											:ls_cod_ciudad_tit,											:ls_fono_tit,										:ll_cantidad_sepult,										:ls_estado_sepult_comp,											:ll_cap_libre_sepult,											:ls_obs_sepult_comp,														:ls_estado_cred,									:ls_obs_cred,   											:ls_estado_mant,										:ls_obs_mant,													:ldt_fec_recep,										:ll_hora_recep, 									:ll_min_recep,											:ll_hora_llegada_efec,										:ll_min_llegada_efec,										:ls_vb_estadistico,								:ls_fono_fune,										:ls_cod_est_ctto,											:ll_rut_tit,									:ls_dv_tit,										:ldb_val_mov_sarcof,										:ldb_val_cambio_ubi,												:ldb_val_reduc,										:ldb_val_certif_def,													:ldb_uf_dia,								:ll_edad_fall,										:ls_sexo_fall,										:ls_tipo_via_fall,										:ls_tipo_via_tit,										:ll_corr_int,												:ll_corr_mensual,											:ll_corr_anual,										:ls_estado_reg, 								:ls_cod_reg_pase, 									:ls_inscrip_pase,										:ls_registro_pase,								:ll_anno_pase,									:ldt_fec_pase,									:ldt_fec_sistema,									:ll_hora_def,								:ll_min_def, 									:ls_modif_adm,									:ll_sw_mov_sercof,									:ll_sw_cambio_ubi,										:ll_sw_reduc,										:ll_sw_certif_def,										:ll_sw_pago_lib,										:ls_periodo_nac,											:ls_cod_tamano_cuerpo,								:ls_obs_fall,													:ls_usar_capilla, 								:ll_hora_util_cap, 									:ll_min_util_cap,											:ls_ip,								:ll_sw_tit_fall, 										:ll_sw_otros_pagos,								:ldb_val_otros_pag,									:ll_sw_pase_sepult,										:ll_sw_alto_impac,									:ls_obs_alto_imp,										:ls_cod_obs_cuerpo,								:ldb_val_axhuma,										:ll_sw_exhuma,										:ll_corr_ficha,		:gs_user )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
				tab_1.tabpage_3.dw_ficha_sepult.deleterow(ll_tot_reg)
				if tab_1.tabpage_3.dw_ficha_sepult.update()=1 then
					commit;
					ll_tot_reg	= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
					if ll_tot_reg = 0 then
						tab_1.tabpage_1.dw_ant_fall.reset()
						tab_1.tabpage_2.dw_ant_titular.reset()
						tab_1.tabpage_3.dw_ficha_sepult.reset()
						tab_1.tabpage_4.dw_aranceles.reset()
						idw_detalle.reset()
						idw_detalle.insertrow(0)
						idw_detalle2.reset()
						idw_detalle2.insertrow(0)
						idw_detalle9.reset()
						idw_detalle9.insertrow(0)
						idw_detalle3.reset()
						idw_detalle3.insertrow(0)
						idw_detalle5.reset()
						idw_detalle5.insertrow(0)
						idw_detalle6.reset()
						idw_detalle6.insertrow(0)
						idw_detalle8.reset()
						idw_detalle8.insertrow(0)
						idw_detalle4.reset()
						idw_detalle4.insertrow(0)
						tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
						tab_1.tabpage_1.dw_ant_fall.setitem(1,'sw_titular_fall',1)
						tab_1.tabpage_1.dw_ant_fall.setitem(1,'usar_capilla','N')
						tab_1.tabpage_1.dw_ant_fall.setitem(1,'sw_alto_impacto',1)
						tab_1.tabpage_2.dw_ant_titular.InsertRow(0)
						tab_1.tabpage_3.dw_ficha_sepult.InsertRow(0)
						tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sw_pase_sepultacion',1)
						if gs_depto='R' or gs_depto='M' then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'codigo_ejecutivo',gs_user)
						end if
						tab_1.tabpage_4.dw_aranceles.InsertRow(0)
						tab_1.tabpage_1.dw_ant_fall.enabled	      = false
						tab_1.tabpage_2.dw_ant_titular.enabled		= false
						tab_1.tabpage_4.dw_aranceles.enabled		= false
						tab_1.tabpage_1.dw_ant_fall.accepttext()
						tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						tab_1.tabpage_3.dw_ficha_sepult.enabled	= true   
						tab_1.SelectTab(1)
						tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
						tab_1.tabpage_3.dw_ficha_sepult.setfocus()
					end if
					if ll_elimina=0 then
						messagebox("Eliminar","Eliminación Exitosa")
					elseif ll_elimina>0 then
						messagebox("Eliminar","Eliminación Exitosa de Ficha, pero NO la Carta de Autorización o Solicitud de Grabación de Lápida")
					end if
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
					tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				else
					rollback;
				end if
			end if
		end if
		cb_grabar.setfocus()
	end if
end if
end event

type cb_buscar from commandbutton within w_ingreso_ficha_reduccion
integer x = 421
integer y = 2512
integer width = 398
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Ficha"
end type

event clicked;if isvalid(w_buscar_ficha) then close(w_buscar_ficha)
Long		ll_resp
string	ls_tabpage

tab_1.tabpage_1.dw_ant_fall.reset()
tab_1.tabpage_2.dw_ant_titular.reset()
tab_1.tabpage_3.dw_ficha_sepult.reset()
tab_1.tabpage_4.dw_aranceles.reset()
tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
tab_1.tabpage_2.dw_ant_titular.InsertRow(0)
tab_1.tabpage_3.dw_ficha_sepult.InsertRow(0)
if gs_depto='R' or gs_depto='M' then
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'codigo_ejecutivo',gs_user)
end if
tab_1.tabpage_4.dw_aranceles.InsertRow(0)
tab_1.tabpage_1.dw_ant_fall.enabled	      = false
tab_1.tabpage_2.dw_ant_titular.enabled		= false
tab_1.tabpage_4.dw_aranceles.enabled		= false
tab_1.tabpage_3.dw_ficha_sepult.enabled	= true   
tab_1.SelectTab(1)
tab_1.tabpage_1.dw_ant_fall.setfocus()
tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
OpenWithParm(w_buscar_ficha, "FR")
end event

type pb_primer from picturebutton within w_ingreso_ficha_reduccion
integer x = 2875
integer y = 2516
integer width = 119
integer height = 88
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_ant_fall.ScrollToRow(1)
tab_1.tabpage_1.dw_ant_fall.setfocus()

tab_1.tabpage_2.dw_ant_titular.ScrollToRow(1)
tab_1.tabpage_2.dw_ant_titular.setfocus()

tab_1.tabpage_3.dw_ficha_sepult.ScrollToRow(1)
tab_1.tabpage_3.dw_ficha_sepult.setfocus()

tab_1.tabpage_4.dw_aranceles.ScrollToRow(1)
tab_1.tabpage_4.dw_aranceles.setfocus()

end event

type pb_sigue from picturebutton within w_ingreso_ficha_reduccion
integer x = 2999
integer y = 2516
integer width = 119
integer height = 88
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_ant_fall.ScrollPriorPage( )
tab_1.tabpage_1.dw_ant_fall.setfocus()

tab_1.tabpage_2.dw_ant_titular.ScrollPriorPage( )
tab_1.tabpage_2.dw_ant_titular.setfocus()

tab_1.tabpage_3.dw_ficha_sepult.ScrollPriorPage( )
tab_1.tabpage_3.dw_ficha_sepult.setfocus()

tab_1.tabpage_4.dw_aranceles.ScrollPriorPage( )
tab_1.tabpage_4.dw_aranceles.setfocus()

end event

type pb_antes from picturebutton within w_ingreso_ficha_reduccion
integer x = 3122
integer y = 2516
integer width = 119
integer height = 88
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_ant_fall.ScrollNextPage( )
tab_1.tabpage_1.dw_ant_fall.setfocus()

tab_1.tabpage_2.dw_ant_titular.ScrollNextPage( )
tab_1.tabpage_2.dw_ant_titular.setfocus()

tab_1.tabpage_3.dw_ficha_sepult.ScrollNextPage( )
tab_1.tabpage_3.dw_ficha_sepult.setfocus()

tab_1.tabpage_4.dw_aranceles.ScrollNextPage( )
tab_1.tabpage_4.dw_aranceles.setfocus()
end event

type pb_fin from picturebutton within w_ingreso_ficha_reduccion
integer x = 3246
integer y = 2516
integer width = 119
integer height = 88
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_ant_fall.ScrollToRow(tab_1.tabpage_1.dw_ant_fall.rowcount())
tab_1.tabpage_1.dw_ant_fall.setfocus()

tab_1.tabpage_2.dw_ant_titular.ScrollToRow(tab_1.tabpage_2.dw_ant_titular.rowcount())
tab_1.tabpage_2.dw_ant_titular.setfocus()

tab_1.tabpage_3.dw_ficha_sepult.ScrollToRow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
tab_1.tabpage_3.dw_ficha_sepult.setfocus()

tab_1.tabpage_4.dw_aranceles.ScrollToRow(tab_1.tabpage_4.dw_aranceles.rowcount())
tab_1.tabpage_4.dw_aranceles.setfocus()
end event

type cb_grabar from commandbutton within w_ingreso_ficha_reduccion
integer x = 50
integer y = 2512
integer width = 315
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string   	ls_sw='S',ls_dv_fall,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_direc_fall,ls_dpto_dir_fall,ls_block_dir_fall,ls_sector_fall,ls_villa_fall,ls_ciud_fall,ls_comu_fall,ls_cod_est_fall,ls_causa_fall,&
			ls_num_dir_fall,ls_dv_tit,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_direc_tit,ls_num_dir_tit,ls_dpto_dir_tit,ls_block_dir_tit,ls_sector_tit,ls_villa_tit,ls_ciud_tit,ls_comu_tit,ls_base,&
			ls_serie,ls_estad_contrato,ls_sector,ls_sepultura,ls_numero_tecni,ls_nivel,ls_est_sep_compl,ls_obs_sep_comp,ls_obs_credito,ls_obs_manten,ls_fono_titular,ls_ejecutivo,ls_fono_funera,ls_pase_sepult,&
			ls_sexo_fall,ls_tipo_via_fall,ls_tipo_via_tit,ls_parentesco,ls_sector1,ls_sepultura1,ls_obs,ls_estado_reg,ls_estado_ctto,ls_cod_age_aux,ls_estado_doc1,ls_estado_doc2,ls_primera_sepultura,ls_pasa_mora,&
			ls_email,ls_descrip_parque,ls_nom_usuario,ls_cod_tamano_cuerpo,ls_descrip_tamano,ls_obs_fall,ls_fono_com_tit,email_de,ls_email_para,ls_res,ls_pago_1,ls_pago_2,&
			ls_pago_3,ls_pago_4,ls_pago_5,ls_pago_6,ls_dscto_1,ls_dscto_2,ls_dscto_3,ls_dscto_4,ls_dscto_5,ls_dscto_6,ls_cod_regis,ls_inscripcion_pase,ls_op,ls_funeraria,ls_otorgado_por,base_s,serie_s,ls_sector_s,&
			ls_sepultura_s,ls_nombre_s,ls_ap_pat_s,ls_ap_mat_s,ls_est_s,ls_op_s,ls_dv_s,ls_sexo_s,ls_periodo_s,ls_pase_s,ls_otorgado_por_s,ls_causa_fall_s,ls_enf_obl_s,ls_funeraria_s,ls_boleta_s,ls_carta_aut_s,&
			ls_n_tec_s,ls_nivel_s,ls_vta_s,ls_observaciones_s,ls_estado_contrato_s,ls_registro_pase_s,ls_cementerio_origen_s,ls_nro_sarcofago_s,ls_cod_usuario_s,ls_usuario_ult_mod,&
			ls_estado_exhum_s,ls_estado_inhuma_s,ls_estado_ti_s,ls_estado_te_s,ls_estado_re_s,ls_estado_tr_s,ls_estado_crem_s,ls_estado_reg_s,ls_estado_fall_s,ls_base_dest_s,ls_serie_dest_s,&
			ls_usuario_crea_s,ls_tipo_ficha_s,ls_resol_traslado_nro_s,ls_nuevo,ls_periodo_nacimiento,ls_estado_tit
long 		ll_rut_fall,ret,ll_rut_tit,ll_hora_sepult,ll_minuto_sepult,ll_funeraria,ll_parque,ll_capacidad,ll_cant_sepultados,ll_cap_libre_sep,ll_res_grabar,&
			ll_est_credito,ll_est_manten,ll_count,ll_hora_hoy,ll_minutos_hoy,ll_edad_fall,ll_count_reg,ll_comprobante,ll_tot_reg,ll_indi,ll_corr_interno,ll_parque1,ll_parque_aux,ll_cod_imagen,&
			ll_mora_cred,ll_mora_mant,ll_res,ll_hora_sepult_aux,ll_min_sepult_aux,ll_count_reg_aux,ll_num_inven,ll_max_ficha,ll_sw_1,ll_sw_2,ll_sw_3,ll_sw_4,ll_sw_5,ll_sw_6,&
			ll_sw_dscto_1,ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,ll_sw_dscto_5,ll_sw_dscto_6,ll_nm,ll_nl,ll_llave_s,ll_count_parque_s,ll_n_l_s,ll_n_m_s,numero_s,ll_rut_s,ll_edad_s,&
			ll_corr_hist_reg_s,ll_cod_parque_s,ll_llave_anterior_s,ll_folio_encuesta_s,ll_covid_s,ll_ubicacion_cuerpo_s,ll_numero_dest_s,ll_llave,ll_folio,ll_corr_ficha,ll_count_fr
Datetime	ldt_fec_defun,ldt_fec_nac,ldt_fech_sepult,ldt_fech_contrato,ldt_fech_recep,ldt_fecha_hoy,ldt_fecha_sepult1,ldt_fec_sepult_s,ldt_fec_nac_s,ldt_fec_fall_s,ldt_fecha_ult_mod_s,&
			ldt_fecha_exhum_s,ldt_fecha_inhuma_s,ldt_fecha_ti_s,ldt_fecha_te_s,ldt_fecha_re_s,ldt_fecha_tr_s,ldt_fecha_crem_s,ldt_fecha_crea_s
Double	ldb_uf_dia,ldb_der_sepult_uf,ldb_mov_sarcofago,ldb_cambio_ubica,ldb_reduccion,ldb_cert_defuncion,ldb_monto_canc,ll_numero,ldb_pago_1,ldb_pago_2,ldb_pago_3,&
			ldb_pago_4,ldb_pago_5,ldb_pago_6,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,ldb_dscto_6,ldb_total_dscto,ll_llave_fallecido
			
//Validar Datos
ls_pasa_mora							= 'N'
ll_mora_cred							= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'estado_credito')
ll_mora_mant							= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'estado_mantencion')
if ll_mora_cred>0 and ll_mora_mant>0 then
	ll_res								= messagebox("Advertencia","No es posible Crear Ficha Reducción por Tener MORA CREDITO y MORA MANTENCION, desea Ingresar",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ls_pasa_mora					= 'S'
	end if
elseif ll_mora_cred>0 and ll_mora_mant=0 then
	ll_res								= messagebox("Advertencia","No es posible Crear Ficha Reducción por Tener "+string(ll_mora_cred,'###,###,###,##0')+" cuota(s) MORA CREDITO, desea Ingresar",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ls_pasa_mora					= 'S'
	end if
elseif ll_mora_cred=0 and ll_mora_mant>0 then
	ll_res								= messagebox("Advertencia","No es posible Crear Ficha Reducción por Tener "+string(ll_mora_mant,'###,###,###,##0')+" cuota(s) MORA MANTENCION, desea Ingresar",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ls_pasa_mora					= 'S'
	end if
else
	ls_pasa_mora						= 'S'
end if	
if ls_pasa_mora='S' then
	ldt_fecha_hoy						= datetime(date(gdt_fec_sistema),time('00:00:00'))
	ll_hora_hoy							= long(string(gdt_fec_sistema,'hh'))
	ll_minutos_hoy						= long(string(gdt_fec_sistema,'mm'))
	ls_sw									= wf_validar()
	if ls_sw = 'S' then
		ret 								= MessageBox('Actualizar', "Desea Grabar Ficha De Reducción", Question!, YesNo!, 2)
		IF ret = 1 THEN
			wf_setear_datos()
			if tab_1.tabpage_3.dw_ficha_sepult.update()=1 then
				commit;
				ls_estado_reg			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'estado_reg')
				ldt_fech_sepult   		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(1,'fecha_sepultacion')
				ll_parque					= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(1,'cod_parque')
				ls_sector					= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(1,'sector')
				ls_sepultura				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'sepultura')
				ll_tot_reg				= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
				SELECT	"COD_PARQ"."NOMBRE"  
				INTO 		:ls_descrip_parque  
				FROM 	"COD_PARQ"  
				WHERE 	"COD_PARQ"."CODIGO" = :ll_parque
				USING	sqlca;

				SELECT 	"FICHA_GRABACION_LAPIDA"."CODIGO_IMAGEN"
				INTO 		:ll_cod_imagen  
				FROM 		"FICHA_GRABACION_LAPIDA"  
				WHERE	 ( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
						 ( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
						 ( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_parque ) AND  
						 ( "FICHA_GRABACION_LAPIDA"."FOLIO" = 1 ) AND  
						 ( "FICHA_GRABACION_LAPIDA"."FECHA" = :ldt_fech_sepult )   
				USING		sqlca;
				if isnull(ll_cod_imagen) or ll_cod_imagen=0 then ll_cod_imagen=0
				if ll_cod_imagen=0 then
					SELECT	COUNT("FALLECIDOS"."LLAVE")  
					INTO 		:ll_count_reg  
					FROM 		"FALLECIDOS"  
					WHERE  ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND  
							 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND  
							 ( "FALLECIDOS"."COD_PARQUE" = :ll_parque )   AND
					 		( "FALLECIDOS"."ESTADO_REG" = 'A' ) 
					USING		sqlca;
					if ll_count_reg>0 then
						ll_cod_imagen	= 99
					else
						SELECT	"INVENTARIO_PLANI"."NUMERO"  
						INTO 		:ll_num_inven  
						FROM 		"INVENTARIO_PLANI"  
						WHERE  ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
								 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) AND  
								 ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_parque )   
						USING		sqlca;
						if ll_num_inven=10000000 then
							ll_cod_imagen	= 99
						else
							ll_cod_imagen	= 0
						end if
					end if
				end if
				for ll_indi=1 to ll_tot_reg
					ls_estado_reg			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'estado_reg')
					ll_corr_interno			= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_interno')
					ll_rut_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'rut_fallecido')
					ls_dv_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'dv_fallecido')
					ls_nombre_fall		 	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'nombre_fallecido')
					ls_ap_pat_fall		 	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_paterno_fall')
					ls_ap_mat_fall		 	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_materno_fall')
					ls_sexo_fall      		= tab_1.tabpage_1.dw_ant_fall.getItemString(ll_indi,'sexo_fallecido')
					ll_edad_fall     			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'edad_fallecido')
					ls_tipo_via_fall  		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'tipo_via_fallecido')
					ls_direc_fall				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'direccion_fall')
					ls_num_dir_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'numero_direccion_fall')
					ls_dpto_dir_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'depto_direccion_fall')
					ls_block_dir_fall		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'block_direccion_fall')
					ls_sector_fall	   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'sector_fall')
					ls_villa_fall	   			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'poblacion_villa_fall')
					ls_ciud_fall	 			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_ciudad_fall')
					ls_comu_fall	   			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_comuna_fall')
					ls_cod_est_fall   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_estado_fall')
					ls_causa_fall	   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'causa_fallecimiento')
					ldt_fec_defun	   		= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_defuncion')
					ldt_fec_nac 	   			= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_nacimiento_fall')
					ll_llave_fallecido		= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'llave_fallecido')
					
					ll_rut_tit					= tab_1.tabpage_2.dw_ant_titular.GetItemNumber(ll_indi,'rut_titular')
					ls_dv_tit			 		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'dv_titular')
					ls_nombre_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'nombre_titular')
					ls_ap_pat_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_paterno_titular')
					ls_ap_mat_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_materno_titular')
					ls_tipo_via_tit   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'tipo_via_titular')
					ls_direc_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'direccion_titular')
					ls_num_dir_tit	   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'num_direccion_titular')
					ls_dpto_dir_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'depto_direccion_titular')
					ls_block_dir_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'block_direccion_titular')
					ls_villa_tit	   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'poblacion_villa_titular')
					ls_sector_tit	   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'sector_titular')
					ls_ciud_tit	 	   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_ciudad_titular')
					ls_comu_tit	      		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_comuna_titular')
					ls_fono_titular   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'fono_titular')
					ls_ejecutivo        		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'codigo_ejecutivo')
					ldt_fech_sepult   		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_sepultacion')
					ll_hora_sepult    		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'hora')
					ll_minuto_sepult		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'minutos')
					ll_funeraria				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'codigo_funeraria')
					ls_fono_funera			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'fono_funeraria')
					ls_pase_sepult			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'pase_sepultacion')
					ls_base					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'base')
					ls_serie					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'serie')
					ll_numero				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'numero')
					ldt_fech_contrato		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_contrato')
					ls_estad_contrato		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_estado_contrato')
					ll_parque					= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cod_parque')
					ls_sector					= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'sector')
					ls_sepultura				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'sepultura')
					ls_numero_tecni		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'numero_tecnico')
					ll_capacidad				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad')
					ls_nivel					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nivel')
					ll_cant_sepultados		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cantidad_sepultados')	
					ls_est_sep_compl		= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'estado_sepultura_completa')
					ll_cap_libre_sep		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad_libre_sepultura')
					ls_obs_sep_comp		= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'observacion_sepultura_completa')
					ll_est_credito			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'estado_credito')
					ls_obs_credito			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'observacion_credito')
					ll_est_manten			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'estado_mantencion')
					ls_obs_manten			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'observacion_mantencion')
					ldt_fech_recep			= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_recepcion')
					ls_parentesco			= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'codigo_parentesco')
					ldb_monto_canc		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_cancelar')
					ll_comprobante			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'folio_comprobante')
					ldb_uf_dia				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'uf_dia')
					ldb_pago_1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_1')
					ldb_pago_2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_2')
					ldb_pago_3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_3')
					ldb_pago_4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_4')
					ldb_pago_5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_5')
					ldb_pago_6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_6')
					ll_sw_1					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_1')
					ll_sw_2					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_2')
					ll_sw_3					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_3')
					ll_sw_4					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_4')
					ll_sw_5					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_5')
					ll_sw_6					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_6')
					ls_pago_1				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_1')
					ls_pago_2				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_2')
					ls_pago_3				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_3')
					ls_pago_4				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_4')
					ls_pago_5				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_5')
					ls_pago_6				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_6')
					
					ldb_dscto_1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_1')
					ldb_dscto_2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_2')
					ldb_dscto_3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_3')
					ldb_dscto_4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_4')
					ldb_dscto_5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_5')
					ldb_dscto_6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_6')
					ll_sw_dscto_1			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_1')
					ll_sw_dscto_2			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_2')
					ll_sw_dscto_3			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_3')
					ll_sw_dscto_4			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_4')
					ll_sw_dscto_5			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_5')
					ll_sw_dscto_6			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_6')
					ls_dscto_1				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_1')
					ls_dscto_2				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_2')
					ls_dscto_3				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_3')
					ls_dscto_4				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_4')
					ls_dscto_5				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_5')
					ls_dscto_6				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_6')
					ldb_total_dscto			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_total_dscto')
					
					ls_obs					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'observacion')
					if ll_cant_sepultados > 1 then
						ls_primera_sepultura	= 'N'
					else
						ls_primera_sepultura	= 'S'
					end if
					if isnull(ls_numero_tecni) then ls_numero_tecni='-'
					if isnull(ls_nombre_fall) then ls_nombre_fall='-'
					if isnull(ls_ap_pat_fall) then ls_ap_pat_fall='-'
					if isnull(ls_ap_mat_fall) then ls_ap_mat_fall='-'
					if isnull(ll_hora_sepult) then ll_hora_sepult=0
					if isnull(ll_minuto_sepult) then ll_minuto_sepult=0
					SELECT	"CLIENTE"."FONO_P",	"CLIENTE"."FONO_C"  
					INTO 		:ls_fono_titular,		:ls_fono_com_tit  
					FROM 		"CLIENTE"  
					WHERE 	"CLIENTE"."RUT" = :ll_rut_tit   
					USING		sqlca;
					if isnull(tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_ficha')) or tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_ficha')=0 then
						SELECT	MAX("FICHA_REDUCCION"."CORRELATIVO_FICHA")  
						INTO 		:ll_max_ficha  
						FROM 		"FICHA_REDUCCION"  
						WHERE		"FICHA_REDUCCION"."COD_PARQUE" = :ll_parque
						USING		sqlca;
						if ll_max_ficha > 0 then
							ll_max_ficha ++
						else
							ll_max_ficha	= 1
						end if
						tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'correlativo_ficha',ll_max_ficha)
						tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						if tab_1.tabpage_3.dw_ficha_sepult.update() = 1 then
							commit;
						else
							rollback;
						end if
					end if
					// Insertar Fallecido - Mirko 12/06/2022
					ll_nm					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_mensual')
					ll_nl					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_anual')
					ls_cod_regis			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'cod_registro_pase')
					ls_estado_ctto		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'cod_estado_contrato')
					ls_inscripcion_pase= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'registro_pase')
					ls_pase_sepult		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'inscripcion_pase')
					ls_op					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'tipo_operacion')
					ll_corr_ficha			= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_ficha')	
					ls_base				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'base')
					ls_serie				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'serie')
					ll_numero			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'numero')
					SELECT	"FUNERARIA"."NOMBRE"  
					INTO 		:ls_funeraria  
					FROM 	"FUNERARIA"  
					WHERE 	"FUNERARIA"."RUT" = :ll_funeraria   ;
					if isnull(ls_funeraria) or ls_funeraria='' then ls_funeraria='-'
					SELECT	"COMUNA"."COMUNA"  
					INTO 		:ls_otorgado_por  
					FROM 	"COMUNA"  
					WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_cod_regis   
					USING	sqlca;
					if not isnull(ll_llave_fallecido) then
						SELECT   	 "LLAVE",		"FOLIO",					"N_L",		"N_M",		"BASE",		"SS",			"CONTRATO",		"SECTOR",	"N_SEP",				"NOMBRES",		"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",			"EST",		"OP",		"RUT",	"DV",		"SEXO",		"EDAD",		"PERIODO",		"FEC_NAC",		"FEC_FALL",			"PASE",		"REG_CIVIL",			"CAUSA_FALL",		"ENF_OBL",		"FUNERARIA",		"BOLETA",		"CARTA_AUT",		"RG_EST",				"N_TEC",		"NIVEL",			"VTA",		"OBSERVACIONES",		"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",		"COD_PARQUE",		"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",	"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",	"FECHA_EXHUMACION",		"ESTADO_INHUMACION",	"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",	"FECHA_CREMATORIO",	"ESTADO_REG",	"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"USUARIO_CREA",		"FECHA_CREA",		"TIPO_FICHA",		"RESOLUCION_TRASLADO_NRO"
						INTO 			:ll_llave_s,	:ll_count_parque_s,	:ll_n_l_s,	:ll_n_m_s,	:base_s,		:serie_s,		:numero_s,		:ls_sector_s,	:ls_sepultura_s,	:ls_nombre_s,	:ls_ap_pat_s,		:ls_ap_mat_s,		:ldt_fec_sepult_s,	:ls_est_s,	:ls_op_s,	:ll_rut_s,	:ls_dv_s,	:ls_sexo_s,	:ll_edad_s,	:ls_periodo_s,	:ldt_fec_nac_s,	:ldt_fec_fall_s,		:ls_pase_s,	:ls_otorgado_por_s,	:ls_causa_fall_s,	:ls_enf_obl_s,	:ls_funeraria_s,	:ls_boleta_s,	:ls_carta_aut_s,	:ll_corr_hist_reg_s,	:ls_n_tec_s,	:ls_nivel_s,		:ls_vta_s,	:ls_observaciones_s,   	:ls_estado_contrato_s,	:ls_registro_pase_s,					:ls_otorgado_por_s,	:ls_cementerio_origen_s,	:ll_cod_parque_s,		:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,	:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,			:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,			:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,			:ldt_fecha_crem_s,		:ls_estado_reg_s,	:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:ls_usuario_crea_s,	:ldt_fecha_crea_s,		:ls_tipo_ficha_s,	:ls_resol_traslado_nro_s
						FROM		  	"FALLECIDOS"
						WHERE		"FALLECIDOS"."LLAVE" = :ll_llave_fallecido AND
										"FALLECIDOS"."ESTADO_REG" = 'A'
						USING		Trans_1;
					else
						SELECT   	 "LLAVE",		"FOLIO",					"N_L",		"N_M",		"BASE",		"SS",			"CONTRATO",		"SECTOR",	"N_SEP",				"NOMBRES",		"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",			"EST",		"OP",		"RUT",	"DV",		"SEXO",		"EDAD",		"PERIODO",		"FEC_NAC",		"FEC_FALL",			"PASE",		"REG_CIVIL",			"CAUSA_FALL",		"ENF_OBL",		"FUNERARIA",		"BOLETA",		"CARTA_AUT",		"RG_EST",				"N_TEC",		"NIVEL",			"VTA",		"OBSERVACIONES",		"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",		"COD_PARQUE",		"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",	"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",	"FECHA_EXHUMACION",		"ESTADO_INHUMACION",	"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",	"FECHA_CREMATORIO",	"ESTADO_REG",	"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"USUARIO_CREA",		"FECHA_CREA",		"TIPO_FICHA",		"RESOLUCION_TRASLADO_NRO"
						INTO 			:ll_llave_s,	:ll_count_parque_s,	:ll_n_l_s,	:ll_n_m_s,	:base_s,		:serie_s,		:numero_s,		:ls_sector_s,	:ls_sepultura_s,	:ls_nombre_s,	:ls_ap_pat_s,		:ls_ap_mat_s,		:ldt_fec_sepult_s,	:ls_est_s,	:ls_op_s,	:ll_rut_s,	:ls_dv_s,	:ls_sexo_s,	:ll_edad_s,	:ls_periodo_s,	:ldt_fec_nac_s,	:ldt_fec_fall_s,		:ls_pase_s,	:ls_otorgado_por_s,	:ls_causa_fall_s,	:ls_enf_obl_s,	:ls_funeraria_s,	:ls_boleta_s,	:ls_carta_aut_s,	:ll_corr_hist_reg_s,	:ls_n_tec_s,	:ls_nivel_s,		:ls_vta_s,	:ls_observaciones_s,   	:ls_estado_contrato_s,	:ls_registro_pase_s,					:ls_otorgado_por_s,	:ls_cementerio_origen_s,	:ll_cod_parque_s,		:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,	:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,			:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,			:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,			:ldt_fecha_crem_s,		:ls_estado_reg_s,	:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:ls_usuario_crea_s,	:ldt_fecha_crea_s,		:ls_tipo_ficha_s,	:ls_resol_traslado_nro_s
						FROM		  	"FALLECIDOS"
						WHERE		"FALLECIDOS"."NOMBRES" = :ls_nombre_fall AND
										"FALLECIDOS"."AP_PATERNO" = :ls_ap_pat_fall AND
										"FALLECIDOS"."AP_MATERNO" = :ls_ap_mat_fall AND
										"FALLECIDOS"."RUT" = :ll_rut_fall AND
										"FALLECIDOS"."DV" = :ls_dv_fall AND
										"FALLECIDOS"."ESTADO_REG" = 'A'
						USING		Trans_1;
					end if
					if Trans_1.sqlcode=0 then
						
						if (ldt_fec_sepult_s = ldt_fech_sepult and ls_tipo_ficha_s = 'FR' and ls_op_s = ls_op) then
							ls_nuevo		= 'N'
						else
							ls_nuevo		= 'S'
						end if
					else
						if not isnull(ll_llave_fallecido) then
							SELECT   "LLAVE",		"FOLIO",					"N_L",		"N_M",		"BASE",		"SS",			"CONTRATO",		"SECTOR",	"N_SEP",				"NOMBRES",		"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",			"EST",		"OP",		"RUT",	"DV",		"SEXO",		"EDAD",		"PERIODO",		"FEC_NAC",		"FEC_FALL",			"PASE",		"REG_CIVIL",			"CAUSA_FALL",		"ENF_OBL",		"FUNERARIA",		"BOLETA",		"CARTA_AUT",		"RG_EST",				"N_TEC",		"NIVEL",			"VTA",		"OBSERVACIONES",		"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",		"COD_PARQUE",		"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",	"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",	"FECHA_EXHUMACION",		"ESTADO_INHUMACION",	"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",	"FECHA_CREMATORIO",	"ESTADO_REG",	"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"USUARIO_CREA",		"FECHA_CREA",		"TIPO_FICHA",		"RESOLUCION_TRASLADO_NRO"
							INTO 		:ll_llave_s,	:ll_count_parque_s,	:ll_n_l_s,	:ll_n_m_s,	:base_s,		:serie_s,		:numero_s,		:ls_sector_s,	:ls_sepultura_s,	:ls_nombre_s,	:ls_ap_pat_s,		:ls_ap_mat_s,		:ldt_fec_sepult_s,	:ls_est_s,	:ls_op_s,	:ll_rut_s,	:ls_dv_s,	:ls_sexo_s,	:ll_edad_s,	:ls_periodo_s,	:ldt_fec_nac_s,	:ldt_fec_fall_s,		:ls_pase_s,	:ls_otorgado_por_s,	:ls_causa_fall_s,	:ls_enf_obl_s,	:ls_funeraria_s,	:ls_boleta_s,	:ls_carta_aut_s,	:ll_corr_hist_reg_s,	:ls_n_tec_s,	:ls_nivel_s,		:ls_vta_s,	:ls_observaciones_s,   	:ls_estado_contrato_s,	:ls_registro_pase_s,					:ls_otorgado_por_s,	:ls_cementerio_origen_s,	:ll_cod_parque_s,		:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,	:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,			:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,			:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,			:ldt_fecha_crem_s,		:ls_estado_reg_s,	:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:ls_usuario_crea_s,	:ldt_fecha_crea_s,		:ls_tipo_ficha_s,	:ls_resol_traslado_nro_s
							FROM 	"FALLECIDOS"  
							WHERE 	( "FALLECIDOS"."LLAVE" = :ll_llave_fallecido ) AND  
										( "FALLECIDOS"."ESTADO_REG" = 'A' )   ;
						else
							SELECT   "LLAVE",		"FOLIO",					"N_L",		"N_M",		"BASE",		"SS",			"CONTRATO",		"SECTOR",	"N_SEP",				"NOMBRES",		"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",			"EST",		"OP",		"RUT",	"DV",		"SEXO",		"EDAD",		"PERIODO",		"FEC_NAC",		"FEC_FALL",			"PASE",		"REG_CIVIL",			"CAUSA_FALL",		"ENF_OBL",		"FUNERARIA",		"BOLETA",		"CARTA_AUT",		"RG_EST",				"N_TEC",		"NIVEL",			"VTA",		"OBSERVACIONES",		"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",		"COD_PARQUE",		"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",	"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",	"FECHA_EXHUMACION",		"ESTADO_INHUMACION",	"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",	"FECHA_CREMATORIO",	"ESTADO_REG",	"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"USUARIO_CREA",		"FECHA_CREA",		"TIPO_FICHA",		"RESOLUCION_TRASLADO_NRO"
							INTO 		:ll_llave_s,	:ll_count_parque_s,	:ll_n_l_s,	:ll_n_m_s,	:base_s,		:serie_s,		:numero_s,		:ls_sector_s,	:ls_sepultura_s,	:ls_nombre_s,	:ls_ap_pat_s,		:ls_ap_mat_s,		:ldt_fec_sepult_s,	:ls_est_s,	:ls_op_s,	:ll_rut_s,	:ls_dv_s,	:ls_sexo_s,	:ll_edad_s,	:ls_periodo_s,	:ldt_fec_nac_s,	:ldt_fec_fall_s,		:ls_pase_s,	:ls_otorgado_por_s,	:ls_causa_fall_s,	:ls_enf_obl_s,	:ls_funeraria_s,	:ls_boleta_s,	:ls_carta_aut_s,	:ll_corr_hist_reg_s,	:ls_n_tec_s,	:ls_nivel_s,		:ls_vta_s,	:ls_observaciones_s,   	:ls_estado_contrato_s,	:ls_registro_pase_s,					:ls_otorgado_por_s,	:ls_cementerio_origen_s,	:ll_cod_parque_s,		:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,	:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,			:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,			:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,			:ldt_fecha_crem_s,		:ls_estado_reg_s,	:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:ls_usuario_crea_s,	:ldt_fecha_crea_s,		:ls_tipo_ficha_s,	:ls_resol_traslado_nro_s
							FROM 	"FALLECIDOS"  
							WHERE 	( "FALLECIDOS"."BASE" = :ls_base ) AND  
										( "FALLECIDOS"."SS" = :ls_serie ) AND  
										( "FALLECIDOS"."CONTRATO" = :ll_numero ) AND  
	//										( "FALLECIDOS"."TIPO_FICHA" = 'FS' ) AND  
										( "FALLECIDOS"."FOLIO_FR" = :ll_corr_ficha ) AND  
										( "FALLECIDOS"."ESTADO_REG" = 'A' )   ;
						end if
						if ll_llave_s > 0 then
							ls_nuevo		= 'N'
						else
							ls_nuevo		= 'S'
						end if
					end if
					if isnull(ldt_fec_sepult_s) or date(ldt_fec_sepult_s) = date('01/01/1900') then setnull(ldt_fec_sepult_s)
					if isnull(ldt_fec_nac_s) or date(ldt_fec_nac_s) = date('01/01/1900') then setnull(ldt_fec_nac_s)
					if isnull(ldt_fec_fall_s) or date(ldt_fec_fall_s) = date('01/01/1900') then setnull(ldt_fec_fall_s)
					if isnull(ldt_fecha_ult_mod_s) or date(ldt_fecha_ult_mod_s) = date('01/01/1900') then setnull(ldt_fecha_ult_mod_s)
					if isnull(ldt_fecha_exhum_s) or date(ldt_fecha_exhum_s) = date('01/01/1900') then setnull(ldt_fecha_exhum_s)
					if isnull(ldt_fecha_inhuma_s) or date(ldt_fecha_inhuma_s) = date('01/01/1900') then setnull(ldt_fecha_inhuma_s)
					if isnull(ldt_fecha_ti_s) or date(ldt_fecha_ti_s) = date('01/01/1900') then setnull(ldt_fecha_ti_s)
					if isnull(ldt_fecha_te_s) or date(ldt_fecha_te_s) = date('01/01/1900') then setnull(ldt_fecha_te_s)
					if isnull(ldt_fecha_re_s) or date(ldt_fecha_re_s) = date('01/01/1900') then setnull(ldt_fecha_re_s)
					if isnull(ldt_fecha_tr_s) or date(ldt_fecha_tr_s) = date('01/01/1900') then setnull(ldt_fecha_tr_s)
					if isnull(ldt_fecha_crem_s) or date(ldt_fecha_crem_s) = date('01/01/1900') then setnull(ldt_fecha_crem_s)
					if isnull(ldt_fecha_crea_s) or date(ldt_fecha_crea_s) = date('01/01/1900') then setnull(ldt_fecha_crea_s)
					
					if isnull(ll_n_l_s) then ll_n_l_s=0
					if isnull(ll_n_m_s) then ll_n_m_s=0
					if isnull(base_s) then base_s=''
					if isnull(serie_s) then serie_s=''
					if isnull(numero_s) then numero_s=0
					if isnull(ls_sector_s) then ls_sector_s=''
					if isnull(ls_sepultura_s) then ls_sepultura_s=''
					if isnull(ls_nombre_s) then ls_nombre_s=''
					if isnull(ls_ap_pat_s) then ls_ap_pat_s=''
					if isnull(ls_ap_mat_s) then ls_ap_mat_s=''
					if isnull(ls_est_s) then ls_est_s=''
					if isnull(ls_op_s) then ls_op_s=''
					if isnull(ll_rut_s) then ll_rut_s=0
					if isnull(ls_dv_s) then ls_dv_s=''
					if isnull(ls_sexo_s) then ls_sexo_s=''
					if isnull(ll_edad_s) then ll_edad_s=0
					if isnull(ls_periodo_s) then ls_periodo_s=''
					if isnull(ls_pase_s) then ls_pase_s=''
					if isnull(ls_otorgado_por_s) then ls_otorgado_por_s=''
					if isnull(ls_causa_fall_s) then ls_causa_fall_s=''
					if isnull(ls_funeraria_s) then ls_funeraria_s=''
					if isnull(ls_n_tec_s) then ls_n_tec_s=''
					if isnull(ls_nivel_s) then ls_nivel_s=''
					if isnull(ls_observaciones_s) then ls_observaciones_s=''
					if isnull(ls_estado_contrato_s) then ls_estado_contrato_s=''
					if isnull(ls_resol_traslado_nro_s) then ls_resol_traslado_nro_s=''
					if isnull(ls_cementerio_origen_s) then ls_cementerio_origen_s=''
					if isnull(ll_cod_parque_s) then ll_cod_parque_s=0
					if ls_nuevo='S' then
						SELECT 	MAX("FALLECIDOS"."LLAVE")  
						INTO 		:ll_llave  
						FROM 	"FALLECIDOS"  ;
						if isnull(ll_llave) or ll_llave=0 then
							ll_llave					= 1
						else
							ll_llave ++
						end if
						
						SELECT	MAX("FALLECIDOS"."FOLIO")
						INTO 		:ll_folio
						FROM 	"FALLECIDOS"  
						WHERE 	"FALLECIDOS"."COD_PARQUE" = :ll_parque   ;
						if isnull(ll_folio) or ll_folio=0 then
							ll_folio					= 1
						else
							ll_folio ++
						end if
						
						if ll_llave_s > 0 then
							UPDATE 	"FALLECIDOS"  
							SET 		"ESTADO_REG" = 'I',   
										"USUARIO_ULT_MOD" = :gs_user,   
										"FECHA_ULT_MOD" = :gdt_fec_sistema  
							WHERE 	( "FALLECIDOS"."LLAVE" = :ll_llave_s ) AND  
										( "FALLECIDOS"."ESTADO_REG" = 'A' )  
							USING	Trans_1;
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
							else
								rollback using Trans_1;
							end if
						end if
						
						if len(ls_funeraria) > 50 then ls_funeraria = mid(ls_funeraria,1,50)
						if len(ls_causa_fall) > 50 then ls_causa_fall = mid(ls_causa_fall,1,50)
						
						tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'llave_fallecido',ll_llave)
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'llave_fallecido',ll_llave)
						tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						tab_1.tabpage_1.dw_ant_fall.accepttext()
						
						INSERT INTO   "FALLECIDOS"  
										( "LLAVE",	"FOLIO",		"BASE",		"SS",			"CONTRATO",	"SECTOR",	"N_SEP",			"NOMBRES",			"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",				"EST",				"OP",		"RUT",		"DV",			"SEXO",			"EDAD",				"PERIODO",						"FEC_NAC",		"FEC_FALL",			"PASE",					"REG_CIVIL",		"CAUSA_FALL",		"FUNERARIA",	"N_TEC",				"NIVEL",		"OBSERVACIONES",		"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",		"COD_PARQUE",		"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",	"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",	"FECHA_EXHUMACION",		"ESTADO_INHUMACION",	"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",	"FECHA_CREMATORIO",	"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"USUARIO_CREA",		"FECHA_CREA",		"TIPO_FICHA",	"FALLECIDOS"."FOLIO_FR" )
						VALUES 		( :ll_llave,	:ll_folio,		:ls_base,		:ls_serie,		:ll_numero,		:ls_sector,	:ls_sepultura,	:ls_nombre_fall,	:ls_ap_pat_fall,		:ls_ap_mat_fall,	:ldt_fech_sepult,		:ls_cod_est_fall,	:ls_op,	:ll_rut_fall,	:ls_dv_fall,	:ls_sexo_fall,	:ll_edad_fall,		:ls_periodo_nacimiento,		:ldt_fec_nac,	:ldt_fec_defun,		:ls_inscripcion_pase,	:ls_otorgado_por,	:ls_causa_fall,		:ls_funeraria,	:ls_numero_tecni,	:ls_nivel,		:ls_obs_sep_comp,   		:ls_estado_ctto,			:ls_pase_sepult,						:ls_otorgado_por,		:ls_descrip_parque,			:ll_parque,				:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,	:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,			:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,			:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,			:ldt_fecha_crem_s,		:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:gs_user,				:gdt_fec_sistema,		'FR' ,				:ll_corr_ficha)  
						USING			sqlca;
						if sqlca.sqlcode=0 then
							commit;
							if ll_rut_fall = ll_rut_tit then
								SELECT	"CLIENTE"."ESTADO_TITULAR"  
								INTO 		:ls_estado_tit  
								FROM 	"CLIENTE"  
								WHERE 	"CLIENTE"."RUT" = :ll_rut_tit   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									UPDATE	"CLIENTE"  
									SET 		"ESTADO_TITULAR" = '1'  
									WHERE 	"CLIENTE"."RUT" = :ll_rut_tit   
									USING	sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							end if
						else
							rollback;
							messagebox("Error Grabar","Error al Grabar Fallecido SQL: "+sqlca.sqlerrtext)
						end if
						
					else
						if   ll_n_l_s<>ll_nl or ll_n_m_s<>ll_nm or base_s<>ls_base or serie_s<>ls_serie or numero_s<>ll_numero or ls_sector_s<>ls_sector or &
							ls_sepultura_s<>ls_sepultura or ls_nombre_s<>ls_nombre_fall or ls_ap_pat_s<>ls_ap_pat_fall or ls_ap_mat_s<>ls_ap_mat_fall or ldt_fec_sepult_s<>ldt_fech_sepult or ls_est_s<>ls_cod_est_fall or &
							ls_op_s<>ls_op or ll_rut_s<>ll_rut_fall or ls_dv_s<>ls_dv_fall or ls_sexo_s<>ls_sexo_fall or ll_edad_s<>ll_edad_fall or ls_periodo_s<>ls_periodo_nacimiento or ldt_fec_nac_s<>ldt_fec_nac or &
							ldt_fec_fall_s<>ldt_fec_defun or ls_pase_s<>ls_pase_sepult or ls_otorgado_por_s<>ls_otorgado_por or ls_causa_fall_s<>ls_causa_fall or ls_funeraria_s<>ls_funeraria or &
							ls_n_tec_s<>ls_numero_tecni or ls_nivel_s<>ls_nivel or ls_observaciones_s<>ls_obs_sep_comp or ls_estado_contrato_s<>ls_estado_ctto or ls_resol_traslado_nro_s<>ls_inscripcion_pase or &
							ls_cementerio_origen_s<>ls_descrip_parque or ll_cod_parque_s<>ll_parque then
								
							UPDATE 	"FALLECIDOS"  
							SET 		"BASE" = :ls_base,   
										"SS" = :ls_serie,   
										"CONTRATO" = :ll_numero,   
										"SECTOR" = :ls_sector,   
										"N_SEP" = :ls_sepultura,   
										"NOMBRES" = :ls_nombre_fall,   
										"AP_PATERNO" = :ls_ap_pat_fall,   
										"AP_MATERNO" = :ls_ap_mat_fall,   
										"FEC_SEP" = :ldt_fech_sepult,   
										"EST" = :ls_cod_est_fall,   
										"RUT" = :ll_rut_fall,   
										"DV" = :ls_dv_fall,   
										"SEXO" = :ls_sexo_fall,   
										"EDAD" = :ll_edad_fall,   
										"PERIODO" = :ls_periodo_nacimiento,   
										"FEC_NAC" = :ldt_fec_nac,   
										"FEC_FALL" = :ldt_fec_defun,   
										"PASE" = :ls_inscripcion_pase,   
										"REG_CIVIL" = :ls_otorgado_por,   
										"CAUSA_FALL" = :ls_causa_fall,   
										"FUNERARIA" = :ls_funeraria,   
										"N_TEC" = :ls_numero_tecni,   
										"NIVEL" = :ls_nivel,   
										"OBSERVACIONES" = :ls_obs_sep_comp,   
										"ESTADO_CONTRATO" = :ls_estado_ctto,   
										"RESOLUCION_TRASLADO_NRO" = :ls_pase_sepult,   
										"OTORGADO_POR" = :ls_otorgado_por,   
										"CEMENTERIO_ORIGEN" = :ls_descrip_parque,   
										"COD_PARQUE" = :ll_parque,   
										"LLAVE_ANTERIOR" = :ll_llave_anterior_s,   
										"NRO_SARCOFAGO" = :ls_nro_sarcofago_s,   
										"USUARIO_ULT_MOD" = :gs_user,   
										"FECHA_ULT_MOD" = :gdt_fec_sistema   
							WHERE 	"FALLECIDOS"."LLAVE" = :ll_llave_s  
							USING	Trans_1;
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
								INSERT INTO "LOG_FALLECIDOS"  
											( "LLAVE",  		"FOLIO",   				"N_L",   		"N_M",   		"BASE",   		"SS",   		"CONTRATO",   		"SECTOR",   	"N_SEP",   			"NOMBRES",   		"AP_PATERNO",   	"AP_MATERNO",   		"FEC_SEP",   			"EST",   		"OP",   		"RUT",   		"DV",   		"SEXO",   		"EDAD",   		"PERIODO",   		"FEC_NAC",   		"FEC_FALL",   		"PASE",   		"REG_CIVIL",   				"CAUSA_FALL",   	"ENF_OBL",   		"FUNERARIA",   		"BOLETA",   		"CARTA_AUT",   	"RG_EST",   			"N_TEC",   		"NIVEL",   		"VTA",   		"OBSERVACIONES",   		"ESTADO_CONTRATO",   		"RESOLUCION_TRASLADO_NRO",   	"OTORGADO_POR",   		"CEMENTERIO_ORIGEN",   	"COD_PARQUE",   		"USUARIO_CREA",   	"MOTIVO_CREA",	"FOLIO_FR" )  
								VALUES 	( :ll_llave_s,  	:ll_count_parque_s,   	:ll_n_l_s,   	:ll_n_m_s,   :base_s,   		:serie_s,   	:numero_s,  	 		:ls_sector_s,   	:ls_sepultura_s,   	:ls_nombre_s,   	:ls_ap_pat_s,   		:ls_ap_mat_s,   		:ldt_fec_sepult_s,   	:ls_est_s,  	:ls_op_s,   	:ll_rut_s,   	:ls_dv_s,   	:ls_sexo_s,   	:ll_edad_s,   	:ls_periodo_s,   	:ldt_fec_nac_s,   	:ldt_fec_fall_s,   	:ls_pase_s,   	:ls_otorgado_por_s,   	:ls_causa_fall_s,   	:ls_enf_obl_s,   	:ls_funeraria_s,   		:ls_boleta_s, 	:ls_carta_aut_s,   	:ll_corr_hist_reg_s,   	:ls_n_tec_s,   	:ls_nivel_s,   	:ls_vta_s, 	:ls_observaciones_s,  	:ls_estado_contrato_s,   			:ls_resol_traslado_nro_s,   				:ls_otorgado_por_s,   	:ls_cementerio_origen_s,   	:ll_cod_parque_s,   	:gs_user,   				'FR',					:ll_corr_ficha ) 
								USING	Trans_1;
								if Trans_1.sqlcode=0 then
									commit using Trans_1;
								else
									rollback using Trans_1;
								end if
							else
								rollback using Trans_1;
							end if
						end if
						if ll_llave_s > 0 and isnull(ll_llave_fallecido) then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'llave_fallecido',ll_llave_s)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'llave_fallecido',ll_llave_s)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
							tab_1.tabpage_1.dw_ant_fall.accepttext()

						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.update() = 1 then
						commit;
					else
						rollback;
					end if
					ll_llave_s						= 0
					Setnull(ll_llave_s);Setnull(ll_count_parque_s);Setnull(ll_n_l_s);Setnull(ll_n_m_s);Setnull(base_s);Setnull(serie_s);Setnull(numero_s);Setnull(ls_sector_s);Setnull(ls_sepultura_s)
					Setnull(ls_nombre_s);Setnull(ls_ap_pat_s);Setnull(ls_ap_mat_s);Setnull(ldt_fec_sepult_s);Setnull(ls_est_s);Setnull(ls_op_s);Setnull(ll_rut_s);Setnull(ls_dv_s);Setnull(ls_sexo_s)
					Setnull(ll_edad_s);Setnull(ls_periodo_s);Setnull(ldt_fec_nac_s);Setnull(ldt_fec_fall_s);Setnull(ls_pase_s);Setnull(ls_otorgado_por_s);Setnull(ls_causa_fall_s);Setnull(ls_enf_obl_s)
					Setnull(ls_funeraria_s);Setnull(ls_boleta_s);Setnull(ls_carta_aut_s);Setnull(ll_corr_hist_reg_s);Setnull(ls_n_tec_s);Setnull(ls_nivel_s);Setnull(ls_vta_s);Setnull(ls_observaciones_s)
					Setnull(ls_estado_contrato_s);Setnull(ls_registro_pase_s);Setnull(ls_otorgado_por_s);Setnull(ls_cementerio_origen_s);Setnull(ll_cod_parque_s);Setnull(ll_llave_anterior_s)
					Setnull(ls_nro_sarcofago_s);Setnull(ls_cod_usuario_s);Setnull(ls_usuario_ult_mod);Setnull(ldt_fecha_ult_mod_s);Setnull(ll_folio_encuesta_s);Setnull(ll_covid_s);Setnull(ll_ubicacion_cuerpo_s)
					Setnull(ls_estado_exhum_s);Setnull(ldt_fecha_exhum_s);Setnull(ls_estado_inhuma_s);Setnull(ldt_fecha_inhuma_s);Setnull(ls_estado_ti_s);Setnull(ldt_fecha_ti_s);Setnull(ls_estado_te_s)
					Setnull(ldt_fecha_te_s);Setnull(ls_estado_re_s);Setnull(ldt_fecha_re_s);Setnull(ls_estado_tr_s);Setnull(ldt_fecha_tr_s);Setnull(ls_estado_crem_s);Setnull(ldt_fecha_crem_s);Setnull(ls_estado_reg_s)
					Setnull(ls_estado_fall_s);Setnull(ls_base_dest_s);Setnull(ls_serie_dest_s);Setnull(ll_numero_dest_s);Setnull(ls_usuario_crea_s);Setnull(ldt_fecha_crea_s);Setnull(ls_tipo_ficha_s)
					Setnull(ls_resol_traslado_nro_s)
					//Fin Codigo Falecido - Mirko
				next
				if isvalid(w_mantenedor_estadistico) then
					// no enviar email
				else
					SELECT	"ENCARGADOS"."NOMBRE"  
					INTO 		:ls_nom_usuario  
					FROM 	"ENCARGADOS"  
					WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
					if not isnull(ldt_fech_sepult) and ll_hora_sepult>0 and not isnull(ls_nom_usuario) and &
						not isnull(ls_sector) and ls_sector<>'' and ls_sector<>'-' and not isnull(ls_sepultura) and &
						ls_sepultura<>'' and ls_sepultura<>'-' and not isnull(ls_nombre_fall) and ls_nombre_fall<>'' and &
						not isnull(ls_ap_pat_fall) and ls_ap_pat_fall<>'' then
						
						ls_cod_tamano_cuerpo	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'cod_tamano_cuerpo')
						ls_obs_fall				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'observacion_fallecido')
						if not isnull(ls_cod_tamano_cuerpo) then
							SELECT	"FICHA_TAMANO"."DESCRIPCION"  
							INTO 		:ls_descrip_tamano  
							FROM 		"FICHA_TAMANO"  
							WHERE 	"FICHA_TAMANO"."CODIGO" = :ls_cod_tamano_cuerpo   ;
						end if
		
						DECLARE x1 CURSOR FOR  
						SELECT	"ENCARGADOS"."EMAIL"  
						FROM		"ENCARGADOS",   "FICHA_ADMINISTRADORES"  
						WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = "FICHA_ADMINISTRADORES"."USUARIO_ADM" ) and  
								 ( "ENCARGADOS"."ESTADO" = "FICHA_ADMINISTRADORES"."ESTADO" ) and  
								 (("FICHA_ADMINISTRADORES"."COD_PARQUE" = :ll_parque ) AND  
								 ( "FICHA_ADMINISTRADORES"."ESTADO" = 'A' )   )   
						USING		sqlca;
						open x1;
						if sqlca.sqlcode=0 then
							String	ls_asunto,ls_texto
							SetNull(ls_texto)
							SELECT	Count("ENCARGADOS"."EMAIL")
							INTO		:ll_tot_reg
							FROM		"ENCARGADOS",   "FICHA_ADMINISTRADORES"  
							WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = "FICHA_ADMINISTRADORES"."USUARIO_ADM" ) and  
									 ( "ENCARGADOS"."ESTADO" = "FICHA_ADMINISTRADORES"."ESTADO" ) and  
									 (("FICHA_ADMINISTRADORES"."COD_PARQUE" = :ll_parque ) AND  
									 ( "FICHA_ADMINISTRADORES"."ESTADO" = 'A' )   )   
							USING		sqlca;
							if ll_tot_reg>0 then
								SELECT	Count("FICHA_LOG_EMAIL"."COD_PARQUE")
								INTO 		:ll_count_reg_aux
								FROM 		"FICHA_LOG_EMAIL"  
								WHERE  ( "FICHA_LOG_EMAIL"."COD_PARQUE" = :ll_parque ) AND  
										 ( "FICHA_LOG_EMAIL"."SECTOR" = :ls_sector ) AND  
										 ( "FICHA_LOG_EMAIL"."SEPULTURA" = :ls_sepultura ) AND  
										 ( "FICHA_LOG_EMAIL"."FECHA_SEPULTACION" = :ldt_fech_sepult ) 
								USING		sqlca;
								
								SELECT	"FICHA_LOG_EMAIL"."HORA_SEPULTACION",	"FICHA_LOG_EMAIL"."MINUTO_SEPULTACION"  
								INTO 		:ll_hora_sepult_aux,							:ll_min_sepult_aux  
								FROM 		"FICHA_LOG_EMAIL"  
								WHERE  ( "FICHA_LOG_EMAIL"."COD_PARQUE" = :ll_parque ) AND  
										 ( "FICHA_LOG_EMAIL"."SECTOR" = :ls_sector ) AND  
										 ( "FICHA_LOG_EMAIL"."SEPULTURA" = :ls_sepultura ) AND  
										 ( "FICHA_LOG_EMAIL"."FECHA_SEPULTACION" = :ldt_fech_sepult ) AND  
										 ( "FICHA_LOG_EMAIL"."FECHA_CREA" = (	SELECT	max("FICHA_LOG_EMAIL"."FECHA_CREA") 
																							FROM 		"FICHA_LOG_EMAIL" 
																							WHERE  ( "FICHA_LOG_EMAIL"."COD_PARQUE" = :ll_parque ) AND 
																									 ( "FICHA_LOG_EMAIL"."SECTOR" = :ls_sector ) AND 
																									 ( "FICHA_LOG_EMAIL"."SEPULTURA" = :ls_sepultura ) AND 
																									 ( "FICHA_LOG_EMAIL"."FECHA_SEPULTACION" = :ldt_fech_sepult) ) )   
								USING		sqlca;
								if ll_count_reg_aux=0 or isnull(ll_count_reg_aux) then
									ls_asunto				= 'AVISO DE REDUCCION PARA EL DIA '+STRING(ldt_fech_sepult,"dd/mm/yyyy")+' HORA: '+string(ll_hora_sepult,'00')+' '+string(ll_minuto_sepult,'00')+' enviado por: '+ls_nom_usuario+' PARQUE: '+ls_descrip_parque
									ls_texto 				= 'Recordamos que se GENERO Ficha de Reducción a Realizarse el día '+string(ldt_fech_sepult,'dd/mm/yyyy')+' a las '+string(ll_hora_sepult,'00')+':'+string(ll_minuto_sepult,'00')+', Sector: '+ls_sector+' Nº Sepultura: '+ls_sepultura+' Nº Técnico: '+ls_numero_tecni+', el Nombre del Fallecido es '+ls_nombre_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall
								else
									if (ll_hora_sepult_aux <> ll_hora_sepult and ll_min_sepult_aux <> ll_minuto_sepult) then
										ls_asunto			= 'AVISO MODIFICACION DE REDUCCION PARA EL DIA '+STRING(ldt_fech_sepult,"dd/mm/yyyy")+' HORA: '+string(ll_hora_sepult,'00')+' '+string(ll_minuto_sepult,'00')+' enviado por : '+ls_nom_usuario+' PARQUE: '+ls_descrip_parque
										ls_texto 			= 'Recordamos que se MODIFICO HORARIO Ficha de Reducción a Realizarse el día '+string(ldt_fech_sepult,'dd/mm/yyyy')+' a las '+string(ll_hora_sepult,'00')+':'+string(ll_minuto_sepult,'00')+', Sector: '+ls_sector+' Nº Sepultura: '+ls_sepultura+' Nº Técnico: '+ls_numero_tecni+', el Nombre del Fallecido es '+ls_nombre_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall
									end if
								end if
								if ls_obs_sep_comp<>'' and ls_obs_sep_comp<>'-' and not isnull(ls_obs_sep_comp) and not isnull(ls_texto) then
									ls_texto					= ls_texto+ ' Observación Generales: '+ls_obs_sep_comp
									if not isnull(ls_obs_fall) then
										ls_texto				= ls_texto+ ' Observación Fallecido: '+ls_obs_fall+'- Tamaño Cuerpo: '+ls_descrip_tamano
									end if
								end if
								if not isnull(ls_texto) then
									ls_texto					= ls_texto+'         Atte.Depto.At.y Serv.al Cliente'
									SELECT DISTINCT "ENCARGADOS"."EMAIL"  
									INTO 		:email_de  
									FROM 		"ENCARGADOS"  
									WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
									USING		sqlca;
									if isnull(email_de) or email_de='-' or email_de='' then
										email_de				= 'consulta@nuestrosparques.cl'
									end if
									
									SELECT 	"MEMBRETE_EMPRESA"."MAIL_SEPULTACION"  
									INTO 		:ls_email_para  
									FROM 	"MEMBRETE_EMPRESA"  
									WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_parque
									USING	sqlca;
									
									select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
									INTO 		:ls_res
									from 		DUAL;
									if ls_res='OK' then
										messagebox("Envio Email","Envio Email Exitoso")
									else
										messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
									end if

									SELECT sysdate INTO :gdt_fec_sistema FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
									INSERT INTO "FICHA_LOG_EMAIL"  
												( "FECHA_CREA",		"USUARIO_ENVIA",	"OBS_ENVIADA",	"USUARIO_RECEPTOR",	"COD_PARQUE",	"SECTOR",	"SEPULTURA",	"FECHA_SEPULTACION",	"HORA_SEPULTACION",	"MINUTO_SEPULTACION" )  
									VALUES 	( :gdt_fec_sistema,	:gs_user,			:ls_texto,		:ls_email_para,		:ll_parque,		:ls_sector,	:ls_sepultura,	:ldt_fech_sepult,		:ll_hora_sepult,		:ll_minuto_sepult	 )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								end if
							else
								messagebox("Advertencia","No Existe Administrador Autorizado en Parque "+ls_descrip_parque+" para Envio Email, en Tabla FICHA_ADMINISTRADORES")
							end if
						end if
						close x1;
					end if
				end if
				wf_carga_detalle_boletas(ls_base, ls_serie, ll_numero, ll_corr_interno, ll_rut_tit, date(ldt_fech_sepult), ll_parque)
				ll_res_grabar	= messagebox("Grabar","Grabación Exitosa, desea Limpiar Pantalla",Exclamation!,YesNo!,2)
				if ll_res_grabar=1 then
					tab_1.tabpage_1.dw_ant_fall.reset()
					tab_1.tabpage_2.dw_ant_titular.reset()
					tab_1.tabpage_3.dw_ficha_sepult.reset()
					tab_1.tabpage_4.dw_aranceles.reset()
					idw_detalle5.reset()
					idw_detalle6.reset()
					idw_detalle5.InsertRow(0)
					idw_detalle6.InsertRow(0)
					tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
					tab_1.tabpage_2.dw_ant_titular.InsertRow(0)
					tab_1.tabpage_3.dw_ficha_sepult.InsertRow(0)
					if gs_depto='R' or gs_depto='M' then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'codigo_ejecutivo',gs_user)
					end if
					tab_1.tabpage_4.dw_aranceles.InsertRow(0)
					tab_1.tabpage_1.dw_ant_fall.enabled	      	= false
					tab_1.tabpage_2.dw_ant_titular.enabled		= false
					tab_1.tabpage_4.dw_aranceles.enabled		= false
					tab_1.SelectTab(1)
					tab_1.tabpage_1.dw_ant_fall.setfocus()
					tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
				else
					cb_carta.setfocus()
				end if
				if isvalid(w_mantenedor_estadistico) then 
					close(w_ingreso_ficha_sepultacion)
					w_mantenedor_estadistico.setfocus()
				end if
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Ficha Reducción SQL: "+sqlca.sqlerrtext)
			end if
		END IF
	end if
end if
end event

event getfocus;Long		ll_cod_parque
String	ls_sector,ls_sepultura
if tab_1.tabpage_3.dw_ficha_sepult.getrow()>0 then
	ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
	ls_sector			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')
	ls_sepultura		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')
	if isnull(ll_cod_parque) then
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
	elseif isnull(ls_sector) then
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector')
	elseif isnull(ls_sepultura) then
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura')
	end if
end if
end event

type cb_limpiar from commandbutton within w_ingreso_ficha_reduccion
integer x = 1381
integer y = 2516
integer width = 215
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long		ll_resp
string	ls_tabpage

ll_resp	= messagebox("ADVERTENCIA","Esta seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp=1 then
	tab_1.tabpage_1.dw_ant_fall.reset()
	tab_1.tabpage_2.dw_ant_titular.reset()
	tab_1.tabpage_3.dw_ficha_sepult.reset()
	tab_1.tabpage_4.dw_aranceles.reset()
	tab_1.tabpage_3.em_rut.text		= ''
	idw_detalle.reset()
	idw_detalle.insertrow(0)
	idw_detalle2.reset()
	idw_detalle2.insertrow(0)
	idw_detalle9.reset()
	idw_detalle9.insertrow(0)
	idw_detalle3.reset()
	idw_detalle3.insertrow(0)
	idw_detalle5.reset()
	idw_detalle5.insertrow(0)
	idw_detalle6.reset()
	idw_detalle6.insertrow(0)
	idw_detalle7.reset()
	idw_detalle7.insertrow(0)
	idw_detalle8.reset()
	idw_detalle8.insertrow(0)
	idw_detalle4.reset()
	idw_detalle4.insertrow(0)
	tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
	tab_1.tabpage_1.dw_ant_fall.setitem(1,'sw_titular_fall',1)
	tab_1.tabpage_1.dw_ant_fall.setitem(1,'usar_capilla','N')
	tab_1.tabpage_1.dw_ant_fall.setitem(1,'sw_alto_impacto',1)
	tab_1.tabpage_2.dw_ant_titular.InsertRow(0)
	tab_1.tabpage_3.dw_ficha_sepult.InsertRow(0)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sw_pase_sepultacion',1)
	if gs_depto='R' or gs_depto='M' then
		tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'codigo_ejecutivo',gs_user)
	end if
	tab_1.tabpage_4.dw_aranceles.InsertRow(0)
	tab_1.tabpage_1.dw_ant_fall.enabled	      = false
	tab_1.tabpage_2.dw_ant_titular.enabled		= false
	tab_1.tabpage_4.dw_aranceles.enabled		= false
end if
tab_1.tabpage_1.dw_ant_fall.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.enabled		= true   
tab_1.SelectTab(1)
tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
tab_1.tabpage_3.dw_ficha_sepult.setfocus()

end event

type dw_print from datawindow within w_ingreso_ficha_reduccion
boolean visible = false
integer x = 809
integer y = 2656
integer width = 457
integer height = 600
string title = "none"
string dataobject = "dw_ingreso_ficha_reduccion_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_ingreso_ficha_reduccion
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 48
integer width = 3753
integer height = 2404
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_3 tabpage_3
tabpage_2 tabpage_2
tabpage_1 tabpage_1
tabpage_4 tabpage_4
end type

event ue_mousemove;tab_1.tabpage_3.st_help.visible	= false
end event

on tab_1.create
this.tabpage_3=create tabpage_3
this.tabpage_2=create tabpage_2
this.tabpage_1=create tabpage_1
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_3,&
this.tabpage_2,&
this.tabpage_1,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_3)
destroy(this.tabpage_2)
destroy(this.tabpage_1)
destroy(this.tabpage_4)
end on

event clicked;Long	ll_cod_parque,ll_tot_reg,ll_indi

CHOOSE CASE tab_1.SelectedTab
	CASE 3
		ll_cod_parque	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
		ll_tot_reg		= tab_1.tabpage_1.dw_ant_fall.rowcount()
		if ll_cod_parque>0 then
			for ll_indi=1 to ll_tot_reg
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'cod_parque',ll_cod_parque)
			next
			tab_1.tabpage_1.dw_ant_fall.accepttext()
		end if
		tab_1.tabpage_1.dw_ant_fall.setcolumn('llave')
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		il_tab	= 3
		
	CASE 2
		tab_1.tabpage_2.dw_ant_titular.setcolumn('rut_titular')
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		il_tab	= 2
		
	CASE 1
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('minutos')
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		il_tab	= 1
		
	CASE 4
		tab_1.tabpage_4.dw_aranceles.setfocus()
		il_tab	= 4
		
END CHOOSE
end event

event selectionchanged;CHOOSE CASE tab_1.SelectedTab
	CASE 1
//		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		il_tab	= 1
	CASE 2
//		tab_1.tabpage_2.dw_ant_titular.scrolltorow(tab_1.tabpage_2.dw_ant_titular.rowcount())
		tab_1.tabpage_2.dw_ant_titular.setcolumn('rut_titular')
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		il_tab	= 2
	CASE 3
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(tab_1.tabpage_1.dw_ant_fall.rowcount())
		tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		il_tab	= 3
	CASE 4
//		tab_1.tabpage_4.dw_aranceles.scrolltorow(tab_1.tabpage_4.dw_aranceles.rowcount())
		tab_1.tabpage_4.dw_aranceles.setcolumn('codigo_parentesco')
		tab_1.tabpage_4.dw_aranceles.setfocus()
		il_tab	= 4
END CHOOSE
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3717
integer height = 2276
long backcolor = 67108864
string text = "  Ficha Reducción"
long tabtextcolor = 33554432
string picturename = "AutosizeHeight!"
long picturemaskcolor = 536870912
st_6 st_6
em_rut em_rut
st_5 st_5
st_help st_help
st_3 st_3
dw_ficha_sepult dw_ficha_sepult
gb_3 gb_3
end type

on tabpage_3.create
this.st_6=create st_6
this.em_rut=create em_rut
this.st_5=create st_5
this.st_help=create st_help
this.st_3=create st_3
this.dw_ficha_sepult=create dw_ficha_sepult
this.gb_3=create gb_3
this.Control[]={this.st_6,&
this.em_rut,&
this.st_5,&
this.st_help,&
this.st_3,&
this.dw_ficha_sepult,&
this.gb_3}
end on

on tabpage_3.destroy
destroy(this.st_6)
destroy(this.em_rut)
destroy(this.st_5)
destroy(this.st_help)
destroy(this.st_3)
destroy(this.dw_ficha_sepult)
destroy(this.gb_3)
end on

type st_6 from statictext within tabpage_3
integer x = 2546
integer y = 64
integer width = 928
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "(Solo Contrato NO Ingresado)"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_rut from editmask within tabpage_3
integer x = 2126
integer y = 40
integer width = 393
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;string	ls_base_rez,ls_serie_rez,ls_nombre_rez,ls_ap_paterno_rez,ls_ap_materno_rez,ls_direccion_rez,ls_comuna_rez,ls_ciudad_rez,ls_fono_rez,ls_dv_rez,&
		ls_sector,ls_sepult,ls_estado_rez,ls_nom_falle,ls_ap_pater_falle,ls_ap_mater_falle,ls_est_falle,ls_string
long ll_rut,ll_numero_rez,ll_cod_parque

if long(this.text)>0 then
	ll_rut		= long(trim(em_rut.text))
	if ll_rut>0 then
		SELECT 	DISTINCT "RESERVA_SEPULTURA"."SECTOR", "RESERVA_SEPULTURA"."SEPULTURA",  "RESERVA_SEPULTURA"."COD_PARQUE", "RESERVA_SEPULTURA"."BASE", "RESERVA_SEPULTURA"."SERIE", "RESERVA_SEPULTURA"."NUMERO",  "RESERVA_SEPULTURA"."NOMBRE", "RESERVA_SEPULTURA"."A_PATERNO", "RESERVA_SEPULTURA"."A_MATERNO"   
		INTO		:ls_sector,:ls_sepult,:ll_cod_parque,:ls_base_rez,	:ls_serie_rez,:ll_numero_rez,	:ls_nombre_rez,							:ls_ap_paterno_rez,  					:ls_ap_materno_rez			
			FROM 	"RESERVA_SEPULTURA"  
			WHERE 	"RESERVA_SEPULTURA"."RUT" = :ll_rut ;
		if ll_cod_parque > 0 and ll_numero_rez > 0 then
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'cod_parque',ll_cod_parque)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sector',ls_sector)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sepultura',ls_sepult)
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'rut_titular',ll_rut)
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'dv_titular',ls_dv_rez)
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'nombre_titular',ls_nombre_rez)
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'ap_paterno_titular',ls_ap_paterno_rez)
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'ap_materno_titular',ls_ap_materno_rez)
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'direccion_titular','-')
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'codigo_comuna_titular','-')
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'codigo_ciudad_titular','-')
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'fono_titular','-')
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'tipo_via_titular','-')
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'num_direccion_titular','-')
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'depto_direccion_titular','-')
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'block_direccion_titular','-')
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'poblacion_villa_titular','-')
			tab_1.tabpage_2.dw_ant_titular.setitem(1,'sector_titular','-')
			//
			DECLARE x1 CURSOR FOR
			SELECT "FALLECIDOS"."NOMBRES",   
				"FALLECIDOS"."AP_PATERNO",   
				"FALLECIDOS"."AP_MATERNO",   
				"FALLECIDOS"."EST"  
			FROM "FALLECIDOS"  
			WHERE ( "FALLECIDOS"."BASE" = :gs_base ) AND  
					( "FALLECIDOS"."SS" = :gs_serie ) AND  
					( "FALLECIDOS"."CONTRATO" = :gi_numero ) AND  
					( "FALLECIDOS"."SECTOR" = :ls_sector ) AND  
					( "FALLECIDOS"."N_SEP" = :ls_sepult )  AND
					 ( "FALLECIDOS"."ESTADO_REG" = 'A' )
			USING	sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x1 into :ls_nom_falle,:ls_ap_pater_falle,:ls_ap_mater_falle,:ls_est_falle;
					if not isnull(ls_nom_falle) and ls_nom_falle <> '' then
						ls_string		= ls_string+' '+ls_nom_falle+' '+ls_ap_pater_falle+' '+ls_ap_mater_falle+' '+ls_est_falle+'||'
					end if
					Setnull(ls_nom_falle);Setnull(ls_ap_pater_falle);Setnull(ls_ap_mater_falle);Setnull(ls_est_falle)
				LOOP
			end if	
			close x1;
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'observacion_sepultura_completa',ls_string)
			tab_1.tabpage_3.dw_ficha_sepult.accepttext()
			//
		else
			messagebox("Advertencia","No se Encuentra Dato")
			em_rut.setfocus()
		end if	
	else
		if isnull(ll_rut) or ll_rut=0 then
			messagebox("Advertencia","Debe Ingresar Rut del Titular del NI")
			em_rut.setfocus()
		end if
	end if
end if

end event

type st_5 from statictext within tabpage_3
integer x = 1874
integer y = 64
integer width = 242
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut Titular"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_help from statictext within tabpage_3
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2258
integer y = 360
integer width = 558
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 28377087
boolean enabled = false
string text = "< Doble Click Obituario >"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;tab_1.tabpage_3.st_help.visible	= false
end event

type st_3 from statictext within tabpage_3
event ue_mousemove pbm_mousemove
integer x = 87
integer y = 40
integer width = 1490
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Ficha de Reducción"
boolean focusrectangle = false
end type

event ue_mousemove;tab_1.tabpage_3.st_help.visible	= false
end event

type dw_ficha_sepult from datawindow within tabpage_3
event ue_mousemove pbm_dwnmousemove
integer x = 78
integer y = 160
integer width = 3561
integer height = 2064
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_ficha_reduccion"
boolean border = false
end type

event ue_mousemove;String	ls_columna,ls_sector,ls_sepultura
Datetime	ldt_fec_sepult
Long		ll_cod_parque

ls_columna									= dwo.name
ldt_fec_sepult								= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
ls_sector										= this.getitemstring(this.getrow(),'sector')
ls_sepultura									= this.getitemstring(this.getrow(),'sepultura')
ll_cod_parque								= this.getitemnumber(this.getrow(),'cod_parque')
if isnull( ldt_fec_sepult ) or  ls_sector ='' or isnull( ls_sector ) or &
	isnull( ls_sepultura ) or  ls_sepultura ='' or  ll_cod_parque =0 or isnull( ll_cod_parque ) then
else
	if ls_columna='t_4' then//or ls_columna='hora' or ls_columna='t_5' or ls_columna='minutos'
		tab_1.tabpage_3.st_help.visible	= true
	else
		tab_1.tabpage_3.st_help.visible	= false
	end if
end if
end event

event itemchanged;String		ls_columna,ls_base, ls_ciudad,ls_serie,ls_sector_sepult,ls_nro_sepultura,ls_estado_ctto,ls_nro_tecnico,ls_dv_titular,ls_nom_titular,ls_ap_pat_titular,ls_ap_mat_titular,&
			ls_cod_tipo_via,ls_direccion_p,ls_nro_part,ls_depto_part,ls_block_part,ls_pob_part,ls_sector_part,ls_comuna_part,ls_ciudad_part,ls_fono_part,ls_sector,ls_sepultura,ls_obs_credito,&
			ls_obs_mantencion,ls_vd_estadistico,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit, ls_tipo_via_tit,ls_direc_tit,ls_num_dir_tit,ls_dpto_dir_tit,ls_block_dir_tit,ls_pob_villa_tit,ls_sector_tit,&
			ls_cod_ciud_tit,ls_cod_com_tit,ls_fono_titular,ls_cod_ejecutivo,ls_nivel,ls_var_nivel,ls_var_final,ls_nivel_aux,ls_var_cap,ls_dv,ls_parque,ls_estado_reg,ls_cod_age_aux,ls_ciu_tit,ls_pasa,ls_pasa1,&
			ls_est_ctto,ls_descrip_estado,ls_nulo,ls_pasa_ctrol,ls_obs_pase,ls_mensaje_prov,ls_nro_tec_ctto,ls_tipo_cons
Long		ll_cod_parque,ll_capacidad,ll_mora_cred,ll_mora_mant,ll_rut_titular,ll_hora,ll_count_fosa,ll_minutos,ll_new,ll_resp,ll_hora_recep,ll_minuto_recep,ll_hora_lleg_efec,ll_minu_lleg_efec,&
			ll_new_titular,ll_count_fall,ll_pos,ll_rut,ll_hora_hoy,ll_minutos_hoy,ll_new_fall,ll_new_ara,ll_anno,ll_hora_fijada,ll_min_fijada,ll_parque_tras,ll_count_sep,ll_count_tras,ll_count_suma,&
			ll_count_reserva,ll_parque_aux,ll_count_tiene,ll_sw_pase_sepultacion,ll_ins_fall,ll_count_cap,ll_nulo,ll_capacidad_ctto,ll_nro_tec_ctto,ll_count_red
Datetime	ldt_fecha_ctto,ldt_fecha_sepult,ldt_fecha_recep,ldt_fecha_hoy,ldt_fec_tras,&
			ldt_nulo,ldt_fecha_ini,ldt_fecha_fin
Date		ld_fecha,ld_fecha_sepult
Double	ll_numero

this.accepttext()
Setnull(ldt_nulo);SetNull(ls_nulo);Setnull(ll_nulo)
ls_columna				= dwo.name
if ls_columna='cod_parque' or ls_columna='sector' or ls_columna='sepultura' or ls_columna='fecha_sepultacion' or ls_columna='fecha_sepultacion_1' then
	ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
	ls_sector			= this.getitemstring(this.getrow(),'sector')
	ls_sepultura		= this.getitemstring(this.getrow(),'sepultura')
	if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and &
		not isnull(ls_sepultura) and ls_sepultura<>'' then
		if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
			idw_detalle8.insertrow(0)
		end if
		if idw_detalle9.retrieve(ls_sector,ls_sepultura)=0 then
			idw_detalle9.insertrow(0)
		end if
		ls_pasa		= 'S'
		ls_pasa1		= 'S'
		if ls_pasa='S' or ls_pasa1='S' then
			ldt_fecha_sepult	= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
			if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and &
				not isnull(ls_sepultura) and ls_sepultura<>'' then //and not isnull(ldt_fecha_sepult)
				if dw_ficha_sepult.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)=0 then
					if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
						idw_detalle8.insertrow(0)
					end if
					idw_detalle7.reset()
					idw_detalle7.insertrow(0)
					idw_detalle.reset()
					idw_detalle.insertrow(0)
					if idw_detalle5.retrieve(ll_cod_parque)=0 then
						idw_detalle5.insertrow(0)
					end if
					if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
						idw_detalle6.insertrow(0)
					end if
					if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
						idw_detalle8.insertrow(0)
					end if
					if idw_detalle9.retrieve(ls_sector,ls_sepultura)=0 then
						idw_detalle9.insertrow(0)
					end if
					ll_new		= dw_ficha_sepult.insertrow(0)
					dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
					dw_ficha_sepult.setitem(ll_new,'cod_parque',ll_cod_parque)
					dw_ficha_sepult.setitem(ll_new,'sector',ls_sector)
					dw_ficha_sepult.setitem(ll_new,'sepultura',ls_sepultura)
					dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
					dw_ficha_sepult.setitem(ll_new,'sw_pase_sepultacion',1)
					dw_ficha_sepult.setitem(ll_new,'sw_titular_fall',1)
					dw_ficha_sepult.accepttext()
					dw_ficha_sepult.setcolumn('fecha_sepultacion')
					SELECT	"INVENTARIO_PLANI"."BASE",   
								"INVENTARIO_PLANI"."SERIE",   
								"INVENTARIO_PLANI"."NUMERO",
								"INVENTARIO_PLANI"."NUMERO_TEC",
								"INVENTARIO_PLANI"."CAPACIDAD"
					INTO 		:ls_base,   
								:ls_serie,   
								:ll_numero,
								:is_nro_tecnico,
								:il_capacidad
					FROM 		"INVENTARIO_PLANI"  
					WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque ) AND  
							 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
							 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) 
					USING		sqlca;
//					if ls_pasa1='S' then
//						SELECT	"RESERVA_SEPULTURA"."BASE",	"RESERVA_SEPULTURA"."SERIE",	"RESERVA_SEPULTURA"."NUMERO",	"RESERVA_SEPULTURA"."CAPACIDAD"  
//						INTO 		:ls_base,							:ls_serie,							:ll_numero,							:il_capacidad
//						FROM 		"RESERVA_SEPULTURA"  
//						WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
//								 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
//								 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND  
//								 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) AND  
//								 ( "RESERVA_SEPULTURA"."FOLIO_RESERVA" = ( 	SELECT MAX("RESERVA_SEPULTURA"."FOLIO_RESERVA") 
//																							FROM 		"RESERVA_SEPULTURA" 
//																							WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND 
//																									 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
//																									 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND 
//																									 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) ) )   
//						USING		sqlca;
//					end if
					if sqlca.sqlcode=0 then
						if ls_base='O' then
							if ll_numero=10000000 then
								ls_pasa_ctrol	= 'S'
							else
								SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
								INTO 		:ll_parque_aux,				:ls_cod_age_aux  
								FROM 		"CD_FOLIO"  
								WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
										 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
								USING		Trans_2;
								if Trans_2.sqlcode=0 then
									ls_pasa_ctrol		= 'S'
								else
									if (ll_numero <= 84000 and gs_conexion	= "Parque El Prado") or &
										(ll_numero <= 15884 and gs_conexion	= "Parque La Foresta") then
										ls_pasa_ctrol	= 'S'
									else
										ls_pasa_ctrol	= 'N'
									end if
								end if
							end if
						else
							ls_pasa_ctrol			= 'S'
						end if
						if ls_pasa_ctrol='S' then
							SELECT	"CADENA"."ESTADO",   
										"CLIENTE"."RUT",   
										"CLIENTE"."DV",   
										"CLIENTE"."NOMBRE",   
										"CLIENTE"."A_PATERNO",   
										"CLIENTE"."A_MATERNO"  
							INTO		:ls_est_ctto,   
										:ll_rut_titular,   
										:ls_dv_titular,   
										:ls_nom_titular,   
										:ls_ap_pat_titular,   
										:ls_ap_mat_titular  
							FROM		"CADENA",   
										"CLIENTE"  
							WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
									 ( "CADENA"."CODIGO" = :ls_base ) AND  
									 ( "CADENA"."SERIE" = :ls_serie ) AND  
									 ( "CADENA"."NUMERO" = :ll_numero )  
							USING		sqlca;
							if ls_est_ctto='V' or ls_est_ctto='C' or ls_est_ctto='R' or ls_est_ctto='S' or ls_est_ctto='N' or ls_est_ctto='D' or ls_est_ctto='A' or sqlca.sqlcode=100 then
								if not isnull(ldt_fecha_sepult) then
									ldt_fecha_ini	= datetime(RelativeDate(date(gdt_fec_sistema),  - 30))
									ldt_fecha_fin	= datetime(RelativeDate(date(gdt_fec_sistema), 60))
									if ldt_fecha_sepult <= ldt_fecha_fin and ldt_fecha_sepult >= ldt_fecha_ini then
										dw_ficha_sepult.setitem(ll_new,'fecha_sepultacion',ldt_fecha_sepult)
										dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
										
										if isnull(ls_nom_titular) then ls_nom_titular=''
										if isnull(ls_ap_pat_titular) then ls_ap_pat_titular=''
										if isnull(ls_ap_mat_titular) then ls_ap_mat_titular=''
										if ll_numero = 90000000 then
											messagebox("Advertencia","No es posible Generar Ficha de Reducción en Fosa Común")
											ll_resp		= 2
										else
											ll_resp		= messagebox("Advertencia","Para Titular " +string(ll_rut_titular,'###,###,###,###,###')+'-'+ls_dv_titular+' '+ls_nom_titular+' '+ls_ap_pat_titular+' '+ls_ap_mat_titular+" No Existe Ficha de Reducción, desea Ingresarla",Exclamation!,YesNo!,2)
										end if
										if ll_resp=1 then
											is_nuevo						= 'S'
											dw_ficha_sepult.accepttext()
											SELECT sysdate INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
											ldt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
											ll_hora_hoy					= long(string(gdt_fec_sistema,'hh'))
											ll_minutos_hoy				= long(string(gdt_fec_sistema,'mm'))
											dw_ficha_sepult.setitem(ll_new,'estado_reg','P')
											if is_usuario_esta='S' then
												dw_ficha_sepult.setitem(ll_new,'fecha_recepcion',ldt_fecha_hoy)
												dw_ficha_sepult.setitem(ll_new,'hora_recepcion',ll_hora_hoy)
												dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',ll_minutos_hoy)
											end if
											dw_ficha_sepult.setitem(ll_new,'c_estado_reg','S')
											dw_ficha_sepult.setitem(ll_new,'correlativo_interno',1)
											dw_ficha_sepult.setitem(ll_new,'sw_condolencia',1)
											dw_ficha_sepult.setitem(ll_new,'est_uso_firma_digital',1)
											dw_ficha_sepult.setitem(ll_new,'sw_dato_funeraria',1)
											dw_ficha_sepult.setitem(ll_new,'estado_responso','N')
											dw_ficha_sepult.setitem(ll_new,'hora',0)
											dw_ficha_sepult.setitem(ll_new,'minutos',0)
											dw_ficha_sepult.setitem(ll_new,'hora_recepcion',0)
											dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',0)
											dw_ficha_sepult.setitem(ll_new,'hora_llegada_efectiva',0)
											dw_ficha_sepult.setitem(ll_new,'minuto_llegada_efectiva',0)
											dw_ficha_sepult.setitem(ll_new,'base',ls_base)
											if idw_detalle.retrieve(ls_base)=0 then
												idw_detalle.insertrow(0)
											end if
											dw_ficha_sepult.setitem(ll_new,'serie',ls_serie)
											dw_ficha_sepult.setitem(ll_new,'numero',ll_numero)
											SELECT	COUNT("FALLECIDOS"."LLAVE")  
											INTO 		:ll_count_fall  
											FROM 		"FALLECIDOS"  
											WHERE  ( "FALLECIDOS"."BASE" = :ls_base ) AND  
													 ( "FALLECIDOS"."SS" = :ls_serie ) AND  
													 ( "FALLECIDOS"."CONTRATO" = :ll_numero ) AND
													 ( "FALLECIDOS"."EST" = 'CC' )  AND
					 								 ( "FALLECIDOS"."ESTADO_REG" = 'A' );
											if isnull(ll_count_fall) then ll_count_fall=0
											if ls_base='O' then
												SELECT	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR", 	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION", 	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"OFERTA_V"."FECHA",	"PAGO_OFERTA"."CAPACIDAD",	"PAGO_OFERTA"."NRO_TECNICO",	"OFERTA_V"."TIPO_CONS"
												INTO 		:ls_sector_sepult,		:ls_nro_sepultura,			:ll_cod_parque,			:ls_estado_ctto,		:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,						:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part,			:ldt_fecha_ctto,		:ll_capacidad_ctto,			:ls_nro_tec_ctto,					:ls_tipo_cons
												FROM 		"CADENA",   "CADENA_MORA",	"CLIENTE",	"OFERTA_V",	"PAGO_OFERTA"  
												WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
														 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
														 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
														 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
														 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
														 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
														 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
														 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
														 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
														 (("CADENA"."CODIGO" = 'O' ) AND  
														 ( "CADENA"."SERIE" = :ls_serie ) AND  
														 ( "CADENA"."NUMERO" = :ll_numero ) )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
													if isnull(ls_estado_ctto) or ls_estado_ctto='' then ls_estado_ctto='E'
													if not isnull(ll_capacidad_ctto) and ll_capacidad_ctto>0 then il_capacidad = ll_capacidad_ctto
													if not isnull(ls_nro_tec_ctto) and ls_nro_tec_ctto<>'' and ls_nro_tec_ctto<>'-' then is_nro_tecnico = ls_nro_tec_ctto
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','S')
													if dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque')=ll_cod_parque then
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
													else
														SELECT 	"COD_PARQ"."NOMBRE"  
														INTO 		:ls_parque  
														FROM 	"COD_PARQ"  
														WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
														USING	sqlca;
														ll_resp	= messagebox("Advertencia","Parque Inválido, Promesa Registra "+ls_parque+", desea Cambiar dato",Exclamation!,YesNo!,2)
														if ll_resp=1 then
															dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
															dw_ficha_sepult.accepttext()
														else
															dw_ficha_sepult.setcolumn('cod_parque')
														end if
													end if
													if dw_ficha_sepult.getitemstring(this.getrow(),'sector')=ls_sector_sepult then
														dw_ficha_sepult.setitem(this.getrow(),'sector',ls_sector_sepult)
													else
														ll_resp	= messagebox("Advertencia","Sector Inválido, Promesa Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
														if ll_resp=1 then
															dw_ficha_sepult.setitem(this.getrow(),'sector',ls_sector_sepult)
															dw_ficha_sepult.accepttext()
														else
															dw_ficha_sepult.setcolumn('sector')
														end if
													end if
													if dw_ficha_sepult.getitemstring(this.getrow(),'sepultura')=ls_nro_sepultura then
														dw_ficha_sepult.setitem(this.getrow(),'sepultura',ls_nro_sepultura)
													else
														ll_resp	= messagebox("Advertencia","Sepultura Inválida, Promesa Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
														if ll_resp=1 then
															dw_ficha_sepult.setitem(this.getrow(),'sepultura',ls_nro_sepultura)
															dw_ficha_sepult.accepttext()
														else
															dw_ficha_sepult.setcolumn('sepultura')
														end if
													end if
													dw_ficha_sepult.setitem(this.getrow(),'capacidad',il_capacidad)
													idw_detalle7.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)
													
													dw_ficha_sepult.setitem(this.getrow(),'estado_credito',ll_mora_cred)
													dw_ficha_sepult.setitem(this.getrow(),'estado_mantencion',ll_mora_cred)
													dw_ficha_sepult.setitem(this.getrow(),'numero_tecnico',is_nro_tecnico)//ls_nro_tecnico)
													dw_ficha_sepult.setitem(this.getrow(),'cod_estado_contrato',ls_estado_ctto)
													dw_ficha_sepult.setitem(this.getrow(),'cantidad_sepultados',ll_count_fall)
													dw_ficha_sepult.setitem(this.getrow(),'capacidad_libre_sepultura',il_capacidad - ll_count_fall)
													dw_ficha_sepult.accepttext()
													if (il_capacidad - ll_count_fall)=0 then
														dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_completa','S')
													else
														dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_completa','N')
													end if
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'rut_titular',ll_rut_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'dv_titular',ls_dv_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'nombre_titular',ls_nom_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_paterno_titular',ls_ap_pat_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_materno_titular',ls_ap_mat_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'tipo_via_titular',ls_cod_tipo_via)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'direccion_titular',ls_direccion_p)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'num_direccion_titular',ls_nro_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'depto_direccion_titular',ls_depto_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'block_direccion_titular',ls_block_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'poblacion_villa_titular',ls_pob_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'sector_titular',ls_sector_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_ciudad_titular',ls_ciudad_part)
													if idw_detalle3.retrieve(ls_ciudad_part)=0 then
														idw_detalle3.insertrow(0)
													end if
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_comuna_titular',ls_comuna_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'fono_titular',ls_fono_part)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato',ldt_fecha_ctto)
												else
													SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
													INTO 		:ll_parque_aux,				:ls_cod_age_aux  
													FROM 		"CD_FOLIO"  
													WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
															 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
													USING		Trans_2;
													if Trans_2.sqlcode=0 then
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','S')
														dw_ficha_sepult.setitem(this.getrow(),'estado_credito',0)
														dw_ficha_sepult.setitem(this.getrow(),'estado_mantencion',0)
													else
														messagebox("Advertencia","Contrato No Existe en Control Documentario")
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','N')
													end if
												end if
											elseif ls_base='C' then
												SELECT	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."FECHA",	"CONTRATO"."CAPACIDAD",		"CONTRATO"."NRO_TEC",	'T'
												INTO 		:ls_estado_ctto,		:ll_cod_parque,			:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part  ,		:ls_sector_sepult,	:ls_nro_sepultura,		:ldt_fecha_ctto,		:ll_capacidad_ctto,			:ll_nro_tec_ctto,			:ls_tipo_cons
												FROM 		"CADENA",	"CADENA_MORA",	"CLIENTE",	"CONTRATO"  
												WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
														 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
														 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
														 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
														 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
														 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
														 (("CADENA"."CODIGO" = 'C' ) AND  
														 ( "CADENA"."SERIE" = :ls_serie ) AND  
														 ( "CADENA"."NUMERO" = :ll_numero ) )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
													if isnull(ls_estado_ctto) or ls_estado_ctto='' then ls_estado_ctto='E'
													if not isnull(ll_capacidad_ctto) and ll_capacidad_ctto>0 then il_capacidad = ll_capacidad_ctto
													if not isnull(ll_nro_tec_ctto) and ll_nro_tec_ctto>0 then is_nro_tecnico = String(ll_nro_tec_ctto)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','S')
													if dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque')=ll_cod_parque then
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
													else
														SELECT 	"COD_PARQ"."NOMBRE"  
														INTO 		:ls_parque  
														FROM 	"COD_PARQ"  
														WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
														USING	sqlca;	
														ll_resp	= messagebox("Advertencia","Parque Inválido, Contrato Registra "+ls_parque+", desea Cambiar dato",Exclamation!,YesNo!,2)
														if ll_resp=1 then
															dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
															dw_ficha_sepult.accepttext()
														else
															dw_ficha_sepult.setcolumn('cod_parque')
														end if
													end if
													if dw_ficha_sepult.getitemstring(this.getrow(),'sector')=ls_sector_sepult then
														dw_ficha_sepult.setitem(this.getrow(),'sector',ls_sector_sepult)
													else
														ll_resp	= messagebox("Advertencia","Sector Inválido, Contrato Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
														if ll_resp=1 then
															dw_ficha_sepult.setitem(this.getrow(),'sector',ls_sector_sepult)
															dw_ficha_sepult.accepttext()
														else
															dw_ficha_sepult.setcolumn('sector')
														end if
													end if
													if dw_ficha_sepult.getitemstring(this.getrow(),'sepultura')=ls_nro_sepultura then
														dw_ficha_sepult.setitem(this.getrow(),'sepultura',ls_nro_sepultura)
													else
														ll_resp	= messagebox("Advertencia","Sepultura Inválida, Contrato Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
														if ll_resp=1 then
															dw_ficha_sepult.setitem(this.getrow(),'sepultura',ls_nro_sepultura)
															dw_ficha_sepult.accepttext()
														else
															dw_ficha_sepult.setcolumn('sepultura')
														end if
													end if
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'capacidad',il_capacidad)
													idw_detalle7.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'estado_credito',ll_mora_cred)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'estado_mantencion',ll_mora_cred)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'numero_tecnico',is_nro_tecnico)//ls_nro_tecnico)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_estado_contrato',ls_estado_ctto)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cantidad_sepultados',ll_count_fall)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'capacidad_libre_sepultura',il_capacidad - ll_count_fall)
													dw_ficha_sepult.accepttext()
													if (il_capacidad - ll_count_fall)=0 then
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'estado_sepultura_completa','S')
													else
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'estado_sepultura_completa','N')
													end if
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'rut_titular',ll_rut_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'dv_titular',ls_dv_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'nombre_titular',ls_nom_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_paterno_titular',ls_ap_pat_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_materno_titular',ls_ap_mat_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'tipo_via_titular',ls_cod_tipo_via)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'direccion_titular',ls_direccion_p)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'num_direccion_titular',ls_nro_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'depto_direccion_titular',ls_depto_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'block_direccion_titular',ls_block_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'poblacion_villa_titular',ls_pob_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'sector_titular',ls_sector_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_ciudad_titular',ls_ciudad_part)
													if idw_detalle3.retrieve(ls_ciudad_part)=0 then
														idw_detalle3.insertrow(0)
													end if
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_comuna_titular',ls_comuna_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'fono_titular',ls_fono_part)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato',ldt_fecha_ctto)
												else
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','N')
												end if
											end if
											ll_cod_parque	= dw_ficha_sepult.getitemnumber(dw_ficha_sepult.getrow(),'cod_parque')
											if idw_detalle4.retrieve(ll_cod_parque,'FS')=0 then
												idw_detalle4.insertrow(0)
											end if
											tab_1.tabpage_2.dw_ant_titular.enabled		= true
											tab_1.tabpage_1.dw_ant_fall.enabled			= true
											tab_1.tabpage_4.dw_aranceles.enabled		= true
											dw_ficha_sepult.setfocus()
											dw_ficha_sepult.setcolumn('hora')
										else
											dw_ficha_sepult.reset()
											idw_detalle7.reset()
											idw_detalle7.insertrow(0)
											idw_detalle.reset()
											idw_detalle.insertrow(0)
											if idw_detalle5.retrieve(ll_cod_parque)=0 then
												idw_detalle5.insertrow(0)
											end if
											if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
												idw_detalle6.insertrow(0)
											end if
											if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
												idw_detalle8.insertrow(0)
											end if
											if idw_detalle9.retrieve(ls_sector,ls_sepultura)=0 then
												idw_detalle9.insertrow(0)
											end if
											ll_new												= dw_ficha_sepult.insertrow(0)
											dw_ficha_sepult.setitem(ll_new,'c_estado_reg','N')
											dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
											dw_ficha_sepult.setitem(ll_new,'sw_pase_sepultacion',1)
											dw_ficha_sepult.setitem(ll_new,'sw_titular_fall',1)
											dw_ficha_sepult.scrolltorow(dw_ficha_sepult.rowcount())
											dw_ficha_sepult.setfocus()
											dw_ficha_sepult.setcolumn('cod_parque')
											tab_1.tabpage_2.dw_ant_titular.reset()
											tab_1.tabpage_1.dw_ant_fall.reset()
											tab_1.tabpage_4.dw_aranceles.reset()
											idw_detalle3.reset()
											idw_detalle3.insertrow(0)
											idw_detalle2.reset()
											idw_detalle2.insertrow(0)
											tab_1.tabpage_2.dw_ant_titular.InsertRow(0)
											ll_ins_fall		= tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
											tab_1.tabpage_1.dw_ant_fall.setitem(ll_ins_fall,'usar_capilla','N')
											tab_1.tabpage_1.dw_ant_fall.setitem(ll_ins_fall,'sw_alto_impacto',1)
											tab_1.tabpage_1.dw_ant_fall.setitem(ll_ins_fall,'sw_titular_fall',1)
											tab_1.tabpage_1.dw_ant_fall.accepttext()
											if gs_depto='R' or gs_depto='M' then
												tab_1.tabpage_1.dw_ant_fall.setitem(ll_ins_fall,'codigo_ejecutivo',gs_user)
											end if
											tab_1.tabpage_1.dw_ant_fall.accepttext()
											ll_cod_parque	= dw_ficha_sepult.getitemnumber(ll_new,'cod_parque')
											if idw_detalle4.retrieve(ll_cod_parque,'FS')=0 then
												idw_detalle4.insertrow(0)
											end if
											tab_1.tabpage_4.dw_aranceles.InsertRow(0)
											tab_1.tabpage_2.dw_ant_titular.enabled		= false
											tab_1.tabpage_1.dw_ant_fall.enabled			= false
											tab_1.tabpage_4.dw_aranceles.enabled		= false
										end if
									else
										messagebox("Advertencia","Fecha Reducción Inválida, No debe ser Mayor al "+string(ldt_fecha_fin,'dd/mm/yyyy')+" ni Menor al "+string(ldt_fecha_ini,'dd/mm/yyyy'))
										this.setitem(this.getrow(),'fecha_sepultacion',ldt_nulo)
										this.accepttext()
										this.setcolumn('fecha_sepultacion')
									end if
								end if							
							else
								SELECT	"ESTADO"."NOMBRE_ESTADO"  
								INTO 		:ls_descrip_estado  
								FROM 		"ESTADO"  
								WHERE 	"ESTADO"."COD_ESTADO" = :ls_est_ctto   ;
								messagebox("Advertencia","Recuerde Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" Estado Actual es "+ls_descrip_estado+" debe estar V-VIGENTE, C-CANCELADO, A-ANULADO, D-NULO POR DACION, N-RESCILIADO o R-RESUELTO, regularice en Depto. Atención Cliente")
								dw_ficha_sepult.setcolumn('sector')
							end if
						else
							messagebox("Advertencia","Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" No Existe en Control Documentario")
							dw_ficha_sepult.setcolumn('sector')
						end if
					else
						messagebox("Advertencia","Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" No Tiene Reserva")
						dw_ficha_sepult.setcolumn('sector')
					end if
				else
					if tab_1.tabpage_2.dw_ant_titular.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)>0 then
						ls_ciu_tit	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')
						if idw_detalle3.retrieve(ls_ciu_tit)=0 then
							idw_detalle3.insertrow(0)
						end if
						ll_rut_titular	= tab_1.tabpage_2.dw_ant_titular.getitemnumber(1,'rut_titular')
						ls_dv_titular	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'dv_titular')
						ls_nom_titular	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'nombre_titular')
						ls_ap_pat_titular	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_paterno_titular')
						ls_ap_mat_titular	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_materno_titular')
					end if
					tab_1.tabpage_1.dw_ant_fall.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
					ll_cod_parque	= dw_ficha_sepult.getitemnumber(dw_ficha_sepult.getrow(),'cod_parque')
					if idw_detalle4.retrieve(ll_cod_parque,'FS')=0 then
						idw_detalle4.insertrow(0)
					end if
					tab_1.tabpage_4.dw_aranceles.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
					ls_estado_reg	= dw_ficha_sepult.getitemstring(1,'estado_reg')
					if ls_estado_reg='A' then
						messagebox("Advertencia","Ficha Anulada")
						tab_1.tabpage_2.dw_ant_titular.enabled		= false
						tab_1.tabpage_1.dw_ant_fall.enabled			= false
						tab_1.tabpage_4.dw_aranceles.enabled		= false
						dw_ficha_sepult.enabled							= false
					else
						il_count_reg	= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
						if isnull(ls_nom_titular) then ls_nom_titular=''
						if isnull(ls_ap_pat_titular) then ls_ap_pat_titular=''
						if isnull(ls_ap_mat_titular) then ls_ap_mat_titular=''
						ll_resp			= messagebox("Advertencia","Para Titular " +string(ll_rut_titular,'###,###,###,###,###')+'-'+ls_dv_titular+' '+ls_nom_titular+' '+ls_ap_pat_titular+' '+ls_ap_mat_titular+ ", desea Crear OTRA Ficha de Reducción",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							is_nuevo												= 'S'
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
							tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
							tab_1.tabpage_2.dw_ant_titular.enabled		= true
							tab_1.tabpage_1.dw_ant_fall.enabled			= true
							tab_1.tabpage_4.dw_aranceles.enabled		= true
							ls_cod_ejecutivo  = dw_ficha_sepult.getitemstring(1,'codigo_ejecutivo')
							ll_cod_parque		= dw_ficha_sepult.getitemnumber(1,'cod_parque')
							ls_sector			= dw_ficha_sepult.getitemstring(1,'sector')
							ls_sepultura		= dw_ficha_sepult.getitemstring(1,'sepultura')
							ll_hora				= dw_ficha_sepult.getitemnumber(1,'hora')
							ll_minutos			= dw_ficha_sepult.getitemnumber(1,'minutos')
							ldt_fecha_sepult	= dw_ficha_sepult.getitemdatetime(1,'fecha_sepultacion')
							ls_base           = dw_ficha_sepult.getitemstring(1,'base')
							ls_serie				= dw_ficha_sepult.getitemstring(1,'serie')
							ll_numero         = dw_ficha_sepult.getitemnumber(1,'numero')
							ldt_fecha_ctto		= dw_ficha_sepult.getitemDateTime(1,'fecha_contrato')
							ls_estado_ctto 	= dw_ficha_sepult.getitemstring(1,'cod_estado_contrato')
							ls_nro_tecnico    = dw_ficha_sepult.getitemstring(1,'numero_tecnico')
							ll_capacidad  		= dw_ficha_sepult.getitemnumber(1,'capacidad')
							ll_mora_cred		= dw_ficha_sepult.getitemnumber(1,'estado_credito')
							ls_obs_credito		= dw_ficha_sepult.getitemstring(1,'observacion_credito')
							ll_mora_mant      = dw_ficha_sepult.getitemnumber(1,'estado_mantencion')
							ls_obs_mantencion = dw_ficha_sepult.getitemstring(1,'observacion_mantencion')
							ldt_fecha_recep	= dw_ficha_sepult.getitemdatetime(1,'fecha_recepcion')
							ll_hora_recep		= dw_ficha_sepult.getitemnumber(1,'hora_recepcion')
							ll_minuto_recep	= dw_ficha_sepult.getitemnumber(1,'minuto_recepcion')
							ll_hora_lleg_efec	= dw_ficha_sepult.getitemnumber(1,'hora_llegada_efectiva')
							ll_minu_lleg_efec	= dw_ficha_sepult.getitemnumber(1,'minuto_llegada_efectiva')
							ls_vd_estadistico	= dw_ficha_sepult.getitemstring(1,'vb_estadistico')
							
							ll_rut_titular		= tab_1.tabpage_2.dw_ant_titular.getitemnumber(1,'rut_titular')
							ls_dv_titular		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'dv_titular')
							ls_nombre_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'nombre_titular')
							ls_ap_pat_tit  	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_paterno_titular')
							ls_ap_mat_tit     = tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_materno_titular')
							ls_tipo_via_tit	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'tipo_via_titular')
							ls_direc_tit      = tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'direccion_titular')
							ls_num_dir_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'num_direccion_titular')
							ls_dpto_dir_tit 	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'depto_direccion_titular')
							ls_block_dir_tit  = tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'block_direccion_titular')
							ls_pob_villa_tit  = tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'poblacion_villa_titular')
							ls_sector_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'sector_titular')
							ls_cod_ciud_tit	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')
							ls_cod_com_tit    = tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_comuna_titular')
							ls_fono_titular   = tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'fono_titular')
							if idw_detalle3.retrieve(ls_cod_ciud_tit)=0 then
								idw_detalle3.insertrow(0)
							end if
							ll_new_titular	= tab_1.tabpage_2.dw_ant_titular.insertrow(0)
							tab_1.tabpage_2.dw_ant_titular.scrolltorow(tab_1.tabpage_2.dw_ant_titular.rowcount())
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'rut_titular',ll_rut_titular)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'dv_titular',ls_dv_titular)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'nombre_titular',ls_nombre_tit)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'ap_paterno_titular',ls_ap_pat_tit)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'ap_materno_titular',ls_ap_mat_tit)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'tipo_via_titular',ls_tipo_via_tit)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'direccion_titular',ls_direc_tit)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'num_direccion_titular',ls_num_dir_tit)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'depto_direccion_titular',ls_dpto_dir_tit)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'block_direccion_titular',ls_block_dir_tit)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'poblacion_villa_titular',ls_pob_villa_tit)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'sector_titular',ls_sector_tit)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'codigo_ciudad_titular',ls_cod_ciud_tit)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'codigo_comuna_titular',ls_cod_com_tit)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'fono_titular',ls_fono_titular)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'correlativo_interno',tab_1.tabpage_2.dw_ant_titular.rowcount())
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'cod_parque',ll_cod_parque)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'sector',ls_sector)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'sepultura',ls_sepultura)
							tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'fecha_sepultacion',ldt_fecha_sepult)
							tab_1.tabpage_2.dw_ant_titular.scrolltorow(tab_1.tabpage_2.dw_ant_titular.rowcount())
							idw_detalle2.reset()
							idw_detalle2.insertrow(0)
							idw_detalle9.reset()
							idw_detalle9.insertrow(0)
							idw_detalle7.reset()
							idw_detalle7.insertrow(0)
							ll_new_fall		= tab_1.tabpage_1.dw_ant_fall.insertrow(0)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sw_titular_fall',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'correlativo_interno',tab_1.tabpage_1.dw_ant_fall.rowcount())
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'usar_capilla','N')
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sw_alto_impacto',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'cod_parque',ll_cod_parque)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sector',ls_sector)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sepultura',ls_sepultura)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'fecha_sepultacion',ldt_fecha_sepult)
							tab_1.tabpage_1.dw_ant_fall.scrolltorow(tab_1.tabpage_1.dw_ant_fall.rowcount())
							ll_cod_parque	= dw_ficha_sepult.getitemnumber(dw_ficha_sepult.getrow(),'cod_parque')
							if idw_detalle4.retrieve(ll_cod_parque,'FS')=0 then
								idw_detalle4.insertrow(0)
							end if
							tab_1.tabpage_1.dw_ant_fall.accepttext()
							ll_new_ara		= tab_1.tabpage_4.dw_aranceles.insertrow(0)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'correlativo_interno',tab_1.tabpage_4.dw_aranceles.rowcount())
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'cod_parque',ll_cod_parque)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'sector',ls_sector)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'sepultura',ls_sepultura)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'fecha_sepultacion',ldt_fecha_sepult)
							tab_1.tabpage_4.dw_aranceles.scrolltorow(tab_1.tabpage_4.dw_aranceles.rowcount())
							if idw_detalle.retrieve(ls_base)=0 then
								idw_detalle.insertrow(0)
							end if
							if idw_detalle5.retrieve(ll_cod_parque)=0 then
								idw_detalle5.insertrow(0)
							end if
							if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
								idw_detalle6.insertrow(0)
							end if
							if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
								idw_detalle8.insertrow(0)
							end if
							if idw_detalle9.retrieve(ls_sector,ls_sepultura)=0 then
								idw_detalle9.insertrow(0)
							end if
							ll_new			= tab_1.tabpage_3.dw_ficha_sepult.insertrow(0)
							tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_new)
							tab_1.tabpage_3.dw_ficha_sepult.setfocus()
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'c_estado_reg','S')
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'estado_reg','P')
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'fecha_sepultacion',ldt_fecha_sepult)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sector',ls_sector)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sepultura',ls_sepultura)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'cod_parque',ll_cod_parque)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'hora',ll_hora)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'minutos',ll_minutos)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'estado_responso','N')
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'correlativo_interno',tab_1.tabpage_3.dw_ficha_sepult.rowcount())
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'base',ls_base)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'serie',ls_serie)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'numero',ll_numero)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'fecha_contrato',ldt_fecha_ctto)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'cod_estado_contrato',ls_estado_ctto)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'numero_tecnico',ls_nro_tecnico)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'capacidad',ll_capacidad)
							idw_detalle7.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'estado_credito',ll_mora_cred)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'observacion_credito',ls_obs_credito)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'estado_mantencion',ll_mora_mant)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'observacion_mantencion',ls_obs_mantencion)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'fecha_recepcion',ldt_fecha_recep)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'hora_recepcion',ll_hora_recep)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',ll_minuto_recep)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'hora_llegada_efectiva',ll_hora_lleg_efec)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'minuto_llegada_efectiva',ll_minu_lleg_efec)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'vb_estadistico',ls_vd_estadistico)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_pase_sepultacion',1)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_condolencia',1)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'est_uso_firma_digital',1)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_dato_funeraria',1)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_titular_fall',1)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
							il_count_otro										= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
							tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_new)
							tab_1.tabpage_3.dw_ficha_sepult.setfocus()
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
							cb_volver.triggerevent(getfocus!)
						else
							tab_1.tabpage_2.dw_ant_titular.enabled		= true
							tab_1.tabpage_1.dw_ant_fall.enabled			= true
							tab_1.tabpage_4.dw_aranceles.enabled		= true
						end if
					end if
				end if
				if not isnull(ll_cod_parque) and not isnull(ls_sector) and not isnull(ls_sepultura) and not isnull(ldt_fecha_sepult) then
					SELECT 	  Count("FOSA_COMUN"."AREA")
					INTO 		  :ll_count_fosa  
					FROM 	  "FOSA_COMUN"  
					WHERE 	( "FOSA_COMUN"."COD_PARQUE" = :ll_cod_parque ) AND  
								( "FOSA_COMUN"."SECTOR" = :ls_sector ) AND  
								( "FOSA_COMUN"."SEPULTURA" = :ls_sepultura )   ;
					if ll_count_fosa > 0 then
						messagebox("Advertencia","No es posible Generar Ficha de Reducción de Fosa Común")
//						ls_string	= string(ll_cod_parque)+'~t'+ls_sector+'~t'+ls_sepultura
//						if isvalid(w_lista_fosa_comun_para_fs) then close(w_lista_fosa_comun_para_fs)
//						openwithparm(w_lista_fosa_comun_para_fs,ls_string)
					end if
				end if
			end if
		else
			messagebox("Advertencia","No Existe Reserva para Sector: "+ls_sector+"  Sepultura: "+ls_sepultura)
		end if
		tab_1.tabpage_2.dw_ant_titular.accepttext()
		tab_1.tabpage_1.dw_ant_fall.accepttext()
		tab_1.tabpage_4.dw_aranceles.accepttext()
	end if
	if ls_columna='cod_parque' then 
		if ll_cod_parque>0 then 
			if idw_detalle5.retrieve(ll_cod_parque)=0 then
				idw_detalle5.insertrow(0)
			end if
			SELECT	"FICHA_HORAS"."HORA_INICIO",   
						"FICHA_HORAS"."MINUTO_INICIO",   
						"FICHA_HORAS"."HORA_FINAL",   
						"FICHA_HORAS"."MINUTO_FINAL",   
						"FICHA_HORAS"."INTERVALO_MINUTO",   
						"FICHA_HORAS"."VECES_SEPULTACION"  
			INTO		:il_hora_ini,   
						:il_min_ini,   
						:il_hora_fin,   
						:il_min_fin,   
						:il_intervalo,   
						:il_veces  
			FROM 		"FICHA_HORAS"  
			WHERE 	"FICHA_HORAS"."COD_PARQUE" = :ll_cod_parque   ;
		end if
	end if
	if ls_columna='sector' then
		if ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' then 
			if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
				idw_detalle6.insertrow(0)
			end if
		end if
	end if	
end if
if ls_columna='sepultura' then
	is_modif	= 'S'
end if
if ls_columna='base' then
	ls_base	= this.getitemstring(this.getrow(),'base')
	if idw_detalle.retrieve(ls_base)=0 then
		idw_detalle.insertrow(0)
	end if
end if
if ls_columna='base' or ls_columna='serie' or ls_columna='numero' then
	wf_valida_contrato()
end if
if ls_columna='rut_diacono' or ls_columna='dv_diacono' then
	ll_rut				= this.getitemnumber(this.getrow(),'rut_diacono')
	if ll_rut>0 then
		SELECT	"DIACONOS"."DV_DIACONO"  
		INTO 		:ls_dv  
		FROM 		"DIACONOS"  
		WHERE 	"DIACONOS"."RUT_DIACONO" = :ll_rut   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			this.setitem(this.getrow(),'dv_diacono',ls_dv)
			this.accepttext()
		end if
	end if
end if
if ls_columna='capacidad' then
	ll_capacidad	= dw_ficha_sepult.getitemnumber(this.getrow(),'capacidad')
	ll_cod_parque	= dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque')
	
	ls_base			= dw_ficha_sepult.getitemstring(this.getrow(),'base')
	ls_serie			= dw_ficha_sepult.getitemstring(this.getrow(),'serie')
	ll_numero		= dw_ficha_sepult.getitemnumber(this.getrow(),'numero')
	SELECT	Count("LISTA_PRECIO"."SECTOR")  
	INTO 		:ll_count_cap  
	FROM 		"LISTA_PRECIO"  
	WHERE 	"LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad AND
				"LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque
	USING		sqlca;
	if ll_count_cap=0 then
		messagebox("Advertencia","Capacidad NO Registrada")
		dw_ficha_sepult.setitem(this.getrow(),'capacidad',ll_nulo)
	else
		if ls_base='O' then
			SELECT	"PAGO_OFERTA"."CAPACIDAD",	"PAGO_OFERTA"."NRO_TECNICO",	"OFERTA_V"."TIPO_CONS"
			INTO 		:ll_capacidad_ctto,			:ls_nro_tec_ctto,					:ls_tipo_cons
			FROM 		"CADENA",   "CADENA_MORA",	"CLIENTE",	"OFERTA_V",	"PAGO_OFERTA"  
			WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
					 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
					 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
					 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = :ls_base ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
		elseif ls_base='C' then
			SELECT	"CONTRATO"."CAPACIDAD",		"CONTRATO"."NRO_TEC",	'T'
			INTO 		:ll_capacidad_ctto,			:ll_nro_tec_ctto,			:ls_tipo_cons
			FROM 		"CADENA",	"CADENA_MORA",	"CLIENTE",	"CONTRATO"  
			WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
					 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					 (("CADENA"."CODIGO" = :ls_base ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
		end if
		if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
		if ll_capacidad_ctto > 0 and ll_capacidad > 0 and ll_capacidad_ctto <> ll_capacidad then
			
		end if		
	end if
	dw_ficha_sepult.setitem(this.getrow(),'nivel',ls_nulo)
	if idw_detalle7.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
		idw_detalle7.insertrow(0)
	end if
end if
this.accepttext()
if ls_columna='sw_pase_sepultacion' then
	ll_sw_pase_sepultacion	= long(data)
	ls_mensaje_prov			= 'PASE PROVISORIO'
	if ll_sw_pase_sepultacion=0 then
		ls_obs_pase				= trim(this.getitemstring(this.getrow(),'pase_sepultacion'))
		if not isnull(ls_obs_pase) then
			if mid(ls_obs_pase,1,15) <> 'PASE PROVISORIO' then
				this.setitem(this.getrow(),'pase_sepultacion','PASE PROVISORIO '+ls_obs_pase)
			end if
		else
			this.setitem(this.getrow(),'pase_sepultacion',ls_mensaje_prov)
		end if
	else
		ls_obs_pase				= trim(this.getitemstring(this.getrow(),'pase_sepultacion'))
		if not isnull(ls_obs_pase) then
			if len(ls_obs_pase) = len(ls_mensaje_prov) then
				this.setitem(this.getrow(),'pase_sepultacion','')
			else
				if mid(ls_obs_pase,1,15) = 'PASE PROVISORIO' then
					ls_obs_pase		= trim(mid(ls_obs_pase,16))
				end if
				this.setitem(this.getrow(),'pase_sepultacion',ls_obs_pase)
			end if
		end if
	end if
end if
if ls_columna='fecha_pase' then
	ld_fecha				= date(this.getitemdatetime(this.getrow(),'fecha_pase'))
	if not isnull(ld_fecha) then
		ll_anno				= year(ld_fecha)
		this.setitem(this.getrow(),'anno_pase',ll_anno)
	end if
	this.accepttext()
end if
if ls_columna='hora_llegada_efectiva' then
	ll_hora	= this.getitemnumber(this.getrow(),'hora_llegada_efectiva')
	if ll_hora>23 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'hora_llegada_efectiva',0)
	end if
end if
if ls_columna='minuto_llegada_efectiva' then
	ll_minutos	= this.getitemnumber(this.getrow(),'minuto_llegada_efectiva')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'minuto_llegada_efectiva',0)
	end if
end if
if ls_columna='hora' then
	ll_hora			= this.getitemnumber(this.getrow(),'hora')
	ll_cod_parque	= this.getitemnumber(this.getrow(),'cod_parque')
	SELECT	"FICHA_HORAS"."HORA_INICIO",   
				"FICHA_HORAS"."MINUTO_INICIO",   
				"FICHA_HORAS"."HORA_FINAL",   
				"FICHA_HORAS"."MINUTO_FINAL",   
				"FICHA_HORAS"."INTERVALO_MINUTO",   
				"FICHA_HORAS"."VECES_SEPULTACION"  
	INTO		:il_hora_ini,   
				:il_min_ini,   
				:il_hora_fin,   
				:il_min_fin,   
				:il_intervalo,   
				:il_veces  
	FROM 		"FICHA_HORAS"  
	WHERE 	"FICHA_HORAS"."COD_PARQUE" = :ll_cod_parque   ;
	if ll_hora>23 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'hora',0)
		this.accepttext()
	end if
end if
if ls_columna='minutos' then
	ll_minutos	= this.getitemnumber(this.getrow(),'minutos')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'minutos',0)
		this.accepttext()
	else
		if il_intervalo=30 then
			if ll_minutos<>0 and ll_minutos<>30 then
				messagebox("Advertencia","Horario Inválido, recuerde Reducción es cada "+string(il_intervalo,'##0')+ " minutos")
			end if
		elseif il_intervalo=15 then
			if ll_minutos<>0 and ll_minutos<>15 and ll_minutos<>30 and ll_minutos<>45 then
				messagebox("Advertencia","Horario Inválido, recuerde Reducción es cada "+string(il_intervalo,'##0')+ " minutos")
			end if
		elseif il_intervalo=60 then
			if ll_minutos<>0 then
				messagebox("Advertencia","Horario Inválido, recuerde Reducción es cada UNA hora")
			end if
		end if
	end if
end if
if ls_columna='hora' or ls_columna='minutos' then
	ll_hora_fijada	= this.getitemnumber(this.getrow(),'hora')
	ll_min_fijada	= this.getitemnumber(this.getrow(),'minutos')
	ldt_fec_tras	= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
	ll_parque_tras	= this.getitemnumber(this.getrow(),'cod_parque')
	if ll_hora_fijada>0 then
		if ll_hora_fijada<il_hora_ini or (ll_hora_fijada=il_hora_ini and ll_min_fijada<il_min_ini) then
			messagebox("Advertencia","No es Posible Ingresar Horario antes de las "+string(il_hora_ini,'00')+':'+string(il_min_ini,'00'))
		elseif ll_hora_fijada>il_hora_fin or (ll_hora_fijada=il_hora_fin and ll_min_fijada>il_min_fin) then
			messagebox("Advertencia","No es Posible Ingresar Horario despues de las "+string(il_hora_fin,'00')+':'+string(il_min_fin,'00'))
		end if
		tab_1.tabpage_3.dw_ficha_sepult.Setitem(this.getrow(),'hora_def',ll_hora_fijada)
		tab_1.tabpage_3.dw_ficha_sepult.Setitem(this.getrow(),'minuto_def',ll_min_fijada)
	end if
	SELECT	Count("FICHA_SEPULTACION"."CODIGO_EJECUTIVO")  
	INTO 		:ll_count_sep
	FROM 		"FICHA_SEPULTACION"  
	WHERE  ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fec_tras ) AND 
			 ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_parque_tras ) AND 
			 ( "FICHA_SEPULTACION"."HORA_DEF" = :ll_hora_fijada ) AND  
			 ( "FICHA_SEPULTACION"."MINUTO_DEF" = :ll_min_fijada )   
	USING		sqlca;
	SELECT 	Count("FICHA_TRASLADO"."CODIGO_EJECUTIVO")  
	INTO		:ll_count_tras
	FROM 		"FICHA_TRASLADO"  
	WHERE  ( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fec_tras ) AND  
			 ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_parque_tras ) AND 
			 ( "FICHA_TRASLADO"."HORA_DEF" = :ll_hora_fijada ) AND  
			 ( "FICHA_TRASLADO"."MINUTO_DEF" = :ll_min_fijada )   
	USING		sqlca;
	SELECT	Count("FICHA_REDUCCION"."CODIGO_EJECUTIVO")  
	INTO 		:ll_count_red
	FROM 		"FICHA_REDUCCION"  
	WHERE  ( "FICHA_REDUCCION"."FECHA_SEPULTACION" = :ldt_fec_tras ) AND 
			 ( "FICHA_REDUCCION"."COD_PARQUE" = :ll_parque_tras ) AND 
			 ( "FICHA_REDUCCION"."HORA_DEF" = :ll_hora_fijada ) AND  
			 ( "FICHA_REDUCCION"."MINUTO_DEF" = :ll_min_fijada )   
	USING		sqlca;
	if isnull(ll_count_sep) then ll_count_sep=0
	if isnull(ll_count_tras) then ll_count_tras=0
	if isnull(ll_count_red) then ll_count_red=0
	ll_count_suma	= ll_count_sep + ll_count_tras + ll_count_red
	if ll_count_suma>=il_veces then
		messagebox("Advertencia","No es posible Asignar Horario, sobrepasa lo Definido por Administración Parque")
	end if
end if
if ls_columna='hora_recepcion' then
	ll_hora	= this.getitemnumber(this.getrow(),'hora_recepcion')
	if ll_hora>23 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'hora_recepcion',0)
		this.accepttext()
	end if
end if
if ls_columna='minuto_recepcion' then
	ll_minutos	= this.getitemnumber(this.getrow(),'minuto_recepcion')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'minuto_recepcion',0)
		this.accepttext()
	end if
end if
this.accepttext()
end event

event clicked;String		ls_estado,ls_columna,ls_fecha,ls_sector,ls_sepultura,ls_base,ls_serie,ls_estado_ctto,ls_nro_tecnico,ls_obs_mantencion,ls_vd_estadistico,ls_obs_credito,ls_estado_reg,ls_dv_titular,ls_nombre_tit,ls_ap_pat_tit,&
			ls_ap_mat_tit,ls_tipo_via_tit,ls_direc_tit,ls_num_dir_tit,ls_dpto_dir_tit,ls_block_dir_tit,ls_pob_villa_tit,ls_sector_tit,ls_cod_ciud_tit,ls_cod_com_tit,ls_fono_titular,ls_cod_ejecutivo,ls_vb,&
			ls_nombre,ls_ap_pat,ls_ap_mat,ls_string,ls_ejecutivo,ls_obs,ls_ciu_tit,ls_pasa,ls_pasa1,ls_est_ctto,ls_sector_sepult,ls_nro_sepultura,ls_nom_titular,ls_ap_pat_titular,ls_ap_mat_titular,ls_cod_tipo_via,&
			ls_direccion_p,ls_nro_part,ls_depto_part,ls_block_part,ls_pob_part,ls_sector_part,ls_comuna_part,ls_ciudad_part,ls_fono_part,ls_cod_age_aux,ls_pasa_ctrol,ls_nro_tec_ctto,ls_tipo_cons,&
			ls_pasa_fosa='N'
Long 		ll_hora, ll_minutos,ll_cod_parque,ll_new,ll_resp,ll_mora_cred,ll_mora_mant,ll_count_fosa,ll_hora_recep,ll_minuto_recep,ll_hora_lleg_efec,ll_minu_lleg_efec,ll_rut_titular,ll_new_1,&
			ll_max,ll_anno,ll_hora_fijada,ll_minuto_fijado,ll_hora_hoy,ll_minutos_hoy,ll_count_reserva,ll_count_tiene,ll_count_fall,ll_capacidad,ll_parque_aux,ll_new_ins,ll_row,ll_nro_tec_ctto,ll_capacidad_ctto
Datetime	ldt_fecha_sepult,ldt_fecha_ctto,ldt_fecha_recep,ldt_fecha_hoy,ldt_nulo,ldt_fecha_ini,ldt_fecha_fin
Date		ld_fecha
Double	ll_numero

this.accepttext()
SetNull(ldt_nulo)
ll_row						= row
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
ls_columna					= dwo.name
ls_estado_reg				= this.getitemstring(this.getrow(),'c_estado_reg')
if (ls_estado_reg<>'G' and ls_estado_reg<>'A' ) or (isnull(ls_estado_reg) or ls_estado_reg='') then	//and ls_estado_reg<>'S'
	CHOOSE CASE ls_columna
		CASE 'p_1'
			ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
			ls_sector				= this.getitemstring(this.getrow(),'sector')
			ls_sepultura			= this.getitemstring(this.getrow(),'sepultura')
			ls_estado_reg		= this.getitemstring(this.getrow(),'c_estado_reg')
			
		//	if ( c_estado_reg ='S'   or estado_reg='G' or estado_reg='A'  or isnull( cod_parque ) or isnull( sector ) or isnull( sepultura ),1,0)
			
			if ((ls_estado_reg<>'C' and ls_estado_reg<>'A') or (isnull(ls_estado_reg) or ls_estado_reg='')) and not isnull(ll_cod_parque) and &
				ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and not isnull(ls_sepultura) and ls_sepultura<>'' then	//ls_estado_reg<>'S' and 
				ls_fecha			= string(date(dw_ficha_sepult.getitemdatetime(dw_ficha_sepult.getrow(),'fecha_sepultacion')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_sepultacion',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha			= trim(Message.StringParm)
					dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_sepultacion',date(ls_fecha))
				END IF
				ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
				ls_sector				= this.getitemstring(this.getrow(),'sector')
				ls_sepultura			= this.getitemstring(this.getrow(),'sepultura')
				ldt_fecha_sepult	= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
				if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and &
					not isnull(ls_sepultura) and ls_sepultura<>'' and not isnull(ldt_fecha_sepult) then
					ldt_fecha_ini	= datetime(RelativeDate(date(gdt_fec_sistema),  - 30))
					ldt_fecha_fin	= datetime(RelativeDate(date(gdt_fec_sistema),  60))
					if ldt_fecha_sepult <= ldt_fecha_fin and ldt_fecha_sepult >= ldt_fecha_ini then
						SELECT	Count("INVENTARIO_PLANI"."BASE")
						INTO 		:ll_count_reserva
						FROM 		"INVENTARIO_PLANI"  
						WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque ) AND  
								 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
								 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) AND  
								 ( "INVENTARIO_PLANI"."NUMERO" > 0 )   
						USING		sqlca;
						if ll_count_reserva>0 then
							ls_pasa	= 'S'
//						else
//							SELECT	Count("RESERVA_SEPULTURA"."FOLIO_RESERVA")  
//							INTO 		:ll_count_tiene  
//							FROM 		"RESERVA_SEPULTURA"  
//							WHERE  ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) AND  
//									 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
//									 ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
//									 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura )   
//							USING		sqlca;
//							if ll_count_tiene>0 then
//								ls_pasa1	= 'S'
//							else
//								ls_pasa1	= 'N'
//							end if
						end if
						if ls_pasa='S' or ls_pasa1='S' then
							SELECT	"INVENTARIO_PLANI"."BASE",   
										"INVENTARIO_PLANI"."SERIE",   
										"INVENTARIO_PLANI"."NUMERO",
										"INVENTARIO_PLANI"."NUMERO_TEC",
										"INVENTARIO_PLANI"."CAPACIDAD"
							INTO 		:ls_base,   
										:ls_serie,   
										:ll_numero,
										:is_nro_tecnico,
										:il_capacidad
							FROM 		"INVENTARIO_PLANI"  
							WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque ) AND  
									 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
									 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) 
							USING		sqlca;
//							if ls_pasa1='S' then
//								SELECT	"RESERVA_SEPULTURA"."BASE",	"RESERVA_SEPULTURA"."SERIE",	"RESERVA_SEPULTURA"."NUMERO",	"RESERVA_SEPULTURA"."CAPACIDAD"  
//								INTO 		:ls_base,							:ls_serie,							:ll_numero,							:il_capacidad  
//								FROM 		"RESERVA_SEPULTURA"  
//								WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
//										 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
//										 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND  
//										 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) AND  
//										 ( "RESERVA_SEPULTURA"."FOLIO_RESERVA" = ( 	SELECT MAX("RESERVA_SEPULTURA"."FOLIO_RESERVA") 
//																									FROM 		"RESERVA_SEPULTURA" 
//																									WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND 
//																											 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
//																											 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND 
//																											 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) ) )   
//								USING		sqlca;
//							end if
							if sqlca.sqlcode=0 then
								if ls_base='O' then
									if ll_numero=10000000 then
										ls_pasa_ctrol	= 'S'
									else
										SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
										INTO 		:ll_parque_aux,				:ls_cod_age_aux  
										FROM 		"CD_FOLIO"  
										WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
												 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
										USING		Trans_2;
										if Trans_2.sqlcode=0 then
											ls_pasa_ctrol		= 'S'
										else
											if (ll_numero <= 84000 and gs_conexion	= "Parque El Prado") or &
												(ll_numero <= 15884 and gs_conexion	= "Parque La Foresta") then
												ls_pasa_ctrol	= 'S'
											else
												ls_pasa_ctrol	= 'N'
											end if
										end if
									end if
								else
									ls_pasa_ctrol			= 'S'
								end if
								if ls_pasa_ctrol='S' then
									SELECT	"CADENA"."ESTADO"  
									INTO		:ls_est_ctto  
									FROM 		"CADENA"  
									WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
											 ( "CADENA"."SERIE" = :ls_serie ) AND  
											 ( "CADENA"."NUMERO" = :ll_numero )   
									USING		sqlca;
									if ls_est_ctto='V' or ls_est_ctto='C' or ls_est_ctto='R' or ls_est_ctto='S' or sqlca.sqlcode=100 then
										SELECT	COUNT("FALLECIDOS"."LLAVE")  
										INTO 		:ll_count_fall  
										FROM 		"FALLECIDOS"  
										WHERE  ( "FALLECIDOS"."BASE" = :ls_base ) AND  
												 ( "FALLECIDOS"."SS" = :ls_serie ) AND  
												 ( "FALLECIDOS"."CONTRATO" = :ll_numero ) AND
 												 ( "FALLECIDOS"."EST" = 'CC' )  AND
					 							 ( "FALLECIDOS"."ESTADO_REG" = 'A' ) ;
										if isnull(ll_count_fall) then ll_count_fall=0

										if ls_base='O' then
											SELECT	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR", 	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION", 	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"OFERTA_V"."FECHA",	"PAGO_OFERTA"."CAPACIDAD",	"PAGO_OFERTA"."NRO_TECNICO",	"OFERTA_V"."TIPO_CONS"
											INTO 		:ls_sector_sepult,		:ls_nro_sepultura,			:ll_cod_parque,			:ls_estado_ctto,		:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,						:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part,			:ldt_fecha_ctto,		:ll_capacidad_ctto,			:ls_nro_tec_ctto,					:ls_tipo_cons
											FROM 		"CADENA",   "CADENA_MORA",	"CLIENTE",	"OFERTA_V",	"PAGO_OFERTA"  
											WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
													 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
													 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
													 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
													 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
													 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
													 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
													 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
													 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
													 (("CADENA"."CODIGO" = 'O' ) AND  
													 ( "CADENA"."SERIE" = :ls_serie ) AND  
													 ( "CADENA"."NUMERO" = :ll_numero ) )   
											USING		sqlca;
											if not isnull(ll_capacidad_ctto) and ll_capacidad_ctto>0 then il_capacidad = ll_capacidad_ctto
											if not isnull(ls_nro_tec_ctto) and ls_nro_tec_ctto<>'' and ls_nro_tec_ctto<>'-' then is_nro_tecnico = ls_nro_tec_ctto
										elseif ls_base='C' then
											SELECT	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."FECHA",	"CONTRATO"."CAPACIDAD",	"CONTRATO"."NRO_TEC",	'T' 
											INTO 		:ls_estado_ctto,		:ll_cod_parque,			:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part  ,		:ls_sector_sepult,	:ls_nro_sepultura,		:ldt_fecha_ctto,		:ll_capacidad_ctto,		:ll_nro_tec_ctto,			:ls_tipo_cons
											FROM 		"CADENA",	"CADENA_MORA",	"CLIENTE",	"CONTRATO"  
											WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
													 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
													 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
													 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
													 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
													 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
													 (("CADENA"."CODIGO" = 'C' ) AND  
													 ( "CADENA"."SERIE" = :ls_serie ) AND  
													 ( "CADENA"."NUMERO" = :ll_numero ) )   
											USING		sqlca;
											if not isnull(ll_capacidad_ctto) and ll_capacidad_ctto>0 then il_capacidad = ll_capacidad_ctto
											if not isnull(ll_nro_tec_ctto) and ll_nro_tec_ctto>0 then is_nro_tecnico = String(ll_nro_tec_ctto)
										end if
										if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
										if isnull(ls_estado_ctto) or ls_estado_ctto='' then ls_estado_ctto='E'
									end if
								end if
							end if
						end if
						
						if dw_ficha_sepult.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)=0 then
							idw_detalle4.reset()
							if gs_conexion	= "Parque El Prado" then
								idw_detalle4.retrieve(1,'FS')
							elseif gs_conexion = "Parque La Foresta" then
								idw_detalle4.retrieve(11,'FS')
							end if
							idw_detalle7.reset()
							idw_detalle7.insertrow(0)
							idw_detalle.reset()
							idw_detalle.insertrow(0)
							if idw_detalle5.retrieve(ll_cod_parque)=0 then
								idw_detalle5.insertrow(0)
							end if
							if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
								idw_detalle6.insertrow(0)
							end if
							if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
								idw_detalle8.insertrow(0)
							end if
							
							idw_detalle2.reset()
							idw_detalle2.insertrow(0)
							if idw_detalle9.retrieve(ls_sector,ls_sepultura)=0 then
								idw_detalle9.insertrow(0)
							end if

							idw_detalle3.reset()
							idw_detalle3.insertrow(0)
							if idw_detalle4.retrieve(ll_cod_parque,'FS')=0 then
								idw_detalle4.insertrow(0)
							end if
							ll_new_ins	= tab_1.tabpage_1.dw_ant_fall.insertrow(0)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'usar_capilla','N')
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_alto_impacto',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_titular_fall',1)
							tab_1.tabpage_1.dw_ant_fall.accepttext()
							tab_1.tabpage_2.dw_ant_titular.insertrow(0)
							ll_new	= dw_ficha_sepult.insertrow(0)
							dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
							dw_ficha_sepult.setitem(ll_new,'cod_parque',ll_cod_parque)
							dw_ficha_sepult.setitem(ll_new,'sector',ls_sector)
							dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
							dw_ficha_sepult.setitem(ll_new,'sepultura',ls_sepultura)
							dw_ficha_sepult.setitem(ll_new,'fecha_sepultacion',ldt_fecha_sepult)
							dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
							
							if isnull(ls_nom_titular) then ls_nom_titular=''
							if isnull(ls_ap_pat_titular) then ls_ap_pat_titular=''
							if isnull(ls_ap_mat_titular) then ls_ap_mat_titular=''
							if ll_numero = 90000000 then
								messagebox("Advertencia","No es posible Generar Ficha de Reducción en Fosa Común")
								ll_resp			= 2
								ls_pasa_fosa	= 'S'
							else
								ll_resp			= messagebox("Advertencia","Para Titular " +string(ll_rut_titular,'###,###,###,###,###')+'-'+ls_dv_titular+' '+ls_nom_titular+' '+ls_ap_pat_titular+' '+ls_ap_mat_titular+" No Existe Ficha de Sepultación, desea Ingresarla",Exclamation!,YesNo!,2)
							end if
							if ll_resp=1 then
								dw_ficha_sepult.accepttext()
								dw_ficha_sepult.setitem(ll_new,'c_estado_reg','S')
								dw_ficha_sepult.setitem(ll_new,'sw_condolencia',1)
								dw_ficha_sepult.setitem(ll_new,'est_uso_firma_digital',1)
								dw_ficha_sepult.setitem(ll_new,'sw_dato_funeraria',1)
								dw_ficha_sepult.setitem(ll_new,'sw_pase_sepultacion',1)
								dw_ficha_sepult.setitem(ll_new,'sw_titular_fall',1)
								dw_ficha_sepult.setitem(ll_new,'estado_reg','P')
								dw_ficha_sepult.setitem(ll_new,'correlativo_interno',1)
								dw_ficha_sepult.setitem(ll_new,'estado_responso','N')
								SELECT sysdate INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
								ldt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
								ll_hora_hoy					= long(string(gdt_fec_sistema,'hh'))
								ll_minutos_hoy				= long(string(gdt_fec_sistema,'mm'))
								dw_ficha_sepult.setitem(ll_new,'fecha_recepcion',ldt_fecha_hoy)
								dw_ficha_sepult.setitem(ll_new,'hora_recepcion',ll_hora_hoy)
								dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',ll_minutos_hoy)
								dw_ficha_sepult.setitem(ll_new,'base',ls_base)
								dw_ficha_sepult.setitem(ll_new,'serie',ls_serie)
								dw_ficha_sepult.setitem(ll_new,'numero',ll_numero)
								dw_ficha_sepult.setitem(ll_new,'capacidad',il_capacidad)
								if idw_detalle7.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
									idw_detalle7.insertrow(0)
								end if
								
								dw_ficha_sepult.setitem(ll_new,'estado_credito',ll_mora_cred)
								dw_ficha_sepult.setitem(ll_new,'estado_mantencion',ll_mora_mant)
								dw_ficha_sepult.setitem(ll_new,'numero_tecnico',is_nro_tecnico)//ls_nro_tecnico)
								dw_ficha_sepult.setitem(ll_new,'cod_estado_contrato',ls_estado_ctto)
								dw_ficha_sepult.setitem(ll_new,'cantidad_sepultados',ll_count_fall)
								dw_ficha_sepult.setitem(ll_new,'capacidad_libre_sepultura',il_capacidad - ll_count_fall)
								dw_ficha_sepult.accepttext()
								if (il_capacidad - ll_count_fall)=0 then
									dw_ficha_sepult.setitem(ll_new,'estado_sepultura_completa','S')
								else
									dw_ficha_sepult.setitem(ll_new,'estado_sepultura_completa','N')
								end if
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'rut_titular',ll_rut_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'dv_titular',ls_dv_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'nombre_titular',ls_nom_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_paterno_titular',ls_ap_pat_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_materno_titular',ls_ap_mat_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'tipo_via_titular',ls_cod_tipo_via)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'direccion_titular',ls_direccion_p)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'num_direccion_titular',ls_nro_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'depto_direccion_titular',ls_depto_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'block_direccion_titular',ls_block_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'poblacion_villa_titular',ls_pob_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'sector_titular',ls_sector_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_ciudad_titular',ls_ciudad_part)
								if idw_detalle3.retrieve(ls_ciudad_part)=0 then
									idw_detalle3.insertrow(0)
								end if
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_comuna_titular',ls_comuna_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'fono_titular',ls_fono_part)
								dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato',ldt_fecha_ctto)
								
								tab_1.tabpage_2.dw_ant_titular.enabled		= true
								tab_1.tabpage_1.dw_ant_fall.enabled			= true
								tab_1.tabpage_4.dw_aranceles.enabled		= true
								dw_ficha_sepult.setfocus()
								dw_ficha_sepult.setcolumn('hora')
							else
								dw_ficha_sepult.reset()
								tab_1.tabpage_2.dw_ant_titular.reset()
								tab_1.tabpage_1.dw_ant_fall.reset()
								tab_1.tabpage_4.dw_aranceles.reset()
								idw_detalle.reset()
								idw_detalle.insertrow(0)
								idw_detalle2.reset()
								idw_detalle2.insertrow(0)
								idw_detalle9.reset()
								idw_detalle9.insertrow(0)
								idw_detalle3.reset()
								idw_detalle3.insertrow(0)
								idw_detalle5.reset()
								idw_detalle5.insertrow(0)
								idw_detalle6.reset()
								idw_detalle6.insertrow(0)
								idw_detalle7.reset()
								idw_detalle7.insertrow(0)
								idw_detalle8.reset()
								idw_detalle8.insertrow(0)
								idw_detalle4.reset()
								idw_detalle4.insertrow(0)
								ll_new												= dw_ficha_sepult.insertrow(0)
								dw_ficha_sepult.setitem(ll_new,'c_estado_reg','N')
								dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
								dw_ficha_sepult.setitem(ll_new,'sw_pase_sepultacion',1)
								dw_ficha_sepult.setitem(ll_new,'sw_titular_fall',1)
								dw_ficha_sepult.scrolltorow(dw_ficha_sepult.rowcount())
								dw_ficha_sepult.setfocus()
								dw_ficha_sepult.setcolumn('cod_parque')
								tab_1.tabpage_2.dw_ant_titular.InsertRow(0)
								ll_new_ins	= tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_titular_fall',1)
								tab_1.tabpage_1.dw_ant_fall.accepttext()
								tab_1.tabpage_4.dw_aranceles.InsertRow(0)
								tab_1.tabpage_2.dw_ant_titular.enabled		= false
								tab_1.tabpage_1.dw_ant_fall.enabled			= false
								tab_1.tabpage_4.dw_aranceles.enabled		= false
							end if
						else
							if tab_1.tabpage_2.dw_ant_titular.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)>0 then
								ls_ciu_tit	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')
								if idw_detalle3.retrieve(ls_ciu_tit)=0 then
									idw_detalle3.insertrow(0)
								end if
							end if
							tab_1.tabpage_1.dw_ant_fall.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
							tab_1.tabpage_4.dw_aranceles.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
							
							if isnull(ls_nom_titular) then ls_nom_titular=''
							if isnull(ls_ap_pat_titular) then ls_ap_pat_titular=''
							if isnull(ls_ap_mat_titular) then ls_ap_mat_titular=''
							
							ll_resp		= messagebox("Advertencia","Para Titular " +string(ll_rut_titular,'###,###,###,###,###')+'-'+ls_dv_titular+' '+ls_nom_titular+' '+ls_ap_pat_titular+' '+ls_ap_mat_titular+ ", desea Crear OTRA Ficha de Sepultación",Exclamation!,YesNo!,2)
							if ll_resp=1 then
								dw_ficha_sepult.accepttext()
								ls_cod_ejecutivo  	= dw_ficha_sepult.getitemstring(1,'codigo_ejecutivo')
								ll_cod_parque		= dw_ficha_sepult.getitemnumber(1,'cod_parque')
								ls_sector				= dw_ficha_sepult.getitemstring(1,'sector')
								ls_sepultura			= dw_ficha_sepult.getitemstring(1,'sepultura')
								ldt_fecha_sepult	= dw_ficha_sepult.getitemdatetime(1,'fecha_sepultacion')
								ls_base           		= dw_ficha_sepult.getitemstring(1,'base')
								ls_serie				= dw_ficha_sepult.getitemstring(1,'serie')
								ll_numero         	= dw_ficha_sepult.getitemnumber(1,'numero')
								ldt_fecha_ctto		= dw_ficha_sepult.getitemDateTime(1,'fecha_contrato')
								ls_estado_ctto 		= dw_ficha_sepult.getitemstring(1,'cod_estado_contrato')
								ls_nro_tecnico    	= dw_ficha_sepult.getitemstring(1,'numero_tecnico')
								ll_capacidad  		= dw_ficha_sepult.getitemnumber(1,'capacidad')
								ll_mora_cred		= dw_ficha_sepult.getitemnumber(1,'estado_credito')
								ls_obs_credito		= dw_ficha_sepult.getitemstring(1,'observacion_credito')
								ll_mora_mant      	= dw_ficha_sepult.getitemnumber(1,'estado_mantencion')
								ls_obs_mantencion = dw_ficha_sepult.getitemstring(1,'observacion_mantencion')
								ldt_fecha_recep	= dw_ficha_sepult.getitemdatetime(1,'fecha_recepcion')
								ll_hora_recep		= dw_ficha_sepult.getitemnumber(1,'hora_recepcion')
								ll_minuto_recep	= dw_ficha_sepult.getitemnumber(1,'minuto_recepcion')
								ll_hora_lleg_efec	= dw_ficha_sepult.getitemnumber(1,'hora_llegada_efectiva')
								ll_minu_lleg_efec	= dw_ficha_sepult.getitemnumber(1,'minuto_llegada_efectiva')
								ls_vd_estadistico	= dw_ficha_sepult.getitemstring(1,'vb_estadistico')
								if idw_detalle.retrieve(ls_base)=0 then
									idw_detalle.insertrow(0)
								end if
								if idw_detalle7.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
									idw_detalle7.insertrow(0)
								end if
								if idw_detalle5.retrieve(ll_cod_parque)=0 then
									idw_detalle5.insertrow(0)
								end if
								if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
									idw_detalle6.insertrow(0)
								end if
								if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
									idw_detalle8.insertrow(0)
								end if
								if idw_detalle9.retrieve(ls_sector,ls_sepultura)=0 then
									idw_detalle9.insertrow(0)
								end if
								ll_new	= dw_ficha_sepult.insertrow(0)
								dw_ficha_sepult.scrolltorow(dw_ficha_sepult.rowcount())
								dw_ficha_sepult.setitem(ll_new,'sw_pase_sepultacion',1)
								dw_ficha_sepult.setitem(ll_new,'sw_condolencia',1)
								dw_ficha_sepult.setitem(ll_new,'est_uso_firma_digital',1)
								dw_ficha_sepult.setitem(ll_new,'sw_dato_funeraria',1)
								dw_ficha_sepult.setitem(ll_new,'sw_titular_fall',1)
								dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
								dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
								dw_ficha_sepult.setitem(ll_new,'c_estado_reg','S')
								dw_ficha_sepult.setitem(ll_new,'estado_reg','P')
								dw_ficha_sepult.setitem(ll_new,'fecha_sepultacion',ldt_fecha_sepult)
								dw_ficha_sepult.setitem(ll_new,'sector',ls_sector)
								dw_ficha_sepult.setitem(ll_new,'sepultura',ls_sepultura)
								dw_ficha_sepult.setitem(ll_new,'cod_parque',ll_cod_parque)
								dw_ficha_sepult.setitem(ll_new,'estado_responso','N')
								dw_ficha_sepult.setitem(ll_new,'correlativo_interno',dw_ficha_sepult.rowcount())
								dw_ficha_sepult.setitem(ll_new,'base',ls_base)
								dw_ficha_sepult.setitem(ll_new,'serie',ls_serie)
								dw_ficha_sepult.setitem(ll_new,'numero',ll_numero)
								dw_ficha_sepult.setitem(ll_new,'fecha_contrato',ldt_fecha_ctto)
								dw_ficha_sepult.setitem(ll_new,'cod_estado_contrato',ls_estado_ctto)
								dw_ficha_sepult.setitem(ll_new,'numero_tecnico',ls_nro_tecnico)
								dw_ficha_sepult.setitem(ll_new,'capacidad',ll_capacidad)
								dw_ficha_sepult.setitem(ll_new,'estado_credito',ll_mora_cred)
								dw_ficha_sepult.setitem(ll_new,'observacion_credito',ls_obs_credito)
								dw_ficha_sepult.setitem(ll_new,'estado_mantencion',ll_mora_mant)
								dw_ficha_sepult.setitem(ll_new,'observacion_mantencion',ls_obs_mantencion)
								dw_ficha_sepult.setitem(ll_new,'fecha_recepcion',ldt_fecha_recep)
								dw_ficha_sepult.setitem(ll_new,'hora_recepcion',ll_hora_recep)
								dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',ll_minuto_recep)
								dw_ficha_sepult.setitem(ll_new,'hora_llegada_efectiva',ll_hora_lleg_efec)
								dw_ficha_sepult.setitem(ll_new,'minuto_llegada_efectiva',ll_minu_lleg_efec)
								dw_ficha_sepult.setitem(ll_new,'vb_estadistico',ls_vd_estadistico)
								idw_detalle2.reset()
								idw_detalle2.insertrow(0)
								idw_detalle9.reset()
								idw_detalle9.insertrow(0)
								ll_new_ins		= tab_1.tabpage_1.dw_ant_fall.insertrow(0)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_titular_fall',1)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'usar_capilla','N')
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_alto_impacto',1)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'correlativo_interno',tab_1.tabpage_1.dw_ant_fall.rowcount())
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'fecha_sepultacion',ldt_fecha_sepult)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sector',ls_sector)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sepultura',ls_sepultura)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'cod_parque',ll_cod_parque)
								tab_1.tabpage_1.dw_ant_fall.scrolltorow(tab_1.tabpage_1.dw_ant_fall.rowcount())
								if idw_detalle4.retrieve(ll_cod_parque,'FS')=0 then
									idw_detalle4.insertrow(0)
								end if
								tab_1.tabpage_1.dw_ant_fall.accepttext()
								tab_1.tabpage_4.dw_aranceles.insertrow(0)
								tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'correlativo_interno',tab_1.tabpage_4.dw_aranceles.rowcount())
								tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'fecha_sepultacion',ldt_fecha_sepult)
								tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sector',ls_sector)
								tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sepultura',ls_sepultura)
								tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'cod_parque',ll_cod_parque)
								tab_1.tabpage_4.dw_aranceles.scrolltorow(tab_1.tabpage_4.dw_aranceles.rowcount())
								tab_1.tabpage_2.dw_ant_titular.enabled		= true
								tab_1.tabpage_1.dw_ant_fall.enabled			= true
								tab_1.tabpage_4.dw_aranceles.enabled		= true
								dw_ficha_sepult.accepttext()

								tab_1.tabpage_2.dw_ant_titular.accepttext()
								ll_rut_titular			= tab_1.tabpage_2.dw_ant_titular.getitemnumber(1,'rut_titular')
								ls_dv_titular			= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'dv_titular')
								ls_nombre_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'nombre_titular')
								ls_ap_pat_tit  		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_paterno_titular')
								ls_ap_mat_tit     	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_materno_titular')
								ls_tipo_via_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'tipo_via_titular')
								ls_direc_tit      		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'direccion_titular')
								ls_num_dir_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'num_direccion_titular')
								ls_dpto_dir_tit 		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'depto_direccion_titular')
								ls_block_dir_tit  	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'block_direccion_titular')
								ls_pob_villa_tit  	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'poblacion_villa_titular')
								ls_sector_tit			= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'sector_titular')
								ls_cod_ciud_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')
								ls_cod_com_tit    	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_comuna_titular')
								ls_fono_titular   	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'fono_titular')
								if idw_detalle3.retrieve(ls_cod_ciud_tit)=0 then
									idw_detalle3.insertrow(0)
								end if
								ll_new_1				= tab_1.tabpage_2.dw_ant_titular.insertrow(0)
								tab_1.tabpage_2.dw_ant_titular.scrolltorow(tab_1.tabpage_2.dw_ant_titular.rowcount())
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'correlativo_interno',tab_1.tabpage_2.dw_ant_titular.rowcount())
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'rut_titular',ll_rut_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'dv_titular',ls_dv_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'nombre_titular',ls_nombre_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'ap_paterno_titular',ls_ap_pat_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'ap_materno_titular',ls_ap_mat_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'tipo_via_titular',ls_tipo_via_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'direccion_titular',ls_direc_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'num_direccion_titular',ls_num_dir_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'depto_direccion_titular',ls_dpto_dir_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'block_direccion_titular',ls_block_dir_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'poblacion_villa_titular',ls_pob_villa_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'sector_titular',ls_sector_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'codigo_ciudad_titular',ls_cod_ciud_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'codigo_comuna_titular',ls_cod_com_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'fono_titular',ls_fono_titular)
								il_count_otro										= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
								tab_1.tabpage_2.dw_ant_titular.scrolltorow(tab_1.tabpage_2.dw_ant_titular.rowcount())
								tab_1.tabpage_1.dw_ant_fall.scrolltorow(tab_1.tabpage_1.dw_ant_fall.rowcount())
								tab_1.tabpage_4.dw_aranceles.scrolltorow(tab_1.tabpage_4.dw_aranceles.rowcount())
								tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
								tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
								tab_1.tabpage_3.dw_ficha_sepult.setfocus()
							else
								tab_1.tabpage_2.dw_ant_titular.enabled		= false
								tab_1.tabpage_1.dw_ant_fall.enabled			= false
								tab_1.tabpage_4.dw_aranceles.enabled		= false
							end if
						end if
						
					else
						messagebox("Advertencia","Fecha Reducción Inválida, No debe ser Mayor al "+string(ldt_fecha_fin,'dd/mm/yyyy')+" ni Menor al "+string(ldt_fecha_ini,'dd/mm/yyyy'))
						this.setitem(this.getrow(),'fecha_sepultacion',ldt_nulo)
						this.accepttext()
						this.setcolumn('fecha_sepultacion')
					end if
				end if
				if ls_columna='cod_parque' then 
					if ll_cod_parque>0 then 
						if idw_detalle5.retrieve(ll_cod_parque)=0 then
							idw_detalle5.insertrow(0)
						end if
					end if
				end if
				if ls_columna='sector' then
					if ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' then 
						if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
							idw_detalle6.insertrow(0)
						end if
					end if
				end if	
				tab_1.tabpage_2.dw_ant_titular.accepttext()
				tab_1.tabpage_1.dw_ant_fall.accepttext()
				tab_1.tabpage_4.dw_aranceles.accepttext()
				
				if not isnull(ll_cod_parque) and not isnull(ls_sector) and not isnull(ls_sepultura) and not isnull(ldt_fecha_sepult) then
					SELECT 	  Count("FOSA_COMUN"."AREA")
					INTO 		  :ll_count_fosa  
					FROM 	  "FOSA_COMUN"  
					WHERE 	( "FOSA_COMUN"."COD_PARQUE" = :ll_cod_parque ) AND  
								( "FOSA_COMUN"."SECTOR" = :ls_sector ) AND  
								( "FOSA_COMUN"."SEPULTURA" = :ls_sepultura )   ;
					if ll_count_fosa > 0 and ls_pasa_fosa='N' then
						messagebox("Advertencia","No es posible Generar Ficha de Reducción en Fosa Común")
//						ls_string	= string(ll_cod_parque)+'~t'+ls_sector+'~t'+ls_sepultura
//						if isvalid(w_lista_fosa_comun_para_fs) then close(w_lista_fosa_comun_para_fs)
//						openwithparm(w_lista_fosa_comun_para_fs,ls_string)
					end if
				end if
				
			end if
	
		CASE 'p_2'
			ls_base           		= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'base')
			ls_serie				= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'serie')
			ll_numero         	= dw_ficha_sepult.getitemnumber(dw_ficha_sepult.getrow(),'numero')
			if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 then
				ls_fecha			= string(date(dw_ficha_sepult.getitemdatetime(dw_ficha_sepult.getrow(),'fecha_contrato')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato',date(ls_fecha))
				END IF
			end if
	
		CASE 'p_3'
			if is_usuario_esta='S' then
				ls_fecha	= string(date(dw_ficha_sepult.getitemdatetime(dw_ficha_sepult.getrow(),'fecha_recepcion')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_recepcion',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_recepcion',date(ls_fecha))
				End if
			end if
	
		CASE 'p_4'
			ls_fecha	= string(date(dw_ficha_sepult.getitemdatetime(dw_ficha_sepult.getrow(),'fecha_pase')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_pase',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_pase',date(ls_fecha))
			End if
			ld_fecha				= date(this.getitemdatetime(this.getrow(),'fecha_pase'))
			if not isnull(ld_fecha) then
				ll_anno				= year(ld_fecha)
				this.setitem(this.getrow(),'anno_pase',ll_anno)
			end if
			this.accepttext()
	
		CASE 'p_5'
			ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
			SELECT	"FICHA_HORAS"."HORA_INICIO",   
						"FICHA_HORAS"."MINUTO_INICIO",   
						"FICHA_HORAS"."HORA_FINAL",   
						"FICHA_HORAS"."MINUTO_FINAL",   
						"FICHA_HORAS"."INTERVALO_MINUTO",   
						"FICHA_HORAS"."VECES_SEPULTACION"  
			INTO		:il_hora_ini,   
						:il_min_ini,   
						:il_hora_fin,   
						:il_min_fin,   
						:il_intervalo,   
						:il_veces  
			FROM 	"FICHA_HORAS"  
			WHERE 	"FICHA_HORAS"."COD_PARQUE" = :ll_cod_parque   ;
			ls_sector				= trim(this.getitemstring(this.getrow(),'sector'))
			ls_sepultura			= trim(this.getitemstring(this.getrow(),'sepultura'))
			ldt_fecha_sepult	= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
			ls_ejecutivo			= this.getitemString(this.getrow(),'codigo_ejecutivo')
			ls_obs				= this.getitemString(this.getrow(),'observacion_sepultura_completa')
			ll_hora_fijada		= this.getitemNumber(this.getrow(),'hora')
			ls_base				= trim(this.getitemstring(this.getrow(),'base'))
			ls_serie				= trim(this.getitemstring(this.getrow(),'serie'))
			ll_numero			= this.getitemNumber(this.getrow(),'numero')
			if isnull( ldt_fecha_sepult ) or  ls_sector ='' or isnull( ls_sector ) or &
				isnull( ls_sepultura ) or  ls_sepultura ='' or  ll_cod_parque =0 or isnull( ll_cod_parque ) then
			else
				ll_minuto_fijado	= this.getitemNumber(this.getrow(),'minutos')
				ls_nombre		= trim(tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'nombre_fallecido'))
				ls_ap_pat		= trim(tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'ap_paterno_fall'))
				ls_ap_mat		= trim(tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'ap_materno_fall'))
				if isnull(ll_cod_parque) or isnull(ls_sector) or isnull(ls_sepultura) or &
					isnull(ldt_fecha_sepult) or isnull(ls_ejecutivo) or isnull(ls_obs) then
					
					if isnull(ll_cod_parque) then
						messagebox("Advertencia","Debe Seleccionar Parque")
						this.setcolumn('cod_parque')
					elseif isnull(ls_sector) then
						messagebox("Advertencia","Debe Seleccionar Sector")
						this.setcolumn('sector')
					elseif isnull(ls_sepultura) then
						messagebox("Advertencia","Debe Seleccionar Sepultura")
						this.setcolumn('sepultura')
					elseif isnull(ldt_fecha_sepult) then
						messagebox("Advertencia","Debe Seleccionar Fecha Reducción")
						this.setcolumn('fecha_sepultacion')
					elseif isnull(ls_ejecutivo) then
						messagebox("Advertencia","Debe Seleccionar Ejecutivo")
						this.setcolumn('codigo_ejecutivo')
					elseif isnull(ls_obs) then
						messagebox("Advertencia","Debe Ingresar Observación")
						this.setcolumn('observacion_sepultura_completa')
					end if
				else
					if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) then
						ls_string	= string(ll_cod_parque)+'~t'+ls_sector+'~t'+ls_sepultura+'~t'+string(ldt_fecha_sepult)+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+ls_ejecutivo+'~t'+ls_obs+'~t'+string(ll_hora_fijada)+'~t'+string(ll_minuto_fijado)+'~t'+'FR'+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+'F'
						if isvalid(w_lista_funerales) then close(w_lista_funerales)
						OpenWithParm(w_lista_funerales, ls_string)
					else
						messagebox("Advertencia","Debe Ingresar Antecedente Fallecido")
						tab_1.SelectedTab	= 3
					end if
				end if
			end if

	END CHOOSE
 end if
end event

event itemfocuschanged;String		ls_columna,ls_base,ls_serie,ls_nivel,ls_var_nivel,ls_var_cap,ls_var_final,ls_nivel_aux,ls_dv,ls_sector,ls_sepultura,ls_nulo,ls_cod_age_aux,ls_existe_ctto,&
			ls_pasa,ls_pasa1,ls_est_ctto,ls_estado_resp,ls_modif_adm,ls_pasa_ctrol,ls_base_aux,ls_serie_aux,ls_nro_tecnico
Long		ll_hora,ll_capacidad,ll_pos,ll_rut,ll_hora_fijada,ll_min_fijada,ll_parque_tras,ll_count_sep,ll_count_tras,ll_count_suma,ll_cod_parque,ll_count_reserva,&
			ll_parque_aux,ll_nulo,ll_count_tiene,ll_parque_cons,ll_count_cap
datetime	ldt_fec_tras,ldt_nulo,ldt_fecha_ini,ldt_fecha_fin
Date		ld_fecha_sepult,ld_fecha
Double	ll_numero,ll_numero_aux

ls_columna				= dwo.name
SetNull(ls_nulo);SetNull(ll_nulo);Setnull(ldt_nulo)
ll_cod_parque			= this.getitemnumber(this.getrow(),'cod_parque')
if ll_cod_parque>0 then
	if ls_columna='cod_parque' or ls_columna='sector' or ls_columna='sepultura' or ls_columna='fecha_sepultacion' then
		ll_cod_parque	= this.getitemnumber(this.getrow(),'cod_parque')
		ls_sector			= this.getitemstring(this.getrow(),'sector')
		ls_sepultura		= this.getitemstring(this.getrow(),'sepultura')
		if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and &
			not isnull(ls_sepultura) and ls_sepultura<>'' then
			SELECT	Count("INVENTARIO_PLANI"."BASE")
			INTO 		:ll_count_reserva
			FROM 		"INVENTARIO_PLANI"  
			WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque ) AND  
					 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
					 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) AND  
					 ( "INVENTARIO_PLANI"."NUMERO" > 0 )   
			USING		sqlca;
			if ll_count_reserva>0 then
				ls_pasa	= 'S'
			else
//				SELECT	Count("RESERVA_SEPULTURA"."FOLIO_RESERVA")  
//				INTO 		:ll_count_tiene  
//				FROM 		"RESERVA_SEPULTURA"  
//				WHERE  ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) AND  
//						 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
//						 ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
//						 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura )   
//				USING		sqlca;
//				if ll_count_tiene>0 then
					ls_pasa1	= 'S'
//				else
//					ls_pasa1	= 'N'
//				end if
			end if
			if ls_pasa1='N' then
				this.setitem(this.getrow(),'sector',ls_nulo)
				this.setitem(this.getrow(),'sepultura',ls_nulo)
				idw_detalle6.reset()
				idw_detalle6.insertrow(0)
				this.accepttext()
				this.setcolumn('sector')
			else
				if ls_pasa='S' then
					SELECT	"INVENTARIO_PLANI"."BASE",   
								"INVENTARIO_PLANI"."SERIE",   
								"INVENTARIO_PLANI"."NUMERO"
					INTO 		:ls_base,   
								:ls_serie,   
								:ll_numero
					FROM 		"INVENTARIO_PLANI"  
					WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque ) AND  
							 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
							 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) AND  
							 ( "INVENTARIO_PLANI"."NUMERO" > 0 )   
					USING		sqlca;
//				elseif ls_pasa1='S' then
//					SELECT	"RESERVA_SEPULTURA"."BASE",	"RESERVA_SEPULTURA"."SERIE",	"RESERVA_SEPULTURA"."NUMERO"  
//					INTO 		:ls_base,							:ls_serie,							:ll_numero  
//					FROM 		"RESERVA_SEPULTURA"  
//					WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
//							 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
//							 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND  
//							 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) AND  
//							 ( "RESERVA_SEPULTURA"."FOLIO_RESERVA" = ( 	SELECT MAX("RESERVA_SEPULTURA"."FOLIO_RESERVA") 
//																						FROM 		"RESERVA_SEPULTURA" 
//																						WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND 
//																								 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
//																								 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND 
//																								 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) ) )   
//					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if ls_base='O' then
						if ll_numero=10000000 then
							ls_pasa_ctrol		= 'S'
						else
							SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
							INTO 		:ll_parque_aux,				:ls_cod_age_aux  
							FROM 		"CD_FOLIO"  
							WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
									 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
									 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
							USING		Trans_2;
							if Trans_2.sqlcode=0 then
								ls_pasa_ctrol		= 'S'
							else
								if (ll_numero <= 84000 and gs_conexion	= "Parque El Prado") or &
									(ll_numero <= 15884 and gs_conexion	= "Parque La Foresta") then
									ls_pasa_ctrol	= 'S'
								else
									ls_pasa_ctrol	= 'N'
								end if
							end if
						end if
					else
						ls_pasa_ctrol			= 'S'
					end if
					if ls_pasa_ctrol='S' then
						SELECT	"CADENA"."ESTADO"  
						INTO		:ls_est_ctto  
						FROM 		"CADENA"  
						WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :ls_serie ) AND  
								 ( "CADENA"."NUMERO" = :ll_numero )   
						USING		sqlca;
						if ls_est_ctto='V' or ls_est_ctto='C' or ls_est_ctto='R' or ls_est_ctto='S' or ls_est_ctto='N' or ls_est_ctto='D' or ls_est_ctto='A' or sqlca.sqlcode=100 then
						else
							this.setitem(this.getrow(),'sector',ls_nulo)
							this.setitem(this.getrow(),'sepultura',ls_nulo)
							idw_detalle6.reset()
							idw_detalle6.insertrow(0)
							this.accepttext()
							this.setcolumn('sector')
						end if
					end if
				end if
			end if
		else
			if isnull(ll_cod_parque) then
				this.setcolumn('cod_parque')
			elseif isnull(ls_sector) then
				this.setcolumn('sector')
			elseif isnull(ls_sepultura) then
				this.setcolumn('sepultura')
			end if
		end if
	end if
	if ls_columna<>'estado_responso' or ls_columna='estado_responso' then
		ls_estado_resp	= this.getitemstring(this.getrow(),'estado_responso')
		if ls_estado_resp='N' then
			this.setitem(this.getrow(),'rut_diacono',ll_nulo)
		end if
	end if
	
	if ls_columna<>'hora' and ls_columna<>'minutos' then
		ll_hora_fijada	= this.getitemnumber(this.getrow(),'hora')
		ll_min_fijada	= this.getitemnumber(this.getrow(),'minutos')
		ldt_fec_tras	= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
		ll_parque_tras	= this.getitemnumber(this.getrow(),'cod_parque')
		if ll_hora_fijada>0 then
			ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
			if ll_cod_parque>0 then
				SELECT	"FICHA_HORAS"."HORA_INICIO",   
							"FICHA_HORAS"."MINUTO_INICIO",   
							"FICHA_HORAS"."HORA_FINAL",   
							"FICHA_HORAS"."MINUTO_FINAL",   
							"FICHA_HORAS"."INTERVALO_MINUTO",   
							"FICHA_HORAS"."VECES_SEPULTACION"  
				INTO		:il_hora_ini,   
							:il_min_ini,   
							:il_hora_fin,   
							:il_min_fin,   
							:il_intervalo,   
							:il_veces  
				FROM 		"FICHA_HORAS"  
				WHERE 	"FICHA_HORAS"."COD_PARQUE" = :ll_cod_parque   ;
			end if
			ls_modif_adm		= this.getitemstring(this.getrow(),'modif_adm')
			if ls_modif_adm = 'N' then
				if ll_hora_fijada<il_hora_ini or (ll_hora_fijada=il_hora_ini and ll_min_fijada<il_min_ini) then
					ll_hora_fijada	= 0
					ll_min_fijada	= 0
					this.setitem(this.getrow(),'hora',ll_hora_fijada)
					this.setitem(this.getrow(),'minutos',ll_min_fijada)
				elseif ll_hora_fijada>il_hora_fin or (ll_hora_fijada=il_hora_fin and ll_min_fijada>il_min_fin) then
					ll_hora_fijada	= 0
					ll_min_fijada	= 0
					this.setitem(this.getrow(),'hora',ll_hora_fijada)
					this.setitem(this.getrow(),'minutos',ll_min_fijada)
				end if
				tab_1.tabpage_3.dw_ficha_sepult.Setitem(this.getrow(),'hora_def',ll_hora_fijada)
				tab_1.tabpage_3.dw_ficha_sepult.Setitem(this.getrow(),'minuto_def',ll_min_fijada)
			end if
		end if
	end if
	if ls_columna<>'hora' then
		ll_hora	= this.getitemnumber(this.getrow(),'hora')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 23 then
				this.setitem(this.getrow(),'hora',0)
			end if
		end if
	end if
	if ls_columna<>'minutos' then
		ll_hora	= this.getitemnumber(this.getrow(),'minutos')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 59 then
				this.setitem(this.getrow(),'minutos',0)
				this.setcolumn('minutos')
			else
				if il_intervalo=30 then
					if ll_hora<>0 and ll_hora<>30 then
						this.setitem(this.getrow(),'minutos',0)
						this.setcolumn('minutos')
					end if
				elseif il_intervalo=15 then
					if ll_hora<>0 and ll_hora<>15 and ll_hora<>30 and ll_hora<>45 then
						this.setitem(this.getrow(),'minutos',0)
						this.setcolumn('minutos')
					end if
				elseif il_intervalo=60 then
					if ll_hora<>0 then
						this.setitem(this.getrow(),'minutos',0)
						this.setcolumn('minutos')
					end if
				end if
			end if
		end if
	end if
	
	if ls_columna <> 'capacidad' then
		ll_capacidad	= dw_ficha_sepult.getitemnumber(this.getrow(),'capacidad')
		ll_cod_parque	= dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque')
		SELECT	Count("LISTA_PRECIO"."SECTOR")  
		INTO 		:ll_count_cap  
		FROM 		"LISTA_PRECIO"  
		WHERE 	"LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad  and
					"LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque
		USING		sqlca;
		if ll_count_cap=0 then
			dw_ficha_sepult.setitem(this.getrow(),'capacidad',ll_nulo)
			dw_ficha_sepult.setitem(this.getrow(),'nivel',ls_nulo)
			dw_ficha_sepult.accepttext()
		end if
	end if
//	if ls_columna='fecha_pase' or ls_columna<>'fecha_pase' then
//		ld_fecha				= date(this.getitemdatetime(this.getrow(),'fecha_pase'))
//		ld_fecha_sepult	= date(this.getitemdatetime(this.getrow(),'fecha_sepultacion'))
//		if ld_fecha > ld_fecha_sepult then
//			this.setitem(this.getrow(),'fecha_pase',ldt_nulo)
//		end if
//		this.accepttext()
//	end if
	if ls_columna<>'hora_recepcion' then
		ll_hora	= this.getitemnumber(this.getrow(),'hora_recepcion')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 23 then
				this.setitem(this.getrow(),'hora_recepcion',0)
			end if
		end if
	end if
	if ls_columna<>'minuto_recepcion' then
		ll_hora	= this.getitemnumber(this.getrow(),'minuto_recepcion')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 59 then
				this.setitem(this.getrow(),'minuto_recepcion',0)
			end if
		end if
	end if
	if ls_columna<>'hora_llegada_efectiva' then
		ll_hora	= this.getitemnumber(this.getrow(),'hora_llegada_efectiva')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 23 then
				this.setitem(this.getrow(),'hora_llegada_efectiva',0)
			end if
		end if
	end if
	if ls_columna<>'minuto_llegada_efectiva' then
		ll_hora	= this.getitemnumber(this.getrow(),'minuto_llegada_efectiva')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 59 then
				this.setitem(this.getrow(),'minuto_llegada_efectiva',0)
			end if
		end if
	end if
	if ls_columna<>'fecha_sepultacion' and is_modif	= 'S' then
		ldt_fec_tras	= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
		ldt_fecha_ini	= datetime(RelativeDate(date(gdt_fec_sistema),  - 30))
		ldt_fecha_fin	= datetime(RelativeDate(date(gdt_fec_sistema), 60))
		if ldt_fec_tras < ldt_fecha_ini or ldt_fec_tras > ldt_fecha_fin then
			this.setitem(this.getrow(),'fecha_sepultacion',ldt_nulo)
			this.accepttext()
			this.setcolumn('fecha_sepultacion')
		end if
	end if
	if ls_columna = 'numero_tecnico' or ls_columna = 'nivel' or ls_columna='observacion_sepultura_completa' then
		if not isnull(dw_ficha_sepult.getitemstring(this.getrow(),'nivel')) and dw_ficha_sepult.getitemstring(this.getrow(),'nivel')<>'-' and &
			dw_ficha_sepult.getitemstring(this.getrow(),'nivel')<>'' then
			ls_base			= dw_ficha_sepult.getitemstring(this.getrow(),'base')
			ls_serie			= dw_ficha_sepult.getitemstring(this.getrow(),'serie')
			ll_numero		= dw_ficha_sepult.getitemnumber(this.getrow(),'numero')
			ls_nivel			= trim(this.getitemstring(this.getrow(),'nivel'))
			ll_capacidad	= this.getitemnumber(this.getrow(),'capacidad')
			ll_pos			= Pos(ls_nivel, ".")
			ls_var_nivel	= mid(ls_nivel,ll_pos + 1)
			ll_pos			= Pos(ls_var_nivel, ".")
			ls_var_cap		= mid(ls_var_nivel,ll_pos + 1)
			ls_var_final	= mid(ls_var_nivel,1,ll_pos - 1)
//			if long(ls_var_final) > ll_capacidad then
//				this.setitem(this.getrow(),'nivel',ls_nulo)
//				this.accepttext()
//				this.setcolumn('nivel')
//			else
//				if long(ls_var_cap) <> ll_capacidad and long(ls_var_cap) > ll_capacidad then
//					this.setitem(this.getrow(),'nivel',ls_nulo)
//					this.accepttext()
//					this.setcolumn('nivel')
//				else
//					SELECT	"FICHA_SEPULTACION"."NIVEL"  
//					INTO 		:ls_nivel_aux  
//					FROM 		"FICHA_SEPULTACION"  
//					WHERE  ( "FICHA_SEPULTACION"."BASE" = :ls_base ) AND  
//							 ( "FICHA_SEPULTACION"."SERIE" = :ls_serie ) AND  
//							 ( "FICHA_SEPULTACION"."NUMERO" = :ll_numero ) AND
//							 ( "FICHA_SEPULTACION"."NIVEL"  = :ls_nivel )
//					USING		sqlca;
//					if sqlca.sqlcode=0 then
//						if not isnull(this.getitemstring(this.getrow(),'c_existe_ctto')) then
//							this.setitem(this.getrow(),'nivel',ls_nulo)
//							this.accepttext()
//							this.setcolumn('nivel')
//						end if
//					end if
//				end if
//			end if
		end if
	end if
	if ls_columna<>'base' and ls_columna<>'serie' and ls_columna<>'numero' then
		ls_base			= dw_ficha_sepult.getitemstring(this.getrow(),'base')
		ls_serie			= dw_ficha_sepult.getitemstring(this.getrow(),'serie')
		ll_numero		= dw_ficha_sepult.getitemnumber(this.getrow(),'numero')
		ls_existe_ctto	= dw_ficha_sepult.getitemstring(this.getrow(),'c_existe_ctto')
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and &
			not isnull(ll_numero) and ll_numero>0 and ls_existe_ctto='N' then
			SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
			INTO 		:ll_parque_aux,				:ls_cod_age_aux  
			FROM 		"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
					 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
					 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
			USING		Trans_2;
			if Trans_2.sqlcode=0 then
				if isnull(ls_cod_age_aux) or ls_cod_age_aux='' then
//					dw_ficha_sepult.Setitem(this.getrow(),'numero',ll_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'cod_estado_contrato',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'capacidad',ll_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'nivel',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'numero_tecnico',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'cantidad_sepultados',ll_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'estado_sepultura_completa',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'capacidad_libre_sepultura',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'estado_credito',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'estado_mantencion',ll_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'observacion_credito',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'observacion_mantencion',ls_nulo)
//					dw_ficha_sepult.accepttext()
//					dw_ficha_sepult.setcolumn('numero')
				end if
			else
				dw_ficha_sepult.Setitem(this.getrow(),'numero',ll_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'cod_estado_contrato',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'capacidad',ll_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'nivel',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'numero_tecnico',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'cantidad_sepultados',ll_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'estado_sepultura_completa',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'capacidad_libre_sepultura',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'estado_credito',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'estado_mantencion',ll_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'observacion_credito',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'observacion_mantencion',ls_nulo)
				dw_ficha_sepult.accepttext()
				dw_ficha_sepult.setcolumn('numero')
			end if
		end if
		ll_parque_cons	= dw_ficha_sepult.getitemnumber(dw_ficha_sepult.getrow(),'cod_parque')
		ls_sector		= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'sector')
		ls_sepultura	= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'sepultura')
		if ll_numero > 0 and ll_parque_cons > 0 and not isnull(ls_sepultura) and not isnull(ls_sector) then
			SELECT	"INVENTARIO_PLANI"."BASE",	"INVENTARIO_PLANI"."SERIE",	"INVENTARIO_PLANI"."NUMERO"
			INTO 		:ls_base_aux,					:ls_serie_aux,						:ll_numero_aux  
			FROM 		"INVENTARIO_PLANI"  
			WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_parque_cons ) AND  
					 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
					 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura )   
			USING		sqlca;
			if sqlca.sqlcode=0 and ll_numero_aux <> 10000000 then
				ls_pasa	= 'S'
			else
				if ll_numero_aux = 10000000 then
					SELECT	"INVENTARIO_PLANI_CONST"."NUMERO_TEC"  
					INTO 		:ls_nro_tecnico  
					FROM 		"INVENTARIO_PLANI_CONST"  
					WHERE  ( "INVENTARIO_PLANI_CONST"."SECTOR" = :ls_sector ) AND  
							 ( "INVENTARIO_PLANI_CONST"."SEPULTURA" = :ls_sepultura ) AND  
							 ( "INVENTARIO_PLANI_CONST"."BASE" = :ls_base ) AND  
							 ( "INVENTARIO_PLANI_CONST"."SERIE" = :ls_serie ) AND  
							 ( "INVENTARIO_PLANI_CONST"."NUMERO" = :ll_numero ) AND  
							 ( "INVENTARIO_PLANI_CONST"."COD_PARQUE" = :ll_parque_cons )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_pasa	= 'S'
					else
//						SELECT	"RESERVA_SEPULTURA"."BASE",	"RESERVA_SEPULTURA"."SERIE",	"RESERVA_SEPULTURA"."NUMERO"  
//						INTO 		:ls_base,							:ls_serie,							:ll_numero  
//						FROM 		"RESERVA_SEPULTURA"  
//						WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
//								 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
//								 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND  
//								 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_parque_cons ) AND  
//								 ( "RESERVA_SEPULTURA"."BASE" = :ls_base )   AND
//								 ( "RESERVA_SEPULTURA"."SERIE" = :ls_serie )   AND
//								 ( "RESERVA_SEPULTURA"."NUMERO" = :ll_numero ) 
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
							ls_pasa	= 'S'
//						else
//							ls_pasa	= 'N'
//							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero',ll_nulo)
//							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
//							tab_1.tabpage_3.dw_ficha_sepult.setfocus()
//							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
//						end if
					end if
				else
					ls_pasa			= 'S'
				end if
			end if
		end if
	end if
//	if is_nuevo	= 'S' and (ls_columna='hora' or ls_columna='fecha_sepultacion') then
//		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
//		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
//		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
//		is_nuevo	= 'N'
////		cb_volver.triggerevent(getfocus!)
//	end if
end if
end event

event doubleclicked;String	ls_columna,ls_fecha,ls_mes
Long		ll_row,ll_dia,ll_mes,ll_anno
Datetime	ldt_fec_sepult
ls_columna			= dwo.name
if ls_columna='t_4' then //or ls_columna='hora' or ls_columna='t_5' or ls_columna='minutos'
	ll_row				= this.getrow()
	ldt_fec_sepult	= this.getitemdatetime(ll_row,'fecha_sepultacion')
	ll_dia				= day(date(ldt_fec_sepult))
	ll_mes			= month(date(ldt_fec_sepult))
	ll_anno			= year(date(ldt_fec_sepult))
	ls_fecha			= string(ll_dia)
	CHOOSE CASE ll_mes
		CASE 1
			ls_mes	= ' ENERO '
		CASE 2
			ls_mes	= ' FEBRERO '
		CASE 3
			ls_mes	= ' MARZO '
		CASE 4
			ls_mes	= ' ABRIL '
		CASE 5
			ls_mes	= ' MAYO '
		CASE 6
			ls_mes	= ' JUNIO '
		CASE 7
			ls_mes	= ' JULIO '
		CASE 8
			ls_mes	= ' AGOSTO '
		CASE 9
			ls_mes	= ' SEPTIEMBRE '
		CASE 10
			ls_mes	= ' OCTUBRE '
		CASE 11
			ls_mes	= ' NOVIEMBRE '
		CASE 12
			ls_mes	= ' DICIEMBRE '
	END CHOOSE
	ls_fecha			= ls_fecha+ls_mes+' '+string(ll_anno)
	if isvalid(w_lista_obituario) then close(w_lista_obituario)
	OpenWithParm(w_lista_obituario, ls_fecha)
end if
end event

event rowfocuschanged;Long	ll_row
ll_row	= getrow()
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

type gb_3 from groupbox within tabpage_3
integer x = 1851
integer width = 1650
integer height = 148
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3717
integer height = 2276
long backcolor = 67108864
string text = "  Antecedente Titular"
long tabtextcolor = 33554432
string picturename = "Custom076!"
long picturemaskcolor = 536870912
st_2 st_2
dw_ant_titular dw_ant_titular
end type

on tabpage_2.create
this.st_2=create st_2
this.dw_ant_titular=create dw_ant_titular
this.Control[]={this.st_2,&
this.dw_ant_titular}
end on

on tabpage_2.destroy
destroy(this.st_2)
destroy(this.dw_ant_titular)
end on

type st_2 from statictext within tabpage_2
integer x = 87
integer y = 40
integer width = 2098
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Antecedentes del Titular"
boolean focusrectangle = false
end type

type dw_ant_titular from datawindow within tabpage_2
integer x = 78
integer y = 160
integer width = 3561
integer height = 1144
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_antecedente_titular_reduccion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_ciudad,ls_dv
long  	ll_rut,ll_new

this.accepttext()
ls_columna		= dwo.name
if ls_columna='codigo_ciudad_titular' then
	ls_ciudad	= this.getitemstring(this.getrow(),'codigo_ciudad_titular')
	idw_detalle3.retrieve(ls_ciudad)
end if

this.accepttext()

if ls_columna='rut_titular' or ls_columna='dv_titular' then
	ll_new				= this.getrow()
	ll_rut				= this.getitemnumber(this.getrow(),'rut_titular')
	ls_dv					= this.getitemstring(this.getrow(),'dv_titular')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			Setnull(ls_dv)
//			dw_ant_titular.reset()
//			ll_new	= dw_ant_titular.insertrow(0)
			dw_ant_titular.scrolltorow(ll_new)
			dw_ant_titular.setitem(ll_new,'dv_fallecido',ls_dv)
			this.accepttext()
			dw_ant_titular.setfocus()
			dw_ant_titular.setcolumn('dv_fallecido')
		end if 
	end if
end if
end event

event rowfocuschanged;Long	ll_row
ll_row	= getrow()
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

event clicked;Long	ll_row
ll_row						= row
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3717
integer height = 2276
long backcolor = 67108864
string text = "  Antecedente Fallecido"
long tabtextcolor = 33554432
string picturename = "ver_pagos_cta_mant.bmp"
long picturemaskcolor = 536870912
st_1 st_1
dw_ant_fall dw_ant_fall
end type

on tabpage_1.create
this.st_1=create st_1
this.dw_ant_fall=create dw_ant_fall
this.Control[]={this.st_1,&
this.dw_ant_fall}
end on

on tabpage_1.destroy
destroy(this.st_1)
destroy(this.dw_ant_fall)
end on

type st_1 from statictext within tabpage_1
integer x = 87
integer y = 40
integer width = 2226
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Antecedentes del Fallecido"
boolean focusrectangle = false
end type

type dw_ant_fall from datawindow within tabpage_1
integer x = 78
integer y = 160
integer width = 3561
integer height = 2076
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_antece_fall_ficha_reduccion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_ciudad,ls_dv,ls_nulo,ls_periodo,ls_usar_capilla,ls_nombre,ls_sexo,&
			ls_base_fall,ls_serie_fall,ls_est_fall,ls_op_fall,ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall,&
			ls_dv_fall,ls_sexo_fall,ls_periodo_fall,ls_causa_fall,ls_obs_fall,ls_tamano
Long		ll_rut,ll_resp,ll_new,ll_year,ll_mes,ll_dia,ll_year_hoy,ll_mes_hoy,ll_dia_hoy,ll_edad,&
			ll_hora,ll_minutos,ll_sw_tit_fall,ll_res,ll_nulo,ll_fila,ll_alto_impacto,ll_pos,ll_llave,&
			ll_n_l_fall,ll_n_m_fall,ll_numero_fall,ll_rut_fall,ll_edad_fall
Datetime	ldt_fecha_fall,ldt_fecha_defun,ldt_nulo,ldt_fec_sepult,ldt_fec_nac_fall,ldt_fec_def_fall,&
			ldt_fec_sep_fall
date		ldt_fec_ini,ld_fecha_fall

this.accepttext()
ls_columna				= dwo.name 
Setnull(ls_nulo);Setnull(ldt_nulo);setnull(ll_nulo)
if ls_columna = 'llave' then
	ll_llave				= long(data)
	if ll_llave > 0 then
		ll_fila			= tab_1.tabpage_1.dw_ant_fall.getrow()
		SELECT 	"FALLECIDOS"."NOMBRES",	"FALLECIDOS"."AP_PATERNO",	"FALLECIDOS"."AP_MATERNO",	"FALLECIDOS"."FEC_SEP",	"FALLECIDOS"."EST",	"FALLECIDOS"."RUT",	"FALLECIDOS"."DV",	"FALLECIDOS"."SEXO",	"FALLECIDOS"."EDAD",	"FALLECIDOS"."PERIODO",	"FALLECIDOS"."FEC_NAC",	"FALLECIDOS"."FEC_FALL",	"FALLECIDOS"."CAUSA_FALL",	"FALLECIDOS"."OBSERVACIONES"
		INTO 		:ls_nom_fall,				:ls_ap_pat_fall,				:ls_ap_mat_fall, 				:ldt_fec_sep_fall,		:ls_est_fall,			:ll_rut_fall,			:ls_dv_fall, 			:ls_sexo_fall,			:ll_edad_fall,			:ls_periodo_fall,			:ldt_fec_nac_fall,		:ldt_fec_def_fall,			:ls_causa_fall, 				:ls_obs_fall
		FROM		"FALLECIDOS"  
		WHERE 	"FALLECIDOS"."LLAVE" = :ll_llave   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'rut_fallecido',ll_rut_fall)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'dv_fallecido',ls_dv_fall)
			ll_rut		= tab_1.tabpage_2.dw_ant_titular.getitemnumber(1,'rut_titular')
			if ll_rut = ll_rut_fall then
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sw_titular_fall',0)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'tipo_via_fallecido',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'tipo_via_titular'))
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'direccion_titular'))
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'numero_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'num_direccion_titular'))
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'depto_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'depto_direccion_titular'))
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'block_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'block_direccion_titular'))
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'poblacion_villa_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'poblacion_villa_titular'))
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sector_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'sector_titular'))
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_ciudad_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular'))
				if idw_detalle2.retrieve(tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')) = 0 then
					idw_detalle2.insertrow(0)
				end if
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_comuna_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_comuna_titular'))
			end if
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'nombre_fallecido',ls_nom_fall )
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'ap_paterno_fall',ls_ap_pat_fall )
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'ap_materno_fall',ls_ap_mat_fall)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_nacimiento_fall',ldt_fec_nac_fall)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_defuncion',ldt_fec_sep_fall)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'edad_fallecido',ll_edad_fall)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'periodo_nacimiento',ls_periodo_fall)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sexo_fallecido',ls_sexo_fall)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'cod_estado_fall','RE')
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'observacion_fallecido',ls_obs_fall)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'causa_fallecimiento',ls_causa_fall)
			tab_1.tabpage_1.dw_ant_fall.accepttext()
		end if
	end if
end if
if ls_columna='sw_titular_fall' then
	il_dw_tit_fall		= 0
	ll_sw_tit_fall		= long(data)
	ll_fila	= tab_1.tabpage_1.dw_ant_fall.getrow()
	if ll_sw_tit_fall=0 then
		ll_res			= messagebox("Advertencia","Está Seguro COPIAR Antecedentes de Titular a Fallecido",Exclamation!,YesNo!,2)
		if ll_res=1 then
			ll_rut		= tab_1.tabpage_2.dw_ant_titular.getitemnumber(1,'rut_titular')
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'rut_fallecido',tab_1.tabpage_2.dw_ant_titular.getitemnumber(1,'rut_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'dv_fallecido',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'dv_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'nombre_fallecido',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'nombre_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'ap_paterno_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_paterno_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'ap_materno_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_materno_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'tipo_via_fallecido',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'tipo_via_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'direccion_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'numero_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'num_direccion_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'depto_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'depto_direccion_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'block_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'block_direccion_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'poblacion_villa_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'poblacion_villa_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sector_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'sector_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_ciudad_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular'))
			if idw_detalle2.retrieve(tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')) = 0 then
				idw_detalle2.insertrow(0)
			end if
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_comuna_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_comuna_titular'))
			tab_1.tabpage_1.dw_ant_fall.accepttext()
			SELECT	"CLIENTE"."FECHA_NAC",	"CLIENTE"."SEXO"  
			INTO 		:ldt_fecha_fall,			:ls_sexo  
			FROM 		"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_nacimiento_fall',ldt_fecha_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sexo_fallecido',ls_sexo)
				ldt_fec_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
				if ldt_fecha_fall > ldt_fec_sepult then
					messagebox("Advertencia","Fecha Nacimiento Inválida, No bede ser Mayor a la Fecha de Reducción")
					this.setitem(this.getrow(),'fecha_nacimiento_fall',ldt_nulo)
				else
					if not isnull(ldt_fecha_fall) then
						ll_year			= year(date(ldt_fecha_fall))
						ll_mes			= month(date(ldt_fecha_fall))
						ll_dia			= day(date(ldt_fecha_fall))
						ll_year_hoy		= year(date(gdt_fec_sistema))
						ll_mes_hoy		= month(date(gdt_fec_sistema))
						ll_dia_hoy		= day(date(gdt_fec_sistema))
						ll_edad			= ll_year_hoy - ll_year
						if (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy < ll_mes then
							ll_edad		= ll_edad - 1
						elseif (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy = ll_mes and ll_dia_hoy < ll_dia then
							ll_edad		= ll_edad - 1
						end if
						if ll_edad >= 0 then
							dw_ant_fall.setitem(dw_ant_fall.getrow(),'edad_fallecido',ll_edad)
							if ll_edad > 0 then 
								dw_ant_fall.setitem(dw_ant_fall.getrow(),'periodo_nacimiento','A')
							else
								dw_ant_fall.setitem(dw_ant_fall.getrow(),'periodo_nacimiento',ls_nulo)
							end if
							dw_ant_fall.accepttext()
						else
							messagebox("Advertencia","Fecha Nacimiento Fallecido Inválido")
						end if
					end if
				end if
			end if
		else
			il_dw_tit_fall	= 1
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sw_titular_fall',1)
		end if
	else
		ls_nombre			= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'nombre_fallecido')
		if not isnull(ls_nombre) or ls_nombre<>'' then
			ll_res			= messagebox("Advertencia","Está Seguro de BORRAR Antecedentes del Fallecido",Exclamation!,YesNo!,2)
			if ll_res=1 then
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'rut_fallecido',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'dv_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'nombre_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'ap_paterno_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'ap_materno_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'tipo_via_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'direccion_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'numero_direccion_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'depto_direccion_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'block_direccion_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'poblacion_villa_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sector_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_ciudad_fall',ls_nulo)
				idw_detalle2.reset()
				idw_detalle2.insertrow(0)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_comuna_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_nacimiento_fall',ldt_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'edad_fallecido',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'periodo_nacimiento',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sexo_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'cod_estado_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'cod_tamano_cuerpo',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_defuncion',ldt_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'observacion_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'causa_fallecimiento',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'usar_capilla','N')
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sw_alto_impacto',1)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'hora_util_capilla',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'minuto_util_capilla',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'capilla_velatoria',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'direccion_capilla',ls_nulo)
				
				tab_1.tabpage_1.dw_ant_fall.accepttext()
				tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
				tab_1.tabpage_1.dw_ant_fall.setfocus()
			end if
		end if
	end if
end if
if ls_columna='cod_tamano_cuerpo' then
	ls_tamano		=  this.getitemstring(this.getrow(),'cod_tamano_cuerpo')
	if ls_tamano='N' then
		this.setitem(this.getrow(),'cod_obs_cuerpo',ls_nulo)
		this.accepttext()
	end if
end if
if ls_columna='codigo_ciudad_fall' then
	ls_ciudad			= this.getitemstring(this.getrow(),'codigo_ciudad_fall')
	idw_detalle2.retrieve(ls_ciudad)
end if
if ls_columna='rut_fallecido' or ls_columna='dv_fallecido' then
	ll_new				= this.getrow()
	ll_rut				= this.getitemnumber(this.getrow(),'rut_fallecido')
	ls_dv					= this.getitemstring(this.getrow(),'dv_fallecido')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			Setnull(ls_dv)
//			dw_ant_fall.deleterow(this.getrow())
//			ll_new = dw_ant_fall.insertrow(0)
			dw_ant_fall.scrolltorow(ll_new)
//			dw_ant_fall.setitem(ll_new,'rut_fallecido',ll_rut)
			dw_ant_fall.setitem(ll_new,'dv_fallecido',ls_dv)
			dw_ant_fall.accepttext()
			dw_ant_fall.setfocus()
			dw_ant_fall.setcolumn('dv_fallecido')
		end if
	end if
end if
if ls_columna='fecha_defuncion' then
	ldt_fecha_defun	= this.getitemdatetime(this.getrow(),'fecha_defuncion')
	ldt_fec_sepult		= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
	if not isnull(ldt_fecha_defun) then
		if ldt_fecha_defun > ldt_fec_sepult then
			messagebox("Advertencia","Fecha Defunción Inválida, No bede ser Mayor a la Fecha de Reducción")
			this.setitem(this.getrow(),'fecha_defuncion',ldt_nulo)
		end if
	end if
end if
if ls_columna='fecha_nacimiento_fall' then
	ldt_fecha_fall	= this.getitemdatetime(this.getrow(),'fecha_nacimiento_fall')
	ldt_fec_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
	if ldt_fecha_fall > ldt_fec_sepult then
		messagebox("Advertencia","Fecha Nacimiento Inválida, No bede ser Mayor a la Fecha de Reducción")
		this.setitem(this.getrow(),'fecha_nacimiento_fall',ldt_nulo)
	else
		if not isnull(ldt_fecha_fall) then
			ll_year			= year(date(ldt_fecha_fall))
			ll_mes			= month(date(ldt_fecha_fall))
			ll_dia			= day(date(ldt_fecha_fall))
			ll_year_hoy		= year(date(gdt_fec_sistema))
			ll_mes_hoy		= month(date(gdt_fec_sistema))
			ll_dia_hoy		= day(date(gdt_fec_sistema))
			ll_edad			= ll_year_hoy - ll_year
			if (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy < ll_mes then
				ll_edad		= ll_edad - 1
			elseif (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy = ll_mes and ll_dia_hoy < ll_dia then
				ll_edad		= ll_edad - 1
			end if
			if ll_edad >= 0 then
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'edad_fallecido',ll_edad)
				if ll_edad > 0 then 
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'periodo_nacimiento','A')
				else
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'periodo_nacimiento',ls_nulo)
				end if
				dw_ant_fall.accepttext()
			else
				messagebox("Advertencia","Fecha Nacimiento Fallecido Inválido")
			end if
		end if
	end if
end if
if ls_columna='periodo_nacimiento' then
	ls_periodo		= this.getitemstring(this.getrow(),'periodo_nacimiento')
	if ls_periodo='A' then
		ldt_fec_ini		= RelativeDate(today(), -365)
		ld_fecha_fall	= date(this.getitemdatetime(this.getrow(),'fecha_nacimiento_fall'))
		if ld_fecha_fall > ldt_fec_ini then
			messagebox("Advertencia","No es Posible Ingresar Tipo de Periodo, Fecha Ingresar es Menor a UN Año")
		end if
	end if
end if
if ls_columna='usar_capilla' then
	ls_usar_capilla	= data
	if ls_usar_capilla='N' then
		this.setitem(this.getrow(),'hora_util_capilla',0)
		this.setitem(this.getrow(),'minuto_util_capilla',0)
		this.setitem(this.getrow(),'capilla_velatoria',ls_nulo)
	end if
end if
if ls_columna='sw_alto_impacto' then
	ll_alto_impacto	= long(data)
	if ll_alto_impacto=1 then
		this.setitem(this.getrow(),'obs_alto_impacto',ls_nulo)
	end if
end if
if ls_columna='hora_util_capilla' then
	ll_hora	= this.getitemnumber(this.getrow(),'hora_util_capilla')
	if ll_hora>23 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'hora_util_capilla',0)
	end if
end if
if ls_columna='minuto_util_capilla' then
	ll_minutos	= this.getitemnumber(this.getrow(),'minuto_util_capilla')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'minuto_util_capilla',0)
	end if
end if
this.accepttext()
end event

event clicked;String	ls_estado,ls_columna,ls_fecha,ls_dv,ls_estado_reg
Datetime	ldt_fecha_fall,ldt_fecha_defun,ldt_nulo,ldt_fec_sepult
Long		ll_year,ll_year_hoy,ll_mes,ll_mes_hoy,ll_dia,ll_dia_hoy,ll_edad,ll_rut,ll_fila,ll_res,&
			ll_row

dw_ant_fall.accepttext()
Setnull(ldt_nulo)
ls_columna			= dwo.name
ll_row						= row
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
ls_estado_reg		= this.getitemstring(this.getrow(),'estado_reg')
if (ls_estado_reg<>'G' and ls_estado_reg<>'A') or isnull(ls_estado_reg) then
	CHOOSE CASE ls_columna
		CASE 't_copiar'
			ll_rut	= dw_ant_fall.getitemnumber(dw_ant_fall.getrow(),'rut_fallecido')
			ls_dv		= dw_ant_fall.getitemstring(dw_ant_fall.getrow(),'dv_fallecido')
			if ll_rut > 0 and not isnull(ll_rut) and not isnull(ls_dv) then
				ll_fila	= tab_1.tabpage_1.dw_ant_fall.getrow()
				if tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_fila,'direccion_fall') <> tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'direccion_titular') or isnull(tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_fila,'direccion_fall')) then
					ll_res			= messagebox("Advertencia","Está Seguro COPIAR Dirección de Titular a Fallecido",Exclamation!,YesNo!,2)
					if ll_res=1 then
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'tipo_via_fallecido',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'tipo_via_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'direccion_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'numero_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'num_direccion_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'depto_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'depto_direccion_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'block_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'block_direccion_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'poblacion_villa_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'poblacion_villa_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sector_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'sector_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_ciudad_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular'))
						if idw_detalle2.retrieve(tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')) = 0 then
							idw_detalle2.insertrow(0)
						end if
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_comuna_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_comuna_titular'))
						tab_1.tabpage_1.dw_ant_fall.accepttext()
					end if
				end if
			end if
			
		CASE 'p_1'
			ll_rut	= dw_ant_fall.getitemnumber(dw_ant_fall.getrow(),'rut_fallecido')
			ls_dv		= dw_ant_fall.getitemstring(dw_ant_fall.getrow(),'dv_fallecido')
			if ll_rut > 0 and not isnull(ll_rut) and not isnull(ls_dv) then
				ls_fecha	= string(date(dw_ant_fall.getitemdatetime(dw_ant_fall.getrow(),'fecha_defuncion')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_defuncion',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_defuncion',date(ls_fecha))
				END IF
				ldt_fecha_defun	= this.getitemdatetime(this.getrow(),'fecha_defuncion')
				ldt_fec_sepult		= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
				if not isnull(ldt_fecha_defun) then
					if ldt_fecha_defun > ldt_fec_sepult then
						messagebox("Advertencia","Fecha Defunción Inválida, No bede ser Mayor a la Fecha de Reducción")
						dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_defuncion',ldt_nulo)
					end if
				end if
			end if
	
		CASE 'p_2'
			ll_rut	= dw_ant_fall.getitemnumber(dw_ant_fall.getrow(),'rut_fallecido')
			ls_dv		= dw_ant_fall.getitemstring(dw_ant_fall.getrow(),'dv_fallecido')
			if ll_rut<>0 and not isnull(ll_rut) and ls_dv<>'' and not isnull(ls_dv) then
				ls_fecha	= string(date(dw_ant_fall.getitemdatetime(dw_ant_fall.getrow(),'fecha_nacimiento_fall')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fall',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fall',date(ls_fecha))
				END IF
				ldt_fecha_fall	= this.getitemdatetime(this.getrow(),'fecha_nacimiento_fall')
				ldt_fec_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
				if not isnull(ldt_fecha_fall) then
					if ldt_fecha_fall > ldt_fec_sepult then
						messagebox("Advertencia","Fecha Nacimiento Inválida, No bede ser Mayor a la Fecha de Reducción")
						dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fall',ldt_nulo)
					else
						ll_year			= year(date(ldt_fecha_fall))
						ll_mes			= month(date(ldt_fecha_fall))
						ll_dia			= day(date(ldt_fecha_fall))
						ll_year_hoy		= year(date(gdt_fec_sistema))
						ll_mes_hoy		= month(date(gdt_fec_sistema))
						ll_dia_hoy		= day(date(gdt_fec_sistema))
						ll_edad			= ll_year_hoy - ll_year
						if (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy < ll_mes then
							ll_edad		= ll_edad - 1
						elseif (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy = ll_mes and ll_dia_hoy < ll_dia then
							ll_edad		= ll_edad - 1
						end if
						if ll_edad >= 0 then
							dw_ant_fall.setitem(dw_ant_fall.getrow(),'edad_fallecido',ll_edad)
							dw_ant_fall.accepttext()
						else
							messagebox("Advertencia","Fecha Nacimiento Fallecido Inválido")
						end if
					end if
				end if
			end if
	END CHOOSE
end if
end event

event itemfocuschanged;String	ls_columna,ls_dv,ls_periodo,ls_nulo
Long		ll_rut,ll_new,ll_nulo,ll_year,ll_mes,ll_dia,ll_year_hoy,ll_mes_hoy,ll_dia_hoy,ll_edad,&
			ll_hora
datetime	ldt_fecha_fall,ldt_nulo,ldt_fecha_defun,ldt_fec_sepult
date		ldt_fec_ini,ld_fecha_fall

if tab_1.tabpage_3.dw_ficha_sepult.getrow()>0 then
	Setnull(ll_nulo);Setnull(ldt_nulo);Setnull(ls_nulo)
	ls_columna					= dwo.name
	if ls_columna<>'rut_fallecido' and ls_columna<>'dv_fallecido' then
		ll_new					= this.getrow()
		ll_rut					= this.getitemnumber(this.getrow(),'rut_fallecido')
		ls_dv						= this.getitemstring(this.getrow(),'dv_fallecido')
		if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				setnull(ls_dv)
				dw_ant_fall.setitem(ll_new,'dv_fallecido',ls_dv)
				dw_ant_fall.accepttext()
				dw_ant_fall.setfocus()
				dw_ant_fall.setcolumn('dv_fallecido')
			end if
		end if
	end if
	if isnull(tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'sw_titular_fall')) then
		tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'sw_titular_fall',1)
	end if
	if (ls_columna<>'sw_titular_fall' or ls_columna='sw_titular_fall') and il_dw_tit_fall=1 then
		il_dw_tit_fall	= 0
		tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'sw_titular_fall',1)
	end if
	if ls_columna<>'fecha_nacimiento_fall' or ls_columna='fecha_nacimiento_fall' then
		ldt_fecha_fall			= this.getitemdatetime(this.getrow(),'fecha_nacimiento_fall')
		ldt_fec_sepult			= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
		if ldt_fecha_fall > ldt_fec_sepult then
			dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fall',ldt_nulo)
			dw_ant_fall.setfocus()
			dw_ant_fall.setcolumn('fecha_nacimiento_fall')
		else
			if not isnull(ldt_fecha_fall) then
				ll_year			= year(date(ldt_fecha_fall))
				ll_mes			= month(date(ldt_fecha_fall))
				ll_dia			= day(date(ldt_fecha_fall))
				ll_year_hoy		= year(date(gdt_fec_sistema))
				ll_mes_hoy		= month(date(gdt_fec_sistema))
				ll_dia_hoy		= day(date(gdt_fec_sistema))
				ll_edad			= ll_year_hoy - ll_year
				if (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy < ll_mes then
					ll_edad		= ll_edad - 1
				elseif (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy = ll_mes and ll_dia_hoy < ll_dia then
					ll_edad		= ll_edad - 1
				end if
				if ll_edad < 0 then
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'edad_fallecido',ll_nulo)
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fall',ldt_nulo)
					dw_ant_fall.accepttext()
				end if
			end if
		end if
	end if
	if ls_columna='fecha_defuncion' or ls_columna<>'fecha_defuncion' then
		ldt_fecha_defun		= this.getitemdatetime(this.getrow(),'fecha_defuncion')
		ldt_fec_sepult			= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
		if not isnull(ldt_fecha_defun) then
			if ldt_fecha_defun > ldt_fec_sepult then
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_defuncion',ldt_nulo)
				dw_ant_fall.setfocus()
				dw_ant_fall.setcolumn('fecha_defuncion')
			end if
		end if
	end if
	if ls_columna='periodo_nacimiento' or ls_columna<>'periodo_nacimiento' then
		ls_periodo				= this.getitemstring(this.getrow(),'periodo_nacimiento')
		if ls_periodo='A' then
			ldt_fec_ini			= RelativeDate(today(), -365)
			ld_fecha_fall		= date(this.getitemdatetime(this.getrow(),'fecha_nacimiento_fall'))
			if ld_fecha_fall > ldt_fec_ini then
				this.setitem(this.getrow(),'periodo_nacimiento',ls_nulo)
				this.setcolumn('edad_fallecido')
			end if
		end if
	end if
	if ls_columna<>'hora_util_capilla' then
		ll_hora	= this.getitemnumber(this.getrow(),'hora_util_capilla')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 23 then
				this.setitem(this.getrow(),'hora_util_capilla',0)
			end if
		end if
	end if
	if ls_columna<>'minuto_util_capilla' then
		ll_hora	= this.getitemnumber(this.getrow(),'minuto_util_capilla')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 59 then
				this.setitem(this.getrow(),'minuto_util_capilla',0)
			end if
		end if
	end if
	this.accepttext()
end if
end event

event rowfocuschanged;Long	ll_row
ll_row	= getrow()
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3717
integer height = 2276
long backcolor = 67108864
string text = "  Aranceles"
long tabtextcolor = 33554432
string picturename = "premio_ag_ing_caja.bmp"
long picturemaskcolor = 536870912
st_4 st_4
dw_aranceles dw_aranceles
end type

on tabpage_4.create
this.st_4=create st_4
this.dw_aranceles=create dw_aranceles
this.Control[]={this.st_4,&
this.dw_aranceles}
end on

on tabpage_4.destroy
destroy(this.st_4)
destroy(this.dw_aranceles)
end on

type st_4 from statictext within tabpage_4
integer x = 87
integer y = 40
integer width = 2226
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Aranceles"
boolean focusrectangle = false
end type

type dw_aranceles from datawindow within tabpage_4
integer x = 78
integer y = 160
integer width = 3547
integer height = 1724
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_aranceles_ficha_reduccion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string 	ls_columna,ls_cod_parentesco,ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,ls_pago_5,ls_pago_6,ls_nulo,ls_cod_pago_anterior,ls_cod_pago,&
			ls_cod_pago_1,ls_cod_pago_2,ls_cod_pago_3,ls_cod_pago_4,ls_cod_pago_5,ls_cod_pago_6
double 	ldb_valor_uf_dia,ldb_valor_arancel,ldb_valor_uf,ldb_valor_der,ldb_valor_mov_sar,ldb_valor_cambio,ldb_valor_red,ldb_valor_cert,ldb_total,ldb_valor_otros_p,ldb_valor_otros,&
			ldb_valor_urna,ldb_valor_1,ldb_valor_2,ldb_valor_3,ldb_valor_4,ldb_valor_5,ldb_valor_6,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,ldb_dscto_6,&
			ldb_monto_derecho_sep,ldb_monto_red,ldb_valor_arancell_parent
datetime ldt_fecha_hoy 
Long		ll_cod_parque,ll_sw_derecho,ll_sw_otros_pagos,ll_sw_pago_1,ll_sw_pago_2,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_5,ll_sw_pago_6,&
			ll_sw_pago_anterior,ll_sw_dscto_1,ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,ll_sw_dscto_5,ll_sw_dscto_6,ll_sw_derecha_sep,ll_tot_desc,ll_tot_pago

Setnull(ls_nulo)
this.accepttext()
ls_columna 				= dwo.name
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
if ls_columna = 'codigo_parentesco' then 
	ls_cod_parentesco	= dw_aranceles.getitemstring(dw_aranceles.getrow(),'codigo_parentesco')
	ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
	if ll_cod_parque>0 then
		if not isnull(ls_cod_parentesco) or ls_cod_parentesco<>'' then
			is_codigo_otro_reduc		= '43'
			
			SELECT	"TAB_UF"."VALOR_UF"  
			INTO 		:ldb_valor_uf_dia  
			FROM 	"TAB_UF"  
			WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'uf_dia',ldb_valor_uf_dia)
			end if
			dw_aranceles.accepttext()
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :is_codigo_otro_reduc and 
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE'
			USING	sqlca;
			if sqlca.sqlcode=0 then
		 		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',0)
				dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',is_codigo_otro_reduc)
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',ldb_valor_uf )
				dw_aranceles.accepttext()
				dw_aranceles.setfocus()
				dw_aranceles.setcolumn('monto_otro_1')
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_cancelar',ldb_valor_uf)
				dw_aranceles.accepttext()
				dw_aranceles.setfocus()
			end if
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
			
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
		end if	
	else
		messagebox("Advertencia","Debe Ingresar Parque en Ficha de Reducción")
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
	
elseif ls_columna='pago_otro_2' then
	ll_sw_pago_2					= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2')
	ls_pago_2						= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
	if ll_sw_pago_2 = 0 and not isnull(ls_pago_2) then
		ls_cod_pago_anterior		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		ls_cod_pago					= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
		if ls_cod_pago_anterior = ls_cod_pago then
			messagebox("Advertencia","Detalle Pago Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('pago_otro_2')
		else
			SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf 
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_2 and 
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE'
			USING	sqlca;
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',ldb_valor_uf)
				dw_aranceles.accepttext()
				dw_aranceles.setfocus()
				dw_aranceles.setcolumn('monto_otro_2')
			end if
		end if
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())

elseif ls_columna='pago_otro_3' then
	ll_sw_pago_3		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
	if not isnull(ls_cod_parentesco) and ll_sw_pago_3 = 0 then
		ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
		if ls_cod_pago_1 = ls_cod_pago_3 or ls_cod_pago_2 = ls_cod_pago_3 then
			messagebox("Advertencia","Detalle Pago Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('pago_otro_3')
		else
			SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf 
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_3 and 
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE'
			USING	sqlca;
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',ldb_valor_uf)
				dw_aranceles.accepttext()
				dw_aranceles.setfocus()
				dw_aranceles.setcolumn('monto_otro_3')
			end if
		end if
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
	
elseif ls_columna='sw_pago_4' then
	ll_sw_pago_4		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4')
	ls_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_4')
	if not isnull(ls_pago_4) and ll_sw_pago_4 = 0 then
		ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
		ls_cod_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
		if ls_cod_pago_1 = ls_cod_pago_4 or ls_cod_pago_2 = ls_cod_pago_4 or ls_cod_pago_3 = ls_cod_pago_4  then
			messagebox("Advertencia","Detalle Pago Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('pago_otro_4')
		else
			SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf 
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_4 and 
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE'
			USING	sqlca;
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',ldb_valor_uf)
				dw_aranceles.accepttext()
				dw_aranceles.setfocus()
				dw_aranceles.setcolumn('monto_otro_4')
			end if
		end if
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())

elseif ls_columna='sw_pago_5' then
	ll_sw_pago_5		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5')
	ls_pago_5			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_5')
	if not isnull(ls_pago_5) and ll_sw_pago_5 = 0 then
		ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
		ls_cod_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
		ls_cod_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_4')
		if ls_cod_pago_1 = ls_cod_pago_5 or ls_cod_pago_2 = ls_cod_pago_5 or ls_cod_pago_3 = ls_cod_pago_5 or ls_cod_pago_4 = ls_cod_pago_5  then
			messagebox("Advertencia","Detalle Pago Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('pago_otro_5')
		else
			SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf 
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_5 and 
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE'
			USING	sqlca;
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',ldb_valor_uf)
				dw_aranceles.accepttext()
				dw_aranceles.setfocus()
				dw_aranceles.setcolumn('monto_otro_5')
			end if
		end if
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
	
elseif ls_columna='sw_pago_5' then
	ll_sw_pago_6		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_6')
	ls_pago_6			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_6')
	if not isnull(ls_pago_6) and ll_sw_pago_6 = 0 then
		ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
		ls_cod_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
		ls_cod_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_4')
		ls_cod_pago_5			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_5')
		if ls_cod_pago_1 = ls_cod_pago_6 or ls_cod_pago_2 = ls_cod_pago_6 or ls_cod_pago_3 = ls_cod_pago_6 or ls_cod_pago_4 = ls_cod_pago_6  or ls_cod_pago_5 = ls_cod_pago_6 then
			messagebox("Advertencia","Detalle Pago Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('pago_otro_6')
		else
			SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf 
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_6 and 
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE'
			USING	sqlca;
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',ldb_valor_uf)
				dw_aranceles.accepttext()
				dw_aranceles.setfocus()
				dw_aranceles.setcolumn('monto_otro_6')
			end if
		end if
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
	
elseif ls_columna='sw_pago_liberado' then
	dw_aranceles.accepttext()
	ll_sw_derecho						= long(data)
	if ll_sw_derecho=0 then
		ldb_monto_red					= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_otro_1')
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1','107')
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',ldb_monto_red)
		dw_aranceles.accepttext()
	else
//		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
//		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
//		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
		dw_aranceles.accepttext()
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
end if
if ls_columna='monto_otro_1' or ls_columna='monto_otro_2' or ls_columna='monto_otro_3' or ls_columna='monto_otro_4' or &
	ls_columna='monto_otro_5' or ls_columna='monto_otro_6' then

	wf_actualizar_calculo(dw_aranceles.getrow())
end if
if ls_columna='sw_pago_1' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_2' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	else
		ll_sw_pago_anterior		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
		ls_cod_pago_anterior		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		if ll_sw_pago_anterior = 1 then
			messagebox("Advertencia","Selección Incorrecta, debe ingresar Item Anterior")
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
			dw_aranceles.setcolumn('sw_pago_1')
		end if
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_3' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_4' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_5' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_6' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_6')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_1' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())

elseif ls_columna='sw_dscto_2' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())

elseif ls_columna='sw_dscto_3' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_4' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_5' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_6' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
end if
if ls_columna='dscto_otro_1' then
	ll_sw_pago_1		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
	ls_cod_pago_1		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
	if wf_validar_detalle_dscto(ls_cod_pago_1) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
		dw_aranceles.accepttext()
	else
		if not isnull(ls_cod_pago_1) then
			if ll_sw_pago_1 = 0 then
				dw_aranceles.setfocus()
				dw_aranceles.setcolumn('monto_dscto_1')
			else
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
			end if
			wf_actualizar_calculo(dw_aranceles.getrow())
		end if
	end if
elseif ls_columna='dscto_otro_2' then
	ll_sw_pago_1				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
	ls_cod_pago_1				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
	if wf_validar_detalle_dscto(ls_cod_pago_1) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
		dw_aranceles.accepttext()
	else
		if not isnull(ls_cod_pago_1) then
			ls_cod_pago_anterior		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
			ls_cod_pago					= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
			if ls_cod_pago_anterior = ls_cod_pago then
				messagebox("Advertencia","Detalle Descuento Duplicado")
				dw_aranceles.setfocus()
				dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
				dw_aranceles.accepttext()
				dw_aranceles.setcolumn('dscto_otro_2')
			else
				if ll_sw_pago_1 = 0 then
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_dscto_2')
				else
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
				end if
			end if
			wf_actualizar_calculo(dw_aranceles.getrow())
		end if
	end if
elseif ls_columna='dscto_otro_3' then
	ll_sw_pago_3				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
	ls_cod_pago_3				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
	if wf_validar_detalle_dscto(ls_cod_pago_3) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
		dw_aranceles.accepttext()
	else
		if not isnull(ls_cod_pago_3) then
			ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
			ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
			if ls_cod_pago_1 = ls_cod_pago_3 or ls_cod_pago_2 = ls_cod_pago_3 then
				messagebox("Advertencia","Detalle Descuento Duplicado")
				dw_aranceles.setfocus()
				dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
				dw_aranceles.accepttext()
				dw_aranceles.setcolumn('monto_dscto_3')
			else
				if ll_sw_pago_1 = 0 then
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_dscto_3')
				else
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
				end if
				wf_actualizar_calculo(dw_aranceles.getrow())
			end if
		end if
	end if
elseif ls_columna='dscto_otro_4' then
	ll_sw_pago_4				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
	ls_cod_pago_4				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_4')
	if wf_validar_detalle_dscto(ls_cod_pago_4) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.accepttext()
	else
		if not isnull(ls_cod_pago_4) then
			ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
			ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
			ls_cod_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
			if ls_cod_pago_1 = ls_cod_pago_4 or ls_cod_pago_2 = ls_cod_pago_4 or ls_cod_pago_3 = ls_cod_pago_4  then
				messagebox("Advertencia","Detalle Descuento Duplicado")
				dw_aranceles.setfocus()
				dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
				dw_aranceles.accepttext()
				dw_aranceles.setcolumn('monto_dscto_4')
			else
				if ll_sw_pago_1 = 0 then
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_dscto_4')
				else
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
				end if
				wf_actualizar_calculo(dw_aranceles.getrow())
			end if
		end if
	end if
elseif ls_columna='dscto_otro_5' then
	ll_sw_pago_5				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
	ls_cod_pago_5				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_5')
	if wf_validar_detalle_dscto(ls_cod_pago_5) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.accepttext()
	else
		if not isnull(ls_cod_pago_5) then
			ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
			ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
			ls_cod_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
			ls_cod_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_4')
			if ls_cod_pago_1 = ls_cod_pago_5 or ls_cod_pago_2 = ls_cod_pago_5 or ls_cod_pago_3 = ls_cod_pago_5 or ls_cod_pago_4 = ls_cod_pago_5  then
				messagebox("Advertencia","Detalle Descuento Duplicado")
				dw_aranceles.setfocus()
				dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
				dw_aranceles.accepttext()
				dw_aranceles.setcolumn('monto_dscto_5')
			else
				if ll_sw_pago_1 = 0 then
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_dscto_5')
				else
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
				end if
				wf_actualizar_calculo(dw_aranceles.getrow())
			end if
		end if
	end if
elseif ls_columna='dscto_otro_6' then
	ll_sw_pago_6				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
	ls_cod_pago_6				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_6')
	if wf_validar_detalle_dscto(ls_cod_pago_6) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
		dw_aranceles.accepttext()
	else
		if not isnull(ls_cod_pago_6) then
			ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
			ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
			ls_cod_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
			ls_cod_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_4')
			ls_cod_pago_5			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_5')
			if ls_cod_pago_1 = ls_cod_pago_6 or ls_cod_pago_2 = ls_cod_pago_6 or ls_cod_pago_3 = ls_cod_pago_6 or ls_cod_pago_4 = ls_cod_pago_6  or ls_cod_pago_5 = ls_cod_pago_6 then
				messagebox("Advertencia","Detalle Descuento Duplicado")
				dw_aranceles.setfocus()
				dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
				dw_aranceles.accepttext()
				dw_aranceles.setcolumn('dscto_otro_6')
			else
				if ll_sw_pago_1 = 0 then
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_dscto_6')
				else
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
				end if
				wf_actualizar_calculo(dw_aranceles.getrow())
			end if
		end if
	end if
end if
dw_aranceles.accepttext()
if ls_columna='monto_otro_1' or ls_columna='monto_otro_2' or ls_columna='monto_otro_3' or ls_columna='monto_otro_4' or ls_columna='monto_otro_5' or &
	ls_columna='monto_otro_6' or ls_columna='monto_dscto_1' or ls_columna='monto_dscto_2' or ls_columna='monto_dscto_3' or ls_columna='monto_dscto_4' or &
	ls_columna='monto_dscto_5' or ls_columna='monto_dscto_6' then
	
	ll_sw_dscto_1		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
	ll_sw_dscto_2		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
	ll_sw_dscto_3		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
	ll_sw_dscto_4		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
	ll_sw_dscto_5		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
	ll_sw_dscto_6		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
	ll_tot_desc			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'c_dscto_total_peso') * -1
	ll_tot_pago			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'c_total_otros')
	if ls_columna='monto_dscto_1' then
		ldb_dscto_1		= double(data)
		if (ldb_dscto_1 < 0 or ldb_dscto_1 > 1000) and ll_sw_dscto_1=0 then
			messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_1')
		elseif ll_tot_desc > ll_tot_pago then
			messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_1')
		end if
		il_modif1 ++
	elseif ls_columna='monto_dscto_2' then
		ldb_dscto_2		= double(data)
		if (ldb_dscto_2 < 0 or ldb_dscto_2 > 1000) and ll_sw_dscto_2=0 then
			messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_2')
		elseif ll_tot_desc > ll_tot_pago then
			messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_2')
		end if
		il_modif2 ++
	elseif ls_columna='monto_dscto_3' then
		ldb_dscto_3		= double(data)
		if (ldb_dscto_3 < 0 or ldb_dscto_3 > 1000) and ll_sw_dscto_3=0 then
			messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_3')
		elseif ll_tot_desc > ll_tot_pago then
			messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_3')
		end if
		il_modif3 ++
	elseif ls_columna='monto_dscto_4' then
		ldb_dscto_4		= double(data)
		if (ldb_dscto_4 < 0 or ldb_dscto_4 > 1000) and ll_sw_dscto_4=0 then
			messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_4')
		elseif ll_tot_desc > ll_tot_pago then
			messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_4')
		end if
		il_modif4 ++
	elseif ls_columna='monto_dscto_5' then
		ldb_dscto_5		= double(data)
		if (ldb_dscto_5 < 0 or ldb_dscto_5 > 1000) and ll_sw_dscto_5=0 then
			messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_5')
		elseif ll_tot_desc > ll_tot_pago then
			messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_5')
		end if
		il_modif5 ++
	elseif ls_columna='monto_dscto_6' then
		ldb_dscto_6		= double(data)
		if (ldb_dscto_6 < 0 or ldb_dscto_6 > 1000) and ll_sw_dscto_6=0 then
			messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_6')
		elseif ll_tot_desc > ll_tot_pago then
			messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_6')
		end if
		il_modif6 ++
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
end if
dw_aranceles.accepttext()
end event

event rowfocuschanged;Long	ll_row
ll_row	= getrow()
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

event clicked;Long		ll_row
ll_row						= row
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

event itemfocuschanged;String		ls_columna,ls_nulo,ls_cod_pago_1,ls_cod_pago_2,ls_cod_pago_3,ls_cod_pago_4,ls_cod_pago_5,ls_cod_pago_6,ls_cod_dscto_1,ls_cod_dscto_2,ls_cod_dscto_3,ls_cod_dscto_4,&
			ls_cod_dscto_5,ls_cod_dscto_6
Long		ll_sw_pago_1,ll_sw_pago_anterior,ll_sw_pago_2,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_5,ll_sw_pago_6,ll_sw_dscto_1,ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,&
			ll_sw_dscto_5,ll_sw_dscto_6,ll_tot_desc,ll_tot_pago
Double	ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,ldb_dscto_6
Setnull(ls_nulo)
dw_aranceles.accepttext()
ls_columna				= dwo.name
ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
ll_sw_pago_2			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2')
ll_sw_pago_3			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3')
ll_sw_pago_4			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4')
ll_sw_pago_5			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5')
ll_sw_pago_6			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_6')

ll_sw_dscto_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
ll_sw_dscto_2			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
ll_sw_dscto_3			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
ll_sw_dscto_4			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
ll_sw_dscto_5			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
ll_sw_dscto_6			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
if ll_sw_pago_1 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_2 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_3 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_4 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_5 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_6 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	
elseif ll_sw_dscto_1 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_2 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_3 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_4 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_5 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_6 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
end if
//wf_actualizar_calculo(dw_aranceles.getrow())
ls_cod_pago_1		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
ls_cod_pago_2		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
ls_cod_pago_3		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
ls_cod_pago_4		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_4')
ls_cod_pago_5		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_5')
ls_cod_pago_6		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_6')

ls_cod_dscto_1		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
ls_cod_dscto_2		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
ls_cod_dscto_3		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
ls_cod_dscto_4		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_4')
ls_cod_dscto_5		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_5')
ls_cod_dscto_6		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_6')

if ls_cod_pago_1 = ls_cod_pago_2 and not isnull(ls_cod_pago_1) and not isnull(ls_cod_pago_2) then
//	messagebox("Advertencia","Detalle Pago Duplicado")
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
elseif ls_cod_pago_1 = ls_cod_pago_3  and not isnull(ls_cod_pago_1) and not isnull(ls_cod_pago_3) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
elseif ls_cod_pago_1 = ls_cod_pago_4  and not isnull(ls_cod_pago_1) and not isnull(ls_cod_pago_4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
elseif ls_cod_pago_1 = ls_cod_pago_5  and not isnull(ls_cod_pago_1) and not isnull(ls_cod_pago_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
elseif ls_cod_pago_1 = ls_cod_pago_6  and not isnull(ls_cod_pago_1) and not isnull(ls_cod_pago_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
elseif ls_cod_pago_2 = ls_cod_pago_3  and not isnull(ls_cod_pago_2) and not isnull(ls_cod_pago_3) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
elseif ls_cod_pago_2 = ls_cod_pago_4  and not isnull(ls_cod_pago_2) and not isnull(ls_cod_pago_4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
elseif ls_cod_pago_2 = ls_cod_pago_5  and not isnull(ls_cod_pago_2) and not isnull(ls_cod_pago_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
elseif ls_cod_pago_2 = ls_cod_pago_6  and not isnull(ls_cod_pago_2) and not isnull(ls_cod_pago_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
elseif ls_cod_pago_3 = ls_cod_pago_4  and not isnull(ls_cod_pago_3) and not isnull(ls_cod_pago_4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
elseif ls_cod_pago_3 = ls_cod_pago_5  and not isnull(ls_cod_pago_3) and not isnull(ls_cod_pago_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
elseif ls_cod_pago_3 = ls_cod_pago_6  and not isnull(ls_cod_pago_3) and not isnull(ls_cod_pago_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
elseif ls_cod_pago_4 = ls_cod_pago_5  and not isnull(ls_cod_pago_4) and not isnull(ls_cod_pago_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
elseif ls_cod_pago_4 = ls_cod_pago_6  and not isnull(ls_cod_pago_4) and not isnull(ls_cod_pago_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
elseif ls_cod_pago_5 = ls_cod_pago_6  and not isnull(ls_cod_pago_5) and not isnull(ls_cod_pago_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
end if
if ll_sw_pago_1=0 and isnull(ls_cod_pago_1) and ls_columna <> 'sw_pago_1' and ls_columna <> 'pago_otro_1' and ls_columna <> 'monto_otro_1' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
elseif ll_sw_pago_2=0 and isnull(ls_cod_pago_2) and ls_columna <> 'sw_pago_2' and ls_columna <> 'pago_otro_2' and ls_columna <> 'monto_otro_2' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
elseif ll_sw_pago_3=0 and isnull(ls_cod_pago_3) and ls_columna <> 'sw_pago_3' and ls_columna <> 'pago_otro_3' and ls_columna <> 'monto_otro_3' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
elseif ll_sw_pago_4=0 and isnull(ls_cod_pago_4) and ls_columna <> 'sw_pago_4' and ls_columna <> 'pago_otro_4' and ls_columna <> 'monto_otro_4' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
elseif ll_sw_pago_5=0 and isnull(ls_cod_pago_5) and ls_columna <> 'sw_pago_5' and ls_columna <> 'pago_otro_5' and ls_columna <> 'monto_otro_5' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
elseif ll_sw_pago_6=0 and isnull(ls_cod_pago_6) and ls_columna <> 'sw_pago_6' and ls_columna <> 'pago_otro_6' and ls_columna <> 'monto_otro_6' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
	
elseif ls_cod_dscto_1 = ls_cod_dscto_2 and not isnull(ls_cod_dscto_1) and not isnull(ls_cod_dscto_2) then
//	messagebox("Advertencia","Detalle Pago Duplicado")
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
elseif ls_cod_dscto_1 = ls_cod_dscto_3  and not isnull(ls_cod_dscto_1) and not isnull(ls_cod_dscto_3) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
elseif ls_cod_dscto_1 = ls_cod_dscto_4  and not isnull(ls_cod_dscto_1) and not isnull(ls_cod_dscto_4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
elseif ls_cod_dscto_1 = ls_cod_dscto_5  and not isnull(ls_cod_dscto_1) and not isnull(ls_cod_dscto_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
elseif ls_cod_dscto_1 = ls_cod_dscto_6  and not isnull(ls_cod_dscto_1) and not isnull(ls_cod_dscto_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	
elseif ls_cod_dscto_2 = ls_cod_dscto_3  and not isnull(ls_cod_dscto_2) and not isnull(ls_cod_dscto_3) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
elseif ls_cod_dscto_2 = ls_cod_dscto_4  and not isnull(ls_cod_dscto_2) and not isnull(ls_cod_dscto_4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
elseif ls_cod_dscto_2 = ls_cod_dscto_5  and not isnull(ls_cod_dscto_2) and not isnull(ls_cod_dscto_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
elseif ls_cod_dscto_2 = ls_cod_dscto_6  and not isnull(ls_cod_dscto_2) and not isnull(ls_cod_dscto_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	
elseif ls_cod_dscto_3 = ls_cod_dscto_4  and not isnull(ls_cod_dscto_3) and not isnull(ls_cod_dscto_4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
elseif ls_cod_dscto_3 = ls_cod_dscto_5  and not isnull(ls_cod_dscto_3) and not isnull(ls_cod_dscto_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
elseif ls_cod_dscto_3 = ls_cod_dscto_6  and not isnull(ls_cod_dscto_3) and not isnull(ls_cod_dscto_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	
elseif ls_cod_dscto_4 = ls_cod_dscto_5  and not isnull(ls_cod_dscto_4) and not isnull(ls_cod_dscto_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
elseif ls_cod_dscto_4 = ls_cod_dscto_6  and not isnull(ls_cod_dscto_4) and not isnull(ls_cod_dscto_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	
elseif ls_cod_dscto_5 = ls_cod_dscto_6  and not isnull(ls_cod_dscto_5) and not isnull(ls_cod_dscto_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
end if

if ll_sw_pago_1=0 and isnull(ls_cod_pago_1) and ls_columna <> 'sw_pago_1' and ls_columna <> 'pago_otro_1' and ls_columna <> 'monto_otro_1' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
elseif ll_sw_pago_2=0 and isnull(ls_cod_pago_2) and ls_columna <> 'sw_pago_2' and ls_columna <> 'pago_otro_2' and ls_columna <> 'monto_otro_2' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
elseif ll_sw_pago_3=0 and isnull(ls_cod_pago_3) and ls_columna <> 'sw_pago_3' and ls_columna <> 'pago_otro_3' and ls_columna <> 'monto_otro_3' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
elseif ll_sw_pago_4=0 and isnull(ls_cod_pago_4) and ls_columna <> 'sw_pago_4' and ls_columna <> 'pago_otro_4' and ls_columna <> 'monto_otro_4' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
elseif ll_sw_pago_5=0 and isnull(ls_cod_pago_5) and ls_columna <> 'sw_pago_5' and ls_columna <> 'pago_otro_5' and ls_columna <> 'monto_otro_5' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
elseif ll_sw_pago_6=0 and isnull(ls_cod_pago_6) and ls_columna <> 'sw_pago_6' and ls_columna <> 'pago_otro_6' and ls_columna <> 'monto_otro_6' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
elseif ll_sw_dscto_1=0 and isnull(ls_cod_dscto_1) and ls_columna <> 'sw_dscto_1' and ls_columna <> 'dscto_otro_1' and ls_columna <> 'monto_dscto_1' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
elseif ll_sw_dscto_2=0 and isnull(ls_cod_dscto_2) and ls_columna <> 'sw_dscto_2' and ls_columna <> 'dscto_otro_2' and ls_columna <> 'monto_dscto_2' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
elseif ll_sw_dscto_3=0 and isnull(ls_cod_dscto_3) and ls_columna <> 'sw_dscto_3' and ls_columna <> 'dscto_otro_3' and ls_columna <> 'monto_dscto_3' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
elseif ll_sw_dscto_4=0 and isnull(ls_cod_dscto_4) and ls_columna <> 'sw_dscto_4' and ls_columna <> 'dscto_otro_4' and ls_columna <> 'monto_dscto_4' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
elseif ll_sw_dscto_5=0 and isnull(ls_cod_dscto_5) and ls_columna <> 'sw_dscto_5' and ls_columna <> 'dscto_otro_5' and ls_columna <> 'monto_dscto_5' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
elseif ll_sw_dscto_6=0 and isnull(ls_cod_dscto_6) and ls_columna <> 'sw_dscto_6' and ls_columna <> 'dscto_otro_6' and ls_columna <> 'monto_dscto_6' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
end if
dw_aranceles.accepttext()
ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
ll_sw_pago_2			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2')
ll_sw_pago_3			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3')
ll_sw_pago_4			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4')
ll_sw_pago_5			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5')
ll_sw_pago_6			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_6')

ll_sw_dscto_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
ll_sw_dscto_2			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
ll_sw_dscto_3			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
ll_sw_dscto_4			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
ll_sw_dscto_5			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
ll_sw_dscto_6			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
if ll_sw_pago_6 = 0 and ll_sw_pago_5=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
elseif ll_sw_pago_5 = 0 and ll_sw_pago_4=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
elseif ll_sw_pago_4 = 0 and ll_sw_pago_3=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
elseif ll_sw_pago_3 = 0 and ll_sw_pago_2=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
elseif ll_sw_pago_2 = 0 and ll_sw_pago_1=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
elseif ll_sw_dscto_6 = 0 and ll_sw_dscto_5=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
elseif ll_sw_dscto_5 = 0 and ll_sw_dscto_4=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
elseif ll_sw_dscto_4 = 0 and ll_sw_dscto_3=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
elseif ll_sw_dscto_3 = 0 and ll_sw_dscto_2=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
elseif ll_sw_dscto_2 = 0 and ll_sw_dscto_1=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
end if
dw_aranceles.accepttext()
ll_sw_dscto_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
ll_sw_dscto_2			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
ll_sw_dscto_3			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
ll_sw_dscto_4			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
ll_sw_dscto_5			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
ll_sw_dscto_6			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
ldb_dscto_1				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_1')
ldb_dscto_2				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_2')
ldb_dscto_3				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_3')
ldb_dscto_4				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_4')
ldb_dscto_5				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_5')
ldb_dscto_6				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_6')
ll_tot_desc				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'c_dscto_total_peso') * -1
ll_tot_pago				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'c_total_otros')

if (ldb_dscto_6 < 0 or ldb_dscto_6 > 1000) and ll_sw_dscto_6=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_6')
elseif ll_tot_desc > ll_tot_pago and (not isnull(ldb_dscto_6) or ldb_dscto_6<>0) and il_modif6 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_6')
	il_modif6				= 0
end if
dw_aranceles.accepttext()
if (ldb_dscto_5 < 0 or ldb_dscto_5 > 1000) and ll_sw_dscto_5=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_5')
elseif ll_tot_desc > ll_tot_pago and (not isnull(ldb_dscto_5) or ldb_dscto_5<>0) and il_modif5 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_5')
	il_modif5				= 0
end if
dw_aranceles.accepttext()
if (ldb_dscto_4 < 0 or ldb_dscto_4 > 1000) and ll_sw_dscto_4=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_4')
elseif ll_tot_desc > ll_tot_pago and (not isnull(ldb_dscto_4) or ldb_dscto_4<>0) and il_modif4 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_4')
	il_modif4				= 0
end if
dw_aranceles.accepttext()
if (ldb_dscto_3 < 0 or ldb_dscto_3 > 1000) and ll_sw_dscto_3=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_3')
elseif ll_tot_desc > ll_tot_pago and (not isnull(ldb_dscto_3) or ldb_dscto_3<>0) and il_modif3 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_3')
	il_modif3				= 0
end if
dw_aranceles.accepttext()
if (ldb_dscto_2 < 0 or ldb_dscto_2 > 1000) and ll_sw_dscto_2=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_2')
elseif ll_tot_desc > ll_tot_pago and (not isnull(ldb_dscto_2) or ldb_dscto_2<>0) and il_modif2 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_2')
	il_modif2				= 0
end if
dw_aranceles.accepttext()


if (ldb_dscto_1 < 0 or ldb_dscto_1 > 1000) and ll_sw_dscto_1=0 then
//	messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_1')
end if
if (ldb_dscto_2 < 0 or ldb_dscto_2 > 1000) and ll_sw_dscto_2=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_2')
end if
if (ldb_dscto_3 < 0 or ldb_dscto_3 > 1000) and ll_sw_dscto_3=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_3')
end if
if (ldb_dscto_4 < 0 or ldb_dscto_4 > 1000) and ll_sw_dscto_4=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_4')
end if
if (ldb_dscto_5 < 0 or ldb_dscto_5 > 1000) and ll_sw_dscto_5=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_5')
end if
if (ldb_dscto_6 < 0 or ldb_dscto_6 > 1000) and ll_sw_dscto_6=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_6')
end if
dw_aranceles.accepttext()

ls_cod_dscto_1		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
ls_cod_dscto_2		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
ls_cod_dscto_3		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
ls_cod_dscto_4		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_4')
ls_cod_dscto_5		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_5')
ls_cod_dscto_6		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_6')
if not isnull(ls_cod_dscto_1) then
	if wf_validar_detalle_dscto(ls_cod_dscto_1) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
	end if
end if
if not isnull(ls_cod_dscto_2) then
	if wf_validar_detalle_dscto(ls_cod_dscto_2) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	end if
end if
if not isnull(ls_cod_dscto_3) then
	if wf_validar_detalle_dscto(ls_cod_dscto_3) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	end if
end if
if not isnull(ls_cod_dscto_4) then
	if wf_validar_detalle_dscto(ls_cod_dscto_4) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	end if
end if
if not isnull(ls_cod_dscto_5) then
	if wf_validar_detalle_dscto(ls_cod_dscto_5) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	end if
end if
if not isnull(ls_cod_dscto_6) then
	if wf_validar_detalle_dscto(ls_cod_dscto_6) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
end if
dw_aranceles.accepttext()
wf_actualizar_calculo(dw_aranceles.getrow())	
dw_aranceles.accepttext()
end event

type cb_cerrar from commandbutton within w_ingreso_ficha_reduccion
integer x = 3483
integer y = 2512
integer width = 315
integer height = 100
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_ficha_reduccion)
end event

type gb_1 from groupbox within w_ingreso_ficha_reduccion
integer x = 2843
integer y = 2460
integer width = 553
integer height = 168
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_ingreso_ficha_reduccion
integer x = 846
integer y = 2460
integer width = 777
integer height = 168
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

