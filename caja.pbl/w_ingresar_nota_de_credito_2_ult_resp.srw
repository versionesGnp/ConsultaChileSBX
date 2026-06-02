forward
global type w_ingresar_nota_de_credito_2_ult_resp from window
end type
type dw_print_nc from datawindow within w_ingresar_nota_de_credito_2_ult_resp
end type
type st_7 from statictext within w_ingresar_nota_de_credito_2_ult_resp
end type
type ddplb_motivo from dropdownpicturelistbox within w_ingresar_nota_de_credito_2_ult_resp
end type
type dw_detalle_factura from datawindow within w_ingresar_nota_de_credito_2_ult_resp
end type
type sle_1 from uo_convierte_numero within w_ingresar_nota_de_credito_2_ult_resp
end type
type dw_factura from datawindow within w_ingresar_nota_de_credito_2_ult_resp
end type
type cb_ctacte from commandbutton within w_ingresar_nota_de_credito_2_ult_resp
end type
type cb_limpiar from commandbutton within w_ingresar_nota_de_credito_2_ult_resp
end type
type cb_grabar from commandbutton within w_ingresar_nota_de_credito_2_ult_resp
end type
type st_6 from statictext within w_ingresar_nota_de_credito_2_ult_resp
end type
type dw_nota_credito from datawindow within w_ingresar_nota_de_credito_2_ult_resp
end type
type cb_generar from commandbutton within w_ingresar_nota_de_credito_2_ult_resp
end type
type pb_eliminar from picturebutton within w_ingresar_nota_de_credito_2_ult_resp
end type
type pb_insertar from picturebutton within w_ingresar_nota_de_credito_2_ult_resp
end type
type dw_destino from datawindow within w_ingresar_nota_de_credito_2_ult_resp
end type
type rb_comprobante from radiobutton within w_ingresar_nota_de_credito_2_ult_resp
end type
type rb_contrato from radiobutton within w_ingresar_nota_de_credito_2_ult_resp
end type
type st_5 from statictext within w_ingresar_nota_de_credito_2_ult_resp
end type
type st_1 from statictext within w_ingresar_nota_de_credito_2_ult_resp
end type
type em_folio from editmask within w_ingresar_nota_de_credito_2_ult_resp
end type
type ddlb_tipo_cob from dropdownlistbox within w_ingresar_nota_de_credito_2_ult_resp
end type
type cb_cerrar from commandbutton within w_ingresar_nota_de_credito_2_ult_resp
end type
type dw_lista from datawindow within w_ingresar_nota_de_credito_2_ult_resp
end type
type pb_procesar from picturebutton within w_ingresar_nota_de_credito_2_ult_resp
end type
type em_numero from editmask within w_ingresar_nota_de_credito_2_ult_resp
end type
type st_4 from statictext within w_ingresar_nota_de_credito_2_ult_resp
end type
type st_3 from statictext within w_ingresar_nota_de_credito_2_ult_resp
end type
type st_2 from statictext within w_ingresar_nota_de_credito_2_ult_resp
end type
type ddlb_base from dropdownlistbox within w_ingresar_nota_de_credito_2_ult_resp
end type
type gb_1 from groupbox within w_ingresar_nota_de_credito_2_ult_resp
end type
type ddlb_serie from dropdownlistbox within w_ingresar_nota_de_credito_2_ult_resp
end type
type gb_2 from groupbox within w_ingresar_nota_de_credito_2_ult_resp
end type
type gb_3 from groupbox within w_ingresar_nota_de_credito_2_ult_resp
end type
end forward

global type w_ingresar_nota_de_credito_2_ult_resp from window
integer width = 2816
integer height = 1928
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_print_nc dw_print_nc
st_7 st_7
ddplb_motivo ddplb_motivo
dw_detalle_factura dw_detalle_factura
sle_1 sle_1
dw_factura dw_factura
cb_ctacte cb_ctacte
cb_limpiar cb_limpiar
cb_grabar cb_grabar
st_6 st_6
dw_nota_credito dw_nota_credito
cb_generar cb_generar
pb_eliminar pb_eliminar
pb_insertar pb_insertar
dw_destino dw_destino
rb_comprobante rb_comprobante
rb_contrato rb_contrato
st_5 st_5
st_1 st_1
em_folio em_folio
ddlb_tipo_cob ddlb_tipo_cob
cb_cerrar cb_cerrar
dw_lista dw_lista
pb_procesar pb_procesar
em_numero em_numero
st_4 st_4
st_3 st_3
st_2 st_2
ddlb_base ddlb_base
gb_1 gb_1
ddlb_serie ddlb_serie
gb_2 gb_2
gb_3 gb_3
end type
global w_ingresar_nota_de_credito_2_ult_resp w_ingresar_nota_de_credito_2_ult_resp

type variables
string		is_opcion,is_nota_credito
Long		il_row,il_row_destino,il_max_folio_new
Real		idb_iva,idb_tasa_iva
end variables

forward prototypes
public subroutine wf_cargar_nota_credito ()
public subroutine wf_crear_cuponera (string as_base, string as_serie, long al_numero, long al_nota_cred)
end prototypes

public subroutine wf_cargar_nota_credito ();Long		ll_new_reg,ll_cod_parque,ll_tot_reg,ll_indi,ll_cantidad,ll_monto,ll_total,ll_res,ll_can_cta_cred,ll_tot_filas,ll_reg,ll_ctas_pag,ll_total_neto,ll_total_iva,&
			ll_suma_total,ll_corre,ll_sub_total,ll_total_exento,ll_folio_original,ll_folio_nc,ll_mora,ll_gasto_cob,ll_grupo_p,ll_folio_ori,ll_boleta_elect,ll_res2
String		ls_string_boleta,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_nro,ls_depto,ls_block,ls_comuna,ls_ciudad,ls_tipo_dte,ls_nom_comp,&
			ls_direc_comp,ls_indica_serv,ls_direc_origen,ls_comuna_origen,ls_ciudad_origen,ls_rut,ls_celular,ls_fono_part,ls_email,ls_contacto,ls_tot_pag_pal,&
			ls_tipo_cob,ls_tipo_cob_otro,ls_descrip_cobro,ls_descrip_otro,ls_nombre_archivo,ls_obs_1,ls_tipo_codigo,ls_rut_empresa,ls_monto_desc,&
			ls_anula_doc,ls_tipo_doc,ls_tipo_mov,ls_tipo_cob_ori,ls_contrato,ls_ruta_elec,ls_nombre_archivo2,ls_estado_doc='A'
Datetime	ldt_fec_venc_cred,ldt_fec_venc_mant,ldt_fecha_pago,ldt_fec_pago_original
SaveAsType TipoArchivo

dw_nota_credito.accepttext()
dw_factura.reset()
ll_folio_nc					= dw_nota_credito.getitemnumber(1,'folio')
if ll_folio_nc > 0 then
	ls_indica_serv			= '3'
//	ldt_fecha_pago			= datetime(date(gdt_fec_sistema),time('00:00:00'))
	ldt_fecha_pago			= dw_destino.getitemdatetime(1,'fecha_pago')
	ls_tipo_cob_ori			= dw_detalle_factura.getitemstring(1,'tipo_cob')
	ll_folio_ori				= dw_destino.getitemnumber(1,'folio')
	ls_contrato				= gs_base+gs_serie+string(gi_numero,'############')
	if gs_base='B' then
		ldt_fec_venc_cred	= datetime(date(gdt_fec_sistema),time('00:00:00'))
		SELECT	"FACTURAS_CADENA"."COD_PARQUE",		"FACTURAS_CADENA"."RUT"
		INTO 		:ll_cod_parque,										:gi_rut
		FROM 	"FACTURAS_CADENA"  
		WHERE  ("FACTURAS_CADENA"."CODIGO" = :gs_base ) AND  
				   ( "FACTURAS_CADENA"."SERIE" = :gs_serie ) AND  
				   ( "FACTURAS_CADENA"."NUMERO" = :gi_numero )
		USING	sqlca;
		if ll_cod_parque > 0 then
			SELECT	"FACTURAS_CLIENTE_EXENTAS"."DV",	"FACTURAS_CLIENTE_EXENTAS"."NOMBRE",		"FACTURAS_CLIENTE_EXENTAS"."A_PATERNO",	"FACTURAS_CLIENTE_EXENTAS"."A_MATERNO",	"TIPO_VIA"."DESCRIPCION",	"FACTURAS_CLIENTE_EXENTAS"."DIRECCION_P",	"FACTURAS_CLIENTE_EXENTAS"."NUMERO_PARTICULAR",	"FACTURAS_CLIENTE_EXENTAS"."DEPTO_PARTICULAR",		"FACTURAS_CLIENTE_EXENTAS"."BLOCK_PARTICULAR",		"COMUNA"."COMUNA",	"CIUDAD"."SIGLA_CIUDAD",	"FACTURAS_CLIENTE_EXENTAS"."CELULAR",	"FACTURAS_CLIENTE_EXENTAS"."FONO_P",	"FACTURAS_CLIENTE_EXENTAS"."EMAIL"
			INTO		:ls_dv,											:ls_nom,														:ls_ap_pat,													:ls_ap_mat,													:ls_tipo_via,							:ls_direc,														:ls_nro,																	:ls_depto,																	:ls_block,																	:ls_comuna,					:ls_ciudad,						:ls_celular,												:ls_fono_part,											:ls_email
			FROM 	"CIUDAD",	"FACTURAS_CLIENTE_EXENTAS",	"COMUNA",	"TIPO_VIA"  
			WHERE ( "CIUDAD"."CODIGO_CIUDAD" = "FACTURAS_CLIENTE_EXENTAS"."CIUDAD" ) and  
					  ( "COMUNA"."CODIGO_COMUNA" = "FACTURAS_CLIENTE_EXENTAS"."COMUNA" ) and  
					  ( "FACTURAS_CLIENTE_EXENTAS"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
					  (("FACTURAS_CLIENTE_EXENTAS"."RUT" = :gi_rut ) ) 
			USING	sqlca;
		end if
	else
		SELECT	"CADENA"."COD_PARQUE",	"CADENA_MORA"."FECHA_VENC_CRED",		"CADENA_MORA"."FECHA_VENC_MANT"
		INTO 		:ll_cod_parque,					:ldt_fec_venc_cred,								:ldt_fec_venc_mant
		FROM 	"CADENA",	"CADENA_MORA"  
		WHERE ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
				  (("CADENA"."CODIGO" = :gs_base ) AND  
				  ( "CADENA"."SERIE" = :gs_serie ) AND  
				  ( "CADENA"."NUMERO" = :gi_numero ) )  
		USING	sqlca;
		if ll_cod_parque = 0 or isnull(ll_cod_parque) then
			SELECT DISTINCT	"CLIENTE_REZAGO"."RUT",	"CLIENTE_REZAGO"."DV",	"CLIENTE_REZAGO"."NOMBRE",		"CLIENTE_REZAGO"."AP_PATERNO",	"CLIENTE_REZAGO"."AP_MATERNO",	"CLIENTE_REZAGO"."DIRECCION_PART",		"COMUNA"."COMUNA",	"CIUDAD"."SIGLA_CIUDAD",	"CLIENTE_REZAGO"."TELEFONO_PART",	"CLIENTE_REZAGO"."COD_PARQUE"  
			INTO					:gi_rut,							:ls_dv,							:ls_nom,									:ls_ap_pat,									:ls_ap_mat,									:ls_direc,												:ls_comuna,					:ls_ciudad,						:ls_fono_part,												:ll_cod_parque
			FROM 	"CIUDAD",	"CLIENTE_REZAGO",	"COMUNA",	"TIPO_VIA"  
			WHERE ( "CIUDAD"."CODIGO_CIUDAD" = "CLIENTE_REZAGO"."CIUDAD_PART" ) and  
					  ( "COMUNA"."CODIGO_COMUNA" = "CLIENTE_REZAGO"."COMUNA_PART" ) and  
					  ( "CLIENTE_REZAGO"."BASE" = :gs_base ) AND  
					  ( "CLIENTE_REZAGO"."SERIE" = :gs_serie ) AND  
					  ( "CLIENTE_REZAGO"."NUMERO" = :gi_numero ) AND  
					  ( "CLIENTE_REZAGO"."COD_PAGO" = :ls_tipo_cob_ori ) AND  
					  ( "CLIENTE_REZAGO"."FOLIO" = :ll_folio_ori ) AND  
					  ( "CLIENTE_REZAGO"."FECHA_PAGO" = :ldt_fecha_pago ) 
			USING	sqlca;
			ls_tipo_via				= ''
			ls_email					= ''
			ls_nro						= ''
			ls_depto					= ''
			ls_block					= ''
			ls_celular				= ''
		else
			SELECT	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",		"CLIENTE"."BLOCK_PARTICULAR",		"COMUNA"."COMUNA",	"CIUDAD"."SIGLA_CIUDAD",	"CLIENTE"."CELULAR",	"CLIENTE"."FONO_P",	"CLIENTE"."EMAIL"
			INTO		:ls_dv,				:ls_nom,						:ls_ap_pat,						:ls_ap_mat,						:ls_tipo_via,							:ls_direc,							:ls_nro,										:ls_depto,									:ls_block,									:ls_comuna,					:ls_ciudad,						:ls_celular,					:ls_fono_part,			:ls_email
			FROM 	"CIUDAD",	"CLIENTE",	"COMUNA",	"TIPO_VIA"  
			WHERE ( "CIUDAD"."CODIGO_CIUDAD" = "CLIENTE"."CIUDAD" ) and  
					  ( "COMUNA"."CODIGO_COMUNA" = "CLIENTE"."COMUNA" ) and  
					  ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
					  (("CLIENTE"."RUT" = :gi_rut ) ) 
			USING	sqlca;
		end if
	end if
	if sqlca.sqlcode=0 then
		if ls_tipo_cob_ori = 'BA' or ls_tipo_cob_ori ='FA' then
			SELECT	"MEMBRETE_EMPRESA"."DIRECCION",	"MEMBRETE_EMPRESA"."COMUNA",	"MEMBRETE_EMPRESA"."CIUDAD",	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."RUTA_ELECT"
			INTO 		:ls_direc_origen,								:ls_comuna_origen,						:ls_ciudad_origen,							:ls_rut_empresa,								:ls_ruta_elec
			FROM 	"MEMBRETE_EMPRESA"  
			WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = 99   ;
		else
			SELECT	"MEMBRETE_EMPRESA"."DIRECCION",	"MEMBRETE_EMPRESA"."COMUNA",	"MEMBRETE_EMPRESA"."CIUDAD",	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."RUTA_ELECT"
			INTO 		:ls_direc_origen,								:ls_comuna_origen,						:ls_ciudad_origen,							:ls_rut_empresa,								:ls_ruta_elec
			FROM 	"MEMBRETE_EMPRESA"  
			WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
		end if
		ls_direc_origen			= UPPER(trim(ls_direc_origen))
		if len(ls_direc_origen) > 70 then
			ls_direc_origen		= mid(ls_direc_origen,1,70)
		end if
		ls_comuna_origen		= UPPER(ls_comuna_origen)
		ls_ciudad_origen		= UPPER(ls_ciudad_origen)
		ls_ciudad					= UPPER(ls_ciudad)
		if isnull(ls_celular) or ls_celular='-' or len(ls_celular)=0 or ls_celular='*' then
			ls_celular			= ''
		end if
		if isnull(ls_fono_part) or ls_fono_part='-' or ls_fono_part='*' or len(ls_fono_part)=0 then
			ls_fono_part			= ''
		end if
		if rb_comprobante.checked=true then
			ls_contacto			= 'FONO PARTICULAR: '+ls_fono_part
		else
		if ls_celular <> '' and ls_fono_part <> '' then
				ls_contacto		= 'CELULAR: '+ls_celular+' - FONO PARTICULAR: '+ls_fono_part
			elseif ls_celular <> '' and ls_fono_part = '' then
				ls_contacto		= 'CELULAR: '+ls_celular
			elseif ls_celular = '' and ls_fono_part <> '' then
				ls_contacto 		= 'FONO PARTICULAR: '+ls_fono_part
			elseif ls_fono_part = '' and ls_celular = '' then
				ls_contacto		= ''
			end if
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
		ls_nom_comp	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
		if len(ls_nom_comp) > 40 then
			ls_nom_comp	= mid(ls_nom_comp,1,40)
		end if
		
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
		ls_nom_comp	= '-'
		ls_direc_comp	= '-'
	end if
	ls_tipo_dte			= '61'
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= '<ENCABEZADO>'
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Impresora'+Space(21)+' | '
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Tipo DTE'+Space(22)+' | '+ls_tipo_dte
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Folio'+Space(25)+' | '+string(ll_folio_nc)
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Fecha de Emision'+Space(14)+' | '+string(gdt_fec_sistema,'dd-mm-yyyy')
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Rut Receptor'+Space(18)+' | '+ls_rut
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Codigo Interno Receptor'+Space(7)+' | '+string(gi_rut)
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Razon Social Receptor'+Space(9)+' | '+ls_nom_comp
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Contacto Receptor'+Space(13)+' | '+ls_contacto
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Direccion Receptor'+Space(12)+' | '+ls_direc_comp
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Comuna Receptor'+Space(15)+' | '+ls_comuna
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Ciudad Receptor'+Space(15)+' | '+ls_ciudad
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Giro del Receptor'+Space(13)+' | '+'CLIENTE'
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	
	if ls_tipo_cob_ori='BL' or ls_tipo_cob_ori='FA' then
		ll_suma_total		= round(dw_detalle_factura.getitemnumber(1,'c_sub_total'),2)
		ll_total_neto			= round(dw_detalle_factura.getitemnumber(1,'c_sum_neto'),2)
		ll_total_iva			= round(dw_detalle_factura.getitemnumber(1,'c_sum_iva'),2)
		ll_total_exento		= 0
	elseif ls_tipo_cob_ori='BA' then
		ll_suma_total		= round(dw_detalle_factura.getitemnumber(1,'c_sub_total'),2)
		ll_total_neto			= round(dw_detalle_factura.getitemnumber(1,'c_sum_neto'),2)
		ll_total_iva			= round(dw_detalle_factura.getitemnumber(1,'c_sum_iva'),2)
		ll_total_exento		= 0
	else
		ll_suma_total		= round(dw_detalle_factura.getitemnumber(1,'c_sub_total'),2)
		ll_total_neto			= 0
		ll_total_iva			= 0
		ll_total_exento		= ll_suma_total
	end if
//	if gs_tipo_cobro='NC' then
//		ll_total_neto		= 0
//		ll_total_iva		= 0
//	end if
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Monto Neto'+Space(20)+' | '+string(ll_total_neto)
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Monto Exento'+Space(18)+' | '+string(ll_total_exento)
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	if ls_tipo_cob_ori = 'BA' or ls_tipo_cob_ori ='FA' then
		ll_new_reg			= dw_factura.insertrow(0)
		ls_string_boleta	= 'Tasa IVA'+Space(22)+' | '+string(idb_tasa_iva)
		dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	end if
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'IVA'+Space(27)+' | '+string(ll_total_iva)
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Monto Total'+Space(19)+' | '+string(ll_suma_total,'###########0')
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ls_tot_pag_pal		= sle_1.uo_convertir_numero(string(ll_suma_total))
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'Monto Escrito'+Space(16)+'  | '+ls_tot_pag_pal
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'IP Equipo'+Space(20)+'  | '+gs_tcp_ip
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	
	ll_new_reg			= dw_factura.insertrow(0)
	ls_string_boleta	= 'x Nro. contrato'+Space(14)+'  | '+ls_contrato
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg						= dw_factura.insertrow(0)
	ls_string_boleta				= '<DETALLE>'
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg						= dw_factura.insertrow(0)
	if ls_tipo_cob_ori='BE' then
		ls_string_boleta			= 'Nro.Linea | Tipo codigo | Codigo del Item | Nombre del Item | Cantidad | Precio Unitario Item | Monto Item | Indicador Exencion'
	else
		ls_string_boleta			= 'Nro.Linea | Tipo codigo | Codigo del Item | Nombre del Item | Cantidad | Precio Unitario Item | Monto Item | Indicador Exencion'
	end if
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_tot_reg						= dw_detalle_factura.rowcount()
	if ll_tot_reg>0 then
		ll_corre						= 0
		for ll_indi=1 to ll_tot_reg
			ls_tipo_mov				= dw_detalle_factura.getitemstring(ll_indi,'tipo_mov')
			if ls_tipo_mov <> 'S' and ls_tipo_mov <> 'G' and ls_tipo_mov <> 'J' and ls_tipo_mov <> 'P' and ls_tipo_mov <> 'R'  then//
				ll_corre ++
				ls_tipo_cob_otro	= dw_detalle_factura.getitemstring(ll_indi,'codigo_otro')
				ll_cantidad			= dw_detalle_factura.getitemnumber(ll_indi,'cuotas_pag')
				if ll_cantidad=0 or isnull(ll_cantidad) then ll_cantidad=1
				if ls_tipo_cob_ori='BL' or ls_tipo_cob_ori='FA' then
					ll_monto			= round(dw_detalle_factura.getitemnumber(ll_indi,'c_monto_neto'),2)
				else
					ll_monto			= round(dw_detalle_factura.getitemnumber(ll_indi,'monto'),2) // OJO con esto que trae el monto de cuota multiplicado por las cuotas pagadas
					ll_monto			= round(ll_monto/ll_cantidad,0) // solucion a lo anterior
				end if
				ll_total				= round(ll_cantidad * ll_monto,0)
				SELECT		"TIPO_COBRO"."DESCRIPCION"  
				INTO 			:ls_descrip_cobro  
				FROM 		"TIPO_COBRO"  
				WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_mov ) AND  
							  ( "TIPO_COBRO"."TIPO_MOV" = :ls_tipo_cob_ori )  
				USING		sqlca;
		
				SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
				INTO 			:ls_descrip_otro  
				FROM 		"CUENTA_CONTABLE_OTROS"  
				WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   AND 
								"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob_ori
				USING		sqlca;
				if isnull(ls_descrip_otro) then ls_descrip_otro  	= 'OTROS'
				ls_descrip_cobro		= UPPER(ls_descrip_cobro)
				if isnull(ls_tipo_mov) then ls_tipo_mov=''
				if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
				if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
				if ls_tipo_mov = 'S' then
					ls_monto_desc		= string(ll_monto)
					ls_descrip_otro		= 'DESCUENTO '+ ls_descrip_otro
					ll_total				= 0
				else
					ls_monto_desc		= '0'
				end if
				if ls_tipo_mov = 'L' then
					if ls_tipo_cob_ori='BE' then
						ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+'1'
					else
						ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+'1'
					end if
				else
					if ls_tipo_cob_ori='BE' then
						ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+'1'
					else
						ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+'1'
					end if
				end if
				if not isnull(ls_string_boleta) then
					ll_new_reg			= dw_factura.insertrow(0)
					dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
				end if
			end if	//
		next
		
		ll_reg						= dw_detalle_factura.Find("tipo_mov = 'G' ", 1, ll_tot_reg)	//
		if ll_reg > 0 then
//			ll_mora				= dw_detalle_factura.getitemnumber(1,'mora')
			ll_cantidad			= dw_detalle_factura.getitemnumber(ll_reg,'cuotas_pag')
			if ll_cantidad=0 or isnull(ll_cantidad) then ll_cantidad=1
			ll_monto				= round(dw_detalle_factura.getitemnumber(ll_reg,'monto'),2)
			ll_total				= round(dw_detalle_factura.getitemnumber(ll_reg,'c_total_linea'),2)
			ll_mora				= ll_monto
			if ll_mora > 0 then
				ll_corre ++
				ls_tipo_mov				= 'G'
				ls_descrip_cobro		= 'MORA CREDITO'
				ll_cantidad				= 1
				ls_monto_desc			= '0'
				if ls_tipo_cob_ori='BE' then
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_monto)+' | '+'1'
				else
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_monto)+' | '+'1'
				end if
				ll_new_reg				= dw_factura.insertrow(0)
				dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			end if
		end if
		ll_reg						= dw_detalle_factura.Find("tipo_mov = 'J' ", 1, ll_tot_reg)	//
		if ll_reg > 0 then
			ll_cantidad			= dw_detalle_factura.getitemnumber(ll_reg,'cuotas_pag')
			if ll_cantidad=0 or isnull(ll_cantidad) then ll_cantidad=1
			ll_monto				= round(dw_detalle_factura.getitemnumber(ll_reg,'monto'),2)
			ll_total				= round(dw_detalle_factura.getitemnumber(ll_reg,'c_total_linea'),2)
			ll_gasto_cob			= ll_monto
			if ll_gasto_cob > 0 then
				ll_corre ++
				ls_tipo_mov				= 'J'
				ls_descrip_cobro		= 'GASTO COBRANZA CREDITO'
				ll_cantidad				= 1
				ls_monto_desc			= '0'
				if ls_tipo_cob_ori='BE' then
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)+' | '+'1'
				else
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)+' | '+'1'
				end if
				ll_new_reg				= dw_factura.insertrow(0)
				dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			end if
		end if
		ll_reg						= dw_detalle_factura.Find("tipo_mov = 'P' ", 1, ll_tot_reg)	//
		if ll_reg > 0 then
//			ll_mora				= dw_detalle_factura.getitemnumber(1,'mora')
			ll_cantidad			= dw_detalle_factura.getitemnumber(ll_reg,'cuotas_pag')
			if ll_cantidad=0 or isnull(ll_cantidad) then ll_cantidad=1
			ll_monto				= round(dw_detalle_factura.getitemnumber(ll_reg,'monto'),2)
			ll_total				= round(dw_detalle_factura.getitemnumber(ll_reg,'c_total_linea'),2)
			ll_mora				= ll_monto
			if ll_mora > 0 then
				ll_corre ++
				ls_tipo_mov				= 'P'
				ls_descrip_cobro		= 'MORA MANTENCION'
				ll_cantidad				= 1
				ls_monto_desc			= '0'
				if ls_tipo_cob_ori='BE' then
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_monto)+' | '+'1'
				else
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_monto)+' | '+'1'
				end if
				ll_new_reg				= dw_factura.insertrow(0)
				dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			end if
		end if
		ll_reg						= dw_detalle_factura.Find("tipo_mov = 'R' ", 1, ll_tot_reg)	//
		if ll_reg > 0 then
			//ll_cantidad			= dw_detalle_factura.getitemnumber(ll_reg,'cuotas_pag')
			if ll_cantidad=0 or isnull(ll_cantidad) then ll_cantidad=1
			ll_monto				= round(dw_detalle_factura.getitemnumber(ll_reg,'monto'),2)
			ll_total				= round(dw_detalle_factura.getitemnumber(ll_reg,'c_total_linea'),2)
			ll_gasto_cob			= ll_monto
			if ll_gasto_cob > 0 then
				ll_corre ++
				ls_tipo_mov				= 'R'
				ls_descrip_cobro		= 'GASTO COBRANZA MANTENCION'
				ll_cantidad				= 1
				ls_monto_desc			= '0'
				if ls_tipo_cob_ori='BE' then
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)+' | '+'1'
				else
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)+' | '+'1'
				end if
				ll_new_reg				= dw_factura.insertrow(0)
				dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			end if
		end if
		
//		ll_reg								= dw_detalle_factura.Find("tipo_mov = 'L' or tipo_mov = 'S'", 1, ll_tot_reg)	//
		ll_reg								= dw_detalle_factura.Find( "tipo_mov = 'S'", 1, ll_tot_reg)	
		if ll_reg > 0 then
			Setnull(ll_corre)
			ll_corre						= 0
			ll_new_reg					= dw_factura.insertrow(0)
			ls_string_boleta			= '<DESCUENTOS O RECARGOS>'
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			ll_new_reg					= dw_factura.insertrow(0)
			if ls_tipo_cob_ori='BE' then
				ls_string_boleta		= 'Nro Desc. Recargo | Tipo Movimiento | Glosa Desc. Recargo | Tipo Valor | Valor Desc. Recargo | Indicador Exencion Desc. Recargo'
			else
				ls_string_boleta		= 'Nro Desc. Recargo | Tipo Movimiento | Glosa Desc. Recargo | Tipo Valor | Valor Desc. Recargo | Indicador Exencion Desc. Recargo'
			end if
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			for ll_indi=1 to ll_tot_reg
				ls_tipo_mov				= dw_detalle_factura.getitemstring(ll_indi,'tipo_mov')
				if ls_tipo_mov = 'S' then
					ll_corre ++
					ls_tipo_cob_otro	= dw_detalle_factura.getitemstring(ll_indi,'codigo_otro')
					ll_cantidad			= dw_detalle_factura.getitemnumber(ll_indi,'cuotas_pag')
					if ll_cantidad=0 or isnull(ll_cantidad) then ll_cantidad=1
					if ls_tipo_cob_ori='BL' or ls_tipo_cob_ori='FA' then
						ll_monto			= round(dw_detalle_factura.getitemnumber(ll_indi,'c_monto_neto'),2)
						ll_total			= round(dw_detalle_factura.getitemnumber(ll_indi,'c_monto_neto'),2)
					else
						ll_monto			= round(dw_detalle_factura.getitemnumber(ll_indi,'monto'),2)
						ll_total			= round(dw_detalle_factura.getitemnumber(ll_indi,'monto'),2)
					end if
					SELECT		"TIPO_COBRO"."DESCRIPCION"  
					INTO 			:ls_descrip_cobro  
					FROM 		"TIPO_COBRO"  
					WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_mov ) AND  
								  ( "TIPO_COBRO"."TIPO_MOV" = :ls_tipo_cob_ori )  
					USING		sqlca;
			
					SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
					INTO 			:ls_descrip_otro  
					FROM 		"CUENTA_CONTABLE_OTROS"  
					WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   
					USING		sqlca;
					if isnull(ls_descrip_otro) then ls_descrip_otro = 'DESCUENTOS'
					ls_descrip_cobro		= UPPER(ls_descrip_cobro)
					if isnull(ls_tipo_mov) then ls_tipo_mov=''
					if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
					if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
					if ls_tipo_mov = 'S' then
						ls_tipo_codigo		= 'D'
						ll_total				= ll_total * -1
					end if
					if ls_tipo_cob_otro <> '0' then
						ls_descrip_cobro	= UPPER(ls_descrip_otro)
					end if
					if ls_tipo_cob_ori='BE' then
						ls_string_boleta	= string(ll_corre)+' | '+ls_tipo_codigo+' | '+ls_descrip_cobro+' | '+'$'+' | '+string(ll_total)+' | '+'1'
					else
						ls_string_boleta	= string(ll_corre)+' | '+ls_tipo_codigo+' | '+ls_descrip_cobro+' | '+'$'+' | '+string(ll_total)+' | '+'1'
					end if
					if not isnull(ls_string_boleta) then
						ll_new_reg			= dw_factura.insertrow(0)
						dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
					end if
				end if
			next
		end if	//
	
		ll_corre						= 1
		ll_cantidad					= 1
		ls_anula_doc				= '1'
		ll_monto						= dw_nota_credito.getitemnumber(1,'monto')
		ll_folio_original				= dw_destino.getitemnumber(1,'folio')
		ls_tipo_cob					= dw_destino.getitemstring(1,'tipo_cob')
		ldt_fec_pago_original		= dw_destino.getitemdatetime(1,'fecha_pago')
		if ls_tipo_cob='CU' then
			SELECT	"ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO"  
			INTO 		:ll_boleta_elect
			FROM 	"ELECTRONICA_FB_DETALLE"  
			WHERE ( "ELECTRONICA_FB_DETALLE"."TIPO_DOC_ASOC" = :ls_tipo_cob ) AND  
					  ( "ELECTRONICA_FB_DETALLE"."FOLIO_ASOC" = :ll_folio_original )  
		 	USING	sqlca;
			 if ll_boleta_elect > 0 then
				ll_folio_original		= ll_boleta_elect
			end if

		end if
		if ls_tipo_cob='CI' or ls_tipo_cob='CU' then
			ls_tipo_doc				= '38'
		elseif ls_tipo_cob='BE' then
			ls_tipo_doc				= '41'
		elseif ls_tipo_cob='BL' then
			ls_tipo_doc				= '30'
		elseif ls_tipo_cob='FE' then
			ls_tipo_doc				= '34'
		elseif ls_tipo_cob='FA' then
			ls_tipo_doc				= '33'
		else
			ls_tipo_doc				= '38'
		end if
//		ls_descrip_cobro			= 'NOTA CREDITO FOLIO N° '+gs_tipo_cobro+STRING(ll_folio_original)
//		ls_string_boleta			= string(ll_corre)+' | '+gs_tipo_cobro+' | '+gs_tipo_cobro+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_monto)
//		if not isnull(ls_string_boleta) then
//			ll_new_reg				= dw_factura.insertrow(0)
//			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
//		end if
	
		ll_new_reg					= dw_factura.insertrow(0)
		ls_string_boleta			= '<REFERENCIA>'
		dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
		ll_new_reg					= dw_factura.insertrow(0)
		ls_string_boleta			= 'Nro Linea Referencia| Tipo Documento Referencia | Folio Referencia | Fecha Referencia | Codigo Referencia'
		dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	
		ll_new_reg					= dw_factura.insertrow(0)
		ls_string_boleta			= string(ll_corre)+' | '+ls_tipo_doc+' | '+string(ll_folio_original)+' | '+string(ldt_fec_pago_original,'dd-mm-yyyy')+' | '+ls_anula_doc
		dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
//////		ls_nombre_archivo		= '\\Boleta_elect\LA-FLORIDA-PROD\InFUD\'+ ls_tipo_dte+'_'+string(ll_folio_nc)+'_'+ls_rut_empresa+'.txt'
		ls_nombre_archivo		= ls_ruta_elec+ ls_tipo_dte+'_'+string(ll_folio_nc)+'_'+ls_rut_empresa+'.txt'
//		ls_nombre_archivo2		= 'C:\mod_cp\consulta\Boletas_Electronicas\'+ ls_tipo_dte+'_'+string(ll_folio_nc)+'_'+ls_rut_empresa+'.txt'
		TipoArchivo 					= Text!
		ll_res							= dw_factura.SaveAs( ls_nombre_archivo,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)
		ll_res2						= dw_factura.SaveAs( ls_nombre_archivo2,TipoArchivo,False, EncodingANSI!)
		If ll_res < 0  Then
			MessageBox("Advertencia", "No fue posible Exportar Datos Boleta Electrónica", Exclamation!)
		End If	

		ls_nom						= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
		if len(ls_nom) > 40 then
			ls_nom					= mid(ls_nom,1,40)
		end if
		SELECT 	  "ELECTRONICA_FB"."GRUPO"
		INTO		 :ll_grupo_p
		FROM 	  "ELECTRONICA_FB" 
		WHERE 	( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND 
					( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND
					( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) ;
					
		UPDATE		"ELECTRONICA_FB_DETALLE"  
		SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
						"RUT" = :gi_rut,   
						"ESTADO_REG" = 'G',   
						"DV" = :ls_dv,   
						"NOMBRE_CLIENTE" = :ls_nom,
						"MONTO_AFECTO" = :ll_total_neto,   
						"MONTO_EXENTO" = :ll_total_exento,   
						"MONTO_IVA" = :ll_total_iva,   
						"MONTO_TOTAL" = :ll_suma_total,   
						"USUARIO_CREA" = :gs_user,   
						"BASE" = :gs_base,   
						"SERIE" = :gs_serie,   
						"NUMERO" = :gi_numero,
						"COD_CAJA" = :gs_caja,
						"TIPO_DTE" = '61',
						"ESTADO_DOCUMENTO" = :ls_estado_doc
		WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" =:ll_grupo_p ) AND  
					  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
					  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) AND
					  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
//			messagebox("Grabar1","Grabación Exitosa 1")
		else
			rollback;
			messagebox("Advertencia","Error Grabar Nota de credito Electrónica SQL: "+sqlca.sqlerrtext)
		end if 
	end if
end if
end subroutine

public subroutine wf_crear_cuponera (string as_base, string as_serie, long al_numero, long al_nota_cred);Long		ll_plazo,ll_cod_parque,ll_rut,ll_count_reg_atencion
String		ls_dv,ls_moneda,ls_glosa,ls_estado='67'
Double	ldb_valor_cuota,ldb_valor_cuota_mant
Datetime	ldt_fecha_prim,ldt_fec_venc_mant

if al_numero > 0 then
	SELECT 	"PAGO_OFERTA"."NRO_CUOTAS",		"CADENA"."RUT",	"CLIENTE"."DV", 	"PAGO_OFERTA"."VALOR_CUOTA", 	"OFERTA_V"."VALOR_CUOTA_M", 	"CADENA"."COD_PARQUE", 	"PAGO_OFERTA"."FECHA_PRIM", 	"CADENA_MORA"."FECHA_VENC_MANT", 	"PAGO_OFERTA"."MONEDA"  
	INTO 		:ll_plazo,   									:ll_rut,   				:ls_dv,   				:ldb_valor_cuota,   						:ldb_valor_cuota_mant,   				:ll_cod_parque,   				:ldt_fecha_prim,   						:ldt_fec_venc_mant,   							:ls_moneda  
	FROM 	"CADENA",   "OFERTA_V",   "PAGO_OFERTA",   "CLIENTE",   "CADENA_MORA"  
	WHERE ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				( "CADENA"."CODIGO" = "OFERTA_V"."BASE" ) and  
				( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				( "OFERTA_V"."BASE" = "PAGO_OFERTA"."BASE" ) and  
				( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
				( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
				( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
				( ( "CADENA"."CODIGO" = :as_base ) AND  
				( "CADENA"."SERIE" = :as_serie ) AND  
				( "CADENA"."NUMERO" = :al_numero ) )   
	UNION   
	SELECT 	"CONTRATO"."PLAZO",   	"CADENA"."RUT",   	"CLIENTE"."DV",   	"CONTRATO"."VALOR_CUO",   	"CONTRATO"."VALOR_CUOTA_M",   	"CADENA"."COD_PARQUE",   	"CONTRATO"."FECHA_PRIM",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"CONTRATO"."MONEDA"  
	FROM 	"CADENA",   "CLIENTE",   "CONTRATO",   "CADENA_MORA"  
	WHERE ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
				( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
				( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
				( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
				( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
				( ( "CADENA"."CODIGO" = :as_base ) AND  
				( "CADENA"."SERIE" = :as_serie ) AND  
				( "CADENA"."NUMERO" = :al_numero ) )   
	UNION   
	SELECT 	"PAGO_LIBERADOR"."NRO_CUOTAS",   	"CADENA"."RUT",   	"CLIENTE"."DV",   	"PAGO_LIBERADOR"."VALOR_CUOTA",   	0 as valor_cuota_m,   	"CADENA"."COD_PARQUE",   	"PAGO_LIBERADOR"."FECHA_PRIM",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"PAGO_LIBERADOR"."MONEDA"  
	FROM 	"ANEXO_LIBERADOR",   "CADENA",   "CADENA_MORA",   "CLIENTE",   "PAGO_LIBERADOR"  
	WHERE ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
				( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
				( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
				( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
				( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
				( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
				( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
				( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
				( ( "CADENA"."CODIGO" = :as_base ) AND  
				( "CADENA"."SERIE" = :as_serie ) AND  
				( "CADENA"."NUMERO" = :al_numero ) )   
	UNION   
	SELECT 	"PAGO_AUMENTO"."NRO_CUOTAS",   	"CADENA"."RUT",   	"CLIENTE"."DV",   	"PAGO_AUMENTO"."VALOR_CUOTA",   	0 as valor_cuota_m,   	"CADENA"."COD_PARQUE",   	"PAGO_AUMENTO"."FECHA_PRIM",   		"CADENA_MORA"."FECHA_VENC_MANT",   	"PAGO_AUMENTO"."MONEDA"  
	FROM 	"ANEXO_AUMENTO",   "CADENA",   "CADENA_MORA",   "CLIENTE",   "PAGO_AUMENTO"  
	WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
				( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
				( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
				( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
				( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
				( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
				( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
				( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
				( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				( ( "CADENA"."CODIGO" = :as_base ) AND  
				( "CADENA"."SERIE" = :as_serie ) AND  
				( "CADENA"."NUMERO" = :al_numero ) )   
	UNION   
	SELECT 	"DERECHO"."PLAZO",   	"CADENA"."RUT",   	"CLIENTE"."DV",   	"DERECHO"."VALOR_CUO",   	0 as valor_cuota_m,   	"CADENA"."COD_PARQUE",   	"DERECHO"."FECHA_PRIM",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"DERECHO"."MONEDA"  
	FROM 	"CADENA",   "CADENA_MORA",   "CLIENTE",   "DERECHO"  
	WHERE ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
				( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
				( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
				( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
				( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
				( "CADENA"."CODIGO" = "DERECHO"."BASE" ) and  
				( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				( ( "CADENA"."CODIGO" = :as_base ) AND  
				( "CADENA"."SERIE" = :as_serie ) AND  
				( "CADENA"."NUMERO" = :al_numero ) )   
	UNION   
	SELECT 	"PAGARE"."PLAZO",   	"CADENA"."RUT",   	"CLIENTE"."DV",   	"PAGARE"."VALOR_CUO",   	0 as valor_cuota_m,   	"CADENA"."COD_PARQUE",   	"PAGARE"."FECHA_PRIM",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"PAGARE"."MONEDA"  
	FROM 	"CADENA",   "CADENA_MORA",   "CLIENTE",   "PAGARE"  
	WHERE ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
				( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
				( "CADENA"."CODIGO" = "PAGARE"."BASE" ) and  
				( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
				( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
				( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
				( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				( ( "CADENA"."CODIGO" = :as_base ) AND  
				( "CADENA"."SERIE" = :as_serie ) AND  
				( "CADENA"."NUMERO" = :al_numero ) )   
	UNION   
	SELECT 	"REPACTA_MANTENCION"."CUOTAS_PACTADAS",   	"CADENA"."RUT",   	"CLIENTE"."DV",   	"REPACTA_MANTENCION"."VALOR_CUOTA",   	0 as valor_cuota_m,   	"CADENA"."COD_PARQUE",   	"REPACTA_MANTENCION"."FECHA_PRIMERA_CTA",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"REPACTA_MANTENCION"."TIPO_MONEDA"  
	FROM 	"CADENA",   "CADENA_MORA",   "CLIENTE",   "REPACTA_MANTENCION"  
	WHERE ( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
				( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
				( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
				( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
				( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
				( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
				( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				( ( "CADENA"."CODIGO" = :as_base ) AND  
				( "CADENA"."SERIE" = :as_serie ) AND  
				( "CADENA"."NUMERO" = :al_numero ) )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :as_base, :as_serie, :al_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda);
		EXECUTE sp_proc_genera_cuponera;
		SELECT 	Count("ATENCION_LOG"."RUT")
		INTO 		:ll_count_reg_atencion  
		FROM 	"ATENCION_LOG"  
		WHERE ( "ATENCION_LOG"."RUT" = :ll_rut ) AND  
				  ( "ATENCION_LOG"."ESTADO" = :ls_estado ) AND  
				  ( "ATENCION_LOG"."FECHA" = :gdt_fec_sistema ) AND  
				  ( "ATENCION_LOG"."USUARIO" = :gs_user ) AND  
				  ( "ATENCION_LOG"."BASE" = :as_base ) AND  
				  ( "ATENCION_LOG"."SERIE" = :as_serie ) AND  
				  ( "ATENCION_LOG"."NUMERO" = :al_numero )   ;
		if ll_count_reg_atencion = 0 then
			ls_glosa						= 'SE GENERA NUEVA CUPONERA POR MOTIVO NOTA DE CREDITO N° '+string(al_nota_cred)+' CON FECHA '+string(gdt_fec_sistema,'dd/mm/yyyy')
			INSERT INTO "ATENCION_LOG"  
							( "RUT"  ,	"ESTADO"  ,"FECHA"  ,			"GLOSA",		"USUARIO" ,		"BASE"  ,		"SERIE"  ,	"NUMERO" )  
			VALUES 		( :ll_rut,		:ls_estado,	:gdt_fec_sistema,	:ls_glosa,	:gs_user,		:as_base,	:as_serie,	:al_numero)  ;
			if sqlca.sqlcode <> 0 then
				messagebox('Error','Error al Grabar '+sqlca.SQLErrText,information!)
				ROLLBACK;
			else
				commit;
			end if
		end if
	end if
end if
end subroutine

on w_ingresar_nota_de_credito_2_ult_resp.create
this.dw_print_nc=create dw_print_nc
this.st_7=create st_7
this.ddplb_motivo=create ddplb_motivo
this.dw_detalle_factura=create dw_detalle_factura
this.sle_1=create sle_1
this.dw_factura=create dw_factura
this.cb_ctacte=create cb_ctacte
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.st_6=create st_6
this.dw_nota_credito=create dw_nota_credito
this.cb_generar=create cb_generar
this.pb_eliminar=create pb_eliminar
this.pb_insertar=create pb_insertar
this.dw_destino=create dw_destino
this.rb_comprobante=create rb_comprobante
this.rb_contrato=create rb_contrato
this.st_5=create st_5
this.st_1=create st_1
this.em_folio=create em_folio
this.ddlb_tipo_cob=create ddlb_tipo_cob
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.pb_procesar=create pb_procesar
this.em_numero=create em_numero
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_base=create ddlb_base
this.gb_1=create gb_1
this.ddlb_serie=create ddlb_serie
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.dw_print_nc,&
this.st_7,&
this.ddplb_motivo,&
this.dw_detalle_factura,&
this.sle_1,&
this.dw_factura,&
this.cb_ctacte,&
this.cb_limpiar,&
this.cb_grabar,&
this.st_6,&
this.dw_nota_credito,&
this.cb_generar,&
this.pb_eliminar,&
this.pb_insertar,&
this.dw_destino,&
this.rb_comprobante,&
this.rb_contrato,&
this.st_5,&
this.st_1,&
this.em_folio,&
this.ddlb_tipo_cob,&
this.cb_cerrar,&
this.dw_lista,&
this.pb_procesar,&
this.em_numero,&
this.st_4,&
this.st_3,&
this.st_2,&
this.ddlb_base,&
this.gb_1,&
this.ddlb_serie,&
this.gb_2,&
this.gb_3}
end on

on w_ingresar_nota_de_credito_2_ult_resp.destroy
destroy(this.dw_print_nc)
destroy(this.st_7)
destroy(this.ddplb_motivo)
destroy(this.dw_detalle_factura)
destroy(this.sle_1)
destroy(this.dw_factura)
destroy(this.cb_ctacte)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.st_6)
destroy(this.dw_nota_credito)
destroy(this.cb_generar)
destroy(this.pb_eliminar)
destroy(this.pb_insertar)
destroy(this.dw_destino)
destroy(this.rb_comprobante)
destroy(this.rb_contrato)
destroy(this.st_5)
destroy(this.st_1)
destroy(this.em_folio)
destroy(this.ddlb_tipo_cob)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.pb_procesar)
destroy(this.em_numero)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_base)
destroy(this.gb_1)
destroy(this.ddlb_serie)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;String	ls_base,ls_tipo_cob,ls_codigo_motivo,ls_descrip_motivo

gf_centrar(w_ingresar_nota_de_credito_2)
is_opcion					= Message.StringParm
SELECT	"TASA"."IVA"  INTO :idb_iva  FROM 	"TASA"  WHERE "TASA"."LOOK" = 1;
idb_tasa_iva							= int((idb_iva - 1) * 100)
gd_hoy								= datetime(date(gdt_fec_sistema),time('00:00:00'))
if is_opcion='A' then
	is_nota_credito					= 'NE'
	this.title							= 'Nota de Crédito Administradora (N.B.)'
	gs_tipo_cobro					= 'NE'
	rb_comprobante.checked	= true
	rb_contrato.checked			= false
else
	is_nota_credito					= 'NE'
	this.title							= 'Nota de Crédito Inmobiliaria (N.C.)'
	gs_tipo_cobro					= 'NE'
	rb_comprobante.checked	= false
	rb_contrato.checked			= true
end if
dw_factura.settransobject(sqlca)
dw_lista.settransobject(sqlca)
dw_destino.settransobject(sqlca)
dw_nota_credito.settransobject(sqlca)
dw_detalle_factura.settransobject(sqlca)
dw_print_nc.settransobject(sqlca)
ddlb_base.enabled			= false
ddlb_serie.enabled		= false
em_numero.enabled		= false
ddlb_tipo_cob.enabled	= false
em_folio.enabled			= false
dw_nota_credito.visible	= false
st_6.visible					= false
cb_grabar.visible			= false
//ddplb_motivo.visible		= false
//st_7.visible					= false
dw_lista.height				= 1172
dw_destino.height			= 1172
ddlb_base.reset()
ddlb_tipo_cob.reset()
//ddplb_motivo.reset()
DECLARE	x1 CURSOR FOR  
SELECT 	"TIPO_CONTRATO"."CODIGO"  
FROM 	"TIPO_CONTRATO"  
USING	sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_base;
		if not isnull(ls_base) and ls_base<>'' then
			ddlb_base.additem(ls_base)
		end if
		setnull(ls_base)
	LOOP
	ddlb_serie.reset()
	em_numero.text			= ''
end if
close x1;
DECLARE	x2 CURSOR FOR  
SELECT 	"COD_PAGO"."TIPO_COB"  
FROM 	"COD_PAGO"  
ORDER BY "COD_PAGO"."TIPO_COB"  
USING	sqlca;
open x2;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x2 into :ls_tipo_cob;
		if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' then
			ddlb_tipo_cob.additem(ls_tipo_cob)
		end if
		setnull(ls_tipo_cob)
	LOOP
	em_folio.text			= ''
end if
close x2;

//DECLARE	x3 CURSOR FOR  
//SELECT 	"MOTIVO_NOTA_CREDITO"."CODIGO",	"MOTIVO_NOTA_CREDITO"."DESCRIPCION"
//FROM 	"MOTIVO_NOTA_CREDITO"  
//USING	sqlca;
//open x3;
//if sqlca.sqlcode=0 then
//	DO WHILE sqlca.sqlcode=0
//		fetch x3 into :ls_codigo_motivo, :ls_descrip_motivo;
//		if not isnull(ls_codigo_motivo) and ls_codigo_motivo<>'' then
//			ddplb_motivo.additem(ls_codigo_motivo+' - '+ls_descrip_motivo)
//		end if
//		setnull(ls_codigo_motivo)
//	LOOP
//end if
//close x3;

if is_opcion='A' then
	rb_comprobante.triggerevent(clicked!)
else
	rb_contrato.triggerevent(clicked!)
end if

end event

event close;Long		ll_folio,ll_grupo,ll_nulo
String		ls_rut_empresa,ls_nulo
datetime	ldt_nulo

if dw_nota_credito.rowcount() > 0 then
	Setnull(ll_nulo);Setnull(ls_nulo);Setnull(ldt_nulo)
	ll_folio						= dw_nota_credito.getitemnumber(1,'folio')
	if ll_folio > 0 then
		SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
		INTO 		:ls_rut_empresa
		FROM 	"MEMBRETE_EMPRESA"  
		WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :gl_cod_parque   ;
		
		SELECT	"ELECTRONICA_FB"."GRUPO"  
		INTO 		:ll_grupo  
		FROM 	"ELECTRONICA_FB"  
		WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
				  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND  
				  ( "ELECTRONICA_FB"."ESTADO" = 'P' )   ;
		if ll_grupo > 0 then
		//	ldt_fecha_pago				= datetime(date(st_fecha.text),time('00:00:00'))
			UPDATE		"ELECTRONICA_FB_DETALLE"  
			SET 			"FECHA_PAGO" = :ldt_nulo,   
							"RUT" = :ll_nulo,   
							"ESTADO_REG" = 'P',   
							"DV" = :ls_nulo,   
							"NOMBRE_CLIENTE" = :ls_nulo,   
							"USUARIO_CREA" = :ls_nulo,
							"BASE"  = :ls_nulo,
							"SERIE" = :ls_nulo,
							"NUMERO" = :ll_nulo
			WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo ) AND  
						  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
						  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :ll_folio ) AND  
						  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'B' )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
				messagebox("Error Limpiar BOLETA","Error al Limpiar BOLETA SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
end if
end event

type dw_print_nc from datawindow within w_ingresar_nota_de_credito_2_ult_resp
boolean visible = false
integer x = 137
integer y = 1996
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dw_impresion_nota_credito_ci"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within w_ingresar_nota_de_credito_2_ult_resp
boolean visible = false
integer x = 1175
integer y = 1208
integer width = 187
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Motivo"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddplb_motivo from dropdownpicturelistbox within w_ingresar_nota_de_credito_2_ult_resp
boolean visible = false
integer x = 1390
integer y = 1192
integer width = 1335
integer height = 352
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

event losefocus;dw_nota_credito.setfocus()
end event

type dw_detalle_factura from datawindow within w_ingresar_nota_de_credito_2_ult_resp
boolean visible = false
integer x = 2853
integer y = 464
integer width = 1221
integer height = 1028
string dragicon = "Hand!"
string title = "none"
string dataobject = "dw_ingresar_nota_de_credito_factura"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row_destino	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_destino, TRUE)
	this.Drag(Begin!)
end if
end event

event dragdrop;String	ls_tipo_cob,ls_tipo_mov,ls_tipo_cob_aux,ls_tipo_mov_aux,ls_base,ls_serie,&
			ls_tipo_cob_nc,ls_cod_otro
Long		ll_folio,ll_monto,ll_cuotas_pag,ll_tot_reg,ll_indi,ll_folio_aux,ll_monto_aux,&
			ll_cuotas_pag_aux,ll_new,ll_numero,ll_sw=0,ll_folio_nc
Datetime	ldt_fecha_pago,ldt_fecha_pago_aux
Datawindow control_dw

control_dw = DraggedObject()
if dw_lista.rowcount()>0 and il_row>0 then
	ls_tipo_cob		= dw_lista.getitemstring(il_row,'tipo_cob')
	ll_folio			= dw_lista.getitemnumber(il_row,'folio')
	ldt_fecha_pago	= dw_lista.getitemdatetime(il_row,'fecha_pago')
	ls_tipo_mov		= dw_lista.getitemstring(il_row,'tipo_mov')
	ll_monto			= dw_lista.getitemnumber(il_row,'monto')
	ll_cuotas_pag	= dw_lista.getitemnumber(il_row,'cuotas_pag')
	ls_base			= dw_lista.getitemstring(il_row,'base')
	ls_serie			= dw_lista.getitemstring(il_row,'serie')
	ll_numero		= dw_lista.getitemnumber(il_row,'contrato')
	ls_cod_otro		= dw_lista.getitemstring(il_row,'codigo_otro')
	SELECT	"NOTA_DE_CREDITO"."TIPO_COB_ORIGINAL",   
				"NOTA_DE_CREDITO"."FOLIO_ORIGINAL"  
	INTO 		:ls_tipo_cob_nc,   
				:ll_folio_nc  
	FROM 		"NOTA_DE_CREDITO"  
	WHERE  ( "NOTA_DE_CREDITO"."TIPO_COB" = :ls_tipo_cob ) AND  
			 ( "NOTA_DE_CREDITO"."FOLIO" = :ll_folio ) AND  
			 ( "NOTA_DE_CREDITO"."TIPO_MOV" = :ls_tipo_mov ) AND  
			 ( "NOTA_DE_CREDITO"."ESTADO" = 'A' )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		messagebox("Advertencia","Movimiento ya está Asignado a la Nota de Crédito Nº "+ls_tipo_cob_nc+'-'+string(ll_folio_nc,"###,###,###,###,###"))
	elseif sqlca.sqlcode=100 then
		ll_tot_reg		= dw_destino.rowcount()
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ls_tipo_cob_aux		= dw_destino.getitemstring(ll_indi,'tipo_cob')
				ll_folio_aux			= dw_destino.getitemnumber(ll_indi,'folio')
				ldt_fecha_pago_aux	= dw_destino.getitemdatetime(ll_indi,'fecha_pago')
				ls_tipo_mov_aux		= dw_destino.getitemstring(ll_indi,'tipo_mov')
				ll_monto_aux			= dw_destino.getitemnumber(ll_indi,'monto')
				ll_cuotas_pag_aux		= dw_destino.getitemnumber(ll_indi,'cuotas_pag')
				if ls_tipo_cob=ls_tipo_cob_aux and ll_folio=ll_folio_aux and ldt_fecha_pago=ldt_fecha_pago_aux and &
					ls_tipo_mov=ls_tipo_mov_aux and ll_monto=ll_monto_aux and ll_cuotas_pag=ll_cuotas_pag_aux then
					messagebox("Advertencia","Movimiento ya Asignado")
					ll_sw ++
					exit;
				end if
			next
			if ll_sw=0 then
				ll_tot_reg		= dw_lista.rowcount()
				for ll_indi=1 to ll_tot_reg
					ls_tipo_cob_aux		= dw_lista.getitemstring(ll_indi,'tipo_cob')
					ll_folio_aux			= dw_lista.getitemnumber(ll_indi,'folio')
					if ls_tipo_cob_aux=ls_tipo_cob and ll_folio_aux=ll_folio then
						ldt_fecha_pago		= dw_lista.getitemdatetime(ll_indi,'fecha_pago')
						ls_tipo_mov			= dw_lista.getitemstring(ll_indi,'tipo_mov')
						ll_monto				= dw_lista.getitemnumber(ll_indi,'monto')
						ll_cuotas_pag		= dw_lista.getitemnumber(ll_indi,'cuotas_pag')
						ls_base				= dw_lista.getitemstring(ll_indi,'base')
						ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
						ll_numero			= dw_lista.getitemnumber(ll_indi,'contrato')
						ls_cod_otro			= dw_lista.getitemstring(ll_indi,'codigo_otro')
						if isnull(ls_cod_otro) or ls_cod_otro='' then ls_cod_otro='0'
						ll_new				= dw_destino.insertrow(0)
						dw_destino.scrolltorow(ll_new)
						dw_destino.Setitem(ll_new,'tipo_cob',ls_tipo_cob)
						dw_destino.Setitem(ll_new,'folio',ll_folio)
						dw_destino.Setitem(ll_new,'fecha_pago',ldt_fecha_pago)
						dw_destino.Setitem(ll_new,'tipo_mov',ls_tipo_mov)
						dw_destino.Setitem(ll_new,'monto',ll_monto)
						dw_destino.Setitem(ll_new,'cuotas_pag',ll_cuotas_pag)
						dw_destino.Setitem(ll_new,'base',ls_base)
						dw_destino.Setitem(ll_new,'serie',ls_serie)
						dw_destino.Setitem(ll_new,'numero',ll_numero)
						dw_destino.Setitem(ll_new,'codigo_otro',ls_cod_otro)
						dw_destino.Setitem(ll_new,'estado','I')
//						dw_destino.Setitem(ll_new,'estado','A')
						dw_destino.accepttext()
					end if
				next
			end if
		else
			ll_tot_reg					= dw_lista.rowcount()
			for ll_indi=1 to ll_tot_reg
				ls_tipo_cob_aux		= dw_lista.getitemstring(ll_indi,'tipo_cob')
				ll_folio_aux			= dw_lista.getitemnumber(ll_indi,'folio')
				if ls_tipo_cob_aux=ls_tipo_cob and ll_folio_aux=ll_folio then
					ldt_fecha_pago		= dw_lista.getitemdatetime(ll_indi,'fecha_pago')
					ls_tipo_mov			= dw_lista.getitemstring(ll_indi,'tipo_mov')
					ll_monto				= dw_lista.getitemnumber(ll_indi,'monto')
					ll_cuotas_pag		= dw_lista.getitemnumber(ll_indi,'cuotas_pag')
					ls_base				= dw_lista.getitemstring(ll_indi,'base')
					ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
					ll_numero			= dw_lista.getitemnumber(ll_indi,'contrato')
					ls_cod_otro			= dw_lista.getitemstring(ll_indi,'codigo_otro')
					if isnull(ls_cod_otro) or ls_cod_otro='' then ls_cod_otro='0'
					ll_new				= dw_destino.insertrow(0)
					dw_destino.scrolltorow(ll_new)
					dw_destino.Setitem(ll_new,'tipo_cob',ls_tipo_cob)
					dw_destino.Setitem(ll_new,'folio',ll_folio)
					dw_destino.Setitem(ll_new,'fecha_pago',ldt_fecha_pago)
					dw_destino.Setitem(ll_new,'tipo_mov',ls_tipo_mov)
					dw_destino.Setitem(ll_new,'monto',ll_monto)
					dw_destino.Setitem(ll_new,'cuotas_pag',ll_cuotas_pag)
					dw_destino.Setitem(ll_new,'base',ls_base)
					dw_destino.Setitem(ll_new,'serie',ls_serie)
					dw_destino.Setitem(ll_new,'numero',ll_numero)
					dw_destino.Setitem(ll_new,'codigo_otro',ls_cod_otro)
					dw_destino.Setitem(ll_new,'estado','I')
//					dw_destino.Setitem(ll_new,'estado','A')
					dw_destino.accepttext()
				end if
			next
		end if
	end if
	setnull(il_row)
end if
end event

type sle_1 from uo_convierte_numero within w_ingresar_nota_de_credito_2_ult_resp
boolean visible = false
integer x = 1778
integer y = 1980
integer width = 494
integer taborder = 0
boolean hideselection = false
end type

type dw_factura from datawindow within w_ingresar_nota_de_credito_2_ult_resp
boolean visible = false
integer x = 992
integer y = 1960
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dwe_factura_electronica_envio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_ctacte from commandbutton within w_ingresar_nota_de_credito_2_ult_resp
integer x = 1353
integer y = 1700
integer width = 430
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.visible=true then
	if dw_lista.rowcount()>0 then
		gs_base		= dw_lista.getitemstring(dw_lista.getrow(),'base')
		gs_serie		= dw_lista.getitemstring(dw_lista.getrow(),'serie')
		gi_numero	= dw_lista.getitemnumber(dw_lista.getrow(),'contrato')
		IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
			CHOOSE CASE gs_base
				CASE "O" // Oferta
					if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
					Open(w_cuenta_corriente_oferta)
				CASE "L" // Anexo Liberador
					if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
					Open(w_cuenta_corriente_liberador)
				CASE "F","G"
					if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
					open(w_cuenta_corriente_funeraria) 
				CASE "P" // Pagaré
					if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
					Open(w_cuenta_corriente_pagare)
				CASE "C" // Contrato ISA	
					if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
					Open(w_cuenta_corriente_contrato_isa)
				CASE "D" // Derecho
					if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
					Open(w_cuenta_corriente_derecho)
				CASE "R" // Derecho
					if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
					Open(w_cuenta_corriente_repactar_cta_mant)
				CASE "A" // Aumento Capacidad
					if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
					Open(w_cuenta_corriente_aumento_capacidad)
			END CHOOSE
		else
			messagebox("Advertencia","Debe Seleccionar Contrato")
		END IF
	end if
else
	messagebox("Adveretencia","Debe Seleccionar Contrato en Lista de Detalle")
end if
end event

type cb_limpiar from commandbutton within w_ingresar_nota_de_credito_2_ult_resp
integer x = 1874
integer y = 1700
integer width = 270
integer height = 96
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;String		ls_base,ls_tipo_cob,ls_nulo,ls_rut_empresa,ls_codigo_motivo, ls_descrip_motivo
Long		ll_grupo,ll_nulo,ll_folio
datetime	ldt_fecha_pago,ldt_nulo

dw_lista.reset()
dw_destino.reset()
dw_detalle_factura.reset()
ddlb_base.reset()
ddlb_tipo_cob.reset()
//ddplb_motivo.reset()
dw_lista.height				= 1172
dw_destino.height			= 1172
DECLARE	x1 CURSOR FOR  
SELECT 	"TIPO_CONTRATO"."CODIGO"  
FROM 	"TIPO_CONTRATO"  
USING	sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_base;
		if not isnull(ls_base) and ls_base<>'' then
			ddlb_base.additem(ls_base)
		end if
		setnull(ls_base)
	LOOP
	ddlb_serie.reset()
	em_numero.text			= ''
end if
close x1;
DECLARE	x2 CURSOR FOR  
SELECT 	"COD_PAGO"."TIPO_COB"  
FROM 	"COD_PAGO"  
ORDER BY "COD_PAGO"."TIPO_COB"  
USING	sqlca;
open x2;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x2 into :ls_tipo_cob;
		if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' then
			ddlb_tipo_cob.additem(ls_tipo_cob)
		end if
		setnull(ls_tipo_cob)
	LOOP
	em_folio.text				= ''
end if
close x2;
//DECLARE	x3 CURSOR FOR  
//SELECT 	"MOTIVO_NOTA_CREDITO"."CODIGO",	"MOTIVO_NOTA_CREDITO"."DESCRIPCION"
//FROM 	"MOTIVO_NOTA_CREDITO"  
//USING	sqlca;
//open x3;
//if sqlca.sqlcode=0 then
//	DO WHILE sqlca.sqlcode=0
//		fetch x3 into :ls_codigo_motivo, :ls_descrip_motivo;
//		if not isnull(ls_codigo_motivo) and ls_codigo_motivo<>'' then
//			ddplb_motivo.additem(ls_codigo_motivo+' - '+ls_descrip_motivo)
//		end if
//		setnull(ls_codigo_motivo)
//	LOOP
//end if
//close x3;
Setnull(ll_nulo);Setnull(ldt_nulo);Setnull(ls_nulo)
if dw_nota_credito.rowcount() > 0 then
	ll_folio						= dw_nota_credito.getitemnumber(1,'folio')
	if ll_folio > 0 then
		SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
		INTO 		:ls_rut_empresa
		FROM 	"MEMBRETE_EMPRESA"  
		WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :gl_cod_parque   ;
		
		SELECT	"ELECTRONICA_FB"."GRUPO"  
		INTO 		:ll_grupo  
		FROM 	"ELECTRONICA_FB"  
		WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
				  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND  
				  ( "ELECTRONICA_FB"."ESTADO" = 'P' )   ;
		if ll_grupo > 0 then
		//	ldt_fecha_pago				= datetime(date(st_fecha.text),time('00:00:00'))
			UPDATE		"ELECTRONICA_FB_DETALLE"  
			SET 			"FECHA_PAGO" = :ldt_nulo,   
							"RUT" = :ll_nulo,   
							"ESTADO_REG" = 'P',   
							"DV" = :ls_nulo,   
							"NOMBRE_CLIENTE" = :ls_nulo,   
							"USUARIO_CREA" = :ls_nulo,
							"BASE"  = :ls_nulo,
							"SERIE" = :ls_nulo,
							"NUMERO" = :ll_nulo
			WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo ) AND  
						  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
						  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :ll_folio ) AND  
						  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'B' )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
				messagebox("Error Limpiar BOLETA","Error al Limpiar BOLETA SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
end if
dw_nota_credito.reset()
Setnull(gl_cod_parque);Setnull(gs_tipo_cobro);Setnull(ls_rut_empresa)
ddlb_base.enabled				= false
ddlb_serie.enabled			= false
em_numero.enabled			= false
ddlb_tipo_cob.enabled		= false
em_folio.enabled				= false
dw_nota_credito.visible		= false
st_6.visible						= false
cb_grabar.visible				= false
//st_7.visible					= false
//ddplb_motivo.visible			= false
w_ingresar_nota_de_credito_2.triggerevent(open!)
rb_contrato.checked			= true
rb_comprobante.checked	= false
rb_contrato.triggerevent(clicked!)
end event

type cb_grabar from commandbutton within w_ingresar_nota_de_credito_2_ult_resp
integer x = 823
integer y = 1700
integer width = 443
integer height = 92
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar N.C."
end type

event clicked;Long		ll_folio,ll_monto,ll_ctas_pag,ll_sum,ll_graba1=0,ll_graba2=0,ll_graba3=0,ll_graba4=0,ll_graba5=0,ll_suma_total,ll_tot_reg,ll_indi,ll_folio_mod,ll_monto_mod,ll_cuotas_pag,ll_numero,ll_count_reg_pie,&
			ll_sw=0,ll_sumar_cuotas_mant=0,ll_sumar_cuotas_cred=0,ll_total_pagado,ll_ctas_pag_s,ll_count_a,ll_ctas_pag_m,ll_ctas_cred,ll_ctas_mant,ll_resta_monto,ll_folio_nc,ll_sumar_monto_mant,ll_update_a,&
			ll_sumar_monto_cred,ll_total_pagado_m,ll_monto_cred,ll_monto_mant,ll_total_pie_pagado,ll_cuotas_pag_pie,ll_ultimo_folio,ll_monto_pie_ingreso,ll_total_pagado_nc_pie,ll_cod_parque,ll_count_reg,&
			ll_suma_total_nc,ll_ok_boleta
Datetime	ldt_fecha_pago,ldt_fecha_pago_mod,ldt_pago
String		ls_tipo_cob,ls_tipo_mov,ls_base,ls_serie,ls_tipo_nc,ls_tipo_motivo,ls_rut_empresa,ls_rezago,ls_monto_palabra

dw_nota_credito.accepttext()
if dw_nota_credito.rowcount() > 0 then
	ll_folio			= dw_nota_credito.getitemnumber(1,'folio')
	ll_monto			= dw_nota_credito.getitemnumber(1,'monto')
	ldt_fecha_pago	= dw_nota_credito.getitemdatetime(1,'fecha_pago')
	ll_ctas_pag		= dw_nota_credito.getitemnumber(1,'cuotas_pag')
	ll_suma_total	= dw_destino.getitemnumber(1,'suma_total')
	ls_rezago		= dw_nota_credito.getitemString(1,'rezago')
//	ls_tipo_motivo	= mid(ddplb_motivo.text,1,1)
	if ll_folio=0 or isnull(ll_folio) then
		messagebox("Advertencia","Falta Ingresar FOLIO")
		dw_nota_credito.setfocus()
		dw_nota_credito.setcolumn('folio')
	elseif ll_monto=0 or isnull(ll_monto) then
		messagebox("Advertencia","Falta Ingresar MONTO")
		dw_nota_credito.setfocus()
		dw_nota_credito.setcolumn('monto')
	elseif isnull(ldt_fecha_pago) then
		messagebox("Advertencia","Falta Ingresar FECHA DE PAGO")
		dw_nota_credito.setfocus()
		dw_nota_credito.setcolumn('fecha_pago')
	elseif ll_monto<>ll_suma_total then
		messagebox("Advertencia","MONTO Ingresado es Distinto a la Suma de los Movimientos")
		dw_nota_credito.setfocus()
		dw_nota_credito.setcolumn('monto')
//	elseif isnull(ls_tipo_motivo) or ls_tipo_motivo='' then
//		messagebox("Advertencia","Falta Ingresar Motivo, Por que se Genera Nota de Crédito")
//		ddplb_motivo.setfocus()
	else
		ls_tipo_cob				= dw_destino.getitemstring(1,'tipo_cob')
		ll_folio_mod				= dw_destino.getitemnumber(1,'folio')
		ldt_fecha_pago_mod	= dw_destino.getitemdatetime(1,'fecha_pago')
		if isnull(dw_nota_credito.getitemstring(1,'codigo_otro')) then
			dw_nota_credito.setitem(1,'codigo_otro','0')
		else
			if ls_tipo_cob='BA' or ls_tipo_cob='FA' then
				dw_nota_credito.setitem(1,'codigo_otro','NC-BA')
			else
				dw_nota_credito.setitem(1,'codigo_otro','0')
			end if
		end if
		if gs_tipo_cobro = 'NE' then
			DECLARE sp_proc_be PROCEDURE FOR F_XML_DTEBOX_NE(:gs_tipo_cobro, :il_max_folio_new, :gd_hoy, :gs_caja, :gi_rut, :ls_tipo_cob, :ll_folio_mod, :ldt_fecha_pago_mod);
			EXECUTE sp_proc_be;
			FETCH sp_proc_be into :ll_ok_boleta ;
			if ll_ok_boleta > 0 then
				dw_nota_credito.setitem(1,'folio',ll_ok_boleta)
				dw_nota_credito.accepttext()
				ll_graba1					= dw_nota_credito.update()
			end if
		else
			dw_nota_credito.accepttext()
			ll_graba1						= dw_nota_credito.update()
		end if
		ll_tot_reg						= dw_destino.rowcount()
		if ll_tot_reg>0 and ll_graba1=1 then
			ls_tipo_nc					= dw_nota_credito.getitemstring(1,'tipo_cob')
			ll_folio_nc					= dw_nota_credito.getitemnumber(1,'folio')
			for ll_indi=1 to ll_tot_reg
				dw_destino.Setitem(ll_indi,'tipo_cob_original',ls_tipo_nc)
				dw_destino.Setitem(ll_indi,'folio_original',ll_folio_nc)
		//		dw_destino.Setitem(ll_indi,'codigo_motivo',ls_tipo_motivo)
				ls_tipo_cob				= dw_destino.getitemstring(ll_indi,'tipo_cob')
				ll_folio_mod				= dw_destino.getitemnumber(ll_indi,'folio')
				ldt_fecha_pago_mod	= dw_destino.getitemdatetime(ll_indi,'fecha_pago')
				ls_tipo_mov				= dw_destino.getitemstring(ll_indi,'tipo_mov')
				ll_monto_mod			= dw_destino.getitemnumber(ll_indi,'monto')
				ll_cuotas_pag			= dw_destino.getitemnumber(ll_indi,'cuotas_pag')
				ll_numero				= dw_destino.getitemnumber(ll_indi,'numero')
				ls_base					= dw_destino.getitemstring(ll_indi,'base')
				ls_serie					= dw_destino.getitemstring(ll_indi,'serie')
//				if ls_tipo_mov='E' then
//					ll_sum				= ll_sum + ll_ctas_pag
//				end if
				if ls_base='B' then
					UPDATE	"FACTURAS_INGRESO"  
					SET 		"PAGO_HIST" = 'N'  
					WHERE  ( "FACTURAS_INGRESO"."FOLIO" = :ll_folio_mod ) AND   
							 ( "FACTURAS_INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
							 ( "FACTURAS_INGRESO"."FECHA_PAGO" = :ldt_fecha_pago_mod ) AND  
							 ( "FACTURAS_INGRESO"."TIPO_MOV" = :ls_tipo_mov ) AND  
							 ( "FACTURAS_INGRESO"."CONTRATO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then	ll_sw ++
				else
					
					UPDATE	"INGRESO"  
					SET 		"PAGO_HIST" = 'N'  
					WHERE  ( "INGRESO"."FOLIO" = :ll_folio_mod ) AND  
							 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
							 ( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago_mod ) AND  
							 ( "INGRESO"."TIPO_MOV" = :ls_tipo_mov ) AND  
							 ( "INGRESO"."CONTRATO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						UPDATE	"INGRE"  
						SET 		"PAGO_HIST" = 'N'  
						WHERE  ( "INGRE"."FOLIO" = :ll_folio_mod ) AND  
								 ( "INGRE"."TIPO_COB" = :ls_tipo_cob ) AND  
								 ( "INGRE"."FECHA_PAGO" = :ldt_fecha_pago_mod ) AND  
								 ( "INGRE"."TIPO_MOV" = :ls_tipo_mov ) AND  
								 ( "INGRE"."CONTRATO" = :ll_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then	ll_sw ++
					end if
					if ls_tipo_mov='A' or ls_tipo_mov='Q' then
						SELECT 	Count("DETALLE_PAGO_PIE"."BASE")
						INTO 		:ll_count_reg_pie  
						FROM 	"DETALLE_PAGO_PIE"  
						WHERE 	( "DETALLE_PAGO_PIE"."TIPO_COB" = :ls_tipo_cob ) AND  
									( "DETALLE_PAGO_PIE"."FOLIO" = :ll_folio_mod ) AND  
									( "DETALLE_PAGO_PIE"."FECHA_PAGO" = :ldt_fecha_pago_mod ) AND  
									( "DETALLE_PAGO_PIE"."MONTO_PIE_PAGADO_PESO" = :ll_monto_mod ) AND
									( "DETALLE_PAGO_PIE"."ESTADO" = 'C' )
						USING	sqlca;
						if ll_count_reg_pie > 0 then
							ll_count_a ++
							UPDATE 	"DETALLE_PAGO_PIE"  
							SET 		"ESTADO" = 'P',   
										"TIPO_COB" = null,   
										"FOLIO" = null,   
										"CAJA" = null,   
										"USUARIO" = null,   
										"FECHA_PAGO" = null,   
										"MONTO_PIE_PAGADO_PESO" = null,   
										"MONTO_PIE_PAGADO_UF" = null  
							WHERE 	( "DETALLE_PAGO_PIE"."TIPO_COB" = :ls_tipo_cob ) AND  
										( "DETALLE_PAGO_PIE"."FOLIO" = :ll_folio_mod ) AND  
										( "DETALLE_PAGO_PIE"."FECHA_PAGO" = :ldt_fecha_pago_mod ) AND  
										( "DETALLE_PAGO_PIE"."MONTO_PIE_PAGADO_PESO" = :ll_monto_mod )  AND
										( "DETALLE_PAGO_PIE"."ESTADO" = 'C' )
							USING	sqlca;
							if sqlca.sqlcode=0 then
								ll_update_a ++
								CHOOSE CASE ls_base
									CASE "O"
										SELECT	"OFERTA_V"."ULT_FOLIO",   
													"PAGO_OFERTA"."CTAS_PAGADAS_PIE",
													"PAGO_OFERTA"."PIE_PAGADO"
										INTO 		:ll_ultimo_folio,   
													:ll_cuotas_pag_pie,
													:ll_total_pie_pagado
										FROM 	"OFERTA_V",   
													"PAGO_OFERTA",   
													"CADENA"  
										WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
												 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
												 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
												 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
												 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
												 (("CADENA"."CODIGO" = 'O' ) AND  
												 ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )   
										Using		sqlca;
										
										if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
										if isnull(ll_cuotas_pag_pie) then ll_cuotas_pag_pie=0
										if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
										
										ll_total_pie_pagado		= ll_total_pie_pagado - ll_monto_mod
										if ll_cuotas_pag_pie > 0 then
											ll_cuotas_pag_pie			= ll_cuotas_pag_pie - 1
										end if
										UPDATE	"PAGO_OFERTA"  
										SET 		"PIE_PAGADO" = :ll_total_pie_pagado,
													"CTAS_PAGADAS_PIE" = :ll_cuotas_pag_pie
										WHERE  ( "PAGO_OFERTA"."SERIE" = :ls_serie ) AND  
												 ( "PAGO_OFERTA"."NRO_OFERTA" = :ll_numero ) AND  
												 ( "PAGO_OFERTA"."FOLIO" = :ll_ultimo_folio )
										USING		sqlca;
										
									CASE "L"
										SELECT	"ANEXO_LIBERADOR"."ULT_FOLIO",
													"PAGO_LIBERADOR"."CTAS_PAGADAS_PIE",
													"PAGO_LIBERADOR"."PIE_PAGADO"
										INTO 		:ll_ultimo_folio,
													:ll_cuotas_pag_pie,
													:ll_total_pie_pagado
										FROM 	"ANEXO_LIBERADOR",
													"PAGO_LIBERADOR",
													"CADENA" 
										WHERE  	 ("ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
													 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
													 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
													 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
													 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
													 (("CADENA"."CODIGO" = 'L' ) AND
													 ( "PAGO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
												 	 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero ));
										if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
										if isnull(ll_cuotas_pag_pie) then ll_cuotas_pag_pie=0
										if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
										
										ll_total_pie_pagado		= ll_total_pie_pagado - ll_monto_mod
										ll_cuotas_pag_pie			= ll_cuotas_pag_pie - 1
										UPDATE	"PAGO_LIBERADOR"  
										SET 		"PIE_PAGADO" = :ll_total_pie_pagado,
													"CTAS_PAGADAS_PIE" = :ll_cuotas_pag_pie
										WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
												 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero ) AND  
												 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ultimo_folio )
										USING		sqlca;
									CASE "A"	
										SELECT	"ANEXO_AUMENTO"."ULT_FOLIO",
													"PAGO_AUMENTO"."CTAS_PAGADAS_PIE",
													"PAGO_AUMENTO"."PIE_PAGADO"
										INTO 		:ll_ultimo_folio,
													:ll_cuotas_pag_pie,
													:ll_total_pie_pagado
										FROM 	"ANEXO_AUMENTO",
													"PAGO_AUMENTO",
													"CADENA" 
										WHERE  	 ("ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
													 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
													 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
													 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
													 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
													 (("CADENA"."CODIGO" = 'A' ) AND
													 ( "PAGO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
												 	 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :ll_numero ));
										if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
										if isnull(ll_cuotas_pag_pie) then ll_cuotas_pag_pie=0
										if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
								
										ll_total_pie_pagado		= ll_total_pie_pagado - ll_monto_mod
										ll_cuotas_pag_pie			= ll_cuotas_pag_pie - 1
										UPDATE	"PAGO_AUMENTO"  
										SET 		"PIE_PAGADO" = :ll_total_pie_pagado,
													"CTAS_PAGADAS_PIE" = :ll_cuotas_pag_pie
										WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
												 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :ll_numero ) AND  
												 ( "PAGO_AUMENTO"."FOLIO" = :ll_ultimo_folio )
										USING		sqlca;
								END CHOOSE	
							end if
						else
							//
							CHOOSE CASE ls_base
									CASE "O"
										SELECT "INGRESO"."MONTO"  
										INTO 		:ll_monto_pie_ingreso  
										FROM 	"INGRESO"  
										WHERE  	( "INGRESO"."FOLIO" = :ll_folio_mod ) AND  
											 		( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
													( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago_mod ) AND  
													( "INGRESO"."TIPO_MOV" = :ls_tipo_mov ) AND  
													( "INGRESO"."CONTRATO" = :ll_numero ) 
										USING	sqlca;
										
										SELECT	"OFERTA_V"."TOT_PAGADO",
													"OFERTA_V"."ULT_FOLIO",   
													"PAGO_OFERTA"."PIE_PAGADO"
										INTO 		:ll_total_pagado_nc_pie,   
													:ll_ultimo_folio,   
													:ll_total_pie_pagado
										FROM 	"OFERTA_V",   
													"PAGO_OFERTA",   
													"CADENA"  
										WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
												 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
												 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
												 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
												 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
												 (("CADENA"."CODIGO" = 'O' ) AND  
												 ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )   
										Using		sqlca;
										
										if isnull(ll_total_pagado_nc_pie) then ll_total_pagado_nc_pie=0
										if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
									
										if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
										if (ll_monto_pie_ingreso = ll_total_pie_pagado) and ll_monto_pie_ingreso > 0  then
											ll_total_pie_pagado		= ll_total_pie_pagado - ll_monto_mod
											ll_total_pagado_nc_pie	= ll_total_pagado_nc_pie - ll_monto_mod
											
											UPDATE	"PAGO_OFERTA"  
											SET 		"PIE_PAGADO" = :ll_total_pie_pagado
											WHERE  ( "PAGO_OFERTA"."SERIE" = :ls_serie ) AND  
													 	( "PAGO_OFERTA"."NRO_OFERTA" = :ll_numero ) AND  
													 	( "PAGO_OFERTA"."FOLIO" = :ll_ultimo_folio )
											USING	sqlca;
											
											UPDATE	"OFERTA_V"  
											SET		"TOT_PAGADO" = :ll_total_pagado_nc_pie
											WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
													 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
											USING		sqlca;
										end if
									CASE "L"		
										SELECT "INGRESO"."MONTO"  
										INTO 		:ll_monto_pie_ingreso  
										FROM 	"INGRESO"  
										WHERE  	( "INGRESO"."FOLIO" = :ll_folio_mod ) AND  
											 		( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
													( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago_mod ) AND  
													( "INGRESO"."TIPO_MOV" = :ls_tipo_mov ) AND  
													( "INGRESO"."CONTRATO" = :ll_numero ) 
										USING	sqlca;
										
										SELECT	"ANEXO_LIBERADOR"."ULT_FOLIO",
													"PAGO_LIBERADOR"."CTAS_PAGADAS_PIE",
													"PAGO_LIBERADOR"."PIE_PAGADO"
										INTO 		:ll_total_pagado_nc_pie,   
													:ll_ultimo_folio,   
													:ll_total_pie_pagado
										FROM 	"ANEXO_LIBERADOR",
													"PAGO_LIBERADOR",
													"CADENA" 
										WHERE  	 ("ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
													 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
													 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
													 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
													 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
													 (("CADENA"."CODIGO" = 'L' ) AND
													 ( "PAGO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
												 	 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero ))
										Using		sqlca;
										if isnull(ll_total_pagado_nc_pie) then ll_total_pagado_nc_pie=0
										if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
									
										if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
										if (ll_monto_pie_ingreso = ll_total_pie_pagado) and ll_monto_pie_ingreso > 0  then
											ll_total_pie_pagado		= ll_total_pie_pagado - ll_monto_mod
											ll_total_pagado_nc_pie	= ll_total_pagado_nc_pie - ll_monto_mod
											
											UPDATE	"PAGO_LIBERADOR"  
											SET 		"PIE_PAGADO" = :ll_total_pie_pagado
											WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
													 	( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero ) AND  
													 	( "PAGO_LIBERADOR"."FOLIO" = :ll_ultimo_folio )
											USING	sqlca;
											
											
											UPDATE	"ANEXO_LIBERADOR"  
											SET		"TOT_PAGADO" = :ll_total_pagado_nc_pie
											WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
													 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero )   
											USING		sqlca;
										end if
									CASE "A"
										SELECT "INGRESO"."MONTO"  
										INTO 		:ll_monto_pie_ingreso  
										FROM 	"INGRESO"  
										WHERE  	( "INGRESO"."FOLIO" = :ll_folio_mod ) AND  
											 		( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
													( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago_mod ) AND  
													( "INGRESO"."TIPO_MOV" = :ls_tipo_mov ) AND  
													( "INGRESO"."CONTRATO" = :ll_numero ) 
										USING	sqlca;
										
										SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",
													"ANEXO_AUMENTO"."ULT_FOLIO",   
													"PAGO_AUMENTO"."PIE_PAGADO"
										INTO 		:ll_total_pagado_nc_pie,   
													:ll_ultimo_folio,   
													:ll_total_pie_pagado
										FROM 	"ANEXO_AUMENTO",   
													"PAGO_AUMENTO",   
													"CADENA"
										WHERE  	 ("ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
													 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
													 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
													 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
													 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
													 (("CADENA"."CODIGO" = 'A' ) AND
													 ( "PAGO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
												 	 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :ll_numero ))
										Using		sqlca;
										
										if isnull(ll_total_pagado_nc_pie) then ll_total_pagado_nc_pie=0
										if isnull(ll_ultimo_folio) then ll_ultimo_folio=0
									
										if isnull(ll_total_pie_pagado) then ll_total_pie_pagado=0
										if (ll_monto_pie_ingreso = ll_total_pie_pagado) and ll_monto_pie_ingreso > 0  then
											ll_total_pie_pagado		= ll_total_pie_pagado - ll_monto_mod
											ll_total_pagado_nc_pie	= ll_total_pagado_nc_pie - ll_monto_mod
											
											UPDATE	"PAGO_AUMENTO"  
											SET 		"PIE_PAGADO" = :ll_total_pie_pagado
											WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
													 	( "PAGO_AUMENTO"."NRO_AUMENTO" = :ll_numero ) AND  
													 	( "PAGO_AUMENTO"."FOLIO" = :ll_ultimo_folio )
											USING	sqlca;
											
											UPDATE	"ANEXO_AUMENTO"  
											SET		"TOT_PAGADO" = :ll_total_pagado_nc_pie
											WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
													 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ll_numero )   
											USING		sqlca;
									
										end if
							END CHOOSE
						//
						end if
					end if
				end if
			next
			if ll_sw=ll_tot_reg then ll_graba2=1
			if ll_count_a=ll_update_a then ll_graba5=1
			ll_sumar_cuotas_cred			= 0
			ll_sumar_cuotas_mant		= 0
			for ll_indi=1 to ll_tot_reg
				ll_cuotas_pag				= 0
				ls_tipo_mov					= dw_destino.getitemstring(ll_indi,'tipo_mov')
				if ls_tipo_mov<>'L' and ls_tipo_mov<>'M' then
					ll_monto_mod			= dw_destino.getitemnumber(ll_indi,'monto')
					ls_base					= dw_destino.getitemstring(ll_indi,'base')
					ls_serie					= dw_destino.getitemstring(ll_indi,'serie')
					ll_numero				= dw_destino.getitemnumber(ll_indi,'numero')
					ll_cuotas_pag			= dw_destino.getitemnumber(ll_indi,'cuotas_pag')
					if (is_nota_credito='NE' and ls_tipo_mov='E') or (is_nota_credito='NE' and ls_tipo_mov='A') or (is_nota_credito='NE' and ls_tipo_mov='Q')  or  &
						(is_nota_credito='NE' and ls_tipo_mov='K') or (is_nota_credito='NE' and ls_tipo_mov='E' and ls_base='R') or (is_nota_credito='NE' and ls_tipo_mov='U') then
						ll_sumar_cuotas_cred 	= ll_sumar_cuotas_cred + ll_cuotas_pag
						ll_sumar_monto_cred		= ll_sumar_monto_cred + ll_monto_mod
					end if
					if (is_nota_credito='NE' and ls_tipo_mov='F') then
						ll_sumar_cuotas_mant 	= ll_sumar_cuotas_mant + ll_cuotas_pag
						ll_sumar_monto_mant	= ll_sumar_monto_mant + ll_monto_mod
					end if
//					if (is_nota_credito='NC' and ls_tipo_mov='F') then
//						ll_sumar_cuotas_mant 	= ll_sumar_cuotas_mant + ll_cuotas_pag
//						ll_sumar_monto_mant	= ll_sumar_monto_mant + ll_monto_mod
//					end if
				end if
			next
			if isnull(ll_sumar_cuotas_cred) then ll_sumar_cuotas_cred=0
			if isnull(ll_sumar_cuotas_mant) then ll_sumar_cuotas_mant=0
			if isnull(ll_sumar_monto_cred) then ll_sumar_monto_cred=0
			if isnull(ll_sumar_monto_mant) then ll_sumar_monto_mant=0
			if (ll_sumar_monto_mant + ll_sumar_monto_cred) = 0 then ll_suma_total=0
//			dw_nota_credito.setitem(1,'cuotas_pag',(ll_sumar_cuotas_cred + ll_sumar_cuotas_mant))
			dw_nota_credito.accepttext()
			if rb_contrato.checked=true then
				if rb_contrato.checked=true then
					ls_base		= trim(ddlb_base.text)
					ls_serie		= trim(ddlb_serie.text)
					ll_numero	= Double(em_numero.text)
				else
					ls_base		= gs_base
					ls_serie		= gs_serie
					ll_numero	= gi_numero
				end if
				CHOOSE CASE ls_base
					CASE 'O'
						SELECT	"OFERTA_V"."TOT_PAGADO",  
									"OFERTA_V"."TOT_PAGADO_M",  
									"OFERTA_V"."CTA_PAG_S",   
									"OFERTA_V"."CTA_PAG_M"  
						INTO 		:ll_total_pagado,   
									:ll_total_pagado_m,
									:ll_ctas_pag_s,   
									:ll_ctas_pag_m  
						FROM 	"OFERTA_V",   
									"PAGO_OFERTA"  
						WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								 (("OFERTA_V"."SERIE" = :ls_serie ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )   
						USING		sqlca;
						if ll_total_pagado < ll_sumar_monto_cred then ll_total_pagado = ll_sumar_monto_cred
						if ll_total_pagado_m < ll_sumar_monto_mant then ll_total_pagado_m = ll_sumar_monto_mant
						if ll_total_pagado>0 or ll_total_pagado_m>0 then
							if ll_suma_total=0 then
								ll_graba3 				= 1
							else
								if ll_sumar_monto_cred > ll_total_pagado or ll_sumar_monto_mant > ll_total_pagado_m then
									messagebox("Advertencia","Error no es posible ingresar Nota de Crédito, el monto es mayor al Total Pagado del Contrato")
								else
									if ll_sumar_cuotas_cred > 0 then 
										ll_ctas_cred 	= ll_ctas_pag_s - ll_sumar_cuotas_cred
										ll_monto_cred	= ll_total_pagado - ll_sumar_monto_cred
										if ll_ctas_cred<=0 then 
											ll_ctas_cred		= 0
											ll_monto_cred	= 0
										end if
										if ll_monto_cred<=0 then ll_monto_cred=0
									else
										ll_ctas_cred 	= ll_ctas_pag_s
										ll_monto_cred	= ll_total_pagado
										if ll_ctas_cred <= 0 then
											ll_ctas_cred		= 0
											ll_monto_cred	= 0
										end if
									end if
									if ll_sumar_cuotas_mant > 0 then 
										ll_ctas_mant 	= ll_ctas_pag_m - ll_sumar_cuotas_mant
										ll_monto_mant	= ll_total_pagado_m - ll_sumar_monto_mant
										if ll_ctas_mant<=0 then 
											ll_ctas_mant	= 0
											ll_monto_mant	= 0
										end if
										if ll_monto_mant<=0 then ll_monto_mant=0
									else
										ll_ctas_mant 	= ll_ctas_pag_m
										ll_monto_mant	= ll_total_pagado_m
										if ll_ctas_mant <= 0 then
											ll_ctas_mant	= 0
											ll_monto_mant	= 0
										end if
									end if
									if ll_ctas_mant = 0 then ll_monto_mant = 0
									if ll_ctas_cred = 0 then ll_monto_cred = 0
									if ll_ctas_cred >= 0 or ll_ctas_mant >= 0 then
										UPDATE	"OFERTA_V"  
										SET		"TOT_PAGADO" = :ll_monto_cred,   
													"TOT_PAGADO_M" = :ll_monto_mant,
													"CTA_PAG_S" = :ll_ctas_cred,   
													"CTA_PAG_M" = :ll_ctas_mant  
										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
										USING		sqlca;
//									elseif ll_ctas_cred>=0 and ll_ctas_mant=0 then
//										UPDATE	"OFERTA_V"  
//										SET		"TOT_PAGADO" = :ll_monto_cred,   
//													"CTA_PAG_S" = :ll_ctas_cred   
//										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
//												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
//										USING		sqlca;
//									elseif ll_ctas_cred=0 and ll_ctas_mant>=0 then
//										UPDATE	"OFERTA_V"  
//										SET		"TOT_PAGADO_M" = :ll_monto_mant,   
//													"CTA_PAG_M" = :ll_ctas_mant  
//										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
//												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
//										USING		sqlca;
//									elseif ll_ctas_cred=0 and ll_ctas_mant=0 then
//										UPDATE	"OFERTA_V"  
//										SET		"TOT_PAGADO" = :ll_monto_cred,   
//													"TOT_PAGADO_M" = :ll_monto_mant,
//													"CTA_PAG_S" = :ll_ctas_cred,   
//													"CTA_PAG_M" = :ll_ctas_mant  
//										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
//												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
//										USING		sqlca;
									end if
									if sqlca.sqlcode=0 then ll_graba3 = 1
								end if
							end if
						else
							ll_graba3 = 1
						end if

					CASE 'C'
						SELECT	"CONTRATO"."TOT_PAGADO",   
									"CONTRATO"."CTA_PAG_M"  
						INTO 		:ll_total_pagado,   
									:ll_ctas_pag_m  
						FROM 		"CONTRATO"  
						WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
								 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
						USING		sqlca;
						if ll_total_pagado < ll_suma_total then ll_total_pagado = ll_suma_total
						if ll_total_pagado>0 then
							if ll_suma_total=0 then
								ll_graba3 				= 1
							else
								if ll_suma_total > ll_total_pagado then
									messagebox("Advertencia","Error no es posible ingresar Nota de Crédito, el monto es mayor al Total Pagado del Contrato")
								else
									if ll_sumar_cuotas_mant>0 then 
										ll_ctas_mant = ll_ctas_pag_m - ll_sumar_cuotas_mant
										if ll_ctas_mant <= 0 then 
											ll_ctas_mant 	= 0
											ll_resta_monto	= 0
										end if
									else
										ll_ctas_mant = ll_ctas_pag_m
										if ll_ctas_mant <= 0 then 
											ll_ctas_mant 	= 0
											ll_resta_monto	= 0
										end if
									end if
									if ll_suma_total>0 then 
										ll_resta_monto = ll_total_pagado - ll_suma_total
										if ll_resta_monto<=0 then ll_resta_monto = 0
									else
										ll_resta_monto = ll_total_pagado
									end if
									if ll_ctas_mant>=0 then
										UPDATE	"CONTRATO"  
										SET 		"TOT_PAGADO" = :ll_resta_monto,   
													"CTA_PAG_M" = :ll_ctas_mant  
										WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
												 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then ll_graba3 = 1
									end if
								end if
							end if
						else
							ll_graba3 = 1
						end if
						
					CASE 'L'
						SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",   
									"ANEXO_LIBERADOR"."CTA_PAG_M"  
						INTO 		:ll_total_pagado,   
									:ll_ctas_pag_s  
						FROM 	"ANEXO_LIBERADOR",   
									"PAGO_LIBERADOR"  
						WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
								 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
								 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
								 (("ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
								 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero ) )   
						USING		sqlca;
						if ll_total_pagado < ll_suma_total then ll_total_pagado = ll_suma_total
						if ll_total_pagado>0 then
							if ll_suma_total=0 then
								ll_graba3 				= 1
							else
								if ll_suma_total > ll_total_pagado then
									messagebox("Advertencia","Error no es posible ingresar Nota de Crédito, el monto es mayor al Total Pagado del Contrato")
								else
									if ll_sumar_cuotas_cred>0 then 
										ll_ctas_cred = ll_ctas_pag_s - ll_sumar_cuotas_cred
										if ll_ctas_cred <= 0 then ll_ctas_cred = 0
									else
										ll_ctas_cred = ll_ctas_pag_s
									end if
									if ll_suma_total>0 then 
										ll_resta_monto = ll_total_pagado - ll_suma_total
										if ll_resta_monto <= 0 then ll_resta_monto = 0
									else
										ll_resta_monto = ll_total_pagado
									end if
									if ll_ctas_cred>=0 then
										UPDATE	"ANEXO_LIBERADOR"  
										SET 		"TOT_PAGADO" = :ll_resta_monto,   
													"CTA_PAG_M" = :ll_ctas_cred  
										WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
												 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then ll_graba3 = 1
									end if
								end if
							end if
						else
							ll_graba3 = 1
						end if
						
					CASE 'F'
						SELECT	"PRODUCTO_ANEXO"."TOTAL_PAGADO",   
									"PRODUCTO_ANEXO"."CUOTAS_PAG"  
						INTO 		:ll_total_pagado,   
									:ll_ctas_pag_s  
						FROM 	"PRODUCTO_ANEXO",   
									"PRODUCTO_PAGO"  
						WHERE  ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
								 ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
								 ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
								 (("PRODUCTO_ANEXO"."SERIE" = :ls_serie ) AND  
								 ( "PRODUCTO_ANEXO"."NUMERO" = :ll_numero ) )   
						USING		sqlca;
						if ll_total_pagado < ll_suma_total then ll_total_pagado = ll_suma_total
						if ll_total_pagado>0 then
							if ll_suma_total=0 then
								ll_graba3 				= 1
							else
								if ll_suma_total > ll_total_pagado then
									messagebox("Advertencia","Error no es posible ingresar Nota de Crédito, el monto es mayor al Total Pagado del Contrato")
								else
									if ll_sumar_cuotas_cred>0 then 
										ll_ctas_cred = ll_ctas_pag_s - ll_sumar_cuotas_cred
										if ll_ctas_cred <= 0 then ll_ctas_cred = 0
									else
										ll_ctas_cred = ll_ctas_pag_s
									end if
									if ll_suma_total>0 then 
										ll_resta_monto = ll_total_pagado - ll_suma_total
										if ll_resta_monto <= 0 then ll_resta_monto = 0
									else
										ll_resta_monto = ll_total_pagado
									end if
									if ll_ctas_cred>=0 then
										UPDATE	"PRODUCTO_ANEXO"  
										SET 		"TOTAL_PAGADO" = :ll_resta_monto,   
													"CUOTAS_PAG" = :ll_ctas_cred  
										WHERE  ( "PRODUCTO_ANEXO"."SERIE" = :ls_serie ) AND  
												 ( "PRODUCTO_ANEXO"."NUMERO" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then ll_graba3 = 1
									end if
								end if
							end if
						else
							ll_graba3 = 1
						end if
						
					CASE 'A'
						SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",   
									"ANEXO_AUMENTO"."CTA_PAG_M"  
						INTO 		:ll_total_pagado,   
									:ll_ctas_pag_s  
						FROM 		"ANEXO_AUMENTO",   
									"PAGO_AUMENTO"  
						WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
								 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
								 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
								 (("ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
								 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ll_numero ) )   
						USING		sqlca;
						if ll_total_pagado < ll_suma_total then ll_total_pagado = ll_suma_total
						if ll_total_pagado>0 then
							if ll_suma_total=0 then
								ll_graba3 				= 1
							else
								if ll_suma_total > ll_total_pagado then
									messagebox("Advertencia","Error no es posible ingresar Nota de Crédito, el monto es mayor al Total Pagado del Contrato")
								else
									if ll_sumar_cuotas_cred>0 then 
										ll_ctas_cred = ll_ctas_pag_s - ll_sumar_cuotas_cred
										if ll_ctas_cred <= 0 then ll_ctas_cred = 0
									else
										ll_ctas_cred = ll_ctas_pag_s
									end if
									if ll_suma_total>0 then 
										ll_resta_monto = ll_total_pagado - ll_suma_total
										if ll_resta_monto <= 0 then ll_resta_monto = 0
									else
										ll_resta_monto = ll_total_pagado
									end if
									if ll_ctas_cred>=0 then
										UPDATE	"ANEXO_AUMENTO"  
										SET 		"TOT_PAGADO" = :ll_resta_monto,   
													"CTA_PAG_M" = :ll_ctas_cred  
										WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
												 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then ll_graba3 = 1
									end if
								end if
							end if
						else
							ll_graba3 = 1
						end if
						
					CASE 'R'
						SELECT	"REPACTA_MANTENCION"."CTAS_PAGADAS",   
									"REPACTA_MANTENCION"."TOTAL_PAGADO"  
						INTO 		:ll_ctas_pag_s,   
									:ll_total_pagado  
						FROM 		"REPACTA_MANTENCION"  
						WHERE  ( "REPACTA_MANTENCION"."BASE" = :ls_base ) AND  
								 ( "REPACTA_MANTENCION"."SERIE" = :ls_serie ) AND  
								 ( "REPACTA_MANTENCION"."NUMERO" = :ll_numero )   
						USING		sqlca;
						if ll_total_pagado < ll_suma_total then ll_total_pagado = ll_suma_total
						if ll_total_pagado>0 then
							if ll_suma_total=0 then
								ll_graba3 = 1
							else
								if ll_suma_total > ll_total_pagado then
									messagebox("Advertencia","Error no es posible ingresar Nota de Crédito, el monto es mayor al Total Pagado del Contrato")
								else
									if ll_sumar_cuotas_cred>0 then 
										ll_ctas_cred = ll_ctas_pag_s - ll_sumar_cuotas_cred
										if ll_ctas_cred <= 0 then ll_ctas_cred = 0
									else
										ll_ctas_cred = ll_ctas_pag_s
									end if
									if ll_suma_total>0 then ll_resta_monto = ll_total_pagado - ll_suma_total
									if ll_ctas_cred>=0 then
										UPDATE	"REPACTA_MANTENCION"  
										SET 		"CTAS_PAGADAS" = :ll_ctas_cred,   
													"TOTAL_PAGADO" = :ll_resta_monto  
										WHERE  ( "REPACTA_MANTENCION"."BASE" = :ls_base ) AND  
												 ( "REPACTA_MANTENCION"."SERIE" = :ls_serie ) AND  
												 ( "REPACTA_MANTENCION"."NUMERO" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then ll_graba3 = 1
									end if
								end if
							end if
						else
							ll_graba3 = 1
						end if

					CASE 'P'
						SELECT	"PAGARE"."TOT_PAGADO",   
									"PAGARE"."CTA_PAG_LA"  
						INTO 		:ll_total_pagado,   
									:ll_ctas_pag_s  
						FROM 		"PAGARE"  
						WHERE  ( "PAGARE"."SERIE_P" = :ls_serie ) AND  
								 ( "PAGARE"."NRO_PAGARE" = :ll_numero )   
						USING		sqlca;
						if ll_total_pagado < ll_suma_total then ll_total_pagado = ll_suma_total
						if ll_total_pagado>0 then
							if ll_suma_total=0 then
								ll_graba3 = 1
							else
								if ll_suma_total > ll_total_pagado then
									messagebox("Advertencia","Error no es posible ingresar Nota de Crédito, el monto es mayor al Total Pagado del Contrato")
								else
									if ll_sumar_cuotas_cred>0 then 
										ll_ctas_cred = ll_ctas_pag_s - ll_sumar_cuotas_cred
										if ll_ctas_cred <= 0 then ll_ctas_cred = 0
									else
										ll_ctas_cred = ll_ctas_pag_s
									end if
									if ll_suma_total>0 then 
										ll_resta_monto = ll_total_pagado - ll_suma_total
										if ll_resta_monto <= 0 then ll_resta_monto = 0
									else
										ll_resta_monto = ll_total_pagado
									end if
									if ll_ctas_cred>=0 then
										UPDATE	"PAGARE"  
										SET 		"TOT_PAGADO" = :ll_resta_monto,   
													"CTA_PAG_LA" = :ll_ctas_cred  
										WHERE  ( "PAGARE"."SERIE_P" = :ls_serie ) AND  
												 ( "PAGARE"."NRO_PAGARE" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then ll_graba3 = 1
									end if
								end if
							end if
						else
							ll_graba3 = 1
						end if

					CASE 'D'
						SELECT	"DERECHO"."TOT_PAGADO",   
									"DERECHO"."CTA_PAG_LA"  
						INTO 		:ll_total_pagado,   
									:ll_ctas_pag_s  
						FROM 		"DERECHO"  
						WHERE  ( "DERECHO"."SERIE_P" = :ls_serie ) AND  
								 ( "DERECHO"."NRO_PAGARE" = :ll_numero )   
						USING		sqlca;
						if ll_total_pagado < ll_suma_total then ll_total_pagado = ll_suma_total
						if ll_total_pagado>0 then
							if ll_suma_total=0 then
								ll_graba3 = 1
							else
								if ll_suma_total > ll_total_pagado then
									messagebox("Advertencia","Error no es posible ingresar Nota de Crédito, el monto es mayor al Total Pagado del Contrato")
								else
									if ll_sumar_cuotas_cred>0 then 
										ll_ctas_cred = ll_ctas_pag_s - ll_sumar_cuotas_cred
										if ll_ctas_cred <= 0 then ll_ctas_cred = 0
									else
										ll_ctas_cred = ll_ctas_pag_s
									end if
									if ll_suma_total>0 then 
										ll_resta_monto = ll_total_pagado - ll_suma_total
										if ll_resta_monto <= 0 then ll_resta_monto = 0
									else
										ll_resta_monto = ll_total_pagado
									end if
									if ll_ctas_cred>=0 then
										UPDATE	"DERECHO"  
										SET 		"TOT_PAGADO" = :ll_resta_monto,   
													"CTA_PAG_LA" = :ll_ctas_cred  
										WHERE  ( "DERECHO"."SERIE_P" = :ls_serie ) AND  
												 ( "DERECHO"."NRO_PAGARE" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then ll_graba3 = 1
									end if
								end if
							end if
						else
							ll_graba3 = 1
						end if
				END CHOOSE
			end if
			if rb_comprobante.checked=true then 
				ls_tipo_cob	= trim(ddlb_tipo_cob.text)
				if ls_tipo_cob <> 'FE' then
					ll_folio		= long(trim(em_folio.text))
					ldt_pago		= dw_destino.getitemdatetime(1,'fecha_pago')
				
					UPDATE	"INGRESO"  
					SET 		"REZAGO" = ' '  
					WHERE  ( "INGRESO"."FOLIO" = :ll_folio ) AND  
							 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob )   AND
							 ( "INGRESO"."FECHA_PAGO" = :ldt_pago ) 
					USING		SQLCA;
					if sqlca.sqlcode=0 then ll_graba3=1
				else
					ll_graba3		= 1
				end if
			end if
//		end if
			dw_destino.accepttext()
			ll_graba4	= dw_destino.update()
			if ll_graba1=1 and ll_graba2=1 and ll_graba3=1 and ll_graba4=1 and ll_graba5=1 then
				commit using sqlca;
	//			if ls_tipo_cob='BE' or ls_tipo_cob='BA' or ls_tipo_cob='FE' or ls_tipo_cob='FA' then 	wf_cargar_nota_credito()
				
				DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base,:ls_serie,:ll_numero,'M');
				EXECUTE sp_nuevo_cadena_mora;
	
				UPDATE 		"CUPONERAS"  
				SET 			"ESTADO_CUPONERA" = 'A'  
				WHERE 	   ( "CUPONERAS"."BASE" = :ls_base ) AND  
								( "CUPONERAS"."SERIE" = :ls_serie ) AND  
								( "CUPONERAS"."NUMERO" = :ll_numero ) AND  
								( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )  
				USING		sqlca;
				if sqlca.sqlcode=0 THEN
					commit;
					UPDATE 	"CUPONERAS_DETALLE"  
					SET 		"ESTADO_PAGO_CUPON" = 'A'  
					WHERE ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
							  ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
							  ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
							  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )  
					USING		sqlca;
					if sqlca.sqlcode=0 THEN
						commit;
						wf_crear_cuponera(ls_base, ls_serie, ll_numero,ll_folio_nc)
	//					DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :ls_base, :ls_serie, :ll_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda);
	//					EXECUTE sp_proc_genera_cuponera;
					else
						rollback;
						messagebox("Advertencia","No es Posible Anular Detalle Cuponera SQL: "+sqlca.sqlerrtext)
					end if
				else
					rollback;
					messagebox("Advertencia","No es Posible Anular Cuponera SQL: "+sqlca.sqlerrtext)
				end if
				if ls_tipo_cob='CI' then
					SELECT	"CADENA"."COD_PARQUE"	//,	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."DV" ,	"CADENA"."ESTADO" 
					INTO 		:ll_cod_parque					//, 				:ls_nom,						:ls_ap_pat,  					:ls_ap_mat,						:gs_dv,				:ls_estado_contrato
					FROM 	"CADENA",	"CLIENTE"  
					WHERE ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
							  (("CADENA"."CODIGO" = :ls_base ) AND  
							  ( "CADENA"."SERIE" = :ls_serie ) AND  
							  ( "CADENA"."NUMERO" = :ll_numero ) ) 
					USING	sqlca;
					if sqlca.sqlcode<>0 then
						ll_folio			= long(trim(em_folio.text))
						ls_tipo_cob		= trim(ddlb_tipo_cob.text)
						ldt_pago			= dw_destino.getitemdatetime(1,'fecha_pago')
						SELECT	"CLIENTE_REZAGO"."BASE", 	"CLIENTE_REZAGO"."SERIE",	"CLIENTE_REZAGO"."NUMERO"	//,	"CLIENTE_REZAGO"."NOMBRE",		"CLIENTE_REZAGO"."AP_PATERNO",	"CLIENTE_REZAGO"."AP_MATERNO",	"CLIENTE_REZAGO"."RUT",	"CLIENTE_REZAGO"."DV"
						INTO 		:ls_base,   							:ls_serie,   							:ll_numero 					//,							:ls_nom,									:ls_ap_pat,									:ls_ap_mat,									:gi_rut,							:gs_dv
						FROM 	"CLIENTE_REZAGO"  
						WHERE ( "CLIENTE_REZAGO"."COD_PAGO" = :ls_tipo_cob ) AND  
								  ( "CLIENTE_REZAGO"."FOLIO" = :ll_folio ) AND  
								  ( "CLIENTE_REZAGO"."FECHA_PAGO" = :ldt_pago )   ;
						
						SELECT	"CD_FOLIO"."COD_PARQUE"  
						INTO 		:ll_cod_parque  
						FROM 	"CD_FOLIO"  
						WHERE ( "CD_FOLIO"."BASE" = :ls_base ) AND  
								  ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
								  ( "CD_FOLIO"."NUMERO" = :ll_numero )   
						USING	sqlca;
					end if
					SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
					INTO 		:ls_rut_empresa
					FROM 	"MEMBRETE_EMPRESA"  
					WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
	
					UPDATE		"ELECTRONICA_FB_DETALLE"  
					SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
									"RUT" = :gi_rut,   
									"ESTADO_REG" = 'G',   
									"MONTO_AFECTO" = 0,   
									"MONTO_EXENTO" = :ll_suma_total,   
									"MONTO_IVA" = 0,   
									"MONTO_TOTAL" = :ll_suma_total,   
									"USUARIO_CREA" = :gs_user,   
									"BASE" = :gs_base,   
									"SERIE" = :gs_serie,   
									"NUMERO" = :gi_numero,
									"COD_CAJA" = :gs_caja,
									"TIPO_DTE" = '61'
					WHERE ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND 
							  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :ll_folio_nc ) AND
							  ( "ELECTRONICA_FB_DETALLE"."FECHA_PAGO" = :ldt_fecha_pago ) AND   
							  ( "ELECTRONICA_FB_DETALLE"."RUT" = :gi_rut) AND
							  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip) AND
							  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
							  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) 
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						gl_cod_parque_cta	= ll_cod_parque
						ll_suma_total_nc		= dw_nota_credito.getitemnumber(1,'monto')
						ls_monto_palabra		= sle_1.uo_convertir_numero(string(ll_suma_total))
	//					ls_tipo_cob				= dw_destino.getitemstring(ll_indi,'tipo_cob')
	//					ll_folio_mod				= dw_destino.getitemnumber(ll_indi,'folio')
	//					ldt_fecha_pago_mod
						
						ll_count_reg				= dw_print_nc.retrieve(gs_tipo_cobro,ll_folio_nc,date(ldt_fecha_pago),ls_rezago,gi_rut,ll_cod_parque,ls_monto_palabra)
						if ll_count_reg > 0 then
							f_printdlg(dw_print_nc,gstr_print,w_ingresar_nota_de_credito_2)
							dw_print_nc.print()
						else
							messagebox("Advertencia","No registra Datos a Imprimir Nota de Crédito, No se imprimirá Documento")
						end if
					else
						rollback;
						messagebox("Advertencia","Error Grabar Nota de Credito SQL: "+sqlca.sqlerrtext)
					end if 
				end if
	//			wf_crear_cuponera(ls_base, ls_serie, ll_numero)
				messagebox("Grabar","Grabación Exitosa")
				cb_limpiar.triggerevent(clicked!)
			else
				rollback using sqlca;
				messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
				cb_limpiar.triggerevent(clicked!)
			end if
		end if
	end if
end if
end event

type st_6 from statictext within w_ingresar_nota_de_credito_2_ult_resp
integer x = 41
integer y = 1200
integer width = 699
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nota de Crédito"
boolean focusrectangle = false
end type

type dw_nota_credito from datawindow within w_ingresar_nota_de_credito_2_ult_resp
integer x = 46
integer y = 1316
integer width = 2702
integer height = 364
integer taborder = 100
string dataobject = "dw_ingreso_nota_de_credito"
boolean border = false
end type

event clicked;date		ld_fecha,ld_fecha_hoy
string	ls_columna

ls_columna		= dwo.name
ld_fecha_hoy	= date(fechasys)
if ls_columna='p_1' then
	ld_fecha	= date(dw_nota_credito.getitemdatetime(1,'fecha_pago'))
	if f_valida_fecha(string(ld_fecha))=-1 then 
		dw_nota_credito.setitem(1,'fecha_pago',ld_fecha_hoy)
		return
	end if
	OpenWithParm(w_calendar,string(ld_fecha))
	IF not isnull(Message.StringParm) THEN
		dw_nota_credito.setitem(1,'fecha_pago',date(Message.StringParm))
	END IF
end if
end event

event itemchanged;string		ls_columna,ls_tipo_cob,ls_base,ls_serie
Long		ll_folio,ll_count=0,ll_total,ll_new,ll_suma_cuotas
Date		ld_fecha
Double	ll_numero

ls_columna	= dwo.name
dw_nota_credito.accepttext()
if ls_columna='folio' then
	ll_folio		= dw_nota_credito.getitemnumber(1,'folio')
	SELECT	Count("INGRESO"."FOLIO")  
	INTO 		:ll_count  
	FROM 	"INGRESO"  
	WHERE  ( "INGRESO"."FOLIO" = :ll_folio ) AND  
			 ( "INGRESO"."TIPO_COB" = :is_nota_credito )  
	using		sqlca;
	if ll_count>0 then
		messagebox("Advertencia","Folio Nota de Credito, Ya Existe")
		ld_fecha							= date(fechasys)
		if rb_contrato.checked=true then
			ls_base						= trim(ddlb_base.text)
			ls_serie						= trim(ddlb_serie.text)
			ll_numero					= Double(em_numero.text)
		else
			ls_base						= ''
			ls_serie						= ''
			ll_numero					= 0
		end if
		ll_total							= dw_destino.getitemnumber(1,'suma_total')
		ll_suma_cuotas					= dw_destino.getitemnumber(1,'suma_cuotas')
		dw_nota_credito.reset()
		ll_new	= dw_nota_credito.insertrow(0)
//		if is_opcion='A' then
//			dw_nota_credito.setitem(ll_new,'tipo_cob','NB')
//		else
//			dw_nota_credito.setitem(ll_new,'tipo_cob','NC')
//		end if
		gs_tipo_cobro				= "NE"
		dw_nota_credito.setitem(ll_new,'fecha_pago',ld_fecha)
		dw_nota_credito.setitem(ll_new,'cuotas_pag',ll_suma_cuotas)
		dw_nota_credito.setitem(ll_new,'pago_hist','A')
		dw_nota_credito.setitem(ll_new,'cod_caja',gs_caja)
		dw_nota_credito.setitem(ll_new,'rezago',' ')
		dw_nota_credito.setitem(ll_new,'usuario',gs_user)
		dw_nota_credito.setitem(ll_new,'monto',ll_total)
		dw_nota_credito.setitem(ll_new,'tipo_mov','Z')
		dw_nota_credito.setitem(ll_new,'base',ls_base)
		dw_nota_credito.setitem(ll_new,'serie',ls_serie)
		dw_nota_credito.setitem(ll_new,'contrato',ll_numero)
		dw_nota_credito.setitem(ll_new,'codigo_otro','0')
		dw_nota_credito.accepttext()
		dw_nota_credito.setfocus()
		dw_nota_credito.setcolumn('folio')
	end if
end if
end event

type cb_generar from commandbutton within w_ingresar_nota_de_credito_2_ult_resp
integer x = 32
integer y = 1700
integer width = 695
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generar Nota de Crédito"
end type

event clicked;Long		ll_new,ll_total,ll_suma_cuotas,ll_min_boleta,ll_grupo,ll_folio,ll_fila_e,ll_cod_parque,ll_ctas_pag_s_sap,ll_folio_original
Date		ld_fecha
String		ls_rut_empresa,ls_nombre_comp,ls_ap_pat,ls_ap_mat,ls_tipo_cob,ls_nom,ls_estado_contrato,ls_tipo_cob_ori,ls_rezago,ls_tipo_mov,ls_codigo_otro,ls_traspaso,&
			ls_moneda_sap,ls_tipocob_original,ls_nro_contrato,ls_fecha_pago_palabra,ls_monto_total_palabra
datetime	ldt_fecha_pago,ldt_pago,ldt_pago_original
Double	ldb_monto_sap

ldt_fecha_pago						= datetime(date(gdt_fec_sistema),time('00:00:00'))
if rb_contrato.checked=true then
	dw_nota_credito.dataobject	= 'dw_ingreso_nota_de_credito'
	dw_nota_credito.settransobject(sqlca)
	gs_base							= trim(ddlb_base.text)
	gs_serie							= trim(ddlb_serie.text)
	gi_numero						= Double(em_numero.text)
elseif rb_comprobante.checked=true then
	if dw_destino.rowcount()>0 then
		gs_base						= dw_destino.getitemstring(1,'base')
		gs_serie						= dw_destino.getitemstring(1,'serie')
		gi_numero					= Double(dw_destino.getitemnumber(1,'numero'))
	end if
	if gs_base='B' then
		dw_nota_credito.dataobject	= 'dw_ingreso_nota_de_credito_fe'
		dw_nota_credito.settransobject(sqlca)
	else
		dw_nota_credito.dataobject	= 'dw_ingreso_nota_de_credito'
		dw_nota_credito.settransobject(sqlca)
	end if
end if
if dw_destino.rowcount()>0 then
	ld_fecha							= date(fechasys)
	if cb_generar.text='Generar Nota de Crédito' then
		cb_generar.text			= 'No Mostrar Nota de Crédito'
		dw_nota_credito.visible	= true
		st_6.visible					= true
		cb_grabar.visible			= true
//		ddplb_motivo.visible		= true
//		st_7.visible					= true
		ll_total						= dw_destino.getitemnumber(1,'suma_total')
		ll_suma_cuotas				= dw_destino.getitemnumber(1,'suma_cuotas')
		dw_nota_credito.reset()
		ll_new	= dw_nota_credito.insertrow(0)
//		if is_opcion='A' then
//			dw_nota_credito.setitem(ll_new,'tipo_cob','NB')
//		else
//			dw_nota_credito.setitem(ll_new,'tipo_cob','NC')
//		end if
		if dw_destino.getitemstring(1,'tipo_cob') = 'BE' or dw_destino.getitemstring(1,'tipo_cob') = 'BA' or dw_destino.getitemstring(1,'tipo_cob') = 'FE' or dw_destino.getitemstring(1,'tipo_cob') = 'FA' then
			gs_tipo_cobro				= "NE"
		else
			gs_tipo_cobro				= "NC"
		end if
		dw_nota_credito.setitem(ll_new,'tipo_cob',gs_tipo_cobro)
		dw_nota_credito.setitem(ll_new,'cuotas_pag',ll_suma_cuotas)
		dw_nota_credito.setitem(ll_new,'fecha_pago',ld_fecha)
		if gs_base <> 'B' then dw_nota_credito.setitem(ll_new,'fecha_deposito',ld_fecha)
		dw_nota_credito.setitem(ll_new,'pago_hist','A')
		dw_nota_credito.setitem(ll_new,'cod_caja',gs_caja)
		if Double(em_numero.text) = 0 or isnull(Double(em_numero.text)) or em_numero.text='' then
			ls_rezago					= 'S'
		else
			ls_rezago					= ' '
		end if
		dw_nota_credito.setitem(ll_new,'rezago',ls_rezago)
		dw_nota_credito.setitem(ll_new,'usuario',gs_user)
		dw_nota_credito.setitem(ll_new,'monto',ll_total)
		dw_nota_credito.setitem(ll_new,'tipo_mov','Z')
		if isnull(gs_base) or gs_base='' then gs_base='O'
		dw_nota_credito.setitem(ll_new,'base',gs_base)
		dw_nota_credito.setitem(ll_new,'rut',gi_rut)
		dw_nota_credito.setitem(ll_new,'serie',gs_serie)
		dw_nota_credito.setitem(ll_new,'contrato',gi_numero)
		dw_nota_credito.setitem(ll_new,'codigo_otro','0')
		dw_nota_credito.setitem(ll_new,'valor_uf',gd_uf_dia)
		dw_lista.height				= 668
		dw_destino.height			= 668
		dw_nota_credito.accepttext()
//		ddplb_motivo.setfocus()
//		dw_nota_credito.setfocus()
	else
		cb_generar.text			= 'Generar Nota de Crédito'
		dw_nota_credito.visible	= false
		st_6.visible					= false
		cb_grabar.visible			= false
//		ddplb_motivo.visible		= false
//		st_7.visible					= false
		dw_nota_credito.reset()
		dw_lista.height				= 1172
		dw_destino.height			= 1172
	end if
//	gs_tipo_cobro					= "NE"
	if gs_base='B' then
		SELECT	"FACTURAS_CADENA"."COD_PARQUE",	"FACTURAS_CLIENTE_EXENTAS"."NOMBRE",	"FACTURAS_CLIENTE_EXENTAS"."A_PATERNO",	"FACTURAS_CLIENTE_EXENTAS"."A_MATERNO",	"FACTURAS_CLIENTE_EXENTAS"."DV",	"FACTURAS_CLIENTE_EXENTAS"."RUT"  
		INTO 		:gl_cod_parque, 								:ls_nom,													:ls_ap_pat,  												:ls_ap_mat,													:gs_dv,											:gi_rut
		FROM 	"FACTURAS_CADENA",	"FACTURAS_CLIENTE_EXENTAS"  
		WHERE ( "FACTURAS_CADENA"."RUT" = "FACTURAS_CLIENTE_EXENTAS"."RUT" ) and  
				  (("FACTURAS_CADENA"."CODIGO" = :gs_base ) AND  
				  ( "FACTURAS_CADENA"."SERIE" = :gs_serie ) AND  
				  ( "FACTURAS_CADENA"."NUMERO" = :gi_numero ) ) 
		USING	sqlca;
	else
		SELECT	"CADENA"."COD_PARQUE",	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."DV" ,	"CADENA"."ESTADO" 
		INTO 		:gl_cod_parque, 				:ls_nom,						:ls_ap_pat,  					:ls_ap_mat,						:gs_dv,				:ls_estado_contrato
		FROM 	"CADENA",	"CLIENTE"  
		WHERE ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				  (("CADENA"."CODIGO" = :gs_base ) AND  
				  ( "CADENA"."SERIE" = :gs_serie ) AND  
				  ( "CADENA"."NUMERO" = :gi_numero ) ) 
		USING	sqlca;
	end if
	if sqlca.sqlcode<>0 then
		ll_folio			= long(trim(em_folio.text))
		ls_tipo_cob		= trim(ddlb_tipo_cob.text)
		ldt_pago			= dw_destino.getitemdatetime(1,'fecha_pago')
		SELECT	"CLIENTE_REZAGO"."BASE", 	"CLIENTE_REZAGO"."SERIE",	"CLIENTE_REZAGO"."NUMERO",	"CLIENTE_REZAGO"."NOMBRE",		"CLIENTE_REZAGO"."AP_PATERNO",	"CLIENTE_REZAGO"."AP_MATERNO",	"CLIENTE_REZAGO"."RUT",	"CLIENTE_REZAGO"."DV"
		INTO 		:gs_base,   							:gs_serie,   							:gi_numero ,							:ls_nom,									:ls_ap_pat,									:ls_ap_mat,									:gi_rut,							:gs_dv
		FROM 	"CLIENTE_REZAGO"  
		WHERE ( "CLIENTE_REZAGO"."COD_PAGO" = :ls_tipo_cob ) AND  
				  ( "CLIENTE_REZAGO"."FOLIO" = :ll_folio ) AND  
				  ( "CLIENTE_REZAGO"."FECHA_PAGO" = :ldt_pago )   ;
		
		SELECT	"CD_FOLIO"."COD_PARQUE"  
		INTO 		:gl_cod_parque  
		FROM 	"CD_FOLIO"  
		WHERE ( "CD_FOLIO"."BASE" = :gs_base ) AND  
				  ( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
				  ( "CD_FOLIO"."NUMERO" = :gi_numero )   
		USING	sqlca;
	end if
	ll_fila_e 				= dw_destino.Find("tipo_mov = 'E' or tipo_mov = 'U'", 1, dw_destino.RowCount())
	if gs_base <> 'B' and ls_estado_contrato='A' and ll_fila_e > 0 then
		messagebox("Advertencia","No es Posible Generar Nota de Credito a Cuota por encontrarse Estado Contrato ANULADO")
		dw_destino.reset()
		dw_nota_credito.reset()
		dw_lista.height				= 1172
		dw_destino.height			= 1172
		st_6.visible					= false
		dw_nota_credito.visible	= false
		cb_generar.text			= 'Generar Nota de Crédito'
	else
		if isnull(ls_nom) then ls_nom=''
		if isnull(ls_ap_pat) then ls_ap_pat='.'
		if isnull(ls_ap_mat) then ls_ap_mat='-'
		ls_nombre_comp				= ls_nom +' '+ls_ap_pat+' '+ls_ap_mat
		ls_tipo_cob_ori					= dw_destino.getitemstring(1,'tipo_cob')
		if ls_tipo_cob_ori = 'BA' or ls_tipo_cob_ori = 'FA' then 
			ll_cod_parque = 99
		else
			ll_cod_parque = gl_cod_parque
		end if
		if gl_cod_parque > 0 and gs_tipo_cobro	= "NC" then
			SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
			INTO 		:ls_rut_empresa
			FROM 	"MEMBRETE_EMPRESA"  
			WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
		
			SELECT	"ELECTRONICA_FB"."GRUPO"  
			INTO 		:ll_grupo  
			FROM 	"ELECTRONICA_FB"  
			WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
					  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
					  ( "ELECTRONICA_FB"."ESTADO" = 'P' )  
			USING	sqlca;
			if sqlca.sqlcode=0 and ll_grupo > 0 then
				UPDATE		"ELECTRONICA_FB_DETALLE"  
				SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
								"RUT" = :gi_rut,   
								"ESTADO_REG" = 'P',   
								"DV" = :gs_dv,   
								"NOMBRE_CLIENTE" = :ls_nombre_comp,   
								"USUARIO_CREA" = :gs_user,
								"BASE"  = :gs_base,
								"SERIE" = :gs_serie,
								"NUMERO" = :gi_numero,
								"IP_EQUIPO" = :gs_tcp_ip
				WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo ) AND  
							  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
							  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )   AND
							  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
							  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = (SELECT	MIN("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
																									FROM 	"ELECTRONICA_FB",   
																												"ELECTRONICA_FB_DETALLE"  
																									WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
																											  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
																											   ( "ELECTRONICA_FB"."RUT_EMPRESA" = "ELECTRONICA_FB_DETALLE"."RUT_EMPRESA" ) and  
																											  ( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
																											  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND 
																											  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
																											  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
																											  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )) )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					if rb_contrato.checked=true then
						SELECT	"ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO"
						INTO 		:ll_min_boleta
						FROM 	"ELECTRONICA_FB",   
									"ELECTRONICA_FB_DETALLE"  
						WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
								  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
								  ( "ELECTRONICA_FB"."RUT_EMPRESA" = "ELECTRONICA_FB_DETALLE"."RUT_EMPRESA" ) and  
								  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
								  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND 
								  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
								  ( "ELECTRONICA_FB_DETALLE"."FECHA_PAGO" = :ldt_fecha_pago ) AND   
								  ( "ELECTRONICA_FB_DETALLE"."RUT" = :gi_rut) AND
								  ( "ELECTRONICA_FB_DETALLE"."DV" = :gs_dv) AND
								  ( "ELECTRONICA_FB_DETALLE"."NOMBRE_CLIENTE" = :ls_nombre_comp) AND
								  ( "ELECTRONICA_FB_DETALLE"."USUARIO_CREA" = :gs_user) AND
								  ( "ELECTRONICA_FB_DETALLE"."BASE"  = :gs_base) AND
								  ( "ELECTRONICA_FB_DETALLE"."SERIE" = :gs_serie) AND
								  ( "ELECTRONICA_FB_DETALLE"."NUMERO" = :gi_numero) AND
								  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip) AND
								  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
								  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) );
					else
						SELECT	"ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO"
						INTO 		:ll_min_boleta
						FROM 	"ELECTRONICA_FB",   
									"ELECTRONICA_FB_DETALLE"  
						WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
								  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
								  ( "ELECTRONICA_FB"."RUT_EMPRESA" = "ELECTRONICA_FB_DETALLE"."RUT_EMPRESA" ) and  
								  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
								  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND 
								  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
								  ( "ELECTRONICA_FB_DETALLE"."FECHA_PAGO" = :ldt_fecha_pago ) AND   
								  ( "ELECTRONICA_FB_DETALLE"."RUT" = :gi_rut) AND
								  ( "ELECTRONICA_FB_DETALLE"."IP_EQUIPO" = :gs_tcp_ip) AND
								  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
								  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) );
					end if
					gl_folio												= ll_min_boleta
					if ll_min_boleta > 0 then
						cb_grabar.enabled								= true
						dw_nota_credito.setitem(1,'folio',ll_min_boleta)
					else
						dw_nota_credito.object.folio.protect		= 1
						cb_grabar.enabled								= false
					end if	
					dw_nota_credito.setitem(1,'cod_parque',gl_cod_parque)
					ldt_fecha_pago				= datetime(date(gdt_fec_sistema),time('00:00:00'))
					dw_nota_credito.accepttext()
				else
					rollback;
					messagebox("Error Grabar BOLETA","Error al Grabar BOLETA SQL: "+sqlca.sqlerrtext)
					dw_nota_credito.object.folio = false
				end if
			else
				messagebox("Advertencia","Debe Crear Folio Nota de Crédito a Empresa R.U.T.: "+ls_rut_empresa)
				cb_grabar.enabled			= false
			end if
			
		elseif gl_cod_parque > 0 and gs_tipo_cobro	= "NE" then
			SELECT DISTINCT	MAX("INGRESO_NEWSING"."FOLIO")
			INTO 		:il_max_folio_new  
			FROM 	"INGRESO_NEWSING"  
			WHERE ( "INGRESO_NEWSING"."TIPO_COB" = :gs_tipo_cobro ) 
			USING	sqlca;
			if isnull(il_max_folio_new) or il_max_folio_new=0 then il_max_folio_new=0
			il_max_folio_new ++
			
			if il_max_folio_new > 0 then
				gl_folio							= il_max_folio_new	//ll_min_boleta
				if il_max_folio_new > 0 then
					cb_grabar.enabled			= true
					dw_nota_credito.setitem(1,'folio', il_max_folio_new)	//ll_min_boleta)
				else
					dw_nota_credito.object.folio.protect		= 1
					cb_grabar.enabled			= false
				end if	
				dw_nota_credito.setitem(1,'cod_parque',gl_cod_parque)
				ldt_fecha_pago					= datetime(date(gdt_fec_sistema),time('00:00:00'))
				dw_nota_credito.accepttext()
				ls_tipo_mov						= 'Z'
				ls_codigo_otro					= '0'
				setnull(ls_traspaso)
				ll_ctas_pag_s_sap				= 0
				ldb_monto_sap					= 0
				setnull(ls_moneda_sap)
				ldt_pago_original				= dw_destino.getitemdatetime(1,'fecha_pago')
				ls_tipocob_original				= dw_destino.getitemstring(1,'tipo_cob')
				ll_folio_original					= dw_destino.getitemnumber(1,'folio')
				ls_nro_contrato					= gs_base+gs_serie+string(gi_numero)
				ls_fecha_pago_palabra		= f_retorna_fecha_palabra(date(ldt_fecha_pago))
				ls_monto_total_palabra		= sle_1.uo_convertir_numero(string(ll_total))
//				is_proximo_pago				= f_retorna_prox_pago_mant( gs_base, gs_serie, gi_numero, ai_cuotas_pag,as_tipo_mov )
				INSERT INTO	"INGRESO_NEWSING"  
							 (	"FOLIO"    , 				"TIPO_COB"   , 		"FECHA_PAGO", 	"TIPO_MOV",	"MONTO" , 	"CUOTAS_PAG", 		"SERIE"  , 	"CONTRATO", 	"COD_CAJA", 		"REZAGO",   	"VALOR_UF", 	"PAGO_HIST", 		"BASE"  , 			"RUT"  , 			"USUARIO", "PAGO_EXTERNO", 	"LUGAR_EXTERNO", 	"VIENE_DE" , 	"CODIGO_OTRO",	"SERVIPAG",		"TRASPASO_E",	"COD_PARQUE",	"FECHA_DEPOSITO",	"REZAGO_SAP",	"CTAS_PAG_CTTO",	"MONTO_UF",		"MONEDA_SAP")  
				VALUES  	 (	:il_max_folio_new,	:gs_tipo_cobro, 	:ldt_fecha_pago,	:ls_tipo_mov ,	:ll_total, 		:ll_suma_cuotas, 		:gs_serie, 	:gi_numero, 	:gs_caja  , 			:ls_rezago,  	:gd_uf_dia,   	'A'      ,				:gs_base , 			:gi_rut, 			:gs_user	 , 	' '           , 				'interno'      ,  			' ',		 			 :ls_codigo_otro,	:ldt_fecha_pago,	:ls_traspaso,		:ll_cod_parque,		:gd_hoy,					:ls_rezago,			:ll_ctas_pag_s_sap,	:ldb_monto_sap,	:ls_moneda_sap)				
				USING		sqlca	;
				if sqlca.sqlcode=0 then
					commit;
					
					INSERT INTO "INGRESO_NEWSING_CABECERA"  
         							( "TIPO_COB",		"FOLIO",					"FECHA_PAGO",	"FECHA_PAGO_PALABRA",	"COD_PARQUE",	"NRO_CONTRATO",	"UF_DIA",	"COD_CAJA",	"USUARIO",		"PAGA_CON",	"VUELTO",	"PROXIMO_PAGO",	"MONTO_TOTAL_PALABRA",	"PAGO_EF",		"PAGO_CH",		"PAGO_TC",		"PAGO_TD",		"FOLIO_BE",		"RUT_CLIENTE",	"REZAGO",   "NETO",		"EXENTO",	"IVA",		"TOTAL",		"IP_PRINT",			"IP_PC",		"CONEXION",	"FECHA_FOLIO_ELEC",		"TIPO_COB_ORIGEN_NE",	"FOLIO_ORIGEN_NE",		"FECHA_PAGO_ORIGEN_NE" )  
  					VALUES 		( :gs_tipo_cobro,	:il_max_folio_new,	:ldt_fecha_pago,	:ls_fecha_pago_palabra,		:ll_cod_parque,		:ls_nro_contrato,		:gd_uf_dia,	:gs_caja,			:gs_user,		null,				null,			null,						:ls_monto_total_palabra,			null,				null,				null,				null,				null,				:gi_rut,				:ls_rezago,	0,				:ll_total,		0,			:ll_total,		:gs_tcp_ip_print,	:gs_tcp_ip,	:gs_empresa,	null,								:ls_tipocob_original,			:ll_folio_original,			:ldt_pago_original				) 
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
		end if
	end if
end if
end event

type pb_eliminar from picturebutton within w_ingresar_nota_de_credito_2_ult_resp
integer x = 1518
integer y = 992
integer width = 169
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "atras.jpg"
alignment htextalign = left!
end type

event clicked;String	ls_tipo_cob,ls_tipo_cob_aux
Long		ll_folio,ll_folio_aux,ll_indi,ll_tot_reg,ll_suma_tot

ll_tot_reg					= dw_destino.rowcount()
if il_row_destino>0 and ll_tot_reg>0 then
	ll_folio					= dw_destino.getitemnumber(il_row_destino,'folio')
	ls_tipo_cob				= dw_destino.getitemstring(il_row_destino,'tipo_cob')
	for ll_indi=1 to ll_tot_reg
		ll_folio_aux			= dw_destino.getitemnumber(ll_indi,'folio')
		ls_tipo_cob_aux	= dw_destino.getitemstring(ll_indi,'tipo_cob')
		if ll_folio=ll_folio_aux and ls_tipo_cob=ls_tipo_cob_aux then
			dw_destino.deleterow(ll_indi)
			dw_detalle_factura.deleterow(ll_indi)
			ll_tot_reg		= ll_tot_reg - 1
			ll_indi				= ll_indi - 1
		end if
	next
	setnull(il_row_destino)
	dw_destino.accepttext()
end if
if dw_nota_credito.rowcount() > 0 then
	if dw_destino.rowcount() > 0 then
		ll_suma_tot			= dw_destino.getitemnumber(1,'suma_total')
		dw_nota_credito.setitem(1,'monto',ll_suma_tot)
		dw_nota_credito.accepttext()
	else
		dw_nota_credito.setitem(1,'monto',0)
		dw_nota_credito.accepttext()
	end if
end if
end event

type pb_insertar from picturebutton within w_ingresar_nota_de_credito_2_ult_resp
integer x = 1518
integer y = 680
integer width = 169
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "adelante.jpg"
alignment htextalign = left!
end type

event clicked;String		ls_tipo_cob,ls_tipo_mov,ls_tipo_cob_aux,ls_tipo_mov_aux,ls_base,ls_serie,	ls_tipo_cob_nc,ls_cod_otro,ls_string,ls_string_find
Long		ll_suma_tot,ll_folio,ll_monto,ll_cuotas_pag,ll_tot_reg,ll_indi,ll_folio_aux,ll_monto_aux,ll_cuotas_pag_aux,ll_new,&
			ll_sw=0,ll_folio_nc,ll_new_det,ll_fila,ll_cant_e,ll_fila_existe
Datetime	ldt_fecha_pago,ldt_fecha_pago_aux
Double	ll_numero
Datawindow control_dw

//dw_destino.reset()
dw_destino.accepttext()
//dw_detalle_factura.reset()
control_dw = DraggedObject()
if dw_lista.rowcount()>0 and il_row>0 then
	ls_tipo_cob		= dw_lista.getitemstring(il_row,'tipo_cob')
	ll_folio			= dw_lista.getitemnumber(il_row,'folio')
	ldt_fecha_pago	= dw_lista.getitemdatetime(il_row,'fecha_pago')
	ls_tipo_mov		= dw_lista.getitemstring(il_row,'tipo_mov')
	ls_string			= "tipo_cob = '"+ls_tipo_cob+"' and folio= "+string(ll_folio)+" and tipo_mov='E' and date(fecha_pago)=date('"+string(ldt_fecha_pago,'dd/mm/yyyy')+"')"
	ll_fila				= dw_lista.Find(ls_string,1, dw_lista.RowCount())
	if ll_fila > 0 then
		ll_cant_e		= dw_lista.getitemnumber(ll_fila,'cuotas_pag')
	end if
	ll_monto			= dw_lista.getitemnumber(il_row,'monto')
	ll_cuotas_pag	= dw_lista.getitemnumber(il_row,'cuotas_pag')
	ls_base			= dw_lista.getitemstring(il_row,'base')
	ls_serie			= dw_lista.getitemstring(il_row,'serie')
	ll_numero		= dw_lista.getitemnumber(il_row,'contrato')
	ls_cod_otro		= dw_lista.getitemstring(il_row,'codigo_otro')
	SELECT	"NOTA_DE_CREDITO"."TIPO_COB_ORIGINAL",   
				"NOTA_DE_CREDITO"."FOLIO_ORIGINAL"  
	INTO 		:ls_tipo_cob_nc,   
				:ll_folio_nc  
	FROM 	"NOTA_DE_CREDITO"  
	WHERE  ( "NOTA_DE_CREDITO"."TIPO_COB" = :ls_tipo_cob ) AND  
			 ( "NOTA_DE_CREDITO"."FOLIO" = :ll_folio ) AND  
			 ( "NOTA_DE_CREDITO"."TIPO_MOV" = :ls_tipo_mov ) AND  
			 ( "NOTA_DE_CREDITO"."ESTADO" = 'A' )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		messagebox("Advertencia","Movimiento ya está Asignado a la Nota de Crédito Nº "+ls_tipo_cob_nc+'-'+string(ll_folio_nc,"###,###,###,###,###"))
	elseif sqlca.sqlcode=100 then
		ll_tot_reg		= dw_destino.rowcount()
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ls_tipo_cob_aux		= dw_destino.getitemstring(ll_indi,'tipo_cob')
				ll_folio_aux				= dw_destino.getitemnumber(ll_indi,'folio')
				ldt_fecha_pago_aux	= dw_destino.getitemdatetime(ll_indi,'fecha_pago')
				ls_tipo_mov_aux		= dw_destino.getitemstring(ll_indi,'tipo_mov')
				ll_monto_aux			= dw_destino.getitemnumber(ll_indi,'monto')
				ll_cuotas_pag_aux		= dw_destino.getitemnumber(ll_indi,'cuotas_pag')
				if ls_tipo_cob=ls_tipo_cob_aux and ll_folio=ll_folio_aux and ldt_fecha_pago=ldt_fecha_pago_aux and &
					ls_tipo_mov=ls_tipo_mov_aux and ll_monto=ll_monto_aux and ll_cuotas_pag=ll_cuotas_pag_aux then
					messagebox("Advertencia","Movimiento ya Asignado")
					ll_sw ++
					exit;
				end if
			next
			if ll_sw=0 then
				ll_tot_reg					= dw_lista.rowcount()
				ll_fila_existe					= 0
				if ll_tot_reg > 1 then
					ls_string_find			= "tipo_cob <> '"+ls_tipo_cob+"' or folio <> "+string(ll_folio)+" or  fecha_pago <> DATE('"+string(ldt_fecha_pago,'dd/mm/yyyy')+"')"
					ll_fila_existe				= dw_destino.Find(ls_string_find, 1, dw_destino.RowCount())
				end if
				if ll_fila_existe = 0 then
					for ll_indi=1 to ll_tot_reg
						ls_tipo_cob_aux		= dw_lista.getitemstring(ll_indi,'tipo_cob')
						ll_folio_aux				= dw_lista.getitemnumber(ll_indi,'folio')
						if ls_tipo_cob_aux=ls_tipo_cob and ll_folio_aux=ll_folio then
							ldt_fecha_pago		= dw_lista.getitemdatetime(ll_indi,'fecha_pago')
							ls_tipo_mov			= dw_lista.getitemstring(ll_indi,'tipo_mov')
							ll_monto				= dw_lista.getitemnumber(ll_indi,'monto')
							ll_cuotas_pag		= dw_lista.getitemnumber(ll_indi,'cuotas_pag')
							ls_base				= dw_lista.getitemstring(ll_indi,'base')
							ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
							ll_numero			= dw_lista.getitemnumber(ll_indi,'contrato')
							ls_cod_otro			= dw_lista.getitemstring(ll_indi,'codigo_otro')
							if isnull(ls_cod_otro) or ls_cod_otro='' then ls_cod_otro='0'
							ll_new				= dw_destino.insertrow(0)
							dw_destino.scrolltorow(ll_new)
							dw_destino.Setitem(ll_new,'tipo_cob',ls_tipo_cob)
							dw_destino.Setitem(ll_new,'folio',ll_folio)
							dw_destino.Setitem(ll_new,'fecha_pago',ldt_fecha_pago)
							dw_destino.Setitem(ll_new,'tipo_mov',ls_tipo_mov)
							dw_destino.Setitem(ll_new,'monto',ll_monto)
							dw_destino.Setitem(ll_new,'cuotas_pag',ll_cuotas_pag)
							dw_destino.Setitem(ll_new,'base',ls_base)
							dw_destino.Setitem(ll_new,'serie',ls_serie)
							dw_destino.Setitem(ll_new,'numero',ll_numero)
							dw_destino.Setitem(ll_new,'codigo_otro',ls_cod_otro)
							dw_destino.Setitem(ll_new,'estado','I')
	//						dw_destino.Setitem(ll_new,'estado','A')
							dw_destino.accepttext()
							ll_new_det				= dw_detalle_factura.insertrow(0)
							dw_detalle_factura.scrolltorow(ll_new_det)
							dw_detalle_factura.Setitem(ll_new_det,'tipo_cob',ls_tipo_cob)
							dw_detalle_factura.Setitem(ll_new_det,'folio',ll_folio)
							dw_detalle_factura.Setitem(ll_new_det,'fecha_pago',ldt_fecha_pago)
							dw_detalle_factura.Setitem(ll_new_det,'tipo_mov',ls_tipo_mov)
							dw_detalle_factura.Setitem(ll_new_det,'monto',ll_monto)
							dw_detalle_factura.Setitem(ll_new_det,'cuotas_pag',ll_cuotas_pag)
							dw_detalle_factura.Setitem(ll_new_det,'base',ls_base)
							dw_detalle_factura.Setitem(ll_new_det,'serie',ls_serie)
							dw_detalle_factura.Setitem(ll_new_det,'numero',ll_numero)
							dw_detalle_factura.Setitem(ll_new_det,'codigo_otro',ls_cod_otro)
							dw_detalle_factura.Setitem(ll_new_det,'estado','I')
							dw_detalle_factura.Setitem(ll_new_det,'iva',idb_iva)
	//						dw_detalle_factura.Setitem(ll_new_det,'estado','A')
							dw_detalle_factura.accepttext()
						end if
					next
				else
					messagebox("Advertencia","No es posible Asociar más de Un Folio a Nota de Crédito")
				end if
			end if
		else
			ll_tot_reg					= dw_lista.rowcount()
			ll_fila_existe					= 0
			if ll_tot_reg > 1 then
				ls_string_find			= "tipo_cob <> '"+ls_tipo_cob+"' and folio <> "+string(ll_folio)+" and  fecha_pago <> DATE('"+string(ldt_fecha_pago,'dd/mm/yyyy')+"')"
				ll_fila_existe				= dw_destino.Find(ls_string_find, 1, dw_destino.RowCount())
			end if
			if ll_fila_existe = 0 then
				for ll_indi=1 to ll_tot_reg
					ls_tipo_cob_aux		= dw_lista.getitemstring(ll_indi,'tipo_cob')
					ll_folio_aux				= dw_lista.getitemnumber(ll_indi,'folio')
					if ls_tipo_cob_aux=ls_tipo_cob and ll_folio_aux=ll_folio then
						ldt_fecha_pago		= dw_lista.getitemdatetime(ll_indi,'fecha_pago')
						ls_tipo_mov			= dw_lista.getitemstring(ll_indi,'tipo_mov')
						ll_monto				= dw_lista.getitemnumber(ll_indi,'monto')
						ll_cuotas_pag		= dw_lista.getitemnumber(ll_indi,'cuotas_pag')
	//					if ls_tipo_mov = 'L' then ll_cuotas_pag=1
	//					if long(ls_tipo_mov) > 0 then	//Seguro asoc
	//						ll_cuotas_pag	= ll_cant_e
	//						ll_monto			= round(ll_monto / ll_cant_e,0)
	//					end if
						ls_base				= dw_lista.getitemstring(ll_indi,'base')
						ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
						ll_numero			= dw_lista.getitemnumber(ll_indi,'contrato')
						ls_cod_otro			= dw_lista.getitemstring(ll_indi,'codigo_otro')
						if isnull(ls_cod_otro) or ls_cod_otro='' then ls_cod_otro='0'
						ll_new				= dw_destino.insertrow(0)
						dw_destino.scrolltorow(ll_new)
						dw_destino.Setitem(ll_new,'tipo_cob',ls_tipo_cob)
						dw_destino.Setitem(ll_new,'folio',ll_folio)
						dw_destino.Setitem(ll_new,'fecha_pago',ldt_fecha_pago)
						dw_destino.Setitem(ll_new,'tipo_mov',ls_tipo_mov)
						dw_destino.Setitem(ll_new,'monto',ll_monto)
						dw_destino.Setitem(ll_new,'cuotas_pag',ll_cuotas_pag)
						dw_destino.Setitem(ll_new,'base',ls_base)
						dw_destino.Setitem(ll_new,'serie',ls_serie)
						dw_destino.Setitem(ll_new,'numero',ll_numero)
						dw_destino.Setitem(ll_new,'codigo_otro',ls_cod_otro)
						dw_destino.Setitem(ll_new,'estado','I')
	//					dw_destino.Setitem(ll_new,'estado','A')
						dw_destino.accepttext()
						
						ll_new_det				= dw_detalle_factura.insertrow(0)
						dw_detalle_factura.scrolltorow(ll_new_det)
						dw_detalle_factura.Setitem(ll_new_det,'tipo_cob',ls_tipo_cob)
						dw_detalle_factura.Setitem(ll_new_det,'folio',ll_folio)
						dw_detalle_factura.Setitem(ll_new_det,'fecha_pago',ldt_fecha_pago)
						dw_detalle_factura.Setitem(ll_new_det,'tipo_mov',ls_tipo_mov)
						dw_detalle_factura.Setitem(ll_new_det,'monto',ll_monto)
						dw_detalle_factura.Setitem(ll_new_det,'cuotas_pag',ll_cuotas_pag)
						dw_detalle_factura.Setitem(ll_new_det,'base',ls_base)
						dw_detalle_factura.Setitem(ll_new_det,'serie',ls_serie)
						dw_detalle_factura.Setitem(ll_new_det,'numero',ll_numero)
						dw_detalle_factura.Setitem(ll_new_det,'codigo_otro',ls_cod_otro)
						dw_detalle_factura.Setitem(ll_new_det,'estado','I')
						dw_detalle_factura.Setitem(ll_new_det,'iva',idb_iva)
	//					dw_detalle_factura.Setitem(ll_new_det,'estado','A')
						dw_detalle_factura.accepttext()
					end if
				next
			else
				messagebox("Advertencia","No es posible Asociar más de Un Folio a Nota de Crédito")
			end if
		end if
	end if
	setnull(il_row)
end if
if dw_nota_credito.rowcount() > 0 then
	if dw_destino.rowcount() > 0 then
		ll_suma_tot		= dw_destino.getitemnumber(1,'suma_total')
		dw_nota_credito.setitem(1,'monto',ll_suma_tot)
		dw_nota_credito.accepttext()
	else
		dw_nota_credito.setitem(1,'monto',0)
		dw_nota_credito.accepttext()
	end if
end if
end event

type dw_destino from datawindow within w_ingresar_nota_de_credito_2_ult_resp
integer x = 1714
integer y = 480
integer width = 1015
integer height = 668
integer taborder = 80
string dragicon = "Hand!"
string title = "none"
string dataobject = "dw_ingresar_nota_de_credito"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row_destino	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_destino, TRUE)
	this.Drag(Begin!)
end if
end event

event dragdrop;String	ls_tipo_cob,ls_tipo_mov,ls_tipo_cob_aux,ls_tipo_mov_aux,ls_base,ls_serie,	ls_tipo_cob_nc,ls_cod_otro,ls_string,ls_string_find
Long		ll_folio,ll_monto,ll_cuotas_pag,ll_tot_reg,ll_indi,ll_folio_aux,ll_monto_aux,ll_cuotas_pag_aux,ll_new,ll_sw=0,&
			ll_folio_nc,ll_new_det,ll_fila,ll_cant_e,ll_suma_tot,ll_fila_existe
Datetime	ldt_fecha_pago,ldt_fecha_pago_aux
Double	ll_numero
Datawindow control_dw

//dw_destino.reset()
//dw_detalle_factura.reset()
control_dw = DraggedObject()
if dw_lista.rowcount()>0 and il_row>0 then
	ls_tipo_cob		= dw_lista.getitemstring(il_row,'tipo_cob')
	ll_folio			= dw_lista.getitemnumber(il_row,'folio')
	ldt_fecha_pago	= dw_lista.getitemdatetime(il_row,'fecha_pago')
	ls_tipo_mov		= dw_lista.getitemstring(il_row,'tipo_mov')
	ls_string			= "tipo_cob = '"+ls_tipo_cob+"' and folio= "+string(ll_folio)+" and tipo_mov='E' and date(fecha_pago)=date('"+string(ldt_fecha_pago,'dd/mm/yyyy')+"')"
	ll_fila				= dw_lista.Find(ls_string,1, dw_lista.RowCount())
	if ll_fila > 0 then
		ll_cant_e		= dw_lista.getitemnumber(ll_fila,'cuotas_pag')
	end if
	ll_monto			= dw_lista.getitemnumber(il_row,'monto')
	ll_cuotas_pag	= dw_lista.getitemnumber(il_row,'cuotas_pag')
	ls_base			= dw_lista.getitemstring(il_row,'base')
	ls_serie			= dw_lista.getitemstring(il_row,'serie')
	ll_numero		= dw_lista.getitemnumber(il_row,'contrato')
	ls_cod_otro		= dw_lista.getitemstring(il_row,'codigo_otro')
	SELECT	"NOTA_DE_CREDITO"."TIPO_COB_ORIGINAL",   
				"NOTA_DE_CREDITO"."FOLIO_ORIGINAL"  
	INTO 		:ls_tipo_cob_nc,   
				:ll_folio_nc  
	FROM 	"NOTA_DE_CREDITO"  
	WHERE  ( "NOTA_DE_CREDITO"."TIPO_COB" = :ls_tipo_cob ) AND  
			 ( "NOTA_DE_CREDITO"."FOLIO" = :ll_folio ) AND  
			 ( "NOTA_DE_CREDITO"."TIPO_MOV" = :ls_tipo_mov ) AND  
			 ( "NOTA_DE_CREDITO"."ESTADO" = 'A' )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		messagebox("Advertencia","Movimiento ya está Asignado a la Nota de Crédito Nº "+ls_tipo_cob_nc+'-'+string(ll_folio_nc,"###,###,###,###,###"))
	elseif sqlca.sqlcode=100 then
		ll_tot_reg		= dw_destino.rowcount()
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ls_tipo_cob_aux		= dw_destino.getitemstring(ll_indi,'tipo_cob')
				ll_folio_aux				= dw_destino.getitemnumber(ll_indi,'folio')
				ldt_fecha_pago_aux	= dw_destino.getitemdatetime(ll_indi,'fecha_pago')
				ls_tipo_mov_aux		= dw_destino.getitemstring(ll_indi,'tipo_mov')
				ll_monto_aux			= dw_destino.getitemnumber(ll_indi,'monto')
				ll_cuotas_pag_aux		= dw_destino.getitemnumber(ll_indi,'cuotas_pag')
				if ls_tipo_cob=ls_tipo_cob_aux and ll_folio=ll_folio_aux and ldt_fecha_pago=ldt_fecha_pago_aux and &
					ls_tipo_mov=ls_tipo_mov_aux and ll_monto=ll_monto_aux and ll_cuotas_pag=ll_cuotas_pag_aux then
					messagebox("Advertencia","Movimiento ya Asignado")
					ll_sw ++
					exit;
				end if
			next
			if ll_sw=0 then
				ll_tot_reg					= dw_lista.rowcount()
				ll_fila_existe					= 0
				if ll_tot_reg > 1 then
					ls_string_find			= "tipo_cob <> '"+ls_tipo_cob+"' or folio <> "+string(ll_folio)+" or  fecha_pago <> DATE('"+string(ldt_fecha_pago,'dd/mm/yyyy')+"')"
					ll_fila_existe				= dw_destino.Find(ls_string_find, 1, dw_destino.RowCount())
				end if
				if ll_fila_existe = 0 then
					for ll_indi=1 to ll_tot_reg
						ls_tipo_cob_aux		= dw_lista.getitemstring(ll_indi,'tipo_cob')
						ll_folio_aux				= dw_lista.getitemnumber(ll_indi,'folio')
						if ls_tipo_cob_aux=ls_tipo_cob and ll_folio_aux=ll_folio then
							ldt_fecha_pago		= dw_lista.getitemdatetime(ll_indi,'fecha_pago')
							ls_tipo_mov			= dw_lista.getitemstring(ll_indi,'tipo_mov')
							ll_monto				= dw_lista.getitemnumber(ll_indi,'monto')
							ll_cuotas_pag		= dw_lista.getitemnumber(ll_indi,'cuotas_pag')
							ls_base				= dw_lista.getitemstring(ll_indi,'base')
							ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
							ll_numero			= dw_lista.getitemnumber(ll_indi,'contrato')
							ls_cod_otro			= dw_lista.getitemstring(ll_indi,'codigo_otro')
							if isnull(ls_cod_otro) or ls_cod_otro='' then ls_cod_otro='0'
							ll_new				= dw_destino.insertrow(0)
							dw_destino.scrolltorow(ll_new)
							dw_destino.Setitem(ll_new,'tipo_cob',ls_tipo_cob)
							dw_destino.Setitem(ll_new,'folio',ll_folio)
							dw_destino.Setitem(ll_new,'fecha_pago',ldt_fecha_pago)
							dw_destino.Setitem(ll_new,'tipo_mov',ls_tipo_mov)
							dw_destino.Setitem(ll_new,'monto',ll_monto)
							dw_destino.Setitem(ll_new,'cuotas_pag',ll_cuotas_pag)
							dw_destino.Setitem(ll_new,'base',ls_base)
							dw_destino.Setitem(ll_new,'serie',ls_serie)
							dw_destino.Setitem(ll_new,'numero',ll_numero)
							dw_destino.Setitem(ll_new,'codigo_otro',ls_cod_otro)
							dw_destino.Setitem(ll_new,'estado','I')
	//						dw_destino.Setitem(ll_new,'estado','A')
							dw_destino.accepttext()
							
							ll_new_det				= dw_detalle_factura.insertrow(0)
							dw_detalle_factura.scrolltorow(ll_new_det)
							dw_detalle_factura.Setitem(ll_new_det,'tipo_cob',ls_tipo_cob)
							dw_detalle_factura.Setitem(ll_new_det,'folio',ll_folio)
							dw_detalle_factura.Setitem(ll_new_det,'fecha_pago',ldt_fecha_pago)
							dw_detalle_factura.Setitem(ll_new_det,'tipo_mov',ls_tipo_mov)
							dw_detalle_factura.Setitem(ll_new_det,'monto',ll_monto)
							dw_detalle_factura.Setitem(ll_new_det,'cuotas_pag',ll_cuotas_pag)
							dw_detalle_factura.Setitem(ll_new_det,'base',ls_base)
							dw_detalle_factura.Setitem(ll_new_det,'serie',ls_serie)
							dw_detalle_factura.Setitem(ll_new_det,'numero',ll_numero)
							dw_detalle_factura.Setitem(ll_new_det,'codigo_otro',ls_cod_otro)
							dw_detalle_factura.Setitem(ll_new_det,'estado','I')
							dw_detalle_factura.Setitem(ll_new_det,'iva',idb_iva)
	//						dw_detalle_factura.Setitem(ll_new_det,'estado','A')
							dw_detalle_factura.accepttext()
						end if
					next
				else
					messagebox("Advertencia","No es posible Asociar más de Un Folio a Nota de Crédito")
				end if
			end if
		else
			ll_tot_reg					= dw_lista.rowcount()
			ll_fila_existe					= 0
			if ll_tot_reg > 1 then
				ls_string_find			= "tipo_cob <> '"+ls_tipo_cob+"' and folio <> "+string(ll_folio)+" and  fecha_pago <> DATE('"+string(ldt_fecha_pago,'dd/mm/yyyy')+"')"
				ll_fila_existe				= dw_destino.Find(ls_string_find, 1, dw_destino.RowCount())
			end if
			if ll_fila_existe = 0 then
				for ll_indi=1 to ll_tot_reg
					ls_tipo_cob_aux		= dw_lista.getitemstring(ll_indi,'tipo_cob')
					ll_folio_aux				= dw_lista.getitemnumber(ll_indi,'folio')
					if ls_tipo_cob_aux=ls_tipo_cob and ll_folio_aux=ll_folio then
						ldt_fecha_pago		= dw_lista.getitemdatetime(ll_indi,'fecha_pago')
						ls_tipo_mov			= dw_lista.getitemstring(ll_indi,'tipo_mov')
						ll_monto				= dw_lista.getitemnumber(ll_indi,'monto')
						ll_cuotas_pag		= dw_lista.getitemnumber(ll_indi,'cuotas_pag')
	//					if ls_tipo_mov = 'L' then ll_cuotas_pag=1
	//					if long(ls_tipo_mov) > 0 then	//Seguro asoc
	//						ll_cuotas_pag	= ll_cant_e
	//						ll_monto			= round(ll_monto / ll_cant_e,0)
	//					end if
						ls_base				= dw_lista.getitemstring(ll_indi,'base')
						ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
						ll_numero			= dw_lista.getitemnumber(ll_indi,'contrato')
						ls_cod_otro			= dw_lista.getitemstring(ll_indi,'codigo_otro')
						if isnull(ls_cod_otro) or ls_cod_otro='' then ls_cod_otro='0'
						ll_new				= dw_destino.insertrow(0)
						dw_destino.scrolltorow(ll_new)
						dw_destino.Setitem(ll_new,'tipo_cob',ls_tipo_cob)
						dw_destino.Setitem(ll_new,'folio',ll_folio)
						dw_destino.Setitem(ll_new,'fecha_pago',ldt_fecha_pago)
						dw_destino.Setitem(ll_new,'tipo_mov',ls_tipo_mov)
						dw_destino.Setitem(ll_new,'monto',ll_monto)
						dw_destino.Setitem(ll_new,'cuotas_pag',ll_cuotas_pag)
						dw_destino.Setitem(ll_new,'base',ls_base)
						dw_destino.Setitem(ll_new,'serie',ls_serie)
						dw_destino.Setitem(ll_new,'numero',ll_numero)
						dw_destino.Setitem(ll_new,'codigo_otro',ls_cod_otro)
						dw_destino.Setitem(ll_new,'estado','I')
	//					dw_destino.Setitem(ll_new,'estado','A')
						dw_destino.accepttext()
						
						ll_new_det				= dw_detalle_factura.insertrow(0)
						dw_detalle_factura.scrolltorow(ll_new_det)
						dw_detalle_factura.Setitem(ll_new_det,'tipo_cob',ls_tipo_cob)
						dw_detalle_factura.Setitem(ll_new_det,'folio',ll_folio)
						dw_detalle_factura.Setitem(ll_new_det,'fecha_pago',ldt_fecha_pago)
						dw_detalle_factura.Setitem(ll_new_det,'tipo_mov',ls_tipo_mov)
						dw_detalle_factura.Setitem(ll_new_det,'monto',ll_monto)
						dw_detalle_factura.Setitem(ll_new_det,'cuotas_pag',ll_cuotas_pag)
						dw_detalle_factura.Setitem(ll_new_det,'base',ls_base)
						dw_detalle_factura.Setitem(ll_new_det,'serie',ls_serie)
						dw_detalle_factura.Setitem(ll_new_det,'numero',ll_numero)
						dw_detalle_factura.Setitem(ll_new_det,'codigo_otro',ls_cod_otro)
						dw_detalle_factura.Setitem(ll_new_det,'estado','I')
						dw_detalle_factura.Setitem(ll_new_det,'iva',idb_iva)
	//					dw_detalle_factura.Setitem(ll_new_det,'estado','A')
						dw_detalle_factura.accepttext()
					end if
				next
			else
				messagebox("Advertencia","No es posible Asociar más de Un Folio a Nota de Crédito")
			end if
		end if
	end if
	setnull(il_row)
end if
if dw_nota_credito.rowcount() > 0 then
	if dw_destino.rowcount() > 0 then
		ll_suma_tot		= dw_destino.getitemnumber(1,'suma_total')
		dw_nota_credito.setitem(1,'monto',ll_suma_tot)
		dw_nota_credito.accepttext()
	else
		dw_nota_credito.setitem(1,'monto',0)
		dw_nota_credito.accepttext()
	end if
end if
end event

type rb_comprobante from radiobutton within w_ingresar_nota_de_credito_2_ult_resp
integer x = 1531
integer y = 100
integer width = 928
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por COMPROBANTE"
end type

event clicked;String	ls_tipo_cob
if this.checked=true then
	if is_nota_credito <> 'NB' then
		messagebox("Advertencia","Recuerda esta Opción es solo Pagos en REZAGO / Otros Dctos.")
	end if
	dw_destino.reset()
	ddlb_base.reset()
	ddlb_serie.reset()
	ddlb_tipo_cob.reset()
	em_numero.text			= ''
	ddlb_base.enabled			= false
	ddlb_serie.enabled		= false
	em_numero.enabled		= false
	ddlb_tipo_cob.enabled	= true
	em_folio.enabled			= true
	dw_lista.dataobject		= 'dw_lista_para_asignar_nota_credito_folio'
	dw_lista.settransobject(sqlca)
	ddlb_tipo_cob.reset()
	DECLARE	x2 CURSOR FOR  
	SELECT 	"COD_PAGO"."TIPO_COB"  
	FROM 		"COD_PAGO" 
	ORDER BY "COD_PAGO"."TIPO_COB"  
	USING		sqlca;
	open x2;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			fetch x2 into :ls_tipo_cob;
			if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' then
				ddlb_tipo_cob.additem(ls_tipo_cob)
			end if
			setnull(ls_tipo_cob)
		LOOP
		em_folio.text		= ''
	end if
	close x2;
	
end if
ddlb_tipo_cob.setfocus()
end event

type rb_contrato from radiobutton within w_ingresar_nota_de_credito_2_ult_resp
integer x = 119
integer y = 100
integer width = 795
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por CONTRATO"
end type

event clicked;String	ls_base,ls_tipo_cob

if this.checked=true then
	ddlb_base.reset()
	dw_destino.reset()
	ddlb_base.enabled				= true
	ddlb_serie.enabled			= true
	em_numero.enabled			= true
	if is_opcion='A' then
		dw_lista.dataobject		= 'dw_lista_para_asignar_nota_mantencion'
	else
		dw_lista.dataobject		= 'dw_lista_para_asignar_nota_credito'
	end if
	dw_lista.settransobject(sqlca)
	DECLARE	x1 CURSOR FOR  
	SELECT 	"TIPO_CONTRATO"."CODIGO"  
	FROM 		"TIPO_CONTRATO"  
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			fetch x1 into :ls_base;
			if not isnull(ls_base) and ls_base<>'' then
				ddlb_base.additem(ls_base)
			end if
			setnull(ls_base)
		LOOP
		ddlb_serie.reset()
		em_numero.text			= ''
	end if
	close x1;
	ddlb_tipo_cob.reset()
	em_folio.text				= ''
	ddlb_tipo_cob.enabled	= false
	em_folio.enabled			= false
	
end if
ddlb_base.setfocus()
end event

type st_5 from statictext within w_ingresar_nota_de_credito_2_ult_resp
integer x = 1970
integer y = 308
integer width = 178
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Folio"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ingresar_nota_de_credito_2_ult_resp
integer x = 1458
integer y = 308
integer width = 247
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Cobro"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_folio from editmask within w_ingresar_nota_de_credito_2_ult_resp
integer x = 2158
integer y = 296
integer width = 347
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
end type

event modified;String	ls_tipo_cob
Long		ll_folio

ls_tipo_cob	= trim(ddlb_tipo_cob.text)
ll_folio		= long(em_folio.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	dw_lista.reset()
	dw_destino.reset()
	pb_procesar.triggerevent(clicked!)
end if
end event

type ddlb_tipo_cob from dropdownlistbox within w_ingresar_nota_de_credito_2_ult_resp
integer x = 1719
integer y = 296
integer width = 229
integer height = 400
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
dw_destino.reset()
//em_folio.setfocus()
end event

type cb_cerrar from commandbutton within w_ingresar_nota_de_credito_2_ult_resp
integer x = 2418
integer y = 1700
integer width = 311
integer height = 96
integer taborder = 150
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingresar_nota_de_credito_2)
end event

type dw_lista from datawindow within w_ingresar_nota_de_credito_2_ult_resp
integer x = 32
integer y = 480
integer width = 1458
integer height = 668
integer taborder = 70
string dragicon = "Query5!"
string title = "none"
string dataobject = "dw_lista_para_asignar_nota_credito_folio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row			= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gi_rut			= this.getitemnumber(il_row,'rut')
	gs_base		= this.getitemstring(il_row,'base')
	gs_serie		= this.getitemstring(il_row,'serie')
	gi_numero	= this.getitemnumber(il_row,'contrato')
	this.Drag(Begin!)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row		= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gi_rut		= this.getitemnumber(il_row,'rut')
	gs_base		= this.getitemstring(il_row,'base')
	gs_serie		= this.getitemstring(il_row,'serie')
	gi_numero	= this.getitemnumber(il_row,'contrato')
end if
end event

event dragdrop;String	ls_tipo_cob,ls_tipo_cob_aux
Long		ll_folio,ll_folio_aux,ll_indi,ll_tot_reg,ll_suma_tot
Datawindow control_dw

control_dw = DraggedObject()
ll_tot_reg					= dw_destino.rowcount()
if il_row_destino>0 and ll_tot_reg>0 then
	ll_folio					= dw_destino.getitemnumber(il_row_destino,'folio')
	ls_tipo_cob				= dw_destino.getitemstring(il_row_destino,'tipo_cob')
	for ll_indi=1 to ll_tot_reg
		ll_folio_aux			= dw_destino.getitemnumber(ll_indi,'folio')
		ls_tipo_cob_aux	= dw_destino.getitemstring(ll_indi,'tipo_cob')
		if ll_folio=ll_folio_aux and ls_tipo_cob=ls_tipo_cob_aux then
			dw_destino.deleterow(ll_indi)
			dw_detalle_factura.deleterow(ll_indi)
			ll_tot_reg		= ll_tot_reg - 1
			ll_indi				= ll_indi - 1
		end if
	next
	setnull(il_row_destino)
	dw_destino.accepttext()
end if
if dw_nota_credito.rowcount() > 0 then
	if dw_destino.rowcount() > 0 then
		ll_suma_tot		= dw_destino.getitemnumber(1,'suma_total')
		dw_nota_credito.setitem(1,'monto',ll_suma_tot)
		dw_nota_credito.accepttext()
	else
		dw_nota_credito.setitem(1,'monto',0)
		dw_nota_credito.accepttext()
	end if
end if

end event

type pb_procesar from picturebutton within w_ingresar_nota_de_credito_2_ult_resp
integer x = 2569
integer y = 268
integer width = 160
integer height = 132
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
alignment htextalign = left!
end type

event clicked;String		ls_base,ls_serie,ls_tipo_cob
Long		ll_folio
Double	ll_numero

if rb_contrato.checked=true then
	dw_destino.reset()
	ls_base		= trim(ddlb_base.text)
	ls_serie		= trim(ddlb_serie.text)
	ll_numero	= Double(em_numero.text)
	gs_base		= ls_base
	gs_serie		= ls_serie
	gi_numero	= ll_numero
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and &
		ls_serie<>'' and ll_numero>0 then
		if dw_lista.retrieve(ls_base,ls_serie,ll_numero)=0 then
			messagebox("Advertencia","No Registra Dato")
			em_numero.setfocus()
		end if
	end if
elseif rb_comprobante.checked=true then
	dw_destino.reset()
	ls_tipo_cob	= trim(ddlb_tipo_cob.text)
	ll_folio		= long(em_folio.text)
	if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
		if dw_lista.retrieve(ls_tipo_cob,ll_folio)=0 then
			messagebox("Advertencia","No Registra Dato")
			em_folio.setfocus()
		end if
	end if
else
	dw_destino.reset()
	messagebox("Advertencia","Debe Seleccionar Opción de Busqueda")
end if
end event

type em_numero from editmask within w_ingresar_nota_de_credito_2_ult_resp
integer x = 983
integer y = 296
integer width = 407
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###############"
end type

event modified;String	ls_base,ls_serie
Double		ll_numero
ls_base		= trim(ddlb_base.text)
ls_serie		= trim(ddlb_serie.text)
ll_numero	= Double(em_numero.text)
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and &
	ls_serie<>'' and ll_numero>0 then
	dw_lista.reset()
	dw_destino.reset()
	pb_procesar.triggerevent(clicked!)
end if

end event

type st_4 from statictext within w_ingresar_nota_de_credito_2_ult_resp
integer x = 782
integer y = 308
integer width = 187
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ingresar_nota_de_credito_2_ult_resp
integer x = 411
integer y = 308
integer width = 133
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Serie"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ingresar_nota_de_credito_2_ult_resp
integer x = 50
integer y = 308
integer width = 133
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_base from dropdownlistbox within w_ingresar_nota_de_credito_2_ult_resp
integer x = 197
integer y = 296
integer width = 206
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String	ls_base,ls_serie
ls_base	= trim(ddlb_base.text)
if not isnull(ls_base) and ls_base<>'' then
	dw_lista.reset()
	dw_destino.reset()
	DECLARE	x1 CURSOR FOR  
	SELECT 	"TABLA_SERIES"."SERIE"  
	FROM 		"TABLA_SERIES"  
	WHERE 	"TABLA_SERIES"."BASE" = :ls_base   
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		ddlb_serie.reset()
		DO WHILE sqlca.sqlcode=0 
			fetch x1 into :ls_serie;
			if not isnull(ls_serie) and ls_serie<>'' then
				ddlb_serie.additem(ls_serie)
			end if
			setnull(ls_serie)
		LOOP
	end if
	close x1;
//	ddlb_serie.setfocus()
end if
end event

type gb_1 from groupbox within w_ingresar_nota_de_credito_2_ult_resp
integer x = 32
integer y = 216
integer width = 1390
integer height = 212
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Contrato"
end type

type ddlb_serie from dropdownlistbox within w_ingresar_nota_de_credito_2_ult_resp
integer x = 558
integer y = 296
integer width = 206
integer height = 400
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
dw_destino.reset()
//em_numero.setfocus()
end event

type gb_2 from groupbox within w_ingresar_nota_de_credito_2_ult_resp
integer x = 1445
integer y = 216
integer width = 1097
integer height = 212
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Comprobante"
end type

type gb_3 from groupbox within w_ingresar_nota_de_credito_2_ult_resp
integer x = 32
integer y = 20
integer width = 2702
integer height = 184
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción"
end type

