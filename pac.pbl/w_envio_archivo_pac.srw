forward
global type w_envio_archivo_pac from window
end type
type sle_1 from uo_convierte_numero within w_envio_archivo_pac
end type
type dw_boleta from datawindow within w_envio_archivo_pac
end type
type dw_recupera_uni from datawindow within w_envio_archivo_pac
end type
type dw_recupera_pac from datawindow within w_envio_archivo_pac
end type
type tab_1 from tab within w_envio_archivo_pac
end type
type tabpage_1 from userobject within tab_1
end type
type cb_ord_envio from commandbutton within tabpage_1
end type
type cb_filtrar_envio from commandbutton within tabpage_1
end type
type cb_mantenedor from commandbutton within tabpage_1
end type
type cb_exportar_archivo from commandbutton within tabpage_1
end type
type cb_proceso from picturebutton within tabpage_1
end type
type p_2 from picture within tabpage_1
end type
type em_fec_fin from editmask within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type p_1 from picture within tabpage_1
end type
type em_fec_ini from editmask within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type dw_lista_envio_archivo_pac from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_ord_envio cb_ord_envio
cb_filtrar_envio cb_filtrar_envio
cb_mantenedor cb_mantenedor
cb_exportar_archivo cb_exportar_archivo
cb_proceso cb_proceso
p_2 p_2
em_fec_fin em_fec_fin
st_2 st_2
p_1 p_1
em_fec_ini em_fec_ini
st_4 st_4
dw_lista_envio_archivo_pac dw_lista_envio_archivo_pac
end type
type tabpage_2 from userobject within tab_1
end type
type cb_exp_rec from commandbutton within tabpage_2
end type
type cb_ord_rec from commandbutton within tabpage_2
end type
type cb_filtrar_rec from commandbutton within tabpage_2
end type
type cb_grabar from commandbutton within tabpage_2
end type
type cb_proceso_rec from picturebutton within tabpage_2
end type
type p_4 from picture within tabpage_2
end type
type em_fec_fin_rec from editmask within tabpage_2
end type
type st_6 from statictext within tabpage_2
end type
type p_3 from picture within tabpage_2
end type
type em_fec_ini_rec from editmask within tabpage_2
end type
type st_5 from statictext within tabpage_2
end type
type dw_recupera_archivo from datawindow within tabpage_2
end type
type dw_cargar from datawindow within tabpage_2
end type
type cb_recupera from commandbutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_exp_rec cb_exp_rec
cb_ord_rec cb_ord_rec
cb_filtrar_rec cb_filtrar_rec
cb_grabar cb_grabar
cb_proceso_rec cb_proceso_rec
p_4 p_4
em_fec_fin_rec em_fec_fin_rec
st_6 st_6
p_3 p_3
em_fec_ini_rec em_fec_ini_rec
st_5 st_5
dw_recupera_archivo dw_recupera_archivo
dw_cargar dw_cargar
cb_recupera cb_recupera
end type
type tabpage_4 from userobject within tab_1
end type
type cb_grabar_rechazo from commandbutton within tabpage_4
end type
type cb_exportar_no_ap from commandbutton within tabpage_4
end type
type cb_filtrar_no_ap from commandbutton within tabpage_4
end type
type cb_ord_no_ap from commandbutton within tabpage_4
end type
type cb_proceso_no from picturebutton within tabpage_4
end type
type p_hasta from picture within tabpage_4
end type
type em_fec_fin_hasta from editmask within tabpage_4
end type
type st_hasta from statictext within tabpage_4
end type
type p_desde from picture within tabpage_4
end type
type em_fec_ini_no from editmask within tabpage_4
end type
type st_desde from statictext within tabpage_4
end type
type dw_no_aplicar from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cb_grabar_rechazo cb_grabar_rechazo
cb_exportar_no_ap cb_exportar_no_ap
cb_filtrar_no_ap cb_filtrar_no_ap
cb_ord_no_ap cb_ord_no_ap
cb_proceso_no cb_proceso_no
p_hasta p_hasta
em_fec_fin_hasta em_fec_fin_hasta
st_hasta st_hasta
p_desde p_desde
em_fec_ini_no em_fec_ini_no
st_desde st_desde
dw_no_aplicar dw_no_aplicar
end type
type tabpage_3 from userobject within tab_1
end type
type cb_exportar from commandbutton within tabpage_3
end type
type dw_errores from datawindow within tabpage_3
end type
type cb_ordenar from commandbutton within tabpage_3
end type
type cb_filtrar from commandbutton within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_exportar cb_exportar
dw_errores dw_errores
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
end type
type tabpage_5 from userobject within tab_1
end type
type cb_grabar_man from commandbutton within tabpage_5
end type
type cb_exp_uni from commandbutton within tabpage_5
end type
type cb_ord_uni from commandbutton within tabpage_5
end type
type cb_filtrar_uni from commandbutton within tabpage_5
end type
type cb_cargar_uni from commandbutton within tabpage_5
end type
type dw_lista_universo from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
cb_grabar_man cb_grabar_man
cb_exp_uni cb_exp_uni
cb_ord_uni cb_ord_uni
cb_filtrar_uni cb_filtrar_uni
cb_cargar_uni cb_cargar_uni
dw_lista_universo dw_lista_universo
end type
type tabpage_6 from userobject within tab_1
end type
type cb_exportar_pag_env from commandbutton within tabpage_6
end type
type cb_ord_pag_envio from commandbutton within tabpage_6
end type
type cb_filtrar_pag_envio from commandbutton within tabpage_6
end type
type cb_proceso_env from picturebutton within tabpage_6
end type
type p_26 from picture within tabpage_6
end type
type em_fec_fin_env from editmask within tabpage_6
end type
type st_26 from statictext within tabpage_6
end type
type p_16 from picture within tabpage_6
end type
type em_fec_ini_env from editmask within tabpage_6
end type
type st_46 from statictext within tabpage_6
end type
type dw_lista_pagos_enviados from datawindow within tabpage_6
end type
type tabpage_6 from userobject within tab_1
cb_exportar_pag_env cb_exportar_pag_env
cb_ord_pag_envio cb_ord_pag_envio
cb_filtrar_pag_envio cb_filtrar_pag_envio
cb_proceso_env cb_proceso_env
p_26 p_26
em_fec_fin_env em_fec_fin_env
st_26 st_26
p_16 p_16
em_fec_ini_env em_fec_ini_env
st_46 st_46
dw_lista_pagos_enviados dw_lista_pagos_enviados
end type
type tabpage_7 from userobject within tab_1
end type
type cb_filtrar_mora from commandbutton within tabpage_7
end type
type cb_ord_mora from commandbutton within tabpage_7
end type
type cb_exp_mora from commandbutton within tabpage_7
end type
type cb_actualizar from commandbutton within tabpage_7
end type
type dw_pac_mora from datawindow within tabpage_7
end type
type tabpage_7 from userobject within tab_1
cb_filtrar_mora cb_filtrar_mora
cb_ord_mora cb_ord_mora
cb_exp_mora cb_exp_mora
cb_actualizar cb_actualizar
dw_pac_mora dw_pac_mora
end type
type tab_1 from tab within w_envio_archivo_pac
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_4 tabpage_4
tabpage_3 tabpage_3
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type
type dw_print_mant from datawindow within w_envio_archivo_pac
end type
type dw_print_cred from datawindow within w_envio_archivo_pac
end type
type cb_print from commandbutton within w_envio_archivo_pac
end type
type dw_pac_detalle from datawindow within w_envio_archivo_pac
end type
type dw_envio_archivo_pac_mant from datawindow within w_envio_archivo_pac
end type
type cb_cuenta_corriente from commandbutton within w_envio_archivo_pac
end type
type cb_limpiar from commandbutton within w_envio_archivo_pac
end type
type cb_cerrar from commandbutton within w_envio_archivo_pac
end type
type dw_envio_archivo_pac_cred from datawindow within w_envio_archivo_pac
end type
type gb_1 from groupbox within w_envio_archivo_pac
end type
end forward

global type w_envio_archivo_pac from window
integer width = 4050
integer height = 2108
boolean titlebar = true
string title = "Pago Automático de Cuenta  PAC"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
sle_1 sle_1
dw_boleta dw_boleta
dw_recupera_uni dw_recupera_uni
dw_recupera_pac dw_recupera_pac
tab_1 tab_1
dw_print_mant dw_print_mant
dw_print_cred dw_print_cred
cb_print cb_print
dw_pac_detalle dw_pac_detalle
dw_envio_archivo_pac_mant dw_envio_archivo_pac_mant
cb_cuenta_corriente cb_cuenta_corriente
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
dw_envio_archivo_pac_cred dw_envio_archivo_pac_cred
gb_1 gb_1
end type
global w_envio_archivo_pac w_envio_archivo_pac

type variables
Long		il_row,il_row_rec,il_row_no,il_row_uni,il_row_env
Date		idt_fecha_hoy
String	named
string 	is_pasa,is_tipo_mov
end variables

forward prototypes
public function string wf_moneda (string as_base, string as_serie, double al_numero)
public subroutine wf_genera_be_pac (double adb_uf, long al_fila, string as_tipo_mov, datetime adt_fecha_pago)
public subroutine wf_validar_pagos_be (long al_fila, datetime adt_fecha_pago)
protected subroutine wf_pagos_pac (string as_base, string as_serie, long al_numero, long al_indi)
public function double wf_valor_cred_cta_corr (string as_base, string as_serie, double al_numero)
public subroutine wf_email_rechazo_pac (long al_indice, string as_base, string as_serie, double ad_numero, string as_cod_rechazo)
end prototypes

public function string wf_moneda (string as_base, string as_serie, double al_numero);String	ls_moneda

CHOOSE CASE as_base
	CASE 'O'
		SELECT	"PAGO_OFERTA"."MONEDA"  
		INTO 		:ls_moneda  
		FROM 		"CADENA",	"OFERTA_V", 	"PAGO_OFERTA"  
		WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

	CASE 'C'
		SELECT	"CONTRATO"."MONEDA"  
		INTO 		:ls_moneda  
		FROM 		"CADENA",   "CONTRATO"  
		WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
				 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) )   ;

	CASE 'L'
		SELECT	"PAGO_LIBERADOR"."MONEDA"  
		INTO 		:ls_moneda  
		FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
		WHERE  ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
				 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
				 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
				 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
				 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

	CASE 'P'
		SELECT	"PAGARE"."MONEDA"  
		INTO 		:ls_moneda  
		FROM 		"CADENA",	"PAGARE"  
		WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
				 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

	CASE 'A'
		SELECT	"PAGO_AUMENTO"."MONEDA"  
		INTO 		:ls_moneda  
		FROM 		"ANEXO_AUMENTO",	"CADENA",			"PAGO_AUMENTO"  
		WHERE  ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
				 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
				 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
				 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
				 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

	CASE 'R'
		SELECT	"REPACTA_MANTENCION"."TIPO_MONEDA"  
		INTO 		:ls_moneda  
		FROM 		"CADENA",	"REPACTA_MANTENCION"  
		WHERE  ( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
				 ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

END CHOOSE
Return ls_moneda
end function

public subroutine wf_genera_be_pac (double adb_uf, long al_fila, string as_tipo_mov, datetime adt_fecha_pago);Long		ll_new_reg,ll_cod_parque,ll_tot_reg,ll_indi,ll_cantidad,ll_monto,ll_total,ll_res,ll_can_cta_cred,ll_tot_filas,ll_reg,ll_ctas_pag,ll_mora,ll_gasto_cob,ll_corre,&
			ls_sum_monto,ll_count_reg,ll_min_boleta,ll_grupo,ll_otros,ll_cod_seguro,ll_total_neto,ll_pos,ll_cero=0,ll_sumar_todo,ll_sum_dscto,&
			ll_total_iva,ll_suma_total,ll_sub_total,ll_rut_rez,ll_cupon,ll_con_paga,ll_vuelto,ll_efectivo,ll_mora_mant,ll_gasto_mant,ll_monto_cuota,ll_monto_interes,&
			ll_ctas_pag_c,ll_ctas_pag_m,ll_ctas_pag_la,ll_ctas_pag_isa,ll_plazo,ll_count_pend,ll_cant_folio_p= 1000,ll_count_seguro,ll_monto_seguro_4,ll_monto_seguro_6,&
			ll_monto_cuota_aux,ll_count_seg,ll_monto_seg,ll_neto,ll_exento,ll_iva
String		ls_string_boleta,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_nro,ls_depto,ls_block,ls_comuna,ls_ciudad,ls_tipo_dte,ls_nom_comp,&
			ls_direc_comp,ls_indica_serv,ls_direc_origen,ls_comuna_origen,ls_ciudad_origen,ls_rut,ls_celular,ls_fono_part,ls_email,ls_contacto,ls_tot_pag_pal,&
			ls_tipo_cob,ls_tipo_cob_otro,ls_descrip_cobro,ls_descrip_otro,ls_nombre_archivo,ls_obs_1,ls_rut_empresa,ls_monto_desc,ls_tipo_codigo,ls_cod_pago,&
			ls_cuota,ls_moneda_ctto,ls_base_rezago,ls_serie_rezago,ls_nombre_rez,ls_ap_pat_rez,ls_ap_mat_rez,ls_ciudad_rez,ls_comuna_rez,ls_direc_rez,&
			ls_nom_comp_rez,ls_nom_rez,ls_ruta_elect,ls_dv_rez,ls_tip_cob,ls_moneda,ls_con_paga,ls_vuelto,ls_efectivo,ls_forma_pago,ls_tipo_mov,as_cuota,as_cuota_mant,&
			as_doc,as_paga_con,ls_tipo_mov_aux,ls_moneda_seg,ls_fecha_pago_palabra,ls_nro_contrato,ls_paga_con,ls_proximo_pago,ls_monto_total_palabra,ls_pago_ef,&
			ls_pago_ch,ls_pago_tc,ls_pago_td
Double	ldb_prima,ldb_iva_factura,ll_monto_uf,ldb_prima_uf,ll_numero_rezago,ll_monto_cta,ll_monto_cta_m,ll_uf_seguro_4,ll_uf_seguro_6,ld_mora_uf,lbd_tot_cob,ll_suma_seg
Datetime	ldt_fec_venc_cred,ldt_fec_venc_mant
SaveAsType TipoArchivo

SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
gd_hoy				= datetime(String(idt_fecha_hoy, "dd/mm/yyyy 00:00:00"))
dw_boleta.reset()
ls_indica_serv		= '3'
gs_caja				= 'CP' //as_caja
ls_tipo_mov			= as_tipo_mov

gs_base				= tab_1.tabpage_2.dw_cargar.getitemstring(al_fila,'base')
gs_serie				= tab_1.tabpage_2.dw_cargar.getitemstring(al_fila,'serie')
gi_numero			= tab_1.tabpage_2.dw_cargar.getitemnumber(al_fila,'numero')
gi_rut					= tab_1.tabpage_2.dw_cargar.getitemnumber(al_fila,'rut')
ll_cupon				= tab_1.tabpage_2.dw_cargar.getitemnumber(al_fila,'numero_cupon')
ll_cod_parque		= tab_1.tabpage_2.dw_cargar.getitemnumber(al_fila,'cadena_cod_parque')
ll_monto_cuota		= tab_1.tabpage_2.dw_cargar.getitemnumber(al_fila,'monto_pago')

as_doc				= gs_base + gs_serie + string(gi_numero)
if ls_tipo_mov='E' and (gs_base='O' or (gs_base='P' and ll_cod_parque <> 101 )) then
	ls_tip_cob		= 'CI'
else	
	ls_tip_cob		= 'BE'
end if	
ll_monto_interes	= 0
ll_gasto_cob			= 0
setnull(ll_count_seg)

////
SELECT	"CADENA_MORA"."FECHA_VENC_CRED",		"CADENA_MORA"."FECHA_VENC_MANT"
INTO 		:ldt_fec_venc_cred,								:ldt_fec_venc_mant
FROM 	"CADENA",	"CADENA_MORA"  
WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
		  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
		  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
		  (("CADENA"."CODIGO" = :gs_base ) AND  
		  ( "CADENA"."SERIE" = :gs_serie ) AND  
		  ( "CADENA"."NUMERO" = :gi_numero ) )  
USING	sqlca;
SELECT	"MEMBRETE_EMPRESA"."DIRECCION",	"MEMBRETE_EMPRESA"."COMUNA_OFICINA",	"MEMBRETE_EMPRESA"."CIUDAD",	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."RUTA_ELECT"
INTO 		:ls_direc_origen,								:ls_comuna_origen,									:ls_ciudad_origen,							:ls_rut_empresa,								:ls_ruta_elect
FROM 	"MEMBRETE_EMPRESA"  
WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;

ls_direc_origen			= UPPER(trim(ls_direc_origen))
if len(ls_direc_origen) > 70 then
	ls_direc_origen		= mid(ls_direc_origen,1,70)
end if
ls_comuna_origen		= UPPER(ls_comuna_origen)
ls_ciudad_origen		= UPPER(ls_ciudad_origen)
if gs_base = 'O' then
	SELECT 	"OFERTA_V"."CTA_PAG_S",   
				"OFERTA_V"."CTA_PAG_M",
				 "PAGO_OFERTA"."NRO_CUOTAS"  
	INTO  	:ll_ctas_pag_c,   
				:ll_ctas_pag_m,
				:ll_plazo
	FROM 	"OFERTA_V","PAGO_OFERTA"  
	WHERE 	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
        			 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
         		( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				( "OFERTA_V"."SERIE" = :gs_serie ) AND  
				( "OFERTA_V"."NRO_OFERTA" = :gi_numero ) AND  
				( "OFERTA_V"."BASE" = :gs_base )
	USING sqlca;
	if ls_tipo_mov = 'E' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_c)+' de '+string(ll_plazo)
	//	as_cuota				= 
	elseif ls_tipo_mov = 'F' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)
	//	as_cuota_mant		= 
	end if	
elseif gs_base= 'C' then
	setnull(ll_ctas_pag_c);
	SELECT 	"CONTRATO"."CTA_PAG_LA",   
				"CONTRATO"."CTA_PAG_ISA",   
				"CONTRATO"."CTA_PAG_M",
				"CONTRATO"."PLAZO"
	INTO 		:ll_ctas_pag_la,:ll_ctas_pag_isa,:ll_ctas_pag_m, :ll_plazo
	FROM 	"CONTRATO"  
	WHERE 	( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
				( "CONTRATO"."NRO_CONTRATO" = :gi_numero )
	USING	sqlca;	
	ll_ctas_pag_c 		= ll_ctas_pag_la +ll_ctas_pag_isa
	if ls_tipo_mov = 'E' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_c)+' de '+string(ll_plazo)
	//	as_cuota				= 
	elseif ls_tipo_mov = 'F' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)
	//	as_cuota_mant		= 
	end if	
elseif gs_base= 'P' then
	setnull(ll_ctas_pag_c);
	SELECT 	"PAGARE"."CTA_PAG_LA",   
				"PAGARE"."CTA_PAG_ISA",
				"PAGARE"."PLAZO"
	INTO 		:ll_ctas_pag_la,:ll_ctas_pag_isa ,:ll_plazo 
	FROM 	"PAGARE"  
	WHERE 	( "PAGARE"."SERIE_P" = :gs_serie ) AND  
				( "PAGARE"."NRO_PAGARE" = :gi_numero )
	USING	sqlca;
	ll_ctas_pag_c =ll_ctas_pag_la +ll_ctas_pag_isa
	if ls_tipo_mov = 'E' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_c)+' de '+string(ll_plazo)
	//	as_cuota				= 
	elseif ls_tipo_mov = 'F' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)
	//	as_cuota_mant		= 
	end if	
elseif gs_base= 'L' then
	SELECT 	"ANEXO_LIBERADOR"."CTA_PAG_M",   
				"PAGO_LIBERADOR"."NRO_CUOTAS"
	INTO 		:ll_ctas_pag_m, :ll_plazo  			
	FROM 	"ANEXO_LIBERADOR","PAGO_LIBERADOR"  
	WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
				( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
				( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" )  and
				( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
				( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )
	USING	sqlca;
	if ls_tipo_mov = 'E' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)+' de '+string(ll_plazo)
	//	as_cuota				= 
	elseif ls_tipo_mov = 'F' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)
	//	as_cuota_mant		= 
	end if	
elseif gs_base= 'R' then
	SELECT 	"REPACTA_MANTENCION"."CTAS_PAGADAS","REPACTA_MANTENCION"."CUOTAS_PACTADAS"    
	INTO 		:ll_ctas_pag_m, :ll_plazo
	FROM 	"REPACTA_MANTENCION"  
	WHERE 	( "REPACTA_MANTENCION"."BASE" = :gs_base ) AND  
				( "REPACTA_MANTENCION"."SERIE" = :gs_serie ) AND  
				( "REPACTA_MANTENCION"."NUMERO" = :gi_numero )
	USING	sqlca;
	if ls_tipo_mov = 'E' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)+' de '+string(ll_plazo)
	//	as_cuota				= 
	elseif ls_tipo_mov = 'F' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)
	//	as_cuota_mant		= 
	end if	
elseif gs_base= 'A' then
	SELECT 	"ANEXO_AUMENTO"."CTA_PAG_M",   
				"PAGO_AUMENTO"."NRO_CUOTAS"
	INTO		:ll_ctas_pag_m, :ll_plazo  			
	FROM 	"ANEXO_AUMENTO","PAGO_AUMENTO"  
	WHERE 	( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
				( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
				( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
				( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
				( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )
	USING	sqlca;
	if ls_tipo_mov = 'E' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)+' de '+string(ll_plazo)
	//	as_cuota				= 
	elseif ls_tipo_mov = 'F' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)
	//	as_cuota_mant		= 
	end if	
elseif gs_base= 'D' then
	SELECT 	"DERECHO"."CTA_PAG_LA",   
				"DERECHO"."CTA_PAG_ISA",
				"DERECHO"."PLAZO"
	INTO 		:ll_ctas_pag_la,:ll_ctas_pag_isa,:ll_plazo  
	FROM 	"DERECHO"  
	WHERE 	( "DERECHO"."SERIE_P" = :gs_serie ) AND  
				( "DERECHO"."NRO_PAGARE" = :gi_numero )   ;
	ll_ctas_pag_c		= ll_ctas_pag_la+ll_ctas_pag_isa
	if ls_tipo_mov = 'E' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_c)+' de '+string(ll_plazo)
	//	as_cuota				= 
	elseif ls_tipo_mov = 'F' then
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)
	//	as_cuota_mant		= 
	end if	
end if

if ls_tipo_mov = 'E' then
	as_cuota				= string(ll_ctas_pag_c) +' de '+ string(ll_plazo) +' hora('+string(gdt_fec_sistema,"hh:mm")+')'
elseif ls_tipo_mov = 'F' then
	as_cuota_mant		= 'Última Cta.Mant.Anual Pagada Año '+string(ldt_fec_venc_mant,'yyyy')
end if	

SELECT	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",		"CLIENTE"."BLOCK_PARTICULAR",		"COMUNA"."COMUNA",	"CIUDAD"."SIGLA_CIUDAD",	"CLIENTE"."CELULAR",	"CLIENTE"."FONO_P",	"CLIENTE"."EMAIL"
INTO		:ls_dv,				:ls_nom,						:ls_ap_pat,						:ls_ap_mat,						:ls_tipo_via,							:ls_direc,							:ls_nro,										:ls_depto,									:ls_block,									:ls_comuna,					:ls_ciudad,						:ls_celular,					:ls_fono_part,			:ls_email
FROM 	"CIUDAD",	"CLIENTE",	"COMUNA",	"TIPO_VIA"  
WHERE ( "CIUDAD"."CODIGO_CIUDAD" = "CLIENTE"."CIUDAD" ) and  
		  ( "COMUNA"."CODIGO_COMUNA" = "CLIENTE"."COMUNA" ) and  
		  ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
		  (("CLIENTE"."RUT" = :gi_rut ) ) 
USING	sqlca;
if sqlca.sqlcode=0 then
	ls_ciudad			= UPPER(ls_ciudad)
	if isnull(ls_celular) or ls_celular='-' or len(ls_celular)=0 or ls_celular='*' then
		ls_celular	= ''
	end if
	if isnull(ls_fono_part) or ls_fono_part='-' or len(ls_fono_part)=0 or ls_fono_part='*' then
		ls_fono_part	= ''
	end if
	if ls_celular <> '' and ls_fono_part <> '' then
		ls_contacto	= 'Cel.: '+ls_celular+' - FP.: '+ls_fono_part
	elseif ls_celular <> '' and ls_fono_part = '' then
		ls_contacto	= 'Cel.: '+ls_celular
	elseif ls_celular = '' and ls_fono_part <> '' then
		ls_contacto	= 'FP.: '+ls_fono_part
	elseif ls_fono_part = '' and ls_celular = '' then
		ls_contacto	= 'S/T'
	end if
	if len(ls_contacto) > 20 then
		ls_contacto	= mid(ls_contacto,1,20)
	end if
	ls_rut				= string(gi_rut)+'-'+ls_dv
	if isnull(ls_nom) or ls_nom= '' or ls_nom=' ' or ls_nom='-' or ls_nom='*' then
		ls_nom		= ''
	end if
	if isnull(ls_ap_pat) or ls_ap_pat= '' or ls_ap_pat=' ' or ls_ap_pat='-' or ls_ap_pat='*' then
		ls_ap_pat	= ''
	end if
	if isnull(ls_ap_mat) or ls_ap_mat= '' or ls_ap_mat=' ' or ls_ap_mat='-' or ls_ap_mat='*' then
		ls_ap_mat	= ''
	end if
//	if gs_rezago ='S' then
//		ls_nom_comp	= ls_nom_comp_rez
//	else
		ls_nom_comp	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
//	end if
	
	ls_nom_comp	= ls_nom_comp
	if len(ls_nom_comp) > 40 then
		ls_nom		= mid(ls_nom_comp,1,40)
	end if
	if len(ls_nom_comp) > 40 then
		ls_nom_comp	= mid(ls_nom_comp,1,40)
	end if
	ls_nom			= ls_nom_comp
	if isnull(ls_tipo_via) or ls_tipo_via= '' or ls_tipo_via=' ' or ls_tipo_via='-' or ls_tipo_via='*' then
		ls_tipo_via	= ''
	end if
	if isnull(ls_direc) or ls_direc= '' or ls_direc=' ' or ls_direc='-' or ls_direc='*' then
		ls_direc		= ''
	end if
	if isnull(ls_nro) or ls_nro= '' or ls_nro=' ' or ls_nro='-' or ls_nro='*' then
		ls_nro			= ''
	end if
	if isnull(ls_depto) or ls_depto= '' or ls_depto=' ' or ls_depto='-' or ls_depto='*' then
		ls_depto		= ''
	end if
	if isnull(ls_block) or ls_block= '' or ls_block=' ' or ls_block='-' or ls_block='*' then
		ls_block		= ''
	end if
	if isnull(ls_comuna) or ls_comuna= '' or ls_comuna=' ' or ls_comuna='-' or ls_comuna='*' then
		ls_tipo_via	= ''
	end if
	if isnull(ls_ciudad) or ls_ciudad= '' or ls_ciudad=' ' or ls_ciudad='-' or ls_ciudad='*' then
		ls_tipo_via	= ''
	end if
	ls_direc_comp	= ls_tipo_via+' '+ls_direc
	if ls_nro <> '' then
		ls_direc_comp	= ls_direc_comp+' N° '+ls_nro
	end if
	if ls_depto <> '' then
		ls_direc_comp	= ls_direc_comp+' Dpto.'+ls_depto
	end if
	if ls_block <> '' then
		ls_direc_comp	= ls_direc_comp+' Block '+ls_block
	end if
	if len(ls_direc_comp) > 70 then
		ls_direc_comp	= mid(ls_direc_comp,1,70)
	end if
else
end if

SELECT	"ELECTRONICA_FB"."GRUPO"  
INTO 		:ll_grupo  
FROM 	"ELECTRONICA_FB"  
WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
		  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
		  ( "ELECTRONICA_FB"."ESTADO" = 'P' )   ;
if not isnull(ls_rut_empresa) and ll_grupo > 0 then
	//ll_cant_folio_p			= gl_folio_diario * gl_veces_diario
	SELECT	Count("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
	INTO		:ll_count_pend
	FROM 	"ELECTRONICA_FB",   
				"ELECTRONICA_FB_DETALLE"  
	WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
			  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
			  ( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
			  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND 
			  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
			  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
			  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' );
	if ll_count_pend < ll_cant_folio_p then
	//	Messagebox("Advertencia","Recuerde quedan "+String(ll_count_pend)+" Documentos "+ls_tip_cob+" PENDIENTES, favor dar aviso Depatamento Informática")
	end if
	UPDATE		"ELECTRONICA_FB_DETALLE"  
	SET 			"FECHA_PAGO" = :adt_fecha_pago,   
					"RUT" = :gi_rut,   
					"ESTADO_REG" = 'P',   
					"DV" = :ls_dv,   
					"NOMBRE_CLIENTE" = :ls_nom_comp,   
					"USUARIO_CREA" = :gs_user,
					"BASE"  = :gs_base,
					"SERIE" = :gs_serie,
					"NUMERO" = :gi_numero,
					"IP_EQUIPO" = :gs_tcp_ip,
					"TIPO_DOC_ASOC" = 'CU',   
					"FOLIO_ASOC" = :ll_cupon
	WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo ) AND  
				  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
				  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )   AND
				  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
				  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = (SELECT	MIN("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
																						FROM 	"ELECTRONICA_FB",   
																									"ELECTRONICA_FB_DETALLE"  
																						WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
																								  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
																								  ( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
																								  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND 
																								  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
																								  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
																								  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )) )
	USING		sqlca;
	if sqlca.sqlcode=0 then
		commit;					
		if gs_rezago <> 'S' then
			SELECT	min("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO")
			INTO 		:ll_min_boleta
			FROM 	"ELECTRONICA_FB",   
						"ELECTRONICA_FB_DETALLE"  
			WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
					  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
					  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
					  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND 
					  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
					  ( "ELECTRONICA_FB_DETALLE"."FECHA_PAGO" = :adt_fecha_pago ) AND   
					  ( "ELECTRONICA_FB_DETALLE"."RUT" = :gi_rut) AND
					  ( "ELECTRONICA_FB_DETALLE"."DV" = :ls_dv) AND
					  ( "ELECTRONICA_FB_DETALLE"."NOMBRE_CLIENTE" = :ls_nom_comp) AND
					  ( "ELECTRONICA_FB_DETALLE"."USUARIO_CREA" = :gs_user) AND
					  ( "ELECTRONICA_FB_DETALLE"."BASE"  = :gs_base) AND
					  ( "ELECTRONICA_FB_DETALLE"."SERIE" = :gs_serie) AND
					  ( "ELECTRONICA_FB_DETALLE"."NUMERO" = :gi_numero) AND
					  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip) AND
					  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
					  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) );
		else
			SELECT	min("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO")
			INTO 		:ll_min_boleta
			FROM 	"ELECTRONICA_FB",   
						"ELECTRONICA_FB_DETALLE"  
			WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
					  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
					  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
					  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND 
					  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
					  ( "ELECTRONICA_FB_DETALLE"."FECHA_PAGO" = :adt_fecha_pago ) AND   
					  ( "ELECTRONICA_FB_DETALLE"."RUT" = :gi_rut) AND
					  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip) AND
					  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
					  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) );
		end if
		gl_folio						= ll_min_boleta
	else
		rollback;
		messagebox("Error Grabar BOLETA","Error al Grabar BOLETA - Folio NO Disponible para "+ls_tip_cob+" SQL: "+sqlca.sqlerrtext)
	end if
else
	messagebox("Advertencia","No Existe Folio para esta Empresa "+ls_rut_empresa)
end if
////
ls_tipo_dte		= '41'
//ls_tip_cob		= 'BE'

if ls_tipo_mov = 'E' then
	SELECT	COUNT("SEGURO_ASOCIADOS"."COD_SEGURO"),	SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
	INTO		:ll_count_seg,												:ll_suma_seg
	FROM 	"SEGURO_ASOCIADOS"  
	WHERE ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
			  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
			  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
			  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
			  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
			  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
	USING	sqlca;
	if ll_count_seg > 0 then
		SELECT	DISTINCT ("SEGURO_ASOCIADOS"."MONEDA")
		INTO		:ls_moneda_seg
		FROM 	"SEGURO_ASOCIADOS"  
		WHERE ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
				  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
				  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
				  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
		USING		sqlca;
		if ls_moneda_seg = '2' then
			ll_monto_seg	= long(round(ll_suma_seg * adb_uf,0))
		else
			ll_monto_seg	= long(ll_suma_seg)
		end if
		DECLARE x1 CURSOR FOR  
		SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO",   
					"SEGURO_ASOCIADOS"."MONTO_PRIMA"
		FROM 	"SEGURO_ASOCIADOS"  
		WHERE ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
				  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
				  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND
				  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
		USING	sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			do while sqlca.sqlcode=0
				fetch x1 into :ll_cod_seguro, :ldb_prima;
				if not isnull(ll_cod_seguro) and ll_cod_seguro>0  then
					if ls_moneda_seg = '1' then
						if ll_cod_seguro = 4 then
							ll_monto_seguro_4	= ldb_prima
							ll_uf_seguro_4			= round(ldb_prima / adb_uf,4)
						elseif ll_cod_seguro = 6 then
							ll_monto_seguro_6	= ldb_prima
							ll_uf_seguro_6			= round(ldb_prima / adb_uf,4)
						end if			
					elseif ls_moneda_seg = '2' then
						if ll_cod_seguro = 4 then
							ll_monto_seguro_4	= round(ldb_prima * adb_uf,4)
							ll_uf_seguro_4			= ldb_prima
						elseif ll_cod_seguro = 6 then
							ll_monto_seguro_6	= round(ldb_prima * adb_uf,4)
							ll_uf_seguro_6			= ldb_prima
						end if
					end if
				end if
				setnull(ll_cod_seguro)
			loop
		end if
		close x1;
	end if			
	if ll_monto_seg > 0 then 
		ll_monto_cuota			= ll_monto_cuota - ll_monto_seg
	end if
end if	
if isnull(ll_monto_seguro_4) then ll_monto_seguro_4=0
if isnull(ll_monto_seguro_6) then ll_monto_seguro_6=0

lbd_tot_cob						= round(ll_monto_cuota + ll_monto_interes +ll_gasto_cob + ll_monto_seguro_4 + ll_monto_seguro_6,0)
//	//

///////////////
//ls_fecha_pago_palabra		= f_retorna_fecha_palabra(date(gd_hoy))
ls_fecha_pago_palabra		= f_retorna_fecha_palabra(date(adt_fecha_pago))
ls_nro_contrato					= gs_base+gs_serie+string(gi_numero)
ls_paga_con						= string(lbd_tot_cob)
ls_vuelto							= ''
//ls_proximo_pago				= f_retorna_prox_pago_mant( gs_base, gs_serie, gi_numero, 1,'F' )
ls_proximo_pago				= f_retorna_prox_pago_mant( gs_base, gs_serie, gi_numero, 1,ls_tipo_mov )
ls_monto_total_palabra		= sle_1.uo_convertir_numero(string(lbd_tot_cob))
ls_pago_ef						= string(lbd_tot_cob)
ls_pago_ch						= ''
ls_pago_tc						= ''
ls_pago_td						= ''
ll_neto							= 0
ll_exento							= lbd_tot_cob
ll_iva								= 0
ll_total							= lbd_tot_cob
//"FECHA_PAGO"		gd_hoy
INSERT INTO "INGRESO_NEWSING_CABECERA"  
			( "TIPO_COB",		"FOLIO",		"FECHA_PAGO",		"FECHA_PAGO_PALABRA",	"COD_PARQUE", 	"NRO_CONTRATO", 	"UF_DIA", 	"COD_CAJA", 	"USUARIO", 		"PAGA_CON",	"VUELTO",	"PROXIMO_PAGO",   "MONTO_TOTAL_PALABRA",		"PAGO_EF", 	"PAGO_CH", 	"PAGO_TC", 	"PAGO_TD",		"RUT_CLIENTE",	"REZAGO",		"NETO",		"EXENTO",		"IVA",		"TOTAL",		"IP_PC",		"IP_PRINT",			"CONEXION",	"COD_PARQUE_CTTO") 
VALUES 	( :ls_tip_cob, 		:gl_folio, 	:adt_fecha_pago,		:ls_fecha_pago_palabra, 	:ll_cod_parque, 	:ls_nro_contrato, 		:gd_uf,		:gs_caja, 		:gs_user, 		:ls_paga_con,	:ls_vuelto,	:ls_proximo_pago, 	:ls_monto_total_palabra, 		:ls_pago_ef,	:ls_pago_ch,	:ls_pago_tc,		:ls_pago_td,		:gi_rut,				:gs_rezago,		:ll_neto,		:ll_exento,		:ll_iva,	:ll_total,		:gs_tcp_ip,	:gs_tcp_ip_print,	:gs_empresa,	:ll_cod_parque)  
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if

//ll_new_reg			= dw_boleta.insertrow(0)
//ls_string_boleta	= '<ENCABEZADO>'
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//if isnull(ls_tipo_dte) then ls_tipo_dte=''
//ls_string_boleta	= 'Tipo DTE'+Space(22)+' | '+ls_tipo_dte
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//ls_string_boleta	= 'Folio'+Space(25)+' | '+string(gl_folio)
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
////ls_string_boleta	= 'Fecha de Emision'+Space(14)+' | '+string(date(st_fecha_pago.text),'dd-mm-yyyy')
//ls_string_boleta	= 'Fecha de Emision'+Space(14)+' | '+string(date(adt_fecha_pago),'dd-mm-yyyy')
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//if isnull(ls_indica_serv) then ls_indica_serv=''
//ls_string_boleta	= 'Indicador Servicio'+Space(12)+' | '+ls_indica_serv
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//ls_string_boleta	= 'Fecha Vencimiento'+Space(13)+' | '+string(ldt_fec_venc_cred,'dd-mm-yyyy')
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//if isnull(ls_direc_origen) then ls_direc_origen=''
//ls_string_boleta	= 'Direccion Origen'+Space(14)+' | '+ls_direc_origen
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//if isnull(ls_comuna_origen) then ls_comuna_origen=''
//ls_string_boleta	= 'Comuna Origen'+Space(17)+' | '+ls_comuna_origen
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//if isnull(ls_ciudad_origen) then ls_ciudad_origen=''
//ls_string_boleta	= 'Ciudad Origen'+Space(17)+' | '+ls_ciudad_origen
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//ls_string_boleta	= 'Id. Adicional Receptor'+Space(8)+' | '+string(gi_rut)
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//if isnull(ls_rut) then ls_rut=''
//ls_string_boleta	= 'Rut Receptor'+Space(18)+' | '+ls_rut
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//ls_string_boleta	= 'Codigo Interno Receptor'+Space(7)+' | '+string(gi_rut)
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//if isnull(ls_nom_comp) then ls_nom_comp=''
//ls_string_boleta	= 'Razon Social Receptor'+Space(9)+' | '+ls_nom_comp
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//if isnull(ls_contacto) then ls_contacto='S/T'
//ls_string_boleta	= 'Contacto Receptor'+Space(13)+' | '+ls_contacto
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//
//ll_new_reg			= dw_boleta.insertrow(0)
//if isnull(ls_direc_comp) then ls_direc_comp=''
//
//ls_string_boleta	= 'Direccion Receptor'+Space(12)+' | '+ls_direc_comp
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//if isnull(ls_comuna) then ls_comuna=''
//ls_string_boleta	= 'Comuna Receptor'+Space(15)+' | '+ls_comuna
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg			= dw_boleta.insertrow(0)
//if isnull(ls_ciudad) then ls_ciudad=''
//ls_string_boleta	= 'Ciudad Receptor'+Space(15)+' | '+ls_ciudad
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//
//// tipo de boleta
//
//
////  if w_ingreso2.tab_ingreso.SelectedTab = 1 then
////	ll_new_reg			= dw_boleta.insertrow(0)
////	ls_string_boleta	= 'Monto Neto'+Space(20)+' | '
////	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
////	ll_new_reg			= dw_boleta.insertrow(0)
////	gd_total				= w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.getitemnumber(al_fila,'c_total_pago_cuota')
////	ls_string_boleta	= 'Monto Exento'+Space(18)+' | '+string(gd_total,'###########0')
////	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
////	ll_new_reg			= dw_boleta.insertrow(0)
////	ls_string_boleta	= 'IVA'+Space(27)+' | '
////	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
////	ll_new_reg			= dw_boleta.insertrow(0)
////	ls_string_boleta	= 'Monto Total'+Space(19)+' | '+string(gd_total,'###########0')
////	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
////	ls_tot_pag_pal		= sle_1.uo_convertir_numero(string(gd_total))
////	ll_new_reg			= dw_boleta.insertrow(0)
////	ls_string_boleta	= 'Monto Escrito'+Space(16)+'  | '+ls_tot_pag_pal
////	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
////else
//	ll_new_reg			= dw_boleta.insertrow(0)
//	ls_string_boleta	= 'Monto Neto'+Space(20)+' | '
//	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//	ll_new_reg			= dw_boleta.insertrow(0)
//	ls_string_boleta	= 'Monto Exento'+Space(18)+' | '+string(lbd_tot_cob,'###########0')
//	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//	ll_new_reg			= dw_boleta.insertrow(0)
//	ls_string_boleta	= 'IVA'+Space(27)+' | '
//	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//	ll_new_reg			= dw_boleta.insertrow(0)
//	ls_string_boleta	= 'Monto Total'+Space(19)+' | '+string(lbd_tot_cob,'###########0')
//	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//	ls_tot_pag_pal		= sle_1.uo_convertir_numero(string(lbd_tot_cob))
//	ll_new_reg			= dw_boleta.insertrow(0)
//	ls_string_boleta	= 'Monto Escrito'+Space(16)+'  | '+ls_tot_pag_pal
//	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
////end if
////-----------------------------
//ll_new_reg			= dw_boleta.insertrow(0)
////ll_tot_filas			= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
////ll_reg					= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob = 'E' or tipo_cob = 'K'", 1, ll_tot_filas)
////	ll_tot_filas			= dw_lista.rowcount()
////ll_reg					= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob = 'E' or tipo_cob = 'K'", 1, ll_tot_filas)
////if ll_reg>0 and gs_rezago <> "S" then 
////	if w_ingreso2.tab_ingreso.tp_ci.dw_datos_ci.rowcount() > 0 then
////		ll_can_cta_cred		= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.GetItemNumber(ll_reg, "cantidad") 
////	end if
////end if
//if len(ls_obs_1) > 70 then
//	ls_obs_1				= mid(ls_obs_1,1,70)
//end if
//ls_string_boleta		= 'Observaciones 1'+Space(14)+'  | '+ls_obs_1
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg				= dw_boleta.insertrow(0)
//ls_string_boleta		= 'IP Equipo'+Space(20)+'  | '+gs_tcp_ip
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg				= dw_boleta.insertrow(0)
//ls_string_boleta		= 'Direccion Emisor'+Space(13)+'  | '+'Estado 360 Piso 2'
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg				= dw_boleta.insertrow(0)
//ls_string_boleta		= 'Comuna Emisor'+Space(16)+'  | '+'Santiago'
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg				= dw_boleta.insertrow(0)
//ls_string_boleta		= 'Ciudad Emisor'+Space(16)+'  | '+'Santiago'
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//
//ll_new_reg				= dw_boleta.insertrow(0)
//ls_string_boleta		= 'x Cuota Credito'+Space(14)+'  | '+as_cuota
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg				= dw_boleta.insertrow(0)
//ls_string_boleta		= 'x Cuota Mantencion'+Space(11)+'  | '+as_cuota_mant
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg				= dw_boleta.insertrow(0)
//if gs_rezago='S' then
////	ls_string_boleta	= 'x Nro. Contrato'+Space(14)+'  | '+ls_base_rezago+ls_serie_rezago+string(ll_numero_rezago)
//	ls_string_boleta	= 'x Nro. Contrato'+Space(14)+'  | '+as_doc
//else
//	ls_string_boleta	= 'x Nro. Contrato'+Space(14)+'  | '+as_doc
//end if
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg				= dw_boleta.insertrow(0)
////--ls_forma_pago			= tab_1.tabpage_2.dw_cargar.getitemstring(al_fila,'forma_pago')
//ls_forma_pago			= 'EF'
//ls_efectivo				= string(lbd_tot_cob,'###,###,###,##0')
//ls_con_paga				= string(lbd_tot_cob,'###,###,###,##0')
//ls_vuelto					= string(0,'###,###,###,##0')
//
//if ls_forma_pago = 'EF' then
//	as_paga_con		= ls_efectivo+' Paga con '+ls_con_paga+' Vuelto '+ls_vuelto
//else
//	as_paga_con		= ''
//end if
//ls_string_boleta		= 'x Paga en Efectivo'+Space(11)+'  | '+ as_paga_con
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg				= dw_boleta.insertrow(0)
//ls_string_boleta		= 'x U.F. dia'+Space(19)+'  | '+string(adb_uf,'###,###,###,##0.0###')
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg				= dw_boleta.insertrow(0)
//ls_string_boleta		= 'x Caja'+Space(23)+'  | '+gs_caja
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//if gs_tipo_cobro='CU' then
//	ll_new_reg			= dw_boleta.insertrow(0)
//	ls_string_boleta	= 'x Imprimir'+Space(19)+'  | '+'N'
//else
//	ll_new_reg			= dw_boleta.insertrow(0)
//	ls_string_boleta	= 'x Imprimir'+Space(19)+'  | '+'S'
//end if
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//
////DECLARE 	x1 CURSOR FOR  
////SELECT "DOCUMENTOS"."COD_PAGO",     sum("DOCUMENTOS"."MONTO"),     count("DOCUMENTOS"."COD_PAGO")  
////FROM "DOCUMENTOS"  
////WHERE ( "DOCUMENTOS"."FOLIO" = :gl_folio ) AND  
////         ( "DOCUMENTOS"."TIPO_COB" = :ls_tip_cob ) AND  
////         ( "DOCUMENTOS"."FECHA_PAGO" = :adt_fecha_pago )   
////GROUP BY "DOCUMENTOS"."COD_PAGO"  
////ORDER BY "DOCUMENTOS"."COD_PAGO" ASC   
////USING		sqlca;
////open x1;
////if sqlca.sqlcode=0 then
////	do while sqlca.sqlcode=0
////		fetch x1 into :ls_cod_pago, :ls_sum_monto,	 :ll_count_reg;
//		if not isnull(ls_forma_pago) then
//			choose case ls_forma_pago
//				case 'EF'
//					ll_new_reg			= dw_boleta.insertrow(0)
//					ls_string_boleta	= 'x Total Efectivo'+Space(13)+'  | '+string(lbd_tot_cob,'###,###,###,##0')	
//					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//					
//				case 'CH'
//					ll_new_reg			= dw_boleta.insertrow(0)
////					ls_string_boleta	= 'x Total Cheque'+Space(15)+'  | '+string(lbd_tot_cob,'###,###,###,##0')+' ('+string(ll_count_reg)+')'
//					ls_string_boleta	= 'x Total Cheque'+Space(15)+'  | '+string(lbd_tot_cob,'###,###,###,##0')+' ('+string(1)+')'
//					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//					
//				case 'TC'
//					ll_new_reg			= dw_boleta.insertrow(0)
//					ls_string_boleta	= 'x Total Tarjeta Credito'+Space(6)+'  | '+string(lbd_tot_cob,'###,###,###,##0')+' ('+string(ll_count_reg)+')'
//					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//					
//				case 'TD'
//					ll_new_reg			= dw_boleta.insertrow(0)
//					ls_string_boleta	= 'x Total Tarjeta Debito'+Space(7)+'  | '+string(lbd_tot_cob,'###,###,###,##0')	
//					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//			end choose
//		end if
////		Setnull(ls_cod_pago);Setnull(ls_sum_monto)
////		dw_boleta.accepttext()
////	loop
////end if
////close x1;
//ll_new_reg						= dw_boleta.insertrow(0)
//ls_string_boleta				= '<DETALLE>'
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//ll_new_reg						= dw_boleta.insertrow(0)
//ls_string_boleta				= 'Nro.Linea | Tipo codigo | Codigo del Item | Nombre del Item | Descripcion Adicional al Item | Cantidad | Precio Unitario Item | Monto Item | x Monto UF'
//dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//SELECT		"TIPO_COBRO"."DESCRIPCION"  
//INTO 			:ls_descrip_cobro  
//FROM 		"TIPO_COBRO"  
//WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_mov ) AND  
//			  ( "TIPO_COBRO"."TIPO_MOV" = :ls_tip_cob )  
//USING		sqlca;
//UPPER(ls_descrip_cobro)
//
//setnull(ll_monto_cuota_aux)
//ll_corre = 0
//ll_monto_uf				= round(ll_monto_cuota / adb_uf,4)
////if ll_uf_seguro_4 > 0 then ll_uf_seguro_4 = round(ll_monto_seguro_4 / adb_uf,4)
////if ll_uf_seguro_6 > 0 then ll_uf_seguro_6 = round(ll_monto_seguro_6 / adb_uf,4)
//ls_string_boleta		= string(1)+' | '+ls_tip_cob+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(1)+' | '+string(ll_monto_cuota)+' | '+string(ll_monto_cuota)+' | '+string(ll_monto_uf,'###,###,##0.0###')
//if not isnull(ls_string_boleta) then
//	ll_new_reg			= dw_boleta.insertrow(0)
//	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//end if
//if ll_monto_interes > 0 then
//	if ls_tipo_mov = 'E' then
//		ls_tipo_mov_aux		= 'G'
//		ls_descrip_cobro		= 'MORA CREDITO'
//		ls_descrip_otro			= ''
//		ld_mora_uf				= round(ll_monto_interes / adb_uf ,4)
//	//	ll_monto					= ll_monto_interes / ll_mora
//		ls_string_boleta		= string(2)+' | '+ls_tip_cob+' | '+ls_tipo_mov_aux+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(1)+' | '+string(ll_monto_interes)+' | '+string(ll_monto_interes)+' | '+string(ld_mora_uf,'###,###,##0.0###')
//		if not isnull(ls_string_boleta) then
//			ll_new_reg			= dw_boleta.insertrow(0)
//			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)	
//		end if
//	end if
//	if ls_tipo_mov = 'F' then
//		ls_tipo_mov_aux		= 'P'
//		ls_descrip_cobro		= 'MORA MANT.'
//		ls_descrip_otro			= ''
//		ld_mora_uf				= round(ll_monto_interes / adb_uf ,4)
//	//	ll_monto					= ll_monto_interes / ll_mora_mant
//		ls_string_boleta		= string(2)+' | '+ls_tip_cob+' | '+ls_tipo_mov_aux+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(1)+' | '+string(ll_monto_interes)+' | '+string(ll_monto_interes)+' | '+string(ld_mora_uf,'###,###,##0.0###')
//		if not isnull(ls_string_boleta) then
//			ll_new_reg			= dw_boleta.insertrow(0)
//			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)	
//		end if
//	end if
//end if	
//if ll_gasto_cob > 0 then
//	ll_monto_uf				= round(ll_gasto_cob / adb_uf,4)
//	if ll_monto_interes > 0 then 
//		ll_corre = 3
//	else
//		ll_corre = 2
//	end if	
//	if ls_tipo_mov = 'E' then
//		ls_tipo_mov_aux		= 'J'
//		ls_descrip_cobro		= 'GASTO COBRANZA'
//		ls_descrip_otro			= ''
//		ls_string_boleta		= string(ll_corre)+' | '+ls_tip_cob+' | '+ls_tipo_mov_aux+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(1)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)+' | '+string(ll_monto_uf,'###,###,##0.0###')
//		if not isnull(ls_string_boleta) then
//			ll_new_reg			= dw_boleta.insertrow(0)
//			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)	
//		end if
//	elseif ls_tipo_mov = 'F' then
//		ls_tipo_mov_aux		= 'R'
//		ls_descrip_cobro		= 'GASTO COB. MANT.'
//		ls_descrip_otro			= ''
//		ls_string_boleta		= string(ll_corre)+' | '+ls_tip_cob+' | '+ls_tipo_mov_aux+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(1)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)+' | '+string(ll_monto_uf,'###,###,##0.0###')
//		if not isnull(ls_string_boleta) then
//			ll_new_reg			= dw_boleta.insertrow(0)
//			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)	
//		end if
//	end if	
//end if	
//if isnull(ll_count_seg) then ll_count_seg = 0
//if ll_count_seg > 0 then
//	if ll_monto_interes > 0 and  ll_gasto_cob > 0 then
//		ll_corre = 4
//	elseif ll_monto_interes > 0  and  ll_gasto_cob = 0 then
//		ll_corre = 3
//	elseif ll_monto_interes = 0  and ll_gasto_cob > 0 then
//		ll_corre = 3
//	elseif 	ll_monto_interes = 0 and ll_gasto_cob = 0 then
//		ll_corre = 2
//	end if
//	if ll_monto_seguro_4 > 0 then
//		ls_tipo_mov_aux	= '4'
//		SELECT 	"TIPO_COBRO"."DESCRIPCION"
//		INTO		:ls_descrip_cobro
//		FROM 	"TIPO_COBRO"  
//		WHERE 	( "TIPO_COBRO"."CODIGO" = :ls_tipo_mov_aux ) AND  
//					( "TIPO_COBRO"."TIPO_MOV" = :ls_tip_cob )
//		USING	sqlca;
//		UPPER(ls_descrip_cobro)
//		ls_string_boleta		= string(ll_corre)+' | '+ls_tip_cob+' | '+ls_tipo_mov_aux+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(1)+' | '+string(ll_monto_seguro_4)+' | '+string(ll_monto_seguro_4)+' | '+string(ll_uf_seguro_4,'###,###,##0.0###')
//		if not isnull(ls_string_boleta) then
//			ll_new_reg			= dw_boleta.insertrow(0)
//			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)	
//		end if
//		ll_corre ++
//	end if	
//	if ll_monto_seguro_6 > 0 then
//		ls_tipo_mov_aux	= '6'
//		SELECT 	"TIPO_COBRO"."DESCRIPCION"
//		INTO		:ls_descrip_cobro
//		FROM 	"TIPO_COBRO"  
//		WHERE 	( "TIPO_COBRO"."CODIGO" = :ls_tipo_mov_aux ) AND  
//					( "TIPO_COBRO"."TIPO_MOV" = :ls_tip_cob )
//		USING	sqlca;
//		UPPER(ls_descrip_cobro)
//		ls_string_boleta		= string(ll_corre)+' | '+ls_tip_cob+' | '+ls_tipo_mov_aux+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(1)+' | '+string(ll_monto_seguro_6)+' | '+string(ll_monto_seguro_6)+' | '+string(ll_uf_seguro_6,'###,###,##0.0###')
//		if not isnull(ls_string_boleta) then
//			ll_new_reg			= dw_boleta.insertrow(0)
//			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
//		end if
//	end if
//end if
//if ls_tip_cob = 'BE' then
//	//ls_nombre_archivo		= '\\Boleta_elect\LA-FLORIDA-PROD\InFUD\'+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
//	//ls_nombre_archivo		= '\\Boleta_elect\InFud-la florida\'+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
//	 ls_nombre_archivo		= ls_ruta_elect+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
//	 
//	//ls_nombre_archivo		= 'C:\'+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
//	TipoArchivo 					= Text!
//	ll_res							= dw_boleta.SaveAs( ls_nombre_archivo,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)
//	If ll_res < 0  Then
//		MessageBox("Advertencia", "No fue posible Exportar Datos Boleta Electrónica", Exclamation!)
//	End If	
//end if
UPDATE		"ELECTRONICA_FB_DETALLE"  
SET 			"FECHA_PAGO" = :adt_fecha_pago,   
				"RUT" = :gi_rut,   
				"ESTADO_REG" = 'G',   
				"DV" = :ls_dv,   
				"NOMBRE_CLIENTE" = :ls_nom_comp,   
				"MONTO_AFECTO" = :ll_cero,   
				"MONTO_EXENTO" = :lbd_tot_cob,   
				"MONTO_IVA" = :ll_cero,   
				"MONTO_TOTAL" = :lbd_tot_cob,   
				"USUARIO_CREA" = :gs_user,   
				"BASE" = :gs_base,   
				"SERIE" = :gs_serie,   
				"NUMERO" = :gi_numero,
				"COD_CAJA" = :gs_caja,
				"TIPO_DTE" = :ls_tipo_dte ,
				"ESTADO_DOCUMENTO" = '' ,
				"TASA_IVA" = :ldb_iva_factura
WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = (	SELECT 	  "ELECTRONICA_FB"."GRUPO"
																		FROM 	  "ELECTRONICA_FB" 
																		WHERE 	( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND 
																					( "ELECTRONICA_FB"."RUT_EMPRESA" =:ls_rut_empresa ) AND
																					( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) ) ) AND  
																					( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
																					( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip ) AND
																					( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
																					( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) AND
																					( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) 
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if
//if sqlca.sqlcode = 0 then
//	is_pasa = 'S'
//else
//	is_pasa = 'N'
//end if	
end subroutine

public subroutine wf_validar_pagos_be (long al_fila, datetime adt_fecha_pago);string		ls_rut_empresa,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_base,ls_serie,ls_nom_paso,ls_tip_cob,ls_tipo_mov,ls_doc_elect
long		ll_grupo,ll_count_pend,ll_cant_folio_p,ll_rut,ll_numero,ll_pos,ll_min_boleta,ll_cod_parque,ll_numero_cupon,ll_min_boleta_ci
//datetime	ldt_fecha_pago

ll_cod_parque		= tab_1.tabpage_2.dw_cargar.getitemnumber(al_fila,'cadena_cod_parque')
ls_base				= tab_1.tabpage_2.dw_cargar.getitemstring(al_fila,'base')
ls_serie				= tab_1.tabpage_2.dw_cargar.getitemstring(al_fila,'serie')
ll_numero			= tab_1.tabpage_2.dw_cargar.getitemnumber(al_fila,'numero')
ll_rut					= tab_1.tabpage_2.dw_cargar.getitemnumber(al_fila,'rut')
ls_dv					= tab_1.tabpage_2.dw_cargar.getitemstring(al_fila,'dv')
gs_caja				= 'CP'

ls_tipo_mov	= is_tipo_mov
if ls_tipo_mov='E' and (ls_base='O' or (ls_base='P' and ll_cod_parque <> 101 ))then
	ls_tip_cob		= 'CI'
	ls_doc_elect		= 'CI'
	
	SELECT  "MEMBRETE_EMPRESA"."STRING_RUT"
	INTO 		:ls_rut_empresa
	FROM 	"MEMBRETE_EMPRESA"  
	WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
	
	SELECT	MIN("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO")
	INTO 		:ll_min_boleta_ci
	FROM 	"ELECTRONICA_FB",   
				"ELECTRONICA_FB_DETALLE"  
	WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
			  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
			  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
			  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_doc_elect ) AND 
			  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
//											  ( "ELECTRONICA_FB_DETALLE"."FECHA_PAGO" = :ld_fecha_pago ) AND   
//											  ( "ELECTRONICA_FB_DETALLE"."RUT" = :gi_rut) AND
//											  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip) AND
			  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
			  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_doc_elect )   AND
			  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) );
	gl_folio						= ll_min_boleta_ci
else	
	ls_tip_cob			= 'BE'
end if
SELECT	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO"
INTO		:ls_dv,				:ls_nombre,						:ls_ap_pat,						:ls_ap_mat
FROM 	"CLIENTE"
WHERE 	"CLIENTE"."RUT" = :ll_rut
USING	sqlca;	
	
SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
INTO 		:ls_rut_empresa
FROM 	"MEMBRETE_EMPRESA"  
WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;

SELECT	"ELECTRONICA_FB"."GRUPO"  
INTO 		:ll_grupo  
FROM 	"ELECTRONICA_FB"  
WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
		  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
		  ( "ELECTRONICA_FB"."ESTADO" = 'P' )   ;
if not isnull(ls_rut_empresa) and ll_grupo > 0 then
	//ll_cant_folio_p			= gl_folio_diario * gl_veces_diario
	SELECT	Count("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
	INTO		:ll_count_pend
	FROM 	"ELECTRONICA_FB",   
				"ELECTRONICA_FB_DETALLE"  
	WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
			  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
			  ( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
			  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND 
			  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
			  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
			  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' );
//	if ll_count_pend < ll_cant_folio_p then
//		Messagebox("Advertencia","Recuerde quedan "+String(ll_count_pend)+" Documentos "+gs_tipo_cobro+" PENDIENTES, favor dar aviso Depatamento Informática")
//	end if
	ls_nombre	= ls_nombre +' '+ls_ap_pat+' '+ls_ap_mat
	if len(ls_nombre) > 40 then
		ls_nombre	= mid(ls_nombre,1,40)
	end if
	SQLCA.Lock = "3" 
	
	UPDATE		"ELECTRONICA_FB_DETALLE"  
	SET 			"FECHA_PAGO" = :adt_fecha_pago,   
					"RUT" = :ll_rut,   
					"ESTADO_REG" = 'P',   
					"DV" = :ls_dv,   
					"NOMBRE_CLIENTE" = :ls_nombre,   
					"USUARIO_CREA" = :gs_user,
					"BASE"  = :ls_base,
					"SERIE" = :ls_serie,
					"NUMERO" = :ll_numero,
					"IP_EQUIPO" = :gs_tcp_ip
	WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo ) AND  
				  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
				  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )   AND
				  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
				  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = (SELECT	MIN("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
																						FROM 	"ELECTRONICA_FB",   
																									"ELECTRONICA_FB_DETALLE"  
																						WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
																								  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
																								  ( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
																								  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND 
																								  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
																								  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
																								  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )) )
	USING		sqlca;
	//								  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) AND  
	if sqlca.sqlcode=0 then
		commit;					
		if gs_rezago <> 'S' then
			SELECT	min("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO")
			INTO 		:ll_min_boleta
			FROM 	"ELECTRONICA_FB",   
						"ELECTRONICA_FB_DETALLE"  
			WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
					  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
					  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
					  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND 
					  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
					  ( "ELECTRONICA_FB_DETALLE"."FECHA_PAGO" = :adt_fecha_pago ) AND   
					  ( "ELECTRONICA_FB_DETALLE"."RUT" = :ll_rut) AND
					  ( "ELECTRONICA_FB_DETALLE"."DV" = :ls_dv) AND
					  ( "ELECTRONICA_FB_DETALLE"."NOMBRE_CLIENTE" = :ls_nombre) AND
					  ( "ELECTRONICA_FB_DETALLE"."USUARIO_CREA" = :gs_user) AND
					  ( "ELECTRONICA_FB_DETALLE"."BASE"  = :ls_base) AND
					  ( "ELECTRONICA_FB_DETALLE"."SERIE" = :ls_serie) AND
					  ( "ELECTRONICA_FB_DETALLE"."NUMERO" = :ll_numero) AND
					  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip) AND
					  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
					  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) );
		else
			SELECT	min("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO")
			INTO 		:ll_min_boleta
			FROM 	"ELECTRONICA_FB",   
						"ELECTRONICA_FB_DETALLE"  
			WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
					  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
					  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
					  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND 
					  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
					  ( "ELECTRONICA_FB_DETALLE"."FECHA_PAGO" = :adt_fecha_pago ) AND   
					  ( "ELECTRONICA_FB_DETALLE"."RUT" = :ll_rut) AND
					  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip) AND
					  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
					  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) );
		end if
		if ls_tip_cob = 'CI' then
			gl_folio						= ll_min_boleta_ci
		else
			gl_folio						= ll_min_boleta
		end if	
		is_pasa						= 'S'
	else
		rollback;
		messagebox("Error Grabar BOLETA","Error al Grabar BOLETA - Folio NO Disponible para "+ls_tip_cob+" SQL: "+sqlca.sqlerrtext)
		is_pasa						= 'N'
	end if
else
	messagebox("Advertencia","No Existe Folio para esta Empresa "+ls_rut_empresa)
	is_pasa						= 'N'
end if
end subroutine

protected subroutine wf_pagos_pac (string as_base, string as_serie, long al_numero, long al_indi);Long		ll_max,ll_tot_reg,value,ll_rut,ll_numero_cupon,ll_monto_pago,ll_cod_banco,ll_new,ll_ctas_pag_s,ll_ctas_pag_m,ll_tot_pagado_s,ll_tot_pagado_m,ll_interes,ll_gasto_cob,ll_count,ll_res,&
			ll_graba,ll_folio_pago,ll_count_seg,ll_cod_seguro,ll_monto,ll_cod_parque,ll_monto_seg,ll_count_pend,ll_monto_tot,ll_grupo,ll_cant_folio_p,ll_min_boleta_ci,&
			ai_cuotas_pag,ll_ctas_pag_s_sap,ll_count_ctto_sap,ll_count_rez
String		ls_string_1,ls_string_2,ls_string_3,docname,ls_dv,ls_cod_rechazo,ls_estado,ls_cuenta,ls_direc_origen,ls_comuna_origen,ls_ciudad_origen,&
			ls_tipo_mov,ls_caja,ls_fec_cred,ls_descrip,ls_dia_cred,ls_tipo_cob,ls_moneda_seg,ls_moneda,ls_tipo_mov_seg,ls_forma_pag,ls_rut_empresa,ls_ruta_elect,&
			ls_tip_cob,ls_doc_elect,ls_rezago_sap,ls_moneda_sap, ls_nombre, ls_ap_pat, ls_ap_mat, ls_tipo_via, ls_direcc, ls_numero_part, ls_depto, ls_block, &
			ls_comuna,  ls_ciudad, ls_fono_p, ls_fono_c, ls_celular, ls_nro_cliente_sap,ls_direc_part,ls_telefono_part
datetime	ldt_fecha_cargo,ldt_fecha_pago,ldt_fecha_ori,ldt_fecha_carga,ldt_fecha_hoy,ld_fec_ini,ld_fec_fin,ldt_fecha_reintento,ldt_fecha_aux,ldt_fecha_venc,ldt_fecha_sap
Double	ldb_prima,ll_suma_seg,ldb_valor_uf,ld_numero,ldb_monto_sap
date		ld_fecha_deposito

setnull(is_pasa)
ls_caja 				= 'CP'
ls_forma_pag		= 'EF'
//ls_tip_cob			= 'BE'
ll_interes				= 0
ll_gasto_cob			= 0
ll_max				= tab_1.tabpage_2.dw_cargar.getitemnumber(al_indi,'codigo_grupo')
ll_rut					= tab_1.tabpage_2.dw_cargar.getitemnumber(al_indi,'rut')
ls_dv					= tab_1.tabpage_2.dw_cargar.getitemstring(al_indi,'dv')
ls_cod_rechazo		= tab_1.tabpage_2.dw_cargar.getitemstring(al_indi,'codigo_rechazo')
ldt_fecha_cargo	= tab_1.tabpage_2.dw_cargar.getitemdatetime(al_indi,'fecha_cargo')
ll_numero_cupon	= tab_1.tabpage_2.dw_cargar.getitemnumber(al_indi,'numero_cupon')
ll_monto_pago		= tab_1.tabpage_2.dw_cargar.getitemnumber(al_indi,'monto_pago')
ldt_fecha_pago		= tab_1.tabpage_2.dw_cargar.getitemdatetime(al_indi,'fecha_pago')
ls_estado			= tab_1.tabpage_2.dw_cargar.getitemstring(al_indi,'estado')
ls_cuenta			= tab_1.tabpage_2.dw_cargar.getitemstring(al_indi,'cuenta_cargo')
ll_cod_banco		= tab_1.tabpage_2.dw_cargar.getitemnumber(al_indi,'cod_banco')
ldt_fecha_ori		= tab_1.tabpage_2.dw_cargar.getitemdatetime(al_indi,'fecha_cargo_ori')
ll_cod_parque		= tab_1.tabpage_2.dw_cargar.getitemnumber(al_indi,'cadena_cod_parque')
ll_monto_tot			= ll_monto_pago

SELECT	"MEMBRETE_EMPRESA"."DIRECCION",	"MEMBRETE_EMPRESA"."COMUNA_OFICINA",	"MEMBRETE_EMPRESA"."CIUDAD",	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."RUTA_ELECT"
INTO 		:ls_direc_origen,								:ls_comuna_origen,									:ls_ciudad_origen,							:ls_rut_empresa,								:ls_ruta_elect
FROM 	"MEMBRETE_EMPRESA"  
WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;

SELECT	"CUPONERAS_DETALLE"."TIPO_MOV" ,	"CUPONERAS_DETALLE"."FECHA_VENC"
INTO 		:ls_tipo_mov ,									:ldt_fecha_venc
FROM 	"CUPONERAS_DETALLE"  
WHERE  ( "CUPONERAS_DETALLE"."BASE" = :as_base ) AND  
		 ( "CUPONERAS_DETALLE"."SERIE" = :as_serie ) AND  
		 ( "CUPONERAS_DETALLE"."NUMERO" = :al_numero ) AND  
		 ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon )   
USING		sqlca;
is_tipo_mov	= ls_tipo_mov

if ls_tipo_mov='E' and (as_base='O' or (as_base='P' and ll_cod_parque <> 101 ))then
	ls_tip_cob		= 'CI'
	ls_doc_elect		= 'CI'
else
	ls_tip_cob		= 'BE'
	ls_doc_elect		= 'BE'
end if	

SELECT	"TAB_UF"."VALOR_UF" ,	sysdate 
INTO 		:ldb_valor_uf  ,				:gdt_fec_sistema
FROM 	"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_pago   ;

ld_fecha_deposito			= date(ldt_fecha_pago);

if ls_estado='021' then
	wf_validar_pagos_be(al_indi,ldt_fecha_pago)
	if is_pasa = 'S' then
		ll_monto_seg = 0
		if ls_tipo_mov = 'E' then
			SELECT	COUNT("SEGURO_ASOCIADOS"."COD_SEGURO"),	SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
			INTO		:ll_count_seg,												:ll_suma_seg
			FROM 	"SEGURO_ASOCIADOS"  
			WHERE ( "SEGURO_ASOCIADOS"."BASE" = :as_base ) AND  
					  ( "SEGURO_ASOCIADOS"."SERIE" = :as_serie ) AND  
					  ( "SEGURO_ASOCIADOS"."NUMERO" = :al_numero ) AND  
					  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
					  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
					  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
			USING	sqlca;
			if ll_count_seg > 0 then
				SELECT	DISTINCT ("SEGURO_ASOCIADOS"."MONEDA")
				INTO		:ls_moneda_seg
				FROM 	"SEGURO_ASOCIADOS"  
				WHERE ( "SEGURO_ASOCIADOS"."BASE" = :as_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :as_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :al_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
						  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
				USING		sqlca;
				if ls_moneda_seg = '2' then
					ll_monto_seg	= long(round(ll_suma_seg * ldb_valor_uf,0))
				else
					ll_monto_seg	= long(ll_suma_seg)
				end if
			end if
		end if	
		if ll_monto_seg > 0 then 
			ll_monto_pago			= ll_monto_pago - ll_monto_seg
		end if
		
		ai_cuotas_pag				= 1
		if ls_tipo_mov<>'F' and ls_tipo_mov<>'E' and ls_tipo_mov<>'K' and ls_tipo_mov<>'U' then ai_cuotas_pag=0
	
		ls_rezago_sap		= f_retorna_rezago_sap(' ',as_base,as_serie,al_numero,ls_tipo_mov)
		if isnull(ls_rezago_sap) then  ls_rezago_sap = 'N'
		gs_rezago			= ' '
		
		ll_ctas_pag_s_sap	= f_retorna_ctas_pag_sap(as_base,as_serie,al_numero,ls_tipo_mov,ls_rezago_sap)
		if isnull(ll_ctas_pag_s_sap) or ll_ctas_pag_s_sap=0 then ll_ctas_pag_s_sap = 0
		ll_ctas_pag_s_sap = ll_ctas_pag_s_sap + ai_cuotas_pag
		
		ldb_monto_sap		= f_retornar_monto_sap(as_base, as_serie, al_numero, gs_rezago, ls_tip_cob, gl_folio, ldt_fecha_pago, ls_tipo_mov,ll_monto_pago,ldb_valor_uf, '0',ai_cuotas_pag)
		if isnull(ldb_monto_sap) then ldb_monto_sap=0
		
		ls_moneda_sap		= f_retornar_moneda_sap(as_base, as_serie, al_numero, gs_rezago, ls_tip_cob, gl_folio, ldt_fecha_pago, ls_tipo_mov,ll_monto_pago,ldb_valor_uf, '0')
		if isnull(ls_moneda_sap) then ls_moneda_sap='2'
		if ls_rezago_sap <> 'S' then
			SELECT	Count("SAP_CADENA"."BASE")
			INTO 		:ll_count_ctto_sap  
			FROM 	"CADENA", 	"SAP_CADENA"  
			WHERE 	( "CADENA"."CODIGO" = "SAP_CADENA"."BASE" ) and  
						( "CADENA"."SERIE" = "SAP_CADENA"."SERIE" ) and  
						( "CADENA"."NUMERO" = "SAP_CADENA"."NUMERO" ) and  
						( "CADENA"."CODIGO" = :as_base ) AND  
						( "CADENA"."SERIE" = :as_serie ) AND  
						( "CADENA"."NUMERO" = :al_numero ) AND  
						( "SAP_CADENA"."TIPO_DEUDA" = 'C' ) AND  
						( "SAP_CADENA"."NRO_CONTRATO_SAP" is not null )   ;
			if ll_count_ctto_sap = 0 then
				SELECT 	Count("CLIENTE_REZAGO"."BASE"  )
				INTO 		:ll_count_rez  
				FROM 	"CLIENTE_REZAGO"  
				WHERE ( "CLIENTE_REZAGO"."RUT" = :ll_rut ) AND  
							( "CLIENTE_REZAGO"."BASE" = :as_base ) AND  
							( "CLIENTE_REZAGO"."SERIE" = :as_serie ) AND  
							( "CLIENTE_REZAGO"."NUMERO" = :al_numero ) AND  
							( "CLIENTE_REZAGO"."COD_PAGO" = :ls_tip_cob ) AND  
							( "CLIENTE_REZAGO"."FOLIO" = :gl_folio ) AND  
							( "CLIENTE_REZAGO"."FECHA_PAGO" = :ldt_fecha_pago )   ;
				if isnull(ll_count_rez) or ll_count_rez=0 then ll_count_rez=0
				if ll_count_rez = 0 then
					SELECT 	"CLIENTE"."DV", 	"CLIENTE"."NOMBRE",   	"CLIENTE"."A_PATERNO",   	"CLIENTE"."A_MATERNO",   	"TIPO_VIA"."DESCRIPCION",   	"CLIENTE"."DIRECCION_P",   	"CLIENTE"."NUMERO_PARTICULAR",   	"CLIENTE"."DEPTO_PARTICULAR",   	"CLIENTE"."BLOCK_PARTICULAR",   	"CLIENTE"."COMUNA",   	"CLIENTE"."CIUDAD",   	"CLIENTE"."FONO_P",   	"CLIENTE"."FONO_C",   	"CLIENTE"."CELULAR",	"NRO_CLIENTE_SAP"  ,	"FECHA_SAP"
					INTO 		:ls_dv,   				:ls_nombre,   				:ls_ap_pat,   					:ls_ap_mat,   					:ls_tipo_via,   						:ls_direcc,   							:ls_numero_part,   							:ls_depto,   									:ls_block,   									:ls_comuna,   				:ls_ciudad,   				:ls_fono_p,   				:ls_fono_c,   				:ls_celular,					:ls_nro_cliente_sap,		:ldt_fecha_sap
					FROM 	"CADENA",   "CLIENTE",   	"TIPO_VIA"  
					WHERE 	( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
								( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
								( ( "CADENA"."CODIGO" = :as_base ) AND  
								( "CADENA"."SERIE" = :as_serie ) AND  
								( "CADENA"."NUMERO" = :al_numero ) )   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						if isnull(ls_direcc) then ls_direcc='-'
						if isnull(ls_numero_part) then ls_numero_part='-'
						ls_direc_part		= ls_tipo_via+ ' '+ls_direcc+' N° '+ls_numero_part+' D: '+ls_depto+' B: '+ls_block
						if not isnull(ls_fono_p) and ls_fono_p <> '0' and ls_fono_p <> '-' then 
							ls_telefono_part	= ls_fono_p
						elseif not isnull(ls_fono_c) and ls_fono_c <> '0' and ls_fono_c <> '-' then 
							ls_telefono_part	= ls_fono_c
						else
							ls_telefono_part	= ls_celular
						end if
					end if
				
					INSERT INTO	"CLIENTE_REZAGO"  
								( "RUT", 		"BASE", 		"SERIE",  	"NUMERO", 		"NOMBRE",   	"AP_PATERNO",   	"AP_MATERNO",   	"DIRECCION_PART",   	"COMUNA_PART",   	"CIUDAD_PART",   "TELEFONO_PART",   	"FECHA_CREA",   	"USUARIO",   	"DV",   	"COD_PAGO",   "FOLIO",   	"FECHA_PAGO",   	"ESTADO",   	"CAJA",   	"FECHA_TRASPASO_REZAGO",   	"USUARIO_GENERA_TRASPASO",   	"COD_PARQUE",   	"MONEDA",   	"ESTADO_SAP",   	"ESTADO_SAP_CONTRATO",   	"NRO_CLIENTE_SAP",   	"FECHA_SAP" )  
					VALUES 	( :ll_rut,   	:as_base,   	:as_serie,   	:al_numero,   	:ls_nombre,   	:ls_ap_pat,   		:ls_ap_mat,   		:ls_direc_part,   			:ls_comuna,   			:ls_ciudad,   		:ls_telefono_part,   	:gdt_fec_sistema,  :gs_user,   		:ls_dv,   	:ls_tip_cob,   	:gl_folio,   	:ldt_fecha_pago,   'A',   				:ls_caja,   	null,   									null,   										:ll_cod_parque,   	:ls_moneda,   	0,   					0,   									:ls_nro_cliente_sap,   	:ldt_fecha_sap )  
					USING	sqlca;
					ls_rezago_sap			= 'S'
				end if
			end if
		end if
	
		INSERT INTO "INGRESO"  
					 ( "FOLIO",	 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", 	"BASE",		"RUT",	"USUARIO",		"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",			"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" ,	"COD_PARQUE", "FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP")
		VALUES 	 ( :gl_folio,	:ls_tip_cob,	  	:ldt_fecha_pago,	:ls_tipo_mov,	:ll_monto_pago,		1,						:as_serie,	:al_numero,		:ls_caja,	  		' ',				:ldb_valor_uf,	'A',				:as_base,	:ll_rut,	:gs_user ,	   	 null,			  	null,				  	null,					 	null,					    null,			  	null,			 	null,		 		:ldt_fecha_pago,		'0',					    'N',				  		null , 										:ll_cod_parque,  :ld_fecha_deposito,		:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap ) 
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;	
			
			INSERT INTO "INGRE"  
						 ( "FOLIO",	 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", 	"BASE",		"RUT",	"USUARIO",		"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"SERVIPAG",			"CODIGO_OTRO",	"TRASPASO_E" ,	"COD_PARQUE")
			VALUES 	 ( :gl_folio,	:ls_tip_cob,	  	:ldt_fecha_pago,	:ls_tipo_mov,	:ll_monto_pago,		1,						:as_serie,	:al_numero,		:ls_caja,	  		' ',				:ldb_valor_uf,	'A',				:as_base,	:ll_rut,	:gs_user ,	   	 null,			  	null,				  	null,					 	null,					    null,			  	null,		 		:ldt_fecha_pago,		'0',					    'N' ,					:ll_cod_parque) 
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;	
			else
				rollback;
			end if
			
			if ls_tip_cob = 'BE' then
				INSERT INTO "INGRESO_NEWSING"  
							 ( "FOLIO",	 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", 	"BASE",		"RUT",	"USUARIO",		"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",			"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" ,	"COD_PARQUE", "FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP")
				VALUES 	 ( :gl_folio,	:ls_tip_cob,	  	:ldt_fecha_pago,	:ls_tipo_mov,	:ll_monto_pago,		1,						:as_serie,	:al_numero,		:ls_caja,	  		' ',				:ldb_valor_uf,	'A',				:as_base,	:ll_rut,	:gs_user ,	   	 null,			  	null,				  	null,					 	null,					    null,			  	null,			 	null,		 		:ldt_fecha_pago,		'0',					    'N',				  		null , 										:ll_cod_parque,  :ld_fecha_deposito,		:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap ) 
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;	
				else
					rollback;
				end if
			end if
			
			INSERT INTO "DOCUMENTOS"  
							( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  	"FECHA_VENC", 	"COD_PAGO",		"ESTADO_CH" ,	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", 		"COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX", "FECHA_DEPOSITO")  
			VALUES 	 	( :gl_folio, 	:ls_tip_cob,			999,						999 , 		:ll_monto_tot, 	:ldt_fecha_pago,	:ls_forma_pag,		'C' , 				999 , 					' ' , 			:ldt_fecha_pago  , 	:ls_caja,			0,										0,									'0',											0,										0,									'0',											0 ,								null	,					1,												null,				null,					null,							'BE', 					:ld_fecha_deposito)  //	:ll_hora,	:ll_minuto,					null,	
			USING		sqlca;
			if sqlca.sqlcode = 0 then
				commit;
			else
				rollback;
			end if
			INSERT INTO "DOC_COB"  
							( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  	"FECHA_VENC", 	"COD_PAGO" ,	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", 		"COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX")  
			VALUES 	 	( :gl_folio, 	:ls_tip_cob,			999,						999 , 		:ll_monto_tot, 	:ldt_fecha_pago,	:ls_forma_pag,	999 , 					' ' , 			:ldt_fecha_pago  , 	:ls_caja,			0,										0,									'0',											0,										0,									'0',											0 ,								1,												null,				null,					null,							'BE')  //	:ll_hora,	:ll_minuto,					null,	
			USING		sqlca;
			if sqlca.sqlcode = 0 then
				commit;
			else
				rollback;
			end if
			
			if ls_tip_cob = 'BE' then
				INSERT INTO "DOCUMENTOS_NEWSING"  
								( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  	"FECHA_VENC", 	"COD_PAGO",		"ESTADO_CH" ,	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", 		"COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX", "FECHA_DEPOSITO")  
				VALUES 	 	( :gl_folio, 	:ls_tip_cob,			999,						999 , 		:ll_monto_tot, 	:ldt_fecha_pago,	:ls_forma_pag,		'C' , 				999 , 					' ' , 			:ldt_fecha_pago  , 	:ls_caja,			0,										0,									'0',											0,										0,									'0',											0 ,								null	,					1,												null,				null,					null,							'BE', 					:ld_fecha_deposito)  //	:ll_hora,	:ll_minuto,					null,	
				USING		sqlca;
				if sqlca.sqlcode = 0 then
					commit;
				else
					rollback;
				end if
			end if
			//
			if ls_tipo_mov = 'E' then
				SELECT	COUNT("SEGURO_ASOCIADOS"."COD_SEGURO"),	SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
				INTO		:ll_count_seg,												:ll_suma_seg
				FROM 	"SEGURO_ASOCIADOS"  
				WHERE ( "SEGURO_ASOCIADOS"."BASE" = :as_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :as_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :al_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
						  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
				USING	sqlca;
				if ll_count_seg > 0 then
					SELECT	DISTINCT ("SEGURO_ASOCIADOS"."MONEDA")
					INTO		:ls_moneda_seg
					FROM 	"SEGURO_ASOCIADOS"  
					WHERE ( "SEGURO_ASOCIADOS"."BASE" = :as_base ) AND  
							  ( "SEGURO_ASOCIADOS"."SERIE" = :as_serie ) AND  
							  ( "SEGURO_ASOCIADOS"."NUMERO" = :al_numero ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
							  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
					USING		sqlca;
					if ls_moneda_seg = '2' then
						ll_monto_seg	= long(round(ll_suma_seg * ldb_valor_uf,0))
					else
						ll_monto_seg	= long(ll_suma_seg)
					end if
					
					DECLARE x1 CURSOR FOR  
					SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO",
								"SEGURO_ASOCIADOS"."MONTO_PRIMA",
								"SEGURO_ASOCIADOS"."MONEDA"
					FROM 	"SEGURO_ASOCIADOS"  
					WHERE ( "SEGURO_ASOCIADOS"."BASE" = :as_base ) AND  
							  ( "SEGURO_ASOCIADOS"."SERIE" = :as_serie ) AND  
							  ( "SEGURO_ASOCIADOS"."NUMERO" = :al_numero ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' ) AND
							  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
					USING	Trans_1;
					open x1;
					if Trans_1.sqlcode=0 then
						do while Trans_1.sqlcode=0
							fetch x1 into :ll_cod_seguro, :ldb_prima, :ls_moneda;
							if not isnull(ll_cod_seguro) then
								ls_tipo_mov_seg	= string(ll_cod_seguro)
								if ls_moneda='2' then
									ll_monto			= round(ldb_prima * ldb_valor_uf,0)
								else
									ll_monto			= ldb_prima
								end if
								
								ai_cuotas_pag				= 1
								if ls_tipo_mov<>'F' and ls_tipo_mov<>'E' and ls_tipo_mov<>'K' and ls_tipo_mov<>'U' then ai_cuotas_pag=0
								ai_cuotas_pag		= 0
								ls_rezago_sap		= f_retorna_rezago_sap(' ',as_base,as_serie,al_numero,ls_tipo_mov)
								if isnull(ls_rezago_sap) then  ls_rezago_sap = 'N'
								gs_rezago			= ' '
								
//								ll_ctas_pag_s_sap	= f_retorna_ctas_pag_sap(as_base,as_serie,al_numero,ls_tipo_mov,ls_rezago_sap)
//								if isnull(ll_ctas_pag_s_sap) or ll_ctas_pag_s_sap=0 then ll_ctas_pag_s_sap = 0
								ll_ctas_pag_s_sap = 0	//ll_ctas_pag_s_sap + ai_cuotas_pag
								
								ldb_monto_sap		= f_retornar_monto_sap(as_base, as_serie, al_numero, gs_rezago, ls_tip_cob, gl_folio, ldt_fecha_pago, ls_tipo_mov_seg,ll_monto,ldb_valor_uf, '0',ai_cuotas_pag)
								if isnull(ldb_monto_sap) then ldb_monto_sap=0
								
								ls_moneda_sap		= f_retornar_moneda_sap(as_base, as_serie, al_numero, gs_rezago, ls_tip_cob, gl_folio, ldt_fecha_pago, ls_tipo_mov_seg,ll_monto,ldb_valor_uf, '0')
								if isnull(ls_moneda_sap) then ls_moneda_sap='2'
								
								INSERT INTO "INGRESO"  
											 ( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",		"MONTO",	"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"COD_PARQUE", "FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )
								VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	:ls_tipo_mov_seg,	:ll_monto,	0,						:as_serie,	:al_numero,		:ls_caja,			' ',				:ldb_valor_uf,		'A',				:as_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				null,				:ldt_fecha_pago,	'0',						'N',					null,									:ll_cod_parque, :ld_fecha_deposito,		:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap  )  
								USING		Trans_2;
								if Trans_2.sqlcode=0 then
									commit using Trans_2;
									if ls_tip_cob = 'BE' then
										INSERT INTO "INGRESO_NEWSING"  
													 ( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",		"MONTO",	"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"COD_PARQUE", "FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )
										VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	:ls_tipo_mov_seg,	:ll_monto,	0,						:as_serie,	:al_numero,		:ls_caja,			' ',				:ldb_valor_uf,		'A',				:as_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				null,				:ldt_fecha_pago,	'0',						'N',					null,									:ll_cod_parque, :ld_fecha_deposito,		:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap  )  
										USING		Trans_2;
										if Trans_2.sqlcode=0 then
											commit using Trans_2;
										else
											rollback using Trans_2;
										end if
									end if
								else
									rollback using Trans_2;
								end if
							end if
							setnull(ll_cod_seguro)
						loop
					end if
					close x1;
				end if
			end if	
			
			wf_genera_be_pac(ldb_valor_uf,al_indi,ls_tipo_mov,ldt_fecha_pago)
			CHOOSE CASE as_base
				CASE 'O'
					SELECT	"OFERTA_V"."CTA_PAG_S",	"OFERTA_V"."CTA_PAG_M",	"OFERTA_V"."TOT_PAGADO",	"OFERTA_V"."TOT_PAGADO_M"  
					INTO 		:ll_ctas_pag_s, 			:ll_ctas_pag_m,			:ll_tot_pagado_s, 			:ll_tot_pagado_m  
					FROM 		"OFERTA_V",	"CADENA",	"PAGO_OFERTA"  
					WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
							 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
							 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
							 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
							 (("CADENA"."CODIGO" = :as_base ) AND  
							 ( "CADENA"."SERIE" = :as_serie ) AND  
							 ( "CADENA"."NUMERO" = :al_numero ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if ls_tipo_mov='E' then
							ll_ctas_pag_s ++
							ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_pago
							UPDATE	"OFERTA_V"  
							SET 		"CTA_PAG_S" = :ll_ctas_pag_s,   
										"TOT_PAGADO" = :ll_tot_pagado_s
							WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :al_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						elseif ls_tipo_mov='F' then
							ll_ctas_pag_m++
							ll_tot_pagado_m	= ll_tot_pagado_m + ll_monto_pago
							UPDATE	"OFERTA_V"  
							SET 		"CTA_PAG_M" = :ll_ctas_pag_m,   
										"TOT_PAGADO_M" = :ll_tot_pagado_m  
							WHERE  ( "OFERTA_V"."SERIE" = :as_serie ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :al_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
					end if
				CASE 'L'
					SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",	"ANEXO_LIBERADOR"."CTA_PAG_M"  
					INTO 		:ll_tot_pagado_s,						:ll_ctas_pag_s  
					FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
					WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
							 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
							 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
							 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
							 (("CADENA"."CODIGO" = :as_base ) AND  
							 ( "CADENA"."SERIE" = :as_serie ) AND  
							 ( "CADENA"."NUMERO" = :al_numero ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_ctas_pag_s ++
						ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_pago
						if ls_tipo_mov='E' then
							UPDATE	"ANEXO_LIBERADOR"  
							SET 		"TOT_PAGADO" = :ll_tot_pagado_s,   
										"CTA_PAG_M" = :ll_ctas_pag_s  
							WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
									 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
					end if
					
				CASE 'P'
					SELECT	"PAGARE"."TOT_PAGADO",	"PAGARE"."CTA_PAG_LA"   
					INTO 		:ll_tot_pagado_s,			:ll_ctas_pag_s  
					FROM		"CADENA",	"PAGARE"  
					WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
							 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
							 (("CADENA"."CODIGO" = :as_base ) AND  
							 ( "CADENA"."SERIE" = :as_serie ) AND  
							 ( "CADENA"."NUMERO" = :al_numero ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_ctas_pag_s ++
						ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_pago
						if ls_tipo_mov='E' then
							UPDATE	"PAGARE"  
							SET 		"TOT_PAGADO" = :ll_tot_pagado_s,   
										"CTA_PAG_LA" = :ll_ctas_pag_s  
							WHERE  ( "PAGARE"."SERIE_P" = :as_serie ) AND  
									 ( "PAGARE"."NRO_PAGARE" = :al_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
					end if
					
				CASE 'R'
					SELECT	"REPACTA_MANTENCION"."CTAS_PAGADAS",	"REPACTA_MANTENCION"."TOTAL_PAGADO"  
					INTO 		:ll_ctas_pag_s,								:ll_tot_pagado_s  
					FROM 		"CADENA",	"REPACTA_MANTENCION"  
					WHERE  ( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
							 ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
							 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
							 (("CADENA"."CODIGO" = :as_base ) AND  
							 ( "CADENA"."SERIE" = :as_serie ) AND  
							 ( "CADENA"."NUMERO" = :al_numero ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_ctas_pag_s ++
						ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_pago
						if ls_tipo_mov='E' then
							UPDATE	"REPACTA_MANTENCION"  
							SET 		"CTAS_PAGADAS" = :ll_ctas_pag_s,   
										"TOTAL_PAGADO" = :ll_tot_pagado_s  
							WHERE  ( "REPACTA_MANTENCION"."BASE" = :as_base ) AND  
									 ( "REPACTA_MANTENCION"."SERIE" = :as_serie ) AND  
									 ( "REPACTA_MANTENCION"."NUMERO" = :al_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if	
					end if
					
				CASE 'D'
					SELECT	"DERECHO"."TOT_PAGADO",	"DERECHO"."CTA_PAG_LA"  
					INTO 		:ll_tot_pagado_s,			:ll_ctas_pag_s  
					FROM 		"CADENA",	"DERECHO"  
					WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
							 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
							 (("CADENA"."CODIGO" = :as_base ) AND  
							 ( "CADENA"."SERIE" = :as_serie ) AND  
							 ( "CADENA"."NUMERO" = :al_numero ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_ctas_pag_s ++
						ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_pago
						if ls_tipo_mov='E' then
							UPDATE	"DERECHO"  
							SET 		"TOT_PAGADO" = :ll_tot_pagado_s,   
										"CTA_PAG_LA" = :ll_ctas_pag_s  
							WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
									 ( "DERECHO"."NRO_PAGARE" = :al_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
					end if
					
				CASE 'A'
					SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",	"ANEXO_AUMENTO"."CTA_PAG_M"  
					INTO 		:ll_tot_pagado_s,					:ll_ctas_pag_s  
					FROM 		"ANEXO_AUMENTO",	"CADENA",	"PAGO_AUMENTO"  
					WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
							 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
							 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
							 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
							 (("CADENA"."CODIGO" = :as_base ) AND  
							 ( "CADENA"."SERIE" = :as_serie ) AND  
							 ( "CADENA"."NUMERO" = :al_numero ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_ctas_pag_s ++
						ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_pago
						if ls_tipo_mov='E' then
							UPDATE	"ANEXO_AUMENTO"  
							SET 		"CTA_PAG_M" = :ll_ctas_pag_s,   
										"TOT_PAGADO" = :ll_tot_pagado_s  
							WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
									 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )   
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
					FROM 		"CADENA",	"CONTRATO"  
					WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
							 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
							 (("CADENA"."CODIGO" = :as_base ) AND  
							 ( "CADENA"."SERIE" = :as_serie ) AND  
							 ( "CADENA"."NUMERO" = :al_numero ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_ctas_pag_m ++
						if ls_tipo_mov='F' then
							UPDATE	"CONTRATO"  
							SET 		"CTA_PAG_M" = :ll_ctas_pag_m  
							WHERE  ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
									 ( "CONTRATO"."NRO_CONTRATO" = :al_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if	
					end if
			END CHOOSE
			DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:as_base,:as_serie,:al_numero,'M');
			EXECUTE sp_nuevo_cadena_mora;
			if ls_tipo_mov = 'E' then
				if ll_interes > 0 then
					ai_cuotas_pag				= 1
					if ls_tipo_mov<>'F' and ls_tipo_mov<>'E' and ls_tipo_mov<>'K' and ls_tipo_mov<>'U' then ai_cuotas_pag=0
					ai_cuotas_pag		= 0
					ls_rezago_sap		= f_retorna_rezago_sap(' ',as_base,as_serie,al_numero,'G')
					if isnull(ls_rezago_sap) then  ls_rezago_sap = 'N'
					gs_rezago			= ' '
					
//					ll_ctas_pag_s_sap	= f_retorna_ctas_pag_sap(as_base,as_serie,al_numero,'G',ls_rezago_sap)
//					if isnull(ll_ctas_pag_s_sap) or ll_ctas_pag_s_sap=0 then ll_ctas_pag_s_sap = 0
					ll_ctas_pag_s_sap = 0	// ll_ctas_pag_s_sap + ai_cuotas_pag
					
					ldb_monto_sap		= f_retornar_monto_sap(as_base, as_serie, al_numero, gs_rezago, 'BE', gl_folio, ldt_fecha_pago, 'G',ll_interes,ldb_valor_uf, '0',ai_cuotas_pag)
					if isnull(ldb_monto_sap) then ldb_monto_sap=0
					
					ls_moneda_sap		= f_retornar_moneda_sap(as_base, as_serie, al_numero, gs_rezago, 'BE', gl_folio, ldt_fecha_pago, 'G',ll_interes,ldb_valor_uf, '0')
					if isnull(ls_moneda_sap) then ls_moneda_sap='2'
					INSERT INTO "INGRESO"  
								 ( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",		"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , "COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )
					VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	'G',				:ll_interes,		0,						:as_serie,	:al_numero,		:ls_caja,			' ',				:ldb_valor_uf,		'A',				:as_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				null,				:ldt_fecha_pago,	'0',						'N',					null, 									:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap  )  
					USING		sqlca;
//					ls_tip_cob = 'CI'
					if sqlca.sqlcode=0 then
						commit;

						if ls_tip_cob = 'BE' then
							INSERT INTO "INGRESO_NEWSING"  
										 ( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",		"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , "COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )
							VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	'G',				:ll_interes,		0,						:as_serie,	:al_numero,		:ls_caja,			' ',				:ldb_valor_uf,		'A',				:as_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				null,				:ldt_fecha_pago,	'0',						'N',					null, 									:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap  )  
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
				end if
				if ll_gasto_cob > 0 then
					ai_cuotas_pag				= 1
					if ls_tipo_mov<>'F' and ls_tipo_mov<>'E' and ls_tipo_mov<>'K' and ls_tipo_mov<>'U' then ai_cuotas_pag=0
					ai_cuotas_pag		= 0
					ls_rezago_sap		= f_retorna_rezago_sap(' ',as_base,as_serie,al_numero,'J')
					if isnull(ls_rezago_sap) then  ls_rezago_sap = 'N'
					gs_rezago			= ' '
					
//					ll_ctas_pag_s_sap	= f_retorna_ctas_pag_sap(as_base,as_serie,al_numero,'J',ls_rezago_sap)
//					if isnull(ll_ctas_pag_s_sap) or ll_ctas_pag_s_sap=0 then ll_ctas_pag_s_sap = 0
					ll_ctas_pag_s_sap = 0	//ll_ctas_pag_s_sap + ai_cuotas_pag
					
					ldb_monto_sap		= f_retornar_monto_sap(as_base, as_serie, al_numero, gs_rezago, 'BE', gl_folio, ldt_fecha_pago, 'J',ll_gasto_cob,ldb_valor_uf, '0',ai_cuotas_pag)
					if isnull(ldb_monto_sap) then ldb_monto_sap=0
					
					ls_moneda_sap		= f_retornar_moneda_sap(as_base, as_serie, al_numero, gs_rezago, 'BE', gl_folio, ldt_fecha_pago, 'J',ll_gasto_cob,ldb_valor_uf, '0')
					if isnull(ls_moneda_sap) then ls_moneda_sap='2'
					INSERT INTO "INGRESO"  
								 ( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"COD_PARQUE", "FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )
					VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	'J',					:ll_gasto_cob,		0,						:as_serie,	:al_numero,		:ls_caja,			' ',				:ldb_valor_uf,		'A',				:as_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				null,				:ldt_fecha_pago,	'0',						'N',					null, 									 :ll_cod_parque, :ld_fecha_deposito,		:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap  )  
					USING		sqlca;
//					ls_tip_cob='CI'
					if sqlca.sqlcode=0 then
						commit;
						
						if ls_tip_cob = 'BE' then
							INSERT INTO "INGRESO_NEWSING"  
										 ( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"COD_PARQUE", "FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )
							VALUES 	 ( :gl_folio,	'CI',				:ldt_fecha_pago,	'J',					:ll_gasto_cob,		0,						:as_serie,	:al_numero,		:ls_caja,			' ',				:ldb_valor_uf,		'A',				:as_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				null,				:ldt_fecha_pago,	'0',						'N',					null, 									 :ll_cod_parque, :ld_fecha_deposito,		:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap  )  
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
				end if
			elseif ls_tipo_mov = 'F' then	
				if ll_interes > 0 then
					ai_cuotas_pag				= 1
					if ls_tipo_mov<>'F' and ls_tipo_mov<>'E' and ls_tipo_mov<>'K' and ls_tipo_mov<>'U' then ai_cuotas_pag=0
					ai_cuotas_pag		= 0
					ls_rezago_sap		= f_retorna_rezago_sap(' ',as_base,as_serie,al_numero,'P')
					if isnull(ls_rezago_sap) then  ls_rezago_sap = 'N'
					gs_rezago			= ' '
					
//					ll_ctas_pag_s_sap	= f_retorna_ctas_pag_sap(as_base,as_serie,al_numero,'P',ls_rezago_sap)
//					if isnull(ll_ctas_pag_s_sap) or ll_ctas_pag_s_sap=0 then ll_ctas_pag_s_sap = 0
					ll_ctas_pag_s_sap = 0	// ll_ctas_pag_s_sap + ai_cuotas_pag
					
					ldb_monto_sap		= f_retornar_monto_sap(as_base, as_serie, al_numero, gs_rezago, 'BE', gl_folio, ldt_fecha_pago, 'P',ll_interes,ldb_valor_uf, '0',ai_cuotas_pag)
					if isnull(ldb_monto_sap) then ldb_monto_sap=0
					
					ls_moneda_sap		= f_retornar_moneda_sap(as_base, as_serie, al_numero, gs_rezago, 'BE', gl_folio, ldt_fecha_pago, 'P',ll_interes,ldb_valor_uf, '0')
					if isnull(ls_moneda_sap) then ls_moneda_sap='2'
					INSERT INTO "INGRESO"  
								 ( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",		"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO", 	"COD_PARQUE", 	"FECHA_DEPOSITO" )
					VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	'P',					:ll_interes,		0,						:as_serie,	:al_numero,		:ls_caja,			' ',				:ldb_valor_uf,		'A',				:as_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				null,				:ldt_fecha_pago,	'0',						'N',					null , 										:ll_cod_parque, 	:ld_fecha_deposito)  
					USING		sqlca;
//					ls_tip_cob = 'BE'
					if sqlca.sqlcode=0 then
						commit;
						
						INSERT INTO "INGRESO_NEWSING"  
									 ( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",		"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO", 	"COD_PARQUE", 	"FECHA_DEPOSITO" )
						VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	'P',					:ll_interes,		0,						:as_serie,	:al_numero,		:ls_caja,			' ',				:ldb_valor_uf,		'A',				:as_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				null,				:ldt_fecha_pago,	'0',						'N',					null , 										:ll_cod_parque, 	:ld_fecha_deposito)  
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
				if ll_gasto_cob > 0 then
					ai_cuotas_pag				= 1
					if ls_tipo_mov<>'F' and ls_tipo_mov<>'E' and ls_tipo_mov<>'K' and ls_tipo_mov<>'U' then ai_cuotas_pag=0
					ai_cuotas_pag		= 0
					ls_rezago_sap		= f_retorna_rezago_sap(' ',as_base,as_serie,al_numero,'R')
					if isnull(ls_rezago_sap) then  ls_rezago_sap = 'N'
					gs_rezago			= ' '
					
//					ll_ctas_pag_s_sap	= f_retorna_ctas_pag_sap(as_base,as_serie,al_numero,'R',ls_rezago_sap)
//					if isnull(ll_ctas_pag_s_sap) or ll_ctas_pag_s_sap=0 then ll_ctas_pag_s_sap = 0
					ll_ctas_pag_s_sap = 0	//ll_ctas_pag_s_sap + ai_cuotas_pag
					
					ldb_monto_sap		= f_retornar_monto_sap(as_base, as_serie, al_numero, gs_rezago, 'BE', gl_folio, ldt_fecha_pago, 'R',ll_gasto_cob,ldb_valor_uf, '0',ai_cuotas_pag)
					if isnull(ldb_monto_sap) then ldb_monto_sap=0
					
					ls_moneda_sap		= f_retornar_moneda_sap(as_base, as_serie, al_numero, gs_rezago, 'BE', gl_folio, ldt_fecha_pago, 'R',ll_gasto_cob,ldb_valor_uf, '0')
					if isnull(ls_moneda_sap) then ls_moneda_sap='2'
					INSERT INTO "INGRESO"  
								 ( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", "FECHA_DEPOSITO" )
					VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	'R',				:ll_gasto_cob,		0,						:as_serie,	:al_numero,		:ls_caja,			' ',				:ldb_valor_uf,		'A',				:as_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				null,				:ldt_fecha_pago,	'0',						'N',					null , 										:ll_cod_parque, :ld_fecha_deposito)  
					USING		sqlca;
//					ls_tip_cob = 'BE'
					if sqlca.sqlcode=0 then
						commit;
						
						INSERT INTO "INGRESO_NEWSING"  
									 ( "FOLIO",	"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", "FECHA_DEPOSITO" )
						VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	'R',				:ll_gasto_cob,		0,						:as_serie,	:al_numero,		:ls_caja,			' ',				:ldb_valor_uf,		'A',				:as_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				null,				:ldt_fecha_pago,	'0',						'N',					null , 										:ll_cod_parque, :ld_fecha_deposito)  
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
			UPDATE	"CUPONERAS_DETALLE"  
			SET 		"ESTADO_PAGO_CUPON" = 'C',   
						"TIPO_COB_PAGO" = :ls_tip_cob,   
						"FOLIO_PAGO" = :gl_folio,   
						"FECHA_PAGO" = :ldt_fecha_pago  
			WHERE 	"CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if		
		else
			rollback;
			SELECT	"CUPONERAS_DETALLE"."TIPO_COB_PAGO",	"CUPONERAS_DETALLE"."FOLIO_PAGO"  
			INTO 		:ls_tipo_cob,									:ll_folio_pago  
			FROM		"CUPONERAS_DETALLE"  
			WHERE  ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon ) AND  
					 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'C' )   
			USING		Trans_1;
			if Trans_1.sqlcode=0 then
				tab_1.tabpage_2.dw_cargar.setitem(al_indi,'estado','999')
			end if						
		end if
	end if	
else
	ldt_fecha_reintento	= datetime(RelativeDate(date(ldt_fecha_pago), 7),time('00:00:00'))
	ldt_fecha_aux			= ldt_fecha_reintento
	ls_fec_cred				= mid(string(ldt_fecha_aux,'ddmmyyyy'),1,4)
	ls_dia_cred				= UPPER(dayname( date(ldt_fecha_reintento) ))
	if ls_dia_cred='MONDAY' or ls_dia_cred='LUNES' then 
		ls_dia_cred	= 'Lunes'
	elseif ls_dia_cred='TUESDAY' or ls_dia_cred='MARTES' then 
		ls_dia_cred	= 'Martes' 
	elseif ls_dia_cred='WEDNESDAY' or ls_dia_cred='MIERCOLES' then 
		ls_dia_cred	= 'Miercoles' 
	elseif ls_dia_cred='THURSDAY' or ls_dia_cred='JUEVES' then 
		ls_dia_cred	= 'Jueves'
	elseif ls_dia_cred='FRIDAY' or ls_dia_cred='VIERNES' then
		ls_dia_cred	= 'Viernes'
	elseif ls_dia_cred='SATURDAY' or ls_dia_cred='SABADO' then
		ls_dia_cred	= 'Sabado'
	elseif ls_dia_cred='SUNDAY' or ls_dia_cred='DOMINGO' then 
		ls_dia_cred	= 'Domingo'
	end if
	
	SELECT	"PER_DIAS_FESTIVOS"."DESCRIPCION"  
	INTO 		:ls_descrip  
	FROM 		"PER_DIAS_FESTIVOS"  
	WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_fec_cred
	USING		sqlca;
	if sqlca.sqlcode=100 then
		if ls_dia_cred='Sabado' or ls_dia_cred='Domingo' then
			if ll_cod_banco=16 then //BCI
				ldt_fecha_reintento	= datetime(relativedate(date(ldt_fecha_aux), 3 ))
			else
				ldt_fecha_reintento	= datetime(relativedate(date(ldt_fecha_aux), 4 ))
			end if
		end if
	else
		ldt_fecha_aux					= datetime(relativedate(date(ldt_fecha_reintento), 1 ))
		if ls_dia_cred='Viernes' or ls_dia_cred='Sabado' then
			if ll_cod_banco=16 then //BCI
				ldt_fecha_reintento	= datetime(relativedate(date(ldt_fecha_aux), 3 ))
			else
				ldt_fecha_reintento	= datetime(relativedate(date(ldt_fecha_aux), 4 ))
			end if
		end if
	end if
	SELECT	sysdate
	INTO 		:gdt_fec_sistema  
	FROM 		"TASA"  
	WHERE 	"TASA"."LOOK" = 1   ;

	wf_email_rechazo_pac(al_indi,as_base,as_serie,al_numero,ls_cod_rechazo)
	
	if ls_tipo_mov='E' then
		if isnull(ll_numero_cupon) then ll_numero_cupon=0
		INSERT INTO   "SOL_PAC_RECUPERA_RECHAZO"  
						( "CODIGO_RECHAZO",	"FECHA_CARGO",		"FECHA_CARGO_ORI",	"RUT",	"DV",		"BASE",		"SERIE",		"NUMERO",	"NUMERO_CUPON",	"MONTO_PAGO",		"FECHA_PAGO",		"ESTADO",	"CUENTA_CARGO",	"COD_BANCO",	"CODIGO_GRUPO",	"FECHA_PAGO_REINTENTO",		"FECHA_PAGO_REINTENTO_MANT",	"FECHA_SISTEMA",	"ESTADO_REG" )  
		VALUES 		( :ls_cod_rechazo,			:ldt_fecha_cargo,		:ldt_fecha_ori,				:ll_rut,	:ls_dv,	:as_base,	:as_serie,	:al_numero,	:ll_numero_cupon,	:ll_monto_pago,	:ldt_fecha_pago,	:ls_estado,	:ls_cuenta,			:ll_cod_banco,	:ll_max,				:ldt_fecha_reintento,		Null,									:gdt_fec_sistema,	NULL )  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	elseif ls_tipo_mov='F' then
		if isnull(ll_numero_cupon) then ll_numero_cupon=0 
		INSERT INTO   "SOL_PAC_RECUPERA_RECHAZO"  
						( "CODIGO_RECHAZO",	"FECHA_CARGO",		"FECHA_CARGO_ORI",	"RUT",	"DV",		"BASE",		"SERIE",		"NUMERO",	"NUMERO_CUPON",	"MONTO_PAGO",		"FECHA_PAGO",		"ESTADO",	"CUENTA_CARGO",	"COD_BANCO",	"CODIGO_GRUPO",	"FECHA_PAGO_REINTENTO",		"FECHA_PAGO_REINTENTO_MANT",	"FECHA_SISTEMA",	"ESTADO_REG"  )  
		VALUES 		( :ls_cod_rechazo,			:ldt_fecha_cargo,		:ldt_fecha_ori,				:ll_rut,	:ls_dv,	:as_base,	:as_serie,	:al_numero,	:ll_numero_cupon,	:ll_monto_pago,	:ldt_fecha_pago,	:ls_estado,	:ls_cuenta,			:ll_cod_banco,	:ll_max,				Null,								:ldt_fecha_reintento,			:gdt_fec_sistema,	NULL )  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
end if	
end subroutine

public function double wf_valor_cred_cta_corr (string as_base, string as_serie, double al_numero);double	valor_cuota_cta_corr

CHOOSE CASE as_base
	CASE 'O'
		SELECT	"PAGO_OFERTA"."VALOR_CUOTA"  
		INTO 		:valor_cuota_cta_corr  
		FROM 		"CADENA",	"OFERTA_V", 	"PAGO_OFERTA"  
		WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

////	CASE 'C'
//		SELECT	"CONTRATO"."VALOR_CUOTA"  
//		INTO 		:ls_moneda  
//		FROM 		"CADENA",   "CONTRATO"  
//		WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
//				 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
//				 (("CADENA"."CODIGO" = :as_base ) AND  
//				 ( "CADENA"."SERIE" = :as_serie ) )   ;
//
	CASE 'L'
		SELECT	"PAGO_LIBERADOR"."VALOR_CUOTA"  
		INTO 		:valor_cuota_cta_corr  
		FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
		WHERE  ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
				 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
				 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
				 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
				 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;
	CASE 'P'
		SELECT	"PAGARE"."VALOR_CUO"  
		INTO 		:valor_cuota_cta_corr  
		FROM 		"CADENA",	"PAGARE"  
		WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
				 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

	CASE 'A'
		SELECT	"PAGO_AUMENTO"."VALOR_CUOTA"  
		INTO 		:valor_cuota_cta_corr  
		FROM 		"ANEXO_AUMENTO",	"CADENA",			"PAGO_AUMENTO"  
		WHERE  ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
				 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
				 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
				 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
				 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

//	CASE 'R'
//		SELECT	"REPACTA_MANTENCION"."TIPO_MONEDA"  
//		INTO 		:ls_moneda  
//		FROM 		"CADENA",	"REPACTA_MANTENCION"  
//		WHERE  ( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
//				 ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
//				 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
//				 (("CADENA"."CODIGO" = :as_base ) AND  
//				 ( "CADENA"."SERIE" = :as_serie ) AND  
//				 ( "CADENA"."NUMERO" = :al_numero ) )   ;
//
END CHOOSE
Return valor_cuota_cta_corr

end function

public subroutine wf_email_rechazo_pac (long al_indice, string as_base, string as_serie, double ad_numero, string as_cod_rechazo);string	ls_email_de,ls_asunto,ls_cuerpo_email,ls_glosa_rechazo,linea_1,linea_2,linea_3,ls_email_para,ls_res
long	ll_cod_parq
date	ld_fech_carg

//ll_max				= tab_1.tabpage_2.dw_cargar.getitemnumber(al_indi,'codigo_grupo')
ld_fech_carg		= date(tab_1.tabpage_2.dw_cargar.getitemdatetime(al_indice,"fecha_cargo"))
ls_email_para		= 'aviso_pac@nuestrosparques.cl'
SELECT	"SOL_PAC_RECHAZOS"."DESCRIPCION"  
INTO		:ls_glosa_rechazo  
FROM 	"SOL_PAC_RECHAZOS"  
WHERE 	"SOL_PAC_RECHAZOS"."CODIGO" = :as_cod_rechazo
USING	sqlca;

ls_email_de			= 'sistema@nuestrosparques.cl' 
ls_asunto			= 'Rechazo PAC Ctto. '+as_base + ' '+as_serie+' '+string(ad_numero)
linea_1				= 'Rechazo PAC Ctto.: '+as_base + ' '+as_serie+' '+string(ad_numero)
linea_3				= ' Motivo Rechazo: '+as_cod_rechazo+'-'+ls_glosa_rechazo
linea_2				= ' Fecha Cargo: '+string(ld_fech_carg)
ls_cuerpo_email	= linea_1+' '+linea_2+' '+linea_3

if not isnull(ls_email_de) and ls_email_de<>'' and not isnull(ls_asunto) and ls_asunto<>'' and not isnull(ls_cuerpo_email) and ls_cuerpo_email<>'' then
	SELECT	ENVIARMAIL(:ls_email_de,:ls_email_para,:ls_asunto,:ls_cuerpo_email) 
	INTO 		:ls_res
	FROM 	DUAL;
	if ls_res='OK' then
	else
		messagebox('Advertencia','Email a contrato '+as_base+' '+as_serie+' '+string(ad_numero)+' No fue Enviado')
	end if	
end if
end subroutine

on w_envio_archivo_pac.create
this.sle_1=create sle_1
this.dw_boleta=create dw_boleta
this.dw_recupera_uni=create dw_recupera_uni
this.dw_recupera_pac=create dw_recupera_pac
this.tab_1=create tab_1
this.dw_print_mant=create dw_print_mant
this.dw_print_cred=create dw_print_cred
this.cb_print=create cb_print
this.dw_pac_detalle=create dw_pac_detalle
this.dw_envio_archivo_pac_mant=create dw_envio_archivo_pac_mant
this.cb_cuenta_corriente=create cb_cuenta_corriente
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.dw_envio_archivo_pac_cred=create dw_envio_archivo_pac_cred
this.gb_1=create gb_1
this.Control[]={this.sle_1,&
this.dw_boleta,&
this.dw_recupera_uni,&
this.dw_recupera_pac,&
this.tab_1,&
this.dw_print_mant,&
this.dw_print_cred,&
this.cb_print,&
this.dw_pac_detalle,&
this.dw_envio_archivo_pac_mant,&
this.cb_cuenta_corriente,&
this.cb_limpiar,&
this.cb_cerrar,&
this.dw_envio_archivo_pac_cred,&
this.gb_1}
end on

on w_envio_archivo_pac.destroy
destroy(this.sle_1)
destroy(this.dw_boleta)
destroy(this.dw_recupera_uni)
destroy(this.dw_recupera_pac)
destroy(this.tab_1)
destroy(this.dw_print_mant)
destroy(this.dw_print_cred)
destroy(this.cb_print)
destroy(this.dw_pac_detalle)
destroy(this.dw_envio_archivo_pac_mant)
destroy(this.cb_cuenta_corriente)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.dw_envio_archivo_pac_cred)
destroy(this.gb_1)
end on

event open;date 		ld_fecha,ld_fecha_proc,ld_fecha_proc_fin
datetime	ldt_fec_max_envio

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_envio_archivo_pac)
idt_fecha_hoy										= date(gdt_fec_sistema)
tab_1.tabpage_1.dw_lista_envio_archivo_pac.settransobject(sqlca)
tab_1.tabpage_2.dw_recupera_archivo.settransobject(sqlca)
tab_1.tabpage_2.dw_cargar.settransobject(sqlca)
tab_1.tabpage_5.dw_lista_universo.settransobject(sqlca)
tab_1.tabpage_5.dw_lista_universo.retrieve()
tab_1.tabpage_6.dw_lista_pagos_enviados.settransobject(sqlca)
tab_1.tabpage_7.dw_pac_mora.settransobject(sqlca)
tab_1.tabpage_7.dw_pac_mora.retrieve()
dw_recupera_uni.settransobject(sqlca)
dw_envio_archivo_pac_cred.settransobject(sqlca)
dw_envio_archivo_pac_mant.settransobject(sqlca)
dw_print_cred.settransobject(sqlca)
dw_print_mant.settransobject(sqlca)
dw_pac_detalle.settransobject(sqlca)
dw_recupera_pac.settransobject(sqlca)
tab_1.tabpage_3.dw_errores.settransobject(sqlca)
tab_1.tabpage_3.dw_errores.retrieve()
tab_1.tabpage_4.dw_no_aplicar.settransobject(sqlca)
tab_1.tabpage_6.em_fec_ini_env.text			= string(idt_fecha_hoy,'dd/mm/yyyy')
tab_1.tabpage_6.em_fec_fin_env.text			= string(idt_fecha_hoy,'dd/mm/yyyy')
tab_1.tabpage_1.em_fec_ini.text 				= string(gdt_fec_sistema,'dd/mm/yyyy')
tab_1.tabpage_2.em_fec_ini_rec.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
tab_1.tabpage_4.em_fec_ini_no.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
ld_fecha												= date(gdt_fec_sistema)
ld_fecha_proc										= RelativeDate(ld_fecha, 7)
tab_1.tabpage_1.em_fec_fin.text				= string(ld_fecha_proc,"dd/mm/yyyy")
tab_1.tabpage_2.em_fec_fin_rec.text			= string(ld_fecha_proc,"dd/mm/yyyy")
tab_1.tabpage_4.em_fec_fin_hasta.text		= string(ld_fecha_proc,"dd/mm/yyyy")
tab_1.tabpage_5.cb_grabar_man.enabled		= false
tab_1.tabpage_2.cb_grabar.enabled			= false
gs_ventana											= 'w_envio_archivo_pac'
f_valida_objeto2()
tab_1.tabpage_1.em_fec_ini.setfocus()
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type sle_1 from uo_convierte_numero within w_envio_archivo_pac
boolean visible = false
integer x = 1349
integer y = 2452
integer width = 494
integer taborder = 50
boolean hideselection = false
end type

type dw_boleta from datawindow within w_envio_archivo_pac
boolean visible = false
integer x = 1321
integer y = 1968
integer width = 686
integer height = 400
integer taborder = 40
string title = "none"
string dataobject = "dwe_boleta_electronica_envio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_recupera_uni from datawindow within w_envio_archivo_pac
boolean visible = false
integer x = 2345
integer y = 2404
integer width = 192
integer height = 316
string dataobject = "dwe_recuperar_universo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_recupera_pac from datawindow within w_envio_archivo_pac
boolean visible = false
integer x = 2587
integer y = 2420
integer width = 233
integer height = 412
string title = "none"
string dataobject = "dwe_recuperar_pac"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_envio_archivo_pac
event create ( )
event destroy ( )
integer x = 32
integer y = 68
integer width = 3931
integer height = 1796
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_4 tabpage_4
tabpage_3 tabpage_3
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_4=create tabpage_4
this.tabpage_3=create tabpage_3
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.tabpage_7=create tabpage_7
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_4,&
this.tabpage_3,&
this.tabpage_5,&
this.tabpage_6,&
this.tabpage_7}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_4)
destroy(this.tabpage_3)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
destroy(this.tabpage_7)
end on

event selectionchanged;CHOOSE CASE tab_1.SelectedTab
	CASE 1
		tab_1.tabpage_1.em_fec_ini.setfocus()
	CASE 2
		tab_1.tabpage_2.em_fec_ini_rec.setfocus()
	CASE 3
		tab_1.tabpage_4.em_fec_ini_no.setfocus()
	CASE 4
		tab_1.tabpage_3.dw_errores.setfocus()
	CASE 5
		tab_1.tabpage_5.dw_lista_universo.setfocus()
	CASE 6
		tab_1.tabpage_6.em_fec_ini_env.setfocus()
END CHOOSE

end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3895
integer height = 1668
long backcolor = 67108864
string text = " Envio Archivo"
long tabtextcolor = 33554432
string picturename = "Regenerate!"
long picturemaskcolor = 536870912
cb_ord_envio cb_ord_envio
cb_filtrar_envio cb_filtrar_envio
cb_mantenedor cb_mantenedor
cb_exportar_archivo cb_exportar_archivo
cb_proceso cb_proceso
p_2 p_2
em_fec_fin em_fec_fin
st_2 st_2
p_1 p_1
em_fec_ini em_fec_ini
st_4 st_4
dw_lista_envio_archivo_pac dw_lista_envio_archivo_pac
end type

on tabpage_1.create
this.cb_ord_envio=create cb_ord_envio
this.cb_filtrar_envio=create cb_filtrar_envio
this.cb_mantenedor=create cb_mantenedor
this.cb_exportar_archivo=create cb_exportar_archivo
this.cb_proceso=create cb_proceso
this.p_2=create p_2
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.p_1=create p_1
this.em_fec_ini=create em_fec_ini
this.st_4=create st_4
this.dw_lista_envio_archivo_pac=create dw_lista_envio_archivo_pac
this.Control[]={this.cb_ord_envio,&
this.cb_filtrar_envio,&
this.cb_mantenedor,&
this.cb_exportar_archivo,&
this.cb_proceso,&
this.p_2,&
this.em_fec_fin,&
this.st_2,&
this.p_1,&
this.em_fec_ini,&
this.st_4,&
this.dw_lista_envio_archivo_pac}
end on

on tabpage_1.destroy
destroy(this.cb_ord_envio)
destroy(this.cb_filtrar_envio)
destroy(this.cb_mantenedor)
destroy(this.cb_exportar_archivo)
destroy(this.cb_proceso)
destroy(this.p_2)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.em_fec_ini)
destroy(this.st_4)
destroy(this.dw_lista_envio_archivo_pac)
end on

type cb_ord_envio from commandbutton within tabpage_1
integer x = 2094
integer y = 1536
integer width = 242
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull(nulo)
dw_lista_envio_archivo_pac.setsort(nulo)
dw_lista_envio_archivo_pac.sort()
end event

type cb_filtrar_envio from commandbutton within tabpage_1
integer x = 1847
integer y = 1536
integer width = 242
integer height = 100
integer taborder = 50
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
dw_lista_envio_archivo_pac.SETfilter(NULO)
dw_lista_envio_archivo_pac.filter()
end event

type cb_mantenedor from commandbutton within tabpage_1
integer x = 3090
integer y = 1536
integer width = 773
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mantenedor Contratos Exportado"
end type

event clicked;if isvalid(w_mantenedor_pac) then close(w_mantenedor_pac)
open(w_mantenedor_pac)
end event

type cb_exportar_archivo from commandbutton within tabpage_1
integer x = 2514
integer y = 1536
integer width = 471
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar Archivo"
end type

event clicked;string		ls_fila,ls_string,ls_dv,ls_ap_mat,ls_ap_pat,ls_nombre,ls_direccion_p,ls_fecha_cobro_pac,ls_rut,ls_fax,ls_cod_comuna,ls_base,ls_serie,ls_codigo_banco,ls_tipo_cuenta,&
			ls_linea,ls_numero,ls_descuento,ls_cupon,ls_numero_cuenta, ls_pasa ='S',ls_cuenta_final,ls_monto_credito,ls_monto_mantencion,ls_fecha_proc,ls_fecha_cred,&
			ls_fecha_mant,ls_identificador,ls_forma_cargo,ls_of_destino,ls_estado_cob,ls_ap_pat_otro,ls_ap_mat_otro,ls_nombre_otro,ls_moneda,ls_est_reg,ls_moneda_seg
long 		ll_new,ll_rut,ll_indi,ll_tot_reg,ll_largo,ll_cupon,ll_codigo_banco,ll_pos,ll_monto_cred_peso,ll_new_reg,ll_new_cred,ll_new_mant,ll_count,ll_count_reg,ll_count_seg,&
			ll_monto_seg,ll_largo_contrato
Datetime	ldt_fecha_cobro_pac,ldt_venc_cred,ldt_venc_mant, ldt_fecha_ini, ldt_fecha_fin
Double	ldb_uf_dia,ldb_val_uf,ll_monto_cred,ll_monto_mant,ll_numero,ll_suma_seg,ll_monto_cred_sol_pac,ll_monto_cred_cta_corr
Datawindow	dw_paso

dw_envio_archivo_pac_cred.reset()
dw_envio_archivo_pac_mant.reset()
dw_print_cred.reset()
dw_print_mant.reset()
dw_pac_detalle.reset()
ldt_fecha_ini	= datetime(date(em_fec_ini.text),time('00:00:00'))
ldt_fecha_fin	= datetime(date(em_fec_fin.text),time('00:00:00'))
ll_tot_reg 		= dw_lista_envio_archivo_pac.rowcount()
if ll_tot_reg > 0 then
	ls_fecha_proc				= mid(em_fec_ini.text,4,7)
	for ll_indi=1 to ll_tot_reg
		ldt_fecha_cobro_pac	= dw_lista_envio_archivo_pac.GetItemDatetime(ll_indi,'sol_pac_fecha_cobro_pac')
		ll_rut						= dw_lista_envio_archivo_pac.GetItemNumber(ll_indi,'sol_pac_rut_titular')
		ls_dv						= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_dv')
		
		ls_ap_pat				= trim(dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_ap_paterno'))
		ls_ap_mat				= trim(dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_ap_materno'))
		ls_nombre				= trim(dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_nombre'))
		ls_ap_pat_otro			= trim(dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_ap_paterno'))
		ls_ap_mat_otro			= trim(dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_ap_materno'))
		ls_nombre_otro		= trim(dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_nombre'))
			
		ls_direccion_p			= trim(dw_lista_envio_archivo_pac.GetItemString(ll_indi,'c_direccion_p'))
		ls_fax						= '0000000000'
		ls_cod_comuna			= '000'
		ls_descuento			= '0000000000000'
		ls_of_destino			= '000'
		ls_base					= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_base')
		ls_serie					= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_serie')
		ll_numero				= dw_lista_envio_archivo_pac.GetItemNumber(ll_indi,'sol_pac_numero')
		ls_numero_cuenta		= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_numero_cuenta')
		ll_codigo_banco		= dw_lista_envio_archivo_pac.GetItemnumber(ll_indi,'sol_pac_cod_banco')
		ls_tipo_cuenta			= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_tipo_cuenta') //C o V
		ll_monto_cred			= dw_lista_envio_archivo_pac.GetItemnumber(ll_indi,'sol_pac_monto_cuota_cred')
		ll_monto_mant			= dw_lista_envio_archivo_pac.GetItemnumber(ll_indi,'sol_pac_monto_cuota_mant')
//		ldt_venc_cred			= dw_lista_envio_archivo_pac.GetItemdatetime(ll_indi,'cadena_mora_fecha_venc_cred')
//		ldt_venc_mant			= dw_lista_envio_archivo_pac.GetItemdatetime(ll_indi,'cadena_mora_fecha_venc_mant')
		
		ldt_venc_cred			= dw_lista_envio_archivo_pac.GetItemdatetime(ll_indi,'c_fecha_real_cred')
		ldt_venc_mant			= dw_lista_envio_archivo_pac.GetItemdatetime(ll_indi,'c_fecha_real_mant')
		
		ls_fecha_cred			= mid(string(ldt_venc_cred),4,7)
		ls_fecha_mant			= mid(string(ldt_venc_mant),4,7)
		ls_moneda				= wf_moneda(ls_base,ls_serie,ll_numero)
		if ll_monto_cred > 0.001 and ldt_venc_cred >= ldt_fecha_ini then //valida cuota credito and ldt_venc_cred <= ldt_fecha_fin
			SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"  
			INTO		:ll_cupon
			FROM 		"CUPONERAS_DETALLE"  
			WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
					 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
					 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
					 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
					 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
					 ( "CUPONERAS_DETALLE"."FECHA_VENC" = ( SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC") 
																		 FROM 	"CUPONERAS_DETALLE" 
																		 WHERE ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND 
																				 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND 
																				 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND 
																				 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND 
																				 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_moneda = '2' then
					SELECT	"TAB_UF"."VALOR_UF"  
					INTO 		:ldb_val_uf  
					FROM 		"TAB_UF"  
					WHERE 	"TAB_UF"."FECHA_UF" = :ldt_venc_cred   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_monto_cred	= round(ll_monto_cred * ldb_val_uf,0)
					else
						SELECT	"TAB_UF"."VALOR_UF"  
						INTO 		:ldb_val_uf  
						FROM 		"TAB_UF"  
						WHERE 	"TAB_UF"."FECHA_UF" = ( SELECT MAX("TAB_UF"."FECHA_UF") 
																	FROM "TAB_UF"  )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ll_monto_cred	= round(ll_monto_cred * ldb_val_uf,0)
						end if
					end if
			
				end if
				ls_identificador			= string(ll_numero)
				ll_largo					= Len(ls_identificador)
//				if ll_largo > 25 then
//					ls_identificador 	= Mid(ls_identificador,1,25)
//				else 
//					ls_identificador 	= ls_identificador + Fill(' ',25 - ll_largo)
//				end if
				ll_largo_contrato		= Len(ls_identificador)
				if ll_largo_contrato <= 6 then
					if ll_largo > 25 then
						ls_identificador 	= Mid(ls_identificador,1,25)
					else 
						ls_identificador 	= ls_identificador + Fill(' ',25 - ll_largo)
					end if
				elseif ll_largo_contrato = 9 then 
					if ll_largo > 28 then
						ls_identificador 	= Mid(ls_identificador,1,28)
					else 
						ls_identificador 	= ls_identificador + Fill(' ',28 - ll_largo)
					end if
				end if
				ls_fecha_cobro_pac   = string(ldt_venc_cred,'ddmmyyyy')
				ls_rut						= string(ll_rut,'00000000')
				ls_numero				= string(ll_numero,'000000')
				ls_cupon					= string(ll_cupon)
				ls_monto_credito		= string(ll_monto_cred,'0000000000000')
				ls_pasa					= 'S'
				DO WHILE ls_pasa='S'
					ll_pos				= Pos(ls_numero_cuenta,'-')
					ls_cuenta_final	= mid(ls_numero_cuenta,1,ll_pos - 1)
					if ll_pos>0 then ll_pos	= ll_pos + 1
					ls_cuenta_final	= ls_cuenta_final + mid(ls_numero_cuenta,(ll_pos))
					if ll_pos = 0 or isnull(ll_pos) then
						ls_pasa  = 'N'
					end if
					ls_numero_cuenta	= ls_cuenta_final
				LOOP
				
				ls_pasa					= 'S'
				DO WHILE ls_pasa='S'
					ll_pos				= Pos(ls_numero_cuenta,'.')
					ls_cuenta_final	= mid(ls_numero_cuenta,1,ll_pos - 1)
					if ll_pos>0 then ll_pos	= ll_pos + 1
					ls_cuenta_final	= ls_cuenta_final + mid(ls_numero_cuenta,(ll_pos))
					if ll_pos = 0 or isnull(ll_pos) then
						ls_pasa  		= 'N'
					end if
					ls_numero_cuenta	= ls_cuenta_final
				LOOP
	
				ll_largo					= Len(ls_numero_cuenta)
				if ll_largo > 15 then
					ls_numero_cuenta = Mid(ls_numero_cuenta,1,15)
				else 
					ls_numero_cuenta = Fill('0',15 - ll_largo)+ls_numero_cuenta
				end if
				
				if ll_codigo_banco = 16 then
					ls_forma_cargo		= 'CCT'
				else
					ls_forma_cargo		= 'OTC'
				end if
				ls_codigo_banco		= string(ll_codigo_banco)
				ll_largo					= Len(ls_codigo_banco)
				if ll_largo > 3 then
					ls_codigo_banco = Mid(ls_codigo_banco,1,3)
				else
					ls_codigo_banco = Fill('0',3 - ll_largo)+ls_codigo_banco
				end if
				
				ll_largo					= Len(ls_ap_pat)
				if ll_largo > 15 then
					ls_ap_pat = Mid(ls_ap_pat,1,15)
				else 
					ls_ap_pat = ls_ap_pat + Fill(' ',15 - ll_largo)
				end if
				
				ll_largo					= Len(ls_ap_mat)
				if ll_largo > 15 then
					ls_ap_mat = Mid(ls_ap_mat,1,15)
				else 
					ls_ap_mat = ls_ap_mat + Fill(' ',15 - ll_largo)
				end if
				
				ll_largo					= Len(ls_nombre)
				if ll_largo > 15 then
					ls_nombre = Mid(ls_nombre,1,15)
				else 
					ls_nombre = ls_nombre + Fill(' ',15 - ll_largo)
				end if
				
				ll_largo					= Len(ls_direccion_p)
				if ll_largo > 35 then
					ls_direccion_p = Mid(ls_direccion_p,1,35)
				else 
					ls_direccion_p = ls_direccion_p + Fill(' ',35 - ll_largo)
				end if
				
				ll_largo					= Len(ls_cupon)
				if ll_largo > 25 then
					ls_cupon = Mid(ls_cupon,1,25)
				else 
					ls_cupon = ls_cupon + Fill(' ',25 - ll_largo)
				end if
	
				if ll_cupon > 0 then
					SELECT	COUNT("PAC_DETALLE"."BASE")  	
					INTO 		:ll_count  
					FROM 		"PAC_DETALLE"  
					WHERE  ( "PAC_DETALLE"."BASE" = :ls_base ) AND  
							 ( "PAC_DETALLE"."SERIE" = :ls_serie ) AND  
							 ( "PAC_DETALLE"."NUMERO" = :ll_numero ) AND  
							 ( "PAC_DETALLE"."CUPON" = :ll_cupon )   
					USING		sqlca;
					if ll_count > 0 then
						ls_est_reg				= 'N'
						SELECT	COUNT("SOL_PAC_RECUPERA_RECHAZO"."BASE")  
						INTO 		:ll_count_reg  
						FROM 		"SOL_PAC_RECUPERA_RECHAZO"  
						WHERE  ( "SOL_PAC_RECUPERA_RECHAZO"."BASE" = :ls_base ) AND  
								 ( "SOL_PAC_RECUPERA_RECHAZO"."SERIE" = :ls_serie ) AND  
								 ( "SOL_PAC_RECUPERA_RECHAZO"."NUMERO" = :ll_numero ) AND  
								 ( "SOL_PAC_RECUPERA_RECHAZO"."ESTADO_REG" = 'A' ) AND     
								 ( "SOL_PAC_RECUPERA_RECHAZO"."NUMERO_CUPON" = :ll_cupon )
						USING		sqlca;
						if ll_count_reg > 0 then
							ls_est_reg			= 'S'
						end if
					else
						ls_est_reg				= 'S'
					end if
				end if
				if ls_est_reg='S' then
					//--- Inicio validacion diferencias de criterios en solicitud pac ---
					
					SELECT 	"SOL_PAC"."MONTO_CUOTA_CRED"  
					INTO 		:ll_monto_cred_sol_pac  
					FROM 	"SOL_PAC"  
					WHERE  	"SOL_PAC"."BASE" = :ls_base  AND  
								"SOL_PAC"."SERIE" = :ls_serie  AND  
								"SOL_PAC"."NUMERO" = :ll_numero and
								"SOL_PAC"."CORRELATIVO" = (SELECT MAX ("SOL_PAC"."CORRELATIVO")
																		FROM "SOL_PAC"  
																		WHERE  	"SOL_PAC"."BASE" = :ls_base  AND  
																					"SOL_PAC"."SERIE" = :ls_serie  AND  
																					"SOL_PAC"."NUMERO" = :ll_numero  )
					USING sqlca;
					ll_monto_cred_cta_corr				= wf_valor_cred_cta_corr(ls_base,ls_serie,ll_numero)
					if ll_monto_cred_cta_corr = ll_monto_cred_sol_pac then
						SELECT	COUNT("SEGURO_ASOCIADOS"."COD_SEGURO"),	SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
						INTO		:ll_count_seg,												:ll_suma_seg
						FROM 	"SEGURO_ASOCIADOS"  
						WHERE ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
								  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
								  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
								  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
								  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
								  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
						USING	sqlca;
						if ll_count_seg > 0 then
							SELECT	DISTINCT ("SEGURO_ASOCIADOS"."MONEDA")
							INTO		:ls_moneda_seg
							FROM 	"SEGURO_ASOCIADOS"  
							WHERE ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
									  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
									  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
									  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
									  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
									  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
							USING		sqlca;
							if ls_moneda_seg = '2' then
								ll_monto_seg	= long(round(ll_suma_seg * ldb_val_uf,0))
							else
								ll_monto_seg	= long(ll_suma_seg)
							end if
							ll_monto_cred		= ll_monto_cred + ll_monto_seg
							ls_monto_credito	= string(ll_monto_cred,'0000000000000')
						end if	
					end if
					//---- Fin validación ----
					
//					ls_linea 	= ls_fecha_cobro_pac+ls_rut+ls_dv+ls_ap_pat+ls_ap_mat+ls_nombre+ls_direccion_p+ls_fax+ls_cod_comuna+ls_identificador+ls_cupon+ls_monto_credito+ls_descuento+ls_monto_credito+ls_forma_cargo+ls_numero_cuenta+ls_codigo_banco+ls_of_destino
					if ll_largo_contrato < 9 then
						ls_linea 	= ls_fecha_cobro_pac+ls_rut+ls_dv+ls_ap_pat+ls_ap_mat+ls_nombre+ls_direccion_p+ls_fax+ls_cod_comuna+ls_identificador+ls_cupon+ls_monto_credito+ls_descuento+ls_monto_credito+ls_forma_cargo+ls_numero_cuenta+ls_codigo_banco+ls_of_destino
					elseif ll_largo_contrato >= 9 then
						ls_linea 	= ls_fecha_cobro_pac+ls_rut+ls_dv+ls_ap_pat+ls_ap_mat+ls_nombre+ls_direccion_p+ls_fax+ls_identificador+ls_cupon+ls_monto_credito+ls_descuento+ls_monto_credito+ls_forma_cargo+ls_numero_cuenta+ls_codigo_banco+ls_of_destino	
					end if	
					ll_new   	= dw_envio_archivo_pac_cred.insertrow(0)
					dw_envio_archivo_pac_cred.setitem(ll_new,'linea',ls_linea)
					ll_new_reg	= dw_pac_detalle.insertrow(0)
					dw_pac_detalle.setitem(ll_new_reg,'base',ls_base)
					dw_pac_detalle.setitem(ll_new_reg,'serie',ls_serie)
					dw_pac_detalle.setitem(ll_new_reg,'numero',ll_numero)
					dw_pac_detalle.setitem(ll_new_reg,'fecha_envio',idt_fecha_hoy)
					dw_pac_detalle.setitem(ll_new_reg,'fecha_pago',ldt_venc_cred)
					dw_pac_detalle.setitem(ll_new_reg,'monto_pago',ll_monto_cred)
					dw_pac_detalle.setitem(ll_new_reg,'cupon',ll_cupon)
					dw_pac_detalle.setitem(ll_new_reg,'usuario',gs_user)
					dw_pac_detalle.setitem(ll_new_reg,'tipo_mov','E')
					dw_pac_detalle.accepttext()
					
					ll_new_cred		= dw_print_cred.insertrow(0)
					dw_print_cred.setitem(ll_new_cred,'fecha_envio',idt_fecha_hoy)
					dw_print_cred.setitem(ll_new_cred,'nombre',ls_nombre_otro)
					dw_print_cred.setitem(ll_new_cred,'ap_paterno',ls_ap_pat_otro)
					dw_print_cred.setitem(ll_new_cred,'ap_materno',ls_ap_mat_otro)
					dw_print_cred.setitem(ll_new_cred,'fecha_vcto_cred',ldt_venc_cred)
					dw_print_cred.setitem(ll_new_cred,'monto_cobro',ll_monto_cred)
					dw_print_cred.setitem(ll_new_cred,'cod_banco',ll_codigo_banco)
					dw_print_cred.setitem(ll_new_cred,'tipo_cuenta',ls_tipo_cuenta)
					dw_print_cred.setitem(ll_new_cred,'nro_cuenta',ls_numero_cuenta)
					dw_print_cred.setitem(ll_new_cred,'base',ls_base)
					dw_print_cred.setitem(ll_new_cred,'serie',ls_serie)
					dw_print_cred.setitem(ll_new_cred,'numero',ll_numero)
					dw_print_cred.setitem(ll_new_cred,'cupon',ll_cupon)
					dw_print_cred.accepttext()
				end if
			end if
		end if
		
		if ll_monto_mant > 0.001 and ldt_venc_mant >= ldt_fecha_ini then //valida cuota mant and ldt_venc_mant <= ldt_fecha_fin
			SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"  
			INTO		:ll_cupon
			FROM 		"CUPONERAS_DETALLE"  
			WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
					 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
					 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
					 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
					 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
					 ( "CUPONERAS_DETALLE"."FECHA_VENC" = ( SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC") 
																		 FROM 	"CUPONERAS_DETALLE" 
																		 WHERE ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND 
																				 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND 
																				 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND 
																				 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND 
																				 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_moneda = '2' or ls_moneda = '1' then
					SELECT	"TAB_UF"."VALOR_UF"  
					INTO 		:ldb_val_uf  
					FROM 		"TAB_UF"  
					WHERE 	"TAB_UF"."FECHA_UF" = :ldt_venc_mant   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_monto_mant	= round(ll_monto_mant * ldb_val_uf,0)
					else
						SELECT	"TAB_UF"."VALOR_UF"  
						INTO 		:ldb_val_uf  
						FROM 		"TAB_UF"  
						WHERE 	"TAB_UF"."FECHA_UF" = ( SELECT MAX("TAB_UF"."FECHA_UF") 
																	FROM "TAB_UF"  )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ll_monto_mant	= round(ll_monto_mant * ldb_val_uf,0)
						end if
					end if
			
				end if
				ls_identificador			= string(ll_numero)
				ll_largo					= Len(ls_identificador)
//				if ll_largo > 25 then
//					ls_identificador 	= Mid(ls_identificador,1,25)
//				else 
//					ls_identificador 	= ls_identificador + Fill(' ',25 - ll_largo)
//				end if
				ll_largo_contrato		= Len(ls_identificador)
				if ll_largo_contrato <= 6 then
					if ll_largo > 25 then
						ls_identificador 	= Mid(ls_identificador,1,25)
					else 
						ls_identificador 	= ls_identificador + Fill(' ',25 - ll_largo)
					end if
				elseif ll_largo_contrato = 9 then 
					if ll_largo > 28 then
						ls_identificador 	= Mid(ls_identificador,1,28)
					else 
						ls_identificador 	= ls_identificador + Fill(' ',28 - ll_largo)
					end if
				end if
				ls_fecha_cobro_pac   = string(ldt_venc_mant,'ddmmyyyy')
				ls_rut						= string(ll_rut,'00000000')
				ls_numero				= string(ll_numero,'000000')
				ls_cupon					= string(ll_cupon)
				ls_monto_mantencion	= string(ll_monto_mant,'0000000000000')
				ls_pasa					= 'S'
				DO WHILE ls_pasa='S'
					ll_pos					= Pos(ls_numero_cuenta,'-')
					ls_cuenta_final		= mid(ls_numero_cuenta,1,ll_pos - 1)
					if ll_pos>0 then ll_pos	= ll_pos + 1
					ls_cuenta_final		= ls_cuenta_final + mid(ls_numero_cuenta,(ll_pos))
					if ll_pos = 0 or isnull(ll_pos) then
						ls_pasa  			= 'N'
					end if
					ls_numero_cuenta	= ls_cuenta_final
				LOOP
				ls_pasa					= 'S'
				DO WHILE ls_pasa='S'
					ll_pos				= Pos(ls_numero_cuenta,'.')
					ls_cuenta_final	= mid(ls_numero_cuenta,1,ll_pos - 1)
					if ll_pos>0 then ll_pos	= ll_pos + 1
					ls_cuenta_final	= ls_cuenta_final + mid(ls_numero_cuenta,(ll_pos))
					if ll_pos = 0 or isnull(ll_pos) then
						ls_pasa  = 'N'
					end if
					ls_numero_cuenta	= ls_cuenta_final
				LOOP
	
				ll_largo					= Len(ls_numero_cuenta)
				if ll_largo > 15 then
					ls_numero_cuenta = Mid(ls_numero_cuenta,1,15)
				else 
					ls_numero_cuenta = Fill('0',15 - ll_largo)+ls_numero_cuenta
				end if
				
				if ll_codigo_banco = 16 then
					ls_forma_cargo		= 'CCT'
				else
					ls_forma_cargo		= 'OTC'
				end if
				ls_codigo_banco		= string(ll_codigo_banco)
				ll_largo					= Len(ls_codigo_banco)
				if ll_largo > 3 then
					ls_codigo_banco = Mid(ls_codigo_banco,1,3)
				else 
					ls_codigo_banco = Fill('0',3 - ll_largo)+ls_codigo_banco
				end if
				
				ll_largo					= Len(ls_ap_pat)
				if ll_largo > 15 then
					ls_ap_pat = Mid(ls_ap_pat,1,15)
				else 
					ls_ap_pat = ls_ap_pat + Fill(' ',15 - ll_largo)
				end if
				
				ll_largo					= Len(ls_ap_mat)
				if ll_largo > 15 then
					ls_ap_mat = Mid(ls_ap_mat,1,15)
				else 
					ls_ap_mat = ls_ap_mat + Fill(' ',15 - ll_largo)
				end if
				
				ll_largo					= Len(ls_nombre)
				if ll_largo > 15 then
					ls_nombre = Mid(ls_nombre,1,15)
				else 
					ls_nombre = ls_nombre + Fill(' ',15 - ll_largo)
				end if
				
				ll_largo					= Len(ls_direccion_p)
				if ll_largo > 35 then
					ls_direccion_p = Mid(ls_direccion_p,1,35)
				else 
					ls_direccion_p = ls_direccion_p + Fill(' ',35 - ll_largo)
				end if
				
				ll_largo					= Len(ls_cupon)
				if ll_largo > 25 then
					ls_cupon = Mid(ls_cupon,1,25)
				else 
					ls_cupon = ls_cupon + Fill(' ',25 - ll_largo)
				end if
				
				if ll_cupon > 0 then
					SELECT	COUNT("PAC_DETALLE"."BASE")  	
					INTO 		:ll_count  
					FROM 		"PAC_DETALLE"  
					WHERE  ( "PAC_DETALLE"."BASE" = :ls_base ) AND  
							 ( "PAC_DETALLE"."SERIE" = :ls_serie ) AND  
							 ( "PAC_DETALLE"."NUMERO" = :ll_numero ) AND  
							 ( "PAC_DETALLE"."CUPON" = :ll_cupon )   
					USING		sqlca;
					if ll_count > 0 then
						ls_est_reg				= 'N'
						SELECT	COUNT("SOL_PAC_RECUPERA_RECHAZO"."BASE")  
						INTO 		:ll_count_reg  
						FROM 		"SOL_PAC_RECUPERA_RECHAZO"  
						WHERE  ( "SOL_PAC_RECUPERA_RECHAZO"."BASE" = :ls_base ) AND  
								 ( "SOL_PAC_RECUPERA_RECHAZO"."SERIE" = :ls_serie ) AND  
								 ( "SOL_PAC_RECUPERA_RECHAZO"."NUMERO" = :ll_numero ) AND  
								 ( "SOL_PAC_RECUPERA_RECHAZO"."ESTADO_REG" = 'A' ) AND     
								 ( "SOL_PAC_RECUPERA_RECHAZO"."NUMERO_CUPON" = :ll_cupon )
						USING		sqlca;
						if ll_count_reg > 0 then
							ls_est_reg			= 'S'
						end if
					else
						ls_est_reg				= 'S'
					end if
				end if
				if ls_est_reg='S' then
//					ls_linea = ls_fecha_cobro_pac+ls_rut+ls_dv+ls_ap_pat+ls_ap_mat+ls_nombre+ls_direccion_p+ls_fax+ls_cod_comuna+ls_identificador+ls_cupon+ls_monto_mantencion+ls_descuento+ls_monto_mantencion+ls_forma_cargo+ls_numero_cuenta+ls_codigo_banco+ls_of_destino
					if ll_largo_contrato < 9 then
						ls_linea 	= ls_fecha_cobro_pac+ls_rut+ls_dv+ls_ap_pat+ls_ap_mat+ls_nombre+ls_direccion_p+ls_fax+ls_cod_comuna+ls_identificador+ls_cupon+ls_monto_credito+ls_descuento+ls_monto_credito+ls_forma_cargo+ls_numero_cuenta+ls_codigo_banco+ls_of_destino			
					elseif ll_largo_contrato >= 9 then
						ls_linea 	= ls_fecha_cobro_pac+ls_rut+ls_dv+ls_ap_pat+ls_ap_mat+ls_nombre+ls_direccion_p+ls_fax+ls_identificador+ls_cupon+ls_monto_credito+ls_descuento+ls_monto_credito+ls_forma_cargo+ls_numero_cuenta+ls_codigo_banco+ls_of_destino	
					end if
					ll_new   = dw_envio_archivo_pac_mant.insertrow(0)
					dw_envio_archivo_pac_mant.setitem(ll_new,'linea',ls_linea)
					ll_new_reg	= dw_pac_detalle.insertrow(0)
					dw_pac_detalle.setitem(ll_new_reg,'base',ls_base)
					dw_pac_detalle.setitem(ll_new_reg,'serie',ls_serie)
					dw_pac_detalle.setitem(ll_new_reg,'numero',ll_numero)
					dw_pac_detalle.setitem(ll_new_reg,'fecha_envio',idt_fecha_hoy)
					dw_pac_detalle.setitem(ll_new_reg,'fecha_pago',ldt_venc_mant)
					dw_pac_detalle.setitem(ll_new_reg,'monto_pago',ll_monto_mant)
					dw_pac_detalle.setitem(ll_new_reg,'cupon',ll_cupon)
					dw_pac_detalle.setitem(ll_new_reg,'usuario',gs_user)
					dw_pac_detalle.accepttext()
					
					ll_new_mant		= dw_print_mant.insertrow(0)
					dw_print_mant.setitem(ll_new_mant,'fecha_envio',idt_fecha_hoy)
					dw_print_mant.setitem(ll_new_mant,'nombre',ls_nombre_otro)
					dw_print_mant.setitem(ll_new_mant,'ap_paterno',ls_ap_pat_otro)
					dw_print_mant.setitem(ll_new_mant,'ap_materno',ls_ap_mat_otro)
					dw_print_mant.setitem(ll_new_mant,'fecha_vcto_cred',ldt_venc_mant)
					dw_print_mant.setitem(ll_new_mant,'monto_cobro',ll_monto_mant)
					dw_print_mant.setitem(ll_new_mant,'cod_banco',ll_codigo_banco)
					dw_print_mant.setitem(ll_new_mant,'tipo_cuenta',ls_tipo_cuenta)
					dw_print_mant.setitem(ll_new_mant,'nro_cuenta',ls_numero_cuenta)
					dw_print_mant.setitem(ll_new_mant,'base',ls_base)
					dw_print_mant.setitem(ll_new_mant,'serie',ls_serie)
					dw_print_mant.setitem(ll_new_mant,'numero',ll_numero)
					dw_print_mant.setitem(ll_new_mant,'cupon',ll_cupon)
					dw_pac_detalle.setitem(ll_new_reg,'tipo_mov','F')
					dw_print_mant.accepttext()
				end if
			end if
		end if
	next	
	if dw_envio_archivo_pac_cred.rowcount()>0 or dw_envio_archivo_pac_mant.rowcount()>0 then
		if dw_print_cred.rowcount() > 0 then
			dw_print_cred.object.t_titulo.text	= 'Detalle Envio PAC  COBRO CREDITO  Fecha del '+string(em_fec_ini.text)+' al '+string(em_fec_fin.text)
		end if
		if dw_print_mant.rowcount() > 0 then
			dw_print_mant.object.t_titulo.text	= 'Detalle Envio PAC  COBRO MANTENCION  Fecha del '+string(em_fec_ini.text)+' al '+string(em_fec_fin.text)
		end if
		Open(w_exportar_archivo_pac)
	end if
end if
end event

type cb_proceso from picturebutton within tabpage_1
integer x = 1477
integer y = 1488
integer width = 169
integer height = 148
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;string 	ls_string,ls_filtro,ls_base,ls_serie,ls_est_reg,ls_estado_mandato,ls_dia_cred,ls_dia_mant,ls_fec_cred,&
			ls_fec_mant,ls_descrip,ls_fecha_selec
Date		ld_fecha,ld_fecha_proc
Datetime	ldt_fec_vcto_c,ldt_fec_vcto_m,ld_fec_ini,ld_fec_fin,ldt_fec_vcto_c_aux,ldt_fec_vcto_m_aux,ldt_nulo,&
			ldt_fecha_dia,ldt_fecha_hoy,ldt_fec_venc_cred,ldt_fec_venc_mant
Long		ll_tot_reg,ll_indi,ll_cupon_c,ll_count,ll_cupon_m,ll_tot_reg_antes,ll_tot_reg_despues,&
			ll_rut,ll_cod_banco,ll_count_reg
Double	ldb_cta_cred,ldb_cta_mant,ll_numero

ldt_fecha_hoy										= datetime(date(gdt_fec_sistema),time('00:00:00'))
ld_fec_ini											= datetime(date(em_fec_ini.text),time('00:00:00'))
ld_fec_fin											= datetime(date(em_fec_fin.text),time('00:00:00'))
dw_lista_envio_archivo_pac.reset()
ls_filtro 											= ""
Setnull(ldt_nulo)
dw_lista_envio_archivo_pac.SetFilter(ls_filtro)
dw_lista_envio_archivo_pac.Filter()
dw_lista_envio_archivo_pac.accepttext()

if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha											= date(em_fec_ini.text)
	ld_fecha_proc									= RelativeDate(ld_fecha, 7)
	em_fec_fin.text								= string(ld_fecha_proc,'dd/mm/yyyy')
else
	ll_tot_reg										= dw_lista_envio_archivo_pac.retrieve(ld_fec_ini,ld_fec_fin)
	if ll_tot_reg>0 then
		dw_envio_archivo_pac_cred.reset()
		dw_envio_archivo_pac_mant.reset()
		dw_print_cred.reset()
		dw_print_mant.reset()
		dw_pac_detalle.reset()
		for ll_indi=1 to ll_tot_reg
			ls_base									= dw_lista_envio_archivo_pac.getitemstring(ll_indi,'sol_pac_base')
			ls_serie									= dw_lista_envio_archivo_pac.getitemstring(ll_indi,'sol_pac_serie')
			ll_numero								= dw_lista_envio_archivo_pac.getitemnumber(ll_indi,'sol_pac_numero')
			ldt_fec_vcto_c							= dw_lista_envio_archivo_pac.getitemdatetime(ll_indi,'cadena_mora_fecha_venc_cred')
			ldt_fec_vcto_m							= dw_lista_envio_archivo_pac.getitemdatetime(ll_indi,'cadena_mora_fecha_venc_mant')
			ldb_cta_cred							= dw_lista_envio_archivo_pac.getitemnumber(ll_indi,'sol_pac_monto_cuota_cred')
			ldb_cta_mant							= dw_lista_envio_archivo_pac.getitemnumber(ll_indi,'sol_pac_monto_cuota_mant')
			ll_rut										= dw_lista_envio_archivo_pac.getitemnumber(ll_indi,'sol_pac_rut_titular')
			ll_cod_banco							= dw_lista_envio_archivo_pac.getitemnumber(ll_indi,'sol_pac_cod_banco')
			ls_dia_cred								= dw_lista_envio_archivo_pac.getitemstring(ll_indi,'c_dia_cred')
			ls_dia_mant								= dw_lista_envio_archivo_pac.getitemstring(ll_indi,'c_dia_mant')
			ls_fec_cred								= mid(string(ldt_fec_vcto_c,'ddmmyyyy'),1,4)
			ls_fec_mant								= mid(string(ldt_fec_vcto_m,'ddmmyyyy'),1,4)
			ldt_fec_vcto_c_aux					= ldt_fec_vcto_c
			ldt_fec_vcto_m_aux					= ldt_fec_vcto_m
			ls_fecha_selec							= mid(string(ldt_fec_vcto_c,'dd/mm/yyyy'),4,7)
			dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','S')
			SELECT DISTINCT "CUPONERAS_DETALLE"."NRO_CUPON"  
			INTO 		:ll_cupon_c  
			FROM 		"CUPONERAS_DETALLE"  
			WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
					 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
					 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
					 ( substr(to_char("CUPONERAS_DETALLE"."FECHA_VENC",'dd/mm/yyyy'),4,7) = :ls_fecha_selec ) AND  
					 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   AND
					 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' )   
			USING		sqlca;
			if ll_cupon_c > 0 then
				SELECT	COUNT("PAC_DETALLE"."BASE")  	
				INTO 		:ll_count  
				FROM 		"PAC_DETALLE"  
				WHERE  ( "PAC_DETALLE"."BASE" = :ls_base ) AND  
						 ( "PAC_DETALLE"."SERIE" = :ls_serie ) AND  
						 ( "PAC_DETALLE"."NUMERO" = :ll_numero ) AND  
						 ( "PAC_DETALLE"."CUPON" = :ll_cupon_c )   
				USING		sqlca;
				if ll_count > 0 then
					ls_est_reg				= 'N'
					SELECT	COUNT("SOL_PAC_RECUPERA_RECHAZO"."BASE")  
					INTO 		:ll_count_reg  
					FROM 		"SOL_PAC_RECUPERA_RECHAZO"  
					WHERE  ( "SOL_PAC_RECUPERA_RECHAZO"."BASE" = :ls_base ) AND  
							 ( "SOL_PAC_RECUPERA_RECHAZO"."SERIE" = :ls_serie ) AND  
							 ( "SOL_PAC_RECUPERA_RECHAZO"."NUMERO" = :ll_numero ) AND  
							 ( "SOL_PAC_RECUPERA_RECHAZO"."ESTADO_REG" = 'A' ) AND     
							 ( "SOL_PAC_RECUPERA_RECHAZO"."NUMERO_CUPON" = :ll_cupon_c )
					USING		sqlca;
					if ll_count_reg > 0 then
						ls_est_reg			= 'S'
					end if
				else
					ls_est_reg				= 'S'
				end if
				dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado',ls_est_reg)
				if ls_est_reg = 'S' then
					SELECT	"SOL_PAC_UNIVERSO_MANDATOS"."ESTADO"  
					INTO 		:ls_estado_mandato  
					FROM 		"SOL_PAC_UNIVERSO_MANDATOS"  
					WHERE  ( "SOL_PAC_UNIVERSO_MANDATOS"."IDENTIFICADOR" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						//( "SOL_PAC_UNIVERSO_MANDATOS"."RUT" = :ll_rut ) AND  
						if ls_estado_mandato = '015' then
							dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','S')
							ls_est_reg			= 'S'
						else
							dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','M')
							ls_est_reg			= 'N'
						end if
					else
						dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','M')
						ls_est_reg			= 'N'
					end if
				end if
			end if
			if ldb_cta_cred > 0 and ldt_fec_vcto_c >= ld_fec_ini and ldt_fec_vcto_c <= ld_fec_fin then
				if ll_cod_banco = 16 then //BCI
					ldt_fecha_dia					= datetime(relativedate(date(ldt_fecha_hoy), -1 ))
					if ldt_fec_vcto_c >= ldt_fecha_dia and ldt_fec_vcto_c <= ldt_fecha_hoy then
						ldt_fec_vcto_c				= datetime(relativedate(date(ldt_fec_vcto_c), 2 ))
					else
						ldt_fecha_dia				= datetime(relativedate(date(ldt_fecha_hoy), -2 ))
						if ldt_fec_vcto_c >= ldt_fecha_dia and ldt_fec_vcto_c <= ldt_fecha_hoy then
							ldt_fec_vcto_c			= datetime(relativedate(date(ldt_fec_vcto_c), 1 ))
						end if
					end if
				else
					ldt_fecha_dia					= datetime(relativedate(date(gdt_fec_sistema), -1 ))
					if ldt_fec_vcto_c >= ldt_fecha_dia and ldt_fec_vcto_c <= ldt_fecha_hoy then
						ldt_fec_vcto_c				= datetime(relativedate(date(ldt_fec_vcto_c), 3 ))
					else
						ldt_fecha_dia				= datetime(relativedate(date(ldt_fecha_hoy), -2 ))
						if ldt_fec_vcto_c >= ldt_fecha_dia and ldt_fec_vcto_c <= ldt_fecha_hoy then
							ldt_fec_vcto_c			= datetime(relativedate(date(ldt_fec_vcto_c), 2 ))
						else
							ldt_fecha_dia			= datetime(relativedate(date(ldt_fecha_hoy), -3 ))
							if ldt_fec_vcto_c >= ldt_fecha_dia and ldt_fec_vcto_c <= ldt_fecha_hoy then
								ldt_fec_vcto_c		= datetime(relativedate(date(ldt_fec_vcto_c), 1 ))
							end if
						end if
					end if
				end if
				SELECT	"PER_DIAS_FESTIVOS"."DESCRIPCION"  
				INTO 		:ls_descrip  
				FROM 		"PER_DIAS_FESTIVOS"  
				WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_fec_cred
				USING		sqlca;
				if sqlca.sqlcode=100 then
					if ls_dia_cred='Sabado' then
						ldt_fec_vcto_c_aux	= datetime(relativedate(date(ldt_fec_vcto_c), 2 ))
					elseif ls_dia_cred='Domingo' then
						ldt_fec_vcto_c_aux		= datetime(relativedate(date(ldt_fec_vcto_c), 1 ))
					else
						if ls_dia_cred<>'Viernes' then
							ldt_fec_vcto_c_aux	= ldt_fec_vcto_c//datetime(relativedate(date(ldt_fec_vcto_c), 1 ))
						end if
					end if
				else
					if ls_dia_cred='Sabado' then
						ldt_fec_vcto_c_aux	= datetime(relativedate(date(ldt_fec_vcto_c), 2 ))
					elseif ls_dia_cred='Domingo' then
						ldt_fec_vcto_c_aux		= datetime(relativedate(date(ldt_fec_vcto_c), 1 ))
					else
						ldt_fec_vcto_c_aux		= ldt_fec_vcto_c
					end if
				end if
				
				ls_fec_cred							= String(date(ldt_fec_vcto_c_aux),'ddmm')
				SELECT	"PER_DIAS_FESTIVOS"."DESCRIPCION"  
				INTO 		:ls_descrip  
				FROM 		"PER_DIAS_FESTIVOS"  
				WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_fec_cred
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ldt_fec_vcto_c_aux			= datetime(relativedate(date(ldt_fec_vcto_c_aux), 1 ))
					ls_fec_cred						= String(date(ldt_fec_vcto_c_aux),'ddmm')
					SELECT	"PER_DIAS_FESTIVOS"."DESCRIPCION"  
					INTO 		:ls_descrip  
					FROM 		"PER_DIAS_FESTIVOS"  
					WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_fec_cred
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ldt_fec_vcto_c_aux		= datetime(relativedate(date(ldt_fec_vcto_c_aux), 1 ))
						ls_fec_cred					= String(date(ldt_fec_vcto_c_aux),'ddmm')
						SELECT	"PER_DIAS_FESTIVOS"."DESCRIPCION"  
						INTO 		:ls_descrip  
						FROM 		"PER_DIAS_FESTIVOS"  
						WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_fec_cred
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ldt_fec_vcto_c_aux		= datetime(relativedate(date(ldt_fec_vcto_c_aux), 1 ))
						end if
					end if
				end if
				dw_lista_envio_archivo_pac.setitem(ll_indi,'c_fecha_real_cred',ldt_fec_vcto_c_aux)
			else
				dw_lista_envio_archivo_pac.setitem(ll_indi,'c_fecha_real_cred',ldt_nulo)
			end if
			dw_lista_envio_archivo_pac.accepttext()
			if ldb_cta_mant > 0 and ls_est_reg = 'N' and ldt_fec_vcto_m >= ld_fec_ini and ldt_fec_vcto_m <= ld_fec_fin then
				ls_fecha_selec		= mid(string(ldt_fec_vcto_m),7,4)
				SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"  
				INTO 		:ll_cupon_m  
				FROM 		"CUPONERAS_DETALLE"  
				WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
						 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
						 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
						 ( substr(to_char("CUPONERAS_DETALLE"."FECHA_VENC",'dd/mm/yyyy'),7,4) = :ls_fecha_selec ) AND  
						 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   
				USING		sqlca;
				if ll_cupon_m > 0 then
					SELECT	COUNT("PAC_DETALLE"."BASE")  	
					INTO 		:ll_count  
					FROM 		"PAC_DETALLE"  
					WHERE  ( "PAC_DETALLE"."BASE" = :ls_base ) AND  
							 ( "PAC_DETALLE"."SERIE" = :ls_serie ) AND  
							 ( "PAC_DETALLE"."NUMERO" = :ll_numero ) AND  
							 ( "PAC_DETALLE"."CUPON" = :ll_cupon_m )   
					USING		sqlca;
					if ll_count > 0 then
						ls_est_reg	= 'N'
					else
						ls_est_reg	= 'S'
					end if
					dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado',ls_est_reg)
					if ls_est_reg = 'S' then
						SELECT	"SOL_PAC_UNIVERSO_MANDATOS"."ESTADO"  
						INTO 		:ls_estado_mandato  
						FROM 		"SOL_PAC_UNIVERSO_MANDATOS"  
						WHERE  ( "SOL_PAC_UNIVERSO_MANDATOS"."IDENTIFICADOR" = :ll_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							//( "SOL_PAC_UNIVERSO_MANDATOS"."RUT" = :ll_rut ) AND  
							if ls_estado_mandato = '015' then
								dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','S')
								ls_est_reg	= 'S'
							else
								dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','M')
								ls_est_reg	= 'N'
							end if
						else
							dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','M')
							ls_est_reg	= 'N'
						end if
					end if
				end if
				if ll_cod_banco = 16 then //BCI
					ldt_fecha_dia				= datetime(relativedate(date(ldt_fecha_hoy), -1 ))
					if ldt_fec_vcto_m >= ldt_fecha_dia and ldt_fec_vcto_m <= ldt_fecha_hoy then
						ldt_fec_vcto_m			= datetime(relativedate(date(ldt_fec_vcto_m), 2 ))
					else
						ldt_fecha_dia			= datetime(relativedate(date(ldt_fecha_hoy), -2 ))
						if ldt_fec_vcto_m >= ldt_fecha_dia and ldt_fec_vcto_m <= ldt_fecha_hoy then
							ldt_fec_vcto_m		= datetime(relativedate(date(ldt_fec_vcto_m), 1 ))
						end if
					end if
				else
					ldt_fecha_dia				= datetime(relativedate(date(gdt_fec_sistema), -1 ))
					if ldt_fec_vcto_m >= ldt_fecha_dia and ldt_fec_vcto_m <= ldt_fecha_hoy then
						ldt_fec_vcto_m			= datetime(relativedate(date(ldt_fec_vcto_m), 3 ))
					else
						ldt_fecha_dia			= datetime(relativedate(date(ldt_fecha_hoy), -2 ))
						if ldt_fec_vcto_m >= ldt_fecha_dia and ldt_fec_vcto_m <= ldt_fecha_hoy then
							ldt_fec_vcto_m		= datetime(relativedate(date(ldt_fec_vcto_m), 2 ))
						else
							ldt_fecha_dia		= datetime(relativedate(date(ldt_fecha_hoy), -3 ))
							if ldt_fec_vcto_m >= ldt_fecha_dia and ldt_fec_vcto_m <= ldt_fecha_hoy then
								ldt_fec_vcto_m	= datetime(relativedate(date(ldt_fec_vcto_m), 1 ))
							end if
						end if
					end if
				end if
				
				SELECT	"PER_DIAS_FESTIVOS"."DESCRIPCION"  
				INTO 		:ls_descrip  
				FROM 		"PER_DIAS_FESTIVOS"  
				WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_fec_mant
				USING		sqlca;
				if sqlca.sqlcode=100 then
					if ls_dia_mant='Sabado' or ls_dia_mant='Domingo' then
						if ll_cod_banco=16 then //BCI
							ldt_fec_vcto_m_aux	= datetime(relativedate(date(ldt_fec_vcto_m), 3 ))
						else
							ldt_fec_vcto_m_aux	= datetime(relativedate(date(ldt_fec_vcto_m), 4 ))
						end if
					else
						if ls_dia_mant<>'Viernes' then
							ldt_fec_vcto_m_aux	= datetime(relativedate(date(ldt_fec_vcto_m), 1 ))
						end if
					end if
				else
					ldt_fec_vcto_m					= datetime(relativedate(date(ldt_fec_vcto_m), 1 ))
					if ls_dia_mant='Viernes' or ls_dia_mant='Sabado' then
						if ll_cod_banco=16 then //BCI
							ldt_fec_vcto_m_aux	= datetime(relativedate(date(ldt_fec_vcto_m), 3 ))
						else
							ldt_fec_vcto_m_aux	= datetime(relativedate(date(ldt_fec_vcto_m), 4 ))
						end if
					else
						ldt_fec_vcto_m_aux		= ldt_fec_vcto_m
					end if
				end if
				
				dw_lista_envio_archivo_pac.setitem(ll_indi,'c_fecha_real_mant',ldt_fec_vcto_m_aux)
			else
				dw_lista_envio_archivo_pac.setitem(ll_indi,'c_fecha_real_mant',ldt_nulo)
			end if
			ldt_fec_venc_cred	= dw_lista_envio_archivo_pac.getitemdatetime(ll_indi,'c_fecha_real_cred')
			ldt_fec_venc_mant	= dw_lista_envio_archivo_pac.getitemdatetime(ll_indi,'c_fecha_real_mant')
			if isnull(ldt_fec_venc_cred) and isnull(ldt_fec_venc_mant) then
				dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','M')
			end if
		next
		dw_lista_envio_archivo_pac.accepttext()
		ll_tot_reg_antes		= dw_lista_envio_archivo_pac.rowcount()
		
		ls_filtro = "c_estado = 'S'"
		dw_lista_envio_archivo_pac.SetFilter(ls_filtro)
		dw_lista_envio_archivo_pac.Filter( )
		dw_lista_envio_archivo_pac.accepttext()
		ll_tot_reg_despues	= dw_lista_envio_archivo_pac.rowcount()
		if ll_tot_reg_antes <> ll_tot_reg_despues then
			messagebox("Advertencia","Para el Rango Fecha del "+string(ld_fec_ini,'dd/mm/yyyy')+" al "+string(ld_fec_fin,'dd/mm/yyyy')+", Existe(n) Diferencia(s) en Registro(s), Exportación de Archivo ya Realizado")
		end if
	else
		messagebox("Advertencia","No Registra Dato")
	end if
end if
end event

type p_2 from picture within tabpage_1
integer x = 1376
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
datetime	ld_fecha_fin
Double	ldb_uf_fin
date		ld_fecha,ld_fecha_proc

dw_lista_envio_archivo_pac.reset()
if trim(em_fec_fin.text)='00/00/0000' or trim(em_fec_fin.text)='' or &
	isnull(trim(em_fec_fin.text)) then	
	
	em_fec_fin.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text=string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if trim(em_fec_fin.text)<>'00/00/0000' and not isnull(trim(em_fec_fin.text)) and &
	trim(em_fec_fin.text)<>'' then
	
	ls_fecha = em_fec_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_fin.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_fin.text = Message.StringParm

datetime	ld_fec_ini,ld_fec_fin
ld_fec_ini	= datetime(date(em_fec_ini.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_fec_fin.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			cb_proceso.triggerevent(clicked!)
//			em_fec_fin.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type em_fec_fin from editmask within tabpage_1
integer x = 978
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 40
integer textsize = -11
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

event modified;datetime	ld_fec_ini,ld_fec_fin
Date		ld_fecha,ld_fecha_proc
Double	ldb_uf_fin

dw_lista_envio_archivo_pac.reset()
ld_fec_ini	= datetime(date(em_fec_ini.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_fec_fin.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			cb_proceso.triggerevent(clicked!)
//			em_fec_fin.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type st_2 from statictext within tabpage_1
integer x = 837
integer y = 1528
integer width = 142
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within tabpage_1
integer x = 741
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;Date		ld_fecha,ld_fecha_proc
String	ls_fecha
datetime	ldt_fec_min,ldt_fecha

dw_lista_envio_archivo_pac.reset()
if trim(em_fec_ini.text)='00/00/0000' or trim(em_fec_ini.text)='' or &
	isnull(trim(em_fec_ini.text)) then	
	
	em_fec_ini.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if trim(em_fec_ini.text)<>'00/00/0000' and not isnull(trim(em_fec_ini.text)) and &
	trim(em_fec_ini.text)<>'' then
	
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_ini.text 	= ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_ini.text 	= Message.StringParm
ld_fecha				= date(em_fec_ini.text)
ld_fecha_proc		= RelativeDate(ld_fecha, 7)
em_fec_fin.text	= string(ld_fecha_proc,"dd/mm/yyyy")

ldt_fecha			= datetime(date(em_fec_ini.text),time('00:00:00'))
SELECT	MIN("PAC_DETALLE"."FECHA_ENVIO")  
INTO 		:ldt_fec_min  
FROM 		"PAC_DETALLE"  
USING		sqlca;
if not isnull(ldt_fec_min) then
	if ldt_fecha < ldt_fec_min then
		messagebox("Advertencia","Fecha Inicial NO debe ser Menor a Fecha Mínima Registrada que es "+string(ldt_fec_min,'dd/mm/yyyy'))
		em_fec_ini.text	= string(ldt_fec_min,'dd/mm/yyyy')
	end if
end if

end event

type em_fec_ini from editmask within tabpage_1
integer x = 343
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 40
integer textsize = -11
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

event modified;datetime	ldt_fec_min,ldt_fecha

ldt_fecha	= datetime(date(em_fec_ini.text),time('00:00:00'))
SELECT	MIN("PAC_DETALLE"."FECHA_ENVIO")  
INTO 		:ldt_fec_min  
FROM 		"PAC_DETALLE"  
USING		sqlca;
if not isnull(ldt_fec_min) then
	if ldt_fecha < ldt_fec_min then
		messagebox("Advertencia","Fecha Inicial NO debe ser Menor a Fecha Mínima Registrada que es "+string(ldt_fec_min,'dd/mm/yyyy'))
		em_fec_ini.text	= string(ldt_fec_min,'dd/mm/yyyy')
	end if
end if

end event

type st_4 from statictext within tabpage_1
integer x = 18
integer y = 1528
integer width = 311
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_lista_envio_archivo_pac from datawindow within tabpage_1
integer x = 23
integer y = 32
integer width = 3845
integer height = 1424
integer taborder = 100
string title = "none"
string dataobject = "dw_lista_archivo_pac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3895
integer height = 1668
long backcolor = 67108864
string text = " Recupera Archivo"
long tabtextcolor = 33554432
string picturename = "Retrieve!"
long picturemaskcolor = 536870912
cb_exp_rec cb_exp_rec
cb_ord_rec cb_ord_rec
cb_filtrar_rec cb_filtrar_rec
cb_grabar cb_grabar
cb_proceso_rec cb_proceso_rec
p_4 p_4
em_fec_fin_rec em_fec_fin_rec
st_6 st_6
p_3 p_3
em_fec_ini_rec em_fec_ini_rec
st_5 st_5
dw_recupera_archivo dw_recupera_archivo
dw_cargar dw_cargar
cb_recupera cb_recupera
end type

on tabpage_2.create
this.cb_exp_rec=create cb_exp_rec
this.cb_ord_rec=create cb_ord_rec
this.cb_filtrar_rec=create cb_filtrar_rec
this.cb_grabar=create cb_grabar
this.cb_proceso_rec=create cb_proceso_rec
this.p_4=create p_4
this.em_fec_fin_rec=create em_fec_fin_rec
this.st_6=create st_6
this.p_3=create p_3
this.em_fec_ini_rec=create em_fec_ini_rec
this.st_5=create st_5
this.dw_recupera_archivo=create dw_recupera_archivo
this.dw_cargar=create dw_cargar
this.cb_recupera=create cb_recupera
this.Control[]={this.cb_exp_rec,&
this.cb_ord_rec,&
this.cb_filtrar_rec,&
this.cb_grabar,&
this.cb_proceso_rec,&
this.p_4,&
this.em_fec_fin_rec,&
this.st_6,&
this.p_3,&
this.em_fec_ini_rec,&
this.st_5,&
this.dw_recupera_archivo,&
this.dw_cargar,&
this.cb_recupera}
end on

on tabpage_2.destroy
destroy(this.cb_exp_rec)
destroy(this.cb_ord_rec)
destroy(this.cb_filtrar_rec)
destroy(this.cb_grabar)
destroy(this.cb_proceso_rec)
destroy(this.p_4)
destroy(this.em_fec_fin_rec)
destroy(this.st_6)
destroy(this.p_3)
destroy(this.em_fec_ini_rec)
destroy(this.st_5)
destroy(this.dw_recupera_archivo)
destroy(this.dw_cargar)
destroy(this.cb_recupera)
end on

type cb_exp_rec from commandbutton within tabpage_2
integer x = 2341
integer y = 1536
integer width = 242
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_cargar
if dw_cargar.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ord_rec from commandbutton within tabpage_2
integer x = 2094
integer y = 1536
integer width = 242
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

type cb_filtrar_rec from commandbutton within tabpage_2
integer x = 1847
integer y = 1536
integer width = 242
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

type cb_grabar from commandbutton within tabpage_2
integer x = 2651
integer y = 1536
integer width = 389
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
boolean default = true
end type

event clicked;Long		ll_max,ll_indi,ll_tot_reg,value,ll_rut,ll_numero_cupon,ll_monto_pago,ll_cod_banco,ll_new,&
			ll_ctas_pag_s,ll_ctas_pag_m,ll_tot_pagado_s,ll_tot_pagado_m,ll_interes,ll_gasto_cob,ll_count,ll_res,&
			ll_graba,ll_folio_pago,ll_count_seg,ll_cod_seguro,ll_monto,ll_cod_parque,ll_monto_seg,ll_count_pend,ll_count_pend_ci
String		ls_string_1,ls_string_2,ls_string_3,docname,ls_dv,ls_cod_rechazo,ls_estado,ls_cuenta,ls_base,ls_serie,&
			ls_tipo_mov,ls_caja,ls_fec_cred,ls_descrip,ls_dia_cred,ls_tipo_cob,ls_moneda_seg,ls_moneda,ls_tipo_mov_seg,ls_rut_empresa
datetime	ldt_fecha_cargo,ldt_fecha_pago,ldt_fecha_ori,ldt_fecha_carga,ldt_fecha_hoy,ld_fec_ini,ld_fec_fin,&
			ldt_fecha_reintento,ldt_fecha_aux,ldt_fecha_venc
Double	ll_numero,ldb_prima,ll_suma_seg,ldb_valor_uf

ll_tot_reg					= tab_1.tabpage_2.dw_cargar.rowcount()
ll_cod_parque				= tab_1.tabpage_2.dw_cargar.getitemnumber(1,'cadena_cod_parque')
SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
INTO 		:ls_rut_empresa
FROM 	"MEMBRETE_EMPRESA"  
WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque;

SELECT	Count("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
INTO		:ll_count_pend
FROM 	"ELECTRONICA_FB",   
			"ELECTRONICA_FB_DETALLE"  
WHERE 	( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
			( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and 
			( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
			( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = 'BE' ) AND 
			( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = 'CP' )   AND
			( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
			( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' );
			
SELECT	Count("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
INTO		:ll_count_pend_ci
FROM 	"ELECTRONICA_FB",   
			"ELECTRONICA_FB_DETALLE"  
WHERE 	( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
			( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
			( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
			( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = 'CI' ) AND 
			( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = 'CP' )   AND
			( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
			( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' );			
			
if ll_count_pend < ll_tot_reg then
	messagebox("Advertencia","Cantidad de Folios disponibles "+string(ll_count_pend)+" es menor al total a Procesar " +string(ll_tot_reg))
elseif ll_count_pend_ci < ll_tot_reg then
	messagebox("Advertencia","Cantidad de Folios disponibles "+string(ll_count_pend_ci)+" es menor al total a Procesar " +string(ll_tot_reg))	
else
	ll_res							= messagebox("Advertencia","Está Seguro Actualizar PAC",Exclamation!,YesNo!,2)
	if ll_res=1 then
		SetPointer(HourGlass!)	
		ll_graba					= 0
		ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
		ls_caja					= 'CP'
		ll_interes					= 0
		ll_gasto_cob				= 0
		gl_folio					= 0
		SELECT	MAX("SOL_PAC_RECUPERA_ARCHIVO"."CODIGO_GRUPO")  
		INTO 		:ll_max  
		FROM 		"SOL_PAC_RECUPERA_ARCHIVO"  
		USING		sqlca;
		if ll_max=0 or isnull(ll_max) then
			ll_max	= 1
		else
			ll_max ++
		end if
		if ll_tot_reg > 0 then
			if ll_max > 0 then
				for ll_indi=1 to ll_tot_reg
					tab_1.tabpage_2.dw_cargar.setitem(ll_indi,'codigo_grupo',ll_max)
					ls_base				= tab_1.tabpage_2.dw_cargar.getitemstring(ll_indi,'base')
					ls_serie				= tab_1.tabpage_2.dw_cargar.getitemstring(ll_indi,'serie')
					ll_numero			= tab_1.tabpage_2.dw_cargar.getitemnumber(ll_indi,'numero')
					wf_pagos_pac(ls_base,ls_serie,ll_numero,ll_indi)
				next
				dw_cargar.accepttext()
				if dw_cargar.update() = 1 then
					commit;
					INSERT INTO "SOL_PAC_RECUPERA_ARCHIVO"  
								( "CODIGO_GRUPO",	"NOMBRE_ARCHIVO",	"FECHA_CARGA",		"CANT_REGISTROS",	"USUARIO" )  
					VALUES 	( :ll_max,			:named,				:ldt_fecha_hoy,	:ll_tot_reg,		:gs_user )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ld_fec_ini					= datetime(date(em_fec_ini_rec.text),time('00:00:00'))
						ld_fec_fin					= datetime(date(em_fec_fin_rec.text),time('00:00:00'))
						dw_recupera_archivo.reset()
						dw_recupera_archivo.retrieve(ld_fec_ini,ld_fec_fin)
					else
						rollback;
						messagebox("Error Grabar","Error al Grabar Recupera Archivo PAC SQL: "+sqlca.sqlerrtext)
					end if
					messagebox("Grabar","Grabación Exitosa")
					ll_graba ++
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar Detalle Recuperación PAC SQL: "+sqlca.sqlerrtext)
				end if
			end if
		end if
		ll_tot_reg					= tab_1.tabpage_4.dw_no_aplicar.rowcount()
		if ll_tot_reg > 0 then
			if ll_max > 0 then
				for ll_indi=1 to ll_tot_reg
					tab_1.tabpage_4.dw_no_aplicar.setitem(ll_indi,'codigo_grupo',ll_max)
				next
				tab_1.tabpage_4.dw_no_aplicar.accepttext()
				if tab_1.tabpage_4.dw_no_aplicar.update() = 1 then
					commit;
					ll_graba ++
				else
					rollback;
	//				messagebox("Error Grabar","Error al Grabar Rechazo PAC SQL: "+sqlca.sqlerrtext)
				end if
			end if
		end if
		if ll_graba > 0 then
			cb_grabar.enabled		= false
		end if
		SetPointer(Arrow!)
	end if
end if	
end event

type cb_proceso_rec from picturebutton within tabpage_2
integer x = 1477
integer y = 1488
integer width = 169
integer height = 148
integer taborder = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;datetime		ld_fec_ini,ld_fec_fin
date			ld_fecha,ld_fecha_proc
Long			ll_tot_reg

cb_grabar.enabled			= false
ld_fec_ini					= datetime(date(em_fec_ini_rec.text),time('00:00:00'))
ld_fec_fin					= datetime(date(em_fec_fin_rec.text),time('00:00:00'))
dw_recupera_archivo.reset()
dw_cargar.reset()
tab_1.tabpage_4.dw_no_aplicar.reset()
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha					= date(em_fec_ini_rec.text)
	ld_fecha_proc			= RelativeDate(ld_fecha, 7)
	em_fec_fin_rec.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	ll_tot_reg				= dw_recupera_archivo.retrieve(ld_fec_ini,ld_fec_fin)
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Dato")
	end if
end if
end event

type p_4 from picture within tabpage_2
integer x = 1376
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
datetime	ld_fecha_fin
Double	ldb_uf_fin
date		ld_fecha,ld_fecha_proc

dw_recupera_archivo.reset()
dw_cargar.reset()
tab_1.tabpage_4.dw_no_aplicar.reset()
if trim(em_fec_fin_rec.text)='00/00/0000' or trim(em_fec_fin_rec.text)='' or &
	isnull(trim(em_fec_fin_rec.text)) then	
	
	em_fec_fin_rec.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_fin_rec.text)=-1 then 
	em_fec_fin_rec.text=string(today(),gs_formato_fecha)
	em_fec_fin_rec.setfocus()
	return
end if	
if trim(em_fec_fin_rec.text)<>'00/00/0000' and not isnull(trim(em_fec_fin_rec.text)) and &
	trim(em_fec_fin_rec.text)<>'' then
	
	ls_fecha = em_fec_fin_rec.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_fin_rec.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_fin_rec.text = Message.StringParm

datetime	ld_fec_ini,ld_fec_fin
ld_fec_ini					= datetime(date(em_fec_ini_rec.text),time('00:00:00'))
ld_fec_fin					= datetime(date(em_fec_fin_rec.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha					= date(em_fec_ini_rec.text)
	ld_fecha_proc			= RelativeDate(ld_fecha, 7)
	em_fec_fin_rec.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			em_fec_fin_rec.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type em_fec_fin_rec from editmask within tabpage_2
integer x = 978
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 50
integer textsize = -11
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

event modified;//datetime	ld_fec_ini,ld_fec_fin
//Date		ld_fecha,ld_fecha_proc
//Double	ldb_uf_fin
//
//dw_recupera_archivo.reset()
//dw_cargar.reset()
//tab_1.tabpage_4.dw_no_aplicar.reset()
//ld_fec_ini					= datetime(date(em_fec_ini_rec.text),time('00:00:00'))
//ld_fec_fin					= datetime(date(em_fec_fin_rec.text),time('00:00:00'))
//if ld_fec_fin < ld_fec_ini then
//	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
//	ld_fecha					= date(em_fec_ini_rec.text)
//	ld_fecha_proc			= RelativeDate(ld_fecha, 7)
//	em_fec_fin_rec.text	= string(ld_fecha_proc,'dd/mm/yyyy')
//else
//	SELECT	"TAB_UF"."VALOR_UF"  
//	INTO 		:ldb_uf_fin  
//	FROM 		"TAB_UF"  
//	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
//	USING		sqlca;
//	if sqlca.sqlcode=0 then
//	else
//		SELECT	MAX("TAB_UF"."FECHA_UF")  
//		INTO 		:ld_fec_fin  
//		FROM 		"TAB_UF"  
//		USING		sqlca;
//		if sqlca.sqlcode=0 then
//			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
//			em_fec_fin_rec.text	= string(ld_fec_fin,'dd/mm/yyyy')
//		end if
//	end if
//end if
end event

type st_6 from statictext within tabpage_2
integer x = 837
integer y = 1528
integer width = 142
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_3 from picture within tabpage_2
integer x = 741
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;Date		ld_fecha,ld_fecha_proc
String	ls_fecha

dw_recupera_archivo.reset()
dw_cargar.reset()
tab_1.tabpage_4.dw_no_aplicar.reset()
if trim(em_fec_ini_rec.text)='00/00/0000' or trim(em_fec_ini_rec.text)='' or &
	isnull(trim(em_fec_ini_rec.text)) then	
	
	em_fec_ini_rec.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_ini_rec.text)=-1 then 
	em_fec_ini_rec.text=string(today(),gs_formato_fecha)
	em_fec_ini_rec.setfocus()
	return
end if	
if trim(em_fec_ini_rec.text)<>'00/00/0000' and not isnull(trim(em_fec_ini_rec.text)) and &
	trim(em_fec_ini_rec.text)<>'' then
	
	ls_fecha = em_fec_ini_rec.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_ini_rec.text 	= ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_ini_rec.text 	= Message.StringParm
ld_fecha					= date(em_fec_ini_rec.text)
ld_fecha_proc			= RelativeDate(ld_fecha, 7)
em_fec_fin_rec.text	= string(ld_fecha_proc,"dd/mm/yyyy")
end event

type em_fec_ini_rec from editmask within tabpage_2
integer x = 343
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_5 from statictext within tabpage_2
integer x = 18
integer y = 1528
integer width = 311
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_recupera_archivo from datawindow within tabpage_2
integer x = 23
integer y = 32
integer width = 1097
integer height = 1424
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_archivos_recuperados"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long	ll_grupo
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_grupo										= dw_recupera_archivo.getitemnumber(row,'codigo_grupo')
	if ll_grupo > 0 then 
		dw_cargar.retrieve(ll_grupo)
		dw_cargar.scrolltorow(1)
		dw_cargar.setfocus()
	end if
end if
end event

event rowfocuschanged;Long	ll_grupo
if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	ll_grupo										= dw_recupera_archivo.getitemnumber(getrow(),'codigo_grupo')
	if ll_grupo > 0 then 
		dw_cargar.retrieve(ll_grupo)
		dw_cargar.scrolltorow(1)
		dw_cargar.setfocus()
	end if
end if
end event

type dw_cargar from datawindow within tabpage_2
integer x = 1161
integer y = 32
integer width = 2697
integer height = 1424
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_cargar_pac_recupera"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row_rec									= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_rec, TRUE)
end if

end event

event rowfocuschanged;if getrow() > 0 then
	il_row_rec									= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_rec, TRUE)
end if

end event

type cb_recupera from commandbutton within tabpage_2
integer x = 3090
integer y = 1536
integer width = 773
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Recuperar Archivo"
end type

event clicked;Long		ll_max,ll_indi,ll_tot_reg,value,ll_rut,ll_numero_cupon,ll_monto_pago,ll_cod_banco,ll_new,&
			ll_ctas_pag_s,ll_ctas_pag_m,ll_tot_pagado_s,ll_tot_pagado_m,ll_interes,ll_gasto_cob,ll_count,ll_new_no,&
			ll_count_reg,ll_cod_parque
String	ls_string_1,ls_string_2,ls_string_3,docname,ls_dv,ls_cod_rechazo,ls_estado,ls_cuenta,ls_base,ls_serie,&
			ls_tipo_mov,ls_caja
datetime	ldt_fecha_cargo,ldt_fecha_pago,ldt_fecha_ori,ldt_fecha_carga,ldt_fecha_hoy,ld_fec_ini,ld_fec_fin
Double	ll_numero
dw_recupera_archivo.reset()
dw_cargar.reset()
dw_recupera_pac.reset()
tab_1.tabpage_4.dw_no_aplicar.reset()
cb_grabar.enabled							= false
value 										= GetFileOpenName("Seleccione Archivo", docname, named, "DOC", + "Archivos de Texto (*.TXT),*.TXT")//," + "Archivos Doc (*.DOC),*.DOC")
If value = 1 Then
	SetPointer(HourGlass!)
	dw_recupera_pac.ImportFile(docname)
	ll_tot_reg								= dw_recupera_pac.rowcount()
	if ll_tot_reg > 0 then
		ls_string_1							= upper(dw_recupera_pac.getitemstring(1,'linea'))
		ldt_fecha_cargo					= datetime(date( string(mid(ls_string_1,121,2)) +'/'+ string(mid(ls_string_1,119,2)) +'/'+ string(mid(ls_string_1,123,4)) ) ,time('00:00:00'))
		ldt_fecha_ori						= datetime(date( string(mid(ls_string_1,139,2)) +'/'+ string(mid(ls_string_1,141,2)) +'/'+ string(mid(ls_string_1,143,4)) ) ,time('00:00:00'))
		dw_recupera_pac.deleterow(1)
		dw_recupera_pac.deleterow(dw_recupera_pac.rowcount())
		ll_tot_reg							= dw_recupera_pac.rowcount()
		if ll_tot_reg > 0 then
			cb_grabar.enabled				= true
			ldt_fecha_hoy					= datetime(date(gdt_fec_sistema),time('00:00:00'))
			ls_caja							= 'CP'
			ll_interes						= 0
			ll_gasto_cob					= 0
			SELECT	"SOL_PAC_RECUPERA_ARCHIVO"."FECHA_CARGA"  
			INTO 		:ldt_fecha_carga  
			FROM 	"SOL_PAC_RECUPERA_ARCHIVO"  
			WHERE 	"SOL_PAC_RECUPERA_ARCHIVO"."NOMBRE_ARCHIVO" = :named   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				messagebox("Advertencia","Archivo Ya Recuperado el día "+string(ldt_fecha_carga,'dd/mm/yyyy'))
			elseif sqlca.sqlcode=100 then
				for ll_indi=1 to ll_tot_reg
					ls_string_2			= upper(dw_recupera_pac.getitemstring(ll_indi,'linea'))
					ll_rut					= long(mid(ls_string_2,9,9))
					ls_dv					= mid(ls_string_2,18,1)
					ls_cod_rechazo		= mid(ls_string_2,93,4)
					ll_numero_cupon	= Long(mid(ls_string_2,44,25))
					ll_monto_pago		= Long(mid(ls_string_2,69,11))
					ldt_fecha_pago		= datetime(date( string(mid(ls_string_2,84,2)) +'/'+ string(mid(ls_string_2,82,2)) +'/'+ string(mid(ls_string_2,86,4)) ) ,time('00:00:00'))
					ls_estado			= mid(ls_string_2,90,3)
					ls_cuenta			= mid(ls_string_2,97,12)
					ll_cod_banco		= Long(mid(ls_string_2,110,3))
					
					SELECT	"CUPONERAS_DETALLE"."BASE", 	"CUPONERAS_DETALLE"."SERIE",	"CUPONERAS_DETALLE"."NUMERO",		"CUPONERAS_DETALLE"."TIPO_MOV", 	"CADENA"."COD_PARQUE" ,		"CADENA"."RUT" ,		"CLIENTE"."DV"
					INTO 		:ls_base,									:ls_serie,									:ll_numero,										:ls_tipo_mov,									:ll_cod_parque,						:ll_rut,					:ls_dv
					FROM 	"CADENA",   "CUPONERAS_DETALLE",		"CLIENTE"
					WHERE ( "CADENA"."CODIGO" = "CUPONERAS_DETALLE"."BASE" ) and  
							  ( "CADENA"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
							  ( "CADENA"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
							  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
							  ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon  ) 
					USING		sqlca;
					if sqlca.sqlcode=0 then
						SELECT	COUNT("SOL_PAC_RECUPERA"."RUT")  
						INTO 		:ll_count  
						FROM 	"SOL_PAC_RECUPERA"  
						WHERE 	"SOL_PAC_RECUPERA"."NUMERO_CUPON" = :ll_numero_cupon   ;
						if ll_count=0 or isnull(ll_count) then
							ll_new				= dw_cargar.insertrow(0)
							dw_cargar.setitem(ll_new,'rut',ll_rut)
							dw_cargar.setitem(ll_new,'dv',ls_dv)
							dw_cargar.setitem(ll_new,'codigo_rechazo',ls_cod_rechazo)
							dw_cargar.setitem(ll_new,'fecha_cargo',ldt_fecha_cargo)
							dw_cargar.setitem(ll_new,'base',ls_base)
							dw_cargar.setitem(ll_new,'serie',ls_serie)
							dw_cargar.setitem(ll_new,'numero',ll_numero)
							dw_cargar.setitem(ll_new,'numero_cupon',ll_numero_cupon)
							dw_cargar.setitem(ll_new,'monto_pago',ll_monto_pago)
							dw_cargar.setitem(ll_new,'fecha_pago',ldt_fecha_pago)
							dw_cargar.setitem(ll_new,'estado',ls_estado)
							dw_cargar.setitem(ll_new,'cuenta_cargo',ls_cuenta)
							dw_cargar.setitem(ll_new,'cod_banco',ll_cod_banco)
							dw_cargar.setitem(ll_new,'fecha_cargo_ori',ldt_fecha_ori)
							dw_cargar.setitem(ll_new,'cadena_cod_parque',ll_cod_parque)
							if ls_estado <> '021' then
								ll_new_no		= tab_1.tabpage_4.dw_no_aplicar.insertrow(0)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'rut',ll_rut)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'dv',ls_dv)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'codigo_rechazo',ls_cod_rechazo)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'fecha_cargo',ldt_fecha_cargo)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'base',ls_base)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'serie',ls_serie)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'numero',ll_numero)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'numero_cupon',ll_numero_cupon)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'monto_pago',ll_monto_pago)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'fecha_pago',ldt_fecha_pago)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'estado',ls_estado)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'cuenta_cargo',ls_cuenta)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'cod_banco',ll_cod_banco)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'fecha_cargo_ori',ldt_fecha_ori)
								tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'codigo_grupo',ll_max)
								tab_1.tabpage_4.dw_no_aplicar.accepttext()
							end if
						else
							SELECT	COUNT("SOL_PAC_RECUPERA_RECHAZO"."BASE")  
							INTO 		:ll_count_reg  
							FROM 		"SOL_PAC_RECUPERA_RECHAZO"  
							WHERE  ( "SOL_PAC_RECUPERA_RECHAZO"."BASE" = :ls_base ) AND  
									 ( "SOL_PAC_RECUPERA_RECHAZO"."SERIE" = :ls_serie ) AND  
									 ( "SOL_PAC_RECUPERA_RECHAZO"."NUMERO" = :ll_numero ) AND  
									 ( "SOL_PAC_RECUPERA_RECHAZO"."ESTADO_REG" = 'A' ) AND  
									 ( "SOL_PAC_RECUPERA_RECHAZO"."NUMERO_CUPON" = :ll_numero_cupon )   
							USING		sqlca;
							if ll_count_reg > 0 then
								ll_new				= dw_cargar.insertrow(0)
								dw_cargar.setitem(ll_new,'rut',ll_rut)
								dw_cargar.setitem(ll_new,'dv',ls_dv)
								dw_cargar.setitem(ll_new,'codigo_rechazo',ls_cod_rechazo)
								dw_cargar.setitem(ll_new,'fecha_cargo',ldt_fecha_cargo)
								dw_cargar.setitem(ll_new,'base',ls_base)
								dw_cargar.setitem(ll_new,'serie',ls_serie)
								dw_cargar.setitem(ll_new,'numero',ll_numero)
								dw_cargar.setitem(ll_new,'numero_cupon',ll_numero_cupon)
								dw_cargar.setitem(ll_new,'monto_pago',ll_monto_pago)
								dw_cargar.setitem(ll_new,'fecha_pago',ldt_fecha_pago)
								dw_cargar.setitem(ll_new,'estado',ls_estado)
								dw_cargar.setitem(ll_new,'cuenta_cargo',ls_cuenta)
								dw_cargar.setitem(ll_new,'cod_banco',ll_cod_banco)
								dw_cargar.setitem(ll_new,'fecha_cargo_ori',ldt_fecha_ori)
								dw_cargar.setitem(ll_new,'cadena_cod_parque',ll_cod_parque)
								if ls_estado <> '021' then
									ll_new_no		= tab_1.tabpage_4.dw_no_aplicar.insertrow(0)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'rut',ll_rut)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'dv',ls_dv)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'codigo_rechazo',ls_cod_rechazo)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'fecha_cargo',ldt_fecha_cargo)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'base',ls_base)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'serie',ls_serie)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'numero',ll_numero)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'numero_cupon',ll_numero_cupon)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'monto_pago',ll_monto_pago)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'fecha_pago',ldt_fecha_pago)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'estado',ls_estado)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'cuenta_cargo',ls_cuenta)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'cod_banco',ll_cod_banco)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'fecha_cargo_ori',ldt_fecha_ori)
									tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'codigo_grupo',ll_max)
									tab_1.tabpage_4.dw_no_aplicar.accepttext()
								end if
							else
								messagebox("Advertencia","Contrato Nº "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,###,###')+" con Fecha de Pago "+string(ldt_fecha_pago,'dd/mm/yyyy')+" Monto de $ "+string(ll_monto_pago,'###,###,###,###')+", Ya fue Recuperado")
							end if
						end if
					else
						messagebox("Advertencia","Nº Cupón "+string(ll_numero_cupon)+" No Existe del Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###,###'))
					end if
				next
				dw_cargar.accepttext()
			else
				messagebox("Advertencia","Error SQL "+sqlca.sqlerrtext)
			end if
		end if
	end if
	SetPointer(Arrow!)
end if
end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3895
integer height = 1668
long backcolor = 67108864
string text = " Cargos NO Aplicados"
long tabtextcolor = 33554432
string picturename = "StyleLibraryList!"
long picturemaskcolor = 536870912
cb_grabar_rechazo cb_grabar_rechazo
cb_exportar_no_ap cb_exportar_no_ap
cb_filtrar_no_ap cb_filtrar_no_ap
cb_ord_no_ap cb_ord_no_ap
cb_proceso_no cb_proceso_no
p_hasta p_hasta
em_fec_fin_hasta em_fec_fin_hasta
st_hasta st_hasta
p_desde p_desde
em_fec_ini_no em_fec_ini_no
st_desde st_desde
dw_no_aplicar dw_no_aplicar
end type

on tabpage_4.create
this.cb_grabar_rechazo=create cb_grabar_rechazo
this.cb_exportar_no_ap=create cb_exportar_no_ap
this.cb_filtrar_no_ap=create cb_filtrar_no_ap
this.cb_ord_no_ap=create cb_ord_no_ap
this.cb_proceso_no=create cb_proceso_no
this.p_hasta=create p_hasta
this.em_fec_fin_hasta=create em_fec_fin_hasta
this.st_hasta=create st_hasta
this.p_desde=create p_desde
this.em_fec_ini_no=create em_fec_ini_no
this.st_desde=create st_desde
this.dw_no_aplicar=create dw_no_aplicar
this.Control[]={this.cb_grabar_rechazo,&
this.cb_exportar_no_ap,&
this.cb_filtrar_no_ap,&
this.cb_ord_no_ap,&
this.cb_proceso_no,&
this.p_hasta,&
this.em_fec_fin_hasta,&
this.st_hasta,&
this.p_desde,&
this.em_fec_ini_no,&
this.st_desde,&
this.dw_no_aplicar}
end on

on tabpage_4.destroy
destroy(this.cb_grabar_rechazo)
destroy(this.cb_exportar_no_ap)
destroy(this.cb_filtrar_no_ap)
destroy(this.cb_ord_no_ap)
destroy(this.cb_proceso_no)
destroy(this.p_hasta)
destroy(this.em_fec_fin_hasta)
destroy(this.st_hasta)
destroy(this.p_desde)
destroy(this.em_fec_ini_no)
destroy(this.st_desde)
destroy(this.dw_no_aplicar)
end on

type cb_grabar_rechazo from commandbutton within tabpage_4
integer x = 2651
integer y = 1536
integer width = 389
integer height = 100
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;if dw_no_aplicar.rowcount() > 0 then
	if dw_no_aplicar.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_exportar_no_ap from commandbutton within tabpage_4
integer x = 3543
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_no_aplicar
if dw_no_aplicar.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar_no_ap from commandbutton within tabpage_4
integer x = 1765
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
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
dw_no_aplicar.SETfilter(NULO)
dw_no_aplicar.filter()
end event

type cb_ord_no_ap from commandbutton within tabpage_4
integer x = 2094
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull(nulo)
dw_no_aplicar.setsort(nulo)
dw_no_aplicar.sort()
end event

type cb_proceso_no from picturebutton within tabpage_4
integer x = 1477
integer y = 1488
integer width = 169
integer height = 148
integer taborder = 70
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;string 	ls_string,ls_filtro,ls_base,ls_serie,ls_est_reg
Date		ld_fecha,ld_fecha_proc
Datetime	ldt_fec_vcto_c,ldt_fec_vcto_m,ld_fec_ini,ld_fec_fin
Long		ll_tot_reg,ll_indi,ll_cupon_c,ll_count,ll_cupon_m,ll_tot_reg_antes,ll_tot_reg_despues
Double	ldb_cta_cred,ldb_cta_mant,ll_numero

ld_fec_ini					= datetime(date(em_fec_ini_no.text),time('00:00:00'))
ld_fec_fin					= datetime(date(em_fec_fin_hasta.text),time('00:00:00'))
dw_no_aplicar.reset()
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha					= date(em_fec_ini_no.text)
	ld_fecha_proc			= RelativeDate(ld_fecha, 7)
	em_fec_fin_hasta.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	ll_tot_reg				= dw_no_aplicar.retrieve(ld_fec_ini,ld_fec_fin)
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Dato")
	end if
end if
end event

type p_hasta from picture within tabpage_4
integer x = 1376
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
datetime	ld_fecha_fin
Double	ldb_uf_fin
date		ld_fecha,ld_fecha_proc

dw_no_aplicar.reset()
if trim(em_fec_fin_hasta.text)='00/00/0000' or trim(em_fec_fin_hasta.text)='' or &
	isnull(trim(em_fec_fin_hasta.text)) then	
	
	em_fec_fin_hasta.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_fin_hasta.text)=-1 then 
	em_fec_fin_hasta.text=string(today(),gs_formato_fecha)
	em_fec_fin_hasta.setfocus()
	return
end if	
if trim(em_fec_fin_hasta.text)<>'00/00/0000' and not isnull(trim(em_fec_fin_hasta.text)) and &
	trim(em_fec_fin_hasta.text)<>'' then
	
	ls_fecha = em_fec_fin_hasta.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_fin_hasta.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_fin_hasta.text = Message.StringParm

datetime	ld_fec_ini,ld_fec_fin
ld_fec_ini	= datetime(date(em_fec_ini_no.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_fec_fin_hasta.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini_no.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin_hasta.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			em_fec_fin_hasta.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type em_fec_fin_hasta from editmask within tabpage_4
integer x = 978
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 50
integer textsize = -11
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

event modified;datetime	ld_fec_ini,ld_fec_fin
Date		ld_fecha,ld_fecha_proc
Double	ldb_uf_fin

dw_no_aplicar.reset()
ld_fec_ini	= datetime(date(em_fec_ini_no.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_fec_fin_hasta.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini_no.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin_hasta.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			em_fec_fin_hasta.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type st_hasta from statictext within tabpage_4
integer x = 837
integer y = 1528
integer width = 142
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_desde from picture within tabpage_4
integer x = 741
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;Date		ld_fecha,ld_fecha_proc
String	ls_fecha

dw_no_aplicar.reset()
if trim(em_fec_ini_no.text)='00/00/0000' or trim(em_fec_ini_no.text)='' or &
	isnull(trim(em_fec_ini_no.text)) then	
	
	em_fec_ini_no.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_ini_no.text)=-1 then 
	em_fec_ini_no.text=string(today(),gs_formato_fecha)
	em_fec_ini_no.setfocus()
	return
end if	
if trim(em_fec_ini_no.text)<>'00/00/0000' and not isnull(trim(em_fec_ini_no.text)) and &
	trim(em_fec_ini_no.text)<>'' then
	
	ls_fecha = em_fec_ini_no.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_ini_no.text 	= ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_ini_no.text 	= Message.StringParm
ld_fecha				= date(em_fec_ini_no.text)
ld_fecha_proc		= RelativeDate(ld_fecha, 7)
em_fec_fin_hasta.text	= string(ld_fecha_proc,"dd/mm/yyyy")
end event

type em_fec_ini_no from editmask within tabpage_4
integer x = 343
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 50
integer textsize = -11
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

type st_desde from statictext within tabpage_4
integer x = 18
integer y = 1528
integer width = 311
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_no_aplicar from datawindow within tabpage_4
integer x = 23
integer y = 32
integer width = 3845
integer height = 1424
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_rechazo_pac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row_no	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_no, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row_no	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_no, TRUE)
end if
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3895
integer height = 1668
long backcolor = 67108864
string text = " Tabla Rechazo"
long tabtextcolor = 33554432
string picturename = "Hand!"
long picturemaskcolor = 536870912
cb_exportar cb_exportar
dw_errores dw_errores
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
end type

on tabpage_3.create
this.cb_exportar=create cb_exportar
this.dw_errores=create dw_errores
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.Control[]={this.cb_exportar,&
this.dw_errores,&
this.cb_ordenar,&
this.cb_filtrar}
end on

on tabpage_3.destroy
destroy(this.cb_exportar)
destroy(this.dw_errores)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
end on

type cb_exportar from commandbutton within tabpage_3
integer x = 3543
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_errores
if dw_errores.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type dw_errores from datawindow within tabpage_3
integer x = 23
integer y = 32
integer width = 3845
integer height = 1424
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_tabala_errores_pac"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_ordenar from commandbutton within tabpage_3
integer x = 23
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull(nulo)
dw_errores.setsort(nulo)
dw_errores.sort()
end event

type cb_filtrar from commandbutton within tabpage_3
integer x = 357
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 50
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
dw_errores.SETfilter(NULO)
dw_errores.filter()
end event

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3895
integer height = 1668
long backcolor = 67108864
string text = " Universo de Mandatos"
long tabtextcolor = 33554432
string picturename = "Custom042!"
long picturemaskcolor = 536870912
cb_grabar_man cb_grabar_man
cb_exp_uni cb_exp_uni
cb_ord_uni cb_ord_uni
cb_filtrar_uni cb_filtrar_uni
cb_cargar_uni cb_cargar_uni
dw_lista_universo dw_lista_universo
end type

on tabpage_5.create
this.cb_grabar_man=create cb_grabar_man
this.cb_exp_uni=create cb_exp_uni
this.cb_ord_uni=create cb_ord_uni
this.cb_filtrar_uni=create cb_filtrar_uni
this.cb_cargar_uni=create cb_cargar_uni
this.dw_lista_universo=create dw_lista_universo
this.Control[]={this.cb_grabar_man,&
this.cb_exp_uni,&
this.cb_ord_uni,&
this.cb_filtrar_uni,&
this.cb_cargar_uni,&
this.dw_lista_universo}
end on

on tabpage_5.destroy
destroy(this.cb_grabar_man)
destroy(this.cb_exp_uni)
destroy(this.cb_ord_uni)
destroy(this.cb_filtrar_uni)
destroy(this.cb_cargar_uni)
destroy(this.dw_lista_universo)
end on

type cb_grabar_man from commandbutton within tabpage_5
integer x = 2651
integer y = 1536
integer width = 389
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long	ll_res
ll_res	= messagebox("Advertencia","Desea Actualizar Tabla Mandatos PAC",Exclamation!,YesNo!,2)
if ll_res=1 then
	DELETE FROM "SOL_PAC_UNIVERSO_MANDATOS"  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		commit;
	else
		rollback;
	end if
	if dw_lista_universo.rowcount() > 0 then
		if dw_lista_universo.update() = 1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			cb_grabar_man.enabled	= false
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Tabla Mandatos SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_exp_uni from commandbutton within tabpage_5
integer x = 3543
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista_universo
if dw_lista_universo.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ord_uni from commandbutton within tabpage_5
integer x = 2094
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull(nulo)
dw_lista_universo.setsort(nulo)
dw_lista_universo.sort()
end event

type cb_filtrar_uni from commandbutton within tabpage_5
integer x = 1765
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
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
dw_lista_universo.SETfilter(NULO)
dw_lista_universo.filter()
end event

type cb_cargar_uni from commandbutton within tabpage_5
integer x = 23
integer y = 1536
integer width = 407
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cargar"
end type

event clicked;Long		value,ll_tot_reg,ll_indi,ll_rut,ll_numero_cupon,ll_monto_pago,ll_cod_banco,ll_new,ll_cod_banco_des,&
			ll_identificador,ll_rut_aux
String	docname,named_uni,ls_string_1,ls_string_2,ls_string_3,ls_dv,ls_cod_rechazo,ls_estado,ls_tipo
Datetime	ldt_fecha_cargo

dw_recupera_uni.reset()
dw_lista_universo.reset()
value 										= GetFileOpenName("Seleccione Archivo", docname, named_uni, "DOC", + "Archivos de Texto (*.TXT),*.TXT")//," + "Archivos Doc (*.DOC),*.DOC")
If value = 1 Then
	SetPointer(HourGlass!)
	dw_recupera_uni.ImportFile(docname)
	ll_tot_reg								= dw_recupera_uni.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg 
			ls_string_1			= upper(dw_recupera_uni.getitemstring(ll_indi,'linea'))
			ls_tipo				= mid(ls_string_1,1,1)
			if ls_tipo='2' then
				ll_rut				= long(mid(ls_string_1,9,9))
				ls_dv					= mid(ls_string_1,18,1)
				ls_cod_rechazo		= mid(ls_string_1,257,4)
				ldt_fecha_cargo	= datetime(date( string(mid(ls_string_1,229,2)) +'/'+ string(mid(ls_string_1,227,2)) +'/'+ string(mid(ls_string_1,231,4)) ) ,time('00:00:00'))
				ls_estado			= mid(ls_string_1,254,3)
				ll_cod_banco		= Long(mid(ls_string_1,189,3))
				ll_cod_banco_des	= Long(mid(ls_string_1,261,3))
				ll_identificador	= Long(mid(ls_string_1,139,25))
				SELECT	"CLIENTE"."RUT"  
				INTO 		:ll_rut_aux  
				FROM 		"CLIENTE"  
				WHERE 	"CLIENTE"."RUT" = :ll_rut   
				USING		sqlca ;
				if sqlca.sqlcode=0 then
					ll_new				= dw_lista_universo.insertrow(0)
					dw_lista_universo.setitem(ll_new,'rut',ll_rut)
					dw_lista_universo.setitem(ll_new,'dv',ls_dv)
					dw_lista_universo.setitem(ll_new,'cod_rechazo',ls_cod_rechazo)
					dw_lista_universo.setitem(ll_new,'fecha_movimiento',ldt_fecha_cargo)
					dw_lista_universo.setitem(ll_new,'estado',ls_estado)
					dw_lista_universo.setitem(ll_new,'cod_banco_recauda',ll_cod_banco)
					dw_lista_universo.setitem(ll_new,'cod_banco_destino',ll_cod_banco_des)
					dw_lista_universo.setitem(ll_new,'usuario_crea',gs_user)
					dw_lista_universo.setitem(ll_new,'identificador',ll_identificador)
					dw_lista_universo.setitem(ll_new,'nombre_archivo',named_uni)
				else
					SELECT	"SOL_PAC"."RUT_TITULAR",	"SOL_PAC"."DV"
					INTO 		:ll_rut,							:ls_dv
					FROM 		"SOL_PAC"
					WHERE    "SOL_PAC"."NUMERO" = :ll_identificador   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_new				= dw_lista_universo.insertrow(0)
						dw_lista_universo.setitem(ll_new,'rut',ll_rut)
						dw_lista_universo.setitem(ll_new,'dv',ls_dv)
						dw_lista_universo.setitem(ll_new,'cod_rechazo',ls_cod_rechazo)
						dw_lista_universo.setitem(ll_new,'fecha_movimiento',ldt_fecha_cargo)
						dw_lista_universo.setitem(ll_new,'estado',ls_estado)
						dw_lista_universo.setitem(ll_new,'cod_banco_recauda',ll_cod_banco)
						dw_lista_universo.setitem(ll_new,'cod_banco_destino',ll_cod_banco_des)
						dw_lista_universo.setitem(ll_new,'usuario_crea',gs_user)
						dw_lista_universo.setitem(ll_new,'identificador',ll_identificador)
						dw_lista_universo.setitem(ll_new,'nombre_archivo',named_uni)
					end if
				end if
			end if
		next
		dw_lista_universo.accepttext()
		if dw_lista_universo.rowcount() > 0 then
			cb_grabar_man.enabled	= true
			messagebox("Advertencia","Recuerde Grabar la Actualización de Mandatos Vigentes")
		else
			cb_grabar_man.enabled	= false
			messagebox("Advertencia","No Registra Mandato")
		end if
	else
		dw_lista_universo.retrieve()
		cb_grabar_man.enabled		= false
		messagebox("Advertencia","No Fue Cargado Archivo Mandatos Vigentes")
	end if
	SetPointer(Arrow!)
else
	dw_lista_universo.retrieve()
	cb_grabar_man.enabled			= false
	messagebox("Advertencia","No Fue Cargado Archivo Mandatos Vigentes")
end if
end event

type dw_lista_universo from datawindow within tabpage_5
integer x = 23
integer y = 32
integer width = 3845
integer height = 1424
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_universo_mandatos"
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row_uni	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_uni, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row_uni	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_uni, TRUE)
end if
end event

type tabpage_6 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3895
integer height = 1668
long backcolor = 67108864
string text = " Pagos Enviados"
long tabtextcolor = 33554432
string picturename = "CheckStatus!"
long picturemaskcolor = 536870912
cb_exportar_pag_env cb_exportar_pag_env
cb_ord_pag_envio cb_ord_pag_envio
cb_filtrar_pag_envio cb_filtrar_pag_envio
cb_proceso_env cb_proceso_env
p_26 p_26
em_fec_fin_env em_fec_fin_env
st_26 st_26
p_16 p_16
em_fec_ini_env em_fec_ini_env
st_46 st_46
dw_lista_pagos_enviados dw_lista_pagos_enviados
end type

on tabpage_6.create
this.cb_exportar_pag_env=create cb_exportar_pag_env
this.cb_ord_pag_envio=create cb_ord_pag_envio
this.cb_filtrar_pag_envio=create cb_filtrar_pag_envio
this.cb_proceso_env=create cb_proceso_env
this.p_26=create p_26
this.em_fec_fin_env=create em_fec_fin_env
this.st_26=create st_26
this.p_16=create p_16
this.em_fec_ini_env=create em_fec_ini_env
this.st_46=create st_46
this.dw_lista_pagos_enviados=create dw_lista_pagos_enviados
this.Control[]={this.cb_exportar_pag_env,&
this.cb_ord_pag_envio,&
this.cb_filtrar_pag_envio,&
this.cb_proceso_env,&
this.p_26,&
this.em_fec_fin_env,&
this.st_26,&
this.p_16,&
this.em_fec_ini_env,&
this.st_46,&
this.dw_lista_pagos_enviados}
end on

on tabpage_6.destroy
destroy(this.cb_exportar_pag_env)
destroy(this.cb_ord_pag_envio)
destroy(this.cb_filtrar_pag_envio)
destroy(this.cb_proceso_env)
destroy(this.p_26)
destroy(this.em_fec_fin_env)
destroy(this.st_26)
destroy(this.p_16)
destroy(this.em_fec_ini_env)
destroy(this.st_46)
destroy(this.dw_lista_pagos_enviados)
end on

type cb_exportar_pag_env from commandbutton within tabpage_6
integer x = 3543
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista_pagos_enviados
if dw_lista_pagos_enviados.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ord_pag_envio from commandbutton within tabpage_6
integer x = 2094
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull(nulo)
dw_lista_pagos_enviados.setsort(nulo)
dw_lista_pagos_enviados.sort()
end event

type cb_filtrar_pag_envio from commandbutton within tabpage_6
integer x = 1765
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
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
dw_lista_pagos_enviados.SETfilter(NULO)
dw_lista_pagos_enviados.filter()
end event

type cb_proceso_env from picturebutton within tabpage_6
integer x = 1477
integer y = 1488
integer width = 169
integer height = 148
integer taborder = 70
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;string 	ls_string,ls_filtro,ls_base,ls_serie,ls_est_reg,ls_estado_mandato,ls_dia_cred,ls_dia_mant,ls_fec_cred,&
			ls_fec_mant,ls_descrip
Date		ld_fecha,ld_fecha_proc
Datetime	ldt_fec_vcto_c,ldt_fec_vcto_m,ld_fec_ini,ld_fec_fin,ldt_fec_vcto_c_aux,ldt_fec_vcto_m_aux,ldt_nulo,&
			ldt_fecha_dia,ldt_fecha_hoy
Long		ll_tot_reg,ll_indi,ll_cupon_c,ll_count,ll_cupon_m,ll_tot_reg_antes,ll_tot_reg_despues,&
			ll_rut,ll_cod_banco
Double	ldb_cta_cred,ldb_cta_mant,ll_numero

ldt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
ld_fec_ini					= datetime(date(em_fec_ini_env.text),time('00:00:00'))
ld_fec_fin					= datetime(date(em_fec_fin_env.text),time('00:00:00'))
dw_lista_pagos_enviados.reset()
ls_filtro 					= ""
Setnull(ldt_nulo)
dw_lista_pagos_enviados.SetFilter(ls_filtro)
dw_lista_pagos_enviados.Filter( )
dw_lista_pagos_enviados.accepttext()

//dw_lista_pagos_enviados_respuesta
//dw_lista_pagos_enviados
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha					= date(em_fec_ini_env.text)
	ld_fecha_proc			= RelativeDate(ld_fecha, 7)
	em_fec_fin_env.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	ll_tot_reg				= dw_lista_pagos_enviados.retrieve(ld_fec_ini,ld_fec_fin)
	if ll_tot_reg>0 then

	else
		messagebox("Advertencia","No Registra Dato")
	end if
end if
end event

type p_26 from picture within tabpage_6
integer x = 1376
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
datetime	ld_fecha_fin
Double	ldb_uf_fin
date		ld_fecha,ld_fecha_proc

dw_lista_pagos_enviados.reset()
if trim(em_fec_fin_env.text)='00/00/0000' or trim(em_fec_fin_env.text)='' or &
	isnull(trim(em_fec_fin_env.text)) then	
	
	em_fec_fin_env.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_fin_env.text)=-1 then 
	em_fec_fin_env.text=string(today(),gs_formato_fecha)
	em_fec_fin_env.setfocus()
	return
end if	
if trim(em_fec_fin_env.text)<>'00/00/0000' and not isnull(trim(em_fec_fin_env.text)) and &
	trim(em_fec_fin_env.text)<>'' then
	
	ls_fecha = em_fec_fin_env.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_fin_env.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_fin_env.text = Message.StringParm

datetime	ld_fec_ini,ld_fec_fin
ld_fec_ini	= datetime(date(em_fec_ini_env.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_fec_fin_env.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini_env.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin_env.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			cb_proceso_env.triggerevent(clicked!)
//			em_fec_fin.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type em_fec_fin_env from editmask within tabpage_6
integer x = 978
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 50
integer textsize = -11
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

event modified;datetime	ld_fec_ini,ld_fec_fin
Date		ld_fecha,ld_fecha_proc
Double	ldb_uf_fin

dw_lista_pagos_enviados.reset()
ld_fec_ini	= datetime(date(em_fec_ini_env.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_fec_fin_env.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini_env.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin_env.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			cb_proceso_env.triggerevent(clicked!)
//			em_fec_fin.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type st_26 from statictext within tabpage_6
integer x = 837
integer y = 1528
integer width = 142
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_16 from picture within tabpage_6
integer x = 741
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;Date		ld_fecha,ld_fecha_proc
String	ls_fecha
datetime	ldt_fec_min,ldt_fecha

dw_lista_pagos_enviados.reset()
if trim(em_fec_ini_env.text)='00/00/0000' or trim(em_fec_ini_env.text)='' or &
	isnull(trim(em_fec_ini_env.text)) then	
	
	em_fec_ini_env.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_ini_env.text)=-1 then 
	em_fec_ini_env.text=string(today(),gs_formato_fecha)
	em_fec_ini_env.setfocus()
	return
end if	
if trim(em_fec_ini_env.text)<>'00/00/0000' and not isnull(trim(em_fec_ini_env.text)) and &
	trim(em_fec_ini_env.text)<>'' then
	
	ls_fecha = em_fec_ini_env.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_ini_env.text 	= ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_ini_env.text 	= Message.StringParm
ld_fecha				= date(em_fec_ini_env.text)
ld_fecha_proc		= RelativeDate(ld_fecha, 7)
em_fec_fin_env.text	= string(ld_fecha_proc,"dd/mm/yyyy")

ldt_fecha			= datetime(date(em_fec_ini_env.text),time('00:00:00'))
SELECT	MIN("PAC_DETALLE"."FECHA_ENVIO")  
INTO 		:ldt_fec_min  
FROM 		"PAC_DETALLE"  
USING		sqlca;
if not isnull(ldt_fec_min) then
	if ldt_fecha < ldt_fec_min then
		messagebox("Advertencia","Fecha Inicial NO debe ser Menor a Fecha Mínima Registrada que es "+string(ldt_fec_min,'dd/mm/yyyy'))
		em_fec_ini_env.text	= string(ldt_fec_min,'dd/mm/yyyy')
	end if
end if

end event

type em_fec_ini_env from editmask within tabpage_6
integer x = 343
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 50
integer textsize = -11
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

event modified;datetime	ldt_fec_min,ldt_fecha

ldt_fecha	= datetime(date(em_fec_ini_env.text),time('00:00:00'))
SELECT	MIN("PAC_DETALLE"."FECHA_ENVIO")  
INTO 		:ldt_fec_min  
FROM 		"PAC_DETALLE"  
USING		sqlca;
if not isnull(ldt_fec_min) then
	if ldt_fecha < ldt_fec_min then
		messagebox("Advertencia","Fecha Inicial NO debe ser Menor a Fecha Mínima Registrada que es "+string(ldt_fec_min,'dd/mm/yyyy'))
		em_fec_ini_env.text	= string(ldt_fec_min,'dd/mm/yyyy')
	end if
end if

end event

type st_46 from statictext within tabpage_6
integer x = 18
integer y = 1528
integer width = 311
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_lista_pagos_enviados from datawindow within tabpage_6
integer x = 23
integer y = 32
integer width = 3845
integer height = 1424
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_pagos_enviados_respuesta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_filtro
if row>0 then
	il_row_env	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_env, TRUE)
else
	ls_columna	= dwo.name
	CHOOSE CASE ls_columna
		CASE 't_021_c','t_021_t'
			ls_filtro	= 'sol_pac_recupera_estado = "021"'
			dw_lista_pagos_enviados.SETfilter(ls_filtro)
			dw_lista_pagos_enviados.filter()
		CASE 't_023_c','t_023_t'
			ls_filtro	= 'sol_pac_recupera_estado = "023"'
			dw_lista_pagos_enviados.SETfilter(ls_filtro)
			dw_lista_pagos_enviados.filter()
		CASE 't_999_c','t_999_t'
			ls_filtro	= 'sol_pac_recupera_estado = "999"'
			dw_lista_pagos_enviados.SETfilter(ls_filtro)
			dw_lista_pagos_enviados.filter()
		CASE 't_pend_c','t_pend_t'
			ls_filtro	= 'sol_pac_recupera_estado = "" or isnull(sol_pac_recupera_estado)'
			dw_lista_pagos_enviados.SETfilter(ls_filtro)
			dw_lista_pagos_enviados.filter()
		CASE 't_may1_c','t_may1_t'
			ls_filtro	= 'c_mas > 1'
			dw_lista_pagos_enviados.SETfilter(ls_filtro)
			dw_lista_pagos_enviados.filter()
		CASE 't_todo'
			ls_filtro	= ''
			dw_lista_pagos_enviados.SETfilter(ls_filtro)
			dw_lista_pagos_enviados.filter()
	END CHOOSE

end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row_env	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_env, TRUE)
end if
end event

type tabpage_7 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3895
integer height = 1668
long backcolor = 67108864
string text = "PAC Vigente(s)"
long tabtextcolor = 33554432
string picturename = "Count!"
long picturemaskcolor = 536870912
cb_filtrar_mora cb_filtrar_mora
cb_ord_mora cb_ord_mora
cb_exp_mora cb_exp_mora
cb_actualizar cb_actualizar
dw_pac_mora dw_pac_mora
end type

on tabpage_7.create
this.cb_filtrar_mora=create cb_filtrar_mora
this.cb_ord_mora=create cb_ord_mora
this.cb_exp_mora=create cb_exp_mora
this.cb_actualizar=create cb_actualizar
this.dw_pac_mora=create dw_pac_mora
this.Control[]={this.cb_filtrar_mora,&
this.cb_ord_mora,&
this.cb_exp_mora,&
this.cb_actualizar,&
this.dw_pac_mora}
end on

on tabpage_7.destroy
destroy(this.cb_filtrar_mora)
destroy(this.cb_ord_mora)
destroy(this.cb_exp_mora)
destroy(this.cb_actualizar)
destroy(this.dw_pac_mora)
end on

type cb_filtrar_mora from commandbutton within tabpage_7
integer x = 1765
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_pac_mora.SETfilter(NULO)
dw_pac_mora.filter()
end event

type cb_ord_mora from commandbutton within tabpage_7
integer x = 2094
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull(nulo)
dw_pac_mora.setsort(nulo)
dw_pac_mora.sort()
end event

type cb_exp_mora from commandbutton within tabpage_7
integer x = 3543
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_pac_mora
if dw_pac_mora.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_actualizar from commandbutton within tabpage_7
integer x = 23
integer y = 1536
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;if dw_pac_mora.retrieve() = 0 then
	messagebox("Advertencia","No registra Dato")
end if
end event

type dw_pac_mora from datawindow within tabpage_7
integer x = 23
integer y = 32
integer width = 3845
integer height = 1424
integer taborder = 20
string title = "none"
string dataobject = "dw_cuenta_pac_con_mora"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type dw_print_mant from datawindow within w_envio_archivo_pac
boolean visible = false
integer x = 2423
integer y = 1880
integer width = 1184
integer height = 432
string title = "none"
string dataobject = "dwe_imprimir_detalle_envio_credito"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_print_cred from datawindow within w_envio_archivo_pac
boolean visible = false
integer x = 494
integer y = 1884
integer width = 1138
integer height = 432
string title = "none"
string dataobject = "dwe_imprimir_detalle_envio_credito"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_envio_archivo_pac
integer x = 1696
integer y = 1896
integer width = 288
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;CHOOSE CASE tab_1.SelectedTab
	CASE 1
		if dw_print_cred.rowcount() = 0 and dw_print_mant.rowcount() = 0 then
			messagebox("Advertencia","Recuerde Antes de Imprimir debe EXPORTAR ARCHIVO")
		else
			if gs_empresa = 'El Prado' then
				dw_print_cred.object.t_empresa.text	= 'Rut Empresa~r96.844.000 - 4'
				dw_print_mant.object.t_empresa.text	= 'Rut Empresa~r96.844.000 - 4'
			elseif gs_empresa = 'La Foresta' then
				dw_print_cred.object.t_empresa.text	= 'Rut Empresa~r96.835.970 - 3'
				dw_print_mant.object.t_empresa.text	= 'Rut Empresa~r96.835.970 - 3'
			elseif gs_empresa = 'Concepcion' then
				dw_print_cred.object.t_empresa.text	= 'Rut Empresa~r76.703.310 - 9'
				dw_print_mant.object.t_empresa.text	= 'Rut Empresa~r76.703.310 - 9'
			end if
			if dw_print_cred.rowcount() > 0 and dw_print_mant.rowcount() = 0 then
				dw_print_cred.setSort("fecha_vcto_cred A");
				dw_print_cred.sort();
				f_Print( dw_print_cred )
			elseif dw_print_cred.rowcount() = 0 and dw_print_mant.rowcount() > 0 then
				dw_print_mant.setSort("fecha_vcto_cred A");
				dw_print_mant.sort();
				f_Print( dw_print_mant )
			elseif dw_print_cred.rowcount() > 0 and dw_print_mant.rowcount() > 0 then
				dw_print_cred.setSort("fecha_vcto_cred A");
				dw_print_cred.sort();
				dw_print_mant.setSort("fecha_vcto_cred A");
				dw_print_mant.sort();
				f_Print( dw_print_cred )
				dw_print_mant.print()
			end if
		end if
		
	CASE 2
		if tab_1.tabpage_2.dw_cargar.rowcount() > 0 then
			f_Print( tab_1.tabpage_2.dw_cargar )
		end if
		
	CASE 3
		if tab_1.tabpage_4.dw_no_aplicar.rowcount() > 0 then
			f_Print(tab_1.tabpage_4.dw_no_aplicar)
		end if		
	
	CASE 4
		if tab_1.tabpage_3.dw_errores.rowcount() > 0 then
			tab_1.tabpage_3.dw_errores.Object.DataWindow.Zoom = 93
			f_Print( tab_1.tabpage_3.dw_errores )
			tab_1.tabpage_3.dw_errores.Object.DataWindow.Zoom = 100
		end if
		
	CASE 5
		if tab_1.tabpage_5.dw_lista_universo.rowcount() > 0 then
			f_Print(tab_1.tabpage_5.dw_lista_universo )
		end if	

	CASE 6
		if tab_1.tabpage_6.dw_lista_pagos_enviados.rowcount() > 0 then
			f_Print(tab_1.tabpage_6.dw_lista_pagos_enviados)
		end if	
		
	CASE 7
		if tab_1.tabpage_7.dw_pac_mora.rowcount() > 0 then
			tab_1.tabpage_7.dw_pac_mora.Object.DataWindow.Zoom = 61
			f_Print(tab_1.tabpage_7.dw_pac_mora)
			tab_1.tabpage_7.dw_pac_mora.Object.DataWindow.Zoom = 100
		end if

END CHOOSE
end event

type dw_pac_detalle from datawindow within w_envio_archivo_pac
boolean visible = false
integer x = 754
integer y = 2152
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_grabar_pac_detalle"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_envio_archivo_pac_mant from datawindow within w_envio_archivo_pac
boolean visible = false
integer x = 2967
integer y = 2496
integer width = 1056
integer height = 388
string title = "none"
string dataobject = "dwe_enviar_archivo_pac_mant"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cuenta_corriente from commandbutton within w_envio_archivo_pac
integer x = 37
integer y = 1888
integer width = 443
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;CHOOSE CASE tab_1.SelectedTab
	CASE 1
		if il_row>0 then
			gs_base 			= tab_1.tabpage_1.dw_lista_envio_archivo_pac.GetItemString(il_row, "sol_pac_base")
			gs_serie 			= tab_1.tabpage_1.dw_lista_envio_archivo_pac.GetItemString(il_row, "sol_pac_serie")
			gi_numero 		= tab_1.tabpage_1.dw_lista_envio_archivo_pac.GetItemNumber(il_row, "sol_pac_numero")
		
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
					CASE "A"
						if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
						Open(w_cuenta_corriente_aumento_capacidad)
					CASE "F"
						if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
						open(w_cuenta_corriente_funeraria) 
				END CHOOSE
			end if
		end if
		
	CASE 2
		if il_row_rec>0 then
			gs_base 			= tab_1.tabpage_2.dw_cargar.GetItemString(il_row_rec, "base")
			gs_serie 			= tab_1.tabpage_2.dw_cargar.GetItemString(il_row_rec, "serie")
			gi_numero 		= tab_1.tabpage_2.dw_cargar.GetItemNumber(il_row_rec, "numero")
		
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
					CASE "A"
						if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
						Open(w_cuenta_corriente_aumento_capacidad)
					CASE "F"
						if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
						open(w_cuenta_corriente_funeraria) 
				END CHOOSE
			end if
		end if
	
	CASE 3
		if il_row_no>0 then
			gs_base 			= tab_1.tabpage_4.dw_no_aplicar.GetItemString(il_row_no, "base")
			gs_serie 			= tab_1.tabpage_4.dw_no_aplicar.GetItemString(il_row_no, "serie")
			gi_numero 		= tab_1.tabpage_4.dw_no_aplicar.GetItemNumber(il_row_no, "numero")
		
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
					CASE "A"
						if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
						Open(w_cuenta_corriente_aumento_capacidad)
					CASE "F"
						if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
						open(w_cuenta_corriente_funeraria) 
				END CHOOSE
			end if
		end if
		
	CASE 5
		messagebox("Advertencia","No es Posible Consultar Cuenta Corriente")
		
	CASE 6
		if il_row_env>0 then
			gs_base 			= tab_1.tabpage_6.dw_lista_pagos_enviados.GetItemString(il_row_env, "sol_pac_recupera_base")
			gs_serie 			= tab_1.tabpage_6.dw_lista_pagos_enviados.GetItemString(il_row_env, "sol_pac_recupera_serie")
			gi_numero 		= tab_1.tabpage_6.dw_lista_pagos_enviados.GetItemNumber(il_row_env, "sol_pac_recupera_numero")
		
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
					CASE "A"
						if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
						Open(w_cuenta_corriente_aumento_capacidad)
					CASE "F"
						if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
						open(w_cuenta_corriente_funeraria) 
				END CHOOSE
			end if
		end if
		
	CASE 7
		if tab_1.tabpage_7.dw_pac_mora.getrow() > 0 then
			gs_base 			= tab_1.tabpage_7.dw_pac_mora.GetItemString(tab_1.tabpage_7.dw_pac_mora.getrow(), "sol_pac_base")
			gs_serie 			= tab_1.tabpage_7.dw_pac_mora.GetItemString(tab_1.tabpage_7.dw_pac_mora.getrow(), "sol_pac_serie")
			gi_numero 		= tab_1.tabpage_7.dw_pac_mora.GetItemNumber(tab_1.tabpage_7.dw_pac_mora.getrow(), "sol_pac_numero")
		
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
					CASE "A"
						if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
						Open(w_cuenta_corriente_aumento_capacidad)
					CASE "F"
						if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
						open(w_cuenta_corriente_funeraria) 
				END CHOOSE
			end if
		end if
END CHOOSE
end event

type cb_limpiar from commandbutton within w_envio_archivo_pac
integer x = 2025
integer y = 1896
integer width = 311
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;date		ld_fecha,ld_fecha_proc
CHOOSE CASE tab_1.SelectedTab
	CASE 1
		tab_1.tabpage_1.dw_lista_envio_archivo_pac.reset()
		dw_envio_archivo_pac_cred.reset()
		dw_envio_archivo_pac_mant.reset()
		dw_pac_detalle.reset()
		tab_1.tabpage_1.em_fec_ini.text 			= string(gdt_fec_sistema,'dd/mm/yyyy')
		ld_fecha											= date(gdt_fec_sistema)
		ld_fecha_proc									= RelativeDate(ld_fecha, 7)
		tab_1.tabpage_1.em_fec_fin.text			= string(ld_fecha_proc,'dd/mm/yyyy')
	CASE 2
		tab_1.tabpage_2.dw_cargar.reset()
		dw_recupera_pac.reset()
		tab_1.tabpage_2.dw_recupera_archivo.reset()
		tab_1.tabpage_2.em_fec_ini_rec.text 	= string(gdt_fec_sistema,'dd/mm/yyyy')
		ld_fecha											= date(gdt_fec_sistema)
		ld_fecha_proc									= RelativeDate(ld_fecha, 7)
		tab_1.tabpage_2.em_fec_fin_rec.text		= string(ld_fecha_proc,'dd/mm/yyyy')
		tab_1.tabpage_2.cb_grabar.enabled		= false
		
	CASE 3
		tab_1.tabpage_4.dw_no_aplicar.reset()
		tab_1.tabpage_4.em_fec_ini_no.text 		= string(gdt_fec_sistema,'dd/mm/yyyy')
		ld_fecha											= date(gdt_fec_sistema)
		ld_fecha_proc									= RelativeDate(ld_fecha, 7)
		tab_1.tabpage_4.em_fec_fin_hasta.text	= string(ld_fecha_proc,'dd/mm/yyyy')
		
	CASE 4
		tab_1.tabpage_3.dw_errores.SETfilter('')
		tab_1.tabpage_3.dw_errores.filter()
		tab_1.tabpage_3.dw_errores.retrieve()
		
	CASE 5
		tab_1.tabpage_5.dw_lista_universo.retrieve()
		
	CASE 6
		tab_1.tabpage_6.dw_lista_pagos_enviados.reset()
		tab_1.tabpage_6.em_fec_ini_env.text 	= string(gdt_fec_sistema,'dd/mm/yyyy')
		tab_1.tabpage_6.em_fec_fin_env.text		= string(gdt_fec_sistema,'dd/mm/yyyy')
		
END CHOOSE

end event

type cb_cerrar from commandbutton within w_envio_archivo_pac
integer x = 3639
integer y = 1888
integer width = 329
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_envio_archivo_pac)
end event

type dw_envio_archivo_pac_cred from datawindow within w_envio_archivo_pac
boolean visible = false
integer x = 631
integer y = 2496
integer width = 1102
integer height = 392
string title = "none"
string dataobject = "dwe_enviar_archivo_pac_cred"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_envio_archivo_pac
integer x = 1669
integer y = 1848
integer width = 695
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

