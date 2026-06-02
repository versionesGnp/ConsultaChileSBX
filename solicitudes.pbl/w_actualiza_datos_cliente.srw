forward
global type w_actualiza_datos_cliente from window
end type
type p_fecha from picture within w_actualiza_datos_cliente
end type
type em_pobla from editmask within w_actualiza_datos_cliente
end type
type st_19 from statictext within w_actualiza_datos_cliente
end type
type st_18 from statictext within w_actualiza_datos_cliente
end type
type st_17 from statictext within w_actualiza_datos_cliente
end type
type st_16 from statictext within w_actualiza_datos_cliente
end type
type st_15 from statictext within w_actualiza_datos_cliente
end type
type st_14 from statictext within w_actualiza_datos_cliente
end type
type st_13 from statictext within w_actualiza_datos_cliente
end type
type st_12 from statictext within w_actualiza_datos_cliente
end type
type st_11 from statictext within w_actualiza_datos_cliente
end type
type st_10 from statictext within w_actualiza_datos_cliente
end type
type st_9 from statictext within w_actualiza_datos_cliente
end type
type st_8 from statictext within w_actualiza_datos_cliente
end type
type st_7 from statictext within w_actualiza_datos_cliente
end type
type st_6 from statictext within w_actualiza_datos_cliente
end type
type st_5 from statictext within w_actualiza_datos_cliente
end type
type st_nom_comp from statictext within w_actualiza_datos_cliente
end type
type st_rut from statictext within w_actualiza_datos_cliente
end type
type st_2 from statictext within w_actualiza_datos_cliente
end type
type cb_cerrar from commandbutton within w_actualiza_datos_cliente
end type
type cb_grabar from commandbutton within w_actualiza_datos_cliente
end type
type em_dire_part from editmask within w_actualiza_datos_cliente
end type
type em_comuna from editmask within w_actualiza_datos_cliente
end type
type em_sector from editmask within w_actualiza_datos_cliente
end type
type em_ciudad from editmask within w_actualiza_datos_cliente
end type
type em_fono_part from editmask within w_actualiza_datos_cliente
end type
type em_celular from editmask within w_actualiza_datos_cliente
end type
type em_otro_fono from editmask within w_actualiza_datos_cliente
end type
type em_dire_comer from editmask within w_actualiza_datos_cliente
end type
type em_fono_comer from editmask within w_actualiza_datos_cliente
end type
type em_otro_fono_comer from editmask within w_actualiza_datos_cliente
end type
type em_fec_nac from editmask within w_actualiza_datos_cliente
end type
type em_renta from editmask within w_actualiza_datos_cliente
end type
type em_grupo_fam from editmask within w_actualiza_datos_cliente
end type
type em_est_civil from editmask within w_actualiza_datos_cliente
end type
type gb_1 from groupbox within w_actualiza_datos_cliente
end type
end forward

global type w_actualiza_datos_cliente from window
integer width = 2569
integer height = 1604
boolean titlebar = true
string title = "Actualizar Antecedente del Cliente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
p_fecha p_fecha
em_pobla em_pobla
st_19 st_19
st_18 st_18
st_17 st_17
st_16 st_16
st_15 st_15
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_nom_comp st_nom_comp
st_rut st_rut
st_2 st_2
cb_cerrar cb_cerrar
cb_grabar cb_grabar
em_dire_part em_dire_part
em_comuna em_comuna
em_sector em_sector
em_ciudad em_ciudad
em_fono_part em_fono_part
em_celular em_celular
em_otro_fono em_otro_fono
em_dire_comer em_dire_comer
em_fono_comer em_fono_comer
em_otro_fono_comer em_otro_fono_comer
em_fec_nac em_fec_nac
em_renta em_renta
em_grupo_fam em_grupo_fam
em_est_civil em_est_civil
gb_1 gb_1
end type
global w_actualiza_datos_cliente w_actualiza_datos_cliente

type variables
String	is_dv, is_nombre, is_a_pat,is_a_mat,is_direc_p,is_pob,is_sector,&
			is_comuna,is_ciudad,is_fono_p,is_celular,is_fono_c,is_domic_c,is_est_civil,&
			is_otro_fono_p,is_otro_fono_c,is_base,is_serie,is_tipo_sol,is_tipo_via,&
			is_nro_part,is_depto_part,is_block_part
Long		il_rut,il_tot_renta,il_grupo_f,il_sw=0,il_numero,il_correlativo
Date		id_fec_nac,idt_fecha_hoy
end variables

forward prototypes
public subroutine wf_grabar ()
end prototypes

public subroutine wf_grabar ();String	ls_dir_p,ls_pob,ls_sector,ls_com,ls_ciu,ls_fono_p,ls_est_civil,ls_dir_com,ls_fono_com
Long		ll_renta,ll_grupo_f
Date		ld_fec_nac
if isvalid(w_mantencion_fromulario_solicitudes) then
	ls_dir_p			= trim(em_dire_part.text)
	ls_pob			= trim(em_pobla.text)
	ls_sector		= trim(em_sector.text)
	ls_com			= trim(em_comuna.text)
	ls_ciu			= trim(em_ciudad.text)
	ls_fono_p		= trim(em_fono_part.text)
	ls_est_civil	= trim(em_est_civil.text)
	ls_dir_com		= trim(em_dire_comer.text)
	ls_fono_com		= trim(em_fono_comer.text)
	ll_renta			= long(em_renta.text)
	ll_grupo_f		= long(em_grupo_fam)
	ld_fec_nac		= date(em_fec_nac.text)
	CHOOSE CASE is_tipo_sol
		CASE "1"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_otro_fono_c',trim(em_otro_fono_comer.text))			
			
		CASE "2"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_otro_fono_c',trim(em_otro_fono_comer.text))			
			
		CASE "3"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_otro_fono_c',trim(em_otro_fono_comer.text))

		CASE "4"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_otro_fono_c',trim(em_otro_fono_comer.text))

		CASE "5"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_otro_fono_c',trim(em_otro_fono_comer.text))
			
		CASE "6"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_otro_fono_c',trim(em_otro_fono_comer.text))
			
		CASE "7"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_otro_fono_c',trim(em_otro_fono_comer.text))
			
		CASE "8"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_otro_fono_c',trim(em_otro_fono_comer.text))
			
		CASE "10"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_otro_fono_c',trim(em_otro_fono_comer.text))
			
		CASE "11"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_otro_fono_c',trim(em_otro_fono_comer.text))
		
		CASE "13"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_otro_fono_c',trim(em_otro_fono_comer.text))
		
		CASE "15"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_otro_fono_c',trim(em_otro_fono_comer.text))
			
		CASE "16"
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_direccion_p',ls_dir_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_poblacion',ls_pob)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_sector',ls_sector)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_comuna',ls_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_ciudad',ls_ciu)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_fono_p',ls_fono_p)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_otro_fono_p',trim(em_otro_fono.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_domicilio_c',ls_dir_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_fono_c',ls_fono_com)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_fecha_nac',ld_fec_nac)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_total_renta',ll_renta)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_grupo_f',ll_grupo_f)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_estado_civil',ls_est_civil)
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_celular',trim(em_celular.text))
			w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_otro_fono_c',trim(em_otro_fono_comer.text))
	END CHOOSE
	UPDATE	"CLIENTE"  
	SET 		"DIRECCION_P" = :ls_dir_p,   
				"POBLACION" = :ls_pob,   
				"SECTOR" = :ls_sector,   
				"COMUNA" = :ls_com,   
				"CIUDAD" = :ls_ciu,   
				"FONO_P" = :ls_fono_p,   
				"FECHA_NAC" = :ld_fec_nac,   
				"ESTA_CIVIL" = :ls_est_civil,   
				"DOMICILIO_C" = :ls_dir_com,   
				"FONO_C" = :ls_fono_com,   
				"TOTAL_RENT" = :ll_renta,   
				"GRUPO_F" = :ll_grupo_f  
	WHERE 	"CLIENTE"."RUT" = :il_rut   
	USING		sqlca  ;
	if sqlca.sqlcode=0 then
		commit;
		il_sw	= 0
	else
		rollback;
		messagebox("Error al Grabar","Error SQL "+sqlca.sqlerrtext)
	end if
end if
end subroutine

on w_actualiza_datos_cliente.create
this.p_fecha=create p_fecha
this.em_pobla=create em_pobla
this.st_19=create st_19
this.st_18=create st_18
this.st_17=create st_17
this.st_16=create st_16
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_nom_comp=create st_nom_comp
this.st_rut=create st_rut
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.em_dire_part=create em_dire_part
this.em_comuna=create em_comuna
this.em_sector=create em_sector
this.em_ciudad=create em_ciudad
this.em_fono_part=create em_fono_part
this.em_celular=create em_celular
this.em_otro_fono=create em_otro_fono
this.em_dire_comer=create em_dire_comer
this.em_fono_comer=create em_fono_comer
this.em_otro_fono_comer=create em_otro_fono_comer
this.em_fec_nac=create em_fec_nac
this.em_renta=create em_renta
this.em_grupo_fam=create em_grupo_fam
this.em_est_civil=create em_est_civil
this.gb_1=create gb_1
this.Control[]={this.p_fecha,&
this.em_pobla,&
this.st_19,&
this.st_18,&
this.st_17,&
this.st_16,&
this.st_15,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_nom_comp,&
this.st_rut,&
this.st_2,&
this.cb_cerrar,&
this.cb_grabar,&
this.em_dire_part,&
this.em_comuna,&
this.em_sector,&
this.em_ciudad,&
this.em_fono_part,&
this.em_celular,&
this.em_otro_fono,&
this.em_dire_comer,&
this.em_fono_comer,&
this.em_otro_fono_comer,&
this.em_fec_nac,&
this.em_renta,&
this.em_grupo_fam,&
this.em_est_civil,&
this.gb_1}
end on

on w_actualiza_datos_cliente.destroy
destroy(this.p_fecha)
destroy(this.em_pobla)
destroy(this.st_19)
destroy(this.st_18)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_nom_comp)
destroy(this.st_rut)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.em_dire_part)
destroy(this.em_comuna)
destroy(this.em_sector)
destroy(this.em_ciudad)
destroy(this.em_fono_part)
destroy(this.em_celular)
destroy(this.em_otro_fono)
destroy(this.em_dire_comer)
destroy(this.em_fono_comer)
destroy(this.em_otro_fono_comer)
destroy(this.em_fec_nac)
destroy(this.em_renta)
destroy(this.em_grupo_fam)
destroy(this.em_est_civil)
destroy(this.gb_1)
end on

event open;String		ls_est_reg
Long		ll_sum_est, ll_est_ope, ll_est_inf
gf_centrar(w_actualiza_datos_cliente)
idt_fecha_hoy							= date(gdt_fec_sistema)
is_a_pat									= trim(substr(1,1,Message.StringParm))
is_a_mat									= trim(substr(1,2,Message.StringParm))
is_nombre								= trim(substr(1,3,Message.StringParm))
il_rut									= long(trim(substr(1,4,Message.StringParm)))
is_dv										= trim(substr(1,5,Message.StringParm))
is_direc_p								= trim(substr(1,6,Message.StringParm))
is_pob									= trim(substr(1,7,Message.StringParm))
is_sector								= trim(substr(1,8,Message.StringParm))
is_comuna								= trim(substr(1,9,Message.StringParm))
is_ciudad								= trim(substr(1,10,Message.StringParm))
is_fono_p								= trim(substr(1,11,Message.StringParm))
is_otro_fono_p							= trim(substr(1,12,Message.StringParm))
is_domic_c								= trim(substr(1,13,Message.StringParm))
is_fono_c								= trim(substr(1,14,Message.StringParm))
id_fec_nac								= date(trim(substr(1,15,Message.StringParm)))
il_tot_renta							= long(trim(substr(1,16,Message.StringParm)))
il_grupo_f								= long(trim(substr(1,17,Message.StringParm)))
is_est_civil							= trim(substr(1,18,Message.StringParm))
is_celular								= trim(substr(1,19,Message.StringParm))
is_otro_fono_c							= trim(substr(1,20,Message.StringParm))
is_base									= trim(substr(1,21,Message.StringParm))
is_serie									= trim(substr(1,22,Message.StringParm))
il_numero								= Double(trim(substr(1,23,Message.StringParm)))
is_tipo_sol								= trim(substr(1,24,Message.StringParm))
il_correlativo							= long(trim(substr(1,25,Message.StringParm)))
ls_est_reg								= trim(substr(1,26,Message.StringParm))
ll_est_ope								= long(trim(substr(1,27,Message.StringParm)))
ll_est_inf								= long(trim(substr(1,28,Message.StringParm)))
is_tipo_via								= trim(substr(1,29,Message.StringParm))
is_nro_part								= trim(substr(1,30,Message.StringParm))
is_depto_part							= trim(substr(1,31,Message.StringParm))
is_block_part							= trim(substr(1,32,Message.StringParm))
st_rut.text								= string(il_rut,"###,###,###,##0")+' - '+is_dv
st_nom_comp.text						= is_a_pat+' '+is_a_mat+' '+is_nombre
em_dire_part.text						= trim(is_direc_p)
em_pobla.text							= trim(is_pob)
em_sector.text							= trim(is_sector)
em_comuna.text							= trim(is_comuna)
em_ciudad.text							= trim(is_ciudad)
em_fono_part.text						= trim(is_fono_p)
em_celular.text						= trim(is_celular)
em_otro_fono.text						= trim(is_otro_fono_p)
em_dire_comer.text					= trim(is_domic_c)
em_fono_comer.text					= trim(is_fono_c)
em_otro_fono_comer.text				= trim(is_otro_fono_c)
if not isnull(id_fec_nac) and id_fec_nac<>date('01/01/1900') and id_fec_nac<>date('00/00/0000') then em_fec_nac.text = string(id_fec_nac,"dd/mm/yyyy")
em_renta.text							= string(il_tot_renta)
em_grupo_fam.text						= string(il_grupo_f)
em_est_civil.text						= trim(is_est_civil)
if ls_est_reg='I' then
	em_dire_part.enabled				= false
	em_pobla.enabled					= false
	em_sector.enabled					= false
	em_comuna.enabled					= false
	em_ciudad.enabled					= false
	em_fono_part.enabled				= false
	em_celular.enabled				= false
	em_otro_fono.enabled				= false
	em_dire_comer.enabled			= false
	em_fono_comer.enabled			= false
	em_otro_fono_comer.enabled		= false
	em_fec_nac.enabled				= false
	em_renta.enabled					= false
	em_grupo_fam.enabled				= false
	em_est_civil.enabled				= false
	cb_grabar.enabled					= false
else
	st_rut.enabled						= true
	st_nom_comp.enabled				= true
	em_dire_part.enabled				= true
	em_pobla.enabled					= true
	em_sector.enabled					= true
	em_comuna.enabled					= true
	em_ciudad.enabled					= true
	em_fono_part.enabled				= true
	em_celular.enabled				= true
	em_otro_fono.enabled				= true
	em_dire_comer.enabled			= true
	em_fono_comer.enabled			= true
	em_otro_fono_comer.enabled		= true
	em_fec_nac.enabled				= true
	em_renta.enabled					= true
	em_grupo_fam.enabled				= true
	em_est_civil.enabled				= true
	cb_grabar.enabled					= true
	if ll_est_inf=0  then
		cb_grabar.enabled				= false
		em_dire_part.enabled			= false
		em_pobla.enabled				= false
		em_sector.enabled				= false
		em_comuna.enabled				= false
		em_ciudad.enabled				= false
		em_fono_part.enabled			= false
		em_celular.enabled			= false
		em_otro_fono.enabled			= false
		em_dire_comer.enabled		= false
		em_fono_comer.enabled		= false
		em_otro_fono_comer.enabled	= false
		em_fec_nac.enabled			= false
		em_renta.enabled				= false
		em_grupo_fam.enabled			= false
		em_est_civil.enabled			= false
	else
		cb_grabar.enabled				= true
	end if
end if
gs_ventana	= 'w_actualiza_datos_cliente'
f_valida_objeto()
end event

type p_fecha from picture within w_actualiza_datos_cliente
integer x = 818
integer y = 1052
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha
ls_fecha	= string(date(em_fec_nac.text))
if isnull(ls_fecha) then ls_fecha = string(idt_fecha_hoy,"dd/mm/yyyy")
if f_valida_fecha(ls_fecha)=-1 then 
	em_fec_nac.text	= string(idt_fecha_hoy,gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,ls_fecha)
IF not isnull(Message.StringParm) THEN
	ls_fecha				= trim(Message.StringParm)
	em_fec_nac.text	= ls_fecha
END IF

end event

type em_pobla from editmask within w_actualiza_datos_cliente
integer x = 375
integer y = 384
integer width = 859
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if trim(this.text)<>is_pob then
	if trim(this.text)='' then
		messagebox("Advertencia","Población Invalida")
		this.text	= is_pob
		This.setfocus()
	else
		if trim(this.text)<>is_pob then	il_sw	= 1
	end if
end if
end event

type st_19 from statictext within w_actualiza_datos_cliente
integer x = 73
integer y = 1180
integer width = 283
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Est.Civil:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_18 from statictext within w_actualiza_datos_cliente
integer x = 1637
integer y = 1064
integer width = 311
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupo Fam.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_17 from statictext within w_actualiza_datos_cliente
integer x = 864
integer y = 1064
integer width = 215
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Renta:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_16 from statictext within w_actualiza_datos_cliente
integer x = 73
integer y = 1064
integer width = 283
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Nac.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_15 from statictext within w_actualiza_datos_cliente
integer x = 1253
integer y = 948
integer width = 270
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Otro Fono:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_14 from statictext within w_actualiza_datos_cliente
integer x = 64
integer y = 948
integer width = 293
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fono Com.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_13 from statictext within w_actualiza_datos_cliente
integer x = 87
integer y = 808
integer width = 270
integer height = 116
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dirección Comercial"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_12 from statictext within w_actualiza_datos_cliente
integer x = 1637
integer y = 620
integer width = 288
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Otro Fono:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_11 from statictext within w_actualiza_datos_cliente
integer x = 864
integer y = 620
integer width = 215
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Celular:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_10 from statictext within w_actualiza_datos_cliente
integer x = 82
integer y = 620
integer width = 274
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fono Part.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_9 from statictext within w_actualiza_datos_cliente
integer x = 1307
integer y = 508
integer width = 215
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ciudad:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_actualiza_datos_cliente
integer x = 82
integer y = 508
integer width = 274
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comuna:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_7 from statictext within w_actualiza_datos_cliente
integer x = 1307
integer y = 396
integer width = 215
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sector:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_actualiza_datos_cliente
integer x = 82
integer y = 396
integer width = 274
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Población:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_actualiza_datos_cliente
integer x = 82
integer y = 260
integer width = 274
integer height = 116
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dirección Particular"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_nom_comp from statictext within w_actualiza_datos_cliente
integer x = 809
integer y = 172
integer width = 1664
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_rut from statictext within w_actualiza_datos_cliente
integer x = 361
integer y = 172
integer width = 421
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_actualiza_datos_cliente
integer x = 101
integer y = 168
integer width = 233
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cliente:"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_actualiza_datos_cliente
integer x = 2144
integer y = 1376
integer width = 343
integer height = 100
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;long	ll_resp
if il_sw	= 1 then
	ll_resp	= messagebox("Advertencia","Desea Grabar los Cambios",Exclamation!,YesNo!,2)
	if ll_resp=1 then
		wf_grabar()
	end if
end if
close(w_actualiza_datos_cliente)
end event

type cb_grabar from commandbutton within w_actualiza_datos_cliente
integer x = 37
integer y = 1376
integer width = 343
integer height = 100
integer taborder = 160
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_dir_p,ls_pob,ls_sector,ls_com,ls_ciu,ls_fono_p,ls_est_civil,ls_dir_com,ls_fono_com,&
			ls_otro_fono,ls_celular,ls_otro_fono_c
Long		ll_renta,ll_grupo_f
Date		ld_fec_nac
if isvalid(w_mantencion_fromulario_solicitudes) then
	
	if trim(em_dire_part.text)='' or isnull(em_dire_part.text) then em_dire_part.text='-'
	if trim(em_pobla.text)='' or isnull(em_pobla.text) then em_pobla.text='-'
	if trim(em_sector.text)='' or isnull(em_sector.text) then em_sector.text='-'
	if trim(em_comuna.text)='' or isnull(em_comuna.text) then em_comuna.text='-'
	if trim(em_ciudad.text)='' or isnull(em_ciudad.text) then em_ciudad.text='-'
	if trim(em_fono_part.text)='' or isnull(em_fono_part.text) then em_fono_part.text='-'
	if trim(em_est_civil.text)='' or isnull(em_est_civil.text) then em_est_civil.text='-'
	if trim(em_dire_comer.text)='' or isnull(em_dire_comer.text) then em_dire_comer.text='-'
	if trim(em_fono_comer.text)='' or isnull(em_fono_comer.text) then em_fono_comer.text='-'
	if trim(em_renta.text)='' or isnull(em_renta.text) then em_renta.text='0'
	if trim(em_grupo_fam.text)='' or isnull(em_grupo_fam.text) then em_grupo_fam.text='0'
	if trim(em_otro_fono.text)='' or isnull(em_otro_fono.text) then em_otro_fono.text='-'
	if trim(em_celular.text)='' or isnull(em_celular.text) then em_celular.text='-'
	if trim(em_otro_fono_comer.text)='' or isnull(em_otro_fono_comer.text) then em_otro_fono_comer.text='-'
	
	ls_dir_p			= trim(em_dire_part.text)
	ls_pob			= trim(em_pobla.text)
	ls_sector		= trim(em_sector.text)
	ls_com			= trim(em_comuna.text)
	ls_ciu			= trim(em_ciudad.text)
	ls_fono_p		= trim(em_fono_part.text)
	ls_est_civil	= trim(em_est_civil.text)
	ls_dir_com		= trim(em_dire_comer.text)
	ls_fono_com		= trim(em_fono_comer.text)
	ll_renta			= long(em_renta.text)
	ll_grupo_f		= long(em_grupo_fam.text)
	ld_fec_nac		= date(em_fec_nac.text)
	ls_otro_fono	= trim(em_otro_fono.text)
	ls_celular		= trim(em_celular.text)
	ls_otro_fono_c	= trim(em_otro_fono_comer.text)
		
	if is_direc_p=ls_dir_p and is_pob=ls_pob and is_sector=ls_sector and &
		is_comuna=ls_com and is_ciudad=ls_ciu and is_fono_p=ls_fono_p and &
		is_otro_fono_p=ls_otro_fono and is_domic_c=ls_dir_com and is_fono_c=ls_fono_com and &
		id_fec_nac=ld_fec_nac and il_tot_renta=ll_renta and il_grupo_f=ll_grupo_f and &
		is_est_civil=ls_est_civil and is_celular=ls_celular and is_otro_fono_c=ls_otro_fono_c then
		messagebox("Advertencia","No Registra Cambio de Antecedente")	
	else	
		CHOOSE CASE is_tipo_sol
			CASE "1" //resciliacion por parte del cliente
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_cliente_mod_ant_cliente','S')
			
				UPDATE	"SOL_RESCILIA_CLIENTE"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_RESCILIA_CLIENTE"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
			CASE "2" //resciliacion por reprogramacion
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_rescilia_reprog_mod_ant_cliente','S')
			
				UPDATE	"SOL_RESCILIA_REPROG"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_RESCILIA_REPROG"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
			CASE "3" // reactivacion ctto resuelto
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_reactiva_mod_ant_cliente','S')
			
				UPDATE	"SOL_REACTIVA"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_REACTIVA"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
			CASE "4" // SEGURO DESGRAVAMEN
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_desg_mod_ant_cliente','S')
			
				UPDATE	"SOL_SEGURO_DESG"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_SEGURO_DESG"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if	
				
			CASE "5" // repactacion compraventa
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_repacta_cvta_mod_ant_cliente','S')
			
				UPDATE	"SOL_REPACTA_CVTA"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_REPACTA_CVTA"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if	
				
			CASE "6" // titulo de dominio
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_tit_dominio_mod_ant_cliente','S')
			
				UPDATE	"SOL_TIT_DOMINIO"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_TIT_DOMINIO"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
			CASE "7" // contrato definitivo
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_contrato_def_mod_ant_cliente','S')
			
				UPDATE	"SOL_CONTRATO_DEF"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_CONTRATO_DEF"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
			CASE "8" // entrega pagare
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_entrega_pag_mod_ant_cliente','S')
			
				UPDATE	"SOL_ENTREGA_PAG"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_ENTREGA_PAG"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
			CASE "10" // transferencia
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_transferencia_mod_ant_cliente','S')
			
				UPDATE	"SOL_TRANSFERENCIA"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_TRANSFERENCIA"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
			CASE "11" // resolucion
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_resolucion_mod_ant_cliente','S')
			
				UPDATE	"SOL_RESOLUCION"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_RESOLUCION"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
			CASE "13" //cambio estado
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_cambio_estado_mod_ant_cliente','S')
			
				UPDATE	"SOL_CAMBIO_ESTADO"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_CAMBIO_ESTADO"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
			CASE "15" //seguro
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_mod_ant_cliente','S')
			
				UPDATE	"SOL_SEGURO"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_SEGURO"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			
			CASE "16" // Novacion
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_direccion_p',ls_dir_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_poblacion',ls_pob)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_sector',ls_sector)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_comuna',ls_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_ciudad',ls_ciu)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_fono_p',ls_fono_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_otro_fono_p',ls_otro_fono)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_domicilio_c',ls_dir_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_fono_c',ls_fono_com)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_fecha_nac',ld_fec_nac)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_total_renta',ll_renta)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_grupo_f',ll_grupo_f)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_estado_civil',ls_est_civil)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_celular',ls_celular)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_otro_fono_c',ls_otro_fono_c)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_novacion_mod_ant_cliente','S')
			
				UPDATE	"SOL_NOVACION"  
				SET 		"MOD_ANT_CLIENTE" = 'S',
							"DIRECCION_P" = :ls_dir_p,
							"POBLACION" = :ls_pob,
							"SECTOR" = :ls_sector,
							"COMUNA" = :ls_com,
							"CIUDAD" = :ls_ciu,
							"FONO_P" = :ls_fono_p,
							"OTRO_FONO_P" = :ls_fono_p,
							"DOMICILIO_C" = :ls_dir_com,
							"FONO_C" = :ls_fono_com,
							"FECHA_NAC" = :ld_fec_nac,
							"TOTAL_RENTA" = :ll_renta,
							"GRUPO_F" = :ll_grupo_f,
							"ESTADO_CIVIL" = :ls_est_civil,
							"CELULAR" = :ls_celular,
							"OTRO_FONO_C" = :ls_otro_fono_c
				WHERE 	"SOL_NOVACION"."CORRELATIVO" = ( SELECT  "SOL_ESTATUS"."CORRELATIVO"  
																		FROM 	  "SOL_ESTATUS"  
																		WHERE	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
																				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
																				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
																				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
																				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) ) 
				Using		sqlca ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
		END CHOOSE
		if isvalid(w_detalle_solicitudes) then
			w_detalle_solicitudes.dw_reporte.retrieve(is_base,is_serie,il_numero,is_tipo_sol)
		end if
		messagebox("Grabar","Grabación Exitosa")
		il_sw	= 0
		close(w_actualiza_datos_cliente)
	end if
end if
end event

type em_dire_part from editmask within w_actualiza_datos_cliente
integer x = 375
integer y = 272
integer width = 2053
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if trim(this.text)<>is_direc_p then
	if trim(this.text)='' then
		messagebox("Advertencia","Direccion Particular Invalida")
		this.text	= is_direc_p
		This.setfocus()
	else
		if trim(this.text)<>is_direc_p then	il_sw	= 1
	end if
end if
end event

type em_comuna from editmask within w_actualiza_datos_cliente
integer x = 375
integer y = 496
integer width = 859
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if trim(this.text)<>is_comuna then
	if trim(this.text)='' then
		messagebox("Advertencia","Comuna Invalida")
		this.text	= is_comuna
		This.setfocus()
	else
		if trim(this.text)<>is_comuna then il_sw = 1
	end if
end if
end event

type em_sector from editmask within w_actualiza_datos_cliente
integer x = 1536
integer y = 384
integer width = 891
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if trim(this.text)<>is_sector then
	if trim(this.text)='' then
		messagebox("Advertencia","Sector Invalida")
		this.text	= is_sector
		This.setfocus()
	else
		if trim(this.text)<>is_sector then	il_sw	= 1
	end if
end if
end event

type em_ciudad from editmask within w_actualiza_datos_cliente
integer x = 1536
integer y = 496
integer width = 891
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!"
end type

event modified;if trim(this.text)<>is_ciudad then
	if trim(this.text)='' then
		messagebox("Advertencia","Ciudad Invalida")
		this.text	= is_ciudad
		This.setfocus()
	else
		if trim(this.text)<>is_ciudad then il_sw = 1
	end if
end if
end event

type em_fono_part from editmask within w_actualiza_datos_cliente
integer x = 375
integer y = 608
integer width = 448
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if trim(this.text)<>is_fono_p then
	if trim(this.text)='' then
		messagebox("Advertencia","Fono Particular Invalida")
		this.text	= is_fono_p
		This.setfocus()
	else
		if trim(this.text)<>is_fono_p then	il_sw	= 1
	end if
end if
end event

type em_celular from editmask within w_actualiza_datos_cliente
integer x = 1097
integer y = 608
integer width = 480
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if trim(this.text)<>is_celular then
	if trim(this.text)='' then
		messagebox("Advertencia","Celular Invalida")
		this.text	= is_celular
		This.setfocus()
	else
		if trim(this.text)<>is_celular then	il_sw	= 1
	end if
end if
end event

type em_otro_fono from editmask within w_actualiza_datos_cliente
integer x = 1947
integer y = 608
integer width = 480
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if trim(this.text)<>is_otro_fono_p then
	if trim(this.text)='' then
		messagebox("Advertencia","Fono Invalida")
		this.text	= is_otro_fono_p
		This.setfocus()
	else
		if trim(this.text)<>is_otro_fono_p then il_sw = 1
	end if
end if
end event

type em_dire_comer from editmask within w_actualiza_datos_cliente
integer x = 375
integer y = 820
integer width = 2053
integer height = 88
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if trim(this.text)<>is_domic_c then
	if trim(this.text)='' then
		messagebox("Advertencia","Dirección Comercial Invalida")
		this.text	= is_domic_c
		This.setfocus()
	else
		if trim(this.text)<>is_domic_c then il_sw = 1
	end if
end if
end event

type em_fono_comer from editmask within w_actualiza_datos_cliente
integer x = 375
integer y = 936
integer width = 859
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if trim(this.text)<>is_fono_c then
	if trim(this.text)='' then
		messagebox("Advertencia","Fono Comercial Invalido")
		this.text	= is_fono_c
		This.setfocus()
	else
		if trim(this.text)<>is_fono_c then il_sw = 1
	end if
end if
end event

type em_otro_fono_comer from editmask within w_actualiza_datos_cliente
integer x = 1536
integer y = 936
integer width = 891
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if trim(this.text)<>is_otro_fono_c then
	if trim(this.text)='' then
		messagebox("Advertencia","Fono Comercial Invalido")
		this.text	= is_otro_fono_c
		This.setfocus()
	else
		if trim(this.text)<>is_otro_fono_c then il_sw = 1
	end if
end if
end event

type em_fec_nac from editmask within w_actualiza_datos_cliente
integer x = 375
integer y = 1052
integer width = 434
integer height = 88
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;if date(this.text)<>id_fec_nac then
	if trim(this.text)='' then
		messagebox("Advertencia","Fecha Nacimiento Invalida")
		this.text	= string(id_fec_nac,"dd/mm/yyyy")
		This.setfocus()
	else
		if date(this.text)<>id_fec_nac then il_sw = 1
	end if
end if
end event

type em_renta from editmask within w_actualiza_datos_cliente
integer x = 1097
integer y = 1052
integer width = 480
integer height = 88
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,##0"
end type

event modified;if long(this.text)<>il_tot_renta then
	if trim(this.text)='' or long(trim(this.text))<0 then
		messagebox("Advertencia","Renta Invalida")
		this.text	= string(il_tot_renta,"###,###,###,###,###,##0")
		This.setfocus()
	else
		if long(this.text)<>il_tot_renta then il_sw = 1
	end if
end if
end event

type em_grupo_fam from editmask within w_actualiza_datos_cliente
integer x = 1947
integer y = 1052
integer width = 480
integer height = 88
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,##0"
end type

event modified;if long(this.text)<>il_grupo_f then
	if trim(this.text)='' or long(trim(this.text))<0 then
		messagebox("Advertencia","Grupo Familiar Invalido")
		this.text	= string(il_grupo_f,"###,###,###,###,###,##0")
		This.setfocus()
	else
		if long(this.text)<>il_grupo_f then il_sw = 1
	end if
end if

end event

type em_est_civil from editmask within w_actualiza_datos_cliente
integer x = 375
integer y = 1168
integer width = 521
integer height = 88
integer taborder = 150
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
boolean spin = true
string displaydata = "C - Casado~tC/S - Soltero~tS/E - sEparado~tE/V - Viudo~tV/D - Divorciado~tD/"
boolean usecodetable = true
end type

event modified;if trim(this.text) <> is_est_civil then
	if trim(this.text)='' and trim(this.text)<>'E' and trim(this.text)<>'C' and &
		trim(this.text)<>'S' and trim(this.text)<>'D' and trim(this.text)<>'V' then
		
		messagebox("Advertencia","Estado Civil Invalido Opciones: E-sEparado, C-Casado, S-Soltero, D-Divorciado, V-Viudo")
		this.text	= is_est_civil
		This.setfocus()
	else
		if trim(this.text)<>is_est_civil then il_sw = 1
	end if
end if
end event

type gb_1 from groupbox within w_actualiza_datos_cliente
integer x = 37
integer y = 40
integer width = 2450
integer height = 1292
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Antecedentes Personales"
end type

