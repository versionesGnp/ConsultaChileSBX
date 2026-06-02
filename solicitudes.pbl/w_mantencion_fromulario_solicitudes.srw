forward
global type w_mantencion_fromulario_solicitudes from window
end type
type cb_print_titulo_dominio_reducc from commandbutton within w_mantencion_fromulario_solicitudes
end type
type dw_print_ctto_def from datawindow within w_mantencion_fromulario_solicitudes
end type
type dw_print_titulo from datawindow within w_mantencion_fromulario_solicitudes
end type
type dw_hoja_firma_tit_dom from datawindow within w_mantencion_fromulario_solicitudes
end type
type cb_print_titulo_dominio from commandbutton within w_mantencion_fromulario_solicitudes
end type
type dw_print_dcto from datawindow within w_mantencion_fromulario_solicitudes
end type
type cb_aviso from commandbutton within w_mantencion_fromulario_solicitudes
end type
type dw_print from datawindow within w_mantencion_fromulario_solicitudes
end type
type cb_ver_original from commandbutton within w_mantencion_fromulario_solicitudes
end type
type cb_cerrar from commandbutton within w_mantencion_fromulario_solicitudes
end type
type cb_imprimir from commandbutton within w_mantencion_fromulario_solicitudes
end type
type cb_grabar from commandbutton within w_mantencion_fromulario_solicitudes
end type
type dw_reporte from datawindow within w_mantencion_fromulario_solicitudes
end type
type cb_actualiza_datos from commandbutton within w_mantencion_fromulario_solicitudes
end type
type dw_ingreso_coprop from datawindow within w_mantencion_fromulario_solicitudes
end type
end forward

global type w_mantencion_fromulario_solicitudes from window
integer width = 3625
integer height = 2264
boolean titlebar = true
string title = "Mantención de Formularios"
long backcolor = 67108864
cb_print_titulo_dominio_reducc cb_print_titulo_dominio_reducc
dw_print_ctto_def dw_print_ctto_def
dw_print_titulo dw_print_titulo
dw_hoja_firma_tit_dom dw_hoja_firma_tit_dom
cb_print_titulo_dominio cb_print_titulo_dominio
dw_print_dcto dw_print_dcto
cb_aviso cb_aviso
dw_print dw_print
cb_ver_original cb_ver_original
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
cb_grabar cb_grabar
dw_reporte dw_reporte
cb_actualiza_datos cb_actualiza_datos
dw_ingreso_coprop dw_ingreso_coprop
end type
global w_mantencion_fromulario_solicitudes w_mantencion_fromulario_solicitudes

type variables
String		is_base,is_serie,is_tipo_sol,is_estado,is_estado_cadena,is_fecha_palabra,is_fono_particular,is_celular,is_fono_c
Long		il_correlativo,il_nro_cta, il_cta_pag_s,il_dias_vcto,il_sw_print=0,il_row_coprop,il_folio_mandato,il_sw_grabar=0, il_modif,il_libro_parque,&
			il_corr_libro,il_ctas_pag_m,il_dias_mora_m,il_modalidad_pago
datetime	ld_fecha_prim, ld_fecha_ult
Date		id_fecha_res,idt_fecha_hoy
Double	il_numero
end variables

forward prototypes
public subroutine wf_cargar_datos_cambio_estado ()
public subroutine wf_cargar_datos_cambio_estado_titular ()
public subroutine wf_cargar_datos_contrato_def ()
public subroutine wf_cargar_datos_entrega_pagare ()
public subroutine wf_cargar_datos_novacion ()
public subroutine wf_cargar_datos_rescil_cliente ()
public subroutine wf_cargar_datos_resolucion ()
public subroutine wf_cargar_datos_seguro ()
public subroutine wf_cargar_datos_titulo_dominio ()
public subroutine wf_cargar_datos_transferencia ()
public subroutine wf_cargar_datos ()
public subroutine wf_cargar_ultima_voluntad ()
public subroutine wf_cargar_datos_posesion_efectiva ()
public subroutine wf_cargar_datos_pac ()
public subroutine wf_cargar_datos_mod_antece_cliente ()
public subroutine wf_cargar_datos_repactacion_compraventa ()
public subroutine wf_grabar_repacta_aumento ()
public subroutine wf_validar_ventanas ()
public subroutine wf_grabar_repacta_compraventa ()
public subroutine wf_grabar_repacta_liberador ()
public subroutine wf_grabar_repacta_pagare ()
public subroutine wf_cargar_datos_rescil_reprog ()
public subroutine wf_cargar_datos_pat ()
public subroutine wf_cargar_datos_seguro_desgravamen ()
public subroutine wf_cargar_datos_seguro_fallecimiento ()
public subroutine wf_cargar_coprop_promesa ()
public subroutine wf_grabar_repacta_funeraria ()
public subroutine wf_cargar_datos_en_demanda ()
public subroutine wf_cargar_datos_bono_fraternal ()
public subroutine wf_cargar_datos_mant_perpetual ()
public subroutine wf_cargar_datos_titulo_dominio_parque ()
public subroutine wf_imprimir_tit_dominio_parque ()
public subroutine wf_imprimir_ctto_definitivo ()
public subroutine wf_fecha_palabras (date ad_fecha)
public subroutine wf_cargar_datos_compromiso_pago ()
public subroutine wf_calcular_mora ()
end prototypes

public subroutine wf_cargar_datos_cambio_estado ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,ls_celular,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac,ldt_fec_hoy,ldt_fecha_opera,ldt_fecha_infor
time		lt_hora=time("00:00:00")
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,ls_otro_fono_p,ls_otro_fono_c
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob,ls_prioridad
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

ldt_fec_hoy					= datetime(DATE(gdt_fec_sistema),lt_hora)
dw_reporte.dataobject	= 'dw_form_cambio_estado'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age'))
			ls_cod_sup		= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup'))
			ls_area			= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area'))
			ls_sector			= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector'))
			ls_sepultura		= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura'))
			ll_capacidad		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= trim(w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona'))
			ls_sector			= trim(w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector'))
			ls_sepultura		= trim(w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura'))
			ll_capacidad		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut				= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F", "G", "V"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut				= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= '0'
			ls_sector			= '0'
			ls_sepultura		= '0'
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut				= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut				= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector			= trim(w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector'))
			ls_sepultura		= trim(w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura'))
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut				= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector			= trim(w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector'))
			ls_sepultura		= trim(w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura'))
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								   w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE

if is_estado="N" then
	SELECT MAX("SOL_CAMBIO_ESTADO"."CORRELATIVO")
   	INTO 		:il_correlativo
   	FROM 	"SOL_CAMBIO_ESTADO"  
   	WHERE 	( "SOL_CAMBIO_ESTADO"."BASE" = :is_base ) AND  
         		( "SOL_CAMBIO_ESTADO"."SERIE" = :is_serie ) AND  
         		( "SOL_CAMBIO_ESTADO"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	// valida variables
	if isnull(il_cta_pag_s) or il_cta_pag_s<0 then 
		il_cta_pag_s	= 0
	end if
	if isnull(il_nro_cta) or il_nro_cta<0 then 
		il_nro_cta	= 0
	end if
	if isnull(id_fecha_res) or date(id_fecha_res)=date("01/01/1900") or date(id_fecha_res)=date("00/00/0000") then
		setnull(id_fecha_res)
	end if
	if isnull(ll_rut) or ll_rut<0 then 
		ll_rut	= 0
	end if
	if len(ls_direc_p)>60 then
		ls_direc_p	= mid(ls_direc_p,1,60)
	end if
	if isnull(ls_direc_p) then
		ls_direc_p	= ''
	end if
	if len(ls_pob)>60 then
		ls_pob	= mid(ls_pob,1,60)
	end if
	if isnull(ls_pob) then
		ls_pob	= ''
	end if
	if len(ls_sector_cli)>60 then
		ls_sector_cli	= mid(ls_sector_cli,1,60)
	end if
	if isnull(ls_sector_cli) then
		ls_sector_cli= ''
	end if
	if len(ls_comuna)>20 then
		ls_comuna	= mid(ls_comuna,1,20)
	end if
	if isnull(ls_comuna) then
		ls_comuna= ''
	end if
	if len(ls_ciudad)>15 then
		ls_ciudad	= mid(ls_ciudad,1,15)
	end if
	if isnull(ls_ciudad) then
		ls_ciudad= ''
	end if
	if len(ls_fono_p)>25 then
		ls_fono_p	= mid(ls_fono_p,1,25)
	end if
	if isnull(ls_fono_p) then
		ls_fono_p= ''
	end if
	if isnull(ld_fec_nac) or date(ld_fec_nac)=date("01/01/1900") or date(ld_fec_nac)=date("00/00/0000") then
		setnull(ld_fec_nac)
	end if
	if len(ls_est_civil)>1 then
		ls_est_civil	= mid(ls_est_civil,1,1)
	end if
	if isnull(ls_est_civil) then
		ls_est_civil= ''
	end if
	if len(ls_domic_c)>60 then
		ls_domic_c	= mid(ls_domic_c,1,60)
	end if
	if isnull(ls_domic_c) then
		ls_domic_c	= ''
	end if
	if len(ls_fono_c)>25 then
		ls_fono_c	= mid(ls_fono_c,1,25)
	end if
	if isnull(ls_fono_c) then
		ls_fono_c	= ''
	end if
	if isnull(ll_tot_renta) or ll_tot_renta<0 then
		ll_tot_renta= 0
	end if
	if isnull(ll_grupo_f) or ll_grupo_f<0 then
		ll_grupo_f	= 0
	end if
	if len(ls_est_cob)>2 then
		ls_est_cob	= mid(ls_est_cob,1,2)
	end if
	if isnull(ls_est_cob) then
		ls_est_cob	= ''
	end if
	if isnull(ll_mora) or ll_mora<0 then 
		ll_mora	= 0
	end if
	if isnull(ll_cta_repacta) or ll_cta_repacta<0 then
		ll_cta_repacta	= 0
	end if
	ls_celular			= ''
	ls_otro_fono_p		= ''
	ls_otro_fono_c		= ''
	ls_prioridad			= 'N'
	if len(ls_cod_age)>5 then
		ls_cod_age		= mid(ls_cod_age,1,5)
	end if
	if isnull(ls_cod_age) then
		ls_cod_age		= ''
	end if
	if len(ls_cod_sup)>5 then
		ls_cod_sup		= mid(ls_cod_sup,1,5)
	end if
	if isnull(ls_cod_sup) then
		ls_cod_sup		= ''
	end if
	if len(ls_dv)>1 then
		ls_dv				= mid(ls_dv,1,1)
	end if
	if isnull(ls_dv) then
		ls_dv				= ''
	end if
	if len(ls_nombre)>40 then
		ls_nombre		= mid(ls_nombre,1,40)
	end if
	if isnull(ls_nombre) then
		ls_nombre		= ''
	end if
	if len(ls_a_pat)>40 then
		ls_a_pat			= mid(ls_a_pat,1,40)
	end if
	if isnull(ls_a_pat) then
		ls_a_pat			= ''
	end if
	if len(ls_a_mat)>40 then
		ls_a_mat			= mid(ls_a_mat,1,40)
	end if
	if isnull(ls_a_mat) then
		ls_a_mat			= ''
	end if
	ldt_fecha_opera	= datetime(date("00/00/0000"),lt_hora)
	ldt_fecha_infor		= datetime(date("00/00/0000"),lt_hora)
	if len(ls_area)>2 then
		ls_area			= mid(ls_area,1,2)
	end if
	if isnull(ls_area) then
		ls_area			= ''
	end if
	if len(ls_sector)>8 then
		ls_sector			= mid(ls_sector,1,8)
	end if
	if isnull(ls_sector) then
		ls_sector			= ''
	end if
	if len(ls_sepultura)>8 then
		ls_sepultura		= mid(ls_sepultura,1,8)
	end if
	if isnull(ls_sepultura) then
		ls_sepultura		= ''
	end if
	if isnull(ll_capacidad) or ll_capacidad<0 then
		ll_capacidad		= 0
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new				= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_cambio_estado_base',is_base)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_fecha_actual',ldt_fec_hoy)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_celular',ls_celular)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_otro_fono_p',ls_otro_fono_p)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_otro_fono_c',ls_otro_fono_c)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_estado_civil',ls_est_civil)
	if not isnull(ld_fec_res) then
		dw_reporte.setitem(ll_new,'sol_cambio_estado_fecha_rescil',ld_fec_res)
	end if
	dw_reporte.setitem(ll_new,'sol_cambio_estado_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_prioridad',ls_prioridad)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_usuario_infor','')
	dw_reporte.setitem(ll_new,'sol_cambio_estado_usuario_opera','')
	dw_reporte.setitem(ll_new,'sol_cambio_estado_fecha_opera',ldt_fecha_opera)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_fecha_infor',ldt_fecha_infor)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_area_sepultura',ls_area)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_sector_sepultura',ls_sector)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_capacidad',ll_capacidad)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_estatus_operacion',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_fecha_rescil_original',id_fecha_res)
	if ll_cta_repacta>0 or ll_mora>0 then
		dw_reporte.setitem(ll_new,'sol_cambio_estado_est_mora_com',0)
	else
		dw_reporte.setitem(ll_new,'sol_cambio_estado_est_mora_com',1)
	end if		
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_imp_pago',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_der_esp',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_aum_capital',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_dis_capital',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_aum_plazo',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_carta_simple',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_carta_notarial',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_finiquito',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_inf_social',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_otro_2',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_est_sin_antece',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_depto_particular_origi',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_numero_particular_orig',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_depto_particular_origi',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_block_particular_origi',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_estado_cod_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 	"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		if len(ls_nombre_usuario)>80 then
			ls_nombre_usuario	= mid(ls_nombre_usuario,1,80)
		end if
		if isnull(ls_nombre_usuario) then
			ls_nombre_usuario	= ''
		end if
		dw_reporte.setitem(ll_new,'sol_cambio_estado_usuario',ls_nombre_usuario)
	else
		dw_reporte.setitem(ll_new,'sol_cambio_estado_usuario','')
	end if

elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_cambio_estado_estatus_operacion')
	ll_est_inf		= dw_reporte.getitemnumber(1,'sol_cambio_estado_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
////			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
//if cb_aviso
cb_aviso.visible								= false
//cb_grabar.enabled						= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_cambio_estado_titular ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,ls_celular,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_estado_titular
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac,ldt_fec_hoy,ldt_fecha_opera,ldt_fecha_infor
time		lt_hora=time("00:00:00")
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,ls_otro_fono_p,ls_otro_fono_c
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob,ls_prioridad
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

ldt_fec_hoy					= datetime(DATE(gdt_fec_sistema),lt_hora)
dw_reporte.dataobject	= 'dw_form_cambio_estado_titular'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age'))
			ls_cod_sup		= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup'))
			ls_area			= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area'))
			ls_sector		= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector'))
			ls_sepultura	= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura'))
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= trim(w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona'))
			ls_sector		= trim(w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector'))
			ls_sepultura	= trim(w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura'))
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= trim(w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector'))
			ls_sepultura	= trim(w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura'))
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= trim(w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector'))
			ls_sepultura	= trim(w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura'))
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE

if is_estado="N" then
	SELECT MAX("SOL_CAMBIO_ESTADO_TITULAR"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_CAMBIO_ESTADO_TITULAR"  
   WHERE ( "SOL_CAMBIO_ESTADO_TITULAR"."BASE" = :is_base ) AND  
         ( "SOL_CAMBIO_ESTADO_TITULAR"."SERIE" = :is_serie ) AND  
         ( "SOL_CAMBIO_ESTADO_TITULAR"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"ESTADO_TITULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,					:ls_estado_titular
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	// valida variables
	if isnull(il_cta_pag_s) or il_cta_pag_s<0 then 
		il_cta_pag_s	= 0
	end if
	if isnull(il_nro_cta) or il_nro_cta<0 then 
		il_nro_cta	= 0
	end if
	if isnull(id_fecha_res) or date(id_fecha_res)=date("01/01/1900") or date(id_fecha_res)=date("00/00/0000") then
		setnull(id_fecha_res)
	end if
	if isnull(ll_rut) or ll_rut<0 then 
		ll_rut	= 0
	end if
	if len(ls_direc_p)>60 then
		ls_direc_p	= mid(ls_direc_p,1,60)
	end if
	if isnull(ls_direc_p) then
		ls_direc_p	= ''
	end if
	if len(ls_pob)>60 then
		ls_pob	= mid(ls_pob,1,60)
	end if
	if isnull(ls_pob) then
		ls_pob	= ''
	end if
	if len(ls_sector_cli)>60 then
		ls_sector_cli	= mid(ls_sector_cli,1,60)
	end if
	if isnull(ls_sector_cli) then
		ls_sector_cli= ''
	end if
	if len(ls_comuna)>60 then
		ls_comuna	= mid(ls_comuna,1,60)
	end if
	if isnull(ls_comuna) then
		ls_comuna= ''
	end if
	if len(ls_ciudad)>15 then
		ls_ciudad	= mid(ls_ciudad,1,15)
	end if
	if isnull(ls_ciudad) then
		ls_ciudad= ''
	end if
	if len(ls_fono_p)>25 then
		ls_fono_p	= mid(ls_fono_p,1,25)
	end if
	if isnull(ls_fono_p) then
		ls_fono_p= ''
	end if
	if isnull(ld_fec_nac) or date(ld_fec_nac)=date("01/01/1900") or date(ld_fec_nac)=date("00/00/0000") then
		setnull(ld_fec_nac)
	end if
	if len(ls_est_civil)>1 then
		ls_est_civil	= mid(ls_est_civil,1,1)
	end if
	if isnull(ls_est_civil) then
		ls_est_civil= ''
	end if
	if len(ls_domic_c)>60 then
		ls_domic_c	= mid(ls_domic_c,1,60)
	end if
	if isnull(ls_domic_c) then
		ls_domic_c	= ''
	end if
	if len(ls_fono_c)>25 then
		ls_fono_c	= mid(ls_fono_c,1,25)
	end if
	if isnull(ls_fono_c) then
		ls_fono_c	= ''
	end if
	if isnull(ll_tot_renta) or ll_tot_renta<0 then
		ll_tot_renta= 0
	end if
	if isnull(ll_grupo_f) or ll_grupo_f<0 then
		ll_grupo_f	= 0
	end if
	if len(ls_est_cob)>2 then
		ls_est_cob	= mid(ls_est_cob,1,2)
	end if
	if isnull(ls_est_cob) then
		ls_est_cob	= ''
	end if
	if isnull(ll_mora) or ll_mora<0 then 
		ll_mora	= 0
	end if
	if isnull(ll_cta_repacta) or ll_cta_repacta<0 then
		ll_cta_repacta	= 0
	end if
	ls_celular		= ''
	ls_otro_fono_p	= ''
	ls_otro_fono_c	= ''
	ls_prioridad	= 'N'
	if len(ls_cod_age)>5 then
		ls_cod_age	= mid(ls_cod_age,1,5)
	end if
	if isnull(ls_cod_age) then
		ls_cod_age		= ''
	end if
	if len(ls_cod_sup)>5 then
		ls_cod_sup	= mid(ls_cod_sup,1,5)
	end if
	if isnull(ls_cod_sup) then
		ls_cod_sup		= ''
	end if
	if len(ls_dv)>1 then
		ls_dv	= mid(ls_dv,1,1)
	end if
	if isnull(ls_dv) then
		ls_dv					= ''
	end if
	if len(ls_nombre)>40 then
		ls_nombre	= mid(ls_nombre,1,40)
	end if
	if isnull(ls_nombre) then
		ls_nombre			= ''
	end if
	if len(ls_a_pat)>40 then
		ls_a_pat			= mid(ls_a_pat,1,40)
	end if
	if isnull(ls_a_pat) then
		ls_a_pat			= ''
	end if
	if len(ls_a_mat)>40 then
		ls_a_mat	= mid(ls_a_mat,1,40)
	end if
	if isnull(ls_a_mat) then
		ls_a_mat	= ''
	end if
	ldt_fecha_opera	= datetime(date("00/00/0000"),lt_hora)
	ldt_fecha_infor	= datetime(date("00/00/0000"),lt_hora)
	if len(ls_area)>2 then
		ls_area	= mid(ls_area,1,2)
	end if
	if isnull(ls_area) then
		ls_area	= ''
	end if
	if len(ls_sector)>8 then
		ls_sector	= mid(ls_sector,1,8)
	end if
	if isnull(ls_sector) then
		ls_sector	= ''
	end if
	if len(ls_sepultura)>8 then
		ls_sepultura	= mid(ls_sepultura,1,8)
	end if
	if isnull(ls_sepultura) then
		ls_sepultura		= ''
	end if
	if isnull(ll_capacidad) or ll_capacidad<0 then
		ll_capacidad		= 0
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
		
	if ls_estado_titular='0' then
		dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_estado_ctto_fi','1')
	else
		dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_estado_ctto_fi','0')
	end if
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_base',is_base)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_fecha_actual',ldt_fec_hoy)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_numero_particu',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_depto_particul',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_block_particul',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_celular',ls_celular)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_otro_fono_p',ls_otro_fono_p)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_otro_fono_c',ls_otro_fono_c)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_estado_civil',ls_est_civil)
	if not isnull(ld_fec_res) then
		dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_fecha_rescil',ld_fec_res)
	end if
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_prioridad',ls_prioridad)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_usuario_infor','')
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_usuario_opera','')
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_fecha_opera',ldt_fecha_opera)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_fecha_infor',ldt_fecha_infor)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_area_sepultura',ls_area)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_sector_sepultu',ls_sector)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_capacidad',ll_capacidad)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_estatus_operac',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_estatus_inform',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_estado_ctto_or',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_fecha_rescil_o',id_fecha_res)
	if ll_cta_repacta>0 or ll_mora>0 then
		dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_mora_com',0)
	else
		dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_mora_com',1)
	end if		
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_imp_pago',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_der_esp',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_aum_capita',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_dis_capita',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_aum_plazo',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_carta_simp',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_carta_nota',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_finiquito',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_fotocopia_',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_inf_social',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_otro_2',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_est_sin_antece',1)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_depto_particul',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_tipo_via_origi',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_numero_particu',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_depto_particul',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_block_particul',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_poblacion_orig',ls_pob)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_sector_origina',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_comuna_origina',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_ciudad_origina',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_fono_p_origina',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_domicilio_c_or',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_fono_c_origina',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_fecha_nac_orig',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_total_renta_or',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_grupo_f_origin',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_estado_civil_o',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_estado_cod_ori',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_mod_ant_client','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		if len(ls_nombre_usuario)>80 then
			ls_nombre_usuario			= mid(ls_nombre_usuario,1,80)
		end if
		if isnull(ls_nombre_usuario) then
			ls_nombre_usuario			= ''
		end if
		dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_usuario',ls_nombre_usuario)
	else
		dw_reporte.setitem(ll_new,'sol_cambio_estado_titular_usuario','')
	end if

elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope							= dw_reporte.getitemnumber(1,'sol_cambio_estado_titular_estatus_operac')
	ll_est_inf							= dw_reporte.getitemnumber(1,'sol_cambio_estado_titular_estatus_inform')
	ls_est_reg							= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled			= true
		else
			cb_grabar.enabled			= false
		end if
	end if
end if
cb_aviso.visible						= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_contrato_def ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_form_contrato_definitivo'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_CONTRATO_DEF"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_CONTRATO_DEF"  
   WHERE ( "SOL_CONTRATO_DEF"."BASE" = :is_base ) AND  
         ( "SOL_CONTRATO_DEF"."SERIE" = :is_serie ) AND  
         ( "SOL_CONTRATO_DEF"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob  	,					:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	dw_reporte.setitem(ll_new,'sol_contrato_def_base',is_base)
	dw_reporte.setitem(ll_new,'sol_contrato_def_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_contrato_def_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_contrato_def_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_contrato_def_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_contrato_def_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_contrato_def_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_contrato_def_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_contrato_def_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_contrato_def_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_contrato_def_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_contrato_def_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_contrato_def_numero_particular ',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_contrato_def_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_contrato_def_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_contrato_def_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_contrato_def_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_contrato_def_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_contrato_def_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_contrato_def_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_contrato_def_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_contrato_def_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_contrato_def_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_contrato_def_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_contrato_def_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_contrato_def_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_contrato_def_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_contrato_def_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_contrato_def_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_contrato_def_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_contrato_def_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_contrato_def_prioridad','N')
	dw_reporte.setitem(ll_new,'sol_contrato_def_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_contrato_def_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_contrato_def_area_sepultura',ls_area)
	dw_reporte.setitem(ll_new,'sol_contrato_def_sector_sepultura',ls_sector)
	dw_reporte.setitem(ll_new,'sol_contrato_def_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_contrato_def_capacidad',ll_capacidad)
	dw_reporte.setitem(ll_new,'sol_contrato_def_estatus_operaciones',1)
	dw_reporte.setitem(ll_new,'sol_contrato_def_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_contrato_def_est_carta_simple',1)
	dw_reporte.setitem(ll_new,'sol_contrato_def_est_carta_notarial',1)
	dw_reporte.setitem(ll_new,'sol_contrato_def_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_contrato_def_est_pos_efectiva',1)
	dw_reporte.setitem(ll_new,'sol_contrato_def_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_contrato_def_est_sin_antece',1)
	dw_reporte.setitem(ll_new,'sol_contrato_def_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_contrato_def_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_contrato_def_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_contrato_def_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_contrato_def_numero_particular_origi',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_contrato_def_depto_particular_origin',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_contrato_def_block_particular_origin',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_contrato_def_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_contrato_def_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_contrato_def_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_contrato_def_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_contrato_def_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_contrato_def_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_contrato_def_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_contrato_def_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_contrato_def_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_contrato_def_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_contrato_def_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_contrato_def_estado_cob_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_contrato_def_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_contrato_def_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_contrato_def_usuario','') //ok
	end if
	SELECT count("FALLECIDOS"."LLAVE")  
   INTO :ll_count_reg  
   FROM "FALLECIDOS"  
   WHERE ( "FALLECIDOS"."BASE" = :is_base ) AND  
         ( "FALLECIDOS"."SS" = :is_serie ) AND  
         ( "FALLECIDOS"."CONTRATO" = :il_numero )    AND
		( "FALLECIDOS"."ESTADO_REG" = 'A' )
	Using	sqlca;
	if sqlca.sqlcode=0 then
		if ll_count_reg>0 then
			dw_reporte.setitem(ll_new,'sol_contrato_def_sepultado','Si')
		else
			dw_reporte.setitem(ll_new,'sol_contrato_def_sepultado','No')
		end if
	else
		dw_reporte.setitem(ll_new,'sol_contrato_def_sepultado','No')
	end if
	SELECT	"CADENA"."ESTADO_TITULO"  
	INTO 		:ls_titulo  
	FROM 		"CADENA"  
	WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
				( "CADENA"."SERIE" = :is_serie ) AND  
				( "CADENA"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_contrato_def_titulo_dominio',ls_titulo)
	else
		dw_reporte.setitem(ll_new,'sol_contrato_def_titulo_dominio','')
	end if
	SELECT	"CARTA_LOG"."COD_ACCION"  
	INTO 		:ll_ctto_def  
	FROM 		"CARTA_LOG"  
	WHERE 	( "CARTA_LOG"."BASE" = :is_base ) AND  
				( "CARTA_LOG"."SERIE" = :is_serie ) AND  
				( "CARTA_LOG"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_contrato_def_ctto_definitivo',ll_ctto_def)
	else
		dw_reporte.setitem(ll_new,'sol_contrato_def_ctto_definitivo',0)
	end if
			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_contrato_def_estatus_operaciones')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_contrato_def_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_entrega_pagare ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_form_entrega_de_pagare'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexocod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_ENTREGA_PAG"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_ENTREGA_PAG"  
   WHERE ( "SOL_ENTREGA_PAG"."BASE" = :is_base ) AND  
         ( "SOL_ENTREGA_PAG"."SERIE" = :is_serie ) AND  
         ( "SOL_ENTREGA_PAG"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	dw_reporte.setitem(ll_new,'sol_entrega_pag_base',is_base)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_prioridad','N')
	dw_reporte.setitem(ll_new,'sol_entrega_pag_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_area_sepultura',ls_area)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_sector_sepultura',ls_sector)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_capacidad',ll_capacidad)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_estatus_operaciones',1)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_est_carta_simple',1)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_est_carta_notarial',1)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_est_pos_efectiva',1)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_est_oro_1',1)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_est_sin_antece',1)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_numero_particular_origin',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_depto_particular_origina',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_block_particular_origina',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_estado_cob_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_entrega_pag_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_entrega_pag_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_entrega_pag_usuario','') //ok
	end if
	SELECT count("FALLECIDOS"."LLAVE")  
   INTO :ll_count_reg  
   FROM "FALLECIDOS"  
   WHERE ( "FALLECIDOS"."BASE" = :is_base ) AND  
         ( "FALLECIDOS"."SS" = :is_serie ) AND  
         ( "FALLECIDOS"."CONTRATO" = :il_numero )    AND
		( "FALLECIDOS"."ESTADO_REG" = 'A' )
	Using	sqlca;
	if sqlca.sqlcode=0 then
		if ll_count_reg>0 then
			dw_reporte.setitem(ll_new,'sol_entrega_pag_sepultado','Si')
		else
			dw_reporte.setitem(ll_new,'sol_entrega_pag_sepultado','No')
		end if
	else
		dw_reporte.setitem(ll_new,'sol_entrega_pag_sepultado','No')
	end if
	SELECT	"CADENA"."ESTADO_TITULO"  
	INTO 		:ls_titulo  
	FROM 		"CADENA"  
	WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
				( "CADENA"."SERIE" = :is_serie ) AND  
				( "CADENA"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_entrega_pag_titulo_dominio',ls_titulo)
	else
		dw_reporte.setitem(ll_new,'sol_entrega_pag_titulo_dominio','')
	end if
	SELECT	"CARTA_LOG"."COD_ACCION"  
	INTO 		:ll_ctto_def  
	FROM 		"CARTA_LOG"  
	WHERE 	( "CARTA_LOG"."BASE" = :is_base ) AND  
				( "CARTA_LOG"."SERIE" = :is_serie ) AND  
				( "CARTA_LOG"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_entrega_pag_ctto_definitivo',ll_ctto_def)
	else
		dw_reporte.setitem(ll_new,'sol_entrega_pag_ctto_definitivo',0)
	end if
			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_entrega_pag_estatus_operaciones')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_entrega_pag_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_novacion ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_form_novacion'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_NOVACION"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_NOVACION"  
   WHERE ( "SOL_NOVACION"."BASE" = :is_base ) AND  
         ( "SOL_NOVACION"."SERIE" = :is_serie ) AND  
         ( "SOL_NOVACION"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	dw_reporte.setitem(ll_new,'sol_novacion_base',is_base)
	dw_reporte.setitem(ll_new,'sol_novacion_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_novacion_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_novacion_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_novacion_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_novacion_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_novacion_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_novacion_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_novacion_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_novacion_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_novacion_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_novacion_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_novacion_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_novacion_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_novacion_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_novacion_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_novacion_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_novacion_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_novacion_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_novacion_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_novacion_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_novacion_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_novacion_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_novacion_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_novacion_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_novacion_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_novacion_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_novacion_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_novacion_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_novacion_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_novacion_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_novacion_prioridad','N')
	dw_reporte.setitem(ll_new,'sol_novacion_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_novacion_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_novacion_area_sepultura',ls_area)
	dw_reporte.setitem(ll_new,'sol_novacion_sector_sepultura',ls_sector)
	dw_reporte.setitem(ll_new,'sol_novacion_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_novacion_capacidad',ll_capacidad)
	dw_reporte.setitem(ll_new,'sol_novacion_estatus_operaciones',1)
	dw_reporte.setitem(ll_new,'sol_novacion_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_novacion_est_carta_simple',1)
	dw_reporte.setitem(ll_new,'sol_novacion_est_carta_notarial',1)
	dw_reporte.setitem(ll_new,'sol_novacion_est_finiquito',1)
	dw_reporte.setitem(ll_new,'sol_novacion_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_novacion_est_inf_social',1)
	dw_reporte.setitem(ll_new,'sol_novacion_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_novacion_est_sin_antece',1)
	dw_reporte.setitem(ll_new,'sol_novacion_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_novacion_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_novacion_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_novacion_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_novacion_numero_particular_original',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_novacion_depto_particular_original',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_novacion_block_particular_original',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_novacion_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_novacion_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_novacion_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_novacion_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_novacion_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_novacion_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_novacion_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_novacion_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_novacion_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_novacion_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_novacion_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_novacion_estado_cod_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_novacion_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_novacion_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_novacion_usuario','') //ok
	end if
	SELECT count("FALLECIDOS"."LLAVE")  
   INTO :ll_count_reg  
   FROM "FALLECIDOS"  
   WHERE ( "FALLECIDOS"."BASE" = :is_base ) AND  
         ( "FALLECIDOS"."SS" = :is_serie ) AND  
         ( "FALLECIDOS"."CONTRATO" = :il_numero )    AND
		( "FALLECIDOS"."ESTADO_REG" = 'A' )
	Using	sqlca;
	if sqlca.sqlcode=0 then
		if ll_count_reg>0 then
			dw_reporte.setitem(ll_new,'sol_novacion_sepultado','Si')
		else
			dw_reporte.setitem(ll_new,'sol_novacion_sepultado','No')
		end if
	else
		dw_reporte.setitem(ll_new,'sol_novacion_sepultado','No')
	end if
	SELECT	"CADENA"."ESTADO_TITULO"  
	INTO 		:ls_titulo  
	FROM 		"CADENA"  
	WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
				( "CADENA"."SERIE" = :is_serie ) AND  
				( "CADENA"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_novacion_titulo_dominio',ls_titulo)
	else
		dw_reporte.setitem(ll_new,'sol_novacion_titulo_dominio','')
	end if
	SELECT	"CARTA_LOG"."COD_ACCION"  
	INTO 		:ll_ctto_def  
	FROM 		"CARTA_LOG"  
	WHERE 	( "CARTA_LOG"."BASE" = :is_base ) AND  
				( "CARTA_LOG"."SERIE" = :is_serie ) AND  
				( "CARTA_LOG"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_novacion_ctto_definitivo',ll_ctto_def)
	else
		dw_reporte.setitem(ll_new,'sol_novacion_ctto_definitivo',0)
	end if

			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_novacion_estatus_operaciones')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_novacion_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
cb_grabar.enabled						= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_rescil_cliente ();string		ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,ls_celular,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_anexo,ls_serie_contrato,&
			ls_base_contrato,ls_sector_ctto,ls_sepultura_ctto,ls_area_ctto,ls_base,ls_serie
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac,ldt_fec_hoy,ldt_fecha_opera,ldt_fecha_infor
time		lt_hora=time("00:00:00")
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg,ll_capacidad_ctto,ll_new, ll_cta_repacta
Double	ll_ctto_def,ll_numero_contrato,ll_numero
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,ls_otro_fono_p,ls_otro_fono_c
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob,ls_prioridad
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

cb_aviso.visible			= true
ldt_fec_hoy					= datetime(DATE(gdt_fec_sistema),lt_hora)
dw_reporte.dataobject	= 'dw_form_resciliacion_por_parte_cliente'
dw_reporte.settransobject(sqlca)
dw_reporte.getchild('sol_rescilia_cliente_serie_asociado',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age'))
			ls_cod_sup		= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup'))
			ls_area			= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area'))
			ls_sector			= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector'))
			ls_sepultura		= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura'))
			ll_capacidad		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= trim(w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona'))
			ls_sector			= trim(w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector'))
			ls_sepultura		= trim(w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura'))
			ll_capacidad		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut				= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
//			ls_area			= ''
//			ls_sector		= ''
//			ls_sepultura	= ''
//			ll_capacidad	= 0
			setnull(ls_base); setnull(ls_serie); setnull(ll_numero)
			SELECT 	"ANEXO_LIBERADOR"."BASE",   
						"ANEXO_LIBERADOR"."SERIE",   
						"ANEXO_LIBERADOR"."NRO_OFERTA"  
			INTO 		:ls_base,:ls_serie,:ll_numero  
			FROM 	"ANEXO_LIBERADOR"  
			WHERE 	"ANEXO_LIBERADOR"."SERIE_M" = :is_serie AND  
						"ANEXO_LIBERADOR"."NRO_LIBERADOR" = :il_numero
			USING	sqlca;			
			if ls_base = 'O' then
				SELECT 	"PAGO_OFERTA"."AREA",   
							"PAGO_OFERTA"."SECTOR",   
							"PAGO_OFERTA"."SEPULTURA",   
							"PAGO_OFERTA"."CAPACIDAD"  
				INTO 		:ls_area, :ls_sector, :ls_sepultura, :ll_capacidad  
				FROM 	"PAGO_OFERTA"  
				WHERE 	"PAGO_OFERTA"."SERIE" = :ls_serie AND  
							"PAGO_OFERTA"."NRO_OFERTA" = :ll_numero
				USING	sqlca;
			elseif ls_base = 'C' then
				SELECT 	"CONTRATO"."ZONA",   
							"CONTRATO"."SECTOR",   
							"CONTRATO"."SEPULTURA",   
							"CONTRATO"."CAPACIDAD"  
				INTO 		:ls_area, :ls_sector, :ls_sepultura, :ll_capacidad  
				FROM 	"CONTRATO"  
				WHERE 	"CONTRATO"."SERIE_C" = :ls_serie AND  
							"CONTRATO"."NRO_CONTRATO" = :ll_numero 
				USING	sqlca;
			end if	
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut				= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut				= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut				= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector			= trim(w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector'))
			ls_sepultura		= trim(w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura'))
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut				= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector			= trim(w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector'))
			ls_sepultura		= trim(w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura'))
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE

if is_estado="N" then
	SELECT MAX("SOL_RESCILIA_CLIENTE"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_RESCILIA_CLIENTE"  
   WHERE ( "SOL_RESCILIA_CLIENTE"."BASE" = :is_base ) AND  
         ( "SOL_RESCILIA_CLIENTE"."SERIE" = :is_serie ) AND  
         ( "SOL_RESCILIA_CLIENTE"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	// valida variables
	if isnull(il_cta_pag_s) or il_cta_pag_s<0 then 
		il_cta_pag_s	= 0
	end if
	if isnull(il_nro_cta) or il_nro_cta<0 then 
		il_nro_cta	= 0
	end if
	if isnull(id_fecha_res) or date(id_fecha_res)=date("01/01/1900") or date(id_fecha_res)=date("00/00/0000") then
		setnull(id_fecha_res)
	end if
	if isnull(ll_rut) or ll_rut<0 then 
		ll_rut	= 0
	end if
	if len(ls_direc_p)>60 then
		ls_direc_p	= mid(ls_direc_p,1,60)
	end if
	if isnull(ls_direc_p) then
		ls_direc_p	= ''
	end if
	if len(ls_pob)>60 then
		ls_pob	= mid(ls_pob,1,60)
	end if
	if isnull(ls_pob) then
		ls_pob	= ''
	end if
	if len(ls_sector_cli)>60 then
		ls_sector_cli	= mid(ls_sector_cli,1,60)
	end if
	if isnull(ls_sector_cli) then
		ls_sector_cli= ''
	end if
	if len(ls_comuna)>20 then
		ls_comuna	= mid(ls_comuna,1,20)
	end if
	if isnull(ls_comuna) then
		ls_comuna= ''
	end if
	if len(ls_ciudad)>15 then
		ls_ciudad	= mid(ls_ciudad,1,15)
	end if
	if isnull(ls_ciudad) then
		ls_ciudad= ''
	end if
	if len(ls_fono_p)>25 then
		ls_fono_p	= mid(ls_fono_p,1,25)
	end if
	if isnull(ls_fono_p) then
		ls_fono_p= ''
	end if
	if isnull(ld_fec_nac) or date(ld_fec_nac)=date("01/01/1900") or date(ld_fec_nac)=date("00/00/0000") then
		setnull(ld_fec_nac)
	end if
	if len(ls_est_civil)>1 then
		ls_est_civil	= mid(ls_est_civil,1,1)
	end if
	if isnull(ls_est_civil) then
		ls_est_civil= ''
	end if
	if len(ls_domic_c)>60 then
		ls_domic_c	= mid(ls_domic_c,1,60)
	end if
	if isnull(ls_domic_c) then
		ls_domic_c	= ''
	end if
	if len(ls_fono_c)>25 then
		ls_fono_c	= mid(ls_fono_c,1,25)
	end if
	if isnull(ls_fono_c) then
		ls_fono_c	= ''
	end if
	if isnull(ll_tot_renta) or ll_tot_renta<0 then
		ll_tot_renta= 0
	end if
	if isnull(ll_grupo_f) or ll_grupo_f<0 then
		ll_grupo_f	= 0
	end if
	if len(ls_est_cob)>2 then
		ls_est_cob	= mid(ls_est_cob,1,2)
	end if
	if isnull(ls_est_cob) then
		ls_est_cob	= ''
	end if
	if isnull(ll_mora) or ll_mora<0 then 
		ll_mora	= 0
	end if
	if isnull(ll_cta_repacta) or ll_cta_repacta<0 then
		ll_cta_repacta	= 0
	end if
	ls_celular		= ''
	ls_otro_fono_p	= ''
	ls_otro_fono_c	= ''
	ls_prioridad	= 'N'
	if len(ls_cod_age)>5 then
		ls_cod_age	= mid(ls_cod_age,1,5)
	end if
	if isnull(ls_cod_age) then
		ls_cod_age		= ''
	end if
	if len(ls_cod_sup)>5 then
		ls_cod_sup	= mid(ls_cod_sup,1,5)
	end if
	if isnull(ls_cod_sup) then
		ls_cod_sup		= ''
	end if
	if len(ls_dv)>1 then
		ls_dv	= mid(ls_dv,1,1)
	end if
	if isnull(ls_dv) then
		ls_dv					= ''
	end if
	if len(ls_nombre)>40 then
		ls_nombre	= mid(ls_nombre,1,40)
	end if
	if isnull(ls_nombre) then
		ls_nombre			= ''
	end if
	if len(ls_a_pat)>40 then
		ls_a_pat			= mid(ls_a_pat,1,40)
	end if
	if isnull(ls_a_pat) then
		ls_a_pat			= ''
	end if
	if len(ls_a_mat)>40 then
		ls_a_mat	= mid(ls_a_mat,1,40)
	end if
	if isnull(ls_a_mat) then
		ls_a_mat	= ''
	end if
	ldt_fecha_opera	= datetime(date("00/00/0000"),lt_hora)
	ldt_fecha_infor	= datetime(date("00/00/0000"),lt_hora)
	if len(ls_area)>2 then
		ls_area	= mid(ls_area,1,2)
	end if
	if isnull(ls_area) then
		ls_area	= ''
	end if
	if len(ls_sector)>8 then
		ls_sector	= mid(ls_sector,1,8)
	end if
	if isnull(ls_sector) then
		ls_sector	= ''
	end if
	if len(ls_sepultura)>8 then
		ls_sepultura	= mid(ls_sepultura,1,8)
	end if
	if isnull(ls_sepultura) then
		ls_sepultura		= ''
	end if
	if isnull(ll_capacidad) or ll_capacidad<0 then
		ll_capacidad		= 0
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	if is_base='L' then
		ls_anexo		= trim(is_base+is_serie+string(il_numero))
		SELECT	"CONTRATO"."SERIE_C",   
					"CONTRATO"."NRO_CONTRATO"  
		INTO 		:ls_serie_contrato,   
					:ll_numero_contrato  
		FROM 		"CONTRATO"  
		WHERE 	"CONTRATO"."ANEXO_LIB" = :ls_anexo   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			ls_base_contrato	= 'C'
			SELECT	"CONTRATO"."SECTOR",   
						"CONTRATO"."SEPULTURA",   
						"CONTRATO"."CAPACIDAD",   
						"CONTRATO"."ZONA"  
			INTO 		:ls_sector_ctto,   
						:ls_sepultura_ctto,   
						:ll_capacidad_ctto,   
						:ls_area_ctto  
			FROM 		"CADENA",   
						"CONTRATO"  
			WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					 (("CADENA"."CODIGO" = :ls_base_contrato ) AND  
					 ( "CADENA"."SERIE" = :ls_serie_contrato ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero_contrato ) )   
			Using		sqlca;

		else
			SELECT	"OFERTA_V"."SERIE",   
						"OFERTA_V"."NRO_OFERTA"  
			INTO 		:ls_serie_contrato,   
						:ll_numero_contrato  
			FROM 		"OFERTA_V"  
			WHERE 	"OFERTA_V"."ANEXO_LIB" = :ls_anexo   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_base_contrato	= 'O'
				SELECT	"PAGO_OFERTA"."CAPACIDAD",   
							"PAGO_OFERTA"."AREA",   
							"PAGO_OFERTA"."SECTOR",   
							"PAGO_OFERTA"."SEPULTURA"  
				INTO 		:ll_capacidad_ctto,   
							:ls_area_ctto,   
							:ls_sector_ctto,   
							:ls_sepultura_ctto  
				FROM 		"CADENA",   
							"OFERTA_V",   
							"PAGO_OFERTA"  
				WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
						 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
						 (("CADENA"."CODIGO" = :ls_base_contrato ) AND  
						 ( "CADENA"."SERIE" = :ls_serie_contrato ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero_contrato ) )   
				USING		sqlca;

			end if
		end if

	end if
	ll_new			= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_base',is_base)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_numero',il_numero)
	if is_base='L' then
		dw_reporte.setitem(1,'sol_rescilia_cliente_base_asociado',ls_base_contrato)
		dw_reporte.getchild('sol_rescilia_cliente_serie_asociado',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.retrieve(ls_base_contrato)
		dw_reporte.setitem(1,'sol_rescilia_cliente_serie_asociado',ls_serie_contrato)
		dw_reporte.setitem(1,'sol_rescilia_cliente_numero_asociado',ll_numero_contrato)
		dw_reporte.setitem(1,'sol_rescilia_cliente_area_sepultura',ls_area_ctto)
		dw_reporte.setitem(1,'sol_rescilia_cliente_sepultura',ls_sepultura_ctto)
		dw_reporte.setitem(1,'sol_rescilia_cliente_sector_sepultura',ls_sector_ctto)
		dw_reporte.setitem(1,'sol_rescilia_cliente_capacidad',ll_capacidad_ctto)
	end if
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_fecha_actual',ldt_fec_hoy)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_celular',ls_celular)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_otro_fono_p',ls_otro_fono_p)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_otro_fono_c',ls_otro_fono_c)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_estado_civil',ls_est_civil)
	if not isnull(ld_fec_res) then
		dw_reporte.setitem(ll_new,'sol_rescilia_cliente_fecha_rescil',ld_fec_res)
	end if
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_prioridad',ls_prioridad)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_usuario_infor','')
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_usuario_opera','')
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_fecha_opera',ldt_fecha_opera)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_fecha_infor',ldt_fecha_infor)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_area_sepultura',ls_area)//
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_sector_sepultura',ls_sector)//
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_sepultura',ls_sepultura)//
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_capacidad',ll_capacidad)//
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_estatus_operacion',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_estado_ctto_origina',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_fecha_rescil_origin',id_fecha_res)
	if ll_cta_repacta>0 or ll_mora>0 then
		dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_mora_com',0)
	else
		dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_mora_com',1)
	end if		
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_imp_pago',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_der_esp',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_aum_capital',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_dis_capital',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_aum_plazo',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_carta_simple',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_carta_notarial',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_finiquito',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_inf_social',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_otro_2',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_sin_antece',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_est_uso_firma_digital',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_direccion_p_origina',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_numero_particular_o',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_depto_particular_or',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_block_particular_or',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_domicilio_c_origina',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_total_renta_origina',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_estado_civil_origin',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_estado_cod_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_rescilia_cliente_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		if len(ls_nombre_usuario)>80 then
			ls_nombre_usuario	= mid(ls_nombre_usuario,1,80)
		end if
		if isnull(ls_nombre_usuario) then
			ls_nombre_usuario			= ''
		end if
		dw_reporte.setitem(ll_new,'sol_rescilia_cliente_usuario',ls_nombre_usuario)
	else
		dw_reporte.setitem(ll_new,'sol_rescilia_cliente_usuario','')
	end if

elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_estatus_operacion')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
////			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
//if cb_aviso
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_resolucion ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac,ldt_fecha_comi
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,ls_estado_comi
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_form_solicitud_resolucion'
dw_reporte.settransobject(sqlca)
//if gs_conexion	= "Parque El Prado" then
//	dw_reporte.object.t_21.text='INMOBILIARIA PARQUE LA FLORIDA S.A.'
//	dw_reporte.object.t_22.text='R.U.T.: 96.844.000-4'
//	dw_reporte.object.t_32.text='Explotación Cementerio'
//	dw_reporte.object.t_23.text='Casa Matriz:  Estado Nº 360, 2º piso - Fono: 380 57 00  Fax: 380 58 06 - Santiago Centro.'
//	dw_reporte.object.t_28.text='Sucursal: Av. Camilo Henriquez Nº 4673 - Fono: 267 00 01  Fax: 267 01 46 - Puente Alto.'
//else
//	dw_reporte.object.t_21.text='INMOBILIARIA PARQUE DE LA SERENA S.A.'
//	dw_reporte.object.t_22.text='R.U.T.: 96.835.970-3'
//	dw_reporte.object.t_32.text='Explotación Cementerio'
//	dw_reporte.object.t_23.text='Dirección: Ruta 41 Sector Aeropuerto Camino Vicuña - Fono: 198 03 19 - Fax: 198 03 25'
//	dw_reporte.object.t_28.text=''
//end if
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemstring(1,'oferta_v_estado_comi')
			ldt_fecha_comi	= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'oferta_v_fecha_com')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= ''
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemstring(1,'anexo_liberador_estado_comi')
			ldt_fecha_comi	= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'anexo_liberador_fecha_com')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemstring(1,'producto_anexo_estado_comi')
			ldt_fecha_comi	= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'producto_anexo_fecha_com')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemstring(1,'anexo_aumento_estado_comi')
			ldt_fecha_comi	= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'anexo_aumento_fecha_com')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= ''
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= ''
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= ''
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_RESOLUCION"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_RESOLUCION"  
   WHERE ( "SOL_RESOLUCION"."BASE" = :is_base ) AND  
         ( "SOL_RESOLUCION"."SERIE" = :is_serie ) AND  
         ( "SOL_RESOLUCION"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_resolucion_base',is_base)
	dw_reporte.setitem(ll_new,'sol_resolucion_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_resolucion_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_resolucion_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_resolucion_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_resolucion_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_resolucion_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_resolucion_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_resolucion_dv_titular',ls_dv)
	dw_reporte.setitem(ll_new,'sol_resolucion_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_resolucion_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_resolucion_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_resolucion_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_resolucion_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_resolucion_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_resolucion_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_resolucion_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_resolucion_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_resolucion_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_resolucion_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_resolucion_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_resolucion_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_resolucion_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_resolucion_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_resolucion_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_resolucion_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_resolucion_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_resolucion_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_resolucion_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_resolucion_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_resolucion_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_resolucion_estatus_operacion',1)
	dw_reporte.setitem(ll_new,'sol_resolucion_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_resolucion_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_resolucion_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_resolucion_estado_comi',ls_estado_comi)
	if isnull(ldt_fecha_comi) or date(ldt_fecha_comi)=date("01/01/1900") or date(ldt_fecha_comi)=date("00/00/0000") then
		setnull(ldt_fecha_comi)
	end if
	dw_reporte.setitem(ll_new,'sol_resolucion_fecha_comi',ldt_fecha_comi)
	dw_reporte.setitem(ll_new,'sol_resolucion_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_resolucion_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_resolucion_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_resolucion_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_resolucion_numero_particular_origina',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_resolucion_depto_particular_original',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_resolucion_block_particular_original',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_resolucion_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_resolucion_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_resolucion_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_resolucion_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_resolucion_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_resolucion_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_resolucion_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_resolucion_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_resolucion_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_resolucion_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_resolucion_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_resolucion_estado_con_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_resolucion_mod_ant_cliente','N')

	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_resolucion_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_resolucion_usuario','') //ok
	end if
//	if dw_reporte.dataobject='dw_form_transferencia' or dw_reporte.dataobject='dw_form_entrega_de_pagare' or &
//		dw_reporte.dataobject='dw_form_contrato_definitivo' or dw_reporte.dataobject='dw_form_titulo_de_dominio' then
//		SELECT	"CADENA"."ESTADO_TITULO"  
//		INTO 		:ls_titulo  
//		FROM 		"CADENA"  
//		WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
//					( "CADENA"."SERIE" = :is_serie ) AND  
//					( "CADENA"."NUMERO" = :il_numero )   
//		Using		sqlca;
//		if sqlca.sqlcode=0 then
//			dw_reporte.setitem(ll_new,'ingreso_solicitudes_titulo_dominio',ls_titulo)
//		else
//			dw_reporte.setitem(ll_new,'ingreso_solicitudes_titulo_dominio','')
//		end if
//		SELECT	"CARTA_LOG"."COD_ACCION"  
//		INTO 		:ll_ctto_def  
//		FROM 		"CARTA_LOG"  
//		WHERE 	( "CARTA_LOG"."BASE" = :is_base ) AND  
//					( "CARTA_LOG"."SERIE" = :is_serie ) AND  
//					( "CARTA_LOG"."NUMERO" = :il_numero )   
//		Using		sqlca;
//		if sqlca.sqlcode=0 then
//			dw_reporte.setitem(ll_new,'ingreso_solicitudes_ctto_definitivo',ll_ctto_def)
//		else
//			dw_reporte.setitem(ll_new,'ingreso_solicitudes_ctto_definitivo',0)
//		end if
//	end if
			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_resolucion_estatus_operacion')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_resolucion_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_seguro ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,&
			ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,ls_ciudad,ls_fono_p,&
			ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob,ls_nota
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg,ll_new, ll_cta_repacta,ll_tipo_seguro_tipo,ll_parque,&
			ll_ctto_def,ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf,ll_tipo_seguro,ll_cod_benef,ll_cod_seguro_benef,ll_tot_reg,ll_indi,ll_count_benf,ll_count_benef_tit

dw_reporte.dataobject	= 'dw_formulario_seguro'
dw_reporte.settransobject(sqlca)
dw_reporte.getchild('sol_seguro_comuna_contacto',idw_detalle)
idw_detalle.settransobject(sqlca)
dw_reporte.getchild('sol_seguro_rut_beneficiario_seguro',idw_detalle2)
idw_detalle.settransobject(sqlca)
dw_reporte.getchild('sol_seguro_tipo_solictud',idw_detalle3)
idw_detalle.settransobject(sqlca)
//dw_sol_benef_seguro.settransobject(sqlca)
//dw_sol_benef_seguro.visible = true
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_reporte.getchild('sol_seguro_rut_beneficiario_seguro',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.reset()
idw_detalle2.insertrow(0)

SELECT DISTINCT	count("BENEFICIARIOS_SEGURO"."RUT")
INTO 		:ll_count_benf
FROM 	"BENEFICIARIOS_SEGURO"  
WHERE 	( "BENEFICIARIOS_SEGURO"."BASE" = :is_base ) AND  
			( "BENEFICIARIOS_SEGURO"."SERIE" = :is_serie ) AND 
			( "BENEFICIARIOS_SEGURO"."NUMERO" = :il_numero )
USING sqlca;

SELECT DISTINCT count("CLIENTE"."RUT")
INTO 	:ll_count_benef_tit
FROM "CADENA",   
         "CLIENTE"  
WHERE ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
         ( ( "CADENA"."CODIGO" = :is_base ) AND  
         ( "CADENA"."SERIE" = :is_serie ) AND  
         ( "CADENA"."NUMERO" = :il_numero ) )
USING sqlca; 

if ll_count_benf > 0 or ll_count_benef_tit > 0 then
	idw_detalle2.retrieve(is_base,is_serie,il_numero)
	cb_grabar.enabled =  true
else
	dw_reporte.object.sol_seguro_rut_beneficiario_seguro.visible = false
	dw_reporte.object.t_28.visible = false
	cb_grabar.enabled =  false
end if	
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_SEGURO"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_SEGURO"  
   WHERE ( "SOL_SEGURO"."BASE" = :is_base ) AND  
         ( "SOL_SEGURO"."SERIE" = :is_serie ) AND  
         ( "SOL_SEGURO"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if

	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   	WHERE 	"CLIENTE"."RUT" = :ll_rut   
   	USING		sqlca;
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_seguro_base',is_base)
	dw_reporte.setitem(ll_new,'sol_seguro_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_seguro_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_seguro_correlativo',il_correlativo)
	
	if is_base='O' then
//------------------------------- INICIO JUAN ------------
		 SELECT 	"CADENA"."COD_PARQUE"
		 INTO		:ll_parque
   		 FROM 	"CADENA"  
 		WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
      			    ( "CADENA"."SERIE" = :is_serie ) AND  
         			( "CADENA"."NUMERO" = :il_numero )   ;


		SELECT	"OFERTA_V"."BENEFICIO_COMPLEMENTARIO"  
		INTO 		:ll_cod_benef  
		FROM 		"OFERTA_V",   
					"PAGO_OFERTA",   
					"CADENA"  
		WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "PAGO_OFERTA"."SERIE" = "CADENA"."SERIE" ) and  
				 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
				 (("OFERTA_V"."SERIE" = :is_serie ) AND  
				 ( "OFERTA_V"."NRO_OFERTA" = :il_numero ) AND  
				 ( "CADENA"."CODIGO" = :is_base ) ) ; 
		if ll_cod_benef = 4 then
			SELECT "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" 
			INTO 	   :ll_cod_seguro_benef  
			FROM 	"TIPO_PROMOCION_ASOCIADOS",   
							"BENEFICIOS_COMPLEMENTARIO_DET"  
				WHERE 	( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
							( ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero )   AND  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = 3 ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = :ll_cod_benef ) )
			USING		sqlca;
			if ll_cod_seguro_benef <> 3 then
				SELECT	"BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" // "BENEFICIOS_COMPLEMENTARIO_DET"."COD_MOV_CONSULTA"  
				INTO 	   	:ll_cod_seguro_benef  
				FROM 	"TIPO_PROMOCION_ASOCIADOS",   
							"BENEFICIOS_COMPLEMENTARIO_DET"	
				WHERE 	( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
							( ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = 8 ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = :ll_cod_benef ) )
				USING sqlca;
				if sqlca.sqlcode=0 then
					dw_reporte.object.t_27.text = 'FORMULARIO APORTE SERVICIO FUNERARIO 25 UF'
					ll_tipo_seguro_tipo	= 3
					//dw_reporte.setitem(ll_new,'sol_seguro_codigo_seguro',ll_cod_seguro_benef)
				end if
			else
				if sqlca.sqlcode=0 then
					dw_reporte.object.t_27.text = 'FORMULARIO APORTE SERVICIO FUNERARIO'
					ll_tipo_seguro_tipo	= 1
					//dw_reporte.setitem(ll_new,'sol_seguro_codigo_seguro',ll_cod_seguro_benef)
				end if
			end if	
		elseif	ll_cod_benef = 6 then
			SELECT  "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" //"BENEFICIOS_COMPLEMENTARIO_DET"."COD_BENEF_DETALLE"  
			INTO 	   :ll_cod_seguro_benef  
			FROM "TIPO_PROMOCION_ASOCIADOS",   
		         	"BENEFICIOS_COMPLEMENTARIO_DET"  
		   	WHERE 	( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
		         		( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
		         		( ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
		         		( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
		         		( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero ) AND  
		         		( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = 17 ) AND  
		         		( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = :ll_cod_benef ) )
			USING		sqlca;
			if ll_cod_seguro_benef <> 17 then
				SELECT  "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" //"BENEFICIOS_COMPLEMENTARIO_DET"."COD_BENEF_DETALLE"  
				INTO 	   :ll_cod_seguro_benef  
				FROM "TIPO_PROMOCION_ASOCIADOS",   
							"BENEFICIOS_COMPLEMENTARIO_DET"  
					WHERE 	( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
								( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
								( ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
								( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
								( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero ) AND  
								( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = 21 ) AND  
								( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = :ll_cod_benef ) )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_reporte.object.t_27.text = 'FORMULARIO SEGURO ASISTENCIA FUNERARIA'
//					dw_reporte.setitem(ll_new,'sol_seguro_codigo_seguro',ll_cod_seguro_benef)
				end if
			else
				if sqlca.sqlcode=0 then
					dw_reporte.object.t_27.text = 'FORMULARIO SEGURO ASISTENCIA FUNERARIA'
					//dw_reporte.setitem(ll_new,'sol_seguro_codigo_seguro',ll_cod_seguro_benef)
				end if
			end if	
		else
			SELECT "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" 
			INTO 	   :ll_cod_seguro_benef  
			FROM 	"TIPO_PROMOCION_ASOCIADOS",   
							"BENEFICIOS_COMPLEMENTARIO_DET"  
				WHERE 	( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
							( ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero )   AND  
							( "BENEFICIOS_COMPLEMENTARIO_DET"."COD_MOV_CONSULTA" = '15' ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = :ll_cod_benef ) )
			USING		sqlca;
			if ll_cod_seguro_benef > 0 then
				ll_tipo_seguro			= 5
				ll_tipo_seguro_tipo	= 3
				dw_reporte.object.t_27.text = 'FORMULARIO APORTE SERVICIO FUNERARIO UF 25'
				dw_reporte.object.sol_seguro_autorizacion_expresa.visible = true
				dw_reporte.object.t_43.visible = true
			end if			
//			if is_base = 'O' and is_serie = 'C' then
//				dw_reporte.object.t_27.text = 'FORMULARIO APORTE SERVICIO FUNERARIO UF 25'
//				dw_reporte.object.sol_seguro_autorizacion_expresa.visible = true
//				dw_reporte.object.t_43.visible = true
//			end if	
		end if
		dw_reporte.accepttext()
		if ll_cod_seguro_benef = 3 then
			ll_tipo_seguro		= 7
		//	ls_nota				= 'El valor de este voucher equivale a UF 25, su uso exclusivo en funeraria Grupo Nuestros Parques'
			ls_nota				= 'Titular autoriza a destinar el aporte de UF 25, para el pago del servicio funerario realizado por Funeraria Grupo Nuestros Parques S/N'
			dw_reporte.setitem(ll_new,'sol_seguro_autorizacion_expresa','N')
			ll_tipo_seguro_tipo	= 1
		elseif ll_cod_seguro_benef = 8 then
			ll_tipo_seguro		= 5
			//ls_nota				= 'El beneficio equivale a un servicio funerario Estándar, aplica solo por única vez'
			ls_nota				= 'El valor de este voucher equivale a UF 25, su uso exclusivo en funeraria Grupo Nuestros Parques'
			ll_tipo_seguro_tipo	= 3
		elseif ll_cod_seguro_benef = 17 or ll_cod_seguro_benef = 21 then
			ll_tipo_seguro		= 5
			ls_nota		= 'El beneficio equivale a un servicio funerario Estándar, aplica solo por única vez.'
			ll_tipo_seguro_tipo	= 2
		else
			if ll_parque = 101 then
				if is_base = 'O' and is_serie = 'C' then
					ll_tipo_seguro	= 5
					ll_tipo_seguro_tipo	= 2
				//	ls_nota		= 'Titular autoriza a destinar el aporte de UF 25, para el pago del servicio funerario realizado por Funeraria Grupo Nuestros Parques SI _ NO _'
					ls_nota		= 'EL Beneficio Equivale a un Servicio Funerario Estándar, Aplica Solo Por Unica Vez.'
					dw_reporte.setitem(ll_new,'sol_seguro_autorizacion_expresa','N')
				else
//					ll_tipo_seguro	= 5
//					ll_tipo_seguro_tipo	= 3
//				//	ls_nota		= 'EL Beneficio Equivale a un Servicio Funerario Estándar, Aplica Solo Por Unica Vez.'
//					ls_nota		= 'Titular autoriza a destinar el aporte de UF 25, para el pago del servicio funerario realizado por Funeraria Grupo Nuestros Parques SI _ NO _'
//					dw_reporte.setitem(ll_new,'sol_seguro_autorizacion_expresa','N')
				end if	
			else
				cb_grabar.enabled =  false
			end if
		end if	
		dw_reporte.setitem(ll_new,'sol_seguro_codigo_seguro',ll_tipo_seguro)
		dw_reporte.setitem(ll_new,'sol_seguro_tipo_solictud',ll_tipo_seguro_tipo)
			//dw_reporte.setitem(ll_new,'sol_seguro_codigo_seguro',ll_tipo_seguro)
//-------------------------------------- JUAN FIN------------------		

//		SELECT	"PAGO_OFERTA"."CODIGO_TIPO_SEGURO"  
//		INTO 		:ll_tipo_seguro  
//		FROM 		"OFERTA_V",   
//					"PAGO_OFERTA",   
//					"CADENA"  
//		WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
//				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
//				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
//				 ( "PAGO_OFERTA"."SERIE" = "CADENA"."SERIE" ) and  
//				 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
//				 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
//				 (("OFERTA_V"."SERIE" = :is_serie ) AND  
//				 ( "OFERTA_V"."NRO_OFERTA" = :il_numero ) AND  
//				 ( "CADENA"."CODIGO" = :is_base ) )   
//		USING		sqlca;
//		if sqlca.sqlcode=0 then
//			dw_reporte.setitem(ll_new,'sol_seguro_codigo_seguro',ll_tipo_seguro)
//			//dw_reporte.setitem(ll_new,'sol_seguro_codigo_seguro',ll_tipo_seguro)
//		end if
	end if
	dw_reporte.setitem(ll_new,'sol_seguro_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_seguro_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_seguro_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_seguro_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_seguro_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_seguro_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_seguro_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_seguro_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_seguro_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_seguro_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_seguro_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_seguro_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_seguro_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_seguro_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_seguro_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_seguro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_seguro_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_seguro_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_seguro_direccion_fall',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_seguro_f_fono_casa',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_seguro_f_fono_of',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_seguro_f_celular','')
	dw_reporte.setitem(ll_new,'sol_seguro_f_fono_otro','')
	dw_reporte.setitem(ll_new,'sol_seguro_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_seguro_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_seguro_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_seguro_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_seguro_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_seguro_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_seguro_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_seguro_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_seguro_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_seguro_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_seguro_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_seguro_estatus_operaciones',1)
	dw_reporte.setitem(ll_new,'sol_seguro_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_seguro_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_seguro_est_cert_defuncion',1)
	dw_reporte.setitem(ll_new,'sol_seguro_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_seguro_cod_supervisor',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_seguro_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_seguro_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_seguro_numero_particular_original',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_seguro_depto_particular_original',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_seguro_block_particular_original',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_seguro_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_seguro_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_seguro_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_seguro_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_seguro_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_seguro_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_seguro_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_seguro_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_seguro_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_seguro_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_seguro_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_seguro_estado_cob_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_seguro_nota',ls_nota)
	dw_reporte.setitem(ll_new,'sol_seguro_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_seguro_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_seguro_usuario','') //ok
	end if
			
elseif is_estado="M" then
	if dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)>0 then
		ll_est_ope	= dw_reporte.getitemnumber(1,'sol_seguro_estatus_operaciones')
		ll_est_inf	= dw_reporte.getitemnumber(1,'sol_seguro_estatus_informatica')
		ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
		//----JUAN ---------------
		SELECT	"OFERTA_V"."BENEFICIO_COMPLEMENTARIO"  
		INTO 		:ll_cod_benef  
		FROM 		"OFERTA_V",   
					"PAGO_OFERTA",   
					"CADENA"  
		WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "PAGO_OFERTA"."SERIE" = "CADENA"."SERIE" ) and  
				 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
				 (("OFERTA_V"."SERIE" = :is_serie ) AND  
				 ( "OFERTA_V"."NRO_OFERTA" = :il_numero ) AND  
				 ( "CADENA"."CODIGO" = :is_base ) ) ; 
		if ll_cod_benef = 4 then
			SELECT "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" 
			INTO 	   :ll_cod_seguro_benef  
			FROM 	"TIPO_PROMOCION_ASOCIADOS",   
							"BENEFICIOS_COMPLEMENTARIO_DET"  
				WHERE 	( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
							( ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero )   AND  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = 3 ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = :ll_cod_benef ) )
			USING		sqlca;
			if ll_cod_seguro_benef <> 3 then
				SELECT	"BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" // "BENEFICIOS_COMPLEMENTARIO_DET"."COD_BENEF_DETALLE"  
				INTO 	   	:ll_cod_seguro_benef  
				FROM 	"TIPO_PROMOCION_ASOCIADOS",   
							"BENEFICIOS_COMPLEMENTARIO_DET"	
				WHERE 	( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
							( ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = 8 ) AND  
							( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = :ll_cod_benef ) )
				USING sqlca;
				if sqlca.sqlcode=0 then
					dw_reporte.object.t_27.text = 'FORMULARIO APORTE SERVICIO FUNERARIO 25 UF'
		
					//dw_reporte.setitem(ll_new,'sol_seguro_codigo_seguro',ll_cod_seguro_benef)
				end if
			else
				if sqlca.sqlcode=0 then
					dw_reporte.object.t_27.text = 'FORMULARIO APORTE SERVICIO FUNERARIO'
					//dw_reporte.setitem(ll_new,'sol_seguro_codigo_seguro',ll_cod_seguro_benef)
				end if
			end if	
		elseif	ll_cod_benef = 6 then
			SELECT  "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" //"BENEFICIOS_COMPLEMENTARIO_DET"."COD_BENEF_DETALLE"  
			INTO 	   :ll_cod_seguro_benef  
			FROM "TIPO_PROMOCION_ASOCIADOS",   
		         	"BENEFICIOS_COMPLEMENTARIO_DET"  
		   	WHERE 	( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
		         		( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
		         		( ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
		         		( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
		         		( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero ) AND  
		         		( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = 17 ) AND  
		         		( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = :ll_cod_benef ) )
			USING		sqlca;
			if ll_cod_seguro_benef <> 17 then
				SELECT  "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" //"BENEFICIOS_COMPLEMENTARIO_DET"."COD_BENEF_DETALLE"  
				INTO 	   :ll_cod_seguro_benef  
				FROM "TIPO_PROMOCION_ASOCIADOS",   
							"BENEFICIOS_COMPLEMENTARIO_DET"  
					WHERE 	( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
								( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
								( ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
								( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
								( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero ) AND  
								( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = 17 ) AND  
								( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = :ll_cod_benef ) )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_reporte.object.t_27.text = 'FORMULARIO SEGURO ASISTENCIA FUNERARIA'
//					dw_reporte.setitem(ll_new,'sol_seguro_codigo_seguro',ll_cod_seguro_benef)
				end if
			else
				if sqlca.sqlcode=0 then
					dw_reporte.object.t_27.text = 'FORMULARIO SEGURO ASISTENCIA FUNERARIA'
					//dw_reporte.setitem(ll_new,'sol_seguro_codigo_seguro',ll_cod_seguro_benef)
				end if
			end if	
		else
			if is_base = 'O' and is_serie = 'C' then
				dw_reporte.object.t_27.text = 'FORMULARIO APORTE SERVICIO FUNERARIO UF 25'
			end if	
		end if
		dw_reporte.accepttext()
		//----JUAN FIN--
		if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
			cb_grabar.enabled					= false
	//		cb_imprimir.enabled				= false
		else
			if trim(gs_opera)='1' then
				cb_grabar.enabled				= true
	//			cb_actualiza_datos.enabled	= true
	//			cb_imprimir.enabled			= true
			else
				cb_grabar.enabled				= false
	//			cb_actualiza_datos.enabled	= false
	//			cb_imprimir.enabled			= false
			end if
		end if
	end if
end if
cb_aviso.visible								= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_titulo_dominio ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_form_titulo_de_dominio'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_TIT_DOMINIO"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_TIT_DOMINIO"  
   WHERE ( "SOL_TIT_DOMINIO"."BASE" = :is_base ) AND  
         ( "SOL_TIT_DOMINIO"."SERIE" = :is_serie ) AND  
         ( "SOL_TIT_DOMINIO"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_tit_dominio_base',is_base)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_prioridad','N')
	dw_reporte.setitem(ll_new,'sol_tit_dominio_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_area_sepultura',ls_area)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_sector_sepultura',ls_sector)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_capacidad',ll_capacidad)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_estatus_operaciones',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_est_carta_simple',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_est_carta_notarial',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_est_pos_efectiva',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_est_sin_antece',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_numero_particular_origin',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_depto_particular_origina',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_block_particular_origina',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_estado_cod_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_tit_dominio_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_tit_dominio_usuario','') //ok
	end if
	SELECT count("FALLECIDOS"."LLAVE")  
   INTO :ll_count_reg  
   FROM "FALLECIDOS"  
   WHERE ( "FALLECIDOS"."BASE" = :is_base ) AND  
         ( "FALLECIDOS"."SS" = :is_serie ) AND  
         ( "FALLECIDOS"."CONTRATO" = :il_numero )   AND
		( "FALLECIDOS"."ESTADO_REG" = 'A' ) 
	Using	sqlca;
	if sqlca.sqlcode=0 then
		if ll_count_reg>0 then
			dw_reporte.setitem(ll_new,'sol_tit_dominio_sepultado','Si')
		else
			dw_reporte.setitem(ll_new,'sol_tit_dominio_sepultado','No')
		end if
	else
		dw_reporte.setitem(ll_new,'sol_tit_dominio_sepultado','No')
	end if
	SELECT	"CADENA"."ESTADO_TITULO"  
	INTO 		:ls_titulo  
	FROM 		"CADENA"  
	WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
				( "CADENA"."SERIE" = :is_serie ) AND  
				( "CADENA"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_tit_dominio_titulo_dominio',ls_titulo)
	else
		dw_reporte.setitem(ll_new,'sol_tit_dominio_titulo_dominio','')
	end if
	SELECT	"CARTA_LOG"."COD_ACCION"  
	INTO 		:ll_ctto_def  
	FROM 		"CARTA_LOG"  
	WHERE 	( "CARTA_LOG"."BASE" = :is_base ) AND  
				( "CARTA_LOG"."SERIE" = :is_serie ) AND  
				( "CARTA_LOG"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_tit_dominio_ctto_definitivo',ll_ctto_def)
	else
		dw_reporte.setitem(ll_new,'sol_tit_dominio_ctto_definitivo',0)
	end if
			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_tit_dominio_estatus_operaciones')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_tit_dominio_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_transferencia ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_form_transferencia'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_TRANSFERENCIA"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_TRANSFERENCIA"  
   WHERE ( "SOL_TRANSFERENCIA"."BASE" = :is_base ) AND  
         ( "SOL_TRANSFERENCIA"."SERIE" = :is_serie ) AND  
         ( "SOL_TRANSFERENCIA"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	dw_reporte.setitem(ll_new,'sol_transferencia_base',is_base)
	dw_reporte.setitem(ll_new,'sol_transferencia_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_transferencia_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_transferencia_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_transferencia_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_transferencia_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_transferencia_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_transferencia_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_transferencia_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_transferencia_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_transferencia_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_transferencia_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_transferencia_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_transferencia_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_transferencia_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_transferencia_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_transferencia_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_transferencia_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_transferencia_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_transferencia_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_transferencia_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_transferencia_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_transferencia_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_transferencia_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_transferencia_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_transferencia_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_transferencia_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_transferencia_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_transferencia_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_transferencia_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_transferencia_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_transferencia_prioridad','N')
	dw_reporte.setitem(ll_new,'sol_transferencia_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_transferencia_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_transferencia_area_sepultura',ls_area)
	dw_reporte.setitem(ll_new,'sol_transferencia_sector_sepultura',ls_sector)
	dw_reporte.setitem(ll_new,'sol_transferencia_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_transferencia_capacidad',ll_capacidad)
	dw_reporte.setitem(ll_new,'sol_transferencia_estatus_operaciones',1)
	dw_reporte.setitem(ll_new,'sol_transferencia_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_transferencia_est_carta_simple',1)
	dw_reporte.setitem(ll_new,'sol_transferencia_est_carta_notarial',1)
	dw_reporte.setitem(ll_new,'sol_transferencia_est_finiquito',1)
	dw_reporte.setitem(ll_new,'sol_transferencia_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_transferencia_est_inf_social',1)
	dw_reporte.setitem(ll_new,'sol_transferencia_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_transferencia_est_sin_antece',1)
	dw_reporte.setitem(ll_new,'sol_transferencia_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_transferencia_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_transferencia_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_transferencia_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_transferencia_numero_particular_orig',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_transferencia_depto_particular_origi',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_transferencia_block_particular_origi',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_transferencia_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_transferencia_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_transferencia_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_transferencia_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_transferencia_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_transferencia_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_transferencia_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_transferencia_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_transferencia_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_transferencia_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_transferencia_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_transferencia_estado_cod_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_transferencia_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_transferencia_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_transferencia_usuario','') //ok
	end if
	SELECT count("FALLECIDOS"."LLAVE")  
   INTO :ll_count_reg  
   FROM "FALLECIDOS"  
   WHERE ( "FALLECIDOS"."BASE" = :is_base ) AND  
         ( "FALLECIDOS"."SS" = :is_serie ) AND  
         ( "FALLECIDOS"."CONTRATO" = :il_numero )    AND
		( "FALLECIDOS"."ESTADO_REG" = 'A' )
	Using	sqlca;
	if sqlca.sqlcode=0 then
		if ll_count_reg>0 then
			dw_reporte.setitem(ll_new,'sol_transferencia_sepultado','Si')
		else
			dw_reporte.setitem(ll_new,'sol_transferencia_sepultado','No')
		end if
	else
		dw_reporte.setitem(ll_new,'sol_transferencia_sepultado','No')
	end if
	SELECT	"CADENA"."ESTADO_TITULO"  
	INTO 		:ls_titulo  
	FROM 		"CADENA"  
	WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
				( "CADENA"."SERIE" = :is_serie ) AND  
				( "CADENA"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_transferencia_titulo_dominio',ls_titulo)
	else
		dw_reporte.setitem(ll_new,'sol_transferencia_titulo_dominio','')
	end if
	SELECT	"CARTA_LOG"."COD_ACCION"  
	INTO 		:ll_ctto_def  
	FROM 		"CARTA_LOG"  
	WHERE 	( "CARTA_LOG"."BASE" = :is_base ) AND  
				( "CARTA_LOG"."SERIE" = :is_serie ) AND  
				( "CARTA_LOG"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_transferencia_ctto_definitivo',ll_ctto_def)
	else
		dw_reporte.setitem(ll_new,'sol_transferencia_ctto_definitivo',0)
	end if

			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_transferencia_estatus_operaciones')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_transferencia_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_form_reactivacion_ctto_resuelto'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut				= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut				= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut				= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut				= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut				= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_REACTIVA"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_REACTIVA"  
   WHERE ( "SOL_REACTIVA"."BASE" = :is_base ) AND  
         ( "SOL_REACTIVA"."SERIE" = :is_serie ) AND  
         ( "SOL_REACTIVA"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob  	,					:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	if dw_reporte.dataobject='dw_form_reactivacion_ctto_resuelto' then
		dw_reporte.setitem(ll_new,'sol_reactiva_base',is_base)
		dw_reporte.setitem(ll_new,'sol_reactiva_serie',is_serie)
		dw_reporte.setitem(ll_new,'sol_reactiva_numero',il_numero)
		dw_reporte.setitem(ll_new,'sol_reactiva_correlativo',il_correlativo)
		dw_reporte.setitem(ll_new,'sol_reactiva_ap_paterno',ls_a_pat)
		dw_reporte.setitem(ll_new,'sol_reactiva_ap_materno',ls_a_mat)
		dw_reporte.setitem(ll_new,'sol_reactiva_nombre',ls_nombre)
		dw_reporte.setitem(ll_new,'sol_reactiva_rut_titular',ll_rut)
		dw_reporte.setitem(ll_new,'sol_reactiva_dv',ls_dv)
		dw_reporte.setitem(ll_new,'sol_reactiva_fecha_rescil_original',id_fecha_res)
		dw_reporte.setitem(ll_new,'sol_reactiva_estado_ctto_original',is_estado_cadena)
		dw_reporte.setitem(ll_new,'sol_reactiva_fecha_actual',gdt_fec_sistema)
		dw_reporte.setitem(ll_new,'sol_reactiva_direccion_p',ls_direc_p)
		dw_reporte.setitem(ll_new,'sol_reactiva_tipo_via',ls_tipo_via)
		dw_reporte.setitem(ll_new,'sol_reactiva_numero_particular',ls_nro_part)
		dw_reporte.setitem(ll_new,'sol_reactiva_depto_particular',ls_depto_part)
		dw_reporte.setitem(ll_new,'sol_reactiva_block_particular',ls_block_part)
		dw_reporte.setitem(ll_new,'sol_reactiva_poblacion',ls_pob)
		dw_reporte.setitem(ll_new,'sol_reactiva_sector',ls_sector_cli)
		dw_reporte.setitem(ll_new,'sol_reactiva_comuna',ls_comuna)
		dw_reporte.setitem(ll_new,'sol_reactiva_ciudad',ls_ciudad)
		dw_reporte.setitem(ll_new,'sol_reactiva_fono_p',ls_fono_p)
		dw_reporte.setitem(ll_new,'sol_reactiva_otro_fono_p',ls_fono_p)
		dw_reporte.setitem(ll_new,'sol_reactiva_domicilio_c',ls_domic_c)
		dw_reporte.setitem(ll_new,'sol_reactiva_fono_c',ls_fono_c)
		dw_reporte.setitem(ll_new,'sol_reactiva_fecha_nac',ld_fec_nac)
		dw_reporte.setitem(ll_new,'sol_reactiva_total_renta',ll_tot_renta)
		dw_reporte.setitem(ll_new,'sol_reactiva_grupo_f',ll_grupo_f)
		dw_reporte.setitem(ll_new,'sol_reactiva_estado_cob',ls_est_cob)
		dw_reporte.setitem(ll_new,'sol_reactiva_estado_civil',ls_est_civil)
		dw_reporte.setitem(ll_new,'sol_reactiva_fecha_rescil',ld_fec_res)
		dw_reporte.setitem(ll_new,'sol_reactiva_mora_mant',ll_mora)
		dw_reporte.setitem(ll_new,'sol_reactiva_mora_credito',ll_cta_repacta)
		dw_reporte.setitem(ll_new,'sol_reactiva_prioridad','N')
		dw_reporte.setitem(ll_new,'sol_reactiva_estatus_operacion',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_estatus_informatica',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_cancel_credito',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_cancel_todo_cheque',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_cancel_todo_efectivo',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_otro_1',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_carta_simple',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_carta_notarial',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_fotocopia_pag',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_carta_finan',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_finiquito',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_fotocopia_carne',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_inf_social',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_otro_2',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_est_sin_antece',1)
		dw_reporte.setitem(ll_new,'sol_reactiva_cod_agente',ls_cod_age)
		dw_reporte.setitem(ll_new,'sol_reactiva_cod_super',ls_cod_sup)
		dw_reporte.setitem(ll_new,'sol_reactiva_direccion_p_original',ls_direc_p)
		dw_reporte.setitem(ll_new,'sol_reactiva_tipo_via_original',ls_tipo_via)
		dw_reporte.setitem(ll_new,'sol_reactiva_numero_particular_original',ls_nro_part)
		dw_reporte.setitem(ll_new,'sol_reactiva_depto_particular_original',ls_depto_part)
		dw_reporte.setitem(ll_new,'sol_reactiva_block_particular_original',ls_block_part)
		dw_reporte.setitem(ll_new,'sol_reactiva_poblacion_original',ls_pob)
		dw_reporte.setitem(ll_new,'sol_reactiva_sector_original',ls_sector_cli)
		dw_reporte.setitem(ll_new,'sol_reactiva_comuna_original',ls_comuna)
		dw_reporte.setitem(ll_new,'sol_reactiva_ciudad_original',ls_ciudad)
		dw_reporte.setitem(ll_new,'sol_reactiva_fono_p_original',ls_fono_p)
		dw_reporte.setitem(ll_new,'sol_reactiva_domicilio_c_original',ls_domic_c)
		dw_reporte.setitem(ll_new,'sol_reactiva_fono_c_original',ls_fono_c)
		dw_reporte.setitem(ll_new,'sol_reactiva_fecha_nac_original',ld_fec_nac)
		dw_reporte.setitem(ll_new,'sol_reactiva_total_renta_original',ll_tot_renta)
		dw_reporte.setitem(ll_new,'sol_reactiva_grupo_f_original',ll_grupo_f)
		dw_reporte.setitem(ll_new,'sol_reactiva_estado_civil_original',ls_est_civil)
		dw_reporte.setitem(ll_new,'sol_reactiva_estado_cob_original',ls_est_cob)
		dw_reporte.setitem(ll_new,'sol_reactiva_mod_ant_cliente','N')
	end if
	SELECT count("FALLECIDOS"."LLAVE")  
   INTO :ll_count_reg  
   FROM "FALLECIDOS"  
   WHERE ( "FALLECIDOS"."BASE" = :is_base ) AND  
         ( "FALLECIDOS"."SS" = :is_serie ) AND  
         ( "FALLECIDOS"."CONTRATO" = :il_numero )    AND
		( "FALLECIDOS"."ESTADO_REG" = 'A' )
	Using	sqlca;
	if sqlca.sqlcode=0 then
		if ll_count_reg>0 then
			dw_reporte.setitem(ll_new,'sol_reactiva_est_tiene_sep',0) //ok
		else
			dw_reporte.setitem(ll_new,'sol_reactiva_est_tiene_sep',1) //ok
		end if
	else
		dw_reporte.setitem(ll_new,'sol_reactiva_est_tiene_sep',1) //ok
	end if
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_reactiva_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_reactiva_usuario','') //ok
	end if
	if dw_reporte.dataobject='dw_form_transferencia' or dw_reporte.dataobject='dw_form_entrega_de_pagare' or &
		dw_reporte.dataobject='dw_form_contrato_definitivo' or dw_reporte.dataobject='dw_form_titulo_de_dominio' then
		SELECT	"CADENA"."ESTADO_TITULO"  
		INTO 		:ls_titulo  
		FROM 		"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
					( "CADENA"."SERIE" = :is_serie ) AND  
					( "CADENA"."NUMERO" = :il_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			dw_reporte.setitem(ll_new,'ingreso_solicitudes_titulo_dominio',ls_titulo)
		else
			dw_reporte.setitem(ll_new,'ingreso_solicitudes_titulo_dominio','')
		end if
		SELECT	"CARTA_LOG"."COD_ACCION"  
		INTO 		:ll_ctto_def  
		FROM 		"CARTA_LOG"  
		WHERE 	( "CARTA_LOG"."BASE" = :is_base ) AND  
					( "CARTA_LOG"."SERIE" = :is_serie ) AND  
					( "CARTA_LOG"."NUMERO" = :il_numero )   
		Using		sqlca;
		if sqlca.sqlcode=0 then
			dw_reporte.setitem(ll_new,'ingreso_solicitudes_ctto_definitivo',ll_ctto_def)
		else
			dw_reporte.setitem(ll_new,'ingreso_solicitudes_ctto_definitivo',0)
		end if
	end if
			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_reactiva_estatus_operacion')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_reactiva_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
cb_grabar.enabled						= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_ultima_voluntad ();Long		ll_new,ll_cod_parque,ll_rut,ll_capacidad
Datetime	ldt_fecha_ctto,ldt_fecha_creacion
String	ls_uso,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_area,ls_sector,ls_sepultura,&
			ls_n_reduccion,ls_dir_p,ls_tipo_via_p,ls_nro_p,ls_depto_p,ls_block_p,&
			ls_pob_p,ls_sector_p,ls_comuna_p,ls_ciudad_p,ls_descrip_via

ldt_fecha_creacion			= datetime(date(gdt_fec_sistema),time('00:00:00'))
dw_reporte.dataobject		= 'dw_form_ultima_voluntad'
dw_reporte.settransobject(sqlca)
dw_ingreso_coprop.settransobject(sqlca)
if is_estado="N" then
	ll_new						= dw_reporte.insertrow(0)
	SELECT	MAX("SOL_ULTIMA_VOLUNTAD"."CORRELATIVO")
   INTO 		:il_correlativo
   FROM 		"SOL_ULTIMA_VOLUNTAD"  
   WHERE  ( "SOL_ULTIMA_VOLUNTAD"."BASE" = :is_base ) AND  
          ( "SOL_ULTIMA_VOLUNTAD"."SERIE" = :is_serie ) AND  
          ( "SOL_ULTIMA_VOLUNTAD"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	if is_base='O' or is_base='U' then
		SELECT	"OFERTA_V"."FECHA",	"CADENA"."COD_PARQUE",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"PAGO_OFERTA"."AREA",	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"PAGO_OFERTA"."CAPACIDAD",	"PAGO_OFERTA"."N_REDUCCION",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD"
		INTO 		:ldt_fecha_ctto,		:ll_cod_parque,			:ll_rut,				:ls_dv,				:ls_nombre,				:ls_ap_pat,					:ls_ap_mat,					:ls_area,					:ls_sector,					:ls_sepultura,					:ll_capacidad,					:ls_n_reduccion,					:ls_dir_p,						:ls_tipo_via_p,			:ls_nro_p,								:ls_depto_p,						:ls_block_p,						:ls_pob_p,					:ls_sector_p,			:ls_comuna_p,			:ls_ciudad_p
		FROM 		"CADENA",	"CLIENTE",	"OFERTA_V",	"PAGO_OFERTA"  
		WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 (("CADENA"."CODIGO" = :is_base ) AND  
				 ( "CADENA"."SERIE" = :is_serie ) AND  
				 ( "CADENA"."NUMERO" = :il_numero ) )   
		USING		sqlca;
   elseif is_base='C' then
		SELECT	"CONTRATO"."FECHA",	"CADENA"."COD_PARQUE",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CONTRATO"."ZONA",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."CAPACIDAD",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD"
		INTO		:ldt_fecha_ctto,		:ll_cod_parque,			:ll_rut,				:ls_dv,				:ls_nombre,				:ls_ap_pat,					:ls_ap_mat,					:ls_area,				:ls_sector,				:ls_sepultura,				:ll_capacidad,				:ls_dir_p,						:ls_tipo_via_p,			:ls_nro_p,								:ls_depto_p,						:ls_block_p,						:ls_pob_p,					:ls_sector_p,			:ls_comuna_p,			:ls_ciudad_p
		FROM 		"CADENA",	"CLIENTE",	"CONTRATO"  
		WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
				 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
				 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 (("CADENA"."CODIGO" = :is_base ) AND  
				 ( "CADENA"."SERIE" = :is_serie ) AND  
				 ( "CADENA"."NUMERO" = :il_numero ) )   
		USING		sqlca;
		ls_n_reduccion	= '-'
		
   elseif is_base='L' then
		SELECT	"PAGO_LIBERADOR"."FECHA",	"CADENA"."COD_PARQUE",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO"  
		INTO		:ldt_fecha_ctto,				:ll_cod_parque,			:ll_rut,				:ls_dv,				:ls_nombre,				:ls_ap_pat,					:ls_ap_mat
		FROM		"ANEXO_LIBERADOR",	"CADENA",	"CLIENTE",	"PAGO_LIBERADOR"  
		WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
				 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
				 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
				 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
				 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
				 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 (("CADENA"."CODIGO" = :is_base ) AND  
				 ( "CADENA"."SERIE" = :is_serie ) AND  
				 ( "CADENA"."NUMERO" = :il_numero ) )   
		USING		sqlca;
	elseif is_base='F' or is_base='G' then
		SELECT	"PRODUCTO_PAGO"."FECHA",	"CADENA"."COD_PARQUE",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO"  
		INTO		:ldt_fecha_ctto,						:ll_cod_parque,					:ll_rut,				:ls_dv,				:ls_nombre,					:ls_ap_pat,						:ls_ap_mat
		FROM		"PRODUCTO_ANEXO",	"CADENA",	"CLIENTE",	"PRODUCTO_PAGO"  
		WHERE  ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
				 ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
				 ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
				 ( "PRODUCTO_ANEXO"."SERIE" = "CADENA"."SERIE" ) and  
				 ( "PRODUCTO_ANEXO"."NUMERO" = "CADENA"."NUMERO" ) and  
				 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 (("CADENA"."CODIGO" = :is_base ) AND  
				 ( "CADENA"."SERIE" = :is_serie ) AND  
				 ( "CADENA"."NUMERO" = :il_numero ) )   
		USING		sqlca;
	elseif is_base='P' then
		SELECT	"PAGARE"."FECHA",	"CADENA"."COD_PARQUE",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO"  
		INTO		:ldt_fecha_ctto,	:ll_cod_parque,			:ll_rut,				:ls_dv,				:ls_nombre,				:ls_ap_pat,					:ls_ap_mat
		FROM 		"CADENA",	"CLIENTE",	"PAGARE"  
		WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
				 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
				 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 (("CADENA"."CODIGO" = :is_base ) AND  
				 ( "CADENA"."SERIE" = :is_serie ) AND  
				 ( "CADENA"."NUMERO" = :il_numero ) )   
		USING		sqlca;
   elseif is_base='A' then
	  	SELECT	"PAGO_AUMENTO"."FECHA",	"CADENA"."COD_PARQUE",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO"  
		INTO		:ldt_fecha_ctto,			:ll_cod_parque,			:ll_rut,				:ls_dv,				:ls_nombre,				:ls_ap_pat,					:ls_ap_mat
		FROM 		"ANEXO_AUMENTO",	"CADENA",	"CLIENTE",	"PAGO_AUMENTO"  
		WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
				 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
				 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
				 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
				 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
				 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 (("CADENA"."CODIGO" = :is_base ) AND  
				 ( "CADENA"."SERIE" = :is_serie ) AND  
				 ( "CADENA"."NUMERO" = :il_numero ) )   
		USING		sqlca;
   elseif is_base='D' then
		SELECT	"DERECHO"."FECHA",	"CADENA"."COD_PARQUE",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO"  
		INTO		:ldt_fecha_ctto,		:ll_cod_parque,			:ll_rut,				:ls_dv,				:ls_nombre,				:ls_ap_pat,					:ls_ap_mat
		FROM		"CADENA",	"CLIENTE",	"DERECHO"  
		WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
				 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
				 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 (("CADENA"."CODIGO" = :is_base ) AND  
				 ( "CADENA"."SERIE" = :is_serie ) AND  
				 ( "CADENA"."NUMERO" = :il_numero ) )   
		USING		sqlca;
	end if
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_fecha_creacion',ldt_fecha_creacion)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_fecha_contrato',ldt_fecha_ctto)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_base',is_base)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_serie',is_serie)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_numero',il_numero)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_cod_parque',ll_cod_parque)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_rut_titular',ll_rut)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_dv_titular',ls_dv)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_correlativo',il_correlativo)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_nombre_titular',ls_nombre)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_ap_pat_titular',ls_ap_pat)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_ap_mat_titular',ls_ap_mat)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_estatus_opera',1)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_estatus_infor',1)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_mod_ant_cliente','N')
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_direccion_p',ls_dir_p)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_nro_p',ls_nro_p)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_depto_p',ls_depto_p)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_block_p',ls_block_p)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_sepultura',ls_sepultura)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_sector',ls_sector)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_area',ls_area)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_capacidad',ll_capacidad)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_n_reduccion',ls_n_reduccion)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_tipo_via',ls_tipo_via_p)
		SELECT	"TIPO_VIA"."DESCRIPCION"  
		INTO 		:ls_descrip_via  
		FROM 		"TIPO_VIA"  
		WHERE 	"TIPO_VIA"."TIPO_VIA" = :ls_tipo_via_p
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_reporte.setitem(ll_new,'tipo_via_descripcion',ls_descrip_via)
		end if
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_poblacion_p',ls_pob_p)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_comuna_p',ls_comuna_p)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_ciudad_p',ls_ciudad_p)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_sector_p',ls_sector_p)
		dw_reporte.setitem(ll_new,'sol_ultima_voluntad_fecha_tramite_notari',date(gdt_fec_sistema))
	end if
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
end if
dw_reporte.accepttext()
if dw_reporte.getitemnumber(1,'sol_ultima_voluntad_estatus_infor')=0 then
	if cb_grabar.enabled=true then 
		cb_grabar.enabled		= false
	end if
end if
end subroutine

public subroutine wf_cargar_datos_posesion_efectiva ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_form_posesion_efectiva'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT 	MAX("SOL_POS_EFEC"."CORRELATIVO")
   INTO 		:il_correlativo
   FROM 		"SOL_POS_EFEC"  
   WHERE  ( "SOL_POS_EFEC"."BASE" = :is_base ) AND  
          ( "SOL_POS_EFEC"."SERIE" = :is_serie ) AND  
          ( "SOL_POS_EFEC"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	dw_reporte.setitem(ll_new,'sol_pos_efec_base',is_base)
	dw_reporte.setitem(ll_new,'sol_pos_efec_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_pos_efec_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_pos_efec_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_pos_efec_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_pos_efec_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_pos_efec_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_pos_efec_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_pos_efec_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_pos_efec_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_pos_efec_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_pos_efec_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_pos_efec_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_pos_efec_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_pos_efec_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_pos_efec_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_pos_efec_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_pos_efec_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_pos_efec_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_pos_efec_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_pos_efec_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_pos_efec_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_pos_efec_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_pos_efec_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_pos_efec_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_pos_efec_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_pos_efec_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_pos_efec_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_pos_efec_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_pos_efec_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_pos_efec_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_pos_efec_prioridad','N')
	dw_reporte.setitem(ll_new,'sol_pos_efec_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_pos_efec_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_pos_efec_area_sepultura',ls_area)
	dw_reporte.setitem(ll_new,'sol_pos_efec_sector_sepultura',ls_sector)
	dw_reporte.setitem(ll_new,'sol_pos_efec_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_pos_efec_capacidad',ll_capacidad)
	dw_reporte.setitem(ll_new,'sol_pos_efec_estatus_operaciones',1)
	dw_reporte.setitem(ll_new,'sol_pos_efec_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_pos_efec_est_carta_simple',1)
	dw_reporte.setitem(ll_new,'sol_pos_efec_est_carta_notarial',1)
	dw_reporte.setitem(ll_new,'sol_pos_efec_est_finiquito',1)
	dw_reporte.setitem(ll_new,'sol_pos_efec_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_pos_efec_est_inf_social',1)
	dw_reporte.setitem(ll_new,'sol_pos_efec_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_pos_efec_est_sin_antece',1)
	dw_reporte.setitem(ll_new,'sol_pos_efec_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_pos_efec_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_pos_efec_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_pos_efec_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_pos_efec_numero_particular_original',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_pos_efec_depto_particular_original',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_pos_efec_block_particular_original',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_pos_efec_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_pos_efec_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_pos_efec_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_pos_efec_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_pos_efec_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_pos_efec_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_pos_efec_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_pos_efec_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_pos_efec_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_pos_efec_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_pos_efec_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_pos_efec_estado_cod_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_pos_efec_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_pos_efec_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_pos_efec_usuario','') //ok
	end if
	SELECT count("FALLECIDOS"."LLAVE")  
   INTO :ll_count_reg  
   FROM "FALLECIDOS"  
   WHERE ( "FALLECIDOS"."BASE" = :is_base ) AND  
         ( "FALLECIDOS"."SS" = :is_serie ) AND  
         ( "FALLECIDOS"."CONTRATO" = :il_numero )    AND
		( "FALLECIDOS"."ESTADO_REG" = 'A' )
	Using	sqlca;
	if sqlca.sqlcode=0 then
		if ll_count_reg>0 then
			dw_reporte.setitem(ll_new,'sol_pos_efec_sepultado','Si')
		else
			dw_reporte.setitem(ll_new,'sol_pos_efec_sepultado','No')
		end if
	else
		dw_reporte.setitem(ll_new,'sol_pos_efec_sepultado','No')
	end if
	SELECT	"CADENA"."ESTADO_TITULO"  
	INTO 		:ls_titulo  
	FROM 		"CADENA"  
	WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
				( "CADENA"."SERIE" = :is_serie ) AND  
				( "CADENA"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_pos_efec_titulo_dominio',ls_titulo)
	else
		dw_reporte.setitem(ll_new,'sol_pos_efec_titulo_dominio','')
	end if
	SELECT	"CARTA_LOG"."COD_ACCION"  
	INTO 		:ll_ctto_def  
	FROM 		"CARTA_LOG"  
	WHERE 	( "CARTA_LOG"."BASE" = :is_base ) AND  
				( "CARTA_LOG"."SERIE" = :is_serie ) AND  
				( "CARTA_LOG"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_pos_efec_ctto_definitivo',ll_ctto_def)
	else
		dw_reporte.setitem(ll_new,'sol_pos_efec_ctto_definitivo',0)
	end if

			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_pos_efec_estatus_operaciones')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_pos_efec_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_pac ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part,ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,&
			ls_domic_c,ls_fono_c,ls_est_cob,ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,ls_moneda
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac,ldt_fec_prox_cred,ldt_fec_prox_mant,&
			ldt_nulo
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg,ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf,&
			ll_new, ll_cta_repacta,ll_ctto_def
Double	ldb_val_cta_cred,ldb_val_cta_mant

Setnull(ldt_nulo)
dw_reporte.dataobject	= 'dw_form_mandato_pac'
dw_reporte.settransobject(sqlca)
SELECT	"CADENA_MORA"."FECHA_VENC_CRED",	"CADENA_MORA"."FECHA_VENC_MANT"  
INTO 		:ldt_fec_prox_cred,					:ldt_fec_prox_mant  
FROM 		"CADENA_MORA"  
WHERE  ( "CADENA_MORA"."BASE" = :is_base ) AND  
		 ( "CADENA_MORA"."SERIE" = :is_serie ) AND  
		 ( "CADENA_MORA"."NUMERO" = :il_numero )   ;

CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res				= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ldb_val_cta_cred		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_valor_cuota')
			ls_moneda				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_moneda')
//			if ls_moneda='1' then
//				ldb_val_cta_cred	= round(ldb_val_cta_cred / gd_uf_dia,4)
//			end if
			ldb_val_cta_mant		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_valor_cuota_m')
			ldt_fec_prox_cred		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'cadena_mora_fecha_venc_cred')
			ldt_fec_prox_mant		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'cadena_mora_fecha_venc_mant')
		end if

	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age			= ''
			ls_cod_sup			= ''
			ls_area				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta		= 0
			ld_fecha_prim		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res			= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ldb_val_cta_cred	= 0
			ldb_val_cta_mant	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_valor_cuota_m')
		end if

	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut					= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora					= 0
			ls_cod_age				= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup				= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area					= ''
			ls_sector				= ''
			ls_sepultura			= ''
			ll_capacidad			= 0
			ll_cta_repacta			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha					= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res				= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_moneda				= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'pago_liberador_moneda')
			ldb_val_cta_cred		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_valor_cuota')
//			if ls_moneda='1' then
//				ldb_val_cta_cred	= round(ldb_val_cta_cred / gd_uf_dia,4)
//			end if
			ldb_val_cta_mant		= 0
		end if

	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut					= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora					= 0
			ls_cod_age				= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup				= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area					= ''
			ls_sector				= ''
			ls_sepultura			= ''
			ll_capacidad			= 0
			ll_cta_repacta			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha					= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res				= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_moneda				= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_pago_moneda')
			ldb_val_cta_cred		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_valor_cuota')
//			if ls_moneda='1' then
//				ldb_val_cta_cred	= round(ldb_val_cta_cred / gd_uf_dia,4)
//			end if
			ldb_val_cta_mant		= 0
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut					= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora					= 0
			ls_cod_age				= ''
			ls_cod_sup				= ''
			ls_area					= ''
			ls_sector				= ''
			ls_sepultura			= ''
			ll_capacidad			= 0
			ll_cta_repacta			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha					= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res				= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_moneda				= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemstring(1,'repacta_mantencion_tipo_moneda')
			ldb_val_cta_cred		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_valor_cuota_uf')
			ldb_val_cta_mant		= 0
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora					= 0
			ls_cod_age				= ''
			ls_cod_sup				= ''
			ls_area					= ''
			ls_sector				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad			= 0
			ll_cta_repacta			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha					= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res				= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_moneda				= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemstring(1,'derecho_moneda')
			ldb_val_cta_cred		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemnumber(1,'derecho_valor_cuo')
//			if ls_moneda='1' then
//				ldb_val_cta_cred	= round(ldb_val_cta_cred / gd_uf_dia,4)
//			end if

			ldb_val_cta_mant		= 0
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut					= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora					= 0
			ls_cod_age				= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup				= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area					= ''
			ls_sector				= ''
			ls_sepultura			= ''
			ll_capacidad			= 0
			ll_cta_repacta			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha					= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res				= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_moneda				= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'pago_aumento_moneda')
			ldb_val_cta_cred		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_valor_cuota')
//			if ls_moneda='1' then
//				ldb_val_cta_cred	= round(ldb_val_cta_cred / gd_uf_dia,4)
//			end if
			ldb_val_cta_mant		= 0
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut					= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora					= 0
			ls_cod_age				= ''
			ls_cod_sup				= ''
			ls_area					= ''
			ls_sector				= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad			= 0
			ll_cta_repacta			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha					= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  		  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res				= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_moneda				= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_moneda')
			ldb_val_cta_cred		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_valor_cuo')
//			if ls_moneda='1' then
//				ldb_val_cta_cred	= round(ldb_val_cta_cred / gd_uf_dia,4)
//			end if
			ldb_val_cta_mant		= 0
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_PAC"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_PAC"  
   WHERE ( "SOL_PAC"."BASE" = :is_base ) AND  
         ( "SOL_PAC"."SERIE" = :is_serie ) AND  
         ( "SOL_PAC"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	dw_reporte.setitem(ll_new,'sol_pac_base',is_base)
	dw_reporte.setitem(ll_new,'sol_pac_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_pac_numero',il_numero)
	if is_base='C' then
		dw_reporte.setitem(ll_new,'sol_pac_fecha_cobro_pac',ldt_nulo)
	else
		dw_reporte.setitem(ll_new,'sol_pac_fecha_cobro_pac',ldt_fec_prox_cred)
	end if
	dw_reporte.setitem(ll_new,'sol_pac_fecha_cobro_pac_mant',ldt_fec_prox_mant)
	dw_reporte.setitem(ll_new,'sol_pac_fecha_venc_cred',ldt_fec_prox_cred)
	dw_reporte.setitem(ll_new,'sol_pac_fecha_venc_mant',ldt_fec_prox_mant)
	dw_reporte.setitem(ll_new,'sol_pac_monto_cuota_cred',ldb_val_cta_cred)
	dw_reporte.setitem(ll_new,'sol_pac_monto_cuota_mant',ldb_val_cta_mant)
	dw_reporte.setitem(ll_new,'sol_pac_base_mandato','S')
	dw_reporte.setitem(ll_new,'sol_pac_serie_mandato','P')
	dw_reporte.setitem(ll_new,'sol_pac_tipo_cuenta','C')
	dw_reporte.setitem(ll_new,'sol_pac_fecha_suscripcion',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_pac_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_pac_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_pac_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_pac_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_pac_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_pac_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_pac_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_pac_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_pac_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_pac_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_pac_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_pac_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_pac_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_pac_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_pac_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_pac_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_pac_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_pac_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_pac_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_pac_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_pac_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_pac_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_pac_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_pac_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_pac_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_pac_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_pac_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_pac_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_pac_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_pac_area_sepultura',ls_area)
	dw_reporte.setitem(ll_new,'sol_pac_sector_sepultura',ls_sector)
	dw_reporte.setitem(ll_new,'sol_pac_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_pac_capacidad',ll_capacidad)
	dw_reporte.setitem(ll_new,'sol_pac_estatus_operacion',1)
	dw_reporte.setitem(ll_new,'sol_pac_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_pac_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_pac_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_pac_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_pac_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_pac_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_pac_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_pac_numero_particular_original',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_pac_depto_particular_original',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_pac_block_particular_original',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_pac_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_pac_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_pac_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_pac_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_pac_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_pac_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_pac_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_pac_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_pac_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_pac_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_pac_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_pac_estado_cod_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_pac_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_pac_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_pac_usuario','') //ok
	end if
	dw_reporte.accepttext()
	
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_pac_estatus_operacion')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_pac_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_mod_antece_cliente ();long			ll_new
String		ls_nombre,ls_a_pat,ls_a_mat,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,&
				ls_est_civil,ls_domi_c,ls_fono_c,ls_dv,ls_est_cob,ls_nombre_usuario,ls_est_reg, &
				ls_string,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_celular,ls_email
Datetime		ldt_fec_nac,ldt_fecha_opera
Long			ll_tot_renta, ll_grupo_f,ll_est_ope,ll_est_inf
Time			lt_hora

lt_hora							= time("00:00:00")
ldt_fecha_opera				= datetime(DATE(gdt_fec_sistema),lt_hora)
dw_reporte.dataobject		= 'dw_formulario_modifica_antece_cliente'
dw_reporte.settransobject(sqlca)
dw_reporte.getchild('sol_mod_antece_comuna_nueva',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
cb_actualiza_datos.visible	= false
cb_ver_original.visible		= false
SELECT	"CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."CELULAR",	"CLIENTE"."EMAIL"
INTO 		:ls_nombre,   			 :ls_a_pat,   				  :ls_a_mat,   				:ls_dir_p,   					:ls_pob,   					 :ls_sector,   		  :ls_comuna,   			:ls_ciudad,   			 :ls_fono_p,   		  :ldt_fec_nac,   			:ls_est_civil,   			  :ls_domi_c,   				  :ls_fono_c,   			:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,					:ls_celular,			:ls_email
FROM 	"CLIENTE"  
WHERE 	"CLIENTE"."RUT" = :gi_rut   
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
		if len(trim(ls_fono_p))=0 then ls_fono_p = ''
	end if
	if len(trim(ls_domi_c))>60 then
		ls_domi_c	= mid(trim(ls_domi_c),1,60)
	else
		if len(trim(ls_domi_c))=0 then ls_domi_c = '-'
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	else
		if len(trim(ls_fono_c))=0 then ls_fono_c = ''
	end if
	if len(trim(ls_celular))>25 then
		ls_celular	= mid(trim(ls_celular),1,25)
	else
		if len(trim(ls_celular))=0 then ls_celular = ''
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
	is_fono_particular		= ls_fono_p
	is_celular				= ls_celular
	is_fono_c				= ls_fono_c
	if is_estado="N" then
		ll_new	= dw_reporte.insertrow(0)
		dw_reporte.scrolltorow(ll_new)
		dw_reporte.setfocus()
		dw_reporte.setitem(ll_new,'sw_ver',0)
		dw_reporte.setitem(ll_new,'sol_mod_antece_rut',il_numero)
		dw_reporte.setitem(ll_new,'sol_estatus_rut_cliente',gi_rut)
		dw_reporte.setitem(ll_new,'sol_mod_antece_dv',ls_dv)
		dw_reporte.setitem(ll_new,'sol_mod_antece_estatus_mod',1)
		dw_reporte.setitem(ll_new,'sol_mod_antece_nombres',ls_nombre)
		dw_reporte.setitem(ll_new,'sol_mod_antece_ap_paterno',ls_a_pat)
		dw_reporte.setitem(ll_new,'sol_mod_antece_ap_materno',ls_a_mat)
		dw_reporte.setitem(ll_new,'sol_mod_antece_usuario',gs_user)
		dw_reporte.setitem(ll_new,'sol_estatus_correlativo',il_correlativo)
		dw_reporte.setitem(ll_new,'sol_mod_antece_correlativo',il_correlativo)
		dw_reporte.setitem(ll_new,'sol_mod_antece_fecha',date(string(gdt_fec_sistema,"dd/mm/yyyy")))
		dw_reporte.setitem(ll_new,'sol_mod_antece_direcion_p_original',ls_dir_p)
		dw_reporte.setitem(ll_new,'sol_mod_antece_poblacion_original',ls_pob)
		dw_reporte.setitem(ll_new,'sol_mod_antece_sector_original',ls_sector)
		dw_reporte.setitem(ll_new,'sol_mod_antece_comuna_original',ls_comuna)
		dw_reporte.setitem(ll_new,'sol_mod_antece_ciudad_original',ls_ciudad)
		dw_reporte.setitem(ll_new,'sol_mod_antece_fono_p_original',ls_fono_p)
		dw_reporte.setitem(ll_new,'sol_mod_antece_celular_original',ls_celular)
		dw_reporte.setitem(ll_new,'sol_mod_antece_email_original',ls_email)
		dw_reporte.setitem(ll_new,'sol_mod_antece_fecha_nac_original',ldt_fec_nac)
		dw_reporte.setitem(ll_new,'sol_mod_antece_estado_civil_original',ls_est_civil)
		dw_reporte.setitem(ll_new,'sol_mod_antece_domicilio_c_original',ls_domi_c)
		dw_reporte.setitem(ll_new,'sol_mod_antece_fono_c_original',ls_fono_c)
		dw_reporte.setitem(ll_new,'sol_mod_antece_total_renta_original',ll_tot_renta)
		dw_reporte.setitem(ll_new,'sol_mod_antece_grupo_f_original',ll_grupo_f)
		dw_reporte.setitem(ll_new,'sol_mod_antece_estado_cob_original',ls_est_cob)
		dw_reporte.setitem(ll_new,'sol_mod_antece_nombre_original',ls_nombre)
		dw_reporte.setitem(ll_new,'sol_mod_antece_ap_paterno_original',ls_a_pat)
		dw_reporte.setitem(ll_new,'sol_mod_antece_ap_materno_original',ls_a_mat)
		dw_reporte.setitem(ll_new,'sol_mod_antece_tipo_via_original',ls_tipo_via)
		dw_reporte.setitem(ll_new,'sol_mod_antece_numero_particular_origina',ls_nro_part)
		dw_reporte.setitem(ll_new,'sol_mod_antece_depto_original',ls_depto_part)
		dw_reporte.setitem(ll_new,'sol_mod_antece_block_original',ls_block_part)
		dw_reporte.setitem(ll_new,'sol_mod_antece_direccion_p_nueva',ls_dir_p)
		dw_reporte.setitem(ll_new,'sol_mod_antece_poblacion_nueva',ls_pob)
		dw_reporte.setitem(ll_new,'sol_mod_antece_sector_nueva',ls_sector)
		dw_reporte.setitem(ll_new,'sol_mod_antece_comuna_nueva',ls_comuna)
		dw_reporte.setitem(ll_new,'sol_mod_antece_ciudad_nueva',ls_ciudad)
		dw_reporte.setitem(ll_new,'sol_mod_antece_fono_p_nueva',ls_fono_p)
		dw_reporte.setitem(ll_new,'sol_mod_antece_celular_nueva',ls_celular)
		dw_reporte.setitem(ll_new,'sol_mod_antece_email_nueva',ls_email)
		dw_reporte.setitem(ll_new,'sol_mod_antece_fecha_nac_nueva',ldt_fec_nac)
		dw_reporte.setitem(ll_new,'sol_mod_antece_estado_civil_nueva',ls_est_civil)
		dw_reporte.setitem(ll_new,'sol_mod_antece_domicilio_c_nueva',ls_domi_c)
		dw_reporte.setitem(ll_new,'sol_mod_antece_fono_c_nueva',ls_fono_c)
		dw_reporte.setitem(ll_new,'sol_mod_antece_total_renta_nueva',ll_tot_renta)
		dw_reporte.setitem(ll_new,'sol_mod_antece_grupo_f_nueva',ll_grupo_f)
		dw_reporte.setitem(ll_new,'sol_mod_antece_estado_cob_nueva',ls_est_cob)
		dw_reporte.setitem(ll_new,'sol_mod_antece_nombre_nueva',ls_nombre)
		dw_reporte.setitem(ll_new,'sol_mod_antece_ap_paterno_nueva',ls_a_pat)
		dw_reporte.setitem(ll_new,'sol_mod_antece_ap_materno_nueva',ls_a_mat)
		dw_reporte.setitem(ll_new,'sol_mod_antece_tipo_via_nueva',ls_tipo_via)
		dw_reporte.setitem(ll_new,'sol_mod_antece_numero_particular_nueva',ls_nro_part)
		dw_reporte.setitem(ll_new,'sol_mod_antece_depto_nueva',ls_depto_part)
		dw_reporte.setitem(ll_new,'sol_mod_antece_block_nueva',ls_block_part)
		dw_reporte.setitem(ll_new,'sol_mod_antece_usuario_opera',gs_user)
		dw_reporte.setitem(ll_new,'sol_mod_antece_fecha_opera',ldt_fecha_opera)
		dw_reporte.setitem(ll_new,'sol_mod_antece_estatus_operaciones',1)
		dw_reporte.setitem(ll_new,'sol_mod_antece_estatus_informatica',1)
		dw_reporte.setitem(ll_new,'gs_depto',gs_depto)
		dw_reporte.accepttext()
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_mod_antece_ciudad_nueva')
		if not isnull(ls_ciudad) and ls_ciudad<>'' then
			idw_detalle.retrieve(ls_ciudad)
		end if
		SELECT	"ENCARGADOS"."NOMBRE"  
		INTO 		:gs_nom_comp_usuario  
		FROM 		"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
		Using		sqlca;
		if sqlca.sqlcode=0 then
			ls_string	= 'Solicitud en Tramite, realizada el: '+string(idt_fecha_hoy,"dd/mm/yyyy")+' por '+gs_nom_comp_usuario
			dw_reporte.setitem(ll_new,'sol_estatus_observacion',ls_string)
		end if
	elseif is_estado="M" then
		if dw_reporte.retrieve(gi_rut,il_correlativo)>0 then
			ls_ciudad	= dw_reporte.getitemstring(1,'sol_mod_antece_ciudad_nueva')
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle.retrieve(ls_ciudad)
			end if
			ls_dir_p			= dw_reporte.getitemstring(1,'sol_mod_antece_direccion_p_nueva')
			ls_tipo_via		= dw_reporte.getitemstring(1,'sol_mod_antece_tipo_via_nueva')
			ls_nro_part		= dw_reporte.getitemstring(1,'sol_mod_antece_numero_particular_nueva')
			ls_depto_part	= dw_reporte.getitemstring(1,'sol_mod_antece_depto_nueva')
			ls_block_part	= dw_reporte.getitemstring(1,'sol_mod_antece_block_nueva')
			ls_pob			= dw_reporte.getitemstring(1,'sol_mod_antece_poblacion_nueva')
			ls_sector		= dw_reporte.getitemstring(1,'sol_mod_antece_sector_nueva')
			ls_comuna		= dw_reporte.getitemstring(1,'sol_mod_antece_comuna_nueva')
			ls_ciudad		= dw_reporte.getitemstring(1,'sol_mod_antece_ciudad_nueva')
			ls_fono_p		= dw_reporte.getitemstring(1,'sol_mod_antece_fono_p_nueva')
			ls_celular		= dw_reporte.getitemstring(1,'sol_mod_antece_celular_nueva')
			ls_email			= dw_reporte.getitemstring(1,'sol_mod_antece_email_nueva')
			ldt_fec_nac		= dw_reporte.getitemdatetime(1,'sol_mod_antece_fecha_nac_nueva')
			ls_est_civil	= dw_reporte.getitemstring(1,'sol_mod_antece_estado_civil_nueva')
			ls_domi_c		= dw_reporte.getitemstring(1,'sol_mod_antece_domicilio_c_nueva')
			ls_fono_c		= dw_reporte.getitemstring(1,'sol_mod_antece_fono_c_nueva')
			ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_mod_antece_total_renta_nueva')
			ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_mod_antece_grupo_f_nueva')
			ls_est_cob		= dw_reporte.getitemstring(1,'sol_mod_antece_estado_cob_nueva')
			ls_nombre		= dw_reporte.getitemstring(1,'sol_mod_antece_nombre_nueva')
			ls_a_pat			= dw_reporte.getitemstring(1,'sol_mod_antece_ap_paterno_nueva')
			ls_a_mat			= dw_reporte.getitemstring(1,'sol_mod_antece_ap_materno_nueva')
			if len(trim(ls_a_pat))=0 or isnull(ls_a_pat) then ls_a_pat = '-'
			if len(trim(ls_a_mat))=0 or isnull(ls_a_mat) then ls_a_mat = '-'
			if len(trim(ls_nombre))=0 or isnull(ls_nombre) then ls_nombre = '-'
			if len(trim(ls_dir_p))=0 or isnull(ls_dir_p) then ls_dir_p = '-'
			if len(trim(ls_pob))=0 or isnull(ls_pob) then ls_pob = '-'
			if len(trim(ls_sector))=0 or isnull(ls_sector) then ls_sector = '-'
			if len(trim(ls_comuna))=0 or isnull(ls_comuna) then ls_comuna = '-'
			if len(trim(ls_ciudad))=0 or isnull(ls_ciudad) then ls_ciudad = '-'
			if len(trim(ls_fono_p))=0 or isnull(ls_fono_p) then ls_fono_p = '-'
			if len(trim(ls_domi_c))=0 or isnull(ls_domi_c) then ls_domi_c = '-'
			if len(trim(ls_fono_c))=0 or isnull(ls_fono_c) then ls_fono_c = '-'
			if len(trim(ls_est_cob))=0 or isnull(ls_est_cob) then ls_est_cob = '0'
			if len(trim(ls_nro_part))=0 or isnull(ls_nro_part) then ls_nro_part = '-'
			if len(trim(ls_depto_part))=0 or isnull(ls_depto_part) then ls_depto_part = '-'
			if len(trim(ls_block_part))=0 or isnull(ls_block_part) then ls_block_part = '-'
			if len(trim(ls_celular))=0 or isnull(ls_celular) then ls_celular = '-'
			if len(trim(ls_email))=0 or isnull(ls_email) then ls_email = '-'
			if isnull(ll_grupo_f) then ll_grupo_f = 0
			if isnull(ll_tot_renta) then ll_tot_renta = 0
			dw_reporte.setitem(1,'sol_mod_antece_direccion_p_nueva',ls_dir_p)
			dw_reporte.setitem(1,'sol_mod_antece_numero_particular_nueva',ls_nro_part)
			dw_reporte.setitem(1,'sol_mod_antece_depto_nueva',ls_depto_part)
			dw_reporte.setitem(1,'sol_mod_antece_block_nueva',ls_block_part)
			dw_reporte.setitem(1,'sol_mod_antece_poblacion_nueva',ls_pob)
			dw_reporte.setitem(1,'sol_mod_antece_sector_nueva',ls_sector)
			dw_reporte.setitem(1,'sol_mod_antece_comuna_nueva',ls_comuna)
			dw_reporte.setitem(1,'sol_mod_antece_ciudad_nueva',ls_ciudad)
			dw_reporte.setitem(1,'sol_mod_antece_fono_p_nueva',ls_fono_p)
			dw_reporte.setitem(1,'sol_mod_antece_domicilio_c_nueva',ls_domi_c)
			dw_reporte.setitem(1,'sol_mod_antece_fono_c_nueva',ls_fono_c)
			dw_reporte.setitem(1,'sol_mod_antece_total_renta_nueva',ll_tot_renta)
			dw_reporte.setitem(1,'sol_mod_antece_grupo_f_nueva',ll_grupo_f)
			dw_reporte.setitem(1,'sol_mod_antece_estado_cob_nueva',ls_est_cob)
			dw_reporte.setitem(1,'sol_mod_antece_usuario',gs_user)
			dw_reporte.setitem(1,'sol_mod_antece_nombre_nueva',ls_nombre)
			dw_reporte.setitem(1,'sol_mod_antece_ap_paterno_nueva',ls_a_pat)
			dw_reporte.setitem(1,'sol_mod_antece_ap_materno_nueva',ls_a_mat)
			dw_reporte.setitem(1,'sol_mod_antece_celular_nueva',ls_celular)
			dw_reporte.setitem(1,'sol_mod_antece_email_nueva',ls_email)
			ll_est_ope	= dw_reporte.getitemnumber(1,'sol_mod_antece_estatus_operaciones')
			ll_est_inf	= dw_reporte.getitemnumber(1,'sol_mod_antece_estatus_informatica')
			ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
			dw_reporte.setitem(1,'sw_ver',0)
			dw_reporte.setitem(1,'gs_depto',gs_depto)
			dw_reporte.accepttext()
			if dw_reporte.update()=1 then
				commit;
			else
				rollback;
			end if
			if (ll_est_ope=0 and ll_est_inf=0) or (ls_est_reg='I') then
				cb_grabar.enabled					= false
				dw_reporte.enabled				= false
			else
				dw_reporte.enabled				= true
				if trim(gs_opera)='1' then
					cb_grabar.enabled				= true
				else
					cb_grabar.enabled				= false
				end if
			end if
		end if
	end if
end if
cb_aviso.visible									= false
dw_reporte.accepttext()
dw_reporte.setfocus()
dw_reporte.setcolumn('sol_mod_antece_nombre_nueva')
end subroutine

public subroutine wf_cargar_datos_repactacion_compraventa ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part,ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,&
			ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob,&
			ls_fecha_1_vcto,ls_fecha_ult_vcto
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Date		ld_vcto_2, ld_fecha_nula,ld_fecha_1_vcto,ld_fecha_ult_vcto
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg,ll_mes,ll_ano,ll_cod_parque,ll_new, ll_cta_repacta,&
			ll_ctto_def,ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf
setnull(ld_fecha_nula)
dw_reporte.dataobject	= 'dw_formulario_repacta_o_compraventa'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ll_cod_parque	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ll_cod_parque	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ll_cod_parque	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut				= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ll_cod_parque	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ll_cod_parque	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ll_cod_parque	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cadena_cod_parque')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ll_cod_parque	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ll_cod_parque	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
		end if
END CHOOSE

if is_estado="N" then
	dw_reporte.Modify("sol_repacta_cvta_fecrep_1_vcto.protect='0'")
	dw_reporte.Modify("sol_repacta_cvta_fecha_solicitud.protect='0'")
	dw_reporte.Modify("sol_repacta_cvta_nombre_cliente.protect='0'")
	dw_reporte.Modify("sol_repacta_cvta_fecha_compra.protect='0'")
	dw_reporte.Modify("sol_repacta_cvta_nota.protect='0'")
	dw_reporte.Modify("sol_repacta_cvta_sw_contar_repro.protect='0'")
	dw_reporte.Modify("sol_repacta_cvta_est_uso_firma_digital.protect='0'")
	cb_grabar.enabled						= true
	SELECT MAX("SOL_REPACTA_CVTA"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_REPACTA_CVTA"  
   WHERE ( "SOL_REPACTA_CVTA"."BASE" = :is_base ) AND  
         ( "SOL_REPACTA_CVTA"."SERIE" = :is_serie ) AND  
         ( "SOL_REPACTA_CVTA"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new									= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_base',is_base)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_area_sep',ls_area)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_sector_sep',ls_sector)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_nro_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_cod_parque',ll_cod_parque)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_numero_particular_origi',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_depto_particular_origin',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_block_particular_origin',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'cadena_estado',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fecha_solicitud',idt_fecha_hoy)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_nombre_cliente',ls_a_pat+' '+ls_a_mat+' '+ls_nombre)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fecha_compra',idt_fecha_hoy)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fecvta_1_vcto',ld_fecha_prim)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fecvta_ult_vcto',ld_fecha_ult)
	il_dias_vcto				= 0
	ll_mes						= month(date(ld_fecha_prim))
	ll_ano						= year(date(ld_fecha_prim))
	ls_fecha_1_vcto			= string('01/'+string(ll_mes,"00")+'/'+string(ll_ano,"0000"))
	ld_fecha_1_vcto			= date(ls_fecha_1_vcto)
	ll_mes						= month(date(ld_fecha_ult))
	ll_ano						= year(date(ld_fecha_ult))
	ls_fecha_ult_vcto			= string('01/'+string(ll_mes,"00")+'/'+string(ll_ano,"0000"))
	ld_fecha_ult_vcto			= date(ls_fecha_ult_vcto)
	if ld_fecha_1_vcto < ld_fecha_ult_vcto then
		DO WHILE ld_fecha_1_vcto <= ld_fecha_ult_vcto
			ll_mes				= month(ld_fecha_1_vcto)
			ll_mes ++
			ll_ano				= year(ld_fecha_1_vcto)
			if ll_mes>12 then
				ll_mes			= 1
				ll_ano ++
			end if
			ls_fecha_1_vcto	= string('01/'+string(ll_mes,"00")+'/'+string(ll_ano,"0000"))
			ld_fecha_1_vcto	= date(ls_fecha_1_vcto)
			if ld_fecha_1_vcto <= ld_fecha_ult_vcto then 
				il_dias_vcto ++
			else
				exit
			end if
		LOOP
	else
		il_dias_vcto			= DaysAfter(date(ld_fecha_prim), date(ld_fecha_ult))
		il_dias_vcto			= long(il_dias_vcto / 30)
	end if
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fecrep_1_vcto',ld_fecha_nula)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fecrep_ult_vcto',ld_fecha_nula)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_estatus_operacion',1)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_sw_contar_repro',1)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_est_uso_firma_digital',1)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_numero_particular_origi',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_depto_particular_origin',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_block_particular_origin',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_estado_cob_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_repacta_cvta_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_repacta_cvta_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_repacta_cvta_usuario','') //ok
	end if
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol,gl_cod_parque_cta)
	dw_reporte.Modify("sol_repacta_cvta_fecrep_1_vcto.protect='1'")
	dw_reporte.Modify("sol_repacta_cvta_fecha_solicitud.protect='1'")
	dw_reporte.Modify("sol_repacta_cvta_nombre_cliente.protect='1'")
	dw_reporte.Modify("sol_repacta_cvta_fecha_compra.protect='1'")
	dw_reporte.Modify("sol_repacta_cvta_nota.protect='1'")
	cb_grabar.enabled						= false
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_grabar_repacta_aumento ();date		ld_fec_1er_vcto,ld_fec_vcto,ld_fec_prox_pago
datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_ult,ldt_fecha_entre,ldt_fecha_pie,ldt_fecha_mod,&
			ldt_fecha_fact,ldt_fecha_hoy,ld_fec_1er_vcto1,ld_fec_vcto1,ldt_fecha_m,ldt_fec_venc_mant
Long		ll_correlativo,ll_precio,ll_capacidad,ll_nro_cuotas,ll_parque,ll_gastos_adm,ll_factura,ll_pie_pagado,ll_cod_parque,ll_rut,ll_count_vig,ll_count_reg_atencion
String		ls_serie,ls_n_reduccion,ls_moneda,ls_modificado,ls_area,ls_sector,ls_sepultura,&
			ls_carta_bienv,ls_nro_tecnico,ls_dv,ls_glosa,ls_estado='67'
Double	ll_pie,ll_tasa,ll_valor_cuota,ll_uf_dia,ll_total_fact,ldb_valor_cuota_m=0,ll_numero,ll_ult_folio,ll_nro_aumento,ll_folio,ll_derecho_lib,ll_des_esp

Setnull(ldt_fecha_m)
ldt_fecha				= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy		= datetime(idt_fecha_hoy,time("00:00:00"))
ld_fec_1er_vcto1	= dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecrep_1_vcto')
ld_fec_vcto1			= dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecrep_ult_vcto')
ld_fec_prox_pago	= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecha_prox_vcto'))
ll_numero			= dw_reporte.getitemnumber(1,'sol_repacta_cvta_numero')
ll_correlativo		= dw_reporte.getitemnumber(1,'sol_repacta_cvta_correlativo')
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
	SELECT	"PAGO_AUMENTO"."SERIE_M",  "PAGO_AUMENTO"."NRO_AUMENTO", 	"PAGO_AUMENTO"."FECHA", 	"PAGO_AUMENTO"."FOLIO", "PAGO_AUMENTO"."PRECIO",   "PAGO_AUMENTO"."PIE_PAGADO",  "PAGO_AUMENTO"."PIE",   "PAGO_AUMENTO"."TASA",  "PAGO_AUMENTO"."VALOR_CUOTA", "PAGO_AUMENTO"."NRO_CUOTAS",  "PAGO_AUMENTO"."UF_DIA",   "PAGO_AUMENTO"."MONEDA",   "PAGO_AUMENTO"."FECHA_PRIM",  "PAGO_AUMENTO"."FECHA_ULT",   "PAGO_AUMENTO"."FECHA_PIE",   "PAGO_AUMENTO"."MODIFICADO",  "PAGO_AUMENTO"."FECHA_MOD",   "PAGO_AUMENTO"."GASTOS_ADM"  
	INTO 		:ls_serie,   							:ll_nro_aumento,   							:ldt_fecha,   						:ll_folio,   						:ll_precio,   							:ll_pie_pagado,   							:ll_pie,   						:ll_tasa,   						:ll_valor_cuota,   							:ll_nro_cuotas,   							:ll_uf_dia,   							:ls_moneda,   							:ldt_fecha_prim,   				:ldt_fecha_ult,   				:ldt_fecha_pie,   				:ls_modificado,   				:ldt_fecha_mod,   				:ll_gastos_adm 
	FROM 		"PAGO_AUMENTO"  
	WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
			 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) AND
			 ( "PAGO_AUMENTO"."FOLIO" = :ll_ult_folio )
	USING	sqlca;
	if sqlca.sqlcode=0 then // incrementa 1 el folio y lo inserta en pago_aumento
		ll_folio	= Double(string(ll_numero)+string(ll_correlativo))
		INSERT INTO	"PAGO_AUMENTO"  
					( "SERIE_M",   "NRO_AUMENTO",   	"FECHA",   	"FOLIO",   	"PRECIO",   "PIE_PAGADO",   "PIE",   "TASA",   "VALOR_CUOTA",   "NRO_CUOTAS",   "UF_DIA",   "MONEDA",   "FECHA_PRIM",   		"FECHA_ULT",   	"FECHA_PIE",   	"MODIFICADO",   "FECHA_MOD",   	"GASTOS_ADM" )  
		VALUES 	( :ls_serie,		:ll_nro_aumento,		:ldt_fecha, 	:ll_folio, 		:ll_precio, 	:ll_pie_pagado, :ll_pie, :ll_tasa, 	:ll_valor_cuota, 	:ll_nro_cuotas, 		:ll_uf_dia, 	:ls_moneda, :ld_fec_1er_vcto1,	:ld_fec_vcto1,		:ldt_fecha_pie,   :ls_modificado, :ldt_fecha_mod,	:ll_gastos_adm )  
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
				DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
				EXECUTE sp_nuevo_cadena_mora;

				INSERT INTO "CUPONERAS_MODIFICA"  
							( "BASE",		"SERIE",		"NUMERO",	"FECHA_CREA",	"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",		"FECHA_PRIM",			"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
				VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_nro_cuotas,	:ll_rut,	:ls_dv,	:ll_valor_cuota,		0,							:ll_cod_parque,	:ld_fec_1er_vcto1,	:ldt_fecha_m,		:ls_moneda,	'C' )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				
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
						SET 			"ESTADO_CUPONERA" = 'A'  
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
						
						DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto1, :ldt_fec_venc_mant, :ls_moneda);
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
//						DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_nro_cuotas, :gs_user, :ll_rut, :ll_valor_cuota, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ld_fec_1er_vcto1, :ldt_fec_venc_mant, :ls_moneda, 'C' );
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
	messagebox("Advertencia","No Existe Aumento Capacidad "+gs_base+'-'+gs_serie+'-'+string(gi_numero))
elseif sqlca.sqlcode=-1 then
	messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
end if
end subroutine

public subroutine wf_validar_ventanas ();Long	ll_fila,ll_cant,ll_row_ant
if isvalid(w_detalle_solicitudes) and dw_reporte.dataobject<>'dw_form_reactivacion_ctto_resuelto' then
	ll_row_ant	= w_detalle_solicitudes.dw_reporte.getrow()
	if w_detalle_solicitudes.dw_reporte.retrieve(is_base,is_serie,il_numero,is_tipo_sol)>0 then
		w_detalle_solicitudes.dw_reporte.scrolltorow(ll_row_ant)
		w_detalle_solicitudes.dw_reporte.SelectRow(0, FALSE)
		w_detalle_solicitudes.dw_reporte.SelectRow(ll_row_ant, TRUE)
	end if
end if
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
if isvalid(w_ingreso_solicitudes) and is_estado="N" then
	ll_fila		= w_ingreso_solicitudes.dw_lista.getrow()
	ll_cant		= w_ingreso_solicitudes.dw_lista.getitemnumber(ll_fila,'cantidad')
	ll_cant++
	w_ingreso_solicitudes.dw_lista.setitem(ll_fila,'estado',0)
	w_ingreso_solicitudes.dw_lista.setitem(ll_fila,'cantidad',ll_cant)
	w_ingreso_solicitudes.dw_lista.accepttext()
end if
end subroutine

public subroutine wf_grabar_repacta_compraventa ();date		ld_fec_1er_vcto,ld_fec_vcto,ld_fec_prox_pago
datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_ult,ldt_fecha_entre,ldt_fecha_pie,ldt_fecha_mod,&
			ldt_fecha_fact,ldt_fecha_hoy,ldt_fecha_m,ldt_fec_venc_mant,ldt_fecha_prim_pie
Long		ll_correlativo,ll_precio,ll_capacidad,ll_des_esp,ll_nro_cuotas,ll_parque,ll_derecho_lib,ll_gastos_adm,&
			ll_factura,ll_pie_pagado,ll_cod_Parque,ll_rut,ll_count_vig,ll_codigo_tipo_seguro,ll_count_reg_atencion,&
			ll_ctas_pactadas_pie,ll_ctas_pagadas_pie
String		ls_serie,ls_n_reduccion,ls_moneda,ls_modificado,ls_area,ls_sector,ls_sepultura,&
			ls_carta_bienv,ls_nro_tecnico,ls_dv,ls_obs_sepultura,ls_dicom,ls_glosa,ls_estado='67'
Double	ll_pie,ll_tasa,ll_valor_cuota,ll_uf_dia,ll_total_fact,ldb_valor_cuota_m,ldb_tasa_base,ll_numero,ll_ult_folio,ll_nro_oferta,ll_folio

ldt_fecha				= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy		= datetime(idt_fecha_hoy,time("00:00:00"))
ld_fec_1er_vcto	= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecrep_1_vcto'))
ld_fec_vcto			= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecrep_ult_vcto'))
ld_fec_prox_pago	= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecha_prox_vcto'))
ll_numero			= dw_reporte.getitemnumber(1,'sol_repacta_cvta_numero')
ll_correlativo		= dw_reporte.getitemnumber(1,'sol_repacta_cvta_correlativo')
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
FROM 		"OFERTA_V",   
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
	SELECT	"PAGO_OFERTA"."SERIE",   "PAGO_OFERTA"."NRO_OFERTA",   "PAGO_OFERTA"."FECHA",   "PAGO_OFERTA"."FOLIO",   "PAGO_OFERTA"."PRECIO",   	"PAGO_OFERTA"."PIE",   "PAGO_OFERTA"."TASA",   "PAGO_OFERTA"."CAPACIDAD",   "PAGO_OFERTA"."N_REDUCCION",   "PAGO_OFERTA"."VALOR_CUOTA",   "PAGO_OFERTA"."DES_ESP",   "PAGO_OFERTA"."NRO_CUOTAS",   "PAGO_OFERTA"."UF_DIA",   "PAGO_OFERTA"."MONEDA",   	"PAGO_OFERTA"."FECHA_PRIM",   "PAGO_OFERTA"."FECHA_ULT",   "PAGO_OFERTA"."FECHA_ENTRE",   "PAGO_OFERTA"."FECHA_PIE",   "PAGO_OFERTA"."MODIFICADO",   "PAGO_OFERTA"."FECHA_MOD",   "PAGO_OFERTA"."AREA",   "PAGO_OFERTA"."PARQUE",   "PAGO_OFERTA"."SECTOR",   "PAGO_OFERTA"."SEPULTURA",   "PAGO_OFERTA"."DERECHO_LIB",   "PAGO_OFERTA"."GASTOS_ADM",   "PAGO_OFERTA"."FACTURA",   "PAGO_OFERTA"."FECHA_FACT",   "PAGO_OFERTA"."TOTAL_FACT",   "PAGO_OFERTA"."CARTA_BIENV",   "PAGO_OFERTA"."PIE_PAGADO",   "PAGO_OFERTA"."NRO_TECNICO",	"PAGO_OFERTA"."OBS_SEPULTURA"	,	"PAGO_OFERTA"."TASA_BASE",	"PAGO_OFERTA"."CODIGO_TIPO_SEGURO",	"PAGO_OFERTA"."DICOM",	"PAGO_OFERTA"."CTAS_PACTADAS_PIE",	"PAGO_OFERTA"."CTAS_PAGADAS_PIE",	"PAGO_OFERTA"."FECHA_PRIM_PIE"
	INTO 		:ls_serie,   				 		:ll_nro_oferta,   				 		:ldt_fecha,   			 		 :ll_folio,   						:ll_precio,   				 			:ll_pie,   				 		:ll_tasa,   						:ll_capacidad,   						:ls_n_reduccion,   				 		:ll_valor_cuota,   				  			:ll_des_esp,   				  		:ll_nro_cuotas,   				  		:ll_uf_dia,   				 			:ls_moneda,   						:ldt_fecha_prim,   				:ldt_fecha_ult,   			  :ldt_fecha_entre,   				:ldt_fecha_pie,   			  :ls_modificado,   				  :ldt_fecha_mod,   				 :ls_area,   				 :ll_parque,   				:ls_sector,   				  :ls_sepultura,   				 :ll_derecho_lib,   				  :ll_gastos_adm,   				  :ll_factura,   				  :ldt_fecha_fact,   			  :ll_total_fact,   				  :ls_carta_bienv,   				:ll_pie_pagado,   				:ls_nro_tecnico,					:ls_obs_sepultura,					:ldb_tasa_base,				:ll_codigo_tipo_seguro,					:ls_dicom,					:ll_ctas_pactadas_pie,					:ll_ctas_pagadas_pie,					:ldt_fecha_prim_pie
	FROM 		"PAGO_OFERTA"  
	WHERE 	( "PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
				( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) AND  
				( "PAGO_OFERTA"."FOLIO" = :ll_ult_folio )   
	Using		sqlca;
	if sqlca.sqlcode=0 then // incrementa 1 el folio y lo inserta en pago_oferta
		ll_folio		= Double(string(ll_numero)+string(ll_correlativo))
		INSERT INTO "PAGO_OFERTA"  
				 ( "SERIE",   	"NRO_OFERTA",   "FECHA",   			"FOLIO",   	"PRECIO",   "PIE",   "TASA",   "CAPACIDAD",   	"N_REDUCCION",   "VALOR_CUOTA",   "DES_ESP",   	"NRO_CUOTAS",   "UF_DIA",   "MONEDA",   "FECHA_PRIM",   	"FECHA_ULT",   "FECHA_ENTRE",   "FECHA_PIE",   "MODIFICADO",   "FECHA_MOD",   	"AREA",   "PARQUE",   "SECTOR",   "SEPULTURA",   	"DERECHO_LIB",   "GASTOS_ADM",   "FACTURA",   	"FECHA_FACT",   	"TOTAL_FACT",   	"CARTA_BIENV",   "PIE_PAGADO",   "NRO_TECNICO",	"PAGO_OFERTA"."OBS_SEPULTURA"	,	"PAGO_OFERTA"."TASA_BASE",	"PAGO_OFERTA"."CODIGO_TIPO_SEGURO",	"PAGO_OFERTA"."DICOM",	"PAGO_OFERTA"."CTAS_PACTADAS_PIE",	"PAGO_OFERTA"."CTAS_PAGADAS_PIE",	"PAGO_OFERTA"."FECHA_PRIM_PIE" )  
		VALUES ( :ls_serie, 	:ll_nro_oferta, 		:ldt_fecha_hoy,		:ll_folio, 		:ll_precio, 	:ll_pie, :ll_tasa, :ll_capacidad, 		:ls_n_reduccion, 	:ll_valor_cuota, 	:ll_des_esp, 	:ll_nro_cuotas, 		:ll_uf_dia, :ls_moneda, 	:ld_fec_1er_vcto, 	:ld_fec_vcto, 	:ldt_fecha_entre,	:ldt_fecha_pie,	:ls_modificado, 	:ldt_fecha_mod,   :ls_area, :ll_parque, 	:ls_sector, 	:ls_sepultura, 		:ll_derecho_lib, 	:ll_gastos_adm, 	:ll_factura, 		:ldt_fecha_fact,		:ll_total_fact, 		:ls_carta_bienv, 	:ll_pie_pagado, :ls_nro_tecnico,	:ls_obs_sepultura,								:ldb_tasa_base,						:ll_codigo_tipo_seguro,							:ls_dicom,						:ll_ctas_pactadas_pie,							:ll_ctas_pagadas_pie,							:ldt_fecha_prim_pie )  
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
				DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
				EXECUTE sp_nuevo_cadena_mora;
					
				INSERT INTO "CUPONERAS_MODIFICA"  
							( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",		"FECHA_PRIM",		"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
				VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_nro_cuotas,	:ll_rut,	:ls_dv,	:ll_valor_cuota,		:ldb_valor_cuota_m,	:ll_cod_parque,	:ld_fec_1er_vcto,	:ldt_fecha_m,		:ls_moneda,	'C' )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					DECLARE sp_mod_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
					EXECUTE sp_mod_cadena_mora;
					
				/*	SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
					INTO 		:ldt_fec_venc_mant  
					FROM 	"CADENA_MORA"  
					WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
							 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
							 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
					USING	sqlca;  */
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
			ldt_fecha_fact,ldt_fecha_hoy,ldt_fecha_m,ldt_fec_venc_mant
Long		ll_correlativo,ll_precio,ll_capacidad,ll_des_esp,ll_nro_cuotas,ll_parque,ll_derecho_lib,ll_gastos_adm,&
			ll_factura,ll_pie_pagado,ll_cod_Parque,ll_rut,ll_count_vig,ll_count_reg_atencion
String	ls_serie,ls_n_reduccion,ls_moneda,ls_modificado,ls_area,ls_sector,ls_sepultura,&
			ls_carta_bienv,ls_nro_tecnico,ls_dv,ls_glosa,ls_estado='67'
Double	ll_pie,ll_tasa,ll_valor_cuota,ll_uf_dia,ll_total_fact,ldb_valor_cuota_m=0,ll_numero,ll_ult_folio,ll_nro_aumento,ll_folio

SetNull(ldt_fecha_m)
ldt_fecha				= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy		= datetime(idt_fecha_hoy,time("00:00:00"))
ld_fec_1er_vcto	= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecrep_1_vcto'))
ld_fec_vcto			= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecrep_ult_vcto'))
ld_fec_prox_pago	= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecha_prox_vcto'))
ll_numero			= dw_reporte.getitemnumber(1,'sol_repacta_cvta_numero')
ll_correlativo		= dw_reporte.getitemnumber(1,'sol_repacta_cvta_correlativo')
// ver si existe en anexo_capacidad y rescatar ult_folio
SELECT	"ANEXO_LIBERADOR"."ULT_FOLIO",
			"CADENA"."COD_PARQUE",
			"ANEXO_LIBERADOR"."RUT",
			"CLIENTE"."DV"
INTO 		:ll_ult_folio,
			:ll_cod_parque,
			:ll_rut,
			:ls_dv
FROM 		"ANEXO_LIBERADOR",   
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
	SELECT	"PAGO_LIBERADOR"."SERIE_M",  "PAGO_LIBERADOR"."NRO_LIBERADOR", 	"PAGO_LIBERADOR"."FECHA",	"PAGO_LIBERADOR"."FOLIO", 	"PAGO_LIBERADOR"."PRECIO",	"PAGO_LIBERADOR"."PIE_PAGADO",	"PAGO_LIBERADOR"."PIE", "PAGO_LIBERADOR"."TASA",	"PAGO_LIBERADOR"."VALOR_CUOTA", 	"PAGO_LIBERADOR"."NRO_CUOTAS",  	"PAGO_LIBERADOR"."UF_DIA", "PAGO_LIBERADOR"."MONEDA", "PAGO_LIBERADOR"."FECHA_PRIM", 	"PAGO_LIBERADOR"."FECHA_ULT", "PAGO_LIBERADOR"."FECHA_PIE",	"PAGO_LIBERADOR"."MODIFICADO",	"PAGO_LIBERADOR"."FECHA_MOD", "PAGO_LIBERADOR"."GASTOS_ADM"  
	INTO 		:ls_serie,   						:ll_nro_aumento,   									:ldt_fecha,   						:ll_folio,   							:ll_precio,   					:ll_pie_pagado,   					:ll_pie,   					:ll_tasa,   					:ll_valor_cuota,   					:ll_nro_cuotas,   					:ll_uf_dia,   					:ls_moneda,   					:ldt_fecha_prim,   					:ldt_fecha_ult,   				:ldt_fecha_pie,   				:ls_modificado,   					:ldt_fecha_mod,   				:ll_gastos_adm 
	FROM 	"PAGO_LIBERADOR"  
	WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
			 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND
			 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ult_folio )
	USING	sqlca;
	if sqlca.sqlcode=0 then // incrementa 1 el folio y lo inserta en PAGO_LIBERADOR
		ll_folio	= Double(string(ll_numero)+string(ll_correlativo))
		INSERT INTO	"PAGO_LIBERADOR"  
					( "SERIE_M",   "NRO_LIBERADOR",  	"FECHA",   	"FOLIO",   	"PRECIO",   "PIE_PAGADO",   "PIE",   	"TASA",   "VALOR_CUOTA",  	"NRO_CUOTAS",   "UF_DIA",   	"MONEDA",   "FECHA_PRIM",   	"FECHA_ULT",   	"FECHA_PIE",   	"MODIFICADO",   "FECHA_MOD",   	"GASTOS_ADM" )  
		VALUES 	( :ls_serie,		:ll_nro_aumento,		:ldt_fecha, :ll_folio, 		:ll_precio, 	:ll_pie_pagado, :ll_pie, 	:ll_tasa, 	:ll_valor_cuota, 		:ll_nro_cuotas, 		:ll_uf_dia, 	:ls_moneda, :ld_fec_1er_vcto,	:ld_fec_vcto,		:ldt_fecha_pie,   :ls_modificado, :ldt_fecha_mod,		:ll_gastos_adm )  
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
				DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
				EXECUTE sp_nuevo_cadena_mora;
				
				INSERT INTO "CUPONERAS_MODIFICA"  
							( "BASE",		"SERIE",		"NUMERO",	"FECHA_CREA",	"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",		"FECHA_PRIM",		"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
				VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,				'V',					:ll_nro_cuotas,		:ll_rut,	:ls_dv,	:ll_valor_cuota,		0,							:ll_cod_parque,	:ldt_fecha_prim,	:ldt_fecha_m,		:ls_moneda,	'C' )  
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
						SET 			"ESTADO_CUPONERA" = 'A'  
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
	messagebox("Advertencia","No Existe Anexo Liberador "+gs_base+'-'+gs_serie+'-'+string(gi_numero))
elseif sqlca.sqlcode=-1 then
	messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
end if
end subroutine

public subroutine wf_grabar_repacta_pagare ();date		ld_fec_1er_vcto,ld_fec_vcto,ld_fec_prox_pago
datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_ult,ldt_fecha_entre,ldt_fecha_pie,ldt_fecha_mod,ldt_fecha_fact,ldt_fecha_hoy,ldt_fecha_m,ldt_fec_venc_mant
Long		ll_correlativo,ll_precio,ll_capacidad,ll_des_esp,ll_nro_cuotas,ll_parque,ll_derecho_lib,ll_gastos_adm,ll_factura,ll_pie_pagado,ll_cod_Parque,ll_rut,ll_count_vig,ll_count_reg_atencion
String		ls_serie,ls_n_reduccion,ls_moneda,ls_modificado,ls_area,ls_sector,ls_sepultura,ls_carta_bienv,ls_nro_tecnico,ls_dv,ls_glosa,ls_estado='67'
Double	ll_pie,ll_tasa,ll_valor_cuota,ll_uf_dia,ll_total_fact,ldb_valor_cuota_m=0,ll_numero,ll_ult_folio,ll_nro_aumento,ll_folio

SetNull(ldt_fecha_m)
ldt_fecha				= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy		= datetime(idt_fecha_hoy,time("00:00:00"))
ld_fec_1er_vcto	= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecrep_1_vcto'))
ld_fec_vcto			= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecrep_ult_vcto'))
ld_fec_prox_pago	= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecha_prox_vcto'))
ll_numero			= dw_reporte.getitemnumber(1,'sol_repacta_cvta_numero')
ll_correlativo		= dw_reporte.getitemnumber(1,'sol_repacta_cvta_correlativo')
// ver si existe en anexo_capacidad y rescatar ult_folio
SELECT	"CLIENTE"."RUT",	"CLIENTE"."DV",	"PAGARE"."PLAZO",	"PAGARE"."VALOR_CUO",	"CADENA"."COD_PARQUE",	"PAGARE"."MONEDA"
INTO		:ll_rut,				:ls_dv,				:ll_nro_cuotas,	:ll_valor_cuota,			:ll_cod_parque,			:ls_moneda
FROM 		"PAGARE",	"CADENA",	"CLIENTE"  
WHERE  ( "PAGARE"."SERIE_P" = "CADENA"."SERIE" ) and  
		 ( "PAGARE"."NRO_PAGARE" = "CADENA"."NUMERO" ) and 
		 ( "CADENA"."RUT" = "CLIENTE"."RUT") AND  
		 ( "CADENA"."CODIGO" = :gs_base ) AND  
		 ( "PAGARE"."SERIE_P" = :gs_serie ) AND  
		 ( "PAGARE"."NRO_PAGARE" = :gi_numero )   
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
				SET 			"ESTADO_CUPONERA" = 'A'  
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

public subroutine wf_cargar_datos_rescil_reprog ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part,ls_pasa='N'
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac,ldt_fecha_comi
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,ls_estado_comi
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_form_resciliacion_por_reprogramacion'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemstring(1,'oferta_v_estado_comi')
			ldt_fecha_comi	= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'oferta_v_fecha_com')
			ls_pasa			= 'S'
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= ''
			ls_pasa			= 'S'
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemstring(1,'anexo_liberador_estado_comi')
			ldt_fecha_comi	= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'anexo_liberador_fecha_com')
			ls_pasa			= 'S'
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemstring(1,'producto_anexo_estado_comi')
			ldt_fecha_comi	= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'producto_anexo_fecha_com')
			ls_pasa			= 'S'
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemstring(1,'anexo_aumento_estado_comi')
			ldt_fecha_comi	= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'anexo_aumento_fecha_com')
			ls_pasa			= 'S'
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= ''
			ls_pasa			= 'S'
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= ''
			ls_pasa			= 'S'
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_estado_comi	= ''
			ls_pasa			= 'S'
		end if
END CHOOSE

if is_estado="N" and ls_pasa = 'S' then
	SELECT MAX("SOL_RESCILIA_REPROG"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_RESCILIA_REPROG"  
   WHERE ( "SOL_RESCILIA_REPROG"."BASE" = :is_base ) AND  
         ( "SOL_RESCILIA_REPROG"."SERIE" = :is_serie ) AND  
         ( "SOL_RESCILIA_REPROG"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_base',is_base)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_prioridad','N')
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_estatus_operacion',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_derecho_esp',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_aum_capital',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_dis_capital',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_aum_plazo',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_mora',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_dacion_pago',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_aumento_capacida',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_carta_simple',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_carta_notarial',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_finiquito',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_inf_social',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_otro_2',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_est_sin_antece',1)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_estado_comi',ls_estado_comi)
	if isnull(ldt_fecha_comi) or date(ldt_fecha_comi)=date("01/01/1900") or date(ldt_fecha_comi)=date("00/00/0000") then 
		setnull(ldt_fecha_comi) //=datetime(date("00/00/0000"),time("00:00:00"))
	end if
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_fecha_comi',ldt_fecha_comi)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_fecha_rescil_origina',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_numero_particular_or',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_depto_particular_ori',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_block_particular_ori',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_estado_civil_origina',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_estado_cob_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_rescilia_reprog_mod_ant_cliente','N')
	if isvalid(w_cuotas) then
		dw_reporte.setitem(ll_new,'sol_rescilia_reprog_base_nuevo',w_cuotas.dw_repacta.getitemstring(1,'base'))
		dw_reporte.setitem(ll_new,'sol_rescilia_reprog_serie_nuevo',w_cuotas.dw_repacta.getitemstring(1,'serie'))
		dw_reporte.setitem(ll_new,'sol_rescilia_reprog_numero_nuevo',long(w_cuotas.em_numero.text))
	end if
	if isvalid(w_cuotas_pagare) then
		dw_reporte.setitem(ll_new,'sol_rescilia_reprog_base_nuevo',w_cuotas_pagare.dw_repacta.getitemstring(1,'base'))
		dw_reporte.setitem(ll_new,'sol_rescilia_reprog_serie_nuevo',w_cuotas_pagare.dw_repacta.getitemstring(1,'serie'))
		dw_reporte.setitem(ll_new,'sol_rescilia_reprog_numero_nuevo',long(w_cuotas_pagare.em_numero.text))
	end if
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_rescilia_reprog_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_rescilia_reprog_usuario','') //ok
	end if
//	if dw_reporte.dataobject='dw_form_transferencia' or dw_reporte.dataobject='dw_form_entrega_de_pagare' or &
//		dw_reporte.dataobject='dw_form_contrato_definitivo' or dw_reporte.dataobject='dw_form_titulo_de_dominio' then
//		SELECT	"CADENA"."ESTADO_TITULO"  
//		INTO 		:ls_titulo  
//		FROM 		"CADENA"  
//		WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
//					( "CADENA"."SERIE" = :is_serie ) AND  
//					( "CADENA"."NUMERO" = :il_numero )   
//		Using		sqlca;
//		if sqlca.sqlcode=0 then
//			dw_reporte.setitem(ll_new,'ingreso_solicitudes_titulo_dominio',ls_titulo)
//		else
//			dw_reporte.setitem(ll_new,'ingreso_solicitudes_titulo_dominio','')
//		end if
//		SELECT	"CARTA_LOG"."COD_ACCION"  
//		INTO 		:ll_ctto_def  
//		FROM 		"CARTA_LOG"  
//		WHERE 	( "CARTA_LOG"."BASE" = :is_base ) AND  
//					( "CARTA_LOG"."SERIE" = :is_serie ) AND  
//					( "CARTA_LOG"."NUMERO" = :il_numero )   
//		Using		sqlca;
//		if sqlca.sqlcode=0 then
//			dw_reporte.setitem(ll_new,'ingreso_solicitudes_ctto_definitivo',ll_ctto_def)
//		else
//			dw_reporte.setitem(ll_new,'ingreso_solicitudes_ctto_definitivo',0)
//		end if
//	end if
			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_estatus_operacion')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
elseif ls_pasa='N' then
	messagebox("Advertencia","Ventana Cuenta Corriente debe estar Activa")
	close(w_mantencion_fromulario_solicitudes)
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_pat ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,ls_tipo_via,&
			ls_nro_part,ls_depto_part,ls_block_part,ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,&
			ls_domic_c,ls_fono_c,ls_est_cob,ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,ls_moneda
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac,ldt_fec_prox_cred,ldt_fec_prox_mant,&
			ldt_nulo
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg,ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf,&
			ll_new, ll_cta_repacta,ll_ctto_def
Double	ldb_val_cta_cred,ldb_val_cta_mant

Setnull(ldt_nulo)
dw_reporte.dataobject	= 'dw_form_mandato_pat'
dw_reporte.settransobject(sqlca)

SELECT	"CADENA_MORA"."FECHA_VENC_CRED",	"CADENA_MORA"."FECHA_VENC_MANT"  
INTO 		:ldt_fec_prox_cred,					:ldt_fec_prox_mant  
FROM 		"CADENA_MORA"  
WHERE  ( "CADENA_MORA"."BASE" = :is_base ) AND  
		 ( "CADENA_MORA"."SERIE" = :is_serie ) AND  
		 ( "CADENA_MORA"."NUMERO" = :il_numero )   ;

CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res				= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ldb_val_cta_cred		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_valor_cuota')
			ls_moneda				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_moneda')
//			if ls_moneda='1' then
//				ldb_val_cta_cred	= round(ldb_val_cta_cred / gd_uf_dia,4)
//			end if
			ldb_val_cta_mant		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_valor_cuota_m')
			ldt_fec_prox_cred		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'cadena_mora_fecha_venc_cred')
			ldt_fec_prox_mant		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'cadena_mora_fecha_venc_mant')
		end if

	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age			= ''
			ls_cod_sup			= ''
			ls_area				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta		= 0
			ld_fecha_prim		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res			= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ldb_val_cta_cred	= 0
			ldb_val_cta_mant	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_valor_cuota_m')
		end if

	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut					= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora					= 0
			ls_cod_age				= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup				= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area					= ''
			ls_sector				= ''
			ls_sepultura			= ''
			ll_capacidad			= 0
			ll_cta_repacta			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha					= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res				= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_moneda				= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'pago_liberador_moneda')
			ldb_val_cta_cred		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_valor_cuota')
//			if ls_moneda='1' then
//				ldb_val_cta_cred	= round(ldb_val_cta_cred / gd_uf_dia,4)
//			end if
			ldb_val_cta_mant		= 0
		end if

	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut						= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora					= 0
			ls_cod_age				= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup				= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area					= ''
			ls_sector					= ''
			ls_sepultura				= ''
			ll_capacidad				= 0
			ll_cta_repacta			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult				= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha					= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s				= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res				= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_moneda				= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_pago_moneda')
			ldb_val_cta_cred		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_valor_cuota')
//			if ls_moneda='1' then
//				ldb_val_cta_cred	= round(ldb_val_cta_cred / gd_uf_dia,4)
//			end if
			ldb_val_cta_mant		= 0
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut					= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora					= 0
			ls_cod_age				= ''
			ls_cod_sup				= ''
			ls_area					= ''
			ls_sector				= ''
			ls_sepultura			= ''
			ll_capacidad			= 0
			ll_cta_repacta			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha					= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res				= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_moneda				= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemstring(1,'repacta_mantencion_tipo_moneda')
			ldb_val_cta_cred		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_valor_cuota_uf')
			ldb_val_cta_mant		= 0
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora					= 0
			ls_cod_age				= ''
			ls_cod_sup				= ''
			ls_area					= ''
			ls_sector				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad			= 0
			ll_cta_repacta			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha					= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res				= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_moneda				= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemstring(1,'derecho_moneda')
			ldb_val_cta_cred		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemnumber(1,'derecho_valor_cuo')
//			if ls_moneda='1' then
//				ldb_val_cta_cred	= round(ldb_val_cta_cred / gd_uf_dia,4)
//			end if

			ldb_val_cta_mant		= 0
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut					= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora					= 0
			ls_cod_age				= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup				= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area					= ''
			ls_sector				= ''
			ls_sepultura			= ''
			ll_capacidad			= 0
			ll_cta_repacta			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha					= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res				= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_moneda				= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'pago_aumento_moneda')
			ldb_val_cta_cred		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_valor_cuota')
//			if ls_moneda='1' then
//				ldb_val_cta_cred	= round(ldb_val_cta_cred / gd_uf_dia,4)
//			end if
			ldb_val_cta_mant		= 0
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut					= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora					= 0
			ls_cod_age				= ''
			ls_cod_sup				= ''
			ls_area					= ''
			ls_sector				= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad			= 0
			ll_cta_repacta			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha					= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  		  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res				= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ls_moneda				= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_moneda')
			ldb_val_cta_cred		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_valor_cuo')
//			if ls_moneda='1' then
//				ldb_val_cta_cred	= round(ldb_val_cta_cred / gd_uf_dia,4)
//			end if
			ldb_val_cta_mant		= 0
		end if
END CHOOSE
if is_estado="N" then
	SELECT	MAX("SOL_PAT"."CORRELATIVO")
   INTO		:il_correlativo
   FROM 		"SOL_PAT"  
   WHERE  ( "SOL_PAT"."BASE" = :is_base ) AND  
          ( "SOL_PAT"."SERIE" = :is_serie ) AND  
          ( "SOL_PAT"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if

	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	
	dw_reporte.setitem(ll_new,'sol_pat_base',is_base)
	dw_reporte.setitem(ll_new,'sol_pat_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_pat_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_pat_folio_mandato',il_folio_mandato)
	if is_base='C' then
		dw_reporte.setitem(ll_new,'sol_pat_fecha_cobro_pac',ldt_nulo)
	else
		dw_reporte.setitem(ll_new,'sol_pat_fecha_cobro_pac',ldt_fec_prox_cred)
	end if
//	dw_reporte.setitem(ll_new,'sol_pat_fecha_cobro_pac_mant',ldt_fec_prox_mant)
	dw_reporte.setitem(ll_new,'sol_pat_fecha_venc_cred',ldt_fec_prox_cred)
//	dw_reporte.setitem(ll_new,'sol_pat_fecha_venc_mant',ldt_fec_prox_mant)
	dw_reporte.setitem(ll_new,'sol_pat_monto_cuota_cred',ldb_val_cta_cred)
//	dw_reporte.setitem(ll_new,'sol_pat_monto_cuota_mant',ldb_val_cta_mant)
//	dw_reporte.setitem(ll_new,'sol_pat_base_mandato','S')
//	dw_reporte.setitem(ll_new,'sol_pat_serie_mandato','P')
//	dw_reporte.setitem(ll_new,'sol_pat_tipo_cuenta',1)
	dw_reporte.setitem(ll_new,'sol_pat_fecha_suscripcion',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_pat_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_pat_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_pat_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_pat_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_pat_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_pat_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_pat_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_pat_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_pat_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_pat_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_pat_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_pat_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_pat_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_pat_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_pat_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_pat_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_pat_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_pat_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_pat_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_pat_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_pat_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_pat_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_pat_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_pat_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_pat_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_pat_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_pat_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_pat_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_pat_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_pat_area_sepultura',ls_area)
	dw_reporte.setitem(ll_new,'sol_pat_sector_sepultura',ls_sector)
	dw_reporte.setitem(ll_new,'sol_pat_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_pat_capacidad',ll_capacidad)
	dw_reporte.setitem(ll_new,'sol_pat_estatus_operacion',1)
	dw_reporte.setitem(ll_new,'sol_pat_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_pat_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_pat_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_pat_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_pat_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_pat_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_pat_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_pat_numero_particular_original',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_pat_depto_particular_original',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_pat_block_particular_original',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_pat_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_pat_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_pat_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_pat_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_pat_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_pat_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_pat_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_pat_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_pat_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_pat_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_pat_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_pat_estado_cod_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_pat_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_pat_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_pat_usuario','') //ok
	end if
	dw_reporte.accepttext()
	
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_pat_estatus_operacion')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_pat_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_seguro_desgravamen ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_formulario_seguro_desgravamen'
dw_reporte.settransobject(sqlca)
dw_reporte.getchild('sol_seguro_desg_comuna_contacto',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_SEGURO_DESG"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_SEGURO_DESG"  
   WHERE ( "SOL_SEGURO_DESG"."BASE" = :is_base ) AND  
         ( "SOL_SEGURO_DESG"."SERIE" = :is_serie ) AND  
         ( "SOL_SEGURO_DESG"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if

	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_seguro_desg_base',is_base)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_direccion_fall',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_f_fono_casa',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_f_fono_of',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_f_celular','')
	dw_reporte.setitem(ll_new,'sol_seguro_desg_f_fono_otro','')
	dw_reporte.setitem(ll_new,'sol_seguro_desg_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_estatus_operaciones',1)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_est_cert_defuncion',1)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_cod_supervisor',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_numero_particular_origin',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_depto_particular_origina',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_block_particular_origina',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_estado_cob_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_seguro_desg_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_seguro_desg_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_seguro_desg_usuario','') //ok
	end if
			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_seguro_desg_estatus_operaciones')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_seguro_desg_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_seguro_fallecimiento ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_formulario_seguro_fallecimiento'
dw_reporte.settransobject(sqlca)
dw_reporte.getchild('sol_seguro_fallece_comuna_contacto',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_SEGURO_FALLECE"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_SEGURO_FALLECE"  
   WHERE ( "SOL_SEGURO_FALLECE"."BASE" = :is_base ) AND  
         ( "SOL_SEGURO_FALLECE"."SERIE" = :is_serie ) AND  
         ( "SOL_SEGURO_FALLECE"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if

	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_base',is_base)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_direccion_fall',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_f_fono_casa',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_f_fono_of',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_f_celular','')
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_f_fono_otro','')
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_estatus_operaciones',1)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_est_cert_defuncion',1)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_cod_supervisor',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_numero_particular_ori',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_depto_particular_orig',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_block_particular_orig',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_estado_cob_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_seguro_fallece_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_seguro_fallece_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_seguro_fallece_usuario','') //ok
	end if
			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_seguro_fallece_estatus_operaciones')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_seguro_fallece_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_coprop_promesa ();Long		ll_new,ll_cod_parque,ll_rut
Datetime	ldt_fecha_ctto,ldt_fecha_creacion
String	ls_uso,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat

ldt_fecha_creacion				= datetime(date(gdt_fec_sistema),time('00:00:00'))
dw_reporte.dataobject		= 'dw_form_copropietario_promesa'
dw_reporte.settransobject(sqlca)
dw_ingreso_coprop.settransobject(sqlca)
if is_estado="N" then
	ll_new							= dw_reporte.insertrow(0)
	SELECT	MAX("SOL_COPROP_PROMESA"."CORRELATIVO")
   INTO 		:il_correlativo
   FROM 		"SOL_COPROP_PROMESA"  
   WHERE  ( "SOL_COPROP_PROMESA"."BASE" = :is_base ) AND  
          ( "SOL_COPROP_PROMESA"."SERIE" = :is_serie ) AND  
          ( "SOL_COPROP_PROMESA"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"OFERTA_V"."FECHA",	"CADENA"."COD_PARQUE",	"OFERTA_V"."USO",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO"
	INTO 		:ldt_fecha_ctto,		:ll_cod_parque,			:ls_uso,				:ll_rut,				:ls_dv,				:ls_nombre,				:ls_ap_pat,					:ls_ap_mat
	FROM 		"CADENA",	"CLIENTE",	"OFERTA_V",	"PAGO_OFERTA"  
	WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
			 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
			 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
			 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
			 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
			 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
			 (("CADENA"."CODIGO" = :is_base ) AND  
			 ( "CADENA"."SERIE" = :is_serie ) AND  
			 ( "CADENA"."NUMERO" = :il_numero ) )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_fecha_creacion',ldt_fecha_creacion)
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_fecha_contrato',ldt_fecha_ctto)
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_base',is_base)
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_serie',is_serie)
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_numero',il_numero)
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_uso',ls_uso)
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_cod_parque',ll_cod_parque)
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_rut_titular',ll_rut)
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_dv_titular',ls_dv)
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_correlativo',il_correlativo)
		dw_reporte.setitem(ll_new,'cliente_nombre',ls_nombre)
		dw_reporte.setitem(ll_new,'cliente_a_paterno',ls_ap_pat)
		dw_reporte.setitem(ll_new,'cliente_a_materno',ls_ap_mat)
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_estatus_opera',1)
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_estatus_infor',1)
		dw_reporte.setitem(ll_new,'sol_coprop_promesa_mod_ant_cliente','N')
	end if
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
end if
dw_reporte.accepttext()
dw_ingreso_coprop.visible		= true
dw_ingreso_coprop.retrieve(is_base,is_serie,il_numero,il_correlativo)
if dw_reporte.getitemnumber(1,'sol_coprop_promesa_estatus_infor')=0 then
	dw_ingreso_coprop.enabled	= false
//	if cb_grabar.enabled=true then 
//		cb_grabar.enabled			= false
//	end if
end if
if dw_reporte.getitemstring(1,'sol_estatus_estado_reg') ='I' then
	dw_ingreso_coprop.enabled			= false
else
	dw_ingreso_coprop.enabled			= true
end if
end subroutine

public subroutine wf_grabar_repacta_funeraria ();date		ld_fec_1er_vcto,ld_fec_vcto,ld_fec_prox_pago
datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_ult,ldt_fecha_entre,ldt_fecha_pie,ldt_fecha_mod,&
			ldt_fecha_fact,ldt_fecha_hoy,ldt_fecha_m,ldt_fec_venc_mant
Long		ll_correlativo,ll_precio,ll_capacidad,ll_des_esp,ll_nro_cuotas,ll_parque,ll_derecho_lib,ll_gastos_adm,&
			ll_factura,ll_pie_pagado,ll_cod_Parque,ll_rut,ll_count_vig,ll_count_reg_atencion
String	ls_serie,ls_n_reduccion,ls_moneda,ls_modificado,ls_area,ls_sector,ls_sepultura,&
			ls_carta_bienv,ls_nro_tecnico,ls_dv,ls_glosa,ls_estado='67'
Double	ll_pie,ll_tasa,ll_valor_cuota,ll_uf_dia,ll_total_fact,ldb_valor_cuota_m=0,ll_numero,ll_ult_folio,ll_nro_aumento,ll_folio

SetNull(ldt_fecha_m)
ldt_fecha			= datetime(idt_fecha_hoy,now())
ldt_fecha_hoy		= datetime(idt_fecha_hoy,time("00:00:00"))
ld_fec_1er_vcto	= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecrep_1_vcto'))
ld_fec_vcto			= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecrep_ult_vcto'))
ld_fec_prox_pago	= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecha_prox_vcto'))
ll_numero			= dw_reporte.getitemnumber(1,'sol_repacta_cvta_numero')
ll_correlativo		= dw_reporte.getitemnumber(1,'sol_repacta_cvta_correlativo')
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
	SELECT	"PRODUCTO_PAGO"."SERIE",  "PRODUCTO_PAGO"."NUMERO", "PRODUCTO_PAGO"."FECHA",	"PRODUCTO_PAGO"."FOLIO", 	"PRODUCTO_PAGO"."PRECIO",	"PRODUCTO_PAGO"."PIE_PAGADO",	"PRODUCTO_PAGO"."PIE", "PRODUCTO_PAGO"."TASA",	"PRODUCTO_PAGO"."VALOR_CUOTA", 	"PRODUCTO_PAGO"."PLAZO",  	"PRODUCTO_PAGO"."UF_DIA", "PRODUCTO_PAGO"."MONEDA", "PRODUCTO_PAGO"."FECHA_PRIM", 	"PRODUCTO_PAGO"."FECHA_ULT", "PRODUCTO_PAGO"."FECHA_PIE"
	INTO 		:ls_serie,   						:ll_nro_aumento,   					:ldt_fecha,   					:ll_folio,   					:ll_precio,   					:ll_pie_pagado,   					:ll_pie,   					:ll_tasa,   					:ll_valor_cuota,   					:ll_nro_cuotas,   					:ll_uf_dia,   					:ls_moneda,   					:ldt_fecha_prim,   					:ldt_fecha_ult,   				:ldt_fecha_pie
	FROM 	"PRODUCTO_PAGO"  
	WHERE  ( "PRODUCTO_PAGO"."SERIE" = :gs_serie ) AND  
			 ( "PRODUCTO_PAGO"."NUMERO" = :gi_numero ) AND
			 ( "PRODUCTO_PAGO"."FOLIO" = :ll_ult_folio )
	USING	sqlca;
	if sqlca.sqlcode=0 then // incrementa 1 el folio y lo inserta en PAGO_LIBERADOR
		ll_folio	= Double(string(ll_numero)+string(ll_correlativo))
		INSERT INTO	"PRODUCTO_PAGO"  
					( "SERIE",   "NUMERO",  "FECHA",   	"FOLIO",   "PRECIO",   "PIE_PAGADO",   "PIE",   "TASA",   "VALOR_CUOTA",   "PLAZO",   "UF_DIA",   "MONEDA",   "FECHA_PRIM",   	"FECHA_ULT",   	"FECHA_PIE" )  
		VALUES 	( :ls_serie,	:ll_nro_aumento,	:ldt_fecha, :ll_folio, :ll_precio, :ll_pie_pagado, :ll_pie, :ll_tasa, :ll_valor_cuota, :ll_nro_cuotas, :ll_uf_dia, :ls_moneda, :ld_fec_1er_vcto,	:ld_fec_vcto,	:ldt_fecha_pie )  
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
				DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
				EXECUTE sp_nuevo_cadena_mora;
				
				INSERT INTO "CUPONERAS_MODIFICA"  
							( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",				"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",		"FECHA_PRIM",		"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
				VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_nro_cuotas,	:ll_rut,	:ls_dv,	:ll_valor_cuota,		0,							:ll_cod_parque,	:ld_fec_1er_vcto,	:ldt_fecha_m,		:ls_moneda,	'C' )  
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
						SET 			"ESTADO_CUPONERA" = 'A'  
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
	messagebox("Advertencia","No Existe Producto Funerario "+gs_base+'-'+gs_serie+'-'+string(gi_numero))
elseif sqlca.sqlcode=-1 then
	messagebox("Advertencia","Error SQL: "+sqlca.sqlerrtext)
end if
end subroutine

public subroutine wf_cargar_datos_en_demanda ();string		ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,ls_celular,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_estado_sol,ls_estado_cob_aux
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac,ldt_fec_hoy,ldt_fecha_opera,ldt_fecha_infor
time		lt_hora=time("00:00:00")
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,ls_otro_fono_p,ls_otro_fono_c
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob,ls_prioridad
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

ldt_fec_hoy					= datetime(DATE(gdt_fec_sistema),lt_hora)
dw_reporte.dataobject	= 'dw_form_cambio_en_demanda'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age'))
			ls_cod_sup		= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup'))
			ls_area			= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area'))
			ls_sector			= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector'))
			ls_sepultura		= trim(w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura'))
			ll_capacidad		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= trim(w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona'))
			ls_sector		= trim(w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector'))
			ls_sepultura	= trim(w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura'))
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= trim(w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector'))
			ls_sepultura	= trim(w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura'))
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= trim(w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector'))
			ls_sepultura	= trim(w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura'))
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE

if is_estado="N" then
	SELECT MAX("SOL_EN_DEMANDA"."CORRELATIVO")
   	INTO :il_correlativo
   	FROM "SOL_EN_DEMANDA"  
   	WHERE ( "SOL_EN_DEMANDA"."BASE" = :is_base ) AND  
         ( "SOL_EN_DEMANDA"."SERIE" = :is_serie ) AND  
         ( "SOL_EN_DEMANDA"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   	WHERE 	"CLIENTE"."RUT" = :ll_rut   
   	USING		sqlca;
	// valida variables
	if isnull(il_cta_pag_s) or il_cta_pag_s<0 then 
		il_cta_pag_s	= 0
	end if
	if isnull(il_nro_cta) or il_nro_cta<0 then 
		il_nro_cta	= 0
	end if
	if isnull(id_fecha_res) or date(id_fecha_res)=date("01/01/1900") or date(id_fecha_res)=date("00/00/0000") then
		setnull(id_fecha_res)
	end if
	if isnull(ll_rut) or ll_rut<0 then 
		ll_rut	= 0
	end if
	if len(ls_direc_p)>60 then
		ls_direc_p	= mid(ls_direc_p,1,60)
	end if
	if isnull(ls_direc_p) then
		ls_direc_p	= ''
	end if
	if len(ls_pob)>60 then
		ls_pob	= mid(ls_pob,1,60)
	end if
	if isnull(ls_pob) then
		ls_pob	= ''
	end if
	if len(ls_sector_cli)>60 then
		ls_sector_cli	= mid(ls_sector_cli,1,60)
	end if
	if isnull(ls_sector_cli) then
		ls_sector_cli= ''
	end if
	if len(ls_comuna)>20 then
		ls_comuna	= mid(ls_comuna,1,20)
	end if
	if isnull(ls_comuna) then
		ls_comuna= ''
	end if
	if len(ls_ciudad)>15 then
		ls_ciudad	= mid(ls_ciudad,1,15)
	end if
	if isnull(ls_ciudad) then
		ls_ciudad= ''
	end if
	if len(ls_fono_p)>25 then
		ls_fono_p	= mid(ls_fono_p,1,25)
	end if
	if isnull(ls_fono_p) then
		ls_fono_p= ''
	end if
	if isnull(ld_fec_nac) or date(ld_fec_nac)=date("01/01/1900") or date(ld_fec_nac)=date("00/00/0000") then
		setnull(ld_fec_nac)
	end if
	if len(ls_est_civil)>1 then
		ls_est_civil	= mid(ls_est_civil,1,1)
	end if
	if isnull(ls_est_civil) then
		ls_est_civil= ''
	end if
	if len(ls_domic_c)>60 then
		ls_domic_c	= mid(ls_domic_c,1,60)
	end if
	if isnull(ls_domic_c) then
		ls_domic_c	= ''
	end if
	if len(ls_fono_c)>25 then
		ls_fono_c	= mid(ls_fono_c,1,25)
	end if
	if isnull(ls_fono_c) then
		ls_fono_c	= ''
	end if
	if isnull(ll_tot_renta) or ll_tot_renta<0 then
		ll_tot_renta= 0
	end if
	if isnull(ll_grupo_f) or ll_grupo_f<0 then
		ll_grupo_f	= 0
	end if
	if len(ls_est_cob)>2 then
		ls_est_cob	= mid(ls_est_cob,1,2)
	end if
	if isnull(ls_est_cob) then
		ls_est_cob	= ''
	end if
	if isnull(ll_mora) or ll_mora<0 then 
		ll_mora	= 0
	end if
	if isnull(ll_cta_repacta) or ll_cta_repacta<0 then
		ll_cta_repacta	= 0
	end if
	ls_celular		= ''
	ls_otro_fono_p	= ''
	ls_otro_fono_c	= ''
	ls_prioridad	= 'N'
	if len(ls_cod_age)>5 then
		ls_cod_age	= mid(ls_cod_age,1,5)
	end if
	if isnull(ls_cod_age) then
		ls_cod_age		= ''
	end if
	if len(ls_cod_sup)>5 then
		ls_cod_sup	= mid(ls_cod_sup,1,5)
	end if
	if isnull(ls_cod_sup) then
		ls_cod_sup		= ''
	end if
	if len(ls_dv)>1 then
		ls_dv	= mid(ls_dv,1,1)
	end if
	if isnull(ls_dv) then
		ls_dv					= ''
	end if
	if len(ls_nombre)>40 then
		ls_nombre	= mid(ls_nombre,1,40)
	end if
	if isnull(ls_nombre) then
		ls_nombre			= ''
	end if
	if len(ls_a_pat)>40 then
		ls_a_pat			= mid(ls_a_pat,1,40)
	end if
	if isnull(ls_a_pat) then
		ls_a_pat			= ''
	end if
	if len(ls_a_mat)>40 then
		ls_a_mat	= mid(ls_a_mat,1,40)
	end if
	if isnull(ls_a_mat) then
		ls_a_mat	= ''
	end if
	ldt_fecha_opera	= datetime(date("00/00/0000"),lt_hora)
	ldt_fecha_infor	= datetime(date("00/00/0000"),lt_hora)
	if len(ls_area)>2 then
		ls_area	= mid(ls_area,1,2)
	end if
	if isnull(ls_area) then
		ls_area	= ''
	end if
	if len(ls_sector)>8 then
		ls_sector	= mid(ls_sector,1,8)
	end if
	if isnull(ls_sector) then
		ls_sector	= ''
	end if
	if len(ls_sepultura)>8 then
		ls_sepultura	= mid(ls_sepultura,1,8)
	end if
	if isnull(ls_sepultura) then
		ls_sepultura		= ''
	end if
	if isnull(ll_capacidad) or ll_capacidad<0 then
		ll_capacidad		= 0
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_en_demanda_base',is_base)
	dw_reporte.setitem(ll_new,'sol_en_demanda_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_en_demanda_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_en_demanda_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_en_demanda_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_en_demanda_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_en_demanda_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_en_demanda_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_en_demanda_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_en_demanda_fecha_actual',ldt_fec_hoy)
	dw_reporte.setitem(ll_new,'sol_en_demanda_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_en_demanda_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_en_demanda_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_en_demanda_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_en_demanda_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_en_demanda_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_en_demanda_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_en_demanda_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_en_demanda_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_en_demanda_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_en_demanda_celular',ls_celular)
	dw_reporte.setitem(ll_new,'sol_en_demanda_otro_fono_p',ls_otro_fono_p)
	dw_reporte.setitem(ll_new,'sol_en_demanda_otro_fono_c',ls_otro_fono_c)
	dw_reporte.setitem(ll_new,'sol_en_demanda_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_en_demanda_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_en_demanda_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_en_demanda_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_en_demanda_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_en_demanda_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_en_demanda_estado_civil',ls_est_civil)
	if not isnull(ld_fec_res) then
		dw_reporte.setitem(ll_new,'sol_en_demanda_fecha_rescil',ld_fec_res)
	end if
	dw_reporte.setitem(ll_new,'sol_en_demanda_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_en_demanda_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_en_demanda_prioridad',ls_prioridad)
	dw_reporte.setitem(ll_new,'sol_en_demanda_usuario_infor','')
	dw_reporte.setitem(ll_new,'sol_en_demanda_usuario_opera','')
	dw_reporte.setitem(ll_new,'sol_en_demanda_fecha_opera',ldt_fecha_opera)
	dw_reporte.setitem(ll_new,'sol_en_demanda_fecha_infor',ldt_fecha_infor)
	dw_reporte.setitem(ll_new,'sol_en_demanda_area_sepultura',ls_area)
	dw_reporte.setitem(ll_new,'sol_en_demanda_sector_sepultura',ls_sector)
	dw_reporte.setitem(ll_new,'sol_en_demanda_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_en_demanda_capacidad',ll_capacidad)
	dw_reporte.setitem(ll_new,'sol_en_demanda_estatus_operacion',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_estatus_informatica',1)
	if is_estado_cadena = 'R' then
		SELECT "CADENA"."ESTADO_CONTRATO_AUX"  
		INTO :ls_estado_cob_aux  
		FROM "CADENA"  
		WHERE ( "CADENA"."CODIGO" = :is_base ) AND  
		( "CADENA"."SERIE" = :is_serie ) AND  
		( "CADENA"."NUMERO" = :il_numero )
		USING sqlca;
		if isnull(ls_estado_cob_aux) then ls_estado_cob_aux = is_estado_cadena
		dw_reporte.setitem(ll_new,'sol_en_demanda_estado_ctto_original',ls_estado_cob_aux)
	else	
		dw_reporte.setitem(ll_new,'sol_en_demanda_estado_ctto_original',is_estado_cadena)
	end if
	dw_reporte.setitem(ll_new,'sol_en_demanda_fecha_rescil_original',id_fecha_res)
	if ll_cta_repacta>0 or ll_mora>0 then
		dw_reporte.setitem(ll_new,'sol_en_demanda_est_mora_com',0)
	else
		dw_reporte.setitem(ll_new,'sol_en_demanda_est_mora_com',1)
	end if		
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_imp_pago',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_der_esp',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_aum_capital',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_dis_capital',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_aum_plazo',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_carta_simple',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_carta_notarial',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_finiquito',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_inf_social',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_otro_2',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_est_sin_antece',1)
	dw_reporte.setitem(ll_new,'sol_en_demanda_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_en_demanda_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_en_demanda_depto_particular_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_en_demanda_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_en_demanda_numero_particular_original',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_en_demanda_depto_particular_original',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_en_demanda_block_particular_original',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_en_demanda_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_en_demanda_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_en_demanda_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_en_demanda_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_en_demanda_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_en_demanda_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_en_demanda_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_en_demanda_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_en_demanda_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_en_demanda_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_en_demanda_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_en_demanda_estado_cod_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_en_demanda_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"
	INTO 		:ls_nombre_usuario
	FROM 		"ENCARGADOS"
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
	Using		sqlca;
	if sqlca.sqlcode=0 then
		if len(ls_nombre_usuario)>80 then
			ls_nombre_usuario	= mid(ls_nombre_usuario,1,80)
		end if
		if isnull(ls_nombre_usuario) then
			ls_nombre_usuario			= ''
		end if
		dw_reporte.setitem(ll_new,'sol_en_demanda_usuario',ls_nombre_usuario)
	else
		dw_reporte.setitem(ll_new,'sol_en_demanda_usuario','')
	end if
	if is_estado_cadena = 'M' then
		SELECT 	"SOL_PERMISOS_USUARIO"."ESTADO"  
		INTO 		:ls_estado_sol  
		FROM 	"SOL_PERMISOS_USUARIO"  
		WHERE 	( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = '23' ) AND  
					( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user )   
		USING	sqlca;
		if ls_estado_sol = 'A' then
			cb_grabar.enabled						= true
		else
			cb_grabar.enabled						= false
		end if	
	end if	
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_en_demanda_estatus_operacion')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_en_demanda_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
////			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
//if cb_aviso
//cb_aviso.visible							= false
//cb_grabar.enabled						= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_bono_fraternal ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_formulario_bono_fraternal'
dw_reporte.settransobject(sqlca)
dw_reporte.getchild('sol_bono_fraterno_comuna_contacto',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_SEGURO_DESG"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_SEGURO_DESG"  
   WHERE ( "SOL_SEGURO_DESG"."BASE" = :is_base ) AND  
         ( "SOL_SEGURO_DESG"."SERIE" = :is_serie ) AND  
         ( "SOL_SEGURO_DESG"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if

	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_base',is_base)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_direccion_fall',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_f_fono_casa',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_f_fono_of',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_f_celular','')
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_f_fono_otro','')
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_estatus_operaciones',1)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_est_cert_defuncion',1)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_cod_supervisor',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_numero_particular_original',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_depto_particular_original',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_block_particular_original',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_estado_cob_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_bono_fraterno_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_bono_fraterno_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_bono_fraterno_usuario','') //ok
	end if
			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_bono_fraterno_estatus_operaciones')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_bono_fraterno_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_mant_perpetual ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def
String	ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob
String	ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf

dw_reporte.dataobject	= 'dw_formulario_mantencion_perpetua'
dw_reporte.settransobject(sqlca)
dw_reporte.getchild('sol_mant_perpetua_comuna_contacto',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT MAX("SOL_SEGURO_DESG"."CORRELATIVO")
   INTO :il_correlativo
   FROM "SOL_SEGURO_DESG"  
   WHERE ( "SOL_SEGURO_DESG"."BASE" = :is_base ) AND  
         ( "SOL_SEGURO_DESG"."SERIE" = :is_serie ) AND  
         ( "SOL_SEGURO_DESG"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if

	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_base',is_base)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_direccion_fall',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_f_fono_casa',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_f_fono_of',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_f_celular','')
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_f_fono_otro','')
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_estatus_operaciones',1)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_est_cert_defuncion',1)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_cod_supervisor',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_numero_particular_original',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_depto_particular_original',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_block_particular_original',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_estado_cob_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_mant_perpetua_mod_ant_cliente','N')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_mant_perpetua_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_mant_perpetua_usuario','') //ok
	end if
			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_mant_perpetua_estatus_operaciones')
	ll_est_inf	= dw_reporte.getitemnumber(1,'sol_mant_perpetua_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled				= false
//		cb_imprimir.enabled			= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled				= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled				= false
//			cb_actualiza_datos.enabled	= false
//			cb_imprimir.enabled			= false
		end if
	end if
end if
cb_aviso.visible							= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_cargar_datos_titulo_dominio_parque ();string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,&
			ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg
long		ll_new, ll_cta_repacta,ll_ctto_def,ll_new2,ll_cod_parque,ll_aum_capacidad,ll_aum_numero,ll_plazo,ll_ctas_pag,ll_saldo
String		ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob
String		ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob,ls_est_print_tit_dominio,ls_est_print_ctto_def
Long		ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf,ll_count_tit_reduccion

dw_reporte.dataobject	= 'dw_form_titulo_de_dominio_parque'
//dw_reporte.dataobject	= 'dw_form_titulo_de_dominio_parque_bk_2'
dw_reporte.settransobject(sqlca)
dw_hoja_firma_tit_dom.settransobject(sqlca)
cb_print_titulo_dominio.visible = true
//--
	SELECT count("SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD")
	INTO		:ll_count_tit_reduccion
	FROM 	"SOL_PERMISOS_USUARIO"  
	WHERE 	( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
				( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' ) AND  
				( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'DR' )
	USING	sqlca;
	
	if ll_count_tit_reduccion > 0 then
		cb_print_titulo_dominio_reducc.visible = true
	end if
//--


setnull(il_libro_parque);setnull(il_corr_libro);

CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ls_sepultura		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res		= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ll_cta_repacta	= 0
			ld_fecha_prim	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "L"
		if isvalid(w_cuenta_corriente_liberador) then
			ll_rut				= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_liberador_cod_super'))
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_prim')
			ld_fecha_ult		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_liberador_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_liberador_fecha')
			il_cta_pag_s		= w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_liberador_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_liberador.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_funeraria) then
			ll_rut				= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemstring(1,'producto_anexo_cod_super'))
			ls_area			= ''
			ls_sector			= ''
			ls_sepultura		= ''
			ll_capacidad		= 0
			ll_cta_repacta	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_pago_plazo')
			ld_fecha			= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemdatetime(1,'producto_pago_fecha')
			il_cta_pag_s	= w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.getitemnumber(1,'producto_anexo_cuotas_pag')
			ld_fec_res		= w_cuenta_corriente_funeraria.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "A"
		if isvalid(w_cuenta_corriente_aumento_capacidad) then
			ll_rut			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_agente'))
			ls_cod_sup		= trim(w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemstring(1,'anexo_aumento_cod_super'))
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_aumento_nro_cuotas')
			ld_fecha			= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_aumento_fecha')
			il_cta_pag_s	= w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.getitemnumber(1,'anexo_aumento_cta_pag_m')
			ld_fec_res		= w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "R"
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then
			ll_rut			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= ''
			ls_sepultura	= ''
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_primera_cta')
			ld_fecha_ult	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_cuotas_pactadas')
			ld_fecha			= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemdatetime(1,'repacta_mantencion_fecha_crea')
			il_cta_pag_s	= w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.getitemnumber(1,'repacta_mantencion_ctas_pagadas')
			ld_fec_res		= w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "D"
		if isvalid(w_cuenta_corriente_derecho) then
			ll_rut				= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sector')
			ls_sepultura	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemstring(1,'derecho_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_plazo')
			ld_fecha			= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemdatetime(1,'derecho_fecha')
			il_cta_pag_s	= w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.getitemnumber(1,'derecho_cta_pag_la')
			ld_fec_res		= w_cuenta_corriente_derecho.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
	CASE "P"
		if isvalid(w_cuenta_corriente_pagare) then
			ll_rut			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora			= 0
			ls_cod_age		= ''
			ls_cod_sup		= ''
			ls_area			= ''
			ls_sector		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sector')
			ls_sepultura	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemstring(1,'pagare_sepultura')
			ll_capacidad	= 0
			ll_cta_repacta	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuota_mora')
			ld_fecha_prim	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_prim')
			ld_fecha_ult	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha_ult')
			il_nro_cta		= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_plazo')
			ld_fecha			= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemdatetime(1,'pagare_fecha')
			il_cta_pag_s	= w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_la') +&
								  w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.getitemnumber(1,'pagare_cta_pag_isa')
			ld_fec_res		= w_cuenta_corriente_pagare.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
		end if
END CHOOSE
if is_estado="N" then
	SELECT 	MAX("SOL_TIT_DOMINIO_PARQUE"."CORRELATIVO")
	INTO		:il_correlativo
	FROM 	"SOL_TIT_DOMINIO_PARQUE"  
	WHERE 	( "SOL_TIT_DOMINIO_PARQUE"."BASE" = :is_base ) AND  
				( "SOL_TIT_DOMINIO_PARQUE"."SERIE" = :is_serie ) AND  
				( "SOL_TIT_DOMINIO_PARQUE"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 	"CLIENTE"  
	WHERE 	"CLIENTE"."RUT" = :ll_rut   
	USING		sqlca;
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	
	SELECT 	"CADENA"."COD_PARQUE"  
	INTO 		:ll_cod_parque  
	FROM 	"CADENA"  
	WHERE 	"CADENA"."CODIGO" = :is_base AND  
				"CADENA"."SERIE" = :is_serie AND  
				"CADENA"."NUMERO" = :il_numero AND  
				"CADENA"."RUT" = :ll_rut
	USING	sqlca;
	
	SELECT 	"PAGO_AUMENTO"."CAPACIDAD",   
				"ANEXO_AUMENTO"."NRO_AUMENTO"  
	INTO 		:ll_aum_capacidad,:ll_aum_numero  
	FROM 	"ANEXO_AUMENTO",   
				"PAGO_AUMENTO"  
	WHERE 	"ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" and  
				"ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
				"ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" and  
				"ANEXO_AUMENTO"."BASE" = :is_base AND  
				"ANEXO_AUMENTO"."SERIE" = :is_serie AND  
				"ANEXO_AUMENTO"."NRO_OFERTA" = :il_numero AND  
				"ANEXO_AUMENTO"."RUT" = :ll_rut
	USING	sqlca;
//
//	SELECT 	"PAGO_AUMENTO"."CAPACIDAD",   
//				"ANEXO_AUMENTO"."NRO_AUMENTO",
//				"PAGO_AUMENTO"."NRO_CUOTAS",   
//				"ANEXO_AUMENTO"."CTA_PAG_M"
//	INTO 		:ll_aum_capacidad,:ll_aum_numero,:ll_plazo,:ll_ctas_pag
//	FROM 	"ANEXO_AUMENTO",   
//				"PAGO_AUMENTO"  
//	WHERE 	"ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" and  
//				"ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
//				"ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" and  
//				"ANEXO_AUMENTO"."BASE" = :is_base AND  
//				"ANEXO_AUMENTO"."SERIE" = :is_serie AND  
//				"ANEXO_AUMENTO"."NRO_OFERTA" = :il_numero AND  
//				"ANEXO_AUMENTO"."RUT" = :ll_rut
//	USING	sqlca;
//	
//	ll_saldo =  ll_plazo - ll_ctas_pag
//	if isnull(ll_saldo) or ll_saldo < 0 then
//		ll_saldo	= 0
//	end if	
//
//	if ll_aum_numero > 0 and ll_saldo = 0 then
//		dw_print_titulo.dataobject = 'dw_imprimir_titulo_de_dominio_por_sol_aum'
//	end if
//	dw_print_titulo.settransobject(sqlca)
	if ll_cod_parque = 1 then
		dw_print_titulo.object.p_prado.visible	= true
		dw_print_titulo.object.p_canaan.visible	= false
		dw_print_titulo.object.p_manantial.visible	= false
		dw_print_titulo.object.p_santiago.visible	= false
		dw_print_titulo.object.p_foresta.visible	= false
	elseif ll_cod_parque = 101 then
		dw_print_titulo.object.p_prado.visible	= false
		dw_print_titulo.object.p_canaan.visible	= true
		dw_print_titulo.object.p_manantial.visible	= false
		dw_print_titulo.object.p_santiago.visible	= false
		dw_print_titulo.object.p_foresta.visible	= false
	elseif ll_cod_parque = 102 then
		dw_print_titulo.object.p_prado.visible	= false
		dw_print_titulo.object.p_canaan.visible	= false
		dw_print_titulo.object.p_manantial.visible	= true
		dw_print_titulo.object.p_santiago.visible	= false
		dw_print_titulo.object.p_foresta.visible	= false
	elseif ll_cod_parque = 103 then
		dw_print_titulo.object.p_prado.visible	= false
		dw_print_titulo.object.p_canaan.visible	= false
		dw_print_titulo.object.p_manantial.visible	= false
		dw_print_titulo.object.p_santiago.visible	= true
		dw_print_titulo.object.p_foresta.visible	= false
	elseif ll_cod_parque = 11 then
		dw_print_titulo.object.p_prado.visible	= false
		dw_print_titulo.object.p_canaan.visible	= false
		dw_print_titulo.object.p_manantial.visible	= false
		dw_print_titulo.object.p_santiago.visible	= false
		dw_print_titulo.object.p_foresta.visible	= true	
	end if	
	
	ll_new	= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_base',is_base)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_prioridad','N')
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_area_sepultura',ls_area)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_sector_sepultura',ls_sector)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_capacidad',ll_capacidad)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_estatus_operaciones',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_est_carta_simple',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_est_carta_notarial',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_est_fotocopia_carne',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_est_pos_efectiva',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_est_otro_1',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_est_sin_antece',1)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_numero_particular_original',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_depto_particular_original',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_block_particular_original',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_estado_cod_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_mod_ant_cliente','N')
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_cod_parque',ll_cod_parque)
		
	ll_new2	= dw_hoja_firma_tit_dom.insertrow(0)
	dw_hoja_firma_tit_dom.scrolltorow(ll_new2)
//	dw_hoja_firma_tit_dom.setfocus()
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_base',is_base)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_serie',is_serie)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_numero',il_numero)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_correlativo',il_correlativo)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_ap_paterno',ls_a_pat)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_ap_materno',ls_a_mat)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_nombre',ls_nombre)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_rut_titular',ll_rut)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_dv',ls_dv)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_fecha_actual',gdt_fec_sistema)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_direccion_p',ls_direc_p)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_tipo_via',ls_tipo_via)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_numero_particular',ls_nro_part)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_depto_particular',ls_depto_part)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_block_particular',ls_block_part)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_poblacion',ls_pob)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_sector',ls_sector_cli)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_comuna',ls_comuna)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_ciudad',ls_ciudad)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_fono_p',ls_fono_p)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_otro_fono_p',ls_fono_p)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_domicilio_c',ls_domic_c)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_fono_c',ls_fono_c)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_fecha_nac',ld_fec_nac)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_grupo_f',ll_grupo_f)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_estado_cob',ls_est_cob)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_estado_civil',ls_est_civil)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_area_sepultura',ls_area)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_sector_sepultura',ls_sector)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_sepultura',ls_sepultura)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_capacidad',ll_capacidad)
//	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_cod_parque',ll_cod_parque)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_estatus_operaciones',1)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_estatus_informatica',1)
	
	
	
	SELECT 	"SOL_TIT_DOMINIO_PARQUE"."NRO_LIBRO_PARQUE"
	INTO 		:il_libro_parque
	FROM		"SOL_TIT_DOMINIO_PARQUE","CADENA"   
	WHERE 	"CADENA"."CODIGO" = "SOL_TIT_DOMINIO_PARQUE"."BASE" AND
				"CADENA"."SERIE" = "SOL_TIT_DOMINIO_PARQUE"."SERIE" AND
				"CADENA"."NUMERO" = "SOL_TIT_DOMINIO_PARQUE"."NUMERO" AND
				"CADENA"."CODIGO"	= :is_base and
				"CADENA"."SERIE"	= :is_serie and
				"CADENA"."NUMERO" = :il_numero and
				"CADENA"."COD_PARQUE" = :ll_cod_parque
	USING	sqlca;
//	if isnull(il_libro_parque) and isnull(il_libro_parque) then
		SELECT 	MAX("SOL_TIT_DOMINIO_PARQUE"."NRO_LIBRO_PARQUE"),MAX("SOL_TIT_DOMINIO_PARQUE"."LIBRO_CORRELATIVO")
		INTO 		:il_libro_parque,:il_corr_libro  
		FROM		"SOL_TIT_DOMINIO_PARQUE","CADENA"   
		WHERE 	"CADENA"."CODIGO" = "SOL_TIT_DOMINIO_PARQUE"."BASE" AND
					"CADENA"."SERIE" = "SOL_TIT_DOMINIO_PARQUE"."SERIE" AND
					"CADENA"."NUMERO" = "SOL_TIT_DOMINIO_PARQUE"."NUMERO" AND				
					"CADENA"."COD_PARQUE" = :ll_cod_parque
		USING	sqlca;
//	end if			
	if isnull(il_libro_parque) then il_libro_parque= 0	
//	if il_corr_libro > 200 then
//		il_libro_parque	= il_libro_parque +1
//		il_corr_libro	= 1
//	elseif 	il_libro_parque = 0 then
//		il_libro_parque	= 1
//		il_corr_libro	= il_corr_libro+1
//	else
//		il_corr_libro	= il_corr_libro+1
//	end if
	if il_libro_parque = 0 then
		il_libro_parque = 1
	else
		il_libro_parque = il_libro_parque
	end if
	
	SELECT 	MAX("SOL_TIT_DOMINIO_PARQUE"."LIBRO_CORRELATIVO")
	INTO 		:il_corr_libro  
	FROM		"SOL_TIT_DOMINIO_PARQUE","CADENA"   
	WHERE 	"CADENA"."CODIGO" = "SOL_TIT_DOMINIO_PARQUE"."BASE" AND
				"CADENA"."SERIE" = "SOL_TIT_DOMINIO_PARQUE"."SERIE" AND
				"CADENA"."NUMERO" = "SOL_TIT_DOMINIO_PARQUE"."NUMERO" AND				
				"CADENA"."COD_PARQUE" = :ll_cod_parque and
				"SOL_TIT_DOMINIO_PARQUE"."NRO_LIBRO_PARQUE" = :il_libro_parque
	USING	sqlca;
	
	if isnull(il_corr_libro) then il_corr_libro = 0
	if il_corr_libro >= 200 then
		il_corr_libro = 1
		il_libro_parque ++
	else
		il_corr_libro ++
		il_libro_parque = il_libro_parque
	end if
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_nro_libro_parque',il_libro_parque)
	dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_libro_correlativo',il_corr_libro)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_nro_libro_parque',il_libro_parque)
	dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_libro_correlativo',il_corr_libro)
	
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 	"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_usuario',ls_nombre_usuario) //ok
		dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_usuario',ls_nombre_usuario) 
	else
		dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_usuario','') //ok
		dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_usuario','') 
	end if
	SELECT count("FALLECIDOS"."LLAVE")  
   INTO :ll_count_reg  
   FROM "FALLECIDOS"  
   WHERE ( "FALLECIDOS"."BASE" = :is_base ) AND  
         ( "FALLECIDOS"."SS" = :is_serie ) AND  
         ( "FALLECIDOS"."CONTRATO" = :il_numero )   AND
		( "FALLECIDOS"."ESTADO_REG" = 'A' ) 
	Using	sqlca;
	if sqlca.sqlcode=0 then
		if ll_count_reg>0 then
			dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_sepultado','Si')
			dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_sepultado','Si') 
		else
			dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_sepultado','No')
			dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_sepultado','No') 
		end if
	else
		dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_sepultado','No')
		dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_sepultado','No') 
	end if
	SELECT	"CADENA"."ESTADO_TITULO"  
	INTO 		:ls_titulo  
	FROM 		"CADENA"  
	WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
				( "CADENA"."SERIE" = :is_serie ) AND  
				( "CADENA"."NUMERO" = :il_numero )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_titulo_dominio',ls_titulo)
		dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_titulo_dominio',ls_titulo) 
	else
		dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_titulo_dominio','')
		dw_hoja_firma_tit_dom.setitem(ll_new2,'sol_tit_dominio_parque_titulo_dominio',ls_titulo) 
	end if
	
//	SELECT 	"SOL_TIT_DOMINIO_PARQUE"."ESTADO_PRINT_TIT_DOMINIO"  
//	INTO 		:ls_est_print_tit_dominio  
//	FROM 	"SOL_TIT_DOMINIO_PARQUE"  
//	WHERE 	( "SOL_TIT_DOMINIO_PARQUE"."BASE" = :is_base ) AND  
//				( "SOL_TIT_DOMINIO_PARQUE"."SERIE" = :is_serie ) AND  
//				( "SOL_TIT_DOMINIO_PARQUE"."NUMERO" = :il_numero )   
//	Using sqlca;
//	if sqlca.sqlcode=0 then
////		dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_estado_print_tit_dominio',ls_est_print_tit_dominio)
//		if not isnull(ls_est_print_tit_dominio) then
// 			dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_titulo_dominio',ls_est_print_tit_dominio)
//		else
//			dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_titulo_dominio','N')
//		end if	
//	else
//		dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_titulo_dominio','N')
//	end if
	
//	SELECT 	"SOL_TIT_DOMINIO_PARQUE"."ESTADO_PRINT_CTTO_DEF"  
//	INTO 		:ls_est_print_ctto_def
//	FROM 	"SOL_TIT_DOMINIO_PARQUE"  
//	WHERE 	( "SOL_TIT_DOMINIO_PARQUE"."BASE" = :is_base ) AND  
//				( "SOL_TIT_DOMINIO_PARQUE"."SERIE" = :is_serie ) AND  
//				( "SOL_TIT_DOMINIO_PARQUE"."NUMERO" = :il_numero )   
//	Using sqlca;
//	if sqlca.sqlcode=0 then
//		dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_ctto_definitivo',ls_est_print_tit_dominio)
//	else
//		dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_ctto_definitivo','N')
//	end if

	SELECT	"CARTA_LOG"."COD_ACCION"  
	INTO 		:ll_ctto_def  
	FROM 		"CARTA_LOG"  
	WHERE 	"CARTA_LOG"."BASE" = :is_base AND  
				"CARTA_LOG"."SERIE" = :is_serie AND  
				"CARTA_LOG"."NUMERO" = :il_numero and
				"CARTA_LOG"."COD_ACCION" = 16 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		if ll_ctto_def = 16 then
			dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_ctto_definitivo','S')
		else
			SELECT	"CARTA_LOG"."COD_ACCION"  
			INTO 		:ll_ctto_def  
			FROM 	"CARTA_LOG"  
			WHERE 	"CARTA_LOG"."BASE" = :is_base AND  
						"CARTA_LOG"."SERIE" = :is_serie AND  
						"CARTA_LOG"."NUMERO" = :il_numero and
						"CARTA_LOG"."COD_ACCION" = 8
			Using		sqlca;
			if ll_ctto_def = 8 then
				dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_ctto_definitivo', 'I')
			else
				dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_ctto_definitivo','P')
			end if	
		end if	
	else
		dw_reporte.setitem(ll_new,'sol_tit_dominio_parque_ctto_definitivo',0)
	end if
			
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	dw_hoja_firma_tit_dom.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	SELECT 	"CADENA"."COD_PARQUE"  
	INTO 		:ll_cod_parque  
	FROM 	"CADENA"  
	WHERE 	"CADENA"."CODIGO" = :is_base AND  
				"CADENA"."SERIE" = :is_serie AND  
				"CADENA"."NUMERO" = :il_numero AND  
				"CADENA"."RUT" = :ll_rut
	USING	sqlca;
	
	if ll_cod_parque = 1 then
		dw_print_titulo.object.p_prado.visible	= true
		dw_print_titulo.object.p_canaan.visible	= false
		dw_print_titulo.object.p_manantial.visible	= false
		dw_print_titulo.object.p_santiago.visible	= false
		dw_print_titulo.object.p_foresta.visible	= false
	elseif ll_cod_parque = 101 then
		dw_print_titulo.object.p_prado.visible	= false
		dw_print_titulo.object.p_canaan.visible	= true
		dw_print_titulo.object.p_manantial.visible	= false
		dw_print_titulo.object.p_santiago.visible	= false
		dw_print_titulo.object.p_foresta.visible	= false
	elseif ll_cod_parque = 102 then
		dw_print_titulo.object.p_prado.visible	= false
		dw_print_titulo.object.p_canaan.visible	= false
		dw_print_titulo.object.p_manantial.visible	= true
		dw_print_titulo.object.p_santiago.visible	= false
		dw_print_titulo.object.p_foresta.visible	= false
	elseif ll_cod_parque = 103 then
		dw_print_titulo.object.p_prado.visible	= false
		dw_print_titulo.object.p_canaan.visible	= false
		dw_print_titulo.object.p_manantial.visible	= false
		dw_print_titulo.object.p_santiago.visible	= true
		dw_print_titulo.object.p_foresta.visible	= false
	elseif ll_cod_parque = 11 then
		dw_print_titulo.object.p_prado.visible	= false
		dw_print_titulo.object.p_canaan.visible	= false
		dw_print_titulo.object.p_manantial.visible	= false
		dw_print_titulo.object.p_santiago.visible	= false
		dw_print_titulo.object.p_foresta.visible	= true	
	end if	
//	SELECT 	"SOL_TIT_DOMINIO_PARQUE"."NRO_LIBRO_PARQUE","SOL_TIT_DOMINIO_PARQUE"."LIBRO_CORRELATIVO"
//	INTO 		:il_libro_parque,:il_corr_libro  
//	FROM		"SOL_TIT_DOMINIO_PARQUE","CADENA"   
//	WHERE 	"CADENA"."CODIGO" = "SOL_TIT_DOMINIO_PARQUE"."BASE" AND
//				"CADENA"."SERIE" = "SOL_TIT_DOMINIO_PARQUE"."SERIE" AND
//				"CADENA"."NUMERO" = "SOL_TIT_DOMINIO_PARQUE"."NUMERO" AND
//				"CADENA"."CODIGO"	= :is_base and
//				"CADENA"."SERIE"	= :is_serie and
//				"CADENA"."NUMERO" = :il_numero and
//				"CADENA"."COD_PARQUE" = :ll_cod_parque
//	USING	sqlca;
//	dw_hoja_firma_tit_dom.setitem(1,'sol_tit_dominio_parque_nro_libro_parque',il_libro_parque)
//	dw_hoja_firma_tit_dom.setitem(1,'sol_tit_dominio_parque_libro_correlativo',il_corr_libro)
	ll_est_ope	= dw_reporte.getitemnumber(1,'sol_tit_dominio_parque_estatus_operaciones')
	ll_est_inf		= dw_reporte.getitemnumber(1,'sol_tit_dominio_parque_estatus_informatica')
	ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
	if ll_est_ope=0 and ll_est_inf=0 or (ls_est_reg='I') then
		cb_grabar.enabled						= false
		cb_print_titulo_dominio.enabled	= false 
//		cb_imprimir.enabled					= false
	else
		if trim(gs_opera)='1' then
			cb_grabar.enabled						= true
			cb_print_titulo_dominio.enabled	= true
//			cb_actualiza_datos.enabled	= true
//			cb_imprimir.enabled			= true
		else
			cb_grabar.enabled						= false
			cb_print_titulo_dominio.enabled	= false
//			cb_actualiza_datos.enabled		= false
//			cb_imprimir.enabled				= false
		end if
	end if
end if
cb_aviso.visible								= false
dw_reporte.accepttext()
dw_reporte.setfocus()
end subroutine

public subroutine wf_imprimir_tit_dominio_parque ();Long		ll_resp,ll_tot_reg,ll_indi,ll_cod_accion,ll_correlativo,ll_rut,ll_count_reg,ll_resp_2,ll_cor_valida,ll_cod_parque
String		ls_estado,ls_clasificacion,ls_estado_envio,ls_base,ls_serie,ls_glosa,ls_est_print_tit_dom,ls_est_print_ctto_def,ls_glosa_2
datetime	ldt_fecha
Date		ldt_fecha_hoy
Double	ll_int,ll_numero

is_fecha_palabra				= ''
ll_resp							= messagebox("Advertencia","Desea Imprimir Título Dominio",Exclamation!,YesNo!,2)
if ll_resp=1 then
	ls_est_print_tit_dom		= 'S'
else
	ls_est_print_tit_dom		= 'N'
end if	
//if is_estado_cadena = 'C' then
//	ll_resp_2							= messagebox("Advertencia","Desea Imprimir Contrato Definitivo",Exclamation!,YesNo!,2)
//	if ll_resp_2=1 then
//	//	f_printdlg(dw_print_ctto_def,gstr_print,w_mantencion_fromulario_solicitudes)
//		ls_est_print_ctto_def		= 'S'
//	//	wf_imprimir_ctto_definitivo()
//	else
//		ls_est_print_ctto_def		= 'N'
//	end if
//end if
if ls_est_print_tit_dom = 'S'  then
	SELECT	MAX("CARTA_LOG"."CORRELATIVO")  
	INTO 		:ll_correlativo  
	FROM 	"CARTA_LOG"  
	USING	sqlca;
	if isnull(ll_correlativo) then ll_correlativo=0
	ldt_fecha_hoy					= date(gdt_fec_sistema)
	ll_tot_reg						= dw_reporte.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
	//		ls_est_print_tit_dom	= dw_reporte.getitemstring(ll_indi,'sol_tit_dominio_parque_titulo_dominio')	
	//		ls_est_print_ctto_def	= dw_reporte.getitemstring(ll_indi,'sol_tit_dominio_parque_ctto_definitivo')		
	//		if is_estado = 'C' then	
//-----------	
//				if ls_est_print_tit_dom = 'S' and  ls_est_print_ctto_def = 'N' then
//					ls_estado			= 'G_T1'
//					ls_clasificacion		= 'T1'
//					ll_cod_accion		= 16
//					ls_estado_envio	= '0'
//				elseif ls_est_print_tit_dom = 'N' and  ls_est_print_ctto_def = 'S' then
//					ls_estado			= 'G_D1'
//					ls_clasificacion		= 'D1'
//					ll_cod_accion		= 16
//					ls_estado_envio	= '0'
//				elseif ls_est_print_tit_dom = 'S' and ls_est_print_ctto_def = 'S' then
//					ls_estado			= 'G_TD'
//					ls_clasificacion		= 'TD'
//					ll_cod_accion		= 16
//					ls_estado_envio	= '0'
//				end if	
//			else
//				ls_estado			= 'G_T1'
//				ls_clasificacion		= 'T1'
//				ll_cod_accion		= 16
//				ls_estado_envio	= '0'
//			end if	
//--------------
			ls_base					= dw_reporte.getitemstring(ll_indi,'sol_tit_dominio_parque_base')
			ls_serie					= dw_reporte.getitemstring(ll_indi,'sol_tit_dominio_parque_serie')
			ll_numero				= dw_reporte.getitemnumber(ll_indi,'sol_tit_dominio_parque_numero')
			ll_rut						= dw_reporte.getitemnumber(ll_indi,'sol_tit_dominio_parque_rut_titular')
			ll_cod_parque			= dw_reporte.getitemnumber(ll_indi,'sol_tit_dominio_parque_cod_parque')
			ls_glosa					= 'Impresión Titulo Dominio Contrato Nº '+is_base+'-'+is_serie+'-'+string(ll_numero,"###,###,###,###,###")+' el día '+string(ldt_fecha_hoy)
			SELECT	Count("CARTA_LOG"."NUMERO")  
			INTO 		:ll_count_reg  
			FROM 	"CARTA_LOG"  
			WHERE  	( "CARTA_LOG"."BASE" = :ls_base ) AND  
						( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
						( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
						( "CARTA_LOG"."COD_ACCION" = :ll_cod_accion ) AND  
						( TO_DATE(SUBSTR(TO_CHAR("CARTA_LOG"."FECHA_CARTA",'dd/mm/yyyy'),1,10)) = :gdt_fec_sistema )   
			USING	trans_2;
			if ll_count_reg=0 or isnull(ll_count_reg) then
				dw_reporte.setitem(ll_indi,'sol_tit_dominio_parque_titulo_dominio','S')
	//			dw_reporte.setitem(ll_indi,'sol_tit_dominio_parque_titulo_dominio_bk_2','S')
	//			dw_reporte.setitem(ll_indi,'sol_tit_dominio_parque_fecha_estado_print_titulo',ldt_fecha_hoy)
				UPDATE	"CADENA"  
				SET 		"ESTADO_TITULO" = 'S',   
							"FECHA_TITULO" = :ldt_fecha_hoy  
				WHERE  	( "CADENA"."CODIGO" = :ls_base ) AND  
							( "CADENA"."SERIE" = :ls_serie ) AND  
							( "CADENA"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit using sqlca;
					///
						wf_fecha_palabras(ldt_fecha_hoy)
						//agregar update a fecha palabra
					///
					f_Print( dw_print_titulo )
				else
					rollback using sqlca;
					messagebox("Error Grabar","Error al Grabar CADENA SQL: "+sqlca.sqlerrtext)
				end if
				
				//---
				if is_estado_cadena = 'C' then
					if ll_numero < 200000000 then
						ll_resp_2							= messagebox("Advertencia","Desea Imprimir Contrato Definitivo",Exclamation!,YesNo!,2)
						if ll_resp_2=1 then
						//	f_printdlg(dw_print_ctto_def,gstr_print,w_mantencion_fromulario_solicitudes)
							ls_est_print_ctto_def		= 'S'
						//	wf_imprimir_ctto_definitivo()
						else
							ls_est_print_ctto_def		= 'N'
						end if
					else
						ls_est_print_ctto_def		= 'N'
					end if	
				end if
				if ls_est_print_tit_dom = 'S' and  ls_est_print_ctto_def = 'N' then
					ls_estado			= 'G_T1'
					ls_clasificacion		= 'T1'
					ll_cod_accion		= 16
					ls_estado_envio	= '0'
				elseif ls_est_print_tit_dom = 'N' and  ls_est_print_ctto_def = 'S' then
					ls_estado			= 'G_D1'
					ls_clasificacion		= 'D1'
					ll_cod_accion		= 16
					ls_estado_envio	= '0'
				elseif ls_est_print_tit_dom = 'S' and ls_est_print_ctto_def = 'S' then
					ls_estado			= 'G_TD'
					ls_clasificacion		= 'TD'
					ll_cod_accion		= 16
					ls_estado_envio	= '0'
				end if	
				//----
				SELECT "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO"
				INTO	:ll_cor_valida
				FROM "PROCESO_TITULO_CTTO_DEFINITIVO"  
				WHERE ( "PROCESO_TITULO_CTTO_DEFINITIVO"."BASE" = :is_base ) AND  
					( "PROCESO_TITULO_CTTO_DEFINITIVO"."SERIE" = :is_serie ) AND  
					( "PROCESO_TITULO_CTTO_DEFINITIVO"."NUMERO" = :il_numero );				
				ls_glosa					= 'Impresión Titulo Dominio '+ string(ll_cor_valida) +'" Contrato Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")+' el día '+string(ldt_fecha_hoy)
				INSERT INTO	"ATENCION_LOG"  
							( "RUT",		"ESTADO",   "FECHA",		"GLOSA",		"USUARIO",		"BASE",		"SERIE",		"NUMERO" )  
				VALUES 	( :ll_rut,	'13',			:gdt_fec_sistema,	:ls_glosa,	:gs_user,		:is_base,	:is_serie,	:il_numero )  
				USING		trans_1;
				
				if trans_1.sqlcode=0 then
					commit using trans_1;
					
					if ls_estado <> 'G_D1' and not isnull(ls_estado)then
						UPDATE "PROCESO_TITULO_CTTO_DEFINITIVO"   
						SET 		"ESTADO_PRINT_TITULO" = :ls_estado, 
									"FECHA_ESTADO_PRINT_TITULO" = :ldt_fecha_hoy   
						WHERE 	( "PROCESO_TITULO_CTTO_DEFINITIVO"."BASE" = :ls_base ) AND  
									( "PROCESO_TITULO_CTTO_DEFINITIVO"."SERIE" = :ls_serie ) AND  
									( "PROCESO_TITULO_CTTO_DEFINITIVO"."NUMERO" = :ll_numero )
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit using sqlca;
						else
							rollback using sqlca;
							messagebox("Error Grabar","Error al Grabar PROCESO_TITULO_CTTO_DEFINITIVO SQL: "+sqlca.sqlerrtext)
						end if
					end if
					
					UPDATE 	"CLIENTE"  
					SET 		"ULT_ESTADO_PUB" 	= '13',   
								"ULT_GLOSA_PUB" 	= :ls_glosa,   
								"ULT_FECHA_PUB" 	= :ldt_fecha_hoy  
					WHERE 	"CLIENTE"."RUT" 		= :ll_rut   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit using sqlca;
					else
						rollback using sqlca;
						messagebox("Error Grabar","Error al Grabar CLIENTE SQL: "+sqlca.sqlerrtext)
					end if
				else
					rollback using sqlca;
					messagebox("Error Grabar","Error al Grabar ATENCION_LOG SQL: "+sqlca.sqlerrtext)
				end if
				if ls_est_print_ctto_def = 'S' then
					if is_estado_cadena = 'C' then
						if ll_numero < 200000000 then 
							if dw_print_ctto_def.rowcount() > 0 then 
								ls_glosa					= 'Impresión Contrato Definitivo, Contrato Nº '+is_base+'-'+is_serie+'-'+string(ll_numero,"###,###,###,###,###")+' el día '+string(ldt_fecha_hoy)
								ll_correlativo ++
								INSERT INTO "CARTA_LOG"  
											( "BASE",	"SERIE",		"NUMERO",		"RUT",	"COD_ENVIO",	"ESTADO_ENV",		"FECHA_CARTA",	"MORA",	"COD_ACCION",		"CORRELATIVO",		"MORA_MANT",	"CLASIFICACION",		"USUARIO" )  
								VALUES 	( :is_base,	:is_serie,	:il_numero,		:ll_rut,	:is_base,   	:ls_estado_envio,	:gdt_fec_sistema,   	0,			:ll_cod_accion,	:ll_correlativo,  0,  				:ls_clasificacion,   :gs_user )  
								USING		trans_2;
								if trans_2.sqlcode=0 then
									commit using trans_2;
									INSERT INTO	"ATENCION_LOG"  
												( "RUT",		"ESTADO",   "FECHA",				"GLOSA",		"USUARIO",		"BASE",		"SERIE",		"NUMERO" )  
									VALUES 	( :ll_rut,		'14',			:gdt_fec_sistema,		:ls_glosa,	:gs_user,		:is_base,		:is_serie,		:il_numero )  
									USING		trans_2;
									if sqlca.sqlcode=0 then
										commit using trans_2;
										if ls_estado <> 'G_T1' and not isnull(ls_estado)then
											dw_reporte.setitem(ll_indi,'sol_tit_dominio_parque_ctto_definitivo','S')
											UPDATE "PROCESO_TITULO_CTTO_DEFINITIVO"  
											SET 		"PROCESO_TITULO_CTTO_DEFINITIVO"."ESTADO_PRINT_CTTO_DEF" = :ls_estado,
														"FECHA_ESTADO_PRINT_TITULO" = :ldt_fecha_hoy   
											WHERE 	( "PROCESO_TITULO_CTTO_DEFINITIVO"."BASE" = :is_base ) AND  
														( "PROCESO_TITULO_CTTO_DEFINITIVO"."SERIE" = :is_serie ) AND  
														( "PROCESO_TITULO_CTTO_DEFINITIVO"."NUMERO" = :il_numero )
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit using trans_2;
											else
												rollback using trans_2;
												messagebox("Error Grabar","Error al Grabar PROCESO_TITULO_CTTO_DEFINITIVO SQL: "+sqlca.sqlerrtext)
											end if
										end if	
										UPDATE 	"CLIENTE"  
										SET 		"ULT_ESTADO_PUB" = '14',   
													"ULT_GLOSA_PUB" = :ls_glosa,   
													"ULT_FECHA_PUB" = :ldt_fecha_hoy
										WHERE 	"CLIENTE"."RUT" = :ll_rut
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit using sqlca;
											f_Print( dw_print_ctto_def )
											dw_print_ctto_def.print()
											ls_est_print_ctto_def		= 'S'
										else
											rollback using sqlca;
											messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
										end if
									else
										rollback using sqlca;
										messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
									end if
								else
								end if	
							else
								messagebox('Advertencia','Contrato/Promesa no Tiene Contrato Definitivo que Imprimir')
							end if
						else
							
						end if	
					else
						messagebox('Advertencia','Contrato/Promesa Debe Estar en Estado C- Cancelado para Tener Contrato Definitivo')
						ls_est_print_ctto_def = 'N'
					end if	
				end if
			end if
		next
		dw_reporte.accepttext()
		if dw_reporte.update()=1 then
			commit using sqlca;
			messagebox("Grabar","Grabación Exitosa")
			f_Print( dw_hoja_firma_tit_dom )
		else
			rollback using sqlca;
			messagebox("Error Grabar","Error al Grabar LISTA SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if	
end subroutine

public subroutine wf_imprimir_ctto_definitivo ();//Long		ll_resp,ll_tot_reg,ll_indi,ll_cod_accion,ll_correlativo,ll_rut,ll_count_reg
//String		ls_estado,ls_clasificacion,ls_estado_envio,ls_base,ls_serie,ls_glosa
//Datetime	ldt_fecha
//Date		ldt_fecha_hoy	
//Double		ll_int,ll_numero
//
//f_printdlg(dw_print_ctto_def,gstr_print,w_informar_titulo_de_dominio)
//ll_resp							= messagebox("Advertencia","Se Imprimió correctamente Contrato Definitivo",Exclamation!,YesNo!,2)
//if ll_resp=1 then
//	ldt_fecha_hoy				= date(gdt_fec_sistema)
//	ll_tot_reg					= dw_reporte.rowcount()
//	if ll_tot_reg>0 then
//	//	if rb_titulo_dominio.checked=true then
//	 
//			ls_estado			= 'G_T1'
//			ls_clasificacion	= 'T1'
//			ll_cod_accion		= 8
//			ls_estado_envio	= '0'
//	//	elseif rb_contrato_definitivo.checked=true then
//			ls_estado			= 'G_D1'
//			ls_clasificacion	= 'D1'
//			ll_cod_accion		= 8
//			ls_estado_envio	= '0'
//	//	elseif rb_ambas.checked=true then
//			ls_estado			= 'G_TD'
//			ls_clasificacion	= 'TD'
//			ll_cod_accion		= 8
//			ls_estado_envio	= '0'
//	//	end if	
//		SELECT	MAX("CARTA_LOG"."CORRELATIVO")  
//		INTO 		:ll_correlativo  
//		FROM 		"CARTA_LOG"  
//		USING		sqlca;
//		if isnull(ll_correlativo) then ll_correlativo=0
//		SELECT 	"TASA"."TASA_INT_P"  ,	sysdate
//		INTO 		:ll_int,						:ldt_fecha
//		FROM 		"TASA"  ;
//		
//	//	for ll_indi=1 to ll_tot_reg
//			ls_base				= dw_reporte.getitemstring(ll_indi,'base')
//			ls_serie				= dw_reporte.getitemstring(ll_indi,'serie')
//			ll_numero			= dw_reporte.getitemnumber(ll_indi,'numero')
//			ll_rut					= dw_reporte.getitemnumber(ll_indi,'rut')
//			ls_glosa				= 'Impresión Contrato Definitivo Contrato Nº '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' el día '+string(ldt_fecha_hoy)
//			SELECT	Count("CARTA_LOG"."NUMERO")  
//			INTO 		:ll_count_reg  
//			FROM 		"CARTA_LOG"  
//			WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
//					 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
//					 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
//					 ( "CARTA_LOG"."COD_ACCION" = :ll_cod_accion ) AND  
//					 ( TO_DATE(SUBSTR(TO_CHAR("CARTA_LOG"."FECHA_CARTA",'dd/mm/yyyy'),1,10)) = :ldt_fecha_hoy )   
//			USING		trans_2;
//			if ll_count_reg=0 or isnull(ll_count_reg) then
//				dw_reporte.setitem(ll_indi,'estado_print_ctto_def',ls_estado)
//				dw_reporte.setitem(ll_indi,'fecha_estado_print_ctto_def',ldt_fecha_hoy)
//				ll_correlativo ++
//				INSERT INTO "CARTA_LOG"  
//							( "BASE",	"SERIE",		"NUMERO",		"RUT",	"COD_ENVIO",	"ESTADO_ENV",		"FECHA_CARTA",	"MORA",	"COD_ACCION",		"CORRELATIVO",		"MORA_MANT",	"CLASIFICACION",		"USUARIO" )  
//				VALUES 	( :ls_base,	:ls_serie,	:ll_numero,		:ll_rut,	:ls_base,   	:ls_estado_envio,	:ldt_fecha,   	0,			:ll_cod_accion,	:ll_correlativo,  0,  				:ls_clasificacion,   :gs_user )  
//				USING		trans_1;
//				if trans_1.sqlcode=0 then
//					commit using trans_1;
//					INSERT INTO	"ATENCION_LOG"  
//								( "RUT",		"ESTADO",   "FECHA",		"GLOSA",		"USUARIO",		"BASE",		"SERIE",		"NUMERO" )  
//					VALUES 	( :ll_rut,	'14',			:ldt_fecha,	:ls_glosa,	:gs_user,		:ls_base,	:ls_serie,	:ll_numero )  
//					USING		trans_2;
//					if trans_2.sqlcode=0 then
//						commit using trans_2;
//						UPDATE 	"CLIENTE"  
//						SET 		"ULT_ESTADO_PUB" = '14',   
//									"ULT_GLOSA_PUB" = :ls_glosa,   
//									"ULT_FECHA_PUB" = :ldt_fecha_hoy  
//						WHERE 	"CLIENTE"."RUT" = :ll_rut   
//						USING		trans_2;
//						if trans_2.sqlcode=0 then
//							commit using trans_2;
//						else
//							rollback using trans_2;
//							messagebox("Error Grabar","Error al Grabar SQL: "+trans_2.sqlerrtext)
//						end if
//					else
//						rollback using trans_2;
//						messagebox("Error Grabar","Error al Grabar SQL: "+trans_2.sqlerrtext)
//					end if
//				else
//					rollback using trans_1;
//					messagebox("Error Grabar","Error al Grabar SQL: "+trans_1.sqlerrtext)
//				end if
//			end if
//	//	next
//		dw_reporte.accepttext()
//		if dw_reporte.update()=1 then
//			commit using sqlca;
//			messagebox("Grabar","Grabación Exitosa")
//		else
//			rollback using sqlca;
//			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
//		end if		
//	end if
//end if
end subroutine

public subroutine wf_fecha_palabras (date ad_fecha);string	ls_fec_comp,ls_fecha
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
is_fecha_palabra				= ls_fec_comp
//Return ls_fec_comp
end subroutine

public subroutine wf_cargar_datos_compromiso_pago ();string		ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv,ls_fono_par,ls_direccion,ls_sector_cli,ls_comuna,ls_cuidad,ls_cod_age,ls_cod_sup,ls_area,ls_sector,ls_sepultura,&
			ls_sepultado,ls_ctto_def, ls_titulo,ls_nombre_usuario ,ls_est_reg,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,ls_tipo,ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,&
			ls_ciudad,ls_fono_p,ls_sexo,ls_est_civil,ls_domic_c,ls_fono_c,ls_est_cob,ls_fecha_1_vcto,ls_fecha_ult_vcto,ls_fecha
datetime ld_fecha, ld_fec_res,ld_fec_ing,ld_fec_nac,ldt_prox_vcto_m,ldt_fecha_prim_m,ldt_fecha
Date		ld_vcto_2, ld_fecha_nula,ld_fecha_1_vcto,ld_fecha_ult_vcto,ldt_mas_30dias
Long		ll_rut,ll_mora,ll_capacidad,ll_count_reg,ll_mes,ll_ano,ll_cod_parque,ll_new, ll_cta_repacta,	ll_ctto_def,ll_tot_renta,ll_grupo_f,ll_est_ope,ll_est_inf,&
			ll_int_mora_mant,ll_gc_mora_mant,ll_cuotas_pie,ll_mora_original,ll_plazo_m,ll_count_sol_det
Double	ldb_valor_cuota_m,ldb_mora_mant_uf,ldb_gasto_mant_uf,ldb_monto_pie_m


setnull(ld_fecha_nula)
dw_reporte.dataobject			= 'dw_formulario_compromiso_pago'
dw_reporte.settransobject(sqlca)
CHOOSE CASE is_base
	CASE "O","U"
		if isvalid(w_cuenta_corriente_oferta) then
			ll_rut						= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cliente_rut')
			ll_mora					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora_m')
			ls_cod_age				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_age')
			ls_cod_sup				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_cod_sup')
			ls_area					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_area')
			ls_sector					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sector')
			ldb_valor_cuota_m	= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_valor_cuota_m')
			ldt_prox_vcto_m		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'cadena_mora_fecha_venc_mant')
			ls_sepultura				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'pago_oferta_sepultura')
			ll_capacidad				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_capacidad')
			ll_cta_repacta			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_mora')
			ld_fecha_prim			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_prim')
			ld_fecha_ult				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'pago_oferta_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'pago_oferta_nro_cuotas')
			ld_fecha					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemdatetime(1,'oferta_v_fecha')
			il_cta_pag_s				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_s')
			ld_fec_res				= w_cuenta_corriente_oferta.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ll_cod_parque			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
			ll_int_mora_mant		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_mora_int_mora_mant')
			ll_gc_mora_mant		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_mora_gc_mora_mant')
			il_ctas_pag_m			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_cta_pag_m')
			il_dias_mora_m		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_mora_dias_mora_mant')
			il_modalidad_pago		= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_estado_mora_mantencion')
			
		end if
	CASE "C"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut						= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora					= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ldt_prox_vcto_m		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'cadena_mora_fecha_venc_mant')
			ls_cod_age				= ''
			ls_cod_sup				= ''
			ls_area					= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector					= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ldb_valor_cuota_m	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_valor_cuota_m')
			ll_cta_repacta			= 0
			ld_fecha_prim			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha					= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res				= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ll_cod_parque			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
			ll_int_mora_mant		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_mora_int_mora_mant')
			ll_gc_mora_mant		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_mora_gc_mora_mant')
			il_ctas_pag_m			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_m')
			il_dias_mora_m		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_mora_dias_mora_mant')
			il_modalidad_pago		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_estado_mora_mantencion')
		end if
	CASE "F","G"
		if isvalid(w_cuenta_corriente_contrato_isa) then
			ll_rut						= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemNumber(1,'cliente_rut')
			ll_mora					= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'c_cuotas_en_mora')
			ldt_prox_vcto_m		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'cadena_mora_fecha_venc_mant')
			ls_cod_age				= ''
			ls_cod_sup				= ''
			ls_area					= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_zona')
			ls_sector					= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sector')
			ls_sepultura				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemstring(1,'contrato_sepultura')
			ll_capacidad				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_capacidad')
			ldb_valor_cuota_m	= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_valor_cuota_m')
			ll_cta_repacta			= 0
			ld_fecha_prim			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_prim')
			ld_fecha_ult				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha_ult')
			il_nro_cta				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_plazo')
			ld_fecha					= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemdatetime(1,'contrato_fecha')
			il_cta_pag_s				= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_isa')
			ld_fec_res				= w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.getitemdatetime(1,'cadena_fecha_res')
			ll_cod_parque			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_cod_parque')
			ll_int_mora_mant		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_mora_int_mora_mant')
			ll_gc_mora_mant		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_mora_gc_mora_mant')
			il_ctas_pag_m			= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'contrato_cta_pag_m')
			il_dias_mora_m		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_mora_dias_mora_mant')
			il_modalidad_pago		= w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.getitemnumber(1,'cadena_estado_mora_mantencion')
		end if
END CHOOSE

if is_estado="N" then
	dw_reporte.Modify("sol_compromiso_pago_fecrep_1_vcto.protect='0'")
	dw_reporte.Modify("sol_compromiso_pago_fecha_solicitud.protect='0'")
	dw_reporte.Modify("sol_compromiso_pago_nombre_cliente.protect='0'")
	dw_reporte.Modify("sol_compromiso_pago_fecha_compra.protect='0'")
	dw_reporte.Modify("sol_compromiso_pago_nota.protect='0'")
	cb_grabar.enabled						= true
	SELECT 		MAX("SOL_COMPROMISO_PAGO"."CORRELATIVO")
   	INTO 			:il_correlativo
   	FROM 		"SOL_COMPROMISO_PAGO"  
   	WHERE 	( "SOL_COMPROMISO_PAGO"."BASE" = :is_base ) AND  
         		( "SOL_COMPROMISO_PAGO"."SERIE" = :is_serie ) AND  
        			( "SOL_COMPROMISO_PAGO"."NUMERO" = :il_numero )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if il_correlativo=0 or isnull(il_correlativo) then 
			il_correlativo	= 1
		else
			il_correlativo++
		end if
	else
		il_correlativo	= 1
	end if
	SELECT	"CLIENTE"."TIPO",   "CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
	INTO 		:ls_tipo,   		  :ls_nombre,   			:ls_a_pat,   				 :ls_a_mat,   				  :ls_direc_p,   				  :ls_pob,   					:ls_sector_cli,		 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ld_fec_nac,   			 :ls_est_civil,   			:ls_domic_c,   				:ls_fono_c,   			 :ld_fec_ing,   				:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob,						:ls_tipo_via,				:ls_nro_part,							:ls_depto_part,					:ls_block_part
	FROM 	"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :ll_rut   
   USING		sqlca;
	// valida variables	
	if len(trim(is_base))>1 then
		is_base	= mid(trim(is_base),1,1)
	end if
	if len(trim(is_serie))>1 then
		is_serie	= mid(trim(is_serie),1,1)
	end if
	if len(trim(ls_a_pat))>40 then
		ls_a_pat	= mid(trim(ls_a_pat),1,40)
	end if
	if len(trim(ls_a_mat))>40 then
		ls_a_mat	= mid(trim(ls_a_mat),1,40)
	end if
	if len(trim(ls_nombre))>40 then
		ls_nombre	= mid(trim(ls_nombre),1,40)
	end if
	if len(trim(ls_dv))>1 then
		ls_dv	= mid(trim(ls_dv),1,1)
	end if
	if len(trim(ls_direc_p))>60 then
		ls_direc_p	= mid(trim(ls_direc_p),1,60)
	end if
	if len(trim(ls_pob))>60 then
		ls_pob	= mid(trim(ls_pob),1,60)
	end if
	if len(trim(ls_sector_cli))>60 then
		ls_sector_cli= mid(trim(ls_sector_cli),1,60)
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
	if len(trim(ls_domic_c))>60 then
		ls_domic_c	= mid(trim(ls_domic_c),1,60)
	end if
	if len(trim(ls_fono_c))>25 then
		ls_fono_c	= mid(trim(ls_fono_c),1,25)
	end if
	if len(trim(ls_est_cob))>2 then
		ls_est_cob	= mid(trim(ls_est_cob),1,2)
	end if
	if len(trim(ls_est_civil))>1 then
		ls_est_civil= mid(trim(ls_est_civil),1,1)
	end if
	if len(trim(is_estado_cadena))>1 then
		is_estado_cadena	= mid(trim(is_estado_cadena),1,1)
	end if
	if len(trim(ls_area))>2 then
		ls_area	= mid(trim(ls_area),1,2)
	end if
	if len(trim(ls_sector))>8 then
		ls_sector= mid(trim(ls_sector),1,8)
	end if
	if len(trim(ls_sepultura))>8 then
		ls_sepultura= mid(trim(ls_sepultura),1,8)
	end if
	if len(trim(ls_cod_age))>5 then
		ls_cod_age	= mid(trim(ls_cod_age),1,5)
	end if
	if len(trim(ls_cod_sup))>5 then
		ls_cod_sup	= mid(trim(ls_cod_sup),1,5)
	end if
	if isnull(ld_fec_res) or date(ld_fec_res)=date("01/01/1900") or date(ld_fec_res)=date("00/00/0000") then
		setnull(ld_fec_res)
	end if
	if isnull(ld_fecha) or date(ld_fecha)=date("01/01/1900") or date(ld_fecha)=date("00/00/0000") then
		setnull(ld_fecha)
	end if
	if isnull(ld_fecha_ult) or date(ld_fecha_ult)=date("01/01/1900") or date(ld_fecha_ult)=date("00/00/0000") then
		setnull(ld_fecha_ult)
	end if
	if isnull(ld_fecha_prim) or date(ld_fecha_prim)=date("01/01/1900") or date(ld_fecha_prim)=date("00/00/0000") then
		setnull(ld_fecha_prim)
	end if
	ll_new									= dw_reporte.insertrow(0)
	dw_reporte.scrolltorow(ll_new)
	dw_reporte.setfocus()
	ldt_mas_30dias							= RelativeDate ( date(gdt_fec_sistema), 30 )
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fecha_prim_mant',ldt_mas_30dias)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_uf_dia',gd_uf_dia)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_cuotas_mora_original',ll_mora)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_monto_cuota_mant',ldb_valor_cuota_m)
//	ldb_mora_mant_uf					= round(ll_int_mora_mant / gd_uf_dia,4)
//	ldb_gasto_mant_uf					= round(ll_gc_mora_mant / gd_uf_dia,4)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_cuotas_pie_mant',1)
//	dw_reporte.setitem(ll_new,'sol_compromiso_pago_mora_pagar_mant',ldb_mora_mant_uf)
//	dw_reporte.setitem(ll_new,'sol_compromiso_pago_gasto_pagar_mant',ldb_gasto_mant_uf)
//	dw_reporte.setitem(ll_new,'sol_compromiso_pago_mora_pagar_mant_ori',ldb_mora_mant_uf)
//	dw_reporte.setitem(ll_new,'sol_compromiso_pago_gasto_pagar_mant_ori',ldb_gasto_mant_uf)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_sw_dscto_mora_pagar',1)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_sw_dscto_gasto_pagar',1)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_base',is_base)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_serie',is_serie)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_numero',il_numero)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_correlativo',il_correlativo)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_area_sep',ls_area)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_sector_sep',ls_sector)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_nro_sepultura',ls_sepultura)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_cod_parque',ll_cod_parque)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_ap_paterno',ls_a_pat)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_ap_materno',ls_a_mat)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_nombre',ls_nombre)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_rut_titular',ll_rut)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_dv',ls_dv)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fecha_actual',gdt_fec_sistema)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_direccion_p',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_numero_particular',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_depto_particular',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_block_particular',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_tipo_via',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_poblacion',ls_pob)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_numero_particular_original',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_depto_particular_original',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_block_particular_original',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_sector',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_comuna',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_ciudad',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_otro_fono_p',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_domicilio_c',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fono_c',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fecha_nac',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_total_renta',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_grupo_f',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_estado_cob',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_estado_civil',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fecha_rescil',ld_fec_res)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_mora_mant',ll_mora)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_mora_credito',ll_cta_repacta)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fecha_rescil_original',id_fecha_res)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_estado_ctto_original',is_estado_cadena)
	dw_reporte.setitem(ll_new,'cadena_estado',is_estado_cadena)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fecha_solicitud',idt_fecha_hoy)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_nombre_cliente',ls_a_pat+' '+ls_a_mat+' '+ls_nombre)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fecha_compra',idt_fecha_hoy)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fecvta_1_vcto',ldt_prox_vcto_m)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_modalidad_pago_mant',il_modalidad_pago)
	il_dias_vcto					= 0
	ll_mes						= month(date(ld_fecha_prim))
	ll_ano							= year(date(ld_fecha_prim))
	ls_fecha_1_vcto			= string('01/'+string(ll_mes,"00")+'/'+string(ll_ano,"0000"))
	ld_fecha_1_vcto			= date(ls_fecha_1_vcto)
	ll_mes						= month(date(ld_fecha_ult))
	ll_ano							= year(date(ld_fecha_ult))
	ls_fecha_ult_vcto			= string('01/'+string(ll_mes,"00")+'/'+string(ll_ano,"0000"))
	ld_fecha_ult_vcto			= date(ls_fecha_ult_vcto)
	if ld_fecha_1_vcto < ld_fecha_ult_vcto then
		DO WHILE ld_fecha_1_vcto <= ld_fecha_ult_vcto
			ll_mes				= month(ld_fecha_1_vcto)
			ll_mes ++
			ll_ano					= year(ld_fecha_1_vcto)
			if ll_mes>12 then
				ll_mes			= 1
				ll_ano ++
			end if
			ls_fecha_1_vcto	= string('01/'+string(ll_mes,"00")+'/'+string(ll_ano,"0000"))
			ld_fecha_1_vcto	= date(ls_fecha_1_vcto)
			if ld_fecha_1_vcto <= ld_fecha_ult_vcto then 
				il_dias_vcto ++
			else
				exit
			end if
		LOOP
	else
		il_dias_vcto				= DaysAfter(date(ld_fecha_prim), date(ld_fecha_ult))
		il_dias_vcto				= long(il_dias_vcto / 30)
	end if
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fecrep_1_vcto',ld_fecha_nula)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fecrep_ult_vcto',ld_fecha_nula)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_estatus_operacion',1)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_estatus_informatica',1)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_cod_agente',ls_cod_age)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_cod_super',ls_cod_sup)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_direccion_p_original',ls_direc_p)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_numero_particular_original',ls_nro_part)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_depto_particular_original',ls_depto_part)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_block_particular_original',ls_block_part)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_tipo_via_original',ls_tipo_via)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_poblacion_original',ls_pob)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_sector_original',ls_sector_cli)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_comuna_original',ls_comuna)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_ciudad_original',ls_ciudad)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fono_p_original',ls_fono_p)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_domicilio_c_original',ls_domic_c)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fono_c_original',ls_fono_c)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_fecha_nac_original',ld_fec_nac)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_total_renta_original',ll_tot_renta)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_grupo_f_original',ll_grupo_f)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_estado_civil_original',ls_est_civil)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_estado_cob_original',ls_est_cob)
	dw_reporte.setitem(ll_new,'sol_compromiso_pago_mod_ant_cliente','N')
	dw_reporte.accepttext()
	
	ldt_fecha_prim_m			= dw_reporte.getitemdatetime(1,'sol_compromiso_pago_fecha_prim_mant')
	ll_cuotas_pie				= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_pie_mant')
	ll_mora_original			= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_mora_original')
	ldb_valor_cuota_m		= dw_reporte.getitemnumber(1,'sol_compromiso_pago_monto_cuota_mant')
	ll_plazo_m					= ll_mora_original - ll_cuotas_pie
	ldb_monto_pie_m			= round(ll_cuotas_pie * ldb_valor_cuota_m,2)
	dw_reporte.setitem(1,'sol_compromiso_pago_monto_pie_mant',ldb_monto_pie_m)
	dw_reporte.setitem(1,'sol_compromiso_pago_plazo_mant',ll_plazo_m)
	if ll_cuotas_pie > ll_mora_original then
		messagebox("Advertencia","Cuota Pie NO debe ser Mayor a Mora Original")
		dw_reporte.setitem(1,'sol_compromiso_pago_cuotas_pie_mant',1)
	else
		ls_fecha					= f_fecha_vcto_prim(  ll_plazo_m  ,  ldt_fecha_prim_m  )
		ldt_fecha					= datetime(date(ls_fecha),time('00:00:00'))
		dw_reporte.setitem(1,'sol_compromiso_pago_fecrep_ult_vcto',ldt_fecha)
	end if
	
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_reporte.setitem(ll_new,'sol_compromiso_pago_usuario',ls_nombre_usuario) //ok
	else
		dw_reporte.setitem(ll_new,'sol_compromiso_pago_usuario','') //ok
	end if	
elseif is_estado="M" then
	dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol,gl_cod_parque_cta)
	dw_reporte.Modify("sol_compromiso_pago_fecrep_1_vcto.protect='1'")
	dw_reporte.Modify("sol_compromiso_pago_fecha_solicitud.protect='1'")
	dw_reporte.Modify("sol_compromiso_pago_nombre_cliente.protect='1'")
	dw_reporte.Modify("sol_compromiso_pago_fecha_compra.protect='1'")
	dw_reporte.Modify("sol_compromiso_pago_nota.protect='1'")
	SELECT	Count("SOL_COMPROMISO_PAGO_DET"."BASE")
	INTO 		:ll_count_sol_det  
	FROM 	"SOL_COMPROMISO_PAGO_DET"  
	WHERE ( "SOL_COMPROMISO_PAGO_DET"."BASE" = :is_base ) AND  
			  ( "SOL_COMPROMISO_PAGO_DET"."SERIE" = :is_serie ) AND  
			  ( "SOL_COMPROMISO_PAGO_DET"."NUMERO" = :il_numero ) AND  
		 	  ( "SOL_COMPROMISO_PAGO_DET"."CORRELATIVO" = :il_correlativo )   ;
	if ll_count_sol_det > 0 then
		dw_reporte.object.b_detalle.font.italic		= true
	else
		dw_reporte.object.b_detalle.font.italic		= false
	end if
	cb_grabar.enabled										= false
end if
cb_aviso.visible												= false
dw_reporte.accepttext()
wf_calcular_mora()
dw_reporte.setfocus()
end subroutine

public subroutine wf_calcular_mora ();Long			ll_cant_mant,ll_cant_cred,ii_cantidad,ll_monto,id_valor_cuota,ii_dmora,id_gc,id_im,ii_inc_gastos,ii_mora_cobro,i
Double		id_factor_gc,ldb_gasto_mant_uf,ldb_mora_mant_uf,id_tasa_mant

SELECT "TASA"."TASA_INT_UF" INTO :id_tasa_mant FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
SELECT "TASA"."GASTO_COB_MORA" INTO :id_factor_gc FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
SELECT 	"ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", 	"ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
INTO   	:ll_cant_mant,														:ll_cant_cred
FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
		( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
		(("CADENA"."CODIGO" = :is_base ) AND  
		( "CADENA"."SERIE" = :is_serie ) AND  
		( "CADENA"."NUMERO" = :il_numero ) )   ;
		
ii_cantidad 								= dw_reporte.GetItemNumber(1,"sol_compromiso_pago_cuotas_pie_mant")
ll_monto									= dw_reporte.GetItemNumber(1,"compute_13")
id_valor_cuota 							= dw_reporte.GetItemNumber(1,"c_val_cta_peso")
ii_dmora 								= il_dias_mora_m
id_gc 										= 0
id_im 										= 0
ii_inc_gastos 							= 0
ii_mora_cobro 							= 0
FOR i = 1 TO ii_cantidad 
	IF ((ii_dmora - (i - 1) * (ll_cant_mant * 30))) > 5  THEN 
		ii_mora_cobro					= ((ii_dmora - (i - 1) * (ll_cant_mant * 30)))
		id_im 								= round(id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota),0)
		IF ((ii_dmora - (i - 1) * (ll_cant_mant * 30))) > 30  THEN 
			 id_gc 						= round(id_gc + Round(id_valor_cuota * id_factor_gc, 0),0)
			 ii_inc_gastos				= 1
		END IF
	END IF
NEXT
if isnull(id_gc) then id_gc=0
if isnull(id_im) then id_im=0
if id_gc > 0 then
	ldb_gasto_mant_uf				= round(id_gc / gd_uf_dia,10)
	dw_reporte.SetItem(1,"sol_compromiso_pago_gasto_pagar_mant", ldb_gasto_mant_uf)
	dw_reporte.SetItem(1,"sol_compromiso_pago_gasto_pagar_mant_ori", ldb_gasto_mant_uf)
end if
if id_im > 0 then
	ldb_mora_mant_uf				= round(id_im / gd_uf_dia,10)
	dw_reporte.SetItem(1,"sol_compromiso_pago_mora_pagar_mant", ldb_mora_mant_uf)
	dw_reporte.SetItem(1,"sol_compromiso_pago_mora_pagar_mant_ori", ldb_mora_mant_uf)
end if
dw_reporte.accepttext()
end subroutine

on w_mantencion_fromulario_solicitudes.create
this.cb_print_titulo_dominio_reducc=create cb_print_titulo_dominio_reducc
this.dw_print_ctto_def=create dw_print_ctto_def
this.dw_print_titulo=create dw_print_titulo
this.dw_hoja_firma_tit_dom=create dw_hoja_firma_tit_dom
this.cb_print_titulo_dominio=create cb_print_titulo_dominio
this.dw_print_dcto=create dw_print_dcto
this.cb_aviso=create cb_aviso
this.dw_print=create dw_print
this.cb_ver_original=create cb_ver_original
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.cb_grabar=create cb_grabar
this.dw_reporte=create dw_reporte
this.cb_actualiza_datos=create cb_actualiza_datos
this.dw_ingreso_coprop=create dw_ingreso_coprop
this.Control[]={this.cb_print_titulo_dominio_reducc,&
this.dw_print_ctto_def,&
this.dw_print_titulo,&
this.dw_hoja_firma_tit_dom,&
this.cb_print_titulo_dominio,&
this.dw_print_dcto,&
this.cb_aviso,&
this.dw_print,&
this.cb_ver_original,&
this.cb_cerrar,&
this.cb_imprimir,&
this.cb_grabar,&
this.dw_reporte,&
this.cb_actualiza_datos,&
this.dw_ingreso_coprop}
end on

on w_mantencion_fromulario_solicitudes.destroy
destroy(this.cb_print_titulo_dominio_reducc)
destroy(this.dw_print_ctto_def)
destroy(this.dw_print_titulo)
destroy(this.dw_hoja_firma_tit_dom)
destroy(this.cb_print_titulo_dominio)
destroy(this.dw_print_dcto)
destroy(this.cb_aviso)
destroy(this.dw_print)
destroy(this.cb_ver_original)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.cb_grabar)
destroy(this.dw_reporte)
destroy(this.cb_actualiza_datos)
destroy(this.dw_ingreso_coprop)
end on

event open;String	ls_descrip

connect using trans_1;
connect using trans_2;
SetPointer(HourGlass!)
il_modif								= 0
SELECT	sysdate INTO :gdt_fec_sistema FROM "TASA"  ;
idt_fecha_hoy						= date(gdt_fec_sistema)
gd_hoy								= datetime(idt_fecha_hoy,time('00:00:00'))
gf_centrar(w_mantencion_fromulario_solicitudes)
is_base 								= trim(substr(1,1,Message.StringParm))
is_serie								= trim(substr(1,2,Message.StringParm))
il_numero							= Double(trim(substr(1,3,Message.StringParm)))
is_tipo_sol							= trim(substr(1,4,Message.StringParm))
il_correlativo						= long(trim(substr(1,5,Message.StringParm)))
is_estado							= trim(substr(1,6,Message.StringParm))
is_estado_cadena					= trim(substr(1,7,Message.StringParm))
id_fecha_res						= date(substr(1,8,Message.StringParm))
if isnull(id_fecha_res) or date(id_fecha_res)=date("00/00/0000") or date(id_fecha_res)=date("01/01/1900") then
	id_fecha_res					= date("00/00/0000")
end if
dw_print.settransobject(sqlca)
dw_print_dcto.settransobject(sqlca)
dw_ingreso_coprop.visible		= false
if is_estado="N" then
	il_sw_print						= 1
else
	il_sw_print						= 0
end if
if trim(gs_opera) = '1' then
	cb_grabar.enabled				= true
else
	cb_grabar.enabled				= false
end if
cb_actualiza_datos.visible		= false
cb_ver_original.visible			= false
SELECT	"SOLICITUDES"."DESCRIPCION"  
INTO 		:ls_descrip  
FROM 		"SOLICITUDES"  
WHERE 	"SOLICITUDES"."CODIGO_SOLICITUD" = :is_tipo_sol   
Using		sqlca;
if sqlca.sqlcode = 0 then
	w_mantencion_fromulario_solicitudes.title	= ls_descrip
else
	w_mantencion_fromulario_solicitudes.title	= 'Solicitudes'
end if
CHOOSE CASE is_tipo_sol
	CASE "1"
		wf_cargar_datos_rescil_cliente()
	CASE "2"
		wf_cargar_datos_rescil_reprog() //imprimir doc
	CASE "3" //recativacion contrato resuelto
		wf_cargar_datos()
	CASE "4"
		wf_cargar_datos_seguro_desgravamen()
	CASE "5"
		wf_cargar_datos_repactacion_compraventa()
	CASE "6"
		wf_cargar_datos_titulo_dominio()
	CASE "7"
		wf_cargar_datos_contrato_def()
	CASE "8"
		wf_cargar_datos_entrega_pagare()
	CASE "10"
		wf_cargar_datos_transferencia()
	CASE "11"
		wf_cargar_datos_resolucion()
	CASE "12"
		wf_cargar_datos_mod_antece_cliente()
	CASE "13"
		wf_cargar_datos_cambio_estado()
	CASE "14"
		wf_cargar_datos_cambio_estado_titular()
	CASE "15"
		wf_cargar_datos_seguro()
	CASE "16"
		wf_cargar_datos_novacion()
	CASE "17"
		if is_base='O' then
			wf_cargar_coprop_promesa()
		else
			messagebox("Advertencia","No es Posible Ingresar Formulario Solicitud, solo Promesas")
			close(w_mantencion_fromulario_solicitudes)
		end if
	CASE "18"
		wf_cargar_ultima_voluntad()
	CASE "19"
		wf_cargar_datos_posesion_efectiva()
	CASE "20"
		il_folio_mandato			= 0
		wf_cargar_datos_pac()
	CASE "21"
		il_folio_mandato			= 0
		wf_cargar_datos_pat()
	CASE "22"
		wf_cargar_datos_seguro_fallecimiento()
	CASE "23"
		wf_cargar_datos_en_demanda()
	CASE "24"
		wf_cargar_datos_bono_fraternal()
	CASE "25"
		wf_cargar_datos_mant_perpetual()
	CASE "26"
		wf_cargar_datos_titulo_dominio_parque()	
	CASE "27"
		wf_cargar_datos_compromiso_pago()	
	CASE ELSE
		messagebox("Advertencia","Falta Definir Formulario Solicitud")
		close(w_mantencion_fromulario_solicitudes)
END CHOOSE
gs_ventana							= 'w_mantencion_fromulario_solicitudes'
//f_valida_objeto()
SetPointer(Arrow!)
end event

event close;disconnect using trans_1;
disconnect using trans_2;
if isvalid(w_detalle_solicitudes) then w_detalle_solicitudes.dw_reporte.setfocus()

end event

type cb_print_titulo_dominio_reducc from commandbutton within w_mantencion_fromulario_solicitudes
boolean visible = false
integer x = 1518
integer y = 2040
integer width = 690
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imp. Titulo Dominio Reduccion"
end type

event clicked;String	ls_estado_titulo,ls_base_aux,ls_est_print_tit_dom,ls_est_print_ctto_def,ls_glosa,ls_nota,ls_pasa
Long	ll_resp,ll_cod_parque,ll_indi,ll_resp2,ll_cor_valida,ll_resp_3,ll_resp_4,ll_aum_capacidad,ll_aum_numero,ll_rut,ll_plazo,ll_ctas_pag,ll_saldo

SELECT "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO"
INTO	:ll_cor_valida
FROM "PROCESO_TITULO_CTTO_DEFINITIVO"  
WHERE ( "PROCESO_TITULO_CTTO_DEFINITIVO"."BASE" = :is_base ) AND  
	( "PROCESO_TITULO_CTTO_DEFINITIVO"."SERIE" = :is_serie ) AND  
	( "PROCESO_TITULO_CTTO_DEFINITIVO"."NUMERO" = :il_numero );
	
if ll_cor_valida >0 then
	SELECT	"SOL_ESTATUS"."BASE"  
	INTO 		:ls_base_aux  
	FROM 		"SOL_ESTATUS"  
	WHERE 	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		SELECT 	"CADENA"."COD_PARQUE",
					"CADENA"."ESTADO_TITULO",
					"CADENA"."ESTADO_TITULO"
		INTO 		:ll_cod_parque, :ls_estado_titulo,:is_estado
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
					( "CADENA"."SERIE" = :is_serie ) AND  
					( "CADENA"."NUMERO" = :il_numero )   ;
					
		//ll_rut		= dw_reporte.getitemnumber(il_correlativo,'sol_tit_dominio_parque_rut_titular')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_tit_dominio_parque_rut_titular')
		dw_print_titulo.settransobject(sqlca)
		
		SELECT 	"PAGO_AUMENTO"."CAPACIDAD",   
					"ANEXO_AUMENTO"."NRO_AUMENTO",
					"PAGO_AUMENTO"."NRO_CUOTAS",   
					"ANEXO_AUMENTO"."CTA_PAG_M"
		INTO 		:ll_aum_capacidad,:ll_aum_numero,:ll_plazo,:ll_ctas_pag
		FROM 	"ANEXO_AUMENTO",   
					"PAGO_AUMENTO"  
		WHERE 	"ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" and  
					"ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
					"ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" and  
					"ANEXO_AUMENTO"."BASE" = :is_base AND  
					"ANEXO_AUMENTO"."SERIE" = :is_serie AND  
					"ANEXO_AUMENTO"."NRO_OFERTA" = :il_numero AND  
					"ANEXO_AUMENTO"."RUT" = :ll_rut
		USING	sqlca;
		
		ll_saldo =  ll_plazo - ll_ctas_pag
		if isnull(ll_saldo) or ll_saldo < 0 then
			ll_saldo	= 0
		end if	
		if ll_aum_numero > 0 and ll_saldo = 0 then
			dw_print_titulo.dataobject = 'dw_imprimir_titulo_de_dominio_por_sol_aum'
			dw_print_titulo.setitem(il_correlativo,'cap_aumento',ll_aum_capacidad)
			dw_print_titulo.setitem(il_correlativo,'nro_aumento',ll_aum_numero)
		end if	
		if ll_cod_parque = 1 then
			dw_print_titulo.object.p_prado.visible	= true
			dw_print_titulo.object.p_canaan.visible	= false
			dw_print_titulo.object.p_manantial.visible	= false
			dw_print_titulo.object.p_santiago.visible	= false
			dw_print_titulo.object.p_foresta.visible	= false
		elseif ll_cod_parque = 101 then
			dw_print_titulo.object.p_prado.visible	= false
			dw_print_titulo.object.p_canaan.visible	= true
			dw_print_titulo.object.p_manantial.visible	= false
			dw_print_titulo.object.p_santiago.visible	= false
			dw_print_titulo.object.p_foresta.visible	= false
		elseif ll_cod_parque = 102 then
			dw_print_titulo.object.p_prado.visible	= false
			dw_print_titulo.object.p_canaan.visible	= false
			dw_print_titulo.object.p_manantial.visible	= true
			dw_print_titulo.object.p_santiago.visible	= false
			dw_print_titulo.object.p_foresta.visible	= false
		elseif ll_cod_parque = 103 then
			dw_print_titulo.object.p_prado.visible	= false
			dw_print_titulo.object.p_canaan.visible	= false
			dw_print_titulo.object.p_manantial.visible	= false
			dw_print_titulo.object.p_santiago.visible	= true
			dw_print_titulo.object.p_foresta.visible	= false
		elseif ll_cod_parque = 11 then
			dw_print_titulo.object.p_prado.visible	= false
			dw_print_titulo.object.p_canaan.visible	= false
			dw_print_titulo.object.p_manantial.visible	= false
			dw_print_titulo.object.p_santiago.visible	= false
			dw_print_titulo.object.p_foresta.visible	= true	
		end if	
		
		gl_cod_parque_cta	= ll_cod_parque
		//dw_print_titulo.SETfilter('proceso_titulo_ctto_definitivo_estado_pr = "P"')
		dw_print_titulo.settransobject(sqlca)
		dw_print_ctto_def.settransobject(sqlca)
	//	dw_hoja_firma_tit_dom.settransobject(sqlca)
	//	dw_print_titulo.retrieve(date(gdt_fec_sistema),ll_cod_parque,is_base,is_serie,il_numero)
		dw_print_titulo.retrieve(is_base,is_serie,il_numero)
	//	dw_hoja_firma_tit_dom.retrieve(is_base,is_serie,il_numero)
		dw_print_ctto_def.retrieve(is_base,is_serie,il_numero)
		ls_est_print_tit_dom	= dw_reporte.getitemstring(il_correlativo,'sol_tit_dominio_parque_titulo_dominio')
		ls_est_print_ctto_def	= dw_reporte.getitemstring(il_correlativo,'sol_tit_dominio_parque_ctto_definitivo')
		ls_nota	= dw_reporte.getitemstring(il_correlativo,'sol_tit_dominio_parque_nota')
		dw_hoja_firma_tit_dom.setitem(il_correlativo,'sol_tit_dominio_parque_nota',ls_nota)
		if ll_aum_numero > 0 and ll_saldo = 0 then
			dw_print_titulo.setitem(il_correlativo,'cap_aumento',ll_aum_capacidad)
			dw_print_titulo.setitem(il_correlativo,'nro_aumento',ll_aum_numero)
		end if
		if ls_est_print_tit_dom = 'P' or ls_est_print_tit_dom = 'N' or ls_est_print_tit_dom = '0' or ls_est_print_tit_dom = 'E' then
			wf_imprimir_tit_dominio_parque()
		else
			if dw_reporte.rowcount()>0 then
				//ll_indi						= dw_reporte.getitemnumber(il_correlativo,'sol_tit_dominio_parque_correlativo')	
			//	ls_est_print_tit_dom	= dw_reporte.getitemstring(il_correlativo,'sol_tit_dominio_parque_titulo_dominio')
				if ls_est_print_tit_dom = 'I'  then
					ls_glosa = 'Impreso'
				elseif ls_est_print_tit_dom = 'S' then
					ls_glosa = 'Entregado'
				end if	
				ll_resp	= messagebox("Advertencia","Registra Estado Impresión " +ls_glosa+ ", ¿desea Imprimir Titulo y Ctto. Definitivo Nuevamente?",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					ls_pasa = 'N'
					if dw_print_titulo.rowcount() > 0 then 
						ll_resp_3		= messagebox("Advertencia","Desea Imprimir Titulo de Dominio",Exclamation!,YesNo!,2)
						if ll_resp_3 = 1  then
							f_Print( dw_print_titulo )
							ls_pasa = 'S'
						end if	
					else
						ls_pasa= 'N'
					end if	
					if is_estado_cadena = 'C' then
						if il_numero < 200000000 and ll_cod_parque <> 101 then
							if dw_print_ctto_def.rowcount() > 0 then 
								//update fecha ctto def. entrega
								//
								ll_resp_4		= messagebox("Advertencia","Desea Imprimir Contrato Definitivo",Exclamation!,YesNo!,2)
								if ll_resp_4 = 1  then
									f_Print( dw_print_ctto_def )
									dw_print_ctto_def.print()
								end if	
							end if	
							ls_pasa = 'S'
						elseif  il_numero < 200000000 and ll_cod_parque = 101 then
							if dw_print_ctto_def.rowcount() > 0 then 
								//update fecha ctto def. entrega
								//
								ll_resp_4		= messagebox("Advertencia","Desea Imprimir Contrato Definitivo",Exclamation!,YesNo!,2)
								if ll_resp_4 = 1  then
									f_Print( dw_print_ctto_def )
									dw_print_ctto_def.print()
//									f_printdlg(dw_print_ctto_def,gstr_print,w_mantencion_fromulario_solicitudes)
//									f_printdlg(dw_print_ctto_def,gstr_print,w_mantencion_fromulario_solicitudes)
								end if	
							end if	
							ls_pasa = 'S'
						end if	
					end if	
					if ls_pasa = 'S' then
						if dw_hoja_firma_tit_dom.rowcount() > 0 then f_Print( dw_hoja_firma_tit_dom )
					elseif 	ls_pasa = 'N' then
						messagebox("Advertencia","No Registra dato en Tabla Proceso Titulo")
					end if	
				end if
			end if
		end if
		if ll_resp = 1 then
			ll_resp2	= messagebox("Aviso","Se Imprimieron los Documentos Correctamente?",Exclamation!,YesNo!,2)
			if ll_resp2 = 1 then
			//	dw_reporte.setitem(il_correlativo,'sol_tit_dominio_parque_estatus_operaciones',1)
			//	dw_reporte.setitem(il_correlativo,'sol_tit_dominio_parque_estatus_operaciones',1)
				cb_grabar.triggerevent(clicked!)
				close(w_mantencion_fromulario_solicitudes)
			end if	
		end if	
	else
		messagebox("Advertencia","Antes de Imprimir Titulo o Ctto: Definitivo debe Grabar Solicitud")
	end if
else
	messagebox("Advertencia","No se ha Procesado este contrato, comunicarse con el depto de Normalización")
end if



//String	ls_estado_titulo,ls_base_aux,ls_est_print_tit_dom,ls_est_print_ctto_def,ls_glosa,ls_nota,ls_pasa
//Long	ll_resp,ll_cod_parque,ll_indi,ll_resp2,ll_cor_valida,ll_resp_3,ll_resp_4
//
//
//dw_print_titulo.dataobject = 'dw_imprimir_titulo_de_dominio_por_sol_red'
//dw_print_titulo.settransobject(sqlca)
//dw_print_titulo.accepttext()
//
//SELECT "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO"
//INTO	:ll_cor_valida
//FROM "PROCESO_TITULO_CTTO_DEFINITIVO"  
//WHERE ( "PROCESO_TITULO_CTTO_DEFINITIVO"."BASE" = :is_base ) AND  
//	( "PROCESO_TITULO_CTTO_DEFINITIVO"."SERIE" = :is_serie ) AND  
//	( "PROCESO_TITULO_CTTO_DEFINITIVO"."NUMERO" = :il_numero );
//	
//if ll_cor_valida >0 then
//	SELECT	"SOL_ESTATUS"."BASE"  
//	INTO 		:ls_base_aux  
//	FROM 		"SOL_ESTATUS"  
//	WHERE 	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
//				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
//				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
//				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
//				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol )   
//	Using		sqlca;
//	if sqlca.sqlcode=0 then
//		SELECT 	"CADENA"."COD_PARQUE",
//					"CADENA"."ESTADO_TITULO",
//					"CADENA"."ESTADO_TITULO"
//		INTO 		:ll_cod_parque, :ls_estado_titulo,:is_estado
//		FROM 	"CADENA"  
//		WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
//					( "CADENA"."SERIE" = :is_serie ) AND  
//					( "CADENA"."NUMERO" = :il_numero )   ;
//		gl_cod_parque_cta	= ll_cod_parque
//		//dw_print_titulo.SETfilter('proceso_titulo_ctto_definitivo_estado_pr = "P"')
//		dw_print_titulo.settransobject(sqlca)
//		dw_print_ctto_def.settransobject(sqlca)
//	//	dw_hoja_firma_tit_dom.settransobject(sqlca)
//	//	dw_print_titulo.retrieve(date(gdt_fec_sistema),ll_cod_parque,is_base,is_serie,il_numero)
//		dw_print_titulo.retrieve(is_base,is_serie,il_numero)
//	//	dw_hoja_firma_tit_dom.retrieve(is_base,is_serie,il_numero)
//		dw_print_ctto_def.retrieve(is_base,is_serie,il_numero)
//		ls_est_print_tit_dom	= dw_reporte.getitemstring(il_correlativo,'sol_tit_dominio_parque_titulo_dominio')
//		ls_est_print_ctto_def	= dw_reporte.getitemstring(il_correlativo,'sol_tit_dominio_parque_ctto_definitivo')
//		ls_nota	= dw_reporte.getitemstring(il_correlativo,'sol_tit_dominio_parque_nota')
//		dw_hoja_firma_tit_dom.setitem(il_correlativo,'sol_tit_dominio_parque_nota',ls_nota)
//		
//		if ls_est_print_tit_dom = 'P' or ls_est_print_tit_dom = 'N' or ls_est_print_tit_dom = '0' or ls_est_print_tit_dom = 'E' then
//			wf_imprimir_tit_dominio_parque()
//		else
//			if dw_reporte.rowcount()>0 then
//				//ll_indi						= dw_reporte.getitemnumber(il_correlativo,'sol_tit_dominio_parque_correlativo')	
//			//	ls_est_print_tit_dom	= dw_reporte.getitemstring(il_correlativo,'sol_tit_dominio_parque_titulo_dominio')
//				if ls_est_print_tit_dom = 'I'  then
//					ls_glosa = 'Impreso'
//				elseif ls_est_print_tit_dom = 'S' then
//					ls_glosa = 'Entregado'
//				end if	
//				ll_resp	= messagebox("Advertencia","Registra Estado Impresión " +ls_glosa+ ", ¿desea Imprimir Titulo y Ctto. Definitivo Nuevamente?",Exclamation!,YesNo!,2)
//				if ll_resp=1 then
//					ls_pasa = 'N'
//					if dw_print_titulo.rowcount() > 0 then 
//						ll_resp_3		= messagebox("Advertencia","Desea Imprimir Titulo de Dominio",Exclamation!,YesNo!,2)
//						if ll_resp_3 = 1  then
//							f_printdlg(dw_print_titulo,gstr_print,w_mantencion_fromulario_solicitudes)
//							ls_pasa = 'S'
//						end if	
//					else
//						ls_pasa= 'N'
//					end if	
//					if is_estado_cadena = 'C' then
//						if il_numero < 200000000 and ll_cod_parque <> 101 then
//							if dw_print_ctto_def.rowcount() > 0 then 
//								//update fecha ctto def. entrega
//								//
//								ll_resp_4		= messagebox("Advertencia","Desea Imprimir Contrato Definitivo",Exclamation!,YesNo!,2)
//								if ll_resp_4 = 1  then
//									f_printdlg(dw_print_ctto_def,gstr_print,w_mantencion_fromulario_solicitudes)
//									f_printdlg(dw_print_ctto_def,gstr_print,w_mantencion_fromulario_solicitudes)
//								end if	
//							end if	
//							ls_pasa = 'S'
//						elseif  il_numero < 200000000 and ll_cod_parque = 101 then
//							if dw_print_ctto_def.rowcount() > 0 then 
//								//update fecha ctto def. entrega
//								//
//								ll_resp_4		= messagebox("Advertencia","Desea Imprimir Contrato Definitivo",Exclamation!,YesNo!,2)
//								if ll_resp_4 = 1  then
//									f_printdlg(dw_print_ctto_def,gstr_print,w_mantencion_fromulario_solicitudes)
//									f_printdlg(dw_print_ctto_def,gstr_print,w_mantencion_fromulario_solicitudes)
//								end if	
//							end if	
//							ls_pasa = 'S'
//						end if	
//					end if	
//					if ls_pasa = 'S' then
//						if dw_hoja_firma_tit_dom.rowcount() > 0 then f_printdlg(dw_hoja_firma_tit_dom,gstr_print,w_mantencion_fromulario_solicitudes)
//					elseif 	ls_pasa = 'N' then
//						messagebox("Advertencia","No Registra dato en Tabla Proceso Titulo")
//					end if	
//				end if
//			end if
//		end if
//		if ll_resp = 1 then
//			ll_resp2	= messagebox("Aviso","Se Imprimieron los Documentos Correctamente?",Exclamation!,YesNo!,2)
//			if ll_resp2 = 1 then
//			//	dw_reporte.setitem(il_correlativo,'sol_tit_dominio_parque_estatus_operaciones',1)
//			//	dw_reporte.setitem(il_correlativo,'sol_tit_dominio_parque_estatus_operaciones',1)
//				cb_grabar.triggerevent(clicked!)
//				close(w_mantencion_fromulario_solicitudes)
//			end if	
//		end if	
//	else
//		messagebox("Advertencia","Antes de Imprimir Titulo o Ctto: Definitivo debe Grabar Solicitud")
//	end if
//else
//	messagebox("Advertencia","No se ha Procesado este contrato, comunicarse con el depto de Normalización")
//end if
end event

type dw_print_ctto_def from datawindow within w_mantencion_fromulario_solicitudes
boolean visible = false
integer x = 3671
integer y = 324
integer width = 635
integer height = 872
integer taborder = 40
string dataobject = "dw_imprimir_cttos_definitivos_por_corr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_print_titulo from datawindow within w_mantencion_fromulario_solicitudes
integer x = 3694
integer y = 1248
integer width = 608
integer height = 824
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_imprimir_titulo_de_dominio_por_sol"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_hoja_firma_tit_dom from datawindow within w_mantencion_fromulario_solicitudes
boolean visible = false
integer x = 3671
integer y = 88
integer width = 229
integer height = 168
integer taborder = 30
string title = "none"
string dataobject = "dw_form_titulo_de_dominio_parque_imp"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print_titulo_dominio from commandbutton within w_mantencion_fromulario_solicitudes
integer x = 2400
integer y = 2040
integer width = 443
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Imp. Titulo Dominio"
end type

event clicked;String	ls_estado_titulo,ls_base_aux,ls_est_print_tit_dom,ls_est_print_ctto_def,ls_glosa,ls_nota,ls_pasa
Long	ll_resp,ll_cod_parque,ll_indi,ll_resp2,ll_cor_valida,ll_resp_3,ll_resp_4,ll_aum_capacidad,ll_aum_numero,ll_rut,ll_plazo,ll_ctas_pag,ll_saldo

SELECT "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO"
INTO	:ll_cor_valida
FROM "PROCESO_TITULO_CTTO_DEFINITIVO"  
WHERE ( "PROCESO_TITULO_CTTO_DEFINITIVO"."BASE" = :is_base ) AND  
	( "PROCESO_TITULO_CTTO_DEFINITIVO"."SERIE" = :is_serie ) AND  
	( "PROCESO_TITULO_CTTO_DEFINITIVO"."NUMERO" = :il_numero );
	
if ll_cor_valida >0 then
	SELECT	"SOL_ESTATUS"."BASE"  
	INTO 		:ls_base_aux  
	FROM 		"SOL_ESTATUS"  
	WHERE 	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
				( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
				( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
				( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
				( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		SELECT 	"CADENA"."COD_PARQUE",
					"CADENA"."ESTADO_TITULO",
					"CADENA"."ESTADO_TITULO"
		INTO 		:ll_cod_parque, :ls_estado_titulo,:is_estado
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
					( "CADENA"."SERIE" = :is_serie ) AND  
					( "CADENA"."NUMERO" = :il_numero )   ;
					
//		ll_rut		= dw_reporte.getitemnumber(il_correlativo,'sol_tit_dominio_parque_rut_titular')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_tit_dominio_parque_rut_titular')
		dw_print_titulo.settransobject(sqlca)
		
		SELECT 	"PAGO_AUMENTO"."CAPACIDAD",   
					"ANEXO_AUMENTO"."NRO_AUMENTO",
					"PAGO_AUMENTO"."NRO_CUOTAS",   
					"ANEXO_AUMENTO"."CTA_PAG_M"
		INTO 		:ll_aum_capacidad,:ll_aum_numero,:ll_plazo,:ll_ctas_pag
		FROM 	"ANEXO_AUMENTO",   
					"PAGO_AUMENTO"  
		WHERE 	"ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" and  
					"ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
					"ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" and  
					"ANEXO_AUMENTO"."BASE" = :is_base AND  
					"ANEXO_AUMENTO"."SERIE" = :is_serie AND  
					"ANEXO_AUMENTO"."NRO_OFERTA" = :il_numero AND  
					"ANEXO_AUMENTO"."RUT" = :ll_rut
		USING	sqlca;
		
		ll_saldo =  ll_plazo - ll_ctas_pag
		if isnull(ll_saldo) or ll_saldo < 0 then
			ll_saldo	= 0
		end if	
		if ll_aum_numero > 0 and ll_saldo = 0 then
			dw_print_titulo.dataobject = 'dw_imprimir_titulo_de_dominio_por_sol_aum'
			dw_print_titulo.setitem(1,'cap_aumento',ll_aum_capacidad)
			dw_print_titulo.setitem(1,'nro_aumento',ll_aum_numero)
		end if	
		if ll_cod_parque = 1 then
			dw_print_titulo.object.p_prado.visible	= true
			dw_print_titulo.object.p_canaan.visible	= false
			dw_print_titulo.object.p_manantial.visible	= false
			dw_print_titulo.object.p_santiago.visible	= false
			dw_print_titulo.object.p_foresta.visible	= false
		elseif ll_cod_parque = 101 then
			dw_print_titulo.object.p_prado.visible	= false
			dw_print_titulo.object.p_canaan.visible	= true
			dw_print_titulo.object.p_manantial.visible	= false
			dw_print_titulo.object.p_santiago.visible	= false
			dw_print_titulo.object.p_foresta.visible	= false
		elseif ll_cod_parque = 102 then
			dw_print_titulo.object.p_prado.visible	= false
			dw_print_titulo.object.p_canaan.visible	= false
			dw_print_titulo.object.p_manantial.visible	= true
			dw_print_titulo.object.p_santiago.visible	= false
			dw_print_titulo.object.p_foresta.visible	= false
		elseif ll_cod_parque = 103 then
			dw_print_titulo.object.p_prado.visible	= false
			dw_print_titulo.object.p_canaan.visible	= false
			dw_print_titulo.object.p_manantial.visible	= false
			dw_print_titulo.object.p_santiago.visible	= true
			dw_print_titulo.object.p_foresta.visible	= false
		elseif ll_cod_parque = 11 then
			dw_print_titulo.object.p_prado.visible	= false
			dw_print_titulo.object.p_canaan.visible	= false
			dw_print_titulo.object.p_manantial.visible	= false
			dw_print_titulo.object.p_santiago.visible	= false
			dw_print_titulo.object.p_foresta.visible	= true	
		end if	
		
		gl_cod_parque_cta	= ll_cod_parque
		//dw_print_titulo.SETfilter('proceso_titulo_ctto_definitivo_estado_pr = "P"')
		dw_print_titulo.settransobject(sqlca)
		dw_print_ctto_def.settransobject(sqlca)
	//	dw_hoja_firma_tit_dom.settransobject(sqlca)
	//	dw_print_titulo.retrieve(date(gdt_fec_sistema),ll_cod_parque,is_base,is_serie,il_numero)
		dw_print_titulo.retrieve(is_base,is_serie,il_numero)
	//	dw_hoja_firma_tit_dom.retrieve(is_base,is_serie,il_numero)
		dw_print_ctto_def.retrieve(is_base,is_serie,il_numero)
		ls_est_print_tit_dom	= dw_reporte.getitemstring(1,'sol_tit_dominio_parque_titulo_dominio')
		ls_est_print_ctto_def	= dw_reporte.getitemstring(1,'sol_tit_dominio_parque_ctto_definitivo')
		ls_nota	= dw_reporte.getitemstring(il_correlativo,'sol_tit_dominio_parque_nota')
		dw_hoja_firma_tit_dom.setitem(il_correlativo,'sol_tit_dominio_parque_nota',ls_nota)
		if ll_aum_numero > 0 and ll_saldo = 0 then
			dw_print_titulo.setitem(1,'cap_aumento',ll_aum_capacidad)
			dw_print_titulo.setitem(1,'nro_aumento',ll_aum_numero)
		end if
		if ls_est_print_tit_dom = 'P' or ls_est_print_tit_dom = 'N' or ls_est_print_tit_dom = '0' or ls_est_print_tit_dom = 'E' then
			wf_imprimir_tit_dominio_parque()
		else
			if dw_reporte.rowcount()>0 then
				//ll_indi						= dw_reporte.getitemnumber(il_correlativo,'sol_tit_dominio_parque_correlativo')	
			//	ls_est_print_tit_dom	= dw_reporte.getitemstring(il_correlativo,'sol_tit_dominio_parque_titulo_dominio')
				if ls_est_print_tit_dom = 'I'  then
					ls_glosa = 'Impreso'
				elseif ls_est_print_tit_dom = 'S' then
					ls_glosa = 'Entregado'
				end if	
				ll_resp	= messagebox("Advertencia","Registra Estado Impresión " +ls_glosa+ ", ¿desea Imprimir Titulo y Ctto. Definitivo Nuevamente?",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					ls_pasa = 'N'
					if dw_print_titulo.rowcount() > 0 then 
						ll_resp_3		= messagebox("Advertencia","Desea Imprimir Titulo de Dominio",Exclamation!,YesNo!,2)
						if ll_resp_3 = 1  then
							f_Print( dw_print_titulo )
							ls_pasa = 'S'
						end if	
					else
						ls_pasa= 'N'
					end if	
					if is_estado_cadena = 'C' then
						if il_numero < 200000000 and ll_cod_parque <> 101 then
							if dw_print_ctto_def.rowcount() > 0 then 
								//update fecha ctto def. entrega
								//
								ll_resp_4		= messagebox("Advertencia","Desea Imprimir Contrato Definitivo",Exclamation!,YesNo!,2)
								if ll_resp_4 = 1  then
									f_Print( dw_print_ctto_def )
									dw_print_ctto_def.print()
//									f_printdlg(dw_print_ctto_def,gstr_print,w_mantencion_fromulario_solicitudes)
//									f_printdlg(dw_print_ctto_def,gstr_print,w_mantencion_fromulario_solicitudes)
								end if	
							end if	
							ls_pasa = 'S'
						elseif  il_numero < 200000000 and ll_cod_parque = 101 then
							if dw_print_ctto_def.rowcount() > 0 then 
								//update fecha ctto def. entrega
								//
								ll_resp_4		= messagebox("Advertencia","Desea Imprimir Contrato Definitivo",Exclamation!,YesNo!,2)
								if ll_resp_4 = 1  then
									f_Print( dw_print_ctto_def )
									dw_print_ctto_def.print()
//									f_printdlg(dw_print_ctto_def,gstr_print,w_mantencion_fromulario_solicitudes)
//									f_printdlg(dw_print_ctto_def,gstr_print,w_mantencion_fromulario_solicitudes)
								end if	
							end if	
							ls_pasa = 'S'
						end if	
					end if	
					if ls_pasa = 'S' then
						if dw_hoja_firma_tit_dom.rowcount() > 0 then f_Print( dw_hoja_firma_tit_dom )
					elseif 	ls_pasa = 'N' then
						messagebox("Advertencia","No Registra dato en Tabla Proceso Titulo")
					end if	
				end if
			end if
		end if
		if ll_resp = 1 then
			ll_resp2	= messagebox("Aviso","Se Imprimieron los Documentos Correctamente?",Exclamation!,YesNo!,2)
			if ll_resp2 = 1 then
			//	dw_reporte.setitem(il_correlativo,'sol_tit_dominio_parque_estatus_operaciones',1)
			//	dw_reporte.setitem(il_correlativo,'sol_tit_dominio_parque_estatus_operaciones',1)
				cb_grabar.triggerevent(clicked!)
				close(w_mantencion_fromulario_solicitudes)
			end if	
		end if	
	else
		messagebox("Advertencia","Antes de Imprimir Titulo o Ctto: Definitivo debe Grabar Solicitud")
	end if
else
	messagebox("Advertencia","No se ha Procesado este contrato, comunicarse con el depto de Normalización")
end if
end event

type dw_print_dcto from datawindow within w_mantencion_fromulario_solicitudes
boolean visible = false
integer x = 2185
integer y = 2140
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_documento_solicitud_acepta_o_rechaza"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_aviso from commandbutton within w_mantencion_fromulario_solicitudes
boolean visible = false
integer x = 1737
integer y = 2040
integer width = 517
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir Carta A&viso"
end type

event clicked;Long		ll_status_ope
String	ls_estado,ls_conex
ll_status_ope	= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_estatus_operacion')
ls_estado		= TRIM(dw_reporte.getitemstring(1,'sol_estatus_estado_reg'))
if ll_status_ope = 0 or ls_estado = 'I' then
	if dw_print_dcto.retrieve(is_base,is_serie,il_numero,il_correlativo)>0 then
		
		if gs_conexion = "Parque El Prado" then
			ls_conex		= "P"
			dw_print_dcto.setitem(1,'conexion',ls_conex)
			dw_print_dcto.object.t_4.text	= 'Inmobiliaria Parque La Florida SpA'
			if ls_estado = 'A' then
				dw_print_dcto.object.txt_rechazo.visible	= false
		//		dw_print_dcto.object.txt_aceptada.text		= 'Informamos a usted, que la solicitud de Resciliación de su contrato fue aceptada, por lo tanto, debe acercarse exclusivamente a nuestras oficinas de Estado 360 tercer piso, de Lunes a Viernes de 9:00 a 17:30 horas, a firmar la documentación correspondiente.      Cualquier duda llame a los teléfonos 3805730 - 3805733 - 3805734.'
				dw_print_dcto.object.txt_aceptada.visible	= true
			else
				dw_print_dcto.object.txt_aceptada.visible	= false
		//		dw_print_dcto.object.txt_rechazo.text		= 'Informamos a usted, que la solicitud de Resciliación de su contrato fue rechazada, por lo que, ofrecemos reprogramar su deuda y para ello debe acercarse a las oficinas de Estado 360 tercer piso, de Lunes a Viernes de 9:00 a 17:30 horas, dentro de los 15 días hábiles siguientes, a contar de la fecha que indica en esta carta.   Cualquier duda llame a los teléfonos 3805730 - 3805733 - 3805734.'
				dw_print_dcto.object.txt_rechazo.visible	= true
			end if
		elseif gs_conexion = "Parque La Foresta" then
			dw_print_dcto.object.t_4.text	= 'Inmobiliaria Parque de La Serena SpA'
			ls_conex		= "F"
			dw_print_dcto.setitem(1,'conexion',ls_conex)
			if ls_estado = 'A' then
				dw_print_dcto.object.txt_rechazo.visible	= false
		//		dw_print_dcto.object.txt_aceptada.text		= 'Informamos a usted, que la solicitud de Resciliación de su contrato fue aceptada, por lo tanto, debe acercarse exclusivamente a nuestras oficinas de Ruta 41 Sector Aeropuerto Camino Vicuña, de Lunes a Viernes de 9:00 a 17:30 horas, a firmar la documentación correspondiente.      Cualquier duda llame al teléfono 27 18 01.'
				dw_print_dcto.object.txt_aceptada.visible	= true
			else
				dw_print_dcto.object.txt_aceptada.visible	= false
		//		dw_print_dcto.object.txt_rechazo.text		= 'Informamos a usted, que la solicitud de Resciliación de su contrato fue rechazada, por lo que, ofrecemos reprogramar su deuda y para ello debe acercarse a las oficinas de Ruta 41 Sector Aeropuerto Camino Vicuña, de Lunes a Viernes de 9:00 a 17:30 horas, dentro de los 15 días hábiles siguientes, a contar de la fecha que indica en esta carta.   Cualquier duda llame al teléfono 27 18 01.'
				dw_print_dcto.object.txt_rechazo.visible	= true
			end if
		elseif gs_conexion = "Parque Concepción" then
			dw_print_dcto.object.t_4.text	= 'Parque de Concepción S.A.'
			ls_conex		= "C"
			dw_print_dcto.setitem(1,'conexion',ls_conex)
			if ls_estado = 'A' then
				dw_print_dcto.object.txt_rechazo.visible	= false
		//		dw_print_dcto.object.txt_aceptada.text		= 'Informamos a usted, que la solicitud de Resciliación de su contrato fue aceptada, por lo tanto, debe acercarse exclusivamente a nuestras oficinas de Ruta 41 Sector Aeropuerto Camino Vicuña, de Lunes a Viernes de 9:00 a 17:30 horas, a firmar la documentación correspondiente.      Cualquier duda llame al teléfono 27 18 01.'
				dw_print_dcto.object.txt_aceptada.visible	= true
			else
				dw_print_dcto.object.txt_aceptada.visible	= false
		//		dw_print_dcto.object.txt_rechazo.text		= 'Informamos a usted, que la solicitud de Resciliación de su contrato fue rechazada, por lo que, ofrecemos reprogramar su deuda y para ello debe acercarse a las oficinas de Ruta 41 Sector Aeropuerto Camino Vicuña, de Lunes a Viernes de 9:00 a 17:30 horas, dentro de los 15 días hábiles siguientes, a contar de la fecha que indica en esta carta.   Cualquier duda llame al teléfono 27 18 01.'
				dw_print_dcto.object.txt_rechazo.visible	= true
			end if
		end if
		
		f_Print( dw_print_dcto )
	end if
else
	messagebox("Advertencia","Solicitud no está autorizada por Operaciones")
end if
end event

type dw_print from datawindow within w_mantencion_fromulario_solicitudes
boolean visible = false
integer x = 731
integer y = 2048
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_form_copropietario_promesa_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_ver_original from commandbutton within w_mantencion_fromulario_solicitudes
boolean visible = false
integer x = 1504
integer y = 2040
integer width = 800
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Antecedente Original Cliente"
end type

event clicked;String	ls_string,ls_dv, ls_nombre, ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,ls_sector,&
			ls_comuna,ls_ciudad,ls_fono_p,ls_celular,ls_fono_c,ls_domic_c,ls_est_civil,&
			ls_otro_fono_p,ls_otro_fono_c,ls_est_reg,ls_base_aux,ls_tipo_via,ls_nro_part,&
			ls_depto_part,ls_block_part
Long		ll_rut,ll_tot_renta,ll_grupo_f
Date		ld_fec_nac
if isvalid(w_actualiza_datos_cliente_original) then close(w_actualiza_datos_cliente_original)
CHOOSE CASE is_tipo_sol
	CASE "1"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_rescilia_cliente_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_rescilia_cliente_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_rescilia_cliente_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_direccion_p_origina')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_numero_particular_o')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_rescilia_cliente_depto_particular_or')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_rescilia_cliente_block_particular_or')
		ls_pob			= dw_reporte.getitemstring(1,'sol_rescilia_cliente_poblacion_original')
		ls_sector		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_sector_original')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_comuna_original')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_ciudad_original')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_rescilia_cliente_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_domicilio_c_origina')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_fono_c_original')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_rescilia_cliente_fecha_nac_original'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_total_renta_origina')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_grupo_f_original')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_rescilia_cliente_estado_civil_origin')
		ls_celular		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_rescilia_cliente_otro_fono_c')
		
	CASE "2"
		ls_a_pat		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_ap_paterno')
		ls_a_mat		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_ap_materno')
		ls_nombre	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_nombre')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_rut_titular')
		ls_dv			= dw_reporte.getitemstring(1,'sol_rescilia_reprog_dv')
		ls_direc_p	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_direccion_p_original')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_numero_particular_or')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_depto_particular_ori')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_block_particular_ori')
		ls_pob		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_poblacion_original')
		ls_sector	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_sector_original')
		ls_comuna	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_comuna_original')
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_ciudad_original')
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_otro_fono_p')
		ls_domic_c	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_domicilio_c_original')
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_fono_c_original')
		ld_fec_nac	= date(dw_reporte.getitemdatetime(1,'sol_rescilia_reprog_fecha_nac_original'))
		ll_tot_renta= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_total_renta_original')
		ll_grupo_f	= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_grupo_f_original')
		ls_est_civil= dw_reporte.getitemstring(1,'sol_rescilia_reprog_estado_civil_origina')
		ls_celular	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_celular')
		ls_otro_fono_c=dw_reporte.getitemstring(1,'sol_rescilia_reprog_otro_fono_c')
		
	CASE "3"
		ls_a_pat		= dw_reporte.getitemstring(1,'sol_reactiva_ap_paterno')
		ls_a_mat		= dw_reporte.getitemstring(1,'sol_reactiva_ap_materno')
		ls_nombre	= dw_reporte.getitemstring(1,'sol_reactiva_nombre')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_reactiva_rut_titular')
		ls_dv			= dw_reporte.getitemstring(1,'sol_reactiva_dv')
		ls_direc_p	= dw_reporte.getitemstring(1,'sol_reactiva_direccion_p_original')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_reactiva_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_reactiva_numero_particular_original')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_reactiva_depto_particular_original')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_reactiva_block_particular_original')
		ls_pob		= dw_reporte.getitemstring(1,'sol_reactiva_poblacion_original')
		ls_sector	= dw_reporte.getitemstring(1,'sol_reactiva_sector_original')
		ls_comuna	= dw_reporte.getitemstring(1,'sol_reactiva_comuna_original')
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_reactiva_ciudad_original')
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_reactiva_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_reactiva_otro_fono_p')
		ls_domic_c	= dw_reporte.getitemstring(1,'sol_reactiva_domicilio_c_original')
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_reactiva_fono_c_original')
		ld_fec_nac	= date(dw_reporte.getitemdatetime(1,'sol_reactiva_fecha_nac_original'))
		ll_tot_renta= dw_reporte.getitemnumber(1,'sol_reactiva_total_renta_original')
		ll_grupo_f	= dw_reporte.getitemnumber(1,'sol_reactiva_grupo_f_original')
		ls_est_civil= dw_reporte.getitemstring(1,'sol_reactiva_estado_civil_original')
		ls_celular	= dw_reporte.getitemstring(1,'sol_reactiva_celular')
		ls_otro_fono_c=dw_reporte.getitemstring(1,'sol_reactiva_otro_fono_c')
		
	CASE "4"
		ls_a_pat		= dw_reporte.getitemstring(1,'sol_seguro_desg_ap_paterno')
		ls_a_mat		= dw_reporte.getitemstring(1,'sol_seguro_desg_ap_materno')
		ls_nombre	= dw_reporte.getitemstring(1,'sol_seguro_desg_nombre')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_seguro_desg_rut_titular')
		ls_dv			= dw_reporte.getitemstring(1,'sol_seguro_desg_dv')
		ls_direc_p	= dw_reporte.getitemstring(1,'sol_seguro_desg_direccion_p_original')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_seguro_desg_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_seguro_desg_numero_particular_origin')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_seguro_desg_depto_particular_origina')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_seguro_desg_block_particular_origina')
		ls_pob		= dw_reporte.getitemstring(1,'sol_seguro_desg_poblacion_original')
		ls_sector	= dw_reporte.getitemstring(1,'sol_seguro_desg_sector_original')
		ls_comuna	= dw_reporte.getitemstring(1,'sol_seguro_desg_comuna_original')
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_seguro_desg_ciudad_original')
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_seguro_desg_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_seguro_desg_otro_fono_p')
		ls_domic_c	= dw_reporte.getitemstring(1,'sol_seguro_desg_domicilio_c_original')
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_seguro_desg_fono_c_original')
		ld_fec_nac	= date(dw_reporte.getitemdatetime(1,'sol_seguro_desg_fecha_nac_original'))
		ll_tot_renta= dw_reporte.getitemnumber(1,'sol_seguro_desg_total_renta_original')
		ll_grupo_f	= dw_reporte.getitemnumber(1,'sol_seguro_desg_grupo_f_original')
		ls_est_civil= dw_reporte.getitemstring(1,'sol_seguro_desg_estado_civil_original')
		ls_celular	= dw_reporte.getitemstring(1,'sol_seguro_desg_celular')
		ls_otro_fono_c=dw_reporte.getitemstring(1,'sol_seguro_desg_otro_fono_c')
		
	CASE "5"
		ls_a_pat		= dw_reporte.getitemstring(1,'sol_repacta_cvta_ap_paterno')
		ls_a_mat		= dw_reporte.getitemstring(1,'sol_repacta_cvta_ap_materno')
		ls_nombre	= dw_reporte.getitemstring(1,'sol_repacta_cvta_nombre')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_repacta_cvta_rut_titular')
		ls_dv			= dw_reporte.getitemstring(1,'sol_repacta_cvta_dv')
		ls_direc_p	= dw_reporte.getitemstring(1,'sol_repacta_cvta_direccion_p_original')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_repacta_cvta_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_repacta_cvta_numero_particular_origi')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_repacta_cvta_depto_particular_origin')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_repacta_cvta_block_particular_origin')
		ls_pob		= dw_reporte.getitemstring(1,'sol_repacta_cvta_poblacion_original')
		ls_sector	= dw_reporte.getitemstring(1,'sol_repacta_cvta_sector_original')
		ls_comuna	= dw_reporte.getitemstring(1,'sol_repacta_cvta_comuna_original')
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_repacta_cvta_ciudad_original')
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_repacta_cvta_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_repacta_cvta_otro_fono_p')
		ls_domic_c	= dw_reporte.getitemstring(1,'sol_repacta_cvta_domicilio_c_original')
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_repacta_cvta_fono_c_original')
		ld_fec_nac	= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecha_nac_original'))
		ll_tot_renta= dw_reporte.getitemnumber(1,'sol_repacta_cvta_total_renta_original')
		ll_grupo_f	= dw_reporte.getitemnumber(1,'sol_repacta_cvta_grupo_f_original')
		ls_est_civil= dw_reporte.getitemstring(1,'sol_repacta_cvta_estado_civil_original')
		ls_celular	= dw_reporte.getitemstring(1,'sol_repacta_cvta_celular')
		ls_otro_fono_c=dw_reporte.getitemstring(1,'sol_repacta_cvta_otro_fono_c')
		
	CASE "6"
		ls_a_pat		= dw_reporte.getitemstring(1,'sol_tit_dominio_ap_paterno')
		ls_a_mat		= dw_reporte.getitemstring(1,'sol_tit_dominio_ap_materno')
		ls_nombre	= dw_reporte.getitemstring(1,'sol_tit_dominio_nombre')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_tit_dominio_rut_titular')
		ls_dv			= dw_reporte.getitemstring(1,'sol_tit_dominio_dv')
		ls_direc_p	= dw_reporte.getitemstring(1,'sol_tit_dominio_direccion_p_original')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_tit_dominio_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_tit_dominio_numero_particular_origin')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_tit_dominio_depto_particular_origina')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_tit_dominio_block_particular_origina')
		ls_pob		= dw_reporte.getitemstring(1,'sol_tit_dominio_poblacion_original')
		ls_sector	= dw_reporte.getitemstring(1,'sol_tit_dominio_sector_original')
		ls_comuna	= dw_reporte.getitemstring(1,'sol_tit_dominio_comuna_original')
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_tit_dominio_ciudad_original')
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_tit_dominio_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_tit_dominio_otro_fono_p')
		ls_domic_c	= dw_reporte.getitemstring(1,'sol_tit_dominio_domicilio_c_original')
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_tit_dominio_fono_c_original')
		ld_fec_nac	= date(dw_reporte.getitemdatetime(1,'sol_tit_dominio_fecha_nac_original'))
		ll_tot_renta= dw_reporte.getitemnumber(1,'sol_tit_dominio_total_renta_original')
		ll_grupo_f	= dw_reporte.getitemnumber(1,'sol_tit_dominio_grupo_f_original')
		ls_est_civil= dw_reporte.getitemstring(1,'sol_tit_dominio_estado_civil_original')
		ls_celular	= dw_reporte.getitemstring(1,'sol_tit_dominio_celular')
		ls_otro_fono_c=dw_reporte.getitemstring(1,'sol_tit_dominio_otro_fono_c')
		
	CASE "7"
		ls_a_pat		= dw_reporte.getitemstring(1,'sol_contrato_def_ap_paterno')
		ls_a_mat		= dw_reporte.getitemstring(1,'sol_contrato_def_ap_materno')
		ls_nombre	= dw_reporte.getitemstring(1,'sol_contrato_def_nombre')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_contrato_def_rut_titular')
		ls_dv			= dw_reporte.getitemstring(1,'sol_contrato_def_dv')
		ls_direc_p	= dw_reporte.getitemstring(1,'sol_contrato_def_direccion_p_original')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_contrato_def_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_contrato_def_numero_particular_origi')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_contrato_def_depto_particular_origin')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_contrato_def_block_particular_origin')
		ls_pob		= dw_reporte.getitemstring(1,'sol_contrato_def_poblacion_original')
		ls_sector	= dw_reporte.getitemstring(1,'sol_contrato_def_sector_original')
		ls_comuna	= dw_reporte.getitemstring(1,'sol_contrato_def_comuna_original')
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_contrato_def_ciudad_original')
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_contrato_def_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_contrato_def_otro_fono_p')
		ls_domic_c	= dw_reporte.getitemstring(1,'sol_contrato_def_domicilio_c_original')
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_contrato_def_fono_c_original')
		ld_fec_nac	= date(dw_reporte.getitemdatetime(1,'sol_contrato_def_fecha_nac_original'))
		ll_tot_renta= dw_reporte.getitemnumber(1,'sol_contrato_def_total_renta_original')
		ll_grupo_f	= dw_reporte.getitemnumber(1,'sol_contrato_def_grupo_f_original')
		ls_est_civil= dw_reporte.getitemstring(1,'sol_contrato_def_estado_civil_original')
		ls_celular	= dw_reporte.getitemstring(1,'sol_contrato_def_celular')
		ls_otro_fono_c=dw_reporte.getitemstring(1,'sol_contrato_def_otro_fono_c')
		
	CASE "8"
		ls_a_pat		= dw_reporte.getitemstring(1,'sol_entrega_pag_ap_paterno')
		ls_a_mat		= dw_reporte.getitemstring(1,'sol_entrega_pag_ap_materno')
		ls_nombre	= dw_reporte.getitemstring(1,'sol_entrega_pag_nombre')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_entrega_pag_rut_titular')
		ls_dv			= dw_reporte.getitemstring(1,'sol_entrega_pag_dv')
		ls_direc_p	= dw_reporte.getitemstring(1,'sol_entrega_pag_direccion_p_original')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_entrega_pag_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_entrega_pag_numero_particular_origin')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_entrega_pag_depto_particular_origina')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_entrega_pag_block_particular_origina')
		ls_pob		= dw_reporte.getitemstring(1,'sol_entrega_pag_poblacion_original')
		ls_sector	= dw_reporte.getitemstring(1,'sol_entrega_pag_sector_original')
		ls_comuna	= dw_reporte.getitemstring(1,'sol_entrega_pag_comuna_original')
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_entrega_pag_ciudad_original')
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_entrega_pag_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_entrega_pag_otro_fono_p')
		ls_domic_c	= dw_reporte.getitemstring(1,'sol_entrega_pag_domicilio_c_original')
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_entrega_pag_fono_c_original')
		ld_fec_nac	= date(dw_reporte.getitemdatetime(1,'sol_entrega_pag_fecha_nac_original'))
		ll_tot_renta= dw_reporte.getitemnumber(1,'sol_entrega_pag_total_renta_original')
		ll_grupo_f	= dw_reporte.getitemnumber(1,'sol_entrega_pag_grupo_f_original')
		ls_est_civil= dw_reporte.getitemstring(1,'sol_entrega_pag_estado_civil_original')
		ls_celular	= dw_reporte.getitemstring(1,'sol_entrega_pag_celular')
		ls_otro_fono_c=dw_reporte.getitemstring(1,'sol_entrega_pag_otro_fono_c')
		
	CASE "10"
		ls_a_pat		= dw_reporte.getitemstring(1,'sol_transferencia_ap_paterno')
		ls_a_mat		= dw_reporte.getitemstring(1,'sol_transferencia_ap_materno')
		ls_nombre	= dw_reporte.getitemstring(1,'sol_transferencia_nombre')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_transferencia_rut_titular')
		ls_dv			= dw_reporte.getitemstring(1,'sol_transferencia_dv')
		ls_direc_p	= dw_reporte.getitemstring(1,'sol_transferencia_direccion_p_original')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_transferencia_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_transferencia_numero_particular_orig')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_transferencia_depto_particular_origi')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_transferencia_block_particular_origi')
		ls_pob		= dw_reporte.getitemstring(1,'sol_transferencia_poblacion_original')
		ls_sector	= dw_reporte.getitemstring(1,'sol_transferencia_sector_original')
		ls_comuna	= dw_reporte.getitemstring(1,'sol_transferencia_comuna_original')
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_transferencia_ciudad_original')
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_transferencia_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_transferencia_otro_fono_p')
		ls_domic_c	= dw_reporte.getitemstring(1,'sol_transferencia_domicilio_c_original')
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_transferencia_fono_c_original')
		ld_fec_nac	= date(dw_reporte.getitemdatetime(1,'sol_transferencia_fecha_nac_original'))
		ll_tot_renta= dw_reporte.getitemnumber(1,'sol_transferencia_total_renta_original')
		ll_grupo_f	= dw_reporte.getitemnumber(1,'sol_transferencia_grupo_f_original')
		ls_est_civil= dw_reporte.getitemstring(1,'sol_transferencia_estado_civil_original')
		ls_celular	= dw_reporte.getitemstring(1,'sol_transferencia_celular')
		ls_otro_fono_c=dw_reporte.getitemstring(1,'sol_transferencia_otro_fono_c')

	CASE "11"
		ls_a_pat		= dw_reporte.getitemstring(1,'sol_resolucion_ap_paterno')
		ls_a_mat		= dw_reporte.getitemstring(1,'sol_resolucion_ap_materno')
		ls_nombre	= dw_reporte.getitemstring(1,'sol_resolucion_nombre')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_resolucion_rut_titular')
		ls_dv			= dw_reporte.getitemstring(1,'sol_resolucion_dv_titular')
		ls_direc_p	= dw_reporte.getitemstring(1,'sol_resolucion_direccion_p_original')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_resolucion_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_resolucion_numero_particular_origina')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_resolucion_depto_particular_original')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_resolucion_block_particular_original')
		ls_pob		= dw_reporte.getitemstring(1,'sol_resolucion_poblacion_original')
		ls_sector	= dw_reporte.getitemstring(1,'sol_resolucion_sector_original')
		ls_comuna	= dw_reporte.getitemstring(1,'sol_resolucion_comuna_original')
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_resolucion_ciudad_original')
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_resolucion_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_resolucion_otro_fono_p')
		ls_domic_c	= dw_reporte.getitemstring(1,'sol_resolucion_domicilio_c_original')
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_resolucion_fono_c_original')
		ld_fec_nac	= date(dw_reporte.getitemdatetime(1,'sol_resolucion_fecha_nac_original'))
		ll_tot_renta= dw_reporte.getitemnumber(1,'sol_resolucion_total_renta_original')
		ll_grupo_f	= dw_reporte.getitemnumber(1,'sol_resolucion_grupo_f_original')
		ls_est_civil= dw_reporte.getitemstring(1,'sol_resolucion_estado_civil_original')
		ls_celular	= dw_reporte.getitemstring(1,'sol_resolucion_celular')
		ls_otro_fono_c=dw_reporte.getitemstring(1,'sol_resolucion_otro_fono_c')
		
	CASE "13"
		ls_a_pat		= dw_reporte.getitemstring(1,'sol_cambio_estado_ap_paterno')
		ls_a_mat		= dw_reporte.getitemstring(1,'sol_cambio_estado_ap_materno')
		ls_nombre	= dw_reporte.getitemstring(1,'sol_cambio_estado_nombre')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_cambio_estado_rut_titular')
		ls_dv			= dw_reporte.getitemstring(1,'sol_cambio_estado_dv')
		ls_direc_p	= dw_reporte.getitemstring(1,'sol_cambio_estado_direccion_p_original')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_cambio_estado_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_cambio_estado_numero_particular_orig')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_cambio_estado_depto_particular_origi')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_cambio_estado_block_particular_origi')
		ls_pob		= dw_reporte.getitemstring(1,'sol_cambio_estado_poblacion_original')
		ls_sector	= dw_reporte.getitemstring(1,'sol_cambio_estado_sector_original')
		ls_comuna	= dw_reporte.getitemstring(1,'sol_cambio_estado_comuna_original')
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_cambio_estado_ciudad_original')
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_cambio_estado_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_cambio_estado_otro_fono_p')
		ls_domic_c	= dw_reporte.getitemstring(1,'sol_cambio_estado_domicilio_c_original')
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_cambio_estado_fono_c_original')
		ld_fec_nac	= date(dw_reporte.getitemdatetime(1,'sol_cambio_estado_fecha_nac_original'))
		ll_tot_renta= dw_reporte.getitemnumber(1,'sol_cambio_estado_total_renta_original')
		ll_grupo_f	= dw_reporte.getitemnumber(1,'sol_cambio_estado_grupo_f_original')
		ls_est_civil= dw_reporte.getitemstring(1,'sol_cambio_estado_estado_civil_original')
		ls_celular	= dw_reporte.getitemstring(1,'sol_cambio_estado_celular')
		ls_otro_fono_c=dw_reporte.getitemstring(1,'sol_cambio_estado_otro_fono_c')
		
	CASE "15"
		ls_a_pat		= dw_reporte.getitemstring(1,'sol_seguro_ap_paterno')
		ls_a_mat		= dw_reporte.getitemstring(1,'sol_seguro_ap_materno')
		ls_nombre	= dw_reporte.getitemstring(1,'sol_seguro_nombre')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_seguro_rut_titular')
		ls_dv			= dw_reporte.getitemstring(1,'sol_seguro_dv')
		ls_direc_p	= dw_reporte.getitemstring(1,'sol_seguro_direccion_p_original')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_seguro_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_seguro_numero_particular_original')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_seguro_depto_particular_original')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_seguro_block_particular_original')
		ls_pob		= dw_reporte.getitemstring(1,'sol_seguro_poblacion_original')
		ls_sector	= dw_reporte.getitemstring(1,'sol_seguro_sector_original')
		ls_comuna	= dw_reporte.getitemstring(1,'sol_seguro_comuna_original')
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_seguro_ciudad_original')
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_seguro_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_seguro_otro_fono_p')
		ls_domic_c	= dw_reporte.getitemstring(1,'sol_seguro_domicilio_c_original')
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_seguro_fono_c_original')
		ld_fec_nac	= date(dw_reporte.getitemdatetime(1,'sol_seguro_fecha_nac_original'))
		ll_tot_renta= dw_reporte.getitemnumber(1,'sol_seguro_total_renta_original')
		ll_grupo_f	= dw_reporte.getitemnumber(1,'sol_seguro_grupo_f_original')
		ls_est_civil= dw_reporte.getitemstring(1,'sol_seguro_estado_civil_original')
		ls_celular	= dw_reporte.getitemstring(1,'sol_seguro_celular')
		ls_otro_fono_c=dw_reporte.getitemstring(1,'sol_seguro_otro_fono_c')
		
	CASE "16"
		ls_a_pat		= dw_reporte.getitemstring(1,'sol_novacion_ap_paterno')
		ls_a_mat		= dw_reporte.getitemstring(1,'sol_novacion_ap_materno')
		ls_nombre	= dw_reporte.getitemstring(1,'sol_novacion_nombre')
		ll_rut		= dw_reporte.getitemnumber(1,'sol_novacion_rut_titular')
		ls_dv			= dw_reporte.getitemstring(1,'sol_novacion_dv')
		ls_direc_p	= dw_reporte.getitemstring(1,'sol_novacion_direccion_p_original')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_novacion_tipo_via_original')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_novacion_numero_particular_orig')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_novacion_depto_particular_origi')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_novacion_block_particular_origi')
		ls_pob		= dw_reporte.getitemstring(1,'sol_novacion_poblacion_original')
		ls_sector	= dw_reporte.getitemstring(1,'sol_novacion_sector_original')
		ls_comuna	= dw_reporte.getitemstring(1,'sol_novacion_comuna_original')
		ls_ciudad	= dw_reporte.getitemstring(1,'sol_novacion_ciudad_original')
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_novacion_fono_p_original')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_novacion_otro_fono_p')
		ls_domic_c	= dw_reporte.getitemstring(1,'sol_novacion_domicilio_c_original')
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_novacion_fono_c_original')
		ld_fec_nac	= date(dw_reporte.getitemdatetime(1,'sol_novacion_fecha_nac_original'))
		ll_tot_renta= dw_reporte.getitemnumber(1,'sol_novacion_total_renta_original')
		ll_grupo_f	= dw_reporte.getitemnumber(1,'sol_novacion_grupo_f_original')
		ls_est_civil= dw_reporte.getitemstring(1,'sol_novacion_estado_civil_original')
		ls_celular	= dw_reporte.getitemstring(1,'sol_novacion_celular')
		ls_otro_fono_c=dw_reporte.getitemstring(1,'sol_novacion_otro_fono_c')
END CHOOSE
ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
if isnull(ls_a_pat) 			then ls_a_pat			= ''
if isnull(ls_a_mat) 			then ls_a_mat			= ''
if isnull(ls_nombre) 		then ls_nombre			= ''
if isnull(ll_rut) 			then ll_rut				= 0
if isnull(ls_dv) 				then ls_dv				= ''
if isnull(ls_direc_p) 		then ls_direc_p		= ''
if isnull(ls_pob) 			then ls_pob				= ''
if isnull(ls_sector) 		then ls_sector			= ''
if isnull(ls_comuna) 		then ls_comuna			= ''
if isnull(ls_ciudad) 		then ls_ciudad			= ''
if isnull(ls_fono_p) 		then ls_fono_p			= ''
if isnull(ls_otro_fono_p) 	then ls_otro_fono_p	= ''
if isnull(ls_domic_c) 		then ls_domic_c		= ''
if isnull(ls_fono_c) 		then ls_fono_c			= ''
if isnull(ll_tot_renta) 	then ll_tot_renta		= 0
if isnull(ll_grupo_f) 		then ll_grupo_f		= 0
if isnull(ls_est_civil) 	then ls_est_civil		= ''
if isnull(ls_celular) 		then ls_celular		= ''
if isnull(ls_otro_fono_c) 	then ls_otro_fono_c	= ''
if isnull(ls_est_reg)		then ls_est_reg		= 'A'
if isnull(ld_fec_nac)		then ld_fec_nac		= date('00/00/0000')
if isnull(ls_tipo_via) 		then ls_tipo_via		= ''
if isnull(ls_nro_part) 		then ls_nro_part		= ''
if isnull(ls_depto_part)	then ls_depto_part	= ''
if isnull(ls_block_part)	then ls_block_part	= ''
SELECT	"SOL_ESTATUS"."BASE"  
INTO 		:ls_base_aux  
FROM 		"SOL_ESTATUS"  
WHERE 	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
			( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
			( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
			( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
			( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol )   
Using		sqlca;
if sqlca.sqlcode=0 then
	ls_string	= ls_a_pat+'~t'+ls_a_mat+'~t'+ls_nombre+'~t'+string(ll_rut)+'~t'+ls_dv+'~t'+ls_direc_p+'~t'+&
					  ls_pob+'~t'+ls_sector+'~t'+ls_comuna+'~t'+ls_ciudad+'~t'+ls_fono_p+'~t'+ls_otro_fono_p+'~t'+&
					  ls_domic_c+'~t'+ls_fono_c+'~t'+string(ld_fec_nac)+'~t'+string(ll_tot_renta)+'~t'+string(ll_grupo_f)+'~t'+&
					  ls_est_civil+'~t'+ls_celular+'~t'+ls_otro_fono_c+'~t'+is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+&
					  is_tipo_sol+'~t'+string(il_correlativo)+'~t'+ls_est_reg+'~t'+ls_tipo_via+'~t'+ls_nro_part+'~t'+&
					  ls_depto_part+'~t'+ls_block_part
					  
	openwithparm(w_actualiza_datos_cliente_original,ls_string)
else
	messagebox("Advertencia","Antes de Modificar Antecedentes del Cliente debe Grabar Solicitud")
end if
end event

type cb_cerrar from commandbutton within w_mantencion_fromulario_solicitudes
integer x = 3237
integer y = 2040
integer width = 329
integer height = 104
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;String	ls_dv
Long		ll_rut,ll_cont_reg,ll_resp,ll_count_sol,ll_count_det
//if il_sw_grabar=1 then
//	ll_resp	= messagebox("Advertencia","Desea Grabar los Cambio antes de Salir",Exclamation!,YesNo!,2)
//	if ll_resp=1 then
//		cb_grabar.triggerevent(clicked!)
//	end if
//end if
if dw_reporte.dataobject='dw_form_transferencia' then
	ll_rut	= dw_reporte.getitemnumber(1,'sol_transferencia_rut_titular')
	SELECT	"SOL_TRANSFERENCIA"."DV"  
	INTO 		:ls_dv  
	FROM 		"SOL_CLIENTE",   
				"SOL_ESTATUS",   
				"SOL_TRANSFERENCIA"  
	WHERE  ( "SOL_CLIENTE"."BASE" = "SOL_ESTATUS"."BASE" ) and  
			 ( "SOL_ESTATUS"."BASE" = "SOL_TRANSFERENCIA"."BASE" ) and  
			 ( "SOL_CLIENTE"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
			 ( "SOL_CLIENTE"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
			 ( "SOL_CLIENTE"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
			 ( "SOL_ESTATUS"."SERIE" = "SOL_TRANSFERENCIA"."SERIE" ) and  
			 ( "SOL_ESTATUS"."NUMERO" = "SOL_TRANSFERENCIA"."NUMERO" ) and  
			 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_TRANSFERENCIA"."CORRELATIVO" ) and  
			 ( "SOL_CLIENTE"."RUT_CLIENTE_ORI" = "SOL_TRANSFERENCIA"."RUT_TITULAR" ) and  
			 (("SOL_ESTATUS"."BASE" = :is_base ) AND  
			 ( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
			 ( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
			 ( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
			 ( "SOL_TRANSFERENCIA"."RUT_TITULAR" = :ll_rut ) AND
			 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '10' ) ) 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		close(w_mantencion_fromulario_solicitudes)
	else
		SELECT	count("SOL_TRANSFERENCIA"."BASE")
		INTO 		:ll_cont_reg  
		FROM 		"SOL_TRANSFERENCIA"  
		WHERE  ( "SOL_TRANSFERENCIA"."BASE" = :is_base ) AND  
				 ( "SOL_TRANSFERENCIA"."SERIE" = :is_serie ) AND  
				 ( "SOL_TRANSFERENCIA"."NUMERO" = :il_numero ) AND  
				 ( "SOL_TRANSFERENCIA"."CORRELATIVO" = :il_correlativo )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if ll_cont_reg>0 then
				messagebox("Advertencia","Debe ingresar Cliente a Transferir")
				dw_reporte.setfocus()
			else
				close(w_mantencion_fromulario_solicitudes)
			end if
		else
			close(w_mantencion_fromulario_solicitudes)
		end if
	end if
elseif dw_reporte.dataobject='dw_formulario_compromiso_pago' then
	SELECT	Count("SOL_COMPROMISO_PAGO"."BASE")
	INTO 		:ll_count_sol  
	FROM 	"SOL_COMPROMISO_PAGO"  
	WHERE ( "SOL_COMPROMISO_PAGO"."BASE" = :is_base ) AND  
				( "SOL_COMPROMISO_PAGO"."SERIE" = :is_serie ) AND  
				( "SOL_COMPROMISO_PAGO"."NUMERO" = :il_numero ) AND  
				( "SOL_COMPROMISO_PAGO"."CORRELATIVO" = :il_correlativo )   ;
	if ll_count_sol > 0 then
		SELECT 	Count("SOL_COMPROMISO_PAGO_DET"."BASE")
		INTO 		:ll_count_det  
		FROM 	"SOL_COMPROMISO_PAGO_DET"  
		WHERE ( "SOL_COMPROMISO_PAGO_DET"."BASE" = :is_base ) AND  
					( "SOL_COMPROMISO_PAGO_DET"."SERIE" = :is_serie ) AND  
					( "SOL_COMPROMISO_PAGO_DET"."NUMERO" = :il_numero ) AND  
					( "SOL_COMPROMISO_PAGO_DET"."CORRELATIVO" = :il_correlativo )   ;
		if ll_count_det > 0 then
			close(w_mantencion_fromulario_solicitudes)
		else
			messagebox("Advertencia","Debe Ingresar y Grabar Detalle Pago")
		end if
	else
		close(w_mantencion_fromulario_solicitudes)
	end if
elseif dw_reporte.dataobject='dw_form_novacion' then
	ll_rut	= dw_reporte.getitemnumber(1,'sol_novacion_rut_titular')
	SELECT	"SOL_NOVACION"."DV"  
	INTO 		:ls_dv  
	FROM 		"SOL_CLIENTE",   
				"SOL_ESTATUS",   
				"SOL_NOVACION"  
	WHERE  ( "SOL_CLIENTE"."BASE" = "SOL_ESTATUS"."BASE" ) and  
			 ( "SOL_ESTATUS"."BASE" = "SOL_NOVACION"."BASE" ) and  
			 ( "SOL_CLIENTE"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
			 ( "SOL_CLIENTE"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
			 ( "SOL_CLIENTE"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
			 ( "SOL_ESTATUS"."SERIE" = "SOL_NOVACION"."SERIE" ) and  
			 ( "SOL_ESTATUS"."NUMERO" = "SOL_NOVACION"."NUMERO" ) and  
			 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_NOVACION"."CORRELATIVO" ) and  
			 ( "SOL_CLIENTE"."RUT_CLIENTE_ORI" = "SOL_NOVACION"."RUT_TITULAR" ) and  
			 (("SOL_ESTATUS"."BASE" = :is_base ) AND  
			 ( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
			 ( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
			 ( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
			 ( "SOL_NOVACION"."RUT_TITULAR" = :ll_rut ) AND
			 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '16' ) ) 
	Using		sqlca;
	if sqlca.sqlcode=0 then
		close(w_mantencion_fromulario_solicitudes)
	else
		SELECT	count("SOL_NOVACION"."BASE")
		INTO 		:ll_cont_reg  
		FROM 		"SOL_NOVACION"  
		WHERE  ( "SOL_NOVACION"."BASE" = :is_base ) AND  
				 ( "SOL_NOVACION"."SERIE" = :is_serie ) AND  
				 ( "SOL_NOVACION"."NUMERO" = :il_numero ) AND  
				 ( "SOL_NOVACION"."CORRELATIVO" = :il_correlativo )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if ll_cont_reg>0 then
				messagebox("Advertencia","Debe ingresar Cliente a Transferir")
				dw_reporte.setfocus()
			else
				close(w_mantencion_fromulario_solicitudes)
			end if
		else
			close(w_mantencion_fromulario_solicitudes)
		end if
	end if
else
	close(w_mantencion_fromulario_solicitudes)
end if

end event

type cb_imprimir from commandbutton within w_mantencion_fromulario_solicitudes
integer x = 361
integer y = 2044
integer width = 329
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if il_sw_print	= 0 then
	if dw_reporte.dataobject<>'dw_form_transferencia' and dw_reporte.dataobject<>'dw_form_novacion' and &
		dw_reporte.dataobject<>'dw_form_copropietario_promesa' then
		if dw_reporte.dataobject='dw_formulario_modifica_antece_cliente' then
			dw_reporte.setitem(1,'sw_ver',1)
			dw_reporte.accepttext()
		end if
		if dw_reporte.dataobject='dw_formulario_repacta_o_compraventa' then
			dw_reporte.object.sol_repacta_cvta_nota.visible					= false
			dw_reporte.object.t_6.visible											= false
			dw_reporte.object.sol_repacta_cvta_sw_contar_repro.visible	= false
			dw_reporte.object.t_repacta.visible									= false
		end if
		f_Print( dw_reporte )
		if dw_reporte.dataobject='dw_formulario_repacta_o_compraventa' then
			dw_reporte.object.sol_repacta_cvta_nota.visible	= true
			dw_reporte.object.t_6.visible							= true
		end if
		if dw_reporte.dataobject='dw_form_mandato_pat' then
			gl_cod_parque_cta		= dw_reporte.getitemnumber(1,'cadena_cod_parque')
		end if
		if dw_reporte.dataobject='dw_formulario_modifica_antece_cliente' then
			dw_reporte.setitem(1,'sw_ver',0)
			dw_reporte.accepttext()
		elseif dw_reporte.dataobject='dw_form_resciliacion_por_reprogramacion' then
			gl_cod_parque_cta		= dw_reporte.getitemnumber(1,'cadena_cod_parque')
			dw_print.dataobject	= 'dw_print_resciliacion_por_reprogramacion'
			dw_print.settransobject(sqlca)
			if dw_print.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)>0 then
				f_Print( dw_print )
				dw_print.print()
			end if
		elseif dw_reporte.dataobject='dw_form_mandato_pat' then
			dw_print.dataobject	= 'dw_print_formulario_pat'
			dw_print.settransobject(sqlca)
			if dw_print.retrieve(is_base,is_serie,il_numero,is_tipo_sol,il_correlativo)>0 then
				dw_print.print()
				dw_print.print()
			end if
		end if
	else
		if dw_reporte.dataobject='dw_form_transferencia' then
			dw_print.dataobject	= 'dwe_imprimir_transferencia'
			dw_print.settransobject(sqlca)
		elseif dw_reporte.dataobject='dw_form_novacion' then
			dw_print.dataobject	= 'dwe_imprimir_novacion'
			dw_print.settransobject(sqlca)
		elseif dw_reporte.dataobject='dw_form_copropietario_promesa' then
			dw_print.dataobject	= 'dw_form_copropietario_promesa_print'
			dw_print.settransobject(sqlca)
		end if
		if dw_print.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)>0 then
			f_Print( dw_print )
		end if
	end if
else
	messagebox("Advertencia","Antes de Imprimir debe Grabar Solicitud")
end if
end event

type cb_grabar from commandbutton within w_mantencion_fromulario_solicitudes
integer x = 32
integer y = 2044
integer width = 329
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Grabar"
end type

event clicked;string		ls_base_aux, ls_string, ls_base_ing, ls_serie_ing,ls_dir_p,ls_comuna,ls_ciudad,ls_nombre,ls_a_pat,ls_a_mat,ls_tipo_via,ls_nro_part,ls_estado_final,ls_descrip,ls_nombre_contacto,ls_direc_contacto,&
			ls_ciudad_contacto,ls_comuna_contacto,ls_obs,ls_estado,ls_base,ls_serie,ls_anexo_lib,ls_anexo_repacta,ls_est_cob,ls_pob,ls_sector,ls_fono_p,ls_est_civil,ls_dir_c,ls_fono_c,ls_ap_pat,ls_ap_mat,ls_depto_part,&
			ls_block_part,ls_descrip_ciudad,ls_descrip_comuna,ls_descrip_tipo_via,ls_dir_1,ls_dir_2,ls_serie_asoc,ls_area_asoc,ls_sector_asoc,ls_sepultura_asoc,ls_base_asoc,ls_dir_p_c,ls_pob_c,ls_sector_c,ls_comuna_c,&
			ls_ciudad_c,ls_fono_p_c,ls_nro_p_c,ls_depto_p_c,ls_block_p_c,ls_tipo_via_p_c,ls_estado_cobranza_c,ls_pasa='S',&
			ls_dv_co,ls_nom_co,ls_ap_pat_co,ls_ap_mat_co,ls_obs_not,ls_nom_not,ls_ap_pat_not,ls_ap_mat_not,ls_nro_cuenta,&
			ls_celular,ls_celular_c,ls_email,ls_dv_tit,ls_nom_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_dv_ben,ls_nom_ben,ls_ap_pat_ben,ls_ap_mat_ben,ls_parent_ben,ls_contac_ben,ls_estado_original,ls_estado_ctto_final,ls_ejecutivo,ls_dv,&
			ls_descrip_parque,ls_nom_completo,ls_rut,ls_descrip_estado_ctto,ls_asunto,ls_texto,emnail_de,ls_email_para,email_de,ls_res,ls_materia,ls_estado_at_pub,ls_glosa,ls_cuota_valida,ls_serie_m_lib,&
			ls_base_original,ls_serie_original,ls_nombre_cliente,ls_fono_contacto,ls_base_seg,ls_serie_seg
Long		ll_cant, ll_fila,ll_row_ant,ll_sw=0,ll_rut,ll_codigo_seguro,ll_ctas_pag_m,ll_ctas,ll_ctas_en_mora,ll_ctas_repacta,ll_renta,ll_grupo_f,ll_capacidad_asoc,ll_row,&
			ll_corr,ll_est_cob,ll_rut_co,ll_count_trans,ll_cod_banco,ll_rut_tit,ll_correlativo,ll_rut_ben,ll_ctas_pag_vent,ll_cta_pie_m,ll_plazo_m,ll_mora_ori,ll_mora_mant_cadena,&
			ll_cuotas_valida,ll_cuotas_repacta,ll_cod_parque,ll_numero_lib,ll_num_aux,ll_repro_mora,ll_rut_benef,ll_pasa_beneficiario,ll_rut_tit_seg,ll_numero_seg
Date		ld_fecha,ld_fecha1,ld_fecha0,ld_fecha_vcto,ld_fecha_hoy,ld_fec_1er_vcto
Datetime	ldt_fecha_nac,ldt_fecha_defuncion,ldt_fecha_actual,ldt_fec_nac,ldt_fecha_hoy,ldt_fec_prox_llamado_c,ldt_fecha_not,ldT_fecha_cobro,ldt_fecha_suscrip,ldt_fecha_cobro_mant,ldt_fecdef_ben,ldt_fecnac_ben,&
			ldt_fecact_ben,ldt_fecha_prim,ld_fec_res
Double	ldb_monto_cred,ldb_monto_mant,ll_numero_ing,ll_numero,ll_nro_asoc,ll_numero_promesa,ll_numero_ctto_sap_c,ll_numero_ctto_sap_m,ll_numero_original

dw_reporte.accepttext()
SetPointer(HourGlass!)
ldt_fecha_hoy				= datetime(idt_fecha_hoy,time('00:00:00'))
gd_hoy						= ldt_fecha_hoy
if dw_reporte.dataobject='dw_formulario_repacta_o_compraventa' then
	ld_fecha0				= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecvta_1_vcto'))
	ld_fecha1				= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecrep_1_vcto'))
	ld_fecha_vcto			= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecha_prox_vcto'))
	if isnull(ld_fecha0) or ld_fecha0=date("00/00/0000") or isnull(ld_fecha1) or &
		ld_fecha1=date("00/00/0000") or isnull(ld_fecha_vcto) or ld_fecha_vcto=date("00/00/0000") then
		ll_sw					= 1	
	end if
//-- traer fecha prim --//
		ld_fecha_hoy		= idt_fecha_hoy //date(gdt_fec_sistema)
		ll_cuotas_repacta	=	dw_reporte.getitemnumber(1,"sol_repacta_cvta_mora_credito")
		ls_base				=	dw_reporte.getitemstring(1,"sol_repacta_cvta_base")
		ls_serie				=	dw_reporte.getitemstring(1,"sol_repacta_cvta_serie")
		ll_numero			=	dw_reporte.getitemnumber(1,"sol_repacta_cvta_numero")
		if ls_base = 'O' then
			SELECT 	"PAGO_OFERTA"."FECHA_PRIM"  
			INTO 		:ld_fecha_prim  
			FROM 	"PAGO_OFERTA"  
			WHERE 	"PAGO_OFERTA"."BASE" = :ls_base AND  
						"PAGO_OFERTA"."SERIE" = :ls_serie AND  
						"PAGO_OFERTA"."NRO_OFERTA" = :ll_numero
			USING	sqlca;

		elseif	ls_base = 'L' then
			SELECT 	"PAGO_LIBERADOR"."FECHA_PRIM"  
			INTO 		:ld_fecha_prim  
			FROM 	"PAGO_LIBERADOR"  
			WHERE 	"PAGO_LIBERADOR"."BASE" = :ls_base AND  
						"PAGO_LIBERADOR"."SERIE_M" = :ls_serie AND  
						"PAGO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero
			USING	sqlca;
		elseif ls_base = 'A' then
			SELECT 	"PAGO_AUMENTO"."FECHA_PRIM"  
			INTO 		:ld_fecha_prim  
			FROM 	"PAGO_AUMENTO"  
			WHERE 	"PAGO_AUMENTO"."BASE" = :ls_base AND  
						"PAGO_AUMENTO"."SERIE_M" = :ls_serie AND  
						"PAGO_AUMENTO"."NRO_AUMENTO" = :ll_numero
			USING	sqlca;
		elseif gs_base='P' then
			SELECT 	"PAGARE"."FECHA_PRIM"
			INTO 		:ld_fecha_prim
			FROM 	"PAGARE"  
			WHERE 	"PAGARE"."BASE" = :ls_base AND  
						"PAGARE"."SERIE_P" = :ls_serie AND  
						"PAGARE"."NRO_PAGARE" = :ll_numero;
		end if
//-- fin fecha prim
//		DECLARE f_mora_credito_persistencia PROCEDURE FOR F_MORA_CREDITO_PERSIS( :ls_base, :ls_serie, :ll_numero, :ld_fecha_hoy, :ld_fecha_prim);
//		EXECUTE f_mora_credito_persistencia;
//		FETCH f_mora_credito_persistencia INTO :ll_cuotas_valida; 
		SELECT 	"CADENA_MORA"."MORA_CRED"  
		INTO 		:ll_cuotas_valida  
		FROM 	"CADENA_MORA"  
		WHERE	( "CADENA_MORA"."BASE" = :ls_base ) AND  
					( "CADENA_MORA"."SERIE" = :ls_serie ) AND  
					( "CADENA_MORA"."NUMERO" = :ll_numero )   ;
		
//		ll_cuotas_valida = 	f_cuotas_pag_s_fecha_1(ls_base,ls_serie,ll_numero,ld_fecha_hoy);		
		if isnull(ll_cuotas_valida) then ll_cuotas_valida=0
		if isnull(ll_cuotas_repacta) then ll_cuotas_repacta=0
		if ll_cuotas_valida = ll_cuotas_repacta then
			ls_cuota_valida	= 'S'
		else
			ls_cuota_valida = 'N'
			ls_pasa			= 'N'
		end if	
		if ls_cuota_valida = 'N' then
			messagebox("Advertencia","Cuotas a repactar no coinciden con las Cuotas en Mora")
			ls_pasa			= 'N'
			close(w_mantencion_fromulario_solicitudes)
			close(w_detalle_solicitudes)
			close(w_ingreso_solicitudes)
			if isvalid(w_cuenta_corriente_oferta) then 
				w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.Retrieve(ls_serie, ll_numero)
				w_cuenta_corriente_oferta.setfocus()
			end if
			if isvalid(w_cuenta_corriente_liberador) then
				w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.Retrieve(ls_serie, ll_numero)
				w_cuenta_corriente_liberador.setfocus()
			end if
			if isvalid(w_cuenta_corriente_pagare) then 
				w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.Retrieve(ls_serie, ll_numero)
				w_cuenta_corriente_pagare.setfocus()
			end if
			if isvalid(w_cuenta_corriente_derecho) then 
				w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.Retrieve(ls_serie, ll_numero)
				w_cuenta_corriente_derecho.setfocus()
			end if
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then 
				w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.Retrieve(ls_base,ls_serie,ll_numero)
				w_cuenta_corriente_repactar_cta_mant.setfocus()
			end if
			if isvalid(w_cuenta_corriente_aumento_capacidad) then 
				w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.Retrieve(ls_serie, ll_numero)
				w_cuenta_corriente_aumento_capacidad.setfocus()
			end if
		end if	
elseif dw_reporte.dataobject='dw_form_resciliacion_por_reprogramacion' then
	ls_base_ing				= trim(dw_reporte.getitemstring(1,'sol_rescilia_reprog_base_nuevo'))
	ls_serie_ing				= trim(dw_reporte.getitemstring(1,'sol_rescilia_reprog_serie_nuevo'))
	ll_numero_ing			= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_numero_nuevo')
	if isnull(ls_base_ing) or ls_base_ing='' or isnull(ls_serie_ing) or ls_serie_ing='' or &
		isnull(ll_numero_ing) or ll_numero_ing=0 then
		ll_sw					= 1
	end if
elseif dw_reporte.dataobject='dw_form_ultima_voluntad' then
	ls_obs_not				= trim(dw_reporte.getitemstring(1,'sol_ultima_voluntad_observacion'))
	ls_nom_not				= trim(dw_reporte.getitemstring(1,'sol_ultima_voluntad_nombre_notario'))
	ls_ap_pat_not			= trim(dw_reporte.getitemstring(1,'sol_ultima_voluntad_ap_pat_notario'))
	ls_ap_mat_not			= trim(dw_reporte.getitemstring(1,'sol_ultima_voluntad_ap_mat_notario'))
	ldt_fecha_not			= dw_reporte.getitemdatetime(1,'sol_ultima_voluntad_fecha_tramite_notari')
	if isnull(ls_obs_not) or ls_obs_not='' or isnull(ls_nom_not) or ls_nom_not='' or &
		isnull(ls_ap_pat_not) or ls_ap_pat_not='' or isnull(ls_ap_mat_not) or ls_ap_mat_not='' or & 
		isnull(ldt_fecha_not) then
		ll_sw					= 1
	end if
elseif dw_reporte.dataobject='dw_form_resciliacion_por_parte_cliente' then
	if is_base='L' then
		ls_base_asoc		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_base_asociado')
		ls_serie_asoc		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_serie_asociado')
		ll_nro_asoc			= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_numero_asociado')
		ls_area_asoc		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_area_sepultura')
		ls_sector_asoc		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_sector_sepultura')
		ls_sepultura_asoc	= dw_reporte.getitemstring(1,'sol_rescilia_cliente_sepultura')
		ll_capacidad_asoc	= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_capacidad')
		if isnull(ls_base_asoc) or ls_base_asoc='' then ll_sw=1
		if isnull(ls_serie_asoc) or ls_serie_asoc='' then ll_sw=1
		if isnull(ll_nro_asoc) or ll_nro_asoc=0 then ll_sw=1
		if isnull(ls_area_asoc) or ls_area_asoc='' then ll_sw=1
		if isnull(ls_sector_asoc) or ls_sector_asoc='' then ll_sw=1
		if isnull(ls_sepultura_asoc) or ls_sepultura_asoc='' then ll_sw=1
		if isnull(ll_capacidad_asoc) or ll_capacidad_asoc=0 then ll_sw=1
	end if
elseif dw_reporte.dataobject='dw_formulario_seguro_fallecimiento' then 
	ll_rut_ben				= dw_reporte.getitemnumber(1,'sol_seguro_fallece_rut_benef')
	ls_dv_ben				= trim(dw_reporte.getitemstring(1,'sol_seguro_fallece_dv_benef'))
	ls_nom_ben				= trim(dw_reporte.getitemstring(1,'sol_seguro_fallece_nombre_benef'))
	ls_ap_pat_ben			= trim(dw_reporte.getitemstring(1,'sol_seguro_fallece_ap_paterno_benef'))
	ls_ap_mat_ben			= trim(dw_reporte.getitemstring(1,'sol_seguro_fallece_ap_materno_benef'))
	ls_parent_ben			= trim(dw_reporte.getitemstring(1,'sol_seguro_fallece_cod_parentesco'))
	ldt_fecdef_ben			= dw_reporte.getitemdatetime(1,'sol_seguro_fallece_fecha_defuncion')
	ldt_fecnac_ben			= dw_reporte.getitemdatetime(1,'sol_seguro_fallece_fecha_nac_benef')
	ls_contac_ben			= trim(dw_reporte.getitemstring(1,'sol_seguro_fallece_nombre_contacto'))
	ldt_fecact_ben			= dw_reporte.getitemdatetime(1,'sol_seguro_fallece_fecha_actual')

	if isnull(ll_rut_ben) or ll_rut_ben=0 or isnull(ls_dv_ben) or ls_dv_ben='' or &
		isnull(ls_nom_ben) or ls_nom_ben='' or isnull(ls_ap_pat_ben) or ls_ap_pat_ben='' or & 
		isnull(ls_ap_mat_ben) or ls_ap_mat_ben='' or isnull(ls_parent_ben) or ls_parent_ben='' or & 
		isnull(ls_contac_ben) or ls_contac_ben='' or isnull(ldt_fecdef_ben) or isnull(ldt_fecnac_ben) or &
		isnull(ldt_fecact_ben) then
		ll_sw					= 1
	end if
elseif dw_reporte.dataobject='dw_form_cambio_estado' then
	ls_estado_final					= dw_reporte.getitemstring(1,'sol_cambio_estado_estado_ctto_final')
	if isnull(ls_estado_final) then ll_sw=1
elseif dw_reporte.dataobject='dw_form_cambio_en_demanda' then
	ls_estado_final			= dw_reporte.getitemstring(1,'sol_en_demanda_estado_ctto_final')
	ls_estado_original		= dw_reporte.getitemstring(1,'sol_en_demanda_estado_ctto_original') // nuevo
	ld_fec_res				= dw_reporte.getitemdatetime(1,'sol_en_demanda_fecha_rescil')
	if isnull(ls_estado_final) then ll_sw=1
	if isnull(ls_estado_original) then ll_sw=1 //nuevo
	if ls_estado_original = ls_estado_final then ll_sw=1 // nuevo
elseif dw_reporte.dataobject='dw_form_cambio_estado_titular' then
	ls_estado_final	= dw_reporte.getitemstring(1,'sol_cambio_estado_titular_estado_ctto_fi')
	if isnull(ls_estado_final) then ll_sw=1
elseif dw_reporte.dataobject='dw_formulario_seguro' then
	ll_rut_benef				= dw_reporte.getitemnumber(1,'sol_seguro_rut_beneficiario_seguro')
	ll_codigo_seguro		= dw_reporte.getitemnumber(1,'sol_seguro_codigo_seguro')
	ldt_fecha_defuncion	= dw_reporte.getitemdatetime(1,'sol_seguro_fecha_defuncion')
	ls_nombre_contacto	= dw_reporte.getitemstring(1,'sol_seguro_nombre_contacto')
	ls_direc_contacto		= dw_reporte.getitemstring(1,'sol_seguro_direccion_contacto')
	ls_ciudad_contacto	= dw_reporte.getitemstring(1,'sol_seguro_ciudad_contacto')
	ls_comuna_contacto	= dw_reporte.getitemstring(1,'sol_seguro_comuna_contacto')
	ldt_fecha_actual		= dw_reporte.getitemdatetime(1,'sol_seguro_fecha_actual')
	if isnull(ll_codigo_seguro) or ll_codigo_seguro=0 or isnull(ldt_fecha_defuncion) or &
		isnull(ldt_fecha_actual) or isnull(ls_nombre_contacto) or ls_nombre_contacto='' or &
		isnull(ls_direc_contacto) or ls_direc_contacto='' or isnull(ls_ciudad_contacto) or ls_ciudad_contacto='' or & 
		isnull(ls_comuna_contacto) or ls_comuna_contacto='' then 
		ll_sw=1
	end if
elseif dw_reporte.dataobject='dw_formulario_modifica_antece_cliente' then
	dw_reporte.setitem(1,'sol_mod_antece_estatus_operaciones',0)
	dw_reporte.setitem(1,'sol_mod_antece_estatus_mod',0)
	dw_reporte.setitem(1,'sol_mod_antece_estatus_informatica',0)
	dw_reporte.setitem(1,'sol_mod_antece_usuario_opera',gs_user)
	dw_reporte.setitem(1,'sol_mod_antece_fecha_opera',idt_fecha_hoy)
	dw_reporte.setitem(1,'sol_mod_antece_usuario_infor',gs_user)
	dw_reporte.setitem(1,'sol_mod_antece_fecha_infor',idt_fecha_hoy)
	dw_reporte.setitem(1,'sol_mod_antece_correlativo',il_correlativo)
	dw_reporte.setitem(1,'sol_mod_antece_rut',il_numero)
	ldt_fecha_nac				= dw_reporte.getitemdatetime(1,"sol_mod_antece_fecha_nac_nueva")
	ls_dir_p						= dw_reporte.getitemstring(1,'sol_mod_antece_direccion_p_nueva')
	ls_comuna					= dw_reporte.getitemstring(1,'sol_mod_antece_comuna_nueva')
	ls_ciudad						= dw_reporte.getitemstring(1,'sol_mod_antece_ciudad_nueva')
	ls_nombre					= dw_reporte.getitemstring(1,'sol_mod_antece_nombre_nueva')
	ls_a_pat						= dw_reporte.getitemstring(1,'sol_mod_antece_ap_paterno_nueva')
	ls_a_mat						= dw_reporte.getitemstring(1,'sol_mod_antece_ap_materno_nueva')
	ls_tipo_via					= dw_reporte.getitemstring(1,'sol_mod_antece_tipo_via_nueva')
	ls_nro_part					= dw_reporte.getitemstring(1,'sol_mod_antece_numero_particular_nueva')
	if isnull(ls_dir_p) or isnull(ls_comuna) or isnull(ls_ciudad) or isnull(ls_tipo_via) or &
		isnull(ls_nro_part) or isnull(ldt_fecha_nac) or date(ldt_fecha_nac)=date("00/00/0000") or &
		isnull(ls_nombre) or isnull(ls_a_pat) or isnull(ls_a_mat) then ll_sw = 1
	dw_reporte.setitem(1,'sol_mod_antece_rut',il_numero)
	dw_reporte.setitem(1,'sol_estatus_rut_cliente',gi_rut)
	
elseif dw_reporte.dataobject='dw_formulario_compromiso_pago' then
	dw_reporte.setitem(1,'sol_compromiso_pago_estatus_operacion',0)
	dw_reporte.setitem(1,'sol_compromiso_pago_estatus_informatica',0)
	dw_reporte.setitem(1,'sol_compromiso_pago_fecha_opera',ldt_fecha_hoy)
	dw_reporte.setitem(1,'sol_compromiso_pago_fecha_infor',ldt_fecha_hoy)
	dw_reporte.setitem(1,'sol_compromiso_pago_usuario_opera',gs_user)
	dw_reporte.setitem(1,'sol_compromiso_pago_usuario_infor',gs_user)
	ldt_fecha_prim		= dw_reporte.getitemdatetime(1,'sol_compromiso_pago_fecha_prim_mant')
	ll_cta_pie_m		= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_pie_mant')
	ll_plazo_m			= dw_reporte.getitemnumber(1,'sol_compromiso_pago_plazo_mant')
	ll_mora_ori			= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_mora_original')
	SELECT 	"CADENA_MORA"."MORA_MANT"
	INTO 		:ll_mora_mant_cadena 
	FROM 	"CADENA_MORA" 
	WHERE ( "CADENA_MORA"."BASE" = :is_base ) AND  
			  ( "CADENA_MORA"."SERIE" = :is_serie ) AND  
			  ( "CADENA_MORA"."NUMERO" = :il_numero )   ;
	if ll_mora_ori <> ll_mora_mant_cadena then
		messagebox("Advertencia","Debe Salir de Solicitud, Cliente realizó Pago (Mora Mantención No Corresponde)")
		ls_pasa			= 'N'
	elseif isnull(ldt_fecha_prim) or ldt_fecha_prim < gdt_fec_sistema then
		messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
		dw_reporte.setfocus()
		dw_reporte.setcolumn('sol_compromiso_pago_fecha_prim_mant')
		ls_pasa			= 'N'
//	elseif isnull(ll_cta_pie_m) or ll_cta_pie_m = 0 then
//		messagebox("Advertencia","Debe Ingresar Cuota Pie")
//		dw_reporte.setfocus()
//		dw_reporte.setcolumn('sol_compromiso_pago_cuotas_pie_mant')
//		ls_pasa			= 'N'
	elseif isnull(ll_plazo_m) or ll_plazo_m = 0 then
		messagebox("Advertencia","Debe Ingresar Plazo")
		dw_reporte.setfocus()
		dw_reporte.setcolumn('sol_compromiso_pago_plazo_mant')
		ls_pasa			= 'N'
	end if
	
elseif dw_reporte.dataobject='dw_form_copropietario_promesa' then
	Long	ll_tot_reg,ll_indi
	ll_tot_reg					= dw_ingreso_coprop.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ll_rut_co				= dw_ingreso_coprop.getitemnumber(ll_indi,'rut_coprop')
			ls_dv_co				= dw_ingreso_coprop.getitemstring(ll_indi,'dv_coprop')
			ls_nom_co			= dw_ingreso_coprop.getitemstring(ll_indi,'nombres_coprop')
			ls_ap_pat_co		= dw_ingreso_coprop.getitemstring(ll_indi,'ap_pat_coprop')
			ls_ap_mat_co		= dw_ingreso_coprop.getitemstring(ll_indi,'ap_mat_coprop')
			if ll_rut_co=0 or isnull(ll_rut_co) then
				messagebox("Advertencia","Debe Ingresar Rut en Fila Nº "+string(ll_indi))
				dw_ingreso_coprop.setfocus()
				dw_ingreso_coprop.scrolltorow(ll_indi)
				dw_ingreso_coprop.setcolumn('rut_coprop')
				ls_pasa			= 'N'
				exit
			elseif ls_dv_co='' or isnull(ls_dv_co) then
				messagebox("Advertencia","Debe Ingresar Dv en Fila Nº "+string(ll_indi))
				dw_ingreso_coprop.setfocus()
				dw_ingreso_coprop.scrolltorow(ll_indi)
				dw_ingreso_coprop.setcolumn('dv_coprop')
				ls_pasa	= 'N'
				exit
			elseif ls_nom_co='' or isnull(ls_nom_co) then
				messagebox("Advertencia","Debe Ingresar Nombre(s) en Fila Nº "+string(ll_indi))
				dw_ingreso_coprop.setfocus()
				dw_ingreso_coprop.scrolltorow(ll_indi)
				dw_ingreso_coprop.setcolumn('nombres_coprop')
				ls_pasa	= 'N'
				exit
			elseif ls_ap_pat_co='' or isnull(ls_ap_pat_co) then
				messagebox("Advertencia","Debe Ingresar Apellido Paterno en Fila Nº "+string(ll_indi))
				dw_ingreso_coprop.setfocus()
				dw_ingreso_coprop.scrolltorow(ll_indi)
				dw_ingreso_coprop.setcolumn('ap_pat_coprop')
				ls_pasa	= 'N'
				exit
			elseif ls_ap_mat_co='' or isnull(ls_ap_mat_co) then
				messagebox("Advertencia","Debe Ingresar Apellido Materno en Fila Nº "+string(ll_indi))
				dw_ingreso_coprop.setfocus()
				dw_ingreso_coprop.scrolltorow(ll_indi)
				dw_ingreso_coprop.setcolumn('ap_mat_coprop')
				ls_pasa	= 'N'
				exit
			end if
		next
	end if
elseif dw_reporte.dataobject='dw_form_mandato_pac' then
	ldt_fecha_actual			= dw_reporte.getitemdatetime(1,'sol_pac_fecha_actual')
	ls_base_asoc				= dw_reporte.getitemstring(1,'sol_pac_base_mandato')
	ls_serie_asoc				= dw_reporte.getitemstring(1,'sol_pac_serie_mandato')
	ll_nro_asoc					= dw_reporte.getitemnumber(1,'sol_pac_folio_mandato')
	ll_cod_banco				= dw_reporte.getitemnumber(1,'sol_pac_cod_banco')
	ls_nro_cuenta				= dw_reporte.getitemstring(1,'sol_pac_numero_cuenta')
	ldt_fecha_cobro			= dw_reporte.getitemdatetime(1,'sol_pac_fecha_cobro_pac')
	ldt_fecha_cobro_mant	= dw_reporte.getitemdatetime(1,'sol_pac_fecha_cobro_pac_mant')
	ldt_fecha_suscrip			= dw_reporte.getitemdatetime(1,'sol_pac_fecha_suscripcion')
	ldb_monto_cred			= dw_reporte.getitemnumber(1,'sol_pac_monto_cuota_cred')
	ldb_monto_mant			= dw_reporte.getitemnumber(1,'sol_pac_monto_cuota_mant')
	ll_rut_tit						= dw_reporte.getitemnumber(1,'sol_pac_rut_titular')
	ls_dv_tit						= dw_reporte.getitemstring(1,'sol_pac_dv')
	ls_nom_tit					= dw_reporte.getitemstring(1,'sol_pac_nombre')
	ls_ap_pat_tit				= dw_reporte.getitemstring(1,'sol_pac_ap_paterno')
	ls_ap_mat_tit				= dw_reporte.getitemstring(1,'sol_pac_ap_materno')
	
	if isnull(ldt_fecha_actual) then ll_sw=1
	if isnull(ls_base_asoc) or ls_base_asoc='' then ll_sw=1
	if isnull(ls_serie_asoc) or ls_serie_asoc='' then ll_sw=1
	if isnull(ll_nro_asoc) or ll_nro_asoc=0 then ll_sw=1
	if isnull(ll_cod_banco) or ll_cod_banco=0 then ll_sw=1
	if isnull(ls_nro_cuenta) or ls_nro_cuenta='' then ll_sw=1
	if isnull(ll_rut_tit) or ll_rut_tit=0 then ll_sw=1
	if isnull(ls_dv_tit) or ls_dv_tit='' then ll_sw=1
	if isnull(ls_nom_tit) or ls_nom_tit='' then ll_sw=1
	if isnull(ls_ap_pat_tit) or ls_ap_pat_tit='' then ll_sw=1
	if isnull(ls_ap_mat_tit) or ls_ap_mat_tit='' then ll_sw=1
	if isnull(ldt_fecha_cobro) and isnull(ldt_fecha_cobro_mant) then ll_sw=1
	if (isnull(ldb_monto_cred) and isnull(ldb_monto_mant)) or (ldb_monto_cred=0 and ldb_monto_mant=0) then ll_sw=1
	if isnull(ldt_fecha_suscrip) then ll_sw=1
elseif dw_reporte.dataobject='dw_form_mandato_pat' then
	ll_nro_asoc				= dw_reporte.getitemnumber(1,'sol_pat_folio_mandato')
	if ll_nro_asoc=0 or isnull(ll_nro_asoc) then
		SELECT	MAX("SOL_PAT"."FOLIO_MANDATO")
		INTO		:ll_correlativo
		FROM 		"SOL_PAT"
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if ll_correlativo=0 or isnull(ll_correlativo) then 
				ll_correlativo	= 1
			else
				ll_correlativo++
			end if
		else
			ll_correlativo		= 1
		end if
		ll_nro_asoc				= ll_correlativo
		dw_reporte.setitem(1,'sol_pat_folio_mandato',ll_nro_asoc)
		dw_reporte.accepttext()
	end if
	ldt_fecha_actual			= dw_reporte.getitemdatetime(1,'sol_pat_fecha_actual')
	ll_cod_banco				= dw_reporte.getitemnumber(1,'sol_pat_cod_banco')
	ls_nro_cuenta				= dw_reporte.getitemstring(1,'sol_pat_numero_cuenta')
	ldt_fecha_cobro			= dw_reporte.getitemdatetime(1,'sol_pat_fecha_cobro_pac')
	ldt_fecha_cobro_mant	= dw_reporte.getitemdatetime(1,'sol_pat_fecha_cobro_pac_mant')
	ldt_fecha_suscrip			= dw_reporte.getitemdatetime(1,'sol_pat_fecha_suscripcion')
	ldb_monto_cred			= dw_reporte.getitemnumber(1,'sol_pat_monto_cuota_cred')
	ldb_monto_mant			= dw_reporte.getitemnumber(1,'sol_pat_monto_cuota_mant')
	ll_rut_tit						= dw_reporte.getitemnumber(1,'sol_pat_rut_titular')
	ls_dv_tit						= dw_reporte.getitemstring(1,'sol_pat_dv')
	ls_nom_tit					= dw_reporte.getitemstring(1,'sol_pat_nombre')
	ls_ap_pat_tit				= dw_reporte.getitemstring(1,'sol_pat_ap_paterno')
	ls_ap_mat_tit				= dw_reporte.getitemstring(1,'sol_pat_ap_materno')
	
	if isnull(ldt_fecha_actual) then ll_sw=1
	if isnull(ll_nro_asoc) or ll_nro_asoc=0 then ll_sw=1
	if isnull(ll_cod_banco) or ll_cod_banco=0 then ll_sw=1
	if isnull(ls_nro_cuenta) or ls_nro_cuenta='' then ll_sw=1
	if isnull(ll_rut_tit) or ll_rut_tit=0 then ll_sw=1
	if isnull(ls_dv_tit) or ls_dv_tit='' then ll_sw=1
	if isnull(ls_nom_tit) or ls_nom_tit='' then ll_sw=1
	if isnull(ls_ap_pat_tit) or ls_ap_pat_tit='' then ll_sw=1
	if isnull(ls_ap_mat_tit) or ls_ap_mat_tit='' then ll_sw=1
	if isnull(ldt_fecha_cobro) and isnull(ldt_fecha_cobro_mant) then ll_sw=1
	if (isnull(ldb_monto_cred) and isnull(ldb_monto_mant)) or (ldb_monto_cred=0 and ldb_monto_mant=0) then ll_sw=1
	if isnull(ldt_fecha_suscrip) then ll_sw=1
elseif  dw_reporte.dataobject='dw_formulario_seguro_desgravamen' then
	ls_nombre_cliente				= dw_reporte.getitemstring(1,'nom_completo')
	ls_base_seg						= dw_reporte.getitemstring(1,'sol_seguro_desg_base')
	ls_serie_seg						= dw_reporte.getitemstring(1,'sol_seguro_desg_serie')
	ll_numero_seg					= dw_reporte.getitemnumber(1,'sol_seguro_desg_numero')
	//ls_nombre_cliente				= dw_reporte.getitemstring(1,'nom_completo')
	//ls_nombre_cliente				= dw_reporte.getitemstring(1,'t_2')
	SELECT DISTINCT "ENCARGADOS"."EMAIL"  
	INTO 		:email_de  
	FROM 	"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
	USING		sqlca;
	if isnull(email_de) or email_de='-' or email_de='' then
		email_de				= 'consulta@nuestrosparques.cl'
	end if
	//ls_email_para	= 'omarh@nuestrosparques.cl'
	ls_email_para	= 'segurodesgravamen@nuestrosparques.cl'
	ls_asunto		= 'Ingreso seguro Desgravamen'
	ls_texto			= 'Estimado, se informa que con fecha '+ string(date(gd_hoy))+' se genera Solicitud de Desgravamen de contrato'+ls_base_seg+' '+ ls_serie_seg+' '+ string(ll_numero_seg) +' de cliente Sr(a)'+ls_nombre_cliente
	select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
	INTO 		:ls_res
	from 		DUAL;
	if ls_res='OK' then
		messagebox("Envio Email","Envio Email Exitoso")
	else
		messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
	end if	
	ls_fono_contacto		= dw_reporte.getitemstring(1,'sol_seguro_desg_fono_contacto')
	ll_rut_tit_seg			= dw_reporte.getitemnumber(1,'sol_seguro_desg_rut_titular')
	
	if not isnull(ls_fono_contacto) or ls_fono_contacto = '0' or ls_fono_contacto = ' ' then		
		UPDATE "CLIENTE"  
   	 	SET "CELULAR" = :ls_fono_contacto  
   		WHERE "CLIENTE"."RUT" = :ll_rut_tit_seg
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if	
	end if			
end if
if ls_pasa='S' then
	dw_reporte.accepttext()
	if ll_sw=0 then
		if dw_reporte.update() = 1 then
			commit;
//			if dw_reporte.dataobject='dw_form_cambio_en_demanda' then
//				// Insertar Funcion Cambio Cartera
//				f_demanda_cliente_cartera(is_base,is_serie,il_numero,gs_user)
//			end if
			if dw_reporte.dataobject= 'dw_form_resciliacion_por_parte_cliente' or dw_reporte.dataobject='dw_form_resciliacion_por_reprogramacion' then
				if  dw_reporte.dataobject='dw_form_resciliacion_por_parte_cliente' then
					ls_estado_final					= 'N'	
					ls_base_original				= dw_reporte.getitemstring(1,'sol_rescilia_cliente_base')
					ls_serie_original				= dw_reporte.getitemstring(1,'sol_rescilia_cliente_serie')
					ll_numero_original				= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_numero') 
					ld_fec_res						= dw_reporte.getitemdatetime(1,'sol_rescilia_cliente_fecha_rescil')	
				elseif dw_reporte.dataobject='dw_form_resciliacion_por_reprogramacion' then
					ls_estado_final					= 'N'	
					ls_base_original				= dw_reporte.getitemstring(1,'sol_rescilia_reprog_base')
					ls_serie_original				= dw_reporte.getitemstring(1,'sol_rescilia_reprog_serie')
					ll_numero_original				= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_numero') 
					ld_fec_res						= dw_reporte.getitemdatetime(1,'sol_rescilia_reprog_fecha_rescil')	
				end if	
	
				SELECT	"SAP_CADENA"."NRO_CONTRATO_SAP"  
				INTO 		:ll_numero_ctto_sap_c  
				FROM 	"SAP_CADENA"  
				WHERE ( "SAP_CADENA"."BASE" = :ls_base_original ) AND  
						  ( "SAP_CADENA"."SERIE" = :ls_serie_original ) AND  
						  ( "SAP_CADENA"."NUMERO" = :ll_numero_original ) AND  
						  ( "SAP_CADENA"."TIPO_DEUDA" = 'C' or "SAP_CADENA"."TIPO_DEUDA" = 'E' ) 
				USING	sqlca;
				
				SELECT	"SAP_CADENA"."NRO_CONTRATO_SAP"  
				INTO 		:ll_numero_ctto_sap_m  
				FROM 	"SAP_CADENA"  
				WHERE ( "SAP_CADENA"."BASE" = :ls_base_original ) AND  
						  ( "SAP_CADENA"."SERIE" = :ls_serie_original ) AND  
						  ( "SAP_CADENA"."NUMERO" = :ll_numero_original ) AND  
						  ( "SAP_CADENA"."TIPO_DEUDA" = 'M')
				USING	sqlca;		  
				
				INSERT INTO "LOG_CAMBIO_ESTADO_CTTO"  
							( "BASE", "SERIE","NUMERO", "FECHA_MODIFICACION", "FECHA_RES", "ESTADO_ANTERIOR", "ESTADO_NUEVO","USUARIO",  "NRO_CTTO_SAP",  "NRO_CTTO_SAP_M" )  
				VALUES 	( :ls_base_original, :ls_serie_original, :ll_numero_original, :gdt_fec_sistema, :ld_fec_res, 'V',:ls_estado_final, :gs_user, :ll_numero_ctto_sap_c, :ll_numero_ctto_sap_m )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					Rollback;
				end if	
				
			end if	
			if dw_reporte.dataobject='dw_form_cambio_estado_titular' or dw_reporte.dataobject='dw_form_cambio_estado' then
				if dw_reporte.dataobject='dw_form_cambio_estado' then
					ls_estado_final					= dw_reporte.getitemstring(1,'sol_cambio_estado_estado_ctto_final')	
					ls_base_original				= dw_reporte.getitemstring(1,'sol_cambio_estado_base')
					ls_serie_original				= dw_reporte.getitemstring(1,'sol_cambio_estado_serie')
					ll_numero_original				= dw_reporte.getitemnumber(1,'sol_cambio_estado_numero') 
					ld_fec_res						= dw_reporte.getitemdatetime(1,'sol_cambio_estado_fecha_rescil')	
				elseif  dw_reporte.dataobject='dw_form_cambio_estado_titular' then
					ls_estado_final					= dw_reporte.getitemstring(1,'sol_cambio_estado_titular_estado_ctto_fi')
					ls_base_original				= dw_reporte.getitemstring(1,'sol_cambio_estado_titular_base')
					ls_serie_original				= dw_reporte.getitemstring(1,'sol_cambio_estado_titular_serie')
					ll_numero_original				= dw_reporte.getitemnumber(1,'sol_cambio_estado_titular_numero') 
					ld_fec_res						= dw_reporte.getitemdatetime(1,'sol_cambio_estado_titular_fecha_rescil')	
				end if	
				
				SELECT	"SAP_CADENA"."NRO_CONTRATO_SAP"  
				INTO 		:ll_numero_ctto_sap_c  
				FROM 	"SAP_CADENA"  
				WHERE ( "SAP_CADENA"."BASE" = :ls_base_original ) AND  
						  ( "SAP_CADENA"."SERIE" = :ls_serie_original ) AND  
						  ( "SAP_CADENA"."NUMERO" = :ll_numero_original ) AND  
						  ( "SAP_CADENA"."TIPO_DEUDA" = 'C' or "SAP_CADENA"."TIPO_DEUDA" = 'E' ) 
				USING	sqlca;
				
				SELECT	"SAP_CADENA"."NRO_CONTRATO_SAP"  
				INTO 		:ll_numero_ctto_sap_m  
				FROM 	"SAP_CADENA"  
				WHERE ( "SAP_CADENA"."BASE" = :ls_base_original ) AND  
						  ( "SAP_CADENA"."SERIE" = :ls_serie_original ) AND  
						  ( "SAP_CADENA"."NUMERO" = :ll_numero_original ) AND  
						  ( "SAP_CADENA"."TIPO_DEUDA" = 'M')
				USING	sqlca;		  
				
				INSERT INTO "LOG_CAMBIO_ESTADO_CTTO"  
							( "BASE", "SERIE","NUMERO", "FECHA_MODIFICACION", "FECHA_RES", "ESTADO_ANTERIOR", "ESTADO_NUEVO","USUARIO",  "NRO_CTTO_SAP",  "NRO_CTTO_SAP_M" )  
				VALUES 	( :ls_base_original, :ls_serie_original, :ll_numero_original, :gdt_fec_sistema, :ld_fec_res, 'V',:ls_estado_final, :gs_user, :ll_numero_ctto_sap_c, :ll_numero_ctto_sap_m )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					Rollback;
				end if	
			end if

			if dw_reporte.dataobject='dw_form_copropietario_promesa' then
				if dw_ingreso_coprop.update()=1 then
					commit;
				else
					rollback;
					messagebox("Error Grabar CoPropietario","Error al Grabar CoPropietario SQL: "+sqlca.sqlerrtext)
				end if
			end if
			//--- nuevo 11/2018
			if dw_reporte.dataobject='dw_form_resciliacion_por_reprogramacion' then
				ls_base				= trim(dw_reporte.getitemstring(1,'sol_rescilia_reprog_base'))
				ls_serie				= trim(dw_reporte.getitemstring(1,'sol_rescilia_reprog_serie'))
				ll_numero			= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_numero')
				if not isnull(ls_base) or ls_base='' or not isnull(ls_serie) or ls_serie ='' or not isnull(ll_numero) or ll_numero=0 then
					SELECT	"CADENA"."NUMERO"  
					INTO 		:ll_num_aux  
					FROM 		"CADENA"  
					WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
							 ( "CADENA"."SERIE" = :ls_serie ) AND  
							 ( "CADENA"."NUMERO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						DECLARE sp_cadena_mora_cta_cte PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base,:ls_serie,:ll_numero,'M');
						EXECUTE sp_cadena_mora_cta_cte;
					end if
				end if
			end if	
			//-- fin nuevo 11/2018
			il_sw_print	= 0
			if dw_reporte.dataobject<>'dw_formulario_modifica_antece_cliente' then
				SELECT	"SOL_ESTATUS"."BASE"  
				INTO 		:ls_base_aux  
				FROM 		"SOL_ESTATUS"  
				WHERE 	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
							( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
							( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
							( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
							( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol )   
				Using		sqlca;
			end if
			if sqlca.sqlcode=100 then
				CHOOSE CASE is_tipo_sol
					CASE "1"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_rescilia_cliente_fecha_actual'))
					CASE "2"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_rescilia_reprog_fecha_actual'))
					CASE "3"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_reactiva_fecha_actual'))
					CASE "4"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_seguro_desg_fecha_actual'))
					CASE "5"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecha_actual'))
					CASE "6"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_tit_dominio_fecha_actual'))
					CASE "7"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_contrato_def_fecha_actual'))
					CASE "8"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_entrega_pag_fecha_actual'))
					CASE "10"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_transferencia_fecha_actual'))
					CASE "11"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_resolucion_fecha_actual'))
					CASE "12"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_mod_antece_fecha'))
					CASE "13"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_cambio_estado_fecha_actual'))
					CASE "14"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_cambio_estado_titular_fecha_actual'))
					CASE "15"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_seguro_fecha_actual'))
					CASE "16"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_novacion_fecha_actual'))
					CASE "17"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_coprop_promesa_fecha_creacion'))
					CASE "18"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_ultima_voluntad_fecha_creacion'))
					CASE "19"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_pos_efec_fecha_actual'))
					CASE "20"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_pac_fecha_actual'))
					CASE "21"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_pat_fecha_actual'))
					CASE "22"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_seguro_fallece_fecha_actual'))
					CASE "23"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_en_demanda_fecha_actual'))
					CASE "24"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_bono_fraterno_fecha_actual'))	
					CASE "25"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_mant_perpetua_fecha_actual'))
					CASE "26"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_tit_dominio_parque_fecha_actual'))	
					CASE "27"
						ld_fecha		= date(dw_reporte.getitemdatetime(1,'sol_compromiso_pago_fecha_solicitud'))	
				END CHOOSE
				if is_tipo_sol="15" then
					ll_codigo_seguro	= dw_reporte.getitemnumber(1,'sol_seguro_codigo_seguro')
					SELECT	"TIPO_SEGURO"."DESCRIPCION"  
					INTO		:ls_descrip  
					FROM		"TIPO_SEGURO"  
					WHERE	"TIPO_SEGURO"."CODIGO" = :ll_codigo_seguro   
					USING	sqlca;
					ls_string			= 'Solicitud en Tramite '+trim(ls_descrip)+', realizada el: '+string(ld_fecha,"dd/mm/yyyy")+' por '+gs_nom_comp_usuario
						
					SELECT	Count("BENEFICIARIOS_SEGURO"."NUMERO")
					INTO		:ll_pasa_beneficiario
					FROM		"BENEFICIARIOS_SEGURO" 
					WHERE ( "BENEFICIARIOS_SEGURO"."BASE" = :is_base ) AND  
								( "BENEFICIARIOS_SEGURO"."SERIE" = :is_serie ) AND  
								( "BENEFICIARIOS_SEGURO"."NUMERO" = :il_numero ) AND  
								( "BENEFICIARIOS_SEGURO"."RUT" = :ll_rut_benef )
					USING sqlca;
					if ll_pasa_beneficiario >0 then
//						if dw_reporte.object.sol_seguro_estatus_operaciones = true and ll_rut_benef > 0 then
//							UPDATE "BENEFICIARIOS_SEGURO" 
//							SET "ESTADO_PAGO" = 'S' , "FECHA_PAGO" = :ldt_fecha_hoy 
//							WHERE ( "BENEFICIARIOS_SEGURO"."BASE" = :is_base ) AND  
//									( "BENEFICIARIOS_SEGURO"."SERIE" = :is_serie ) AND  
//									( "BENEFICIARIOS_SEGURO"."NUMERO" = :il_numero ) AND  
//									( "BENEFICIARIOS_SEGURO"."RUT" = :ll_rut_benef )
//							USING sqlca;
//						end if
					end if	
				else
					ls_string			= 'Solicitud en Tramite, realizada el: '+string(ld_fecha,"dd/mm/yyyy")+' por '+gs_nom_comp_usuario
				end if
				INSERT INTO	"SOL_ESTATUS"  
							( "BASE",   "SERIE",   "NUMERO",   "CORRELATIVO",   "CODIGO_SOLICITUD",   "ESTADO_REG",	"OBSERVACION", "RUT_CLIENTE" )  
				VALUES 	( :is_base, :is_serie, :il_numero, 	:il_correlativo, 		:is_tipo_sol,   		  		'A',					:ls_string,	   		:gi_rut )  
				Using		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					if dw_reporte.dataobject='dw_formulario_compromiso_pago' then
						ls_glosa		= 'SOLICITUD ACUERDO PAGO DE MANTENCION'
						ls_estado 	= '75'
						INSERT INTO "ATENCION_LOG"
										( "RUT"  ,	"ESTADO"  ,"FECHA"  ,			"GLOSA"    ,"USUARIO" ,	"BASE"  ,"SERIE"  ,	"NUMERO" )  
						VALUES 		( :gi_rut,		:ls_estado,	:gdt_fec_sistema,	:ls_glosa,	:gs_user,	:is_base,:is_serie,		:il_numero)  ;
						if sqlca.sqlcode <> 0 then
							messagebox('Error','Error al Grabar '+sqlca.SQLErrText,information!)
							ROLLBACK;
						else
							commit;
							UPDATE	"CLIENTE"  
							SET 		"ULT_ESTADO_PUB" = :ls_estado,   
										"ULT_GLOSA_PUB" = :ls_glosa,   
										"ULT_FECHA_PUB" = :gdt_fec_sistema  
							WHERE 	"CLIENTE"."RUT" = :gi_rut   
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
					end if
					wf_validar_ventanas()
				else
					rollback;
				end if
			end if
			if is_estado="N" and dw_reporte.dataobject='dw_formulario_modifica_antece_cliente' then
				ld_fecha			= date(dw_reporte.getitemdatetime(1,'sol_mod_antece_fecha'))
				ls_string			= 'Se Genera Solicitud y Actualiza Antecedentes del Cliente, realizada el: '+string(ld_fecha,"dd/mm/yyyy")+' por '+gs_nom_comp_usuario
				SELECT	"SOL_ESTATUS"."BASE"  
				INTO 		:ls_base_aux  
				FROM 	"SOL_ESTATUS"  
				WHERE  ( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
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
					WHERE  ( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
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
						WHERE 	"SOL_MOD_ANTECE"."RUT" = :il_numero  and 
									"SOL_MOD_ANTECE"."CORRELATIVO" = :il_correlativo
						USING		sqlca;
						if sqlca.sqlcode=0 then
							SELECT	"CLIENTE"."DIRECCION_P",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."FECHA_PROX_LLAMADO"
							INTO 		:ls_dir_p_c, 					:ls_pob_c,					:ls_sector_c,			:ls_comuna_c,			:ls_ciudad_c,			:ls_fono_p_c,			:ls_nro_p_c,							:ls_depto_p_c,						:ls_block_p_c,						:ls_tipo_via_p_c,			:ls_estado_cobranza_c,			:ldt_fec_prox_llamado_c
							FROM 		"CLIENTE"  
							WHERE 	"CLIENTE"."RUT" = :il_numero
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
										"ESTADO_COBRANZA" = '0',
										"FECHA_PROX_LLAMADO" = :ldt_fec_prox_llamado_c,
										"LAT_GEO" = 0,
										"LON_GEO" = 0,
										"STATUS_GEO" = 0
							WHERE 	"CLIENTE"."RUT" = :il_numero   
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
								WHERE 	"CAJA_ACTUALIZA_FONO"."RUT" = :il_numero   
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
						FROM 	"SOL_MOD_ANTECE"  
						WHERE 	"SOL_MOD_ANTECE"."RUT" = :il_numero  and 
									"SOL_MOD_ANTECE"."CORRELATIVO" = :il_correlativo
						USING	sqlca;
						if sqlca.sqlcode=0 then
							SELECT	"CLIENTE"."DIRECCION_P",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."ESTADO_COBRANZA",	"CLIENTE"."FECHA_PROX_LLAMADO",	"CLIENTE"."CELULAR"  
							INTO 		:ls_dir_p_c, 					:ls_pob_c,					:ls_sector_c,			:ls_comuna_c,			:ls_ciudad_c,			:ls_fono_p_c,			:ls_nro_p_c,							:ls_depto_p_c,						:ls_block_p_c,						:ls_tipo_via_p_c,			:ls_estado_cobranza_c,			:ldt_fec_prox_llamado_c,			:ls_celular_c
							FROM 		"CLIENTE"  
							WHERE 	"CLIENTE"."RUT" = :il_numero
							USING		sqlca;
							if sqlca.sqlcode=0 then
								if ls_dir_p_c<>ls_dir_p or ls_sector_c<>ls_sector or ls_pob_c<>ls_pob or &
									ls_comuna_c<>ls_comuna or ls_ciudad_c<>ls_ciudad or ls_nro_p_c<>ls_nro_part or &
									ls_depto_p_c<>ls_depto_part or ls_block_p_c<>ls_block_part or ls_tipo_via_p_c<>ls_tipo_via then
									
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
								UPDATE	"CLIENTE"  
								SET 		"ESTADO_COBRANZA" = '0',
											"FECHA_PROX_LLAMADO" = :ldt_fec_prox_llamado_c
								WHERE 	"CLIENTE"."RUT" = :il_numero   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							end if
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
										"LAT_GEO" = 0,
										"LON_GEO" = 0,
										"STATUS_GEO" = 0
							WHERE 	"CLIENTE"."RUT" = :il_numero   
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
								WHERE 	"CAJA_ACTUALIZA_FONO"."RUT" = :il_numero   
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
						// Fin Nuevo
					else
						rollback;
					end if
				elseif sqlca.sqlcode = -1 then
					messagebox("Error","Error al Grabar Tabla SOL_ESTATUS: "+SQLCA.SQLErrText)
				end if
				if isvalid(w_detalle_solicitudes) then
					ll_row_ant	= 1
					if w_detalle_solicitudes.dw_reporte.retrieve(il_numero)>0 then
						w_detalle_solicitudes.dw_reporte.scrolltorow(ll_row_ant)
						w_detalle_solicitudes.dw_reporte.SelectRow(0, FALSE)
						w_detalle_solicitudes.dw_reporte.SelectRow(ll_row_ant, TRUE)
					end if
				end if
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
				if isvalid(w_ingreso_solicitudes) and is_estado="N" then
					ll_fila	= w_ingreso_solicitudes.dw_lista.getrow()
					ll_cant	= w_ingreso_solicitudes.dw_lista.getitemnumber(ll_fila,'cantidad')
					ll_cant++
					w_ingreso_solicitudes.dw_lista.setitem(ll_fila,'estado',0)
					w_ingreso_solicitudes.dw_lista.setitem(ll_fila,'cantidad',ll_cant)
					w_ingreso_solicitudes.dw_lista.accepttext()
				end if
			end if
			if dw_reporte.dataobject='dw_form_cambio_en_demanda' then
				ls_estado_ctto_final	= dw_reporte.getitemstring(1,'sol_en_demanda_estado_ctto_final')
				ls_materia				= dw_reporte.getitemstring(1,'sol_en_demanda_materia')

				SELECT	"ENCARGADOS"."NOMBRE"  
				INTO 		:ls_ejecutivo  
				FROM 	"ENCARGADOS"  
				WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;

				SELECT 	"CADENA"."RUT", 	"CLIENTE"."DV", 	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO", 	"COD_PARQ"."NOMBRE" 
				INTO 		:ll_rut,   				:ls_dv,   				:ls_nombre,   				:ls_ap_pat,   					:ls_ap_mat,   					:ls_descrip_parque  
				FROM 	"CADENA",   "CLIENTE", 	"COD_PARQ"  
				WHERE 	( "CADENA"."COD_PARQUE" = "COD_PARQ"."CODIGO" ) and  
							( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
							( ( "CADENA"."CODIGO" = :gs_base ) AND  
							( "CADENA"."SERIE" = :gs_serie ) AND  
							( "CADENA"."NUMERO" = :gi_numero ) )   
				USING	sqlca;
				if isnull(ls_nombre) then ls_nombre=''
				if isnull(ls_ap_pat) then ls_ap_pat=''
				if isnull(ls_ap_mat) then ls_ap_mat=''
				if isnull(ls_dv) then ls_dv=''
				ls_nom_completo		= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
				ls_rut						= string(ll_rut,'###,###,###,###')+'-'+ls_dv
				SELECT 	"ESTADO"."NOMBRE_ESTADO",	sysdate
				INTO 		:ls_descrip_estado_ctto ,				:gdt_fec_sistema
				FROM 	"ESTADO"  
				WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado_ctto_final   ;
				
				SELECT	"SAP_CADENA"."NRO_CONTRATO_SAP"  
				INTO 		:ll_numero_ctto_sap_c  
				FROM 	"SAP_CADENA"  
				WHERE ( "SAP_CADENA"."BASE" = :gs_base ) AND  
						  ( "SAP_CADENA"."SERIE" = :gs_serie ) AND  
						  ( "SAP_CADENA"."NUMERO" = :gi_numero ) AND  
						  ( "SAP_CADENA"."TIPO_DEUDA" = 'C' or "SAP_CADENA"."TIPO_DEUDA" = 'E' ) 
				USING	sqlca;
				
				SELECT	"SAP_CADENA"."NRO_CONTRATO_SAP"  
				INTO 		:ll_numero_ctto_sap_m  
				FROM 	"SAP_CADENA"  
				WHERE ( "SAP_CADENA"."BASE" = :gs_base ) AND  
						  ( "SAP_CADENA"."SERIE" = :gs_serie ) AND  
						  ( "SAP_CADENA"."NUMERO" = :gi_numero ) AND  
						  ( "SAP_CADENA"."TIPO_DEUDA" = 'M')
				USING	sqlca;		  
				
				INSERT INTO "LOG_CAMBIO_ESTADO_CTTO"  
         				( "BASE", "SERIE","NUMERO", "FECHA_MODIFICACION", "FECHA_RES", "ESTADO_ANTERIOR", "ESTADO_NUEVO","USUARIO",  "NRO_CTTO_SAP",  "NRO_CTTO_SAP_M" )  
  				VALUES 	( :gs_base, :gs_serie, :gi_numero, :gdt_fec_sistema, :ld_fec_res, :ls_estado_original,:ls_estado_final, :gs_user, :ll_numero_ctto_sap_c, :ll_numero_ctto_sap_m )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					Rollback;
				end if					
//			
//							ls_descrip_estado_ctto			= mid(ls_descrip_estado_ctto,3)
				ls_asunto				= 'AVISO CAMBIO ESTADO CONTRATO A '+ls_descrip_estado_ctto+ ', Contrato ' +is_base+'-' +is_serie+String(il_numero,'###,###,###,###')+'.'+'~r'
				ls_texto 					= 'Con Fecha ' +STRING(gdt_fec_sistema,"dd/mm/yyyy")+' HORA: '+string(gdt_fec_sistema,'hh:mm')+' Se Solicita Cambio de Estado a '+ls_descrip_estado_ctto +', Contrato ' +is_base+'-' +is_serie+String(il_numero,'###,###,###,###')+'~r'
				ls_texto					= ls_texto+'Cliente Rut '+ls_rut+' Nombre '+ls_nom_completo+'~r'
				ls_texto					= ls_texto+'Materia '+ls_materia+'~r'
				ls_texto					= ls_texto+'Parque '+ls_descrip_parque+'~r'+'~r'
				ls_texto					= ls_texto+'Solicitado por Ejecutivo '+gs_user+'-'+ls_ejecutivo+'.'
				SELECT DISTINCT "ENCARGADOS"."EMAIL"  
				INTO 		:email_de  
				FROM 	"ENCARGADOS"  
				WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
				USING	sqlca;
				if isnull(email_de) or email_de='-' or email_de='' then
					email_de				= 'consulta@nuestrosparques.cl'
				end if
				
				SELECT 	"TASA"."CORREO_DESTINO_DEMANDA"  INTO :ls_email_para 	FROM "TASA"  	WHERE "TASA"."LOOK" = 1   ;

				select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
				INTO 		:ls_res
				from 		DUAL;
				if ls_res='OK' then
					messagebox("Envio Email","Envio Email Exitoso")
				else
					messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
				end if
			end if
			if dw_reporte.dataobject='dw_form_reactivacion_ctto_resuelto' then
				ld_fecha_hoy	= idt_fecha_hoy
				UPDATE	"SOL_REACTIVA"  
				SET 		"ESTATUS_OPERACION" = 0,   
							"ESTATUS_INFORMATICA" = 0,   
							"USUARIO_OPERA" = :gs_user,   
							"FECHA_OPERA" = :ld_fecha_hoy,   
							"USUARIO_INFOR" = :gs_user,   
							"FECHA_INFOR" = :ld_fecha_hoy  
				WHERE  ( "SOL_REACTIVA"."BASE" = :is_base ) AND  
						 ( "SOL_REACTIVA"."SERIE" = :is_serie ) AND  
						 ( "SOL_REACTIVA"."NUMERO" = :il_numero ) AND  
						 ( "SOL_REACTIVA"."CORRELATIVO" = :il_correlativo )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					ls_obs	= 'Solicitud se Tramite y Autoriza el: '+string(ld_fecha_hoy,"dd/mm/yyyy")+' por '+gs_nom_comp_usuario
					UPDATE	"SOL_ESTATUS"  
					SET 		"OBSERVACION" = :ls_obs  
					WHERE  ( "SOL_ESTATUS"."BASE" = :is_base ) AND  
							 ( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
							 ( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
							 ( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
							 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ll_rut	= dw_reporte.getitemnumber(1,'cliente_rut')
						UPDATE	"CLIENTE"  
						SET 		"ESTADO_COBRANZA" = '0'  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						USING		sqlca  ;
						if sqlca.sqlcode=0 then
							commit;
							ls_estado	= 'V'
							UPDATE	"CADENA"  
							SET 		"ESTADO" = :ls_estado   
							WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
										( "CADENA"."SERIE" = :is_serie ) AND  
										( "CADENA"."NUMERO" = :il_numero )   
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
									FROM 		"ANEXO_LIBERADOR",   
												"PAGO_LIBERADOR"  
									WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
											 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
											 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
											 (("ANEXO_LIBERADOR"."SERIE_M" = :is_serie ) AND  
											 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :il_numero ) )   
									using		SQLCA;
									if sqlca.sqlcode=0 then
										CHOOSE CASE ls_base
											CASE 'O'
												SELECT	"OFERTA_V"."CTA_PAG_M"  
												INTO 		:ll_ctas_pag_m  
												FROM 		"OFERTA_V",   
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
									FROM 		"ANEXO_AUMENTO",   
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
									FROM 		"REPACTA_MANTENCION"  
									WHERE  ( "REPACTA_MANTENCION"."BASE" = :gs_base ) AND  
											 ( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
											 ( "REPACTA_MANTENCION"."NUMERO" = :gi_numero ) 
									USING		sqlca;
									if sqlca.sqlcode=0 then
										CHOOSE CASE ls_base
											CASE 'O'
												SELECT	"OFERTA_V"."CTA_PAG_M"  
												INTO 		:ll_ctas_repacta  
												FROM 		"OFERTA_V",   
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
												FROM 		"CONTRATO"  
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
								if isvalid(w_listado_contratos) then
									w_listado_contratos.dw_listado.setitem(w_listado_contratos.dw_listado.getrow(),'cadena_estado',ls_estado)
								end if
								CHOOSE CASE gs_base
									CASE "O" // Oferta
										if isvalid(w_cuenta_corriente_oferta) then
											w_cuenta_corriente_oferta.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
										end if
									CASE "L" // Anexo Liberador
										if isvalid(w_cuenta_corriente_liberador) then
											w_cuenta_corriente_liberador.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
										end if
									CASE "P" // Pagaré
										if isvalid(w_cuenta_corriente_pagare) then
											w_cuenta_corriente_pagare.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
										end if
									CASE "C" // Contrato ISA	
										if isvalid(w_cuenta_corriente_contrato_isa) then
											w_cuenta_corriente_contrato_isa.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
										end if
									CASE "D" // Derecho Especial
										if isvalid(w_cuenta_corriente_derecho) then
											w_cuenta_corriente_derecho.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
										end if
									CASE "R" //Repactación Ctas.Mantencion
										if isvalid(w_cuenta_corriente_repactar_cta_mant) then
											w_cuenta_corriente_repactar_cta_mant.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
										end if
									CASE "A" //Repactación Aumento Capacidad
										if isvalid(w_cuenta_corriente_aumento_capacidad) then
											w_cuenta_corriente_aumento_capacidad.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
										end if
									CASE "F","G" // Anexo Fuenraria
										if isvalid(w_cuenta_corriente_funeraria) then
											w_cuenta_corriente_funeraria.dw_estado_cta_cte.setitem(1,'cadena_estado',ls_estado)
										end if
								END CHOOSE
								if isvalid(w_detalle_solicitudes) then
									ll_row_ant	= w_detalle_solicitudes.dw_reporte.getrow()
									if w_detalle_solicitudes.dw_reporte.retrieve(is_base,is_serie,il_numero,is_tipo_sol)>0 then
										w_detalle_solicitudes.dw_reporte.scrolltorow(ll_row_ant)
										w_detalle_solicitudes.dw_reporte.SelectRow(0, FALSE)
										w_detalle_solicitudes.dw_reporte.SelectRow(ll_row_ant, TRUE)
									end if
								end if
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
			if dw_reporte.dataobject='dw_formulario_repacta_o_compraventa' then	
		
					if gs_base='O' then
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
					ll_corr					= dw_reporte.getitemnumber(1,'sol_repacta_cvta_correlativo')
					ll_repro_mora			= dw_reporte.getitemnumber(1,'sol_repacta_cvta_sw_contar_repro')
//					if ll_repro_mora = 0 then
//						ll_repro_mora = 1
//					else
//						ll_repro_mora = 0
//					end if	
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
					UPDATE	"SOL_REPACTA_CVTA"  
					SET 		"ESTATUS_OPERACION" = 0,   
								"ESTATUS_INFORMATICA" = 0,   
								"USUARIO_OPERA" = :gs_user,   
								"FECHA_OPERA" = :ldt_fecha_hoy,   
								"USUARIO_INFOR" = :gs_user,   
								"FECHA_INFOR" = :ldt_fecha_hoy,
								"SW_CONTAR_REPRO" = :ll_repro_mora
					WHERE  ( "SOL_REPACTA_CVTA"."BASE" = :gs_base ) AND  
							 ( "SOL_REPACTA_CVTA"."SERIE" = :gs_serie ) AND  
							 ( "SOL_REPACTA_CVTA"."NUMERO" = :gi_numero ) AND  
							 ( "SOL_REPACTA_CVTA"."CORRELATIVO" = :ll_corr )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						if isvalid(w_detalle_solicitudes) then w_detalle_solicitudes.dw_reporte.retrieve(gs_base,gs_serie,gi_numero,is_tipo_sol)
					else
						rollback;
					end if
					ls_obs		= trim(dw_reporte.getitemstring(1,'sol_repacta_cvta_nota'))
					if isnull(ls_obs) then ls_obs=''
					if ls_obs='' then
						ls_obs	= 'Autoriza Atención Público por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
					else
						ls_obs	= ls_obs+', Autoriza Atención Público por '+gs_nom_comp_usuario+ ' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
					end if
					UPDATE	"SOL_ESTATUS"  
					SET 		"OBSERVACION" = :ls_obs  
					WHERE 	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
								( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
								( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
								( "SOL_ESTATUS"."CORRELATIVO" = :ll_corr ) AND  
								( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol )   
					Using		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
				il_sw_grabar	= 0
				messagebox("Grabar","Grabación Exitosa")
			//--- nuevo -- sumar 99 años a solicitudes de mant perpetua de contratos canaan
			if dw_reporte.dataobject = 'dw_formulario_mantencion_perpetua' then
				SELECT 	"CADENA"."COD_PARQUE"  
				INTO 		:ll_cod_parque  
				FROM 	"CADENA"  
				WHERE 	"CADENA"."CODIGO" = :ls_base AND  
							"CADENA"."SERIE" = :ls_serie AND  
							"CADENA"."NUMERO" = :ll_numero
				USING sqlca;
				if sqlca.sqlcode=0 then
					SELECT 	"ANEXO_LIBERADOR"."SERIE_M",   
								"ANEXO_LIBERADOR"."NRO_LIBERADOR"
					INTO		:ls_serie_m_lib, :ll_numero_lib	
					FROM 	"ANEXO_LIBERADOR"  
					WHERE 	"ANEXO_LIBERADOR"."BASE" = :ls_base AND  
								"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
								"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero;
					if ll_cod_parque = 101 then
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
										ls_anexo_lib	= 'L'+ls_serie_m_lib+string(ll_numero_lib)
										UPDATE	"OFERTA_V"  
										SET 		"CTA_PAG_M" = :ll_ctas,   
													"ANEXO_LIB" = :ls_anexo_lib  
										WHERE  	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
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
								WHERE  	( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
											( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									if ll_ctas_pag_m < 99 then
										ll_ctas			= 99 + ll_ctas_pag_m
										ls_anexo_lib		= 'L'+ls_serie_m_lib+string(ll_numero_lib)
										UPDATE	"CONTRATO"  
										SET 		"CTA_PAG_M" = :ll_ctas,   
													"ANEXO_LIB" = :ls_anexo_lib  
										WHERE	( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
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
				end if	
			end if
			//--- fin nuevo 
			if dw_reporte.dataobject<>'dw_formulario_compromiso_pago' and dw_reporte.dataobject<>'dw_form_transferencia' and dw_reporte.dataobject<>'dw_form_novacion' and dw_reporte.dataobject<>'dw_form_posesion_efectiva'  then close(w_mantencion_fromulario_solicitudes)
		else
			rollback;
			messagebox("Error","Error al Grabar: "+sqlca.sqlerrtext)
		end if
	else
		if dw_reporte.dataobject='dw_formulario_repacta_o_compraventa' then
			if isnull(ld_fecha0) or ld_fecha0=date("00/00/0000") then
				messagebox("Advertencia Fecha Repactación","No Registra Fecha 1er. Vencimiento")
			elseif isnull(ld_fecha_vcto) or ld_fecha_vcto=date("00/00/0000") then
				messagebox("Advertencia Fecha Repactación","Fecha 1er. Vencimiento Inválida")
			else
				messagebox("Advertencia Fecha Repactación","Fecha 1er. Vencimiento Inválida")
			end if
			dw_reporte.setfocus()
			dw_reporte.setcolumn('sol_repacta_cvta_fecrep_1_vcto')
		elseif dw_reporte.dataobject='dw_formulario_seguro_fallecimiento' then
			if isnull(ll_rut_ben) or ll_rut_ben=0 then
				messagebox("Advertencia","Debe ingresar Rut")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fallece_rut_benef')
			elseif isnull(ls_dv_ben) or ls_dv_ben='' then
				messagebox("Advertencia","Debe ingresar Digiro Verificador")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fallece_dv_benef')
			elseif isnull(ls_nom_ben) or ls_nom_ben='' then
				messagebox("Advertencia","Debe ingresar Nombre")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fallece_nombre_benef')
			elseif isnull(ls_ap_pat_ben) or ls_ap_pat_ben='' then	
				messagebox("Advertencia","Debe ingresar Apellido Paterno")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fallece_ap_paterno_benef')
			elseif isnull(ls_ap_mat_ben) or ls_ap_mat_ben='' then
				messagebox("Advertencia","Debe ingresar Apellido Materno")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fallece_ap_materno_benef')
			elseif isnull(ls_parent_ben) or ls_parent_ben='' then
				messagebox("Advertencia","Debe ingresar Parentesco")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fallece_cod_parentesco')
				
			elseif isnull(ldt_fecdef_ben) then
				messagebox("Advertencia","Debe ingresar Fecha Defunción")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fallece_fecha_defuncion')
			elseif isnull(ldt_fecnac_ben) then
				messagebox("Advertencia","Debe ingresar Fecha Nacimiento")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fallece_fecha_nac_benef')
			elseif isnull(ls_contac_ben) or ls_contac_ben='' then
				messagebox("Advertencia","Debe ingresar Nombre Contacto")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fallece_nombre_contacto')	
			elseif isnull(ldt_fecact_ben) then
				messagebox("Advertencia","Debe ingresar Fecha Actual")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fallece_fecha_actual')
			end if
		elseif dw_reporte.dataobject='dw_form_ultima_voluntad' then
			if isnull(ls_obs_not) or ls_obs_not='' then
				messagebox("Advertencia","Debe ingresar Observación")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_ultima_voluntad_observacion')
			elseif isnull(ls_nom_not) or ls_nom_not='' then
				messagebox("Advertencia","Debe ingresar Nombre Notario")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_ultima_voluntad_nombre_notario')
			elseif isnull(ls_ap_pat_not) or ls_ap_pat_not='' then
				messagebox("Advertencia","Debe ingresar Apellido Paterno Notario")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_ultima_voluntad_ap_pat_notario')
			elseif isnull(ls_ap_mat_not) or ls_ap_mat_not='' then
				messagebox("Advertencia","Debe ingresar Apellido Materno Notario")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_ultima_voluntad_ap_mat_notario')
			elseif isnull(ldt_fecha_not) then
				messagebox("Advertencia","Debe ingresar Fecha Tramite Notarial")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_ultima_voluntad_fecha_tramite_notari')
			end if
		elseif dw_reporte.dataobject='dw_form_resciliacion_por_reprogramacion' then
			messagebox("Advertencia","Debe ingresar Nuevo Contrato")
			dw_reporte.setfocus()
			dw_reporte.setcolumn('sol_rescilia_reprog_base_nuevo')
		elseif dw_reporte.dataobject='dw_formulario_modifica_antece_cliente' then
			messagebox("Advertencia","Debe Completar Antecedentes del Cliente")
			dw_reporte.setfocus()
		elseif dw_reporte.dataobject='dw_formulario_seguro' then
			
			if isnull(ll_codigo_seguro) or ll_codigo_seguro=0 then 
				messagebox("Advertencia","Debe Ingresar Tipo de Seguro")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_codigo_seguro')
			elseif isnull(ldt_fecha_defuncion) then
				messagebox("Advertencia","Debe Ingresar Fecha Defunción")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fecha_defuncion')
			elseif isnull(ldt_fecha_actual) then
				messagebox("Advertencia","Debe Ingresar Fecha Actual")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fecha_actual')
			elseif isnull(ls_nombre_contacto) or ls_nombre_contacto='' then
				messagebox("Advertencia","Debe Ingresar Nombre Contacto")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_nombre_contacto')
			elseif isnull(ls_direc_contacto) or ls_direc_contacto='' then
				messagebox("Advertencia","Debe Ingresar Dirección Contacto")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_direccion_contacto')
			elseif isnull(ls_ciudad_contacto) or ls_ciudad_contacto='' then
				messagebox("Advertencia","Debe Ingresar Ciudad Contacto")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_ciudad_contacto')
			elseif isnull(ls_comuna_contacto) or ls_comuna_contacto='' then
				messagebox("Advertencia","Debe Ingresar Comuna Contacto")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_comuna_contacto')
			end if
			dw_reporte.setfocus()
		elseif dw_reporte.dataobject='dw_form_cambio_estado' then
			messagebox("Advertencia","Debe Ingresar Estado Solicitado")
			dw_reporte.setfocus()
			dw_reporte.setcolumn('sol_cambio_estado_estado_ctto_final')
		elseif dw_reporte.dataobject='dw_form_cambio_en_demanda' then
			if ls_estado_original = ls_estado_final then
				messagebox("Advertencia","Estado Solicitado Debe ser Distinto a Estado")
			else	
				messagebox("Advertencia","Debe Ingresar Estado Solicitado")
			end if	
			dw_reporte.setfocus()
		//	dw_reporte.setcolumn('sol_cambio_estado_estado_ctto_final')
		elseif dw_reporte.dataobject='dw_form_cambio_estado_titular' then
			messagebox("Advertencia","Debe Ingresar Estado Solicitado")
			dw_reporte.setfocus()
			dw_reporte.setcolumn('sol_cambio_estado_titular_estado_ctto_fi')
		elseif dw_reporte.dataobject='dw_form_mandato_pac' then
			if isnull(ldt_fecha_actual) then
				messagebox("Advertencia","Debe Ingresar Fecha Actual MANDATO")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pac_fecha_actual')
			elseif isnull(ls_base_asoc) or ls_base_asoc='' then 
				messagebox("Advertencia","Debe Ingresar Base MANDATO")
				dw_reporte.setfocus()
			elseif isnull(ls_serie_asoc) or ls_serie_asoc='' then
				messagebox("Advertencia","Debe Ingresar Serie MANDATO")
				dw_reporte.setfocus()
			elseif isnull(ll_nro_asoc) or ll_nro_asoc=0 then
				messagebox("Advertencia","Debe Ingresar Filio MANDATO")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pac_folio_mandato')
			elseif isnull(ll_cod_banco) or ll_cod_banco=0 then
				messagebox("Advertencia","Debe Ingresar Banco MANDATO")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pac_cod_banco')
			elseif isnull(ls_nro_cuenta) or ls_nro_cuenta='' then
				messagebox("Advertencia","Debe Ingresar Nº Cuenta MANDATO")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pac_numero_cuenta')
			elseif isnull(ldt_fecha_cobro) and isnull(ldt_fecha_cobro_mant) then
				messagebox("Advertencia","Debe Ingresar Fecha Cobro MANDATO de Crédito o Mantención")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pac_fecha_cobro_pac')
			elseif (isnull(ldb_monto_cred) and isnull(ldb_monto_mant)) or (ldb_monto_cred=0 and ldb_monto_mant=0) then
				messagebox("Advertencia","Debe Ingresar Monto Cobro MANDATO de Crédito o Mantención")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pac_monto_cuota_cred')
			elseif isnull(ldt_fecha_suscrip) then 
				messagebox("Advertencia","Debe Ingresar Fecha Suscripción MANDATO")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pac_fecha_suscripcion')
			elseif isnull(ll_rut_tit) or ll_rut_tit=0 then
				messagebox("Advertencia","Debe Ingresar RUT Titular")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pac_rut_titular')
			elseif isnull(ls_dv_tit) or ls_dv_tit='' then
				messagebox("Advertencia","Debe Ingresar Digito Verificador Titular")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pac_dv')
			elseif isnull(ls_nom_tit) or ls_nom_tit='' then
				messagebox("Advertencia","Debe Ingresar Nombre Titular")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pac_nombre')
			elseif isnull(ls_ap_pat_tit) or ls_ap_pat_tit='' then
				messagebox("Advertencia","Debe Ingresar Apellido Paterno Titular")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pac_ap_paterno')
			elseif isnull(ls_ap_mat_tit) or ls_ap_mat_tit='' then
				messagebox("Advertencia","Debe Ingresar Apellido Materno Titular")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pac_ap_materno')
			end if
		elseif dw_reporte.dataobject='dw_form_mandato_pat' then
			if isnull(ldt_fecha_actual) then
				messagebox("Advertencia","Debe Ingresar Fecha Actual MANDATO")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pat_fecha_actual')
			elseif isnull(ll_nro_asoc) or ll_nro_asoc=0 then
				messagebox("Advertencia","Debe Ingresar Filio MANDATO")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pat_folio_mandato')
			elseif isnull(ll_cod_banco) or ll_cod_banco=0 then
				messagebox("Advertencia","Debe Ingresar Banco MANDATO")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pat_cod_banco')
			elseif isnull(ls_nro_cuenta) or ls_nro_cuenta='' then
				messagebox("Advertencia","Debe Ingresar Nº Cuenta MANDATO")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pat_numero_cuenta')
			elseif isnull(ldt_fecha_cobro) and isnull(ldt_fecha_cobro_mant) then
				messagebox("Advertencia","Debe Ingresar Fecha Cobro MANDATO de Crédito o Mantención")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pat_fecha_cobro_pac')
			elseif (isnull(ldb_monto_cred) and isnull(ldb_monto_mant)) or (ldb_monto_cred=0 and ldb_monto_mant=0) then
				messagebox("Advertencia","Debe Ingresar Monto Cobro MANDATO de Crédito o Mantención")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pat_monto_cuota_cred')
			elseif isnull(ldt_fecha_suscrip) then 
				messagebox("Advertencia","Debe Ingresar Fecha Suscripción MANDATO")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pat_fecha_suscripcion')
			elseif isnull(ll_rut_tit) or ll_rut_tit=0 then
				messagebox("Advertencia","Debe Ingresar RUT Titular")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pat_rut_titular')
			elseif isnull(ls_dv_tit) or ls_dv_tit='' then
				messagebox("Advertencia","Debe Ingresar Digito Verificador Titular")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pat_dv')
			elseif isnull(ls_nom_tit) or ls_nom_tit='' then
				messagebox("Advertencia","Debe Ingresar Nombre Titular")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pat_nombre')
			elseif isnull(ls_ap_pat_tit) or ls_ap_pat_tit='' then
				messagebox("Advertencia","Debe Ingresar Apellido Paterno Titular")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pat_ap_paterno')
			elseif isnull(ls_ap_mat_tit) or ls_ap_mat_tit='' then
				messagebox("Advertencia","Debe Ingresar Apellido Materno Titular")
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_pat_ap_materno')
			end if
		elseif dw_reporte.dataobject='dw_form_resciliacion_por_parte_cliente' then
			if is_base='L' then
				if isnull(ls_base_asoc) or ls_base_asoc='' then
					messagebox("Advertencia","Debe Ingresar Base Contrato Asociado")
					dw_reporte.setfocus()
					dw_reporte.setcolumn('sol_rescilia_cliente_base_asociado')
				elseif isnull(ls_serie_asoc) or ls_serie_asoc='' then
					messagebox("Advertencia","Debe Ingresar Serie Contrato Asociado")
					dw_reporte.setfocus()
					dw_reporte.setcolumn('sol_rescilia_cliente_serie_asociado')
				elseif isnull(ll_nro_asoc) or ll_nro_asoc=0 then
					messagebox("Advertencia","Debe Ingresar Número Contrato Asociado")
					dw_reporte.setfocus()
					dw_reporte.setcolumn('sol_rescilia_cliente_numero_asociado')
				elseif isnull(ls_area_asoc) or ls_area_asoc='' then
					messagebox("Advertencia","Debe Ingresar Area Contrato Asociado")
					dw_reporte.setfocus()
					dw_reporte.setcolumn('sol_rescilia_cliente_area_sepultura')
				elseif isnull(ls_sector_asoc) or ls_sector_asoc='' then
					messagebox("Advertencia","Debe Ingresar Sector Contrato Asociado")
					dw_reporte.setfocus()
					dw_reporte.setcolumn('sol_rescilia_cliente_sector_sepultura')
				elseif isnull(ls_sepultura_asoc) or ls_sepultura_asoc='' then
					messagebox("Advertencia","Debe Ingresar Sepultura Contrato Asociado")
					dw_reporte.setfocus()
					dw_reporte.setcolumn('sol_rescilia_cliente_sepultura')
				elseif isnull(ll_capacidad_asoc) or ll_capacidad_asoc=0 then
					messagebox("Advertencia","Debe Ingresar Capacidad Contrato Asociado")
					dw_reporte.setfocus()
					dw_reporte.setcolumn('sol_rescilia_cliente_capacidad')
				end if
			end if
		end if
	end if
	SetPointer(Arrow!)
end if
end event

type dw_reporte from datawindow within w_mantencion_fromulario_solicitudes
integer x = 32
integer y = 32
integer width = 3557
integer height = 1976
integer taborder = 10
string dataobject = "dw_form_cambio_estado"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_ciudad,ls_fecha,ls_fec_ult,ls_base_contrato,ls_serie_contrato,ls_area,ls_sector,ls_sepultura,ls_estado_reg,ls_descrip,ls_base_aux,ls_serie_aux,&
			ls_dv_tit,ls_nulo,ls_dv_ben,ls_estado_ctto,ls_fono_p,ls_cel_p,ls_fono_c
Long		ll_estado,ll_est_rut_3,ll_indi,ll_dia,ll_mes,ll_ano,ll_rut,ll_capacidad,ll_nulo,ll_ult_estado,ll_dias_tope,ll_rut_tit,ll_rut_ben,ll_count,ll_dias_mas,ll_fono_p_largo,&
			ll_largo_cel,ll_fono_c_largo,ll_cuotas_pie,ll_plazo_m,ll_mora_original,ll_sw,ll_rut_beneficiario
Datetime	ldt_fecha, ldt_fecha_crea, ldt_fec_cvto,ld_fec_vcto_ori,ldt_fec_prim_vcto,ldt_fecha_aux,ldt_fecha_ctto,ldt_fecha_inicio,ldt_fec_venc_cred,ldt_fecha_prim_m,&
			ldt_fecha_prox_vcto_m,ldt_fecha_prim_30
Date		ld_fecha_vcto,ld_fec_ult, ld_fecha_tope
Time		lt_hora
Double	ll_folio,ll_numero_aux,ll_nro,ldb_valor_cuota_m,ldb_monto_pie_m,ldb_valor

Setnull(ll_nulo);SetNull(ls_nulo)
lt_hora		= TIME("00:00:00")
ls_columna	= dwo.name
il_sw_grabar= 1
dw_reporte.accepttext()
if dw_reporte.dataobject='dw_form_cambio_en_demanda' then
	il_modif ++
	CHOOSE CASE ls_columna
		CASE 'sol_en_demanda_estado_ctto_final'
			
			ls_estado_ctto	= dw_reporte.getitemstring(1,'sol_en_demanda_estado_ctto_final')
			if not isnull(ls_estado_ctto) then
				ls_descrip							= f_buscar_sol_tipo_contrato(ls_estado_ctto)
				dw_reporte.object.t_titulo.text	= ls_descrip
			end if
	END CHOOSE
	
elseif this.dataobject='dw_formulario_compromiso_pago' then //ok3//
	il_modif ++
	CHOOSE CASE ls_columna
		CASE 'sol_compromiso_pago_sw_dscto_mora_pagar'
			ll_sw							= dw_reporte.getitemnumber(1,'sol_compromiso_pago_sw_dscto_mora_pagar')	//long(data)
			if ll_sw = 1 then
				dw_reporte.setitem(1,'sol_compromiso_pago_mora_pagar_mant',0)
			else
				ldb_valor					= dw_reporte.getitemnumber(1,'sol_compromiso_pago_mora_pagar_mant_ori')
				dw_reporte.setitem(1,'sol_compromiso_pago_mora_pagar_mant',ldb_valor)
			end if
			
		CASE 'sol_compromiso_pago_sw_dscto_gasto_pagar'
			ll_sw							= dw_reporte.getitemnumber(1,'sol_compromiso_pago_sw_dscto_gasto_pagar')
			if ll_sw = 1 then
				dw_reporte.setitem(1,'sol_compromiso_pago_gasto_pagar_mant',0)
			else
				ldb_valor					= dw_reporte.getitemnumber(1,'sol_compromiso_pago_gasto_pagar_mant_ori')
				dw_reporte.setitem(1,'sol_compromiso_pago_gasto_pagar_mant',ldb_valor)
			end if
		CASE 'sol_compromiso_pago_fecha_prim_mant'
			ldt_fecha_prim_m			= dw_reporte.getitemdatetime(1,'sol_compromiso_pago_fecha_prim_mant')
			ldt_fecha_prox_vcto_m	= dw_reporte.getitemdatetime(1,'sol_compromiso_pago_fecvta_1_vcto')
			//if ldt_fecha_prim_m <= ldt_fecha_prox_vcto_m then
			if ldt_fecha_prim_m <= gdt_fec_sistema then
				messagebox("Advertencia","Fecha Primer Vencimiento Inválido")
				ldt_fecha_prim_30		= datetime(RelativeDate ( date(gdt_fec_sistema), 30 ),time('00:00:00'))
				dw_reporte.setitem(1,'sol_compromiso_pago_fecha_prim_mant',ldt_fecha_prim_30)
			end if
			ll_cuotas_pie				= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_pie_mant')
			ll_mora_original			= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_mora_original')
			ldb_valor_cuota_m		= dw_reporte.getitemnumber(1,'sol_compromiso_pago_monto_cuota_mant')
			ll_plazo_m					= ll_mora_original - ll_cuotas_pie
			if ll_cuotas_pie > 0 and ll_plazo_m > 0 then
				//ls_fecha					= f_fecha_vcto_prim(  ll_plazo_m + 1 ,  ldt_fecha_prim_m  )
				ls_fecha					= f_fecha_vcto_prim( ll_plazo_m ,  ldt_fecha_prim_m  )
				ldt_fecha					= datetime(date(ls_fecha),time('00:00:00'))
				dw_reporte.setitem(1,'sol_compromiso_pago_fecrep_ult_vcto',ldt_fecha)
			end if
			
		CASE 'sol_compromiso_pago_cuotas_pie_mant'
			ldt_fecha_prim_m			= dw_reporte.getitemdatetime(1,'sol_compromiso_pago_fecha_prim_mant')
			ll_cuotas_pie				= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_pie_mant')
			ll_mora_original			= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_mora_original')
			ldb_valor_cuota_m		= dw_reporte.getitemnumber(1,'sol_compromiso_pago_monto_cuota_mant')
			ll_plazo_m					= ll_mora_original - ll_cuotas_pie
			ldb_monto_pie_m			= round(ll_cuotas_pie * ldb_valor_cuota_m,2)
			dw_reporte.setitem(1,'sol_compromiso_pago_monto_pie_mant',ldb_monto_pie_m)
			dw_reporte.setitem(1,'sol_compromiso_pago_plazo_mant',ll_plazo_m)
			if ll_cuotas_pie > ll_mora_original then
				messagebox("Advertencia","Cuota Pie NO debe ser Mayor a Mora Original")
				dw_reporte.setitem(1,'sol_compromiso_pago_cuotas_pie_mant',1)
			else
				ls_fecha					= f_fecha_vcto_prim(  ll_plazo_m  ,  ldt_fecha_prim_m  )
				ldt_fecha					= datetime(date(ls_fecha),time('00:00:00'))
				dw_reporte.setitem(1,'sol_compromiso_pago_fecrep_ult_vcto',ldt_fecha)
			end if
			wf_calcular_mora()
		CASE 'sol_compromiso_pago_plazo_mant'
			ldt_fecha_prim_m			= dw_reporte.getitemdatetime(1,'sol_compromiso_pago_fecha_prim_mant')
			ll_plazo_m					= dw_reporte.getitemnumber(1,'sol_compromiso_pago_plazo_mant')
			
			ll_mora_original			= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_mora_original')
			ll_cuotas_pie				= ll_mora_original - ll_plazo_m
			if ll_cuotas_pie <= 0 then
				messagebox("Advertencia","Plazo Inválido, NO debe ser Mayor a la resta de (Mora Original - Cuotas Pie)")
				ll_plazo_m				= ll_mora_original - 1
				dw_reporte.setitem(1,'sol_compromiso_pago_plazo_mant',ll_plazo_m)
			else
				dw_reporte.setitem(1,'sol_compromiso_pago_cuotas_pie_mant',ll_cuotas_pie)
				dw_reporte.accepttext()
				ll_cuotas_pie			= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_pie_mant')
				if ll_plazo_m > ll_mora_original - ll_cuotas_pie then
					messagebox("Advertencia","Plazo NO debe ser Mayor a Mora Original - Cuotas Pie")
					ll_plazo_m				= ll_mora_original - ll_cuotas_pie
					dw_reporte.setitem(1,'sol_compromiso_pago_plazo_mant',ll_plazo_m)
				else
					ls_fecha					= f_fecha_vcto_prim(  ll_plazo_m  ,  ldt_fecha_prim_m  )
					ldt_fecha					= datetime(date(ls_fecha),time('00:00:00'))
					dw_reporte.setitem(1,'sol_compromiso_pago_fecrep_ult_vcto',ldt_fecha)
				end if
			end if
	END CHOOSE
	
elseif this.dataobject='dw_form_reactivacion_ctto_resuelto' then //ok3//
	CHOOSE CASE ls_columna
		CASE 'sol_reactiva_est_otro_1'
			ll_estado	= this.getitemnumber(1,'sol_reactiva_est_otro_1')
			if ll_estado=0 then
				this.setitem(1,'sol_reactiva_cual_obs_1','')
			end if
		CASE 'sol_reactiva_est_otro_2'
			ll_estado	= this.getitemnumber(1,'sol_reactiva_est_otro_2')
			if ll_estado=0 then
				this.setitem(1,'sol_reactiva_cual_obs_2','')
			end if
		CASE 'sol_reactiva_fecha_actual'
			ldt_fecha		= this.getitemdatetime(1,'sol_reactiva_fecha_actual')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_reactiva_fecha_actual',ldt_fecha_crea)
				this.accepttext()
			end if
	END CHOOSE
elseif this.dataobject='dw_form_resciliacion_por_parte_cliente' then
	CHOOSE CASE ls_columna
		CASE 'sol_rescilia_cliente_est_otro_1'
			ll_estado	= this.getitemnumber(1,'sol_rescilia_cliente_est_otro_1')
			if ll_estado=0 then
				this.setitem(1,'sol_rescilia_cliente_cual_obs_1','')
			end if
		CASE 'sol_rescilia_cliente_est_otro_2'
			ll_estado	= this.getitemnumber(1,'sol_rescilia_cliente_est_otro_2')
			if ll_estado=0 then
				this.setitem(1,'sol_rescilia_cliente_cual_obs_2','')
			end if
		CASE 'sol_rescilia_cliente_fecha_actual'
			ldt_fecha		= this.getitemdatetime(1,'sol_rescilia_cliente_fecha_actual')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_rescilia_cliente_fecha_actual',ldt_fecha_crea)
				this.accepttext()
			end if
		CASE 'sol_rescilia_cliente_base_asociado','sol_rescilia_cliente_serie_asociado','sol_rescilia_cliente_numero_asociado'
			ls_base_contrato 				= dw_reporte.getitemstring(1,'sol_rescilia_cliente_base_asociado')
			ls_serie_contrato 				= dw_reporte.getitemstring(1,'sol_rescilia_cliente_serie_asociado')
			ll_nro								= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_numero_asociado')
			if ls_columna = "sol_rescilia_cliente_base_asociado" then
				if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
					dw_reporte.getchild('sol_rescilia_cliente_serie_asociado',idw_detalle)
					idw_detalle.settransobject(sqlca)
					idw_detalle.retrieve(ls_base_contrato)
				end if
			end if
			if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and not isnull(ll_nro) and ll_nro>0 then
				SELECT	"CADENA"."RUT"
				INTO 		:ll_rut
				FROM 		"CADENA"
				WHERE   ("CADENA"."CODIGO" = :ls_base_contrato) and 
						  ("CADENA"."SERIE" = :ls_serie_contrato) and
						  ("CADENA"."NUMERO" = :ll_nro) 
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if ls_base_contrato='O' then
						SELECT	"PAGO_OFERTA"."CAPACIDAD",   
									"PAGO_OFERTA"."AREA",   
									"PAGO_OFERTA"."SECTOR",   
									"PAGO_OFERTA"."SEPULTURA"  
						INTO 		:ll_capacidad,   
									:ls_area,   
									:ls_sector,   
									:ls_sepultura  
						FROM 		"CADENA",   
									"OFERTA_V",   
									"PAGO_OFERTA"  
						WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								 (("CADENA"."CODIGO" = 'O' ) AND  
								 ( "CADENA"."SERIE" = :ls_serie_contrato ) AND  
								 ( "CADENA"."NUMERO" = :ll_nro ) )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_reporte.setitem(1,'sol_rescilia_cliente_area_sepultura',ls_area)
							dw_reporte.setitem(1,'sol_rescilia_cliente_sepultura',ls_sepultura)
							dw_reporte.setitem(1,'sol_rescilia_cliente_sector_sepultura',ls_sector)
							dw_reporte.setitem(1,'sol_rescilia_cliente_capacidad',ll_capacidad)
							dw_reporte.accepttext()
						end if

					elseif ls_base_contrato='C' then
						SELECT	"CONTRATO"."SECTOR",   
									"CONTRATO"."SEPULTURA",   
									"CONTRATO"."CAPACIDAD",   
									"CONTRATO"."ZONA"  
						INTO 		:ls_sector,   
									:ls_sepultura,   
									:ll_capacidad,   
									:ls_area  
						FROM 		"CADENA",   
									"CONTRATO"  
						WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
								 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
								 (("CADENA"."CODIGO" = 'C' ) AND  
								 ( "CADENA"."SERIE" = :ls_serie_contrato ) AND  
								 ( "CADENA"."NUMERO" = :ll_nro ) )   
						Using		sqlca;
						if sqlca.sqlcode=0 then
							dw_reporte.setitem(1,'sol_rescilia_cliente_area_sepultura',ls_area)
							dw_reporte.setitem(1,'sol_rescilia_cliente_sepultura',ls_sepultura)
							dw_reporte.setitem(1,'sol_rescilia_cliente_sector_sepultura',ls_sepultura)
							dw_reporte.setitem(1,'sol_rescilia_cliente_capacidad',ll_capacidad)
							dw_reporte.accepttext()
						end if
					end if
				else
					MessageBox("Anexo Liberador" , "No Existe el Contrato Asociado")	
					dw_reporte.setitem(1,'sol_rescilia_cliente_base_asociado','')
					dw_reporte.setitem(1,'sol_rescilia_cliente_serie_asociado','')
					dw_reporte.setitem(1,'sol_rescilia_cliente_numero_asociado',0)
					dw_reporte.setitem(1,'sol_rescilia_cliente_area_sepultura','')
					dw_reporte.setitem(1,'sol_rescilia_cliente_sepultura','')
					dw_reporte.setitem(1,'sol_rescilia_cliente_sector_sepultura','')
					dw_reporte.setitem(1,'sol_rescilia_cliente_capacidad',0)
					dw_reporte.accepttext()
				end if
			end if
	END CHOOSE	

elseif this.dataobject='dw_form_resciliacion_por_reprogramacion' then
	CHOOSE CASE ls_columna
		CASE 'sol_rescilia_reprog_est_otro_1'
			ll_estado	= this.getitemnumber(1,'sol_rescilia_reprog_est_otro_1')
			if ll_estado=0 then
				this.setitem(1,'sol_rescilia_reprog_cual_obs_1','')
			end if
		CASE 'sol_rescilia_reprog_est_otro_2'
			ll_estado	= this.getitemnumber(1,'sol_rescilia_reprog_est_otro_2')
			if ll_estado=0 then
				this.setitem(1,'sol_rescilia_reprog_cual_obs_2','')
			end if
		CASE 'sol_rescilia_reprog_fecha_actual'
			ldt_fecha		= this.getitemdatetime(1,'sol_rescilia_reprog_fecha_actual')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_rescilia_reprog_fecha_actual',ldt_fecha_crea)
				this.accepttext()
			end if
	END CHOOSE	

elseif this.dataobject='dw_form_titulo_de_dominio' then
	CHOOSE CASE ls_columna
		CASE 'sol_tit_dominio_est_otro_1'
			ll_estado	= this.getitemnumber(1,'sol_tit_dominio_est_otro_1')
			if ll_estado=0 then
				this.setitem(1,'sol_tit_dominio_cual_obs_1','')
			end if

		CASE 'sol_tit_dominio_fecha_actual'
			ldt_fecha		= this.getitemdatetime(1,'sol_tit_dominio_fecha_actual')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_tit_dominio_fecha_actual',ldt_fecha_crea)
				this.accepttext()
			end if
	END CHOOSE	
elseif this.dataobject='dw_form_contrato_definitivo' then
	CHOOSE CASE ls_columna
		CASE 'sol_contrato_def_est_otro_1'
			ll_estado	= this.getitemnumber(1,'sol_contrato_def_est_otro_1')
			if ll_estado=0 then
				this.setitem(1,'sol_contrato_def_cual_obs_1','')
			end if

		CASE 'sol_contrato_def_fecha_actual'
			ldt_fecha		= this.getitemdatetime(1,'sol_contrato_def_fecha_actual')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_contrato_def_fecha_actual',ldt_fecha_crea)
				this.accepttext()
			end if
	END CHOOSE	

elseif this.dataobject='dw_form_entrega_de_pagare' then
	CHOOSE CASE ls_columna
		CASE 'sol_entrega_pag_est_oro_1'
			ll_estado	= this.getitemnumber(1,'sol_entrega_pag_est_oro_1')
			if ll_estado=0 then
				this.setitem(1,'sol_entrega_pag_cual_obs_1','')
			end if

		CASE 'sol_entrega_pag_fecha_actual'
			ldt_fecha		= this.getitemdatetime(1,'sol_entrega_pag_fecha_actual')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_entrega_pag_fecha_actual',ldt_fecha_crea)
				this.accepttext()
			end if
	END CHOOSE	

elseif this.dataobject='dw_form_transferencia' then
	CHOOSE CASE ls_columna
		CASE 'sol_transferencia_est_otro_1'
			ll_estado	= this.getitemnumber(1,'sol_transferencia_est_otro_1')
			if ll_estado=0 then
				this.setitem(1,'sol_transferencia_cual_obs_1','')
			end if

		CASE 'sol_transferencia_fecha_actual'
			ldt_fecha		= this.getitemdatetime(1,'sol_transferencia_fecha_actual')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_transferencia_fecha_actual',ldt_fecha_crea)
				this.accepttext()
			end if
	END CHOOSE	
	
elseif this.dataobject='dw_formulario_seguro_desgravamen' then
	CHOOSE CASE ls_columna
		CASE 'sol_seguro_desg_fecha_defuncion'
			ldt_fecha		= this.getitemdatetime(1,'sol_seguro_desg_fecha_defuncion')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_seguro_desg_fecha_defuncion',ldt_fecha_crea)
				this.accepttext()
			end if

		CASE 'sol_seguro_desg_fecha_actual'
			ldt_fecha		= this.getitemdatetime(1,'sol_seguro_desg_fecha_actual')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_seguro_desg_fecha_actual',ldt_fecha_crea)
				this.accepttext()
			end if
			
		CASE 'sol_seguro_desg_ciudad_contacto'
			ls_ciudad	= dw_reporte.getitemstring(1,'sol_seguro_desg_ciudad_contacto')
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle.retrieve(ls_ciudad)
			end if
			if ls_ciudad='999' then
				dw_reporte.setitem(1,'comuna','999')
			end if
			if ls_ciudad='0' then
				dw_reporte.setitem(1,'comuna','0')
			end if
		CASE 'sol_seguro_rut_beneficiario_seguro'
			ll_rut_beneficiario	= dw_reporte.getitemnumber(1,'sol_seguro_rut_beneficiario_seguro')
			if not isnull(ll_rut_beneficiario) and ll_rut_beneficiario > 0 then
				idw_detalle2.settransobject(sqlca)		
				ls_base_contrato 				= dw_reporte.getitemstring(1,'sol_seguro_base')
				ls_serie_contrato 				= dw_reporte.getitemstring(1,'sol_seguro_serie')
				ll_nro								= dw_reporte.getitemnumber(1,'sol_seguro_numero')
				idw_detalle2.retrieve(ls_base_contrato,ls_serie_contrato,ll_nro)
			end if
	END CHOOSE	

elseif this.dataobject='dw_formulario_seguro_fallecimiento' then
	CHOOSE CASE ls_columna
		CASE 'sol_seguro_fallece_rut_benef','sol_seguro_fallece_dv_benef'
			ll_rut_ben	= dw_reporte.getitemnumber(1,'sol_seguro_fallece_rut_benef')
			ls_dv_ben	= trim(dw_reporte.getitemstring(1,'sol_seguro_fallece_dv_benef'))
			if ll_rut_ben > 0 and not isnull(ls_dv_ben) then 
				il_modif ++
				if String(ls_dv_ben) <> String(gf_obtener_dv(ll_rut_ben)) then
					messagebox('Error','El Rut no es valido',stopsign!)
					dw_reporte.SetItem(1, "sol_seguro_fallece_dv_benef",ls_nulo)
					dw_reporte.setfocus()
					dw_reporte.setcolumn('sol_seguro_fallece_dv_benef')
				else
					SELECT	Count("SOL_SEGURO_FALLECE"."BASE")
					INTO 		:ll_count  
					FROM 		"SOL_SEGURO_FALLECE",   
								"SOL_ESTATUS"  
					WHERE  ( "SOL_SEGURO_FALLECE"."BASE" = "SOL_ESTATUS"."BASE" ) and  
							 ( "SOL_SEGURO_FALLECE"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
							 ( "SOL_SEGURO_FALLECE"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
							 ( "SOL_SEGURO_FALLECE"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
							 (("SOL_ESTATUS"."CODIGO_SOLICITUD" = '22' ) AND  
							 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
							 ( "SOL_SEGURO_FALLECE"."BASE" = :is_base ) AND  
							 ( "SOL_SEGURO_FALLECE"."SERIE" = :is_serie ) AND  
							 ( "SOL_SEGURO_FALLECE"."NUMERO" = :il_numero ) AND  
							 ( "SOL_SEGURO_FALLECE"."RUT_BENEF" = :ll_rut_ben ) AND  
							 ( "SOL_SEGURO_FALLECE"."DV_BENEF" = :ls_dv_ben ) )   
					USING		sqlca;
					if ll_count > 0 then
						messagebox("Advertencia","Asegurado que está Ingresando Tiene Solicitud VIGENTE")
						dw_reporte.SetItem(1, "sol_seguro_fallece_dv_benef",ls_nulo)
						dw_reporte.accepttext()
						dw_reporte.setfocus()
						dw_reporte.setcolumn('sol_seguro_fallece_dv_benef')
					else
						SELECT	Count("BENEFICIARIOS_SEGURO"."BASE")
						INTO 		:ll_count  
						FROM 		"BENEFICIARIOS_SEGURO"  
						WHERE  ( "BENEFICIARIOS_SEGURO"."BASE" = :is_base ) AND  
								 ( "BENEFICIARIOS_SEGURO"."SERIE" = :is_serie ) AND  
								 ( "BENEFICIARIOS_SEGURO"."NUMERO" = :il_numero ) AND  
								 ( "BENEFICIARIOS_SEGURO"."RUT" = :ll_rut_ben ) AND  
								 ( "BENEFICIARIOS_SEGURO"."DV" = :ls_dv_ben ) AND  
								 ( "BENEFICIARIOS_SEGURO"."CODIGO_SEGURO" = 5 ) AND  
								 ( "BENEFICIARIOS_SEGURO"."CODIGO_SEGURO_DETALLE" = 1 )   
						USING		sqlca;
						if ll_count =0 then
							messagebox("Advertencia","Rut ingresado No Existe en Tabla Asegurados")
							dw_reporte.SetItem(1, "sol_seguro_fallece_dv_benef",ls_nulo)
							dw_reporte.accepttext()
							dw_reporte.setfocus()
							dw_reporte.setcolumn('sol_seguro_fallece_dv_benef')
						end if

					end if
				end if
			end if
		CASE 'sol_seguro_fallece_fecha_defuncion'
			ldt_fecha		= this.getitemdatetime(1,'sol_seguro_fallece_fecha_defuncion')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			il_modif ++
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Defunción Invalida")
				this.setitem(1,'sol_seguro_fallece_fecha_defuncion',ldt_fecha_crea)
				this.accepttext()
			end if

		CASE 'sol_seguro_fallece_fecha_actual'
			ldt_fecha		= this.getitemdatetime(1,'sol_seguro_fallece_fecha_actual')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			il_modif ++
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_seguro_fallece_fecha_actual',ldt_fecha_crea)
				this.accepttext()
			end if
			
		CASE 'sol_seguro_fallece_ciudad_contacto'
			ls_ciudad	= dw_reporte.getitemstring(1,'sol_seguro_fallece_ciudad_contacto')
			il_modif ++
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle.retrieve(ls_ciudad)
			end if
			if ls_ciudad='999' then
				dw_reporte.setitem(1,'comuna','999')
			end if
			if ls_ciudad='0' then
				dw_reporte.setitem(1,'comuna','0')
			end if
	END CHOOSE	

elseif this.dataobject='dw_formulario_seguro' then
//	ls_base_contrato 				= dw_reporte.getitemstring(1,'sol_seguro_base')
//	ls_serie_contrato 				= dw_reporte.getitemstring(1,'sol_seguro_serie')
//	ll_nro								= dw_reporte.getitemnumber(1,'sol_seguro_numero')
	CHOOSE CASE ls_columna
		CASE 'sol_seguro_fecha_defuncion'
			ldt_fecha		= this.getitemdatetime(1,'sol_seguro_fecha_defuncion')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Defunción Invalida")
				this.setitem(1,'sol_seguro_fecha_defuncion',ldt_fecha_crea)
				this.accepttext()
			end if

		CASE 'sol_seguro_fecha_actual'
			ldt_fecha		= this.getitemdatetime(1,'sol_seguro_fecha_actual')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_seguro_fecha_actual',ldt_fecha_crea)
				this.accepttext()
			end if
			
		CASE 'sol_seguro_ciudad_contacto'
			ls_ciudad	= dw_reporte.getitemstring(1,'sol_seguro_ciudad_contacto')
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle.retrieve(ls_ciudad)
			end if
			if ls_ciudad='999' then
				dw_reporte.setitem(1,'sol_seguro_comuna_contacto','999')
			end if
			if ls_ciudad='0' then
				dw_reporte.setitem(1,'sol_seguro_comuna_contacto','0')
			end if
			
		CASE 'sol_seguro_rut_beneficiario_seguro'
		//	idw_detalle2.retrieve(ls_base_contrato,ls_serie_contrato,ll_nro)
	END CHOOSE	
	
elseif this.dataobject='dw_formulario_repacta_o_compraventa' then
	CHOOSE CASE ls_columna
		CASE 'sol_repacta_cvta_fecha_solicitud'
			ldt_fecha		= this.getitemdatetime(1,'sol_repacta_cvta_fecha_solicitud')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_repacta_cvta_fecha_solicitud',ldt_fecha_crea)
				this.accepttext()
			end if
		CASE 'sol_repacta_cvta_fecha_compra'
			ldt_fecha		= this.getitemdatetime(1,'sol_repacta_cvta_fecha_compra')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_repacta_cvta_fecha_compra',ldt_fecha_crea)
				this.accepttext()
			end if
		// ingreso fecha vcto.
		CASE 'sol_repacta_cvta_fecrep_1_vcto'
			SELECT	"TASA"."DIAS_TOPE_REPACTA"  
			INTO 		:ll_dias_tope  
			FROM 	"TASA"  
			WHERE 	"TASA"."LOOK" = 1   
			USING	sqlca;

			
			SELECT	"CADENA_MORA"."FECHA_VENC_CRED"  
			INTO 		:ldt_fec_venc_cred  
			FROM 	"CADENA_MORA"  
			WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
					 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
					 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
			USING		sqlca;

			ldt_fecha			= this.getitemdatetime(1,'sol_repacta_cvta_fecrep_1_vcto')
			ldt_fecha_aux	= this.getitemdatetime(1,'sol_repacta_cvta_fecrep_1_vcto')
			ld_fec_vcto_ori	= this.getitemdatetime(1,'sol_repacta_cvta_fecvta_1_vcto')
			
			if ldt_fecha > ld_fec_vcto_ori then
				ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
				if isnull(ldt_fecha) then 
					messagebox("Advertencia","Fecha Inválida")
					this.setitem(1,'sol_repacta_cvta_fecrep_1_vcto',ldt_fecha_crea)
					this.accepttext()
				end if
				ldt_fecha				= this.getitemdatetime(1,'sol_repacta_cvta_fecrep_1_vcto')
				ldt_fec_prim_vcto	= ldt_fecha
				FOR ll_indi=1 TO il_dias_vcto
					ls_fecha			= string(date(ldt_fecha))
					ll_dia				= day(date(ldt_fecha))
					ll_mes			= month(date(ldt_fecha))
					ll_ano				= year(date(ldt_fecha))
					ll_mes ++
					if ll_mes>12 then
						ll_mes	= 1
						ll_ano ++
					end if
					if ll_mes=1 and ll_dia>31 then 
						ll_dia	= 31
					elseif ll_mes=2 and ll_dia>28 then 
						ll_dia	= 28
					elseif ll_mes=3 and ll_dia>31 then 
						ll_dia	= 31
					elseif ll_mes=4 and ll_dia>30 then 
						ll_dia	= 30
					elseif ll_mes=5 and ll_dia>31 then 
						ll_dia	= 31
					elseif ll_mes=6 and ll_dia>30 then 
						ll_dia	= 30
					elseif ll_mes=7 and ll_dia>31 then 
						ll_dia	= 31
					elseif ll_mes=8 and ll_dia>31 then 
						ll_dia	= 31
					elseif ll_mes=9 and ll_dia>30 then 
						ll_dia	= 30
					elseif ll_mes=10 and ll_dia>31 then 
						ll_dia	= 31
					elseif ll_mes=11 and ll_dia>30 then 
						ll_dia	= 30
					elseif ll_mes=12 and ll_dia>31 then 
						ll_dia	= 31
					end if
					ls_fec_ult		= string(ll_dia,"00")+'/'+string(ll_mes,"00")+'/'+string(ll_ano,"0000")
					ld_fec_ult		= date(ls_fec_ult)
					ldt_fecha			= datetime(ld_fec_ult)
				NEXT
				//malo
				ll_dia					= day(date(ldt_fecha_aux))
				ll_mes				= month(date(ldt_fecha))
				ll_ano					= year(date(ldt_fecha))
				if ll_mes=1 and ll_dia>31 then 
					ll_dia				= 31
				elseif ll_mes=2 and ll_dia>28 then 
					ll_dia				= 28
				elseif ll_mes=3 and ll_dia>31 then 
					ll_dia				= 31
				elseif ll_mes=4 and ll_dia>30 then 
					ll_dia				= 30
				elseif ll_mes=5 and ll_dia>31 then 
					ll_dia				= 31
				elseif ll_mes=6 and ll_dia>30 then 
					ll_dia				= 30
				elseif ll_mes=7 and ll_dia>31 then 
					ll_dia				= 31
				elseif ll_mes=8 and ll_dia>31 then 
					ll_dia				= 31
				elseif ll_mes=9 and ll_dia>30 then 
					ll_dia				= 30
				elseif ll_mes=10 and ll_dia>31 then 
					ll_dia				= 31
				elseif ll_mes=11 and ll_dia>30 then 
					ll_dia				= 30
				elseif ll_mes=12 and ll_dia>31 then 
					ll_dia				= 31
				end if
				ls_fec_ult			= string(ll_dia,"00")+'/'+string(ll_mes,"00")+'/'+string(ll_ano,"0000")
				ld_fec_ult			= date(ls_fec_ult)
				ldt_fecha				= datetime(ld_fec_ult)
				this.setitem(1,'sol_repacta_cvta_fecrep_ult_vcto',ld_fec_ult)
				this.accepttext()
				if il_nro_cta <= il_cta_pag_s then
					ld_fecha_vcto	= ld_fec_ult
				else
					ld_fecha_vcto	= funcion_venc( ldt_fec_prim_vcto, il_cta_pag_s )
				end if
				this.setitem(1,'sol_repacta_cvta_fecha_prox_vcto',ld_fecha_vcto)
				ll_dias_mas			= DaysAfter(date(gdt_fec_sistema), ld_fecha_vcto)
				if ll_dias_mas > ll_dias_tope then	//100 then 
					messagebox("Advertencia","Recuerde Fecha Próximo Vencimiento corresponde "+string(ll_dias_mas) +" días más a la Fecha de hoy "+string(gdt_fec_sistema,'dd/mm/yyyy'))
					setnull(ld_fecha_vcto)
					setnull(ld_fec_ult)
					this.setitem(1,'sol_repacta_cvta_fecha_prox_vcto',ld_fecha_vcto)
					this.setitem(1,'sol_repacta_cvta_fecrep_ult_vcto',ld_fec_ult)
				end if
//				ld_fecha_tope		= RelativeDate(date(ldt_fec_venc_cred), ll_dias_tope) 
//				if ld_fecha_vcto > ld_fecha_tope then
//					messagebox("Advertencia","Fecha Prox. Vcto. debe ser Menor al "+string(ld_fecha_tope,"dd/mm/yyyy"))
//					setnull(ld_fecha_vcto)
//					setnull(ld_fec_ult)
//					this.setitem(1,'sol_repacta_cvta_fecha_prox_vcto',ld_fecha_vcto)
//					this.setitem(1,'sol_repacta_cvta_fecrep_ult_vcto',ld_fec_ult)
//				end if
				this.accepttext()
			else
				ll_dias_mas			= DaysAfter(date(gdt_fec_sistema), ld_fecha_vcto)
				if ll_dias_mas > ll_dias_tope then messagebox("Advertencia","Recuerde Fecha Próximo Vencimiento corresponde "+string(ll_dias_mas) +" días más a la Fecha de hoy "+string(gdt_fec_sistema,'dd/mm/yyyy'))
				if isnull(ld_fec_vcto_ori) or date(ld_fec_vcto_ori)=date("00/00/0000") then
					messagebox("Advertencia Fecha Repactación","No Registra Fecha 1er. Vencimiento")
				else
					messagebox("Advertencia","Fecha Inválida debe ser mayor al "+string(ld_fec_vcto_ori,"dd/mm/yyyy"))
				end if
				setnull(ld_fecha_vcto)
				setnull(ld_fec_ult)
				this.setitem(1,'sol_repacta_cvta_fecha_prox_vcto',ld_fecha_vcto)
				this.setitem(1,'sol_repacta_cvta_fecrep_ult_vcto',ld_fec_ult)
			end if
	END CHOOSE	

elseif this.dataobject='dw_form_resciliacion_por_reprogramacion' then
	CHOOSE CASE ls_columna
		CASE 'sol_rescilia_reprog_est_rut_cliente_3'
			ll_est_rut_3	= this.getitemnumber(1,'sol_rescilia_reprog_est_rut_cliente_3')
			if ll_est_rut_3=0 then
				this.setfocus()
				this.setcolumn('sol_rescilia_reprog_rut_cliente_3')
			end if
	END CHOOSE	
	
elseif this.dataobject='dw_formulario_modifica_antece_cliente' then
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
			ls_ciudad						= this.getitemstring(1,'sol_mod_antece_ciudad_nueva')
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle.retrieve(ls_ciudad)
			end if
		CASE 'sol_mod_antece_fono_p_nueva'
			ls_fono_p					= dw_reporte.getitemstring(1,'sol_mod_antece_fono_p_nueva')
			if not isnull(ls_fono_p) and ls_fono_p<>'' and ls_fono_p<>'-' then
				ll_fono_p_largo			= len(ls_fono_p)
				if ll_fono_p_largo > 9 then
					messagebox('Advertencia','No puede Ingresar más de 9 Digitos')
					dw_reporte.setitem(1,'sol_mod_antece_fono_p_nueva',is_fono_particular)
				elseif	ll_fono_p_largo < 9 then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos')
					dw_reporte.setitem(1,'sol_mod_antece_fono_p_nueva',is_fono_particular)
				else
					if Match(ls_fono_p, "[A-Z]+") then
						messagebox('Advertencia','Solo debe Ingresar Números')
						dw_reporte.setitem(1,'sol_mod_antece_fono_p_nueva',is_fono_particular)
					end if
				end if
			end if
		CASE 'sol_mod_antece_celular_nueva'
			ls_cel_p			= dw_reporte.getitemstring(1,'sol_mod_antece_celular_nueva')
			if not isnull(ls_cel_p) and ls_cel_p<>'' and ls_cel_p<>'-' then
				ll_largo_cel	= len(ls_cel_p)
				if ll_largo_cel >9  then
					messagebox('Advertencia','No puede Ingresar más de 9 Digitos')
					dw_reporte.setitem(1,'sol_mod_antece_celular_nueva',is_celular)
				elseif	ll_largo_cel < 9 then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos')
					dw_reporte.setitem(1,'sol_mod_antece_celular_nueva',is_celular)
				else
					if Match(ls_cel_p, "[A-Z]+") then
						messagebox('Advertencia','Solo debe Ingresar Números')
						dw_reporte.setitem(1,'sol_mod_antece_celular_nueva',is_celular)
					end if
				end if
			end if
		CASE 'sol_mod_antece_fono_c_nueva'
			ls_fono_c		= dw_reporte.getitemstring(1,'sol_mod_antece_fono_c_nueva')
			if not isnull(ls_fono_c) and ls_fono_c<>'' and ls_fono_c<>'-' then
				ll_fono_c_largo	= len(ls_fono_c)
				if ll_fono_c_largo >9  then
					messagebox('Advertencia','No puede Ingresar más de 9 Digitos')
					dw_reporte.setitem(1,'sol_mod_antece_fono_c_nueva',is_fono_c)
				elseif	ll_fono_c_largo < 9 then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos')
					dw_reporte.setitem(1,'sol_mod_antece_fono_c_nueva',is_fono_c)
				else
					if Match(ls_fono_c, "[A-Z]+") then
						messagebox('Advertencia','Solo debe Ingresar Números')
						dw_reporte.setitem(1,'sol_mod_antece_fono_c_nueva',is_fono_c)
					end if
				end if
			end if	
	END CHOOSE	

elseif this.dataobject='dw_form_mandato_pac' then
	CHOOSE CASE ls_columna
		CASE 'sol_pac_rut_titular', 'sol_pac_dv'
			ll_rut_tit	= this.getitemnumber(1,'sol_pac_rut_titular')
			ls_dv_tit	= this.getitemstring(1,'sol_pac_dv')
			if not isnull(ll_rut_tit) and ll_rut_tit > 0 and not isnull(ls_dv_tit) and ls_dv_tit <> '' then
				if String(ls_dv_tit) <> String(gf_obtener_dv(ll_rut_tit)) then
					messagebox('Error','El Rut no es Valido',stopsign!)
					this.setitem(1,'sol_pac_dv',ls_nulo)
					this.setfocus()
					this.setcolumn('sol_pac_dv')
				else
					this.setitem(1,'sol_pac_nombre',ls_nulo)
					this.setitem(1,'sol_pac_ap_paterno',ls_nulo)
					this.setitem(1,'sol_pac_ap_materno',ls_nulo)
					this.accepttext()
				end if
			end if
		CASE 'sol_pac_est_otro_1'
			ll_estado	= this.getitemnumber(1,'sol_pac_est_otro_1')
			if ll_estado=0 then
				this.setitem(1,'sol_pac_cual_obs_1','')
			end if
		CASE 'sol_pac_folio_mandato'
			ll_folio		= this.getitemnumber(1,'sol_pac_folio_mandato')
			if ll_folio>0 then
				il_folio_mandato ++
				SELECT	"CD_FOLIO"."ULT_ESTADO"  
				INTO 		:ll_ult_estado
				FROM 		"CD_FOLIO"  
				WHERE  ( "CD_FOLIO"."BASE" = 'S' ) AND  
						 ( "CD_FOLIO"."SERIE" = 'P' ) AND  
						 ( "CD_FOLIO"."NUMERO" = :ll_folio )   
				USING		sqlca;
				if sqlca.sqlcode<>0 then
					messagebox("Advertencia","Folio No Existe en Control Documentario")
					this.setitem(1,'sol_pac_folio_mandato',ll_nulo)
					this.accepttext()
				else
					if ll_ult_estado<>9 and ll_ult_estado<>16 then
						SELECT	"CD_ESTADO"."DESCRIPCION"  
						INTO 		:ls_descrip  
						FROM 		"CD_ESTADO"  
						WHERE 	"CD_ESTADO"."CODIGO" = :ll_ult_estado   
						USING		sqlca;
						messagebox("Advertencia","Folio No es Posible Asociarlo por Encontrarse en Estado: "+string(ll_ult_estado)+"-"+ls_descrip+", debe estar en Estado 9-ACEPTADO CONTRATO Y ENTREGA A DIGITACION o 16-ACEPTADO CTTO.POR DEPTO.AT.CLIENTE Y ENTREGAR A OPERA.")
						this.setitem(1,'sol_pac_folio_mandato',ll_nulo)
						this.accepttext()
					else
						SELECT	"SOL_PAC"."BASE",	"SOL_PAC"."SERIE",	"SOL_PAC"."NUMERO"  
						INTO 		:ls_base_aux,		:ls_serie_aux,			:ll_numero_aux  
						FROM 		"SOL_ESTATUS",	"SOL_PAC"  
						WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_PAC"."BASE" ) and  
								 ( "SOL_ESTATUS"."SERIE" = "SOL_PAC"."SERIE" ) and  
								 ( "SOL_ESTATUS"."NUMERO" = "SOL_PAC"."NUMERO" ) and  
								 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_PAC"."CORRELATIVO" ) and  
								 (("SOL_PAC"."BASE_MANDATO" = 'S' ) AND  
								 ( "SOL_PAC"."SERIE_MANDATO" = 'P' ) AND  
								 ( "SOL_PAC"."FOLIO_MANDATO" = :ll_folio ) AND  
								 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) and
								 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							messagebox("Advertencia","Folio Ya está Asociado al Contrato Nº "+ls_base_aux+"-"+ls_serie_aux+"-"+string(ll_numero_aux,'###,###,###,###,####'))
							this.setitem(1,'sol_pac_folio_mandato',ll_nulo)
							this.accepttext()
						end if
					end if
				end if
			end if
			this.accepttext()		
	END CHOOSE	
elseif this.dataobject='dw_formulario_bono_fraternal' then
	CHOOSE CASE ls_columna
		CASE 'sol_bono_fraterno_fecha_defuncion'
			ldt_fecha		= this.getitemdatetime(1,'sol_bono_fraterno_fecha_defuncion')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_bono_fraterno_fecha_defuncion',ldt_fecha_crea)
				this.accepttext()
			end if

		CASE 'sol_bono_fraterno_fecha_actual'
			ldt_fecha		= this.getitemdatetime(1,'sol_bono_fraterno_fecha_actual')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_bono_fraterno_fecha_actual',ldt_fecha_crea)
				this.accepttext()
			end if
			
		CASE 'sol_bono_fraterno_ciudad_contacto'
			ls_ciudad	= dw_reporte.getitemstring(1,'sol_bono_fraterno_ciudad_contacto')
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle.retrieve(ls_ciudad)
			end if
			if ls_ciudad='999' then
				dw_reporte.setitem(1,'comuna','999')
			end if
			if ls_ciudad='0' then
				dw_reporte.setitem(1,'comuna','0')
			end if
	END CHOOSE
elseif this.dataobject='dw_formulario_mantencion_perpetua' then
	CHOOSE CASE ls_columna
		CASE 'sol_mant_perpetua_fecha_defuncion'
			ldt_fecha		= this.getitemdatetime(1,'sol_mant_perpetua_fecha_defuncion')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_mant_perpetua_fecha_defuncion',ldt_fecha_crea)
				this.accepttext()
			end if

		CASE 'sol_mant_perpetua_fecha_actual'
			ldt_fecha		= this.getitemdatetime(1,'sol_mant_perpetua_fecha_actual')
			ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
			if isnull(ldt_fecha) then 
				messagebox("Advertencia","Fecha Invalida")
				this.setitem(1,'sol_mant_perpetua_fecha_actual',ldt_fecha_crea)
				this.accepttext()
			end if
			
		CASE 'sol_mant_perpetua_ciudad_contacto'
			ls_ciudad	= dw_reporte.getitemstring(1,'sol_mant_perpetua_ciudad_contacto')
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle.retrieve(ls_ciudad)
			end if
			if ls_ciudad='999' then
				dw_reporte.setitem(1,'comuna','999')
			end if
			if ls_ciudad='0' then
				dw_reporte.setitem(1,'comuna','0')
			end if
	END CHOOSE			
end if
this.accepttext()
end event

event itemfocuschanged;datetime	ldt_fecha, ldt_fecha_crea,ld_fec_vcto_ori,ld_fec_ult,ld_fecha_vcto,ldt_fecha_cobro,ldt_fecha_cobro_mant,ldt_nulo,ldt_fecha_prim_m,&
			ldt_fecha_prox_vcto_m,ldt_fecha_prim_30
Time		lt_hora
Long		ll_nulo,ll_ult_estado,ll_rut_tit,ll_rut_ben,ll_count,ll_fono_p_largo,ls_cel_largo,ll_fono_c_largo,ll_cuotas_pie,ll_mora_original,ll_plazo_m,ll_sw
String		ls_estado_reg,ls_columna,ls_base_aux,ls_serie_aux,ls_dv_tit,ls_nulo,ls_dv_ben,ls_estado_ctto,ls_descrip,ls_fono_p,ls_cel,ls_fono_c
Double	ldb_monto_cred,ldb_monto_mant,ll_folio,ll_numero_aux,ldb_valor_cuota_m,ldb_monto_pie_m,ldb_valor

dw_reporte.accepttext()
lt_hora	= time("00:00:00")
Setnull(ll_nulo);Setnull(ls_nulo)
if this.dataobject='dw_form_reactivacion_ctto_resuelto' then
	ldt_fecha		= this.getitemdatetime(1,'sol_reactiva_fecha_actual')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_reactiva_fecha_actual',ldt_fecha_crea)
		this.accepttext()
	end if
elseif dw_reporte.dataobject='dw_form_cambio_en_demanda' then
	ls_estado_ctto	= dw_reporte.getitemstring(1,'sol_en_demanda_estado_ctto_final')
	if not isnull(ls_estado_ctto) then
		ls_descrip							= f_buscar_sol_tipo_contrato(ls_estado_ctto)
		dw_reporte.object.t_titulo.text	= ls_descrip
		dw_reporte.accepttext()
	end if
elseif this.dataobject='dw_formulario_compromiso_pago' and il_modif > 0 then
	ldt_fecha_prim_m			= dw_reporte.getitemdatetime(1,'sol_compromiso_pago_fecha_prim_mant')
	ldt_fecha_prox_vcto_m	= dw_reporte.getitemdatetime(1,'sol_compromiso_pago_fecvta_1_vcto')
	if ldt_fecha_prim_m <= gdt_fec_sistema then
		ldt_fecha_prim_30		= datetime(RelativeDate ( date(gdt_fec_sistema), 30 ),time('00:00:00'))
		dw_reporte.setitem(1,'sol_compromiso_pago_fecha_prim_mant',ldt_fecha_prim_30)
	end if
	ll_cuotas_pie				= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_pie_mant')
	if ll_cuotas_pie > 0 then
		ll_mora_original			= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_mora_original')
		ldb_valor_cuota_m		= dw_reporte.getitemnumber(1,'sol_compromiso_pago_monto_cuota_mant')
		ll_plazo_m					= ll_mora_original - ll_cuotas_pie
		ldb_monto_pie_m			= round(ll_cuotas_pie * ldb_valor_cuota_m,2)
		if ll_cuotas_pie > ll_mora_original then
			dw_reporte.setitem(1,'sol_compromiso_pago_cuotas_pie_mant',1)
		end if
	end if
	ll_plazo_m					= dw_reporte.getitemnumber(1,'sol_compromiso_pago_plazo_mant')
	ll_cuotas_pie				= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_pie_mant')
	ll_mora_original			= dw_reporte.getitemnumber(1,'sol_compromiso_pago_cuotas_mora_original')
	if ll_plazo_m > 0 and ll_cuotas_pie > 0 and ll_mora_original > 0 then
		if ll_plazo_m > ll_mora_original - ll_cuotas_pie then
			ll_plazo_m				= ll_mora_original - ll_cuotas_pie
			dw_reporte.setitem(1,'sol_compromiso_pago_plazo_mant',ll_plazo_m)
		end if
	end if
	ll_sw							= dw_reporte.getitemnumber(1,'sol_compromiso_pago_sw_dscto_mora_pagar')	//long(data)
	if ll_sw = 0 then
		dw_reporte.setitem(1,'sol_compromiso_pago_mora_pagar_mant',0)
	else
		ldb_valor					= dw_reporte.getitemnumber(1,'sol_compromiso_pago_mora_pagar_mant_ori')
		dw_reporte.setitem(1,'sol_compromiso_pago_mora_pagar_mant',ldb_valor)
	end if
	ll_sw							= dw_reporte.getitemnumber(1,'sol_compromiso_pago_sw_dscto_gasto_pagar')
	if ll_sw = 0 then
		dw_reporte.setitem(1,'sol_compromiso_pago_gasto_pagar_mant',0)
	else
		ldb_valor					= dw_reporte.getitemnumber(1,'sol_compromiso_pago_gasto_pagar_mant_ori')
		dw_reporte.setitem(1,'sol_compromiso_pago_gasto_pagar_mant',ldb_valor)
	end if
	dw_reporte.accepttext()
elseif this.dataobject='dw_formulario_seguro_fallecimiento' and il_modif > 0 then
	ll_rut_ben	= dw_reporte.getitemnumber(1,'sol_seguro_fallece_rut_benef')
	ls_dv_ben	= trim(dw_reporte.getitemstring(1,'sol_seguro_fallece_dv_benef'))
	if ll_rut_ben > 0 and not isnull(ls_dv_ben) then 
		if String(ls_dv_ben) <> String(gf_obtener_dv(ll_rut_ben)) then
			dw_reporte.SetItem(1, "sol_seguro_fallece_dv_benef",ls_nulo)
			dw_reporte.setfocus()
			dw_reporte.setcolumn('sol_seguro_fallece_dv_benef')
		else
			SELECT	Count("SOL_SEGURO_FALLECE"."BASE")
			INTO 		:ll_count  
			FROM 		"SOL_SEGURO_FALLECE",   
						"SOL_ESTATUS"  
			WHERE  ( "SOL_SEGURO_FALLECE"."BASE" = "SOL_ESTATUS"."BASE" ) and  
					 ( "SOL_SEGURO_FALLECE"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
					 ( "SOL_SEGURO_FALLECE"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
					 ( "SOL_SEGURO_FALLECE"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
					 (("SOL_ESTATUS"."CODIGO_SOLICITUD" = '22' ) AND  
					 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
					 ( "SOL_SEGURO_FALLECE"."BASE" = :is_base ) AND  
					 ( "SOL_SEGURO_FALLECE"."SERIE" = :is_serie ) AND  
					 ( "SOL_SEGURO_FALLECE"."NUMERO" = :il_numero ) AND  
					 ( "SOL_SEGURO_FALLECE"."RUT_BENEF" = :ll_rut_ben ) AND  
					 ( "SOL_SEGURO_FALLECE"."DV_BENEF" = :ls_dv_ben ) )   
			USING		sqlca;
			if ll_count > 0 then
				dw_reporte.SetItem(1, "sol_seguro_fallece_dv_benef",ls_nulo)
				dw_reporte.accepttext()
				dw_reporte.setfocus()
				dw_reporte.setcolumn('sol_seguro_fallece_dv_benef')
			else
				SELECT	Count("BENEFICIARIOS_SEGURO"."BASE")
				INTO 		:ll_count  
				FROM 		"BENEFICIARIOS_SEGURO"  
				WHERE  ( "BENEFICIARIOS_SEGURO"."BASE" = :is_base ) AND  
						 ( "BENEFICIARIOS_SEGURO"."SERIE" = :is_serie ) AND  
						 ( "BENEFICIARIOS_SEGURO"."NUMERO" = :il_numero ) AND  
						 ( "BENEFICIARIOS_SEGURO"."RUT" = :ll_rut_ben ) AND  
						 ( "BENEFICIARIOS_SEGURO"."DV" = :ls_dv_ben ) AND  
						 ( "BENEFICIARIOS_SEGURO"."CODIGO_SEGURO" = 5 ) AND  
						 ( "BENEFICIARIOS_SEGURO"."CODIGO_SEGURO_DETALLE" = 1 )   
				USING		sqlca;
				if ll_count =0 then
					dw_reporte.SetItem(1, "sol_seguro_fallece_dv_benef",ls_nulo)
					dw_reporte.accepttext()
					dw_reporte.setfocus()
					dw_reporte.setcolumn('sol_seguro_fallece_dv_benef')
				end if

			end if
		end if
	end if
elseif this.dataobject='dw_form_resciliacion_por_parte_cliente' then
	ldt_fecha		= this.getitemdatetime(1,'sol_rescilia_cliente_fecha_actual')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_rescilia_cliente_fecha_actual',ldt_fecha_crea)
		this.accepttext()
	end if
elseif this.dataobject='dw_form_resciliacion_por_reprogramacion' then
	ldt_fecha		= this.getitemdatetime(1,'sol_rescilia_reprog_fecha_actual')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_rescilia_reprog_fecha_actual',ldt_fecha_crea)
		this.accepttext()
	end if
elseif this.dataobject='dw_form_titulo_de_dominio' then
	ldt_fecha		= this.getitemdatetime(1,'sol_tit_dominio_fecha_actual')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_tit_dominio_fecha_actual',ldt_fecha_crea)
		this.accepttext()
	end if
elseif this.dataobject='dw_form_contrato_definitivo' then
	ldt_fecha		= this.getitemdatetime(1,'sol_contrato_def_fecha_actual')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_contrato_def_fecha_actual',ldt_fecha_crea)
		this.accepttext()
	end if
elseif this.dataobject='dw_form_entrega_de_pagare' then
	ldt_fecha		= this.getitemdatetime(1,'sol_entrega_pag_fecha_actual')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_entrega_pag_fecha_actual',ldt_fecha_crea)
		this.accepttext()
	end if
//elseif this.dataobject='dw_form_transferencia' then
//	ldt_fecha		= this.getitemdatetime(1,'sol_transferencia_fecha_actual')
//	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
//	if isnull(ldt_fecha) then 
//		this.setitem(1,'sol_transferencia_fecha_actual',ldt_fecha_crea)
//		this.accepttext()
//	end if
elseif this.dataobject='dw_formulario_seguro_desgravamen' then
	ldt_fecha		= this.getitemdatetime(1,'sol_seguro_desg_fecha_defuncion')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_seguro_desg_fecha_defuncion',ldt_fecha_crea)
		this.accepttext()
	end if
	
	ldt_fecha		= this.getitemdatetime(1,'sol_seguro_desg_fecha_actual')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_seguro_desg_fecha_actual',ldt_fecha_crea)
		this.accepttext()
	end if
	
elseif this.dataobject='dw_formulario_seguro' then
	ldt_fecha		= this.getitemdatetime(1,'sol_seguro_fecha_defuncion')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_seguro_fecha_defuncion',ldt_fecha_crea)
		this.accepttext()
	end if
	
	ldt_fecha		= this.getitemdatetime(1,'sol_seguro_fecha_actual')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_seguro_fecha_actual',ldt_fecha_crea)
		this.accepttext()
	end if
	
elseif this.dataobject='dw_formulario_repacta_o_compraventa' then
	ldt_fecha		= this.getitemdatetime(1,'sol_repacta_cvta_fecha_solicitud')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_repacta_cvta_fecha_solicitud',ldt_fecha_crea)
		this.accepttext()
	end if
	
	ldt_fecha		= this.getitemdatetime(1,'sol_repacta_cvta_fecha_compra')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_repacta_cvta_fecha_compra',ldt_fecha_crea)
		
		this.accepttext()
	end if
	// valida fecha ingresadas
	ldt_fecha			= this.getitemdatetime(1,'sol_repacta_cvta_fecrep_1_vcto')
	ld_fec_vcto_ori	= this.getitemdatetime(1,'sol_repacta_cvta_fecvta_1_vcto')
	if ldt_fecha > ld_fec_vcto_ori then
		ld_fec_ult		= this.getitemdatetime(1,'sol_repacta_cvta_fecrep_ult_vcto')
		if date(ld_fec_ult) < idt_fecha_hoy then
//			setnull(ld_fecha_vcto)
//			setnull(ld_fec_ult)
//			this.setitem(1,'sol_repacta_cvta_fecha_prox_vcto',ld_fecha_vcto)
//			this.setitem(1,'sol_repacta_cvta_fecrep_ult_vcto',ld_fec_ult)
		end if
	else
		setnull(ld_fecha_vcto)
		setnull(ld_fec_ult)
		this.setitem(1,'sol_repacta_cvta_fecha_prox_vcto',ld_fecha_vcto)
		this.setitem(1,'sol_repacta_cvta_fecrep_ult_vcto',ld_fec_ult)
	end if
	
elseif this.dataobject='dw_formulario_modifica_antece_cliente' then
	ldt_fecha		= this.getitemdatetime(1,'sol_mod_antece_fecha_nac_nueva')
	ldt_fecha_crea	= datetime(date(ldt_fecha),lt_hora)
	if isnull(ldt_fecha) then 
		setnull(ldt_fecha);setnull(ldt_fecha_crea)
		this.setitem(1,'sol_mod_antece_fecha_nac_nueva',ldt_fecha_crea)
		this.accepttext()
		this.setcolumn("sol_mod_antece_fecha_nac_nueva")
	end if
	
	ls_columna		= dwo.name
	if ls_columna <>  'sol_mod_antece_fono_p_nueva' then
		ls_fono_p	= dw_reporte.getitemstring(1,'sol_mod_antece_fono_p_nueva')
		if not isnull(ls_fono_p) and ls_fono_p<>'' and ls_fono_p<>'-' then
			ll_fono_p_largo				= len(ls_fono_p)
			if ll_fono_p_largo > 9  then
				dw_reporte.setitem(1,'sol_mod_antece_fono_p_nueva',is_fono_particular)
			elseif	ll_fono_p_largo < 9  then
				dw_reporte.setitem(1,'sol_mod_antece_fono_p_nueva',is_fono_particular)
			elseif ls_fono_p <> '0' then
				if Match(ls_fono_p, "[A-Z]+") then
					dw_reporte.setitem(1,'sol_mod_antece_fono_p_nueva',is_fono_particular)
				end if
			end if
		end if
	end if
	if ls_columna <>  'sol_mod_antece_celular_nueva' then
		ls_cel	= dw_reporte.getitemstring(1,'sol_mod_antece_celular_nueva')
		if not isnull(ls_cel) and ls_cel<>'' and ls_cel<>'-' then
			ls_cel_largo				= len(ls_cel)
			if ls_cel_largo >9  then
				dw_reporte.setitem(1,'sol_mod_antece_celular_nueva',is_celular)
			elseif	ls_cel_largo < 9  then
				dw_reporte.setitem(1,'sol_mod_antece_celular_nueva',is_celular)
			elseif 	 ls_cel <> '0' then
				if Match(ls_cel, "[A-Z]+") then
					dw_reporte.setitem(1,'sol_mod_antece_celular_nueva',is_celular)
				end if
			end if
		end if
	end if
	if ls_columna <>  'sol_mod_antece_fono_c_nueva' then
		ls_fono_c	= dw_reporte.getitemstring(1,'sol_mod_antece_fono_c_nueva')
		if not isnull(ls_fono_c) and ls_fono_c <> '' and ls_fono_c <> '-' then
			ll_fono_c_largo				= len(ls_fono_c)
			if ll_fono_c_largo >9  then
				dw_reporte.setitem(1,'sol_mod_antece_fono_c_nueva',is_fono_c)
			elseif	ll_fono_c_largo < 9  then
				dw_reporte.setitem(1,'sol_mod_antece_fono_c_nueva',is_fono_c)
			elseif ls_fono_c <> '0' then
				if Match(ls_fono_c, "[A-Z]+") then
					dw_reporte.setitem(1,'sol_mod_antece_fono_c_nueva',is_fono_c)
				end if
			end if
		end if
	end if
	
elseif this.dataobject = 'dw_form_mandato_pac' then
	this.accepttext()
	ls_columna				= this.GetColumnName ( )
	ll_folio					= this.getitemnumber(1,'sol_pac_folio_mandato')
	ldt_fecha_cobro		= this.getitemdatetime(1,'sol_pac_fecha_cobro_pac')
	ldt_fecha_cobro_mant	= this.getitemdatetime(1,'sol_pac_fecha_cobro_pac_mant')
	ldb_monto_cred			= this.getitemnumber(1,'sol_pac_monto_cuota_cred')
	ldb_monto_mant			= this.getitemnumber(1,'sol_pac_monto_cuota_mant')
	ll_rut_tit				= this.getitemnumber(1,'sol_pac_rut_titular')
	ls_dv_tit				= this.getitemstring(1,'sol_pac_dv')
	if not isnull(ll_rut_tit) and ll_rut_tit > 0 and not isnull(ls_dv_tit) and ls_dv_tit <> '' then
		if String(ls_dv_tit) <> String(gf_obtener_dv(ll_rut_tit)) then
			this.setitem(1,'sol_pac_dv',ls_nulo)
			this.setfocus()
			this.setcolumn('sol_pac_dv')
		end if
	end if
	if ll_folio > 0 and il_folio_mandato > 0 then
		SELECT	"CD_FOLIO"."ULT_ESTADO"  
		INTO 		:ll_ult_estado
		FROM 		"CD_FOLIO"  
		WHERE  ( "CD_FOLIO"."BASE" = 'S' ) AND  
				 ( "CD_FOLIO"."SERIE" = 'P' ) AND  
				 ( "CD_FOLIO"."NUMERO" = :ll_folio )   
		USING		sqlca;
		if sqlca.sqlcode<>0 then
			this.setitem(1,'sol_pac_folio_mandato',ll_nulo)
			this.setcolumn('sol_pac_folio_mandato')
		else
			if ll_ult_estado<>9 and ll_ult_estado<>16 then
				this.setitem(1,'sol_pac_folio_mandato',ll_nulo)
				this.setcolumn('sol_pac_folio_mandato')
			else
				SELECT	"SOL_PAC"."BASE",	"SOL_PAC"."SERIE",	"SOL_PAC"."NUMERO"  
				INTO 		:ls_base_aux,		:ls_serie_aux,			:ll_numero_aux  
				FROM 		"SOL_ESTATUS",	"SOL_PAC"  
				WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_PAC"."BASE" ) and  
						 ( "SOL_ESTATUS"."SERIE" = "SOL_PAC"."SERIE" ) and  
						 ( "SOL_ESTATUS"."NUMERO" = "SOL_PAC"."NUMERO" ) and  
						 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_PAC"."CORRELATIVO" ) and  
						 (("SOL_PAC"."BASE_MANDATO" = 'S' ) AND  
						 ( "SOL_PAC"."SERIE_MANDATO" = 'P' ) AND  
						 ( "SOL_PAC"."FOLIO_MANDATO" = :ll_folio ) AND  
						 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol ) and
						 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					this.setitem(1,'sol_pac_folio_mandato',ll_nulo)
					this.accepttext()
				end if
			end if
		end if
		this.accepttext()
	end if
	if isnull(ldt_fecha_cobro) or string(ldt_fecha_cobro,'dd/mm/yyyy')='00/00/0000' or &
		string(ldt_fecha_cobro,'dd/mm/yyyy')='01/01/1900' then 
		this.setitem(1,'sol_pac_monto_cuota_cred',ll_nulo)
		this.accepttext()
	elseif isnull(ldt_fecha_cobro_mant) or string(ldt_fecha_cobro_mant,'dd/mm/yyyy')='00/00/0000' or &
		string(ldt_fecha_cobro_mant,'dd/mm/yyyy')='01/01/1900' then
		this.setitem(1,'sol_pac_monto_cuota_mant',ll_nulo)
		this.accepttext()
	elseif isnull(ldb_monto_cred) or ldb_monto_cred=0 then 
		this.setitem(1,'sol_pac_fecha_cobro_pac',ldt_nulo)
		this.accepttext()
	elseif isnull(ldb_monto_mant) or ldb_monto_mant=0 then 
		this.setitem(1,'sol_pac_fecha_cobro_pac_mant',ldt_nulo)
		this.accepttext()
	end if
	if ls_columna<>'sol_pac_folio_mandato' and ls_columna<>'sol_pac_fecha_actual' then
		if isnull(ll_folio) or ll_folio=0 then
			this.setcolumn('sol_pac_folio_mandato')
		end if
	end if
elseif this.dataobject='dw_formulario_bono_fraternal' then
	ldt_fecha		= this.getitemdatetime(1,'sol_bono_fraterno_fecha_defuncion')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_bono_fraterno_fecha_defuncion',ldt_fecha_crea)
		this.accepttext()
	end if
	
	ldt_fecha		= this.getitemdatetime(1,'sol_bono_fraterno_fecha_actual')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_bono_fraterno_fecha_actual',ldt_fecha_crea)
		this.accepttext()
	end if
elseif this.dataobject='dw_formulario_mantencion_perpetua' then
	ldt_fecha		= this.getitemdatetime(1,'sol_mant_perpetua_fecha_defuncion')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_mant_perpetua_fecha_defuncion',ldt_fecha_crea)
		this.accepttext()
	end if
	
	ldt_fecha		= this.getitemdatetime(1,'sol_mant_perpetua_fecha_actual')
	ldt_fecha_crea	= datetime(idt_fecha_hoy,now())
	if isnull(ldt_fecha) then 
		this.setitem(1,'sol_mant_perpetua_fecha_actual',ldt_fecha_crea)
		this.accepttext()
	end if	
end if

end event

event dberror;return(0)
end event

event clicked;string		ls_columna,ls_string,ls_dv,ls_estado,ls_base_aux,ls_fecha,ls_nombre
Long		ll_rut,ll_est_ope,ll_est_inf,ll_cuotas_pie,ll_mora_original,ll_plazo
Double	ll_monto_pie,ldb_uf_dia,ldb_valor_cuota,ldb_interes,ldb_gasto
Datetime	ldt_fecha_prim,ldt_fecha_sol

dw_reporte.accepttext()
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'b_detalle'
		if isvalid(w_detalle_compromiso_pago) then close(w_detalle_compromiso_pago)
		if dw_reporte.dataobject='dw_formulario_compromiso_pago' then
			SELECT	"SOL_COMPROMISO_PAGO"."BASE"  
			INTO 		:ls_base_aux  
			FROM 	"SOL_COMPROMISO_PAGO"  
			WHERE  ( "SOL_COMPROMISO_PAGO"."BASE" = :is_base ) AND  
					 ( "SOL_COMPROMISO_PAGO"."SERIE" = :is_serie ) AND  
					 ( "SOL_COMPROMISO_PAGO"."NUMERO" = :il_numero ) AND  
					 ( "SOL_COMPROMISO_PAGO"."CORRELATIVO" = :il_correlativo )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				ll_rut					= this.getitemnumber(1,'sol_compromiso_pago_rut_titular')
				ls_dv					= trim(this.getitemstring(1,'sol_compromiso_pago_dv'))
				ls_estado			= trim(this.getitemstring(1,'sol_estatus_estado_reg'))
				ls_nombre			= this.getitemstring(1,'sol_compromiso_pago_nombre_cliente')
				ldt_fecha_prim		= this.getitemdatetime(1,'sol_compromiso_pago_fecha_prim_mant')
				ll_cuotas_pie		= this.getitemnumber(1,'sol_compromiso_pago_cuotas_pie_mant')
				ll_monto_pie		= this.getitemnumber(1,'sol_compromiso_pago_monto_pie_mant')
				ldb_uf_dia			= this.getitemnumber(1,'sol_compromiso_pago_uf_dia')
				ldb_valor_cuota	= this.getitemnumber(1,'sol_compromiso_pago_monto_cuota_mant')
				ll_mora_original	= this.getitemnumber(1,'sol_compromiso_pago_cuotas_mora_original')
				ldb_interes			= this.getitemnumber(1,'sol_compromiso_pago_mora_pagar_mant')
				ldb_gasto			= this.getitemnumber(1,'sol_compromiso_pago_gasto_pagar_mant')
				ll_plazo				= this.getitemnumber(1,'sol_compromiso_pago_plazo_mant')
				ldt_fecha_sol		= this.getitemdatetime(1,'sol_compromiso_pago_fecha_solicitud')
				if isnull(ldb_interes) then ldb_interes=0
				if isnull(ldb_gasto) then ldb_gasto=0
				if isnull(ls_estado) or ls_estado='' then ls_estado='A'
				if ll_est_inf=0 and ll_est_ope=0 then ls_estado='Z'		
				if ll_rut > 0 then
					if isnull(ldb_interes) then ldb_interes=0
					if isnull(ldb_gasto) then ldb_gasto=0
					ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(ll_rut)+'~t'+string(il_correlativo)+'~t'+ls_dv+'~t'+ls_estado+'~t'+is_tipo_sol+'~t'+ls_nombre+'~t'+string(ldt_fecha_prim,'dd/mm/yyyy')+'~t'+string(ll_cuotas_pie)+'~t'+string(ll_monto_pie)+'~t'+string(ldb_uf_dia)+'~t'+ string(ldb_valor_cuota)+'~t'+string(ll_mora_original)+'~t'+string(ldb_interes)+'~t'+string(ldb_gasto)+'~t'+string(il_ctas_pag_m)+'~t'+string(ll_plazo)+'~t'+string(ldt_fecha_sol,'dd/mm/yyyy')
					openwithparm(w_detalle_compromiso_pago,ls_string)
				else
					messagebox("Advertencia","Antes de Ingresar Detalle Pago, debe Grabar Solicitud Compromiso")
				end if
			else
				messagebox("Advertencia","Antes de Ingresar Detalle Pago, debe Grabar Solicitud Compromiso")
			end if
		end if
		
	CASE 'b_cliente'
		if dw_reporte.dataobject='dw_form_transferencia' then
			SELECT	"SOL_TRANSFERENCIA"."BASE"  
			INTO 		:ls_base_aux  
			FROM 	"SOL_TRANSFERENCIA"  
			WHERE  ( "SOL_TRANSFERENCIA"."BASE" = :is_base ) AND  
					 ( "SOL_TRANSFERENCIA"."SERIE" = :is_serie ) AND  
					 ( "SOL_TRANSFERENCIA"."NUMERO" = :il_numero ) AND  
					 ( "SOL_TRANSFERENCIA"."CORRELATIVO" = :il_correlativo )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				ll_rut			= this.getitemnumber(1,'sol_transferencia_rut_titular')
				ls_dv			= trim(this.getitemstring(1,'sol_transferencia_dv'))
				ls_estado	= trim(this.getitemstring(1,'sol_estatus_estado_reg'))
				ll_est_ope	= this.getitemnumber(1,'sol_transferencia_estatus_operaciones')
				ll_est_inf		= this.getitemnumber(1,'sol_transferencia_estatus_informatica')
				if isnull(ls_estado) or ls_estado='' then ls_estado='A'
				if ll_est_inf=0 and ll_est_ope=0 then ls_estado='Z'		
				if ll_rut>0 then
					ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(ll_rut)+'~t'+string(il_correlativo)+'~t'+ls_dv+'~t'+'S'+'~t'+ls_estado+'~t'+is_tipo_sol
					openwithparm(w_ingreso_nuevo_beneficiario,ls_string)
				else
					messagebox("Advertencia","Cliente Original Inválido")
				end if
			else
				messagebox("Advertencia","Debe Grabar Solicitud antes de Ingresar Cliente a Transferir")
			end if
		
		elseif dw_reporte.dataobject='dw_form_novacion' then
			SELECT	"SOL_NOVACION"."BASE"  
			INTO 		:ls_base_aux  
			FROM 		"SOL_NOVACION"  
			WHERE  ( "SOL_NOVACION"."BASE" = :is_base ) AND  
					 ( "SOL_NOVACION"."SERIE" = :is_serie ) AND  
					 ( "SOL_NOVACION"."NUMERO" = :il_numero ) AND  
					 ( "SOL_NOVACION"."CORRELATIVO" = :il_correlativo )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				ll_rut		= this.getitemnumber(1,'sol_novacion_rut_titular')
				ls_dv			= trim(this.getitemstring(1,'sol_novacion_dv'))
				ls_estado	= trim(this.getitemstring(1,'sol_estatus_estado_reg'))
				ll_est_ope	= this.getitemnumber(1,'sol_novacion_estatus_operaciones')
				ll_est_inf	= this.getitemnumber(1,'sol_novacion_estatus_informatica')
				if isnull(ls_estado) or ls_estado='' then ls_estado='A'
				if ll_est_inf=0 and ll_est_ope=0 then ls_estado='Z'		
				if ll_rut>0 then
					ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(ll_rut)+'~t'+string(il_correlativo)+'~t'+ls_dv+'~t'+'S'+'~t'+ls_estado+'~t'+is_tipo_sol
					openwithparm(w_ingreso_nuevo_beneficiario,ls_string)
				else
					messagebox("Advertencia","Cliente Original Inválido")
				end if
			else
				messagebox("Advertencia","Debe Grabar Solicitud antes de Ingresar Cliente a Transferir")
			end if 
		elseif dw_reporte.dataobject='dw_form_posesion_efectiva' then
			SELECT	"SOL_POS_EFEC"."BASE"  
			INTO 		:ls_base_aux  
			FROM 		"SOL_POS_EFEC"  
			WHERE  ( "SOL_POS_EFEC"."BASE" = :is_base ) AND  
					 ( "SOL_POS_EFEC"."SERIE" = :is_serie ) AND  
					 ( "SOL_POS_EFEC"."NUMERO" = :il_numero ) AND  
					 ( "SOL_POS_EFEC"."CORRELATIVO" = :il_correlativo )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
				ll_rut		= this.getitemnumber(1,'sol_pos_efec_rut_titular')
				ls_dv			= trim(this.getitemstring(1,'sol_pos_efec_dv'))
				ls_estado	= trim(this.getitemstring(1,'sol_estatus_estado_reg'))
				ll_est_ope	= this.getitemnumber(1,'sol_pos_efec_estatus_operaciones')
				ll_est_inf	= this.getitemnumber(1,'sol_pos_efec_estatus_informatica')
				if isnull(ls_estado) or ls_estado='' then ls_estado='A'
				if ll_est_inf=0 and ll_est_ope=0 then ls_estado='Z'		
				if ll_rut>0 then
					ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(ll_rut)+'~t'+string(il_correlativo)+'~t'+ls_dv+'~t'+'S'+'~t'+ls_estado+'~t'+is_tipo_sol
					openwithparm(w_ingreso_nuevo_beneficiario2,ls_string)
				else
					messagebox("Advertencia","Cliente Original Inválido")
				end if
			else
				messagebox("Advertencia","Debe Grabar Solicitud antes de Ingresar Herederos")
			end if 
		end if
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
	CASE 'p_fecha_notario'
		ls_fecha	= string(date(this.getitemdatetime(1,'sol_ultima_voluntad_fecha_tramite_notari')))
		if isnull(ls_fecha) then ls_fecha = string(idt_fecha_hoy,"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			this.setitem(1,'sol_ultima_voluntad_fecha_tramite_notari',date(string(idt_fecha_hoy,gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			this.setitem(1,'sol_ultima_voluntad_fecha_tramite_notari',date(ls_fecha))
		END IF
	
	CASE 'b_asegurado'
		if isvalid(w_detalle_asegurados_fallecimiento) then close(w_detalle_asegurados_fallecimiento)
		ll_rut		= this.getitemnumber(1,'sol_seguro_fallece_rut_titular')
		ls_dv			= trim(this.getitemstring(1,'sol_seguro_fallece_dv'))
		ls_estado	= trim(this.getitemstring(1,'sol_estatus_estado_reg'))
		ll_est_ope	= this.getitemnumber(1,'sol_seguro_fallece_estatus_operaciones')
		ll_est_inf	= this.getitemnumber(1,'sol_seguro_fallece_estatus_informatica')
		if il_numero>0 then
			ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)
			openwithparm(w_detalle_asegurados_fallecimiento,ls_string)
		else
			messagebox("Advertencia","Nº Contrato Inválido")
		end if
END CHOOSE
this.accepttext()
end event

event itemerror;return(1)
end event

type cb_actualiza_datos from commandbutton within w_mantencion_fromulario_solicitudes
boolean visible = false
integer x = 905
integer y = 2040
integer width = 663
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar Antecedente"
end type

event clicked;String	ls_string,ls_dv, ls_nombre, ls_a_pat,ls_a_mat,ls_direc_p,ls_pob,ls_sector,&
			ls_comuna,ls_ciudad,ls_fono_p,ls_celular,ls_fono_c,ls_domic_c,ls_est_civil,&
			ls_otro_fono_p,ls_otro_fono_c,ls_est_reg,ls_base_aux,ls_tipo_via,ls_nro_part,&
			ls_depto_part,ls_block_part
Long		ll_rut,ll_tot_renta,ll_grupo_f, ll_est_ope, ll_est_inf
Date		ld_fec_nac
if isvalid(w_actualiza_datos_cliente) then close(w_actualiza_datos_cliente)
CHOOSE CASE is_tipo_sol
	CASE "1"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_rescilia_cliente_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_rescilia_cliente_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_nombre')
		ll_rut				= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_rescilia_cliente_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_rescilia_cliente_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_rescilia_cliente_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_rescilia_cliente_poblacion')
		ls_sector			= dw_reporte.getitemstring(1,'sol_rescilia_cliente_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_comuna')
		ls_ciudad			= dw_reporte.getitemstring(1,'sol_rescilia_cliente_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_rescilia_cliente_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_rescilia_cliente_fecha_nac'))
		ll_tot_renta		= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_grupo_f')
		ls_est_civil		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_rescilia_cliente_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_rescilia_cliente_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_estatus_operacion')
		ll_est_inf			= dw_reporte.getitemnumber(1,'sol_rescilia_cliente_estatus_informatica')

	CASE "2"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_rescilia_reprog_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_rescilia_reprog_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_rescilia_reprog_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_rescilia_reprog_poblacion')
		ls_sector		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_comuna')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_rescilia_reprog_fecha_nac'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_grupo_f')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_rescilia_reprog_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_rescilia_reprog_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_estatus_operacion')
		ll_est_inf		= dw_reporte.getitemnumber(1,'sol_rescilia_reprog_estatus_informatica')
		
	CASE "3"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_reactiva_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_reactiva_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_reactiva_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_reactiva_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_reactiva_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_reactiva_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_reactiva_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_reactiva_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_reactiva_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_reactiva_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_reactiva_poblacion')
		ls_sector		= dw_reporte.getitemstring(1,'sol_reactiva_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_reactiva_comuna')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_reactiva_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_reactiva_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_reactiva_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_reactiva_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_reactiva_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_reactiva_fecha_nac'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_reactiva_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_reactiva_grupo_f')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_reactiva_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_reactiva_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_reactiva_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_reactiva_estatus_operacion')
		ll_est_inf		= dw_reporte.getitemnumber(1,'sol_reactiva_estatus_informatica')

	CASE "4"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_seguro_desg_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_seguro_desg_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_seguro_desg_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_seguro_desg_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_seguro_desg_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_seguro_desg_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_seguro_desg_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_seguro_desg_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_seguro_desg_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_seguro_desg_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_seguro_desg_poblacion')
		ls_sector		= dw_reporte.getitemstring(1,'sol_seguro_desg_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_seguro_desg_comuna')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_seguro_desg_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_seguro_desg_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_seguro_desg_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_seguro_desg_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_seguro_desg_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_seguro_desg_fecha_nac'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_seguro_desg_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_seguro_desg_grupo_f')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_seguro_desg_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_seguro_desg_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_seguro_desg_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_seguro_desg_estatus_operaciones')
		ll_est_inf		= dw_reporte.getitemnumber(1,'sol_seguro_desg_estatus_informatica')
		
	CASE "5"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_repacta_cvta_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_repacta_cvta_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_repacta_cvta_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_repacta_cvta_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_repacta_cvta_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_repacta_cvta_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_repacta_cvta_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_repacta_cvta_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_repacta_cvta_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_repacta_cvta_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_repacta_cvta_poblacion')
		ls_sector		= dw_reporte.getitemstring(1,'sol_repacta_cvta_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_repacta_cvta_comuna')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_repacta_cvta_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_repacta_cvta_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_repacta_cvta_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_repacta_cvta_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_repacta_cvta_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_repacta_cvta_fecha_nac'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_repacta_cvta_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_repacta_cvta_grupo_f')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_repacta_cvta_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_repacta_cvta_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_repacta_cvta_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_repacta_cvta_estatus_operacion')
		ll_est_inf		= dw_reporte.getitemnumber(1,'sol_repacta_cvta_estatus_informatica')
	
	CASE "6"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_tit_dominio_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_tit_dominio_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_tit_dominio_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_tit_dominio_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_tit_dominio_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_tit_dominio_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_tit_dominio_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_tit_dominio_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_tit_dominio_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_tit_dominio_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_tit_dominio_poblacion')
		ls_sector		= dw_reporte.getitemstring(1,'sol_tit_dominio_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_tit_dominio_comuna')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_tit_dominio_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_tit_dominio_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_tit_dominio_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_tit_dominio_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_tit_dominio_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_tit_dominio_fecha_nac'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_tit_dominio_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_tit_dominio_grupo_f')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_tit_dominio_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_tit_dominio_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_tit_dominio_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_tit_dominio_estatus_operaciones')
		ll_est_inf		= dw_reporte.getitemnumber(1,'sol_tit_dominio_estatus_informatica')
		
	CASE "7"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_contrato_def_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_contrato_def_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_contrato_def_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_contrato_def_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_contrato_def_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_contrato_def_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_contrato_def_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_contrato_def_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_contrato_def_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_contrato_def_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_contrato_def_poblacion')
		ls_sector		= dw_reporte.getitemstring(1,'sol_contrato_def_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_contrato_def_comuna')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_contrato_def_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_contrato_def_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_contrato_def_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_contrato_def_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_contrato_def_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_contrato_def_fecha_nac'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_contrato_def_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_contrato_def_grupo_f')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_contrato_def_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_contrato_def_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_contrato_def_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_contrato_def_estatus_operaciones')
		ll_est_inf		= dw_reporte.getitemnumber(1,'sol_contrato_def_estatus_informatica')
		
	CASE "8"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_entrega_pag_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_entrega_pag_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_entrega_pag_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_entrega_pag_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_entrega_pag_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_entrega_pag_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_entrega_pag_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_entrega_pag_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_entrega_pag_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_entrega_pag_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_entrega_pag_poblacion')
		ls_sector		= dw_reporte.getitemstring(1,'sol_entrega_pag_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_entrega_pag_comuna')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_entrega_pag_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_entrega_pag_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_entrega_pag_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_entrega_pag_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_entrega_pag_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_entrega_pag_fecha_nac'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_entrega_pag_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_entrega_pag_grupo_f')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_entrega_pag_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_entrega_pag_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_entrega_pag_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_entrega_pag_estatus_operaciones')
		ll_est_inf		= dw_reporte.getitemnumber(1,'sol_entrega_pag_estatus_informatica')
		
	CASE "10"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_transferencia_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_transferencia_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_transferencia_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_transferencia_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_transferencia_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_transferencia_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_transferencia_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_transferencia_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_transferencia_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_transferencia_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_transferencia_poblacion')
		ls_sector		= dw_reporte.getitemstring(1,'sol_transferencia_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_transferencia_comuna')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_transferencia_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_transferencia_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_transferencia_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_transferencia_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_transferencia_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_transferencia_fecha_nac'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_transferencia_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_transferencia_grupo_f')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_transferencia_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_transferencia_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_transferencia_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_transferencia_estatus_operaciones')
		ll_est_inf		= dw_reporte.getitemnumber(1,'sol_transferencia_estatus_informatica')
		
	CASE "11"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_resolucion_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_resolucion_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_resolucion_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_resolucion_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_resolucion_dv_titular')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_resolucion_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_resolucion_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_resolucion_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_resolucion_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_resolucion_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_resolucion_poblacion')
		ls_sector		= dw_reporte.getitemstring(1,'sol_resolucion_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_resolucion_comuna')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_resolucion_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_resolucion_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_resolucion_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_resolucion_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_resolucion_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_resolucion_fecha_nac'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_resolucion_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_resolucion_grupo_f')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_resolucion_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_resolucion_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_resolucion_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_resolucion_estatus_operacion')
		ll_est_inf		= dw_reporte.getitemnumber(1,'sol_resolucion_estatus_informatica')
		
	CASE "13"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_cambio_estado_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_cambio_estado_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_cambio_estado_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_cambio_estado_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_cambio_estado_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_cambio_estado_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_cambio_estado_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_cambio_estado_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_cambio_estado_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_cambio_estado_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_cambio_estado_poblacion')
		ls_sector		= dw_reporte.getitemstring(1,'sol_cambio_estado_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_cambio_estado_comuna')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_cambio_estado_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_cambio_estado_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_cambio_estado_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_cambio_estado_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_cambio_estado_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_cambio_estado_fecha_nac'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_cambio_estado_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_cambio_estado_grupo_f')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_cambio_estado_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_cambio_estado_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_cambio_estado_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_cambio_estado_estatus_operacion')
		ll_est_inf		= dw_reporte.getitemnumber(1,'sol_cambio_estado_estatus_informatica')
		
	CASE "15"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_seguro_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_seguro_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_seguro_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_seguro_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_seguro_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_seguro_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_seguro_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_seguro_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_seguro_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_seguro_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_seguro_poblacion')
		ls_sector		= dw_reporte.getitemstring(1,'sol_seguro_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_seguro_comuna')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_seguro_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_seguro_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_seguro_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_seguro_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_seguro_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_seguro_fecha_nac'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_seguro_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_seguro_grupo_f')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_seguro_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_seguro_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_seguro_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_seguro_estatus_operacion')
		ll_est_inf		= dw_reporte.getitemnumber(1,'sol_seguro_estatus_informatica')
		
	CASE "16"
		ls_a_pat			= dw_reporte.getitemstring(1,'sol_novacion_ap_paterno')
		ls_a_mat			= dw_reporte.getitemstring(1,'sol_novacion_ap_materno')
		ls_nombre		= dw_reporte.getitemstring(1,'sol_novacion_nombre')
		ll_rut			= dw_reporte.getitemnumber(1,'sol_novacion_rut_titular')
		ls_dv				= dw_reporte.getitemstring(1,'sol_novacion_dv')
		ls_direc_p		= dw_reporte.getitemstring(1,'sol_novacion_direccion_p')
		ls_tipo_via		= dw_reporte.getitemstring(1,'sol_novacion_tipo_via')
		ls_nro_part		= dw_reporte.getitemstring(1,'sol_novacion_numero_particular')
		ls_depto_part	= dw_reporte.getitemstring(1,'sol_novacion_depto_particular')
		ls_block_part	= dw_reporte.getitemstring(1,'sol_novacion_block_particular')
		ls_pob			= dw_reporte.getitemstring(1,'sol_novacion_poblacion')
		ls_sector		= dw_reporte.getitemstring(1,'sol_novacion_sector')
		ls_comuna		= dw_reporte.getitemstring(1,'sol_novacion_comuna')
		ls_ciudad		= dw_reporte.getitemstring(1,'sol_novacion_ciudad')
		ls_fono_p		= dw_reporte.getitemstring(1,'sol_novacion_fono_p')
		ls_otro_fono_p	= dw_reporte.getitemstring(1,'sol_novacion_otro_fono_p')
		ls_domic_c		= dw_reporte.getitemstring(1,'sol_novacion_domicilio_c')
		ls_fono_c		= dw_reporte.getitemstring(1,'sol_novacion_fono_c')
		ld_fec_nac		= date(dw_reporte.getitemdatetime(1,'sol_novacion_fecha_nac'))
		ll_tot_renta	= dw_reporte.getitemnumber(1,'sol_novacion_total_renta')
		ll_grupo_f		= dw_reporte.getitemnumber(1,'sol_novacion_grupo_f')
		ls_est_civil	= dw_reporte.getitemstring(1,'sol_novacion_estado_civil')
		ls_celular		= dw_reporte.getitemstring(1,'sol_novacion_celular')
		ls_otro_fono_c	= dw_reporte.getitemstring(1,'sol_novacion_otro_fono_c')
		ll_est_ope		= dw_reporte.getitemnumber(1,'sol_novacion_estatus_operaciones')
		ll_est_inf		= dw_reporte.getitemnumber(1,'sol_novacion_estatus_informatica')
END CHOOSE
ls_est_reg	= dw_reporte.getitemstring(1,'sol_estatus_estado_reg')
if isnull(ls_a_pat) 			then ls_a_pat			= ''
if isnull(ls_a_mat) 			then ls_a_mat			= ''
if isnull(ls_nombre) 		then ls_nombre			= ''
if isnull(ll_rut) 			then ll_rut				= 0
if isnull(ls_dv) 				then ls_dv				= ''
if isnull(ls_direc_p) 		then ls_direc_p		= ''
if isnull(ls_tipo_via) 		then ls_tipo_via		= ''
if isnull(ls_nro_part) 		then ls_nro_part		= ''
if isnull(ls_depto_part) 	then ls_depto_part	= ''
if isnull(ls_block_part) 	then ls_block_part	= ''
if isnull(ls_pob) 			then ls_pob				= ''
if isnull(ls_sector) 		then ls_sector			= ''
if isnull(ls_comuna) 		then ls_comuna			= ''
if isnull(ls_ciudad) 		then ls_ciudad			= ''
if isnull(ls_fono_p) 		then ls_fono_p			= ''
if isnull(ls_otro_fono_p) 	then ls_otro_fono_p	= ''
if isnull(ls_domic_c) 		then ls_domic_c		= ''
if isnull(ls_fono_c) 		then ls_fono_c			= ''
if isnull(ll_tot_renta) 	then ll_tot_renta		= 0
if isnull(ll_grupo_f) 		then ll_grupo_f		= 0
if isnull(ls_est_civil) 	then ls_est_civil		= ''
if isnull(ls_celular) 		then ls_celular		= ''
if isnull(ls_otro_fono_c) 	then ls_otro_fono_c	= ''
if isnull(ls_est_reg)		then ls_est_reg		= 'A'
if isnull(ld_fec_nac)		then ld_fec_nac		= date('00/00/0000')
SELECT	"SOL_ESTATUS"."BASE"  
INTO 		:ls_base_aux  
FROM 		"SOL_ESTATUS"  
WHERE 	( "SOL_ESTATUS"."BASE" = :is_base ) AND  
			( "SOL_ESTATUS"."SERIE" = :is_serie ) AND  
			( "SOL_ESTATUS"."NUMERO" = :il_numero ) AND  
			( "SOL_ESTATUS"."CORRELATIVO" = :il_correlativo ) AND  
			( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol )   
Using		sqlca;
if sqlca.sqlcode=0 then
	ls_string	= ls_a_pat+'~t'+ls_a_mat+'~t'+ls_nombre+'~t'+string(ll_rut)+'~t'+ls_dv+'~t'+ls_direc_p+'~t'+&
					  ls_pob+'~t'+ls_sector+'~t'+ls_comuna+'~t'+ls_ciudad+'~t'+ls_fono_p+'~t'+ls_otro_fono_p+'~t'+&
					  ls_domic_c+'~t'+ls_fono_c+'~t'+string(ld_fec_nac)+'~t'+string(ll_tot_renta)+'~t'+string(ll_grupo_f)+'~t'+&
					  ls_est_civil+'~t'+ls_celular+'~t'+ls_otro_fono_c+'~t'+is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+&
					  is_tipo_sol+'~t'+string(il_correlativo)+'~t'+ls_est_reg+'~t'+string(ll_est_ope)+'~t'+string(ll_est_inf)+'~t'+&
					  ls_tipo_via+'~t'+ls_nro_part+'~t'+ls_depto_part+'~t'+ls_block_part
	openwithparm(w_actualiza_datos_cliente,ls_string)
else
	messagebox("Advertencia","Antes de Modificar Antecedentes del Cliente debe Grabar Solicitud")
end if
end event

type dw_ingreso_coprop from datawindow within w_mantencion_fromulario_solicitudes
boolean visible = false
integer x = 32
integer y = 1376
integer width = 3534
integer height = 596
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_coprop_promesa_detalle"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_pasa
Long		ll_new,ll_resp,ll_indi,ll_tot_reg,ll_rut

ls_columna						= dwo.name
if row>0 then
	il_row_coprop				= row
	dw_ingreso_coprop.SelectRow(0, FALSE)
	dw_ingreso_coprop.SelectRow(il_row_coprop, TRUE)
else
	CHOOSE CASE ls_columna
		CASE 't_insertar'
			ls_pasa				= 'S'
			ll_tot_reg			= dw_ingreso_coprop.rowcount()
			if ll_tot_reg=5 then
				messagebox("Advertencia","Solo es Posible Ingresar 5 Copropietario")
			else
				if ll_tot_reg>0 then
					for ll_indi=1 to ll_tot_reg
						ll_rut		= dw_ingreso_coprop.getitemnumber(ll_indi,'rut_coprop')
						ls_dv			= dw_ingreso_coprop.getitemstring(ll_indi,'dv_coprop')
						ls_nom		= dw_ingreso_coprop.getitemstring(ll_indi,'nombres_coprop')
						ls_ap_pat	= dw_ingreso_coprop.getitemstring(ll_indi,'ap_pat_coprop')
						ls_ap_mat	= dw_ingreso_coprop.getitemstring(ll_indi,'ap_mat_coprop')
						if ll_rut=0 or isnull(ll_rut) then
							messagebox("Advertencia","Debe Ingresar Rut en Fila Nº "+string(ll_indi))
							dw_ingreso_coprop.scrolltorow(ll_indi)
							dw_ingreso_coprop.setcolumn('rut_coprop')
							ls_pasa	= 'N'
						elseif ls_dv='' or isnull(ls_dv) then
							messagebox("Advertencia","Debe Ingresar Dv en Fila Nº "+string(ll_indi))
							dw_ingreso_coprop.scrolltorow(ll_indi)
							dw_ingreso_coprop.setcolumn('dv_coprop')
							ls_pasa	= 'N'
						elseif ls_nom='' or isnull(ls_nom) then
							messagebox("Advertencia","Debe Ingresar Nombre(s) en Fila Nº "+string(ll_indi))
							dw_ingreso_coprop.scrolltorow(ll_indi)
							dw_ingreso_coprop.setcolumn('nombres_coprop')
							ls_pasa	= 'N'
						elseif ls_ap_pat='' or isnull(ls_ap_pat) then
							messagebox("Advertencia","Debe Ingresar Apellido Paterno en Fila Nº "+string(ll_indi))
							dw_ingreso_coprop.scrolltorow(ll_indi)
							dw_ingreso_coprop.setcolumn('ap_pat_coprop')
							ls_pasa	= 'N'
						elseif ls_ap_mat='' or isnull(ls_ap_mat) then
							messagebox("Advertencia","Debe Ingresar Apellido Materno en Fila Nº "+string(ll_indi))
							dw_ingreso_coprop.scrolltorow(ll_indi)
							dw_ingreso_coprop.setcolumn('ap_mat_coprop')
							ls_pasa	= 'N'
						end if
					next
				end if
				if ls_pasa='S' then
					ll_new				= dw_ingreso_coprop.insertrow(0)
					dw_ingreso_coprop.scrolltorow(ll_new)
					dw_ingreso_coprop.setitem(ll_new,'base',is_base)
					dw_ingreso_coprop.setitem(ll_new,'serie',is_serie)
					dw_ingreso_coprop.setitem(ll_new,'numero',il_numero)
					dw_ingreso_coprop.setitem(ll_new,'correlativo',il_correlativo)
					dw_ingreso_coprop.setitem(ll_new,'estado_reg','A')
					dw_ingreso_coprop.setcolumn('rut_coprop')
				end if
			end if
			
		CASE 't_eliminar'
			if dw_ingreso_coprop.rowcount()>0 then
				if il_row_coprop>0 then
					ll_resp	= messagebox("Eliminar","Está seguro de Eliminar CoPropietario",Exclamation!,YesNo!,2)
					if ll_resp=1 then
						dw_ingreso_coprop.deleterow(il_row_coprop)
						messagebox("Advertencia","Recuerde Grabar antes de Salir")
						if dw_ingreso_coprop.rowcount()>0 then
							dw_ingreso_coprop.scrolltorow(1)
							il_row_coprop	= 1
						end if
					end if
				end if
			end if
	END CHOOSE

end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row_coprop	= getrow()
	dw_ingreso_coprop.SelectRow(0, FALSE)
	dw_ingreso_coprop.SelectRow(il_row_coprop, TRUE)
end if
end event

event itemchanged;String	ls_columna,ls_dv_co
Long		ll_rut_co

dw_ingreso_coprop.accepttext()
ls_columna		= dwo.name
il_row_coprop	= row
if ls_columna='rut_coprop' then
	ll_rut_co	= dw_ingreso_coprop.getitemnumber(il_row_coprop,'rut_coprop')
	ls_dv_co		= dw_ingreso_coprop.getitemstring(il_row_coprop,'dv_coprop')
	if ll_rut_co>0 and isnull(ls_dv_co) or ls_dv_co<>'' then
		if String(ls_dv_co) <> String(gf_obtener_dv(ll_rut_co)) then
			messagebox('Error','El Rut no es valido',stopsign!)
			dw_ingreso_coprop.SetItem(il_row_coprop, "rut_coprop",0)
			dw_ingreso_coprop.SetItem(il_row_coprop, "dv_coprop",'')
			dw_ingreso_coprop.setfocus()
			dw_ingreso_coprop.setcolumn('rut_coprop')
		else
			dw_ingreso_coprop.setfocus()
			dw_ingreso_coprop.setcolumn('dv_coprop')
		end if
		dw_ingreso_coprop.accepttext()
	end if
elseif ls_columna='dv_coprop' then
	ll_rut_co	= dw_ingreso_coprop.getitemnumber(il_row_coprop,'rut_coprop')
	ls_dv_co		= dw_ingreso_coprop.getitemstring(il_row_coprop,'dv_coprop')
	if ll_rut_co>0 and isnull(ls_dv_co) or ls_dv_co<>'' then
		if String(ls_dv_co) <> String(gf_obtener_dv(ll_rut_co)) then
			messagebox('Error','El Rut no es valido',stopsign!)
			dw_ingreso_coprop.SetItem(il_row_coprop, "rut_coprop",0)
			dw_ingreso_coprop.SetItem(il_row_coprop, "dv_coprop",'')
			dw_ingreso_coprop.setfocus()
			dw_ingreso_coprop.setcolumn('rut_coprop')
		else
			dw_ingreso_coprop.setfocus()
			dw_ingreso_coprop.setcolumn('nombres_coprop')
		end if
		dw_ingreso_coprop.accepttext()
	end if
end if
end event

