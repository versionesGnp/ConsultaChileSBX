forward
global type w_cargar_boletas_elec_wp from window
end type
type cb_ctacte from commandbutton within w_cargar_boletas_elec_wp
end type
type cbx_marcar from checkbox within w_cargar_boletas_elec_wp
end type
type cb_exportar from commandbutton within w_cargar_boletas_elec_wp
end type
type cb_2 from commandbutton within w_cargar_boletas_elec_wp
end type
type cb_3 from commandbutton within w_cargar_boletas_elec_wp
end type
type cb_4 from commandbutton within w_cargar_boletas_elec_wp
end type
type st_titulo from statictext within w_cargar_boletas_elec_wp
end type
type cb_actualizar from commandbutton within w_cargar_boletas_elec_wp
end type
type dw_lista from datawindow within w_cargar_boletas_elec_wp
end type
type sle_1 from uo_convierte_numero within w_cargar_boletas_elec_wp
end type
type dw_boleta from datawindow within w_cargar_boletas_elec_wp
end type
type cb_cerrar from commandbutton within w_cargar_boletas_elec_wp
end type
type gb_2 from groupbox within w_cargar_boletas_elec_wp
end type
end forward

global type w_cargar_boletas_elec_wp from window
integer width = 4160
integer height = 1912
boolean titlebar = true
string title = "Actualizar Web Pagos Boleta Electronica"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_ctacte cb_ctacte
cbx_marcar cbx_marcar
cb_exportar cb_exportar
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
st_titulo st_titulo
cb_actualizar cb_actualizar
dw_lista dw_lista
sle_1 sle_1
dw_boleta dw_boleta
cb_cerrar cb_cerrar
gb_2 gb_2
end type
global w_cargar_boletas_elec_wp w_cargar_boletas_elec_wp

type variables
string	il_pasa
long	il_graba,il_monto_cuota,il_monto_interes,il_gasto_cob,il_monto_seguro_4,il_monto_seguro_6,il_row
end variables

forward prototypes
public subroutine wf_actualiza_pagos_wp_be (string as_base, string as_serie, double al_numero, string as_tipo_mov, long al_cuotas, long al_tot_pagado)
public subroutine wf_cargar_boleta_electronica_wp (double adb_uf, long al_fila, string as_tipo_mov)
public function date wf_fecha_deposito (datetime id_fecha_crea, long il_hora)
public subroutine wf_actualizar_web_pagos (string as_base, string as_serie, double al_numero, long al_grupo, long al_indi, long al_descuento)
end prototypes

public subroutine wf_actualiza_pagos_wp_be (string as_base, string as_serie, double al_numero, string as_tipo_mov, long al_cuotas, long al_tot_pagado);if as_base = 'O' then	
	if as_tipo_mov = 'E' then
		UPDATE	"OFERTA_V"
		SET 		"CTA_PAG_S" = :al_cuotas,   
					"TOT_PAGADO" = :al_tot_pagado
		WHERE  	("OFERTA_V"."SERIE" =: as_serie ) AND  
					("OFERTA_V"."NRO_OFERTA" = :al_numero )
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			commit;
		else
			rollback;
		end if
	end if
	if as_tipo_mov='F' then
  		UPDATE	"OFERTA_V"  
		SET 		"CTA_PAG_M" = :al_cuotas,   
					"TOT_PAGADO_M" = :al_tot_pagado  
		WHERE  	( "OFERTA_V"."SERIE" = :as_serie ) AND  
				 	( "OFERTA_V"."NRO_OFERTA" = :al_numero )
		USING	sqlca;
		if sqlca.sqlcode = 0 then
        		commit;
		else
			rollback;
		end if
	end if
elseif as_base='L' then
	UPDATE	"ANEXO_LIBERADOR"  
	SET 		"TOT_PAGADO" = :al_tot_pagado,   
				"CTA_PAG_M" = :al_cuotas
	WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
			 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
	USING	sqlca;
	if sqlca.sqlcode = 0 then	
		commit;
	else
		rollback;
	end if	
elseif as_base='F' then
	UPDATE	"PRODUCTO_ANEXO"  
	SET 		"TOTAL_PAGADO" = :al_tot_pagado,   
				"CUOTAS_PAG" = :al_cuotas
	WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :as_serie ) AND  
			 ( "PRODUCTO_ANEXO"."NUMERO" = :al_numero )
	USING	sqlca;
	if sqlca.sqlcode = 0 then	
		commit;
	else
		rollback;
	end if	
elseif as_base='P' then
	UPDATE	"PAGARE"  
	SET 		"TOT_PAGADO" = :al_tot_pagado,   
			  	"CTA_PAG_LA" = :al_cuotas  
	WHERE  	( "PAGARE"."SERIE_P" = :as_serie ) AND  
				( "PAGARE"."NRO_PAGARE" = :al_numero )
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		commit;
	else
		rollback;
	end if	
elseif as_base='R' then
	UPDATE	"REPACTA_MANTENCION"  
	SET 		"CTAS_PAGADAS" = :al_cuotas,   
				"TOTAL_PAGADO" = :al_tot_pagado  
	WHERE  ( "REPACTA_MANTENCION"."BASE" = :as_base ) AND  
			  ( "REPACTA_MANTENCION"."SERIE" = :as_serie ) AND  
			  ( "REPACTA_MANTENCION"."NUMERO" = :al_numero )
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		commit;
	else
		rollback;
	end if	
elseif as_base='D' then
	UPDATE	"DERECHO"  
	SET 		"TOT_PAGADO" = :al_tot_pagado,   
				 "CTA_PAG_LA" = :al_cuotas  
	WHERE  ( "DERECHO"."SERIE_P" = :as_serie ) AND  
			 ( "DERECHO"."NRO_PAGARE" = :al_numero )
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		commit;
	else
		rollback;
	end if	
elseif as_base='A' then
	UPDATE	"ANEXO_AUMENTO"  
	SET 		"CTA_PAG_M" = :al_cuotas,   
				"TOT_PAGADO" = :al_tot_pagado  
	WHERE  	( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
				( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		commit;
	else
		rollback;
	end if			
elseif as_base='C' then
	UPDATE	"CONTRATO"  
	SET 		"CTA_PAG_M" = :al_cuotas  
	WHERE ( "CONTRATO"."SERIE_C" = :as_serie ) AND  
			( "CONTRATO"."NRO_CONTRATO" = :al_numero )
	USING sqlca;
	if sqlca.sqlcode = 0 then
		commit;
	else
		rollback;
	end if
end if

end subroutine

public subroutine wf_cargar_boleta_electronica_wp (double adb_uf, long al_fila, string as_tipo_mov);Long		ll_new_reg,ll_cod_parque,ll_tot_reg,ll_indi,ll_cantidad,ll_monto,ll_total,ll_res,ll_can_cta_cred,ll_tot_filas,ll_reg,ll_ctas_pag,ll_mora,ll_gasto_cob,ll_corre,&
			ls_sum_monto,ll_count_reg,ll_min_boleta,ll_grupo,ll_otros,ll_cod_seguro,ll_total_neto,ll_pos,ll_cero=0,ll_sumar_todo,ll_sum_dscto,&
			ll_total_iva,ll_suma_total,ll_sub_total,ll_rut_rez,ll_cupon,ll_con_paga,ll_vuelto,ll_efectivo,ll_mora_mant,ll_gasto_mant,ll_monto_cuota,ll_monto_interes,&
			ll_ctas_pag_c,ll_ctas_pag_m,ll_ctas_pag_la,ll_ctas_pag_isa,ll_plazo,ll_count_pend,ll_cant_folio_p= 1000,ll_count_seguro,ll_monto_seguro_4,ll_monto_seguro_6,&
			ll_monto_cuota_aux,ll_neto,ll_exento,ll_iva,ll_monto_descuento
String		ls_string_boleta,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_nro,ls_depto,ls_block,ls_comuna,ls_ciudad,ls_tipo_dte,ls_nom_comp,&
			ls_direc_comp,ls_indica_serv,ls_direc_origen,ls_comuna_origen,ls_ciudad_origen,ls_rut,ls_celular,ls_fono_part,ls_email,ls_contacto,ls_tot_pag_pal,&
			ls_tipo_cob,ls_tipo_cob_otro,ls_descrip_cobro,ls_descrip_otro,ls_nombre_archivo,ls_obs_1,ls_rut_empresa,ls_monto_desc,ls_tipo_codigo,ls_cod_pago,&
			ls_cuota,ls_moneda_ctto,ls_base_rezago,ls_serie_rezago,ls_nombre_rez,ls_ap_pat_rez,ls_ap_mat_rez,ls_ciudad_rez,ls_comuna_rez,ls_direc_rez,&
			ls_nom_comp_rez,ls_nom_rez,ls_ruta_elect,ls_dv_rez,ls_tip_cob,ls_moneda,ls_con_paga,ls_vuelto,ls_efectivo,ls_forma_pago,ls_tipo_mov,as_cuota,as_cuota_mant,&
			as_doc,as_paga_con,ls_tipo_mov_aux,ls_fecha_pago_palabra,ls_nro_contrato,ls_paga_con,ls_proximo_pago,ls_monto_total_palabra,ls_pago_ef,ls_pago_ch,ls_pago_tc,&
			ls_pago_td
Double	ldb_prima,ldb_iva_factura,ll_monto_uf,ldb_prima_uf,ll_numero_rezago,ll_monto_cta,ll_monto_cta_m,ll_uf_seguro_4,ll_uf_seguro_6,ld_mora_uf,lbd_tot_cob
Datetime	ldt_fec_venc_cred,ldt_fec_venc_mant, ldt_fecha_pago
SaveAsType TipoArchivo

SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
dw_boleta.reset()
ls_indica_serv		= '3'
gs_caja				= 'WP'//as_caja
//ldt_fecha_pago		= datetime(date(st_fecha_pago.text),time('00:00:00'))
setnull(ll_count_seguro)

ls_tipo_mov			= as_tipo_mov
gs_base				= dw_lista.getitemstring(al_fila,'base')
gs_serie				= dw_lista.getitemstring(al_fila,'serie')
gi_numero			= dw_lista.getitemnumber(al_fila,'numero')
gi_rut					= dw_lista.getitemnumber(al_fila,'cadena_rut')

as_doc				= gs_base + gs_serie + string(gi_numero)
ldt_fecha_pago		= dw_lista.getitemdatetime(al_fila,'fecha_pago')

SELECT	"CADENA"."COD_PARQUE",	"CADENA_MORA"."FECHA_VENC_CRED",		"CADENA_MORA"."FECHA_VENC_MANT"
INTO 		:ll_cod_parque,					:ldt_fec_venc_cred,								:ldt_fec_venc_mant
FROM 	"CADENA",	"CADENA_MORA"  
WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
		  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
		  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
		  (("CADENA"."CODIGO" = :gs_base ) AND  
		  ( "CADENA"."SERIE" = :gs_serie ) AND  
		  ( "CADENA"."NUMERO" = :gi_numero ) )  
USING	sqlca;

//if (ls_tipo_mov='E' or ls_tipo_mov='J' or ls_tipo_mov='G' or ls_tipo_mov='1' or ls_tipo_mov='2' or ls_tipo_mov='3' or ls_tipo_mov='4' or ls_tipo_mov='5' or ls_tipo_mov='6' or ls_tipo_mov='7' or ls_tipo_mov='8' or ls_tipo_mov='9') and (gs_base='O' or (gs_base='P' and ll_cod_parque <> 101)) then
//if ls_tipo_mov='E'  and (gs_base='O' or (gs_base='P' and ll_cod_parque <> 101)) then
if ( ls_tipo_mov='E'  and gs_base='O' ) then
	ls_tip_cob			= 'CI'
elseif ( ls_tipo_mov='E' and gs_base='P' and ll_cod_parque <> 101) then
	ls_tip_cob			= 'CI'
else
	ls_tip_cob			= 'BE'
end if	
ll_cupon				= dw_lista.getitemnumber(al_fila,'numero_cupon')
//
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
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)+' de '+string(ll_plazo)
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
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)+' de '+string(ll_plazo)
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
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)+' de '+string(ll_plazo)
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
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)+' de '+string(ll_plazo)
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
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)+' de '+string(ll_plazo)
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
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)+' de '+string(ll_plazo)
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
		ls_obs_1			= 'Cuota N° '+string(ll_ctas_pag_m)+' de '+string(ll_plazo)
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
	
	SELECT	MIN("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
	INTO		:ll_min_boleta
	FROM 	"ELECTRONICA_FB",   
				"ELECTRONICA_FB_DETALLE"  
	WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
			  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
			  ( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
			  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND 
			  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
			  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
			  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' );
	
	UPDATE		"ELECTRONICA_FB_DETALLE"  
	SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
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
				  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :ll_min_boleta )
	USING		sqlca;
	//								  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) AND  
	if sqlca.sqlcode=0 then
		commit;					
//		if gs_rezago <> 'S' then
//			SELECT	min("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO")
//			INTO 		:ll_min_boleta
//			FROM 	"ELECTRONICA_FB",   
//						"ELECTRONICA_FB_DETALLE"  
//			WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
//					  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
//					  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
//					  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND 
//					  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
//					  ( "ELECTRONICA_FB_DETALLE"."FECHA_PAGO" = :ldt_fecha_pago ) AND   
//					  ( "ELECTRONICA_FB_DETALLE"."RUT" = :gi_rut) AND
//					  ( "ELECTRONICA_FB_DETALLE"."DV" = :ls_dv) AND
//					  ( "ELECTRONICA_FB_DETALLE"."NOMBRE_CLIENTE" = :ls_nom_comp) AND
//					  ( "ELECTRONICA_FB_DETALLE"."USUARIO_CREA" = :gs_user) AND
//					  ( "ELECTRONICA_FB_DETALLE"."BASE"  = :gs_base) AND
//					  ( "ELECTRONICA_FB_DETALLE"."SERIE" = :gs_serie) AND
//					  ( "ELECTRONICA_FB_DETALLE"."NUMERO" = :gi_numero) AND
//					  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip) AND
//					  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
//					  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) );
//		else
//			SELECT	min("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO")
//			INTO 		:ll_min_boleta
//			FROM 	"ELECTRONICA_FB",   
//						"ELECTRONICA_FB_DETALLE"  
//			WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
//					  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
//					  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
//					  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND 
//					  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
//					  ( "ELECTRONICA_FB_DETALLE"."FECHA_PAGO" = :ldt_fecha_pago ) AND   
//					  ( "ELECTRONICA_FB_DETALLE"."RUT" = :gi_rut) AND
//					  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip) AND
//					  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
//					  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) );
//		end if
		gl_folio						= ll_min_boleta
	else
		rollback;
		messagebox("Error Grabar BOLETA","Error al Grabar BOLETA - Folio NO Disponible para "+ls_tip_cob+" SQL: "+sqlca.sqlerrtext)
	end if
else
	messagebox("Advertencia","No Existe Folio para esta Empresa "+ls_rut_empresa)
end if
//
SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
INTO 		:ls_rut_empresa
FROM 	"MEMBRETE_EMPRESA"  
WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;

ls_tipo_dte		= '41'

SELECT  "WEB_SERVIPAG"."MONTO_TOTAL",   	"WEB_SERVIPAG"."INTERES",   	"WEB_SERVIPAG"."COBRANZA_EXTERNA" ,		"WEB_SERVIPAG"."MONTO_DESCUENTO"
INTO     	:ll_monto_cuota,								:ll_monto_interes,						:ll_gasto_cob,											:ll_monto_descuento
FROM    	"WEB_SERVIPAG"  
WHERE  	( substr("WEB_SERVIPAG"."NUMERO_CLIENTE",1,1) = :gs_base ) AND  
			( substr("WEB_SERVIPAG"."NUMERO_CLIENTE",2,1) = :gs_serie ) AND  
			( to_number(substr("WEB_SERVIPAG"."NUMERO_CLIENTE",3)) = :gi_numero ) AND  
			( "WEB_SERVIPAG"."NUMERO_DOCUMENTO" = :ll_cupon )
USING	sqlca;

il_monto_cuota		= ll_monto_cuota
il_monto_interes	= ll_monto_interes
il_gasto_cob			= ll_gasto_cob
if isnull(ll_monto_descuento) then ll_monto_descuento=0

if ll_monto_cuota >0 then
	il_pasa			= 'S'
	if ls_tipo_mov = 'E' then 
		SELECT	count("SEGURO_ASOCIADOS"."COD_SEGURO")
		INTO		:ll_count_seguro
		FROM 	"SEGURO_ASOCIADOS"  
		WHERE ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
				  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
				  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND
				  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
		USING	sqlca;
		if ll_count_seguro > 0 then
			DECLARE x1 CURSOR FOR  
			SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO",   
						"SEGURO_ASOCIADOS"."MONTO_PRIMA",
						"SEGURO_ASOCIADOS"."MONEDA"
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
					fetch x1 into :ll_cod_seguro, :ldb_prima, :ls_moneda_ctto;
					if not isnull(ll_cod_seguro) and ll_cod_seguro>0  then
						if ls_moneda_ctto = '1' then
							if ll_cod_seguro = 4 then
								ll_monto_seguro_4	= ldb_prima
								ll_uf_seguro_4			= round(ldb_prima / adb_uf,4)
							elseif ll_cod_seguro = 6 then
								ll_monto_seguro_6	= ldb_prima
								ll_uf_seguro_6			= round(ldb_prima / adb_uf,4)
							end if			
						elseif ls_moneda_ctto = '2' then
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
	end if	
	if isnull(ll_monto_seguro_4) then ll_monto_seguro_4=0
	if isnull(ll_monto_seguro_6) then ll_monto_seguro_6=0
	il_monto_seguro_4		= ll_monto_seguro_4
	il_monto_seguro_6		= ll_monto_seguro_6
	
	ll_monto_cuota 			= ll_monto_cuota - (ll_monto_interes + ll_gasto_cob +ll_monto_seguro_4 +ll_monto_seguro_6)
	lbd_tot_cob					= round(ll_monto_cuota + ll_monto_interes +ll_gasto_cob + ll_monto_seguro_4 + ll_monto_seguro_6,0) - ll_monto_descuento
//	il_monto_cuota				= ll_monto_cuota
//	il_monto_interes			= ll_monto_interes
//	il_gasto_cob					= ll_gasto_cob



	ls_fecha_pago_palabra		= f_retorna_fecha_palabra(date(ldt_fecha_pago))
	ls_nro_contrato					= gs_base+gs_serie+string(gi_numero)
	ls_paga_con						= string(lbd_tot_cob)
	ls_vuelto							= ''
	ls_proximo_pago				= f_retorna_prox_pago_mant( gs_base, gs_serie, gi_numero, 1,'F' )
	ls_monto_total_palabra		= sle_1.uo_convertir_numero(string(lbd_tot_cob))
	ls_pago_ef						= string(lbd_tot_cob)
	ls_pago_ch						= ''
	ls_pago_tc						= ''
	ls_pago_td						= ''
	ll_neto							= 0
	ll_exento							= lbd_tot_cob
	ll_iva								= 0
	ll_total							= lbd_tot_cob
	if ls_tip_cob = 'BE' then
		INSERT INTO "INGRESO_NEWSING_CABECERA"  
					( "TIPO_COB",		"FOLIO",		"FECHA_PAGO",	"FECHA_PAGO_PALABRA",	"COD_PARQUE", 	"NRO_CONTRATO", 	"UF_DIA", 	"COD_CAJA", 	"USUARIO", 		"PAGA_CON",	"VUELTO",	"PROXIMO_PAGO",   "MONTO_TOTAL_PALABRA",		"PAGO_EF", 	"PAGO_CH", 	"PAGO_TC", 	"PAGO_TD",		"RUT_CLIENTE",	"REZAGO",		"NETO",		"EXENTO",		"IVA",		"TOTAL",		"IP_PC",		"IP_PRINT",			"CONEXION",	"COD_PARQUE_CTTO") 
		VALUES 	( :ls_tip_cob, 		:gl_folio, 	:ldt_fecha_pago,	:ls_fecha_pago_palabra, 	:ll_cod_parque, 	:ls_nro_contrato, 		:adb_uf,		:gs_caja, 		:gs_user, 		:ls_paga_con,	:ls_vuelto,	:ls_proximo_pago, 	:ls_monto_total_palabra, 		:ls_pago_ef,	:ls_pago_ch,	:ls_pago_tc,		:ls_pago_td,		:gi_rut,				:gs_rezago,		:ll_neto,		:ll_exento,		:ll_iva,	:ll_total,		:gs_tcp_ip,	:gs_tcp_ip_print,	:gs_empresa,	:ll_cod_parque)  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Tabla INGRESO_NEWSING_CABECERA SQL: "+sqlca.sqlerrtext)
		end if
	end if

	UPDATE		"ELECTRONICA_FB_DETALLE"  
	SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
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
	WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo ) AND  
				 ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tip_cob ) AND  
				 ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip ) AND
				 ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
				 ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) AND
				 ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) 
	USING		sqlca;
	if sqlca.sqlcode = 0 then
		commit;
	else
		rollback;
	end if	
else
	Messagebox('Error','Sin Monto Cuota en tabla WEB SERVIPAG para cupon Nº'+string(ll_cupon,'###,###,###,###'))
	il_pasa = 'N'
end if	
end subroutine

public function date wf_fecha_deposito (datetime id_fecha_crea, long il_hora);string	ls_dia,ls_fecha
date	ld_fecha_proc,ld_fecha_deposito
Long	ll_count

ls_dia													= UPPER(DayName(date(id_fecha_crea)))
CHOOSE CASE ls_dia
	CASE 'SABADO','SATURDAY'
		ld_fecha_deposito							= RelativeDate(date(id_fecha_crea), 2)
	CASE 'DOMINGO','SUNDAY'
		ld_fecha_deposito							= RelativeDate(date(id_fecha_crea), 1)
	CASE ELSE
		if il_hora >= 14 then
			ld_fecha_deposito						= RelativeDate(date(id_fecha_crea),1)
		else
			ld_fecha_deposito						= date(id_fecha_crea)
		end if		
END CHOOSE
ls_fecha												= mid(string(ld_fecha_deposito,'ddmmyyyy'),1,4)
SELECT 	Count("PER_DIAS_FESTIVOS"."DESCRIPCION")
INTO 		:ll_count
FROM 	"PER_DIAS_FESTIVOS"  
WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_fecha   ;
if ll_count > 0 then
	ld_fecha_deposito								= 	RelativeDate(date(ld_fecha_deposito),1)
	ls_fecha											= mid(string(ld_fecha_deposito,'ddmmyyyy'),1,4)
	SELECT 	Count("PER_DIAS_FESTIVOS"."DESCRIPCION")
	INTO 		:ll_count
	FROM 	"PER_DIAS_FESTIVOS"  
	WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_fecha   ;
	if ll_count > 0 then
		ld_fecha_deposito							= 	RelativeDate(date(ld_fecha_deposito),1)
	ls_fecha											= mid(string(ld_fecha_deposito,'ddmmyyyy'),1,4)
		SELECT 	Count("PER_DIAS_FESTIVOS"."DESCRIPCION")
		INTO 		:ll_count
		FROM 	"PER_DIAS_FESTIVOS"  
		WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_fecha   ;
		if ll_count > 0 then
			ld_fecha_deposito						= 	RelativeDate(date(ld_fecha_deposito),1)
			ls_fecha									= mid(string(ld_fecha_deposito,'ddmmyyyy'),1,4)
			SELECT 	Count("PER_DIAS_FESTIVOS"."DESCRIPCION")
			INTO 		:ll_count
			FROM 	"PER_DIAS_FESTIVOS"  
			WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_fecha   ;
			if ll_count > 0 then
				ld_fecha_deposito					= 	RelativeDate(date(ld_fecha_deposito),1)
			end if
		end if
	end if
end if
return ld_fecha_deposito
end function

public subroutine wf_actualizar_web_pagos (string as_base, string as_serie, double al_numero, long al_grupo, long al_indi, long al_descuento);string		ls_tipo_mov,ls_base,ls_serie,ls_moneda_ctto,ls_forma_pag,ls_tip_cob,ls_rezago_sap,ls_moneda_sap,ls_cod_otro
long		ll_ctas_pag_cred,ll_ctas_pag_mant,ll_tot_pagado_cred,ll_tot_pagado_mant,ll_rut,ll_monto_cuota,ll_monto_interes,ll_monto_cobranza,ll_numero_cupon,ll_ctas_pag_s,&
			ll_ctas_pag_m,ll_tot_pagado_s,ll_tot_pagado_m,ll_cod_parque,ll_numero,ll_count_seguro,ll_cod_seguro,ldb_prima,ll_hora,ll_minuto,ll_cuotas_pag,ll_ctas_pag_s_sap,&
			ll_monto_desc,ll_ctas_pagadas_cupon
double	ldb_uf_dia,ll_monto_seguro_4,ll_monto_seguro_6,ll_monto_cuota_tot,ldb_monto_sap,ldb_uf_calc,ll_monto_interes_uf,ll_monto_cobranza_uf,ll_monto_seg_4_uf,ll_monto_seguro_6_uf
datetime	ldt_fecha_pago,ldt_fecha_crea,ld_fecha_deposito_def
date		ld_fecha_deposito
time		lt_hora

ll_ctas_pag_cred 				= 0
ll_ctas_pag_mant 				= 0
ll_tot_pagado_cred 			= 0
ll_tot_pagado_mant 			= 0
gs_rezago						= ' '
ll_numero_cupon				= dw_lista.getitemnumber(al_indi,'numero_cupon')
ldt_fecha_pago					= datetime(date(dw_lista.getitemdatetime(al_indi,'fecha_pago')),time('00:00:00'))
gs_base							= as_base
gs_serie							= as_serie
gi_numero						= al_numero
ls_forma_pag					= 'EF'

SELECT  "CUPONERAS_DETALLE"."TIPO_MOV",	"CUPONERAS_DETALLE"."RUT" , 	1 
INTO    	:ls_tipo_mov,									:ll_rut,									:ll_ctas_pagadas_cupon
FROM     "CUPONERAS_DETALLE"  
WHERE   "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon
USING	sqlca;
if sqlca.sqlcode <> 0 then
	SELECT 	"CUPONERAS_DETALLE_WEB"."RUT",  	"CUPONERAS_DETALLE_WEB"."TIPO_MOV" ,	"CUPONERAS_DETALLE_WEB"."NRO_CUOTA"
	INTO 		:ls_tipo_mov,									:ls_tipo_mov  ,											:ll_ctas_pagadas_cupon
	FROM 	"CUPONERAS_DETALLE_WEB"  
	WHERE 	"CUPONERAS_DETALLE_WEB"."NRO_CUPON" = :ll_numero_cupon   ;

end if

SELECT 	"CADENA_MORA"."COD_PARQUE"  
INTO 		:ll_cod_parque  
FROM 	"CADENA_MORA"  
WHERE 	( "CADENA_MORA"."BASE" = :as_base ) AND  
			( "CADENA_MORA"."SERIE" = :as_serie ) AND  
			( "CADENA_MORA"."NUMERO" = :al_numero );

//if ls_tipo_mov='E' and (gs_base='O' or (gs_base='P' and ll_cod_parque <> 101)) then
if ( ls_tipo_mov='E'  and gs_base='O' ) then
	ls_tip_cob			= 'CI'
elseif ( ls_tipo_mov='E' and gs_base='P' and ll_cod_parque <> 101) then
	ls_tip_cob			= 'CI'
else
	ls_tip_cob			= 'BE'
end if	

SELECT   "TAB_UF"."VALOR_UF"
INTO     	:ldb_uf_dia
FROM     "TAB_UF"
WHERE   "TAB_UF"."FECHA_UF" = :ldt_fecha_pago ;

wf_cargar_boleta_electronica_wp(ldb_uf_dia,al_indi,ls_tipo_mov)

 //-- obtener hora y minuto pago inicio

ldt_fecha_crea					= dw_lista.getitemdatetime(al_indi,'fecha_crea')

lt_hora							= (time(ldt_fecha_crea))
ll_hora							= long(Hour(lt_hora))
ll_minuto							= long(Minute(lt_hora))

if ll_hora >= 14 then
	ld_fecha_deposito_def	= datetime(RelativeDate(date(ldt_fecha_crea),1),time('00:00:00'))
else
	ld_fecha_deposito_def	= datetime(date(ldt_fecha_crea),time('00:00:00'))
end if		
ll_hora							= 0
ld_fecha_deposito				= wf_fecha_deposito(ld_fecha_deposito_def,ll_hora)

 //-- obtener hora y minuto pago fin

ll_monto_cuota					= il_monto_cuota
ll_monto_interes				= il_monto_interes
ll_monto_cobranza			= il_gasto_cob
							
ll_monto_seguro_4			= il_monto_seguro_4
ll_monto_seguro_6			= il_monto_seguro_6

if isnull(ll_monto_seguro_4) then ll_monto_seguro_4=0
if isnull(ll_monto_seguro_6) then ll_monto_seguro_6=0

if il_pasa = 'S' then
	
	if ls_tipo_mov<>'F' and ls_tipo_mov<>'E' and ls_tipo_mov<>'K' and ls_tipo_mov<>'U' then 
		ll_cuotas_pag			= 0
	else
		ll_cuotas_pag			= 1
	end if
	
	if isnull(ll_monto_interes) then ll_monto_interes=0
	if isnull(ll_monto_cobranza) then ll_monto_cobranza=0
	if isnull(ll_monto_seguro_4) then ll_monto_seguro_4=0
	if isnull(ll_monto_seguro_6) then ll_monto_seguro_6=0
	if ll_monto_cuota > 0 then
		ll_monto_cuota_tot	= ll_monto_cuota
		ll_monto_cuota			= ll_monto_cuota_tot - (ll_monto_interes + ll_monto_cobranza + ll_monto_seguro_4 + ll_monto_seguro_6)
//		ll_monto_cuota			= ll_monto_cuota - (ll_monto_interes + ll_monto_cobranza)

//-- calculo de montos sap 
		ls_rezago_sap				= f_retorna_rezago_sap(gs_rezago,as_base,as_serie,al_numero,ls_tipo_mov)
		if isnull(ls_rezago_sap) or ls_rezago_sap='' or len(ls_rezago_sap)=0 then ls_rezago_sap = gs_rezago
		
		ll_ctas_pag_s_sap			= f_retorna_ctas_pag_sap(as_base,as_serie,al_numero,ls_tipo_mov,ls_rezago_sap)
		if isnull(ll_ctas_pag_s_sap) or ll_ctas_pag_s_sap=0 then ll_ctas_pag_s_sap = 0
		ll_ctas_pag_s_sap 		= ll_ctas_pag_s_sap + ll_cuotas_pag
		
		ldb_monto_sap				= f_retornar_monto_sap(as_base, as_serie, al_numero, gs_rezago, ls_tip_cob, gl_folio, ldt_fecha_pago, ls_tipo_mov, ll_monto_cuota, ldb_uf_dia, '0', 1)
		if isnull(ldb_monto_sap) then ldb_monto_sap=0
		
		ls_moneda_sap				= f_retornar_moneda_sap(as_base, as_serie, al_numero, gs_rezago, ls_tip_cob, gl_folio, ldt_fecha_pago, ls_tipo_mov,ll_monto_cuota,ldb_uf_dia, '0')
		if isnull(ls_moneda_sap) then ls_moneda_sap='2'
//-- fin culculo de montos sap

		if ls_moneda_sap = '2' then
			ldb_uf_calc			= round(ll_monto_cuota / ldb_monto_sap,2)
		else
			ldb_uf_calc			= ldb_uf_dia
		end if
		ldb_uf_dia				= ldb_uf_calc
		INSERT INTO "INGRESO"
					 ( "FOLIO",	 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", 	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )
		VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	:ls_tipo_mov,	:ll_monto_cuota,	1,						:as_serie,	:al_numero,		'WP',	  		    ' ',				:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	   	 null,			  null,				  	null,					 	 null,					    null,			 null,				null,		 		:ldt_fecha_pago,	'0',					    'N',				  		null, 										:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap ) ;
		if sqlca.sqlcode=0 then
			commit;
			
			INSERT INTO "INGRE"
						 ( "FOLIO",	 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", 	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E" , 	"COD_PARQUE")
			VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	:ls_tipo_mov,	:ll_monto_cuota,	1,						:as_serie,	:al_numero,		'WP',	  		    ' ',				:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	   	 null,			  null,				  	null,					 	 null,					    null,			 null,				:ldt_fecha_pago,	'0',					    'N', 					:ll_cod_parque) ;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			if al_descuento > 0 then
				ll_monto_desc 		= al_descuento * -1
				if ls_tipo_mov = 'E' then
					ls_cod_otro 		= '147'
				elseif ls_tipo_mov = 'F' then
					ls_cod_otro 		= '148'
				else
					ls_cod_otro 		= '0'
				end if
				INSERT INTO "INGRESO"
							 ( "FOLIO",	 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", 	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )
				VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	'S',				:ll_monto_desc,	0,						:as_serie,	:al_numero,		'WP',	  		    ' ',				:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	   	 null,			  null,				  	null,					 	 null,					    null,			 null,				null,		 		:ldt_fecha_pago,	:ls_cod_otro,		'N',				  	null, 										:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_desc,	'1') ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				
				INSERT INTO "INGRE"
							 ( "FOLIO",	 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", 	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E" , 	"COD_PARQUE")
				VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	'S',				:ll_monto_desc,	0,						:as_serie,	:al_numero,		'WP',	  		    ' ',				:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	   	 null,			  null,				  	null,					 	 null,					    null,			 null,				:ldt_fecha_pago,	:ls_cod_otro,		'N', 					:ll_cod_parque) ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			end if
				
			if ls_tip_cob='BE' then
				INSERT INTO "INGRESO_NEWSING"
							 ( "FOLIO",	 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", 	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )
				VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	:ls_tipo_mov,	:ll_monto_cuota,	1,						:as_serie,	:al_numero,		'WP',	  		    ' ',				:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	   	 null,			  null,				  	null,					 	 null,					    null,			 null,				null,		 		:ldt_fecha_pago,	'0',					    'N',				  		null, 										:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap ) ;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				if al_descuento > 0 then
					ll_monto_desc 		= al_descuento * -1
					if ls_tipo_mov = 'E' then
						ls_cod_otro 		= '147'
					elseif ls_tipo_mov = 'F' then
						ls_cod_otro 		= '148'
					else
						ls_cod_otro 		= '0'
					end if
					INSERT INTO "INGRESO_NEWSING"
								 ( "FOLIO",	 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", 	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP" )
					VALUES 	 ( :gl_folio,	:ls_tip_cob,		:ldt_fecha_pago,	'S',				:ll_monto_desc,	0,						:as_serie,	:al_numero,		'WP',	  		    ' ',				:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	   	 null,			  null,				  	null,					 	 null,					    null,			 null,				null,		 		:ldt_fecha_pago,	:ls_cod_otro,		'N',				  	null, 										:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_desc,	'1' ) ;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
			end if
			if ls_tipo_mov = 'E' then
				 if ll_monto_interes > 0 then
					if ls_moneda_sap = '2' then
						ll_monto_interes_uf	= ll_monto_interes / ldb_uf_dia
					else
						ll_monto_interes_uf	= ll_monto_interes
					end if
					
					INSERT INTO "INGRESO"  
									 ( "FOLIO",		 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",  			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",	"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",			"MONEDA_SAP"  )
					VALUES 	  	 ( :gl_folio, 		:ls_tip_cob,		:ldt_fecha_pago,	'G',  				:ll_monto_interes,	0,			  			:as_serie,	:al_numero,		'WP',	      		' ',				:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    	null,			  	null,				 	 null,					  	null,					    null,			  null,				  null,			  	:ldt_fecha_pago,	'0',				 		'N',				 	null, 										:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_interes_uf,	:ls_moneda_sap  ) ;
					if sqlca.sqlcode=0 then
						 commit;
					 else
						 rollback;
					 end if
					 
					 INSERT INTO "INGRE"  
									 ( "FOLIO",		 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",  			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",	"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E" , 	"COD_PARQUE")
					VALUES 	  	 ( :gl_folio, 		:ls_tip_cob,		:ldt_fecha_pago,	'G',  				:ll_monto_interes,	0,			  			:as_serie,	:al_numero,		'WP',	      		' ',				:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    	null,			  	null,				 	 null,					  	null,					    null,			  null,				:ldt_fecha_pago,	'0',				 		'N',				 	:ll_cod_parque ) ;
					if sqlca.sqlcode=0 then
						 commit;
					 else
						 rollback;
					 end if
					 
					 if ls_tip_cob = 'BE' then
						INSERT INTO "INGRESO_NEWSING"  
										 ( "FOLIO",		 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",  			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",	"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",			"MONEDA_SAP"  )
						VALUES 	  	 ( :gl_folio, 		:ls_tip_cob,		:ldt_fecha_pago,	'G',  				:ll_monto_interes,	0,			  			:as_serie,	:al_numero,		'WP',	      		' ',				:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    	null,			  	null,				 	 null,					  	null,					    null,			  null,				  null,			  	:ldt_fecha_pago,	'0',				 		'N',				 	null, 										:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_interes_uf,	:ls_moneda_sap  ) ;
						if sqlca.sqlcode=0 then
							 commit;
						 else
							 rollback;
						 end if
					end if
				 end if
				if ll_monto_cobranza > 0 then
					if ls_moneda_sap = '2' then
						ll_monto_cobranza_uf	= ll_monto_cobranza / ldb_uf_dia
					else
						ll_monto_cobranza_uf	= ll_monto_cobranza
					end if
					INSERT INTO "INGRESO"  
									 ( "FOLIO",		 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", 	"BASE",		"RUT",	"USUARIO",		"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG", 		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",				"MONEDA_SAP"   )
					VALUES 	  	( :gl_folio, 		:ls_tip_cob,	 	:ldt_fecha_pago,	'J',	       			:ll_monto_cobranza,	0,			 			:as_serie,	:al_numero,			'WP',	     		 ' ',			:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    		null,			 	null,				 	null,					  	null,					    null,			  	null,				 null,				:ldt_fecha_pago,	'0',				 	  	'N',				 	 null ,  									:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_cobranza_uf,	:ls_moneda_sap  );
					if sqlca.sqlcode=0 then
						 commit;
					 else
						 rollback;
					end if;
					
					INSERT INTO "INGRE"  
									 ( "FOLIO",		 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", 	"BASE",		"RUT",	"USUARIO",		"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"SERVIPAG", 		"CODIGO_OTRO",	"TRASPASO_E",	"COD_PARQUE"  )
					VALUES 	  	( :gl_folio, 		:ls_tip_cob,	 	:ldt_fecha_pago,	'J',	       			:ll_monto_cobranza,	0,			 			:as_serie,	:al_numero,			'WP',	     		 ' ',			:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    		null,			 	null,				 	null,					  	null,					    null,			  	null,				 :ldt_fecha_pago,	'0',				 	  	'N',				 	 :ll_cod_parque);
					if sqlca.sqlcode=0 then
						 commit;
					 else
						 rollback;
					end if;
					
					if ls_tip_cob = 'BE' then
						INSERT INTO "INGRESO_NEWSING"  
										 ( "FOLIO",		 "TIPO_COB", 	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", 	"BASE",		"RUT",	"USUARIO",		"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG", 		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",				"MONEDA_SAP"   )
						VALUES 	  	( :gl_folio, 		:ls_tip_cob,	 	:ldt_fecha_pago,	'J',	       			:ll_monto_cobranza,	0,			 			:as_serie,	:al_numero,			'WP',	     		 ' ',			:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    		null,			 	null,				 	null,					  	null,					    null,			  	null,				 null,				:ldt_fecha_pago,	'0',				 	  	'N',				 	 null ,  									:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_cobranza_uf,	:ls_moneda_sap  );
						if sqlca.sqlcode=0 then
							 commit;
						 else
							 rollback;
						end if;
					end if
				end if;
				if ll_monto_seguro_4 > 0 then
					if ls_moneda_sap = '2' then
						ll_monto_seg_4_uf	= ll_monto_seguro_4 / ldb_uf_dia
					else
						ll_monto_seg_4_uf	= ll_monto_seguro_4
					end if
					INSERT INTO "INGRESO"  
									 ( "FOLIO",	"TIPO_COB", "FECHA_PAGO",	  	"TIPO_MOV",	"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",		"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG", 		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",			"MONEDA_SAP"   )
					VALUES 	  	( :gl_folio,	:ls_tip_cob,	 :ldt_fecha_pago,		'4',	       			:ll_monto_seguro_4,	0,			  			:as_serie,	:al_numero,		'WP',	     		 ' ',			:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    		null,			  	null,				  	null,					  	null,					   	null,			  	null,				null,				:ldt_fecha_pago,	'0',				 	   	'N',				 	 null ,  									:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_seg_4_uf,	:ls_moneda_sap  );
					if sqlca.sqlcode=0 then
						 commit;
					 else
						 rollback;
					end if;
					
					INSERT INTO "INGRE"  
									 ( "FOLIO",	"TIPO_COB", "FECHA_PAGO",	  	"TIPO_MOV",	"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",		"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"SERVIPAG", 		"CODIGO_OTRO",	"TRASPASO_E",	"COD_PARQUE"  )
					VALUES 	  	( :gl_folio,	:ls_tip_cob,	 :ldt_fecha_pago,		'4',	       			:ll_monto_seguro_4,	0,			  			:as_serie,	:al_numero,		'WP',	     		 ' ',			:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    		null,			  	null,				  	null,					  	null,					   	null,			  	null,				:ldt_fecha_pago,	'0',				 	   	'N',				 	 :ll_cod_parque );
					if sqlca.sqlcode=0 then
						 commit;
					 else
						 rollback;
					end if;
					
					if ls_tip_cob = 'BE' then
						INSERT INTO "INGRESO_NEWSING"  
										 ( "FOLIO",	"TIPO_COB", "FECHA_PAGO",	  	"TIPO_MOV",	"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",		"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG", 		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",			"MONEDA_SAP"   )
						VALUES 	  	( :gl_folio,	:ls_tip_cob,	 :ldt_fecha_pago,		'4',	       			:ll_monto_seguro_4,	0,			  			:as_serie,	:al_numero,		'WP',	     		 ' ',			:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    		null,			  	null,				  	null,					  	null,					   	null,			  	null,				null,				:ldt_fecha_pago,	'0',				 	   	'N',				 	 null ,  									:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_seg_4_uf,	:ls_moneda_sap  );
						if sqlca.sqlcode=0 then
							 commit;
						 else
							 rollback;
						end if;
					end if
				end if;
				if ll_monto_seguro_6 > 0 then
					if ls_moneda_sap = '2' then
						ll_monto_seguro_6_uf	= ll_monto_seguro_6 / ldb_uf_dia
					else
						ll_monto_seguro_6_uf	= ll_monto_seguro_6
					end if
					INSERT INTO "INGRESO"  
									 ( "FOLIO",			 "TIPO_COB", "FECHA_PAGO",	  "TIPO_MOV",		"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",		"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG", 		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",				"MONEDA_SAP"   )
					VALUES 	  	( :gl_folio, 			:ls_tip_cob,	 :ldt_fecha_pago,		'6',	       			:ll_monto_seguro_6,	0,			  			:as_serie,	:al_numero,			'WP',	     		 ' ',			:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    		null,			  null,				 	 null,					  	null,					   	null,			  	null,				  null,				:ldt_fecha_pago,	'0',				 	  	'N',				 	 null ,  									:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_seguro_6_uf,	:ls_moneda_sap   );
					if sqlca.sqlcode=0 then
						 commit;
					 else
						 rollback;
					end if;
					
					INSERT INTO "INGRE"  
									 ( "FOLIO",			 "TIPO_COB", "FECHA_PAGO",	  "TIPO_MOV",		"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",		"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"SERVIPAG", 		"CODIGO_OTRO",	"TRASPASO_E",	"COD_PARQUE"  )
					VALUES 	  	( :gl_folio, 			:ls_tip_cob,	 :ldt_fecha_pago,		'6',	       			:ll_monto_seguro_6,	0,			  			:as_serie,	:al_numero,			'WP',	     		 ' ',			:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    		null,			  null,				 	 null,					  	null,					   	null,			  	null,				 :ldt_fecha_pago,	'0',				 	  	'N',				 	 :ll_cod_parque  );
					if sqlca.sqlcode=0 then
						 commit;
					 else
						 rollback;
					end if;
					
					if ls_tip_cob = 'BE' then
						INSERT INTO "INGRESO_NEWSING"  
										 ( "FOLIO",			 "TIPO_COB", "FECHA_PAGO",	  "TIPO_MOV",		"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",		"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",		"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG", 		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" , 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",				"MONEDA_SAP"   )
						VALUES 	  	( :gl_folio, 			:ls_tip_cob,	 :ldt_fecha_pago,		'6',	       			:ll_monto_seguro_6,	0,			  			:as_serie,	:al_numero,			'WP',	     		 ' ',			:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    		null,			  null,				 	 null,					  	null,					   	null,			  	null,				  null,				:ldt_fecha_pago,	'0',				 	  	'N',				 	 null ,  									:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_seguro_6_uf,	:ls_moneda_sap   );
						if sqlca.sqlcode=0 then
							 commit;
						 else
							 rollback;
						end if;
					end if
				end if;
			elseif ls_tipo_mov = 'F' then
				if ll_monto_interes > 0 then
					if ls_moneda_sap = '2' then
						ll_monto_interes_uf	= ll_monto_interes / ldb_uf_dia
					else
						ll_monto_interes_uf	= ll_monto_interes
					end if
					INSERT INTO "INGRESO"  
									 ( "FOLIO",		 "TIPO_COB", 	"FECHA_PAGO",	  	"TIPO_MOV",	"MONTO",  			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",	"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",		"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO", 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",			"MONEDA_SAP"   )
					VALUES 	  	 ( :gl_folio, 		:ls_tip_cob,		:ldt_fecha_pago,		'P',  				:ll_monto_interes,	0,			  			:as_serie,	:al_numero,		'WP',	      		' ',				:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    	null,			 	null,				  	null,					 	null,					    null,			  	null,				  	null,			  	:ldt_fecha_pago,	'0',				 		'N',				 	 null ,  									:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_interes_uf,	:ls_moneda_sap   );
					if sqlca.sqlcode=0 then
						 commit;
					 else
						 rollback;
					 end if
					 
					 INSERT INTO "INGRE"  
									 ( "FOLIO",		 "TIPO_COB", 	"FECHA_PAGO",	  	"TIPO_MOV",	"MONTO",  			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",	"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E", 	"COD_PARQUE" )
					VALUES 	  	 ( :gl_folio, 		:ls_tip_cob,		:ldt_fecha_pago,		'P',  				:ll_monto_interes,	0,			  			:as_serie,	:al_numero,		'WP',	      		' ',				:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    	null,			 	null,				  	null,					 	null,					    null,			  	null,			  	:ldt_fecha_pago,	'0',				 		'N',				 	:ll_cod_parque );
					if sqlca.sqlcode=0 then
						 commit;
					 else
						 rollback;
					 end if
					 
					 if ls_tip_cob = 'BE' then
						INSERT INTO "INGRESO_NEWSING"  
										 ( "FOLIO",		 "TIPO_COB", 	"FECHA_PAGO",	  	"TIPO_MOV",	"MONTO",  			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",	"COD_AGE",		"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",		"FECHA_ANT",		"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO", 	"COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",			"MONEDA_SAP"   )
						VALUES 	  	 ( :gl_folio, 		:ls_tip_cob,		:ldt_fecha_pago,		'P',  				:ll_monto_interes,	0,			  			:as_serie,	:al_numero,		'WP',	      		' ',				:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    	null,			 	null,				  	null,					 	null,					    null,			  	null,				  	null,			  	:ldt_fecha_pago,	'0',				 		'N',				 	 null ,  									:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_interes_uf,	:ls_moneda_sap   );
						if sqlca.sqlcode=0 then
							 commit;
						 else
							 rollback;
						 end if
					end if
				 end if
				 if ll_monto_cobranza > 0 then
					if ls_moneda_sap = '2' then
						ll_monto_cobranza_uf	= ll_monto_cobranza / ldb_uf_dia
					else
						ll_monto_cobranza_uf	= ll_monto_cobranza
					end if
					INSERT INTO "INGRESO"  
									 ( "FOLIO",		"TIPO_COB", "FECHA_PAGO",	  	"TIPO_MOV",	"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG", 		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO", "COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",				"MONEDA_SAP"   )
					VALUES 	  	( :gl_folio, 		:ls_tip_cob,	 :ldt_fecha_pago,		'R',	       		:ll_monto_cobranza,	0,			  			:as_serie,	:al_numero,		'WP',	     		 ' ',			:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    	null,			  null,				  	null,					  	null,					    null,			 null,				  null,				:ldt_fecha_pago,	'0',				 	   	'N',				 	 null ,  								:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_cobranza_uf,	:ls_moneda_sap    );
					if sqlca.sqlcode=0 then
						 commit;
					 else
						 rollback;
					end if;
					
					INSERT INTO "INGRE"  
									 ( "FOLIO",		"TIPO_COB", "FECHA_PAGO",	  	"TIPO_MOV",	"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	  "SERVIPAG", 		"CODIGO_OTRO",	"TRASPASO_E", "COD_PARQUE" )
					VALUES 	  	( :gl_folio, 		:ls_tip_cob,	 :ldt_fecha_pago,		'R',	       		:ll_monto_cobranza,	0,			  			:as_serie,	:al_numero,		'WP',	     		 ' ',			:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    	null,			  null,				  	null,					  	null,					    null,			 null,				  :ldt_fecha_pago,	'0',				 	   	'N',				 :ll_cod_parque );
					if sqlca.sqlcode=0 then
						 commit;
					 else
						 rollback;
					end if;
					
					if ls_tip_cob = 'BE' then
						INSERT INTO "INGRESO_NEWSING"  
										 ( "FOLIO",		"TIPO_COB", "FECHA_PAGO",	  	"TIPO_MOV",	"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST", "BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG", 		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO", "COD_PARQUE", 	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",				"MONEDA_SAP"   )
						VALUES 	  	( :gl_folio, 		:ls_tip_cob,	 :ldt_fecha_pago,		'R',	       		:ll_monto_cobranza,	0,			  			:as_serie,	:al_numero,		'WP',	     		 ' ',			:ldb_uf_dia,		'A',				:as_base,	:ll_rut,	'WSP',	    	null,			  null,				  	null,					  	null,					    null,			 null,				  null,				:ldt_fecha_pago,	'0',				 	   	'N',				 	 null ,  								:ll_cod_parque, 	:ld_fecha_deposito,	:ls_rezago_sap,	0,							:ll_monto_cobranza_uf,	:ls_moneda_sap    );
						if sqlca.sqlcode=0 then
							 commit;
						 else
							 rollback;
						end if;
					end if
				end if;	 
			end if
//			if ls_forma_pag = 'CH' then
//				INSERT INTO "DOCUMENTOS"  
//								( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  "FECHA_VENC", 	"COD_PAGO","ESTADO_CH" ,	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", "COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX")  
//				VALUES 	 	( :gl_folio, 		'BE',	:		ldb_nro_cheque,	:ll_banco , 	:lbd_tot_cob, 	:ld_fecha_pago,	:ls_forma_pag,'C' , 1 , 	' ' , :ld_fecha_pago     , 										'XY',						0,										0,									'0',									0,										0,										'0',											0 ,							null	,						1,										:ll_hora,	:ll_minuto,					null,				'BE')
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					commit;
//				else
//					rollback;
//				end if
//			else
				if al_descuento > 0 then
					ll_monto_cuota_tot = ll_monto_cuota_tot - al_descuento
				end if
				INSERT INTO "DOCUMENTOS"  
								( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  			"FECHA_VENC", 	"COD_PAGO",		"ESTADO_CH" ,	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", 	"COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX", "FECHA_DEPOSITO",	"MONTO_UF" )  
				VALUES 	 	( :gl_folio, 	:ls_tip_cob,		999,				999 , 					:ll_monto_cuota_tot, 	:ldt_fecha_pago,	:ls_forma_pag,		'C' , 				999 , 					' ' , 			:ldt_fecha_pago, 	'WP',				0,										0,									'0',											0,										0,									'0',											0 ,								null	,					1,												:ll_hora,			:ll_minuto,			null,							:ls_tip_cob, 			:ld_fecha_deposito,	:ll_monto_cuota_tot)  //	:ll_hora,	:ll_minuto,					null,	
				USING		sqlca;
				if sqlca.sqlcode = 0 then
					commit;
				else
					rollback;
				end if
				
				INSERT INTO "DOC_COB"  
								( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  			"FECHA_VENC", 	"COD_PAGO",		"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", 	"COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX" )  
				VALUES 	 	( :gl_folio, 	:ls_tip_cob,		999,				999 , 					:ll_monto_cuota_tot, 	:ldt_fecha_pago,	:ls_forma_pag,		999 , 					' ' , 			:ldt_fecha_pago, 	'WP',				0,										0,									'0',											0,										0,									'0',											0 ,								1,												:ll_hora,			:ll_minuto,			null,							:ls_tip_cob)  //	:ll_hora,	:ll_minuto,					null,	
				USING		sqlca;
				if sqlca.sqlcode = 0 then
					commit;
				else
					rollback;
				end if
				
				if ls_tip_cob = 'BE' then
					INSERT INTO "DOCUMENTOS_NEWSING"  
									( "FOLIO"  , "TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,  			"FECHA_VENC", 	"COD_PAGO",		"ESTADO_CH" ,	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", 	"COD_CAJA",	"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX", "FECHA_DEPOSITO",	"MONTO_UF" )  
					VALUES 	 	( :gl_folio, 	:ls_tip_cob,		999,				999 , 					:ll_monto_cuota_tot, 	:ldt_fecha_pago,	:ls_forma_pag,		'C' , 				999 , 					' ' , 			:ldt_fecha_pago, 	'WP',				0,										0,									'0',											0,										0,									'0',											0 ,								null	,					1,												:ll_hora,			:ll_minuto,			null,							:ls_tip_cob, 			:ld_fecha_deposito,	:ll_monto_cuota_tot)  //	:ll_hora,	:ll_minuto,					null,	
					USING		sqlca;
					if sqlca.sqlcode = 0 then
						commit;
					else
						rollback;
					end if
				end if
//			end if	
			if as_base = 'O' then
				SELECT	"OFERTA_V"."CTA_PAG_S",	"OFERTA_V"."CTA_PAG_M",	"OFERTA_V"."TOT_PAGADO",	"OFERTA_V"."TOT_PAGADO_M",  "CADENA"."COD_PARQUE"  
				INTO 		:ll_ctas_pag_s, 			    :ll_ctas_pag_m,			    :ll_tot_pagado_s, 			    :ll_tot_pagado_m,            :ll_cod_parque  
				FROM 		"OFERTA_V",	"CADENA",	"PAGO_OFERTA"  
				WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
						 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
						 (("CADENA"."CODIGO" = :as_base ) AND  
						 ( "CADENA"."SERIE" = :as_serie ) AND  
						 ( "CADENA"."NUMERO" = :al_numero ) )  ;
				if ll_cod_parque > 0 then
					if ls_tipo_mov = 'E' then
					  if isnull(ll_ctas_pag_s) then
						  ll_ctas_pag_s = 0
					  end if
					  if isnull(ll_tot_pagado_s) then
						  ll_tot_pagado_s = 0
					  end if
						ll_ctas_pag_cred 		= ll_ctas_pag_s + 1
						ll_tot_pagado_cred	= ll_tot_pagado_s + ll_monto_cuota
						if al_descuento > 0 then
							ll_tot_pagado_cred	= ll_tot_pagado_cred - al_descuento
						end if
						WF_ACTUALIZA_PAGOS_WP_BE(as_base, as_serie, al_numero, ls_tipo_mov, ll_ctas_pag_cred, ll_tot_pagado_cred)
					elseif ls_tipo_mov = 'F' then
					  if isnull(ll_ctas_pag_m) then
						  ll_ctas_pag_m = 0
					  end if
					  if isnull(ll_tot_pagado_m) then
						  ll_tot_pagado_m = 0
					  end if
						ll_ctas_pag_mant 		= ll_ctas_pag_m + 1
						ll_tot_pagado_mant	= ll_tot_pagado_m + ll_monto_cuota
						if al_descuento > 0 then
							ll_tot_pagado_mant	= ll_tot_pagado_mant - al_descuento
						end if
						WF_ACTUALIZA_PAGOS_WP_BE(as_base, as_serie, al_numero, ls_tipo_mov, ll_ctas_pag_mant, ll_tot_pagado_mant)
					end if
				end if				
			elseif as_base = 'L' then
				SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",	"ANEXO_LIBERADOR"."CTA_PAG_M",  "CADENA"."COD_PARQUE"  
				INTO 		:ll_tot_pagado_s,						    :ll_ctas_pag_s,                  :ll_cod_parque
				FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
				WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
						 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
						 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
						 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
						 (("CADENA"."CODIGO" = :as_base ) AND  
						 ( "CADENA"."SERIE" = :as_serie ) AND  
						 ( "CADENA"."NUMERO" = :al_numero ) )  ;
				if ll_cod_parque > 0 then
					if isnull(ll_ctas_pag_s) then
						 ll_ctas_pag_s = 0
					 end if
					 if isnull(ll_tot_pagado_s) then
						 ll_tot_pagado_s = 0
					 end if
					 ll_ctas_pag_cred 		= ll_ctas_pag_s + 1
					 ll_tot_pagado_cred 	= ll_tot_pagado_s + ll_monto_cuota
					 if ls_tipo_mov='E' then
						if al_descuento > 0 then
							ll_tot_pagado_cred	= ll_tot_pagado_cred - al_descuento
						end if
						WF_ACTUALIZA_PAGOS_WP_BE(as_base, as_serie, al_numero, ls_tipo_mov, ll_ctas_pag_cred, ll_tot_pagado_cred)
					 end if
				end if		
				
				
			elseif as_base = 'F' then
				SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",	"PRODUCTO_ANEXO"."CUOTAS_PAG",  	"CADENA"."COD_PARQUE"  
				INTO 		:ll_tot_pagado_s,						    			:ll_ctas_pag_s,                  					:ll_cod_parque
				FROM 	"PRODUCTO_ANEXO",	"CADENA",	"PRODUCTO_PAGO"  
				WHERE  ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
						 ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
						 ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
						 ( "PRODUCTO_ANEXO"."SERIE" = "CADENA"."SERIE" ) and  
						 ( "PRODUCTO_ANEXO"."NUMERO" = "CADENA"."NUMERO" ) and  
						 (("CADENA"."CODIGO" = :as_base ) AND  
						 ( "CADENA"."SERIE" = :as_serie ) AND  
						 ( "CADENA"."NUMERO" = :al_numero ) )  ;
				if ll_cod_parque > 0 then
					if isnull(ll_ctas_pag_s) then
						 ll_ctas_pag_s = 0
					 end if
					 if isnull(ll_tot_pagado_s) then
						 ll_tot_pagado_s = 0
					 end if
					 ll_ctas_pag_cred 		= ll_ctas_pag_s + 1
					 ll_tot_pagado_cred 	= ll_tot_pagado_s + ll_monto_cuota
					 if ls_tipo_mov='E' then
						if al_descuento > 0 then
							ll_tot_pagado_cred	= ll_tot_pagado_cred - al_descuento
						end if
						WF_ACTUALIZA_PAGOS_WP_BE(as_base, as_serie, al_numero, ls_tipo_mov, ll_ctas_pag_cred, ll_tot_pagado_cred)
					 end if
				end if		
				
				
			elseif as_base = 'P' then
				SELECT	"PAGARE"."TOT_PAGADO",	"PAGARE"."CTA_PAG_LA",  "CADENA"."COD_PARQUE"  
				INTO 		:ll_tot_pagado_s,			  :ll_ctas_pag_s,          :ll_cod_parque  
				FROM		"CADENA",	"PAGARE"  
				WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
						 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
						 (("CADENA"."CODIGO" = :as_base ) AND  
						 ( "CADENA"."SERIE" = :as_serie ) AND  
						 ( "CADENA"."NUMERO" = :al_numero ) )  ;
				if ll_cod_parque > 0 then
					if isnull(ll_ctas_pag_s) then
						 ll_ctas_pag_s = 0
					 end if
					 if isnull(ll_tot_pagado_s) then
						 ll_tot_pagado_s = 0
					 end if
					 ll_ctas_pag_cred 		= ll_ctas_pag_s + 1
					 ll_tot_pagado_cred	= ll_tot_pagado_s + ll_monto_cuota
					 if ls_tipo_mov='E' then
						if al_descuento > 0 then
							ll_tot_pagado_cred	= ll_tot_pagado_cred - al_descuento
						end if
						WF_ACTUALIZA_PAGOS_WP_BE(as_base, as_serie, al_numero, ls_tipo_mov, ll_ctas_pag_cred, ll_tot_pagado_cred)
					 end if
				end if				
			elseif as_base = 'R' then
				SELECT	"REPACTA_MANTENCION"."CTAS_PAGADAS",	"REPACTA_MANTENCION"."TOTAL_PAGADO",  "CADENA"."COD_PARQUE"  
				INTO 		:ll_ctas_pag_s,								        :ll_tot_pagado_s,                      :ll_cod_parque
				FROM 		"CADENA",	"REPACTA_MANTENCION"  
				WHERE  ( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
						 ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
						 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
						 (("CADENA"."CODIGO" = :as_base ) AND  
						 ( "CADENA"."SERIE" = :as_serie ) AND  
						 ( "CADENA"."NUMERO" = :al_numero ) ) ;
				if ll_cod_parque > 0 then
					if isnull(ll_ctas_pag_s) then
						 ll_ctas_pag_s = 0
					 end if
					 if isnull(ll_tot_pagado_s) then
						 ll_tot_pagado_s = 0
					 end if
					 ll_ctas_pag_cred 		= ll_ctas_pag_s + 1
					 ll_tot_pagado_cred	= ll_tot_pagado_s + ll_monto_cuota
					 if ls_tipo_mov='E' then
						if al_descuento > 0 then
							ll_tot_pagado_cred	= ll_tot_pagado_cred - al_descuento
						end if
						WF_ACTUALIZA_PAGOS_WP_BE(as_base, as_serie, al_numero, ls_tipo_mov, ll_ctas_pag_cred, ll_tot_pagado_cred)
					 end if
				end if	
			elseif as_base = 'D' then
				SELECT	"DERECHO"."TOT_PAGADO",	"DERECHO"."CTA_PAG_LA",  "CADENA"."COD_PARQUE"  
				INTO 		:ll_tot_pagado_s,			  :ll_ctas_pag_s,           :ll_cod_parque
				FROM 		"CADENA",	"DERECHO"  
				WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
						 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
						 (("CADENA"."CODIGO" = :as_base ) AND  
						 ( "CADENA"."SERIE" = :as_serie ) AND  
						 ( "CADENA"."NUMERO" = :al_numero ) )  ;
				if ll_cod_parque > 0 then
					if isnull(ll_ctas_pag_s) then
						 ll_ctas_pag_s = 0
					 end if
					 if isnull(ll_tot_pagado_s) then
						 ll_tot_pagado_s = 0
					 end if
					 ll_ctas_pag_cred 		= ll_ctas_pag_s + 1
					 ll_tot_pagado_cred	= ll_tot_pagado_s + ll_monto_cuota
					 if ls_tipo_mov='E' then
						if al_descuento > 0 then
							ll_tot_pagado_cred	= ll_tot_pagado_cred - al_descuento
						end if
						WF_ACTUALIZA_PAGOS_WP_BE(as_base, as_serie, al_numero, ls_tipo_mov, ll_ctas_pag_cred, ll_tot_pagado_cred)
					 end if
				end if
			elseif as_base = 'A' then	
				SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",	"ANEXO_AUMENTO"."CTA_PAG_M",  "CADENA"."COD_PARQUE"  
				INTO 		:ll_tot_pagado_s,					    :ll_ctas_pag_s,                :ll_cod_parque
				FROM 	"ANEXO_AUMENTO",	"CADENA",	"PAGO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
						 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
						 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
						 (("CADENA"."CODIGO" = :as_base ) AND  
						 ( "CADENA"."SERIE" = :as_serie ) AND  
						 ( "CADENA"."NUMERO" = :al_numero ) )  
				USING	sqlca;
				if ll_cod_parque > 0 then
					if isnull(ll_ctas_pag_s) then
						 ll_ctas_pag_s = 0
					 end if
					 if isnull(ll_tot_pagado_s) then
						 ll_tot_pagado_s = 0
					 end if
					 ll_ctas_pag_cred 		= ll_ctas_pag_s + 1
					 ll_tot_pagado_cred	= ll_tot_pagado_s + ll_monto_cuota
					 if ls_tipo_mov='E' then
						if al_descuento > 0 then
							ll_tot_pagado_cred	= ll_tot_pagado_cred - al_descuento
						end if
						WF_ACTUALIZA_PAGOS_WP_BE(as_base, as_serie, al_numero, ls_tipo_mov, ll_ctas_pag_cred, ll_tot_pagado_cred)
					 end if
				end if
			elseif as_base = 'C' then	
				SELECT	"CONTRATO"."CTA_PAG_M",  "CADENA"."COD_PARQUE"  
				INTO 		:ll_ctas_pag_m,           :ll_cod_parque
				FROM 	"CADENA",	"CONTRATO"  
				WHERE ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
						  ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
						  (("CADENA"."CODIGO" = :as_base ) AND  
						  ( "CADENA"."SERIE" = :as_serie ) AND  
						  ( "CADENA"."NUMERO" = :al_numero ) ) 
				USING	sqlca;
				if ll_cod_parque > 0 then
					if isnull(ll_ctas_pag_m) then
						 ll_ctas_pag_m = 0
					 end if
					 ll_ctas_pag_mant = ll_ctas_pag_m + 1
					 if ls_tipo_mov='F' then
						if al_descuento > 0 then
							ll_ctas_pag_mant	= ll_ctas_pag_mant - al_descuento
						end if
						WF_ACTUALIZA_PAGOS_WP_BE(as_base, as_serie, al_numero, ls_tipo_mov, ll_ctas_pag_mant, 0)
					 end if
				end if
			end if						

			UPDATE  "WEB_PAGOS"  
			SET      	"ACTUALIZA_INGRESO" = 'S'  
			WHERE  	( "WEB_PAGOS"."BASE" = :as_base ) AND  
						( "WEB_PAGOS"."SERIE" = :as_serie ) AND  
						( "WEB_PAGOS"."NUMERO" = :al_numero ) AND  
						( "WEB_PAGOS"."NUMERO_CUPON" = :ll_numero_cupon ) AND  
						( "WEB_PAGOS"."GRUPO" = :al_grupo ) AND 
						( "WEB_PAGOS"."ESTADO_PAGO" = 'P' ) AND  
						( "WEB_PAGOS"."ACTUALIZA_INGRESO" = 'N' )
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		//	DECLARE sp_proc_cadena_mora_wp_be PROCEDURE FOR SP_NUEVO_CADENA_MORA(as_base, as_serie, al_numero, 'M');
		//	EXECUTE sp_proc_cadena_mora_wp_be;
			DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:as_base,:as_serie,:al_numero,'M');
			EXECUTE sp_nuevo_cadena_mora;
			
			
			UPDATE	"CUPONERAS_DETALLE"  
			SET 		"ESTADO_PAGO_CUPON" = 'C',
						"TIPO_COB_PAGO" = :ls_tip_cob,   
						"FOLIO_PAGO" = :gl_folio,   
						"FECHA_PAGO" = :ldt_fecha_pago,
						"MONTO_CUOTA_PESO" = :ll_monto_cuota,
						"MONTO_INTERES_MORA" = :ll_monto_interes,
						"MONTO_GASTO_COBRANZA" = :ll_monto_cobranza
			WHERE 	"CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
				il_graba		= il_graba + 1
			//	Messagebox('Aviso','Carga Existosa')
			else
				rollback;
			end if
			
			UPDATE	"CUPONERAS_DETALLE_WEB"  
			SET 		"ESTADO_PAGO_CUPON" = 'C',
						"TIPO_COB_PAGO" = :ls_tip_cob,   
						"FOLIO_PAGO" = :gl_folio,   
						"FECHA_PAGO" = :ldt_fecha_pago,
						"MONTO_CUOTA_PESO" = :ll_monto_cuota,
						"MONTO_INTERES_MORA" = :ll_monto_interes,
						"MONTO_GASTO_COBRANZA" = :ll_monto_cobranza
			WHERE 	"CUPONERAS_DETALLE_WEB"."NRO_CUPON" = :ll_numero_cupon
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			//	il_graba		= il_graba + 1
			//	Messagebox('Aviso','Carga Existosa')
			else
				rollback;
			end if
		else
			rollback;
		end if
 	end if
elseif il_pasa = 'N' then
	
end if

//SELECT  "WEB_SERVIPAG"."MONTO_TOTAL",   
//			"WEB_SERVIPAG"."INTERES",   
//			"WEB_SERVIPAG"."COBRANZA_EXTERNA"  
//INTO     	:ll_monto_cuota,:ll_monto_interes,:ll_monto_cobranza
//FROM    	"WEB_SERVIPAG"  
//WHERE  	( substr("WEB_SERVIPAG"."NUMERO_CLIENTE",1,1) = :as_base ) AND  
//			( substr("WEB_SERVIPAG"."NUMERO_CLIENTE",2,1) = :as_serie ) AND  
//			( to_number(substr("WEB_SERVIPAG"."NUMERO_CLIENTE",3)) = :al_numero ) AND  
//			( "WEB_SERVIPAG"."NUMERO_DOCUMENTO" = :ll_numero_cupon )
//USING	sqlca;
///*                  ( "WEB_SERVIPAG"."RUT" = ll_rut ) AND  */
//
//SELECT	count("SEGURO_ASOCIADOS"."COD_SEGURO")
//INTO		:ll_count_seguro
//FROM 	"SEGURO_ASOCIADOS"  
//WHERE ( "SEGURO_ASOCIADOS"."BASE" = :as_base ) AND  
//		  ( "SEGURO_ASOCIADOS"."SERIE" = :as_serie ) AND  
//		  ( "SEGURO_ASOCIADOS"."NUMERO" = :al_numero ) AND  
//		  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
//		  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND
//		  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
//USING	sqlca;
//if ll_count_seguro > 0 then
//	DECLARE x1 CURSOR FOR  
//	SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO",   
//				"SEGURO_ASOCIADOS"."MONTO_PRIMA",
//				"SEGURO_ASOCIADOS"."MONEDA"
//	FROM 	"SEGURO_ASOCIADOS"  
//	WHERE ( "SEGURO_ASOCIADOS"."BASE" = :as_base ) AND  
//			  ( "SEGURO_ASOCIADOS"."SERIE" = :as_serie ) AND  
//			  ( "SEGURO_ASOCIADOS"."NUMERO" = :al_numero ) AND  
//			  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
//			  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND
//			  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
//	USING	sqlca;
//	open x1;
//	if sqlca.sqlcode=0 then
//		do while sqlca.sqlcode=0
//			fetch x1 into :ll_cod_seguro, :ldb_prima, :ls_moneda_ctto;
//			if not isnull(ll_cod_seguro) and ll_cod_seguro>0  then
//				if ls_moneda_ctto = '1' then
//					if ll_cod_seguro = 4 then
//						ll_monto_seguro_4	= ldb_prima
//					//	ll_uf_seguro_4			= round(ldb_prima / ldb_uf_dia,4)
//					elseif ll_cod_seguro = 6 then
//						ll_monto_seguro_6	= ldb_prima
//					//	ll_uf_seguro_6			= round(ldb_prima / ldb_uf_dia,4)
//					end if			
//				elseif ls_moneda_ctto = '2' then
//					if ll_cod_seguro = 4 then
//						ll_monto_seguro_4	= round(ldb_prima * ldb_uf_dia,4)
//					//	ll_uf_seguro_4			= ldb_prima
//					elseif ll_cod_seguro = 6 then
//						ll_monto_seguro_6	= round(ldb_prima * ldb_uf_dia,4)
//					//	ll_uf_seguro_6			= ldb_prima
//					end if
//				end if
//			end if
//			setnull(ll_cod_seguro)
//		loop
//	end if
//	close x1;
//end if	
end subroutine

on w_cargar_boletas_elec_wp.create
this.cb_ctacte=create cb_ctacte
this.cbx_marcar=create cbx_marcar
this.cb_exportar=create cb_exportar
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.st_titulo=create st_titulo
this.cb_actualizar=create cb_actualizar
this.dw_lista=create dw_lista
this.sle_1=create sle_1
this.dw_boleta=create dw_boleta
this.cb_cerrar=create cb_cerrar
this.gb_2=create gb_2
this.Control[]={this.cb_ctacte,&
this.cbx_marcar,&
this.cb_exportar,&
this.cb_2,&
this.cb_3,&
this.cb_4,&
this.st_titulo,&
this.cb_actualizar,&
this.dw_lista,&
this.sle_1,&
this.dw_boleta,&
this.cb_cerrar,&
this.gb_2}
end on

on w_cargar_boletas_elec_wp.destroy
destroy(this.cb_ctacte)
destroy(this.cbx_marcar)
destroy(this.cb_exportar)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.st_titulo)
destroy(this.cb_actualizar)
destroy(this.dw_lista)
destroy(this.sle_1)
destroy(this.dw_boleta)
destroy(this.cb_cerrar)
destroy(this.gb_2)
end on

event open;long ll_tot_reg,ll_indi

gf_centrar(w_cargar_boletas_elec_wp)

dw_lista.settransobject(sqlca)
dw_lista.retrieve()
ll_tot_reg	= dw_lista.rowcount()

if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		dw_lista.setitem(ll_indi,'c_est_reg',1)
	next
	dw_lista.accepttext()
else
	Messagebox('Aviso','No Registra Dato a Actualizar')
end if
end event

type cb_ctacte from commandbutton within w_cargar_boletas_elec_wp
integer x = 2409
integer y = 1668
integer width = 421
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;dw_lista.accepttext()
if il_row > 0 and dw_lista.rowcount()>0 then
	gs_base 									= dw_lista.GetItemString(il_row, "base")
	gs_serie 									= dw_lista.GetItemString(il_row, "serie")
	gi_numero 								= dw_lista.GetItemNumber(il_row, "numero")
	gi_rut 									= dw_lista.GetItemNumber(il_row, "cadena_rut")
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
				Open(w_cuenta_corriente_funeraria)
		END CHOOSE
	end if
end if
end event

type cbx_marcar from checkbox within w_cargar_boletas_elec_wp
integer x = 608
integer y = 1688
integer width = 539
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Marcar Todos"
end type

event clicked;long ll_tot_reg,ll_indi

ll_tot_reg	= dw_lista.rowcount()

if cbx_marcar.text = 'Marcar Todos' then
	for ll_indi=1 to ll_tot_reg
		dw_lista.setitem(ll_indi,'c_est_reg',0)
	next
	cbx_marcar.text = 'Desmarcar Todos'
	dw_lista.accepttext()
elseif cbx_marcar.text = 'Desmarcar Todos' then
	for ll_indi=1 to ll_tot_reg
		dw_lista.setitem(ll_indi,'c_est_reg',1)
	next
	cbx_marcar.text = 'Marcar Todos'
	dw_lista.accepttext()
end if

end event

type cb_exportar from commandbutton within w_cargar_boletas_elec_wp
integer x = 1275
integer y = 1676
integer width = 242
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_DWToExcel( dw_lista)
end if
end event

type cb_2 from commandbutton within w_cargar_boletas_elec_wp
integer x = 1522
integer y = 1676
integer width = 242
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type cb_3 from commandbutton within w_cargar_boletas_elec_wp
integer x = 1769
integer y = 1676
integer width = 206
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string 	ls_texto
setnull (ls_texto)
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_4 from commandbutton within w_cargar_boletas_elec_wp
integer x = 1979
integer y = 1676
integer width = 229
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false	
end if
end event

type st_titulo from statictext within w_cargar_boletas_elec_wp
integer x = 32
integer y = 32
integer width = 4059
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 32896
long backcolor = 12639424
string text = "  Actualizar WEB Pagos BE"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_actualizar from commandbutton within w_cargar_boletas_elec_wp
integer x = 32
integer y = 1668
integer width = 421
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar Pagos"
end type

event clicked;Long		ll_indi,ll_tot_reg,ll_max_corr,ll_count_reg,ll_numero_cupon,ll_monto_cuota,ll_interes,ll_gasto_cob,ll_rut,ll_ctas_pag_s,ll_ctas_pag_m,&
			ll_tot_pagado_s,ll_tot_pagado_m,ll_nro_cuota,ll_count_seg,ll_monto_seg=0,ll_cod_seguro,ll_monto,ll_cod_parque,ll_hora,ll_minuto,ll_count_pend,ll_id_grupo,&
			ll_fila,ll_cant_reg_ac,ll_cant,ll_est_reg,ll_count_pend_ci,ll_descuento
String		ls_fecha_archivo,ls_linea,ls_servipag,ls_tipo_mov,ls_serie,ls_base,ls_caja,ls_nombre_archivo,ls_moneda_seg,ls_moneda,ls_tipo_mov_seg,ls_forma_pag,&
			ls_rut_empresa,ls_filtro
Date		ld_fecha_archivo
Datetime	ld_fecha_pago
Double	ldb_uf_dia,ll_suma_seg,ldb_prima,ll_numero,ldb_nro_cheque,ldb_cta_cli_doc,ll_banco


ls_filtro 			= "c_est_reg = 0"
dw_lista.SetFilter(ls_filtro)
dw_lista.Filter( )

ll_tot_reg		= dw_lista.rowcount()
ll_cant_reg_ac 	= 0
il_graba			= 0
if ll_tot_reg > 0 then
	ll_fila 			= dw_lista.Find("c_est_reg = 0", 1, ll_tot_reg)
	if ll_fila = 0 then
		messagebox("Advertencia","Debe Seleccionar por lo Menos UN Registro para Actualizar Pago")
	else
		if gs_empresa = 'El Prado' then
			ll_cod_parque		= 1
		elseif gs_empresa = 'La Foresta' then
			ll_cod_parque		= 11
		end if
		for ll_cant = 1 to ll_tot_reg
			ll_est_reg			= dw_lista.getitemnumber(ll_cant,'c_est_reg')
			if ll_est_reg = 0 then
				ll_cant_reg_ac = ll_cant_reg_ac+1
			end if
		next
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
					( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = 'WP' )   AND
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
					( "ELECTRONICA_FB_DETALLE"."COD_CAJA" =  'WP' )   AND
					( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
					( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' );			
					
		if ll_count_pend < ll_cant_reg_ac then
			messagebox("Advertencia","Cantidad de Folios 'BE' disponibles "+string(ll_count_pend)+" es menor al total a Procesar " +string(ll_tot_reg))
		elseif ll_count_pend_ci < ll_cant_reg_ac then
			messagebox("Advertencia","Cantidad de Folios 'CI' disponibles "+string(ll_count_pend_ci)+" es menor al total a Procesar " +string(ll_tot_reg))	
		else
			if ll_tot_reg > 0 then
				SetPointer(HourGlass!)
				if dw_lista.getitemnumber(1,'numero') > 0 then
//					SELECT	"TAB_UF"."VALOR_UF"  
//					INTO 		:ldb_uf_dia  
//					FROM 	"TAB_UF"  
//					WHERE 	"TAB_UF"."FECHA_UF" = :ld_fecha_archivo   ;
					for ll_indi=1 to ll_tot_reg
						setnull(ll_est_reg)
						ll_est_reg		= dw_lista.getitemnumber(ll_indi,'c_est_reg')
						if ll_est_reg = 0 then
							setnull(il_pasa)
							ls_base					= dw_lista.getitemstring(ll_indi,'base')
							ls_serie					= dw_lista.getitemstring(ll_indi,'serie')
							ll_numero				= dw_lista.getitemnumber(ll_indi,'numero')
							ll_id_grupo				= dw_lista.getitemnumber(ll_indi,'grupo')
							ll_descuento				= dw_lista.getitemnumber(ll_indi,'web_pagos_monto_descuento')
							if isnull(ll_descuento) then ll_descuento=0
							wf_actualizar_web_pagos(ls_base,ls_serie,ll_numero,ll_id_grupo,ll_indi,ll_descuento)
						end if
					next
					if il_graba > 0 then
						Messagebox('Aviso','Registros Actualizados '+string(il_graba,'###,###,###,###'))	
					end if	
					dw_lista.reset()
					dw_lista.retrieve()
					ll_tot_reg	= dw_lista.rowcount()
					if ll_tot_reg > 0 then
						for ll_indi=1 to ll_tot_reg
							dw_lista.setitem(ll_indi,'c_est_reg',1)
						next
						dw_lista.accepttext()
					else
						messagebox("Advertencia","No Existen Más Datos para Actualizar")
					end if
				end if	
			end if
		end if	
	end if
end if	
dw_lista.SetFilter('')
dw_lista.Filter( )
end event

type dw_lista from datawindow within w_cargar_boletas_elec_wp
integer x = 32
integer y = 120
integer width = 4059
integer height = 1496
string title = "none"
string dataobject = "dw_lista_web_pagos_elec"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;Long		ll_est_reg,ll_tot_reg,ll_grupo,ll_indi,ll_grupo_reg
String	ls_columna

this.accepttext()
ls_columna						= dwo.name
if row > 0 then
	if ls_columna='c_est_reg' then
		ll_est_reg					= long(data)
		if ll_est_reg=0 then
			dw_lista.setitem(row,'c_est_reg',0)
		end if
		dw_lista.accepttext()
	end if
end if
end event

event clicked;if row > 0 then
	il_row		= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row		= this.getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type sle_1 from uo_convierte_numero within w_cargar_boletas_elec_wp
boolean visible = false
integer x = 1349
integer y = 2452
integer width = 494
integer taborder = 0
boolean hideselection = false
end type

type dw_boleta from datawindow within w_cargar_boletas_elec_wp
boolean visible = false
integer x = 1321
integer y = 1968
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dwe_boleta_electronica_envio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_cargar_boletas_elec_wp
integer x = 3721
integer y = 1668
integer width = 370
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_cargar_boletas_elec_wp)
end event

type gb_2 from groupbox within w_cargar_boletas_elec_wp
integer x = 1253
integer y = 1628
integer width = 983
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

